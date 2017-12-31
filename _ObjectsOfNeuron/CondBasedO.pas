unit CondBasedO;

interface
uses
  typeNrnParsO,t_dtO,MathMyO,NeuronO,ChannelO,NullChannelO,
  Calmar_NaO,Migli_NaO,Shu_NaO,White_NaO,White2_NaO,Naundorf_NaO,
  Chow_NaO,Cum_NaO,
  LyleMS_NaO,LyleMS_NaRO,Lyle_NaO,Milescu_NaO,
  Calmar_NaRO,Cum_NaRO,Migli_NaRO,Lyle_NaRO,Milescu_NaRO,Chow_NaRO,Shu_NaRO,
  Fleid_NaO,Bazh_NaO,Bazh_NaRO,Bazh_KO,
  Calmar_KO,ADPO,AHPO,
     Vervaeke_NaPO,
     Dest_KMO,Dest_KO,
     KepecsWang_KCaO,Dest_CaTO,Dest_CaHO,Dest_KCaO,
     Lyle_NaPO,
     Lyle_KO,Lyle_KAO,Lyle_KMO,Lyle_KDO,Lyle_HO,
     Migli_KO,
     Cum_KO,Cum_KAO,Cum_KDO,Cum_CaTO,Cum_CaHO,
     Chow_KO,
     Naundorf_KO,
     White_KO,White_CaO,White_AHPO,
     Shu_KO,
     DynThrO;

type
{==================================================================}
  TCondBasedNrn = class(TNeuron)
  private
  public
    chNa :TChannel;
    chK  :TChannel;
    chKA :TChannel;
    chKM :TChannel;
    chKD :TChannel;
    chH  :TChannel;
    chNaR:TChannel;
    chADP:TChannel;
    chAHP:TChannel;
    chCaH:TChannel;
    chCaT:TChannel;
    chKCa:TChannel;
    chNaP:TChannel;
    chBst:TChannel;
    DynThr :TDynThr;

    procedure CalmarNrn_Create;
    procedure DestNrn_Create;
    procedure LyleNrn_Create;
    procedure MigliNrn_Create;
    procedure CumNrn_Create;
    procedure ChowNrn_Create;
    procedure NaundorfNrn_Create;
    procedure WhiteNrn_Create;
    procedure White2Nrn_Create;
    procedure ShuNrn_Create;
    procedure BazhenovNrn_Create;
    procedure PassiveNrn_Create;
    procedure Ca_concentration(ICa:double);
    function VCa(Ca :double) :double;
    procedure CalculateActiveConductance;
    procedure InitialCanalConductances;
    procedure InitialCanalExtraConductances;
    procedure CorrectPassiveParameters;
    procedure Calc_RHP_and_g(var Active_Im_s,Active_Im_d,g :double); override;
    procedure InitialConditionsHodgkin;

    procedure InitialConditions; override;
    procedure IntegrateMembranePotential(uuE,ssE,uuI,ssI,tt,Iind,Vhold :double);
    procedure MembranePotential(uuE,ssE,uuI,ssI,tt,Iind,Vhold :double); override;

    constructor Create(NP :NeuronProperties);
  end;

implementation

