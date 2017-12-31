unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TeEngine, Series, ExtCtrls, TeeProcs, Chart,
  DDSpinEdit;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Chart2: TChart;
    LineSeries1: TLineSeries;
    LineSeries2: TLineSeries;
    Series3: TLineSeries;
    Series4: TLineSeries;
    Series5: TLineSeries;
    Series6: TLineSeries;
    Series7: TLineSeries;
    Series8: TLineSeries;
    Chart3: TChart;
    LineSeries3: TLineSeries;
    LineSeries4: TLineSeries;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Chart4: TChart;
    LineSeries5: TLineSeries;
    Series9: TLineSeries;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DDSpinEdit1: TDDSpinEdit;
    Label7: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure ReadAndAnalyseData;
var
     i,ni,ni_1,nt,nt_end,i_maxU,i_maxnu,i_massnu,ip
                                                    :integer;
     s1                                             :string;
     theta,rn1,pext
                                                    :array[0..200] of double;
     U,nu
                                                    :array[1..4,0..200] of double;
     xxx,yyy                                        :text;
     maxU,maxnu,minU,minnu,massnu,thnu,th_massnu,
     t,
     dTheta_nu,dTheta_U,dth,dum1,dum2
                                                    :double;
     t1                                             :string;
     U12,nu12,th_nu,th_U                            :array[1..2] of double;
     iU12,inu12                                     :array[1..2] of integer;
     ch                                             :array[0..100] of char;
