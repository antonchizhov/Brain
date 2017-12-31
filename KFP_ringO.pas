unit KFP_ringO;

interface
uses
  Classes,Forms,Unit16,EEGO,Math,Unit8,AnalysisO;

type
  {==================================================================}
  TKFP = class
  private
  protected
  public
    {Properties:}
    tau, R, Vrev, Vrest, Vth, V0, Vstep, tstep, sgm2,
    teta1,teta2,t_Teta2,tSt_end,tSt_start,tBG,
    k_Joh,I0_Joh,Noise,Gad_nu_gL,
    J0,J1,II0,II1,fi_r,K0,K1,L0,L1
                                                      :double;
    Nv,Nnrn,CosOrExp                                  :integer;
    If_sgm_is_proportional_to_g_g0                    :boolean;

    procedure WriteChain(nt :integer);
    procedure I_and_S_synaptic(const i:integer; var Isyn_,Ssyn_ :double);
    procedure ExplicitSchemeFor_HeatEq(i :integer; dt_,sgm2_,mu_ :double);
    procedure Heat_Eq_Step(inrn :integer; dt_,sgm2_,mu_ :double);
    procedure Run_KFP;
    function nu_AdaptedJohannesma(I_,s_ :double) :double;
    procedure PlotWrite_Johannesma_nu_I_s(Ns :integer);
    function fJoh(I_,s_:double; i :integer) :double;
    procedure RunLinearApproximationOfJohannesma;
    procedure ParametersToForm;
    procedure ParametersFromForm;
    procedure SetConnectionsFromForm_Map_FR_to_KFP;
    procedure Run_FR;
    constructor Create;
  end;
  {==================================================================}

var KFP :TKFP;


implementation


  type  vecv    =Array[0..2000]  of double;
        vecteta =Array[0..500] of double;
        mat     =Array[0..2000,0..100] of double;
  var
    t,teta0                                     :double;
    V                                           :vecv;
    norma,f,fo,nu,Isyn,Ssyn                     :vecteta;
    ro1,ro                                      :mat;

{FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}


constructor TKFP.Create;
begin
  inherited Create;
  Randomize;
end;

procedure TKFP.WriteChain(nt :integer);
var  i,i_   :integer;
     s1     :string;
     Stimul :double;
     xxx    :text;
begin
  { One file *************************************************}
  s1:='V1_f_Stim_Isyn_nu(t,x).dat';
  assign(xxx,s1);
  if nt<=1 then begin
     rewrite(xxx);
     writeln(xxx,'ZONE T="',s1,'"');
     writeln(xxx,'I=',Nnrn+1:3,',J=',trunc(Form16.DDSpinEdit8.Value/tstep/Form16.DDSpinEdit24.Value)+1:3,',K=1,F=POINT');
  end else append(xxx);
  for i_:=0 to Nnrn do begin
      i:=i_; if i_=Nnrn then i:=0;
      Stimul:=(II0+II1*Cos(2*pi*i_/Nnrn - teta0)-I0_Joh{pA})*k_Joh{Hz/pA};
      write  (xxx,t:9:5,' ',180*i_/Nnrn-90:9:5);
      writeln(xxx,' ',f[i]:8:4,' ',Stimul:8:4,' ',Isyn[i]:8:4,' ',nu[i]:8:4);
  end;
  close(xxx);
end;

procedure TKFP.I_and_S_synaptic(const i:integer; var Isyn_,Ssyn_ :double);
var    j,IfStimulate,ifBG           :integer;
       add,adS,ex,rp                :double;
begin
  add:=0;  adS:=0;
  for j:=0 to (Nnrn-1) do begin
      case CosOrExp of
      1: begin
           add:=add + fo[j]*(J0 + J1*Cos(2*pi*(i-j)/Nnrn));
           adS:=adS + fo[j]*(L0 + L1*Cos(2*pi*(i-j)/Nnrn));
         end;
      2: begin
           if fi_r=0 then ex:=1 else ex:=exp(-abs(2*pi*(i-j)/Nnrn/fi_r));
           add:=add + fo[j]*(J0 + J1*ex);
           adS:=adS + fo[j]*(L0 + L1*ex);
         end;
      end;
  end;
  { Set period of Background calculation }
  ifBG:=0; if t<0 then ifBG:=1;
  { Set period of stimulation }
  IfStimulate:=1; if((t<tSt_start)or(t>tSt_end))and(ifBG=0) then IfStimulate:=0;
  { Set stimulus orientation }
  if t<t_Teta2 then  teta0:=teta1
               else  teta0:=teta2;
  rp   := add/Nnrn + (II0+II1*Cos(2*pi*i/Nnrn - teta0)*(1-ifBG))*IfStimulate; {pA}
  Isyn_:=rp + Noise*RandG(0,1);
  Ssyn_:= adS/Nnrn + ( K0+ K1*Cos(2*pi*i/Nnrn - teta0)*(1-ifBG))*IfStimulate; {pS}
