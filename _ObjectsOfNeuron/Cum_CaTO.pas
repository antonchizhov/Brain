unit Cum_CaTO;

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TCumCaT = class(TChannel)
  private
//    oN :TNeuron;
    procedure tau_inf(v2:double; var tau_m,m_inf,tau_h,h_inf :double);
  public
//    V,gCaT,mCaT,hCaT,dt :double;
//    IfBlockCaT :integer;
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TCumCaT.Create(nrn: TNeuron);
begin      inherited Create; oN:=nrn;    end;

procedure TCumCaT.tau_inf(v2:double; var tau_m,m_inf,tau_h,h_inf :double);
var a,b :double;
begin
  tau_m:= 22*dexp(-sqr(0.052*(v2+68))) +  2.5;
  tau_h:=103*dexp(-sqr(0.050*(v2+58))) + 12.5;
  m_inf:= 1 / (1+dexp(-(v2+54)/5.75));
  h_inf:= 1 / (1+dexp( (v2+68)/6));
end;

function TCumCaT.Conductance(x,y,z :double):double;
begin
  Conductance :=x*y*(1-oN.NP.IfBlockCaT);
end;

function TCumCaT.Current:double;
var  tau_m,m_inf,tau_h,h_inf :double;
begin
  tau_inf(oN.NV.V*1000, tau_m,m_inf,tau_h,h_inf);
  oN.NV.mCaT:=oN.NV.mCaT+E_exp(dt,tau_m )*( m_inf-oN.NV.mCaT);
  oN.NV.hCaT:=oN.NV.hCaT+E_exp(dt,tau_h )*( h_inf-oN.NV.hCaT);
  Current :=oN.NP.gCaT*Conductance(oN.NV.mCaT,oN.NV.hCaT,0)*(oN.NV.V-0.120);
end;

procedure TCumCaT.Init;
var  tau1,tau2 :double;
begin
  tau_inf(oN.NV.V*1000, tau1,oN.NV.mCaT,tau2,oN.NV.hCaT);
end;

end.

