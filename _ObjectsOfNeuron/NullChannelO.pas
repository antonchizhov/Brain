unit NullChannelO;

interface
uses ChannelO,MathMyO;

type
  TNullChannel = class(TChannel)
  private
  public
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create;
  end;

implementation

constructor TNullChannel.Create;
begin      inherited Create;    end;


  function TNullChannel.Current :double;
  begin
    Current:=0;
  end;

  function TNullChannel.Conductance(x,y,z :double) :double;
  begin
    Conductance:=0;
  end;

  procedure TNullChannel.Init;
  begin
  end;

end.
