unit Statistics;

interface
uses Init,t_dtO,MathMyO,Unit13;

procedure WriteHystogram;
procedure CalculateSpectr;
procedure AnalyseStatistics(NewValue :double);

implementation
uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

const nt_corr_max=4000;
type
     ghyst=array[-1..1000] of longint;
     corr_vect=array[0..nt_corr_max] of double;
var
     n_corr,nt_corr,nStat               : integer;
     a_ghyst,b_ghyst,Mean,Variance      : double;
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

procedure WriteHystogram;
var  bbb        :text;
     i          :integer;
     xi         :double;
begin
  assign(bbb,'hystogramm.dat');  rewrite(bbb);
  if ggm[0]>0 then begin
     for i:=1 to ggm[-1] do begin
         xi:=a_ghyst+(b_ghyst-a_ghyst)/ggm[-1]*(i-1);
         writeln(bbb,xi:10:3,' ',ggm[i]/ggm[0]:10:5,' ');
     end;
  end;
  close(bbb);
end;

procedure CalculateSpectr;
var  nw,nt      :integer;
     w,t,f,fc,z :double;
     bbb        :text;
begin
  for nw:=1 to nt_corr do begin
      w:=1/(nw*dt);
      spectr[nw]:=0;
      for nt:=1 to nt_corr do begin
          t:=(nt-0.5)*dt;
          f:=(corr[nt]+corr[nt-1])/2;
          fc:=0.54+0.46*cos(pi*nt/nt_corr);
          spectr[nw]:=spectr[nw]+f*fc*cos(2*pi*w*t)*dt/2/pi;
      end;
  end;
  { Draw }
  Form13.Series3.Clear;
  Form13.Chart3.BottomAxis.Maximum:=Form13.DDSpinEdit4.Value;
  for nw:=1 to nt_corr do
      if (1/(nw*dt)<=Form13.Chart3.BottomAxis.Maximum) then
          Form13.Series3.AddXY(1/(nw*dt),spectr[nw]);
  { Write correlation and spectr}
  assign(bbb,'spectr.dat');  rewrite(bbb);
  for nw:=1 to nt_corr do begin
      if corr[0]<>Mean*Mean then z:=(corr[nw]-Mean*Mean)/(corr[0]-Mean*Mean)
                            else z:=0;
      write  (bbb,nw*dt*1e3:8:3,' ',z:9:5,' ');
      writeln(bbb,1/(nw*dt):8:4,' ',spectr[nw]:10:6);
  end;
  close(bbb);
end;

procedure Correlation(x_new :real);
var  k :integer;
begin
  { Initial values for 'xC' }
  if nt<=nt_corr then begin
      xC[nt]:=x_new;
      corr[nt]:=0;
      n_corr:=0;
  end else begin
      n_corr:=n_corr+1;
      { Rename values }
      for k:=0 to nt_corr-1 do  xC[k]:=xC[k+1];
      { New value }
      xC[nt_corr]:=x_new;
      { Add to correlation }
      for k:=0 to nt_corr do  corr[k]:=(corr[k]*(n_corr-1)+xC[0]*xC[k])/n_corr;
  end;
end;

procedure AnalyseStatistics(NewValue :double);
var
    i,n           :integer;
    a,b,xi,z,tau  :double;
    t1            :string;
begin
  { Initial conditions }
  if nt<=1 then begin
      nStat:=0;
      Mean     :=0;
      Variance :=0;
      for i:=0 to ggm[-1] do begin
          ggm[i]:=0;
      end;
      Form13.Series1.Clear;
      Form13.Series2.Clear;
  end;
  { Mean value and dispertion }
  nStat:=nStat+1;
  Mean     :=(Mean     *nStat + NewValue         )/(nStat+1);
  Variance :=(Variance *nStat + NewValue*NewValue)/(nStat+1);
  { Add current value to the ghystogramm and correlation function }
  a      :=           Form13.DDSpinEdit5.Value;
  b      :=           Form13.DDSpinEdit1.Value;
  n      :=     trunc(Form13.DDSpinEdit2.Value); {number of intervals}
  nt_corr:=imin(trunc(Form13.DDSpinEdit3.Value),nt_corr_max);
  SetGhystogramm(NewValue,a,b,n,ggm);
  Correlation(NewValue);
  { Draw the ghystogramm and correlation function }
  if (trunc(nt/10/n_show)=nt/10/n_show) then begin
      { Write Mean and Variance }
      str(Mean:9:2,t1);
      Form13.Label2.Caption:=' Mean = '+t1;
      str(sqrt(abs(Variance)):9:2,t1);
      Form13.Label3.Caption:=' Dispersion = '+t1;
      { Draw the ghystogramm }
      if ggm[0]>0 then begin
         Form13.Series1.Clear;
         for i:=1 to ggm[-1] do begin
             xi:=a_ghyst+(b_ghyst-a_ghyst)/ggm[-1]*(i-1);
             Form13.Series1.AddXY(xi,ggm[i]/ggm[0]);
         end;
      end;
      { Draw the correlation function }
      if Variance>0 then begin
         Form13.Series2.Clear;
         for i:=0 to nt_corr do begin
             z:=(corr[i]-Mean*Mean)/(corr[0]-Mean*Mean);
             Form13.Series2.AddXY(i*dt*1e3,z);
         end;
      end;
      { Calculate and draw tau }
      if (n_corr>nt_corr+20)and(corr[0]>0) then begin
//          tau:=dt/(1-(corr[1]-Mean*Mean)/(corr[0]-Mean*Mean));
          tau:=(corr[0]-Mean*Mean)*dt/(corr[1]-corr[2]);
          str(tau*1e3:9:2,t1);
          Form13.Label1.Caption:=' tau = '+t1;
      end;
  end;
  Application.ProcessMessages;
end;

end.