constructor TCondBasedNrn.Create(NP :NeuronProperties);
begin
  inherited Create(NP);
  IF NP.IfThrModel=1 THEN BEGIN
     chNa:=TNullChannel.Create;
     chNaR:=TNullChannel.Create;
     DynThr:=TDynThr.Create;
  END ELSE BEGIN
     { Na }
     if      NP.Na_type='Calmar'   then  chNa:=TCalmarNa.Create(self)
     else if NP.Na_type='Cummins'  then  chNa:=TCumNa.Create(self)
     else if NP.Na_type='Migliore' then  chNa:=TMigliNa.Create(self)
     else if NP.Na_type='Lyle'     then  chNa:=TLyleNa.Create(self)
     else if NP.Na_type='LyleMS'   then  chNa:=TLyleMSNa.Create(self)
     else if NP.Na_type='Milescu'  then  chNa:=TMilescuNa.Create(self)
     else if NP.Na_type='Chow'     then  chNa:=TChowNa.Create(self)
     else if NP.Na_type='Shu'      then  chNa:=TShuNa.Create(self)
     else if NP.Na_type='Naundorf' then  chNa:=TNaundorfNa.Create(self)
     else if NP.Na_type='White'    then  chNa:=TWhiteNa.Create(self)
     else if NP.Na_type='White2'   then  chNa:=TWhite2Na.Create(self)
     else if NP.Na_type='Fleid'    then  chNa:=TFleidNa.Create(self)
     else if NP.Na_type='Bazhenov' then  chNa:=TBazhNa.Create(self)
     else                                chNa:=TNullChannel.Create;
     { NaR }
     if      NP.NaR_type='Calmar'   then  chNaR:=TCalmarNaR.Create(self)
     else if NP.NaR_type='Cummins'  then  chNaR:=TCumNaR.Create(self)
     else if NP.NaR_type='Migliore' then  chNaR:=TMigliNaR.Create(self)
     else if NP.NaR_type='Lyle'     then  chNaR:=TLyleNaR.Create(self)
     else if NP.NaR_type='LyleMS'   then  chNaR:=TLyleMSNaR.Create(self)
     else if NP.NaR_type='Milescu'  then  chNaR:=TMilescuNaR.Create(self)
     else if NP.NaR_type='Chow'     then  chNaR:=TChowNaR.Create(self)
     else if NP.NaR_type='Shu'      then  chNaR:=TShuNaR.Create(self)
     else if NP.NaR_type='Bazhenov' then  chNaR:=TBazhNaR.Create(self)
     else                                 chNaR:=TNullChannel.Create;
  END;
  if      NP.HH_type='Calmar'   then CalmarNrn_Create
  else if NP.HH_type='Destexhe' then DestNrn_Create
  else if NP.HH_type='Lyle'     then LyleNrn_Create
  else if NP.HH_type='Migliore' then MigliNrn_Create
  else if NP.HH_type='Cummins'  then CumNrn_Create
  else if NP.HH_type='Chow'     then ChowNrn_Create
  else if NP.HH_type='Naundorf' then NaundorfNrn_Create
  else if NP.HH_type='White'    then WhiteNrn_Create
  else if NP.HH_type='White2'   then White2Nrn_Create
  else if NP.HH_type='Shu'      then ShuNrn_Create
  else if NP.HH_type='Bazhenov' then BazhenovNrn_Create
  else if NP.HH_type='Passive'  then PassiveNrn_Create;
end;

procedure TCondBasedNrn.CalmarNrn_Create;
begin
  chK  :=TCalmarK.Create(self);
  chKA :=TNullChannel.Create;
  chKM :=TNullChannel.Create;
  chKD :=TNullChannel.Create;
  chH  :=TNullChannel.Create;
  chADP:=TADP.Create(self);
  chAHP:=TAHP.Create(self);
  chCaH:=TNullChannel.Create;
  chCaT:=TNullChannel.Create;
  chKCa:=TNullChannel.Create;
  chNaP:=TVervaekeNaP.Create(self);      {Turned on 10.07.2012}
  chBst:=TNullChannel.Create;
end;

procedure TCondBasedNrn.DestNrn_Create;
begin
  chK  :=TDestexheK.Create(self);
  chKA :=TLyleKA.Create(self);
  chKM :=TDestexheKM.Create(self);
  chKD :=TNullChannel.Create;
  chH  :=TNullChannel.Create;
  chADP:=TADP.Create(self);
  chAHP:=TAHP.Create(self);
  chCaH:=TDestexheCaH.Create(self);  {Turned on 12.03.2011}
  chCaT:=TDestexheCaT.Create(self);  {Turned on 12.03.2011}
  chKCa:=TDestexheKCa.Create(self);// TKepecsKCa.Create(self); changed on 12.03.2011}
  chNaP:=TVervaekeNaP.Create(self);      {Turned on 10.07.2012}
  chBst:=TNullChannel.Create;
end;

