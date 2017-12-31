unit ChannelO;

interface
uses MathMyO,NeuronO;

type
  TChannel = class //(TNeuron)
  private
  public
    oN :TNeuron;
    function Current :double; virtual; abstract;
    function Conductance(x,y,z :double) :double; virtual; abstract;
    procedure Init; virtual; abstract;

    constructor Create;
  end;

function alphabeta(x,y,a4 :double):double;
function alphabeta_h(x,y,a4 :double):double;
function vtrap(x,y :double):double;

implementation

constructor TChannel.Create;
begin      inherited Create;    end;


function alphabeta(x,y,a4 :double):double;
{ alphabeta(V) = x/(exp(x/y) - a4) }
begin
       if a4=1 then  alphabeta:=vtrap(x,y)
  else if a4=0 then  alphabeta:= dexp(x/y)
               else  alphabeta:= x/(dexp(x/y)-a4);
end;

function alphabeta_h(x,y,a4 :double):double;
begin
  alphabeta_h   := 1/(dexp(x/y) - a4);
end;

function vtrap(x,y :double):double;
begin
  if (abs(x/y) < 1e-6) then
    vtrap:= y*(1 - x/y/2)
  else
    vtrap:= x/(dexp(x/y)-1);
end;

end.
