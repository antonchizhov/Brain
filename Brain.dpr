program BRAIN;

{%File '..\HODGKIN\_ObjectsOfNeuron\set_VTh(dVdt)_Chow.dat'}
{%File '..\HODGKIN\_ObjectsOfNeuron\set_VTh(dVdt)_Lyle.dat'}
{%File 'erfic.d'}

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1 - Main},
  Unit2 in 'Unit2.pas' {Form2 - for Phase},
  Unit3 in 'Unit3.pas' {Form3 - for 2D-slice},
  Unit4 in 'Unit4.pas' {Form4 - Parameters},
  Unit5 in 'Unit5.pas' {Form5 - Conductances},
  Unit6 in 'Unit6.pas' {Form6 - Representatives},
  Unit7 in 'Unit7.pas' {Form7 - Sigmoid},
  Unit8 in 'Unit8.pas' {Form8 - V1},
  Unit9 in 'Unit9.pas' {Form9 - Debug},
  Unit10 in 'Unit10.pas' {Form10 - "Slice"},
  Unit11 in 'Unit11.pas' {Form11 - Nullclines},
  Unit12 in 'Unit12.pas' {Form12 - PopulationO},
  Unit13 in 'Unit13.pas' {Form13 - Statistics},
  Unit14 in 'Unit14.pas' {Form14 - Scheme of connections},
  Unit15 in 'Unit15.pas' {Form15 - 2D-lattice},
  Unit16 in 'Unit16.pas' {Form16 - KFP-ring},
  Unit17 in 'Unit17.pas' {Form17 - Warnings},
  Unit18 in 'Unit18.pas' {Form18 - Inspector},
  Unit19 in 'Unit19.pas' {Form19 - Experimental figure},
  Unit20 in 'Unit20.pas' {Form20 - Rose},
  Unit21 in 'Unit21.pas' {Form21 - Stereo input},
  Unit22 in 'Unit22.pas' {Form22 - f-I-curve},
  Unit23 in 'Unit23.pas' {Form23 - Fit synaptic kinetics},
  Unit24 in 'Unit24.pas' {Form24 - Blank},
  Unit25 in 'Unit25.pas' {Form25 - LFP},
  Unit26 in 'Unit26.pas' {Form26 - K and Cl dynamics},
  Unit27 in 'Unit27.pas' {Form27 - Lognorm},
  Unit29 in 'Unit29.pas' {Form29 - BOLD},
  Unit30 in 'Unit30.pas' {Form30 - Distances of connections},
  Unit31 in 'Unit31.pas' {Form31 - Experimental conductances},
  Unit32 in 'Unit32.pas' {Form32 - CV dependence on I_ind},
  Frame_2DO in 'Frame_2DO.pas' {Frame15 - TFrame},
  AnalysisO in 'AnalysisO.pas',
  BackgroundO in 'BackgroundO.pas',
  BoldO in 'BoldO.pas',
  BP2Delphi in 'BP2Delphi.pas',
  coeff in 'coeff.pas',
  ColumnO in 'ColumnO.pas',
  ConnectionsO in 'ConnectionsO.pas',
  Correspond in 'Correspond.pas',
  EEGO in 'EEGO.pas',
  exp_nu_Pyr in 'exp_nu_Pyr.pas',
  Erf_Hazard in 'Erf_Hazard.pas',
  graph_0d in 'graph_0d.pas',
  graph_2DO in 'graph_2DO.pas',
  init in 'init.pas',
  IonsO in 'IonsO.pas',
  KFP_ringO in 'KFP_ringO.pas',
  LFPO in 'LFPO.pas',
  MappingsO in 'MappingsO.pas',
  MorfologyO in 'MorfologyO.pas',
  other in 'other.pas',
  PopulationO in 'PopulationO.pas',
  ReadWriteSettings in 'ReadWriteSettings.pas',
  RepresentativesO in 'RepresentativesO.pas',
  run in 'run.pas',
  Slice in 'Slice.pas',
  simplex in 'simplex.pas',
  slice_2DO in 'slice_2DO.pas',
  Statistics in 'Statistics.pas',
  Stimulation in 'Stimulation.pas',
  Stimulation_2D in 'Stimulation_2D.pas',
  SynCurrO in 'SynCurrO.pas',
  V1O in 'V1O.pas',
  V1_liasonO in 'V1_liasonO.pas',
  wave in 'wave.pas',
  AHPO in '_ObjectsOfNeuron\AHPO.pas',
  ADPO in '_ObjectsOfNeuron\ADPO.pas',
  Bazh_NaO in '_ObjectsOfNeuron\Bazh_NaO.pas',
  Bazh_NaRO in '_ObjectsOfNeuron\Bazh_NaRO.pas',
  Bazh_KO in '_ObjectsOfNeuron\Bazh_KO.pas',
  BstO in '_ObjectsOfNeuron\BstO.pas',
  Calmar_KO in '_ObjectsOfNeuron\Calmar_KO.pas',
  Calmar_NaO in '_ObjectsOfNeuron\Calmar_NaO.pas',
  Calmar_NaRO in '_ObjectsOfNeuron\Calmar_NaRO.pas',
  ChannelO in '_ObjectsOfNeuron\ChannelO.pas',
  Chow_KO in '_ObjectsOfNeuron\Chow_KO.pas',
  Chow_NaO in '_ObjectsOfNeuron\Chow_NaO.pas',
  Chow_NaRO in '_ObjectsOfNeuron\Chow_NaRO.pas',
  CondBasedO in '_ObjectsOfNeuron\CondBasedO.pas',
  CreateNrnO in '_ObjectsOfNeuron\CreateNrnO.pas',
  Cum_CaHO in '_ObjectsOfNeuron\Cum_CaHO.pas',
  Cum_CaTO in '_ObjectsOfNeuron\Cum_CaTO.pas',
  Cum_KAO in '_ObjectsOfNeuron\Cum_KAO.pas',
  Cum_KDO in '_ObjectsOfNeuron\Cum_KDO.pas',
  Cum_KO in '_ObjectsOfNeuron\Cum_KO.pas',
  Cum_NaO in '_ObjectsOfNeuron\Cum_NaO.pas',
  Cum_NaRO in '_ObjectsOfNeuron\Cum_NaRO.pas',
  Dest_CaTO in '_ObjectsOfNeuron\Dest_CaTO.pas',
  Dest_KCaO in '_ObjectsOfNeuron\Dest_KCaO.pas',
  Dest_KMO in '_ObjectsOfNeuron\Dest_KMO.pas',
  Dest_KO in '_ObjectsOfNeuron\Dest_KO.pas',
  Dest_CaHO in '_ObjectsOfNeuron\Dest_CaHO.pas',
  DynThrO in '_ObjectsOfNeuron\DynThrO.pas',
  Fleid_NaO in '_ObjectsOfNeuron\Fleid_NaO.pas',
  KepecsWang_KCaO in '_ObjectsOfNeuron\KepecsWang_KCaO.pas',
  LIFNrnO in '_ObjectsOfNeuron\LIFNrnO.pas',
  Lyle_KAO in '_ObjectsOfNeuron\Lyle_KAO.pas',
  Lyle_KDO in '_ObjectsOfNeuron\Lyle_KDO.pas',
  Lyle_KMO in '_ObjectsOfNeuron\Lyle_KMO.pas',
  Lyle_KO in '_ObjectsOfNeuron\Lyle_KO.pas',
  Lyle_HO in '_ObjectsOfNeuron\Lyle_HO.pas',
  Lyle_NaO in '_ObjectsOfNeuron\Lyle_NaO.pas',
  Lyle_NaPO in '_ObjectsOfNeuron\Lyle_NaPO.pas',
  Lyle_NaRO in '_ObjectsOfNeuron\Lyle_NaRO.pas',
  LyleMS_NaO in '_ObjectsOfNeuron\LyleMS_NaO.pas',
  LyleMS_NaRO in '_ObjectsOfNeuron\LyleMS_NaRO.pas',
  MathMyO in '_ObjectsOfNeuron\MathMyO.pas',
  Migli_KAO in '_ObjectsOfNeuron\Migli_KAO.pas',
  Migli_KO in '_ObjectsOfNeuron\Migli_KO.pas',
  Migli_NaO in '_ObjectsOfNeuron\Migli_NaO.pas',
  Migli_NaRO in '_ObjectsOfNeuron\Migli_NaRO.pas',
  Milescu_NaO in '_ObjectsOfNeuron\Milescu_NaO.pas',
  Milescu_NaRO in '_ObjectsOfNeuron\Milescu_NaRO.pas',
  NeuronO in '_ObjectsOfNeuron\NeuronO.pas',
  NullChannelO in '_ObjectsOfNeuron\NullChannelO.pas',
  Naundorf_NaO in '_ObjectsOfNeuron\Naundorf_NaO.pas',
  Naundorf_NaO1 in '_ObjectsOfNeuron\Naundorf_NaO1.pas',
  Naundorf_KO in '_ObjectsOfNeuron\Naundorf_KO.pas',
  SetNrnParsO in '_ObjectsOfNeuron\SetNrnParsO.pas',
  Shu_NaO in '_ObjectsOfNeuron\Shu_NaO.pas',
  Shu_NaRO in '_ObjectsOfNeuron\Shu_NaRO.pas',
  Shu_KO in '_ObjectsOfNeuron\Shu_KO.pas',
  ThreshNrnO in '_ObjectsOfNeuron\ThreshNrnO.pas',
  ThresholdO in '_ObjectsOfNeuron\ThresholdO.pas',
  typeNrnParsO in '_ObjectsOfNeuron\typeNrnParsO.pas',
  t_dtO in '_ObjectsOfNeuron\t_dtO.pas',
  Vervaeke_NaPO in '_ObjectsOfNeuron\Vervaeke_NaPO.pas',
  White_NaO in '_ObjectsOfNeuron\White_NaO.pas',
  White2_NaO in '_ObjectsOfNeuron\White2_NaO.pas',
  White_KO in '_ObjectsOfNeuron\White_KO.pas',
  White_CaO in '_ObjectsOfNeuron\White_CaO.pas',
  White_AHPO in '_ObjectsOfNeuron\White_AHPO.pas',
  HHUnit18 in '_ObjectsOfNeuron\HHUnit18.pas' {HHForm18},
  gsynC in '_MyComponents\gsynC.pas',
  SynapseC in '_MyComponents\SynapseC.pas',
  typeSynParsO in '_MyComponents\typeSynParsO.pas',
  LGN_Init in '_LGN\LGN_Init.pas',
  LGN_Lattice in '_LGN\LGN_Lattice.pas',
  LGN_main in '_LGN\LGN_main.pas',
  LGN_SaveLoadParameters in '_LGN\LGN_SaveLoadParameters.pas',
  LGN_Unit1 in '_LGN\LGN_Unit1.pas' {LGN_Form1},
  LGN_Unit15 in '_LGN\LGN_Unit15.pas' {LGN_Form15 - Lattice},
  LGN_Unit30 in '_LGN\LGN_Unit30.pas' {LGN_Form30 - Complex Stimulus},
  LGN_Unit33 in '_LGN\LGN_Unit33.pas' {LGN_Form33 - Saccades};