procedure TCondBasedNrn.LyleNrn_Create;
begin
  chK  :=TLyleK{TShuK}.Create(self);
  chKA :=TLyleKA.Create(self);
  chKM :=TLyleKM.Create(self);
  chKD :=TLyleKD.Create(self);
  chH  :=TLyleH.Create(self);
  chADP:=TADP.Create(self);
  chAHP:=TAHP.Create(self);
  chCaH:=TDestexheCaH.Create(self);  {Turned on 12.03.2011}
  chCaT:=TDestexheCaT.Create(self);  {Turned on 12.03.2011}
  chKCa:=TDestexheKCa.Create(self);  {Turned on 12.03.2011}
  //chNaP:=TLyleNaP.Create(self);      {Turned on 12.03.2011}
  chNaP:=TVervaekeNaP.Create(self);      {Turned on 10.07.2012}
  chBst:=TNullChannel.Create;
end;

procedure TCondBasedNrn.MigliNrn_Create;
begin
  chK  :=TMigliK.Create(self);
  chKA :=TLyleKA.Create(self);
  chKM :=TLyleKM.Create(self);
  chKD :=TLyleKD.Create(self);
  chH  :=TLyleH.Create(self);
  chADP:=TADP.Create(self);
  chAHP:=TAHP.Create(self);
  chCaH:=TDestexheCaH.Create(self);  {Turned on 12.03.2011}
  chCaT:=TDestexheCaT.Create(self);  {Turned on 12.03.2011}
  chKCa:=TDestexheKCa.Create(self);  {Turned on 12.03.2011}
//  chNaP:=TLyleNaP.Create(self);      {Turned on 12.03.2011}
  chNaP:=TVervaekeNaP.Create(self);      {Turned on 10.07.2012}
  chBst:=TNullChannel.Create;
end;

procedure TCondBasedNrn.CumNrn_Create;
begin
  chK  :=TCumK.Create(self);
  chKA :=TCumKA.Create(self);
  chKM :=TNullChannel.Create;
  chKD :=TCumKD.Create(self);
  chH  :=TNullChannel.Create;
  chADP:=TADP.Create(self);
  chAHP:=TAHP.Create(self);
  chCaH:=TCumCaH.Create(self);
  chCaT:=TCumCaT.Create(self);
  chKCa:=TNullChannel.Create;
  chNaP:=TNullChannel.Create;
  chBst:=TNullChannel.Create;
end;

procedure TCondBasedNrn.ChowNrn_Create;
begin
  chK  :=TChowK.Create(self);
  chKA :=TNullChannel.Create;
  chKM :=TNullChannel.Create;
  chKD :=TNullChannel.Create;
  chH  :=TNullChannel.Create;
  chADP:=TNullChannel.Create;
  chAHP:=TAHP.Create(self);           {Turned on 24.12.2012}
  chCaH:=TNullChannel.Create;
  chCaT:=TNullChannel.Create;
  chKCa:=TNullChannel.Create;
  chNaP:=TVervaekeNaP.Create(self);      {Turned on 10.07.2012}
  chBst:=TNullChannel.Create;
end;

procedure TCondBasedNrn.NaundorfNrn_Create;
begin
  chK  :=TNaundorfK.Create(self);
  chKA :=TNullChannel.Create;
  chKM :=TNullChannel.Create;
  chKD :=TNullChannel.Create;
  chH  :=TNullChannel.Create;
  chADP:=TNullChannel.Create;
  chAHP:=TAHP.Create(self);
  chCaH:=TNullChannel.Create;
  chCaT:=TNullChannel.Create;
  chKCa:=TNullChannel.Create;
  chNaP:=TNullChannel.Create;
  chBst:=TNullChannel.Create;
end;

procedure TCondBasedNrn.WhiteNrn_Create;
begin
  chK  :=TWhiteK.Create(self);
  chKA :=TNullChannel.Create;
  chKM :=TNullChannel.Create;
  chKD :=TNullChannel.Create;
  chH  :=TNullChannel.Create;
  chADP:=TNullChannel.Create;
  chAHP:=TWhiteAHP.Create(self);
  chCaH:=TWhiteCa.Create(self);
  chCaT:=TNullChannel.Create;
  chKCa:=TNullChannel.Create;
  chNaP:=TVervaekeNaP.Create(self);      {Turned on 10.07.2012}
  chBst:=TNullChannel.Create;
