unit Cum_CaHO;

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TCumCaH = class(TChannel)
  private
//    oN :TNeuron;
    procedure tau_inf(v2:double; var tau_m,m_inf,tau_h,h_inf,tau_k,k_inf:double);
  public
//    V,gCaH,mCaH,hCaH,kCaH,dt :double;
//    IfBlockCaH :integer;
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TCumCaH.Create(nrn: TNeuron);
begin      inherited Create; oN:=nrn;    end;

{---------------- CaH -----------------}
procedure TCumCaH.tau_inf(v2:double; var tau_m,m_inf,tau_h,h_inf,tau_k,k_inf:double);
var v3,a,b :double;
begin
  tau_m:=3.25*dexp(-sqr(0.042 *(v2+31))) +  0.395;
  tau_h:=33.5*dexp(-sqr(0.0395*(v2+30))) +  5;
  tau_k:=225 *dexp(-sqr(0.0275*(v2+40))) + 75;
  m_inf:= 1 / (1+dexp(-(v2+20)/4.5));
  h_inf:= 1 / (1+dexp( (v2+20)/25));
  k_inf:= 1 / (1+dexp( (v2+40)/10)) + 0.2/(1+dexp(-(v2+5)/10));
end;

function TCumCaH.Conductance(x,y,z :double):double;
begin
  Conductance :=x*y*z*(1-oN.NP.IfBlockCaH);
end;

function TCumCaH.Current:double;
var  tau_m,m_inf,tau_h,h_inf,tau_k,k_inf :double;
begin
  tau_inf(oN.NV.V*1000, tau_m,m_inf,tau_h,h_inf,tau_k,k_inf);
  oN.NV.mCaH:=oN.NV.mCaH+E_exp(dt,tau_m )*( m_inf-oN.NV.mCaH);
  oN.NV.hCaH:=oN.NV.hCaH+E_exp(dt,tau_h )*( h_inf-oN.NV.hCaH);
  oN.NV.kCaH:=oN.NV.kCaH+E_exp(dt,tau_k )*( k_inf-oN.NV.kCaH);
  Current :=oN.NP.gCaH*Conductance(oN.NV.mCaH,oN.NV.hCaH,oN.NV.kCaH)*(oN.NV.V-0.120);
end;

procedure TCumCaH.Init;
var  tau1,tau2,tau3 :double;
begin
  tau_inf(oN.NV.V*1000, tau1,oN.NV.mCaH,tau2,oN.NV.hCaH,tau3,oN.NV.kCaH);
end;

end.

