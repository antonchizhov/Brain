unit ThresholdO;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, IBCtrls, ColorGrd,
  Menus, DDSpinEdit, TeEngine, Series, TeeProcs, Chart,
  HHUnit18,MathMyO,typeNrnParsO;

procedure Read_Threshold_from_File(iTable :integer);
function TabulatedThreshold(HH_type_ :string; DVDt,ts :double) :double;
function VThreshold3(NP_:NeuronProperties; DVDt,ts :double) :double;
function VThreshold2(NP_:NeuronProperties; DVDt,ts :double) :double;
function VThreshold4(NP_:NeuronProperties; DVDt,ddV,ts :double) :double;
function VThreshold0(NP_:NeuronProperties; dVT_ExcBlock,DVDt,ddV,ts :double) :double;
function VThreshold5(NP_:NeuronProperties; Vinf,DVDt,ddV,ts :double) :double;
function VThreshold6(NP_:NeuronProperties; NV_:NeuronVariables) :double;
function VThreshold7(NP_:NeuronProperties; NV_:NeuronVariables) :double;
function VThreshold8(NP_:NeuronProperties; NV_:NeuronVariables; DVDt,ddV,ts,ss_:double) :double;
function VThreshold9(NP_:NeuronProperties; NV_:NeuronVariables; DVDt,ddV,ts,uu_:double) :double;
function VThreshold10(NP_:NeuronProperties; dVT_ExcBlock,DVDt,ddV,ts :double) :double;

implementation
{---- Threshold --------------------------------------------------}

const
    MaxThr=2000;
type
    vecThr  =array[0..MaxThr]   of double;
    vecThr2 =array[1..2,0..MaxThr] of double;
var
     Thr_dVdt                   :vecThr2;
     nThr_dVdt                  :integer;
     dThr_DVDt,min_tAP_Thr_DVDt :array[1..2] of double;
     IfReadThr                  :array[1..2] of integer;

function Sigmoid(x :double) :double;
begin    Sigmoid:=1/(1+dexp(-x))  end;

procedure Read_Threshold_from_File(iTable :integer);
{  Reads the dependence of the threshold Thr on dV/dt from file.
   File has 2 columns: X[0..MaxThr], Y[0..MaxThr].
   Interpolation (linear) is applied to fill the array 'Thr_dVdt[0..MaxThr]'. }
var
     n,nE,i                     :integer;
     xc,w,dum1,dum2,dum3,dum4,
     dum5,dum6,min_tAP,max_dVdt :double;
     X,Y                        :vecThr;
     FileName                   :string;
     ttt                        :text;
begin
  case iTable of
    1: FileName:='set_VTh(dVdt)_Lyle.dat';
    2: FileName:='set_VTh(dVdt)_Chow.dat';
  end;
  { Reading file }
  if not(FileExists(FileName)) then exit;
  AssignFile(ttt,FileName); reset(ttt);
  min_tAP:=1e6; max_dVdt:=0;
  n:=0;
  repeat  n:=n+1;
    { 1-Th   2-tAP  3-Iind  4-DVDt_Th  5-Th1  6-DVDt_Th1 }
    readln(ttt,dum1,dum2,dum3,dum4,dum5,dum6);
//    X[n]:=dum6; Y[n]:=dum5;  {dVdt and Thr of the first spike}    {06.04.2010}
    X[n]:=dum4; Y[n]:=dum1;    {dVdt and Thr of the second spike}
    if dum2<=0 then n:=n-1 {skip zero-threshold data}
    else begin
         if (dum2<min_tAP)and(dum2>0)  then min_tAP :=dum2;
         if  dum4>=max_dVdt then begin  max_dVdt:=dum4; nE:=n;  end;
    end;
  until (eof(ttt)) or (n=MaxThr);
  close(ttt);
  { Time criterion }
  min_tAP_Thr_DVDt[iTable]:=min_tAP/1000;
  { Remeshing - Filling array 'Thr_dVdt' }
  nThr_dVdt:=200;
  dThr_dVdt[iTable]:=X[nE]/sqr(nThr_dVdt);
  i:=-1;
  repeat  i:=i+1;
    xc:=sqr(i)*dThr_dVdt[iTable];
    { Finding the nearest right point in array 'Y' }
    n:=1;
    repeat n:=n+1
    until (n=nE) or (X[n]>xc);
    { Linear interpolation }
    if (X[n]-X[n-1]>1e-8)and(Y[n-1]<>0)and(n<nE)and(X[n-1]<xc) then
        w:=(xc-X[n-1])/(X[n]-X[n-1])                           else  w:=0;
    Thr_dVdt[iTable,i]:= Y[n-1]*(1-w) + Y[n]*w;
  until (i=nThr_dVdt);
  IfReadThr[iTable]:=1;
