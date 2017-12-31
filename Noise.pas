unit Noise;

interface
uses Init;
procedure AnalyseStatistics;

implementation

const
     nt_corr=400;
type
     ghyst=array[-1..1000] of longint;
     corr_vect=array[0..nt_corr] of real;
var
     a_ghyst,b_ghyst,
     r1,r2                              : real;
     ggm                                : ghyst;
     corr,xC,spectr                     : corr_vect;

procedure SetGhystogramm(xi, { random value }
                         a,b :real; { limits of value}
                         n_intervals :integer; { amount of intervals }
                         var ggm :ghyst { points in intervals });
var
    i,j          : integer;
begin
  a_ghyst:=a;  b_ghyst:=b;   { remember limits }
  ggm[-1]:=n_intervals;                     { 'ggm[-1]'-amount of intervals }
  if (xi>=a) and (xi<=b) then begin
    if ggm[0]=0 then begin
       for j:=1 to n_intervals do ggm[j]:=0;
       ggm[0]:=1;
    end;
    i:=trunc((xi-a)/(b-a)*n_intervals)+1;   { 'xi' is in interval 'i' }
    ggm[0]:=ggm[0]+1;                       { 'ggm[0]' - amount of points }
    ggm[i]:=ggm[i]+1;
  end;
end;

procedure CalculateSpectr;
var  nw,nt   :integer;
     w,t,f,fc:real;
     bbb     :text;
begin
  for nw:=1 to nt_corr do begin
      w:=1/(nw*dt);
      spectr[nw]:=0;
      for nt:=1 to nt_corr do begin
          t:=(nt{-0.5})*dt;
          f:=(corr[nt]+corr[nt{-1}])/2;
          fc:=0.54+0.46*cos(pi*nt/nt_corr);
          spectr[nw]:=spectr[nw]+f*fc*cos(2*pi*w*t)*dt/2/pi;
      end;
  end;
  { Write correlation }
  assign(bbb,'spectr.dat');  rewrite(bbb);
    for nw:=1 to nt_corr do
        writeln(bbb,1/(nw*dt):8:4,' ',spectr[nw]:9:5);
  close(bbb);
end;

procedure Correlation(x_new :real);
var
    nt,n    :integer;
begin
  { Initial values for 'xC' }
  nt:=round(t);
  if nt<=nt_corr then begin
      xC[nt]:=x_new;
      corr[nt]:=0;
      n:=0;
  end else begin
      n:=n+1;
      { Rename values }
      for nt:=0 to nt_corr-1 do  xC[nt]:=xC[nt+1];
      { New value }
      xC[nt_corr]:=x_new;
      { Add to correlation }
      for nt:=0 to nt_corr do  corr[nt]:=(corr[nt]*(n-1)+xC[0]*xC[nt])/n;
  end;
end;

procedure AnalyseStatistics;
begin
  SetGhystogramm(Q[1], 0,100{Hz},30{number of intervals},ggm);
  Correlation(Q[1]);
end;

end.
