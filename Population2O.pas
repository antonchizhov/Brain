unit PopulationO;

interface
uses
  Classes,Forms,
  typeNrnParsO,t_dtO,ThresholdO,MathMyO,NeuronO,SetNrnParsO,CreateNrnO,EEGO,
  Unit1,Unit2,Unit4,Unit12,Unit25,Init,Erf_Hazard;

const MaxPh=250;

type
  arr_ph=array[0..MaxPh] of double;

  { Properties: }
  PopulationProperties =record
    Name                                          :string;
    NP                                            :NeuronProperties;
    dts,ts_end,sgm_V                              :double;
    Nts,
    IfNoA,IfNoF,IfLogNorm,Form4SpecCondItemIndex,
    If_sgm_scaled_with_s                          :integer;
  end;
  LogNtype =record
    sgm,mu                                        :double;
    Nx                                            :integer;
    xmax,Ufree,ro_0                               :arr_ph;
  end;

  {==================================================================}
  TPopulation = class(TObject)
  private
  protected
  public
    {Properties:}
    PP                                          :PopulationProperties;
    {Control variables:}
    uE,sE,uI,sI,uu,ss,tt,Iind                   :double;
    {Variables:}
    nu,Isyn,U,dUdt,Bum,tBum,Norm,
    mean_U,mean_IsynI,mean_IK                   :double;
    ro,ts,VT,Hzrd                               :arr_ph;
    Nrn                                         :array[0..MaxPh] of TNeuron;
    EEG                                         :TEEG;
    LogN                                        :LogNtype;
    {Functions:}
    {*******************************************}
    procedure EquateFrom(APop :TPopulation);
    procedure EquateTo(APop :TPopulation);
    function xThr2 :integer;
    function xThr :integer;
    function Ufree_ts(ts_:double) :double;
    procedure ConditionsAtSpike(ANrn :TNeuron);
    function nts_by_ts(ts_ :double) :integer;
    function ro_at_ts(ts_ :double) :double;
    procedure Calculate_mean_Voltage;
    procedure Calculate_mean_IsynI;
    procedure Calculate_mean_IK;
    procedure Draw;

    procedure InitialConditions;
    procedure MembranePotential(t_,Vhold :double);
    function Density :double;

    constructor Create(PP_ :PopulationProperties);
  end;
  {==================================================================}

procedure Initiate_NP_ForPopulation_O(HH_type,HH_order :string;
                                ThrCorrection :double; var NP :NeuronProperties);
procedure CreatePopulationBy_NP_O(Name :string; Nts :integer;
                                  dt_,ts_end,sgm_V :double;
                                  NP :NeuronProperties; var APop :TPopulation);
function InvLogNormF(x,mu,sgm :double) :double;                                 {LN}

implementation


procedure IfSpikeOccursInThrModel5;
//(V_,Thr,ddV:double; var tAP_:double; var indic_:integer);
begin end;

procedure Initiate_NP_ForPopulation_O(HH_type,HH_order :string;
                                ThrCorrection :double; var NP :NeuronProperties);
var  S :string;
begin
  { Pointer }
//  @NP.VThreshold2 := @VThreshold5;
//  @NP.IfSpikeOccursInThrModel:=@IfSpikeOccursInThrModel5;
  { Define the type of neuron }
  NP.HH_type :=HH_type;
  NP.HH_order:=HH_order;
  NP.IfThrModel:=1;
  { Set parameters according to the type of neuron }
  HodgkinPhysParameters(NP);
  NP.ThrShift:=ThrCorrection;
  { Apply fixed constant threshold }
  S:=Form4.SpecCond.Items[Form4.SpecCond.ItemIndex];
  if (NP.HH_type='Passive')or
     (S='FixThreshold=10mV')or
    ((S='Fix T=10mV for E-cells')and(NP.HH_type='Lyle'))or
    ((S='Fix T=10mV for I-cells')and(NP.HH_type='Chow')) then begin
           NP.FixThr:=0.010{V};
  end else NP.FixThr:=0;
end;

procedure CreatePopulationBy_NP_O(Name :string; Nts :integer;
                                  dt_,ts_end,sgm_V :double;
                                  NP :NeuronProperties; var APop :TPopulation);