end;

procedure TCondBasedNrn.White2Nrn_Create; {Turned on 5.12.2013}
begin
  chNa :=TWhite2Na.Create(self);
  chK  :=TNullChannel.Create;
  chKA :=TNullChannel.Create;
  chKM :=TNullChannel.Create;
  chKD :=TNullChannel.Create;
  chH  :=TNullChannel.Create;
  chADP:=TNullChannel.Create;
  chAHP:=TNullChannel.Create;
  chCaH:=TNullChannel.Create;
  chCaT:=TNullChannel.Create;
  chKCa:=TNullChannel.Create;
  chNaP:=TNullChannel.Create;
  chBst:=TNullChannel.Create;
end;

procedure TCondBasedNrn.ShuNrn_Create;
begin
  chK  :=TShuK.Create(self);
  chKA :=TNullChannel.Create;
  chKM :=TLyleKM.Create(self);
  chKD :=TNullChannel.Create;
  chH  :=TNullChannel.Create;
  chADP:=TNullChannel.Create;
  chAHP:=TAHP.Create(self);
  chCaH:=TNullChannel.Create;
  chCaT:=TNullChannel.Create;
  chKCa:=TNullChannel.Create;
  chNaP:=TNullChannel.Create;
  chBst:=TNullChannel.Create;
end;

procedure TCondBasedNrn.BazhenovNrn_Create;
begin
  chK  :=TBazhK.Create(self);
  chKA :=TLyleKA.Create(self);
  chKM :=TLyleKM.Create(self);
  chKD :=TLyleKD.Create(self);
  chH  :=TLyleH.Create(self);
  chADP:=TADP.Create(self);
  chAHP:=TAHP.Create(self);
  chCaH:=TDestexheCaH.Create(self);
  chCaT:=TDestexheCaT.Create(self);
  chKCa:=TDestexheKCa.Create(self);
  chNaP:=TVervaekeNaP.Create(self);
  chBst:=TNullChannel.Create;
end;

procedure TCondBasedNrn.PassiveNrn_Create;
begin
  chK  :=TNullChannel.Create;
  chKA :=TNullChannel.Create;
  chKM :=TLyleKM.Create(self);
  chKD :=TNullChannel.Create;
  chH  :=TNullChannel.Create;
  chADP:=TADP.Create(self);
  chAHP:=TAHP.Create(self);
  chCaH:=TNullChannel.Create;
  chCaT:=TNullChannel.Create;
  chKCa:=TNullChannel.Create;
  chNaP:=TNullChannel.Create;
  chBst:=TNullChannel.Create;
end;

{*********************************************************************}
{*********************************************************************}
{*********************************************************************}

function TCondBasedNrn.VCa(Ca :double) :double;
var x :double;
begin
  Ca:=max(Ca,NP.Ca8);
  x:=NP.Rgas*NP.Temperature/2/NP.Faraday*ln(NP.Ca0/Ca);
  VCa:=x{0.120} {V};
end;

procedure TCondBasedNrn.Ca_concentration(ICa:double);
begin
  NV.Ca:=NV.Ca + dt*(-ICa/2/NP.Faraday/NP.d_Ca*1e3
                 - (NV.Ca-NP.Ca8)/NP.tauCa); {mM=mmol/m^3}
end;

{*********************************************************************}

procedure TCondBasedNrn.CalculateActiveConductance;
var  gNaR_,gNa_,gK_,gKM_,gKA_,gKD_,gH_,
     gCaH_,gKCa_,gADP_,gAHP_,gCaT_,gBst_,gNaP_        :double;
