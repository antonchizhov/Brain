unit AnalysisO;

interface
uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls,TeEngine,Math,
     Init,t_dtO,CreateNrnO,MathMyO,typeNrnParsO,NeuronO,EEGO,MappingsO,
     Unit22,Unit4;

function nu_I_s(I_{pA},s_gL,t_end_ :double) :double;
procedure Plot_nu_IindO;

implementation

var
    IIspike
                  :integer;
    freq,Vpeak,t_start_count_,t_end_,VSpikeCrit
                  :double;
    IfNoise :boolean;
    NV0                                           :NeuronVariables;
    ISI                                           :vect;
    ANrnF                                         :TNeuron;


function TimeFromThePeak(V0,V1,V2 :double; var Vpeak :double) :double;
{ V0,V1,V2 are values corresponding to moments 0,-dt,-2*dt }
var  b,tp :double;
begin
  TimeFromThePeak:=0;
  if (V1>V0)and(V1>V2) then begin
      tp:=-dt/2*((V2-V0)-(V1-V0)*4)/((V2-V0)-(V1-V0)*2);
      b:= ((V2-V0)-(V1-V0)*4)/2/dt;
      Vpeak:=V0+b/2*tp;
      TimeFromThePeak:=tp;
  end;
end;

procedure IfSpikeOccursO(ANrn :TNeuron);
{Defines if a spike occurs for V_.
 'indic_' = 0 - after spike
            1 - on ascending way
            2 - at spike               }
var t_peak,Vprev_,Vpprev_ :double;
begin
  WITH ANrn DO BEGIN
    IF (NP.IfThrModel=1)or(NP.IfLIF=1) THEN BEGIN
//       ANrn.IfSpikeOccursInThrModel;
       ISI[0]:=NV.ISI0;
       exit;
    END;
    if (NV.indic=2)or(t<NV.tAP+0.001) then NV.indic:=0;  { after spike }
    if NV.V>VSpikeCrit then begin
       { Find local maximum }
       Vprev_:=NV.V-NV.dVdt*dt;
       Vpprev_:=dt*dt*NV.ddV-NV.V+2*Vprev_;
       if NV.V>Vprev_ then begin
          NV.indic:=1;            { on ascending way }
       end else begin
           if NV.indic=1 then begin
              NV.indic:=2;        { at spike }
              t_peak:=t+TimeFromThePeak(NV.V,Vprev_,Vpprev_, Vpeak);
              NV.ISI0:=min(t_peak-NV.tAP,t_peak);
              ISI[0]:=NV.ISI0;
              NV.tAP:=t_peak;
           end;
       end;
    end;
  END;
end;

procedure FrequencyAmplitudeO(ANrn :TNeuron);
var is0,ooo :double;
begin
  WITH ANrn DO BEGIN
  if NV.indic=3 then NV.indic:=0;   { End of spike }
//  freq:=freq*(nt-1)/nt;
  IfSpikeOccursO(ANrn);
  { if spike }
  if (NV.indic=2)and(t>t_start_count_) then begin
//     freq:=(freq*(t-t_start_count_)+1)/(t-t_start_count_);
     IIspike:=IIspike+1;
  end;
  END;
end;


function nu_I_s(I_{pA},s_gL,t_end_ :double) :double;
{ ********************************************************************
  Calculates plot for frequency etc. depending on Iind.
**********************************************************************}
var ni,nIind,If_I_V_or_g_o                    :integer;
    dum,Iind_o,t_Iind_o,uu,ss,gL0,sgmV_       :double;
