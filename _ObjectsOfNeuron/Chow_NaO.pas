unit Chow_NaO;

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TChowNa = class(TChannel)
  private
//    oN :TNeuron;
    procedure tau_inf(v2 :double; var m_inf,tau_h,h_inf,tau_i,i_inf :double);
  public
//    V,gNa,VNa,mm,hh,dt :double;
//    IfBlockNa,NaThreshShift :integer;
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TChowNa.Create(nrn: TNeuron);
begin  inherited Create; oN:=nrn; end;

{--------------------------------------------------------------}
procedure TChowNa.tau_inf(v2 :double; var m_inf,tau_h,h_inf,tau_i,i_inf :double);
var  v3,a,b :double;
begin
  v3:= v2 - oN.NP.NaThreshShift;
  tau_h:= 0.6/(1+dexp(-0.12*({v2}v3+67)));
  m_inf:=   1/(1+dexp(-0.08*(v3+26)));
  h_inf:=   1/(1+dexp( 0.13*({v2}v3+38)));
  { Slow inactivation }
  {[Fernandez, White 2010]}
  tau_i:= 100{200};
  i_inf:=    1/(1+dexp( 0.5 *(v3+52)));
  if oN.NP.If_Slow_Na_inactivation<>1 then i_inf:=1;
end;

function TChowNa.Conductance(x,y,z :double) :double;
begin
  Conductance:=istep(x,3)*y*z*z*z*(1-oN.NP.IfBlockNa);
end;

function TChowNa.Current :double;
var  m_inf,tau_h,h_inf,h_exp,tau_i,i_inf :double;
begin
  tau_inf(oN.NV.V*1000, m_inf,tau_h,h_inf,tau_i,i_inf);
  h_exp:= 1 - dexp(-dt*1000/tau_h);
  oN.NV.hh:=oN.NV.hh+h_exp*(h_inf-oN.NV.hh);
  oN.NV.mm:=m_inf;
  oN.NV.ii:=oN.NV.ii+E_exp(dt,tau_i)*(i_inf-oN.NV.ii);
  Current:=oN.NP.gNa*Conductance(oN.NV.mm,oN.NV.hh,oN.NV.ii)*(oN.NV.V-oN.NP.VNa);
end;

procedure TChowNa.Init;
var  tau1,tau2,tau3 :double;
begin
  tau_inf(oN.NV.V*1000, oN.NV.mm,tau1,oN.NV.hh,tau3,oN.NV.ii);
end;

end.
 