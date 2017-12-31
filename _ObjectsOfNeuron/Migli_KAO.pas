unit Migli_KAO;

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TMigliKA = class(TChannel)
  private
//    oN :TNeuron;
    procedure tau_inf(v2:double; var tau_n,n_inf,tau_l,l_inf :double);
  public
//    V,gKA,VK,nA,lA,dt :double;
//    IfBlockKA :integer;
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TMigliKA.Create(nrn: TNeuron);
begin      inherited Create; oN:=nrn;    end;

{---------------- KA -----------------}
procedure TMigliKA.tau_inf(v2:double; var tau_n,n_inf,tau_l,l_inf :double);
var a,b :double;
begin
  a:=dexp( -0.038*( 1.5  +1/(1+dexp((v2+40)/5)) )*(v2-11) );
  b:=dexp( -0.038*( 0.825+1/(1+dexp((v2+40)/5)) )*(v2-11) );
  tau_n:= 4*b / (1 + a);
  if tau_n<0.1 then  tau_n:=0.1;
  n_inf:= 1 / (1 + a);
  a:= dexp(0.11*(v2+56));
  tau_l:= 0.26 * (v2+50);
  if tau_l<2 then  tau_l:=2;
  l_inf:= 1 / (1 + a);
end;

function TMigliKA.Conductance(x,y,z :double):double;
begin
  Conductance :=x*y*(1-oN.NP.IfBlockKA);
end;

function TMigliKA.Current:double;
var  tau_n,n_inf,tau_l,l_inf :double;
begin
  tau_inf(oN.NV.V*1000, tau_n,n_inf,tau_l,l_inf);
  oN.NV.nA:=oN.NV.nA+E_exp(dt,tau_n )*( n_inf-oN.NV.nA);
  oN.NV.lA:=oN.NV.lA+E_exp(dt,tau_l )*( l_inf-oN.NV.lA);
  Current :=oN.NP.gKA*Conductance(oN.NV.nA,oN.NV.lA,0)*(oN.NV.V-oN.NP.VK);
end;

procedure TMigliKA.Init;
var  tau1,tau2 :double;
begin
  tau_inf(oN.NV.V*1000, tau1,oN.NV.nA,tau2,oN.NV.lA);
end;

end.

