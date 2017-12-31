unit Erf_Hazard;

interface

FUNCTION F_tilde(x :double) :double;
function fA_T(T,taum_taus :double) :double;

implementation
uses SysUtils,MathMyO,Unit1;

var
    Nerf,IfFsgmRead      :integer;
    exp_Int_0_u :array[0..500000] of double;
    erf                        :array[0..1000,1..2] of double;

function Erfic2(x :double):double;
{ Erfic(x) = 2/sqrt(pi) Int_0^x exp(-t^2) dt }
var  xb,dx    :double;
     aaa      :text;
     s1,s2    :string;
     i        :integer;
  function ErfTail(x :double):double;
  begin
    if x>0 then  ErfTail:= 1-exp(-x*x)/x/sqrt(pi)
           else  ErfTail:=-1-exp(-x*x)/x/sqrt(pi);
  end;
begin
  { Read Table }
  if IfFsgmRead<>1 then begin
     IfFsgmRead:=1;
{     assign(aaa,'erfic.d'); reset(aaa);
     i:=-1;
     repeat i:=i+1;
       readln(aaa,erf[i,1],erf[i,2]);
     until (eof(aaa));}
     i:=-1;
     repeat i:=i+1;
       s1:=Form1.ListBox1.Items[i];  s2:=s1;
       SetLength(s1,Pos(' ', s1));
       Delete(s2,1,Length(s1));
       erf[i,1]:=StrToFloat(s1);
       erf[i,2]:=StrToFloat(s2);
     until i=Form1.ListBox1.Items.Count-1;
     Nerf:=i;
  end;
  xb:=erf[0,1]; dx:=(erf[Nerf,1]-erf[0,1])/Nerf;
  if abs(x)>2.8 then  Erfic2:=ErfTail(x) else begin
     i:=trunc((x-xb)/dx);   if (xb+i*dx=x) then i:=i-1;
     Erfic2:=erf[i,2]+(erf[i+1,2]-erf[i,2])/dx*(x-erf[i,1]);
  end;
end;

function Erfic3(x :double):double;
{ Erfic(x) = 2/sqrt(pi) Int_0^x exp(-t^2) dt }
var y,x1,t,t2 :double;
begin
  x1:=x; if x<0 then x1:=-x;
  t:=1/(1+0.3275911*x1);  t2:=t*t;
  y:=1-(0.254829592*t-0.284496736*t2+1.421413741*t*t2-1.453152027*t2*t2
                     +1.061405429*t2*t2*t)*dexp(-sqr(x));
  if x>=0 then Erfic3:= y
          else Erfic3:=-y;
end;

FUNCTION F_tilde(x :double) :double;
{ Hazard function:
  F*sigma=sqrt(2/pi)*exp(-x^2)/(1-erf(x)) }
BEGIN
  if x>4       then begin  F_tilde:=x*sqrt(2); exit;  end;
  if x<-5      then begin  F_tilde:=0;         exit;  end;
  F_tilde:=sqrt(2/pi)*dexp(-x*x)/(1-Erfic(x));
END;

function fA_T(T,taum_taus :double) :double;
var i  :integer;
    T3,A0,z :double;
begin
  { White noise }
  if abs(T)<=2.5 then begin
     T3:=T*T*T;
//     A0:=dexp(-6.1E-3 -1.12*T -0.257*T*T -0.072*T3 -0.0117*T3*T);
     A0:=dexp(-2.478E-3 -1.123*T -0.2375*T*T -0.06567*T3
       -0.01813*T3*T -1.713E-003*T3*T*T + 5.484E-004*T3*T3
       +1.034E-004*T3*T3*T);
  end else if T>2.5 then A0:=0 else A0:=7;
  { Colored noise }
  if (taum_taus>0)and(A0>0) then begin
     z:=A0*(1-step(1+taum_taus,-0.71+0.0825*(T+3)));
  end else z:=A0;
  fA_T:=max(z,0);
end;

end.