end;

procedure Read_Threshold_from_ListBox(iTable :integer);
{  Reads the dependence of the threshold Thr on dV/dt from ListBoxes.
   ListBox has 6 columns: X[0..MaxThr], Y[0..MaxThr].
   Interpolation (linear) is applied to fill the array 'Thr_dVdt[0..MaxThr]'. }
var
     n,nE,i,i_str               :integer;
     xc,w,min_tAP,max_dVdt      :double;
     dum                        :array[1..6] of double;
     X,Y                        :vecThr;
     s1,s2                      :string;
     LB                          :TListBox;
     ttt                        :text;
begin
  case iTable of
    1: LB:=HHForm18.ListBox2; // 'set_VTh(dVdt)_Lyle.dat';
    2: LB:=HHForm18.ListBox3; // 'set_VTh(dVdt)_Chow.dat';
  end;
  { Reading }
  min_tAP:=1e6; max_dVdt:=0;
  n:=0;   i_str:=0;
  repeat  n:=n+1;  i_str:=i_str+1;
       s1:=LB.Items[i_str-1];
       for i:=1 to 6 do begin
         while Pos(' ', s1)=1 do Delete(s1,1,1);
         s2:=s1;
         if Pos(' ', s1)>0 then SetLength(s1,Pos(' ', s1));  //s1-current number
         Delete(s2,1,Length(s1));
         dum[i]:=StrToFloat(s1);
         s1:=s2;
       end;
    { 1-Th   2-tAP  3-Iind  4-DVDt_Th  5-Th1  6-DVDt_Th1 }
//    X[n]:=dum6; Y[n]:=dum5;  {dVdt and Thr of the first spike}    {06.04.2010}
    X[n]:=dum[4]; Y[n]:=dum[1];    {dVdt and Thr of the second spike}
    if dum[2]<=0 then n:=n-1 {skip zero-threshold data}
    else begin
         if (dum[2]<min_tAP)and(dum[2]>0)  then min_tAP :=dum[2];
         if  dum[4]>=max_dVdt then begin  max_dVdt:=dum[4]; nE:=n;  end;
    end;
  until (i_str=LB.Items.Count) or (n=MaxThr);
  { Time criterion }
  min_tAP_Thr_DVDt[iTable]:=min_tAP/1000;
  { Remeshing - Filling array 'Thr_dVdt' }
  nThr_dVdt:=200;
  dThr_dVdt[iTable]:=X[nE]/sqr(nThr_dVdt);
  i:=-1;
  repeat  i:=i+1;
    xc:=sqr(i)*dThr_dVdt[iTable];
    { Finding the nearest right point in array 'Y' }
    n:=1;
    repeat n:=n+1
    until (n=nE) or (X[n]>xc);
    { Linear interpolation }
    if (X[n]-X[n-1]>1e-8)and(Y[n-1]<>0)and(n<nE)and(X[n-1]<xc) then
        w:=(xc-X[n-1])/(X[n]-X[n-1])                           else  w:=0;
    Thr_dVdt[iTable,i]:= Y[n-1]*(1-w) + Y[n]*w;
  until (i=nThr_dVdt);
  IfReadThr[iTable]:=1;
end;

function TabulatedThreshold(HH_type_ :string; DVDt,ts :double) :double;
{ Takes threshold from tabulated array 'Thr_dVdt' }
var
     z,w        :double;
     i,iTable   :integer;