begin
  gNa_ :=NP.gNa *chNa. Conductance(NV.mm,  NV.hh,   NV.ii);
  gK_  :=NP.gK  *chK.  Conductance(NV.nn,  NV.yK,    0);
  gKA_ :=NP.gKA *chKA. Conductance(NV.nA,  NV.lA,    0);
  gKM_ :=NP.gKM *chKM. Conductance(NV.nM,  0,        0);
  gKD_ :=NP.gKD *chKD. Conductance(NV.xD,  NV.yD,    0);
  gH_  :=NP.gH  *chH.  Conductance(NV.yH,  0,        0);
  gNaR_:=NP.gNaR*chNaR.Conductance(NV.mmR, NV.hhR,  NV.iiR);
  gADP_:=NP.gADP*chADP.Conductance(NV.wADP,0,        0);
  gAHP_:=NP.gAHP*chAHP.Conductance(NV.wAHP,0,        0);
  gCaH_:=NP.gCaH*chCaH.Conductance(NV.mCaH,NV.hCaH, NV.kCaH);
  gCaT_:=NP.gCaT*chCaT.Conductance(NV.mCaT,NV.hCaT,  0);
  gKCa_:=NP.gKCa*chKCa.Conductance(NV.nKCa,0,     0);
  gNaP_:=NP.gNaP*chNaP.Conductance(NV.mNaP,0,     0);
  gBst_:=NP.gBst*chBst.Conductance(NV.mBst,0,     0);
  NV.gActiveDend:=0;
  if (NP.HH_order='2-p-ActiveDend') then begin
      NV.gActive:= gNaR_ +gNa_{+ss[ie]} +gK_          +gKA_  +gKD_ +gH_
                  +gCaH_ +gKCa_ + gADP_        +gCaT_ +gBst_ +gNaP_; {mS/cm^2}
      NV.gActiveDend:=                   gAHP_ +gKM_;                {mS/cm^2}
  end else begin
      NV.gActive:= gNaR_ +gNa_{+ss[ie]} +gK_   +gKM_  +gKA_  +gKD_ +gH_
                  +gCaH_ +gKCa_ + gADP_ +gAHP_ +gCaT_ +gBst_ +gNaP_; {mS/cm^2}
  end;
end;


{********************************************************************}
procedure TCondBasedNrn.InitialCanalConductances ;
var
     v2,a,b,ICaH,m2     :double;
     s                  :string;
begin
  chNa. Init;
  chK.  Init;
  chKA. Init;
  chKM. Init;
  chKD. Init;
  chH.  Init;
  chNaR.Init;
  chADP.Init;
  chAHP.Init;
  chCaH.Init;
  chCaT.Init;
  chKCa.Init;
  chNaP.Init;
  chBst.Init;
  if NP.IfThrModel=1 then DynThr.Init(NP); 
end;

procedure TCondBasedNrn.InitialCanalExtraConductances ;
var
     v2,a,b,ICaH,tau_w :double;
begin
      NV.Ca:=NP.Ca8;
      { Other conductances ---------------- }
      chCaH.Init;
      ICaH:=chCaH.Current;
      { Ca-concentration }
      NV.Ca:=NP.Ca8 - NP.tauCa*ICaH/2/NP.Faraday/NP.d_Ca*1e3; {mM=mmol/m^3}
end;

procedure TCondBasedNrn.Calc_RHP_and_g(var Active_Im_s,Active_Im_d,g :double);
//var  INaR,INa,IK,IKM,IKA,IKD,ICaH,IKCa,IADP,IAHP,ICaT,IBst,INaP,IH :double;
begin
      NV.INa :=chNa. Current;
      NV.IK  :=chK.  Current;
      NV.IKA :=chKA. Current;
      NV.IKM :=chKM. Current;
      NV.IKD :=chKD. Current;
      NV.IH  :=chH.  Current;
      NV.INaR:=chNaR.Current;
      NV.IADP:=chADP.Current;
      NV.IAHP:=chAHP.Current;
      NV.ICaH:=chCaH.Current;
      NV.ICaT:=chCaT.Current;
      Ca_concentration(NV.ICaT+NV.ICaH);
      NV.IKCa:=chKCa.Current;
      NV.INaP:=chNaP.Current;
      NV.IBst:=chBst.Current;
      NV.I_leak:=NP.gL*(NV.V-NP.VL)*(1-NP.IfBlockPass);
      {***}
      if (NP.HH_order='2-p-ActiveDend') then begin
          NV.IK_tot   :=NV.IK+NV.IKA+NV.IKD+NV.IKCa + NV.I_leak
                       + NP.ro*(NV.IKM+NV.IAHP);
          Active_Im_s := -NV.INaR -NV.INa -NV.IK{-NV.IKM}-NV.IKA -NV.IKD
                         -NV.ICaH -NV.IKCa -NV.IH
                         -NV.IADP{-NV.IAHP}-NV.ICaT -NV.IBst -NV.INaP;
          Active_Im_d :=       -NV.IKM-NV.IAHP;
      end else begin
          NV.IK_tot   :=NV.IK+NV.IKA+NV.IKD+NV.IKCa + NV.I_leak
                       +        NV.IKM+NV.IAHP;
          Active_Im_s := -NV.INaR -NV.INa -NV.IK -NV.IKM -NV.IKA -NV.IKD
                         -NV.ICaH -NV.IKCa -NV.IH
                         -NV.IADP -NV.IAHP -NV.ICaT -NV.IBst -NV.INaP;
          Active_Im_d :=0;
      end;
      CalculateActiveConductance;
      g:=NV.gActive;
