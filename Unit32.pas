unit Unit32;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DDSpinEdit, TeEngine, Series, ExtCtrls, TeeProcs,
  Chart, ComCtrls, Init,t_dtO,ColumnO,Unit4,graph_0d;

type
  TForm32 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Chart1: TChart;
    Series1: TLineSeries;
    GroupBox1: TGroupBox;
    DDSpinEdit1: TDDSpinEdit;
    DDSpinEdit2: TDDSpinEdit;
    DDSpinEdit3: TDDSpinEdit;
    DDSpinEdit4: TDDSpinEdit;
    DDSpinEdit5: TDDSpinEdit;
    StaticText46: TStaticText;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Button1: TButton;
    Series4: TLineSeries;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form32: TForm32;

procedure CV_dependence_on_I_ind;

implementation

{$R *.dfm}

var
    I_ind_mem,t_end_mem,t_ind_mem :double;
    Arr_CV,Arr_nu,Arr_Iind :array[0..10000] of double;
    N :integer;
    aaa :text;


{******************************************************************************}
procedure CV_dependence_on_I_ind;
{******************************************************************************}
{            /\ t2
            /  \
           /    \
          /      \
         /        \
    ____/          \_____
   t0  t1            t3
}
var
    t0,t1,t2,t3,Imax_,Imin_,CV_ :double;

begin
  { Parameters }
  t0:=Form32.DDSpinEdit1.Value/1e3;  {s}
  t1:=Form32.DDSpinEdit2.Value/1e3;  {s}
  t2:=Form32.DDSpinEdit3.Value/1e3;  {s}
  t3:=t2+(t2-t1-t1+t0);
  Imax_:=Form32.DDSpinEdit4.Value;    {pA}
  Imin_:=Form32.DDSpinEdit5.Value;    {pA}
  { Set I_ind }
  if t<t0 then begin
      I_ind_mem:=I_ind;  t_end_mem:=t_end;  t_ind_mem:=t_ind;
      N:=0;
  end else if (t>=t1)and(t<=t2) then begin
      I_ind:=Imin_+(Imax_-Imin_)/(t2-t1)*(t-t1);
  end else if (t>t2)and(t<=t3) then begin
      I_ind:=Imax_-(Imax_-Imin_)/(t3-t2)*(t-t2);
  end else begin
      I_ind:=I_ind_mem;  t_end:=t_end_mem;  t_ind:=t_ind_mem;
  end;
  Form4.DDSpinEdit46.Value:=I_ind; {pA}
  Form4.DDSpinEdit48.Value:=(t3+0.010{s})*1e3; {ms}
  Form4.DDSpinEdit7.Value:=(t3+0.010{s})*1e3; {ms}
  { Plot nuE(nuI) }
  if (t>=t0)and(t<=t3) then begin
      if (trunc(nt/n_show)=nt/n_show) then begin
          if t<=t1 then begin
             Form32.Series1.AddXY(I_ind,AColumn.Pop[1].nu);
          end else if t<=t2 then begin
             {**************************************}
             CalculateAndPrintCV(AColumn.Pop[1],CV_);
             {**************************************}
             Form32.Series4.AddXY(I_ind,AColumn.Pop[1].nu);
             Form32.Series2.AddXY(I_ind,CV_);
             if N<10000 then begin
                N:=N+1;
                Arr_nu[N]  :=AColumn.Pop[1].nu;
                Arr_CV[N]  :=CV_;
                Arr_Iind[N]:=I_ind;
             end;
          end else begin
             Form32.Series3.AddXY(I_ind,AColumn.Pop[1].nu);
          end;
      end;
  end;
end;

procedure TForm32.Button1Click(Sender: TObject);
{ Clear }
begin
  Form32.Series1.Clear;
  Form32.Series2.Clear;
  Form32.Series3.Clear;
  Form32.Series4.Clear;
end;

procedure TForm32.Button3Click(Sender: TObject);
{ Write }
var
    i,j,k :integer;
begin
  assignFile(aaa,'Iind_nu_CV.dat'); rewrite(aaa);
  for i:=0 to N do begin
      writeln(aaa,Arr_Iind[i]:9:2,' ',Arr_nu[i]:9:2,' ',Arr_CV[i]:9:2);
  end;
  closeFile(aaa);
end;

end.
