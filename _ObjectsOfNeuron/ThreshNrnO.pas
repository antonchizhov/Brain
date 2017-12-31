unit ThreshNrnO;

interface
uses
     typeNrnParsO,t_dtO,MathMyO,ThresholdO,NeuronO,CondBasedO,
     Lyle_NaO,Lyle_KO,Lyle_KAO,Lyle_KMO,Lyle_KDO,Lyle_HO,Lyle_NaRO,Lyle_NaPO,
     ADPO,AHPO,NullChannelO,
     Cum_NaO,Cum_NaRO,Cum_KO,Cum_KAO,Cum_KDO,Cum_CaTO,Cum_CaHO,
     Chow_NaO,Chow_NaRO,Chow_KO,
     Shu_NaO,Shu_NaRO,Shu_KO,
     White_NaO,White_KO,White_CaO,White_AHPO,
     White2_NaO,
     Calmar_NaO,Calmar_KO,Calmar_NaRO,
     Dest_KMO,Dest_KO,KepecsWang_KCaO,Dest_CaTO,Dest_CaHO,Dest_KCaO,
     Migli_NaO,Migli_NaRO,Migli_KO,
     Milescu_NaRO,
     Naundorf_NaO,Naundorf_KO;
const
  mMax=15;
type
{==================================================================}
  TThreshNrn = class(TCondBasedNrn)
  private
  public
    constructor Create(NP :NeuronProperties);
    procedure ConditionsAtSpike(sinceAP :double); override;
    procedure IfSpikeOccursInThrModel; override;
    procedure MembranePotential(uuE,ssE,uuI,ssI,tt,Iind,Vhold :double); override;
  end;


implementation

{-----------------------------------------------------------------------}

constructor TThreshNrn.Create(NP :NeuronProperties);
begin
inherited Create(NP);
@NP.IfSpikeOccursInThrModel:=nil;//@TThreshNrn.IfSpikeOccursInThrModel2;
end;

procedure TThreshNrn.ConditionsAtSpike(sinceAP :double);
begin
     //if NP.HH_type='Passive' then
     NV.V:=NP.Vreset;
     //                        else  NV.V:=-0.040;
     NV.Vd:=NP.Vd_reset;
     { Brette's dynamic threshold }
     NV.VT_Brette:=NP.VTreset_Brette;
     NV.DVDt:=0;   NV.ddV:=0;
     NV.IsynE:=0;  NV.IsynI:=0;
     NV.nn:=NP.n_AP;  NV.yK:=NP.yK_AP; NV.nA:=NP.nA_AP; NV.lA:=NP.lA_AP;
     NV.yH:=NP.yH_AP; NV.xD:=NP.xD_AP;
//     NV.hh  :=0.01; //commented on 20.09.2012
     {if round(sinceAP/dt)=1 then} NV.wADP:=NV.wADP + NP.dwADP*(1-NV.wADP);
     {if round(sinceAP/dt)=1 then} NV.wAHP:=NV.wAHP + NP.dwAHP*(1-NV.wAHP);
     {if round(sinceAP/dt)=1 then} NV.nM  :=NV.nM   + NP.dnM  *(1-NV.nM);//+ 0.155;
     {if round(sinceAP/dt)=1 then} NV.yD  :=NV.yD   + NP.dyD  *NV.yD;
     {if round(sinceAP/dt)=1 then} NV.ii  :=NV.ii   + NP.dii  *NV.ii;
     DynThr.ConditionAtSpike;
end;

procedure TThreshNrn.IfSpikeOccursInThrModel;
{Defines if a spike occurs for V_.
 'indic_' = 0 - after spike
            2 - at spike}
begin
  { if another procedure specified, for instance, for population }
  if @NP.IfSpikeOccursInThrModel<>nil then begin
     NP.IfSpikeOccursInThrModel;
     exit;
  end;
  if NV.indic=2 then NV.indic:=0;  { after spike }
  if (NV.V>NP.Vrest+NV.Thr) then begin
     if (NP.HH_type='Passive')or
        (((t-NV.tAP>NP.dT_AP)and(NV.ddV<1000{V/s^2}))or(t=NV.tAP)) then begin { at spike }
        NV.indic:=2;
        if t<>NV.tAP then NV.ISI0:=min(t-NV.tAP,t);
        NV.tAP:=t;
        ConditionsAtSpike(0);
     end;
  end;
end;

procedure TThreshNrn.MembranePotential(uuE,ssE,uuI,ssI,tt,Iind,Vhold :double);
var  sinceAP,tAP_,g_tot_ :double;
BEGIN
  sinceAP:=t-NV.tAP;
  { Conditions at spike }
  IF sinceAP<=NP.dT_AP THEN BEGIN
//     ConditionsAtSpike(sinceAP);
  END ELSE BEGIN
     IntegrateMembranePotential(uuE,ssE,uuI,ssI,tt,Iind,Vhold);
  END;
  { Threshold model }
  if (NP.Thr_type='Default-2')     then NV.Thr:=VThreshold2(NP,NV.DVDt,t-NV.tAP);
  if (NP.Thr_type='Brette thr.-6') then NV.Thr:=VThreshold6(NP,NV);
  if (NP.Thr_type='Brette thr.-7') then NV.Thr:=VThreshold7(NP,NV); {introduced on 20.06.2011}
  if (NP.Thr_type='Dyn. thr.-2')and(sinceAP>NP.dT_AP) then begin
      NV.Thr:=VThreshold2(NP,NV.DVDt,t-NV.tAP);
      g_tot_:=NV.gActive+NV.gActiveDend+NP.gL+ssE+ssI;
      NV.Thr:=DynThr.Evolve(NV.V*1000,NV.DVDt,g_tot_,NP.DepBlock_limit)-NP.Vrest;
  end;
  if (NP.Thr_type='Dyn. thr.-8')   then NV.Thr:=VThreshold8(NP,NV,NV.DVDt,NV.ddV,t-NV.tAP,ssE+ssI);
  { Turn on cooperativity }
  if (NP.KJ_NaCooperativity<>0)and(t-NV.tAP>0) then begin
      tAP_:=NV.tAP; if NV.tAP<0 then tAP_:=0;
      NV.Thr:=min(0.1,NP.KJ_NaCooperativity/(t-tAP_)/1e6);
  end;
//  NV.Thr:=NV.Thr+NP.KJ_NaCooperativity*(NV.wAHP-0.1)/1e3;
  IfSpikeOccursInThrModel;
END;

end.
