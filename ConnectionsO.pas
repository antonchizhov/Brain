unit ConnectionsO;

interface
uses Forms,
     Init,PopulationO,SynCurrO,
     typeNrnParsO,typeSynParsO,Unit4,Unit14,gsynC;

const maxNSyn=40;

procedure SetNamesOfSynapses;
procedure SetParamsOfSynapses;
function iOfSyn(Name :string):integer;
procedure BlockIfSynapseIsUnused(Name :string; var IfBlock :double);
procedure DeriveNMDAfromAMPA;
procedure V1_Binzegger;
procedure Set_gmax;
procedure SetDDSpinEdits;
procedure ReplaceDDSpinEdits;
procedure Change_gmax_AccordingToNewHHorder(ie :integer; FromTo :string);
//procedure Correspond_NP_to_Form(ie :integer; var NP_ :NeuronProperties);
procedure PrepareParamsForColumnCreation;
procedure RenewSynapticPropertiesForAColumn;

var
  { Populations: }
  //NPE,NPI                     :NeuronProperties;
  NPop                        :integer;//number of populations
  { Synapses: }
  NSyn                        :integer;//number of synapses
  SP_,SP_2                    :array[1..maxNSyn] of SynapseProperties;

implementation
uses ColumnO;

{==========================================================================}
procedure SetNamesOfSynapses;
begin
  NSyn:=40;
  { ------- AMPA ------- }
  SP_[1].Name:='AMP3 on P';
  SP_[2].Name:='AMP3 on I';
  SP_[3].Name:='AMPA on P';
  SP_[4].Name:='AMPA on I';
  SP_[13].Name:='AMPA on P23 de 23';
  SP_[14].Name:='AMPA on I23 de 23';
  SP_[15].Name:='AMPA on P de 23';
  SP_[16].Name:='AMPA on I de 23';
  SP_[17].Name:='AMPA on P23';
  SP_[18].Name:='AMPA on I23';
  SP_[25].Name:='AMP3 on P23';
  SP_[26].Name:='AMP3 on I23';
  {---- GABA ------- }
  SP_[5].Name:='GAB3 on P';
  SP_[6].Name:='GAB3 on I';
  SP_[7].Name:='GABA on P';
  SP_[8].Name:='GABA on I';
  SP_[19].Name:='GABA on P23 de 23';
  SP_[20].Name:='GABA on I23 de 23';
  SP_[21].Name:='GABA on P de 23';
  SP_[22].Name:='GABA on I de 23';
  SP_[23].Name:='GABA on P23';
  SP_[24].Name:='GABA on I23';
  SP_[27].Name:='GAB3 on P23';
  SP_[28].Name:='GAB3 on I23';
  {---- NMDA ------- }
  SP_[9].Name:='NMD3 on P';
  SP_[10].Name:='NMD3 on I';
  SP_[11].Name:='NMDA on P';
  SP_[12].Name:='NMDA on I';
  SP_[31].Name:='NMDA on P23 de 23';
  SP_[32].Name:='NMDA on I23 de 23';
  SP_[33].Name:='NMDA on P de 23';
  SP_[34].Name:='NMDA on I de 23';
  SP_[35].Name:='NMDA on P23';
  SP_[36].Name:='NMDA on I23';
  SP_[37].Name:='NMD3 on P23';
  SP_[38].Name:='NMD3 on I23';
  {---- GABB ------- }
  SP_[29].Name:='GABB on P';
  SP_[30].Name:='GABB on I';
  SP_[39].Name:='GABB on P23';
  SP_[40].Name:='GABB on I23';
end;

function iOfSyn(Name :string):integer;
var i: integer;
begin
  i:=0;
  repeat i:=i+1;
  until Name=SP_[i].Name;
  iOfSyn:=i;
end;

procedure BlockIfSynapseIsUnused(Name :string; var IfBlock :double);
begin
  { Populations }
  if Npop<4 then begin { if no 'I23' population }
     if  Pos('I23', Name)<>0 then IfBlock:=1;
     if (Pos('GABA',Name)<>0)and(Pos('de 23',Name)<>0) then IfBlock:=1;
  end;
  if Npop<3 then begin { if no'P23' population }
     if  Pos('P23', Name)<>0 then IfBlock:=1;
     if (Pos('AMPA',Name)<>0)and(Pos('de 23',Name)<>0) then IfBlock:=1;
     if (Pos('NMDA',Name)<>0)and(Pos('de 23',Name)<>0) then IfBlock:=1;
  end;
  if Npop<2 then begin { if no 'I' population }
     if Pos('GAB',  Name)<>0 then IfBlock:=1;
     if Pos(' on I',Name)<>0 then IfBlock:=1;
  end;
  if IfExtracellOrThalamOrVisualOrLGN_Stimul=1 then begin
     if Pos('AMP3', Name)<>0 then IfBlock:=1;
     if Pos('NMD3', Name)<>0 then IfBlock:=1;
  end;
end;

