unit Frame_2DO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Series, BubbleCh, TeEngine, TeeShape, ExtCtrls, TeeProcs, Chart,
  StdCtrls;

type
  TFrame15 = class(TFrame)
    Chart1: TChart;
    Series2: TBubbleSeries;
    Series1: TLineSeries;
    Chart2: TChart;
    Series3: TBubbleSeries;
    Label1: TLabel;
    Label2: TLabel;           
    ComboBox1: TComboBox;          
    Series4: TChartShape;
    Series6: TPointSeries;
    Series7: TPointSeries;
    Series8: TPointSeries;
    Series5: TPointSeries;
    Series9: TLineSeries;
    Series10: TPointSeries;
    Series11: TLineSeries;
    Series12: TPointSeries;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frame15: TFrame15;

implementation

{$R *.dfm}

end.
