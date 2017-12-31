unit Unit27;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, StdCtrls,
  PopulationO, MathMyO, ColumnO;

type
  TForm27 = class(TForm)
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form27: TForm27;

procedure DrawLognormalDistribution(APop_:TPopulation; PopNumber_:integer);

implementation

{$R *.dfm}

procedure DrawLognormalDistribution(APop_:TPopulation; PopNumber_:integer);
var iLN     :integer;
    fi_,dx_ :double;
begin
  { Initial conditions }
  APop_.InitialConditions(PopNumber_);
  {***}
  Form27.Series1.Clear;
  Form27.Series2.Clear;
  Form27.Series2.AddXY(0,0);
  for iLN:=1 to APop_.LogN.Nx do begin
      fi_:=LogNorm(APop_.xLN[iLN],APop_.LogN.mu,APop_.LogN.sgm);
      if iLN>1 then dx_:=APop_.xLn[iLN]-APop_.xLn[iLN-1] else dx_:=APop_.xLn[iLN+1]-APop_.xLn[iLN];
      Form27.Series1.AddXY(APop_.xLn[iLN], APop_.PHI_dx[iLN]);
      Form27.Series2.AddXY(APop_.xLn[iLN], fi_{*dx_});
  end;
  Application.ProcessMessages;
end;

procedure WriteLognormalDistribution(APop_:TPopulation; PopNumber_:integer);
var iLN     :integer;
    fi_,dx_ :double;
    aaa                         :text;
begin
  assign(aaa,'LN(x).dat'); rewrite(aaa);
  { Initial conditions }
  APop_.InitialConditions(PopNumber_);
  {***}
  for iLN:=1 to APop_.LogN.Nx do begin
      fi_:=LogNorm(APop_.xLN[iLN],APop_.LogN.mu,APop_.LogN.sgm);
      if iLN>1 then dx_:=APop_.xLn[iLN]-APop_.xLn[iLN-1] else dx_:=APop_.xLn[iLN+1]-APop_.xLn[iLN];
      writeln(aaa,APop_.xLn[iLN]:9:4,' ',{APop_.PHI_dx[iLN]}fi_:9:4);
  end;
  close(aaa);
end;

procedure TForm27.Button1Click(Sender: TObject);
begin
  WriteLognormalDistribution(AColumn.Pop[1],1);
end;

procedure TForm27.Button2Click(Sender: TObject);
{ Draw }
begin
  DrawLognormalDistribution(AColumn.Pop[1],1);
end;

end.
