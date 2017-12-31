unit PopulationO;

interface
uses
  Classes,Forms,Math,
  typeNrnParsO,t_dtO,ThresholdO,MathMyO,NeuronO,SetNrnParsO,CreateNrnO,EEGO,
  Unit1,Unit2,Unit4,Unit12,Unit25,Init,Erf_Hazard;

//const MaxPh=250; MaxLN=100;   commented on 24.05.2016

type
  arr_ph=array[0..MaxPh] of double;
  arr_LN=array[0..MaxPh,1..MaxLN] of double;

  { Properties: }
  PopulationProperties =record
    Name                                          :string;
    NP                                            :NeuronProperties;
    dts,ts_end,sgm_V                              :double;
    Nts,FiniteSize,
    IfNoA,IfNoF,IfLogNorm,SpecCond_Item,
    If_sgm_scaled_with_s,If_Ufree_90              :integer;
  end;
  LogNtype =record
    sgm,mu                                        :double;
    Nx                                            :integer;
    xmax,dUfree                                   :arr_ph;
//24.05.2016    ro_0                                          :arr_LN;
  end;

  {==================================================================}
  TPopulation = class(TObject)
  private
  protected
  public
    {Properties:}
    PP                                          :PopulationProperties;
    {Control variables:}
    uE,sE,uI,sI,{uu,ss,}tt,Iind,r_Noise         :double;
    {Variables:}
    Bum,xLN,PHI_dx                              :array[1..MaxLN] of double;
    nu,Isyn,U,dUdt,tBum,Norm,
    mean_U,mean_IsynI,mean_IK                   :double;
    ts,VT,Hzrd                                  :arr_ph;
    ro,va                                       :arr_LN;
    Nrn                                         :array[0..MaxPh] of TNeuron;
    EEG                                         :TEEG;
    LogN                                        :LogNtype;
    {Functions:}
    {*******************************************}
    procedure EquateFrom(APop :TPopulation);
    procedure EquateTo(APop :TPopulation);
    function xThr2 :integer;
    function xThr :integer;
    function mean_nM :double;
    function mean_wAHP :double;
    function mean_yD :double;
    function dUfree_ts(ts_:double) :double;
    procedure ConditionsAtSpike(ANrn :TNeuron);
    function ro_at_its(its :integer) :double;
    function nts_by_ts(ts_ :double) :integer;
    function ro_at_ts(ts_ :double) :double;
    procedure Calculate_mean_Voltage;
//    procedure Calculate_mean_IsynI;
    procedure Calculate_mean_IK;
    procedure Draw;

    procedure InitialConditions(PopNumber_:integer);
    procedure MembranePotential(t_,Vhold :double);
    function Density :double;

    constructor Create(PP_ :PopulationProperties);
  end;
  {==================================================================}

procedure CreatePopulationBy_NP_O(Name :string; Nts :integer;
                                  dt_,ts_end,sgm_V :double;
                                  NP :NeuronProperties; var APop :TPopulation);

implementation


procedure IfSpikeOccursInThrModel5;
begin end;

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
  //uu  :=APop.uu  ;
  //ss  :=APop.ss  ;
  tt  :=APop.tt  ;
  Iind:=APop.Iind;
  ro  :=APop.ro  ;
  ts  :=APop.ts  ;
  VT  :=APop.VT  ;
  Hzrd:=APop.Hzrd;
  LogN:=APop.LogN;
  xLN :=APop.xLN;
  PHI_dx:=APop.PHI_dx;
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
  //APop.uu  :=uu  ;
  //APop.ss  :=ss  ;
  APop.tt  :=tt  ;
  APop.Iind:=Iind;
  APop.ro  :=ro  ;
  APop.ts  :=ts  ;
  APop.VT  :=VT  ;
  APop.Hzrd:=Hzrd;
  APop.LogN:=LogN;
  APop.xLN :=xLN;
  APop.PHI_dx:=PHI_dx;
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

