unit Slice;

interface
uses Init,MathMyO,t_dtO,ColumnO,PopulationO,ConnectionsO,
     RepresentativesO,SetNrnParsO,LFPO,BoldO;

//procedure CommonParameters;
procedure DefaultParameters;
procedure InitiateCalculation_1D;
procedure PhysParameters;
procedure OtherParameters;
{procedure ParametersFromFile;
procedure ParametersFromFile2;
procedure ParametersFromFile3;
procedure ParametersFromFile4;
procedure ParametersFromFile5;
procedure ParametersFromFile6;
procedure ParametersFromFile7;
procedure ParametersFromFile8;
procedure ParametersFromFile9;
procedure ParametersFromFile10;
procedure ParametersFromFile11;
procedure ParametersFromFile12;
procedure ParametersFromFile13;
procedure ParametersFromFile14;
procedure ParametersFromFile15;
procedure ParametersFromFile16;
procedure ParametersFromFile17;
procedure ParametersFromFile18;
procedure ParametersFromFile19;}
procedure CalcParameters;
procedure ParametersFromFiles;
procedure MeasureInNode;
function Calc_Functional(dimF :integer; var VFunc :vect) :double;

implementation
uses  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls,
  other,graph_0d,Stimulation,run,
  Unit1,Unit2,Unit3,Unit4,Unit5,Unit6,Unit8,Unit10,Unit11,Unit12,Unit13,Unit15,
  Unit18,Unit25,Unit31,Unit32,
  Correspond,Statistics,BackgroundO;

