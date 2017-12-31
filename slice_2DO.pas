unit slice_2DO;

interface
uses Math,
     Init,t_dtO,ColumnO,Unit12,Unit17;

procedure DefaultParameters_2D;
procedure WriteExtractedField;
procedure FieldsOfThePop_From_Columns(ip,jp :integer);
procedure Columns_From_FieldsOfThePop(ip,jp :integer);
function if_ni_nj_ne_1(i,j :integer) :boolean;
procedure Renamination_2D;
procedure System_2D;

var
   Columns            :array[0..mXmax,0..mYmax] of TColumn;

implementation
uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls, ComCtrls, ExtCtrls,
     MathMyO,Stimulation,Stimulation_2D,Slice,other,
     graph_0d, graph_2DO,wave,Unit1,Unit2,Unit3,Unit4,Unit5,Unit15,Unit18,Unit25,
     LGN_Unit1,
     Correspond,
     ConnectionsO,RepresentativesO,MorfologyO,BackgroundO,LFPO,BoldO,LGN_main;

procedure DefaultParameters_2D;
  procedure put (var x:double;  val:double);   begin if x=0 then x:=val; end;
  procedure iput(var x:integer; val:integer);  begin if x=0 then x:=val; end;
begin
  put(r_axon[1,1],0.000120{m});       put(r_axon[2,1],0.000120{m});
  put(r_axon[1,2],0.000120{m});       put(r_axon[2,2],0.000120{m});
  If_4x4:=0;
  T_bipolar:=2; {=max_dV/sgm_V/sqrt(2)}
{************************ Calculation parameters ********************}
//  dt:=0.000025/1.5;
  iput(ni,20);  iput(nj,1);
//  Nts:=30; ts_end:=0.090{s};
//  t_end:=0.100{s};
  ni_2:=trunc((ni+1)/2);
  nj_2:=trunc((nj+1)/2);
  iput(R_stim,4);  ni_stim:=trunc(3/4*(ni+1));  nj_stim:=trunc((nj+1)/2);
  rPW:=6;
  LagOfDS:=0;
  put(dx,r_axon[1,1]/3);   dy:=dx;   {Courant condition}
  dx2:=dx/2;               dy2:=dy/2;
  OrderOfWaveEq:=2;
  { Output file }
  dt_out:=0.001 {s};
  WriteOrNot:=1;
  FieldToDraw:='nu1';
{*****************************************************************}
{  KeepParams:=0;
  CommonParameters;
  CorrespondParametersToTheForm;}
end;

procedure WriteExtractedField;
var  i,j    :integer;
     s1,s2  :string;
     z      :arr_X_Y;
begin
  { Prepare field }
  //s1:=Form15.Frame15.ComboBox1.Items[Form15.Frame15.ComboBox1.ItemIndex];
  ExtractFieldFromColumns(FieldToDraw,z);
  { Prepare file }
  str(round(t*1000):3, s2);
  s1:='xy_'+s1+'_'+s2+'.dat';
  assign(bbb,s1);  rewrite(bbb);
  writeln(bbb,'ZONE T="',s1,'"');
  writeln(bbb,'I=',nj:3,',J=',ni:3,',K=1,F=POINT');
  { Write fields }
  for i:=1 to ni do  for j:=1 to nj do if if_ni_nj_ne_1(i,j) then begin
           {           V1               V2               V3              }
           writeln(bbb,i*dx*1e3:9:5,' ',j*dy*1e3:9:5,' ',z[i,j]:10:4);
  end;
  close(bbb);
end;

procedure WritingColumns;
var  i,j,ip :integer;
     s1     :string;
     z      :arr_X_Y;