BEGIN
  { Parameters }
  VSpikeCrit:=Form22.DDSpinEdit2.Value/1e3{-30mV};
  IfNoise:=Form22.CheckBox1.Checked;
  t_start_count_ :=Form22.DDSpinEdit6.Value/1000;
  { Create neuron }
  CreateNeuronByTypeO(NP0[i3],ANrnF);
  ANrnF.InitialConditions;
  gL0:=ANrnF.NP.C_membr/ANrnF.NP.tau_m0;
  IIspike:=0;
  nt:=0;
  REPEAT  nt:=nt+1;  t:=nt*dt; { time step }
      ss:=s_gL*gL0;
      uu:=ss*(ANrnF.NP.Vrest-Vus);
      { Noise }
      if IfNoise then begin
         sgmV_:=sgm_V[i3];
         { If_sgm_is_proportional_to_g_g0 }
         if Form4.CheckBox10.Checked then sgmV_:=sgmV_*sqrt(1+s_gL); // sqrt is introduced on 25.02.2017
         uu:=uu+sgmV_*gL0*sqrt(2*ANrnF.NP.tau_m0  {/(1+s_gL)}  /dt)*randG(0,1); //commented on 20.09.2012
      end;
      {**********************}
      ANrnF.MembranePotential(uu,ss,0,0,0,I_/(ANrnF.NP.Square*1e9),0);
      {**********************}
      NV0:=ANrnF.NV;
      FrequencyAmplitudeO(ANrnF);
      if (NV0.indic=2)and not(IfNoise) then begin
          freq:=LimRev(ISI[0],1e-6);
      end else if t>t_start_count_ then begin
          freq:=IIspike/(t-t_start_count_);
      end;
      if (NV0.V>0.150) or (NV0.V<-0.150) then begin t_end_:=t; freq:=0; end;
  UNTIL (t>=t_end_){ or ((IIspike=Form22.DDSpinEdit1.Value)and(NV0.indic=3))};
  ANrnF.Free;
  nu_I_s:=freq;
END;

procedure Plot_nu_IindO;
{ ********************************************************************
  Calculates plot for frequency etc. depending on Iind.
**********************************************************************}
var ni,nIind,If_I_V_or_g_o                         :integer;
    dIind,Iind,t_ind_o,nu,Iind_max,s_gL,
    nu_Joh,nu_ad,x,tau_,Vth,sgm_,Gad_nu_gL,gL0     :double;
BEGIN
  Form22.Visible:=true;
  { Memorize current values }
  t_ind_o:=t_ind;
  t_ind:=1e8;
  Iind_max:=Form22.DDSpinEdit3.Value;
  dIind   :=Form22.DDSpinEdit4.Value;
  t_end_  :=Form22.DDSpinEdit5.Value/1000;
  s_gL    :=Form22.DDSpinEdit7.Value;
  gL0:=NP0[i3].C_membr/NP0[i3].tau_m0;
  {---------------}
  nIind:=Trunc(Iind_max/dIind);
  FOR ni:=0 to nIind DO BEGIN
    Iind:=dIind*ni {pA};
    {***************************}
    nu:=nu_I_s(Iind,s_gL,t_end_);
    {***************************}
    { Non-adaptive model }
    x:=NP0[i3].Vrest+Iind/gL0/NP0[i3].Square/(1+s_gL)/1e9;
    tau_:=NP0[i3].tau_m0/(1+s_gL);
    sgm_:=sgm_V[i3]*sqrt(2)/sqrt(1+s_gL);   // sqrt is introduced on 25.02.2017
    Vth:=NP0[i3].Vrest + NP0[i3].FixThr + NP0[i3].ThrShift;
    if Form4.CheckBox10.Checked then sgm_:=sgm_*sqrt(1+s_gL); // sqrt is introduced on 25.02.2017
    if Form22.CheckBox1.Checked then begin
       nu_Joh:=nu_Johannesma(x,tau_,Vth,NP0[i3].Vreset,sgm_);
    end else begin
       nu_Joh:=nu_LIF       (x,tau_,Vth,NP0[i3].Vreset);
    end;
    { Adaptation-defined rate: nu=(I/VT-gL-s)/G_adapt }
    if (NP0[i3].gKM>0)or(NP0[i3].gAHP>0) then begin
        Gad_nu_gL:=AccountAdaptation(NP0[i3]);
        nu_ad:=max(0,
        (Iind/(Vth-NP0[i3].Vrest)/gL0/NP0[i3].Square/1e9 - 1-s_gL)/Gad_nu_gL);
    end;
    {***************************}
    Form22.Series1.AddXY(Iind,nu);
    Form22.Series2.AddXY(Iind,nu_Joh);
    Form22.Series3.AddXY(Iind,nu_ad);
    Application.ProcessMessages;
  END;
  { Remember current values }
  t_ind:=t_ind_o;
END;

end.
