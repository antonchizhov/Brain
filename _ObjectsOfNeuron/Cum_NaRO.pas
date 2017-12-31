unit Cum_NaRO;

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TCumNaR = class(TChannel)
  private
//    oN :TNeuron;
    procedure tau_inf(v2 :double; var tau_m,m_inf,tau_h,h_inf :double);
  public
//    V,gNaR,VNaR,mmR,hhR,dt,
//    a1NaR,a2NaR,a3NaR,a4NaR,b1NaR,b2NaR,b3NaR,b4NaR,
//    c1NaR,c2NaR,c3NaR,c4NaR,d1NaR,d2NaR,d3NaR,d4NaR,Tr_NaR
//                                                                :double;
//    IfBlockNaR :integer;
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TCumNaR.Create(nrn: TNeuron);
begin      inherited Create; oN:=nrn;    end;

procedure TCumNaR.tau_inf(v2 :double; var tau_m,m_inf,tau_h,h_inf :double);
var v3,a,b :double;
begin
  v3:= v2 - oN.NP.Tr_NaR;
  a:= oN.NP.a1NaR * alphabeta_h(oN.NP.a2NaR-v3, oN.NP.a3NaR,oN.NP.a4NaR);
  b:= oN.NP.b1NaR * alphabeta_h(oN.NP.b2NaR-v3, oN.NP.b3NaR,oN.NP.b4NaR);
  tau_m:= 1 / (a + b);
  m_inf:= a / (a + b);
  a:= oN.NP.c1NaR * alphabeta_h(oN.NP.c2NaR-v3, oN.NP.c3NaR,oN.NP.c4NaR);
  b:= oN.NP.d1NaR * alphabeta_h(oN.NP.d2NaR-v3, oN.NP.d3NaR,oN.NP.d4NaR);
  tau_h:= 1 / (a + b);
  h_inf:= a / (a + b);
end;

function TCumNaR.Conductance(x,y,z :double):double;
begin
  Conductance :=x*y*(1-oN.NP.IfBlockNaR);
end;

function TCumNaR.Current:double;
var  tau_m,m_inf, tau_h,h_inf,m2h3 :double;
begin
  tau_inf(oN.NV.V*1000, tau_m,m_inf,tau_h,h_inf);
  oN.NV.mmR:=oN.NV.mmR+E_exp(dt,tau_m)*(m_inf-oN.NV.mmR);
  oN.NV.hhR:=oN.NV.hhR+E_exp(dt,tau_h)*(h_inf-oN.NV.hhR);
  Current:=oN.NP.gNaR*Conductance(oN.NV.mmR,oN.NV.hhR,0)*(oN.NV.V-oN.NP.VNaR);
end;

procedure TCumNaR.Init;
var  tau1,tau2 :double;
begin
  tau_inf(oN.NV.V*1000, tau1,oN.NV.mmR,tau2,oN.NV.hhR);
end;

end.

