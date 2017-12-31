unit V1O;
{ **********************************************************************
  The subprogram simulates a column of V1.
  **********************************************************************}

interface
procedure RingParameters;
procedure PrepareParameters_and_CreateAColumn;
procedure V1HyperColumn;

var
    pn1_smeared :double;

implementation
uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls, ComCtrls, ExtCtrls,
     Init,t_dtO,typeNrnParsO,MathMyO,Stimulation,slice,other,
     graph_0d,graph_2DO, wave,
     Unit1,Unit2,Unit3,Unit4,Unit5,Unit8,Unit16,Unit12,Unit18,
     Correspond,V1_liasonO,slice_2DO,
     ConnectionsO,ColumnO,RepresentativesO,KFP_ringO,ThresholdO,BackgroundO,
     MappingsO;


procedure RingParameters;
begin
  ni:=20;
  { Stimulation }
  t_end:=0.1{s};
//  dt:=0.0002;
  tSt:=0.5{s};
  Iext:=10{muA};
  Qns:=10;
  I_ind:=0;
  { Adaptation }
  NP0[1].gKM:=0;
  NP0[1].gAHP:=0;
  { Dispersion }
  Nts[1]:=50;  ts_end[1]:=0.050{s};
  Nts[2]:=50;  ts_end[2]:=0.050{s};
  { Synapses }
  IfBlockAMPA:=0;  IfBlockGABA:=0;  IfBlockNMDA:=1;  IfBlockGABB:=1;
  SP_[iOfSyn('AMP3 on P')].gmax:=0.2;
  SP_[iOfSyn('AMP3 on I')].gmax:=0;
  SP_[iOfSyn('GAB3 on P')].gmax:=0;
  SP_[iOfSyn('GAB3 on I')].gmax:=0;
  SP_[iOfSyn('AMPA on P')].gmax:=0;
  SP_[iOfSyn('AMPA on I')].gmax:=0.1;
  SP_[iOfSyn('GABA on P')].gmax:=1.0;
  SP_[iOfSyn('GABA on I')].gmax:=0;
  { Column-object }
  CorrespondParametersToTheForm;
end;

procedure PrintTime;
var t1 :string;
begin
   str(t*1000:7:2,t1);
   t1:='t='+t1+' ms';
//   outtextxy(20,2,t1);
   Form8.Label4.Caption:=t1;
end;

procedure nuI_by_nuE(i:integer; var nuI_,J0_,J1_:double);
{ Checking approximation of nuI(nuE) used to map CBRD to KFP }
var  Gain_I,nuE,nuE_av,q11,q21,q12,fi_r12,fi_r11,fi_r21,phi12,phi02,
     Vrest_I,Vrest_E,Vreset_I, S_E,S_I,dnuI_dphi12,dV11,dV12,dV21,dV22,
     c02,c11,c12,c21,c22,m02,m11,m21,m12,m22,
     fi0,VT_E,VT_I, k_Joh_I,I0_Joh_I,R_I,tau_I, a,b,c
                                                                 :double;
     ii,i02,i11,i21,i12,i22                                      :integer;
