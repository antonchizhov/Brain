unit Milescu_NaRO;
{ Approximation of the sodium channels from
[L.S.Milescu, T.Yamanishi, K.Ptak and J.C.Smith //
The Journal of Neuroscience, September 8, 2010 • 30(36):12113–12127] }

interface
uses t_dtO,ChannelO,MathMyO,NeuronO,typeNrnParsO;

type

  TMilescuNaR = class(TChannel)
  private
    NM  :integer;

    function TransitionRate(v2,k,V12 :double) :double;
    procedure alphas_NaR_Milescu(v2 :double; var A :arr26x26);
    procedure tau_inf_SlowInactivation(v2:double; var tau_i,i_inf:double);
    function gNaR_inf_Milescu:double;
  public
    function Current :double; override;
    function Conductance(x,y,z :double) :double; override;
    procedure Init; override;

    constructor Create(nrn: TNeuron);
  end;

implementation

constructor TMilescuNaR.Create(nrn: TNeuron);
begin  inherited Create; oN:=nrn; end;

{-------- NaR - Markov model -----------------------}
function TMilescuNaR.TransitionRate(v2,k,V12 :double) :double;
{ Calculate rate for Markov model, according to eq. from Table caption
   of the suppl. materials of  [Milescu, 2010] }
begin
  TransitionRate:=dexp(k*(v2-V12{-oN.NP.NaThreshShift}));
end;