begin
  { Prepare field }
  ExtractFieldFromColumns(FieldToDraw,z);      //VSD is instead of "z" since 18.05.2016
  { Prepare file }
  str(round(t*1000):3, s1);
  s1:='xy'+s1+'e.dat';
  assign(bbb,s1);  rewrite(bbb);
  writeln(bbb,'ZONE T="',s1,'"');
  writeln(bbb,'I=',nj:3,',J=',ni:3,',K=1,F=POINT');
  { Write fields }
  for i:=1 to ni do  for j:=1 to nj do if if_ni_nj_ne_1(i,j) then begin
      with Columns[i,j] do begin
           {           V1               V2               V3              }
           write  (bbb,i*dx*1e3:9:5,' ',j*dy*1e3:9:5,' ',rext:8:2,' ');
           {                                    U1-V4        nu1-V5      }
           {                                    U2-V6        nu2-V7      }
           {                                    U3-V8        nu3-V9      }
           {                                    U4-V10       nu4-V11     }
           for ip:=1 to NPop do   write(bbb,Pop[ip].U*1e3:9:5,' ',Pop[ip].nu:8:2,' ');
           for ip:=NPop+1 to 4 do write(bbb,'0 0 ');
           {         V12                                                 }
           write(bbb,VisualStimulation(t,i,j):9:5,' ');
           {         V13             V14                                 }
           write(bbb,z[i,j]:10:4,' ',Pop[1].sE+Pop[1].sI:9:5,' ');
           {                        V15                                  }
           if NPop>1 then write(bbb,Pop[2].sE+Pop[2].sI:9:5,' ') else write(bbb,'0 ');
           {         V16                                                 }
           if (Form25.Visible)and(Form25.CheckBox1.Checked) {2D LFP} then
           write(bbb,Calculate_LFP(Columns[i,j].Pop[1],Columns[i,j].Ions[1]):9:5,' ') else
           write(bbb,VSD(Columns[i,j]):9:5,' ');
           writeln(bbb);
      end;
  end;
  close(bbb);
end;

procedure Renamination_2D;
var  i,j,ip :integer;
begin
    for i:=0 to ni+1 do begin
        for j:=0 to nj+1 do if if_ni_nj_ne_1(i,j) then begin
            with Columns[i,j] do
            for ip:=1 to NPop do begin
                 rold[ip]:=r[ip]; r[ip]:=rn[ip];
                 u[ip]:=un[ip];
                 v[ip]:=vn[ip];
            end;
        end;
    end;
end;

procedure FieldsOfThePop_From_Columns(ip,jp :integer);
var
   i,j                    :integer;
begin
  for i:=0 to ni+1 do begin
      for j:=0 to nj+1 do if if_ni_nj_ne_1(i,j) then begin
          WQ[1,i,j] :=Columns[i,j].Q[ip];
          WdQdt[1,i,j]:=Columns[i,j].dQdt[ip];
          Wr[1,i,j] :=Columns[i,j].r[ip,jp];
          Wu[1,i,j] :=Columns[i,j].u[ip,jp];
          Wv[1,i,j] :=Columns[i,j].v[ip,jp];
          Wrn[1,i,j]:=Columns[i,j].rn[ip,jp];
          Wun[1,i,j]:=Columns[i,j].un[ip,jp];
          Wvn[1,i,j]:=Columns[i,j].vn[ip,jp];
          Ww[1,i,j] :=Columns[i,j].w[ip,jp];
      end;
  end;
end;

procedure Columns_From_FieldsOfThePop(ip,jp :integer);
var
   i,j                    :integer;
begin
  for i:=0 to ni+1 do begin
      for j:=0 to nj+1 do if if_ni_nj_ne_1(i,j) then begin
          Columns[i,j].Q[ip] :=WQ[1,i,j];
          Columns[i,j].dQdt[ip]:=WdQdt[1,i,j];
          Columns[i,j].r[ip,jp] :=Wr[1,i,j] ;
          Columns[i,j].u[ip,jp] :=Wu[1,i,j] ;
          Columns[i,j].v[ip,jp] :=Wv[1,i,j] ;
          Columns[i,j].rn[ip,jp]:=Wrn[1,i,j];
          Columns[i,j].un[ip,jp]:=Wun[1,i,j];
          Columns[i,j].vn[ip,jp]:=Wvn[1,i,j];
          Columns[i,j].w[ip,jp] :=Ww[1,i,j];
      end;
  end;
