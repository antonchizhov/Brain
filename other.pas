unit other;

interface
uses ColumnO,ConnectionsO;

procedure MaximumsOfSignals(var VexpMax,VmodMax :double);
function TargetFuncOfSignalsUndimedWith(VexpMax,VmodMax :double) :double;
{**************** INPUTING/OUTPUTING **********************************}
procedure InitiateWriting;
procedure Writing;
procedure OutputSignals;
procedure OutputHistory;
procedure InitHistory;
procedure WriteCoefficients;
procedure WriteFromNode(ACol :TColumn; FName :string);
{**************** EXPERIMENTAL RECORDS ********************************}
procedure DontReadExpData;
procedure ShowExpFigure;
procedure ReadExpData;
{**********************************************************************}

implementation
uses Init,t_dtO,MathMyO,coeff,Unit1,Unit2,Unit5,Unit6,Unit18,Unit19,
     RepresentativesO,graph_2DO, 
     Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

procedure MaximumsOfSignals(var VexpMax,VmodMax :double);
{
  Finding of maximum of signals 'Vexp' and 'Vmod'.
}
var  nt                    :integer;
begin
  { Maximum of 'Vexp' }
  VexpMax:=0;
  for nt:=1 to imin(nt_end,mMaxExp) do  if abs(Vexp[nt,Smpl])>VexpMax then
      VexpMax:=abs(Vexp[nt,Smpl]);
  { Maximum of 'Vmod' }
  VmodMax:=0;
  for nt:=1 to imin(nt_end,mMaxExp) do  if abs(Vmod[nt])     >VmodMax then
      VmodMax:=abs(Vmod[nt]);
end;

function TargetFuncOfSignalsUndimedWith(VexpMax,VmodMax :double) :double;
{
  Undimensioning of signals 'Vexp' and 'Vmod' and
  calculation of target Functional 'Func'.
}
var  nt   :integer;
     Func :double;
begin
  { Calculation of target Functional 'Func' }
  Func:=0;
  for nt:=1 to imin(nt_end,mMaxExp) do
      Func:=Func*(nt-1)/nt + sqr(Vexp[nt,Smpl]/VexpMax-Vmod[nt]/VModMax)/nt;
  TargetFuncOfSignalsUndimedWith:=Func;
end;

{**************** INPUTING/OUTPUTING **********************************}


procedure InitiateWriting;
begin
  AssignFile(ccc,'VeViVrAP.dat');
  if FileExists('VeViVrAP.dat')and(iHist=1) then  append (ccc)
                                            else  rewrite(ccc);
  CloseFile(ccc);
  if Form5.CheckBox2.Checked then begin
     AssignFile(f51,'SynCond.dat');
     if  FileExists('SynCond.dat')   then append(f51) else rewrite(f51);
     CloseFile(f51);
     AssignFile(f52,'InnerCond.dat');
     if  FileExists('InnerCond.dat') then append(f52) else rewrite(f52);
     CloseFile(f52);
  end;
  { Control values }
{  assign(ddd,'u_s(t).dat');
  if (WriteOrNot=0) or (iHist=1) then  rewrite(ddd)
                                 else  append (ddd);}
//  assign(nnn,'WriteFromNode.dat');  rewrite(nnn);  close(nnn);
end;

procedure Writing;
var Vex,Vmod_ :double;
begin
  append(ccc);
  if nt>mMaxExp then Vex:=0    else Vex := Vexp[nt,Smpl];
  if nt>mMaxExp then Vmod_:=Vr else Vmod_:=Vmod[nt];
  if R.NP.If_I_V_or_g in [2,4,5] then begin
                     Vex  :=Vex  *1000;
                     Vmod_:=Vmod_*1000;
  end;
  {           1-A            2-B        3-C               }
  write  (ccc,t*1000:8:3,' ',Vex:10:3,' ',Vmod_:10:3,' ');
  {           4-D              5-E                        }
//  write  (ccc,'0 ',            '0 ');
  {           6-F         7-G         8-H                 }
//  write  (ccc,'0 ',       '0 ',       '0 ');
  {           9-I                   10-K                  }
//  write  (ccc,'0 ',                 '0 ');
  {           11-K               12-L                    }
//  write  (ccc,'0 ',              '0 ');
  writeln(ccc);
  CloseFile(ccc);
end;

procedure WriteFromNode(ACol :TColumn; FName :string);
{   Fields written in file:
    1-time   2-external firing rate
    3-voltage of I   population    4-firing rate of I   population
    5-voltage of II  population    6-firing rate of II  population
    7-voltage of III population    8-firing rate of III population
    9-voltage of IV  population   10-firing rate of IV  population
    11-field set in "Inspector"   12-VSD
}
var  ip :integer;
begin
  assign(nnn,FName);
  if FileExists(FName) then append(nnn) else rewrite(nnn);
  write  (nnn,t*1000:8:4,' ');
  with ACol do begin
       write  (nnn,rext:8:2,' ');
       for ip:=1 to NPop do  write(nnn,Pop[ip].U*1e3:9:5,' ',Pop[ip].nu:8:2,' ');
       if Form18.Visible then write(nnn,FieldToSee(ACol):10:4,' ')
                         else write(nnn,'0 ');
       write(nnn,VSD(ACol):9:5,' ');
       writeln(nnn);
  end;
  close(nnn);
end;

procedure OutputSignals;
{
        Output in file the registered sample 'Vexp[nt,Smpl]'
                       and modelled          'Vmod[nt]'
}
var i,j,nt :integer;
    Vrest_l {VexpMax,VmodMax} :double;
    tt      :string;
    OutFile :string;