end;

procedure TKFP.ExplicitSchemeFor_HeatEq(i :integer; dt_,sgm2_,mu_ :double);
var
    ddro_dVV,z  :double;
    n           :integer;
begin
           { Boundary conditions }
           ro[0,i]:=0;
           ro[Nv,i]:=0;
           for n:=1 to (Nv-1) do begin
               if dt_>Vstep/(abs(V[n]-mu_)+sgm2_/Vstep) then begin
                  Form16.Label2.Visible:=true;    // Warning
                  Application.ProcessMessages;
                  exit;
               end else if mu_<V0 then begin
                  Form16.Label27.Visible:=true;   // Warning
                  Application.ProcessMessages;
                  exit;
               end else begin
                  Form16.Label2.Visible:=false;   // Warning
                  Form16.Label27.Visible:=false;  // Warning
               end;
               if      V[n]  -mu_<=0 then begin
                  z:=((V[n]  -mu_)*ro[n,i]
                     -(V[n-1]-mu_)*ro[n-1,i])/Vstep
               end else begin
                  z:=((V[n+1]-mu_)*ro[n+1,i]
                    -( V[n]  -mu_)*ro[n,i])/Vstep;
               end;
               ddro_dVV:=(ro[n+1,i]-2*ro[n,i]+ro[n-1,i])/Vstep/Vstep;
               {*******************************************}
               ro1[n,i]:=ro[n,i]+dt_*(z + sgm2_/2*ddro_dVV);
               {*******************************************}
           end;
           { Now ro is at new step }
           for n:=1 to Nv-1 do ro[n,i]:=ro1[n,i];
end;

{**********************************************************************}
procedure TKFP.Heat_Eq_Step(inrn :integer; dt_,sgm2_,mu_ :double);
{**********************************************************************}
{The heat transfer eq. is solved:
        tau dro/dt = sgm^2/2 * d^2 ro/dz^2 + d((V-mu)*ro)/dz
}
var
   a,b,c,d                        :vecv;
   nu                             :double;
   i,N                            :integer;
begin
      N:=Nv;
      { Define coefficients of Thomas algorithm }
      nu:=dt_/Vstep/Vstep*sgm2_/2;
      for i:=1 to N-1 do begin
          a[i]:=     -nu;
          d[i]:=1 + 2*nu;
          b[i]:=     -nu;
          c[i]:=ro[i,inrn];
          if      V[i]  -mu_<=0 then begin
              d[i]:=d[i]-dt_*(V[i]  -mu_)/Vstep;
              b[i]:=b[i]+dt_*(V[i-1]-mu_)/Vstep;
          end else begin
              a[i]:=a[i]-dt_*(V[i+1]-mu_)/Vstep;
              d[i]:=d[i]+dt_*(V[i]  -mu_)/Vstep;
          end;
      end;
      { Boundary conditions }
      a[0]:=0;   d[0]:=1;    c[0]:=0;  { ro[0,inrn]=0 }
      d[N]:=1;   b[N]:=0;    c[N]:=0;  { ro[N,inrn]=0 }
      { Forward Thomas algorithm }
      for i:=1 to N do begin
          d[i]:=d[i]-b[i]/d[i-1]*a[i-1];
          c[i]:=c[i]-b[i]/d[i-1]*c[i-1];
      end;
      { Forward Thomas algorithm }
      ro[N,inrn]:=c[N]/d[N];
      for i:=N-1 downto 0 do begin
          ro[i,inrn]:=(c[i]-a[i]*ro[i+1,inrn])/d[i];
      end;
end;
{*********************** End of Heat_Eq *******************************}

{******************************************************************************}
procedure TKFP.Run_KFP;
{ Solution of Kolmogorov-Fokker-Planck equation }
var     nt,n,i,nrev,nrest               :integer;
        Stimul,gtot,g_g0,tau_,sgm2_,mu  :double;
