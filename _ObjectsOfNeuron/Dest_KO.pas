unit Dest_KO;

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TDestexheK = class(TChannel)
  private
//    oN :TNeuron;
    procedure tau_inf(v2 :double; var tau_n,n_inf :double);
  public
//    V,gK,VK,Tr,nn,dt :double;
//    IfBlockK :integer;
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TDestexheK.Create(nrn: TNeuron);
begin      inherited Create; oN:=nrn;    end;

{---------------- K  -----------------}
procedure TDestexheK.tau_inf(v2 :double; var tau_n,n_inf :double);
var v3,a,b :double;
begin
  v3:= v2 - oN.NP.Tr;
     a:= 0.032 * vtrap(15-v3, 5);
     b:= 0.5 * dexp((10-v3)/40);
  tau_n:= 1 / (a + b);
  n_inf:= a / (a + b);
end;

function TDestexheK.Conductance(x,y,z :double):double;
begin
  Conductance :=x*x*x*x*(1-oN.NP.IfBlockK);
end;

function TDestexheK.Current:double;
var  v2,tau_n,n_inf,tau_yK,yK_inf :double;
begin
  tau_inf(oN.NV.V*1000, tau_n,n_inf);
  oN.NV.nn:=oN.NV.nn+E_exp(dt,tau_n )*( n_inf-oN.NV.nn);
  Current :=oN.NP.gK*Conductance(oN.NV.nn,0,0)*(oN.NV.V-oN.NP.VK);
end;

procedure TDestexheK.Init;
var  tau1,tau2 :double;
begin
  tau_inf (oN.NV.V*1000, tau1,oN.NV.nn);
end;

end.

