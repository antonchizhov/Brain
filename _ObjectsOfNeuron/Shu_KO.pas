unit Shu_KO;

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TShuK = class(TChannel)
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

constructor TShuK.Create(nrn: TNeuron);
begin inherited Create; oN:=nrn; end;

procedure TShuK.tau_inf(v2 :double; var tau_n,n_inf :double);
var a,b :double;
begin
  a:= 0.02  * vtrap(-(v2-25), 9);    //It was +25 before Feb2013
  b:= 0.002 * vtrap( (v2-25), 9);    //It was +25 before Feb2013
  tau_n:=   1 / (a + b) / oN.NP.phi_T;
  n_inf:=   a / (a + b);
end;

function TShuK.Conductance(x,y,z :double):double;
begin
  Conductance:=oN.NP.phi_T*x*(1-oN.NP.IfBlockK);  // phi_T was absent before Jan.2014
end;

function TShuK.Current :double;
var  v2,tau_n,n_inf,n_exp,n4 :double;
begin
  tau_inf(oN.NV.V*1000, tau_n,n_inf);
  n_exp:= 1 - dexp(-dt*1000/tau_n);
  oN.NV.nn:=oN.NV.nn+n_exp*(n_inf-oN.NV.nn);
  Current :=oN.NP.gK*Conductance(oN.NV.nn,0,0)*(oN.NV.V-oN.NP.VK);
end;

procedure TShuK.Init;
var  tau1,tau2 :double;
begin
  oN.NP.phi_T:=step(2.3,(oN.NP.Temperature-273-23)/10);
  tau_inf(oN.NV.V*1000, tau1,oN.NV.nn);
end;

end.