begin
   Form16.Chart4.Visible:=false;
   ParametersFromForm;
   V[0]:=V0;
   nrev :=Trunc((Vrev -V[0])/Vstep);
   nrest:=Trunc((Vrest-V[0])/Vstep);
   { initial conditions }
   for i:=0 to (Nnrn-1) do begin
       for n:=0 to Nv do begin
           V[n]:=V[0]+Vstep*n;
           ro[n,i]:= 0;
       end;
       ro[nrest,i]:=1/Vstep;
       f[i]:=0;  fo[i]:=0;    nu[i]:=0;
   end;
   Form16.Series3.Clear;
   Form16.Series6.Clear;
   nt:=0;   if tBG>0 then nt:=-trunc(tBG/tstep);
   repeat
       nt:=nt+1; t:=nt*tstep;
       { Pause }
       while Form16.CheckBox1.Checked do begin Application.ProcessMessages; end;
       for i:=0 to (Nnrn-1) do begin
           { Input }
           I_and_S_synaptic(i,Isyn[i],Ssyn[i]);
           gtot:=(1+Gad_nu_gL*f[i])/R{MOhms}*1e3 + Ssyn[i]{pS}/1e3; {nS}
           g_g0:=gtot*R/1e3;
           tau_:=tau/g_g0;
           sgm2_:=sgm2/g_g0;  // sqr is deleted on 25.02.2017
           if If_sgm_is_proportional_to_g_g0 then sgm2_:=sgm2_*(1+Ssyn[i]*R/1e6); // sqr is deleted on 25.02.2017
           mu:=Vrest+Isyn[i]/gtot; {mV}
           { *** KFP integration *** }
           case Form16.ComboBox3.ItemIndex of
           0: ExplicitSchemeFor_HeatEq(i, tstep/tau_,sgm2_,mu);
           {*************************************}
           1: Heat_Eq_Step(i,tstep/tau_,sgm2_,mu);
           {*************************************}
           end;
           { Norm }
           norma[i]:=0;  for n:=0 to Nv do  norma[i]:=norma[i] + ro[n,i]*Vstep;
           { Source term }
           nu[i]:=(1-norma[i])/tstep*1000;
           f[i]:=-sgm2_/(2*tau_*0.001)*(ro[Nv,i]-ro[Nv-1,i])/Vstep;
           //f[i]:=nu[i];
           ro[nrev,i]:=ro[nrev,i]+(1-norma[i])/Vstep;
       end;
       for i:=0 to Nnrn-1 do fo[i]:=f[i];
       { Drawing }
       if nt mod trunc(Form16.DDSpinEdit19.Value) = 0 then begin
          Form16.Series1.Clear;
          Form16.Series2.Clear;
          Form16.Series4.Clear;
          Form16.Series5.Clear;
          Form16.Series7.Clear;
          Form16.Series8.Clear;
          Form16.Series9.Clear;
          for n:=0 to Nv do begin
              Form16.Series1.AddXY(V[n],ro[n,trunc(teta1/2/pi*Nnrn)]);
              Form16.Series7.AddXY(V[n],ro[n,trunc(teta2/2/pi*Nnrn)]);
          end;
          Form16.Series3.AddXY(t,nu[trunc(teta1/2/pi*Nnrn)]);
          Form16.Series6.AddXY(t,nu[trunc(teta2/2/pi*Nnrn)]);
          for i:=0 to (Nnrn-1) do begin
              Stimul:=(II0+II1*Cos(2*pi*i/Nnrn - teta0)-I0_Joh{pA})*k_Joh{Hz/pA};
              Form16.Series2.AddXY(360*i/Nnrn-180, nu[i]);
              Form16.Series4.AddXY(360*i/Nnrn-180, Stimul);
              Form16.Series5.AddXY(360*i/Nnrn-180, Isyn[i]);
          end;
          Application.ProcessMessages;
       end;
       { Drawing }
       if (nt=1)or(nt mod trunc(Form16.DDSpinEdit24.Value)=0) then WriteChain(nt);
   until nt>=Trunc(Form16.DDSpinEdit8.Value/tstep);
end;
{******************************************************************************}

function TKFP.nu_AdaptedJohannesma(I_,s_ :double) :double;
var
    iter    :integer;
    g_gL,nu,nu_,nu_old,alpha_iter,x,sgm_,tau_ :double;
