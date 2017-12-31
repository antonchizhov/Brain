unit Unit26; { K and Cl dynamics }

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, StdCtrls,
  DDSpinEdit, ComCtrls,
  Correspond,Init,MathMyO;

type
  TForm26 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    StaticText1: TStaticText;
    DDSpinEdit1: TDDSpinEdit;
    StaticText2: TStaticText;
    DDSpinEdit2: TDDSpinEdit;
    DDSpinEdit3: TDDSpinEdit;
    StaticText3: TStaticText;
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Chart3: TChart;
    Series5: TLineSeries;
    Series6: TLineSeries;
    Chart2: TChart;
    Series3: TLineSeries;
    Series4: TLineSeries;
    Series7: TLineSeries;
    Series8: TLineSeries;
    Series9: TLineSeries;
    Series10: TLineSeries;
    CheckBox1: TCheckBox;
    Series11: TLineSeries;
    DDSpinEdit4: TDDSpinEdit;
    StaticText4: TStaticText;
    DDSpinEdit5: TDDSpinEdit;
    StaticText5: TStaticText;
    DDSpinEdit6: TDDSpinEdit;
    StaticText6: TStaticText;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    CheckBox4: TCheckBox;
    DDSpinEdit13: TDDSpinEdit;
    StaticText11: TStaticText;
    DDSpinEdit12: TDDSpinEdit;
    StaticText10: TStaticText;
    RadioGroup1: TRadioGroup;
    DDSpinEdit14: TDDSpinEdit;
    StaticText12: TStaticText;
    DDSpinEdit15: TDDSpinEdit;
    StaticText13: TStaticText;
    DDSpinEdit11: TDDSpinEdit;
    StaticText9: TStaticText;
    DDSpinEdit16: TDDSpinEdit;
    StaticText14: TStaticText;
    GroupBox3: TGroupBox;
    DDSpinEdit9: TDDSpinEdit;
    DDSpinEdit10: TDDSpinEdit;
    StaticText15: TStaticText;
    StaticText16: TStaticText;
    StaticText17: TStaticText;
    DDSpinEdit17: TDDSpinEdit;
    Series12: TLineSeries;
    DDSpinEdit18: TDDSpinEdit;
    DDSpinEdit7: TDDSpinEdit;
    StaticText7: TStaticText;
    DDSpinEdit8: TDDSpinEdit;
    StaticText8: TStaticText;
    Series13: TLineSeries;
    StaticText18: TStaticText;
    DDSpinEdit21: TDDSpinEdit;
    RadioGroup2: TRadioGroup;
    StaticText19: TStaticText;
    DDSpinEdit19: TDDSpinEdit;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button9: TButton;
    Button7: TButton;
    GroupBox4: TGroupBox;
    DDSpinEdit22: TDDSpinEdit;
    DDSpinEdit23: TDDSpinEdit;
    StaticText21: TStaticText;
    StaticText22: TStaticText;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    StaticText23: TStaticText;
    DDSpinEdit24: TDDSpinEdit;
    DDSpinEdit25: TDDSpinEdit;
    DDSpinEdit26: TDDSpinEdit;
    DDSpinEdit27: TDDSpinEdit;
    Series14: TLineSeries;
    Series15: TLineSeries;
    Series16: TLineSeries;
    RadioGroup3: TRadioGroup;
    DDSpinEdit28: TDDSpinEdit;
    GroupBox5: TGroupBox;
    StaticText20: TStaticText;
    DDSpinEdit20: TDDSpinEdit;
    RadioGroup4: TRadioGroup;
    DDSpinEdit29: TDDSpinEdit;
    StaticText24: TStaticText;
    Series17: TLineSeries;
    Series18: TLineSeries;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Series1DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series10DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series11DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series2DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series3DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series4DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series5DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series6DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series7DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series8DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series9DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Series12DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series13DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RadioGroup2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure Series14DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series15DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit24Change(Sender: TObject);
    procedure DDSpinEdit27Change(Sender: TObject);
    procedure DDSpinEdit25Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DDSpinEdit4Change(Sender: TObject);
    procedure DDSpinEdit5Change(Sender: TObject);
    procedure DDSpinEdit6Change(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure DDSpinEdit13Change(Sender: TObject);
    procedure DDSpinEdit12Change(Sender: TObject);
    procedure DDSpinEdit22Change(Sender: TObject);
    procedure DDSpinEdit23Change(Sender: TObject);
    procedure DDSpinEdit11Change(Sender: TObject);
    procedure DDSpinEdit7Change(Sender: TObject);
    procedure DDSpinEdit8Change(Sender: TObject);
    procedure DDSpinEdit15Change(Sender: TObject);
    procedure DDSpinEdit18Change(Sender: TObject);
    procedure DDSpinEdit14Change(Sender: TObject);
    procedure DDSpinEdit19Change(Sender: TObject);
    procedure DDSpinEdit20Change(Sender: TObject);
    procedure Series16DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RadioGroup3Click(Sender: TObject);
    procedure DDSpinEdit26Change(Sender: TObject);
    procedure DDSpinEdit16Change(Sender: TObject);
    procedure DDSpinEdit3Change(Sender: TObject);
    procedure DDSpinEdit28Change(Sender: TObject);
    procedure Series17DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series18DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form26: TForm26;

implementation
uses Unit1,ConnectionsO,IonsO;

{$R *.dfm}

procedure TForm26.Button2Click(Sender: TObject);
begin
  Form26.Chart2.CopyToClipboardBitmap;
end;

procedure TForm26.Button1Click(Sender: TObject);
begin
  Form26.Chart1.CopyToClipboardBitmap;
end;

procedure TForm26.Button3Click(Sender: TObject);
begin
  Form26.Chart3.CopyToClipboardBitmap;
end;

procedure TForm26.Series1DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form26.Series1.Active:=false;
end;

procedure TForm26.Series10DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form26.Series10.Active:=false;
end;

procedure TForm26.Series11DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form26.Series11.Active:=false;
end;

procedure TForm26.Series2DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form26.Series2.Active:=false;
end;

procedure TForm26.Series3DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form26.Series3.Active:=false;
end;

procedure TForm26.Series4DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form26.Series4.Active:=false;
end;

procedure TForm26.Series5DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form26.Series5.Active:=false;
end;

procedure TForm26.Series6DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form26.Series6.Active:=false;
end;

procedure TForm26.Series7DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form26.Series7.Active:=false;
end;

procedure TForm26.Series8DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form26.Series8.Active:=false;
end;

procedure TForm26.Series9DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form26.Series9.Active:=false;
end;

procedure TForm26.Series12DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form26.Series12.Active:=false;
end;

procedure TForm26.RadioGroup1Click(Sender: TObject);
begin
  ParamsToForm26;
end;

procedure TForm26.Series13DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form26.Series13.Active:=false;
end;

procedure TForm26.RadioGroup2Click(Sender: TObject);
begin
  iPop_Ions_View:=imin(Form26.RadioGroup2.ItemIndex+1,NPop);        // 22.04.2017
  Form26.RadioGroup2.ItemIndex:=iPop_Ions_View-1;                   // 22.04.2017
//  CorrespondParametersToTheForm;
end;

procedure TForm26.Button4Click(Sender: TObject);
begin
  Form26.Chart2.CopyToClipboardBitmap;
end;

procedure TForm26.Button5Click(Sender: TObject);
begin
  Form26.Chart3.CopyToClipboardBitmap;
end;

procedure TForm26.Button6Click(Sender: TObject);
begin
  Form26.Chart1.CopyToClipboardBitmap;
end;

procedure TForm26.Button9Click(Sender: TObject);
begin
  Form26.Chart3.BottomAxis.AutomaticMaximum:=false;
  Form26.Chart3.BottomAxis.AutomaticMinimum:=false;
  try Form26.Chart3.BottomAxis.Maximum:=Form1.Chart2.BottomAxis.Maximum; except end;
  try Form26.Chart3.BottomAxis.Minimum:=Form1.Chart2.BottomAxis.Minimum; except end;
  Form26.Chart2.BottomAxis.AutomaticMaximum:=false;
  Form26.Chart2.BottomAxis.AutomaticMinimum:=false;
  try Form26.Chart2.BottomAxis.Maximum:=Form1.Chart2.BottomAxis.Maximum; except end;
  try Form26.Chart2.BottomAxis.Minimum:=Form1.Chart2.BottomAxis.Minimum; except end;
  Form26.Chart1.BottomAxis.AutomaticMaximum:=false;
  Form26.Chart1.BottomAxis.AutomaticMinimum:=false;
  try Form26.Chart1.BottomAxis.Maximum:=Form1.Chart2.BottomAxis.Maximum; except end;
  try Form26.Chart1.BottomAxis.Minimum:=Form1.Chart2.BottomAxis.Minimum; except end;
end;

procedure TForm26.Button7Click(Sender: TObject);
begin
  Form26.Chart1.LeftAxis.AutomaticMaximum:=true;
  Form26.Chart1.LeftAxis.AutomaticMinimum:=true;
  Form26.Chart1.BottomAxis.AutomaticMaximum:=true;
  Form26.Chart1.BottomAxis.AutomaticMinimum:=true;
  Form26.Chart2.LeftAxis.AutomaticMaximum:=true;
  Form26.Chart2.LeftAxis.AutomaticMinimum:=true;
  Form26.Chart2.BottomAxis.AutomaticMaximum:=true;
  Form26.Chart2.BottomAxis.AutomaticMinimum:=true;
  Form26.Chart3.LeftAxis.AutomaticMaximum:=true;
  Form26.Chart3.LeftAxis.AutomaticMinimum:=true;
  Form26.Chart3.BottomAxis.AutomaticMaximum:=true;
  Form26.Chart3.BottomAxis.AutomaticMinimum:=true;
end;

procedure TForm26.CheckBox2Click(Sender: TObject);
begin
  ParamsToForm26;
end;

procedure TForm26.CheckBox3Click(Sender: TObject);
begin
  ParamsToForm26;
end;

procedure TForm26.Series14DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form26.Series14.Active:=false;
end;

procedure TForm26.Series15DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form26.Series15.Active:=false;
end;

procedure TForm26.DDSpinEdit24Change(Sender: TObject);
begin
  ParamsToForm26;
end;

procedure TForm26.DDSpinEdit27Change(Sender: TObject);
begin
  ParamsToForm26;
end;

procedure TForm26.DDSpinEdit25Change(Sender: TObject);
begin
  ParamsToForm26;
end;

procedure TForm26.CheckBox1Click(Sender: TObject);
begin
  ParamsToForm26;
end;

procedure TForm26.DDSpinEdit4Change(Sender: TObject);
begin
  ParamsToForm26;
end;

procedure TForm26.DDSpinEdit5Change(Sender: TObject);
begin
  ParamsToForm26;
end;

procedure TForm26.DDSpinEdit6Change(Sender: TObject);
begin
  ParamsToForm26;
end;

procedure TForm26.CheckBox4Click(Sender: TObject);
begin
  ParamsToForm26;
end;

procedure TForm26.DDSpinEdit13Change(Sender: TObject);
begin
  ParamsToForm26;
end;

procedure TForm26.DDSpinEdit12Change(Sender: TObject);
begin
  ParamsToForm26;
end;

procedure TForm26.DDSpinEdit22Change(Sender: TObject);
begin
  ParamsToForm26;
end;

procedure TForm26.DDSpinEdit23Change(Sender: TObject);
begin
  ParamsToForm26;
end;

procedure TForm26.DDSpinEdit11Change(Sender: TObject);
begin
  ParamsToForm26;
end;

procedure TForm26.DDSpinEdit7Change(Sender: TObject);
begin
  ParamsToForm26;
end;

procedure TForm26.DDSpinEdit8Change(Sender: TObject);
begin
  ParamsToForm26;
end;

procedure TForm26.DDSpinEdit15Change(Sender: TObject);
begin
  ParamsToForm26;
end;

procedure TForm26.DDSpinEdit18Change(Sender: TObject);
begin
  ParamsToForm26;
end;

procedure TForm26.DDSpinEdit14Change(Sender: TObject);
begin
  ParamsToForm26;
end;

procedure TForm26.DDSpinEdit19Change(Sender: TObject);
begin
  ParamsToForm26;
end;

procedure TForm26.DDSpinEdit20Change(Sender: TObject);
begin
  ParamsToForm26;
end;

procedure TForm26.Series16DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form26.Series16.Active:=false;
end;

procedure TForm26.RadioGroup3Click(Sender: TObject);
begin
  ParamsToForm26;
end;

procedure TForm26.DDSpinEdit26Change(Sender: TObject);
begin
  ParamsToForm26;
end;

procedure TForm26.DDSpinEdit16Change(Sender: TObject);
begin
  ParamsToForm26;
end;

procedure TForm26.DDSpinEdit3Change(Sender: TObject);
begin
  ParamsToForm26;
end;

procedure TForm26.DDSpinEdit28Change(Sender: TObject);
begin
  ParamsToForm26;
end;

procedure TForm26.Series17DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form26.Series17.Active:=false;
end;

procedure TForm26.Series18DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form26.Series18.Active:=false;
end;

end.
