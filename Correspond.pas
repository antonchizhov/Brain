unit Correspond;

interface
uses Init,t_dtO,MathMyO;

procedure CorrespondParametersToTheForm;
procedure DisableSpinEdits;
procedure TakeParametersFromForms;

implementation
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls,
  Unit1,Unit2,Unit3,Unit4,Unit8,Unit10,Unit12,Unit15,Unit25,Unit26,Unit30,
  ConnectionsO,graph_2DO;

procedure CorrespondParametersToTheForm;
var  SE,SI :string;
begin
  { Limitations }
  if (j_view<0) or (j_view>nj+1) then j_view:=trunc((nj+1)/2);
  if (i_view<0) or (i_view>ni+1) then i_view:=trunc((ni+1)/2);
  if (j_view2<0) or (j_view2>nj+1) then j_view2:=trunc((nj+1)/2);
  if (i_view2<0) or (i_view2>ni+1) then i_view2:=trunc((ni+1)/2);
  if ni=1 then i_view:=1;
  if nj=1 then j_view:=1;
  if NPop<=2 then IfStimLayer2or4:=4;
  {*************}
  Form1.Smpl0 .Checked:=(Smpl=0);
  Form1.Smpl1 .Checked:=(Smpl=1);
  Form1.Smpl2 .Checked:=(Smpl=2);
  Form1.Smpl3 .Checked:=(Smpl=3);
  Form1.Smpl4 .Checked:=(Smpl=4);
  Form1.Smpl5 .Checked:=(Smpl=5);
  Form1.Smpl6 .Checked:=(Smpl=6);
  Form1.Smpl7 .Checked:=(Smpl=7);
  Form1.Smpl8 .Checked:=(Smpl=8);
  Form1.Smpl9 .Checked:=(Smpl=9);
  Form1.Smpl10.Checked:=(Smpl=10);
  Form1.Smpl11.Checked:=(Smpl=11);
  Form1.Smpl12.Checked:=(Smpl=12);
  Form1.Smpl13.Checked:=(Smpl=13);
  Form1.Smpl14.Checked:=(Smpl=14);
  Form1.Smpl15.Checked:=(Smpl=15);
  Form1.Smpl16.Checked:=(Smpl=16);
  Form1.Smpl17.Checked:=(Smpl=17);
  Form1.Smpl18.Checked:=(Smpl=18);
  Form1.Smpl19.Checked:=(Smpl=19);
  if NSmpls<>0 then begin
     if NSmpls<2 then  Form1.Smpl2.Enabled:=False;
     if NSmpls<3 then  Form1.Smpl3.Enabled:=False;
     if NSmpls<4 then  Form1.Smpl4.Enabled:=False;
     if NSmpls<5 then  Form1.Smpl5.Enabled:=False;
     if NSmpls<6 then  Form1.Smpl6.Enabled:=False;
     if NSmpls<7 then  Form1.Smpl7.Enabled:=False;
     if NSmpls<8 then  Form1.Smpl8.Enabled:=False;
     if NSmpls<9 then  Form1.Smpl9.Enabled:=False;
     if NSmpls<10 then  Form1.Smpl10.Enabled:=False;
     if NSmpls<11 then  Form1.Smpl11.Enabled:=False;
     if NSmpls<12 then  Form1.Smpl12.Enabled:=False;
     if NSmpls<13 then  Form1.Smpl13.Enabled:=False;
     if NSmpls<14 then  Form1.Smpl14.Enabled:=False;
     if NSmpls<15 then  Form1.Smpl15.Enabled:=False;
     if NSmpls<16 then  Form1.Smpl16.Enabled:=False;
     if NSmpls<17 then  Form1.Smpl17.Enabled:=False;
     if NSmpls<18 then  Form1.Smpl18.Enabled:=False;
     if NSmpls<19 then  Form1.Smpl19.Enabled:=False;
  end;
  if NP0[1].HH_order='1-point'  then  Form1.N1point1. Checked:=true;
  if NP0[1].HH_order='2-points' then  Form1.N2points1.Checked:=true;
  if NP0[1].HH_order='2-p-MainenSejn' then  Form1.N2pMainenSejn1.Checked:=true;
  if NP0[1].HH_order='2-p-ActiveDend' then  Form1.N2pActiveDend1.Checked:=true;
  if NP0[2].HH_order='1-point'  then  Form1.N1point2. Checked:=true;
  if NP0[2].HH_order='2-points' then  Form1.N2points2.Checked:=true;
  if NP0[1].HH_type='Passive'   then  Form1.Passive1. Checked:=true;
  if NP0[1].HH_type='Calmar'    then  Form1.Calmar1.  Checked:=true;
  if NP0[1].HH_type='Destexhe'  then  Form1.Destexhe1.Checked:=true;
  if NP0[1].HH_type='Migliore'  then  Form1.Migliore1.Checked:=true;
  if NP0[1].HH_type='Chow'      then  Form1.Chow1.Checked:=true;
  if NP0[1].HH_type='Bazhenov'  then  Form1.Bazhenov1.Checked:=true;
  if NP0[1].HH_type='Lyle'      then  Form1.Lyle1.Checked:=true;
  if NP0[2].HH_type='Passive'   then  Form1.Passive2. Checked:=true;
  if NP0[2].HH_type='Calmar'    then  Form1.Calmar2.  Checked:=true;
  if NP0[2].HH_type='Chow'      then  Form1.Chow2.Checked:=true;
  Form1.CheckBox4.Checked  :=(WriteOrNot=1);
  Form1.CheckBox6.Checked  :=(YesToClean=1);
  Form1.TVDscheme1.Checked :=(IfSecondOrder=1);
  Form4.ComboBox6.ItemIndex:=R.NP.If_I_V_or_g-1;
  Form1.Rose1.Checked      :=(IfRose=1);

  { Form4 }
  Form4.Label9.Caption :=NP0[1].HH_type;
  Form4.Label10.Caption:=NP0[2].HH_type;
  Form4.Label11.Caption:=NP0[1].HH_order;
  Form4.Label12.Caption:=NP0[2].HH_order;
  Form4.DDSpinEdit42.Value :=R.NP.Vrest*1e3;
  Form10.DDSpinEdit42.Value:=R.NP.Vrest*1e3;
  Form4.DDSpinEdit43.Value:=dt*1000;
  Form10.DDSpinEdit1.Value:=Iext;
  Form4.DDSpinEdit1.Value :=Iext;
  Form4.DDSpinEdit2.Value :=NP0[1].Square*1e5;
  Form10.DDSpinEdit3.Value:=tSt*1000;
  Form4.DDSpinEdit3.Value :=tSt*1000;
  Form4.DDSpinEdit4.Value :=R.NP.Square*1e5;
  Form4.DDSpinEdit5.Value :=NP0[1].ThrShift*1000;
  Form4.DDSpinEdit6.Value :=tauNoise*1000;
  Form10.DDSpinEdit2.Value:=t_end*1000;
  Form4.DDSpinEdit7.Value :=t_end*1000;
  Form4.DDSpinEdit21.Value:=Qns;
  Form4.DDSpinEdit10.Value:=gGJ[1];
  Form4.DDSpinEdit11.Value:=gGJ[2];
  Form4.DDSpinEdit12.Value:=tBG*1e3;
  Form4.DDSpinEdit13.Value:=s_ind;
  Form4.DDSpinEdit14.Value:=SynSensitivity_E;
  Form4.DDSpinEdit15.Value:=SynSensitivity_I;
  Form4.DDSpinEdit16.Value:=gNMDA_gAMPA;
  Form4.DDSpinEdit19.Value:=SynSensitivity_Thalamic;
  Form4.DDSpinEdit20.Value:=SynEffect_Glu;
  Form4.DDSpinEdit62.Value:=SynEffect_GABA;
  Form4.ComboBox2.ItemIndex:=trunc(IfStimLayer2or4/2)-1;
  Form4.ComboBox3.ItemIndex:=trunc(IfExtracellOrThalamOrVisualOrLGN_Stimul)-1;
  //Form4.ComboBox4.ItemIndex:=trunc(IfViewInLayer2or4/2)-1;
  if (If_Binzegger_V1=0) then Form4.ComboBox5.ItemIndex:=0;
  { Time constants }
  Form4.DDSpinEdit22.Value:=alAMPA[1];
  Form4.DDSpinEdit23.Value:=alNMDA[1];
  Form4.DDSpinEdit24.Value:=alGABA[1];
  Form4.DDSpinEdit25.Value:=alGABB[1];
  Form4.DDSpinEdit26.Value:=beAMPA[1];
  Form4.DDSpinEdit27.Value:=beNMDA[1];
  Form4.DDSpinEdit28.Value:=beGABA[1];
  Form4.DDSpinEdit29.Value:=beGABB[1];
  Form4.DDSpinEdit30.Value:=alAMPA[2];
  Form4.DDSpinEdit31.Value:=alNMDA[2];
  Form4.DDSpinEdit32.Value:=alGABA[2];
  Form4.DDSpinEdit33.Value:=alGABB[2];
  Form4.DDSpinEdit34.Value:=beAMPA[2];
  Form4.DDSpinEdit35.Value:=beNMDA[2];
  Form4.DDSpinEdit36.Value:=beGABA[2];
  Form4.DDSpinEdit37.Value:=beGABB[2];
  Form4.DDSpinEdit38.Value:=VAMPA*1e3;
  Form4.DDSpinEdit39.Value:=NP0[1].VNMDA*1e3;
  Form4.DDSpinEdit40.Value:=VGABA*1e3;
  Form4.DDSpinEdit41.Value:=VGABB*1e3;
  Form4.DDSpinEdit44.Value:=NP0[1].Mg;
  Form4.DDSpinEdit45.Value:=NPop;
  Form4.DDSpinEdit46.Value:=I_ind;
  Form4.DDSpinEdit47.Value:=nu_ind;
  Form4.DDSpinEdit48.Value:=t_ind*1e3;
  Form4.DDSpinEdit65.Value:=t0_ind*1e3;
  Form4.DDSpinEdit49.Value:=NP0[1].Vrest*1e3;
  Form4.DDSpinEdit50.Value:=NP0[2].Vrest*1e3;
  Form4.DDSpinEdit51.Value:=NP0[1].tau_m0*1e3;
  Form4.DDSpinEdit52.Value:=NP0[2].tau_m0*1e3;
  Form4.DDSpinEdit53.Value:=NP0[2].ThrShift*1e3;
  Form4.DDSpinEdit54.Value:=NP0[2].Square*1e5;
  Form4.DDSpinEdit55.Value:=sgm_V[1]*1000;
  Form4.DDSpinEdit73.Value:=sgm_V[2]*1000;
  Form4.DDSpinEdit66.Value:=sgm_V[3]*1000;
  Form4.DDSpinEdit99.Value:=sgm_V[4]*1000;
  Form4.DDSpinEdit56.Value:=NP0[1].gAHP;
  Form4.DDSpinEdit57.Value:=NP0[2].gAHP;
  Form4.DDSpinEdit58.Value:=t_axon[1,1]*1e3;
  Form4.DDSpinEdit59.Value:=t_axon[2,1]*1e3;
  Form4.DDSpinEdit112.Value:=t_axon[1,2]*1e3;
  Form4.DDSpinEdit113.Value:=t_axon[2,2]*1e3;
  Form4.DDSpinEdit101.Value:=Speed;
  Form4.DDSpinEdit60.Value:=NP0[1].gBst;
  Form4.DDSpinEdit61.Value:=NP0[2].gBst;
  Form4.DDSpinEdit63.Value:=Nts[1];
  Form4.DDSpinEdit17.Value:=ts_end[2]*1000;
  Form4.DDSpinEdit18.Value:=Nts[2];
  Form4.DDSpinEdit64.Value:=ts_end[1]*1000;
  Form4.DDSpinEdit67.Value:=dtSt*1000;
  Form4.DDSpinEdit68.Value:=NP0[1].gNaP;
  Form4.DDSpinEdit69.Value:=NP0[2].gNaP;
  Form4.DDSpinEdit70.Value:=NoiseToSgn;
  Form4.DDSpinEdit71.Value:=n_show;
  Form4.DDSpinEdit72.Value:=NP0[1].DepBlock_slope;
  Form4.DDSpinEdit74.Value:=NP0[1].gKM;
  Form4.DDSpinEdit75.Value:=NP0[3].ThrShift*1e3;
  Form4.DDSpinEdit77.Value:=NP0[1].l;
  Form4.DDSpinEdit78.Value:=NP0[2].l;
  Form4.DDSpinEdit80.Value:=n_DrawPhase;
  Form4.DDSpinEdit81.Value:=n_Write;
  Form4.DDSpinEdit83.Value:=NP0[1].Vreset*1e3;
  Form4.DDSpinEdit84.Value:=NP0[2].Vreset*1e3;
  Form4.DDSpinEdit85.Value:=NP0[1].gKA;
  Form4.DDSpinEdit86.Value:=NP0[2].gKA;
  Form4.DDSpinEdit87.Value:=NP0[1].gK;
  Form4.DDSpinEdit88.Value:=NP0[2].gK;
  Form4.DDSpinEdit89.Value:=factorNMDA;
  Form4.DDSpinEdit91.Value:=pext_Iext;
  Form4.DDSpinEdit8.Value :=Sbipolar_Iext;
  Form4.DDSpinEdit9.Value :=T_bipolar;
  Form4.DDSpinEdit92.Value:=factorAMPA;
  Form4.DDSpinEdit93.Value:=t0s*1e3;
  Form4.DDSpinEdit94.Value:=nStimuli;
  Form4.DDSpinEdit95.Value:=NP0[4].ThrShift*1e3;
  Form4.DDSpinEdit96.Value:=NP0[1].C_membr*1e3;
  Form4.DDSpinEdit97.Value:=NP0[2].C_membr*1e3;
  Form4.DDSpinEdit98.Value:=taum_taus;
  Form4.DDSpinEdit100.Value:=NP0[1].DepBlock_limit;
  Form4.DDSpinEdit102.Value:=U_Depr_Glu;
  Form4.DDSpinEdit103.Value:=tau_Depr_Glu*1e3;
  Form4.DDSpinEdit104.Value:=U_Depr_GABA;
  Form4.DDSpinEdit105.Value:=tau_Depr_GABA*1e3;
  Form4.DDSpinEdit106.Value:=NP0[1].dt_AP*1e3;
  Form4.DDSpinEdit107.Value:=NP0[2].dt_AP*1e3;
  Form4.DDSpinEdit108.Value:=NP0[1].gKD;
  Form4.DDSpinEdit109.Value:=NP0[2].gKD;
  Form4.DDSpinEdit110.Value:=NP0[1].gH;
  Form4.DDSpinEdit111.Value:=NP0[2].gH;
  Form4.DDSpinEdit114.Value:=NP0[1].ro;
  Form4.DDSpinEdit115.Value:=NP0[2].ro;
  Form4.DDSpinEdit116.Value:=R.NP.ThrShift*1000;
  Form4.DDSpinEdit117.Value:=factorGABA;
  Form4.DDSpinEdit118.Value:=nu_thr_Depr_Glu;
  Form4.DDSpinEdit119.Value:=nu_thr_Depr_GABA;
  Form10.CheckBox1.Checked:=(IfBlockAMPA=1);
  Form10.CheckBox2.Checked:=(IfBlockNMDA=1);
  Form10.CheckBox3.Checked:=(IfBlockGABA=1);
  Form10.CheckBox4.Checked:=(IfBlockGABB=1);
  Form4.CheckBox1.Checked:=(IfBlockAMPA=1);
  Form4.CheckBox2.Checked:=(IfBlockNMDA=1);
  Form4.CheckBox3.Checked:=(IfBlockGABA=1);
  Form4.CheckBox4.Checked:=(IfBlockGABB=1);
  Form4.CheckBox5.Checked:=(IfInSyn_al_EQ_beta=1);
  Form4.CheckBox6.Checked:=(IfBlockK=1);
  Form4.CheckBox15.Checked:=(IfSigmoidForPresynRate=1);
  Form4.CheckBox18.Checked:=(If_m_saturates=1);
  Form4.CheckBox19.Checked:=(NP0[1].IfPredictorCorrector=1);
  Form4.CheckBox21.Checked:=(IfDynamic_K_Cl=1);
  Form4.CheckBox22.Checked:=(R.NP.IfThrModel=1);
  Form4.CheckBox23.Checked:=(IfShowBG=1);
  Form4.i3_Combo.ItemIndex:=i3-1;
  Form10.RadioGroup1.ItemIndex:=i3-1;
  Form10.RadioGroup2.ItemIndex:=i3-1;
  { Threshold model }
  SE:=Form4.ComboBox8.Items[Form4.ComboBox8.ItemIndex];
  SI:=Form4.ComboBox9.Items[Form4.ComboBox9.ItemIndex];
  NP0[1].FixThr:=0;
  NP0[2].FixThr:=0;
  if NP0[1].HH_type='Passive' then NP0[1].FixThr:=0.010{V};
  if NP0[2].HH_type='Passive' then NP0[2].FixThr:=0.010{V};
  if SE='Fix VT=10mV' then NP0[1].FixThr:=0.010{V};
  if SI='Fix VT=10mV' then NP0[2].FixThr:=0.010{V};
  if SE='Fix VT, dep. block G' then NP0[1].FixThr:=0.010{V};
  if SI='Fix VT, dep. block G' then NP0[2].FixThr:=0.010{V};
  //if SE='Fix T=10mV for E-cells' then NP0[1].FixThr:=0.010{V};
  //if SI='Fix T=10mV for I-cells' then NP0[2].FixThr:=0.010{V};
  //if Pos('VT(t*)',SE)>0 then NP0[1].FixThr:=0.010{V};
  //if Pos('VT(t*)',SI)>0 then NP0[2].FixThr:=0.010{V};
  if NP0[1].FixThr>0 then NP0[1].dVTdV_Brette:=0;
  if NP0[2].FixThr>0 then NP0[2].dVTdV_Brette:=0;
  {--- for 2D: }
  Form3.DDSpinEdit1.Value:=ni;
  Form3.DDSpinEdit2.Value:=nj;
  Form3.DDSpinEdit4.Value:=R_stim;
  Form3.DDSpinEdit5.Value:=ni_stim;
  Form3.DDSpinEdit6.Value:=nj_stim;
  Form3.DDSpinEdit7.Value:=dt_out*1000;
  Form3.DDSpinEdit8.Value:=dx*1e6;
  Form3.DDSpinEdit9.Value:=dy*1e6;
  Form3.DDSpinEdit10.Value:=i_view;
  Form3.DDSpinEdit11.Value:=j_view;
  Form3.DDSpinEdit23.Value:=i_view2;
  Form3.DDSpinEdit28.Value:=j_view2;
  Form3.DDSpinEdit13.Value:=rPW;
  Form3.DDSpinEdit18.Value:=t_stim2*1e3;    //second stimulus
  Form3.DDSpinEdit19.Value:=ni_stim2;
  Form3.DDSpinEdit20.Value:=nj_stim2;
  Form3.DDSpinEdit21.Value:=R_decay;
  Form3.DDSpinEdit22.Value:=LagOfDS*1e3;
  Form3.DDSpinEdit24.Value:=r_axon[1,1]*1e6;
  Form3.DDSpinEdit25.Value:=r_axon[2,1]*1e6;
  Form3.DDSpinEdit26.Value:=r_axon[1,2]*1e6;
  Form3.DDSpinEdit27.Value:=r_axon[2,2]*1e6;
  Form3.CheckBox12.Checked:=(If_4x4=1);
  if If_4x4=1 then begin   { 4x4 }
     Form30.DDSpinEdit1.Value :=r_axon[1,1]*1e6; {mum}
     Form30.DDSpinEdit2.Value :=r_axon[1,2]*1e6; {mum}
     Form30.DDSpinEdit3.Value :=r_axon[1,3]*1e6; {mum}
     Form30.DDSpinEdit4.Value :=r_axon[1,4]*1e6; {mum}
     Form30.DDSpinEdit5.Value :=r_axon[2,1]*1e6; {mum}
     Form30.DDSpinEdit6.Value :=r_axon[2,2]*1e6; {mum}
     Form30.DDSpinEdit7.Value :=r_axon[2,3]*1e6; {mum}
     Form30.DDSpinEdit8.Value :=r_axon[2,4]*1e6; {mum}
     Form30.DDSpinEdit9.Value :=r_axon[3,1]*1e6; {mum}
     Form30.DDSpinEdit10.Value:=r_axon[3,2]*1e6; {mum}
     Form30.DDSpinEdit11.Value:=r_axon[3,3]*1e6; {mum}
     Form30.DDSpinEdit12.Value:=r_axon[3,4]*1e6; {mum}
     Form30.DDSpinEdit13.Value:=r_axon[4,1]*1e6; {mum}
     Form30.DDSpinEdit14.Value:=r_axon[4,2]*1e6; {mum}
     Form30.DDSpinEdit15.Value:=r_axon[4,3]*1e6; {mum}
     Form30.DDSpinEdit16.Value:=r_axon[4,4]*1e6; {mum}
  end;
  {--- for V1: }
  Form8.DDSpinEdit1.Value:=ni;
  SetNameOfTheField(FieldToDraw);
  {--- for Synapses-Objects: }
  SetParamsOfSynapses;
{  if not(Form4.gsynC1.Visible) then begin
     Set_gmax;
  end;}
  SetDDSpinEdits;
  { Disable SpinEdits }
  DisableSpinEdits;
  Form2.Visible:=Form1.Phasespace1.Checked;
  Form12.Visible:=Form1.Phasespace1.Checked;
  Form25.Visible:=Form1.LFP1.Checked;
  Form26.Visible:=(IfDynamic_K_Cl=1);
  Form26.RadioGroup2.ItemIndex:=iPop_Ions_View-1;   // 22.04.2017
  Application.ProcessMessages;