begin
  if Gad_nu_gL=0 then begin
     { Non-adaptive model }
     x:=Vrest+I_*R/1000/(1+s_);
     tau_:=tau/(1+s_)/1e3;
     sgm_:=sqrt(sgm2)/sqrt(1+s_);    // sqrt is introduced on 25.02.2017
     if If_sgm_is_proportional_to_g_g0 then sgm_:=sqrt(sgm2);
     nu:=nu_Johannesma(x,tau_,Vth,Vrev,sgm_);
  end else begin
     { Adaptive model }
     alpha_iter:=0.1;
     nu:=0;
     iter:=0;
     repeat  iter:=iter+1;
       g_gL:=1 + s_ + Gad_nu_gL*nu;
       x:=Vrest+I_*R/1000/g_gL;
       tau_:=tau/g_gL/1e3;
       sgm_:=sqrt(sgm2)/sqrt(g_gL);          // sqrt is introduced on 25.02.2017
       if If_sgm_is_proportional_to_g_g0 then sgm_:=sgm_*sqrt(1+s_);  // sqrt is introduced on 25.02.2017
       nu_old:=nu_;
       if sgm_=0 then begin
         {***********}
          nu_:=nu_LIF       (x,tau_,Vth,Vrev);
         {***********}
       end else begin
         {******************}
          nu_:=nu_Johannesma(x,tau_,Vth,Vrev,sgm_);
         {******************}
       end;
       nu:=(1-alpha_iter)*nu + alpha_iter*nu_;
     until (abs(nu-nu_old)<0.01{Hz})or(iter>400);
     if iter>400 then nu:=0;
  end;
  nu_AdaptedJohannesma:=nu;
end;

procedure TKFP.PlotWrite_Johannesma_nu_I_s(Ns :integer);
{ Plot nu-I-s-curves for Johannesma, not-noisy LIF and Plus  }
var i,j,N                                      :integer;
    nu_Joh,I_,s_,nu_LIF,nu_Plus,nu_full,mu,x   :double;
    bbb                                        :text;
begin
  assign(bbb,'Joh_approx.dat'); rewrite(bbb);
  ParametersFromForm;
  Form16.Chart4.Visible:=true;
  Form16.LineSeries1.Clear;
  Form16.LineSeries2.Clear;
  Form16.Series10.Clear;
  Form16.Series11.Clear;
  N:=400;
  for j:=0 to Ns do begin
      for i:=0 to N do begin
          s_:=1*j;
          I_:=i/N*600; {pA}
          {*** Full neuron ***}
          nu_full:=nu_I_s(I_,s_,2{s});
          {*** Noisy adaptive LIF **************}
          nu_Joh :=nu_AdaptedJohannesma(I_,s_);
          {*** Not-noisy LIF *******************}
          mu:=Vrest+I_*R/1000/(1+s_);
          if (mu<=Vth)or(Vrev>Vth) then nu_LIF:=0 else begin
             nu_LIF:=1000/tau/ln((mu-Vrev)/(mu-Vth));
          end;
          {*** Plus ****************************}
          x:=I_ - I0_Joh*(1+s_);
          if x<=0 then nu_Plus:=0 else nu_Plus:=k_Joh*x;
          { Drawing }
          Form16.LineSeries1.AddXY(I_, nu_Joh);
          Form16.LineSeries2.AddXY(I_, nu_LIF);
          Form16.Series10.AddXY   (I_, nu_Plus);
          Form16.Series11.AddXY   (I_, nu_full);
          Application.ProcessMessages;
          { Writing }
          write  (bbb,I_:9:3,' ',s_:9:3,' ',nu_full:9:3,' ',nu_Joh:9:3,' ');
          writeln(bbb,nu_LIF:9:3,' ',nu_Plus:9:3);
      end;
  end;
  close(bbb);
end;

procedure TKFP.RunLinearApproximationOfJohannesma;
var V_about,nu1,nu2,I1,I2 :double;
begin
  { I_about_Joh }
//  if (Form16.DDSpinEdit16.Enabled)and(Form16.DDSpinEdit16.Value<>0) then begin
//     V_about:=Form16.DDSpinEdit16.Value;//*R/1000+Vrest;
//  end else begin
     V_about:=Vth;//-sqrt(sgm2/2)/2;              {??.??.2010}
     //V_about:=Vth-sqrt(sgm2/2)/2;              {uncommented on 23.12.2010, commented on 01.07.2011}