var
    PP_ :PopulationProperties;
begin
  { Create Object-Population }
  dt:=dt_;
  PP_.Name:=Name;
  PP_.NP:=NP;
  PP_.Nts:=imin(Nts,MaxPh);
  PP_.ts_end:=ts_end;
  PP_.dts:=ts_end/imax(Nts,1);
//  if PP_.dts<dt then begin PP_.dts:=dt; PP_.ts_end:=(Nts-1)*PP_.dts; end;
  PP_.sgm_V:=sgm_V;
  APop:=TPopulation.Create(PP_);
end;

{********** procedures of the class *************************************}

constructor TPopulation.Create(PP_ :PopulationProperties);
var i :integer;
begin
  inherited Create;
  { Fulfil parameters }
  PP:=PP_;
  { EEG }
  if PP_.Nts=0 then begin
     EEG:=TEEG.Create;
     PP_.NP.HH_type:='Passive'; //'nonadaptPassive'; Changed on 17.10.2013
  end;
  { Create set of neurons }
  for i:=0 to PP_.Nts do begin
      CreateNeuronByTypeO(PP_.NP,Nrn[i]);
      @Nrn[i].NP.IfSpikeOccursInThrModel:=@IfSpikeOccursInThrModel5;
      Nrn[i].NP.HH_type:=PP.NP.HH_type;
  end;
end;

procedure TPopulation.EquateFrom(APop :TPopulation);
var i :integer;
begin
  PP  :=APop.PP  ;
  uE  :=APop.uE  ;
  sE  :=APop.sE  ;
  uI  :=APop.uI  ;
  sI  :=APop.sI  ;
  uu  :=APop.uu  ;
  ss  :=APop.ss  ;
  tt  :=APop.tt  ;
  Iind:=APop.Iind;
  ro  :=APop.ro  ;
  ts  :=APop.ts  ;
  VT  :=APop.VT  ;
  Hzrd:=APop.Hzrd;
  LogN:=APop.LogN;
  nu  :=APop.nu  ;
  Isyn:=APop.Isyn;
  U   :=APop.U   ;
  dUdt:=APop.dUdt;
  Bum :=APop.Bum ;
  tBum:=APop.tBum;
  Norm:=APop.Norm;
  mean_U:=APop.mean_U;
  mean_IsynI:=APop.mean_IsynI;
  mean_IK:=APop.mean_IK;
  for i:=0 to PP.Nts do begin
      Nrn[i].EquateFrom(APop.Nrn[i]);
  end;
  if PP.Nts=0 then EEG.EquateFrom(APop.EEG);
end;

procedure TPopulation.EquateTo(APop :TPopulation);
var i :integer;
begin
  APop.PP  :=PP  ;
  APop.uE  :=uE  ;
  APop.sE  :=sE  ;
  APop.uI  :=uI  ;
  APop.sI  :=sI  ;
  APop.uu  :=uu  ;
  APop.ss  :=ss  ;
  APop.tt  :=tt  ;
  APop.Iind:=Iind;
  APop.ro  :=ro  ;
  APop.ts  :=ts  ;
  APop.VT  :=VT  ;
  APop.Hzrd:=Hzrd;
  APop.LogN:=LogN;
  APop.nu  :=nu  ;
  APop.Isyn:=Isyn;
  APop.U   :=U   ;
  APop.dUdt:=dUdt;
  APop.Bum :=Bum ;
  APop.tBum:=tBum;
  APop.Norm:=Norm;
  APop.mean_U:=mean_U;
  APop.mean_IsynI:=mean_IsynI;
  APop.mean_IK:=mean_IK;
  for i:=0 to PP.Nts do begin
      APop.Nrn[i].EquateFrom(Nrn[i]);
  end;
  if PP.Nts=0 then APop.EEG.EquateFrom(EEG);
end;

function TPopulation.xThr2 :integer;
var x,i         :integer;
begin
  x:=PP.Nts;
  for i:=0 to PP.Nts-1 do begin
      if (ts[i]>PP.NP.dT_AP)and(Hzrd[i]>Hzrd[x]) then  x:=i;
  end;
  xThr2:=x;
end;

function TPopulation.xThr :integer;       {Created on 11.11.2010}
var x,i         :integer;
    StH,SH      :double;
