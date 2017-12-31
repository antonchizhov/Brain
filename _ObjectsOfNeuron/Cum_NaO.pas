unit Cum_NaO;

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TCumNa = class(TChannel)
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

constructor TCumNa.Create(nrn: TNeuron);
begin      inherited Create; oN:=nrn;    end;

{---------------- Na -----------------}
procedure TCumNa.tau_inf(v2:double; var tau_m,m_inf,tau_h,h_inf,tau_i,i_inf:double);
var v3,a,b :double;
begin
  v3:= v2 - oN.NP.NaThreshShift;
  tau_m:= 0.75*dexp(-sqr(0.0635*(v3+40.35)))+0.12;
  tau_h:= 6.5 *dexp(-sqr(0.0295*(v2+75)))   +0.55;
  tau_i:= 25/(1+dexp( (v2-20)   /4.5 )) + 0.01;
  m_inf:=  1/(1+dexp(-(v3+41.35)/4.75));
  h_inf:=  1/(1+dexp( (v2+62)   /4.5 ));
  i_inf:=  1/(1+dexp( (v2+40)   /1.5 ));
end;

function TCumNa.Conductance(x,y,z :double):double;
begin
  Conductance :=istep(x,3)*y*z*(1-oN.NP.IfBlockNa);
end;

function TCumNa.Current:double;
var  tau_m,m_inf,tau_h,h_inf,tau_i,i_inf :double;
begin
  tau_inf(oN.NV.V*1000, tau_m,m_inf,tau_h,h_inf,tau_i,i_inf);
  oN.NV.mm:=oN.NV.mm+E_exp(dt,tau_m )*( m_inf-oN.NV.mm);
  oN.NV.hh:=oN.NV.hh+E_exp(dt,tau_h )*( h_inf-oN.NV.hh);
  oN.NV.ii:=oN.NV.ii+E_exp(dt,tau_i )*( i_inf-oN.NV.ii);
  if oN.NP.IfReduced=1 then oN.NV.mm:=m_inf;
  Current :=oN.NP.gNa*Conductance(oN.NV.mm,oN.NV.hh,oN.NV.ii)*(oN.NV.V-oN.NP.VNa);
end;

procedure TCumNa.Init;
var  tau1,tau2,tau3 :double;
begin
  tau_inf(oN.NV.V*1000, tau1,oN.NV.mm,tau2,oN.NV.hh,tau3,oN.NV.ii);
end;

end.