end;

procedure AxonalDelayForTheConnection(ip,jp :integer);
var   i,j                    :integer;
begin
  for i:=0 to ni+1 do begin
      for j:=0 to nj+1 do if if_ni_nj_ne_1(i,j) then begin
          WQ[1,i,j]:=Columns[i,j].Pop[ip].ro_at_ts(t_axon[2-(ip mod 2),2-(jp mod 2)]);
      end;
  end;
end;

function if_ni_nj_ne_1(i,j :integer) :boolean;
begin
  if_ni_nj_ne_1:=true;
  if (ni=1)and((i=0)or(i=2)) or
     (nj=1)and((j=0)or(j=2)) then if_ni_nj_ne_1:=false;
end;

procedure Warnings;
var t1,t2 :string;
begin
  if (Form3.ComboBox2.ItemIndex=0) and
     ((dt/dx*r_axon[1,1]/t_axon[1,1]>=1) or
      (dt/dx*r_axon[2,2]/t_axon[2,2]>=1)) then begin
     str(dt/dx*r_axon[1,1]/t_axon[1,1] :9:3,t1);
     str(dt/dx*r_axon[2,2]/t_axon[2,2] :9:3,t2);
     Form17.Memo1.Lines.Add('dt/dx*r_axon/t_axon > 1, '+t1+', '+t2);
     Form17.Visible:=true;
     Form17.BringToFront;
     //nt_end:=0;
     Application.ProcessMessages;
  end;
end;

procedure ParameterDistribution(i,j :integer);
var w,wmin :double;
    is_    :integer;
begin
  if Form3.ComboBox4.ItemIndex=0 then Exit;
  { Profile }
  w:=1;
  wmin:=Form3.DDSpinEdit31.Value/100;
  case Form3.ComboBox5.ItemIndex of
  0: w:=wmin+(1-wmin)*i/(ni+1);          // linear: min-left, 1-right
  1: w:=1   -(1-wmin)*i/(ni+1);          // linear: 1-left, min-right
  2: w:=sqr(1-i/(ni+1));                 // square: 1-left, 0-right
  3: if j=trunc((nj+1)/2) then begin     // horiz. line: min-left, 1-right
        w:=wmin+(1-wmin)*i/(ni+1);
     end;
  4: if j=trunc((nj+1)/2) then begin     // horiz. line: constant
        w:=wmin;
     end;
  end;
  { Field }
  case Form3.ComboBox4.ItemIndex of
  1: begin   { gGABA }
       is_:=iOfSyn('GABA on P');
       Columns[i,j].Syn[is_].SP.gmax:=w*Columns[i,j].Syn[is_].SP.gmax;
     end;
  2: begin   { gAMPA }
       is_:=iOfSyn('AMPA on P');
       Columns[i,j].Syn[is_].SP.gmax:=w*Columns[i,j].Syn[is_].SP.gmax;
     end;
  end;
end;

{**************************************************************************}
procedure System_2D;
{
}
var
      i,j,ip,jp,ip2,jp2,n_dr_,k     :integer;
      s1                            :string;
