unit Unit22;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TeeProcs, TeEngine, Chart, StdCtrls, DDSpinEdit,
  Series;

type
  TForm22 = class(TForm)
    Chart1: TChart;
    DDSpinEdit1: TDDSpinEdit;
    Label1: TLabel;
    Series1: TLineSeries;
    DDSpinEdit2: TDDSpinEdit;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    DDSpinEdit3: TDDSpinEdit;
    Label3: TLabel;
    DDSpinEdit4: TDDSpinEdit;
    Label4: TLabel;
    DDSpinEdit5: TDDSpinEdit;
    Label5: TLabel;
    DDSpinEdit6: TDDSpinEdit;
    Label6: TLabel;
    Button1: TButton;
    Button2: TButton;
    DDSpinEdit7: TDDSpinEdit;
    Label7: TLabel;
    Series2: TLineSeries;
    Series3: TLineSeries;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form22: TForm22;

implementation
uses  AnalysisO;

{$R *.dfm}

procedure TForm22.Button1Click(Sender: TObject);
begin
  Plot_nu_IindO;
end;

procedure TForm22.Button2Click(Sender: TObject);
begin
  Form22.Series1.Clear;
  Form22.Series2.Clear;
  Form22.Series3.Clear;
end;

end.
