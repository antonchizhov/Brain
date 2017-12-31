unit Unit31;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  Init,t_dtO,MathMyO,ColumnO,PopulationO,ConnectionsO,typeNrnParsO,
  TeEngine, Series, ExtCtrls, TeeProcs, Chart;

const MaxExp=2000;

type
  TForm31 = class(TForm)
    Button1: TButton;
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TExpData = record
    gAMPA,gNMDA,gGABA                :array[0..mMaxExp] of double;
  end;

procedure SetConductancesFromExperiment(nt_ :integer; ACol_:TColumn);

var
  Form31: TForm31;

  ExpData :TExpData;
  aa1,aa2,aa3 :text;

implementation

{$R *.dfm}

procedure ReadExpConductances;
{
  Reading of experimental data as arrays:
  E[0..MaxExp] -- values.
  Interpolation (linear) is applied to fill the array 'gExp'.
}
var
     n,nt,nE            :integer;
     t,w                :double;
     E1,E2,E3,tE        :array[0..MaxExp] of double;
begin
  { Parameters }
  shift_Smp:=0;
  scy_Smpl:=1;
  scx_Smpl:=0.001; {s}
  { Reading file }
//  ChDir(MainDir);
  assign(aa1,'e:\Anton\Optimization\Type 3 discharges\gAMPA_.txt');  reset(aa1);
  assign(aa2,'e:\Anton\Optimization\Type 3 discharges\gNMDA_.txt');  reset(aa2);
  assign(aa3,'e:\Anton\Optimization\Type 3 discharges\gGABA_.txt');  reset(aa3);
  n:=0;
  repeat  n:=n+1;
    readln(aa1,E1[n]);
    readln(aa2,E2[n]);
    readln(aa3,E3[n]);
    tE[n]:=n-1;
  until (eof(aa1)) or (n=MaxExp);
  nE:=n;
  close(aa1);
  close(aa2);
  close(aa3);
  { Filling arrays 'gAMPA', 'gNMDA', 'gGABA' }
  nt:=-1;
  repeat  nt:=nt+1;
    t:=nt*dt/scx_Smpl+shift_Smp;
    { Finding of the nearest right point in array 'tE' }
    n:=0;
    repeat n:=n+1
    until (n=nE) or (tE[n]>t);
    { Linear interpolation }
    if n=1 then                      w:=1
    else if tE[n]-tE[n-1]>1e-8 then  w:=(t-tE[n-1])/(tE[n]-tE[n-1])
                               else  w:=0;
    { Scale for GABA (0.235) corresponds to linearization at Vh=-27mV }
    ExpData.gAMPA[nt]:=max(0,(E1[n-1]*(1-w) + E1[n]*w)*scy_Smpl);
    ExpData.gNMDA[nt]:=max(0,(E2[n-1]*(1-w) + E2[n]*w)*scy_Smpl);
    ExpData.gGABA[nt]:=max(0,(E3[n-1]*(1-w) + E3[n]*w)*scy_Smpl*0.235);
    if n>=nE then begin
       ExpData.gAMPA[nt]:=0;
       ExpData.gNMDA[nt]:=0;
       ExpData.gGABA[nt]:=0;
    end;
  until (nt=mMaxExp) or (nt=nt_end);
end;

procedure ReadAndPlotConductances;
{ Read and plot data }
var
     n,nt,nE            :integer;
begin
  { Read }
  ReadExpConductances;
  {******************}
  Form31.Series1.Clear;
  Form31.Series2.Clear;
  Form31.Series3.Clear;
  nt:=-1;
  repeat  nt:=nt+1;
    Form31.Series1.AddXY(dt*nt*1e3,ExpData.gAMPA[nt]);
    Form31.Series2.AddXY(dt*nt*1e3,ExpData.gNMDA[nt]);
    Form31.Series3.AddXY(dt*nt*1e3,ExpData.gGABA[nt]);
  until (nt=mMaxExp) or (nt=nt_end);
  Application.ProcessMessages;
end;

procedure SetConductancesFromExperiment(nt_ :integer; ACol_:TColumn);
var i,l,ip    :integer;
    Isyn_,g_  :double;
    s         :string;
begin
  { Control variables }
{  With ACol_.Pop[1] do begin
      uE:=0;  sE:=0;  uI:=0;  sI:=0;  tt:=0;
  end;                                }
  for i:=1 to NSyn do  with ACol_.Syn[i].SP do {if IfBlock<>1 then} begin
      ip:=ACol_.OwnerOfSynapse(Name);
      if ip=1 then begin
         if          (Name='GABA on P')and(Form31.CheckBox3.Checked) then begin
            { GABA synapses }
            g_       :=ExpData.gGABA[nt]/ACol_.Pop[1].PP.NP.Square/1e6;
            ACol_.Pop[1].sI:= g_;
            ACol_.Pop[1].uI:=-g_*(Vus-ACol_.Syn[i].SP.Vrev);
         end else if (Name='NMDA on P')and(Form31.CheckBox2.Checked) then begin
            { NMDA synapses }
            ACol_.Pop[1].tt:=ExpData.gNMDA[nt]/ACol_.Pop[1].PP.NP.Square/1e6;
         end else if (Name='AMPA on P')and(Form31.CheckBox1.Checked) then begin
            { AMPA synapses }
            g_       :=ExpData.gAMPA[nt]/ACol_.Pop[1].PP.NP.Square/1e6;
            ACol_.Pop[1].sE:= g_;
            ACol_.Pop[1].uE:=-g_*(Vus-ACol_.Syn[i].SP.Vrev);
         end;
      end;
  end;
  { ---------------- Currents ----------------------------------- }
  Isyn_:=-(ACol_.Pop[1].sE + ACol_.Pop[1].sI)*(ACol_.Pop[1].U-Vus) +
           ACol_.Pop[1].uE + ACol_.Pop[1].uI;
  ACol_.Pop[1].Isyn:=Isyn_ * ACol_.Pop[1].PP.NP.Square*1e9; {pA}
end;

procedure TForm31.Button1Click(Sender: TObject);
{ Read and plot data }
begin
  ReadAndPlotConductances;
end;

procedure TForm31.FormShow(Sender: TObject);
begin
  ReadAndPlotConductances;
end;

end.