end;

procedure TCondBasedNrn.CorrectPassiveParameters;
{ see p.148 }
var  RHP,Active_Im_d,g      :double;
     i                      :integer;
begin
  Calc_RHP_and_g(RHP,Active_Im_d,g);
  {-------------------------------}
  if NP.IfSet_gL_or_tau  =2 then begin
     NP.gL   :=NP.C_membr/NP.tau_m0 - g;
  end else begin
     NP.tau_m0:=NP.C_membr/(g+NP.gL)
  end;
  {-------------------------------}
  if          NP.IfSet_VL_or_Vrest=2 then begin
     NP.VL:=NP.Vrest - RHP/NP.gL
  end else if NP.IfSet_VL_or_Vrest=1 then begin
     i:=0;
{     repeat i:=i+1;
       NV.V:=NP.Vrest;
       InitialCanalExtraConductances;
       InitialCanalConductances;
       Calc_RHP_and_g(RHP,g);
       NP.Vrest:=NP.Vrest + dt/NP.C_membr*(RHP-NP.gL*(NP.Vrest-NP.VL));
       if NP.IfSet_gL_or_tau  =2 then  NP.gL    :=NP.C_membr/NP.tau_m0 - g
                                 else  NP.tau_m0:=NP.C_membr/(g+NP.gL);
     until ((abs(NV.V-NP.Vrest)<0.0000001)and(i>1000)) or (i=10000);
     NV.V:=NP.Vrest;}
     NV.V:=NP.Vrest;
     repeat i:=i+1;
       NP.Vrest:=NV.V;
       IntegrateMembranePotential(0,0,0,0,0,0,0);
     until ((abs(NV.V-NP.Vrest)<0.0000001)and(i>1000)) or (i=10000);
  end;   { if IfSet_VL_or_Vrest=3 then Vrest is not a steady-state }
  Calc_RHP_and_g(RHP,Active_Im_d,g);               // added on 18.08.2014
end;

procedure TCondBasedNrn.InitialConditionsHodgkin;
begin
  NP.FRT:=NP.Faraday/NP.Rgas/NP.Temperature/1000;
  { Blockage of Na-channels }
  if NP.IfThrModel=1 then  NP.IfBlockNa:=1;
  { Voltage-gated canals and passive parameters ---------------}
  InitialCanalExtraConductances;
  InitialCanalConductances;
  CorrectPassiveParameters;   {! depend on ss}
end;

procedure TCondBasedNrn.InitialConditions;
begin
  NV.V:=NP.Vrest;  NV.Vd:=NP.Vrest; NV.DVDt:=0;
  NV.VT_Brette:=0.010{V}+NP.ThrShift;
  NV.IsynE:=0; NV.Ca:=NP.Ca8;
  NV.indic:=0;
  NV.tAP:=-888; NV.Thr:=100;
  InitialConditionsHodgkin;
  NV.Vold:=NV.V;
//  Read_Threshold_from_File;
end;

{-----------------------------------------------------------------------}

procedure TCondBasedNrn.IntegrateMembranePotential(uuE,ssE,uuI,ssI,tt,Iind,Vhold :double);
var
     indic_                       :integer;
     DVDt_old,Th_inf,
     DIsynE,V_d,V_0,gs,gd,
     Active_Im_s,Active_Im_d,g_,
     dVd,dV0,I_dend_to_soma       :double;
     Status                       :string;