begin
  { BG }
  if Form4.CheckBox11.Checked then begin
     if Form3.CheckBox2.Checked then CalculateBackground('2D')
                                else CalculateBackground('ZeroStimul');
  end else begin  t:=0; nt:=0;  end;
  { Parameters }
  LGN_Status:='MainProgramIsRunning';
  if KeepParams=0 then  CommonParameters;
  ParametersFromFiles;
  OtherParameters;
  CorrespondParametersToTheForm;
  ReadExpData;
  { Initial conditions }
  //PrepareParamsForColumnCreation;
  AColumn:=TColumn.Create;       IfAColumnCreated:=true;
  AColumn.InitialConditions;
  { BG }
  if IfBGColumnCreated then
     AColumn.CopyInitialConditionsFrom(BGColumn);
  for i:=0 to ni+1 do begin
      for j:=0 to nj+1 do if if_ni_nj_ne_1(i,j) then begin
          Columns[i,j]:=TColumn.Create;
          Columns[i,j].CopyInitialConditionsFrom(AColumn);
          ParameterDistribution(i,j);
      end;
  end;
  AColumn.EquateFrom(Columns[i_view,j_view]);
  if IfExtracellOrThalamOrVisualOrLGN_Stimul in [4,5] {LGN} then LGN_InitialConditions;
  //t:=0;   nt:=0;
  PrepareFormForRepresentativeNeuronsO;
  InitiateRepresentativeNeuronsO;
  if DrawOrNot =1 then  Initial_Picture;
  if WriteOrNot=1 then  InitiateWriting;
  Warnings;
  {****************************************************************************}
  REPEAT
    { Density Eq. }
    t:=t+dt;   nt:=nt+1;
    for i:=0 to ni+1 do begin
        for j:=0 to nj+1 do if if_ni_nj_ne_1(i,j) then begin
            {****************************}
            Columns[i,j].IntegrateDensity;
            {****************************}
        end;
    end;
    { External input }
    if (IfExtracellOrThalamOrVisualOrLGN_Stimul in [4,5])and(nt mod 10=0) then begin
        LGN_RunOneStep(t,10*dt);  {LGN}
    end;
    for i:=0 to ni+1 do begin
        for j:=0 to nj+1 do if if_ni_nj_ne_1(i,j) then begin
            IntegrateNoise(Columns[i,j]);
            {*******************************}
            Set_Ps_2D(i,j,Columns[i,j].rext);
            {*******************************}
            BipolarElectrodeStimulation_2D(i,j);
        end;
    end;
    { Propagation }
    for ip:=1 to NPop do begin      {presynaptic}
        for jp:=1 to NPop do begin  {postsynaptic}
            ip2:=ip; jp2:=jp;
            if If_4x4=0 then begin ip2:=2-(ip mod 2); jp2:=2-(jp mod 2); end;
            FieldsOfThePop_From_Columns(ip,jp);
            {***************************************************}
            case Form3.ComboBox2.ItemIndex of
            0: begin     { Wave equation }
                 AxonalDelayForTheConnection(ip,jp);
                 AxonEquation(1,r_axon[ip2,jp2],t_axon[ip2,jp2]);
                 BoundaryConditions(1);
               end;
            1,2,3: begin   { Integral with exp(-d) or exp(-d^2) or d-dep. delays}
                 AxonalDelayForTheConnection(ip,jp);
                 PoissonEq(r_axon[ip2,jp2],ip,jp);
               end;
            end;
            {***********************************************************}
            //if (ip2=1)and(jp2=1) then      //before 3.07.2012
//            if ((Npop=2)and(ip=1)and((jp=1)or(jp=2))) or
//               ((Npop=4)and(ip=3)and((jp=3)or((jp=4)and(Form3.CheckBox3.Checked)))) then begin
            if ((ip2=1)and(jp2=1)) or
               ((((ip=1)and(jp=2)) or ((ip=3)and(jp=4)))
                and Form3.CheckBox5.Checked{to I-cells}) then begin //it was CheckBox3 before 11.05.2013
                 PatchyConnections;
            end;
            {***********************************************************}
            Columns_From_FieldsOfThePop(ip,jp);
        end;
    end;
    { Synaptic currents and membrane potential }
    for i:=0 to ni+1 do begin
        for j:=0 to nj+1 do if if_ni_nj_ne_1(i,j) then begin
            {*************************************}
            Columns[i,j].IntegrateSynapticCurrents;
            Columns[i,j].ChangeReversalPotentialsAccordingToIonConcentrations;
            for ip:=1 to NPop do Columns[i,j].Pop[ip].Iind:=
                Current_Iind(2-(ip mod 2),Columns[i,j].Pop[ip].r_Noise);
            {*************************************}
            Columns[i,j].IntegrateVoltage;
            {*************************************}
        end;
    end;
    Renamination_2D;
    {**************************************}
    AColumn.EquateFrom(Columns[i_view,j_view]);
    OneStepForRepresentativeNeuronsO(@t,@dt);
    { Measurement }
    MeasureInNode;
    { Drawing }
    n_dr_:=trunc(Form3.DDSpinEdit3.Value);   n_show:=n_dr_;
    if (nt mod n_dr_ = 0) then begin