procedure SetParamsOfSynapses;
var  i :integer;
begin
  if NSyn=0 then SetNamesOfSynapses;
  { ------- AMPA ------- }
  with SP_[iOfSyn('AMP3 on P')] do begin
       Vrev:=VAMPA;       alpha:=alAMPA[1];  beta :=beAMPA[1];  factor:=factorAMPA;  IfBlock:=IfBlockAMPA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_Glu;  U_Depr:=U_Depr_Glu; nu_thr_Depr:=nu_thr_Depr_Glu end;
  with SP_[iOfSyn('AMP3 on I')] do begin
       Vrev:=VAMPA;       alpha:=alAMPA[2];  beta :=beAMPA[2];  factor:=factorAMPA;  IfBlock:=IfBlockAMPA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_Glu;  U_Depr:=U_Depr_Glu; nu_thr_Depr:=nu_thr_Depr_Glu end;
  with SP_[iOfSyn('AMPA on P')] do begin
       Vrev:=VAMPA;       alpha:=alAMPA[1];  beta :=beAMPA[1];  factor:=factorAMPA;  IfBlock:=IfBlockAMPA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_Glu;  U_Depr:=U_Depr_Glu;  nu_thr_Depr:=nu_thr_Depr_Glu; end;
  with SP_[iOfSyn('AMPA on I')] do begin
       Vrev:=VAMPA;       alpha:=alAMPA[2];  beta :=beAMPA[2];  factor:=factorAMPA;  IfBlock:=IfBlockAMPA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_Glu;  U_Depr:=U_Depr_Glu;  nu_thr_Depr:=nu_thr_Depr_Glu; end;
  with SP_[iOfSyn('AMPA on P23 de 23')] do begin
       Vrev:=VAMPA;       alpha:=alAMPA[1];  beta :=beAMPA[1];  factor:=factorAMPA;  IfBlock:=IfBlockAMPA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_Glu;  U_Depr:=U_Depr_Glu;  nu_thr_Depr:=nu_thr_Depr_Glu; end;
  with SP_[iOfSyn('AMPA on I23 de 23')] do begin
       Vrev:=VAMPA;       alpha:=alAMPA[2];  beta :=beAMPA[2];  factor:=factorAMPA;  IfBlock:=IfBlockAMPA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_Glu;  U_Depr:=U_Depr_Glu;  nu_thr_Depr:=nu_thr_Depr_Glu; end;
  with SP_[iOfSyn('AMPA on P de 23')] do begin
       Vrev:=VAMPA;       alpha:=alAMPA[1];  beta :=beAMPA[1];  factor:=factorAMPA;  IfBlock:=IfBlockAMPA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_Glu;  U_Depr:=U_Depr_Glu;  nu_thr_Depr:=nu_thr_Depr_Glu; end;
  with SP_[iOfSyn('AMPA on I de 23')] do begin
       Vrev:=VAMPA;       alpha:=alAMPA[2];  beta :=beAMPA[2];  factor:=factorAMPA;  IfBlock:=IfBlockAMPA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_Glu;  U_Depr:=U_Depr_Glu;  nu_thr_Depr:=nu_thr_Depr_Glu; end;
  with SP_[iOfSyn('AMPA on P23')] do begin
       Vrev:=VAMPA;       alpha:=alAMPA[1];  beta :=beAMPA[1];  factor:=factorAMPA;  IfBlock:=IfBlockAMPA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_Glu;  U_Depr:=U_Depr_Glu;  nu_thr_Depr:=nu_thr_Depr_Glu; end;
  with SP_[iOfSyn('AMPA on I23')] do begin
       Vrev:=VAMPA;       alpha:=alAMPA[2];  beta :=beAMPA[2];  factor:=factorAMPA;  IfBlock:=IfBlockAMPA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_Glu;  U_Depr:=U_Depr_Glu;  nu_thr_Depr:=nu_thr_Depr_Glu; end;
  with SP_[iOfSyn('AMP3 on P23')] do begin
       Vrev:=VAMPA;       alpha:=alAMPA[1];  beta :=beAMPA[1];  factor:=factorAMPA;  IfBlock:=IfBlockAMPA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_Glu;  U_Depr:=U_Depr_Glu;  nu_thr_Depr:=nu_thr_Depr_Glu; end;
  with SP_[iOfSyn('AMP3 on I23')] do begin
       Vrev:=VAMPA;       alpha:=alAMPA[2];  beta :=beAMPA[2];  factor:=factorAMPA;  IfBlock:=IfBlockAMPA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_Glu;  U_Depr:=U_Depr_Glu;  nu_thr_Depr:=nu_thr_Depr_Glu; end;
  { ------- GABA ------- }
  with SP_[iOfSyn('GAB3 on P')] do begin
       Vrev:=VGABA;       alpha:=alGABA[1];  beta :=beGABA[1];  factor:=factorGABA;  IfBlock:=IfBlockGABA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_GABA;  U_Depr:=U_Depr_GABA;  nu_thr_Depr:=nu_thr_Depr_GABA; end;
  with SP_[iOfSyn('GAB3 on I')] do begin
       Vrev:=VGABA;       alpha:=alGABA[2];  beta :=beGABA[2];  factor:=factorGABA;  IfBlock:=IfBlockGABA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_GABA;  U_Depr:=U_Depr_GABA;  nu_thr_Depr:=nu_thr_Depr_GABA; end;
  with SP_[iOfSyn('GABA on P')] do begin
       Vrev:=VGABA;       alpha:=alGABA[1];  beta :=beGABA[1];  factor:=factorGABA;  IfBlock:=IfBlockGABA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_GABA;  U_Depr:=U_Depr_GABA;  nu_thr_Depr:=nu_thr_Depr_GABA; end;
  with SP_[iOfSyn('GABA on I')] do begin
       Vrev:=VGABA;       alpha:=alGABA[2];  beta :=beGABA[2];  factor:=factorGABA;  IfBlock:=IfBlockGABA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_GABA;  U_Depr:=U_Depr_GABA;  nu_thr_Depr:=nu_thr_Depr_GABA; end;
  with SP_[iOfSyn('GABA on P23 de 23')] do begin
       Vrev:=VGABA;       alpha:=alGABA[1];  beta :=beGABA[1];  factor:=factorGABA;  IfBlock:=IfBlockGABA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_GABA;  U_Depr:=U_Depr_GABA;  nu_thr_Depr:=nu_thr_Depr_GABA; end;
  with SP_[iOfSyn('GABA on I23 de 23')] do begin
       Vrev:=VGABA;       alpha:=alGABA[2];  beta :=beGABA[2];  factor:=factorGABA;  IfBlock:=IfBlockGABA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_GABA;  U_Depr:=U_Depr_GABA;  nu_thr_Depr:=nu_thr_Depr_GABA; end;
  with SP_[iOfSyn('GABA on P de 23')] do begin
       Vrev:=VGABA;       alpha:=alGABA[1];  beta :=beGABA[1];  factor:=factorGABA;  IfBlock:=IfBlockGABA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_GABA;  U_Depr:=U_Depr_GABA;  nu_thr_Depr:=nu_thr_Depr_GABA; end;
  with SP_[iOfSyn('GABA on I de 23')] do begin
       Vrev:=VGABA;       alpha:=alGABA[2];  beta :=beGABA[2];  factor:=factorGABA;  IfBlock:=IfBlockGABA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_GABA;  U_Depr:=U_Depr_GABA;  nu_thr_Depr:=nu_thr_Depr_GABA; end;
  with SP_[iOfSyn('GABA on P23')] do begin
       Vrev:=VGABA;       alpha:=alGABA[1];  beta :=beGABA[1];  factor:=factorGABA;  IfBlock:=IfBlockGABA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_GABA;  U_Depr:=U_Depr_GABA;  nu_thr_Depr:=nu_thr_Depr_GABA; end;
  with SP_[iOfSyn('GABA on I23')] do begin
       Vrev:=VGABA;       alpha:=alGABA[2];  beta :=beGABA[2];  factor:=factorGABA;  IfBlock:=IfBlockGABA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_GABA;  U_Depr:=U_Depr_GABA;  nu_thr_Depr:=nu_thr_Depr_GABA; end;
  with SP_[iOfSyn('GAB3 on P23')] do begin
       Vrev:=VGABA;       alpha:=alGABA[1];  beta :=beGABA[1];  factor:=factorGABA;  IfBlock:=IfBlockGABA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_GABA;  U_Depr:=U_Depr_GABA;  nu_thr_Depr:=nu_thr_Depr_GABA; end;
  with SP_[iOfSyn('GAB3 on I23')] do begin
       Vrev:=VGABA;       alpha:=alGABA[2];  beta :=beGABA[2];  factor:=factorGABA;  IfBlock:=IfBlockGABA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_GABA;  U_Depr:=U_Depr_GABA;  nu_thr_Depr:=nu_thr_Depr_GABA; end;
  { ------- NMDA ------- }
  with SP_[iOfSyn('NMD3 on P')] do begin
       Vrev:=NP0[1].VNMDA;  alpha:=alNMDA[1];  beta :=beNMDA[1];  factor:=factorNMDA;  IfBlock:=IfBlockNMDA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_Glu;  U_Depr:=U_Depr_Glu;  nu_thr_Depr:=nu_thr_Depr_Glu; end;
  with SP_[iOfSyn('NMD3 on I')] do begin
       Vrev:=NP0[2].VNMDA;  alpha:=alNMDA[2];  beta :=beNMDA[2];  factor:=factorNMDA;  IfBlock:=IfBlockNMDA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_Glu;  U_Depr:=U_Depr_Glu;  nu_thr_Depr:=nu_thr_Depr_Glu; end;
  with SP_[iOfSyn('NMDA on P')] do begin
       Vrev:=NP0[1].VNMDA;  alpha:=alNMDA[1];  beta :=beNMDA[1];  factor:=factorNMDA;  IfBlock:=IfBlockNMDA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_Glu;  U_Depr:=U_Depr_Glu;  nu_thr_Depr:=nu_thr_Depr_Glu; end;
  with SP_[iOfSyn('NMDA on I')] do begin
       Vrev:=NP0[2].VNMDA;  alpha:=alNMDA[2];  beta :=beNMDA[2];  factor:=factorNMDA;  IfBlock:=IfBlockNMDA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_Glu;  U_Depr:=U_Depr_Glu;  nu_thr_Depr:=nu_thr_Depr_Glu; end;
  with SP_[iOfSyn('NMDA on P23 de 23')] do begin
       Vrev:=NP0[1].VNMDA;  alpha:=alNMDA[1];  beta :=beNMDA[1];  factor:=factorNMDA;  IfBlock:=IfBlockNMDA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_Glu;  U_Depr:=U_Depr_Glu;  nu_thr_Depr:=nu_thr_Depr_Glu; end;
  with SP_[iOfSyn('NMDA on I23 de 23')] do begin
       Vrev:=NP0[2].VNMDA;  alpha:=alNMDA[2];  beta :=beNMDA[2];  factor:=factorNMDA;  IfBlock:=IfBlockNMDA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_Glu;  U_Depr:=U_Depr_Glu;  nu_thr_Depr:=nu_thr_Depr_Glu; end;
  with SP_[iOfSyn('NMDA on P de 23')] do begin
       Vrev:=NP0[1].VNMDA;  alpha:=alNMDA[1];  beta :=beNMDA[1];  factor:=factorNMDA;  IfBlock:=IfBlockNMDA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_Glu;  U_Depr:=U_Depr_Glu;  nu_thr_Depr:=nu_thr_Depr_Glu; end;
  with SP_[iOfSyn('NMDA on I de 23')] do begin
       Vrev:=NP0[2].VNMDA;  alpha:=alNMDA[2];  beta :=beNMDA[2];  factor:=factorNMDA;  IfBlock:=IfBlockNMDA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_Glu;  U_Depr:=U_Depr_Glu;  nu_thr_Depr:=nu_thr_Depr_Glu; end;
  with SP_[iOfSyn('NMDA on P23')] do begin
       Vrev:=NP0[1].VNMDA;  alpha:=alNMDA[1];  beta :=beNMDA[1];  factor:=factorNMDA;  IfBlock:=IfBlockNMDA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_Glu;  U_Depr:=U_Depr_Glu;  nu_thr_Depr:=nu_thr_Depr_Glu; end;
  with SP_[iOfSyn('NMDA on I23')] do begin
       Vrev:=NP0[2].VNMDA;  alpha:=alNMDA[2];  beta :=beNMDA[2];  factor:=factorNMDA;  IfBlock:=IfBlockNMDA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_Glu;  U_Depr:=U_Depr_Glu;  nu_thr_Depr:=nu_thr_Depr_Glu; end;
  with SP_[iOfSyn('NMD3 on P23')] do begin
       Vrev:=NP0[1].VNMDA;  alpha:=alNMDA[1];  beta :=beNMDA[1];  factor:=factorNMDA;  IfBlock:=IfBlockNMDA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_Glu;  U_Depr:=U_Depr_Glu;  nu_thr_Depr:=nu_thr_Depr_Glu; end;
  with SP_[iOfSyn('NMD3 on I23')] do begin
       Vrev:=NP0[2].VNMDA;  alpha:=alNMDA[2];  beta :=beNMDA[2];  factor:=factorNMDA;  IfBlock:=IfBlockNMDA;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_Glu;  U_Depr:=U_Depr_Glu;  nu_thr_Depr:=nu_thr_Depr_Glu; end;
  { ------- GABB ------- }
  with SP_[iOfSyn('GABB on P')] do begin
       Vrev:=VGABB;       alpha:=alGABB[1];  beta :=beGABB[1];  factor:=0;  IfBlock:=IfBlockGABB;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_GABA;  U_Depr:=U_Depr_GABA;  nu_thr_Depr:=nu_thr_Depr_GABA; end;
  with SP_[iOfSyn('GABB on I')] do begin
       Vrev:=VGABB;       alpha:=alGABB[2];  beta :=beGABB[2];  factor:=0;  IfBlock:=IfBlockGABB;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_GABA;  U_Depr:=U_Depr_GABA;  nu_thr_Depr:=nu_thr_Depr_GABA; end;
  with SP_[iOfSyn('GABB on P23')] do begin
       Vrev:=VGABB;       alpha:=alGABB[1];  beta :=beGABB[1];  factor:=0;  IfBlock:=IfBlockGABB;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_GABA;  U_Depr:=U_Depr_GABA;  nu_thr_Depr:=nu_thr_Depr_GABA; end;
  with SP_[iOfSyn('GABB on I23')] do begin
       Vrev:=VGABB;       alpha:=alGABB[2];  beta :=beGABB[2];  factor:=0;  IfBlock:=IfBlockGABB;  IfApplySigmoidToAxonRate:=IfSigmoidForPresynRate;  If_Saturates:=If_m_Saturates;  tau_Depr:=tau_Depr_GABA;  U_Depr:=U_Depr_GABA;  nu_thr_Depr:=nu_thr_Depr_GABA; end;
  { IfInSyn_al_EQ_beta }
  for i:=1 to NSyn do SP_[i].IfInSyn_al_EQ_beta:=IfInSyn_al_EQ_beta;
  { Block unused synapses }
  for i:=1 to NSyn do begin
      BlockIfSynapseIsUnused(SP_[i].Name,SP_[i].IfBlock);
  end;
  { Remember Vrev for Ions }
  for i:=1 to NSyn do SP_[i].Vrev0:=SP_[i].Vrev;