//  end;
  if Form8.ComboBox3.ItemIndex=2 then V_about:=(Vth-Vrest)*0.1+Vrest;
  { Approximation }
  case Form8.ComboBox3.ItemIndex of
    0: begin { appr. full neuron model }
         repeat
           I1:=(V_about-2.0-Vrest)/R*1000; {pA}
           I2:=(V_about+2.0-Vrest)/R*1000; {pA}
           nu1:=nu_I_s(I1,0,100{s});
           nu2:=nu_I_s(I2,0,100{s});
           if nu1<=10{Hz} then V_about:=V_about+(Vth-Vrest);
         until nu1>10{Hz};
       end;
    1,2: begin { appr. noisy LIF with adaptation-conductance }
         I1:=(V_about    -Vrest)/R*1000; {pA}
         I2:=(V_about+1.0-Vrest)/R*1000; {pA}
         nu1:=nu_AdaptedJohannesma(I1,0);
         nu2:=nu_AdaptedJohannesma(I2,0);
       end;
  end;
  k_Joh :=(nu2-nu1)/(I2-I1); {Hz/pA}
  if k_Joh>0 then
  I0_Joh:=I1-nu1/k_Joh; {pA}
//  LinearApproxOfAdaptJoh(Vrest,Vth,Vrev,V_about,tau,R,sqrt(sgm2),Gad_nu_gL,
//                                                                  k_Joh,I0_Joh);
  { Put to the Form }
  Form16.DDSpinEdit14.Value:=k_Joh;
  Form16.DDSpinEdit15.Value:=I0_Joh;
  Form16.DDSpinEdit16.Value:=I1;
end;

{******************************************************************************}
procedure TKFP.ParametersToForm;
begin
  Form16.DDSpinEdit1.Value:=Nnrn;
  Form16.DDSpinEdit2.Value:=tau;
  Form16.DDSpinEdit3.Value:=R;
  Form16.DDSpinEdit4.Value:=Vrev;
  Form16.DDSpinEdit5.Value:=Vrest;
  Form16.DDSpinEdit6.Value:=Vth;
  Form16.DDSpinEdit7.Value:=V0;
  Form16.DDSpinEdit9.Value:=Nv;
  Form16.DDSpinEdit10.Value:=Vstep;
  Form16.DDSpinEdit11.Value:=tstep;
  Form16.DDSpinEdit12.Value:=sgm2;
  Form16.DDSpinEdit13.Value:=teta1/pi*180-180;
  Form16.DDSpinEdit17.Value:=teta2/pi*180-180;
  Form16.DDSpinEdit18.Value:=t_Teta2;
  Form16.DDSpinEdit35.Value:=tSt_start;
  Form16.DDSpinEdit36.Value:=tSt_end;
  Form16.DDSpinEdit37.Value:=tBG;
  Form16.CheckBox2.Checked:=If_sgm_is_proportional_to_g_g0;
  { Linearization of Johannesma }
//  RunLinearApproximationOfJohannesma;
  { Connections }
  if Gad_nu_gL=0 then begin
  Form16.DDSpinEdit20.Value:=(II0{pA}  -K0*I0_Joh*R/1e6-I0_Joh{pA})*k_Joh{Hz/pA};    {Hz}
  Form16.DDSpinEdit21.Value:=(II1{pA}  -K1*I0_Joh*R/1e6)*k_Joh{Hz/pA};                {Hz}
  Form16.DDSpinEdit22.Value:=(J0{pA/Hz}-L0*I0_Joh*R/1e6)*k_Joh{Hz/pA};
  Form16.DDSpinEdit23.Value:=(J1{pA/Hz}-L1*I0_Joh*R/1e6)*k_Joh{Hz/pA};
  end else begin
  Form16.DDSpinEdit20.Value:=(II0{pA}-I0_Joh{pA})*k_Joh{Hz/pA};//-K0/Gad_nu_gL*R/1e6;    {Hz}
  Form16.DDSpinEdit21.Value:= II1{pA}            *k_Joh{Hz/pA};//-K1/Gad_nu_gL*R/1e6;    {Hz}
  Form16.DDSpinEdit22.Value:= J0{pA/Hz}          *k_Joh{Hz/pA};//-L0/Gad_nu_gL*R/1e6;
  Form16.DDSpinEdit23.Value:= J1{pA/Hz}          *k_Joh{Hz/pA};//-L1/Gad_nu_gL*R/1e6;
  end;
  Form16.DDSpinEdit25.Value:= II0{pA}  ;
  Form16.DDSpinEdit26.Value:= II1{pA}  ;
  Form16.DDSpinEdit27.Value:= J0{pA/Hz};
  Form16.DDSpinEdit28.Value:= J1{pA/Hz};
  Form16.DDSpinEdit29.Value:= fi_r*180/pi{rad.};
  Form16.DDSpinEdit30.Value:= K0{pS};
  Form16.DDSpinEdit31.Value:= K1{pS};
  Form16.DDSpinEdit32.Value:= L0{pS/Hz};
  Form16.DDSpinEdit33.Value:= L1{pS/Hz};
  Form16.DDSpinEdit34.Value:= Noise{pA};
  Form16.ComboBox2.ItemIndex:=CosOrExp-1;
  Form16.DDSpinEdit29.Enabled:=(CosOrExp=2);