end;
{****************************************************************************}

procedure DisableSpinEdits;
var OK :boolean;
    i  :integer;
begin
  with Form4 do begin
    OK:=not(IfBlockAMPA=1);
    DDSpinEdit22.Enabled:=OK;
    DDSpinEdit26.Enabled:=OK;
    DDSpinEdit30.Enabled:=OK;
    DDSpinEdit34.Enabled:=OK;
    DDSpinEdit38.Enabled:=OK;
    OK:=not(IfBlockNMDA=1);
    DDSpinEdit23.Enabled:=OK;
    DDSpinEdit27.Enabled:=OK;
    DDSpinEdit31.Enabled:=OK;
    DDSpinEdit35.Enabled:=OK;
    DDSpinEdit39.Enabled:=OK;
    DDSpinEdit16.Enabled:=OK;
    OK:=not(IfBlockGABA=1);
    DDSpinEdit24.Enabled:=OK;
    DDSpinEdit28.Enabled:=OK;
    DDSpinEdit32.Enabled:=OK;
    DDSpinEdit36.Enabled:=OK;
    DDSpinEdit40.Enabled:=OK;
    OK:=not(IfBlockGABB=1);
    DDSpinEdit25.Enabled:=OK;
    DDSpinEdit29.Enabled:=OK;
    DDSpinEdit33.Enabled:=OK;
    DDSpinEdit37.Enabled:=OK;
    DDSpinEdit41.Enabled:=OK;
    OK:=not(IfInSyn_al_EQ_beta=1);
    DDSpinEdit26.Enabled:=(OK and not(IfBlockAMPA=1));
    DDSpinEdit27.Enabled:=(OK and not(IfBlockNMDA=1));
    DDSpinEdit28.Enabled:=(OK and not(IfBlockGABA=1));
    DDSpinEdit29.Enabled:=(OK and not(IfBlockGABB=1));
    DDSpinEdit34.Enabled:=(OK and not(IfBlockAMPA=1));
    DDSpinEdit35.Enabled:=(OK and not(IfBlockNMDA=1));
    DDSpinEdit36.Enabled:=(OK and not(IfBlockGABA=1));
    DDSpinEdit37.Enabled:=(OK and not(IfBlockGABB=1));
    DDSpinEdit51.Enabled:=(NP0[1].IfSet_gL_or_tau=2);
    DDSpinEdit52.Enabled:=(NP0[2].IfSet_gL_or_tau=2);
    DDSpinEdit56.Enabled:=not({(NP0[1].HH_type='Passive')or}(IfBlockK=1));
    DDSpinEdit57.Enabled:=not((NP0[1].HH_type='Passive')or(IfBlockK=1));
    DDSpinEdit114.Enabled:=(NP0[1].HH_order<>'1-point');
    DDSpinEdit115.Enabled:=(NP0[2].HH_order<>'1-point');
    DDSpinEdit77.Enabled:=(NP0[1].HH_order<>'1-point');
    DDSpinEdit78.Enabled:=(NP0[2].HH_order<>'1-point');
    DDSpinEdit60.Enabled:=not(NP0[1].HH_type='Passive');
    DDSpinEdit61.Enabled:=not(NP0[2].HH_type='Passive');
    DDSpinEdit68.Enabled:=not(NP0[1].HH_type='Passive');
    DDSpinEdit69.Enabled:=not(NP0[2].HH_type='Passive');
    DDSpinEdit74.Enabled:=not({(NP0[1].HH_type='Passive')or}(IfBlockK=1));
    DDSpinEdit79.Enabled:=(CheckBox13.Checked)or(CheckBox17.Checked);
    DDSpinEdit82.Enabled:=(CheckBox13.Checked)or(CheckBox17.Checked);
    //DDSpinEdit83.Enabled:=(HH_type[1]='Passive');
    //DDSpinEdit84.Enabled:=(HH_type[2]='Passive');
    DDSpinEdit85.Enabled:=not((NP0[1].HH_type='Passive')or(IfBlockK=1));
    DDSpinEdit86.Enabled:=not((NP0[2].HH_type='Passive')or(IfBlockK=1));
    DDSpinEdit87.Enabled:=not((NP0[1].HH_type='Passive')or(IfBlockK=1));
    DDSpinEdit88.Enabled:=not((NP0[2].HH_type='Passive')or(IfBlockK=1));
    DDSpinEdit89.Enabled:=(IfSigmoidForPresynRate=1);
    DDSpinEdit108.Enabled:=not((NP0[1].HH_type='Passive')or(IfBlockK=1));
    DDSpinEdit109.Enabled:=not((NP0[2].HH_type='Passive')or(IfBlockK=1));
    DDSpinEdit110.Enabled:=not((NP0[1].HH_type='Passive')or(IfBlockK=1));
    DDSpinEdit111.Enabled:=not((NP0[2].HH_type='Passive')or(IfBlockK=1));
    DDSpinEdit116.Enabled:=(R.NP.IfThrModel=1);
    {--- for Synapses-Objects: }
    SetParamsOfSynapses;
    for i:=1 to NSyn do begin
        gsynC1.DDSpinEditA[i].Enabled:=(SP_[i].IfBlock=0);
    end;
  end;
  {--- for V1 ---}
