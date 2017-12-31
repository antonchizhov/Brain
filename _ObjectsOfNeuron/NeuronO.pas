unit NeuronO;

interface
uses
  Classes,typeNrnParsO{,ChannelO};

type
{==================================================================}
  TNeuron = class(TObject)
  private
  protected
  public
{    chNa :TChannel;
    chK  :TChannel;
    chKA :TChannel;
    chKM :TChannel;
    chKD :TChannel;
    chH  :TChannel;
    chNaR:TChannel;
    chADP:TChannel;
    chAHP:TChannel;
    chCaH:TChannel;
    chCaT:TChannel;
    chKCa:TChannel;
    chNaP:TChannel;
    chBst:TChannel;}
    {Properties:}
    NP                                          :NeuronProperties;
    {Variables:}
    NV                                          :NeuronVariables;
    {Functions:}
    {*******************************************}
    procedure InitialConditions; virtual; abstract;
    procedure ConditionsAtSpike(sinceAP :double); virtual; abstract;
    procedure IfSpikeOccursInThrModel; virtual; abstract;
    procedure Calc_RHP_and_g(var Active_Im_s,Active_Im_d,g :double); virtual; abstract;
    procedure MembranePotential(uuE,ssE,uuI,ssI,tt,Iind,Vhold :double); virtual; abstract;
    procedure EquateFrom(ANrn :TNeuron);
    procedure EquateTo(ANrn :TNeuron);

    constructor Create(NP :NeuronProperties);
    destructor Destroy;
  end;


implementation

constructor TNeuron.Create;
begin
  inherited Create;
end;

destructor TNeuron.Destroy;
begin
  inherited Destroy;
end;

procedure TNeuron.EquateFrom(ANrn :TNeuron);
begin
  NP:=ANrn.NP;
  NV:=ANrn.NV;
end;

procedure TNeuron.EquateTo(ANrn :TNeuron);
begin
  ANrn.NP:=NP;
  ANrn.NV:=NV;
end;

end.
