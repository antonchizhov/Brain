unit V1_2dO;

interface
uses Init,ColumnO;

procedure DefaultParameters_V1_2D;
procedure System_V1_2D;

var
   ni,nj  :integer;
   AColumn            :array[0..mXmax,0..mYmax] of TColumn;

implementation
uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls, ComCtrls, ExtCtrls,
     mathMy,Wright,slice,other,other_2D,Hodgkin,HH_canal,
     graph_0d, graph_2D,wave,Unit1,Unit3,ph_Dens,ph_Volt,Correspond,
     ConnectionsO,RepresentativesO;

procedure DefaultParameters_V1_2D;
  procedure put (var x:double;  val:double);   begin if x=0 then x:=val; end;
  procedure iput(var x:integer; val:integer);  begin if x=0 then x:=val; end;
begin
  put(a_axon[1],1{.39} {m/s});       put(a_axon[2],1 {m/s});
{************************ Calculation parameters ********************}
  dt:=0.000025/1.5;
  iput(ni,20);  iput(nj,1);
  Nts:=30; ts_end:=0.060{s};
  t_end:=0.100{s};
  ni_2:=trunc(ni/2);
  nj_2:=trunc(nj/2);
  iput(R_stim,4);  iput(ni_stim,trunc(3/4*ni)); iput(nj_stim,trunc(nj/2));
  put(dx,60*a_axon[1]*dt);   dy:=dx;   {Courant condition}
  dx2:=dx/2;                dy2:=dy/2;
  OrderOfWaveEq:=2;
  { Output file }
  dt_out:=0.010 {s};
  WriteOrNot:=1;
  assign(nnn,'focal_2D.dat');  rewrite(nnn);  close(nnn);
{*****************************************************************}
  CorrespondParametersToTheForm;
end;

procedure Set_Ps_2D(i,j :integer; var pext :double);
var R_:double;
begin
  pext:=Qns;
  if (t>t0s) and (t<t0s+tSt) then  begin
{      if ((i>=ni_2-5)and(i<=ni_2+5))and(j<=5) then }
      { distance from electrode center}
      R_:=sqrt(sqr(i-ni_stim)+sqr(j-nj_stim));
      if R_<=R_stim then begin
//      if sqr(i-3/4*ni)<=sqr(8) then
          pext:=pext + Iext{mkA} * 4{1/(mkA*s)};
      end else begin
          pext:=pext + Iext{mkA} * 4{1/(mkA*s)} * R_stim/R_;
      end;
  end;
end;

procedure MeasureInNode(i,j :integer);
var l :integer;
begin
        case If_I_V_or_p of
        1: Vr:=ANrn[i3].NV.PSC; //PSC[3];
        2: Vr:=ANrn[i3].NV.V;   //V[3];//-Vrest[3];
        3: Vr:=AColumn[i,j].Pop[i3].nu;     //Q[3];
        4: Vr:=ANrn[i3].NV.VatE;//VatE[3]-Vrest[3];
        end;
end;

{**************************************************************************}
procedure System_V1_2D;
{
}
var
      i,j,ntP,nl,n_dr_                    : integer;
begin
  { Parameters }
  CommonParameters;
  ParametersFromFile;
  OtherParameters;
  CorrespondParametersToTheForm;
  { Initial conditions }
  InitialConditions;
  InitialConditionsHodgkin;
  CreatePopulationsAndSynapsesO;
  WhatHappensInRepresentativeNeuronsO;
  InitiateRepresentativeNeuronsO;
  for i:=0 to ni+1 do begin
      for j:=0 to nj+1 do begin
          AColumn[i,j].Create;
      end;
  end;
  if DrawOrNot =1 then  Initial_Picture_2D;
  if WriteOrNot=1 then  InitiateWriting;
  {****************************************************************************}
  REPEAT
    { ----- Step ----- }
    t:=t+dt;   nt:=nt+1;
    for i:=0 to ni+1 do begin
      for j:=0 to nj+1 do begin
          AColumn[i,j].IntegrateDensity;
      end;
    end;
    {-------------}
    for i:=0 to ni+1 do begin
      for j:=0 to nj+1 do begin
          AColumn[i,j].IntegrateAxons;
          Set_Ps_2D(i,j,pext);
          AColumn[i,j].rext:=pext;
      end;
    end;
{    AxonEquation(1);
    AxonEquation(2);
    BoundaryConditions(1);
    BoundaryConditions(2);}
    {-------------}
    for i:=0 to ni+1 do begin
      for j:=0 to nj+1 do begin
          AColumn[i,j].IntegrateSynapses;
          AColumn[i,j].IntegrateVoltage;
      end;
    end;
    Renamination_2D;
    {**************************************}
    OneStepForRepresentativeNeuronsO(@t,@dt);
    { Measurement }
    MeasureInNode(i_view,j_view);
    { Drawing }
    n_dr_:=trunc(Form3.DDSpinEdit3.Value);
    if (round(nt/n_dr_)*n_dr_=nt) then
        Draw_Lattice(1,ni,nj,{jwiew=}nj_2,Wpn);
    if ((trunc(nt/n_show)=nt/n_show)or(nt=1))then
        GraphicsFor1Node({ie=}1, i_view,j_view);
    if (WriteOrNot=1) and (trunc(nt/2)=nt/2) then Writing;
    //WriteFromNode(ni_stim, nj_stim);
    if (abs(t-trunc(t*1000)/1000)<dt) then WritingSectionOf2D;
    if (abs(t-0.005)<dt)or(abs(t-trunc(t/dt_out)*dt_out)<dt) then WritingField;
    MyThread1.Treat_Key;
    Application.ProcessMessages;
    Pause;
  UNTIL nt>=nt_end;
  {****************************************************************************}
//  if WriteOrNot=1 then  close(ccc);
end;
{--------------------EOF---------------------------------------------------}

end.