begin
  { phi02 }
  if t_stim2=0 then t_stim2 :=Form3.DDSpinEdit18.Value/1e3;    //second stimulus
  if t<t_stim2 then  fi0:=Form3.DDSpinEdit12.Value/180*pi  //orientation
               else  fi0:=Form3.DDSpinEdit17.Value/180*pi;
  phi02:=Qns+pext_Iext{Hz/muA}*Iext{muA}*(1+cos(i/ni*2*pi-pi-fi0));
  { phi12 }
  nuE:=Columns[i,1].Pop[1].nu;
  q_and_fi_r_on_Ring(1,2,q12,fi_r12);
  q_and_fi_r_on_Ring(1,1,q11,fi_r11);
  q_and_fi_r_on_Ring(2,1,q21,fi_r21);
  nuE_av:=0;
  for ii:=1 to ni do begin nuE_av:=nuE_av+Columns[ii,1].Pop[1].nu/ni; end;
  phi12:=nuE_av+q12*(nuE-nuE_av);
  { ***** }
  S_E     :=AColumn.Pop[1].PP.NP.Square{cm^2};
  S_I     :=AColumn.Pop[2].PP.NP.Square{cm^2};
  Vrest_E :=AColumn.Pop[1].PP.NP.Vrest;//Columns[i,1].Pop[1].U;
  Vrest_I :=AColumn.Pop[2].PP.NP.Vrest;//Columns[i,1].Pop[2].U;
  Vreset_I:=AColumn.Pop[2].PP.NP.Vreset;
  VT_E:=VThreshold3(AColumn.Pop[1].PP.NP, 0.5{V/s}, 0.100{ms});//AColumn.Pop[1].PP.NP.FixThr+AColumn.Pop[1].PP.NP.ThrShift;
  VT_I:=VThreshold3(AColumn.Pop[2].PP.NP, 0.5{V/s}, 0.100{ms});//AColumn.Pop[2].PP.NP.FixThr+AColumn.Pop[2].PP.NP.ThrShift;
  tau_I:=AColumn.Pop[2].PP.NP.tau_m0;
  R_I  :=AColumn.Pop[2].PP.NP.tau_m0/AColumn.Pop[2].PP.NP.C_membr/
         AColumn.Pop[2].PP.NP.Square/1e3; {MOhms}
  i02:=iOfSyn('AMP3 on I');
  i11:=iOfSyn('AMPA on P');
  i21:=iOfSyn('GABA on P');
  i12:=iOfSyn('AMPA on I');
  i22:=iOfSyn('GABA on I');
  m11:=Max_K(AColumn.Syn[i11].SP.alpha,AColumn.Syn[i11].SP.beta);
  m02:=Max_K(AColumn.Syn[i02].SP.alpha,AColumn.Syn[i02].SP.beta);
  m21:=Max_K(AColumn.Syn[i21].SP.alpha,AColumn.Syn[i21].SP.beta);
  m12:=Max_K(AColumn.Syn[i12].SP.alpha,AColumn.Syn[i12].SP.beta);
  m22:=Max_K(AColumn.Syn[i22].SP.alpha,AColumn.Syn[i22].SP.beta);
  LinearApproxOfJoh(Vrest_I*1000,(VT_I+Vrest_I)*1000,Vreset_I*1000,
                    (VT_I+Vrest_I)*1000,tau_I*1000,R_I,
                    sgm_V[2]*sqrt(2)*1000,0, k_Joh_I,I0_Joh_I{pA});
  //if KFP<>nil then Gain_I  :=KFP.k_Joh{Hz/pA}*S{cm^2}*1e9 {cm^2/s/mA}
  //            else
//  Gain_I  :=1/ AColumn.Pop[2].PP.NP.C_membr
//             /(VT_I+Vrest_I-AColumn.Pop[2].PP.NP.Vreset); {cm^2/mF/V}
  Gain_I  :=k_Joh_I{Hz/pA}*S_I{cm^2}*1e9; {cm^2/s/mA}
  c02       :=AColumn.Syn[i02].SP.gmax/m02; {mS*s/cm^2}
  c11       :=AColumn.Syn[i11].SP.gmax/m11; {mS*s/cm^2}
  c21       :=AColumn.Syn[i21].SP.gmax/m21; {mS*s/cm^2}
  c12       :=AColumn.Syn[i12].SP.gmax/m12; {mS*s/cm^2}
  c22       :=AColumn.Syn[i22].SP.gmax/m22; {mS*s/cm^2}
  dV11 :=Vrest_E-VAMPA     {08.05.2009:}+VT_E*0;
  dV12 :=Vrest_I-VAMPA+VT_I*0{08.05.2009: +VT_I; 21.10.2009:}+I0_Joh_I*R_I/1e6;
  dV21 :=Vrest_E-VGABA     {08.05.2009:}+VT_E*0;
  dV22 :=Vrest_I-VGABA+VT_I*0{08.05.2009: +VT_I; 21.10.2009:}+I0_Joh_I*R_I/1e6;
  dnuI_dphi12:=-Gain_I/(1+Gain_I*c22*dV22)*c12*dV12;
  {*************************************}
  nuI_:=Gain_I/(1+Gain_I*c22*dV22)
       *(-c12*dV12*phi12 - c02*dV12*phi02 - I0_Joh_I{pA}/S_I/1e9);
  {*************************************}
  J1_:=(-c11*dV11*q11 -c21*dV21*q21*dnuI_dphi12*q12)*S_E*1e9;{pA*s}
  J0_:=(-c11*dV11     -c21*dV21    *dnuI_dphi12    )*S_E*1e9;{pA*s}
  { Quadratic eq. for approximation U2=(nu/k+I0)*R }
{  a:=c22*S_I*R_I*1e3;
  b:=1+Gain_I*c22*(2*I0_Joh_I*R_I/1e6 + Vrest_I - VGABA);
  c:=  Gain_I*(c12*dV12*phi12 + c02*dV12*phi02 + I0_Joh_I/S_I/1e9);
  if (a>0)and(b*b>4*a*c) then nuI_:=(-b+sqrt(b*b-4*a*c))/2/a;}