//  Form3.DDSpinEdit4.Enabled:=(not(Form3.CheckBox2.Checked))and(Form4.ComboBox3.ItemIndex=1);//ThalamicStim. without PW
//  Form3.DDSpinEdit5.Enabled:=(not(Form3.CheckBox2.Checked)) or(Form4.ComboBox3.ItemIndex=2);//Visual stim. through LGN
//  Form3.DDSpinEdit6.Enabled:=(not(Form3.CheckBox2.Checked)) or(Form4.ComboBox3.ItemIndex=2);//Visual stim. through LGN
  Form3.DDSpinEdit4.Enabled:=(IfExtracellOrThalamOrVisualOrLGN_Stimul in [2,5]);
  Form3.DDSpinEdit5.Enabled:=(IfExtracellOrThalamOrVisualOrLGN_Stimul in [1,2,4,5]);
  Form3.DDSpinEdit6.Enabled:=(IfExtracellOrThalamOrVisualOrLGN_Stimul in [1,2,4,5]);
  Form3.DDSpinEdit19.Enabled:=(IfExtracellOrThalamOrVisualOrLGN_Stimul in [1]);
  Form3.DDSpinEdit20.Enabled:=(IfExtracellOrThalamOrVisualOrLGN_Stimul in [1]);
  Form3.ComboBox3.Enabled:=(IfExtracellOrThalamOrVisualOrLGN_Stimul in [2,5]);
  Form3.DDSpinEdit12.Enabled:=(Form3.CheckBox2.Checked);
  Form3.DDSpinEdit13.Enabled:=(Form3.CheckBox2.Checked)or(Form3.DDSpinEdit16.Value>0);
  Form4.ComboBox2.Visible:=not(Form3.CheckBox2.Checked);
