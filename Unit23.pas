unit Unit23;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, StdCtrls;

type
  TForm23 = class(TForm)
    Chart1: TChart;
    Series1: TLineSeries;
    Label1: TLabel;
    Series2: TPointSeries;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form23: TForm23;

procedure DrawKinetics(al,be :double);

implementation
uses MathMyO;

{$R *.dfm}

procedure DrawKinetics(al,be :double);
var
    m,U,Source,t_,dt_,t_1,t_2, t_10,t_90,t_peak :double;
    i,If_al_eq_be :integer;
    t1 :string;
begin
  Form23.Visible:=true;
  If_al_eq_be:=0;  if al=be then If_al_eq_be:=1;
  dt_:=0.00005;
  m:=0; U:=0;
  t_1:=0;  t_2:=0;  t_10:=0;  t_90:=0;
  if al<>be then t_peak:=ln(al/be)/(al-be) else t_peak:=1/al;
  Form23.Series1.Clear;
  Form23.Series2.Clear;
  i:=-1;
  repeat i:=i+1; t_:=i*dt_;
    { Stimul }
    if t_<=0.0005{s} then Source:=2000 else Source:=0;
    {****}
    New_m2(If_al_eq_be,al,be,dt_,Source, m,U);
    {****}
    Form23.Series1.AddXY(t_*1e3,m);
    { Half Width }
    if (t_<t_peak)and(t_1=0)and(m>=0.5) then t_1:=t_;
    if (t_>t_peak)and(t_2=0)and(m<=0.5) then t_2:=t_;
    if (t_<t_peak)and(t_10=0)and(m>=0.1) then t_10:=t_;
    if (t_<t_peak)and(t_90=0)and(m>=0.9) then t_90:=t_;
  until t_>=5*max(1/al,1/be);
  { Half Width }
  str((t_2-t_1)*1000:5:2,t1);
  t1:='t_HW='+t1+' ms';
  Form23.Label1.Caption:=t1;
  Form23.Series2.AddXY(t_1*1e3,0.5);
  Form23.Series2.AddXY(t_2*1e3,0.5);
  { al and be }
  str(1/be*1000:5:2,t1);
  t1:='1/beta='+t1+' ms';
  Form23.Label2.Caption:=t1;
  str(1/al*1000:5:2,t1);
  t1:='1/alpha='+t1+' ms';
  Form23.Label3.Caption:=t1;
  str((t_90-t_10)*1000:5:2,t1);
  t1:='10-90% rise time ='+t1+' ms';
  Form23.Label4.Caption:=t1;
  str(t_peak*1000:5:2,t1);
  t1:='t_peak=ln(al/be)/(al-be)='+t1+' ms';
  Form23.Label5.Caption:=t1;
  Application.ProcessMessages;
end;

end.
