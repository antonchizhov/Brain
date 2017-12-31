unit BstO;

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TBst = class(TChannel)
  private
//    oN :TNeuron;
    procedure tau_inf(v2 :double; var tau_m,m_inf :double);
  public
//    V,gBst,VK,mBst,dt :double;
//    indic,IfBlockBst :integer;
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TBst.Create(nrn: TNeuron);
begin      inherited Create; oN:=nrn;    end;

  { *** Bst  ***}
procedure TBst.tau_inf(v2 :double; var tau_m,m_inf :double);
var tau1 :double;
begin
  tau1:= 100 {ms}; { activation time }
  tau_m:= 100 {ms}; { deactivation time }
  m_inf:=0;  if oN.NV.indic=2 then m_inf:=tau1;
end;

function TBst.Conductance(x,y,z :double):double;
var  tau_m,m_inf,m_exp,m_inf_rest :double;
begin
  Conductance:=zBst(x)*(1-oN.NP.IfBlockBst);
end;

function TBst.Current :double;
var  v2,a,b,tau_m,m_inf,m_exp :double;
begin
  oN.NV.mBst:=oN.NV.mBst+E_exp(dt,tau_m )*( m_inf-oN.NV.mBst);
  Current :=oN.NP.gBst*Conductance(oN.NV.mBst,0,0)*(oN.NV.V-oN.NP.VK);     { Current }
end;

procedure TBst.Init;
var  tau1,tau2 :double;
begin
  tau_inf(oN.NV.V*1000, tau1,oN.NV.mBst);
end;

end.

