unit Cum_KDO;

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TCumKD = class(TChannel)
  private
//    oN :TNeuron;
    procedure tau_inf(v2:double; var tau_x,x_inf,tau_y,y_inf :double);
  public
//    V,gKD,VK,xD,yD,dt :double;
//    IfBlockKD :integer;
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TCumKD.Create(nrn: TNeuron);
begin      inherited Create; oN:=nrn;    end;

{---------------- KD -----------------}
procedure TCumKD.tau_inf(v2:double; var tau_x,x_inf,tau_y,y_inf :double);
var a,b :double;
begin
  tau_x:=   5*dexp(-sqr(0.022*(v2+65)))+ 2.5;
  tau_y:= 7500;
  x_inf:= 1/(1+dexp(-(v2+39.59)/14.68));
  y_inf:= 1/(1+dexp( (v2+48)/ 7));
end;

function TCumKD.Conductance(x,y,z :double):double;
begin
  Conductance :=istep(x,3)*y*(1-oN.NP.IfBlockKD);
end;

function TCumKD.Current:double;
var  tau_x,x_inf,tau_y,y_inf :double;
begin
  tau_inf(oN.NV.V*1000, tau_x,x_inf,tau_y,y_inf);
  oN.NV.xD:=oN.NV.xD+E_exp(dt,tau_x )*( x_inf-oN.NV.xD);
  oN.NV.yD:=oN.NV.yD+E_exp(dt,tau_y )*( y_inf-oN.NV.yD);
  Current :=oN.NP.gKD*Conductance(oN.NV.xD,oN.NV.yD,0)*(oN.NV.V-oN.NP.VK);
end;

procedure TCumKD.Init;
var  tau1,tau2 :double;
begin
  tau_inf(oN.NV.V*1000, tau1,oN.NV.xD,tau2,oN.NV.yD);
end;

end.