end;

procedure TKFP.ParametersFromForm;
begin
  Nnrn :=trunc(Form16.DDSpinEdit1.Value);
  tau  :=Form16.DDSpinEdit2.Value;
  R    :=Form16.DDSpinEdit3.Value;
  Vrev :=Form16.DDSpinEdit4.Value;
  Vrest:=Form16.DDSpinEdit5.Value;
  Vth  :=Form16.DDSpinEdit6.Value;
  V0   :=Form16.DDSpinEdit7.Value;
  Nv   :=trunc(Form16.DDSpinEdit9.Value);
  Vstep:=(KFP.Vth-KFP.V0)/KFP.Nv;//Form16.DDSpinEdit10.Value;
  tstep:=Form16.DDSpinEdit11.Value;
  sgm2 :=Form16.DDSpinEdit12.Value;
  teta1:=(Form16.DDSpinEdit13.Value+180)/180*pi;
  teta2:=(Form16.DDSpinEdit17.Value+180)/180*pi;
  t_Teta2:=Form16.DDSpinEdit18.Value;
  tSt_start:=Form16.DDSpinEdit35.Value;
  tSt_end  :=Form16.DDSpinEdit36.Value;
  tBG      :=Form16.DDSpinEdit37.Value;
  If_sgm_is_proportional_to_g_g0:=Form16.CheckBox2.Checked;
  Noise:=Form16.DDSpinEdit34.Value;
  { Linearization of Johannesma }
//  RunLinearApproximationOfJohannesma;
  { Connections }
  fi_r:=Form16.DDSpinEdit29.Value/180*pi; {deg.}
  CosOrExp:=Form16.ComboBox2.ItemIndex+1;
end;

procedure TKFP.SetConnectionsFromForm_Map_FR_to_KFP;
begin
  { Connections }
  II0 :=Form16.DDSpinEdit20.Value{Hz}/k_Joh{Hz/pA} + I0_Joh{pA}; {pA}
  II1 :=Form16.DDSpinEdit21.Value{Hz}/k_Joh{Hz/pA}; {pA}
  J0  :=Form16.DDSpinEdit22.Value/k_Joh{Hz/pA}; {pA/Hz}
  J1  :=Form16.DDSpinEdit23.Value/k_Joh{Hz/pA}; {pA/Hz}
  Form16.DDSpinEdit25.Value:= II0{pA}  ;
  Form16.DDSpinEdit26.Value:= II1{pA}  ;
  Form16.DDSpinEdit27.Value:= J0{pA/Hz};
  Form16.DDSpinEdit28.Value:= J1{pA/Hz};
  K0:=0;
  K1:=0;
  L0:=0; L1:=0;
  Form16.DDSpinEdit30.Value:= K0{pS};
  Form16.DDSpinEdit31.Value:= K1{pS};
  Form16.DDSpinEdit32.Value:= L0{pS/Hz};
  Form16.DDSpinEdit33.Value:= L1{pS/Hz};
end;

function TKFP.fJoh(I_,s_:double; i :integer) :double;
var
     iJoh,j,IfStimulate,ifBG                            :integer;
     x,add,I0_FR,I1_FR,J0_FR,J1_FR,rp,Isyn_,fJoh_  :double;
