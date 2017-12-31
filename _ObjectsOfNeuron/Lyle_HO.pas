unit Lyle_HO;

interface
uses t_dtO,ChannelO,MathMyO,NeuronO;

type
  TLyleH = class(TChannel)
  private
//    oN :TNeuron;
    procedure tau_inf_H_Lyle(v2 :double; var tau_y,y_inf :double);
  public
//    V,gH,V12H,FRT,yH,dt :double;
//    IfBlockH :integer;
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TLyleH.Create(nrn: TNeuron);
begin      inherited Create; oN:=nrn;    end;

{---------------- H -----------------}
procedure TLyleH.tau_inf_H_Lyle(v2 :double; var tau_y,y_inf :double);
var a,b :double;
begin
  { Eq. for 'yH' }
  tau_y:= 180;
  y_inf:= 1 / (1 + dexp(-(v2+98)*(-2)*oN.NP.FRT));
end;

function TLyleH.Conductance(x,y,z :double):double;
begin
  Conductance :=y*(1-oN.NP.IfBlockH);
end;

function TLyleH.Current:double;
var  tau_y,y_inf :double;
begin
  tau_inf_H_Lyle(oN.NV.V*1000, tau_y,y_inf);
  oN.NV.yH:=oN.NV.yH+E_exp(dt,tau_y)*(y_inf-oN.NV.yH);
  Current :=oN.NP.gH*Conductance(0,oN.NV.yH,0)*(oN.NV.V-oN.NP.V12H);              { Current }
end;

procedure TLyleH.Init;
var  tau1,tau2 :double;
begin
  tau_inf_H_Lyle (oN.NV.V*1000, tau1,oN.NV.yH);
end;

end.
