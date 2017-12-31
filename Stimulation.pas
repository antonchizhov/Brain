unit Stimulation;

interface
uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls,TeEngine,
     ColumnO,PopulationO,ConnectionsO,RepresentativesO,ThresholdO,Erf_Hazard;

procedure IntegrateNoise(AColumn_ :TColumn);
procedure Set_Ps(var pext :double);
function Current_Iind(ie :integer; r_Noise_ :double) :double;
function Conductance_Sind(ie :integer) :double;
procedure ApplyBipolarVoltageShockToPopulation(APop_:TPopulation; ro_BP:double);
procedure BipolarElectrodeStimulation;
procedure LGN_input_Troyer1998(Contrast :double; var BG,TU :double);

implementation
uses Math,Init,t_dtO,MathMyO,
     Unit4,Unit3;

procedure IntegrateNoise(AColumn_ :TColumn);
var  i             :integer;
     rnd,r_        :double;
begin
  for i:=1 to NPop do begin
      r_:=AColumn_.Pop[i].r_Noise;
      { Initial condition }
      if t<=dt then r_:=0;
      { Randomization }
      rnd:=randG(0,1);
      if tauNoise<>0 then begin
         r_:=r_ + (0-r_)/tauNoise*dt + rnd*sqrt(2*dt/tauNoise);
      end else begin
         r_:=rnd;
      end;
      AColumn_.Pop[i].r_Noise:=r_;
  end;
end;

procedure Set_Ps(var pext :double);
var iStim :integer;
begin
  pext:=Qns;
  if dtSt>0 then iStim:=trunc((t-t0s)/dtSt) else iStim:=0;
  if (((t>t0s)and(t<t0s +tSt)) or
      ((dtSt>0)and(iStim<nStimuli)and(t-t0s>iStim*dtSt)and(t-t0s<iStim*dtSt+tSt)))
     and(IfExtracellOrThalamOrVisualOrLGN_Stimul in [2,5]) then begin
     pext:=pext + Iext{muA} * pext_Iext {Hz/muA};
  end;
  { Turn on Noise }
  if not(Form4.CheckBox8.Checked) then
     pext:=max(0,pext*(1+NoiseToSgn*r_Noise));
end;

function Current_Iind(ie :integer; r_Noise_ :double) :double;
var  MeanCurr,tp,I_ind_per_cm2 :double;
begin
  I_ind_per_cm2:=I_ind/(NP0[EorI(ie)].Square*1e9);
  if ((t>0)and(t<=t_ind)) or ((t>dtSt)and(t<dtSt+t_ind)) then begin
     if nu_ind=0 then begin                   {constant}
        MeanCurr:=I_ind_per_cm2
     end else
     case Form4.ComboBox7.ItemIndex of
     2: {sinus with growing freq.}
        MeanCurr:=I_ind_per_cm2*sin(2*pi*(abs(nu_ind)*t/10)*t);
     1: {sinus}
        MeanCurr:=I_ind_per_cm2*sin(2*pi* nu_ind *t);
     3: {cos}
        MeanCurr:=I_ind_per_cm2*0.5*(1-cos(2*pi* nu_ind *t));
     5: {cos with growing freq.}
        MeanCurr:=I_ind_per_cm2*0.5*(1-cos(2*pi* nu_ind *t/10*t));
     end;
  end else begin
     MeanCurr:=0;
  end;
  { Pulse train }
  if (nu_ind>0)and(t_ind<0.005) then begin
     tp:=trunc(t*nu_ind)/nu_ind;
     if (t>tp)and(t<tp+t_ind)and(trunc(t*nu_ind)<=10)
     then  MeanCurr:=I_ind_per_cm2
     else  MeanCurr:=0;
  end;
  { If turn off additive current for E or I-cells }
  if EorI(ie)=Form4.ComboBox1.ItemIndex then begin
     Current_Iind:=0;
  { If turn on Noise }
  end else if  Form4.CheckBox8.Checked then begin
     Current_Iind:=MeanCurr + I_ind_per_cm2*NoiseToSgn*r_Noise_;
  { If current is taken from file }
  end else if (Form4.ComboBox7.ItemIndex=4)and(ie=1) then begin
     Current_Iind:=Vexp[imin(nt,mMaxExp),Smpl]/(NP0[1].Square*1e9);
  { If no exceptions }
  end else begin
     Current_Iind:=MeanCurr;
  end;
end;

function Conductance_Sind(ie :integer) :double;
var  S_,g0_ :double;
begin
  if ((t>0)and(t<=t_ind)) or ((t>dtSt)and(t<dtSt+t_ind)) then begin
     g0_:=NP0[EorI(ie)].C_membr/NP0[EorI(ie)].tau_m0;
     S_:=s_ind*g0_;
  end else begin
     S_:=0;
  end;
  { If turn off additive conductance for E or I-cells }
  if EorI(ie)=Form4.ComboBox1.ItemIndex then begin
     Conductance_Sind:=0;
  { If no exceptions }
  end else begin
     Conductance_Sind:=S_;
  end;
end;

