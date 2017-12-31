unit ADPO;

interface
uses ChannelO,MathMyO,NeuronO,t_dtO;

type
  TADP = class(TChannel)
  private
    procedure tau_inf_ADP(v2 :double; var tau_w,w_inf :double);
  public
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TADP.Create(nrn: TNeuron);
begin      inherited Create; oN:=nrn;    end;

  { *** ADP  ***}
procedure TADP.tau_inf_ADP(v2 :double; var tau_w,w_inf :double);
begin
  tau_w:= oN.NP.tADP*1000;// /(3.3*dexp((v2+35)/20)+dexp(-(v2+35)/20));
  w_inf:=  1 /  (1+dexp(-(v2            +25)/20));
end;

function TADP.Conductance(x,y,z :double):double;
var  tau_w,w_inf,w_exp,w_inf_rest :double;
begin
  Conductance:=x*(1-oN.NP.IfBlockADP);
end;

function TADP.Current :double;
var  v2,a,b,tau_w,w_inf,w_exp :double;
begin
  tau_inf_ADP(oN.NV.V*1000,tau_w,w_inf);
  oN.NV.wADP:=oN.NV.wADP + dt*1000/tau_w*(w_inf-oN.NV.wADP);
  Current :=oN.NP.gADP*Conductance(oN.NV.wADP,0,0)*(oN.NV.V-oN.NP.VADP);     { Current }
end;

procedure TADP.Init;
var  tau1,tau2 :double;
begin
  tau_inf_ADP(oN.NV.V*1000,tau1,oN.NV.wADP);
end;

end.

