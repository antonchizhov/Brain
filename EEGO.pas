unit EEGO;

interface
uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls,TeEngine,
     typeNrnParsO,NeuronO;

type
  {==================================================================}
  TEEG = class
  private
  protected
  public
    {Variables:}
    SigmV                       :array[0..1000] of double;
    dV_Sigm,V0,wAHP,nKM,UAHP,UKM,
    t0AHP,t1AHP,t0KM,t1KM,hi,xi,w8AHP,n8KM
                                                  :double;
    N_Sigm                                        :integer;
    {Functions:}
    constructor Create;
    procedure InitialConditions(EorI :string; NP :NeuronProperties; sgm_V :double);
    procedure EquateFrom(AEEG :TEEG);
    procedure EquateTo(AEEG :TEEG);

    procedure DrawAndWriteSigmoid(EorI :string; NP :NeuronProperties);
    procedure FindSigmoid(NP :NeuronProperties; g_g0,sgmV_ :double);
    function nu_NotNoisy(x,g_g0 :double; NP :NeuronProperties) :double;
    procedure FindSigmoid_NotNoisy(NP :NeuronProperties; g_g0 :double);
    procedure FindSteadyStateOfPopModel(NP :NeuronProperties; g_g0,sgmV_ :double);
    function SteadyRateOfPopModel(NP :NeuronProperties;
                              a,s,q,Vreset,sgmV_,k :double; Nj :integer):double;
    procedure RateDependentAdaptiveCurrents(nu :double; ANrn :TNeuron);
    function Rate(U,dUdt,g_g0,sgmV_,VT,LogN_sgm,uu_g0,ss_g0 :double; NP :NeuronProperties):double;
end;
  {==================================================================}

function nu_Johannesma(x,tau,Vth,Vreset,sgm:double):double;
function nu_LIF(V_infty,C_membr_Gtot,VT,Vreset :double):double;


var gAHP_EEG,gKM_EEG :double;

implementation
uses Math,Init,t_dtO,mathMyO,ThresholdO,Erf_Hazard,
     Unit1,Unit4,Unit7;

var
    exp_Int_0_u                     :array[0..500000] of double;
    N_Joh,IfJohTabulated            :integer;
    dx_Joh,x0_joh                   :double;
    Int_Joh_Arr                     :array[0..5000] of double;


{************************ Johannesma ********************************}

function IntForSteadyRate(a,b :double):double;
{ IntForSteadyRate=int_a^b exp(u^2) (1+erf(u)) du }
var S,dx,x,Arg  :double;
    i,N         :integer;
begin
  dx:=0.01;  N:=trunc((b-a)/dx)+1;  dx:=(b-a)/N;
  S:=0;
  for i:=1 to N do begin
      x:=a+(i-0.5)*dx;
      if x<-2.8 then Arg:=-1/x/sqrt(pi) else
      {*****************************}
      Arg:=dexp(x*x)*(1+Erfic(x));
      S:=S + Arg*dx;
      {*****************************}
  end;
  IntForSteadyRate:=S;
end;

procedure Tabulate_Int_Joh;
var i :integer;
begin
  N_Joh:=5000;
  x0_Joh:=-30;
  dx_Joh:=(10-x0_Joh)/N_Joh;
  for i:=0 to N_Joh do begin
      Int_Joh_Arr[i]:=IntForSteadyRate(x0_Joh,x0_Joh+i*dx_Joh);
  end;
  IfJohTabulated:=1;
end;

function Int_Joh(x :double):double;
var i :integer;
begin
  if IfJohTabulated<>1 then Tabulate_Int_Joh;
  i:=trunc((x-x0_Joh)/dx_Joh);
  if i<0 then i:=0;
  if i>N_Joh-1 then i:=N_Joh-1;
  Int_Joh:=Int_Joh_Arr[i]+((x-x0_Joh)/dx_Joh-i)*(Int_Joh_Arr[i+1]-Int_Joh_Arr[i]);
end;

function nu_Johannesma(x,tau,Vth,Vreset,sgm:double):double;
  { Solution of eq.(5.104) from Gerstner for ISI=T:
    T=tau*sqrt(pi)*int_[(Vreset-x)/sgm]^[(Vth-x)/sgm] exp(u^2)*(1+erf(u)) du
    where tau=C/gL, x is asymptotic potential. }
var
    T_,a,b :double;