procedure ApplyBipolarVoltageShockToPopulation(APop_:TPopulation; ro_BP:double);
{ Considers a quick shift of the mean voltage for the gaussian
  frozen distribution being at rest. }
var i0,i,iLN    :integer;
    dro,S       :double;
begin
  { EEG }
  if APop_.PP.Nts=0 then begin
     APop_.nu:=(1-ro_BP)/dt;    //16.04.2016 - it was ro_BP instead of (1-ro_BP)
     exit;
  end;
  { Firing rate }
//  nu:=max(0,ro[PP.Nts]-ro_BP/PP.dts);
  FOR iLN:=1 to Apop_.LogN.Nx DO BEGIN         //It was MaxLn before 24.06.2014
      S:=0;                                    //It was before loop before 3.12.2016
      FOR i:=APop_.PP.Nts downto 0 do begin {loop for phase}
          dro:=APop_.ro[i,iLN]*(1-ro_BP);
          {*************************************}
          APop_.ro[i,iLN]:=APop_.ro[i,iLN] - dro;
          {*************************************}
          S:=S         + dro;
          APop_.Hzrd[i]:=APop_.Hzrd[i] + dro/dt*APop_.PHI_dx[iLN];
      END;
      //nuS:=S*APop_.PP.dts/{dt}APop_.PP.dts;    // It was /dt  before 16.10.2013
      //APop_.nu:=APop_.nu+S;
      { Excited neurons come to the spike-state from the rest-state. }
//commented on 10.01.2017      i0:=APop_.nts_by_ts(0);
//commented on 10.01.2017      APop_.ro[i0,iLN]:=APop_.ro[i0,iLN] + S;
      APop_.nu:=APop_.nu + S{*APop_.PP.dts/dt}*APop_.PHI_dx[iLN];
      APop_.Bum[iLN]:=APop_.Bum[iLN] + S*APop_.PP.dts;          // 10.01.2017
  END;
end;

procedure BipolarElectrodeStimulation;
{ Simulates the simulation by extracellular electrode as a voltage increment
  reverse proportional to distance. }
var ip,iStim                              :integer;
    S_R,ro_BP,DistanceToRecElectrode      :double;
begin
  if dtSt>0 then iStim:=trunc((t-t0s)/dtSt) else iStim:=0;
  if (IfExtracellOrThalamOrVisualOrLGN_Stimul in [1]) and
      ((abs(t-t0s-dt)<dt/2) or
      ((dtSt>0)and(iStim<nStimuli)and(abs(t-t0s-iStim*dtSt-dt)<dt/2))) then begin
      DistanceToRecElectrode:=0.080{mm}; //0.010{mm}     // changed from 1mm to 0.08mm on 29.09.2011
      S_R:=Iext{muA} * Sbipolar_Iext {mm^2/muA} / sqr(DistanceToRecElectrode);
      //if (t>t0s+tSt)and(t<=t0s+tSt+dt) then S_R:=-S_R;
      { Fraction of survived neurons of the population }
      ro_BP:=(1+Erfic(T_bipolar-S_R))/(1+Erfic(T_bipolar));
  end else EXIT;
  for ip:=1 to NPop do begin
      if (((IfStimLayer2or4=4)and((ip=1)or(ip=2)))or
          ((IfStimLayer2or4=2)and((ip=3)or(ip=4)))) and
          (not((Form4.CheckBox16.Checked)and(ip mod 2 = 0))) then
          {****************************************************************}
          ApplyBipolarVoltageShockToPopulation(AColumn.Pop[ip], ro_BP);
          {****************************************************************}
//      Nrn[PP.Nts].NV.V   :=Nrn[PP.Nts].NV.V    + S_R;
//      Nrn[PP.Nts].NV.VatE:=Nrn[PP.Nts].NV.VatE + S_R;
  end;
end;

procedure LGN_input_Troyer1998(Contrast :double; var BG,TU :double);
var a,b :array[0..10] of double;
    x,xx,xxx :double;
begin
 x:=Contrast;  if x>50 then x:=50;  if x<0 then x:=0;
 xx:=x*x;
 xxx:=x*xx;
 { Background component }
 a[0]:=     7.622693422822E+000;
 a[1]:=     5.696208938067E-001;
 a[2]:=    -1.140712064739E-002;
 a[3]:=     8.530068295902E-005;
 if Contrast<5 then BG:=10 else BG:=a[0]+a[1]*x+a[2]*xx+a[3]*xxx;
 { Tuned component }
 b[0]:=    -3.103087111818E-001;
 b[1]:=    3.059644012750E+000 ;
 b[2]:=   -2.080287179108E-001 ;
 b[3]:=   8.528324216884E-003  ;
 b[4]:=  -1.969228041348E-004  ;
 b[5]:=   2.344828282937E-006  ;
 b[6]:=  -1.115581396497E-008  ;
 TU:=b[0]+b[1]*x+b[2]*xx+b[3]*xxx+b[4]*xx*xx+b[5]*xx*xxx+b[6]*xxx*xxx;
 if TU<0 then TU:=0;
end;

end.