begin
  tt:=SmplFile[Smpl];
  if (Smpl=0)or(tt='')or(tt='NoFile') then Exit;
  { Find the dot in the file name }
  i:=1;  while (tt[i]<>'.')and(i<Length(tt)) do i:=i+1;
  { Change the extention on '.dat' }
  OutFile:=tt[1];
  for j:=2 to i-1 do  OutFile:=OutFile+tt[j];
  OutFile:=OutFile+'.dat';
  assign(ddd,OutFile);  rewrite(ddd);
  { Define 'Vrest' }
  if IfChangeVrest=1 then  Vrest_l:=R.NP.Vrest
                     else  Vrest_l:=NP0[1].Vrest;
  {MaximumsOfSignals(VexpMax,VmodMax);}
  for nt:=0 to imin(nt_end,mMaxExp) do begin
      write  (ddd,nt*dt*1000:8:3,' ');
      if IfUndimensionate=1 then
         writeln(ddd,Vexp[nt,Smpl]/VexpMax:8:3,
                 ' ',Vmod[nt]     /VmodMax:8:3,' ')
      else
         if R.NP.If_I_V_or_g in [1,3] then
            writeln(ddd, Vexp[nt,Smpl]              :8:3,
                    ' ', Vmod[nt]                   :8:3,' ')
         else if IfDataStartsFromZero=1 then
            writeln(ddd,(Vexp[nt,Smpl]-Vrest_l)*1000:8:3,
                    ' ',(Vmod[nt]     -Vrest_l)*1000:8:3,' ')
              else
            writeln(ddd,(Vexp[nt,Smpl]        )*1000:8:3,
                    ' ',(Vmod[nt]             )*1000:8:3,' ');
  end;
  close(ddd);
end;

procedure OutputHistory;
var i :integer;
begin
  { History }
  assign(ggg,'history.dat');  append(ggg);
  write(ggg,iHist:3,' ',m:3);  for i:=1 to m  do  write(ggg,' ',g_dg[i]:13);
  write(ggg,' ',mC:2);         for i:=1 to mC do  write(ggg,ifC[i]:2);
  writeln(ggg);
  close(ggg);
end;

procedure InitHistory;
var  i,m :integer;
     s :string;
     hhh :text;
begin
  assign(ggg,'history.dat');
  if IfReadHistory=1 then begin
     { Read old History }
     reset(ggg);
     readln(ggg);
     repeat
       read(ggg,iHist,m);  for i:=1 to m  do  read(ggg,g[i]);
       read(ggg,mC);       for i:=1 to mC do  read(ggg,ifC[i]);
       readln(ggg);
       Define_ig_iC;
       CoeffFrom_g(g);
     until eof(ggg);
     AssignCoeffToChange;
     close(ggg);
  end else begin
     { Initiate History }
     AssignCoeffToChange;
     rewrite(ggg);
     writeln(ggg,'iHist   m    g[1]      g[2]       g[3]       ...   ');
     close(ggg);
     g_FromCoeff(g);
     OutputHistory;
  end;
end;

procedure WriteCoefficients;
var  k :integer;
begin
  write('g=');
  for k:=1 to m do  write(g[k]:12:7,' ');     writeln;
  writeln('***************************************************************');
end;

{**************** EXPERIMENTAL RECORDS ********************************}

procedure  DontReadExpData;
var  nt :integer;
begin
  for nt:=0 to imin(nt_end,mMaxExp) do  Vexp[nt,Smpl]:=0;
end;

procedure ShowExpFigure;
begin
  if ExpFigureFileName='' then begin Form19.Visible:=false; EXIT; end;
  Form19.Visible:=true;
  Form19.Label1.Caption:=ExpFigureFileName;
  if FileExists(ExpFigureFileName) then
  Form19.Image1.Picture.LoadFromFile(ExpFigureFileName);
end;

procedure  ReadExpData;
{
  Reading of experimental data as arrays: tE[0..200] -- time moments;
  E[0..200] -- values.
  Interpolation (linear) is applied to fill the array 'Vexp'.
}
const MaxExp=400;
var
     n,nt,nE            :integer;
     t,w                :double;
     E,tE               :array[0..MaxExp] of double;
begin
  if (Smpl=0)or(SmplFile[Smpl]='NoFile')
             or(FileExists(MainDir+SmplFile[Smpl])=false) then begin
                                  DontReadExpData;
                                  Exit;
  end;
  { Reading file }
//  ChDir(MainDir);
  assign(aaa,MainDir+SmplFile[Smpl]);  reset(aaa);
  n:=0;
  repeat  n:=n+1;
    readln(aaa,tE[n],E[n]);
  until (eof(aaa)) or (n=MaxExp);
  nE:=n;
  close(aaa);
  { Filling array 'Vexp' }
  nt:=-1;
  repeat  nt:=nt+1;
    t:=nt*dt/scx_Smpl+shift_Smp;
    { Finding of the nearest right point in array 'E' }
    n:=0;
    repeat n:=n+1
    until (n=nE) or (tE[n]>t);
    { Linear interpolation }
    if n=1 then                      w:=1
    else if tE[n]-tE[n-1]>1e-8 then  w:=(t-tE[n-1])/(tE[n]-tE[n-1])
                               else  w:=0;
    Vexp[nt,Smpl]:=(E[n-1]*(1-w) + E[n]*w)*scy_Smpl{ - Vrest[1]};
    { Shift to Vrest }
    if (R.NP.If_I_V_or_g in [2,4])and(IfDataStartsFromZero=1) then
        Vexp[nt,Smpl]:=Vexp[nt,Smpl] + R.NP.Vrest;
  until (nt=mMaxExp) or (nt=nt_end);
end;

end.
 