unit LIFNrnO;

interface
uses
  typeNrnParsO,t_dtO,MathMyO,ThresholdO,NeuronO;

type
{==================================================================}
  TLIFNrn = class(TNeuron)
  private
    procedure CorrectPassiveParameters;
  public
    procedure InitialConditions; override;
    procedure IfSpikeOccursInThrModel; override;
    procedure MembranePotential(uuE,ssE,uuI,ssI,tt,Iind,Vhold :double); override;
  end;

implementation

procedure TLIFNrn.CorrectPassiveParameters;
begin
  {-------------------------------}
  if NP.IfSet_gL_or_tau  =2 then begin
     NP.gL   :=NP.C_membr/NP.tau_m0;
  end else begin
     NP.tau_m0:=NP.C_membr/NP.gL;
  end;
  {-------------------------------}
  if          NP.IfSet_VL_or_Vrest=2 then begin
     NP.VL:=NP.Vrest;
  end else if NP.IfSet_VL_or_Vrest=1 then begin
     NP.Vrest:=NP.VL;
  end;
end;

procedure TLIFNrn.InitialConditions;
begin
  NV.V:=NP.Vrest;    NP.VL:=NP.Vrest;
  NV.VT_Brette:=NP.FixThr+NP.ThrShift;
  NV.EIF_w:=0;
  NV.indic:=0;
  NV.tAP:=-888; NV.Thr:=100;
  CorrectPassiveParameters;       // added on 25.02.2017
//  Read_Threshold_from_File;
end;

procedure TLIFNrn.IfSpikeOccursInThrModel;
{Defines if a spike occurs for V_.
 'indic_' = 0 - after spike
            2 - at spike}
begin
  NV.indic:=0;
  if NV.V>NP.Vrest+NV.Thr then begin
     NV.indic:=2;
     NV.tAP:=t;
     if t<>NV.tAP then NV.ISI0:=min(t-NV.tAP,t);
  end;
end;

{-----------------------------------------------------------------------}

procedure TLIFNrn.MembranePotential(uuE,ssE,uuI,ssI,tt,Iind,Vhold :double);
{  C dV/dt = - gL*(V-VL) + gL*deltaT*exp((V-VT)/deltaT) + Iind
   where VL = VL0 + A1*exp(-ts/tau1) + A2*exp(-ts/tau2), etc. }
var Isyn,Th_inf, gL_,VL_,VT_,ts_ :double;
BEGIN
  NV.Vold:=NV.V;
  NV.Thr:=VThreshold2(NP,NV.DVDt,t-NV.tAP);
  { Conditions at spike }
  IfSpikeOccursInThrModel;
  if NV.indic=2 then begin
     NV.V:=NP.Vreset;
     NV.EIF_w:=NV.EIF_w + NP.EIF_dw;
  end;
  { ---------------- EIF ---------------------------------------- }
  gL_:=NP.gL;  VL_:=NP.VL;  NV.Im:=0;  VT_:=NP.EIF_VT;
  if NP.EIF_deltaT>0 then begin
     if NP.IfSpikeDependentEIF=1 then begin
        ts_:=(t-NV.tAP)*1e3; {ms}
        VL_:=VL_+0.0498*dexp(-ts_/32.8)-0.0427*dexp(-ts_/42.9);
        gL_:=gL_*(1+50*NP.tau_m0*dexp(-ts_/20));
        VT_:=VT_+0.0184*dexp(-ts_/14);
     end;
     if NP.EIF_tauw>0 then begin    { adaptation }
        NV.EIF_w:=NV.EIF_w + dt/NP.EIF_tauw*(NP.EIF_a*(NV.V-NP.VL) - NV.EIF_w);
     end;
     NV.Im:=gL_*NP.EIF_deltaT*dexp((NV.V-VT_)/NP.EIF_deltaT) - NV.EIF_w;
  end;
  { ---------------- Currents ----------------------------------- }
  Isyn:= -(ssE+ssI)*(NV.V-Vus) + uuE+uuI;
  { ---------------- Ohm's law ---------------------------------- }
  NV.Im:=NV.Im - gL_*(NV.V-VL_) + Iind;
  NV.DVDt:=0;
  if (t>NV.tAP+NP.tau_abs)or(abs(NV.tAP)<0.001) then begin
     NV.DVDt:=1/NP.C_membr*(NV.Im+Isyn);
     {**********************}
     NV.V:=NV.V + dt*NV.DVDt;
     {**********************}
     if NV.V>NP.Vrest+NV.Thr then NV.V:=NP.Vrest+NV.Thr+0.001;
  end;
  NV.PSC:=(Isyn + NV.Im) *NP.Square*1e9; {pA}
  { Brette's dynamic threshold }
  Th_inf:=0.010{V}+NP.ThrShift + NP.dVTdV_Brette*max(0,NV.V-NP.Vrest);
  NV.VT_Brette:=NV.VT_Brette+dt/NP.tau_Brette*(Th_inf-NV.VT_Brette);
  if NV.indic=2 then  NV.VT_Brette:=NP.VTreset_Brette;
//  NV.Thr:=VThreshold2(NP,NV.DVDt,t-NV.tAP);  commented on 10.02.2011
END;

end.
