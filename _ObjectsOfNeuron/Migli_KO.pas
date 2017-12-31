unit Migli_KO;

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TMigliK = class(TChannel)
  private
//    oN :TNeuron;
    procedure tau_inf(v2 :double; var tau_n,n_inf :double);
  public
//    V,gK,VKDr,nn,yK,dt :double;
//    IfBlockK :integer;
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TMigliK.Create(nrn: TNeuron);
begin      inherited Create; oN:=nrn;    end;

{---------------- K  -----------------}
procedure TMigliK.tau_inf(v2 :double; var tau_n,n_inf :double);
var a,b :double;
begin
  a:= dexp(-0.11*(v2-13));
  b:= dexp(-0.08*(v2-13));
  tau_n:= 50*b / (1 + a);
  if tau_n<2 then  tau_n:=2;
  n_inf:= 1 / (1 + a);
end;

function TMigliK.Conductance(x,y,z :double):double;
begin
  Conductance :=x*(1-oN.NP.IfBlockK);
end;

function TMigliK.Current:double;
var  v2,tau_n,n_inf,tau_yK,yK_inf :double;
begin
  tau_inf(oN.NV.V*1000, tau_n,n_inf);
  oN.NV.nn:=oN.NV.nn+E_exp(dt,tau_n )*( n_inf-oN.NV.nn);
  Current :=oN.NP.gK*Conductance(oN.NV.nn,0,0)*(oN.NV.V-oN.NP.VKDr);
end;

procedure TMigliK.Init;
var  tau1,tau2 :double;
begin
  tau_inf (oN.NV.V*1000, tau1,oN.NV.nn);
end;

end.

