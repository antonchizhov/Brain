unit Vervaeke_NaPO;
{ Approximation of persistent Na-current from [K.Vervaeke, H.Hu, L.J.Graham,
and J.F.Storm 2006] }

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TVervaekeNaP = class(TChannel)
  private
    procedure tau_inf(v2 :double; var tau_m,m_inf :double);
  public
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TVervaekeNaP.Create(nrn: TNeuron);
begin  inherited Create;  oN:=nrn; end;

{---------------- NaP -----------------}
procedure TVervaekeNaP.tau_inf(v2 :double; var tau_m,m_inf :double);
begin
  { Eq. for 'm' }
  m_inf:= 1 / (1 + dexp(-(v2+51)/4.5));
  tau_m:=1 {ms};
end;

function TVervaekeNaP.Conductance(x,y,z :double):double;
begin
  Conductance :=x*(1-oN.NP.IfBlockNaP);
end;

function TVervaekeNaP.Current:double;
var  tau_m,m_inf,tau_h,h_inf :double;
begin
  tau_inf(oN.NV.V*1000, tau_m,m_inf);
  oN.NV.mNaP:=oN.NV.mNaP+E_exp(dt,tau_m )*( m_inf-oN.NV.mNaP);
  Current :=oN.NP.gNaP*Conductance(oN.NV.mNaP,0,0)*(oN.NV.V-0.030{V});
end;

procedure TVervaekeNaP.Init;
var  tau1,tau2 :double;
begin
  tau_inf(oN.NV.V*1000, tau1,oN.NV.mNaP);
end;

end.
