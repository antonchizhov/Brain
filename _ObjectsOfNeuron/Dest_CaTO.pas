unit Dest_CaTO;
{ Approximation of transient Ca2+ current from [Dayan,Abbott, p. 225] }

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TDestexheCaT = class(TChannel)
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

constructor TDestexheCaT.Create(nrn: TNeuron);
begin      inherited Create; oN:=nrn;    end;

procedure TDestexheCaT.tau_inf(v2:double; var tau_m,m_inf,tau_h,h_inf :double);
var a,b :double;
begin
  tau_m:= 0.612+1/(dexp(-(v2+132)/16.7)+dexp((v2+16.8)/18.2));
  if v2<-80 then  tau_h:=dexp((v2+467)/66.6)
            else  tau_h:=28+dexp(-(v2+22)/10.5);
  m_inf:= 1 / (1+dexp(-(v2+57)/6.2));
  h_inf:= 1 / (1+dexp( (v2+81)/4));
end;

function TDestexheCaT.Conductance(x,y,z :double):double;
begin
  Conductance :=x*x*y*(1-oN.NP.IfBlockCaT);
end;

function TDestexheCaT.Current:double;
var  tau_m,m_inf,tau_h,h_inf :double;
begin
  tau_inf(oN.NV.V*1000, tau_m,m_inf,tau_h,h_inf);
  oN.NV.mCaT:=oN.NV.mCaT+E_exp(dt,tau_m )*( m_inf-oN.NV.mCaT);
  oN.NV.hCaT:=oN.NV.hCaT+E_exp(dt,tau_h )*( h_inf-oN.NV.hCaT);
  Current :=oN.NP.gCaT*Conductance(oN.NV.mCaT,oN.NV.hCaT,0)*(oN.NV.V-0.120);
end;

procedure TDestexheCaT.Init;
var  tau1,tau2 :double;
begin
  tau_inf(oN.NV.V*1000, tau1,oN.NV.mCaT,tau2,oN.NV.hCaT);
end;

end.

