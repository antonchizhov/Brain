unit Lyle_KAO;

interface
uses NeuronO,t_dtO,ChannelO,MathMyO;

type
  TLyleKA = class(TChannel)
  private
//    oN :TNeuron;
    procedure tau_inf_KA_Lyle(v2 :double; var tau_n,n_inf,tau_l,l_inf :double);
  public
    bbb :double;
    Pbbb :^double;
//    V,gKA,VK,FRT,nA,lA,dt :double;
//    IfBlockKA :integer;
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TLyleKA.Create(nrn: TNeuron);
begin
  inherited Create; oN:=nrn;
end;

{---------------- KA -----------------}
procedure TLyleKA.tau_inf_KA_Lyle(v2 :double; var tau_n,n_inf,tau_l,l_inf :double);
var a,b :double;
begin
  { Eq. for 'nA' }
  a:=0.08*dexp( (v2+41)*0.85*2.8*oN.NP.FRT);
  b:=0.08*dexp(-(v2+41)*0.15*2.8*oN.NP.FRT);
  tau_n:= 1 / (a + b) + 1.0;
  n_inf:= a / (a + b);
  { Eq. for 'lA' }
  a:=0.04*dexp( (v2+49)*1*(-3)*oN.NP.FRT);
  b:=0.04;
  tau_l:= 1 / (a + b) + 2.0;
  l_inf:= a / (a + b);
end;

function TLyleKA.Conductance(x,y,z :double):double;
begin
  Conductance :=istep(x,4)*istep(y,3)*(1-oN.NP.IfBlockKA);
end;

function TLyleKA.Current:double;
var  tau_n,n_inf,tau_l,l_inf :double;
begin
  tau_inf_KA_Lyle(oN.NV.V*1000, tau_n,n_inf,tau_l,l_inf);
  oN.NV.nA:=oN.NV.nA+E_exp(dt,tau_n)*(n_inf-oN.NV.nA);
  oN.NV.lA:=oN.NV.lA+E_exp(dt,tau_l)*(l_inf-oN.NV.lA);
  Current :=oN.NP.gKA*Conductance(oN.NV.nA,oN.NV.lA,0)*(oN.NV.V-oN.NP.VK);              { Current }
end;

procedure TLyleKA.Init;
var  tau1,tau2 :double;
begin
  tau_inf_KA_Lyle(oN.NV.V*1000, tau1,oN.NV.nA,tau2,oN.NV.lA);
end;

end.