BEGIN
  NV.Vold:=NV.V;
  DVDt_old:=NV.DVDt;
  { ---------------- Currents ----------------------------------- }
  Calc_RHP_and_g(Active_Im_s,Active_Im_d,g_);
  NV.Im:= Active_Im_s - NV.I_leak + Iind;
  NV.Im_s:=NV.Im;
  NV.Im_d:=Active_Im_d; 
  { ---------------- Ohm's law -------------------------------------- }
  if          NP.HH_order='1-point'  then begin
      NV.gNMDA:= tt*fNMDA(NV.V,   NP.Mg);
      NV.Isyn:= -(ssE+ssI)*(NV.V-Vus) + uuE+uuI - NV.gNMDA*(NV.V-NP.VNMDA);
      I_dend_to_soma:=0;
      {----------}
      NV.DVDt:=1/NP.C_membr*(NV.Im+NV.Isyn);
      NV.V:=NV.V + dt*NV.DVDt;
      {----------}
  end else if (NP.HH_order='2-points')or(NP.HH_order='2-p-ActiveDend') then begin   {see p.137}
      gs:=NP.C_membr/NP.tau_m0;
      gd:=gs*NP.ro;
      NV.IsynE_old:=NV.IsynE;
      NV.IsynI_old:=NV.IsynI;
      V_0:=NV.V;  V_d:=NV.Vd;
      { Predictor-Corrector for dX/dt=F(X):  X'=X+1/2*dt*F(X), X=X+dt*F(X'). }
      if NP.IfPredictorCorrector=1 then Status:='Predictor' else Status:='';
      repeat
        if NP.If_NMDA_on_dendrite=1 then NV.gNMDA:= tt*fNMDA(NV.Vd,NP.Mg)
                                    else NV.gNMDA:= tt*fNMDA(NV.V, NP.Mg);
