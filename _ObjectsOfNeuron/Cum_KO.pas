unit Cum_KO;

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TCumK = class(TChannel)
  private
//    oN :TNeuron;
    procedure tau_inf(v2 :double; var tau_n,n_inf :double);
  public
//    V,gK,VKDr,FRT,nn,yK,dt :double;
//    IfBlockK :integer;
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TCumK.Create(nrn: TNeuron);
begin      inherited Create; oN:=nrn;    end;

{---------------- K - DR -----------------}
procedure TCumK.tau_inf(v2 :double; var tau_n,n_inf :double);
var a,b :double;
begin
  a:= 0.001265*(v2+14.273)/(1-dexp(-(v2+14.273)/10));
  b:= 0.125*dexp(-(v2+55)/2.5);
  tau_n:= 1 / (a + b) + 1;
  n_inf:= 1/(1+dexp(-(v2+14.62)/18.38));
end;

function TCumK.Conductance(x,y,z :double):double;
begin
  Conductance :=x*(1-oN.NP.IfBlockK);
end;

function TCumK.Current:double;
var  v2,tau_n,n_inf,tau_yK,yK_inf :double;
begin
  tau_inf(oN.NV.V*1000, tau_n,n_inf);
  oN.NV.nn:=oN.NV.nn+E_exp(dt,tau_n )*( n_inf-oN.NV.nn);
  Current :=oN.NP.gK*Conductance(oN.NV.nn,0,0)*(oN.NV.V-oN.NP.VKDr);
end;

procedure TCumK.Init;
var  tau1,tau2 :double;
begin
  tau_inf (oN.NV.V*1000, tau1,oN.NV.nn);
end;

end.