begin
  a:=(Vreset -x)/sgm;
  b:=(Vth    -x)/sgm;
  {***************************************}
  T_:=tau*sqrt(pi)*(Int_Joh(b)-Int_Joh(a));
  //T_:=tau*sqrt(pi)*IntForSteadyRate(a,b);
  {***************************************}
  if T_>0.01*tau then  nu_Johannesma:=1/T_
                 else  nu_Johannesma:=0;
end;

function nu_LIF(V_infty,C_membr_Gtot,VT,Vreset :double):double;
{ nu=Gtot/C*ln((Vinfty-VT)/(Vinfty-Vreset) }
begin
  if V_infty>VT then  nu_LIF:=1/C_membr_Gtot/ln((V_infty-Vreset)/(V_infty-VT))
                else  nu_LIF:=0;
end;

{*********************************************************************}
constructor TEEG.Create;
begin
  inherited Create;
end;

procedure TEEG.EquateFrom(AEEG :TEEG);
var i :integer;
begin
  dV_Sigm:=AEEG.dV_Sigm;
  V0     :=AEEG.V0     ;
  wAHP   :=AEEG.wAHP   ;
  nKM    :=AEEG.nKM    ;
  UAHP   :=AEEG.UAHP   ;
  UKM    :=AEEG.UKM    ;
  t0AHP  :=AEEG.t0AHP  ;
  t1AHP  :=AEEG.t1AHP  ;
  t0KM   :=AEEG.t0KM   ;
  t1KM   :=AEEG.t1KM   ;
  hi     :=AEEG.hi     ;
  xi     :=AEEG.xi     ;
  w8AHP  :=AEEG.w8AHP  ;
  n8KM   :=AEEG.n8KM   ;
  N_Sigm :=AEEG.N_Sigm ;
  for i:=0 to N_Sigm do begin
      SigmV[i]:=AEEG.SigmV[i];
  end;
end;

procedure TEEG.EquateTo(AEEG :TEEG);
var i :integer;
begin
  AEEG.dV_Sigm:=dV_Sigm;
  AEEG.V0     :=V0     ;
  AEEG.wAHP   :=wAHP   ;
  AEEG.nKM    :=nKM    ;
  AEEG.UAHP   :=UAHP   ;
  AEEG.UKM    :=UKM    ;
  AEEG.t0AHP  :=t0AHP  ;
  AEEG.t1AHP  :=t1AHP  ;
  AEEG.t0KM   :=t0KM   ;
  AEEG.t1KM   :=t1KM   ;
  AEEG.hi     :=hi     ;
  AEEG.xi     :=xi     ;
  AEEG.w8AHP  :=w8AHP  ;
  AEEG.n8KM   :=n8KM   ;
  AEEG.N_Sigm :=N_Sigm ;
  for i:=0 to N_Sigm do begin
      AEEG.SigmV[i]:=SigmV[i];
  end;
end;

procedure TEEG.DrawAndWriteSigmoid(EorI :string; NP :NeuronProperties);
var
    i                           :integer;
    V_,X,I_                     :double;
    aaa                         :text;
begin
  { Writing }
  if EorI='P' then assign(aaa,'SigmE(V).dat')
              else assign(aaa,'SigmI(V).dat');
  rewrite(aaa);
  { Drawing }
  Form7.Visible:=true;
//  if EorI='P' then Form7.Series1.Clear else Form7.Series2.Clear;
  for i:=0 to N_Sigm do begin
      V_:=NP.Vrest+(V0-NP.Vrest+dV_Sigm*i)/(1+s_ind); { V_=Vrest+I/(gL+s) }
      I_:=(V_-NP.Vrest)*(1+s_ind)*(NP.C_membr/NP.tau_m0)*NP.Square*1e6; {nA}
      { Define X-axis }
      case Form7.ComboBox1.ItemIndex of
      0: X:=I_; {input current, nA}
      1: X:=V_*1000; { V_=Vrest+I/(gL+s) }
      end;
      if EorI='P' then Form7.Series1.AddXY(X,SigmV[i])
                  else Form7.Series2.AddXY(X,SigmV[i]);
      { Writing }
      writeln(aaa,V_*1000:9:4,' ',SigmV[i]:9:4,' ',I_*1000:9:4);
  end;
  Application.ProcessMessages;
  close(aaa);
end;

procedure TEEG.FindSigmoid(NP :NeuronProperties; g_g0,sgmV_ :double);
{ Solution of eq.(5.104) from Gerstner for ISI=T:
  T=tau*sqrt(pi)*int_[(Vreset-x)/sgm]^[(VT-x)/sgm] exp(u^2)*(1+erf(u)) du
  where tau=C/gL, x is asymptotic potential. }
var
    i,iter                 :integer;
    x,q,T_old,VT_,T_,tau,a,b    :double;
begin
  tau:=NP.tau_m0/g_g0;
  T_:=0;
  for i:=0 to N_Sigm do begin
      x:=NP.Vrest+(V0-NP.Vrest+dV_Sigm*i)/g_g0; { V_=Vrest+I/(gL+s) }
      iter:=0;
      repeat  iter:=iter+1;
        T_old:=T_;
        q:=(x-NP.Vreset)*dexp(-T_/tau);
        {*******************************************}
        VT_:=VThreshold3(NP, q/tau, 0.100{ms});
        {*******************************************}
        a:=(NP.Vreset   -x)/sgmV_/sqrt(2)*sqrt(g_g0);   // sqrt is introduced on 25.02.2017
        b:=(VT_+NP.Vrest-x)/sgmV_/sqrt(2)*sqrt(g_g0);   // sqrt is introduced on 25.02.2017
        {*******************************************}
        T_:=tau*sqrt(pi)*IntForSteadyRate(a,b);
        {*******************************************}
      until (abs(T_-T_old)<0.0001)or(iter>10);
      if (x>NP.Vreset)and(T_>0.001) then  SigmV[i]:=1/T_
                                    else  SigmV[i]:=0;
  end;
end;

function TEEG.nu_NotNoisy(x,g_g0 :double; NP :NeuronProperties) :double;
{ Solution of LIF is V(t)=x-exp(-t/tau)*(x-Vreset)
  where tau=C/gL, x is asymptotic potential.
  Eq. to be solved is VT(q/tau)=x-q, where q=(x-Vreset)/tau*exp(-T/tau). }
var
    iter                      :integer;
    q,VT_old,VT_,T_,tau       :double;
begin
  tau:=NP.tau_m0/g_g0;
  q:=(x-NP.Vreset)/2;
  {*************************************}
  VT_:=VThreshold3(NP, q/tau, 0.100{ms});
  {*************************************}
  iter:=0;
  repeat  iter:=iter+1;
    VT_old:=VT_;
    q:=x-NP.Vrest-VT_;
    {*************************************}
    VT_:=VThreshold3(NP, q/tau, 0.100{ms});
    {*************************************}
  until (abs(VT_-VT_old)<0.0001)or(iter>10);
  if (x>NP.Vreset)and(q>0) then begin
      T_:=-tau*ln(q/(x-NP.Vreset));
      nu_NotNoisy:=1/T_;
  end else nu_NotNoisy:=0;
end;

procedure TEEG.FindSigmoid_NotNoisy(NP :NeuronProperties; g_g0 :double);
{ Solution of LIF is V(t)=x-exp(-t/tau)*(x-Vreset)
  where tau=C/gL, x is asymptotic potential.
  Eq. to be solved is VT(q/tau)=x-q, where q=(x-Vreset)/tau*exp(-T/tau). }
var
    i,iter                     :integer;
    x,q,VT_old,VT_,T_,tau       :double;
begin
  for i:=0 to N_Sigm do begin
      x:=NP.Vrest+(V0-NP.Vrest+dV_Sigm*i)/g_g0; { V_=Vrest+I/(gL+s) }
      SigmV[i]:=nu_NotNoisy(x,g_g0,NP);
  end;
end;

{*********************************************************************}
function TEEG.SteadyRateOfPopModel(NP :NeuronProperties;
                              a,s,q,Vreset,sgmV_,k :double; Nj :integer):double;
{
  See p.90 of my Big Book and p.7 of Small BlockNote.
  Solution of eqs.
  tau_m*du/dt=-(1+s)*u - q*u^2 + a
  drho/dt=-rho*A(T)+rho*[dT/dt]*sqrt(2)*Fsigma(-T),
  with T=(VT-u)/sgm.
  Solution for f-I curve is
  nu=1/tau_m/(int_Vreset^u1 exp(-int_0^u H(u)/(a-(1+s)*u-q*u^2)*du)/(a-(1+s)*u-q*u^2)),
  where H(u)=A(T) + (a-(1+s)*u-q*u^2)*VT/sgm*Fsigma(-T),
        u1=(-(1+s) + sqrt((1+s)^2+4aq))/2/q.
}
var
    j,l,Nj_eps                                                            :integer;
    u1,du,RHP,u,u_,eps,Int_0_u,Int_0_a,T,A_,B_,H_,Erf,g_g0,VT,dudt        :double;
begin
  if abs(a)<0.0001 then a:=0.0001;  //exception;
  { root of eq. du/dt=0 }
  if q=0 then u1:=a/(1+s)
         else u1:=(-(1+s) + sqrt(sqr(1+s)+4*a*q))/2/q;
  du:=(u1-Vreset)/Nj;
  eps:=trunc((u1-Vreset)*0.001/du)*du;  {otstup ot a}
  { Tabulate "int_0^u H(u)/(a-(1+s)*u-q*u^2)*du" }
  Int_0_u:=0; exp_Int_0_u[0]:=1;
  Nj_eps:=trunc((u1-eps)/du);
  for l:=1 to Nj-1 do begin
      u:=Vreset+du*(l-1/2);
      RHP:=a-(1+s)*u-q*u*u;
      g_g0:=1+s+q*u;
      dudt:=RHP/NP.tau_m0;
      {***********************************}
      VT:=VThreshold3(NP, dudt, 0.100{ms});
      {***********************************}
      T:=(VT-u)/sqrt(2)/sgmV_*sqrt(g_g0);      // sqrt is introduced on 25.02.2017
      A_:=fA_T(T,k);
      Erf:=max(Erfic(T),-0.9999);
      B_:=max(RHP,0)/sgmV_/sqrt(g_g0) * sqrt(2/pi)*dexp(-T*T)/(1+Erf);   // sqrt is introduced on 25.02.2017
      {*************************}
      H_:=(A_+B_)/NP.tau_m0*g_g0;
      {*************************}
      if l<=Nj_eps then begin
         {*************************************}
         Int_0_u:=Int_0_u + H_*NP.tau_m0/RHP*du;
         {*************************************}
         exp_Int_0_u[l]:=dexp(-Int_0_u);
      end else begin
         u_:=Vreset+du*l;
         g_g0:=1+s+q*u_;
         RHP:=a-(1+s)*u_-q*u_*u_;
         exp_Int_0_u[l]:=exp_Int_0_u[Nj_eps] *step(RHP/eps,A_*g_g0);
      end;
  end;
  exp_Int_0_u[Nj]:=0;
  { Integrate for ISI }
  Int_0_a:=0;
  for j:=1 to Nj_eps do begin
      u:=Vreset+du*(j-1/2);
      RHP:=a-(1+s)*u-q*u*u;
      {*************************************************************}
      Int_0_a:=Int_0_a + (exp_Int_0_u[j]+exp_Int_0_u[j-1])/2/RHP*du;
      {*************************************************************}
  end;
  if eps>=du then begin
     g_g0:=1+s+q*u1;
     T:=(VT-u1)/sgmV_/sqrt(2)*sqrt(g_g0);   // sqrt is introduced on 25.02.2017
     A_:=fA_T(T,k);
     if A_=0 then Int_0_a:=1e6 else
     Int_0_a:=Int_0_a + 1/(A_*g_g0)*exp_Int_0_u[Nj_eps];
  end;
  {****************************************}
  SteadyRateOfPopModel:=1/Int_0_a/NP.tau_m0;
  {****************************************}
end;

procedure TEEG.FindSteadyStateOfPopModel(NP :NeuronProperties; g_g0,sgmV_ :double);
{  See comments to "function SteadyRateOfPopModel" }
var
    i,Nj         :integer;
    a            :double;
begin
//  taum_taus:=Form4.DDSpinEdit98.Value;
  Nj:=trunc(Form7.DDSpinEdit6.Value);
  SigmV[0]:=0;
  for i:=1 to N_Sigm do begin
      a:=dV_Sigm*i; {input current}
      {**********************************************************************************}
      SigmV[i]:=SteadyRateOfPopModel(NP,a,g_g0-1,0,NP.Vreset-NP.Vrest,sgmV_,taum_taus,Nj);
      {**********************************************************************************}
  end;
end;

procedure TEEG.RateDependentAdaptiveCurrents(nu :double; ANrn :TNeuron);
var dVdt_ad,IAHP,IKM,
    w_,n_,gAHP_,gKM_
                                                :double;
begin
  w_:=wAHP-w8AHP;
  n_:=nKM -n8KM;
  New_m2(0,1/t0AHP,1/t1AHP,dt,hi*(1-wAHP)*nu, w_,UAHP);
  New_m2(0,1/t0KM, 1/t1KM, dt,xi*(1-nKM) *nu, n_,UKM);
  wAHP:=w8AHP+w_;
  nKM :=n8KM +n_;
       gAHP_:=ANrn.NP.gAHP*(wAHP    -w8AHP);
       gKM_ :=ANrn.NP.gKM *(sqr(nKM)-sqr(n8KM));
       IAHP:=gAHP_ *(ANrn.NV.V-ANrn.NP.VK);
       IKM :=gKM_  *(ANrn.NV.V-ANrn.NP.VKM);
       dVdt_ad:=(-IAHP-IKM)/ANrn.NP.C_membr;
       ANrn.NV.DVDt:=ANrn.NV.DVDt+dVdt_ad;
       ANrn.NV.V   :=ANrn.NV.V   +dVdt_ad*dt;
       ANrn.NV.gActive:=gAHP_+gKM_;
end;

function nu_Lognorm(U,sgm :double):double;
{ Stationary firing rate as a function of subthreshold voltage scaled by VT for
  a population with input current distributed by lognorm distribution
  with sgm and mu=0.
  The distribution is
      phi(x)=exp(-(ln(x))^2/(2*sgm^2))/(sqrt(2*pi)*sgm*x)
      nu_x(Vx)=gL/C/ln((Vx-Vreset)/(Vx-VT))
  with Vreset=0
  Solution:
      A=1/tau_m * int_xt^inf nu_x(Vx) phi(x) dx, xt=VT/U.
}
var c0,c1,c2,c3,c4 :double;
begin
  c0:=   7.41E-2  -9.23E-3*sgm  -1.13E-1*sgm*sgm  +3.35E-2*sgm*sgm*sgm ;
  c1:=  -1.77     +3.21   *sgm  -3.02   *sgm*sgm  +1.64   *sgm*sgm*sgm ;
  c2:=   2.32E-2  +4.11   *sgm  -3.03   *sgm*sgm  +6.32E-1*sgm*sgm*sgm ;
  c3:=   6.34E-1  -3.13   *sgm  +2.10   *sgm*sgm  -4.23E-1*sgm*sgm*sgm ;
  c4:=  -1.86E-1  +6.72E-1*sgm  -4.35E-1*sgm*sgm  +8.63E-2*sgm*sgm*sgm ;

  nu_Lognorm:=max(0, c0 + c1*U + c2*U*U + c3*U*U*U + c4*U*U*U*U);
end;

function SigmoidFromExperiment(uu_g0,ss_g0 :double; NP :NeuronProperties) :double;
var I_,DB_,u_ :double;
begin
  { p.159 of BigBook -- Piecewise linear approximation of the "Tonque" }
  I_ := uu_g0/0.012{V} - 1 - ss_g0;
  DB_:=-uu_g0 + ss_g0*0.010{V} + 0.065{V};
  if (I_>0)and(DB_>0) then  SigmoidFromExperiment:=1/0.083{s}*I_
                      else  SigmoidFromExperiment:=0;
  { From Epileptor-3 }
  u_:=uu_g0*NP.C_membr/NP.tau_m0*NP.Square*1e9; {pA}
  SigmoidFromExperiment:=100{Hz}*max(0,2/(1+dexp(-2*(u_-150{pA})/20{pA}))-1);
end;

{*********************************************************************}
procedure TEEG.InitialConditions(EorI :string; NP :NeuronProperties; sgm_V :double);
var g_g0,sgmV_ :double;
begin
  inherited Create;
  N_Sigm  :=400;
  dV_Sigm :=0.040{V}/N_Sigm;
  V0:=NP.Vrest;
  g_g0:=1+s_ind;
  sgmV_:=sgm_V;
  { Synaptic noise is proportional to synaptic conductance sgm=a+b*ss_, where we assume also a=b; }
  if Form4.CheckBox10.Checked then  sgmV_:=sgmV_*sqrt(g_g0); // sqrt is introduced on 25.02.2017
  { Steady firing }
  if      Form1.NoisySteadyRate1.Checked       then FindSigmoid(NP,g_g0,sgmV_)
  else if Form1.NotNoisySteadyRate1.Checked    then FindSigmoid_NotNoisy(NP,g_g0)
  else if Form1.SteadyStateOfPopModel1.Checked then FindSteadyStateOfPopModel(NP,g_g0,sgmV_);
  { Drawing and writing }
  DrawAndWriteSigmoid(EorI,NP);
  { Parameters for the rate-dependent adaptive currents }
  t0AHP:=0.414{s};
  t1AHP:=0.001{s};
  t0KM :=0.124{s};
  t1KM :=0.003{s};
  hi:=0.018;
  xi:=0.175;
  w8AHP:=0.058;
  n8KM :=0.082;
  NP.gAHP:=gAHP_EEG;
  NP.gKM :=gKM_EEG;
  { Initial conditions }
  wAHP:=w8AHP;  UAHP:=0;
  nKM :=n8KM;   UKM:=0;
//  Form4.DDSpinEdit56.Value:=gAHP_EEG;
//  Form4.DDSpinEdit74.Value:=gKM_EEG ;
end;

{*********************************************************************}
function TEEG.Rate(U,dUdt,g_g0,sgmV_,VT,LogN_sgm,uu_g0,ss_g0 :double; NP :NeuronProperties):double;
{ Calculates rate as done in [Chizhov, Rodrigues, Terry 2007]
nu = nu_steady + nu_unsteady,
nu_steady=f(V_) is sigmoid-like "f-V curve";
nu_unsteady=f(V_,dVdt,sigma_V) considers crossing the threshold
by Gaussian set of neuron potentials. }
var
   nu_steady,nu_unsteady,V_,xt_               :double;
   i,Nj                                       :integer;
begin
//  taum_taus:=Form4.DDSpinEdit98.Value;
  Nj:=trunc(Form7.DDSpinEdit6.Value);
  {**************************}
  if      Form1.NoisySteadyRate1.Checked       then
     nu_steady:=nu_Johannesma(U,NP.tau_m0/g_g0,VT+NP.Vrest,NP.Vreset,sgmV_/sqrt(g_g0)*sqrt(2))   // sqrt is introduced on 25.02.2017
  else if Form1.NotNoisySteadyRate1.Checked    then
     nu_steady:=nu_NotNoisy(U,g_g0,NP)
  else if Form1.SteadyStateOfPopModel1.Checked then
     nu_steady:=SteadyRateOfPopModel(NP,(U-NP.Vrest)*g_g0,g_g0-1,0,NP.Vreset-NP.Vrest,sgmV_,taum_taus,Nj)
  else if Form1.Experimentalnuus1.Checked      then
     nu_steady:=SigmoidFromExperiment(uu_g0,ss_g0,NP);
  {**************************}
  if Form4.CheckBox9.Checked then nu_steady:=0;       {'Without A'}
  { Unsteady firing }
  V_:=(U-NP.Vrest-VT)/sgmV_*sqrt(g_g0)/sqrt(2);    // sqrt is introduced on 25.02.2017
  {************************************************************}
  case Form4.RadioGroup1.ItemIndex of
  0: nu_unsteady:=1/sqrt(2*pi)/sgmV_*sqrt(g_g0)*dexp(-V_*V_)*max(dUdt,0);  // sqrt is introduced on 25.02.2017
  1: nu_unsteady:=1/sqrt(2*pi)/sgmV_*sqrt(g_g0)*dexp(-V_*V_)*dUdt;         // sqrt is introduced on 25.02.2017
  2: begin { Lognorm }
       nu_steady:=g_g0/NP.tau_m0 * nu_Lognorm((U-NP.Vrest)/VT,LogN_sgm);
       if (U-NP.Vrest)>1e-6 then begin
           xt_:=VT/(U-NP.Vrest);
           nu_unsteady:=dUdt/VT * LogNorm(xt_,0,LogN_sgm)*sqr(xt_);
       end else begin
           nu_unsteady:=0;
       end;
     end;
  end;
  {************************************************************}
  if Form4.CheckBox14.Checked then nu_unsteady:=0;    {'Without F'}
  Rate:=max(nu_steady+nu_unsteady,0);
end;

end.
