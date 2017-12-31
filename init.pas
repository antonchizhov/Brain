unit Init;

interface
uses t_dtO,typeNrnParsO,MathMyO;
const {mMax=16;} mMaxExp=100000; MaxSmpls=19; MaxPh={101}201; MaxLN={20}50;
type
//    longvect=array[0..2*mMax] of double;
//    vect    =array[0..mMax]   of double;
//    matr    =array[1..mMax,1..mMax] of double;
//    vectint =array[1..2*mMax] of integer;
//    vecstr  =array[1..2*mMax] of string;
//    vect2   =array[1..2]      of double;
//    vect4   =array[1..4]      of double;
//    matr2x2 =array[1..4,1..4] of double;
  TypeRepresentative =record
    NP                :NeuronProperties;
  end;
var
    CommonParameters,
    ParametersFromFile,
    ParametersFromFile2,
    ParametersFromFile3,
    ParametersFromFile4,
    ParametersFromFile5,
    ParametersFromFile6,
    ParametersFromFile7,
    ParametersFromFile8,
    ParametersFromFile9,
    ParametersFromFile10,
    ParametersFromFile11,
    ParametersFromFile12,
    ParametersFromFile13,
    ParametersFromFile14,
    ParametersFromFile15,
    ParametersFromFile16,
    ParametersFromFile17,
    ParametersFromFile18,
    ParametersFromFile19       :procedure;

    NP0               :array[1..4] of NeuronProperties;
    R                 :TypeRepresentative;
    Vexp              :array[0..mMaxExp,0..MaxSmpls] of double;
    Vmod              :array[0..mMaxExp] of double;
    g,g_dg,LimL,LimR  :longvect;
    ifC,iC_ig,ig_iC   :vectint;
    strC              :vecstr;
    mC,m              :integer;
    gAMP3,gAMPA,gGABA,gGABB,gGAB3,gNMD3,gNMDA,
    gGJ                                      :array[1..3] of double;
    VFunc                                    :vect;
    FreqUS                                   :matr;
    SmplFile                                 :array[0..MaxSmpls] of string;
    { ----- }
    alAMPA,alGABA,alGABB,alNMDA,beAMPA,beGABA,beGABB,beNMDA,
    alAMP3,alGAB3,beAMP3,beGAB3
                                             :vect_2;
    sgm_V                                    :vect_4;
    t_axon                                   :matr_2x2; //axo-dendritic connection delays
    r_axon                                   :matr_4x4; //axo-dendritic connection lengths
    VAMPA,VGABA,VGABB, VexpMax,VmodMax, Vr,
    IfBlockAMPA,IfBlockGABA,IfBlockGABB,IfBlockNMDA,
    {t,}t_end,{dt,}dt2, t0s,tSt,dtSt, AmplOfNoise,
    Qns, Functional,
    xU,yU,p_sc,V_sc,I_sc,VI_sc,sc_Simplex,
    shift_Smp,scx_Smpl,scy_Smpl,
    I_ind,s_ind, nu_Ind,t_ind,t0_ind,t_Exp,Iext,pext,pext_Iext,tBG,
    Sbipolar_Iext,T_bipolar,
    factorAMPA,factorGABA,factorNMDA,
    U_Depr_Glu,tau_Depr_Glu,U_Depr_GABA,tau_Depr_GABA,
    nu_thr_Depr_Glu,nu_thr_Depr_GABA,
    tauNoise,NoiseToSgn,taum_taus,r_Noise,
    LFP,
    Speed,
    PlotWindow,
    SynSensitivity_E,SynSensitivity_I,gNMDA_gAMPA,
    SynSensitivity_Thalamic,SynEffect_Glu,SynEffect_GABA

                                                            :double;
    nStimuli, IfUndimensionate,NSmpls,IfSimplex,
    IfDataStartsFromZero,  IfBlockK,
    IfChangeVrest, IfInSyn_al_EQ_beta, i3, iPop_Ions_View,
    IfAMPAGABAinp_NE_local,
    IfSigmoidForPresynRate, If_m_saturates,IfEqForVGABA,
    IfDynamic_K_Cl,If_K_Cl_CalculatedInBG,
    IfPhase, IfSecondOrder, If_Binzegger_V1, IfConnectionsSet,
    DrawOrNot,WriteOrNot,YesToClean,n_show,n_DrawPhase,n_Write,IfShowBG,
    IfReadHistory,IfSigmoidFound,IfStimLayer2or4,IfViewInLayer2or4,If_4x4,
    IfExtracellOrThalamOrVisualOrLGN_Stimul,layerForLFP,
    IfRose,
    iHist,SigmOrLinear, istop,nFunk, Smpl,KeepParams,ief,jef
                                                            :integer;
    nt,nt_end                                               :longint;
    aaa,ggg,ccc,qqq,ttt,ddd,nnn,xxx,bbb,fff,eee,iii         :text;
    MainDir,ExpFigureFileName,Status,FieldToDraw            :string;
{=== Phase ============================================================}
    Nts                                      :array[1..2] of integer;
    ts_end                                   :array[1..2] of double;

{======================================================================}
{*******************   2-D   ******************************************}
{======================================================================}

Const mXmax=101; mYmax=51; NofPWmax=40;
type
     arr_3_X_Y=array[1..1,0..mXmax,0..mYmax] of double;
     arr_X_Y  =array[0..mXmax,0..mYMax] of double;
     arr_X    =array[0..mXmax] of double;
Var
    WQ,WdQdt,Wr,Wrn,
    Wu,Wv,Ww, Wun,Wvn
                                                       :arr_3_X_Y;
    ni,nj,ni_2,nj_2,R_stim,R_decay,
    ni_stim,nj_stim,ni_stim2,nj_stim2,
    i_view,j_view,i_view2,j_view2,IfCut,i_cut,h_cut,
    rPW,
    OrderOfWaveEq
                                                       :integer;
    dx,dy,dx2,dy2, dt_out, LagOfDS,
    t_stim2
                                                       :double;
    BlankedPW                     :array[0..NofPWmax,1..2] of integer;

{procedure Warning(t1 :string); forward;
function BurstOfAPs(u,DuDt,VTh :double) :double; forward;}
{--------------------EOF---------------------------------------------------}
implementation

end.
