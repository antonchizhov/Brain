unit exp_nu_Pyr;

interface
function Gauss(x,sigma :double) :double;
function SumGauss(ti :double; dt :array of double; nend :integer) :double;

implementation

function Gauss(x,sigma :double) :double;
begin
  if sigma<>0 then Gauss:=exp(-sqr(x/sigma)/2)/(sqrt(2*pi)*sigma)
              else Gauss:=0;
end;

function SumGauss(ti :double; dt :array of double; nend :integer) :double;
var  S,sigma,nondim_sigma       :double;
     i                          :integer;
     t :array[0..200] of double;
begin
  { Fill array 't' }
  t[1]:=dt[1];
  for i:=2 to nend do t[i]:=t[i-1]+dt[i];
  { Summing }
  S:=0;
  nondim_sigma:=0.2;
  for i:=1 to nend do begin
         sigma:=nondim_sigma*dt[i];
         S:=S+Gauss(ti-t[i],i*sigma);
  end;
  SumGauss:=S;
end;

PROCEDURE CalcExpFiringRateForPyramid(I :double);
{
Calculate experimental firing rate for pyramid, registered
while current I (nA) is induced.
}
var t,nu                :double;
    l,nl,n,k,nend       :integer;
    dt,v                :array[0..200] of double;
    aa                  :array[0..5]   of text;
    ccc                 :text;

  procedure ReadingFilesForPyramid(I :double);
  var k                              :integer;
      Ir,Io,vo,vr                    :double;
  begin
    { Opening }
    assign(aa[1],'v1(I).d');  reset(aa[1]);
    assign(aa[2],'v2(I).d');  reset(aa[2]);
    assign(aa[3],'v3(I).d');  reset(aa[3]);
    assign(aa[4],'v4(I).d');  reset(aa[4]);
    assign(aa[5],'v5(I).d');  reset(aa[5]);
    assign(aa[0],'v_st(I).d');  reset(aa[0]);
    { Reading }
    for k:=0 to 5 do begin
        Ir:=0; vr:=0;
        while (not eof(aa[k])) and (I>Ir) do begin
              Io:=Ir; vo:=vr;
              readln(aa[k],Ir,vr);
        end;
        v[k]:=(vr-vo)/(Ir-Io)*(I-Io) + vo;
    end;
    { Closing }
    for k:=0 to 5 do close(aa[k]);
  end;

BEGIN
  assign(ccc,'nu(t).dat');
  rewrite(ccc);
  writeln(ccc,'0 0 ');
  ReadingFilesForPyramid(I);
  nend:=20;
  for k:=6 to nend do v[k]:=v[5];
  for k:=1 to nend do dt[k]:=1000/v[k];
  { Summ spikes according to Gauss distribution }
  t:=0;
  for n:=1 to nend do begin
      nl:=20;
      for l:=1 to nl do begin
          t:=t+dt[n]/nl;
          nu:=SumGauss(t,dt,nend)*1000;
          writeln(ccc,t:8:5,' ',nu:8:5);
      end;
  end;
  close(ccc);
END;

end.
 