end;

procedure DrawChain;
var  i,L,L_1,L_2    :integer;
     J0_,J1_,nuI_   :double;
begin
  PrintTime;
  Form8.Series1.Clear;
  Form8.Series2.Clear;
  Form8.Series3.Clear;
  Form8.Series4.Clear;
  Form8.Series5.Clear;
  Form8.Series6.Clear;
  Form8.Series7.Clear;
  Form8.Series9.Clear;
  Form8.Chart3.Visible:=Form8.CheckBox2.Checked;
  L:=4-IfViewInLayer2or4;
  L_1:=L+1; L_2:=L+2; if L_2>NPop  then L_2:=2;
  for i:=0 to ni+1 do begin
      Form8.Series1.AddXY(i/ni*360-180, Columns[i,1].Pop[L_1].U*1e3);
      Form8.Series2.AddXY(i/ni*360-180, Columns[i,1].rn[1,1]);
      Form8.Series3.AddXY(i/ni*360-180, Columns[i,1].Pop[L_1].nu);
      Set_Ps_Ring(i,1,pext);
      Form8.Series4.AddXY(i/ni*360-180, Columns[i,1].rext);
      Form8.Series9.AddXY(i/ni*360-180, Columns[i,1].Pop[L_1].Isyn);
      if KFP<>nil then nuI_by_nuE(i,nuI_,J0_,J1_) else nuI_:=0;
      Form8.Series5.AddXY(i/ni*360-180, nuI_);
      Form8.Series6.AddXY(i/ni*360-180, Columns[i,1].Pop[L_2].U*1e3);
      Form8.Series7.AddXY(i/ni*360-180, Columns[i,1].Pop[L_2].nu);
  end;
  Application.ProcessMessages;
end;

procedure WriteChain;
var  i,ip :integer;
     s1   :string;
     pext :double;
begin
  { One file *************************************************}
  s1:='V1(t,x).dat';
  assign(xxx,s1);
  if (nt=1)or(abs(t-dt_out)<dt) then begin
     rewrite(xxx);
     writeln(xxx,'ZONE T="',s1,'"');
     writeln(xxx,'I=',ni+1:3,',J=',trunc(t_end/dt_out):3,',K=1,F=POINT');
  end else append(xxx);
  for i:=0 to ni do begin
      Set_Ps_Ring(i,1,pext);
      write  (xxx,t*1000:9:5,' ',(i/ni-0.5)*180:9:5);
      write  (xxx,' ',Columns[i,1].Pop[1].U*1e3:8:4,' ',Columns[i,1].rn[1,1]:8:4);
      write  (xxx,' ',Columns[i,1].Pop[1].nu:8:4,' ',pext:8:4);
      if NPop>=2 then for ip:=2 to NPop do begin
         write(xxx,' ',Columns[i,1].Pop[ip].U*1e3:8:4,' ',Columns[i,1].Pop[ip].nu:8:4);
      end;
      writeln(xxx);
  end;
  close(xxx);
end;

procedure ClassicRingSynCurrentForColumn(i,j :integer);
{ Calculates synaptic current as in the classic ring model [Hansel et al.] }
var    k,CosOrExp,IfStimulate,ifBG                         :integer;
       S,add,adS,ex,fo_k,
       II0,II1,J0,J1,K0,K1,L0,L1,fi_r,
       teta1,teta2,t_Teta2,tSt_start,tSt_end,tBG,teta0,II  :double;
