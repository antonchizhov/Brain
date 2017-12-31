unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TeEngine, Series, ExtCtrls, TeeProcs, Chart, StdCtrls;

type
  TForm2 = class(TForm)
    Chart1: TChart;
    Chart2: TChart;
    Chart3: TChart;
    Chart4: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series7: TLineSeries;
    Series9: TLineSeries;
    SeriesE_V: TLineSeries;
    SeriesI_V: TLineSeries;
    Series13: TPointSeries;
    SeriesE_VT: TLineSeries;
    SeriesI_VT: TLineSeries;
    Series16: TLineSeries;
    Series17: TLineSeries;
    SeriesE_ro: TLineSeries;
    SeriesE_VE: TLineSeries;
    Series11: TLineSeries;
    SeriesI_ro: TLineSeries;
    SeriesI_VE: TLineSeries;
    Series12: TLineSeries;
    SeriesE_nn: TLineSeries;
    SeriesI_nn: TLineSeries;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    procedure Chart1DblClick(Sender: TObject);
    procedure Chart1ClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure Chart2ClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure Chart4ClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure Chart3ClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses graph_0d,ColumnO;

{$R *.DFM}

procedure TForm2.Chart1DblClick(Sender: TObject);
begin
  Form2.Visible:=false;
end;

procedure TForm2.Chart1ClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Series.Active:=not(Series.Active);
end;

procedure TForm2.Chart2ClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Series.Active:=not(Series.Active);
end;

procedure TForm2.Chart4ClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Series.Active:=not(Series.Active);
end;

procedure TForm2.Chart3ClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Series.Active:=not(Series.Active);
end;

procedure TForm2.Button1Click(Sender: TObject);
var CV_ :double;
begin
  Form2.Label1.Visible:=true;
  Form2.Label2.Visible:=true;
  CalculateAndPrintCV(AColumn.Pop[1],CV_);
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  WritePhaseSpace;
end;

end.
