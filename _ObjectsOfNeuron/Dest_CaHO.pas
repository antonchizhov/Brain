unit Dest_CaHO;
{ Approximation of high-threshold Ca2+ current from [Pare, Lang, Destexhe] }

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TDestexheCaH = class(TChannel)
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

constructor TDestexheCaH.Create(nrn: TNeuron);
begin      inherited Create; oN:=nrn;    end;

procedure TDestexheCaH.tau_inf(v2:double; var tau_m,m_inf,tau_h,h_inf :double);
var a,b :double;
begin
  { Eq. for 'm' }
//  a:=-0.055*(v2+27)/(dexp(-(v2+27)/3.8)-1);
  a:=-0.055*vtrap(v2+27,-3.8);
  b:= 0.94*dexp(-(v2+75)/17);
  tau_m:= 1 / (a + b);
  m_inf:= a / (a + b);
  { Eq. for 'h' }
  a:=0.000457*dexp(-(v2+13)/50);
  b:=0.0065/(1+dexp(-(v2+15)/28));
  tau_h:= 1 / (a + b);
  h_inf:= a / (a + b);
end;

function TDestexheCaH.Conductance(x,y,z :double):double;
begin
  Conductance :=x*x*y*(1-oN.NP.IfBlockCaH);
end;

function TDestexheCaH.Current:double;
var  tau_m,m_inf,tau_h,h_inf :double;
begin
  tau_inf(oN.NV.V*1000, tau_m,m_inf,tau_h,h_inf);
  oN.NV.mCaH:=oN.NV.mCaH+E_exp(dt,tau_m )*( m_inf-oN.NV.mCaH);
  oN.NV.hCaH:=oN.NV.hCaH+E_exp(dt,tau_h )*( h_inf-oN.NV.hCaH);
  Current :=oN.NP.gCaH*Conductance(oN.NV.mCaH,oN.NV.hCaH,0)*(oN.NV.V-0.120);
end;

procedure TDestexheCaH.Init;
var  tau1,tau2 :double;
begin
  tau_inf(oN.NV.V*1000, tau1,oN.NV.mCaH,tau2,oN.NV.hCaH);
end;

end.

