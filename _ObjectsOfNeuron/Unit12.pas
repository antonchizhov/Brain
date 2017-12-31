unit Unit12;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, StdCtrls, ComCtrls,
  DDSpinEdit;

type
  TForm12 = class(TForm)
    Chart3: TChart;
    Series5: TLineSeries;
    Series6: TLineSeries;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Chart1: TChart;
    Series1: TLineSeries;
    Chart4: TChart;
    LineSeries2: TLineSeries;
    Chart2: TChart;
    Series7: TLineSeries;
    Series8: TLineSeries;
    Chart5: TChart;
    LineSeries1: TLineSeries;
    LineSeries3: TLineSeries;
    TabSheet4: TTabSheet;
    Chart6: TChart;
    LineSeries4: TLineSeries;
    LineSeries5: TLineSeries;
    Button21: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button11: TButton;
    Button13: TButton;
    Button5: TButton;
    Button6: TButton;
    CheckBox1: TCheckBox;
    TabSheet5: TTabSheet;
    Shape1: TShape;
    Shape2: TShape;
    Chart7: TChart;
    Panel1: TPanel;
    Series2: TPointSeries;
    Series10: TPointSeries;
    Series4: TPointSeries;
    Series9: TPointSeries;
    Series3: TPointSeries;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Series11: TLineSeries;
    Series12: TLineSeries;
    TabSheet6: TTabSheet;
    Shape3: TShape;
    Shape4: TShape;
    Label6: TLabel;
    Label7: TLabel;
    Chart8: TChart;
    Button4: TButton;
    Series13: TLineSeries;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Label8: TLabel;
    Label9: TLabel;
    DDSpinEdit5: TDDSpinEdit;
    Label10: TLabel;
    DDSpinEdit1: TDDSpinEdit;
    Label11: TLabel;
    Series14: TLineSeries;
    Label12: TLabel;
    procedure Button3Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure LineSeries1DblClick(Sender: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure LineSeries2DblClick(Sender: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure LineSeries3DblClick(Sender: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure LineSeries4DblClick(Sender: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure LineSeries5DblClick(Sender: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure Series1DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series5DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series6DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series7DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series8DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Panel1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Series2DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series10DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series11DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series12DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series13DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series3DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series4DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series9DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation
uses RunFiber;

{$R *.dfm}

procedure TForm12.Button3Click(Sender: TObject);
begin
  Form12.Chart1.CopyToClipboardBitmap;
end;

procedure TForm12.Button21Click(Sender: TObject);
begin
  Form12.Chart5.CopyToClipboardBitmap;
end;

procedure TForm12.Button2Click(Sender: TObject);
begin
  Form12.Chart6.CopyToClipboardBitmap;
end;

procedure TForm12.Button1Click(Sender: TObject);
begin
  Form12.Chart3.CopyToClipboardBitmap;
end;

procedure TForm12.Button5Click(Sender: TObject);
begin
  Form12.Chart5.BottomAxis.AutomaticMaximum:=false;
  Form12.Chart5.BottomAxis.AutomaticMinimum:=false;
  if Form12.Chart3.BottomAxis.Maximum>Form12.Chart5.BottomAxis.Minimum then begin
     Form12.Chart5.BottomAxis.Maximum:=Form12.Chart3.BottomAxis.Maximum;
     Form12.Chart5.BottomAxis.Minimum:=Form12.Chart3.BottomAxis.Minimum;
  end else begin
     Form12.Chart5.BottomAxis.Minimum:=Form12.Chart3.BottomAxis.Minimum;
     Form12.Chart5.BottomAxis.Maximum:=Form12.Chart3.BottomAxis.Maximum;
  end;
  Application.ProcessMessages;
end;

procedure TForm12.Button6Click(Sender: TObject);
begin
  Form12.Chart5.BottomAxis.AutomaticMaximum:=true;
  Form12.Chart5.BottomAxis.AutomaticMinimum:=true;
  Application.ProcessMessages;
end;

procedure TForm12.Button11Click(Sender: TObject);
begin
  Form12.Chart3.BottomAxis.AutomaticMaximum:=false;
  Form12.Chart3.BottomAxis.AutomaticMinimum:=false;
  if Form12.Chart5.BottomAxis.Maximum>Form12.Chart3.BottomAxis.Minimum then begin
     Form12.Chart3.BottomAxis.Maximum:=Form12.Chart5.BottomAxis.Maximum;
     Form12.Chart3.BottomAxis.Minimum:=Form12.Chart5.BottomAxis.Minimum;
  end else begin
     Form12.Chart3.BottomAxis.Minimum:=Form12.Chart5.BottomAxis.Minimum;
     Form12.Chart3.BottomAxis.Maximum:=Form12.Chart5.BottomAxis.Maximum;
  end;
  Application.ProcessMessages;
end;

procedure TForm12.Button13Click(Sender: TObject);
begin
  Form12.Chart3.BottomAxis.AutomaticMaximum:=true;
  Form12.Chart3.BottomAxis.AutomaticMinimum:=true;
  Application.ProcessMessages;
end;

procedure TForm12.LineSeries1DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form12.LineSeries1.Active:=false;
end;

procedure TForm12.LineSeries2DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form12.LineSeries2.Active:=false;
end;

procedure TForm12.LineSeries3DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form12.LineSeries3.Active:=false;
end;

procedure TForm12.LineSeries4DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form12.LineSeries4.Active:=false;
end;

procedure TForm12.LineSeries5DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form12.LineSeries5.Active:=false;
end;

procedure TForm12.Series1DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form12.Series1.Active:=false;
end;

procedure TForm12.Series5DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form12.Series5.Active:=false;
end;

procedure TForm12.Series6DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form12.Series6.Active:=false;
end;

procedure TForm12.Series7DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form12.Series7.Active:=false;
end;

procedure TForm12.Series8DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form12.Series8.Active:=false;
end;

procedure TForm12.Panel1Click(Sender: TObject);
begin
  VisualizeMaxConductances;
end;

procedure TForm12.Button4Click(Sender: TObject);
begin
  Form12.Chart8.CopyToClipboardBitmap;
end;

procedure TForm12.Series2DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form12.Series2.Active:=false;
end;

procedure TForm12.Series10DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form12.Series10.Active:=false;
end;

procedure TForm12.Series11DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form12.Series11.Active:=false;
end;

procedure TForm12.Series12DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form12.Series12.Active:=false;
end;

procedure TForm12.Series13DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form12.Series13.Active:=false;
end;

procedure TForm12.Series3DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form12.Series3.Active:=false;
end;

procedure TForm12.Series4DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form12.Series4.Active:=false;
end;

procedure TForm12.Series9DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form12.Series9.Active:=false;
end;

end.
