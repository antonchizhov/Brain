unit LFPO;

interface
uses
  Classes,Forms,SysUtils,
  typeNrnParsO,t_dtO,PopulationO,IonsO
  {ThresholdO,MathMyO,NeuronO,SetNrnParsO,CreateNrnO,EEGO,
  Unit1,Unit2,Unit4,Unit12},Unit25,Init{,Erf_Hazard};

function Convolve_nu_with_SpikeShapeLFP(APop :TPopulation) :double;
function Calculate_LFP(APop :TPopulation; AIons :TIons) :double;
procedure Draw_LFP(APop :TPopulation; AIons :TIons);
procedure Write_LFP_FromNode(APop :TPopulation; AIons :TIons);

implementation

var lll :text;
    phi,phi_in_mV,phi_in_pA,Isyn_dend,IC_IL_soma,IsynE_,IsynI_ :double;

{*************************************************************** LFP **********}
function Convolve_nu_with_SpikeShapeLFP(APop :TPopulation) :double;
{         /\                        }
{        /  \                       }
{       /    \                      }
{      /      \                     }
{ ----/        \        -------     }
{     0   t1  t2 \ t3 / t4          }
{                  \/               }
var  i,max_i          :integer;
     ts_,S,SpikeAmpl,
     t1,t2,t3,t4,Min_ :double;

     function SpikeShapeLFP(t :double) :double;
     begin
       if      (t<0) or (t>t4)  then  SpikeShapeLFP:=0
       else if  t<=t1           then  SpikeShapeLFP:=SpikeAmpl*t/t1
       else if (t>t1)and(t<=t2) then  SpikeShapeLFP:=SpikeAmpl*(1-(t-t1)/(t2-t1))
       else if (t>t2)and(t<=t3) then  SpikeShapeLFP:=Min_*        (t-t2)/(t3-t2)
       else                           SpikeShapeLFP:=Min_*     (1-(t-t3)/(t4-t3));
     end;

     function F_SpikeLFP(t :double) :double;
     { Antiderivative_of_SpikeShapeLFP }
     var S :double;
     begin
       if      t<=0  then  S:=0
       else if t<=t1 then  S:=SpikeAmpl*t*t/2/t1
       else if t<=t2 then  S:=SpikeAmpl*(t1/2+(t -t1-((t *t -t1*t1)/2-(t -t1)*t1)/(t2-t1)))
       else if t<=t3 then  S:=SpikeAmpl*(t1/2+(t2-t1-((t2*t2-t1*t1)/2-(t2-t1)*t1)/(t2-t1))) + Min_*((t *t -t2*t2)/2-(t -t2)*t2)/(t3-t2)
       else if t<=t4 then  S:=SpikeAmpl*(t1/2+(t2-t1-((t2*t2-t1*t1)/2-(t2-t1)*t1)/(t2-t1))) + Min_*((t3*t3-t2*t2)/2-(t3-t2)*t2)/(t3-t2) + Min_*(t-t3 -((t *t -t3*t3)/2-(t -t3)*t3)/(t4-t3))
       else                S:=SpikeAmpl*(t1/2+(t2-t1-((t2*t2-t1*t1)/2-(t2-t1)*t1)/(t2-t1))) + Min_*((t3*t3-t2*t2)/2-(t3-t2)*t2)/(t3-t2) + Min_*(t4-t3-((t4*t4-t3*t3)/2-(t4-t3)*t3)/(t4-t3));
       F_SpikeLFP:=1e-3*S;  {mA/cm^2 * s}
     end;

begin
  SpikeAmpl:=Form25.DDSpinEdit79.Value; {mA/cm^2}
  t1:=0.5;     {ms}
  t2:=t1+0.5;  {ms}
  t3:=t2+0.75; {ms}
  t4:=t3+1.5;  {ms}
  Min_:=-SpikeAmpl*0.2;
  { EEG }
  if APop.PP.Nts=0 then begin
     Convolve_nu_with_SpikeShapeLFP:=APop.nu * F_SpikeLFP(t4);
     exit;
  end;
  S:=0;
  max_i:=trunc(t4/1000/APop.PP.dts)+1;
  for i:=0 to max_i-1 do begin
      ts_:=(i+0.5)*APop.PP.dts;
{      S:=S+APop.ro_at_ts(ts_)*(F_SpikeLFP((ts_+APop.PP.dts)*1e3)
                              -F_SpikeLFP(ts_*1e3))*APop.PP.dts;}
      S:=S + APop.ro_at_ts(ts_)*SpikeShapeLFP(ts_*1e3)*APop.PP.dts;
  end;
  Convolve_nu_with_SpikeShapeLFP:=S;
  {*Checking*}
  {if t<=20*dt then begin
     for i:=0 to 100 do begin
         S:=F_SpikeLFP((i*dt+PP.dts/10)*1e3)-F_SpikeLFP(i*dt*1e3);
         Form25.Series1.AddXY(i*dt*1e3,S);
     end;
     Application.ProcessMessages;
  end;}
