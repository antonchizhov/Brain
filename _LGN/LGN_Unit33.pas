unit LGN_Unit33;     { Saccades }

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  LGN_Init, StdCtrls, TeEngine, Series, ExtCtrls, TeeProcs, Chart;

const MaxExpSacc=10000;

type
  TLGN_Form33 = class(TForm)
    Label1: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TPointSeries;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  ExpVector = array[0..MaxExpSacc] of double;
  PExpVector =^ExpVector;

  TSaccades = record
    X,Y             :ExpVector;
    dt_in_ms,shift  :double;
    nt_end          :integer;
  end;

var
  LGN_Form33: TLGN_Form33;
  Saccades :TSaccades;
  aa1,bbb  :text;


implementation

{$R *.dfm}


procedure ReadAndFillSaccadesCoordinatesFromFile(FName :string; PV :PExpVector;
                                          nt_end_ :integer; shift_,dt_ :double);
{
  Reading of experimental data as arrays:
  E[0..MaxExp] -- values.
  Interpolation (linear) is applied to fill the array 'V'.
}
var
     n,nt,nE            :integer;
     t,w                :double;
     E1,tE              :ExpVector;
begin
  { Reading file }
  assign(aa1,FName);  reset(aa1);
  readln(aa1);       // skip one line
  n:=0;
  repeat  n:=n+1;
    readln(aa1,tE[n],E1[n]);
  until (eof(aa1)) or (n=MaxExpSacc);
  nE:=n;
//  nt_end:=trunc(tE[n]/dt);
  close(aa1);
  { Filling arrays 'ExpData.V1', 'ExpData.V2', 'ExpData.V3' }
  nt:=-1;
  repeat  nt:=nt+1;
    t:=nt*dt_ + shift_;
    { Finding of the nearest right point in array 'tE' }
    n:=0;
    repeat n:=n+1
    until (n=nE) or (tE[n]>t);
    { Linear interpolation }
    if n=1 then                      w:=1
    else if tE[n]-tE[n-1]>1e-8 then  w:=(t-tE[n-1])/(tE[n]-tE[n-1])
                               else  w:=0;
    PV^[nt]:=E1[n-1]*(1-w) + E1[n]*w;
    if n>=nE then begin
       PV^[nt]:=E1[nE];
    end;
  until (nt=MaxExpSacc) or (nt=nt_end_);
end;

procedure ReadAndFillSaccadesCoordinatesFromListBox(LB :TListBox; PV :PExpVector;
                                          nt_end_ :integer; shift_,dt_ :double);
{
  Reading of experimental data as arrays:
  E[0..MaxExp] -- values.
  Interpolation (linear) is applied to fill the array 'V'.
}
var
     n,nt,nE,i_str,i    :integer;
     t,w                :double;
     dum                :array[1..6] of double;
     E1,tE              :ExpVector;
     s1,s2              :string;
begin
  { Reading }
  n:=0;   i_str:=0;
  repeat  n:=n+1;  i_str:=i_str+1;
     s1:=LB.Items[i_str-1];
     for i:=1 to 2 do begin
         while Pos(' ', s1)=1 do Delete(s1,1,1);
         s2:=s1;
         if Pos(' ', s1)>0 then SetLength(s1,Pos(' ', s1)-1);  //s1-current number
         Delete(s2,1,Length(s1));
         dum[i]:=StrToFloat(s1);
         s1:=s2;
     end;
    tE[n]:=dum[1]; E1[n]:=dum[2];
  until (i_str=LB.Items.Count) or (n=MaxExpSacc);
  nE:=i_str;
  { Filling arrays 'ExpData.V1', 'ExpData.V2', 'ExpData.V3' }
  nt:=-1;
  repeat  nt:=nt+1;
    t:=nt*dt_ + shift_;
    { Finding of the nearest right point in array 'tE' }
    n:=0;
    repeat n:=n+1
    until (n=nE) or (tE[n]>t);
    { Linear interpolation }
    if n=1 then                      w:=1
    else if tE[n]-tE[n-1]>1e-8 then  w:=(t-tE[n-1])/(tE[n]-tE[n-1])
                               else  w:=0;
    PV^[nt]:=E1[n-1]*(1-w) + E1[n]*w;
    if n>=nE then begin
       PV^[nt]:=E1[nE];
    end;
  until (nt=MaxExpSacc) or (nt=nt_end_);
end;

procedure TLGN_Form33.FormShow(Sender: TObject);
{ Saccades are read from Fig.1B of [Baudot et al. // Front. Neural Circ. 2013] }
var i :integer;
begin
  { Reading file }
  Saccades.dt_in_ms:=1{ms};
  Saccades.nt_end:=MaxExpSacc;
  Saccades.shift :=1000{ms};
  ReadAndFillSaccadesCoordinatesFromListBox(LGN_Form33.ListBox1, @Saccades.X, Saccades.nt_end,Saccades.shift,Saccades.dt_in_ms);
  ReadAndFillSaccadesCoordinatesFromListBox(LGN_Form33.ListBox2, @Saccades.Y, Saccades.nt_end,Saccades.shift,Saccades.dt_in_ms);
//  ReadAndFillSaccadesCoordinatesFromFile( 'xred.txt', @Saccades.X, Saccades.nt_end,Saccades.shift,Saccades.dt_in_ms);
//  ReadAndFillSaccadesCoordinatesFromFile('yblue.txt', @Saccades.Y, Saccades.nt_end,Saccades.shift,Saccades.dt_in_ms);
  { Draw }
  LGN_Form33.Series1.Clear;
  for i:=0 to Saccades.nt_end do begin
      LGN_Form33.Series1.AddXY(Saccades.X[i],Saccades.Y[i]);
  end;
end;

procedure TLGN_Form33.Button1Click(Sender: TObject);
var i :integer;
begin
  assignFile(bbb,'Saccades_t_x_y.dat');  rewrite(bbb);
  for i:=0 to Saccades.nt_end do begin
      writeln(bbb,i*Saccades.dt_in_ms:8:3,' ',Saccades.X[i]:9:3,' ',Saccades.Y[i]:9:3);
  end;
  closeFile(bbb);
end;

end.