procedure TMilescuNaR.alphas_NaR_Milescu(v2 :double; var A :arr26x26);
var
    i,j                                   :integer;
    al,be,ga,de,a_,b_,a2,b2,eta,eps,
    alh,beh,ga_,de_,alho,beho
                                          :double;
    Subtype                               :string;
{ States:   C1, C2, C3, C4, C5, O6,   I13,
            I7, I8, I9,I10,I11,I12,
           C14,C15,C16,C17,C18,O19,   I26,
           I20,I21,I22,I23,I24,I25
}
begin
  for i:=1 to NM do
      for j:=1 to NM do  A[i,j]:=0;
  { First layer - slow spiking }
  if (oN.NP.NaR_subtype='Milescu-13') or (oN.NP.NaR_subtype='Milescu-26') then begin
      a_:=0.71098;  a2:=a_*a_;
      b_:=8.1799;   b2:=b_*b_;
      al:=5.254 *TransitionRate(v2, 0.01474,0);
      be:=0.3454*TransitionRate(v2,-0.08526,0);
      ga:=85.07 *TransitionRate(v2, 0.005784,0);
      de:= 5.895*TransitionRate(v2,-0.01043 ,0);
      ga_:=25.45 *TransitionRate(v2, 0.005784,0);
      de_:=26.06 *TransitionRate(v2,-0.01043 ,0);
      alh:=0.01068 *TransitionRate(v2,-0.04270,0);
      beh:=0.05954 *TransitionRate(v2, 0.02803,0);
      alho:=0.004182 *TransitionRate(v2,-0.04270,0);
      beho:=1.805    *TransitionRate(v2, 0.02803,0);
  end else if oN.NP.NaR_subtype='Carter-12' then begin
      a_:=2.51;   a2:=a_*a_;
      b_:=5.32;   b2:=b_*b_;
      al:=250 *TransitionRate(v2, 1/24,0);
      be:= 12 *TransitionRate(v2,-1/24,0);
      ga:=250;
      de:= 60;
      ga_:=ga;
      de_:=de;
      alh:=2;
      beh:=0.01;
      alho:=0.05;
      beho:=8;
  end;
  A[ 1, 2]:=4*al;    // C1 -> C2
  A[ 2, 1]:=  be;    // C2 -> C1
  A[ 2, 3]:=3*al;    // C2 -> C3
  A[ 3, 2]:=2*be;    // C3 -> C2
  A[ 3, 4]:=2*al;    // C3 -> C4
  A[ 4, 3]:=3*be;    // C4 -> C3
  A[ 4, 5]:=  al;    // C4 -> C5
  A[ 5, 4]:=4*be;    // C5 -> C4
  A[ 7, 8]:=4*al*a_;    // I7 -> I8
  A[ 8, 7]:=  be/b_;    // I8 -> I7
  A[ 8, 9]:=3*al*a_;    // I8 -> I9
  A[ 9, 8]:=2*be/b_;    // I9 -> I8
  A[ 9,10]:=2*al*a_;    // I9 -> I10
  A[10, 9]:=3*be/b_;    // I10 -> I9
  A[10,11]:=  al*a_;    // I10 -> I11
  A[11,10]:=4*be/b_;    // I11 -> I10
  A[ 5, 6]:=  ga;    // C5 -> O6
  A[ 6, 5]:=  de;    // O6 -> C5
  A[11,12]:=  ga_;    // I11 -> I12
  A[12,11]:=  de_;    // I12 -> I11
  A[ 1, 7]:=  beh;    // C1 -> I7
  A[ 7, 1]:=  alh;    // I7 -> C1
  A[ 2, 8]:=  beh*a_;    // C2 -> I8
  A[ 8, 2]:=  alh/b_;    // I8 -> C2
  A[ 3, 9]:=  beh*a2;    // C3 -> I9
  A[ 9, 3]:=  alh/b2;    // I9 -> C3
  A[ 4,10]:=  beh*a_*a2;    // C4 -> I10
  A[10, 4]:=  alh/b_/b2;    // I10 -> C4
  A[ 5,11]:=  beh*a2*a2;    // C5 -> I11
  A[11, 5]:=  alh/b2/b2;    // I11 -> C5
  A[ 6,12]:=  beho;    // O6 -> I12
  A[12, 6]:=  alho;    // I12 -> O6
  if oN.NP.NaR_subtype='Milescu-13' then begin
     al:=2.073e-4 *TransitionRate(v2,-0.03096,0);
     be:=0.4008   *TransitionRate(v2,-0.01101,0);
     A[ 6,13]:=  be;    // O6 -> I13
     A[13, 6]:=  al;    // I13 -> O6
  end else if oN.NP.NaR_subtype='Milescu-26' then begin
     al:=5.987e-5 *TransitionRate(v2,-0.06819,0);
     be:=0.4260   *TransitionRate(v2, 0.01496,0);
     A[ 6,13]:=  be;    // O6 -> I13
     A[13, 6]:=  al;    // I13 -> O6
  end;
  {*************************************** 26 states **************************}
  if oN.NP.NaR_subtype='Milescu-26' then begin
     { Interlayer transitions }
     eps:=0.03731 *TransitionRate(v2, 0.1111 ,0);
     eta:=0.001808*TransitionRate(v2, 0.01301,0);
     A[ 1,14]:= eps;    // C1 -> C14
     A[14, 1]:= eta;    // C14 -> C1
     eps:=1.059   *TransitionRate(v2, 0.08020,0);
     eta:=0.05132 *TransitionRate(v2,-0.01791,0);
     A[ 6,19]:= eps;    // O6 -> O19
     A[19, 6]:= eta;    // O19 -> O6
     { Second layer - fast spiking }
     A[14,15]:=A[ 1, 2];
     A[15,14]:=A[ 2, 1];
     A[15,16]:=A[ 2, 3];
     A[16,15]:=A[ 3, 2];
     A[16,17]:=A[ 3, 4];
     A[17,16]:=A[ 4, 3];
     A[17,18]:=A[ 4, 5];
     A[18,17]:=A[ 5, 4];
     A[20,21]:=A[ 7, 8];
     A[21,20]:=A[ 8, 7];
     A[21,22]:=A[ 8, 9];
     A[22,21]:=A[ 9, 8];
     A[22,23]:=A[ 9,10];
     A[23,22]:=A[10, 9];
     A[23,24]:=A[10,11];
     A[24,23]:=A[11,10];
     A[18,19]:=A[ 5, 6];
     A[19,18]:=A[ 6, 5];
     A[24,25]:=A[11,12];
     A[25,24]:=A[12,11];
     A[14,20]:=A[ 1, 7];
     A[20,14]:=A[ 7, 1];
     A[15,21]:=A[ 2, 8];
     A[21,15]:=A[ 8, 2];
     A[16,22]:=A[ 3, 9];
     A[22,16]:=A[ 9, 3];
     A[17,23]:=A[ 4,10];
     A[23,17]:=A[10, 4];
     A[18,24]:=A[ 5,11];
     A[24,18]:=A[11, 5];
     A[19,25]:=A[ 6,12];
     A[25,19]:=A[12, 6];
     al:=0.01876 *TransitionRate(v2, 0.01534,0);
     be:=0.3355  *TransitionRate(v2,-0.02956,0);
     A[19,26]:=be;
     A[26,19]:=al;
  end;