function TPopulation.mean_nM :double;       {Created on 16.04.2016}
var i         :integer;
    SgH,SH      :double;
begin
  SgH:=0; SH:=0;
  for i:=0 to PP.Nts do begin
      SgH:=SgH + Nrn[i].NV.nM*Hzrd[i]*PP.dts;
      SH :=SH  +              Hzrd[i]*PP.dts;
  end;
  if SH>1e-8 then begin
     mean_nM:=SgH/SH;
  end else begin
     mean_nM:=Nrn[PP.Nts].NV.nM;
  end;
end;

function TPopulation.mean_wAHP :double;       {Created on 16.04.2016}
var i         :integer;
    SgH,SH      :double;
begin
  SgH:=0; SH:=0;
  for i:=0 to PP.Nts do begin
      SgH:=SgH + Nrn[i].NV.wAHP*Hzrd[i]*PP.dts;
      SH :=SH  +                Hzrd[i]*PP.dts;
  end;
  if SH>1e-8 then begin
     mean_wAHP:=SgH/SH;
  end else begin
     mean_wAHP:=Nrn[PP.Nts].NV.wAHP;
  end;
end;

function TPopulation.mean_yD :double;       {Created on 16.04.2016}
var i         :integer;
    SgH,SH      :double;
begin
  SgH:=0; SH:=0;
  for i:=0 to PP.Nts do begin
      SgH:=SgH + Nrn[i].NV.yD*Hzrd[i]*PP.dts;
      SH :=SH  +              Hzrd[i]*PP.dts;
  end;
  if SH>1e-8 then begin
     mean_yD:=SgH/SH;
  end else begin
     mean_yD:=Nrn[PP.Nts].NV.yD;
  end;
end;

function TPopulation.dUfree_ts(ts_:double) :double;   {Created on 24.10.2013}
var i         :integer;
begin
  i:=iMinMod(trunc(ts_/PP.dts),PP.Nts-1);
  dUfree_ts:=LogN.dUfree[i]*(ts_/PP.dts-i) + LogN.dUfree[i+1]*(i+1-ts_/PP.dts);
end;

