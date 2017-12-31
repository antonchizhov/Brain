unit Naundorf_KO;

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TNaundorfK = class(TChannel)
  private
    procedure tau_inf(v2 :double; var tau_n,n_inf :double);
  public
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TNaundorfK.Create(nrn: TNeuron);
begin inherited Create; oN:=nrn; end;


procedure TNaundorfK.tau_inf(v2 :double; var tau_n,n_inf :double);
var a,b :double;
begin
  { [Wang-Buzsaki "Gamma Oscillation by Synaptic Inhibition in
  a Hippocampal Interneuronal Network Model", J. Neurosci. 16:6402-6413, 1996.]
  from [Huang's thesis] }
  a:=0.05*(v2+34)/(1-dexp(-(v2+34)/10));
  b:=0.625*dexp(-(v2+44)/80);
  tau_n:= 1/(a+b);
  n_inf:= a/(a+b);
end;

function TNaundorfK.Conductance(x,y,z :double):double;
begin
  Conductance:=istep(x,4)*(1-oN.NP.IfBlockK);
end;

function TNaundorfK.Current :double;
var  v2,tau_n,n_inf,n_exp,n4 :double;
begin
  tau_inf(oN.NV.V*1000, tau_n,n_inf);
  n_exp:= 1 - dexp(-dt*1000/tau_n);
  oN.NV.nn:=oN.NV.nn+n_exp*(n_inf-oN.NV.nn);
  Current :=oN.NP.gK*Conductance(oN.NV.nn,0,0)*(oN.NV.V-oN.NP.VK);
end;

procedure TNaundorfK.Init;
var  tau1,tau2 :double;
begin
  tau_inf(oN.NV.V*1000, tau1,oN.NV.nn);
end;

end.
 