end;

procedure DeriveNMDAfromAMPA;
var z :double;
begin
  { ------- NMDA ------- }
  z:=gNMDA_gAMPA;
       SP_[iOfSyn('NMD3 on P')].  gmax      :=z*SP_[iOfSyn('AMP3 on P')].  gmax      ;
       SP_[iOfSyn('NMD3 on I')].  gmax      :=z*SP_[iOfSyn('AMP3 on I')].  gmax      ;
       SP_[iOfSyn('NMDA on P')].  gmax      :=z*SP_[iOfSyn('AMPA on P')].  gmax      ;
       SP_[iOfSyn('NMDA on I')].  gmax      :=z*SP_[iOfSyn('AMPA on I')].  gmax      ;
       SP_[iOfSyn('NMDA on P23 de 23')].gmax:=z*SP_[iOfSyn('AMPA on P23 de 23')].gmax;
       SP_[iOfSyn('NMDA on I23 de 23')].gmax:=z*SP_[iOfSyn('AMPA on I23 de 23')].gmax;
       SP_[iOfSyn('NMDA on P de 23')].gmax  :=z*SP_[iOfSyn('AMPA on P de 23')].gmax  ;
       SP_[iOfSyn('NMDA on I de 23')].gmax  :=z*SP_[iOfSyn('AMPA on I de 23')].gmax  ;
       SP_[iOfSyn('NMDA on P23')].gmax      :=z*SP_[iOfSyn('AMPA on P23')].gmax      ;
       SP_[iOfSyn('NMDA on I23')].gmax      :=z*SP_[iOfSyn('AMPA on I23')].gmax      ;
       SP_[iOfSyn('NMD3 on P23')].  gmax    :=z*SP_[iOfSyn('AMP3 on P23')].  gmax      ;
       SP_[iOfSyn('NMD3 on I23')].  gmax    :=z*SP_[iOfSyn('AMP3 on I23')].  gmax      ;
