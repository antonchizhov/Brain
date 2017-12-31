unit LGN_Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  LGN_Init,LGN_main,LGN_Unit15,LGN_Unit33,LGN_SaveLoadParameters,
  StdCtrls, DDSpinEdit, ExtCtrls, TeEngine, Series,
  TeeProcs, Chart, ComCtrls;

type
  TLGN_Form1 = class(TForm)
    Button1: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DDSpinEdit1: TDDSpinEdit;
    DDSpinEdit2: TDDSpinEdit;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    DDSpinEdit3: TDDSpinEdit;
    DDSpinEdit4: TDDSpinEdit;
    DDSpinEdit5: TDDSpinEdit;
    Label5: TLabel;
    DDSpinEdit6: TDDSpinEdit;
    Label6: TLabel;
    DDSpinEdit7: TDDSpinEdit;
    Label7: TLabel;
    DDSpinEdit8: TDDSpinEdit;
    Label8: TLabel;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    DDSpinEdit9: TDDSpinEdit;
    DDSpinEdit10: TDDSpinEdit;
    GroupBox4: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    DDSpinEdit11: TDDSpinEdit;
    DDSpinEdit12: TDDSpinEdit;
    GroupBox5: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    DDSpinEdit14: TDDSpinEdit;
    DDSpinEdit15: TDDSpinEdit;
    RadioGroup1: TRadioGroup;
    ComboBox1: TComboBox;
    DDSpinEdit17: TDDSpinEdit;
    Label17: TLabel;
    DDSpinEdit16: TDDSpinEdit;
    Label16: TLabel;
    DDSpinEdit18: TDDSpinEdit;
    Label18: TLabel;
    Label13: TLabel;
    DDSpinEdit13: TDDSpinEdit;
    Label19: TLabel;
    DDSpinEdit19: TDDSpinEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Chart1: TChart;
    Series1: TLineSeries;
    Chart2: TChart;
    LineSeries1: TLineSeries;
    Button3: TButton;
    Button4: TButton;
    TabSheet3: TTabSheet;
    Chart3: TChart;
    LineSeries2: TLineSeries;
    Button5: TButton;
    Button6: TButton;
    Series2: TLineSeries;
    GroupBox6: TGroupBox;
    Label20: TLabel;
    DDSpinEdit20: TDDSpinEdit;
    DDSpinEdit21: TDDSpinEdit;
    Label21: TLabel;
    DDSpinEdit22: TDDSpinEdit;
    Label22: TLabel;
    DDSpinEdit23: TDDSpinEdit;
    Label23: TLabel;
    TabSheet4: TTabSheet;
    Chart4: TChart;
    Series3: TLineSeries;
    Label24: TLabel;
    DDSpinEdit24: TDDSpinEdit;
    Button8: TButton;
    DDSpinEdit25: TDDSpinEdit;
    Label25: TLabel;
    GroupBox7: TGroupBox;
    DDSpinEdit26: TDDSpinEdit;
    Label26: TLabel;
    Series4: TLineSeries;
    Series5: TLineSeries;
    Label27: TLabel;
    CheckBox1: TCheckBox;
    DDSpinEdit27: TDDSpinEdit;
    Label28: TLabel;
    ComboBox2: TComboBox;
    Button9: TButton;
    Button2: TButton;
    DDSpinEdit28: TDDSpinEdit;
    Label29: TLabel;
    Chart5: TChart;
    Label30: TLabel;
    Series6: TLineSeries;
    Series7: TLineSeries;
    Button7: TButton;
    Button10: TButton;
    DDSpinEdit29: TDDSpinEdit;
    Label31: TLabel;
    DDSpinEdit30: TDDSpinEdit;
    Label32: TLabel;
    DDSpinEdit31: TDDSpinEdit;
    Label33: TLabel;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    DDSpinEdit32: TDDSpinEdit;
    Label34: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DDSpinEdit8Change(Sender: TObject);
    procedure DDSpinEdit17DblClick(Sender: TObject);
    procedure DDSpinEdit1DblClick(Sender: TObject);
    procedure DDSpinEdit8Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure DDSpinEdit11Click(Sender: TObject);
    procedure DDSpinEdit19Click(Sender: TObject);
    procedure DDSpinEdit12Click(Sender: TObject);
    procedure DDSpinEdit13Click(Sender: TObject);
    procedure DDSpinEdit11Change(Sender: TObject);
    procedure DDSpinEdit19Change(Sender: TObject);
    procedure DDSpinEdit12Change(Sender: TObject);
    procedure DDSpinEdit13Change(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure DDSpinEdit25Click(Sender: TObject);
    procedure DDSpinEdit25Change(Sender: TObject);
    procedure DDSpinEdit26DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure DDSpinEdit28Change(Sender: TObject);
    procedure DDSpinEdit28Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure DDSpinEdit20DblClick(Sender: TObject);
    procedure DDSpinEdit23DblClick(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure DDSpinEdit32Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LGN_Form1: TLGN_Form1;
  LGN_Status :string;

implementation
uses LGN_Lattice;

{$R *.dfm}

procedure InitializeAndRunOneStep;
begin
  LGN_Status:='MainProgramIsRunning';
  LGN_InitialConditions;
  LGN_RunOneStep(0,0);
  Define_z_view;
  Draw_Lattice(Pz, ni,nj,rPW, IfGray);
  LGN_Status:='';
end;

procedure TLGN_Form1.Button1Click(Sender: TObject);
begin
  if LGN_Status='MainProgramIsRunning' then exit;
  LGN_Form1.Button1.Enabled:=false;
  RunTillTheEnd;
  WriteParametersInFile;
  WriteNonlinearFunction;
  LGN_Form1.Button1.Enabled:=true;
end;

procedure GradientDefaultSize;
begin
  LGN_Form1.DDSpinEdit22.Enabled:=false;
  LGN_Form1.DDSpinEdit17.Enabled:=true;
  LGN_Form1.DDSpinEdit27.Enabled:=false;
  { Gradient }
  if (LGN_Form1.ComboBox1.ItemIndex= 3) then begin
     LGN_Form1.Label2.Caption:='Radius, grad';
     LGN_Form1.DDSpinEdit2.Value:=2;        {Length}
     LGN_Form1.DDSpinEdit27.Enabled:=true;
     LGN_Form1.DDSpinEdit27.Value:=LGN_Form1.DDSpinEdit17.Value;  {MeanStimLum=Background}
     LGN_Form1.DDSpinEdit17.Value:=0;       {Background = 0}
  end;
  { not Gradient }
  if (LGN_Form1.ComboBox1.ItemIndex<>3) then begin
     LGN_Form1.Label2.Caption:='Length, grad';
     LGN_Form1.DDSpinEdit2.Value:=1;        {Length}
  end;
  { Bar }
  if (LGN_Form1.ComboBox1.ItemIndex=0) then begin
     LGN_Form1.Label2.Caption:='Width, grad';
  end;
  { Gratings or Gradient}
  if (LGN_Form1.ComboBox1.ItemIndex in [1,3,7]) then begin
     if LGN_Form1.DDSpinEdit27.Value{MeanStimLum}<LGN_Form1.DDSpinEdit6.Value{AmplOfStimLum} then
     LGN_Form1.DDSpinEdit27.Value:=LGN_Form1.DDSpinEdit17.Value{AmplOfStimLum}+LGN_Form1.DDSpinEdit6.Value; {Background}
     LGN_Form1.DDSpinEdit22.Enabled:=(LGN_Form1.ComboBox1.ItemIndex=7);
  end;
  { Spot }
  if (LGN_Form1.ComboBox1.ItemIndex=4) then begin
     LGN_Form1.Label2.Caption:='Radius_1, grad';
     LGN_Form1.DDSpinEdit2.Value:=0.5;      {Length}
  end;
  { Ring }
  if (LGN_Form1.ComboBox1.ItemIndex=5) then begin
     LGN_Form1.Label2.Caption:='Radius_1, grad';
     LGN_Form1.DDSpinEdit2.Value:=0.5;      {Length}
     LGN_Form1.DDSpinEdit22.Enabled:=true;
  end;
end;

procedure TLGN_Form1.FormShow(Sender: TObject);
begin
  if LGN_Status='MainProgramIsRunning' then exit;
  { Gradient's default size }
  GradientDefaultSize;
  { Refresh }
  InitializeAndRunOneStep;
end;

procedure TLGN_Form1.DDSpinEdit8Change(Sender: TObject);
begin
  t_LGN:=LGN_Form1.DDSpinEdit8.Value{ms}/1000;
end;

procedure TLGN_Form1.DDSpinEdit17DblClick(Sender: TObject);
begin
  LGN_Form1.DDSpinEdit17.Value:=0;
end;

procedure TLGN_Form1.DDSpinEdit1DblClick(Sender: TObject);
begin
  LGN_Form1.DDSpinEdit1.Value:=0;
end;

procedure TLGN_Form1.DDSpinEdit8Click(Sender: TObject);
{ Step by step }
begin
  if LGN_Status='MainProgramIsRunning' then exit;
  t_LGN:=LGN_Form1.DDSpinEdit8.Value{ms}/1000;
  LGN_RunOneStep(t_LGN,LGN_Form1.DDSpinEdit8.Increment{ms}/1000);
  LGN_Draw(t_LGN);
end;

procedure TLGN_Form1.RadioGroup1Click(Sender: TObject);
begin
  if LGN_Status='MainProgramIsRunning' then exit;
  LGN_Form15.Visible:=true;
  { Draw Lattice }
  Define_z_view;
  Draw_Lattice(Pz, ni,nj,rPW, IfGray);
end;

procedure TLGN_Form1.Button3Click(Sender: TObject);
begin
  if LGN_Status='MainProgramIsRunning' then exit;
  LGN_Form1.Button3.Enabled:=false;
  InitializeAndRunOneStep;
  LGN_Form1.Button3.Enabled:=true;
end;

procedure TLGN_Form1.ComboBox1Change(Sender: TObject);
begin
  if LGN_Status='MainProgramIsRunning' then exit;
  { Gradient's default size }
  GradientDefaultSize;
  { Refresh }
  InitializeAndRunOneStep;
end;

procedure TLGN_Form1.Button4Click(Sender: TObject);
begin
  if LGN_Status='MainProgramIsRunning' then exit;
  LGN_Form1.Button4.Enabled:=false;
  RunEntireDiagram;
  WriteParametersInFile;
  WriteNonlinearFunction;
  LGN_Form1.Button4.Enabled:=true;
end;

procedure TLGN_Form1.Button5Click(Sender: TObject);
begin
  LGN_Form1.Chart2.CopyToClipboardBitmap;
end;

procedure TLGN_Form1.Button6Click(Sender: TObject);
begin
  LGN_Form1.Chart3.CopyToClipboardBitmap;
end;

procedure TLGN_Form1.DDSpinEdit11Click(Sender: TObject);
begin
  DrawReceptiveField;
end;

procedure TLGN_Form1.DDSpinEdit19Click(Sender: TObject);
begin
  DrawReceptiveField;
end;

procedure TLGN_Form1.DDSpinEdit12Click(Sender: TObject);
begin
  DrawReceptiveField;
end;

procedure TLGN_Form1.DDSpinEdit13Click(Sender: TObject);
begin
  DrawReceptiveField;
end;

procedure TLGN_Form1.DDSpinEdit11Change(Sender: TObject);
begin
  if LGN_Form1.DDSpinEdit11.Value>0 then
  DrawReceptiveField;
end;

procedure TLGN_Form1.DDSpinEdit19Change(Sender: TObject);
begin
  if LGN_Form1.DDSpinEdit19.Value>0 then
  DrawReceptiveField;
end;

procedure TLGN_Form1.DDSpinEdit28Change(Sender: TObject);
begin
  if LGN_Form1.DDSpinEdit28.Value>0 then
  DrawReceptiveField;
end;

procedure TLGN_Form1.DDSpinEdit28Click(Sender: TObject);
begin
  DrawReceptiveField;
end;

procedure TLGN_Form1.DDSpinEdit12Change(Sender: TObject);
begin
  if LGN_Form1.DDSpinEdit12.Value>0 then
  DrawReceptiveField;
end;

procedure TLGN_Form1.DDSpinEdit13Change(Sender: TObject);
begin
  DrawReceptiveField;
end;

procedure TLGN_Form1.Button7Click(Sender: TObject);
begin
  LGN_Form1.Chart4.CopyToClipboardBitmap;
end;

procedure TLGN_Form1.Button8Click(Sender: TObject);
begin
  LGN_Form1.Chart1.CopyToClipboardBitmap;
end;

procedure TLGN_Form1.DDSpinEdit25Click(Sender: TObject);
begin
  DrawReceptiveField;
end;

procedure TLGN_Form1.DDSpinEdit25Change(Sender: TObject);
begin
  if LGN_Form1.DDSpinEdit25.Value>0 then
  DrawReceptiveField;
end;

procedure TLGN_Form1.DDSpinEdit26DblClick(Sender: TObject);
begin
  LGN_Form1.DDSpinEdit26.Value:=0;
end;

procedure TLGN_Form1.Button2Click(Sender: TObject);
begin
  SaveParameters;
end;

procedure TLGN_Form1.Button9Click(Sender: TObject);
begin
  LGN_LoadParameters;
  if LGN_Status='MainProgramIsRunning' then exit;
  { Refresh }
  InitializeAndRunOneStep;
end;

procedure TLGN_Form1.Button10Click(Sender: TObject);
begin
  LGN_Form1.Chart5.CopyToClipboardBitmap;
end;

procedure TLGN_Form1.DDSpinEdit20DblClick(Sender: TObject);
begin
  LGN_Form1.DDSpinEdit20.Value:=0;
end;

procedure TLGN_Form1.DDSpinEdit23DblClick(Sender: TObject);
begin
  LGN_Form1.DDSpinEdit23.Value:=0;
end;

procedure TLGN_Form1.CheckBox2Click(Sender: TObject);
begin
  LGN_Form33.Visible:=(LGN_Form1.CheckBox2.Checked)and(LGN_Form1.Visible);
end;

procedure TLGN_Form1.DDSpinEdit32Change(Sender: TObject);
begin
  Off_shift:=LGN_Form1.DDSpinEdit32.Value;
  if Off_shift<>0 then LGN_Form1.CheckBox3.Checked:=true;
end;

end.