begin
  StH:=0; SH:=0;
  for i:=0 to PP.Nts do begin
      StH:=StH + ts[i]*Hzrd[i]*PP.dts;
      SH :=SH  +       Hzrd[i]*PP.dts;
  end;
  if SH>1e-8 then begin
     x:=nts_by_ts(StH/SH)
  end else begin
     x:=PP.Nts;
  end;
  xThr:=x;
end;

function TPopulation.Ufree_ts(ts_:double) :double;   {Created on 24.10.2013}
var i         :integer;
begin
  i:=iMinMod(trunc(ts_/PP.dts),PP.Nts-1);
  Ufree_ts:=LogN.Ufree[i]*(ts_/PP.dts-i) + LogN.Ufree[i+1]*(i+1-ts_/PP.dts);
end;

procedure TPopulation.ConditionsAtSpike(ANrn :TNeuron);
var xThr_               :integer;
    tau_nM,tau_wAHP     :double;
begin
  with ANrn do begin
     if NP.Vreset<>0 then  NV.V:=NP.Vreset
                     else  NV.V:=-0.040;
     NV.Vd:=NP.Vrest;
     { Brette's dynamic threshold }
     NV.VT_Brette:=NP.VTreset_Brette;
     NV.DVDt:=0;   NV.ddV:=0;
     NV.nn:=NP.n_AP;  NV.yK:=NP.yK_AP; NV.nA:=NP.nA_AP; NV.lA:=NP.lA_AP;
     NV.yH:=NP.yH_AP; NV.xD:=NP.xD_AP;
     { nM and wAHP }
     xThr_:=xThr;
     NV.nM  :=Nrn[xThr_].NV.nM;
     NV.wAHP:=Nrn[xThr_].NV.wAHP;
     NV.yD  :=Nrn[xThr_].NV.yD;
     NV.wAHP:=NV.wAHP + NP.dwAHP*(1-NV.wAHP);
     NV.nM  :=NV.nM   + NP.dnM  *(1-NV.nM);
     NV.yD  :=NV.yD   + NP.dyD  *NV.yD;
  end;
end;

function TPopulation.nts_by_ts(ts_ :double) :integer;
{ Find particle just behind ts_ or precisely at ts_ }
var i,i2 :integer;
    t2 :double;
begin
  if PP.Nts=0 then begin nts_by_ts:=0; exit; end;
{  nts:=0;
  for i:=0 to PP.Nts do
      if (ts[i]<=ts_)and(abs(ts[i]-ts_)<abs(ts[nts]-ts_)) then nts:=i;
  nts_by_ts:=nts;}
  t2:=1e8; i2:=-1;
  for i:=0 to PP.Nts do begin
      if (ts[i]>=ts_)and(ts[i]<t2) then begin
         i2:=i;
         t2:=ts[i];
      end;
  end;
  { Exception }
  if i2=-1 then i2:=PP.Nts;
  nts_by_ts:=i2;
end;

function TPopulation.ro_at_ts(ts_ :double) :double;
var
    i,i2,nts    :integer;
    t1,t2,R1,R2 :double;
begin
  if PP.Nts=0 then begin ro_at_ts:=nu; exit; end;
{  nts:=nts_by_ts(ts_);
  ro_at_ts:=ro[nts];
  if nts<PP.Nts then begin
     ro_at_ts:=ro[nts]+(ro[nts+1]-ro[nts])/(ts[nts+1]-ts[nts])*(ts_-ts[nts]);
  end;}
  t1:=0; R1:=nu;
  { Find particle just behind ts_ or precisely at ts_ }
  t2:=1e8;
  for i:=0 to PP.Nts do begin
      if (ts[i]>=ts_)and(ts[i]<t2) then begin
         i2:=i;
         t2:=ts[i];
         R2:=ro[i];
      end;
  end;
  { Whether there is an intermediate particle  between ts=0 and t2? }
  if (i2>0)and(ts[i2-1]<ts[i2]) then begin
     t1:=ts[i2-1];
     R1:=ro[i2-1];
  end;
  { Linear interpolation }
  if t2-t1>0  then  ro_at_ts:=R1+(R2-R1)/(t2-t1)*(ts_-t1)
              else  ro_at_ts:=R1;
end;

{ *********************************************** Mean values *****************}
procedure TPopulation.Calculate_mean_Voltage;
var
    i :integer;
    V_,VPeak_,dT_AP_ :double;
begin
  if PP.Nts=0 then begin  mean_U:=Nrn[0].NV.V;  exit;  end;
  dT_AP_:=PP.NP.dT_AP;  if dT_AP_<1e4 then dT_AP_:=0.001{s};
  VPeak_:={PP.NP.Vrest+VT[PP.Nts];}{PP.NP.Vreset;}0;
  { Mean voltage of spiking cells }
  mean_U:=VPeak_*Bum + U*ro[PP.Nts]*PP.dts;
  for i:=0 to PP.Nts-1 do begin
      V_:=Nrn[i].NV.V;
      { Reconstruction of the spike }
      if ts[i]<=dT_AP_ then begin
         V_:=VPeak_ + (PP.NP.Vreset-VPeak_)/dT_AP_*ts[i];
      end;
      mean_U:=mean_U + V_*ro[i]*min(PP.dts,PP.ts_end-ts[i]);
  end;
  if Norm>0 then mean_U:=mean_U/Norm;
end;

procedure TPopulation.Calculate_mean_IsynI;
{ Mean IsynI }
begin
  mean_IsynI:=-sI*(mean_U-Vus) + uI;
end;

procedure TPopulation.Calculate_mean_IK;
{ Mean IK }
var  i :integer;
     dts_ :double;
begin
  if PP.Nts=0 then begin  mean_IK:=Nrn[0].NV.IK_tot;  exit;  end;
  mean_IK:=Nrn[PP.Nts].NV.IK_tot*(Bum + ro[PP.Nts]*PP.dts);
  for i:=0 to PP.Nts-1 do begin
      if      ts[i]<=PP.NP.dT_AP        then  dts_:=0
      else if ts[i]<=PP.NP.dT_AP+PP.dts then  dts_:=PP.NP.dT_AP
      else                                    dts_:=min(PP.dts,PP.ts_end-ts[i]);
      mean_IK:=mean_IK + Nrn[i].NV.IK_tot*ro[i]*dts_;
  end;
  if Norm>0 then mean_IK:=mean_IK/Norm;
end;

{ *********************************************** Drawing *********************}
procedure TPopulation.Draw;
var i   :integer;
    t1  :string;
    Ufr_:double;
begin
  if Form12.Visible=false then exit;
  { Drawing }
  Form12.Series1.Clear;
  Form12.Series2.Clear;
  Form12.Series5.Clear;
  Form12.Series6.Clear;
  Form12.Series2.AddXY(0,nu);
  for i:=0 to PP.Nts do begin
      Form12.Series1.AddXY(ts[i]*1000,Nrn[i].NV.V*1000);
      Form12.Series2.AddXY(ts[i]*1000,ro[i]);
      if Form4.CheckBox13.Checked then begin{ If lognormal }
         Ufr_:=Ufree_ts(ts[i]);
         Form12.Series5.AddXY(ts[i]*1000,((Nrn[i].NV.V-Ufr_)*LogN.xmax[i]+Ufr_)*1000);
         Form12.Series6.AddXY(ts[i]*1000,Ufr_*1000);
      end;
  end;
  Form12.Series3.AddXY(t*1000,Nrn[PP.Nts].NV.V*1000);
  Form12.Series4.AddXY(t*1000,nu);
  { Labels }
{  str(Norm:9:4,t1);
  Form12.Label1.Caption:='Norm='+t1;
  str(Bum:13,t1);
  Form12.Label2.Caption:='Bum='+t1;}
  Application.ProcessMessages;
end;

procedure TPopulation.InitialConditions;
var  i,nt_  :integer;
begin
  { Output variables }
  nu:=0; Isyn:=0; U:=PP.NP.Vrest; dUdt:=0; mean_U:=0; mean_IsynI:=0; mean_IK:=0;
  { Hazard function variables and parameters }
  for i:=0 to PP.Nts do  LogN.xmax[i]:=13;
  LogN.sgm:=1/2; LogN.mu:=ln(1);
  PP.IfNoA:=IfTrue(Form4.CheckBox9.Checked);
  PP.IfNoF:=IfTrue(Form4.CheckBox14.Checked);
  PP.IfLogNorm:=0; if Form4.CheckBox13.Checked then PP.IfLogNorm:=1;
                   if Form4.CheckBox7.Checked  then PP.IfLogNorm:=2;
  PP.Form4SpecCondItemIndex:=Form4.SpecCond.ItemIndex;
  PP.If_sgm_scaled_with_s:=IfTrue(Form4.CheckBox10.Checked); //Synaptic noise is proportional to synaptic conductance sgm=a+b*ss_, where we assume also a=b;
  LogN.sgm:=Form4.DDSpinEdit79.Value;
  LogN.Nx :=trunc(Form4.DDSpinEdit82.Value);
  {****************************** EEG *********************}
  if PP.Nts=0 then begin
     EEG.InitialConditions(PP.Name,PP.NP,PP.sgm_V);
     Nrn[0].InitialConditions;
     PP.NP:=Nrn[PP.Nts].NP;
     exit;
  end;
  {********************************************************}
  //t:=0;
  { Set conditions at rest }
  for i:=0 to PP.Nts do begin
      Nrn[i].InitialConditions;
  end;
  PP.NP:=Nrn[PP.Nts].NP;
  { Set conditions at spike }
  for i:=0 to PP.Nts-1 do begin
      ConditionsAtSpike(Nrn[i]);
  end;
  { Integrate till "ts" }
  ts[0]:=0;
  ts[PP.Nts]:=PP.Nts*PP.dts;
  for i:=1 to PP.Nts-1 do begin
      ts[i]:=i*PP.dts;
      nt_:=0;
      repeat  nt_:=nt_+1;
        {******* One step of integration **}
        IF nt_*dt>PP.NP.dT_AP THEN
        {*****************************************}
        Nrn[i].MembranePotential(0,0,0,0,0,0,0);
        {*****************************************}
      until nt_=trunc(ts[i]/dt);
  end;
  { Fulfil density }
  for i:=0 to PP.Nts do  ro[i]:=0;   ro[PP.Nts]:=1/PP.dts;
  for i:=0 to PP.Nts do  LogN.ro_0[i]:=ro[i];
  { Fulfil Ufree - voltage versus ts for non-stimulated neuron after spike }
  for i:=0 to PP.Nts do  LogN.Ufree[i]:=Nrn[i].NV.V;
  tBum:=t;                    // added on 22.10.2013
end;

{******************************************************************************}
procedure TPopulation.MembranePotential(t_,Vhold :double);
{******************************************************************************}
var  i  :integer;
begin
  t:=t_;
  for i:=0 to PP.Nts do begin
      {******* One step of integration **}
      IF (PP.Nts=0)or(ts[i]>PP.NP.dT_AP) THEN
      {**************************************************}
      Nrn[i].MembranePotential(uE,sE,uI,sI,tt,Iind,Vhold);
      {**************************************************}
      if i<PP.Nts then ts[i]:=ts[i]+dt;
  end;
  { Conditions at spike }
  for i:=0 to PP.Nts-1 do begin
      if ts[i]>=PP.ts_end then begin
         ts[i]:=ts[i]-PP.ts_end;
        ConditionsAtSpike(Nrn[i]);
         ro[PP.Nts]:=ro[PP.Nts]+ro[i];
         if t=tBum then begin
            tBum:=-tBum;
         end;
         ro[i]:=Bum/(t-tBum);
         LogN.ro_0[i]:=ro[i];  {number of neurons attributed to a particle}     {LN}
//         xmax[PP.Nts]:=xmax[i];                                               {LN}
         LogN.xmax[i]:=InvLogNormF(1, LogN.mu,LogN.sgm);                        {LN}
         tBum:=t;  Bum:=0;
      end;
  end;
  if PP.Nts=0 then EEG.RateDependentAdaptiveCurrents(nu,Nrn[PP.Nts]);
  U   :=Nrn[PP.Nts].NV.V;
  dUdt:=Nrn[PP.Nts].NV.DVDt;
  U:=U+0;
end;

function H_function(Vsc_,dVdt_,sgmV_,g_g0,ts_,taum_:double;
                    PP:PopulationProperties) :double;
{ H=F+A }
var  A,F :double;
begin
  { Derived from "frozen" Gauss }
  if dVdt_<0 then F:=0 else F:=F_tilde(Vsc_)/sgmV_*dVdt_*g_g0;
  { From self-similar Fokker-Planck }
  A:=fA_T(-Vsc_,taum_taus)/taum_;
  { Condition to check if noise is strong enough to evoke firing }
  if (PP.Form4SpecCondItemIndex<>4)and
  // ((ts_<0.008){or(dVdt<-sgmV_/taum_)}) then A:=0; {14.03.2010} {commented on 11.11.2010, uncommented on 23.06.2011, commented on 8.02.2012}
     ((ts_<0.008)and(dVdt_<=0)) then A:=0; {8.02.2012}
  if PP.IfNoA=1 then A:=0;    {'Without A'}
  if PP.IfNoF=1 then F:=0;    {'Without F'}
  { Spike half-duration }
  if ts_<=PP.NP.dT_AP then begin F:=0; A:=0; end;
  {**************}
  H_function:=F+A;
  {**************}
end;

{******************************************************************************}
{************************* LOGNORM ********************************************}
{******************************************************************************}

function LogNorm(x,mu,sgm :double) :double;                                     {LN}
{ Teramae 2012, eq.(3) or wiki. }
begin
  if x>0 then  LogNorm:=dexp(-sqr(ln(x)-mu)/2/sqr(sgm))/(sqrt(2*pi)*sgm*x)
         else  LogNorm:=0;
end;

function LogNormF(x,mu,sgm :double) :double;                                    {LN}
begin
  LogNormF:=0.5+0.5*Erfic((ln(x)-mu)/sgm/sqrt(2));
end;

function InvLogNormF(x,mu,sgm :double) :double;                                 {LN}
begin
  InvLogNormF:=dexp(mu+sgm*sqrt(2)*InvErfic(2*x-1));
end;

function LogNorm_H(U,VT,Ufr,dUdt,xmax,sgmV_,g_g0,ts_,taum_:double;
                   LN:LogNtype; PP:PopulationProperties) :double;
var V_,dVdt_,A,F,H,S,Vsc_,dx_,x_,xmin_,xmax_ :double;
    i :integer;
begin
  if U<=0 then begin LogNorm_H:=0; exit; end;
  S:=0;
  xmin_:=max(0,1-5*LN.sgm);
  xmax_:=      1+5*LN.sgm;
  for i:=1 to LN.Nx do begin
      dx_:=(xmax_-xmin_)/LN.Nx;
      x_:=xmin_+i*dx_;
      if x_<=xmax then begin
         V_   :=(U+PP.NP.Vrest-Ufr)*x_+Ufr-PP.NP.Vrest;
         dVdt_:=dUdt*x_;
         Vsc_:=(V_-VT)/sgmV_/sqrt(2)*g_g0;
         {********************* H=F+A ********************}
         H:=H_function(Vsc_,dVdt_,sgmV_,g_g0,ts_,taum_,PP);
         {************************************************}
         if x_+dx_>xmax then dx_:=xmax-x_;
         S:=S + H*LogNorm(x_,LN.mu,LN.sgm)*dx_;
      end;
  end;
  LogNorm_H:=S{/LogNormF(xmax,LN.mu,LN.sgm)};       //commented on 17.01.2014
end;

{ NUMERICAL METHOD.
  Left cell at ts=0:       ro=nu,      U=Vreset, cell size - (t-tBum).
  Right cell at ts=ts_end: ro=ro[Nts], U=U[Nts], cell size - dts.
  Next to right cell i: ro=ro[i], U=U[i], cell size - ts_end-ts[i]=dts+(t-tBum)
}
{******************************************************************************}
function TPopulation.Density :double;
{******************************************************************************}
var
    i                                                      :integer;
    dro,S,H_dt,F,sgmV_,Vsc_,dVdt,A,g0_,g_g0,taum_,H,V_,l_  :double;
begin
  g0_:=PP.NP.C_membr/PP.NP.tau_m0;
  sgmV_:=PP.sgm_V;
  if PP.If_sgm_scaled_with_s=1 then  sgmV_:=sgmV_*(1+ss/g0_); //Synaptic noise is proportional to synaptic conductance sgm=a+b*ss_, where we assume also a=b;
  { Exception for EEG-model }
  if PP.Nts=0 then begin
     VT[0]:=VThreshold4(PP.NP, dUdt,Nrn[0].NV.ddV, 0.100{ms});
     if PP.Form4SpecCondItemIndex=4 then   // 'VT=VT(t*)'
     VT[0]:=VThreshold5(PP.NP, dUdt,Nrn[0].NV.ddV, 0.100{ms});
     g_g0:=(PP.NP.gL+Nrn[0].NV.gActive+ss)/g0_;
     nu:=EEG.Rate(U,dUdt,g_g0,sgmV_,VT[0],PP.NP);
     Density:=nu;
     exit;
  end;
  {*************************}
  S:=0;
  FOR i:=PP.Nts downto 0 do begin {loop for phase}
      dVdt:=Nrn[i].NV.DVDt;
{}      VT[i]:=VThreshold3(PP.NP,dVdt,ts[i]);  {changed from 5 to 3 on 20.06.2011}
      if PP.Form4SpecCondItemIndex=4 then   // 'VT=VT(t*)'
      VT[i]:=VThreshold5(PP.NP,dVdt,Nrn[i].NV.ddV,ts[i]);  {changed from 4 to 5 on 11.11.2010}
      //VT[i]:=VThreshold6(PP.NP,Nrn[i].NV);       {Introduced on 18.04.2011}
      //VT[i]:=VThreshold7(PP.NP,Nrn[i].NV);       {Introduced on 20.06.2011}
      g_g0:=(PP.NP.gL+Nrn[i].NV.gActive+ss)/g0_;
      taum_:=PP.NP.tau_m0/g_g0;
      Vsc_:=(Nrn[i].NV.V-PP.NP.Vrest-VT[i])/sgmV_/sqrt(2)*g_g0;
      {********************** H=F+A ********************}
      H:=H_function(Vsc_,dVdt,sgmV_,g_g0,ts[i],taum_,PP);
      {******************** LogNormal ******************}
      if PP.IfLogNorm=1 then begin
         V_:=Nrn[i].NV.V-PP.NP.Vrest;
         H:=LogNorm_H(V_,VT[i],Ufree_ts(ts[i]),dVdt,LogN.xmax[i],
                      sgmV_,g_g0,ts[i],taum_,LogN,PP); {LN}
      end;
      {*************************************************}
      H_dt:=1-dexp(-H*dt);
      dro:=ro[i]*H_dt;
      {*****************}
      ro[i]:=ro[i] - dro;
      {*****************}
      Hzrd[i]:=dro/dt;
      S:=S         + dro;
      if PP.IfLogNorm=1 then begin    {'Lognormal'}
         l_:=LogNormF(LogN.xmax[i],LogN.mu,LogN.sgm);
         if LogN.ro_0[i]>0 then LogN.xmax[i]:=InvLogNormF(ro[i]/LogN.ro_0[i], LogN.mu,LogN.sgm)
                           else LogN.xmax[i]:=InvLogNormF(l_ - H_dt,          LogN.mu,LogN.sgm);
//         LogN.xmax[i]:=InvLogNormF(max(0,l_-H_dt),          LogN.mu,LogN.sgm);
//         LogN.xmax[i]:=max(0.1,LogN.xmax[i] - H_dt/l_);
         if i=PP.Nts  then LogN.xmax[PP.Nts]:=InvLogNormF(ro[PP.Nts]*PP.dts,  LogN.mu,LogN.sgm);
//         if i=PP.Nts then LogN.xmax[PP.Nts]:=InvLogNormF(1, LogN.mu,LogN.sgm);
         //LogN.xmax[PP.Nts]:=LogN.xmax[nts_by_ts(PP.ts_end-PP.dts)];
      end;
  END;
  nu:=     S*PP.dts/dt;
  Bum:=Bum+S*PP.dts;
  { Norm }
  S:=Bum + ro[PP.Nts]*PP.dts;
  for i:=0 to PP.Nts-1 do  S:=S+ro[i]*min(PP.dts,PP.ts_end-ts[i]);
  Norm:=S;
  {***}
  nu:=nu/Norm;
  Density:=nu;
end;

end.
