unit Chow_NaRO;

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TChowNaR = class(TChannel)
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

constructor TChowNaR.Create(nrn: TNeuron);
begin  inherited Create; oN:=nrn; end;

{--------------------------------------------------------------}
procedure TChowNaR.tau_inf(v2 :double; var m_inf,tau_h,h_inf,tau_i,i_inf :double);
var  v3,a,b :double;
begin
  v3:= v2 {- oN.NP.NaThreshShift};
  tau_h:= 0.6/(1+dexp(-0.12*({v2}v3+67)));
  m_inf:=   1/(1+dexp(-0.08*(v3+26)));
  h_inf:=   1/(1+dexp( 0.13*({v2}v3+38)));
  { Slow inactivation }
  {[Fernandez, White 2010]}
  tau_i:= 100{200};
  i_inf:=    1/(1+dexp( 0.5 *(v3+42{52})));
  if oN.NP.If_Slow_Na_inactivation<>1 then i_inf:=1;
end;

function TChowNaR.Conductance(x,y,z :double) :double;
begin
  Conductance:=istep(x,3)*y*z*z*z*(1-oN.NP.IfBlockNaR);
end;

function TChowNaR.Current :double;
var  m_inf,tau_h,h_inf,h_exp,tau_i,i_inf :double;
begin
  tau_inf(oN.NV.V*1000, m_inf,tau_h,h_inf,tau_i,i_inf);
  h_exp:= 1 - dexp(-dt*1000/tau_h);
  oN.NV.hhR:=oN.NV.hhR+h_exp*(h_inf-oN.NV.hhR);
  oN.NV.mmR:=m_inf;
  oN.NV.iiR:=oN.NV.iiR+E_exp(dt,tau_i)*(i_inf-oN.NV.iiR);
  Current:=oN.NP.gNaR*Conductance(oN.NV.mmR,oN.NV.hhR,oN.NV.iiR)*(oN.NV.V-oN.NP.VNa);
end;

procedure TChowNaR.Init;
var  tau1,tau2,tau3 :double;
begin
  tau_inf(oN.NV.V*1000, oN.NV.mmR,tau1,oN.NV.hhR,tau3,oN.NV.iiR);
end;

end.
 