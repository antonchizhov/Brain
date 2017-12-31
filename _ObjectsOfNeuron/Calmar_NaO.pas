unit Calmar_NaO;

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TCalmarNa = class(TChannel)
  private
//    oN :TNeuron;
    procedure tau_inf(v2:double; var tau_m,m_inf,tau_h,h_inf,tau_i,i_inf:double);
  public
//    V,gNa,VNa,NaThreshShift,mm,hh,ii,dt,
//    a1Na,a2Na,a3Na,a4Na,b1Na,b2Na,b3Na,b4Na,
//    c1Na,c2Na,c3Na,c4Na,d1Na,d2Na,d3Na,d4Na, Tr
//                                                  :double;
//    IfBlockNa,IfReduced :integer;
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TCalmarNa.Create(nrn: TNeuron);
begin      inherited Create; oN:=nrn;    end;

{---------------- Na -----------------}
procedure TCalmarNa.tau_inf(v2:double; var tau_m,m_inf,tau_h,h_inf,tau_i,i_inf:double);
var v3,a,b :double;
begin
  v2:= v2 - oN.NP.Tr;  v3:= v2 - oN.NP.NaThreshShift;
  a:= oN.NP.a1Na * alphabeta(oN.NP.a2Na-v3, oN.NP.a3Na,oN.NP.a4Na);
  b:= oN.NP.b1Na * alphabeta(oN.NP.b2Na-v3, oN.NP.b3Na,oN.NP.b4Na);
  tau_m:= 1 / (a + b);
  m_inf:= a / (a + b);
  a:= oN.NP.c1Na * alphabeta  (oN.NP.c2Na-v2, oN.NP.c3Na,oN.NP.c4Na);
  b:= oN.NP.d1Na * alphabeta_h(oN.NP.d2Na-v2, oN.NP.d3Na,oN.NP.d4Na);
  tau_h:= 1 / (a + b);
  h_inf:= a / (a + b);
  { Slow inactivation }
  a:= 0.0077/(1+dexp(-(18-v2)/9));
  b:= 0.0077/(1+dexp( (18-v2)/9));
  tau_i:= 1 / (a + b);
  i_inf:= a / (a + b);
  if oN.NP.If_Slow_Na_inactivation<>1 then i_inf:=1;
end;

function TCalmarNa.Conductance(x,y,z :double):double;
begin
  Conductance :=istep(x,3)*y*z*(1-oN.NP.IfBlockNa);
end;

function TCalmarNa.Current:double;
var  tau_m,m_inf,tau_h,h_inf,tau_i,i_inf :double;
begin
  tau_inf(oN.NV.V*1000, tau_m,m_inf,tau_h,h_inf,tau_i,i_inf);
  oN.NV.mm:=oN.NV.mm+E_exp(dt,tau_m )*( m_inf-oN.NV.mm);
  oN.NV.hh:=oN.NV.hh+E_exp(dt,tau_h )*( h_inf-oN.NV.hh);
  oN.NV.ii:=oN.NV.ii+E_exp(dt,tau_i )*( i_inf-oN.NV.ii);
  if oN.NP.IfReduced=1 then oN.NV.mm:=m_inf;
  {if oN.NP.KJ_NaCooperativity<>0 then
     oN.NP.NaThreshShift:=oN.NP.KJ_NaCooperativity*(1-oN.NV.ii);}
  Current :=oN.NP.gNa*Conductance(oN.NV.mm,oN.NV.hh,oN.NV.ii)*(oN.NV.V-oN.NP.VNa);
end;

procedure TCalmarNa.Init;
var  tau1,tau2,tau3 :double;
begin
  tau_inf(oN.NV.V*1000, tau1,oN.NV.mm,tau2,oN.NV.hh,tau3,oN.NV.ii);
end;

end.

