unit LyleMS_NaO;
{ Approximation of Na-trig channels according to [Lyle, MS thesis, 1989] }

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TLyleMSNa = class(TChannel)
  private
    procedure tau_inf(v2 :double; var tau_m,m_inf,tau_h,h_inf :double);
  public
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TLyleMSNa.Create(nrn: TNeuron);
begin      inherited Create; oN:=nrn;    end;

{---------------- Na -----------------}
procedure TLyleMSNa.tau_inf(v2:double; var tau_m,m_inf,tau_h,h_inf :double);
var v3,a,b,bi :double;
begin
  v3:= v2 - oN.NP.NaThreshShift;
  { Eq. for 'm' }
  a:= 0.3*dexp( (v3+47)*0.5*20*oN.NP.FRT);
  b:= 0.3*dexp(-(v3+47)*0.5*20*oN.NP.FRT);
  tau_m:= 1 / (a + b);   tau_m:=max(tau_m,0.5);
  m_inf:= a / (a + b);
  { Eq. for 'h' }
  a:= 0.01*dexp( (v3+61)*0.3*(-30)*oN.NP.FRT);
  b:= 0.01*dexp(-(v3+61)*0.7*(-30)*oN.NP.FRT);
  tau_h:= 1 / (a + b);   tau_h:=max(tau_h,2.0);
  h_inf:= a / (a + b);
end;

function TLyleMSNa.Conductance(x,y,z :double):double;
begin
  Conductance :=x*y*y*(1-oN.NP.IfBlockNa);
end;

function TLyleMSNa.Current:double;
var  tau_m,m_inf,tau_h,h_inf,tau_i,i_inf :double;
begin
  tau_inf(oN.NV.V*1000, tau_m,m_inf,tau_h,h_inf);
  oN.NV.mm:=oN.NV.mm+E_exp(dt,tau_m )*( m_inf-oN.NV.mm);
  oN.NV.hh:=oN.NV.hh+E_exp(dt,tau_h )*( h_inf-oN.NV.hh);
  if oN.NP.IfReduced=1 then oN.NV.mm:=m_inf;
  Current :=oN.NP.gNa*Conductance(oN.NV.mm,oN.NV.hh,0)*(oN.NV.V-oN.NP.VNa);
end;

procedure TLyleMSNa.Init;
var  tau1,tau2,tau3 :double;
begin
  tau_inf(oN.NV.V*1000, tau1,oN.NV.mm,tau2,oN.NV.hh);
end;

end.

