unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DDSpinEdit, TeEngine, Series, ExtCtrls, TeeProcs,
  Chart, Init;

type
  TForm8 = class(TForm)
    GroupBox3: TGroupBox;
    DDSpinEdit7: TDDSpinEdit;
    StaticText9: TStaticText;
    DDSpinEdit3: TDDSpinEdit;
    StaticText8: TStaticText;
    Button1: TButton;
    Button2: TButton;
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    GroupBox2: TGroupBox;
    StaticText3: TStaticText;
    StaticText6: TStaticText;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    DDSpinEdit1: TDDSpinEdit;
    StaticText2: TStaticText;
    StaticText1: TStaticText;
    DDSpinEdit2: TDDSpinEdit;
    Series3: TLineSeries;
    Series4: TLineSeries;
    DDSpinEdit6: TDDSpinEdit;
    Chart2: TChart;
    Series6: TLineSeries;
    Series7: TLineSeries;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Button5: TButton;
    Button6: TButton;
    Series5: TPointSeries;
    DDSpinEdit4: TDDSpinEdit;
    DDSpinEdit5: TDDSpinEdit;
    StaticText5: TStaticText;
    StaticText7: TStaticText;
    StaticText4: TStaticText;
    Button3: TButton;
    CheckBox1: TCheckBox;
    DDSpinEdit8: TDDSpinEdit;
    DDSpinEdit9: TDDSpinEdit;
    StaticText10: TStaticText;
    StaticText11: TStaticText;
    StaticText12: TStaticText;
    StaticText13: TStaticText;
    DDSpinEdit10: TDDSpinEdit;
    DDSpinEdit11: TDDSpinEdit;
    CheckBox2: TCheckBox;
    Button4: TButton;
    Chart3: TChart;
    Series9: TLineSeries;
    GroupBox4: TGroupBox;
    ComboBox3: TComboBox;
    DDSpinEdit12: TDDSpinEdit;
    StaticText14: TStaticText;
    procedure Button1Click(Sender: TObject);
    procedure DDSpinEdit1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DDSpinEdit7Change(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox2Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

uses  Unit1,Unit3,Unit4,Unit16, V1O, ThresholdO,
      KFP_ringO,ColumnO,ConnectionsO,Correspond,V1_liasonO,MathMyO,
      MappingsO;

{$R *.dfm}

procedure TForm8.Button1Click(Sender: TObject);
begin
//  if KFP=nil then Map_CBRD_to_KFP;
  StopKey:='C';
  DecideIfThreadAndExecute;
end;

procedure TForm8.DDSpinEdit1Change(Sender: TObject);
begin
  ni:=trunc(Form8.DDSpinEdit1.Value);
end;

procedure TForm8.Button2Click(Sender: TObject);
begin
  Form8.Series1.Clear;
  Form8.Series2.Clear;
  Form8.Series3.Clear;
  Form8.Series4.Clear;
  Form8.Series6.Clear;
  Form8.Series7.Clear;
end;

procedure TForm8.Button4Click(Sender: TObject);
begin
  if KFP=nil then Map_CBRD_to_KFP;
  Form8.CheckBox2.Checked:=true;
  Map_KFP_to_CBRD;
  StopKey:='C';
  DecideIfThreadAndExecute;
  Form8.CheckBox2.Checked:=false;
end;

procedure TForm8.DDSpinEdit7Change(Sender: TObject);
begin
  dt_out:=Form8.DDSpinEdit7.Value/1000;
end;

procedure TForm8.Button3Click(Sender: TObject);
begin
  PrepareParameters_and_CreateAColumn;
  {****************}
  Map_2d_CBRD_to_Ring;
  {****************}
//  Map_CBRD_to_KFP;
  {*************}
end;

procedure TForm8.Button5Click(Sender: TObject);
{ "Map CBRD to KFP" }
begin
  Form8.Button5.Enabled:=false;
  Form16.Visible:=true;
  {****************}
//  Map_2d_CBRD_to_Ring;
  {**************}
  Map_CBRD_to_KFP;
  {**************}
  Form8.Button5.Enabled:=true;
end;

procedure TForm8.Button6Click(Sender: TObject);
  { Map conductance-based ring model to KFP-ring model
    with II0,II1,J0,J1 coefficients for FR-model
    and run KFP-ring model. }
begin
  Form16.Visible:=true;
  with KFP do begin
       {**************}
       Map_CBRD_to_KFP;
       {**************}
  end;
  {**********}
  KFP.Run_KFP;
  {**********}
end;

procedure TForm8.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  KFP.Free;
end;

procedure TForm8.ComboBox2Change(Sender: TObject);
begin
  if Form8.ComboBox2.ItemIndex=0 then Form8.DDSpinEdit2.Value:=10; //"exp", Default for 2*pi/r_
  if Form8.ComboBox2.ItemIndex=1 then Form8.DDSpinEdit2.Value:=1;  //"cos", Default for J1/J0
  CorrespondParametersToTheForm;
end;

procedure TForm8.CheckBox1Click(Sender: TObject);
begin
  CorrespondParametersToTheForm;
end;

end.
