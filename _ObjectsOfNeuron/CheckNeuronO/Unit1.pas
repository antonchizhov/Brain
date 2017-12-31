unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TeEngine, Series, ExtCtrls, TeeProcs, Chart,
  typeNrnParsO, t_dtO, NeuronO, CreateNrnO, SetNrnParsO, DDSpinEdit, Spin;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Chart1: TChart;
    Series1: TLineSeries;
    Label1: TLabel;
    SpinEdit1: TSpinEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1 :TForm1;
  NP    :NeuronProperties;
  ANrn  :TNeuron;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var nt,nt_end :integer;
    Iind      :double;
begin
  { Set parameters }
  nt_end:=1000;
  dt:=0.0001;
  { Define the type of neuron }
  NP.HH_type:='Chow';
  NP.HH_order:='1-point';
  { Set parameters according to the type of neuron and create an object }
  HodgkinPhysParameters(NP);
  CreateNeuronByTypeO(NP, ANrn);
  { Set initial conditions to variables }
  ANrn.InitialConditions;
  Form1.Series1.Clear;
  nt:=0;
  REPEAT  nt:=nt+1;  t:=nt*dt; { time step }
    Iind:=Form1.SpinEdit1.Value/(ANrn.NP.Square*1e9);
    {******* One step of integration ******}
    ANrn.MembranePotential(0,0,0,0,0,Iind,0);
    {**************************************}
    Form1.Series1.AddXY(t*1000,ANrn.NV.V*1000);
  UNTIL nt>=nt_end;
  ANrn.Free;
end;

end.
