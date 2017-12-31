unit DynThrO;

interface
uses t_dtO,MathMyO,typeNrnParsO,ChannelO;

type
  TDynThr = class
  private
  public
    VT,VT0,VT0_Vrest,hh,ii :double;
    function Evolve(v2,dvdt,g_tot,g_tot_max_ :double):double;
    procedure ConditionAtSpike;
    procedure Init(NP_:NeuronProperties);

    constructor Create;
  end;

implementation

constructor TDynThr.Create;
begin      inherited Create; end;

function TDynThr.Evolve(v2,dvdt,g_tot,g_tot_max_ :double):double;
var  tau,a,b,tau_h,h_inf,i_inf,tau_i :double;
begin
  { Eq. for 'h' from Shu }
  {a:= 0.024 * vtrap(-(v2+50), 5);
  b:= 0.0091* vtrap( (v2+75), 5);
  tau_h:= 1 / (a + b);
  h_inf:= 1 / (1 + dexp((v2+72)/(6.2)));}

  tau_h:= 0.6/(1+dexp(-0.12*(v2+67)));
  h_inf:=   1/(1+dexp( 0.13*(v2+38)));
  { Slow inactivation }
  {[Fernandez, White 2010]}
  tau_i:= 100{200};
  i_inf:=    1/(1+dexp( 0.5 *(v2+52)));
  hh:=hh+E_exp(dt,tau_h)*(h_inf-hh);
  ii:=ii+E_exp(dt,tau_i)*(i_inf-ii);
//  tau:=200{ms}/(1+dexp(-(v2+52{mV})/1{mV}));  {ms}
  //tau:=100{ms}*dexp(-sqr(v2+45{mV})/10{mV})+1;   {ms}
  if dvdt<=0 then tau:=1
             else tau:=100;
  VT:=VT + E_exp(dt,tau)*(v2+VT0_Vrest-VT);     {mV}


  //VT:= -55 + 20*(1-hh{*ii*ii*ii}); {mV}
  //VT:=-55; if hh<0.9 then VT:=0;
  VT:=-55; if g_tot>g_tot_max_ then VT:=0;
  Evolve:=VT/1000;                              {V}
end;

procedure TDynThr.ConditionAtSpike;
begin
  VT:=VT + 20{mV};   {30}                           {mV}
  hh:=0;
end;

procedure TDynThr.Init(NP_:NeuronProperties);
begin
  hh:=1;
  ii:=1;
  VT0_Vrest:=5;  {4}
  VT0:=(NP_.Vrest+0.010{V}+NP_.ThrShift)*1000;     {mV}
  VT:=VT0;   {V}
end;

end.