end;

procedure V1_Binzegger;
{ Binzegger's scheme of the connections }
var c,d,t,a,u,kEE,kEI,kIE,kII,kE23E4,kE4E23,gLE,gLI :double;
begin
  if NSyn=0 then SetNamesOfSynapses;
  c:=SynSensitivity_E;
  d:=SynSensitivity_I;
  t:=SynSensitivity_Thalamic;
  u:=SynEffect_Glu;
  a:=SynEffect_GABA;
  kEE:=0.6;{1}   // Thomson2002*720  - 4.5,   Holmgren - 0.4
  kEI:=6;        // Thomson2002*1120 - 6,     Holmgren - 33
  kIE:=4{3};     // Thomson2002*280  - 4-8,   Holmgren - 21
  kII:=kIE;
  kE23E4:=0;
  kE4E23:=kEI;
  gLE:=NP0[1].gL;  if NP0[1].IfSet_gL_or_tau=2 then gLE:=NP0[1].C_membr/NP0[1].tau_m0;
  gLI:=NP0[2].gL;  if NP0[2].IfSet_gL_or_tau=2 then gLI:=NP0[2].C_membr/NP0[2].tau_m0;
  case Form4.ComboBox5.ItemIndex of
  1: begin
  {********* Zilberter-Thomson **********}
       { ------- AMPA ------- }
       SP_[iOfSyn('AMP3 on P')].  gmax      :=kEI*gLE*0.6*3500/(19.6*2200)*c*t;
       SP_[iOfSyn('AMP3 on I')].  gmax      :=kEI*gLI*0.6*2200/(19.6*2200)*d*t;
       SP_[iOfSyn('AMPA on P')].  gmax      :=kEE*gLE*6.9/21.6*c;
       SP_[iOfSyn('AMPA on I')].  gmax      :=kEI*gLI*6.7/19.6*d;
       SP_[iOfSyn('AMPA on P23 de 23')].gmax:=kEE*gLE*c;
       SP_[iOfSyn('AMPA on I23 de 23')].gmax:=kEI*gLI*d;
       SP_[iOfSyn('AMPA on P de 23')].gmax  :=kE23E4*gLE*c;//kEE*gLE*740/3540*c;
       SP_[iOfSyn('AMPA on I de 23')].gmax  :=kEI*gLI*1.8/19.6*d;
       SP_[iOfSyn('AMPA on P23')].gmax      :=kE4E23*gLE*c;//kEE*gLE*1440/3540*c;
       SP_[iOfSyn('AMPA on I23')].gmax      :=kEI*gLI*4.9/19.6*d;
       { ------- GABA ------- }
       SP_[iOfSyn('GABA on P')].  gmax      :=kIE*gLE*17.8/27.8*c;
       SP_[iOfSyn('GABA on I')].  gmax      :=kII*gLI*19.4/29.2*d;
       SP_[iOfSyn('GABA on P23 de 23')].gmax:=kIE*gLE*c;
       SP_[iOfSyn('GABA on I23 de 23')].gmax:=kII*gLI*d;
       SP_[iOfSyn('GABA on P de 23')].gmax  :=kIE*gLE*3.0/27.8*c;
       SP_[iOfSyn('GABA on I de 23')].gmax  :=kII*gLI*2.2/29.2*d;
       SP_[iOfSyn('GABA on P23')].gmax      :=kIE*gLE*1.6/27.8*c;
       SP_[iOfSyn('GABA on I23')].gmax      :=kII*gLI*1.7/29.2*d;
     end;
  2: begin
  {********* Thomson, cat **********}
       SP_[iOfSyn('AMP3 on P')].  gmax      :=1.9 *gLE*c*t*u;
       SP_[iOfSyn('AMP3 on I')].  gmax      :=1.1 *gLI*d*t*u;
       SP_[iOfSyn('AMPA on P')].  gmax      :=2.6 *gLE*c*u;
       SP_[iOfSyn('AMPA on I')].  gmax      :=22  *gLI*d*u;
       SP_[iOfSyn('AMPA on P23 de 23')].gmax:=1.2 *gLE*c*u;
       SP_[iOfSyn('AMPA on I23 de 23')].gmax:=11  *gLI*d*u;
       SP_[iOfSyn('AMPA on P de 23')].gmax  :=4.4 *gLE*c*u;
       SP_[iOfSyn('AMPA on I de 23')].gmax  :=2.8 *gLI*d*u;
       SP_[iOfSyn('AMPA on P23')].gmax      :=5.6 *gLE*c*u;
       SP_[iOfSyn('AMPA on I23')].gmax      :=3.5 *gLI*d*u;
       { ------- GABA ------- }
       SP_[iOfSyn('GABA on P')].  gmax      :=2.9 *gLE*c*a;
       SP_[iOfSyn('GABA on I')].  gmax      :=43  *gLI*d*a;
       SP_[iOfSyn('GABA on P23 de 23')].gmax:=3.2 *gLE*c*a;
       SP_[iOfSyn('GABA on I23 de 23')].gmax:=8.2 *gLI*d*a;
       SP_[iOfSyn('GABA on P de 23')].gmax  :=0;
       SP_[iOfSyn('GABA on I de 23')].gmax  :=0;
       SP_[iOfSyn('GABA on P23')].gmax      :=12 *gLE*c*a;
       SP_[iOfSyn('GABA on I23')].gmax      :=0;
     end;
  3: begin
  {********* Thomson, cat averaged PSPs **********}
       SP_[iOfSyn('AMP3 on P')].  gmax      :=1.9 *gLE*c*t*u;
       SP_[iOfSyn('AMP3 on I')].  gmax      :=1.1 *gLI*d*t*u;
       SP_[iOfSyn('AMPA on P')].  gmax      :=2.4 *gLE*c*u;
       SP_[iOfSyn('AMPA on I')].  gmax      :=12  *gLI*d*u;
       SP_[iOfSyn('AMPA on P23 de 23')].gmax:=2.2 *gLE*c*u;
       SP_[iOfSyn('AMPA on I23 de 23')].gmax:=7.4 *gLI*d*u;
       SP_[iOfSyn('AMPA on P de 23')].gmax  :=4.0 *gLE*c*u;
       SP_[iOfSyn('AMPA on I de 23')].gmax  :=5.6 *gLI*d*u;
       SP_[iOfSyn('AMPA on P23')].gmax      :=5.2 *gLE*c*u;
       SP_[iOfSyn('AMPA on I23')].gmax      :=5.8 *gLI*d*u;
       { ------- GABA ------- }
       SP_[iOfSyn('GABA on P')].  gmax      :=2.3 *gLE*c*a;
       SP_[iOfSyn('GABA on I')].  gmax      :=19  *gLI*d*a;
       SP_[iOfSyn('GABA on P23 de 23')].gmax:=3.9 *gLE*c*a;
       SP_[iOfSyn('GABA on I23 de 23')].gmax:=12  *gLI*d*a;
       SP_[iOfSyn('GABA on P de 23')].gmax  :=0;
       SP_[iOfSyn('GABA on I de 23')].gmax  :=0;
       SP_[iOfSyn('GABA on P23')].gmax      :=6.3 *gLE*c*a;
       SP_[iOfSyn('GABA on I23')].gmax      :=0;
     end;
  4,5: begin
  {********* Thomson, cat, 2/3 and 4 layers **********}
       SP_[iOfSyn('AMP3 on P')].  gmax      :=1.2 *gLE*c*t*u;
       SP_[iOfSyn('AMP3 on I')].  gmax      :=0.6 *gLI*d*t*u;
       SP_[iOfSyn('AMPA on P')].  gmax      :=2.8 *gLE*c*u;
       SP_[iOfSyn('AMPA on I')].  gmax      :=9.8 *gLI*d*u;
       SP_[iOfSyn('AMPA on P23 de 23')].gmax:=2.0 *gLE*c*u;
       SP_[iOfSyn('AMPA on I23 de 23')].gmax:=7.1 *gLI*d*u;
       SP_[iOfSyn('AMPA on P de 23')].gmax  :=0;
       SP_[iOfSyn('AMPA on I de 23')].gmax  :=2.7 *gLI*d*u;
       SP_[iOfSyn('AMPA on P23')].gmax      :=2.7 *gLE*c*u;
       SP_[iOfSyn('AMPA on I23')].gmax      :=1.7 *gLI*d*u;
       { ------- GABA ------- }
       SP_[iOfSyn('GABA on P')].  gmax      :=8.3 *gLE*c*a;
       SP_[iOfSyn('GABA on I')].  gmax      :=12  *gLI*d*a;
       SP_[iOfSyn('GABA on P23 de 23')].gmax:=9   *gLE*c*a;
       SP_[iOfSyn('GABA on I23 de 23')].gmax:=10  *gLI*d*a;
       SP_[iOfSyn('GABA on P de 23')].gmax  :=0;
       SP_[iOfSyn('GABA on I de 23')].gmax  :=0;
       SP_[iOfSyn('GABA on P23')].gmax      :=1.4 *gLE*c*a;
       SP_[iOfSyn('GABA on I23')].gmax      :=0;
     end;
  end;
  { Change gmax according to HH_order }
  if (NP0[1].HH_order='2-points')or
     (NP0[1].HH_order='2-p-ActiveDend')
                                 then Change_gmax_AccordingToNewHHorder(1,'1to2');
  if  NP0[2].HH_order='2-points' then Change_gmax_AccordingToNewHHorder(2,'1to2');
  { If layer "23" is a copy of layer 4 }
  case Form4.ComboBox5.ItemIndex of
  5: begin
  {********* Thomson, cat, doubled l4 **********}
       SP_[iOfSyn('AMP3 on P23')].gmax      :=SP_[iOfSyn('AMP3 on P')].  gmax;
       SP_[iOfSyn('AMP3 on I23')].gmax      :=SP_[iOfSyn('AMP3 on I')].  gmax;
       SP_[iOfSyn('AMPA on P23 de 23')].gmax:=0;
       SP_[iOfSyn('AMPA on I23 de 23')].gmax:=0;
       SP_[iOfSyn('AMPA on P de 23')].gmax  :=0;
       SP_[iOfSyn('AMPA on I de 23')].gmax  :=0;
       SP_[iOfSyn('AMPA on P23')].gmax      :=SP_[iOfSyn('AMPA on P')].  gmax;
       SP_[iOfSyn('AMPA on I23')].gmax      :=SP_[iOfSyn('AMPA on I')].  gmax;
       { ------- GABA ------- }
       SP_[iOfSyn('GABA on P23 de 23')].gmax:=0;
       SP_[iOfSyn('GABA on I23 de 23')].gmax:=0;
       SP_[iOfSyn('GABA on P de 23')].gmax  :=0;
       SP_[iOfSyn('GABA on I de 23')].gmax  :=0;
       SP_[iOfSyn('GABA on P23')].gmax      :=SP_[iOfSyn('GABA on P')].  gmax;
       SP_[iOfSyn('GABA on I23')].gmax      :=SP_[iOfSyn('GABA on I')].  gmax;
       { ------- NMDA ------- }
       SP_[iOfSyn('NMDA on P23 de 23')].gmax:=0;
       SP_[iOfSyn('NMDA on I23 de 23')].gmax:=0;
       SP_[iOfSyn('NMDA on P de 23')].gmax  :=0;
       SP_[iOfSyn('NMDA on I de 23')].gmax  :=0;
       SP_[iOfSyn('NMDA on P23')].gmax      :=SP_[iOfSyn('NMDA on P')].  gmax;
       SP_[iOfSyn('NMDA on I23')].gmax      :=SP_[iOfSyn('NMDA on I')].  gmax;
       SP_[iOfSyn('NMD3 on P23')].  gmax    :=SP_[iOfSyn('NMD3 on P')].  gmax;
       SP_[iOfSyn('NMD3 on I23')].  gmax    :=SP_[iOfSyn('NMD3 on I')].  gmax;
     end;
  6: begin
  {********* Contrast invariance scheme **********}
       SP_[iOfSyn('AMP3 on P')].  gmax      :=0.2;
       SP_[iOfSyn('AMP3 on I')].  gmax      :=0.2;
       SP_[iOfSyn('AMPA on P')].  gmax      :=0.4;
       SP_[iOfSyn('AMPA on I')].  gmax      :=3;
       SP_[iOfSyn('AMPA on P23 de 23')].gmax:=0.4;
       SP_[iOfSyn('AMPA on I23 de 23')].gmax:=3;
       SP_[iOfSyn('AMPA on P de 23')].gmax  :=0;
       SP_[iOfSyn('AMPA on I de 23')].gmax  :=0;
       SP_[iOfSyn('AMPA on P23')].gmax      :=0.2;
       SP_[iOfSyn('AMPA on I23')].gmax      :=0.2;
       { ------- GABA ------- }
       SP_[iOfSyn('GABA on P')].  gmax      :=1;
       SP_[iOfSyn('GABA on I')].  gmax      :=2;
       SP_[iOfSyn('GABA on P23 de 23')].gmax:=1;
       SP_[iOfSyn('GABA on I23 de 23')].gmax:=2;
       SP_[iOfSyn('GABA on P de 23')].gmax  :=0;
       SP_[iOfSyn('GABA on I de 23')].gmax  :=0;
       SP_[iOfSyn('GABA on P23')].gmax      :=0;
       SP_[iOfSyn('GABA on I23')].gmax      :=0;
     end;
  7: begin
  {*********      Thomson, cat, 2/3 and 4, stable **********}
       SP_[iOfSyn('AMP3 on P')].  gmax      :=0.6;
       SP_[iOfSyn('AMP3 on I')].  gmax      :=0.6;
       SP_[iOfSyn('AMPA on P')].  gmax      :=0.14;
       SP_[iOfSyn('AMPA on I')].  gmax      :=2.8;
       SP_[iOfSyn('AMPA on P23 de 23')].gmax:=0.14;
       SP_[iOfSyn('AMPA on I23 de 23')].gmax:=2;
       SP_[iOfSyn('AMPA on P de 23')].gmax  :=0;
       SP_[iOfSyn('AMPA on I de 23')].gmax  :=0.8;
       SP_[iOfSyn('AMPA on P23')].gmax      :=0.8;
       SP_[iOfSyn('AMPA on I23')].gmax      :=0.8;
       { ------- GABA ------- }
       SP_[iOfSyn('GABA on P')].  gmax      :=0.6;
       SP_[iOfSyn('GABA on I')].  gmax      :=1.8;
       SP_[iOfSyn('GABA on P23 de 23')].gmax:=0.7;
       SP_[iOfSyn('GABA on I23 de 23')].gmax:=1.4;
       SP_[iOfSyn('GABA on P de 23')].gmax  :=0;
       SP_[iOfSyn('GABA on I de 23')].gmax  :=0;
       SP_[iOfSyn('GABA on P23')].gmax      :=0.1;
       SP_[iOfSyn('GABA on I23')].gmax      :=0;
     end;
  end;
  {********* Common for all schemes *********}
  SP_[iOfSyn('AMP3 on P23')].gmax:=0;
  SP_[iOfSyn('AMP3 on I23')].gmax:=0;
  SP_[iOfSyn('GAB3 on P')].  gmax:=0;
  SP_[iOfSyn('GAB3 on I')].  gmax:=0;
  SP_[iOfSyn('GAB3 on P23')].gmax:=0;
  SP_[iOfSyn('GAB3 on I23')].gmax:=0;
  { ------- NMDA ------- }
  DeriveNMDAfromAMPA;
  { ------- GABB ------- }
  SP_[iOfSyn('GABB on P')].  gmax:=gGABB[1];
  SP_[iOfSyn('GABB on I')].  gmax:=gGABB[2];
  SP_[iOfSyn('GABB on P23')].gmax:=gGABB[1];
  SP_[iOfSyn('GABB on I23')].gmax:=gGABB[2];
  IfConnectionsSet:=1;
end;

procedure Set_gmax;
begin
  if NSyn=0 then SetNamesOfSynapses;
//  NSyn:=12;
  { ------- AMPA ------- }
       SP_[iOfSyn('AMP3 on P')].  gmax:=gAMP3[1];
       SP_[iOfSyn('AMP3 on I')].  gmax:=gAMP3[2];
       SP_[iOfSyn('AMPA on P')].  gmax:=gAMPA[1];
       SP_[iOfSyn('AMPA on I')].  gmax:=gAMPA[2];
       SP_[iOfSyn('AMPA on P23 de 23')].gmax:=0;
       SP_[iOfSyn('AMPA on I23 de 23')].gmax:=0;
       SP_[iOfSyn('AMPA on P de 23')].gmax:=0;
       SP_[iOfSyn('AMPA on I de 23')].gmax:=0;
       SP_[iOfSyn('AMPA on P23')].gmax:=0;
       SP_[iOfSyn('AMPA on I23')].gmax:=0;
       SP_[iOfSyn('AMP3 on P23')].gmax:=0;
       SP_[iOfSyn('AMP3 on I23')].gmax:=0;
  { ------- GABA ------- }
       SP_[iOfSyn('GAB3 on P')].  gmax:=gGAB3[1];
       SP_[iOfSyn('GAB3 on I')].  gmax:=gGAB3[2];
       SP_[iOfSyn('GABA on P')].  gmax:=gGABA[1];
       SP_[iOfSyn('GABA on I')].  gmax:=gGABA[2];
       SP_[iOfSyn('GABA on P23 de 23')].gmax:=0;
       SP_[iOfSyn('GABA on I23 de 23')].gmax:=0;
       SP_[iOfSyn('GABA on P de 23')].gmax:=0;
       SP_[iOfSyn('GABA on I de 23')].gmax:=0;
       SP_[iOfSyn('GABA on P23')].gmax:=0;
       SP_[iOfSyn('GABA on I23')].gmax:=0;
       SP_[iOfSyn('GAB3 on P23')].gmax:=0;
       SP_[iOfSyn('GAB3 on I23')].gmax:=0;
  { ------- NMDA ------- }
       SP_[iOfSyn('NMD3 on P')].  gmax:=gNMD3[1];
       SP_[iOfSyn('NMD3 on I')].  gmax:=gNMD3[2];
       SP_[iOfSyn('NMDA on P')].  gmax:=gNMDA[1];
       SP_[iOfSyn('NMDA on I')].  gmax:=gNMDA[2];
       SP_[iOfSyn('NMDA on P23 de 23')].gmax:=0;
       SP_[iOfSyn('NMDA on I23 de 23')].gmax:=0;
       SP_[iOfSyn('NMDA on P de 23')].  gmax:=0;
       SP_[iOfSyn('NMDA on I de 23')].  gmax:=0;
       SP_[iOfSyn('NMDA on P23')].gmax:=0;
       SP_[iOfSyn('NMDA on I23')].gmax:=0;
       {*****************}
       DeriveNMDAfromAMPA;
  { ------- GABB ------- }
       SP_[iOfSyn('GABB on P')].  gmax:=gGABB[1];
       SP_[iOfSyn('GABB on I')].  gmax:=gGABB[2];
       SP_[iOfSyn('GABB on P23')].gmax:=gGABB[1];
       SP_[iOfSyn('GABB on I23')].gmax:=gGABB[2];
  IfConnectionsSet:=1;
end;
{==========================================================================}

procedure Change_gmax_AccordingToNewHHorder(ie :integer; FromTo :string);
var i       :integer;
    s       :string;
    ro_,x   :double;
begin
  ro_:=NP0[ie].ro;
  for i:=1 to NSyn do  with SP_[i] do begin
         s:=Name[9];
         if ((s='P')and(ie=1)) or ((s='I')and(ie=2)) then begin
            if          (Name[1]+Name[2]+Name[3]='GAB') then begin
               { GABA synapses }
               x:=(3+ro_)/(3+2*ro_);
               if FromTo='2to1' then  gmax:=gmax*x
                                else  gmax:=gmax/x;
            end else begin
               { AMPA and NMDA synapses }
               x:=3/(3+2*ro_);
               if FromTo='2to1' then  gmax:=gmax*x
                                else  gmax:=gmax/x;
            end;
         end;
  end;
end;

procedure SetDDSpinEdits;
var i :integer;
begin
  WITH Form4 DO BEGIN
    {** Setting **}
    gsynC1.NSyn:=NSyn;
    for i:=1 to NSyn do  SP_2[i]:=SP_[i];
    gsynC1.DDSpinEdit1.Value:=NSyn;
    for i:=1 to NSyn do begin
        gsynC1.DDSpinEditA[i].Visible:=true;
        gsynC1.DDSpinEditA[i].Value:=SP_2[i].gmax;
    end;
    for i:=NSyn+1 to MaxNSyn do begin
        gsynC1.DDSpinEditA[i].Visible:=false;
    end;
  END;
end;

procedure ReplaceDDSpinEdits;
var i,ls, m,l,c:integer;
    s :string;
begin
  WITH Form4 DO BEGIN
    {** Replacing **}
    gsynC1.GroupBox1.Height := 284+88;
    for i:=1 to NSyn do with SP_[i] do begin
        { Re-addressing }
        s:=SP_[i].Name;  ls:=length(s);
        { m - mediator (AMPA, GABA or NMDA)}
        if s[1]+s[2]+s[3]     ='AMP'  then m:=1 else
        if s[1]+s[2]+s[3]+s[4]='GAB3' then m:=2 else
        if s[1]+s[2]+s[3]+s[4]='GABA' then m:=2 else
        if s[1]+s[2]+s[3]+s[4]='GABB' then m:=4 else
        if s[1]+s[2]+s[3]     ='NMD'  then m:=3;
        { l - layer (ext., 4 or 2/3)}
        if s[4]='3' then l:=1 else
        if ls<=11   then l:=2 else
        if s[ls-1]+s[ls]='23' then l:=3;
        { c - cell (P, I, P23 or I23}
        if ((ls<=9)and(s[ls]='P'))or((ls>9)and(s[9]+s[10]='P ')) then c:=1 else
        if ((ls<=9)and(s[ls]='I'))or((ls>9)and(s[9]+s[10]='I ')) then c:=2 else
        if (s[9]+s[10]+s[11]='P23') then c:=3 else
        if (s[9]+s[10]+s[11]='I23') then c:=4;
        { Replacing }
        if IfSmallScreen then begin  // IfSmallScreen
            gsynC1.DDSpinEditA[i].Left:=28+(c-1)*45;
            gsynC1.DDSpinEditA[i].Top :=30+78*(m-1)+20*(l-1);
        end else begin
            gsynC1.DDSpinEditA[i].Left:=28+(c-1)*55;
            gsynC1.DDSpinEditA[i].Top :=38+88*(m-1)+22*(l-1);
        end;
        Application.ProcessMessages;
    end;
  END;
end;

{==========================================================================}
procedure PrepareParamsForColumnCreation;
begin
  { Synapses }
  SetNamesOfSynapses;
  SetParamsOfSynapses;
//  if IfConnectionsSet=0 then
     if If_Binzegger_V1=1 then V1_Binzegger
                          else Set_gmax;
  if IfAColumnCreated then begin
     AColumn.Free;    IfAColumnCreated:=false;
  end;
end;

procedure RenewSynapticPropertiesForAColumn;
var i :integer;
begin
  if IfAColumnCreated then begin
     for i:=1 to NSyn do begin
         AColumn.Syn[i].SP:=SP_[i];
     end;
     AColumn.SetAxonRates;    // 27.02.2016
  end;
end;

end.