begin
  ip:=trunc(Form1.DDSpinEdit1.Value);
  { Head of file }
  s1:=Form1.ComboBox1.Items[Form1.ComboBox1.ItemIndex];//'V1(t,x)_Qns20_Iext4.dat';
  assign(xxx,s1); reset(xxx);
  readln(xxx);
  for i:=1 to 12 do read(xxx,ch[i]);  readln(xxx);
  s1:=ch[3]+ch[4]+ch[5];
  ni_1:=StrToInt(s1);
  ni:=ni_1-1;
  s1:=ch[9]+ch[10]+ch[11]; if ch[12]<>',' then s1:=s1+ch[12];
  nt_end:=StrToInt(s1);
  { File to write }
  assign(yyy,'Width_and_max.dat'); rewrite(yyy);
  { Initial conditions }
  nt:=0;
  Form1.Series1.Clear;
  Form1.Series2.Clear;
  Form1.Series9.Clear;
  Form1.LineSeries3.Clear;
  Form1.LineSeries4.Clear;
  Form1.LineSeries5.Clear;
  repeat nt:=nt+1;
    { Read distribution at one time step }
    for i:=0 to ni do begin
        read  (xxx,t,theta[i]);
        if t=0 then begin
           t:=t+0.00000000001;
        end;
        case Form1.ComboBox1.ItemIndex of
        0,5: begin
               read(xxx,U[1,i],rn1[i],nu[1,i],pext[i]);
               if (not(eoln(xxx)))and(ip>=2) then read(xxx,U[2,i],nu[2,i]);
               if (not(eoln(xxx)))and(ip>=3) then read(xxx,U[3,i],nu[3,i]);
               if (not(eoln(xxx)))and(ip>=4) then read(xxx,U[4,i],nu[4,i]);
               readln(xxx);
             end;
        1: begin
               read(xxx,pext[i],U[1,i],nu[1,i]);
               if (not(eoln(xxx)))and(ip>=2) then read(xxx,U[2,i],nu[2,i]);
               if (not(eoln(xxx)))and(ip>=3) then read(xxx,U[3,i],nu[3,i]);
               if (not(eoln(xxx)))and(ip>=4) then read(xxx,U[4,i],nu[4,i]);
               readln(xxx);
           end;
        3: begin readln(xxx,dum1,pext[i],dum2,nu[1,i]); U[1,i]:=0; end;  //- for KFP
        2,4: begin readln(xxx,nu[1,i]); U[1,i]:=0; end;                  //- for FR
        end;
    end;
{ 0: V1(t,x)*.dat:
      write  (xxx,t*1000:9:5,' ',(i/ni-0.5)*180:9:5);
      write  (xxx,' ',Columns[i,1].Pop[1].U*1e3:8:4,' ',Columns[i,1].rn[1,1]:8:4);
      write  (xxx,' ',Columns[i,1].Pop[1].nu:8:4,' ',pext:8:4);
      if NPop>=2 then for ip:=2 to NPop do begin
         write(xxx,' ',Columns[i,1].Pop[ip].U*1e3:8:4,' ',Columns[i,1].Pop[ip].nu:8:4);
      end;
      writeln(xxx);
{ 1: Ring(t,x)_from_xy.dat:
           write  (bbb,i*dx*1e3:9:5,' ',j*dy*1e3:9:5,' ',rext:8:2,' ');
           for ip:=1 to NPop do  write(bbb,Pop[ip].U*1e3:9:5,' ',Q[ip]:8:2,' ');
           write(bbb,VisualStimulationScreen(i,j):9:5,' ');
           write(bbb,z[i,j]:10:4,' ',Pop[1].ss:9:5,' ',Pop[2].ss:9:5,' ');}
{ 2: Ring(t,x)*.dat:
      writeln(bbb,t*1000:9:5,' ',fi/pi*180:9:3,' ',z_fi[l]:10:5);}
{ 3,4: V1_f_Stim_Isyn_nu(t,x).dat:
      write  (xxx,t:9:5,' ',180*i_/Nnrn-90:9:5);
      writeln(xxx,' ',f[i]:8:4,' ',Stimul:8:4,' ',Isyn[i]:8:4,' ',nu[i]:8:4);}
    dth:=theta[1]-theta[0];
    { Draw the distribution }
    Form1.LineSeries1.Clear;
    Form1.LineSeries2.Clear;
    Form1.Series3.Clear;
    Form1.Series4.Clear;
    Form1.Series5.Clear;
    Form1.Series6.Clear;
    Form1.Series7.Clear;
    Form1.Series8.Clear;
    for i:=0 to ni do begin
        Form1.LineSeries1.AddXY(theta[i],nu[ip,i]);
        Form1.LineSeries2.AddXY(theta[i], U[ip,i]);
    end;
    Application.ProcessMessages;
    { Finding the maximum }
    maxU:=-100; maxnu:=0; minU:=100;  minnu:=10000;  massnu:=0;
    for i:=0 to ni do begin
        if U[ip,i] >maxU  then begin maxU:=U[ip,i];    i_maxU:=i; end;
        if U[ip,i] <minU  then       minU:=U[ip,i];
        if nu[ip,i]>maxnu then begin maxnu:=nu[ip,i];  i_maxnu:=i; end;
        if nu[ip,i]<minnu then       minnu:=nu[ip,i];
    end;
    { Finding the width }
    {Left, U}
    i:=i_maxU;
    repeat i:=i-1;
      if i=-1 then i:=ni;
    until (U[ip,i]<=0.5*(maxU+minU))or(i=i_maxU);
    U12[1]:=U[ip,i]; iU12[1]:=i;
    th_U[1]:=theta[i];
    if (i<ni)and(abs(U[ip,i+1]-U[ip,i])>1e-3) then
       th_U[1]:=th_U[1]+dth*(0.5*(maxU+minU)-U[ip,i])/(U[ip,i+1]-U[ip,i]);
    {Left, nu}
    i:=i_maxnu;
    repeat i:=i-1;
      if i=-1 then i:=ni;
    until (nu[ip,i]<=0.5*(maxnu+minnu))or(i=i_maxnu);
    nu12[1]:=nu[ip,i]; inu12[1]:=i;
    th_nu[1]:=theta[i];
    if (i<ni)and(abs(nu[ip,i+1]-nu[ip,i])>1e-3) then
       th_nu[1]:=th_nu[1]+dth*(0.5*(maxnu+minnu)-nu[ip,i])/(nu[ip,i+1]-nu[ip,i]);
    {Right, U}
    i:=i_maxU;
    repeat i:=i+1;
      if i=ni+1 then i:=0;
    until (U[ip,i]<=0.5*(maxU+minU))or(i=i_maxU);
    U12[2]:=U[ip,i]; iU12[2]:=i;
    th_U[2]:=theta[i];
    if (i>0)and(abs(U[ip,i]-U[ip,i-1])>1e-3) then
       th_U[2]:=th_U[2]+dth*(0.5*(maxU+minU)-U[ip,i])/(U[ip,i]-U[ip,i-1]);
    {Right, nu}
    i:=i_maxnu;
    repeat i:=i+1;
      if i=ni+1 then i:=0;
    until (nu[ip,i]<=0.5*(maxnu+minnu))or(i=i_maxnu);
    nu12[2]:=nu[ip,i]; inu12[2]:=i;
    th_nu[2]:=theta[i];
    if (i>0)and(abs(nu[ip,i]-nu[ip,i-1])>1e-3) then
       th_nu[2]:=th_nu[2]+dth*(0.5*(maxnu+minnu)-nu[ip,i])/(nu[ip,i]-nu[ip,i-1]);
    { Draw }
    dTheta_nu:=(th_nu[2]-th_nu[1])/2;
    dTheta_U :=(th_U[2] -th_U[1] )/2;
    if inu12[2]<=inu12[1] then  dTheta_nu :=dTheta_nu + 90;
    if iU12[2] <=iU12[1]  then  dTheta_U  :=dTheta_U  + 90;
    Form1.LineSeries3.AddXY(t,maxnu);
    Form1.LineSeries4.AddXY(t,maxU);
    massnu:=0;  thnu:=0;
    { Finding the centre of mass for nu }
    for i:=inu12[1] to inu12[2] do begin
        thnu  :=thnu   + theta[i]*(nu[ip,i]-0.5*(maxnu+minnu));
        massnu:=massnu + (nu[ip,i]-0.5*(maxnu+minnu));
    end;
    if massnu>0 then th_massnu:=thnu/massnu;
    Form1.LineSeries5.AddXY(t,th_massnu{theta[i_maxnu]});
    Form1.Series9.AddXY(t,theta[trunc((inu12[2]+inu12[1])/2)]);
    Form1.Series5.AddXY(theta[inu12[2]],nu12[2]);
    Form1.Series3.AddXY(theta[inu12[1]],nu12[1]);
    Form1.Series6.AddXY(theta[iU12[2]],U12[2]);
    Form1.Series4.AddXY(theta[iU12[1]],U12[1]);
    Form1.Series7.AddXY(theta[i_maxU],maxnu);
    Form1.Series8.AddXY(theta[i_maxU],maxU);
    if maxnu-minnu>0.1 then
    Form1.Series1.AddXY(t,dTheta_nu);
    if maxU-minU>0.1 then
    Form1.Series2.AddXY(t,dTheta_U);
    { Writing }
    write  (yyy,t:5:0,' ',dTheta_U:8:3,' ',dTheta_nu:8:3,' ');
    writeln(yyy,maxU:8:3,' ',maxnu:8:3,' ',th_massnu:8:3);
    { Print time & outputs }
    str(t:5:1,t1);
    t1:='Time='+t1+' ms';
    Form1.Label2.Caption:=t1;
    str(dTheta_nu:5:1,t1);
    t1:='HWHH for nu='+t1;
    Form1.Label3.Caption:=t1;
    str(dTheta_U:5:1,t1);
    t1:='HWHH for U ='+t1;
    Form1.Label4.Caption:=t1;
    str(maxnu:5:1,t1);
    t1:='nu_max, Hz ='+t1;
    Form1.Label5.Caption:=t1;
    str(maxU-minU:5:1,t1);
    t1:='max-min for U ='+t1;
    Form1.Label6.Caption:=t1;
    if nt mod 10 = 0 then Application.ProcessMessages;
  until (nt=nt_end)or(eof(xxx));
  close(xxx);
  close(yyy);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ReadAndAnalyseData;
end;

end.
