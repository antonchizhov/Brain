unit Fleid_NaO;
{ Approximation of Na channels according to [Fleidervish, Friedman, Gutnick 1996] }

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TFleidNa = class(TChannel)
  private
//    phi_T :double;
    procedure tau_inf(v2:double; var tau_m,m_inf,tau_h,h_inf,tau_i,i_inf:double);
  public
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TFleidNa.Create(nrn: TNeuron);
begin      inherited Create; oN:=nrn;    end;

{---------------- Na -----------------}
procedure TFleidNa.tau_inf(v2:double; var tau_m,m_inf,tau_h,h_inf,tau_i,i_inf:double);
var v3,a,b :double;
begin
  v3:= v2 - oN.NP.NaThreshShift;
  { Eq. for 'm' }
  a:= 0.091 * vtrap(-(v3+40), 5);
  b:= 0.062 * vtrap( (v3+40), 5);
  tau_m:= 1 / (a + b) / oN.NP.phi_T;
  m_inf:= a / (a + b);
  { Eq. for 'h' }
  a:= 0.06 * dexp(-(v3+55)/15);
  b:= 6.01 /(dexp(-(v3-17)/21) + 1);   { it is -17 in the paper }
  tau_h:= 1 / (a + b) / oN.NP.phi_T;
  h_inf:= a / (a + b);
  { Eq. for 'i' }
  a:= 0.001 * dexp(-(v3+85)/30);
  b:= 0.0034/(dexp(-(v3+17)/10) + 1);
  tau_i:= 1 / (a + b) / oN.NP.phi_T;
  i_inf:= a / (a + b);
  if oN.NP.If_Slow_Na_inactivation<>1 then i_inf:=1;
end;

function TFleidNa.Conductance(x,y,z :double):double;
begin
  Conductance :=istep(x,3)*y*z*(1-oN.NP.IfBlockNa);
end;

function TFleidNa.Current:double;
var  tau_m,m_inf,tau_h,h_inf,tau_i,i_inf :double;
begin
  tau_inf(oN.NV.V*1000, tau_m,m_inf,tau_h,h_inf,tau_i,i_inf);
  oN.NV.mm:=oN.NV.mm+E_exp(dt,tau_m )*( m_inf-oN.NV.mm);
  oN.NV.hh:=oN.NV.hh+E_exp(dt,tau_h )*( h_inf-oN.NV.hh);
  oN.NV.ii:=oN.NV.ii+E_exp(dt,tau_i )*( i_inf-oN.NV.ii);
  if oN.NP.IfReduced=1 then oN.NV.mm:=m_inf;
  Current :=oN.NP.gNa*Conductance(oN.NV.mm,oN.NV.hh,oN.NV.ii)*(oN.NV.V-oN.NP.VNa);
end;

procedure TFleidNa.Init;
var  tau1,tau2,tau3 :double;
begin
  oN.NP.phi_T:=step(2.3,(oN.NP.Temperature-273-23)/10);
  tau_inf(oN.NV.V*1000, tau1,oN.NV.mm,tau2,oN.NV.hh,tau3,oN.NV.ii);
end;

end.