//       s1:=Form15.Frame15.ComboBox1.Items[Form15.Frame15.ComboBox1.ItemIndex];
       Draw_Lattice(FieldToDraw,j_view);
       LGN_Draw(t);
       if Form3.CheckBox2.Checked then ExtractRingFromPinWheels(s1,100,'Draw');      { RING }
       Evolution;
    end;
    if if_ni_nj_ne_1(i_view,j_view) and ((nt mod n_dr_= 0)or(nt=1)) then begin
       PrintTime;
       GraphicsFor1or2Nodes(i_view,j_view,i_view2,j_view2);
       Draw_Conductances(Columns[i_view,j_view]);
       Draw_1D_Plots(j_view);
       ip:=imin(Form12.ComboBox1.ItemIndex+1,NPop);
       Columns[i_view,j_view].Pop[ip].Draw;
       Draw_LFP( Columns[i_view,j_view].Pop[1],Columns[i_view,j_view].Ions[1]);
       BOLD.Draw(Columns[i_view,j_view].Pop[1+2*trunc((Npop-1)/2)].nu);
       if IfDynamic_K_Cl=1 then Columns[i_view,j_view].Ions[iPop_Ions_View].Draw;
       if Form18.Visible then RunInspector;
    end;
    if (trunc(nt/n_DrawPhase)=nt/n_DrawPhase)and(Form2.Visible) then
                              DrawPhaseSpace;
    { Writing }
    if (nt mod n_Write = 0) or (nt=1) then begin
       if (i_view2>0)or(j_view2>0) then
       WriteFromNode(Columns[i_view2,j_view2],'WriteFromNode2.dat');
       WriteFromNode(Columns[i_view, j_view ],'WriteFromNode.dat');
       Write_Conductances(Columns[i_view,j_view]);
       Write_LFP_FromNode(Columns[i_view,j_view].Pop[1],Columns[i_view,j_view].Ions[1]);
       ExtractRingFromPinWheels('nu1',100,'Write');  { RING }
       if WriteOrNot=1 then Writing;
    end;
    dt_out:=Form3.DDSpinEdit7.Value/1000;
    if (abs(t-0.001)<dt)or(abs(t-trunc(t/dt_out)*dt_out)<dt) then WritingColumns;
    MyThread1.Treat_Key;
    Application.ProcessMessages;
    if (Form1.Pausejustbeforetend1.Checked)and(nt=nt_end-1) then StopKey:='P';
    Pause;
  UNTIL nt>=nt_end;
  {****************************************************************************}
//  if WriteOrNot=1 then  close(ccc);
  { Destroy columns }
  for i:=0 to ni+1 do begin
      for j:=0 to nj+1 do if if_ni_nj_ne_1(i,j) then begin
          for k:=1 to NSyn do Columns[i,j].Syn[k].Free;
          Columns[i,j].Destroy;
          Columns[i,j]:=nil;
      end;
  end;
  { BG }
  if IfBGColumnCreated then begin
     BGColumn.Free; BGColumn:=nil;  IfBGColumnCreated:=false;
  end;
//  AColumn.Free;   IfAColumnCreated:=false;
  DestroyRepresentativeNeuronsO;
  LGN_Status:='';
  StartMusic;
  PrintScreen;
end;
{--------------------EOF---------------------------------------------------}

end.
