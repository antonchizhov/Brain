unit White_AHPO;

interface
uses ChannelO,MathMyO,NeuronO,t_dtO;

type
  TWhiteAHP = class(TChannel)
  private
    procedure tau_inf_AHP(v2 :double; var tau_w,w_inf :double);
  public
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TWhiteAHP.Create(nrn: TNeuron);
begin      inherited Create; oN:=nrn;    end;

  { *** AHP  ***}
procedure TWhiteAHP.tau_inf_AHP(v2 :double; var tau_w,w_inf :double);
var Ca_ :double;
begin
  tau_w:=70{ms};
  Ca_:=-0.12*(oN.NP.gCaH*oN.NV.mCaH*(v2-oN.NP.VCa*1e3));         {!!!!!!!!}
  w_inf:= 1 / (1+dexp(-(Ca_-0.018)/0.000025));
  { Approximation used in Experiments [Fernandez, White 2009] }
//  tau_w:= max(200/dexp(0.5*(v2+50)) - dexp(-0.02*(v2+6)) + 10,10);
//  w_inf:=    1/(1+dexp(-1/3*(v2+35)));
end;

function TWhiteAHP.Conductance(x,y,z :double):double;
var  tau_w,w_inf,w_exp,w_inf_rest :double;
begin
  Conductance:=x*(1-oN.NP.IfBlockAHP);
end;

function TWhiteAHP.Current :double;
var  v2,a,b,tau_w,w_inf,w_exp :double;
begin
  tau_inf_AHP(oN.NV.V*1000,tau_w,w_inf);
  oN.NV.wAHP:=oN.NV.wAHP + dt*1000/tau_w*(w_inf-oN.NV.wAHP);
  Current :=oN.NP.gAHP*Conductance(oN.NV.wAHP,0,0)*(oN.NV.V-oN.NP.VK);     { Current }
end;

procedure TWhiteAHP.Init;
var  tau1,tau2 :double;
begin
  tau_inf_AHP(oN.NV.V*1000,tau1,oN.NV.wAHP);
end;

end.
