unit LyleMS_NaRO;
{ Approximation of Na-rep channels according to [Lyle, MS thesis, 1989] }

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TLyleMSNaR = class(TChannel)
  private
    procedure tau_inf(v2 :double; var tau_m,m_inf,tau_h,h_inf :double);
  public
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TLyleMSNaR.Create(nrn: TNeuron);
begin      inherited Create; oN:=nrn;    end;

{---------------- NaR -----------------}
procedure TLyleMSNaR.tau_inf(v2:double; var tau_m,m_inf,tau_h,h_inf :double);
var v3,a,b,bi :double;
begin
  v3:= v2 - oN.NP.NaThreshShift;
  { Eq. for 'm' }
  a:= 0.67*dexp( (v3+34)*0.5*6*oN.NP.FRT);
  b:= 0.67*dexp(-(v3+34)*0.5*6*oN.NP.FRT);
  tau_m:= 1 / (a + b);   tau_m:=max(tau_m,5.0);
  m_inf:= a / (a + b);
  { Eq. for 'h' }
  a:= 0.0023*dexp( (v3+42.5)*0.17*(-30)*oN.NP.FRT);
  b:= 0.0023*dexp(-(v3+42.5)*0.83*(-30)*oN.NP.FRT);
  tau_h:= 1 / (a + b);   tau_h:=max(tau_h,3.0);
  h_inf:= a / (a + b);
end;

function TLyleMSNaR.Conductance(x,y,z :double):double;
begin
  Conductance :=x*x*y*y*y*(1-oN.NP.IfBlockNaR);
end;

function TLyleMSNaR.Current:double;
var  tau_m,m_inf,tau_h,h_inf,tau_i,i_inf :double;
begin
  tau_inf(oN.NV.V*1000, tau_m,m_inf,tau_h,h_inf);
  oN.NV.mmR:=oN.NV.mmR+E_exp(dt,tau_m)*(m_inf-oN.NV.mmR);
  oN.NV.hhR:=oN.NV.hhR+E_exp(dt,tau_h)*(h_inf-oN.NV.hhR);
  if oN.NP.IfReduced=1 then oN.NV.mmR:=m_inf;
  Current:=oN.NP.gNaR*Conductance(oN.NV.mmR,oN.NV.hhR,0)*(oN.NV.V-oN.NP.VNa);
end;

procedure TLyleMSNaR.Init;
var  tau1,tau2,tau3 :double;
begin
  tau_inf(oN.NV.V*1000, tau1,oN.NV.mmR,tau2,oN.NV.hhR);
end;

end.

