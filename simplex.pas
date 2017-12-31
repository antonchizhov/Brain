unit simplex;

interface
procedure Run_Simplex(ndim :integer);

implementation
uses Sysutils,MathMyO,Init,coeff,slice,other,graph_0d,Unit1;

procedure Run_Simplex(ndim :integer);
{ **********************************************************************
  Extracting of parameters 'g' by Simplex-method.
  **********************************************************************}
{const  mMax=4;}
type
   matr=array[1..mMax+1,1..mMax] of double;
   vec0=array[1..mMax] of double;
var
   p                        : matr;
   i,j,IfDrawSimplex        : integer;
   ptry                     : vec0;
   F                        : double;

function Funk(ptry: vec0) :double;
{ **********************************************************************}
{  Target function.                                                     }
{ **********************************************************************}
var  i,j,LimOK,iSmpl                    :integer;
     S,Si,dum,VexpMax,VmodMax           :double;
begin
  for j:=1 to ndim do  g_dg[j]:=ptry[j];
  { Check limits of coefficients }
  LimOK:=1;
  for i:=1 to mC do  if (ifC[i]=1) and
      ((g_dg[iC_ig[i]]<LimL[i]) or (g_dg[iC_ig[i]]>LimR[i]))
      then LimOK:=0;
  { If OK then calculate functional }
  if LimOK=1 then begin
     CoeffFrom_g(g_dg);
     {************************************}
     S:=0;
     for iSmpl:=1 to NSmpls do begin
         Smpl:=iSmpl;
         {**** Functional for Sample *********}
         dum:= Calc_Functional(m,VFunc);
         MaximumsOfSignals(VexpMax,VmodMax);
         Si:= TargetFuncOfSignalsUndimedWith(VexpMax,VexpMax);
         {************************************}
         S := S + Si/sc_Simplex;
     end;
     Funk:=S;
     {************************************}
  end else Funk:=1e8;
end;

function Funk1(ptry: vec0) :double;
{ **********************************************************************}
{  Target function.                                                     }
{ **********************************************************************}
var  i,j,LimOK                            :integer;
     S1,S2,S3,S4,      VexpMax2,VmodMax2,
     VexpMax3,VmodMax3,VexpMax4,VmodMax4  : double;
begin
  for j:=1 to m do  g_dg[j]:=ptry[j];
  { Check limits of coefficients }
  LimOK:=1;
  for i:=1 to mC do  if (ifC[i]=1) and
      ((g_dg[iC_ig[i]]<LimL[i]) or (g_dg[iC_ig[i]]>LimR[i])) then LimOK:=0;
  { If OK then calculate functional }
  if LimOK=1 then begin
     CoeffFrom_g(g_dg);
     { First Sample }
     Smpl:=1;
     {************************************}
     S1:= Calc_Functional(m,VFunc);
     S1:=S1/sc_Simplex;
     { Undimensioning of signals and correction of Functional }
     if IfUndimensionate=1 then begin
        MaximumsOfSignals(VexpMax,VmodMax);
        S1:= TargetFuncOfSignalsUndimedWith(VexpMax,VmodMax);
     end;
     Funk1:=S1;
     {************************************}
     { Second Sample }
     if NSmpls>=2 then begin
        Smpl:=2;
        {************************************}
        S2:= Calc_Functional(m,VFunc);
        S2:=S2/sc_Simplex;
        if IfUndimensionate=1 then begin
           MaximumsOfSignals(VexpMax2,VmodMax2);
           S2:= TargetFuncOfSignalsUndimedWith(VexpMax,VmodMax)
                                          *sqr(VexpMax/VexpMax2);
        end;
        Funk1:=S1+S2;
     end;
     {************************************}
     { Third Sample }
     if NSmpls>=3 then begin
        Smpl:=3;
        {************************************}
        S3:= Calc_Functional(m,VFunc);
        S3:=S3/sc_Simplex;
        if IfUndimensionate=1 then begin
           MaximumsOfSignals(VexpMax3,VmodMax3);
           S3:= TargetFuncOfSignalsUndimedWith(VexpMax,VmodMax)
                                          *sqr(VexpMax/VexpMax3);
        end;
        Funk1:=S1+S2+S3;
     end;
     {************************************}
     { Forth Sample }
     if NSmpls>=4 then begin
        Smpl:=4;
        {************************************}
        S4:= Calc_Functional(m,VFunc);
        S4:=S4/sc_Simplex;
        if IfUndimensionate=1 then begin
           MaximumsOfSignals(VexpMax4,VmodMax4);
           S4:= TargetFuncOfSignalsUndimedWith(VexpMax,VmodMax)
                                          *sqr(VexpMax/VexpMax4);
        end;
        Funk1:=S1+S2+S3+S4;
     end;
     {************************************}
  end else Funk1:=1e8;
  {if IfDrawSimplex=0 then  DrawOrNot:=1;}
