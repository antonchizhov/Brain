unit Unit25;     { LFP }

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart,
  t_dtO, StdCtrls, DDSpinEdit{,ColumnO};

type
  TForm25 = class(TForm)
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series4: TLineSeries;
    Series5: TLineSeries;
    StaticText47: TStaticText;
    DDSpinEdit79: TDDSpinEdit;
    Button2: TButton;
    Series6: TLineSeries;
    RadioGroup1: TRadioGroup;
    Button9: TButton;
    Button7: TButton;
    CheckBox1: TCheckBox;
    procedure Button2Click(Sender: TObject);
    procedure Series1DblClick(Sender: TChartSeries; ValueIndex: Integer;
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
    procedure Button9Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form25: TForm25;

implementation
uses Unit1;

{$R *.dfm}

procedure TForm25.Button2Click(Sender: TObject);
begin
  Form25.Chart1.CopyToClipboardBitmap;
end;

procedure TForm25.Series1DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form25.Series1.Active:=false;
end;

procedure TForm25.Series2DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form25.Series2.Active:=false;
end;

procedure TForm25.Series3DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form25.Series3.Active:=false;
end;

procedure TForm25.Series4DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form25.Series4.Active:=false;
end;

procedure TForm25.Series5DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form25.Series5.Active:=false;
end;

procedure TForm25.Series6DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form25.Series6.Active:=false;
end;

procedure TForm25.Button9Click(Sender: TObject);
begin
  Form25.Chart1.BottomAxis.AutomaticMaximum:=false;
  Form25.Chart1.BottomAxis.AutomaticMinimum:=false;
  try Form25.Chart1.BottomAxis.Maximum:=Form1.Chart2.BottomAxis.Maximum; except end;
  try Form25.Chart1.BottomAxis.Minimum:=Form1.Chart2.BottomAxis.Minimum; except end;
end;

procedure TForm25.Button7Click(Sender: TObject);
begin
  Form25.Chart1.LeftAxis.AutomaticMaximum:=true;
  Form25.Chart1.LeftAxis.AutomaticMinimum:=true;
  Form25.Chart1.BottomAxis.AutomaticMaximum:=true;
  Form25.Chart1.BottomAxis.AutomaticMinimum:=true;
end;

end.