//  Form4.ComboBox3.Visible:=not((Form3.CheckBox2.Checked)and(IfExtracellOrThalamOrVisualOrLGN_Stimul=2));
  //Form3.GroupBox6.Visible:=(Form3.CheckBox2.Checked);
  Form3.GroupBox5.Visible:=(IfExtracellOrThalamOrVisualOrLGN_Stimul=3);
  Form3.GroupBox7.Visible:=(IfExtracellOrThalamOrVisualOrLGN_Stimul=3);
  Form3.GroupBox10.Visible:=(IfExtracellOrThalamOrVisualOrLGN_Stimul in [1,2,5]);
  Form8.DDSpinEdit12.Enabled:=(IfExtracellOrThalamOrVisualOrLGN_Stimul=3);
  {--- for V1-ring ---}
  Form8.DDSpinEdit5.Enabled:=not(Form8.CheckBox1.Checked);
  Form8.DDSpinEdit11.Enabled:=not(Form8.CheckBox1.Checked);
  if Form8.ComboBox2.ItemIndex=0 then begin  {"exp"}
     //Form8.StaticText1.Caption:='r/pi=';
     Form8.DDSpinEdit8.Enabled:=true;
     Form8.DDSpinEdit9.Enabled:=true;
     Form8.DDSpinEdit10.Enabled:=true;
     Form8.DDSpinEdit11.Enabled:=true;
  end else begin                             {"cos"}
     //Form8.StaticText1.Caption:='q=';
     Form8.DDSpinEdit8.Enabled:=false;
     Form8.DDSpinEdit9.Enabled:=false;
     Form8.DDSpinEdit10.Enabled:=false;
     Form8.DDSpinEdit11.Enabled:=false;
  end;
  Form3.DDSpinEdit29.Enabled:=Form3.CheckBox10.Checked;
  Form3.DDSpinEdit30.Enabled:=Form3.CheckBox10.Checked;
  Form3.DDSpinEdit24.Enabled:=            (If_4x4=0)and((Form3.DDSpinEdit16.Value<>1)or(Form3.CheckBox11.Checked=true));
  Form3.DDSpinEdit25.Enabled:=(NPop<>1)and(If_4x4=0);
  Form3.DDSpinEdit26.Enabled:=(NPop<>1)and(If_4x4=0)and((Form3.DDSpinEdit16.Value<>1)or(Form3.CheckBox11.Checked=true)or(Form3.CheckBox5.Checked=false));
  Form3.DDSpinEdit27.Enabled:=(NPop<>1)and(If_4x4=0);
  Form3.DDSpinEdit21.Enabled:=(Form3.ComboBox3.ItemIndex in [0,1,2]);
  Form3.ComboBox6.Enabled:=(Form3.DDSpinEdit16.Value>0);
  Form3.CheckBox5.Enabled:=Form3.ComboBox6.Enabled;
  Form3.CheckBox6.Enabled:=Form3.ComboBox6.Enabled;
  Form3.CheckBox11.Enabled:=Form3.ComboBox6.Enabled;
  Form3.CheckBox13.Enabled:=Form3.ComboBox6.Enabled;
  Form26.DDSpinEdit18.Enabled:=(NPop>=3);
  Form26.DDSpinEdit19.Enabled:=(NPop>=3);
  Form26.DDSpinEdit25.Enabled:=(NPop>=3);
  Form26.DDSpinEdit26.Enabled:=(NPop>=2);
  Form26.DDSpinEdit27.Enabled:=(NPop>=2);
