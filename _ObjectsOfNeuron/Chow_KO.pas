unit Chow_KO;

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TChowK = class(TChannel)
  private
//    oN :TNeuron;
    procedure tau_inf(v2 :double; var tau_n,n_inf :double);
  public
//    V,gK,VKDr,nn,dt :double;
//    IfBlockK :integer;
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TChowK.Create(nrn: TNeuron);
begin inherited Create; oN:=nrn; end;


procedure TChowK.tau_inf(v2 :double; var tau_n,n_inf :double);
begin
  tau_n:= (0.5 + 2.0/(1+dexp(0.045*(v2-50))));   // !!!!Znak-OK!
  n_inf:= 1/(1+dexp(-0.045*(v2+10)));
end;

function TChowK.Conductance(x,y,z :double):double;
begin
  Conductance:=istep(x,4)*(1-oN.NP.IfBlockK);
end;

function TChowK.Current :double;
var  v2,tau_n,n_inf,n_exp,n4 :double;
begin
  tau_inf(oN.NV.V*1000, tau_n,n_inf);
  n_exp:= 1 - dexp(-dt*1000/tau_n);
  oN.NV.nn:=oN.NV.nn+n_exp*(n_inf-oN.NV.nn);
  Current :=oN.NP.gK*Conductance(oN.NV.nn,0,0)*(oN.NV.V-oN.NP.VK);
end;

procedure TChowK.Init;
var  tau1,tau2 :double;
begin
  tau_inf(oN.NV.V*1000, tau1,oN.NV.nn);
end;

end.
 