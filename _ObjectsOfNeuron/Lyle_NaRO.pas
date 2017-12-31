unit Lyle_NaRO;

interface
uses t_dtO,ChannelO,MathMyO,NeuronO,typeNrnParsO;

type

  TLyleNaR = class(TChannel)
  private
    NM  :integer;

    function TransitionRate(v2,t_max,k,V12,t_min :double) :double;
    procedure alphas_Na_Lyle(v2 :double; var A :arr4x4);
    procedure tau_inf_SlowInactivation(v2:double; var tau_i,i_inf:double);
    function gNa_inf_Lyle:double;
  public
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TLyleNaR.Create(nrn: TNeuron);
begin  inherited Create; oN:=nrn; end;

{-------- NaR - Markov model -----------------------}
function TLyleNaR.TransitionRate(v2,t_max,k,V12,t_min :double) :double;
{ Calculate rate for Markov model, according to eq.(4)
  [Lyle, Interpretations..., p.78] }
var a,ex_ :double;
begin
  if t_max=888 then a:=0 else a:=1/(t_max-t_min);
  ex_:=dexp((v2-V12{-oN.NP.NaRThreshShift})/k);
  if a+ex_=0 then  TransitionRate:=0
             else  TransitionRate:=1/(t_min+1/(a+ex_));
end;

procedure TLyleNaR.alphas_Na_Lyle(v2 :double; var A :arr4x4);
var i,j :integer;
{ States: 1-O, 2-I, 3-C1, 4-C2 as in [Lyle, Interpretations..., p.92] }
begin
  for i:=1 to NM do
      for j:=1 to NM do  A[i,j]:=0;
  A[4,1]:=TransitionRate(v2,888, 1,-51,1/3);    // C2 -> O
  A[1,4]:=TransitionRate(v2,888,-2,-57,1/3);    // O  -> C2
  A[3,1]:=TransitionRate(v2,888, 1,-42,1/3);    // C1 -> O
  if oN.NP.NaR_subtype='Lyle-3' then A[3,1]:=TransitionRate(v2,888, 1,-51,1/3);
  A[1,3]:=TransitionRate(v2,888,-2,-51,1/3);    // O  -> C1
  A[1,2]:=3;                                    // O  -> I
  A[2,3]:=TransitionRate(v2,100,-1,-53,  1);    // I  -> C1
  A[3,4]:=TransitionRate(v2,100,-1,-60,  1);    // C1 -> C2
end;

procedure TLyleNaR.tau_inf_SlowInactivation(v2:double; var tau_i,i_inf:double);
var v3,a,b :double;
begin
  v3:= v2 {- oN.NP.NaThreshShift};
  { Slow inactivation }
  {[Fernandez, White 2010]}
  tau_i:= 100{200};
  i_inf:=    1/(1+dexp( 0.5 *(v3+52{58})));
{  a:= 0.01 * vtrap(-(v3+50), 5);
  b:= 0.004* vtrap( (v3+75), 5);
  tau_i:= 1 / (a + b);
  i_inf:= 1 / (1 + dexp((v3+72)/(6.2)));}
{  a:= 0.0077/(1+dexp(-(-42-v3)/9));
  b:= 0.0077/(1+dexp( (-42-v3)/9));
  tau_i:= 1 / (a + b);
  i_inf:= a / (a + b);}
  if oN.NP.If_Slow_NaR_inactivation<>1 then i_inf:=1;
end;

function TLyleNaR.gNa_inf_Lyle:double;
{ Calculates stationary solution for Na-conductance }
var
     A          :arr4x4;
     L          :matr;
     X,B        :vect;
     S          :double;
     i,j        :integer;
begin
  alphas_Na_Lyle(oN.NV.V*1000, A);
  for i:=1 to NM do for j:=1 to NM do  L[i,j]:=A[j,i];
  for i:=1 to NM-1 do begin
      S:=0;
      for j:=1 to NM do  S:=S+A[i,j];
      L[i,i]:= -S;
      B[i]:=0;
  end;
  { Normalization }
  B[NM]:=1;   for j:=1 to NM do L[NM,j]:=1;
  {************************}
  LinearSistem(NM, L, B, X);
  {************************}
  for i:=1 to NM do  oN.NV.XNaR[i]:=X[i];
  oN.NV.mmR:=oN.NV.XNaR[1];
  oN.NV.hhR:=1-oN.NV.XNaR[2];
  gNa_inf_Lyle:=oN.NP.gNaR*oN.NV.mmR*(1-oN.NP.IfBlockNaR);
end;

function TLyleNaR.Conductance(x,y,z :double):double;
begin
  Conductance:=x*z*z*z*(1-oN.NP.IfBlockNaR);    // mh^3 [Fernandez, White 2010]
end;

function TLyleNaR.Current:double;
var
     A                      :arr4x4;
     Sp,Sm,tau_i,i_inf      :double;
     i,j                    :integer;
     X                      :vect;
begin
  alphas_Na_Lyle(oN.NV.V*1000, A);
  for i:=1 to NM-1 do begin
      Sp:=0; Sm:=0;
      for j:=1 to NM do  if i<>j then begin
          Sp:=Sp + A[j,i]*oN.NV.XNaR[j];
          Sm:=Sm + A[i,j];
      end;
      X[i]:=oN.NV.XNaR[i] + E_exp(dt,1/Sm)*(Sp/Sm - oN.NV.XNaR[i]);
  end;
  for i:=1 to NM-1 do  oN.NV.XNaR[i]:=X[i];
  { Normalization }
  oN.NV.XNaR[NM]:=1;
  for i:=1 to NM-1 do oN.NV.XNaR[NM]:=oN.NV.XNaR[NM] - oN.NV.XNaR[i];
  oN.NV.mmR:=oN.NV.XNaR[1];
  oN.NV.hhR:=1-oN.NV.XNaR[2];
  { Slow inactivation }
  tau_inf_SlowInactivation(oN.NV.V*1000, tau_i,i_inf);
  oN.NV.iiR:=oN.NV.iiR+E_exp(dt,tau_i)*(i_inf-oN.NV.iiR);
  Current:=oN.NP.gNaR*Conductance(oN.NV.mmR,0,oN.NV.iiR)*(oN.NV.V-oN.NP.VNa);
end;

procedure TLyleNaR.Init;
var   dum,tau_i :double;
begin
  NM:=4;
  if oN.NP.NaR_subtype='Lyle-4' then NM:=4;   // Number of Markov states in [Lyle 99]
  if oN.NP.NaR_subtype='Lyle-3' then NM:=3;
  dum:= gNa_inf_Lyle;
  { Slow inactivation }
  tau_inf_SlowInactivation(oN.NV.V*1000, tau_i,oN.NV.iiR);
end;

end.