end;

procedure TakeParametersFromForms;
begin
  Change_HH_type(1);
  Change_HH_type(2);
  Change_HH_order(1);
  Change_HH_order(2);
  { Form4 . Comboboxes }
  case Form4.ComboBox2.ItemIndex of
  0: IfStimLayer2or4:=2;
  1: IfStimLayer2or4:=4;
  end;
  case Form4.ComboBox3.ItemIndex of
  0: IfExtracellOrThalamOrVisualOrLGN_Stimul:=1;
  1: IfExtracellOrThalamOrVisualOrLGN_Stimul:=2;
  2: IfExtracellOrThalamOrVisualOrLGN_Stimul:=3;
  3: IfExtracellOrThalamOrVisualOrLGN_Stimul:=4;
  4: IfExtracellOrThalamOrVisualOrLGN_Stimul:=5;
  end;
  case Form4.ComboBox4.ItemIndex of
  0: IfViewInLayer2or4:=2;
  1: IfViewInLayer2or4:=4;
  end;
  R.NP.If_I_V_or_g:=Form4.ComboBox6.ItemIndex+1;
  R.NP.IfThrModel:=IfTrue(Form4.CheckBox22.Checked);
  i3:=Form4.i3_Combo.ItemIndex+1;
  { Form4 . CheckBoxes }
  IfBlockAMPA:=IfTrue(Form4.CheckBox1.Checked);
  IfBlockNMDA:=IfTrue(Form4.CheckBox2.Checked);
  IfBlockGABA:=IfTrue(Form4.CheckBox3.Checked);
  IfBlockGABB:=IfTrue(Form4.CheckBox4.Checked);
  IfBlockK:=IfTrue(Form4.CheckBox6.Checked);
  NP0[1].IfBlockK  :=IfBlockK;
  NP0[1].IfBlockKM :=IfBlockK;
  NP0[1].IfBlockKA :=IfBlockK;
  NP0[1].IfBlockKD :=IfBlockK;
  NP0[1].IfBlockAHP:=IfBlockK;
  NP0[1].IfBlockH  :=IfBlockK;
  NP0[2].IfBlockK  :=IfBlockK;
  NP0[2].IfBlockKM :=IfBlockK;
  NP0[2].IfBlockKA :=IfBlockK;
  NP0[2].IfBlockKD :=IfBlockK;
  NP0[2].IfBlockAHP:=IfBlockK;
  NP0[2].IfBlockH  :=IfBlockK;
  IfInSyn_al_EQ_beta:=IfTrue(Form4.CheckBox5.Checked);
  IfSigmoidForPresynRate:=IfTrue(Form4.CheckBox15.Checked);
  IfEqForVGABA:=IfTrue(Form4.CheckBox16.Checked);
  If_m_Saturates:=IfTrue(Form4.CheckBox18.Checked);
  if (Form4.CheckBox12.Checked) then begin
      Form4.GroupBox3.Visible:=true;
      Form4.GroupBox5.Visible:=true;
      Form4.GroupBox8.Visible:=true;
      Form4.GroupBox9.Visible:=true;
      Form4.GroupBox11.Visible:=true;
      //Form4.GroupBox12.Visible:=true;
      Form4.GroupBox13.Visible:=true;
      Form4.GroupBox14.Visible:=true;
      Form4.GroupBox15.Visible:=true;
      Form4.GroupBox16.Visible:=true;
      Form4.GroupBox17.Visible:=true;
  end else begin
      Form4.GroupBox3.Visible:=false;
      Form4.GroupBox5.Visible:=false;
      Form4.GroupBox8.Visible:=false;
      Form4.GroupBox9.Visible:=false;
      Form4.GroupBox11.Visible:=false;
      Form4.GroupBox12.Visible:=false;
      Form4.GroupBox13.Visible:=false;
      Form4.GroupBox14.Visible:=false;
      Form4.GroupBox15.Visible:=false;
      Form4.GroupBox16.Visible:=false;
      Form4.GroupBox17.Visible:=false;
  end;
  NP0[1].IfPredictorCorrector:=IfTrue(Form4.CheckBox19.Checked);
  NP0[2].IfPredictorCorrector:=IfTrue(Form4.CheckBox19.Checked);
  {****************************************************************************}
  iPop_Ions_View:=imin(Form26.RadioGroup2.ItemIndex+1,NPop);  // 22.04.2017
  i_cut:=trunc(Form3.DDSpinEdit29.Value);
  h_cut:=trunc(Form3.DDSpinEdit30.Value);
  FieldToDraw:=Form15.Frame15.ComboBox1.Items[Form15.Frame15.ComboBox1.ItemIndex];
  If_4x4:=IfTrue(Form3.CheckBox12.Checked);
end;

end.
