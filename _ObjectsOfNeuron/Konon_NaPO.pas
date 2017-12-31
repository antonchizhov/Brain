unit Konon_NaPO;
{ Approximation of persistent Na-current from [K.Vervaeke, H.Hu, L.J.Graham,
and J.F.Storm 2006] }

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TKononNaP = class(TChannel)
  private
    procedure tau_inf(v2 :double; var tau_m,m_inf,tau_h,h_inf :double);
  public
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TKononNaP.Create(nrn: TNeuron);
begin  inherited Create;  oN:=nrn; end;

{---------------- NaP -----------------}
procedure TKononNaP.tau_inf(v2 :double; var tau_m,m_inf,tau_h,h_inf :double);
begin
  { Eq. for 'm' }
  m_inf:= 1 / (1 + dexp(-(v2+47.1)/4.1));
  tau_m:=0.1;
  { Eq. for 'h' }
  h_inf:= 1 / (1 + dexp((v2+65)/5));
  tau_h:=50 + 1100/(dexp((v2+68)/10)+dexp(-(v2+68)/25));
end;

function TKononNaP.Conductance(x,y,z :double):double;
begin
  Conductance :=x*y*(1-oN.NP.IfBlockNaP);
end;

function TKononNaP.Current:double;
var  tau_m,m_inf,tau_h,h_inf :double;
begin
  tau_inf(oN.NV.V*1000, tau_m,m_inf,tau_h,h_inf);
  oN.NV.mNaP:=oN.NV.mNaP+E_exp(dt,tau_m )*( m_inf-oN.NV.mNaP);
  oN.NV.hNaP:=oN.NV.hNaP+E_exp(dt,tau_h )*( h_inf-oN.NV.hNaP);
  Current :=oN.NP.gNaP*Conductance(oN.NV.mNaP,oN.NV.hNaP,0)*(oN.NV.V-oN.NP.VNa);
end;

procedure TKononNaP.Init;
var  tau1,tau2 :double;
begin
  tau_inf(oN.NV.V*1000, tau1,oN.NV.mNaP,tau2,oN.NV.hNaP);
end;

end.