end;

procedure SimplexMethod;
{
  Multidimensional minimization of the function 'Funk(X)' where 'x[1..ndim]'
  is a vector in 'ndim' dimensions, by the downhill simplex method.
  The matrix 'p[1..ndim+1, 1..ndim]' is input. Its 'ndim+1' rows are
  'ndim'-dimensional vectors which are the vertices of the starting simplex.
  Also input is the vector 'y[1..ndim+1]', whose components must be
  preinitialized to the values of 'Funk' evaluated at the 'ndim+1' vertices
  (rows) of 'p'; and 'ftol' the fractional convergence tolerance to be
  achieved in the function value. On output, 'p' and 'nFunk' gives the
  number of function evaluations taken.
}
{Uses
    Crt,Graph;}
const  {mMax=4;}
       TINY=1e-8;  NMAX=5000;
type
   {matr=array[1..mMax+1,1..mMax] of double;
   vec0=array[1..mMax] of double;}
   vec1=array[1..mMax+1] of double;
var
   {p                        : matr;}
   x,psum,ptry              : vec0;
   y                        : vec1;
   ftol,rtol,ysave,ytry
                                            : double;
   i,j,ihi,ilo,inhi
                                            : integer;

  function Amotry(fac: double) :double;
  {
    Extrapolates by factor 'fac' through the face of the simplex
    across from the high point, tries it, and replaces the high
    point is better.
  }
  var  j              :integer;
       fac1,fac2,ytry :double;
       ptry           :vec0;
  begin
    fac1:=(1-fac)/ndim;
    fac2:=fac1-fac;
    for j:=1 to ndim do  ptry[j]:=psum[j]*fac1-p[ihi,j]*fac2;
    ytry:=Funk(ptry);    { Evaluate the function at the trial point. }
    { If it's better than the highest, then replace the highest. }
    if ytry<y[ihi] then begin
       y[ihi]:=ytry;
       for j:=1 to ndim do begin
           psum[j]:=psum[j]+ptry[j]-p[ihi,j];
           p[ihi,j]:=ptry[j];
       end;
    end;
    Amotry:=ytry;
{    if IfDrawSimplex=1 then  Triangle(ptry,5+trunc(fac*2));}
  end;

  procedure GET_PSUM;
  var  i,j :integer;
       sum :double;
  begin
    for j:=1 to ndim do begin
        sum:=0;
        for i:=1 to ndim+1 do  sum:=sum+p[i,j];
        psum[j]:=sum;
    end;
  end;

  procedure SWAP(var a,b :double);
  var  tmp :double;
  begin
    tmp:=a;  a:=b;  b:=tmp;
  end;

  procedure Define_Ihi_Inhi_Ilow;
  var  i :integer;
  begin
    { First we determine which point is the highest (worst), next-highest, }
    { and lowest (best), by looping  over the points in the simplex.       }
    ihi:=1; for i:=2 to ndim+1 do  if y[i]>y[ihi] then  ihi:=i;
    ilo:=1; for i:=2 to ndim+1 do  if y[i]<y[ilo] then  ilo:=i;
    inhi:=ilo; for i:=1 to ndim+1 do
                   if (i<>ihi) and (i<>ilo) and (y[i]>y[inhi]) then  inhi:=i;
  end;

  procedure CheckAccuracy;
  var  i :integer;
  begin
    { Check accuracy }
    rtol:=2*abs(y[ihi]-y[ilo])/(abs(y[ihi])+abs(y[ilo])+TINY);
    { Compute the fractional range from highest to lowest and return }
    { if satisfactory. }
    if rtol<ftol then begin { If returning, put best point in slot 1. }
       SWAP(y[1],y[ilo]);
       for i:=1 to ndim do SWAP(p[1,i],p[ilo,i]);
       istop:=1;
    end;
    Functional:=y[1];
  end;


BEGIN
  { Tolerance }
  ftol:=0.0001;
  { Initial simplex }
  {for i:=1 to ndim+1 do  for j:=1 to ndim do
      if i=j then p[i,j]:=2 else p[i,j]:=1;}
  { Evaluation of 'Funk' in vertices }
  for i:=1 to ndim+1 do begin
      for j:=1 to ndim do ptry[j]:=p[i,j];
      y[i]:=Funk(ptry);
  end;
{  if IfDrawSimplex=1 then begin
     CloseGraph; DrawOrNot:=0;
     Graphics_Simplex;
     Initial_Picture_Simplex;  ihi:=1;
     Triangle(ptry,13);
  end;}
  {***********************************}
  nFunk:=0;
  GET_PSUM;
  istop:=0;
  Repeat
{    if IfDrawSimplex=1 then  Initial_Picture_Simplex;}
    Define_Ihi_Inhi_Ilow;
    CheckAccuracy;
    if istop=0 then begin
    {  **** Main part ************************************************* }
       if nfunk>=NMAX then writeln('NMAX exceeded');
       nFunk:=nFunk+2;
       { Begin a new iteration. First extrapolate by a factor -1 through }
       { the face of the simplex across from the point, i.e. reflect     }
       { the simplex from the high point.                                }
       ytry:=Amotry(-1);
       if ytry<=y[ilo] then begin
          { Gives a result better than the best point, so try an additional }
          { extrapolation by a factor 2.                                    }
          ytry:=Amotry(2);
       end else if ytry>=y[inhi] then begin
          { The reflected point is worse than second-highest, so look for an }
          { intermediate lower point, i.e., do a one-dimensional contraction.}
          ysave:=y[ihi];
          ytry:=Amotry(0.5);
          if ytry>=ysave then begin {Can't seem to get rid of that high point.}
             for i:=1 to ndim+1 do begin {Better contract around the lowest (best) point.}
                 if i<>ilo then begin
                    for j:=1 to ndim do begin
                        psum[j]:=0.5*(p[i,j]+p[ilo,j]);
                        p[i,j]:=psum[j];
                    end;
                    y[i]:=Funk(psum);
                 end;
             end;
             nfunk:=nfunk+ndim;     {Keep track of function evaluations.}
             GET_PSUM;              {Recompute 'psum'                   }
{             if IfDrawSimplex=1 then  Triangle(ptry,12);}
          end;
       end else nfunk:=nfunk-1;  {Correct the evaluation count.}
    end;
    if (DrawOrNot=0) and (IfDrawSimplex=0) then
        writeln('nfunk=',nfunk:4,' F=',y[ilo]:11);
    OutputHistory;
  Until istop=1; {Go back for the test of doneness and the next iteration.}
{  if IfDrawSimplex=1 then begin
     CloseGraph;
     Graphics;   DrawOrNot:=1;
  end;}
END;

{**************************************************************************}
BEGIN
  IfDrawSimplex:=0;
  { Main initial point }
  g_FromCoeff(g_dg);
  { Initial simplex }
  for i:=1 to ndim+1 do  for j:=1 to ndim do begin
      if i=j then begin
         p[i,j]:=g_dg[j]*(1.1+0.01*j);
      end else begin
         p[i,j]:=g_dg[j];
      end;
  end;
  SimplexMethod;
  { Results }
  Beep;
  if DrawOrNot<>1 then begin
     DrawOrNot:=1; {Graphics;} Initial_Picture;
  end;
  for j:=1 to ndim do  g_dg[j]:=p[1,j];
  CoeffFrom_g(g_dg);
  for j:=1 to ndim do  ptry[j]:=p[1,j];
  F:=Funk(ptry);
  {readln;}
  Warning('Stop Simplex.');
  PrintCoefficients;
  Pause; {while ('true'<>'false') do begin end;}
  nFunk:=0; { for drawing }
  F:=Funk(ptry);
END;
end.
 