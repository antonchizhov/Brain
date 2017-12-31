unit Shu_NaRO;
{ Approximation of Na(V)1.6 channels according to [Hu,Tian,Yang,Hou,Shu 2009] }

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TShuNaR = class(TChannel)
  private
//    phi_T :double;
    procedure tau_inf(v2 :double; var tau_m,m_inf,tau_h,h_inf :double);
  public
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TShuNaR.Create(nrn: TNeuron);
begin      inherited Create; oN:=nrn;    end;

{---------------- Na -----------------}
procedure TShuNaR.tau_inf(v2:double; var tau_m,m_inf,tau_h,h_inf :double);
var v3,a,b,bi :double;
begin
  v3:= v2 - 5{mV} {- oN.NP.NaThreshShift};
  { Eq. for 'm' }
  a:= 0.182 * vtrap(-(v3+43), 7);
  b:= 0.124 * vtrap( (v3+43), 7);
  tau_m:= 1 / (a + b) / oN.NP.phi_T;
  m_inf:= a / (a + b);
  { Eq. for 'h' }
  a:= 0.024 * vtrap(-(v3+50), 5);
  b:= 0.0091* vtrap( (v3+75), 5);
  tau_h:= 1 / (a + b) / oN.NP.phi_T;
  h_inf:= 1 / (1 + dexp((v3+72)/(6.2)));
end;

function TShuNaR.Conductance(x,y,z :double):double;
begin
  Conductance :=istep(x,3)*y*(1-oN.NP.IfBlockNaR);
end;

function TShuNaR.Current:double;
var  tau_m,m_inf,tau_h,h_inf,tau_i,i_inf :double;
begin
  tau_inf(oN.NV.V*1000, tau_m,m_inf,tau_h,h_inf);
  oN.NV.mmR:=oN.NV.mmR+E_exp(dt,tau_m )*( m_inf-oN.NV.mmR);
  oN.NV.hhR:=oN.NV.hhR+E_exp(dt,tau_h )*( h_inf-oN.NV.hhR);
  if oN.NP.IfReduced=1 then oN.NV.mmR:=m_inf;
  Current :=oN.NP.gNaR*Conductance(oN.NV.mmR,oN.NV.hhR,0)*(oN.NV.V-oN.NP.VNa);
end;

procedure TShuNaR.Init;
var  tau1,tau2,tau3 :double;
begin
  oN.NP.phi_T:=step(2.3,(oN.NP.Temperature-273-23)/10);
  tau_inf(oN.NV.V*1000, tau1,oN.NV.mmR,tau2,oN.NV.hhR);
end;

end.

