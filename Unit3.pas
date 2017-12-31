unit Unit3;   {Form3 for 2D-slice}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, DDSpinEdit, Menus, TeEngine, Series, TeeProcs, Chart,
  Init, Frame_2DO,Correspond, ComCtrls;

type
  TForm3 = class(TForm)
    GroupBox1: TGroupBox;
    DDSpinEdit1: TDDSpinEdit;
    StaticText1: TStaticText;
    DDSpinEdit2: TDDSpinEdit;
    StaticText2: TStaticText;
    GroupBox2: TGroupBox;
    DDSpinEdit4: TDDSpinEdit;
    StaticText3: TStaticText;
    DDSpinEdit5: TDDSpinEdit;
    DDSpinEdit6: TDDSpinEdit;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    GroupBox3: TGroupBox;
    DDSpinEdit7: TDDSpinEdit;
    StaticText9: TStaticText;
    DDSpinEdit8: TDDSpinEdit;
    DDSpinEdit9: TDDSpinEdit;
    DDSpinEdit3: TDDSpinEdit;
    StaticText8: TStaticText;
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    GroupBox4: TGroupBox;
    CheckBox2: TCheckBox;
    DDSpinEdit12: TDDSpinEdit;
    DDSpinEdit13: TDDSpinEdit;
    StaticText10: TStaticText;
    StaticText11: TStaticText;
    Label5: TLabel;
    Label6: TLabel;
    DDSpinEdit10: TDDSpinEdit;
    DDSpinEdit11: TDDSpinEdit;
    Label3: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    GroupBox5: TGroupBox;
    DDSpinEdit17: TDDSpinEdit;
    DDSpinEdit18: TDDSpinEdit;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    ComboBox2: TComboBox;
    DDSpinEdit24: TDDSpinEdit;
    DDSpinEdit25: TDDSpinEdit;
    DDSpinEdit26: TDDSpinEdit;
    DDSpinEdit27: TDDSpinEdit;
    GroupBox7: TGroupBox;
    DDSpinEdit14: TDDSpinEdit;
    DDSpinEdit15: TDDSpinEdit;
    StaticText12: TStaticText;
    StaticText13: TStaticText;
    CheckBox3: TCheckBox;
    Label1: TLabel;
    DDSpinEdit16: TDDSpinEdit;
    Button3: TButton;
    DDSpinEdit19: TDDSpinEdit;
    DDSpinEdit20: TDDSpinEdit;
    StaticText14: TStaticText;
    StaticText15: TStaticText;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    GroupBox9: TGroupBox;
    ComboBox1: TComboBox;
    CheckBox8: TCheckBox;
    Button4: TButton;
    Button5: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series4: TLineSeries;
    Series13: TLineSeries;
    Series14: TLineSeries;
    Series15: TLineSeries;
    Series16: TLineSeries;
    Series17: TLineSeries;
    Chart3: TChart;
    Series8: TLineSeries;
    Series9: TLineSeries;
    Series11: TLineSeries;
    Series12: TLineSeries;
    Chart2: TChart;
    Series5: TLineSeries;
    Series6: TLineSeries;
    Series7: TLineSeries;
    Series10: TLineSeries;
    CheckBox5: TCheckBox;
    ComboBox3: TComboBox;
    DDSpinEdit21: TDDSpinEdit;
    StaticText16: TStaticText;
    StaticText17: TStaticText;
    DDSpinEdit22: TDDSpinEdit;
    DDSpinEdit23: TDDSpinEdit;
    DDSpinEdit28: TDDSpinEdit;
    Label2: TLabel;
    Series18: TLineSeries;
    Series19: TLineSeries;
    Series20: TLineSeries;
    Series21: TLineSeries;
    Series22: TLineSeries;
    Series23: TLineSeries;
    Series24: TLineSeries;
    Series25: TLineSeries;
    CheckBox9: TCheckBox;
    GroupBox8: TGroupBox;
    DDSpinEdit29: TDDSpinEdit;
    Label4: TLabel;
    CheckBox10: TCheckBox;
    DDSpinEdit30: TDDSpinEdit;
    GroupBox10: TGroupBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    Series26: TLineSeries;
    Chart4: TChart;
    LineSeries1: TLineSeries;
    LineSeries2: TLineSeries;
    LineSeries3: TLineSeries;
    LineSeries4: TLineSeries;
    LineSeries5: TLineSeries;
    LineSeries6: TLineSeries;
    LineSeries7: TLineSeries;
    LineSeries8: TLineSeries;
    LineSeries9: TLineSeries;
    Label7: TLabel;
    Series27: TLineSeries;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    DDSpinEdit31: TDDSpinEdit;
    StaticText18: TStaticText;
    CheckBox4: TCheckBox;
    ComboBox6: TComboBox;
    CheckBox13: TCheckBox;
    procedure DDSpinEdit1Change(Sender: TObject);
    procedure DDSpinEdit2Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DDSpinEdit4Change(Sender: TObject);
    procedure DDSpinEdit5Change(Sender: TObject);
    procedure DDSpinEdit6Change(Sender: TObject);
    procedure DDSpinEdit7Change(Sender: TObject);
    procedure DDSpinEdit9Change(Sender: TObject);
    procedure DDSpinEdit8Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DDSpinEdit10Change(Sender: TObject);
    procedure DDSpinEdit11Change(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure DDSpinEdit12Change(Sender: TObject);
    procedure DDSpinEdit2DblClick(Sender: TObject);
    procedure DDSpinEdit1DblClick(Sender: TObject);
    procedure DDSpinEdit10DblClick(Sender: TObject);
    procedure DDSpinEdit11DblClick(Sender: TObject);
    procedure DDSpinEdit26Change(Sender: TObject);
    procedure DDSpinEdit27Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DDSpinEdit24MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit25MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit26MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit27MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit24Change(Sender: TObject);
    procedure DDSpinEdit25Change(Sender: TObject);
    procedure DDSpinEdit16Change(Sender: TObject);
    procedure DDSpinEdit13Change(Sender: TObject);
    procedure DDSpinEdit18Change(Sender: TObject);
    procedure DDSpinEdit19Change(Sender: TObject);
    procedure DDSpinEdit20Change(Sender: TObject);
    procedure DDSpinEdit19DblClick(Sender: TObject);
    procedure DDSpinEdit20DblClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DDSpinEdit16DblClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure DDSpinEdit17DblClick(Sender: TObject);
    procedure DDSpinEdit21Change(Sender: TObject);
    procedure DDSpinEdit22Change(Sender: TObject);
    procedure DDSpinEdit22DblClick(Sender: TObject);
    procedure DDSpinEdit23Change(Sender: TObject);
    procedure DDSpinEdit23DblClick(Sender: TObject);
    procedure DDSpinEdit28DblClick(Sender: TObject);
    procedure DDSpinEdit28Change(Sender: TObject);
    procedure DDSpinEdit29Change(Sender: TObject);
    procedure CheckBox10Click(Sender: TObject);
    procedure DDSpinEdit5DblClick(Sender: TObject);
    procedure DDSpinEdit6DblClick(Sender: TObject);
    procedure DDSpinEdit30Change(Sender: TObject);
    procedure CheckBox12Click(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

procedure EmulateFieldsOfBipolarStimulation_WQ_Wrn;
procedure EmulateReceptiveFieldOfTheViewPoint;
  
implementation

uses Unit1,Unit4,Unit15,Unit20,Unit21,Unit24,Unit30,
     graph_2DO,slice_2DO,MathMyO,
     Stimulation,Stimulation_2D,MorfologyO,Erf_Hazard;

{$R *.DFM}

procedure TForm3.FormShow(Sender: TObject);
begin
//  DefaultParameters_2D;
  if Form3.CheckBox1.Checked then Form15.Visible:=true;
  Form15.Chart1.Visible:=Form3.CheckBox2.Checked;  //"On a circle=PinWheels"
//  if Form15.Chart1.Visible=false then Form15.Top:=680 else Form15.Top:=493;
  //Form3.Chart4.Visible:=false;
end;

procedure EmulateFieldsOfBipolarStimulation_WQ_Wrn;
var
     R_,S_R,ro_BP,dts_ :double;
     i,j :integer;
begin
  if nj=1 then exit;
  for i:=0 to ni+1 do begin
    for j:=0 to nj+1 do begin
      { distance from electrode center}
         R_:=sqrt(sqr((i-ni_stim) *dx)+sqr((j-nj_stim) *dy))*1e3; {mm}
         S_R:=      Iext{muA} * Sbipolar_Iext {mm^2/muA} / sqr(max(0.010{mm},R_));
      { Second Bipolar Electrode }
      if not((ni_stim2=0)and(nj_stim2=0)) then begin
         R_:=sqrt(sqr((i-ni_stim2)*dy)+sqr((j-nj_stim2)*dy))*1e3; {mm}
         S_R:=S_R + Iext{muA} * Sbipolar_Iext {mm^2/muA} / sqr(max(0.010{mm},R_));
      end;
      { Fraction of survived neurons of the population }
      ro_BP:=(1+Erfic(T_bipolar-S_R))/(1+Erfic(T_bipolar));
      dts_:=ts_end[1]/imax(Nts[1],1);
      WQ[1,i,j] :=(1-ro_BP)/dts_;
      Wrn[1,i,j]:=(1-ro_BP)/dts_;
    end;
  end;
  { Emulate intracortical morfology }
  if Form3.ComboBox2.ItemIndex>=1 then PoissonEq(r_axon[1,1],1,1);
  PatchyConnections;
end;

procedure EmulateReceptiveFieldOfTheViewPoint;
var
     i,j :integer;
begin
  if nj=1 then exit;
  { Emulate delta-function }
  for i:=0 to ni+1 do begin
    for j:=0 to nj+1 do begin
      WQ[1,i,j] :=0;
      Wrn[1,i,j]:=0;
    end;
  end;
  WQ[1,i_view,j_view] :=1;
  Wrn[1,i_view,j_view]:=1;
  { Emulate intracortical morfology }
  if Form3.ComboBox2.ItemIndex>=1 then PoissonEq(r_axon[1,1],1,1);
  PatchyConnections;
end;

{ SpinEdits }

procedure TForm3.DDSpinEdit1Change(Sender: TObject);
begin
  try
    ni:=imin(trunc(Form3.DDSpinEdit1.Value),mXMax);
  except
    ni:=10;
  end;
  ni_2:=trunc((ni+1)/2);
  if ni_stim=0 then begin
     ni_stim:=trunc(3/4*(ni+1));
     Form3.DDSpinEdit5.Value:=ni_stim;
  end;
  //EmulateFieldsOfBipolarStimulation_WQ_Wrn;
  Draw_Lattice('ElectricalStimulus',1);
end;

procedure TForm3.DDSpinEdit2Change(Sender: TObject);
begin
  try
    nj:=imin(trunc(Form3.DDSpinEdit2.Value),mYMax);
  except
    nj:=10;
  end;
  nj_2:=trunc((nj+1)/2);
  if nj_stim=0 then begin
     nj_stim:=trunc((nj+1)/2);
     Form3.DDSpinEdit6.Value:=nj_stim;
  end;
  //EmulateFieldsOfBipolarStimulation_WQ_Wrn;
  Draw_Lattice('ElectricalStimulus',1);
end;

procedure TForm3.DDSpinEdit4Change(Sender: TObject);
begin
  try
    R_stim:=trunc(Form3.DDSpinEdit4.Value);
  except
    R_stim:=10;
  end;
  //EmulateFieldsOfBipolarStimulation_WQ_Wrn;
  Draw_Lattice('ElectricalStimulus',1);
end;

procedure TForm3.DDSpinEdit21Change(Sender: TObject);
begin
  try
    R_decay:=trunc(Form3.DDSpinEdit21.Value);
  except
    R_decay:=10;
  end;
  //EmulateFieldsOfBipolarStimulation_WQ_Wrn;
  Draw_Lattice('ElectricalStimulus',1);
end;

procedure TForm3.DDSpinEdit5Change(Sender: TObject);
begin
  try
    ni_stim:=trunc(Form3.DDSpinEdit5.Value);
  except
    ni_stim:=ni_2;
  end;
  if i_view=0 then i_view:=ni_stim;
  //EmulateFieldsOfBipolarStimulation_WQ_Wrn;
  Draw_Lattice('ElectricalStimulus',1);
end;

procedure TForm3.DDSpinEdit6Change(Sender: TObject);
begin
  try
    nj_stim:=trunc(Form3.DDSpinEdit6.Value);
  except
    nj_stim:=nj_2;
  end;
  if j_view=0 then j_view:=nj_stim;
  //EmulateFieldsOfBipolarStimulation_WQ_Wrn;
  Draw_Lattice('ElectricalStimulus',1);
end;

procedure TForm3.DDSpinEdit10Change(Sender: TObject);
begin
  i_view:=imax(imin(trunc(Form3.DDSpinEdit10.Value),ni+1),0);
  //EmulateFieldsOfBipolarStimulation_WQ_Wrn;
  Draw_Lattice('ElectricalStimulus',1);
end;

procedure TForm3.DDSpinEdit11Change(Sender: TObject);
begin
  j_view:=imax(imin(trunc(Form3.DDSpinEdit11.Value),nj+1),0);
  //EmulateFieldsOfBipolarStimulation_WQ_Wrn;
  Draw_Lattice('ElectricalStimulus',1);
end;

procedure TForm3.DDSpinEdit19Change(Sender: TObject);
begin
  ni_stim2:=imax(imin(trunc(Form3.DDSpinEdit19.Value),ni+1),0);
  //EmulateFieldsOfBipolarStimulation_WQ_Wrn;
  Draw_Lattice('ElectricalStimulus',1);
end;

procedure TForm3.DDSpinEdit20Change(Sender: TObject);
begin
  nj_stim2:=imax(imin(trunc(Form3.DDSpinEdit20.Value),ni+1),0);
  //EmulateFieldsOfBipolarStimulation_WQ_Wrn;
  Draw_Lattice('ElectricalStimulus',1);
end;

procedure TForm3.DDSpinEdit16Change(Sender: TObject);
begin
  //EmulateFieldsOfBipolarStimulation_WQ_Wrn;
  Draw_Lattice('PatchyConnections',1);
  CorrespondParametersToTheForm;
end;

procedure TForm3.DDSpinEdit19DblClick(Sender: TObject);
begin
  Form3.DDSpinEdit19.Value:=0;
  ni_stim2:=trunc(Form3.DDSpinEdit19.Value);
  //EmulateFieldsOfBipolarStimulation_WQ_Wrn;
  Draw_Lattice('ElectricalStimulus',1);
end;

procedure TForm3.DDSpinEdit20DblClick(Sender: TObject);
begin
  Form3.DDSpinEdit20.Value:=0;
  nj_stim2:=trunc(Form3.DDSpinEdit20.Value);
  //EmulateFieldsOfBipolarStimulation_WQ_Wrn;
  Draw_Lattice('ElectricalStimulus',1);
end;

procedure TForm3.DDSpinEdit13Change(Sender: TObject);
begin
  rPW:=trunc(Form3.DDSpinEdit13.Value);  //radius of pinwheel
end;

procedure TForm3.DDSpinEdit7Change(Sender: TObject);
begin
  try
    dt_out:=Form3.DDSpinEdit7.Value/1000;
  except
    dt_out:=0.010 {s};
  end;
end;

procedure TForm3.DDSpinEdit8Change(Sender: TObject);
begin
  dx:=Form3.DDSpinEdit8.Value/1e6; {mum}
end;

procedure TForm3.DDSpinEdit9Change(Sender: TObject);
begin
  dy:=Form3.DDSpinEdit9.Value/1e6; {mum}
end;

{ Buttons }

procedure TForm3.Button1Click(Sender: TObject);
begin
  Form3.Button1.Enabled:=false;
  StopKey:='2';
  DecideIfThreadAndExecute;
  Form3.Button1.Enabled:=true;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  Form3.Series1.Clear;
  Form3.Series2.Clear;
  Form3.Series3.Clear;
  Form3.Series4.Clear;
  Form3.Series5.Clear;
  Form3.Series6.Clear;
  Form3.Series7.Clear;
  Form3.Series8.Clear;
  Form3.Series9.Clear;
  Form3.Series10.Clear;
  Form3.Series11.Clear;
  Form3.Series12.Clear;
  Form3.Series13.Clear;
  Form3.Series14.Clear;
  Form3.Series15.Clear;
  Form3.Series16.Clear;
  Form3.Series26.Clear;
  Form3.Series27.Clear;
  if (i_view2<=0)and(j_view2<=0) then begin
      Form3.Series18.Active:=false;
      Form3.Series19.Active:=false;
      Form3.Series20.Active:=false;
      Form3.Series21.Active:=false;
      Form3.Series22.Active:=false;
      Form3.Series23.Active:=false;
      Form3.Series24.Active:=false;
      Form3.Series25.Active:=false;
  end else begin
      Form3.Series18.Active:=true;
      Form3.Series19.Active:=true;
      Form3.Series20.Active:=true;
      Form3.Series21.Active:=true;
      Form3.Series22.Active:=true;
      Form3.Series23.Active:=true;
      Form3.Series24.Active:=true;
      Form3.Series25.Active:=true;
      Form3.Series18.Clear;
      Form3.Series19.Clear;
      Form3.Series20.Clear;
      Form3.Series21.Clear;
      Form3.Series22.Clear;
      Form3.Series23.Clear;
      Form3.Series24.Clear;
      Form3.Series25.Clear;
  end;
end;

procedure TForm3.CheckBox2Click(Sender: TObject);
{ PinWheel }
begin
  Draw_Lattice('PinWheels',1);
  WriteOneField('PinWheels');
  Form15.Chart1.Visible:=Form3.CheckBox2.Checked;  //"On a circle=PinWheels"
//28.05.2015  if Form3.CheckBox2.Checked then IfExtracellOrThalamOrVisualOrLGN_Stimul:=2;
  if Form3.CheckBox2.Checked then IfExtracellOrThalamOrVisualOrLGN_Stimul:=3; //25.12.2015
  CorrespondParametersToTheForm;
  SetInputAccordingToContrast;
end;

procedure TForm3.DDSpinEdit12Change(Sender: TObject);
begin
  Draw_Lattice('PinWheels',1);
end;

procedure TForm3.DDSpinEdit2DblClick(Sender: TObject);
begin
  Form3.DDSpinEdit2.Value:=1;
  j_view:=1;
end;

procedure TForm3.DDSpinEdit1DblClick(Sender: TObject);
begin
  Form3.DDSpinEdit1.Value:=1;
  i_view:=1;
end;

procedure TForm3.DDSpinEdit10DblClick(Sender: TObject);
begin
  Form3.DDSpinEdit10.Value:=1;
end;

procedure TForm3.DDSpinEdit11DblClick(Sender: TObject);
begin
  Form3.DDSpinEdit11.Value:=1;
end;

procedure TForm3.DDSpinEdit24Change(Sender: TObject);
begin
  r_axon[1,1]:=Form3.DDSpinEdit24.Value/1e6; {mum}
  if Form3.CheckBox12.Checked then begin   { 4x4 }
     r_axon[1,3]:=r_axon[1,1];
     r_axon[3,1]:=r_axon[1,1];
     r_axon[3,3]:=r_axon[1,1];
  end;
end;

procedure TForm3.DDSpinEdit25Change(Sender: TObject);
begin
  r_axon[2,1]:=Form3.DDSpinEdit25.Value/1e6; {mum}
  if Form3.CheckBox12.Checked then begin   { 4x4 }
     r_axon[2,3]:=r_axon[2,1];
     r_axon[4,1]:=r_axon[2,1];
     r_axon[4,3]:=r_axon[2,1];
  end;
end;

procedure TForm3.DDSpinEdit26Change(Sender: TObject);
begin
  r_axon[1,2]:=Form3.DDSpinEdit26.Value/1e6; {mum}
  if Form3.CheckBox12.Checked then begin   { 4x4 }
     r_axon[1,4]:=r_axon[1,2];
     r_axon[3,2]:=r_axon[1,2];
     r_axon[3,4]:=r_axon[1,2];
  end;
end;

procedure TForm3.DDSpinEdit27Change(Sender: TObject);
begin
  r_axon[2,2]:=Form3.DDSpinEdit27.Value/1e6; {mum}
  if Form3.CheckBox12.Checked then begin   { 4x4 }
     r_axon[2,4]:=r_axon[2,2];
     r_axon[4,2]:=r_axon[2,2];
     r_axon[4,4]:=r_axon[2,2];
  end;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
  WriteVisualStimulation;
end;

procedure TForm3.DDSpinEdit24MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Rose(@r_axon[1,1]);
end;

procedure TForm3.DDSpinEdit25MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Rose(@r_axon[2,1]);
end;

procedure TForm3.DDSpinEdit26MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Rose(@r_axon[1,2]);
end;

procedure TForm3.DDSpinEdit27MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Rose(@r_axon[2,2]);
end;

procedure TForm3.DDSpinEdit18Change(Sender: TObject);
begin
  t_stim2 :=Form3.DDSpinEdit18.Value/1e3; //second stimulus
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
  Form21.Visible:=true;
end;

procedure TForm3.DDSpinEdit16DblClick(Sender: TObject);
begin
  Form3.DDSpinEdit16.Value:=0;
  //EmulateFieldsOfBipolarStimulation_WQ_Wrn;
  Draw_Lattice('PatchyConnections',1);
end;

procedure TForm3.Button5Click(Sender: TObject);
begin
  Form24.Visible:=true;
end;

procedure TForm3.DDSpinEdit17DblClick(Sender: TObject);
begin
  Form3.DDSpinEdit17.Value:=0;
end;

procedure TForm3.DDSpinEdit22Change(Sender: TObject);
begin
  LagOfDS:=Form3.DDSpinEdit22.Value/1e3; {s}
end;

procedure TForm3.DDSpinEdit22DblClick(Sender: TObject);
begin
  Form3.DDSpinEdit22.Value:=0;
end;

procedure TForm3.DDSpinEdit23Change(Sender: TObject);
begin
  if (i_view2=0)and(j_view2=0)and(Form3.DDSpinEdit23.Value<>0) then
      Form3.DDSpinEdit28.Value:=1;
  i_view2:=imax(imin(trunc(Form3.DDSpinEdit23.Value),ni+1),0);
//  EmulateFieldsOfBipolarStimulation_WQ_Wrn;
  Draw_Lattice('ElectricalStimulus',1);
end;

procedure TForm3.DDSpinEdit23DblClick(Sender: TObject);
begin
  Form3.DDSpinEdit23.Value:=0;
end;

procedure TForm3.DDSpinEdit28DblClick(Sender: TObject);
begin
  Form3.DDSpinEdit28.Value:=0;
end;

procedure TForm3.DDSpinEdit28Change(Sender: TObject);
begin
  j_view2:=imax(imin(trunc(Form3.DDSpinEdit28.Value),nj+1),0);
  //EmulateFieldsOfBipolarStimulation_WQ_Wrn;
  Draw_Lattice('ElectricalStimulus',1);
end;

procedure TForm3.DDSpinEdit29Change(Sender: TObject);
begin
  i_cut:=trunc(Form3.DDSpinEdit29.Value);
  Draw_Lattice('ElectricalStimulus',1);
end;

procedure TForm3.CheckBox10Click(Sender: TObject);
begin
  IfCut:=IfTrue(Form3.CheckBox10.Checked);
  DisableSpinEdits;
  Draw_Lattice('ElectricalStimulus',1);
end;

procedure TForm3.DDSpinEdit5DblClick(Sender: TObject);
begin
  Form3.DDSpinEdit5.Value:=ni_2;
end;

procedure TForm3.DDSpinEdit6DblClick(Sender: TObject);
begin
  Form3.DDSpinEdit6.Value:=nj_2;
end;

procedure TForm3.DDSpinEdit30Change(Sender: TObject);
begin
  h_cut:=trunc(Form3.DDSpinEdit30.Value);
  Draw_Lattice('ElectricalStimulus',1);
end;

procedure TForm3.CheckBox12Click(Sender: TObject);
begin
  If_4x4:=IfTrue(Form3.CheckBox12.Checked);
  Form3.DDSpinEdit24.Enabled:=(If_4x4=0);
  Form3.DDSpinEdit25.Enabled:=(If_4x4=0);
  Form3.DDSpinEdit26.Enabled:=(If_4x4=0);
  Form3.DDSpinEdit27.Enabled:=(If_4x4=0);
  Form30.Visible:=(If_4x4=1);
  CorrespondParametersToTheForm;
end;

procedure TForm3.ComboBox3Change(Sender: TObject);
begin
  DisableSpinEdits;
end;

procedure TForm3.ComboBox5Change(Sender: TObject);
begin
  if Form3.ComboBox5.ItemIndex=4 then Form3.StaticText18.Caption:='Constant, %'
                                 else Form3.StaticText18.Caption:='min, %';
end;

procedure TForm3.ComboBox6Change(Sender: TObject);
begin
  //EmulateFieldsOfBipolarStimulation_WQ_Wrn;
  Draw_Lattice('PatchyConnections',1);
end;

end.
