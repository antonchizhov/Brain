unit KepecsWang_KCaO;

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TKepecsKCa = class(TChannel)
  private
//    oN :TNeuron;
    procedure tau_inf(v2 :double; var tau_n,n_inf :double);
  public
//    V,gKCa,VK,nKCa,dt :double;
//    IfBlockKCa :integer;
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TKepecsKCa.Create(nrn: TNeuron);
begin      inherited Create; oN:=nrn;    end;

{---------------- KCa  -----------------}
procedure TKepecsKCa.tau_inf(v2 :double; var tau_n,n_inf :double);
var a,b :double;
begin
  { from [Kepecs,Wang]: }
  n_inf:=1/(1+dexp(-(v2+35)/6.5));
  tau_n:=200/(dexp(-(v2+55)/30)+dexp((v2+55)/30));
end;

function TKepecsKCa.Conductance(x,y,z :double):double;
begin
  Conductance :=x*(1-oN.NP.IfBlockKCa);
end;

function TKepecsKCa.Current:double;
var  v2,tau_n,n_inf,tau_yKCa,yKCa_inf :double;
begin
  tau_inf(oN.NV.V*1000, tau_n,n_inf);
  oN.NV.nKCa:=oN.NV.nKCa+E_exp(dt,tau_n )*( n_inf-oN.NV.nKCa);
  Current :=oN.NP.gKCa*Conductance(oN.NV.nKCa,0,0)*(oN.NV.V-oN.NP.VK);
end;

procedure TKepecsKCa.Init;
var  tau1,tau2 :double;
begin
  tau_inf (oN.NV.V*1000, tau1,oN.NV.nKCa);
end;

end.

