unit LGN_Init;

interface

Const mXmax=101; mYmax=101; maxfi=400; maxnt=10000;
type
     arr_X_Y  =array[0..mXmax,0..mYMax] of double;
     Parr_X_Y =^arr_X_Y;
Var
    zScreen,zScreen_Sat,
    zD_cen,zD_sur, zU_cen,zU_sur, zD_late,zU_late,
    zE_cen,zE_sur,
    zLGN_cen,zLGN_sur,zLGN_subthr,zLGN,zRF,dzLGN_dt,
    zLGN_Off
                                                       :arr_X_Y;
    Pz                                                 :Parr_X_Y;
    zV1                                                :array[0..maxfi] of double;
    ni,nj,ni2_LGN,nj2_LGN,ni2_Screen,nj2_Screen,
    rPW,IfGray,
    IfRunOneLGNneuron
                                                       :integer;
    dxy_LGN,V1_to_LGN_deg_per_mm,
    tau_cen,tau_sur,tau_late,K_late_to_early,
    sgm_cen_h,sgm_cen_v1,sgm_cen_v2,sgm_sur_h,sgm_sur_v,k_cen_sur,
    MeanStimLum,AmplOfStimLum,Background,MeanLum,ScaleOfSaturation,
    L_spont,
    sgm_pref,sgm_orth,Off_shift,
    t_end,t_stim,
    t_LGN,dt_LGN
                                                       :double;
    ShapeOfSaturation                                  :string;
    nt_LGN                                             :integer;

{-------------}
type
    TDiagram=record
      i_RecNrn,j_RecNrn                                :integer;
      Vert_shift,Horiz_shift                           :double;
      Trace                                            :array[0..maxnt] of double;
      Traces                                           :array[0..8,0..maxnt] of double;
    end;
var Diagram  :TDiagram;


implementation

end.