procedure TPopulation.ConditionsAtSpike(ANrn :TNeuron);
var xThr_               :integer;
begin
  with ANrn do begin
     if NP.Vreset<>0 then  NV.V:=NP.Vreset
                     else  NV.V:=-0.040;
     NV.Vd:=NP.Vd_reset;                     {16.04.2016}
     { Brette's dynamic threshold }
     NV.VT_Brette:=NP.VTreset_Brette;
     NV.DVDt:=0;   NV.ddV:=0;
     NV.nn:=NP.n_AP;  NV.yK:=NP.yK_AP; NV.nA:=NP.nA_AP; NV.lA:=NP.lA_AP;
     NV.yH:=NP.yH_AP; NV.xD:=NP.xD_AP;
     { nM and wAHP }
     xThr_:=xThr;
     //xThr_:=nts_by_ts(1/max(nu, 1/PP.ts_end));
     NV.nM  :=Nrn[xThr_].NV.nM;
     NV.wAHP:=Nrn[xThr_].NV.wAHP;
     NV.yD  :=Nrn[xThr_].NV.yD;
{     NV.nM  :=mean_nM;
     NV.wAHP:=mean_wAHP;
     NV.yD  :=mean_yD;}
     NV.wAHP:=NV.wAHP + NP.dwAHP*(1-NV.wAHP);
     NV.nM  :=NV.nM   + NP.dnM  *(1-NV.nM);
     NV.yD  :=NV.yD   + NP.dyD  *NV.yD;
  end;
end;

function TPopulation.ro_at_its(its :integer) :double;
var  iLN :integer;
     S   :double;
begin
  S:=0;
  for iLN:=1 to LogN.Nx do S:=S+ro[its,iLN]*PHI_dx[iLN]{/LogN.Nx}; //corrected on 4.08.2015
  ro_at_its:=S;
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
    i,i2{,iLN}       :integer;
    {t1,}t2,{R1,}R2  :double;
begin
  if PP.Nts=0 then begin ro_at_ts:=nu; exit; end;
{  nts:=nts_by_ts(ts_);
  ro_at_ts:=ro[nts];
  if nts<PP.Nts then begin
     ro_at_ts:=ro[nts]+(ro[nts+1]-ro[nts])/(ts[nts+1]-ts[nts])*(ts_-ts[nts]);
  end;}
  { Calculate rate R1 at ts=0 }
  // Commented on 10.01.2017 t1:=0; R1:=0{nu};       // Changed on 10.01.2017
  // Commented on 10.01.2017 if t>tBum then begin    // Added on 10.01.2017
  // Commented on 10.01.2017    R1:=0;
  // Commented on 10.01.2017    for iLN:=1 to LogN.Nx do R1:=R1+Bum[iLN]/(t-tBum)*PHI_dx[iLN];
  // Commented on 10.01.2017 end;
  { Find particle just behind ts_ or precisely at ts_ }
  t2:=1e8;
  R2:=888;
  for i:=0 to PP.Nts do begin
      if (ts[i]>=ts_)and(ts[i]<t2) then begin
         i2:=i;
         t2:=ts[i2];
         R2:=ro_at_its(i);
      end;
  end;
  { Whether there is an intermediate particle  between ts=0 and t2? }
  // Commented on 10.01.2017 if (i2>0)and(ts[i2-1]<ts[i2]) then begin
  // Commented on 10.01.2017    t1:=ts[i2-1];
  // Commented on 10.01.2017    R1:=ro_at_its(i2-1);
  // Commented on 10.01.2017 end;
  { Linear interpolation }
  // Commented on 10.01.2017 if t2-t1>0  then  ro_at_ts:=R1+(R2-R1)/(t2-t1)*(ts_-t1)
  // Commented on 10.01.2017             else  ro_at_ts:=R1; 
  ro_at_ts:=R2;  // changed on 10.01.2017
end;

{ *********************************************** Mean values *****************}
procedure TPopulation.Calculate_mean_Voltage;
var
    i,iLN :integer;
    V_,VPeak_,dT_AP_ :double;
begin
  if PP.Nts=0 then begin  mean_U:=Nrn[0].NV.V;  exit;  end;
  dT_AP_:=PP.NP.dT_AP;  if dT_AP_<1e4 then dT_AP_:=0.001{s};
  VPeak_:={PP.NP.Vrest+VT[PP.Nts];}{PP.NP.Vreset;}0;
  { Mean voltage of spiking cells }
  mean_U:=0;
  for iLN:=1 to LogN.Nx do begin
      mean_U:=mean_U + VPeak_*Bum[iLN] + U*ro[PP.Nts,iLN]*PP.dts*PHI_dx[iLN];
      for i:=0 to PP.Nts-1 do begin
          V_:=Nrn[i].NV.V;
          { Reconstruction of the spike }
          if ts[i]<=dT_AP_ then begin
             V_:=VPeak_ + (PP.NP.Vreset-VPeak_)/dT_AP_*ts[i];
          end;
          mean_U:=mean_U + V_*ro[i,iLN]*min(PP.dts,PP.ts_end-ts[i])*PHI_dx[iLN];
      end;
  end;
  if Norm>0 then mean_U:=mean_U/Norm;
end;

//procedure TPopulation.Calculate_mean_IsynI;
//{ Mean IsynI }
//begin
//  mean_IsynI:=-sI*(mean_U-Vus) + uI;
//end;

procedure TPopulation.Calculate_mean_IK;
{ Mean IK }
var  i,iLN :integer;
     dts_  :double;
begin
  if PP.Nts=0 then begin  mean_IK:=Nrn[0].NV.IK_tot;  exit;  end;
  mean_IK:=0;
  for iLN:=1 to LogN.Nx do begin
      mean_IK:=mean_IK + Nrn[PP.Nts].NV.IK_tot*(Bum[iLN]
                       + ro[PP.Nts,iLN]*PP.dts*PHI_dx[iLN]);
      for i:=0 to PP.Nts-1 do begin
          if      ts[i]<=PP.NP.dT_AP        then  dts_:=0
          else if ts[i]<=PP.NP.dT_AP+PP.dts then  dts_:=PP.NP.dT_AP
          else                                    dts_:=min(PP.dts,PP.ts_end-ts[i]);
          mean_IK:=mean_IK + Nrn[i].NV.IK_tot*ro[i,iLN]*dts_*PHI_dx[iLN];
      end;
  end;
  if Norm>0 then mean_IK:=mean_IK/Norm;
end;

{ *********************************************** Drawing *********************}
procedure TPopulation.Draw;
var i   :integer;
    Ufr_:double;
begin
  if Form12.Visible=false then exit;
  { Drawing }
  Form12.Series1.Clear;
  Form12.Series2.Clear;
  Form12.Series5.Clear;
  Form12.Series6.Clear;
  Form12.Series7.Clear;
  Form12.Series8.Clear;
  Form12.Series9.Clear;
  Form12.Series10.Clear;
  Form12.Series11.Clear;
  Form12.Series12.Clear;
  Form12.Series13.Clear;
  Form12.Series2.AddXY(0,nu);
  for i:=0 to PP.Nts do begin
      Form12.Series1.AddXY(ts[i]*1000,Nrn[i].NV.V*1000);
      Form12.Series2.AddXY(ts[i]*1000,ro[i,1]);
      if PP.IfLogNorm<>0 then begin { If lognormal }
         Ufr_:=dUfree_ts(ts[i])+Nrn[i].NP.Vrest;
         Form12.Series5.AddXY(ts[i]*1000,((Nrn[i].NV.V-Ufr_)*LogN.xmax[i]+Ufr_)*1000);
         Form12.Series6.AddXY(ts[i]*1000,Ufr_*1000);
         Form12.Series7.AddXY(ts[i]*1000,ro[i,2]);
         Form12.Series8.AddXY(ts[i]*1000,ro[i,3]);
         Form12.Series9.AddXY(ts[i]*1000,ro[i,4]);
         Form12.Series10.AddXY(ts[i]*1000,ro[i,5]);
         Form12.Series11.AddXY(ts[i]*1000,ro[i,6]);
         Form12.Series12.AddXY(ts[i]*1000,ro[i,7]);
      end;
      if PP.FiniteSize>0 then
         Form12.Series13.AddXY(ts[i]*1000,va[i,1]);
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

{******************************************************************************}
procedure TPopulation.InitialConditions(PopNumber_:integer);
{******************************************************************************}
var  i,nt_,iLN                                   :integer;
     {xmin_,xmax_,dx_fixed,}F1_,F2_,x_,F_x_LogN_   :double;
//     F_,dx_                          :array[0..MaxLN+1] of double;
begin
  { Output variables }
  nu:=0; Isyn:=0; U:=PP.NP.Vrest; dUdt:=0; mean_U:=0; mean_IsynI:=0; mean_IK:=0;
  { Hazard function variables and parameters }
  for i:=0 to PP.Nts do  LogN.xmax[i]:=13;
  LogN.sgm:=1/2; LogN.mu:=ln(1);
  PP.IfNoA:=IfTrue(Form4.CheckBox9.Checked);
  PP.IfNoF:=IfTrue(Form4.CheckBox14.Checked);
  PP.IfLogNorm:=0;
  if (PopNumber_ mod 2 > 0)and(Form4.CheckBox13.Checked) then PP.IfLogNorm:=1;
  if (PopNumber_ mod 2 = 0)and(Form4.CheckBox17.Checked) then PP.IfLogNorm:=1;
  if (PopNumber_ mod 2 > 0) then PP.SpecCond_Item:=Form4.ComboBox8.ItemIndex;
  if (PopNumber_ mod 2 = 0) then PP.SpecCond_Item:=Form4.ComboBox9.ItemIndex;
  PP.If_sgm_scaled_with_s:=IfTrue(Form4.CheckBox10.Checked); //Synaptic noise is proportional to synaptic conductance sgm=a+b*ss_, where we assume also a=b;
  PP.If_Ufree_90:=IfTrue(Form4.CheckBox24.Checked); //Lognormal distribution starts from -90{mV}
  PP.FiniteSize :=trunc(Form4.DDSpinEdit120.Value);
  LogN.sgm:=Form4.DDSpinEdit79.Value;
  LogN.Nx :=trunc(Form4.DDSpinEdit82.Value);  if PP.IfLogNorm=0 then LogN.Nx:=1;
  if LogN.Nx>MaxLN then LogN.Nx:=MaxLN;
  { Lognorm space }
  //xmin_:=max(0,1-5*LogN.sgm);
  //xmax_:=      1+5*LogN.sgm;
  //dx_fixed:=(xmax_-xmin_)/LogN.Nx;
  for iLN:=1 to LogN.Nx do begin
//      xLN[iLN]:=xmin_+iLN*dx_fixed;
      xLN[iLN]:= InvLogNormF(1/(LogN.Nx+1)* iLN,   LogN.mu,LogN.sgm);
      //dx_[iLN]:=(InvLogNormF(1/(LogN.Nx+1)*(iLN+1),LogN.mu,LogN.sgm)
      //          -InvLogNormF(1/(LogN.Nx+1)*(iLN-1),LogN.mu,LogN.sgm))/2;
      //F_[iLN]:=LogNormF(xLN[iLN],LogN.mu,LogN.sgm);
      { Discretization according to distribution of x*LogNorm(x) }
      x_:=0;
      repeat x_:=x_+0.01;
        F_x_LogN_:=LogNormLinearNormalizedDistribution(x_,LogN.mu,LogN.sgm);
      until F_x_LogN_ >= (iLN-1/2)/(LogN.Nx+1);
      xLN[iLN]:=x_;
  end;
  //F_[0]:=0;  F_[LogN.Nx+1]:=1;
  for iLN:=1 to LogN.Nx do begin
      if (LogN.Nx=1)or(PP.IfLogNorm=0) then PHI_dx[1]:=1 else begin
                       {if iLN=1       then PHI_dx[1]:=  LogNormF((xLN[2]-xLN[1])/2,LogN.mu,LogN.sgm) else
                        if iLN=LogN.Nx then PHI_dx[iLN]:=1-LogNormF(xLN[LogN.Nx],LogN.mu,LogN.sgm) else
                                            PHI_dx[iLN]:=LogNormF((xLN[iLN+1]+xLN[iLN])/2,LogN.mu,LogN.sgm)
                                                        -LogNormF((xLN[iLN]+xLN[iLN-1])/2,LogN.mu,LogN.sgm);}
          //PHI_dx[iLN]:=1/2*(F_[iLN+1]-F_[iLN-1])/dx_[iLN]*dx_fixed; //commented on 17.05.2016
          if iLN=1 then F1_:=0 else
                        F1_:=LogNormF((xLN[iLN]+xLN[iLN-1])/2,LogN.mu,LogN.sgm);
          if iLN=LogN.Nx then F2_:=1 else
                        F2_:=LogNormF((xLN[iLN+1]+xLN[iLN])/2,LogN.mu,LogN.sgm);
          PHI_dx[iLN]:=F2_-F1_;
      end;
  end;
  if LogN.Nx=1 then xLN[LogN.Nx]:=1;
  //xLN[1]:=0.5; xLN[2]:=1; xLN[3]:=1.5; xLN[4]:=3; xLN[5]:=7;
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
  for iLN:=1 to LogN.Nx do begin
      for i:=0 to PP.Nts do begin
          ro[i,iLN]:=0;
          va[i,iLN]:=0;
      end;
      ro[PP.Nts,iLN]:=1/PP.dts;
//24.05.2016      for i:=0 to PP.Nts do  LogN.ro_0[i,iLN]:=ro[i,iLN];
  end;
  { Fulfil Ufree - voltage versus ts for non-stimulated neuron after spike }
  for i:=0 to PP.Nts do  LogN.dUfree[i]:=Nrn[i].NV.V-Nrn[i].NP.Vrest;
  tBum:=t;                    // added on 22.10.2013
end;

{******************************************************************************}
procedure TPopulation.MembranePotential(t_,Vhold :double);
{******************************************************************************}
var  i,iLN  :integer;
     xi     :double;
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
         if t=tBum then begin
            tBum:=-tBum;
         end;
         for iLN:=1 to LogN.Nx do begin
             ro[PP.Nts,iLN]:=ro[PP.Nts,iLN]+ro[i,iLN];
             {*** Boundary condition for ro ***}
             ro[i,iLN]:=max(0,Bum[iLN])/(t-tBum);             // max is introduced on 5.10.2017
             {*********************************}
             if PP.FiniteSize>0 then begin { Tilo Schwalger eq.(15) }
                { A_N = A + sqrt(A/N)*xi }
                //if ro[i,iLN]>0 then begin
                xi:=min(3,max(-3,RandG(0,1)));
                ro[i,iLN]:=max(0,ro[i,iLN]
                                   + sqrt(ro[i,iLN]/PP.FiniteSize/(t-tBum))*xi);
                //end;
                va[i,iLN]:=0;
             end;
             Bum[iLN]:=0;
//24.05.2016             LogN.ro_0[i,iLN]:=ro[i,iLN];  {number of neurons attributed to a particle}     {LN}
         end;
//         xmax[PP.Nts]:=xmax[i];                                               {LN}
         LogN.xmax[i]:=InvLogNormF(1, LogN.mu,LogN.sgm);                        {LN}
         tBum:=t;
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
  if sgmV_<=0 then begin
     sgmV_:=sgmV_;
  end;
  { Derived from "frozen" Gauss }
  if dVdt_<0 then F:=0 else F:=F_tilde(Vsc_)/sgmV_*dVdt_*sqrt(g_g0);  // sqrt is introduced on 25.02.2017
  { From self-similar Fokker-Planck }
  A:=fA_T(-Vsc_,taum_taus)/taum_;
  { Condition to check if noise is strong enough to evoke firing }
  if not(PP.SpecCond_Item in [4,5,6])and      // if not VT(t*)
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

function LogNorm_H(U,VT,Ufr,dUdt,xmax,sgmV_,g_g0,ts_,taum_:double;
                   LN:LogNtype; PP:PopulationProperties) :double;
var V_,dVdt_,H,S,Vsc_,dx_,x_,xmin_,xmax_ :double;
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
         Vsc_:=(V_-VT)/sgmV_/sqrt(2)*sqrt(g_g0);   // sqrt is introduced on 25.02.2017
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
    i,iLN                                                             :integer;
    dro,S,SHv,Sv,Sro,Lamda,H_dt,F,sgmV_,Vsc_,dVdt,A,g0_,g_g0,taum_,
    H,V_,l_,Ufr_,uu_g0                                                :double;
begin
  g0_:=PP.NP.C_membr/PP.NP.tau_m0;
  sgmV_:=PP.sgm_V;
  { Synaptic noise is proportional to synaptic conductance sgm=a+b*ss_, where we assume also a=b; }
  if PP.If_sgm_scaled_with_s=1 then  sgmV_:=sgmV_*sqrt(1+sE+sI/g0_);  // sqrt is introduced on 25.02.2017
  { Exception for EEG-model }
  if PP.Nts=0 then begin
     if          PP.SpecCond_Item=4        then begin  // 'VT(dVdt)'
        VT[0]:=VThreshold0 (Nrn[0].NP,           0,dUdt,Nrn[0].NV.ddV, 0.100{ms});
     end else if PP.SpecCond_Item=5        then begin  // 'VT(t*), dep. block V'
        VT[0]:=VThreshold5 (Nrn[0].NP, Nrn[0].NV.V,dUdt,Nrn[0].NV.ddV, 0.100{ms});
     end else if PP.SpecCond_Item in [6,7] then begin  // 'VT(t*), dep. block G'
        VT[0]:=VThreshold8 (Nrn[0].NP, Nrn[0].NV,  dUdt,Nrn[0].NV.ddV, 0.100{ms},sE+sI);  {13.04.2016}
     end else if PP.SpecCond_Item in [8] then begin    // 'VT(t*), dep. block u'
        VT[0]:=VThreshold9 (Nrn[0].NP, Nrn[0].NV,  dUdt,Nrn[0].NV.ddV, 0.100{ms},uE+uI);  {23.06.2016}
     end else if PP.SpecCond_Item=9        then begin  // 'VT(t*)'
        VT[0]:=VThreshold10(Nrn[0].NP,           0,dUdt,Nrn[0].NV.ddV, 0.100{ms});      // introduced on 6.10.2016
     end else begin
        VT[0]:=VThreshold4 (Nrn[0].NP, dUdt,Nrn[0].NV.ddV, 0.100{ms});
     end;
     g_g0:=(PP.NP.gL+Nrn[0].NV.gActive+sE+sI)/g0_;
     nu:=0;
     FOR iLN:=1 to LogN.Nx DO BEGIN  {Introduced on 12.08.2014}
         V_  :=(U-PP.NP.Vrest)*xLN[iLN] + PP.NP.Vrest;
         dVdt:=dUdt*xLN[iLN];
         uu_g0:=(uE+uI + Iind + tt*fNMDA(Nrn[0].NV.V, PP.NP.Mg))/g0_;
         nu:=nu + EEG.Rate(V_,dVdt,g_g0,sgmV_,VT[0],LogN.sgm,
                           uu_g0,(sE+sI)/g0_, PP.NP) *PHI_dx[iLN];
     END;
//     nu:=EEG.Rate(U,dUdt,g_g0,sgmV_,VT[0],PP.NP);
     Density:=nu;
     exit;
  end;
  {*************************}
  { Threshold }
  FOR i:=PP.Nts downto 0 do begin {loop for phase}
      dVdt:=Nrn[i].NV.DVDt;
     if          PP.SpecCond_Item=4        then begin  // 'VT(dVdt)'
         VT[i]:=VThreshold0 (Nrn[i].NP,                0,dVdt,Nrn[i].NV.ddV,ts[i]);  {changed from 4 to 5 on 26.10.2015}
       //VT[i]:=VThreshold6(Nrn[i].NP,Nrn[i].NV);       {Introduced on 18.04.2011}
       //VT[i]:=VThreshold7(Nrn[i].NP,Nrn[i].NV);       {Introduced on 20.06.2011}
     end else if PP.SpecCond_Item=5        then begin  // 'VT(t*), dep. block V'
         VT[i]:=VThreshold5 (Nrn[i].NP, Nrn[PP.Nts].NV.V,dVdt,Nrn[i].NV.ddV,ts[i]);  {changed from 4 to 5 on 26.10.2015}
     end else if PP.SpecCond_Item in [6,7] then begin  // 'VT(t*), dep. block G'
         VT[i]:=VThreshold8 (Nrn[i].NP, Nrn[i].NV,       dVdt,Nrn[i].NV.ddV,ts[i],sE+sI);  {13.04.2016}
     end else if PP.SpecCond_Item in [8] then begin    // 'VT(t*), dep. block u'
         VT[i]:=VThreshold9 (Nrn[i].NP, Nrn[i].NV,       dVdt,Nrn[i].NV.ddV,ts[i],uE+uI);  {23.06.2016}
     end else if PP.SpecCond_Item=9        then begin  // 'VT(t*)'
         VT[i]:=VThreshold10(Nrn[i].NP,                0,dVdt,Nrn[i].NV.ddV,ts[i]);     // introduced on 6.10.2016
     end else begin
{}       VT[i]:=VThreshold3(Nrn[i].NP,dVdt,ts[i]);  {changed from 5 to 3 on 20.06.2011}
     end;
  END;
  {*************************}
  nu:=0;  for i:=0 to PP.Nts do Hzrd[i]:=0;   {Introduced on 24.06.2014}
  FOR iLN:=1 to LogN.Nx DO BEGIN
      S:=0; SHv:=0; Sv:=0; //Sro:=0;
      FOR i:=PP.Nts downto 0 do begin                            { loop for t* }
          g_g0:=(PP.NP.gL+Nrn[i].NV.gActive+sE+sI)/g0_;
          taum_:=PP.NP.tau_m0/g_g0;
          //Vsc_:=(Nrn[i].NV.V-PP.NP.Vrest-VT[i])/sgmV_/sqrt(2)*g_g0;
          if PP.If_Ufree_90=1 then Ufr_:=-0.090{V} else
          Ufr_:=dUfree_ts(ts[i])+Nrn[i].NP.Vrest;
          V_  :=(Nrn[i].NV.V-Ufr_)*xLN[iLN]+Ufr_-PP.NP.Vrest;
          Vsc_:=(V_-VT[i])/sgmV_/sqrt(2)*sqrt(g_g0);   // sqrt is introduced on 25.02.2017
          dVdt:=Nrn[i].NV.DVDt*xLN[iLN];
          {********************* H=F+A *********************}
          H:=H_function(Vsc_,dVdt,sgmV_,g_g0,ts[i],taum_,PP);
          {*************************************************}
          H_dt:=1-dexp(-H*dt);
          dro:=ro[i,iLN]*H_dt;
          {*************************}
          ro[i,iLN]:=ro[i,iLN] - dro;
          {*************************}
          if PP.FiniteSize>0 then begin  { Tilo Schwalger eq.(82) }
             va[i,iLN]:=va[i,iLN] - H_dt*(2*va[i,iLN]-ro[i,iLN]);   // eq.(82) from [Schwalger et al. 2017]
             SHv:=SHv + H_dt*va[i,iLN];                             // for eq.(84)
             Sv :=Sv  + va[i,iLN];                                  // for eq.(84)
          end;
          Hzrd[i]:=Hzrd[i] + dro/dt*PHI_dx[iLN];       {It was Hzrd[i]:=dro/dt before 24.06.2014}
          S:=S             + dro;
      END;
      // Commented on 10.01.2017  nu:=nu + S*PP.dts/dt*PHI_dx[iLN];
      Bum[iLN]:=Bum[iLN]+S*PP.dts;
      if PP.FiniteSize>0 then begin  { Tilo Schwalger eq.(79,84) }
         //SHv:=0; Sv:=0;
         Sro:=Bum[iLN] + ro[PP.Nts,iLN]*PP.dts;
         for i:=0 to PP.Nts-1 do begin
             Sro:=Sro+ro[i,iLN]*min(PP.dts,PP.ts_end-ts[i]);        // for eq.(79)
         end;
         if Sv>0 then begin
            Lamda:=SHv/Sv;                         // eq.(84)
            Bum[iLN]:=Bum[iLN] + Lamda*(1-Sro);    // eq.(79)
         end;
      end;
  END;
  { Norm }
  S:=0;
  for iLN:=1 to LogN.Nx do begin
      S:=S + (Bum[iLN] + ro[PP.Nts,iLN]*PP.dts)*PHI_dx[iLN];
      for i:=0 to PP.Nts-1 do  S:=S+ro[i,iLN]*min(PP.dts,PP.ts_end-ts[i])*PHI_dx[iLN];
  end;
  Norm:=S;
  {***}
  nu:=ro_at_ts(0);  // Added on 10.01.2017
  nu:=nu/Norm;
  Density:=nu;
end;

end.
