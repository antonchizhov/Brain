unit Naundorf_NaO;

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

const tau1=0.5{ms};
type
  TNaundorfNa = class(TChannel)
  private
    procedure tau_inf(v2,V_mm :double; var tau_m,m_inf,tau_h,h_inf:double);
  public
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TNaundorfNa.Create(nrn: TNeuron);
begin  inherited Create; oN:=nrn; end;

{--------------------------------------------------------------}
procedure TNaundorfNa.tau_inf(v2,V_mm :double; var tau_m,m_inf,tau_h,h_inf:double);
var  v3,am,bm,ah,bh :double;
begin
  v3:= v2 - oN.NP.NaThreshShift;
{  al_m:=10/(1+dexp(-(v3+V_mm+35)/6));
  be_m:=10/(1+dexp( (v3+V_mm+35)/6));
  al_h:=1/30*(1+dexp(-(v3+80)/4));
  be_h:=1/30*(1+dexp( (v3+80)/4));}
  { [Wang-Buzsaki "Gamma Oscillation by Synaptic Inhibition in
  a Hippocampal Interneuronal Network Model", J. Neurosci. 16:6402-6413, 1996.]
  from [Huang's thesis] }
  am:= (v3+V_mm+35)/10/(1-dexp(-(v3+V_mm+35)/10));
  bm:=                  4*dexp(-(v3+V_mm+60)/18);
  ah:=               0.35*dexp(-(v3+58)/20);
  bh:=               5/(1+dexp(-(v3+28)/10));
  tau_m:= 1/(am+bm);
  m_inf:=am/(am+bm);
  tau_h:= 1/(ah+bh);
  h_inf:=ah/(ah+bh);
end;

function TNaundorfNa.Conductance(x,y,z :double) :double;
begin
  Conductance:=x*x*x*y*(1-oN.NP.IfBlockNa);
end;

function TNaundorfNa.Current :double;
var  m_exp,h_exp,tau_m,m_inf,tau_h,h_inf,dV_ :double;
begin
//  dV_:=oN.NP.KJ_NaCooperativity*istep(oN.NV.mm,3)*oN.NV.hh;
  dV_:=oN.NP.KJ_NaCooperativity*(0.1-oN.NV.wAHP);
  tau_inf(oN.NV.V*1000,dV_, tau_m,m_inf,tau_h,h_inf);
  m_exp:= 1 - dexp(-dt*1000/tau_m);
  h_exp:= 1 - dexp(-dt*1000/tau_h);
  oN.NV.mm:=oN.NV.mm+m_exp*(m_inf-oN.NV.mm);
  oN.NV.hh:=oN.NV.hh+h_exp*(h_inf-oN.NV.hh);
  Current:=oN.NP.gNa*Conductance({oN.NV.mm}m_inf,oN.NV.hh,0)*(oN.NV.V-oN.NP.VNa);
end;

procedure TNaundorfNa.Init;
var  tau_m,tau_h :double;
begin
  tau_inf(oN.NV.V*1000,0, tau_m,oN.NV.mm,tau_h,oN.NV.hh);
end;

end.
