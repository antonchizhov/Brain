unit Migli_NaO;

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TMigliNa = class(TChannel)
  private
//    oN :TNeuron;
    procedure tau_inf(v2:double; var tau_m,m_inf,tau_h,h_inf,tau_i,i_inf:double);
  public
//    V,gNa,VNa,NaThreshShift,mm,hh,ii,dt :double;
//    IfBlockNa,IfReduced :integer;
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TMigliNa.Create(nrn: TNeuron);
begin      inherited Create; oN:=nrn;    end;

{---------------- Na -----------------}
procedure TMigliNa.tau_inf(v2:double; var tau_m,m_inf,tau_h,h_inf,tau_i,i_inf:double);
var v3,a,b,bi :double;
begin
  v3:= v2 - oN.NP.NaThreshShift;
  { Eq. for 'm' }
  a:= 0.4   * vtrap(-(v3+30), 7.2);
  b:= 0.124 * vtrap( (v3+30), 7.2);
  tau_m:= 0.5 / (a + b);
  if tau_m<0.02 then  tau_m:=0.02;
  m_inf:=   a / (a + b);
  { Eq. for 'h' }
  a:= 0.03 * vtrap(-(v3+45), 1.5);
  b:= 0.01 * vtrap( (v3+45), 1.5);
  tau_h:= 0.5 / (a + b);
  if tau_h<0.5 then  tau_h:=0.5;
  h_inf:= 1 / (1 + dexp((v3+50)/4));
  { Eq. for 'i' }
  bi:=0.5;
  a:= dexp(0.45*(v3+60));
  b:= dexp(0.09*(v3+60));
  tau_i:= 3000*b / (1 + a);
  if tau_i<10 then  tau_i:=10;
  i_inf:= (1 + bi * dexp((v3+58)/2))/(1 + dexp((v3+58)/2));
  if oN.NP.If_Slow_Na_inactivation<>1 then i_inf:=1;
end;

function TMigliNa.Conductance(x,y,z :double):double;
begin
  Conductance :=istep(x,3)*y*z*(1-oN.NP.IfBlockNa);
end;

function TMigliNa.Current:double;
var  tau_m,m_inf,tau_h,h_inf,tau_i,i_inf :double;
begin
  tau_inf(oN.NV.V*1000, tau_m,m_inf,tau_h,h_inf,tau_i,i_inf);
  oN.NV.mm:=oN.NV.mm+E_exp(dt,tau_m )*( m_inf-oN.NV.mm);
  oN.NV.hh:=oN.NV.hh+E_exp(dt,tau_h )*( h_inf-oN.NV.hh);
  oN.NV.ii:=oN.NV.ii+E_exp(dt,tau_i )*( i_inf-oN.NV.ii);
  if oN.NP.IfReduced=1 then oN.NV.mm:=m_inf;
  Current :=oN.NP.gNa*Conductance(oN.NV.mm,oN.NV.hh,oN.NV.ii)*(oN.NV.V-oN.NP.VNa);
end;

procedure TMigliNa.Init;
var  tau1,tau2,tau3 :double;
begin
  tau_inf(oN.NV.V*1000, tau1,oN.NV.mm,tau2,oN.NV.hh,tau3,oN.NV.ii);
end;

end.