//22.03.2013        NV.Isyn:= -(ssE+ssI)*(NV.V-Vus) + uuE+uuI - NV.gNMDA*(NV.V-NP.VNMDA);
        {NV.IsynE_old:=NV.IsynE;
        NV.IsynE:=Isyn;  NV.IsynI:=0;
        DIsynE:=(NV.IsynE-NV.IsynE_old)/dt;
        IatE:=1/2*NP.tau_m*DIsynE + 3/2*NV.IsynE;
        V_0:=NV.V;  V_d:=NV.Vd;
        gs:=NP.C_membr/NP.tau_m;
        gdE:=gs*NP.ro;
        NV.Vd:=V_d + dt/NP.tau_m*(-(V_d  -NP.Vrest)
                     - (2+gdE/gs)*(V_d -V_0)
                     + 2/gdE*IatE -NV.IsynI/gs);
        NV.V   :=NV.V   + dt/NP.tau_m*(
                     +    gdE/gs *(V_d -V_0)
                     +  NV.Im/gs+NV.IsynI/gs);}
        NV.IsynE:=-ssE*(NV.V-Vus) + uuE - NV.gNMDA*(NV.V-NP.VNMDA);
        NV.IsynI:=-ssI*(NV.V-Vus) + uuI;
        NV.Isyn:=NV.IsynI;                     {introduced on 22.03.2013}
        DIsynE:=(NV.IsynE-NV.IsynE_old)/dt;
        if NV.IsynE_old=0 then DIsynE:=0;      {introduced on 06.04.2013}
        NV.IatE:=1/2*NP.l*NP.tau_m0*DIsynE + (1+NP.l/2)*NV.IsynE;
        I_dend_to_soma:=NV.IsynE;//gdE*(NV.Vd -NV.V); {moved and changed on 22.03.2013}
        {----------}
        dVd := dt/NP.tau_m0*(-(NV.Vd -NP.Vrest)
                 - (2{+gdE/gs})/NP.l*(NV.Vd -NV.V)            + {2*}NV.IatE/gd    {commented here and below on 28.12.2013; Vd is now V_1/2}
                             {-(NV.V    -NP.Vrest)  - NV.Im/gs -    NV.IsynI/gs}  {introduced on 7.10.2013}
                                                   + NV.Im_d/gd               );  {introduced on 9.06.2015}
        {----------}
        dV0 := dt/NP.tau_m0*(
                     2{!}*gd/gs/NP.l*(NV.Vd -NV.V) + NV.Im_s/gs +   NV.IsynI/gs); {introduced on 30.12.2013}
        {----------}
        NV.Vd:=V_d + dVd;
        NV.V :=V_0 + dV0;
        if Status='Predictor' then begin
           NV.Vd:=(NV.Vd+V_d)/2;
           NV.V :=(NV.V +V_0)/2;
           If NP.If_I_V_or_g in [1,3,5] then  NV.V:=Vhold; {added on 22.03.2013, 6.11.2013}
           Status:='Corrector';
        end else Status:='End';
      until Status='End';
  end else if NP.HH_order='2-p-MainenSejn' then begin
      NV.IsynE_old:=NV.IsynE;
      NV.IsynI_old:=NV.IsynI;
      V_0:=NV.V;  V_d:=NV.Vd;
      { Predictor-Corrector for dX/dt=F(X):  X'=X+1/2*dt*F(X), X=X+dt*F(X'). }
      if NP.IfPredictorCorrector=1 then Status:='Predictor' else Status:='';
      repeat
        if NP.If_NMDA_on_dendrite=1 then NV.gNMDA:= tt*fNMDA(NV.Vd,NP.Mg)
                                    else NV.gNMDA:= tt*fNMDA(NV.V, NP.Mg);
        NV.IsynE:=-ssE*(NV.V-Vus) + uuE - NV.gNMDA*(NV.V-NP.VNMDA);
        NV.IsynI:=-ssI*(NV.V-Vus) + uuI;
        NV.Isyn:=NV.IsynE+NV.IsynI;
        {----------}
        NV.Vd:=V_d + dt/NP.C_membr*( -NP.gLd*(NV.Vd-NP.VLd)
                              -2/NP.l*NP.gLd*(NV.Vd-NV.V) + NV.IsynE + NV.IsynI
                                                                  - NP.NaKpumpD);
        {----------}
        NV.V :=NV.V+ 0.2*(2/NP.l*NP.gL*NP.ro*(NV.Vd-NV.V) + NV.Im - NP.NaKpumpS)
                        /(2/NP.l*NP.gL*NP.ro              + NP.gL + NV.gActive);
//        NV.V :=(NP.gL*NP.VL + 2/NP.l*NP.gL*NP.ro*NV.Vd + Active_Im_s + Iind
//                                                       - NP.NaKpumpS)
//              /(NP.gL       + 2/NP.l*NP.gL*NP.ro);
        {----------}
        if Status='Predictor' then begin
           NV.Vd:=(NV.Vd+V_d)/2;
           NV.V :=(NV.V +V_0)/2;
           If NP.If_I_V_or_g in [1,3,5] then  NV.V:=Vhold;
           Status:='Corrector';
        end else Status:='End';  
      until Status='End';
  end;
  If NP.If_I_V_or_g in [1,3,5] then  NV.V:=Vhold;
  NV.DVDt:=(NV.V-NV.Vold)/dt;
  NV.ddV:=(NV.DVDt-DVDt_old)/dt;
  NV.PSC:=-(NV.Isyn + NV.Im_s + I_dend_to_soma - NP.C_membr*NV.DVDt)*NP.Square*1e9; {pA}
  NV.Iind:=Iind*NP.Square*1e9; {pA}
  //CalculateActiveConductance;
  { Brette's dynamic threshold }
  Th_inf:=0.010{V}+NP.ThrShift + NP.dVTdV_Brette*max(0,NV.V-NP.Vrest);
  NV.VT_Brette:=NV.VT_Brette+dt/NP.tau_Brette*(Th_inf-NV.VT_Brette);
END;

procedure TCondBasedNrn.MembranePotential(uuE,ssE,uuI,ssI,tt,Iind,Vhold :double);
BEGIN
  IntegrateMembranePotential(uuE,ssE,uuI,ssI,tt,Iind,Vhold);
END;

end.