begin
  if HH_type_='Lyle' then iTable:=1 else
  if HH_type_='Chow' then iTable:=2 else begin
     { Default }
     TabulatedThreshold:=0.010 {V};
     exit;
  end;
  { Prepare table for threshold }
  if IfReadThr[iTable]<>1 then  Read_Threshold_from_ListBox{File}(iTable);
  { Take the value }
  w:=sqrt(max(0,DVDt)/dThr_dVdt[iTable]);
  if abs(w)>64000 then begin
     { Warning('DVDT is too big in "TabulatedThreshold"'); }
     w:=nThr_dVdt;
  end;
  i:=trunc(w);
  if i<=0         then z:=Thr_dVdt[iTable,0] else
  if i>=nThr_dVdt then z:=Thr_dVdt[iTable,nThr_dVdt] else begin
     w:=(DVDt-sqr(i)*dThr_dVdt[iTable])/((sqr(i+1)-sqr(i))*dThr_dVdt[iTable]);
     z:= Thr_dVdt[iTable,i]*(1-w) + Thr_dVdt[iTable,i+1]*w;
  end;
  if ts<min_tAP_Thr_DVDt[iTable] then z:=50{mV};  {commented on 11.11.2010}
  TabulatedThreshold:=z/1000;
end;

function VThreshold3(NP_:NeuronProperties; DVDt,ts :double) :double;
var z :double;
begin
  if NP_.FixThr>0 then begin
     if ts>0 then begin
        { Fixed or dynamic threshold }
        z:=NP_.FixThr + NP_.dThr_dts/ts + NP_.ThrShift;
     end else begin
        z:=0.100{V};
     end;
  end else begin
     DVDt:=max(0.00001,DVDt);
     z:=TabulatedThreshold(NP_.HH_type,DVDt,ts) + NP_.ThrShift;
  end;
  VThreshold3:=z;
end;

function VThreshold2(NP_:NeuronProperties; DVDt,ts :double) :double;
begin
  if DVDt < 1e-8 then VThreshold2:=0.100{V}
                 else VThreshold2:=VThreshold3(NP_,DVDt,ts);
end;

function VThreshold4(NP_:NeuronProperties; DVDt,ddV,ts :double) :double;
var z :double;
begin
  if (NP_.FixThr<=0)and(DVDt <-0)
                 then begin
                      VThreshold4:=VThreshold3(NP_,-DVDt,ts)
                 end
//  if (NP_.FixThr<=0)and(DVDt <-0)and(ddV<0{V/s^2})
//                    then VThreshold4:=0.100{V}
                 else VThreshold4:=VThreshold3(NP_,DVDt,ts);
end;

function VThreshold0(NP_:NeuronProperties; dVT_ExcBlock,DVDt,ddV,ts :double) :double;
{ VT(dVdt) }
{ created on 11.11.2010 }
var z,q :double;
begin
  { DVDt - dependent threshold }
  if (NP_.FixThr<=0)and(DVDt <-0)
                 then z:=VThreshold3(NP_,-DVDt,ts)
                 else z:=VThreshold3(NP_,DVDt,ts);
  { t*-dependent threshold }
  q:=0;
  if ts>NP_.dT_AP then begin
     if NP_.HH_type='Lyle' then q:=min(100,-25+0.4 /(ts-NP_.dT_AP){mV}) else
     if NP_.HH_type='Chow' then q:=min(100,  3+0.07/(ts-NP_.dT_AP){mV}) else
     if NP_.HH_type<>'Passive' then q:=min(100,0.05/(ts-NP_.dT_AP));
  end else q:=100{mV};
  VThreshold0:=max(z + dVT_ExcBlock, q/1000); {V}
end;

function VThreshold10(NP_:NeuronProperties; dVT_ExcBlock,DVDt,ddV,ts :double) :double;
{ VT(t*) }
{ created on 11.11.2010 }
var z,q :double;
begin
  { DVDt - dependent threshold }
{  if (NP_.FixThr<=0)and(DVDt <-0)                                              //commented on 10.08.2016
                 then z:=VThreshold3(NP_,-DVDt,ts)
                 else z:=VThreshold3(NP_,DVDt,ts);}
  { t*-dependent threshold }
  q:=0;
  if ts>NP_.dT_AP then begin
     //if NP_.HH_type='Lyle' then q:=min(100,-25+0.4 /(ts-NP_.dT_AP){mV}) else  //commented on 10.08.2016
     if NP_.HH_type='Lyle' then q:=50{mV}*dexp(-ts/0.010{s})+10{mV} else        //added on 10.08.2016
     //if NP_.HH_type='Chow' then q:=min(100,  3+0.07/(ts-NP_.dT_AP){mV}) else  //commented on 10.08.2016
     if NP_.HH_type='Chow' then q:=20{mV}*dexp(-ts/0.010{s})+ 5{mV} else        //added on 10.08.2016
     if NP_.HH_type<>'Passive' then q:=min(100,0.05/(ts-NP_.dT_AP));
  end else q:=100{mV};
