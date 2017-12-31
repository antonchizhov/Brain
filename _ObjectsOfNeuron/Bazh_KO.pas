unit Bazh_KO;
{ Approximation of K(V) channels according to [Krishnan, Bazhenov 2011] }

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TBazhK = class(TChannel)
  private
//    phi_T :double;
    procedure tau_inf(v2 :double; var tau_n,n_inf :double);
  public
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TBazhK.Create(nrn: TNeuron);
begin inherited Create; oN:=nrn; end;

procedure TBazhK.tau_inf(v2 :double; var tau_n,n_inf :double);
var a,b :double;
begin
  a:= 0.02  * vtrap(-(v2-22.8), 9);
  b:= 0.002 * vtrap( (v2-22.8), 9);
  tau_n:=   1 / (a + b) / oN.NP.phi_T;
  n_inf:=   a / (a + b);
end;

function TBazhK.Conductance(x,y,z :double):double;
begin
  Conductance:=oN.NP.phi_T*x*(1-oN.NP.IfBlockK);
end;

function TBazhK.Current :double;
var  v2,tau_n,n_inf,n_exp,n4 :double;
begin
  tau_inf(oN.NV.V*1000, tau_n,n_inf);
  n_exp:= 1 - dexp(-dt*1000/tau_n);
  oN.NV.nn:=oN.NV.nn+n_exp*(n_inf-oN.NV.nn);
  Current :=oN.NP.gK*Conductance(oN.NV.nn,0,0)*(oN.NV.V-oN.NP.VK);
end;

procedure TBazhK.Init;
var  tau1,tau2 :double;
begin
  oN.NP.phi_T:=step(2.3,(oN.NP.Temperature-273-23)/10);
  tau_inf(oN.NV.V*1000, tau1,oN.NV.nn);
end;

end.
