unit Unit6;   {Form6 - Single neuron spikes}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, TeeProcs, TeEngine, Chart, Series, StdCtrls,
  Init,DDSpinEdit,gsynC;

type
  ADDSpinEdit=array[1..40] of TDDSpinEdit;

  TForm6 = class(TForm)
    CheckBox3: TCheckBox;
    Chart3: TChart;
    Series3: TLineSeries;
    Series4: TLineSeries;
    Chart4: TChart;
    Chart5: TChart;
    Series7: TLineSeries;
    Series8: TLineSeries;
    Series9: TLineSeries;
    Series10: TLineSeries;
    Chart1: TChart;
    Series1: TLineSeries;
    Series5: TLineSeries;
    Chart2: TChart;
    Series2: TLineSeries;
    Series6: TLineSeries;
    Button7: TButton;
    procedure CheckBox3Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  DDSpinEditA :ADDSpinEdit;

implementation

{$R *.DFM}

procedure TForm6.CheckBox3Click(Sender: TObject);
begin
  Form6.Chart3.Visible:=Form6.CheckBox3.Checked;
  if Form6.CheckBox3.Checked then Form6.Top:=476 else Form6.Top:=701;
end;

procedure TForm6.Button7Click(Sender: TObject);
begin
  Form6.Chart1.LeftAxis.AutomaticMaximum:=true;
  Form6.Chart1.LeftAxis.AutomaticMinimum:=true;
  Form6.Chart1.BottomAxis.AutomaticMaximum:=true;
  Form6.Chart1.BottomAxis.AutomaticMinimum:=false;
  Form6.Chart1.BottomAxis.Minimum:=0;
  Form6.Chart2.LeftAxis.AutomaticMaximum:=true;
  Form6.Chart2.LeftAxis.AutomaticMinimum:=true;
  Form6.Chart2.BottomAxis.AutomaticMaximum:=true;
  Form6.Chart2.BottomAxis.AutomaticMinimum:=false;
  Form6.Chart2.BottomAxis.Minimum:=0;
  Form6.Chart3.LeftAxis.AutomaticMaximum:=true;
  Form6.Chart3.LeftAxis.AutomaticMinimum:=true;
  Form6.Chart3.BottomAxis.AutomaticMaximum:=true;
  Form6.Chart3.BottomAxis.AutomaticMinimum:=false;
  Form6.Chart3.BottomAxis.Minimum:=0;
  Form6.Chart4.LeftAxis.AutomaticMaximum:=true;
  Form6.Chart4.LeftAxis.AutomaticMinimum:=true;
  Form6.Chart4.BottomAxis.AutomaticMaximum:=true;
  Form6.Chart4.BottomAxis.AutomaticMinimum:=false;
  Form6.Chart4.BottomAxis.Minimum:=0;
  Form6.Chart5.LeftAxis.AutomaticMaximum:=true;
  Form6.Chart5.LeftAxis.AutomaticMinimum:=true;
  Form6.Chart5.BottomAxis.AutomaticMaximum:=true;
  Form6.Chart5.BottomAxis.AutomaticMinimum:=false;
  Form6.Chart5.BottomAxis.Minimum:=0;
end;

end.
