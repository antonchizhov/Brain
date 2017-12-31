unit White_KO;

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TWhiteK = class(TChannel)
  private
    procedure tau_inf(v2 :double; var tau_n,n_inf :double);
  public
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TWhiteK.Create(nrn: TNeuron);
begin inherited Create; oN:=nrn; end;


procedure TWhiteK.tau_inf(v2 :double; var tau_n,n_inf :double);
var  tau_h,h_inf :double;
begin
  tau_h:= max(0.81/dexp(0.2*(v2+38)) - dexp(-1/3*(v2+52)) +0.24,0.24);
  h_inf:=    1/(1+dexp( 0.2*(v2+16)));
  tau_n:=tau_h;
  n_inf:=1-h_inf;
end;

function TWhiteK.Conductance(x,y,z :double):double;
begin
  Conductance:=x*(1-oN.NP.IfBlockK);
end;

function TWhiteK.Current :double;
var  v2,tau_n,n_inf,n_exp,n4 :double;
begin
  tau_inf(oN.NV.V*1000, tau_n,n_inf);
  n_exp:= 1 - dexp(-dt*1000/tau_n);
  oN.NV.nn:=oN.NV.nn+n_exp*(n_inf-oN.NV.nn);
  Current :=oN.NP.gK*Conductance(oN.NV.nn,0,0)*(oN.NV.V-oN.NP.VKDr);
end;

procedure TWhiteK.Init;
var  tau1,tau2 :double;
begin
  tau_inf(oN.NV.V*1000, tau1,oN.NV.nn);
end;

end.
