unit Lyle_KDO;

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TLyleKD = class(TChannel)
  private
//    oN :TNeuron;
    procedure tau_inf_KD_Lyle(v2 :double; var tau_x,x_inf,tau_y,y_inf :double);
  public
//    V,gKD,VKD,FRT,xD,yD,dt :double;
//    IfBlockKD :integer;
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TLyleKD.Create(nrn: TNeuron);
begin      inherited Create; oN:=nrn;    end;

{---------------- KD -----------------}
procedure TLyleKD.tau_inf_KD_Lyle(v2 :double; var tau_x,x_inf,tau_y,y_inf :double);
var a,b :double;
begin
  { Eq. for 'xD' }
  tau_x:= 1;
  x_inf:= 1 / (1 + dexp(-(v2+63)*3*oN.NP.FRT));
  { Eq. for 'yD' }
  a:=2e-4;
  b:=2e-4*dexp(-(v2+73)*1*(-2.5)*oN.NP.FRT);
  tau_y:= 1 / (a + b);
  y_inf:= a / (a + b);
end;

function TLyleKD.Conductance(x,y,z :double):double;
begin
  Conductance :=istep(x*y,4)*(1-oN.NP.IfBlockKD);
end;

function TLyleKD.Current:double;
var  tau_x,x_inf,tau_y,y_inf :double;
begin
  tau_inf_KD_Lyle(oN.NV.V*1000, tau_x,x_inf,tau_y,y_inf);
  oN.NV.xD:=oN.NV.xD+E_exp(dt,tau_x)*(x_inf-oN.NV.xD);
  oN.NV.yD:=oN.NV.yD+E_exp(dt,tau_y)*(y_inf-oN.NV.yD);
  Current :=oN.NP.gKD*Conductance(oN.NV.xD,oN.NV.yD,0)*(oN.NV.V-oN.NP.VKD);              { Current }
end;

procedure TLyleKD.Init;
var  tau1,tau2 :double;
begin
  tau_inf_KD_Lyle(oN.NV.V*1000, tau1,oN.NV.xD,tau2,oN.NV.yD);
end;

end.
