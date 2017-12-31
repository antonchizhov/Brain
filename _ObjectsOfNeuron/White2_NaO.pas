unit White2_NaO;
{ [Fernandez, White 2010] }

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TWhite2Na = class(TChannel)
  private
    procedure tau_inf(v2 :double; var m_inf,tau_h,h_inf :double);
  public
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TWhite2Na.Create(nrn: TNeuron);
begin  inherited Create; oN:=nrn; end;

{--------------------------------------------------------------}
procedure TWhite2Na.tau_inf(v2 :double; var m_inf,tau_h,h_inf :double);
var  v3 :double;
begin
  v3:= v2 - oN.NP.NaThreshShift;
  tau_h:=200;
  m_inf:=    1/(1+dexp(-0.25*(v3+30)));
  h_inf:=    1/(1+dexp( 0.5 *(v3+52)));
end;

function TWhite2Na.Conductance(x,y,z :double) :double;
begin
  Conductance:=x*y*y*y;
end;

function TWhite2Na.Current :double;
var  m_inf,tau_h,h_inf,h_exp :double;
begin
  tau_inf(oN.NV.V*1000, m_inf,tau_h,h_inf);
  h_exp:= 1 - dexp(-dt*1000/tau_h);
  oN.NV.hh:=oN.NV.hh+h_exp*(h_inf-oN.NV.hh);
  oN.NV.mm:=m_inf;
  Current:=oN.NP.gNa*Conductance(oN.NV.mm,oN.NV.hh,0)*(oN.NV.V-oN.NP.VNa);
end;

procedure TWhite2Na.Init;
var  tau1,tau2 :double;
begin
  tau_inf(oN.NV.V*1000, oN.NV.mm,tau1,oN.NV.hh);
end;

end.
