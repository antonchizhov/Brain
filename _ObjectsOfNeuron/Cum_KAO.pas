unit Cum_KAO;

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TCumKA = class(TChannel)
  private
//    oN :TNeuron;
    procedure tau_inf(v2:double; var tau_m,m_inf,tau_h,h_inf :double);
  public
//    V,gKA,VK,nA,lA,dt :double;
//    IfBlockKA :integer;
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TCumKA.Create(nrn: TNeuron);
begin      inherited Create; oN:=nrn;    end;

{---------------- KA -----------------}
procedure TCumKA.tau_inf(v2:double; var tau_m,m_inf,tau_h,h_inf :double);
var a,b :double;
begin
  tau_m:=   5*dexp(-sqr(0.022*(v2+65)))+ 2.5;
  tau_h:= 100*dexp(-sqr(0.035*(v2+30)))+10.5;
  m_inf:= 1/(1+dexp(-(v2+28)/28));
  h_inf:= 1/(1+dexp( (v2+58)/ 7));
end;

function TCumKA.Conductance(x,y,z :double):double;
begin
  Conductance :=istep(x,3)*y*(1-oN.NP.IfBlockKA);
end;

function TCumKA.Current:double;
var  tau_m,m_inf,tau_h,h_inf :double;
begin
  tau_inf(oN.NV.V*1000, tau_m,m_inf,tau_h,h_inf);
  oN.NV.nA:=oN.NV.nA+E_exp(dt,tau_m )*( m_inf-oN.NV.nA);
  oN.NV.lA:=oN.NV.lA+E_exp(dt,tau_h )*( h_inf-oN.NV.lA);
  Current :=oN.NP.gKA*Conductance(oN.NV.nA,oN.NV.lA,0)*(oN.NV.V-oN.NP.VK);
end;

procedure TCumKA.Init;
var  tau1,tau2 :double;
begin
  tau_inf(oN.NV.V*1000, tau1,oN.NV.nA,tau2,oN.NV.lA);
end;

end.

