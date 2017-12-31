unit Lyle_NaO;

interface
uses t_dtO,ChannelO,MathMyO,NeuronO,typeNrnParsO;

type

  TLyleNa = class(TChannel)
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

constructor TLyleNa.Create(nrn: TNeuron);
begin  inherited Create; oN:=nrn; end;

{-------- Na - Markov model -----------------------}
function TLyleNa.TransitionRate(v2,t_max,k,V12,t_min :double) :double;
{ Calculate rate for Markov model, according to eq.(4)
  [Lyle, Interpretations..., p.78] }
var a,ex_ :double;
begin
  if t_max=888 then a:=0 else a:=1/(t_max-t_min);
  ex_:=dexp((v2-V12-oN.NP.NaThreshShift)/k);
  if a+ex_=0 then  TransitionRate:=0
             else  TransitionRate:=1/(t_min+1/(a+ex_));
end;

procedure TLyleNa.alphas_Na_Lyle(v2 :double; var A :arr4x4);
var i,j  :integer;
    V12_ :double;
{ States: 1-O, 2-I, 3-C1, 4-C2 as in [Lyle, Interpretations..., p.92] }
begin
  for i:=1 to NM do
      for j:=1 to NM do  A[i,j]:=0;
  A[4,1]:=TransitionRate(v2,888, 1,-51,1/3);    // C2 -> O
  A[1,4]:=TransitionRate(v2,888,-2,-57,1/3);    // O  -> C2
  A[3,1]:=TransitionRate(v2,888, 1,-42,1/3);    // C1 -> O
  A[1,3]:=TransitionRate(v2,888,-2,-51,1/3);    // O  -> C1
  A[1,2]:=3;                                    // O  -> I
  A[2,3]:=TransitionRate(v2,100,-1,-53,  1);    // I  -> C1
  A[3,4]:=TransitionRate(v2,100,-1,-60,  1);    // C1 -> C2
  if oN.NP.Na_subtype='Lyle-3' then A[3,1]:=TransitionRate(v2,888, 1,-51,1/3);
  if oN.NP.Na_subtype='Lyle-VT(h)' then begin
     { VT depending on XNa[13] }
     V12_:=-55 + {30}20*oN.NV.XNa[13]; {mV}
     A[3,1]:=TransitionRate(v2,888,0.2,V12_,1/3);  // C1 -> O
     A[2,3]:=TransitionRate(v2,100,-2,-53,  1);    // I  -> C1
     { Secondary spikes become smaller with  A[2,3]:=TransitionRate(v2,100,-2,-53,  10); }
  end;
end;

procedure TLyleNa.tau_inf_SlowInactivation(v2:double; var tau_i,i_inf:double);
var v3,a,b :double;
begin
  v3:= v2 - oN.NP.NaThreshShift;
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
  if (oN.NP.If_Slow_Na_inactivation<>1){and
     (oN.NP.Na_subtype<>'Lyle-VT(h)')} then  i_inf:=1;
end;

function TLyleNa.gNa_inf_Lyle:double;
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
  for i:=1 to NM do  oN.NV.XNa[i]:=X[i];
  oN.NV.mm:=oN.NV.XNa[1];
  oN.NV.hh:=1-oN.NV.XNa[2];
  gNa_inf_Lyle:=oN.NP.gNa*oN.NV.mm*(1-oN.NP.IfBlockNa);
end;

function TLyleNa.Conductance(x,y,z :double):double;
begin
  Conductance:=x*z*z*z*(1-oN.NP.IfBlockNa);      // mh^3 [Fernandez, White 2010]
//  if oN.NP.Na_subtype='Lyle-VT(h)' then  Conductance:=x*(1-oN.NP.IfBlockNa);
end;

function TLyleNa.Current:double;
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
          Sp:=Sp + A[j,i]*oN.NV.XNa[j];
          Sm:=Sm + A[i,j];
      end;
      X[i]:=oN.NV.XNa[i] + E_exp(dt,1/Sm)*(Sp/Sm - oN.NV.XNa[i]);  // corrected on 8.10.2012
  end;
  for i:=1 to NM-1 do  oN.NV.XNa[i]:=X[i];        // corrected on 8.10.2012
  { Normalization }
  oN.NV.XNa[NM]:=1;
  for i:=1 to NM-1 do oN.NV.XNa[NM]:=oN.NV.XNa[NM] - oN.NV.XNa[i];
  oN.NV.mm:=oN.NV.XNa[1];
  oN.NV.hh:=1-oN.NV.XNa[2];
  { Slow inactivation }
  tau_inf_SlowInactivation(oN.NV.V*1000, tau_i,i_inf);
  oN.NV.ii:=oN.NV.ii+E_exp(dt,tau_i)*(i_inf-oN.NV.ii);
  Current:=oN.NP.gNa*Conductance(oN.NV.mm,0,oN.NV.ii)*(oN.NV.V-oN.NP.VNa);
  { VT(h): h=XNa[13]:  dh/dt = al*(1-h)*X[1] - beta*h }
  oN.NV.XNa[13]:=oN.NV.XNa[13] + dt*{1000}100{Hz}*oN.NV.XNa[2]*(1-oN.NV.XNa[13])
                               - dt*  20{Hz}*oN.NV.XNa[13];
end;

procedure TLyleNa.Init;
var   dum,tau_i :double;
begin
  NM:=4;
  if oN.NP.Na_subtype='Lyle-4' then NM:=4;  // Number of Markov states in [Lyle 99]
  if oN.NP.Na_subtype='Lyle-3' then NM:=3;
  if oN.NP.Na_subtype='Lyle-VT(h)' then NM:=3;
  dum:= gNa_inf_Lyle;
  { Slow inactivation }
  tau_inf_SlowInactivation(oN.NV.V*1000, tau_i,oN.NV.ii);
  { VT(h): h=XNa[13]:  dh/dt = al*(1-h)*X[1] - beta*h }
  if oN.NP.Na_subtype='Lyle-VT(h)' then begin
     oN.NV.XNa[13]:={50}5*oN.NV.XNa[2];
  end;
end;

end.