end;

procedure TMilescuNaR.tau_inf_SlowInactivation(v2:double; var tau_i,i_inf:double);
var v3,a,b :double;
begin
  v3:= v2 {- oN.NP.NaThreshShift};
  { Slow inactivation }
  {[Fernandez, White 2010]}
  tau_i:= 100{200};
  i_inf:=    1/(1+dexp( 0.5 *(v3+{52}58)));
{  a:= 0.01 * vtrap(-(v3+50), 5);
  b:= 0.004* vtrap( (v3+75), 5);
  tau_i:= 1 / (a + b);
  i_inf:= 1 / (1 + dexp((v3+72)/(6.2)));}
{  a:= 0.0077/(1+dexp(-(-42-v3)/9));
  b:= 0.0077/(1+dexp( (-42-v3)/9));
  tau_i:= 1 / (a + b);
  i_inf:= a / (a + b);}
  if oN.NP.If_Slow_Na_inactivation<>1 then i_inf:=1;
end;

function TMilescuNaR.gNaR_inf_Milescu:double;
{ Calculates stationary solution for NaR-conductance }
var
     A          :arr26x26;
     L          :matr;
     X,B        :vect;
     S          :double;
     i,j        :integer;
begin
  alphas_NaR_Milescu(oN.NV.V*1000, A);
  for i:=1 to NM do for j:=1 to NM do  L[i,j]:=A[j,i];
  for i:=1 to NM-1 do begin
      S:=0;
      for j:=1 to NM do  S:=S+A[i,j];
      L[i,i]:= -S;
      B[i]:=0;
  end;
  { Normalization }
  B[NM]:=1;   for j:=1 to NM do L[NM,j]:=1;
  {****************************}
  LinearSistem(NM, L, B, X);
  {****************************}
  for i:=1 to NM do  oN.NV.XNaR[i]:=X[i];
  oN.NV.mmR:=oN.NV.XNaR[6];
  if NM>13 then oN.NV.mmR:=oN.NV.mmR+oN.NV.XNaR[19];
  oN.NV.hhR:=1;
  gNaR_inf_Milescu:=oN.NP.gNaR*oN.NV.mmR*(1-oN.NP.IfBlockNaR);
end;

function TMilescuNaR.Conductance(x,y,z :double):double;
begin
  Conductance:=x*z*z*z*(1-oN.NP.IfBlockNaR);      // mh^3 [Fernandez, White 2010]
end;

function TMilescuNaR.Current:double;
var
     A                      :arr26x26;
     Sp,Sm,tau_i,i_inf,S    :double;
     i,j                    :integer;
     X                      :vect;
begin
  alphas_NaR_Milescu(oN.NV.V*1000, A);
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
  S:=0;  for i:=1 to NM-1 do S:=S + oN.NV.XNaR[i];
  oN.NV.XNaR[NM]:=max(1-S,0);
  oN.NV.mmR:=oN.NV.XNaR[6];
  if NM>13 then oN.NV.mmR:=oN.NV.mmR+oN.NV.XNaR[19];
  oN.NV.hhR:=1;
  { Slow inactivation }
  tau_inf_SlowInactivation(oN.NV.V*1000, tau_i,i_inf);
  oN.NV.iiR:=oN.NV.iiR+E_exp(dt,tau_i)*(i_inf-oN.NV.iiR);
  Current:=oN.NP.gNaR*Conductance(oN.NV.mmR,0,oN.NV.iiR)*(oN.NV.V-oN.NP.VNa);
end;

procedure TMilescuNaR.Init;
var   dum,tau_i :double;
begin
  NM:=26;
  if oN.NP.NaR_subtype='Milescu-13' then NM:=13;
  if oN.NP.NaR_subtype='Milescu-26' then NM:=26;
  if oN.NP.NaR_subtype='Carter-12'  then NM:=12;
  dum:= gNaR_inf_Milescu;
  { Slow inactivation }
  tau_inf_SlowInactivation(oN.NV.V*1000, tau_i,oN.NV.iiR);
  if (oN.NP.NaR_subtype='Carter-12')and(dt>0.02/1000) then dt:=0.02/1000; {s}
end;

end.

