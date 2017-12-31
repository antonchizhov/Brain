unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TeEngine, Series, TeeFunci, ExtCtrls, TeeProcs, Chart, StdCtrls,
  DDSpinEdit;

type
  TForm13 = class(TForm)
    Chart1: TChart;
    TeeFunction1: TAverageTeeFunction;
    Series1: TBarSeries;
    GroupBox1: TGroupBox;
    DDSpinEdit1: TDDSpinEdit;
    StaticText42: TStaticText;
    DDSpinEdit2: TDDSpinEdit;
    StaticText1: TStaticText;
    Chart2: TChart;
    Series2: TFastLineSeries;
    GroupBox2: TGroupBox;
    DDSpinEdit3: TDDSpinEdit;
    StaticText2: TStaticText;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Chart3: TChart;
    Series3: TFastLineSeries;
    Button2: TButton;
    ComboBox1: TComboBox;
    StaticText3: TStaticText;
    DDSpinEdit4: TDDSpinEdit;
    DDSpinEdit5: TDDSpinEdit;
    StaticText4: TStaticText;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

uses Statistics;

{$R *.DFM}

procedure TForm13.Button1Click(Sender: TObject);
begin
  Form13.Chart3.Visible:=true;
  CalculateSpectr;
end;

procedure TForm13.Button2Click(Sender: TObject);
begin
  WriteHystogram;
end;

end.