begin
  { Read parameters }
  II0:=Form16.DDSpinEdit25.Value {pA}  ;
  II1:=Form16.DDSpinEdit26.Value {pA}  ;
  J0 :=Form16.DDSpinEdit27.Value {pA/Hz};
  J1 :=Form16.DDSpinEdit28.Value {pA/Hz};
  K0 :=Form16.DDSpinEdit30.Value {pS};
  K1 :=Form16.DDSpinEdit31.Value {pS};
  L0 :=Form16.DDSpinEdit32.Value {pS/Hz};
  L1 :=Form16.DDSpinEdit33.Value {pS/Hz};
  { Connections }
  fi_r:=Form16.DDSpinEdit29.Value/180*pi; {deg.}
  CosOrExp:=Form16.ComboBox2.ItemIndex+1;
  teta1:=(Form16.DDSpinEdit13.Value+180)/180*pi;
  teta2:=(Form16.DDSpinEdit17.Value+180)/180*pi;
  t_Teta2:=Form16.DDSpinEdit18.Value/1e3;
  tSt_start:=Form16.DDSpinEdit35.Value/1e3;
  tSt_end  :=Form16.DDSpinEdit36.Value/1e3;
  tBG      :=Form16.DDSpinEdit37.Value/1e3;
  with Columns[i,j].Pop[1] do begin
       S:=PP.NP.Square{cm^2};
       add:=0;  adS:=0;
       for k:=0 to (ni-1) do begin
           fo_k:=Columns[k,j].Pop[1].nu;
           case CosOrExp of
           1: begin
                add:=add + fo_k*(J0 + J1*Cos(2*pi*(i-k)/ni));
                adS:=adS + fo_k*(L0 + L1*Cos(2*pi*(i-k)/ni));
              end;
           2: begin
                if fi_r=0 then ex:=1 else ex:=exp(-abs(2*pi*(i-k)/ni/fi_r));
                add:=add + fo_k*(J0 + J1*ex);
                adS:=adS + fo_k*(L0 + L1*ex);
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
       sE:=(adS/ni+( K0+ K1*Cos(2*pi*i/ni - teta0)*(1-ifBG))*IfStimulate)/S/1e9;{mS/cm^2}
       uE:=(add/ni+(II0+II1*Cos(2*pi*i/ni - teta0)*(1-ifBG))*IfStimulate)/S/1e9
          + sE*(PP.NP.Vrest-Vus);                         {mA/cm^2}
       uI:=0;      sI:=0;
       //uu:=uE+uI;  ss:=sE+sI;
       Isyn:=(-(sE+sI)*(PP.NP.Vrest-Vus) + uE + uI)*PP.NP.Square*1e9;
  end;
end;

procedure PrepareParameters_and_CreateAColumn;
begin
  if KeepParams=0 then  CommonParameters;
  ParametersFromFiles;
  Form4.ComboBox3.ItemIndex:=1;   // Thalamic stimulation
  IfExtracellOrThalamOrVisualOrLGN_Stimul:=2; // Thalamic stimulation
  Form3.CheckBox2.Checked:=true;  // Pinwheels
  OtherParameters;
  CorrespondParametersToTheForm;
  { Initial conditions }
//  InitialConditions;
//  InitialConditionsHodgkin;
  //PrepareParamsForColumnCreation;
  if IfAColumnCreated then begin AColumn.Free; IfAColumnCreated:=false; end;
  AColumn:=TColumn.Create;      IfAColumnCreated:=true;
end;

{=====================================================================}
procedure V1HyperColumn;
{
  Simulation by the ring model.
}
var
      Qold1,Qold2,pIE,r_                                        :double;
      i,j,ip,jp,k,iFunc,ntP,nl,n_dr_,nj_mem,i_view_,j_view_     :integer;
