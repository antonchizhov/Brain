unit Naundorf_NaO1;

interface
uses t_dtO,ChannelO,MathMyO,NeuronO,typeNrnParsO;

const { KJ_Naund=}{0*300} k_Naund=-0.5;
type

  TNaundorfNa = class(TChannel)
  private
    NM  :integer;

    function TransitionRate(v2,t_max,k,V12,t_min :double) :double;
    procedure alphas_Na_Lyle(v2,mm :double; var A :arr4x4);
    procedure tau_inf_SlowInactivation(v2:double; var tau_i,i_inf:double);
    function gNa_inf_Lyle:double;
  public
//    V,gNa,VNa,NaThreshShift,mm,hh,dt :double;
//    IfBlockNa :integer;
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TNaundorfNa.Create(nrn: TNeuron);
begin  inherited Create; oN:=nrn; end;

{-------- Na - Markov model -----------------------}
function TNaundorfNa.TransitionRate(v2,t_max,k,V12,t_min :double) :double;
{ Calculate rate for Markov model, according to eq.(4)
  [Lyle, Interpretations..., p.78] }
var a,ex_ :double;
begin
  if t_max=888 then a:=0 else a:=1/(t_max-t_min);
  ex_:=dexp((v2-V12-oN.NP.NaThreshShift)/k);
  if a+ex_=0 then  TransitionRate:=0
             else  TransitionRate:=1/(t_min+1/(a+ex_));
end;

procedure TNaundorfNa.alphas_Na_Lyle(v2,mm :double; var A :arr4x4);
var i,j  :integer;
    KJ_  :double;
{ States: 1-O, 2-I, 3-C1, 4-C2 as in [Lyle, Interpretations..., p.92] }
begin
  for i:=1 to NM do
      for j:=1 to NM do  A[i,j]:=0;
  KJ_:=oN.NP.KJ_NaCooperativity;
  A[4,1]:=TransitionRate(v2+KJ_*mm,888, 1+k_Naund,-51,1/3);    // C2 -> O
  A[1,4]:=TransitionRate(v2,       888,-2,        -57,1/3);    // O  -> C2
  A[3,1]:=TransitionRate(v2,       888, 1,        -42,1/3);    // C1 -> O
  A[1,3]:=TransitionRate(v2,       888,-2,        -51,1/3);    // O  -> C1
  A[1,2]:=3;                                                   // O  -> I
  A[2,3]:=TransitionRate(v2,       100,-1,        -53,  1);    // I  -> C1
  A[3,4]:=TransitionRate(v2,       100,-1,        -60,  1);    // C1 -> C2
end;

procedure TNaundorfNa.tau_inf_SlowInactivation(v2:double; var tau_i,i_inf:double);
var v3,a,b :double;
begin
  { Slow inactivation }
  a:= 0.0077/(1+dexp(-(-42-v2)/9));
  b:= 0.0077/(1+dexp( (-42-v2)/9));
  tau_i:= 1 / (a + b);
  i_inf:= a / (a + b);
  if oN.NP.If_Slow_Na_inactivation<>1 then i_inf:=1;
end;

function TNaundorfNa.gNa_inf_Lyle:double;
{ Calculates stationary solution for Na-conductance }
var
     A          :arr4x4;
     L          :matr;
     X,B        :vect;
     S          :double;
     i,j        :integer;
begin
  alphas_Na_Lyle(oN.NV.V*1000,0{oN.NV.mm}, A);
  for i:=1 to NM do for j:=1 to NM do  L[i,j]:=A[j,i];
  for i:=1 to NM-1 do begin
      S:=0;
      for j:=1 to NM do  S:=S+A[i,j];
      L[i,i]:= -S;
      B[i]:=0;
  end;
  {Normalization}
  B[NM]:=1;   for j:=1 to NM do L[NM,j]:=1;
  {************************}
  LinearSistem(NM, L, B, X);
  {************************}
  for i:=1 to NM do  oN.NV.XNa[i]:=X[i];
  oN.NV.mm:=oN.NV.XNa[1];  oN.NV.hh:=1;
  gNa_inf_Lyle:=oN.NP.gNa*oN.NV.mm*(1-oN.NP.IfBlockNa);
end;

function TNaundorfNa.Conductance(x,y,z :double):double;
begin
  Conductance:=x*z*(1-oN.NP.IfBlockNa);
end;

function TNaundorfNa.Current:double;
var
     A                      :arr4x4;
     Sp,Sm,tau_i,i_inf      :double;
     i,j                    :integer;
begin
  alphas_Na_Lyle(oN.NV.V*1000,{0.1-oN.NV.wAHP}oN.NV.ii-0.9{oN.NV.mm}, A);      {!!!}
  for i:=1 to NM-1 do begin
      Sp:=0; Sm:=0;
      for j:=1 to NM do  if i<>j then begin
          Sp:=Sp + dt*1000*A[j,i]*oN.NV.XNa[j];
          Sm:=Sm + dt*1000*A[i,j];
      end;
      oN.NV.XNa[i]:=oN.NV.XNa[i] + Sp - Sm*oN.NV.XNa[i];
  end;
  {Normalization}
  oN.NV.XNa[NM]:=1;
  for i:=1 to NM-1 do oN.NV.XNa[NM]:=oN.NV.XNa[NM] - oN.NV.XNa[i];
  oN.NV.mm:=oN.NV.XNa[1];  oN.NV.hh:=1-oN.NV.XNa[2];
  { Slow inactivation }
  tau_inf_SlowInactivation(oN.NV.V*1000, tau_i,i_inf);
  oN.NV.ii:=oN.NV.ii+E_exp(dt,tau_i )*( i_inf-oN.NV.ii);
  Current:=oN.NP.gNa*Conductance(oN.NV.mm,0,1{oN.NV.ii})*(oN.NV.V-oN.NP.VNa);
end;

procedure TNaundorfNa.Init;
var   dum,tau_i :double;
begin
  dum:= gNa_inf_Lyle;
  { Slow inactivation }
  tau_inf_SlowInactivation(oN.NV.V*1000, tau_i,oN.NV.ii);
end;

end.

