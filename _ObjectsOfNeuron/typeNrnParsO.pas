unit typeNrnParsO;
{ Parameters and variables used in TNeuron and its descendants }

interface
type
  arr4x4  =array[1..4,1..4] of double;
  arr26x26=array[1..26,1..26] of double;
  vect26  =array[1..26] of double;
//  tVThreshold2 = function(DVDt,ThrCorrection,ts :double) :double;
//  tIfSpikeOccursInThrModel = procedure(V_,Thr,ddV:double; var tAP_:double; var indic_:integer);
  tIfSpikeOccursInThrModel = procedure;
  { Parameters: }
  NeuronProperties =record
    HH_type,HH_order,Thr_type,
    Na_type,Na_subtype,NaR_type,NaR_subtype
                                                            :string;
    IfBlockNa,IfBlockK,IfBlockKM,IfBlockKA,IfBlockKD,IfBlockPass,
    IfBlockNaR,IfBlockNaP,
    IfBlockH,IfBlockADP,IfBlockAHP,IfBlockCaT,IfBlockCaH,IfBlockKCa,IfBlockBst,
    IfReduced,IfThrModel,IfLIF,
    IfSpikeDependentEIF,
    IfSet_gL_or_tau, IfSet_VL_or_Vrest, If_I_V_or_g,
    If_Slow_Na_inactivation,If_Slow_NaR_inactivation, IfPredictorCorrector,
    If_NMDA_on_dendrite
                                                            :integer;
    n_AP,yK_AP,nA_AP,lA_AP,dT_AP,tADP,dwADP,dwAHP,dnM,dyD,yH_AP,xD_AP,dii,
    ThrShift,FixThr,dThr_dts,
    k_a_Brette,tau_Brette,VTreset_Brette,dVTdV_Brette,
    DepBlock_limit,DepBlock_slope,
    Vreset,Vd_reset,tau_abs,
    EIF_deltaT,EIF_tauw,EIF_a,EIF_dw,EIF_VT,
    gL,VL,Square,tau_m0,ro,l,Vrest,C_membr,VLd,gLd,
    gNa,gNaR,gK,gKM,gKA,gKD,gCaH,gKCa,gADP,gAHP,gCaT,gBst,gNaP,gH,
    VNa,VNaR,VK,VKDr,VKM,VKD,V12H,VADP,VCa,VAHP,
    a1Na,a2Na,a3Na,a4Na,b1Na,b2Na,b3Na,b4Na,
    c1Na,c2Na,c3Na,c4Na,d1Na,d2Na,d3Na,d4Na,
    a1NaR,a2NaR,a3NaR,a4NaR,b1NaR,b2NaR,b3NaR,b4NaR,
    c1NaR,c2NaR,c3NaR,c4NaR,d1NaR,d2NaR,d3NaR,d4NaR,
    a1K,a2K,a3K,b1K,b2K,b3K,
    Tr,Tr_NaR, NaThreshShift, KJ_NaCooperativity,
    FRT,Ca8,Ca0,d_Ca,tauCa,Rgas,Temperature,phi_T,Faraday,
    Mg,VNMDA,
    NaKpumpS,NaKpumpD
                                                            :double;
    { External functions }
//    VThreshold2                                             :tVThreshold2;
    IfSpikeOccursInThrModel                                 :tIfSpikeOccursInThrModel;
  end;

  { Variables: }
  NeuronVariables =record
    indic                                                   :integer;

    V,gActive,gActiveDend,Ca,Vold,Im,Im_d,Im_s,
    PSC,Isyn,Iind,IsynE,IsynI,IsynE_old,IsynI_old,IatE,
    gNMDA,
    Vd,DVDt,ddV,Thr,tAP,ISI0,
    mmR,hhR,iiR,mm,nn,hh,ii,yK,yKA, nM,nA,lA,yH,mCaH,hCaH,kCaH,nKCa,
    wADP,wAHP, mCaT,hCaT, mBst,mNaP,hNaP, xD,yD,
    INaR,INa,IK,IKM,IKA,IKD,ICaH,IKCa,IADP,IAHP,ICaT,IBst,INaP,IH,IK_tot,I_leak,
    VT_Brette,EIF_w
                                                            :double;
    XNa,XNaR                                                :vect26;
  end;

var
    Vus  :double;

implementation

end.
