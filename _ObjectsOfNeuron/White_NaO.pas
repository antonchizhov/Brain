unit White_NaO;

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TWhiteNa = class(TChannel)
  private
    procedure tau_inf(v2 :double; var m_inf,tau_h,h_inf :double);
  public
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TWhiteNa.Create(nrn: TNeuron);
begin  inherited Create; oN:=nrn; end;

{--------------------------------------------------------------}
procedure TWhiteNa.tau_inf(v2 :double; var m_inf,tau_h,h_inf :double);
var  v3,a,b :double;
begin
  v3:= v2 - oN.NP.NaThreshShift;
  tau_h:= max(0.81/dexp(0.2*(v2+38)) - dexp(-1/3*(v2+52)) +0.24,0.24);
  m_inf:=    1/(1+dexp(-0.2*(v3+15)));
  h_inf:=    1/(1+dexp( 0.2*(v2+16)));
end;

function TWhiteNa.Conductance(x,y,z :double) :double;
begin
  Conductance:=x*y*(1-oN.NP.IfBlockNa);
end;

function TWhiteNa.Current :double;
var  m_inf,tau_h,h_inf,h_exp :double;
begin
  tau_inf(oN.NV.V*1000, m_inf,tau_h,h_inf);
  h_exp:= 1 - dexp(-dt*1000/tau_h);
  oN.NV.hh:=oN.NV.hh+h_exp*(h_inf-oN.NV.hh);
  oN.NV.mm:=m_inf;
  Current:=oN.NP.gNa*Conductance(oN.NV.mm,oN.NV.hh,0)*(oN.NV.V-oN.NP.VNa)*(1-oN.NP.IfBlockNa);
end;

procedure TWhiteNa.Init;
var  tau1,tau2 :double;
begin
  tau_inf(oN.NV.V*1000, oN.NV.mm,tau1,oN.NV.hh);
end;

end.