end;

{******************************************************************************}
{******************************************************************************}
function Calculate_LFP(APop :TPopulation; AIons :TIons) :double;
var  i,iLN,sign                        :integer;
     ro_dts,IC_IL_,SpikeLFP_,sc_       :double;
begin
  Isyn_dend :=0;
  IC_IL_soma:=0;
  IsynE_    :=0;
  IsynI_    :=0;
  for i:=0 to APop.PP.Nts do begin
      ro_dts:=0;
      FOR iLN:=1 to APop.LogN.Nx DO BEGIN
          ro_dts:=ro_dts + APop.ro[i,iLN]*APop.PP.dts*APop.PHI_dx[iLN];
          if i=APop.PP.Nts then ro_dts:=ro_dts + APop.Bum[iLN]*APop.PHI_dx[iLN];
      END;
      if APop.PP.Nts=0 then ro_dts:=1;   { EEG }
      Isyn_dend:=Isyn_dend + APop.Nrn[i].NV.IatE *ro_dts;
      IC_IL_:= APop.Nrn[i].NP.C_membr*APop.Nrn[i].NV.DVDt
                                    - APop.Nrn[i].NV.Im_s;          {mA/cm^2}
      IC_IL_soma  :=IC_IL_soma   + IC_IL_*ro_dts;
      IsynE_   :=IsynE_    + APop.Nrn[i].NV.IsynE*ro_dts;
      IsynI_   :=IsynI_    + APop.Nrn[i].NV.IsynI*ro_dts;
  end;
  SpikeLFP_:=Convolve_nu_with_SpikeShapeLFP(APop);
  sign:=1-2*Form25.RadioGroup1.ItemIndex;  // sign=1 for somatic and sign=-1 for dendritic LFP
  {*****************************************************************}
  phi:= sign*(IC_IL_soma - IsynI_ + SpikeLFP_) + AIons.IV.I_Glia;
  {*****************************************************************}
  { Rescaling  to pA }
  sc_:=APop.PP.NP.Square*1e9{to be pA};
  Isyn_dend:=Isyn_dend*sc_;  IC_IL_soma:=IC_IL_soma*sc_;
  IsynE_:=IsynE_*sc_;  IsynI_:=IsynI_*sc_;
  phi_in_pA:=phi*sc_; {pA}
  phi_in_mV:=phi_in_pA*1.0{MOhm}/1000; {mV}
  Calculate_LFP:=phi_in_mV;
end;
{******************************************************************************}
{******************************************************************************}

procedure Draw_LFP(APop :TPopulation; AIons :TIons);
begin
  if not(Form25.Visible) then exit;
  {*****************************}
  LFP:=Calculate_LFP(APop,AIons);
  {*****************************}
  { Drawing }
  Form25.Series1.AddXY(t*1e3,phi_in_pA);
  Form25.Series2.AddXY(t*1e3,Isyn_dend);
  Form25.Series3.AddXY(t*1e3,IC_IL_soma);
  Form25.Series4.AddXY(t*1e3,IsynE_);
  Form25.Series5.AddXY(t*1e3,IsynI_);
  Form25.Series6.AddXY(t*1e3,AIons.IV.I_Glia);
end;

procedure Write_LFP_FromNode(APop :TPopulation; AIons :TIons);
begin
  if not(Form25.Visible) then exit;
  {*****************************}
  LFP:=Calculate_LFP(APop,AIons);
  {*****************************}
  AssignFile(lll,'LFP.dat');
  if (FileExists('LFP.dat')=false)or(nt=n_Write) then rewrite(lll) else append(lll);
  {           1-A            2-B                3-C                }
  write  (lll,t*1000:8:1,' ',phi_in_pA:10:4,' ',Isyn_dend:10:4,' ');
  {           4-D  dx               5-E             6-F              }
  write  (lll,IC_IL_soma:10:4,' ',IsynE_:10:4,' ',IsynI_:10:4,' ');
  {           7-G                                                  }
  writeln(lll,phi_in_mV:10:4);
  CloseFile(lll);
end;
{********************************************************** End of LFP ********}

end.
