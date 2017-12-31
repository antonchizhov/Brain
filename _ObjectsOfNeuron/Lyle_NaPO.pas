unit Lyle_NaPO;
{ Approximation of persistent Na-current from [K.Vervaeke, H.Hu, L.J.Graham,
and J.F.Storm 2006] }

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TLyleNaP = class(TChannel)
  private
    procedure tau_inf(v2 :double; var m_inf :double);
  public
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TLyleNaP.Create(nrn: TNeuron);
begin
  inherited Create;
  oN:=nrn;
end;

{---------------- NaP -----------------}
procedure TLyleNaP.tau_inf(v2 :double; var m_inf :double);
begin
  { Eq. for 'm' }
  m_inf:= 1 / (1 + dexp(-(v2+51)/4.5));
end;

function TLyleNaP.Conductance(x,y,z :double):double;
begin
  Conductance :=x*(1-oN.NP.IfBlockNaP);
end;

function TLyleNaP.Current:double;
var  m_inf :double;
begin
  tau_inf(oN.NV.V*1000, m_inf);
  oN.NV.mNaP:=m_inf;
  Current :=oN.NP.gNaP*Conductance(oN.NV.mNaP,0,0)*(oN.NV.V-oN.NP.VNa);
end;

procedure TLyleNaP.Init;
begin
  tau_inf(oN.NV.V*1000, oN.NV.mNaP);
end;

end.