{$R *.RES}

begin
  Application.Initialize;
  Status:='SettingDefaultParameters';
  Application.HelpFile := 'E:\Anton\Brain\Help\MYHELPBRAIN.HLP';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm13, Form13);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm12, Form12);
  Application.CreateForm(TForm14, Form14);
  Application.CreateForm(TForm15, Form15);
  Application.CreateForm(TForm16, Form16);
  Application.CreateForm(TForm17, Form17);
  Application.CreateForm(TForm18, Form18);
  Application.CreateForm(TForm19, Form19);
  Application.CreateForm(TForm20, Form20);
  Application.CreateForm(TFrame15, Frame15);
  Application.CreateForm(TForm21, Form21);
  Application.CreateForm(TForm22, Form22);
  Application.CreateForm(TForm23, Form23);
  Application.CreateForm(TForm20, Form20);
  Application.CreateForm(TForm24, Form24);
  Application.CreateForm(THHForm18, HHForm18);
  Application.CreateForm(TForm25, Form25);
  Application.CreateForm(TForm26, Form26);
  Application.CreateForm(TForm27, Form27);
  Application.CreateForm(TLGN_Form15, LGN_Form15);
  Application.CreateForm(TLGN_Form1, LGN_Form1);
  Application.CreateForm(TForm29, Form29);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TLGN_Form30, LGN_Form30);
  Application.CreateForm(TForm30, Form30);
  Application.CreateForm(TForm31, Form31);
  Application.CreateForm(TForm32, Form32);
  Application.CreateForm(TLGN_Form33, LGN_Form33);
  Application.Run;
end.
