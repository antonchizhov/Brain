unit Unit11;           {Form11 - Nulclines}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TeEngine, Series, ExtCtrls, TeeProcs, Chart,
  Init,t_dtO,ColumnO,Unit4, DDSpinEdit, ComCtrls, ArrowCha;

type
  TForm11 = class(TForm)
    Chart1: TChart;
    Series1: TLineSeries;
    Button1: TButton;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Button2: TButton;
    Button3: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Memo1: TMemo;
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
    Memo2: TMemo;
    GroupBox2: TGroupBox;
    DDSpinEdit6: TDDSpinEdit;
    DDSpinEdit7: TDDSpinEdit;
    DDSpinEdit9: TDDSpinEdit;
    DDSpinEdit10: TDDSpinEdit;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    TabSheet3: TTabSheet;
    Memo3: TMemo;
    TabSheet4: TTabSheet;
    GroupBox3: TGroupBox;
    DDSpinEdit8: TDDSpinEdit;
    DDSpinEdit11: TDDSpinEdit;
    StaticText7: TStaticText;
    StaticText10: TStaticText;
    Memo4: TMemo;
    StaticText11: TStaticText;
    StaticText12: TStaticText;
    DDSpinEdit12: TDDSpinEdit;
    DDSpinEdit13: TDDSpinEdit;
    DDSpinEdit14: TDDSpinEdit;
    StaticText13: TStaticText;
    Series4: TArrowSeries;
    DDSpinEdit15: TDDSpinEdit;
    StaticText14: TStaticText;
    TabSheet5: TTabSheet;
    Chart2: TChart;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    LineSeries1: TLineSeries;
    LineSeries2: TLineSeries;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure TabSheet5Show(Sender: TObject);
    procedure TabSheet5Exit(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

procedure PlotNulclines_Setting_Iind;
procedure PlotNulclines_Setting_nuE_or_nuI;
procedure PlotVectorField_Setting_nuE_or_nuI;
procedure Draw_u_s_plot;

implementation

{$R *.dfm}

var
    I_ind_mem :double;
    nuE,nuI :array[0..10000] of double;
    VF :array[1..10000, 1..4] of double;
    N,Nx,Ny :integer;
    aaa :text;

{******************************************************************************}
procedure PlotNulclines_Setting_Iind;
{******************************************************************************}
{        /\ t1
        /  \
       /    \
      /      \
     /        \
____/          \      _______
   t0           \    / t3
                 \  /
               t2 \/
}
var
    t0,t1,t2,t3,Imax_,Imin_ :double;
begin
  if Form11.PageControl1.ActivePageIndex<>0 then begin
     if Form11.PageControl1.ActivePageIndex=2 then begin
        { Just plot }
        Form11.Series1.AddXY(AColumn.Pop[1].nu,AColumn.Pop[2].nu);
        { and remember to write }
        if t<0.01 then N:=0 else if N<10000 then begin
           N:=N+1;
           nuE[N]:=AColumn.Pop[1].nu;
           nuI[N]:=AColumn.Pop[2].nu;
        end;
     end;
     EXIT;
  end;
  { Parameters }
  t0:=Form11.DDSpinEdit1.Value/1e3;  {s}
  t1:=Form11.DDSpinEdit2.Value/1e3;  {s}
  t2:=Form11.DDSpinEdit3.Value/1e3;  {s}
  t3:=t2+(t2-t1-t1+t0);
  Imax_:=Form11.DDSpinEdit4.Value;    {pA}
  Imin_:=Form11.DDSpinEdit5.Value;    {pA}
  { Set I_ind }
  if t<t0 then begin
      I_ind_mem:=I_ind;
      N:=0;
  end else if (t>=t0)and(t<=t1) then begin
      I_ind:=       Imax_       /(t1-t0)*(t-t0);
  end else if (t>t1)and(t<=t2) then begin
      I_ind:=Imax_-(Imax_-Imin_)/(t2-t1)*(t-t1);
  end else if (t>t2)and(t<=t3) then begin
      I_ind:=Imin_+(     -Imin_)/(t3-t2)*(t-t2);
  end else begin
      I_ind:=I_ind_mem;
  end;
  Form4.DDSpinEdit46.Value:=I_ind; {pA}
  { Plot nuE(nuI) }
  if (t>=t0)and(t<=t3) then begin
      if (trunc(nt/n_show)=nt/n_show) then begin
          if t<=t1 then begin
             Form11.Series1.AddXY(AColumn.Pop[1].nu,AColumn.Pop[2].nu);
          end else if t<=t2 then begin
             Form11.Series2.AddXY(AColumn.Pop[1].nu,AColumn.Pop[2].nu);
             if N<10000 then begin
                N:=N+1;
                nuE[N]:=AColumn.Pop[1].nu;
                nuI[N]:=AColumn.Pop[2].nu;
             end;
          end else begin
             Form11.Series3.AddXY(AColumn.Pop[1].nu,AColumn.Pop[2].nu);
          end;
      end;
  end
end;
{******************************************************************************}

{******************************************************************************}
procedure PlotNulclines_Setting_nuE_or_nuI;
{******************************************************************************}
{             /\ t1                   /\ t4
             /  \                    /  \
            /    \                  /    \
           /      \                /      \
          /        \              /        \
_________/          \____________/          \_______
        t0       +2*duration    +t0      +2*duration
                    t2          t3          t5
}
var
    t0,t1,t2,t3,t4,t5,nuE_max,nuI_max  :double;
begin
  if Form11.PageControl1.ActivePageIndex=3  then begin
     {*********************************}
     PlotVectorField_Setting_nuE_or_nuI;
     {*********************************}
     EXIT;
  end;
  if Form11.PageControl1.ActivePageIndex=4  then begin
     {*********************************}
     Draw_u_s_plot;
     {*********************************}
     EXIT;
  end;
  if Form11.PageControl1.ActivePageIndex<>1 then EXIT;
  { Parameters }
  t0:=Form11.DDSpinEdit6.Value/1e3;  {s}
  t1:=t0+Form11.DDSpinEdit7.Value/1e3;  {s}
  t2:=t1+Form11.DDSpinEdit7.Value/1e3;  {s}
  t3:=t0+t2;
  t4:=t1+t2;
  t5:=t2+t2;
  nuE_max:=Form11.DDSpinEdit9.Value;    {Hz}
  nuI_max:=Form11.DDSpinEdit10.Value;   {Hz}
  { Set nuI }
  if t<t0 then begin
      N:=0;
  end else if (t>=t0)and(t<=t1) then begin
      AColumn.rn[2,1]:=        nuI_max/(t1-t0)*(t-t0);
  end else if (t>t1)and(t<=t2) then begin
      AColumn.rn[2,1]:=nuI_max-nuI_max/(t2-t1)*(t-t1);
  end;
  { Plot nuE(nuI) }
  if (t>=t0)and(t<=t2) then begin
      if (trunc(nt/n_show)=nt/n_show) then begin
          if          t<=t1 then begin
             Form11.Series1.AddXY(AColumn.Pop[1].nu,AColumn.rn[2,1]);
          end else if t<=t2 then begin
             Form11.Series2.AddXY(AColumn.Pop[1].nu,AColumn.rn[2,1]);
             if N<10000 then begin
                N:=N+1;
                nuE[N]:=AColumn.Pop[1].nu;
                nuI[N]:=AColumn.rn[2,1];
             end;
          end;
      end;
  end;
  { Set nuE }
  if (t>=t3)and(t<=t4) then begin
      AColumn.rn[1,2]:=        nuE_max/(t4-t3)*(t-t3);
  end else if (t>t4)and(t<=t5) then begin
      AColumn.rn[1,2]:=nuE_max-nuE_max/(t5-t4)*(t-t4);
  end;
  { Plot nuE(nuI) }
  if (t>=t3)and(t<=t5) then begin
      if (trunc(nt/n_show)=nt/n_show) then begin
          if          t<=t4 then begin
             Form11.Series1.AddXY(AColumn.rn[1,2],AColumn.Pop[2].nu);
          end else if t<=t5 then begin
             Form11.Series3.AddXY(AColumn.rn[1,2],AColumn.Pop[2].nu);
             if N<10000 then begin
                N:=N+1;
                nuE[N]:=AColumn.rn[1,2];
                nuI[N]:=AColumn.Pop[2].nu;
             end;
          end;
      end;
  end;
end;
{******************************************************************************}

{******************************************************************************}
procedure PlotVectorField_Setting_nuE_or_nuI;
{******************************************************************************}
{ Set mesh for nuE(t)=nuE_i_j and nuI(t)=nuI_i_j and calculate the vector field
  (U,V) as the derivatives (d(nuE(t+dt)-nuE(t))/dt, d(nuE(t+dt)-nuE(t))/dt).
  Change i,j at discrete time steps.
  VF[k,1]-nuE;  VF[k,2]-nuI;  VF[k,3]-dnuE/dt;  VF[k,4]-dnuI/dt
}
var
    nuE_max,nuI_max,t_step,nuE_i_j,nuI_i_j,scale  :double;
    i,j,k :integer;
begin
  { Parameters }
  Nx:=trunc(Form11.DDSpinEdit8.Value);
  Ny:=trunc(Form11.DDSpinEdit11.Value);
  t_step  :=Form11.DDSpinEdit14.Value/1e3;  {s}
  nuE_max :=Form11.DDSpinEdit12.Value;     {Hz}
  nuI_max :=Form11.DDSpinEdit13.Value;     {Hz}
  scale   :=Form11.DDSpinEdit15.Value;
  k:=trunc(t/t_step);
  { k=(Nx+1)*(Ny-j) + i+1 }
  if (k<=0)or(k>(Nx+1)*(Ny+1)) then EXIT;
  j:=Ny-trunc((k-1)/(Nx+1));
  i:=k-(Nx+1)*(Ny-j)-1;
  {********************}
  nuE_i_j:=nuE_max/Nx*i;
  nuI_i_j:=nuI_max/Ny*j;
  { Calculate vector field }
  if (abs(t-(k+1)*t_step)<dt)and(k<10000) then begin
     VF[k,1]:=nuE_i_j;
     VF[k,2]:=nuI_i_j;
     VF[k,3]:=AColumn.Pop[1].nu-nuE_i_j;
     VF[k,4]:=AColumn.Pop[2].nu-nuI_i_j;
     { Plot vectors }
     Form11.Series4.AddArrow(VF[k,1],               VF[k,2],
                             VF[k,1]+scale*VF[k,3], VF[k,2]+scale*VF[k,4]);
  end;
  { Set nuE, nuI }
  AColumn.rn[1,1]:=nuE_i_j;
  AColumn.rn[1,2]:=nuE_i_j;
  AColumn.rn[1,3]:=nuE_i_j;
  AColumn.rn[1,4]:=nuE_i_j;
  AColumn.rn[2,1]:=nuI_i_j;
  AColumn.rn[2,2]:=nuI_i_j;
  AColumn.rn[2,3]:=nuI_i_j;
  AColumn.rn[2,4]:=nuI_i_j;
end;
{******************************************************************************}

procedure TForm11.Button1Click(Sender: TObject);
{ Clear }
begin
  Form11.Series1.Clear;
  Form11.Series2.Clear;
  Form11.Series3.Clear;
  Form11.Series4.Clear;
end;

procedure TForm11.Button2Click(Sender: TObject);
begin
  Form11.Chart1.CopyToClipboardBitmap;
end;

{***********************************************}
procedure TForm11.Button3Click(Sender: TObject);
{ Write }
var
    i,j,k :integer;
begin
  case Form11.PageControl1.ActivePageIndex of
  0,1: begin
         { Nullclines }
         assignFile(aaa,'Nulclines.dat'); rewrite(aaa);
         for i:=0 to N do begin
             writeln(aaa,nuE[i]:9:2,nuI[i]:9:2);
         end;
         closeFile(aaa);
       end;
  2: begin
         { Just plot }
         assignFile(aaa,'Trajectory.dat'); rewrite(aaa);
         for i:=0 to N do begin
             writeln(aaa,nuE[i]:9:2,nuI[i]:9:2);
         end;
         closeFile(aaa);
       end;
  3: begin
         { Vector field }
         assignFile(aaa,'VectorField.dat'); rewrite(aaa);
         for j:=Ny downto 0 do begin
             for i:=0 to Nx do begin
                 k:=(Nx+1)*(Ny-j) + i+1;
                 write  (aaa,VF[k,1]:9:2, ' ',VF[k,2]:9:2,' ');
                 write  (aaa,VF[k,3]:10:4,' ',VF[k,4]:10:4);
                 writeln(aaa,sqrt(sqr(VF[k,3])+sqr(VF[k,4])):10:4);
             end;
         end;
         closeFile(aaa);
     end;
  end;
end;
{***********************************************}

procedure TForm11.TabSheet5Show(Sender: TObject);
begin
  Form11.Chart2.Visible:=true;
  Form11.Chart1.Visible:=not(Form11.Chart2.Visible);
end;

procedure TForm11.TabSheet5Exit(Sender: TObject);
begin
  Form11.Chart2.Visible:=false;
  Form11.Chart1.Visible:=not(Form11.Chart2.Visible);
end;

{***********************************************}
procedure Draw_u_s_plot;
{***********************************************}
var gL1_,gL2_,u1_,u2_,s1_,s2_ :double;
begin
  if Form11.PageControl1.ActivePageIndex<>4 then EXIT;
  if (trunc(nt/n_show)=nt/n_show) then begin
     gL1_:=AColumn.Pop[1].PP.NP.C_membr/AColumn.Pop[1].PP.NP.tau_m0;
     gL2_:=AColumn.Pop[2].PP.NP.C_membr/AColumn.Pop[2].PP.NP.tau_m0;
     u1_:=(AColumn.Pop[1].uE+AColumn.Pop[1].uI)/gL1_;
     u2_:=(AColumn.Pop[2].uE+AColumn.Pop[2].uI)/gL2_;
     s1_:=(AColumn.Pop[1].sE+AColumn.Pop[1].sI)/gL1_;
     s2_:=(AColumn.Pop[2].sE+AColumn.Pop[2].sI)/gL2_;
     Form11.LineSeries1.AddXY(u1_*1e3,s1_);
     Form11.LineSeries2.AddXY(u2_*1e3,s2_);
  end;
end;
{***********************************************}

procedure TForm11.Button4Click(Sender: TObject);
{ Clear }
begin
  Form11.LineSeries1.Clear;
  Form11.LineSeries2.Clear;
end;

end.