begin
  case Form16.ComboBox1.ItemIndex of
  0: begin                               {Johannesma}
       {******************************************************************}
       fJoh:=nu_AdaptedJohannesma(I_,s_);
       {******************************************************************}
     end;
  1: begin                               {"Plusik"}
       x:=I_ - I0_Joh*(1+s_);                  //14.05.2010
       if x<=0 then fJoh:=0 else fJoh:=k_Joh*x;
       { Checking }
{       fJoh_:=nu_AdaptedJohannesma(mu,tau/g_g0/1e3,Vth,Vrev,sgm_,Gad_nu_gL);
       Form16.Series8.AddXY(Isyn_,max(0,k_Joh*x));
       Form16.Series9.AddXY(Isyn_,fJoh_);}
     end;
  2: begin                               {Classic Ring}
       I0_FR:=Form16.DDSpinEdit20.Value;
       I1_FR:=Form16.DDSpinEdit21.Value;
       J0_FR:=Form16.DDSpinEdit22.Value;
       J1_FR:=Form16.DDSpinEdit23.Value;
       add:=0;
       for j:=0 to (Nnrn-1) do begin
           add:=add + fo[j]*(J0_FR + J1_FR*Cos(2*pi*(i-j)/Nnrn));
       end;
       { Set period of Background calculation }
       ifBG:=0; if t<0 then ifBG:=1;
       { Set period of stimulation }
       IfStimulate:=1; if((t<tSt_start)or(t>tSt_end))and(ifBG=0) then IfStimulate:=0;
       { Set stimulus orientation }
       if t<t_Teta2 then  teta0:=teta1
                    else  teta0:=teta2;
       //y:=trunc(teta0/2/pi*Nnrn);
       rp:=add/Nnrn + (I0_FR + I1_FR*Cos(2*pi*i/Nnrn - teta0)*(1-ifBG))*IfStimulate;
       if rp<0 then rp:=0;
       fJoh:=rp;
     end;
  end;
end;

{******************************************************************************}
procedure TKFP.Run_FR;
{ Solution of Firing-Rate ring model }
{ tau_r*df/dt= -f + Johannesma(Isynaptic) }
var     nt,i                        :integer;
        fJoh_,Stimul{,gtot,g_g0,mu} :double;
begin
   ParametersFromForm;
   { initial conditions }
   for i:=0 to (Nnrn-1) do begin
       f[i]:=0; fo[i]:=0;
   end;
   Form16.Series3.Clear;
   Form16.Series6.Clear;
   nt:=0;  if tBG>0 then nt:=-trunc(tBG/tstep);
   repeat
       nt:=nt+1; t:=nt*tstep;
       for i:=0 to (Nnrn-1) do begin
         { Input }
         I_and_S_synaptic(i,Isyn[i],Ssyn[i]);
         //gtot:=1/R{MOhms}*1e3 + Ssyn[i]{pS}/1e3; {nS}
         //g_g0:=gtot*R/1e3;
         //mu:=Vrest+Isyn[i]/gtot; {mV}
         { FR integration }
         fJoh_:=fJoh(Isyn[i],Ssyn[i]*R/1e6,i);
         {***********************************}
         f[i]:=f[i]+tstep/tau*(-f[i] + fJoh_);
         {***********************************}
       end;
       for i:=0 to Nnrn-1 do fo[i]:=f[i];
       { Drawing }
       if nt mod trunc(Form16.DDSpinEdit19.Value) = 0 then begin
          Form16.Series2.Clear;
          Form16.Series4.Clear;
          Form16.Series5.Clear;
          Form16.Series3.AddXY(t,f[trunc(teta1/2/pi*Nnrn)]);
          Form16.Series6.AddXY(t,f[trunc(teta2/2/pi*Nnrn)]);
          for i:=0 to (Nnrn-1) do begin
              Stimul:=(II0+II1*Cos(2*pi*i/Nnrn - teta0)-I0_Joh{pA})*k_Joh{Hz/pA};
              Form16.Series2.AddXY(360*i/Nnrn-180, f[i]);
              Form16.Series4.AddXY(360*i/Nnrn-180, Stimul);
              Form16.Series5.AddXY(360*i/Nnrn-180, Isyn[i]);
          end;
          Application.ProcessMessages;
       end;
       { Drawing }
       if (nt=1)or(nt mod trunc(Form16.DDSpinEdit24.Value)=0) then WriteChain(nt);
   until nt>=Trunc(Form16.DDSpinEdit8.Value/tstep);
end;

end.
