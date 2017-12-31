unit typeSynParsO;

interface

type

  { Properties: }
  SynapseProperties =record
     gmax,Vrev,Vrev0,alpha,beta,factor,IfBlock,
     tau_Depr,U_Depr,nu_thr_Depr
                                                :double;
     IfApplySigmoidToAxonRate,IfInSyn_al_EQ_beta,
     If_Saturates                               :integer;
     Name                                       :string;
     pAxonRate                                  :^double;
  end;

implementation

end.
