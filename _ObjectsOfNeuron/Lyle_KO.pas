unit Lyle_KO;

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TLyleK = class(TChannel)
  private
//    oN :TNeuron;
    procedure tau_inf(v2 :double; var tau_n,n_inf,tau_yK,yK_inf :double);
  public
//    V,gK,VKDr,FRT,nn,yK,dt :double;
//    IfBlockK :integer;
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TLyleK.Create(nrn: TNeuron);
begin
  inherited Create;
  oN:=nrn;
end;

{---------------- K - DR -----------------}
procedure TLyleK.tau_inf(v2 :double; var tau_n,n_inf,tau_yK,yK_inf :double);
var a,b :double;
begin
  { Eq. for 'n' }
  a:=0.17*dexp( (v2+5)*0.8*3*oN.NP.FRT);
  b:=0.17*dexp(-(v2+5)*0.2*3*oN.NP.FRT);
  tau_n:= 1 / (a + b) + 0.8;
  n_inf:= a / (a + b);
  { Eq. for 'yK' }
  tau_yK:= 300;
  yK_inf:= 1 / (1 + dexp(-(v2+68)*(-1)*oN.NP.FRT));
end;

function TLyleK.Conductance(x,y,z :double):double;
begin
  Conductance :=x*y*(1-oN.NP.IfBlockK);
end;

function TLyleK.Current:double;
var  v2,tau_n,n_inf,tau_yK,yK_inf :double;
begin
  tau_inf(oN.NV.V*1000, tau_n,n_inf,tau_yK,yK_inf);
  oN.NV.nn:=oN.NV.nn+E_exp(dt,tau_n )*( n_inf-oN.NV.nn);
  oN.NV.yK:=oN.NV.yK+E_exp(dt,tau_yK)*(yK_inf-oN.NV.yK);
  Current :=oN.NP.gK*Conductance(oN.NV.nn,oN.NV.yK,0)*(oN.NV.V-oN.NP.VKDr);
end;

procedure TLyleK.Init;
var  tau1,tau2 :double;
begin
  tau_inf(oN.NV.V*1000, tau1,oN.NV.nn,tau2,oN.NV.yK);
end;

end.