{***********Theta***************************************}
{I Theta_Miles.id }
{***********Noise***************************************}
{I Noise1.id }
{I Noise2.id }
{I Noise3.id }
{***********CA3*****************************************}
{I CA3_E_AMPA.id }          {1'}
{I CA3_E_GABA.id }          {2'}
{I CA3_oscill.id }
{$I 40Hz_CA3_1.id }       {17.03.2005}
{I 20Hz_CA3_Lyle.id }    {19.10.2005}
{*******************************************************}
{I E_EPSC&P.id } {- incompartible PSC and PSP }
{I 40Hz.id }
{I resonance_Pike.id }
{I Lacaille.id }
{I burst.id }
{I 2D_PSP.id }
{I Wang.id }
{I Miles_Marder.id }
{I GaussCond.id }
{I MilesNoise.id }
{I Pouille.id }
{$I Pouille_PSC_PSP.id }
{I PSP_1A_Karnup.id }          {14}
{I Mlinar.id }          {13}
{I I_v(t)_Ali.id }      {12}
{I I_Japon_Net.id }        {1.12.2005}
{I I_v(t)_Japon.id }       {2.09.2005, 06.02.2006}
{I E_v(t)_Lyle.id }      {14.03.2005, 27.04.2005, 22.08.2005, 01.02.2006, 24.12.2006, 27.02.2007, 10.09.2007, 09.01.2008, 19.03.2008}
{I E_v(t)_Tolya.id }     {30.05.2008 24.09.2008}
{$I E_v(t)_LIF.id }      { 1.03.2010, 15.03.2010 }
{$I GJ_Sotn.id }      { 27.05.2011 }
{I E_v(t)_Lyle_2D.id }  {18.01.2007, 6.03.2007}
{I V1.id }           {11.03.2007, 31.03.2007, 31.05.2007, 30.06.2007, 17.09.2008}
{I V1_ring.id }  {5.02.2009}
{I V1_ring_test.id }  {26.07.2009, 08.10.2009, 21.10.2009}
{I V1_ring_test2.id }  {10.11.2009}
{I V1_ring_test3.id }  {}
{I V1_ring_test4.id }  {}
{$I V1_ring_test5_PSP.id }  {19.07.2011}
{$I V1_ring_test5.id }  {2-d adaptive, FixThr 2-comp. Lyle and Chow  18.08.2011}
{$I V1_ring_test55.id }  {passive 2-comp.}
{$I V1_ring_test6.id }  {passive 1-comp., 22.12.2009, 14.03.2010 28.12.2010, 11.01.2011, 09.07.2011}
{I GammaRythm.id }  {2-d adaptive, FixThr 2-comp. Lyle and Chow  05.05.2010}
{I V1_NMDA.id }  {02.09.2009, 08.10.2009, 24.12.2009}
{I V1_2d_patches.id }  {02.09.2009, 08.10.2009, 23.02.2010, 16.07.2010 }
{$I V1_2d_patches_9.id }  {Fit to Tucker, 11.10.2010, 9.11.2010}
{I V1_2d_23and4.id }  {07_12_2010}
{I V1_2d_23and4_Zilb.id } {03.02.2011, 24.02.2011, 01.04.2011, 22.05.2011, 14.07.2011}
{I V1_2d_23and4_1102.id } {16.08.2011}
{$I V1_2d_23and4_1207.id } {3.07.2012}
{I V1_Hierarchy_2layers.id }  {}
{I V1_2d_patches_5.id }  {}
{I V1_bipolar.id }  {14/10/2009}
{I V1_aaa.id }  {}
{I EXAMPLE.ID }     {8.07.2007, 15.12.2007, 2.03.2009, 26.04.2009, 25.11.2009}
{$I EXAMPLE_2011.ID }     {02.04.2011, 09.04.2011}
{==============}
{I decayTime.id }    {27.03.2007}
{I BarrelCtx.id }    {13.04.2007, 18.05.2007, 06.06.2007}
{I Noise_Mainen.id } {11.10.2006}
{I E_v(t)_Ali.id }      {11}
{I I_v(t).id }          {10}
{I I_IPSC.id }          {9}
{I E_IPSC.id }          {8}
{I E_fastIPSC.id }
{I E_pass.id }          {1}
{I I_AMPA+NMDA.id }     {7}
{I I_NMDA.id }          {6}
{I I_AMPA.id }          {5}
{I E_AMPA+NMDA.id }     {4}
{I E_NMDA.id }          {3}
{I E_AMPA.id }          {2}
{I variat.id }
{I 2D.id }
{I standart.id }
{I rest.id}
{I pass_47.id}
{I pass_woo.id}
{I DV_3A.id}
{I PSC&P_2.id}       {!}
{I IPSC_2D.id}
{I IPSP_2D.id}
{I IPSP_2B.id}
{I EPSP600w.id}
{I EPSP_Woo.id}
{I NMDA_all.id}
{I EPSC_4C.id}
{I EPSC_2C.id}
{I EPSP_4A.id}
{I EPSP_2B.id}
{I EPSP_1B.id}
{I AP_5Bin.id}
{I IPSPi_5B.id}
{I EPSPi_12.id}
{I AHPi_6B.id}
{I Ali_P_10.id}
{I Ali_P_04.id}
{I Ali_Pi02.id}

procedure AttributeProceduresFrom_id_File;
begin
//  if Form1.Thomsoncat1.Checked then begin
  @CommonParameters    :=@_1_CommonParameters;
  @ParametersFromFile  :=@_1_ParametersFromFile  ;
  @ParametersFromFile2 :=@_1_ParametersFromFile2 ;
  @ParametersFromFile3 :=@_1_ParametersFromFile3 ;
  @ParametersFromFile4 :=@_1_ParametersFromFile4 ;
  @ParametersFromFile5 :=@_1_ParametersFromFile5 ;
  @ParametersFromFile6 :=@_1_ParametersFromFile6 ;
  @ParametersFromFile7 :=@_1_ParametersFromFile7 ;
  @ParametersFromFile8 :=@_1_ParametersFromFile8 ;
  @ParametersFromFile9 :=@_1_ParametersFromFile9 ;
  @ParametersFromFile10:=@_1_ParametersFromFile10;
  @ParametersFromFile11:=@_1_ParametersFromFile11;
  @ParametersFromFile12:=@_1_ParametersFromFile12;
  @ParametersFromFile13:=@_1_ParametersFromFile13;
  @ParametersFromFile14:=@_1_ParametersFromFile14;
  @ParametersFromFile15:=@_1_ParametersFromFile15;
  @ParametersFromFile16:=@_1_ParametersFromFile16;
  @ParametersFromFile17:=@_1_ParametersFromFile17;
  @ParametersFromFile18:=@_1_ParametersFromFile18;
  @ParametersFromFile19:=@_1_ParametersFromFile19;
//  end;
  if Form1.V1ringtest5PSP.Checked then begin
  @CommonParameters    :=@_PSP_CommonParameters;
  @ParametersFromFile  :=@_PSP_ParametersFromFile  ;
  @ParametersFromFile2 :=@_PSP_ParametersFromFile2 ;
  @ParametersFromFile3 :=@_PSP_ParametersFromFile3 ;
  @ParametersFromFile4 :=@_PSP_ParametersFromFile4 ;
  @ParametersFromFile5 :=@_PSP_ParametersFromFile5 ;
  @ParametersFromFile6 :=@_PSP_ParametersFromFile6 ;
  @ParametersFromFile7 :=@_PSP_ParametersFromFile7 ;
  @ParametersFromFile8 :=@_PSP_ParametersFromFile8 ;
  @ParametersFromFile9 :=@_PSP_ParametersFromFile9 ;
  @ParametersFromFile10:=@_PSP_ParametersFromFile10;
  @ParametersFromFile11:=@_PSP_ParametersFromFile11;
  @ParametersFromFile12:=@_PSP_ParametersFromFile12;
  @ParametersFromFile13:=@_PSP_ParametersFromFile13;
  @ParametersFromFile14:=@_PSP_ParametersFromFile14;
  @ParametersFromFile15:=@_PSP_ParametersFromFile15;
  @ParametersFromFile16:=@_PSP_ParametersFromFile16;
  @ParametersFromFile17:=@_PSP_ParametersFromFile17;
  @ParametersFromFile18:=@_PSP_ParametersFromFile18;
  @ParametersFromFile19:=@_PSP_ParametersFromFile19;
  end;
  if Form1.V1ringtest5.Checked then begin
  @CommonParameters    :=@_5_CommonParameters;
  @ParametersFromFile  :=@_5_ParametersFromFile  ;
  @ParametersFromFile2 :=@_5_ParametersFromFile2 ;
  @ParametersFromFile3 :=@_5_ParametersFromFile3 ;
  @ParametersFromFile4 :=@_5_ParametersFromFile4 ;
  @ParametersFromFile5 :=@_5_ParametersFromFile5 ;
  @ParametersFromFile6 :=@_5_ParametersFromFile6 ;
  @ParametersFromFile7 :=@_5_ParametersFromFile7 ;
  @ParametersFromFile8 :=@_5_ParametersFromFile8 ;
  @ParametersFromFile9 :=@_5_ParametersFromFile9 ;
  @ParametersFromFile10:=@_5_ParametersFromFile10;
  @ParametersFromFile11:=@_5_ParametersFromFile11;
  @ParametersFromFile12:=@_5_ParametersFromFile12;
  @ParametersFromFile13:=@_5_ParametersFromFile13;
  @ParametersFromFile14:=@_5_ParametersFromFile14;
  @ParametersFromFile15:=@_5_ParametersFromFile15;
  @ParametersFromFile16:=@_5_ParametersFromFile16;
  @ParametersFromFile17:=@_5_ParametersFromFile17;
  @ParametersFromFile18:=@_5_ParametersFromFile18;
  @ParametersFromFile19:=@_5_ParametersFromFile19;
  end;
  if Form1.V1ringtest55.Checked then begin
  @CommonParameters    :=@_55_CommonParameters;
  @ParametersFromFile  :=@_55_ParametersFromFile  ;
  @ParametersFromFile2 :=@_55_ParametersFromFile2 ;
  @ParametersFromFile3 :=@_55_ParametersFromFile3 ;
  @ParametersFromFile4 :=@_55_ParametersFromFile4 ;
  @ParametersFromFile5 :=@_55_ParametersFromFile5 ;
  @ParametersFromFile6 :=@_55_ParametersFromFile6 ;
  @ParametersFromFile7 :=@_55_ParametersFromFile7 ;
  @ParametersFromFile8 :=@_55_ParametersFromFile8 ;
  @ParametersFromFile9 :=@_55_ParametersFromFile9 ;
  @ParametersFromFile10:=@_55_ParametersFromFile10;
  @ParametersFromFile11:=@_55_ParametersFromFile11;
  @ParametersFromFile12:=@_55_ParametersFromFile12;
  @ParametersFromFile13:=@_55_ParametersFromFile13;
  @ParametersFromFile14:=@_55_ParametersFromFile14;
  @ParametersFromFile15:=@_55_ParametersFromFile15;
  @ParametersFromFile16:=@_55_ParametersFromFile16;
  @ParametersFromFile17:=@_55_ParametersFromFile17;
  @ParametersFromFile18:=@_55_ParametersFromFile18;
  @ParametersFromFile19:=@_55_ParametersFromFile19;
  end;
  if Form1.V1ringtest6.Checked then begin
  @CommonParameters    :=@_6_CommonParameters;
  @ParametersFromFile  :=@_6_ParametersFromFile  ;
  @ParametersFromFile2 :=@_6_ParametersFromFile2 ;
  @ParametersFromFile3 :=@_6_ParametersFromFile3 ;
  @ParametersFromFile4 :=@_6_ParametersFromFile4 ;
  @ParametersFromFile5 :=@_6_ParametersFromFile5 ;
  @ParametersFromFile6 :=@_6_ParametersFromFile6 ;
  @ParametersFromFile7 :=@_6_ParametersFromFile7 ;
  @ParametersFromFile8 :=@_6_ParametersFromFile8 ;
  @ParametersFromFile9 :=@_6_ParametersFromFile9 ;
  @ParametersFromFile10:=@_6_ParametersFromFile10;
  @ParametersFromFile11:=@_6_ParametersFromFile11;
  @ParametersFromFile12:=@_6_ParametersFromFile12;
  @ParametersFromFile13:=@_6_ParametersFromFile13;
  @ParametersFromFile14:=@_6_ParametersFromFile14;
  @ParametersFromFile15:=@_6_ParametersFromFile15;
  @ParametersFromFile16:=@_6_ParametersFromFile16;
  @ParametersFromFile17:=@_6_ParametersFromFile17;
  @ParametersFromFile18:=@_6_ParametersFromFile18;
  @ParametersFromFile19:=@_6_ParametersFromFile19;
  end;
  if Form1.GJ_Sotn.Checked then begin
  @CommonParameters    :=@_GJ_CommonParameters;
  @ParametersFromFile  :=@_GJ_ParametersFromFile  ;
  @ParametersFromFile2 :=@_GJ_ParametersFromFile2 ;
  @ParametersFromFile3 :=@_GJ_ParametersFromFile3 ;
  @ParametersFromFile4 :=@_GJ_ParametersFromFile4 ;
  @ParametersFromFile5 :=@_GJ_ParametersFromFile5 ;
  @ParametersFromFile6 :=@_GJ_ParametersFromFile6 ;
  @ParametersFromFile7 :=@_GJ_ParametersFromFile7 ;
  @ParametersFromFile8 :=@_GJ_ParametersFromFile8 ;
  @ParametersFromFile9 :=@_GJ_ParametersFromFile9 ;
  @ParametersFromFile10:=@_GJ_ParametersFromFile10;
  @ParametersFromFile11:=@_GJ_ParametersFromFile11;
  @ParametersFromFile12:=@_GJ_ParametersFromFile12;
  @ParametersFromFile13:=@_GJ_ParametersFromFile13;
  @ParametersFromFile14:=@_GJ_ParametersFromFile14;
  @ParametersFromFile15:=@_GJ_ParametersFromFile15;
  @ParametersFromFile16:=@_GJ_ParametersFromFile16;
  @ParametersFromFile17:=@_GJ_ParametersFromFile17;
  @ParametersFromFile18:=@_GJ_ParametersFromFile18;
  @ParametersFromFile19:=@_GJ_ParametersFromFile19;
  end;
  if Form1.ArtificialSlice.Checked then begin
  @CommonParameters    :=@_EX_CommonParameters;
  @ParametersFromFile  :=@_EX_ParametersFromFile  ;
  @ParametersFromFile2 :=@_EX_ParametersFromFile2 ;
  @ParametersFromFile3 :=@_EX_ParametersFromFile3 ;
  @ParametersFromFile4 :=@_EX_ParametersFromFile4 ;
  @ParametersFromFile5 :=@_EX_ParametersFromFile5 ;
  @ParametersFromFile6 :=@_EX_ParametersFromFile6 ;
  @ParametersFromFile7 :=@_EX_ParametersFromFile7 ;
  @ParametersFromFile8 :=@_EX_ParametersFromFile8 ;
  @ParametersFromFile9 :=@_EX_ParametersFromFile9 ;
  @ParametersFromFile10:=@_EX_ParametersFromFile10;
  @ParametersFromFile11:=@_EX_ParametersFromFile11;
  @ParametersFromFile12:=@_EX_ParametersFromFile12;
  @ParametersFromFile13:=@_EX_ParametersFromFile13;
  @ParametersFromFile14:=@_EX_ParametersFromFile14;
  @ParametersFromFile15:=@_EX_ParametersFromFile15;
  @ParametersFromFile16:=@_EX_ParametersFromFile16;
  @ParametersFromFile17:=@_EX_ParametersFromFile17;
  @ParametersFromFile18:=@_EX_ParametersFromFile18;
  @ParametersFromFile19:=@_EX_ParametersFromFile19;
  end;
  if Form1.FittoPSCsPSPs.Checked then begin
  @CommonParameters    :=@_V9_CommonParameters;
  @ParametersFromFile  :=@_V9_ParametersFromFile  ;
  @ParametersFromFile2 :=@_V9_ParametersFromFile2 ;
  @ParametersFromFile3 :=@_V9_ParametersFromFile3 ;
  @ParametersFromFile4 :=@_V9_ParametersFromFile4 ;
  @ParametersFromFile5 :=@_V9_ParametersFromFile5 ;
  @ParametersFromFile6 :=@_V9_ParametersFromFile6 ;
  @ParametersFromFile7 :=@_V9_ParametersFromFile7 ;
  @ParametersFromFile8 :=@_V9_ParametersFromFile8 ;
  @ParametersFromFile9 :=@_V9_ParametersFromFile9 ;
  @ParametersFromFile10:=@_V9_ParametersFromFile10;
  @ParametersFromFile11:=@_V9_ParametersFromFile11;
  @ParametersFromFile12:=@_V9_ParametersFromFile12;
  @ParametersFromFile13:=@_V9_ParametersFromFile13;
  @ParametersFromFile14:=@_V9_ParametersFromFile14;
  @ParametersFromFile15:=@_V9_ParametersFromFile15;
  @ParametersFromFile16:=@_V9_ParametersFromFile16;
  @ParametersFromFile17:=@_V9_ParametersFromFile17;
  @ParametersFromFile18:=@_V9_ParametersFromFile18;
  @ParametersFromFile19:=@_V9_ParametersFromFile19;
  end;
  if Form1.LIF1.Checked then begin
  @CommonParameters    :=@_LIF_CommonParameters;
  @ParametersFromFile  :=@_LIF_ParametersFromFile  ;
  @ParametersFromFile2 :=@_LIF_ParametersFromFile2 ;
  @ParametersFromFile3 :=@_LIF_ParametersFromFile3 ;
  @ParametersFromFile4 :=@_LIF_ParametersFromFile4 ;
  @ParametersFromFile5 :=@_LIF_ParametersFromFile5 ;
  @ParametersFromFile6 :=@_LIF_ParametersFromFile6 ;
  @ParametersFromFile7 :=@_LIF_ParametersFromFile7 ;
  @ParametersFromFile8 :=@_LIF_ParametersFromFile8 ;
  @ParametersFromFile9 :=@_LIF_ParametersFromFile9 ;
  @ParametersFromFile10:=@_LIF_ParametersFromFile10;
  @ParametersFromFile11:=@_LIF_ParametersFromFile11;
  @ParametersFromFile12:=@_LIF_ParametersFromFile12;
  @ParametersFromFile13:=@_LIF_ParametersFromFile13;
  @ParametersFromFile14:=@_LIF_ParametersFromFile14;
  @ParametersFromFile15:=@_LIF_ParametersFromFile15;
  @ParametersFromFile16:=@_LIF_ParametersFromFile16;
  @ParametersFromFile17:=@_LIF_ParametersFromFile17;
  @ParametersFromFile18:=@_LIF_ParametersFromFile18;
  @ParametersFromFile19:=@_LIF_ParametersFromFile19;
  end;
  if Form1.Gammarhythm40HzCA3id1.Checked then begin
  @CommonParameters    :=@_Gam_CommonParameters;
  @ParametersFromFile  :=@_Gam_ParametersFromFile  ;
  @ParametersFromFile2 :=@_Gam_ParametersFromFile2 ;
  @ParametersFromFile3 :=@_Gam_ParametersFromFile3 ;
  @ParametersFromFile4 :=@_Gam_ParametersFromFile4 ;
  @ParametersFromFile5 :=@_Gam_ParametersFromFile5 ;
  @ParametersFromFile6 :=@_Gam_ParametersFromFile6 ;
  @ParametersFromFile7 :=@_Gam_ParametersFromFile7 ;
  @ParametersFromFile8 :=@_Gam_ParametersFromFile8 ;
  @ParametersFromFile9 :=@_Gam_ParametersFromFile9 ;
  @ParametersFromFile10:=@_Gam_ParametersFromFile10;
  @ParametersFromFile11:=@_Gam_ParametersFromFile11;
  @ParametersFromFile12:=@_Gam_ParametersFromFile12;
  @ParametersFromFile13:=@_Gam_ParametersFromFile13;
  @ParametersFromFile14:=@_Gam_ParametersFromFile14;
  @ParametersFromFile15:=@_Gam_ParametersFromFile15;
  @ParametersFromFile16:=@_Gam_ParametersFromFile16;
  @ParametersFromFile17:=@_Gam_ParametersFromFile17;
  @ParametersFromFile18:=@_Gam_ParametersFromFile18;
  @ParametersFromFile19:=@_Gam_ParametersFromFile19;
  end;
  if Form1.PouillePSCPSP1.Checked then begin
  @CommonParameters    :=@_Pou_CommonParameters;
  @ParametersFromFile  :=@_Pou_ParametersFromFile  ;
  @ParametersFromFile2 :=@_Pou_ParametersFromFile2 ;
  @ParametersFromFile3 :=@_Pou_ParametersFromFile3 ;
  @ParametersFromFile4 :=@_Pou_ParametersFromFile4 ;
  @ParametersFromFile5 :=@_Pou_ParametersFromFile5 ;
  @ParametersFromFile6 :=@_Pou_ParametersFromFile6 ;
  @ParametersFromFile7 :=@_Pou_ParametersFromFile7 ;
  @ParametersFromFile8 :=@_Pou_ParametersFromFile8 ;
  @ParametersFromFile9 :=@_Pou_ParametersFromFile9 ;
  @ParametersFromFile10:=@_Pou_ParametersFromFile10;
  @ParametersFromFile11:=@_Pou_ParametersFromFile11;
  @ParametersFromFile12:=@_Pou_ParametersFromFile12;
  @ParametersFromFile13:=@_Pou_ParametersFromFile13;
  @ParametersFromFile14:=@_Pou_ParametersFromFile14;
  @ParametersFromFile15:=@_Pou_ParametersFromFile15;
  @ParametersFromFile16:=@_Pou_ParametersFromFile16;
  @ParametersFromFile17:=@_Pou_ParametersFromFile17;
  @ParametersFromFile18:=@_Pou_ParametersFromFile18;
  @ParametersFromFile19:=@_Pou_ParametersFromFile19;
  end;
end;

{----------------------------------------------------------------------}
procedure DefaultParameters;
{ Executed at initiation of Form. }
begin
  AColumn.Free;  AColumn:=nil;  IfAColumnCreated:=false;    {15.04.2016}
  AttributeProceduresFrom_id_File;
  NPop:=2;
  Nts[1]:=imin(200,MaxPh);   ts_end[1]:=0.100;
  Nts[2]:=imin(200,MaxPh);   ts_end[2]:=0.100;
  WriteOrNot:=0;   YesToClean:=0;
  NP0[1].HH_type:='Lyle';           NP0[1].HH_order:='2-points';
  NP0[2].HH_type:='Chow';           NP0[2].HH_order:='1-point';
  NP0[1].IfThrModel:=1;
  NP0[2].IfThrModel:=1;
  HodgkinPhysParameters(NP0[1]);
  HodgkinPhysParameters(NP0[2]);
  IfSecondOrder:=1;   { 0-for Godunov, 1-for TVD }
  IfPhase:=1;
  IfInSyn_al_EQ_beta:=1;
  IfAMPAGABAinp_NE_local:=0;
  IfSigmoidForPresynRate:=0;
  If_m_saturates:=0;
  IfDynamic_K_Cl:=0;  If_K_Cl_CalculatedInBG:=1;
  IfStimLayer2or4:=4;
  IfViewInLayer2or4:=IfStimLayer2or4;
  IfExtracellOrThalamOrVisualOrLGN_Stimul:=1; {Extracell.}
  Smpl:=1;
  MainDir:='';
  SmplFile[Smpl]:='';
  ExpFigureFileName:='';
  IfDataStartsFromZero:=1;
  KeepParams:=0;
  { CommonParameters;}
  InitiateCalculation_1D;
  { Column-object }
  PrepareParamsForColumnCreation;
  AColumn:=TColumn.Create;  IfAColumnCreated:=true;
  { On Forms }
  SetDDSpinEdits;
  ReplaceDDSpinEdits;
  CorrespondParametersToTheForm;
end;

procedure InitiateCalculation_1D;
begin
  iHist:=0;
  if KeepParams=0 then  PhysParameters;
  CalcParameters;
  {*****************}
  CommonParameters;
//  ParametersFromFile;
  {*****************}
  OtherParameters;
  //ReadFrequencyFunction;
  InitHistory;
end;
{----------------------------------------------------------------------}

procedure DefaultSynapticParameters;
var  ie :integer;
begin
  { Density of synapses on exitatory and inhibitory cells }
  gAMP3[1]:=0.8 {mS/cm^2};      gAMP3[2]:=1 {mS/cm^2};
  gGAB3[1]:=0   {mS/cm^2};      gGAB3[2]:=0 {mS/cm^2};
  gAMPA[1]:=0   {mS/cm^2};      gAMPA[2]:=6 {mS/cm^2};
  gGABA[1]:=7   {mS/cm^2};      gGABA[2]:=0 {mS/cm^2};
  gGABB[1]:=0   {mS/cm^2};      gGABB[2]:=0 {mS/cm^2};
  gNMD3[1]:=0   {mS/cm^2};      gNMD3[2]:=0 {mS/cm^2};
  gNMDA[1]:=0   {mS/cm^2};      gNMDA[2]:=0 {mS/cm^2};
  gGJ[1]:=0;                    gGJ[2]:=0;
  for ie:=1 to 2 do begin
      { Constants for receptors }
      alAMPA[ie]:=185 {1/s};
      alGABA[ie]:=120 {1/s};
      alGABB[ie]:=  8 {1/s};
      alNMDA[ie]:= {50}36 {1/s};
      beAMPA[ie]:=185 {1/s};
      beGABA[ie]:=5200 {1/s};
      beGABB[ie]:=  8 {1/s};
      beNMDA[ie]:=1/0.003 {1/s};
      alAMP3[ie]:=alAMPA[ie];
      alGAB3[ie]:=alGABA[ie];
      beAMP3[ie]:=beAMPA[ie];
      beGAB3[ie]:=beGABA[ie];
  end;
  VAMPA:=(  5)/1000 {V};
  VGABA:=(-80)/1000 {V};
  VGABB:=(-93)/1000 {V};
  SynSensitivity_E:=1;
  SynSensitivity_I:=1;
  SynSensitivity_Thalamic:=1;
  SynEffect_Glu:=0.2;
  SynEffect_GABA:=0.4;
  gNMDA_gAMPA:=4;
end;

procedure PhysParameters;
begin
    DefaultSynapticParameters;
    { Unstable AP generation - bursting }
    sgm_V[1]:=0.002{V};    sgm_V[2]:=0.002{V};
    NP0[1].ThrShift:=0;    NP0[2].ThrShift:=0;
    { Axon }
    t_axon[1,1]:=0.0002{s};    t_axon[2,1]:=0.0002{s};
    t_axon[1,2]:=0.0002{s};    t_axon[2,2]:=0.0002{s};
    Speed:=0.3{m/s};
    { External signals }
    pext_Iext:=4{Hz/muA};
    factorAMPA:=0;  factorNMDA:=0;  factorGABA:=0;
    U_Depr_Glu:=0;  tau_Depr_Glu:=800{ms};  nu_thr_Depr_Glu:=0{Hz};
    U_Depr_GABA:=0; tau_Depr_GABA:=800{ms}; nu_thr_Depr_GABA:=0{Hz}; 
    Qns:=0;
    I_ind:=0;  s_ind:=0;  nu_ind:=0 {Hz};
    t0s:=0.00042+0.0005{s};  tSt:=0.001{80e-6}{s};  dtSt:=0;  nStimuli:=2;
    Iext:=120{mkA};
    t_Exp:=0.0;
    t_stim2 :=0.1{s};
    { Intracellular recordings }
    IfBlockAMPA:=0; IfBlockGABA:=0; IfBlockGABB:=0; IfBlockNMDA:=0; IfBlockK:=0;
end;

procedure OtherParameters;
var  ie   :integer;
     mem1,mem2 :double;
begin
  { Check for consistency of parameters }
  for ie:=1 to 2 do Nts[ie]:=imin(trunc(ts_end[ie]/dt)+1,Nts[ie]);
  { Other parameters }
  nt_end:={imin(}trunc(t_end/dt){, mMaxExp)};
  case R.NP.If_I_V_or_g of
  1: VI_sc:=I_sc;
  2: VI_sc:=V_sc;
  3: VI_sc:=p_sc;
  4: Vi_sc:=V_sc;
  5: Vi_sc:=V_sc;
  end;
  if IfAMPAGABAinp_NE_local=0 then begin
     for ie:=1 to 2 do begin
         alAMP3[ie]:=alAMPA[ie];  beAMP3[ie]:=beAMPA[ie];
         alGAB3[ie]:=alGABA[ie];  beGAB3[ie]:=beGABA[ie];
     end;
  end;
//  Randomize;
  RandSeed:=1;
  {************}
  if sgm_V[3]<=0 then sgm_V[3]:=sgm_V[1];
  if sgm_V[4]<=0 then sgm_V[4]:=sgm_V[2];
  mem1:=NP0[3].ThrShift;
  mem2:=NP0[4].ThrShift;
  NP0[3]:=NP0[1];
  NP0[4]:=NP0[2];
  Form4.DDSpinEdit75.Font.Color:=clBlack;
  Form4.DDSpinEdit95.Font.Color:=clBlack;
  if mem1<>0 then NP0[3].ThrShift:=mem1 else Form4.DDSpinEdit75.Font.Color:=clGray;
  if mem2<>0 then NP0[4].ThrShift:=mem2 else Form4.DDSpinEdit95.Font.Color:=clGray;
//  if NPop=4 then FieldToDraw:='U3';
  BOLD:=TBOLD.Create;
end;

procedure CalcParameters;
begin
  IfRose:=0;
  IfReadHistory:=0;
  IfChangeVrest:=1; { Current or Voltage (1/0) }
  R.NP.If_I_V_or_g:=2;
  IfUndimensionate:=0;    DrawOrNot:=1;   IfSimplex:=1;
  { Samples - experimental curves }
  NSmpls:=4;
  scx_Smpl:=0.001 {s};  scy_Smpl:=0.001{V} {-1}{pA};  shift_Smp:=0 {ms};
  sc_Simplex:=1;
  { Initiating graphics }
  n_show:=10;  n_DrawPhase:=20;  n_Write:=3;  IfShowBG:=0;  PlotWindow:=0;
  p_sc:=1 {Hz};  V_sc:=1000 {for mV in Axis};  I_sc:=1 {for pA in Axis};
  t_end:=0.00182;
  dt:=0.000008;
  t_Exp:=0.0 {s};  { time when V=Vexp }
  t_ind:=0 {s};     { time when I_ind is on }
end;

function StatisticsForWhom :double;
begin
  case Form13.ComboBox1.ItemIndex of
  0: if Form4.CheckBox8.Checked then                  { Input }
        StatisticsForWhom:=AColumn.Pop[1].Iind*NP0[1].Square*1e9
     else
        StatisticsForWhom:=pext;
  1: StatisticsForWhom:=AColumn.Pop[i3].nu;            { nu[1] }
  2: StatisticsForWhom:=LFP;                           { LFP }
  else
     StatisticsForWhom:=0;
  end;
end;

procedure ParametersFromFiles;
begin
      case Smpl of
      0: ;
      1: ParametersFromFile;
      2: ParametersFromFile2;
      3: ParametersFromFile3;
      4: ParametersFromFile4;
      5: ParametersFromFile5;
      6: ParametersFromFile6;
      7: ParametersFromFile7;
      8: ParametersFromFile8;
      9: ParametersFromFile9;
      10: ParametersFromFile10;
      11: ParametersFromFile11;
      12: ParametersFromFile12;
      13: ParametersFromFile13;
      14: ParametersFromFile14;
      15: ParametersFromFile15;
      16: ParametersFromFile16;
      17: ParametersFromFile17;
      18: ParametersFromFile18;
      19: ParametersFromFile19;
      else
         ParametersFromFile;
      end;
      ShowExpFigure;
end;

procedure MeasureInNode;
begin
        case R.NP.If_I_V_or_g of
        1: Vr:=ANrns[i3].NV.PSC; //PSC[3];
        2: Vr:=ANrns[i3].NV.V;   //V[3];//-Vrest[3];
        3: Vr:=AColumn.Pop[i3].nu;     //Q[3];
        4: Vr:=ANrns[i3].NV.Vd;  //VatE[3]-Vrest[3];
        end;
        {**************************************}
        Vmod[imin(nt,mMaxExp)]:=Vr;
        {**************************************}
end;

{-----------------------------------------------------------------------}

function Calc_Functional(dimF :integer; var VFunc :vect) :double;
{
  Simulation by Wright's model, comparison with sample 'Vexp',
  calculation of residual in 'dimF'-th different intervals.
}
var
      Func                          : double;
      i,iFunc,ntP,nl                : integer;
begin
      if Form4.CheckBox11.Checked{BG}=false then begin  t:=0; nt:=0;  end;
      { BG }
      if (Form4.CheckBox11.Checked)and(IfBGinProcess=false) then
          CalculateBackground('ZeroStimul');
      {****}
      if KeepParams=0 then  CommonParameters;
      ParametersFromFiles;
      OtherParameters;
      CorrespondParametersToTheForm;
      ReadExpData;
      { RestPotentials & SetStateSolution }
//      InitialConditions;
//      InitialConditionsHodgkin;
//      PrepareParamsForColumnCreation;
      AColumn:=TColumn.Create;   IfAColumnCreated:=true;
      AColumn.InitialConditions;
      { BG }
      if (IfBGColumnCreated)and(IfBGinProcess=false) then begin
                            AColumn.CopyInitialConditionsFrom(BGColumn);
                            IfBGColumnCreated:=false;
      end;
      { Update_NP0 }
                      NP0[1]:=AColumn.Pop[1].PP.NP;
      if NPop>=2 then NP0[2]:=AColumn.Pop[2].PP.NP;
//      t:=0;   nt:=0;
      PrepareFormForRepresentativeNeuronsO;
      InitiateRepresentativeNeuronsO;
      CorrespondParametersToTheForm;
      if DrawOrNot =1 then  Initial_Picture;
      if WriteOrNot=1 then  InitiateWriting;
      { Interval [0,nt_end] will be devided on 'dimF' pieces }
      ntP:=Trunc(imin(nt_end,mMaxExp)/dimF);
      for i:=1 to dimF do  VFunc[i]:=0;
      Func:=0;
      REPEAT
        { ----- Step ----- }
        t:=t+dt;   nt:=nt+1;
        {***********************}
        AColumn.IntegrateDensity;
        {***********************}
        { Stimulation }
        IntegrateNoise(AColumn);
        Set_Ps(AColumn.rext);
        BipolarElectrodeStimulation;
        {***********************}
        { Axons }
        AColumn.AxonalDelays;
        if Form11.Visible then PlotNulclines_Setting_nuE_or_nuI;
        {*************************}
        { Synapses }
        AColumn.IntegrateSynapticCurrents;
        if not(IfBGinProcess)and(Form31.Visible) then
        SetConductancesFromExperiment(nt,AColumn);
        if not(IfBGinProcess)or((If_K_Cl_CalculatedInBG=1)and(IfDynamic_K_Cl=1)) then  {changed on 18.08.2014}
        AColumn.ChangeReversalPotentialsAccordingToIonConcentrations;
        {*************************}
        for i:=1 to NPop do begin
            AColumn.Pop[i].Iind:=Current_Iind(2-(i mod 2),AColumn.Pop[i].r_noise);
            AColumn.Pop[i].sI:=AColumn.Pop[i].sI+Conductance_Sind(2-(i mod 2));
            {************************************}
            AColumn.Pop[i].MembranePotential(t,0);
            {************************************}
        end;
        OneStepForRepresentativeNeuronsO(@t,@dt);
        {*************}
        if IfBGinProcess=false then begin
           { Measurement }
           MeasureInNode;
           { Residuals }
           if nt<imin(mMaxExp,(mMax-1)*ntP) then begin
              iFunc:=trunc((nt-1)/ntP)+1;  { number of current component }
              nl:=nt-(iFunc-1)*ntP;        { local step of current piece }
              VFunc[iFunc]:=sqrt(sqr(VFunc[iFunc])*(nl-1)/nl+sqr(Vexp[nt,Smpl]-Vr)/nl);
              Func        :=sqrt(sqr( Func       )*(nt-1)/nt+sqr(Vexp[nt,Smpl]-Vr)/nt);
           end;
        end;
        {**************************************}
        { Drawing }
        if (DrawOrNot=1) and ((trunc(nt/n_show)=nt/n_show)or(nt=1)) then begin
            if (IfShowBG=1)or(IfBGinProcess=false) then Evolution;
            if (IfBGinProcess=false) then begin
               Draw_Conductances(AColumn);
               AColumn.Pop[imin(Form12.ComboBox1.ItemIndex+1,NPop)].Draw;
               Draw_LFP( AColumn.Pop[1],Acolumn.Ions[1]);
               BOLD.Draw(AColumn.Pop[1+2*trunc((Npop-1)/2)].nu);
               if IfDynamic_K_Cl=1 then AColumn.Ions[iPop_Ions_View].Draw;
               if IfDynamic_K_Cl=1 then AColumn.Ions[1].Draw2;
            end;
            if Form18.Visible then RunInspector;
        end;
        if not(IfBGinProcess) then begin
           if (trunc(nt/n_DrawPhase)=nt/n_DrawPhase)and(Form2.Visible) then DrawPhaseSpace;
           if (WriteOrNot=1) and (trunc(nt/n_Write)=nt/n_Write) then Writing;
           if (WriteOrNot=1) and (trunc(nt/n_Write)=nt/n_Write) then Write_Conductances(AColumn);
           if (WriteOrNot=1) and (trunc(nt/n_Write)=nt/n_Write) then AColumn.Ions[1].Writing;
           if (WriteOrNot=1) and (trunc(nt/n_Write)=nt/n_Write) then WriteFromNode(AColumn,'WriteFromNode.dat');
           if (WriteOrNot=1) and (trunc(nt/n_Write)=nt/n_Write) then Write_LFP_FromNode(AColumn.Pop[1],Acolumn.Ions[1]);
           if Form1.CheckBox3.Checked then AnalyseStatistics(StatisticsForWhom);
           if Form11.Visible then PlotNulclines_Setting_Iind;
           if Form32.Visible then CV_dependence_on_I_ind;
        end;
        { Treat Key }
        if Form1.Thread1.Checked then begin
           MyThread1.MySynchronize;
           MyThread1.Treat_Key;
        end;
        if (trunc(nt/n_show)=nt/n_show)or(nt=1) then Application.ProcessMessages;
        if (Form1.Pausejustbeforetend1.Checked)and(nt=nt_end-1) then StopKey:='P';
        Pause;
      UNTIL (not(IfBGinProcess)and(nt>=nt_end)) or
               ((IfBGinProcess)and(t>=0{*1e3>=Form4.DDSpinEdit12.Value}));
//      if WriteOrNot=1 then  close(ccc);
      Calc_Functional:=Func;
      { BG }
      if IfBGinProcess then CreateBackgroundObjects;
      //AColumn.Free;  AColumn:=nil;  IfAColumnCreated:=false;
      DestroyRepresentativeNeuronsO;
      PrintScreen;
end;

{---------- E N D -------------------------------------------------------------}
end.
