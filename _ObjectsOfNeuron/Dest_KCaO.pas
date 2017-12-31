unit Dest_KCaO;

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TDestexheKCa = class(TChannel)
  private
//    oN :TNeuron;
    procedure tau_inf(v2 :double; var tau_n,n_inf :double);
  public
//    V,Ca,gKCa,VK,nKCa,dt :double;
//    IfBlockKCa :integer;
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TDestexheKCa.Create(nrn: TNeuron);
begin      inherited Create; oN:=nrn;    end;

{---------------- KCa  -----------------}
procedure TDestexheKCa.tau_inf(v2 :double; var tau_n,n_inf :double);
var a,b :double;
begin
  a := 2000 {1/mM^2/ms} * sqr(oN.NV.Ca);
  b := 0.002 {1/ms};
  tau_n:= 1 / (a + b);
  n_inf:= a / (a + b);
end;

function TDestexheKCa.Conductance(x,y,z :double):double;
begin
  Conductance :=sqr(x)*(1-oN.NP.IfBlockKCa);
end;

function TDestexheKCa.Current:double;
var  v2,tau_n,n_inf,tau_yKCa,yKCa_inf :double;
begin
  tau_inf(oN.NV.V*1000, tau_n,n_inf);
  oN.NV.nKCa:=oN.NV.nKCa+E_exp(dt,tau_n )*( n_inf-oN.NV.nKCa);
  Current :=oN.NP.gKCa*Conductance(oN.NV.nKCa,0,0)*(oN.NV.V-oN.NP.VK);
end;

procedure TDestexheKCa.Init;
var  tau1,tau2 :double;
begin
  tau_inf (oN.NV.V*1000, tau1,oN.NV.nKCa);
end;

end.

