unit BackgroundO;

interface
uses t_dtO,Init,Slice,ColumnO,ConnectionsO,RepresentativesO,CreateNrnO,LGN_Init;

procedure CalculateBackground(Problem :string);
procedure CreateBackgroundObjects;

implementation


procedure CalculateBackground(Problem :string);
{ Calculate steady-state solution for homogeneous background stimulation }
var Qns_mem,Iext_mem,dt_mem :double;
begin
  { Calculate BGColumn from Calc_Functional }
  IfBGinProcess:=true;
  Qns_mem:=Qns;   Iext_mem:=Iext;   dt_mem:=dt;
  if Problem<>'ZeroStimul' then Qns:=Qns+Iext{muA}*pext_Iext {Hz/muA}; //fi_BG
  if (Problem='2D')and(IfExtracellOrThalamOrVisualOrLGN_Stimul in [4,5]) then begin  //LGN
     Qns:=Qns_mem+L_spont;
  end;
  {******}
  Iext:=0;
  {******}
  dt:=2*dt;
  nt:=-trunc(tBG/dt);  t:=nt*dt;
  {***********************}
  Calc_Functional(1,VFunc);
  {***********************}
  Qns:=Qns_mem;   Iext:=Iext_mem;   dt:=dt_mem;
  IfBGinProcess:=false;
end;


procedure CreateBackgroundObjects;
{ Calculate steady-state solution for homogeneous background stimulation }
var
    ip :integer;
begin
  { Create BGColumn and BGNrn and copy from AColumn and ANrn }
  BGColumn:=TColumn.Create;     IfBGColumnCreated:=true;
  BGColumn.CopyInitialConditionsFrom(AColumn);
  for ip:=1 to NPop do begin
      CreateNeuronByTypeO(BGColumn.Pop[ip].PP.NP, BGNrns[ip]);
      BGNrns[ip].EquateFrom(ANrns[ip]);
  end;
end;

end.