//  VThreshold0:=max(z + dVT_ExcBlock, q/1000); {V}                             //commented on 10.08.2016
  VThreshold10:=q/1000 + dVT_ExcBlock + NP_.ThrShift; {V}              //added on 10.08.2016
end;

function VThreshold5(NP_:NeuronProperties; Vinf,DVDt,ddV,ts :double) :double;
{ VT(t*) with Depolarization Block }
var dVT_ExcBlock,V12,k_ :double;
begin
  { Excitation block }
  if Vinf=0 then dVT_ExcBlock:=0 else begin
//    if (Vinf>-0.040{V}) then z:=0.05{V};
     V12:=-0.010{V};
     k_:=NP_.DepBlock_slope/1000; {V}
     if NP_.DepBlock_limit<0 then V12:=NP_.DepBlock_limit/1000; {V}
     if NP_.HH_type='Lyle' then V12:=V12 + NP_.VNa - 0.065{V} else
     if NP_.HH_type='Chow' then V12:=V12 + NP_.VNa - 0.045{V};
     dVT_ExcBlock:=0.100{V}*Sigmoid((Vinf-V12)/k_);
  end;
  VThreshold5:=VThreshold10(NP_, dVT_ExcBlock,DVDt,ddV,ts);
end;

function VThreshold6(NP_:NeuronProperties; NV_:NeuronVariables) :double;
var h_:double;
begin
  if NV_.DVDt < 1e-8 then begin
     VThreshold6:=0.100{V}
  end else begin
     h_:=NV_.hh;
     if NV_.ii>0 then h_:={NV_.hh*}NV_.ii;
     if (NV_.ii>0)and(NP_.HH_type='Lyle') then h_:=NV_.ii*NV_.ii*NV_.ii;
     VThreshold6:=0.010{V}{NP_.FixThr} + NP_.ThrShift - NP_.k_a_Brette*ln(h_);
  end;
end;

function VThreshold7(NP_:NeuronProperties; NV_:NeuronVariables) :double;
{ created on 20.11.2010 }
begin
  VThreshold7:=NV_.VT_Brette;
end;

function VThreshold8(NP_:NeuronProperties; NV_:NeuronVariables; DVDt,ddV,ts,ss_:double) :double;
{ VT(t*) with Depolarisation Block based on total conductance }
{ created on 13.04.2016 }
var G_tot,dVT_ExcBlock :double;
begin
  dVT_ExcBlock:=0;
  { Excitation block }
  G_tot:=NV_.gActive + NV_.gActiveDend + NP_.gL + ss_;
//  if G_tot>NP_.g_tot_max then begin
//     dVT_ExcBlock:=0.050{V};
//  end;
  dVT_ExcBlock:=0.100{V}*Sigmoid((G_tot/NP_.DepBlock_limit-1)/0.2);
  if (NP_.FixThr<=0) then begin
      VThreshold8:=VThreshold10(NP_, dVT_ExcBlock,DVDt,ddV,ts);
  end else begin
      if ts<=0.005{s} then VThreshold8:=0.100{V} else
      VThreshold8:=NP_.FixThr + dVT_ExcBlock;
  end;
end;

function VThreshold9(NP_:NeuronProperties; NV_:NeuronVariables; DVDt,ddV,ts,uu_:double) :double;
{ VT(t*) with Depolarisation Block based on total current }
{ created on 23.06.2016 }
var dVT_ExcBlock :double;
begin
  dVT_ExcBlock:=0;
  { Excitation block }
  if uu_/NP_.gL*1000>NP_.DepBlock_limit then begin
     dVT_ExcBlock:=0.050{V};
  end;
  if (NP_.FixThr<=0) then begin
      VThreshold9:=VThreshold10(NP_, dVT_ExcBlock,DVDt,ddV,ts);
  end else begin
      if ts<=0.005{s} then VThreshold9:=0.100{V} else
      VThreshold9:=NP_.FixThr + dVT_ExcBlock;
  end;
end;
{---------------------------------------------------------------------}

end.
