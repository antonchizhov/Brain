unit Dest_KMO;

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TDestexheKM = class(TChannel)
  private
//    oN :TNeuron;
    procedure tau_inf(v2 :double; var tau_n,n_inf :double);
  public
//    V,gKM,VKM,nM,dt :double;
//    IfBlockKM :integer;
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TDestexheKM.Create(nrn: TNeuron);
begin      inherited Create; oN:=nrn;    end;

{---------------- KM  -----------------}
procedure TDestexheKM.tau_inf(v2 :double; var tau_n,n_inf :double);
var a,b :double;
begin
  a:= 0.0001 * vtrap(-v2-30, 9);
  b:= 0.0001 * vtrap( v2+30, 9);
  tau_n:= 1 / (a + b);
  n_inf:= a / (a + b);
end;

function TDestexheKM.Conductance(x,y,z :double):double;
begin
  Conductance :=x*(1-oN.NP.IfBlockKM);
end;

function TDestexheKM.Current:double;
var  v2,tau_n,n_inf,tau_yKM,yKM_inf :double;
begin
  tau_inf(oN.NV.V*1000, tau_n,n_inf);
  oN.NV.nM:=oN.NV.nM+E_exp(dt,tau_n )*( n_inf-oN.NV.nM);
  Current :=oN.NP.gKM*Conductance(oN.NV.nM,0,0)*(oN.NV.V-oN.NP.VKM);
end;

procedure TDestexheKM.Init;
var  tau1,tau2 :double;
begin
  tau_inf (oN.NV.V*1000, tau1,oN.NV.nM);
end;

end.

