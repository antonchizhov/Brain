unit SynCurrO;

interface
uses
  Classes,Forms,
  typeSynParsO,MathMyO,Unit4;

type
  {==================================================================}
  TSynCurr = class
  private
  protected
  public
    {Properties:}
    SP                                          :SynapseProperties;
    {Variables:}
    g,m,U,W,eM,UeM,WeM,xD                       :double;
    {Functions:}
    {*******************************************}
    procedure InitialConditions;
    function Sigmoid(x :double) :double;
    procedure Integrate(dt :double);
    procedure EquateFrom(ASyn :TSynCurr);
    procedure EquateTo(ASyn :TSynCurr);

    constructor Create;
  end;
  {==================================================================}

implementation

constructor TSynCurr.Create;
begin
  inherited Create;
end;

procedure TSynCurr.EquateFrom(ASyn :TSynCurr);
var SP1  :SynapseProperties;
begin
  { Properties except pAxonRate}
  SP1:=SP;
  SP :=ASyn.SP ;
  SP.pAxonRate:=SP1.pAxonRate;
  { Variables }
  g  :=ASyn.g  ;
  m  :=ASyn.m  ;
  U  :=ASyn.U  ;
  W  :=ASyn.W  ;
  eM :=ASyn.eM ;
  UeM:=ASyn.UeM;
  WeM:=ASyn.WeM;
  xD :=ASyn.xD ;
end;

procedure TSynCurr.EquateTo(ASyn :TSynCurr);
var SP1  :SynapseProperties;
begin
  { Properties except pAxonRate}
  SP1:=ASyn.SP;
  ASyn.SP :=SP ;
  ASyn.SP.pAxonRate:=SP1.pAxonRate;
  { Variables }
  ASyn.g  :=g  ;
  ASyn.m  :=m  ;
  ASyn.U  :=U  ;
  ASyn.W  :=W  ;
  ASyn.eM :=eM ;
  ASyn.UeM:=UeM;
  ASyn.WeM:=WeM;
  ASyn.xD :=xD ;
end;

procedure TSynCurr.InitialConditions;
begin
    m:=0;
    eM:=0;    UeM:=0;   WeM:=0;
    xD:=1;
    U:=m/SP.alpha;  W:=m/SP.beta;
    if abs(SP.alpha-SP.beta)<0.001 then U:=m;
end;

function TSynCurr.Sigmoid(x :double) :double;
begin
  if SP.IfApplySigmoidToAxonRate=1 then Sigmoid:=2/(1+dexp(-2*x))-1
                                   else Sigmoid:=x;
end;

procedure TSynCurr.Integrate(dt :double);
var
  quant,mediator,c1,al,be,sc,tau_,nu_ :double;
begin
  nu_:=SP.pAxonRate^;
  quant:=0.001 {s};
  mediator:=Sigmoid(nu_ *quant)*(1-SP.IfBlock);                                 // number of excited synapses
  if SP.If_Saturates=1 then mediator:=mediator*(1-m);                           // number of synapses is finite
  { Extrasynaptic effects: kinetics depends on stimulus [B.Morales et al. 2002]
                           or mediator is accumulated and opens channels. }
  c1:=1;
  if SP.factor>0 then begin
        { Integrates extracellular mediator into 'ExtraMediat'. }
        al:=Form4.DDSpinEdit90.Value; {Hz}; be:=SP.beta;//5000 {Hz}; // changed on 6.02.2017
        //sc:=Max_K(al,be)*quant;
        sc:=1;                          { added on 31.01.2017 }
        New_m(1,al,be,dt,mediator/sc, eM,UeM,WeM);  // it was 1 instead of 0 before 31.01.2017
        { Extrasynaptic mediator changes synaptic kinetics }
        //c1:=1 + eM *SP.factor;       { commented on 31.01.2017 }
        { Extrasynaptic mediator affects similar to synaptic mediator }
        //mediator:=mediator+eM*SP.factor;
  end;
  {* Non-dimensional conductance m ******************************************}
  New_m2(SP.IfInSyn_al_EQ_beta,SP.alpha/c1,SP.beta/c1,dt,mediator/quant, m,U);  // m accounts kinetics
  {**************************************************************************}
  {* Synaptic depression: dx/dt=(1-x)/tau - U*x*nu(t) [Loebel,Tsodyks 2002] *}
  {             or        dx/dt=(1-x)/tau - U*x*Sigm(nu(t)*quant)*(1-m)      }
  {  where      1/tau=Sigm(V)     [Zhou_JNsc2014_EAAT2_uptake_exchange.pdf]  }
  {             or 1/tau=Sigm(nu)                                            }
  tau_:=SP.tau_Depr;
  if SP.nu_thr_Depr<>0 then tau_:=SP.tau_Depr*dexp(nu_/SP.nu_thr_Depr);
  if SP.U_Depr>0 then  New_m5(tau_,dt, SP.U_Depr*nu_, xD);
  if SP.U_Depr>0 then  xD:=max(0,min(xD,1));
  {**************************************************************************}
  g:=SP.gmax*(m+eM*SP.factor)*xD;                   // 6.02.2017
end;

end.
