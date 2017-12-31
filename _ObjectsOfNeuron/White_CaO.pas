unit White_CaO;

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TWhiteCa = class(TChannel)
  private
    procedure tau_inf(v2 :double; var mCaH_inf :double);
  public
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TWhiteCa.Create(nrn: TNeuron);
begin inherited Create; oN:=nrn; end;


procedure TWhiteCa.tau_inf(v2 :double; var mCaH_inf :double);
begin
  mCaH_inf:= 1/(1+dexp(-1/6.5*(v2+28)));
end;

function TWhiteCa.Conductance(x,y,z :double):double;
begin
  Conductance:=x*(1-oN.NP.IfBlockCaH);
end;

function TWhiteCa.Current :double;
var  mCaH_inf :double;
begin
  tau_inf(oN.NV.V*1000, mCaH_inf);
  oN.NV.mCaH:=mCaH_inf;
  Current :=oN.NP.gCaH*Conductance(oN.NV.mCaH,0,0)*(oN.NV.V-oN.NP.VCa);
end;

procedure TWhiteCa.Init;
begin
  tau_inf(oN.NV.V*1000, oN.NV.mCaH);
end;

end.