begin
  {**********************************}
  { BG }
  if Form4.CheckBox11.Checked then CalculateBackground('V1Hypercolumn');
  PrepareParameters_and_CreateAColumn;
  AColumn.InitialConditions;
  {**********************************}
  nj_mem:=nj; nj:=1; j:=1; j_view_:=1; i_view_:=trunc(Form8.DDSpinEdit12.Value);
  for i:=0 to ni+1 do begin
          Columns[i,j]:=TColumn.Create;
          Columns[i,j].CopyInitialConditionsFrom(AColumn);
          { BG }
          if IfBGColumnCreated then
          Columns[i,j].CopyInitialConditionsFrom(BGColumn);
  end;
  AColumn.EquateFrom(Columns[i_view_,j_view_]);
  PrepareFormForRepresentativeNeuronsO;
  InitiateRepresentativeNeuronsO;
  if DrawOrNot =1 then  Initial_Picture;
  if WriteOrNot=1 then  InitiateWriting;
  //t:=0;   nt:=0;
  {****************************************************************************}
  REPEAT
    { ----- Step ----- }
    t:=t+dt;   nt:=nt+1;
    for i:=0 to ni+1 do begin
          Columns[i,j].IntegrateDensity;
    end;
    { External input }
    for i:=0 to ni+1 do begin
          {******************}
          Set_Ps_Ring(i,j,Columns[i,j].rext);
          {******************}
    end;
    { Firing propagation }
    for ip:=1 to NPop do begin
        for jp:=1 to NPop do begin
            FieldsOfThePop_From_Columns(ip,jp);
            {*********************}
            AnalytPoissonEq(ip,jp);
            {*********************}
            Columns_From_FieldsOfThePop(ip,jp);
        end;
    end;
    { Synaptic currents and membrane potential }
    for i:=0 to ni+1 do begin
        if Form8.CheckBox2.Checked then ClassicRingSynCurrentForColumn(i,j) else
        Columns[i,j].IntegrateSynapticCurrents;
        for ip:=1 to NPop do begin
            Columns[i,j].Pop[ip].Iind:=Current_Iind(2-(ip mod 2),Columns[i,j].Pop[ip].r_Noise);
            Columns[i,j].Pop[ip].sI  :=Columns[i,j].Pop[ip].sI
                                      +Conductance_Sind(2-(ip mod 2));
        end;
        Columns[i,j].IntegrateVoltage;
    end;
    Renamination_2D;
    {**************************************}
    AColumn.EquateFrom(Columns[i_view_,j_view_]);
    OneStepForRepresentativeNeuronsO(@t,@dt);
    { Measurement }
    MeasureInNode;
    { Drawing }
    n_dr_  :=trunc(Form8.DDSpinEdit3.Value);   n_show:=n_dr_;
    i_view_:=trunc(Form8.DDSpinEdit12.Value);
    if if_ni_nj_ne_1(i_view_,j_view_) and ((nt mod n_dr_= 0)or(nt=1)) then begin
       Evolution;
       PrintTime;
       GraphicsFor1or2Nodes(i_view_,j_view_,i_view2,j_view2);
       Draw_1D_Plots(j_view_);
       ip:=imin(Form12.ComboBox1.ItemIndex+1,NPop);
       Columns[i_view_,j_view_].Pop[ip].Draw;
       Draw_Conductances(Columns[i_view_,j_view_]);
       if Form18.Visible then RunInspector;
       if (nt mod n_DrawPhase=0)and(Form2.Visible) then DrawPhaseSpace;
    end;
    if ((trunc(nt/n_dr_)=nt/n_dr_)or(nt=1))then DrawChain;
    if (dt_out>0)and((nt=1)or(abs(t-trunc(t/dt_out)*dt_out)<dt)) then WriteChain;
    if (WriteOrNot=1) and (trunc(nt/2)=nt/2) then Writing;
    MyThread1.Treat_Key;
    Application.ProcessMessages;
    Pause;
  UNTIL nt>=nt_end;
  { Destroy columns }
  for i:=0 to ni+1 do begin
          for k:=1 to NSyn do Columns[i,j].Syn[k].Free;
          Columns[i,j].Free;
  end;
  { BG }
  if IfBGColumnCreated then BGColumn.Free;  IfBGColumnCreated:=false;
//  AColumn.Free;   IfAColumnCreated:=false;
  DestroyRepresentativeNeuronsO;
  nj:=nj_mem;
//  StartMusic;
end;

end.
