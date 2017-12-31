unit Extractor;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DDSpinEdit, TeEngine, Series, ExtCtrls, TeeProcs,
  Chart,
  Unit1,Lattice, Unit15;

var
  z                                      :array[0..13] of arr_X_Y;
  AveragedSelected_z                     :arr_X_Y;
  N_vars,nj,ni,
  IfStepByStep,IfDoNextStep,
  IfStopSteppingAndKeepMoving,IfStop     :integer;
  CurrentDir                             :string;

procedure Extract(rPW :integer);
procedure ExtractProfileAcrossRadiusAt(t_in_ms,rPW,Theta :integer);
procedure ExtractHorizontalProfileAt(t_in_ms,rPW :integer);

implementation

function NextFileNameAfter(t_in_ms :integer; FileBeginning :string;
                                                    var FN :string) :integer;
var   t1                  :string;
      IfFound             :integer;
      sr                  :TSearchRec;
begin
  if CurrentDir<>'' then ChDir(CurrentDir);
  FN:='';
  { Read Root-Directory content }
  IfFound:=FindFirst('*.*',faDirectory, sr);
  FN:='';
  while FindNext(sr)=0 do begin
    str(t_in_ms+1:3,t1);
    if Pos(FileBeginning+t1, sr.Name)>0 then begin
       FN:=sr.Name;
    end;
  end;
  FindClose(sr);
  if FN<>'' then NextFileNameAfter:=1
            else NextFileNameAfter:=0;
end;

procedure ReadFieldsFromXYfile(FN :string);
var aaa :text;
    t1,s1,s2 :string;
    i,j,iv :integer;
    x,y,z_ :double;
    ch     :char;
begin
  assign(aaa,FN); reset(aaa);
  readln(aaa,t1);
  readln(aaa,t1);
  nj:=StrToInt(t1[3]+t1[4]+t1[5]);
  ni:=StrToInt(t1[9]+t1[10]+t1[11]);

//           {           V1               V2               V3              }
//           write  (bbb,i*dx*1e3:9:5,' ',j*dy*1e3:9:5,' ',rext:8:2,' ');
//           {                                    U1-V4        nu1-V5      }
//           {                                    U2-V6        nu2-V7      }
//           {                                    U3-V8        nu3-V9      }
//           {                                    U4-V10       nu4-V11     }
//           for ip:=1 to NPop do   write(bbb,Pop[ip].U*1e3:9:5,' ',Pop[ip].nu:8:2,' ');
//           for ip:=NPop+1 to 4 do write(bbb,'0 0 ');
//           {         V12                                                 }
//           write(bbb,VisualStimulation(t,i,j):9:5,' ');
//           {         V13             V14                                 }
//           write(bbb,z[i,j]:10:4,' ',Pop[1].sE+Pop[1].sI:9:5,' ');
//           {                        V15                                  }
//           if NPop>1 then write(bbb,Pop[2].sE+Pop[2].sI:9:5,' ') else write(bbb,'0 ');
//           {         V16                                                 }
//           write(bbb,VSD(Columns[i,j]):9:5,' ');
//           writeln(bbb);

  for i:=1 to ni do  begin
      for j:=1 to nj do begin
          read(aaa,x,y);
          iv:=0;
          { "iv" indexes: 0-rext
                          1-U1  2-nu1  3-U2  4-nu2
                          5-U3  6-nu3  7-U4  8-nu4
                          9-VisualStimulation
                          10-z  11-ss[1]  12-ss[2]
                          13-VSD }
          while {not(eoln(aaa))and}(iv<N_vars-1) do begin
             {for iv:=0 to N_vars-1 do}
             read(aaa,z_,ch);
             z[iv][i,j]:=z_;
             iv:=iv+1;
             if eoln(aaa) then N_vars:=iv+1;
          end;
          readln(aaa);
          { VSD-signal }
{          if (z[3][i,j]=0) then begin
              z[N_vars-1][i,j]:=z[1][i,j];
          end else if (z[5][i,j]=0)and(z[7][i,j]=0) then begin
              z[N_vars-1][i,j]:=(3*z[1][i,j]+z[3][i,j])/4;
          end else begin
              z[N_vars-1][i,j]:=(3*z[5][i,j]+z[7][i,j])/4*0.95
                               +(3*z[1][i,j]+z[3][i,j])/4*0.05;
          end;}     { commented on 1.08.2016 }
      end;
  end;
  close(aaa);
end;

procedure Interpolate_at_xy(x,y:double; var z_ :arr_vars);
var
    i,j,iv :integer;
    S1,S2,S3,S4 :double;
begin
  i:=trunc(x);
  j:=trunc(y);
  S1:=(i+1-x)*(j+1-y);
  S2:=(i+1-x)*(y-j);
  S3:=(x-i)  *(y-j);
  S4:=(x-i)  *(j+1-y);
  for iv:=0 to N_vars-1 do begin
      z_[iv]:=S1*z[iv][i,j] + S2*z[iv][i,j+1] + S3*z[iv][i+1,j+1] + S4*z[iv][i+1,j];
  end;
end;

procedure Write_Averaged_Field;
var  i,j    :integer;
     bbb    :text;
begin
  { Prepare file }
  assign(bbb,'AveragedSelected_z(x,y).dat');  rewrite(bbb);
  writeln(bbb,'ZONE T="AveragedSelected_z(x,y).dat"');
  writeln(bbb,'I=',nj:3,',J=',ni:3,',K=1,F=POINT');
  { Write fields }
  for i:=1 to ni do begin
      for j:=1 to nj do begin
          writeln(bbb,i:5,' ',j:5,' ',AveragedSelected_z[i,j]:9:5);
      end;
  end;
  close(bbb);
end;

function AverageAcrossDomain(F_:arr_X_Y) :double;
var S :double;
    i,j :integer;
begin
  S:=0;
  for i:=1 to ni do begin
      for j:=1 to nj do begin
          S:=S+F_[i,j];
      end;
  end;
  if ni*nj>0 then  AverageAcrossDomain:=S/ni/nj;
end;

procedure Extract(rPW :integer);
{ Writes distribution on a circle, interpolating values from rectangular mesh. }
{ Extracts chosen variable at chosen location i_view,j_view. }
var
    fi,rPlot,x,y,t_startInt,t_endInt,fix_min,fix_max,Av_      :double;
    z_                                                        :arr_vars;
    i_Center,j_Center,l,Nfi,t_in_ms,nt_end,iv,iv_Select,ntI,
    i_view,j_view,iPWCenter,jPWCenter,i_near,j_near,i,j       :integer;
    t1,t2,t3,t4,t5,t6,t7,FN                                   :string;
    FileBeginning_                                            :string;
    bbb,ccc,ddd                                               :text;
    Integr_z                               :array[0..1000] of double;
begin
  { Parameters of the circle to plot }
  i_near:=trunc(Form1.DDSpinEdit10.Value);
  j_near:=trunc(Form1.DDSpinEdit9.Value);
  iPWCenter:=trunc(i_near/2/rPW)+1;  //number of the pinwheel in x-direction
  jPWCenter:=trunc(j_near/2/rPW)+1;  //number of the pinwheel in y-direction
  i_Center:=(2*iPWCenter-1)*rPW;
  j_Center:=(2*jPWCenter-1)*rPW;
//  i_Center:=rPW;
//  j_Center:=rPW;
  rPlot:=rPW*Form1.DDSpinEdit6.Value{3/4};
  Nfi:=100;
  { What variable to integrate }
  iv_Select:=Form1.ComboBox1.ItemIndex;
  FileBeginning_:='xy';
  N_vars:=15;            { changed from 14 on 1.08.2016 }
  if (Form1.ComboBox1.Items[iv_Select]='Screen from "Visual...dat"')or
     (Form1.ComboBox1.Items[iv_Select]='VisualStim from "Visual...dat"') then begin
      FileBeginning_:='Visual';
      N_vars:=2;
      if Form1.ComboBox1.Items[iv_Select]='VisualStim from "Visual...dat"' then iv_Select:=0;
      if Form1.ComboBox1.Items[iv_Select]='Screen from "Visual...dat"'     then iv_Select:=1;
  end;
  t_startInt:=Form1.DDSpinEdit4.Value;
  t_endInt  :=Form1.DDSpinEdit5.Value;
  i_view:=trunc(Form1.DDSpinEdit7.Value);
  j_view:=trunc(Form1.DDSpinEdit8.Value);
  { Initiate writing }
  t2:='Ring(t,x)_from_xy.dat';
  assign(bbb,t2);
  str(i_view:2,t4); str(j_view:2,t5); str(iv_Select:2,t6);
  t3:='Extract_v'+t6+'_at_'+t4+'_'+t5+'.dat';
  assign(ccc,t3);
  t7:='Profile(t,x)_from_xy.dat';
  assign(ddd,t7);
  { Detect nt_end }
  t_in_ms:=0;
  while NextFileNameAfter(t_in_ms,FileBeginning_,FN)<>0 do begin
    t_in_ms:=t_in_ms+1;
  end;
  nt_end:=t_in_ms;
  for l:=0 to 1000 do Integr_z[l]:=0;
  { Step by step }
  t_in_ms:=0;  ntI:=0;
  {****************************************************************************}
  while (NextFileNameAfter(t_in_ms,FileBeginning_,FN)<>0) and (IfStop<>1) do begin
    t_in_ms:=t_in_ms+1;
    if (t_in_ms>t_startInt)and(t_in_ms<=t_endInt) then ntI:=ntI+1;
    {*** Fields ************}
    ReadFieldsFromXYfile(FN);
    {***********************}
    { Set scales }
    fix_min:=Form1.DDSpinEdit11.Value;
    fix_max:=Form1.DDSpinEdit12.Value;
    {*** Draw Lattice ************************************}
    Draw_Lattice(z[iv_Select], ni,nj,rPW, fix_min,fix_max);
    {*****************************************************}
    { Integrate over lattice }
    if (t_in_ms>t_startInt)and(t_in_ms<=t_endInt) then begin
        for i:=1 to ni do begin
            for j:=1 to nj do begin
                AveragedSelected_z[i,j]:=(AveragedSelected_z[i,j]*(ntI-1)
                                        + z[iv_Select][i,j])/ntI;
            end;
        end;
    end;
    { Initialize writing and drawing }
    if t_in_ms=1 then begin
       rewrite(bbb);
       writeln(bbb,'ZONE T="',t2,'"');
       writeln(bbb,'I=',Nfi+1:3,',J=',trunc(nt_end):3,',K=1,F=POINT');
       rewrite(ccc);
       rewrite(ddd);
       writeln(ddd,'ZONE T="',t7,'"');
       writeln(ddd,'I=',ni:3,   ',J=',trunc(nt_end):3,',K=1,F=POINT');
       if not(Form1.CheckBox1.Checked) then begin
          Form1.Series3.Clear;
          Form1.Series4.Clear;
       end;
    end else begin append(bbb); append(ccc); end;
    Form1.Series1.Clear;
    Form1.Series2.Clear;
    { Extract ring }
    for l:=0 to Nfi do begin
        fi:=l/Nfi*2*pi;
        x:=i_Center + rPlot*cos(fi);
        y:=j_Center + rPlot*sin(fi);
        { Interpolation on the circle }
        Interpolate_at_xy(x,y, z_);
        {*****************************}
        if (t_in_ms>t_startInt)and(t_in_ms<=t_endInt) then begin
            Integr_z[l]:=(Integr_z[l]*(ntI-1) + z_[iv_Select])/ntI;
        end;
        { Write & Draw }
        write  (bbb,t_in_ms:5,' ',fi/pi*90-90:9:3,' ');
        for iv :=0 to N_vars-1 do
        write  (bbb,z_[iv]:10:5,' ');
        writeln(bbb,Integr_z[l]:8:3);
        Form1.Series1.AddXY(fi/pi*90-90,Integr_z[l]);
        Form1.Series2.AddXY(fi/pi*90-90,z_[iv_Select]);
    end;
    { Print time }
    str(t_in_ms:3,t1);
    t1:='Time='+t1+' ms';
    Form1.Label7.Caption:=t1;
    { Extract at (i_view,j_view) and average across the domain }
    i_view:=trunc(Form1.DDSpinEdit7.Value);
    j_view:=trunc(Form1.DDSpinEdit8.Value);
    Av_:=AverageAcrossDomain(z[iv_Select]);
    Form15.Frame15.Series5.AddXY(i_view,j_view);
    writeln(ccc,t_in_ms:5,' ',z[iv_Select][i_view,j_view]:10:5,' ',Av_:10:5);
    Form1.Series3.AddXY(t_in_ms,z[iv_Select][i_view,j_view]);
    Form1.Series4.AddXY(t_in_ms,Av_);
    { Extract horizontal Profile }
    Form1.LineSeries1.Clear;
    Form1.Chart2.LeftAxis.Automatic:=(fix_min=fix_max);
    if fix_min<>fix_max then begin
       Form1.Chart2.LeftAxis.Minimum:=fix_min;
       Form1.Chart2.LeftAxis.Maximum:=fix_max;
    end;
    for i:=1 to ni do begin
        writeln(ddd,t_in_ms:5,' ',i:3,' ',z[iv_Select][i,j_view]:9:3,' ');
        Form1.LineSeries1.AddXY(i,z[iv_Select][i,j_view]);
    end;
    Application.ProcessMessages;
    //close(bbb);  close(ccc);   close(ddd);
    { StepByStep }
    if IfStepByStep=1 then begin
       Form1.Button5.Enabled:=true;
       IfDoNextStep:=0;
       repeat
         Application.ProcessMessages;
       until (IfDoNextStep=1)or(IfStopSteppingAndKeepMoving=1)or(IfStop=1);
       Form1.Button5.Enabled:=false;
    end;
    //if IfStop=1 then begin close(bbb);  close(ccc);   close(ddd); exit; end
  end;
  {****************************************************************************}
  close(bbb);  close(ccc);   close(ddd);
  IfStepByStep:=0;
  IfStopSteppingAndKeepMoving:=0;
  { Draw & write Averaged field }
  Draw_Lattice(AveragedSelected_z, ni,nj,rPW, 0,0);
  Write_Averaged_Field;
end;

procedure ExtractProfileAcrossRadiusAt(t_in_ms,rPW,Theta :integer);
{ Writes distribution on a radius to the pinwheel center,
  interpolating values from rectangular mesh. }
var
    R,x,y                                                     :double;
    z_                                                        :arr_vars;
    i_Center,j_Center,l,NR,iv,iv_Select                       :integer;
    t2,FN                                                     :string;
    bbb                                                       :text;
begin
  Form1.LineSeries1.Clear;
  { Parameters of the circle to plot }
  i_Center:=trunc(rPW);
  j_Center:=trunc(rPW);
  NR:=100;
  iv_Select:=Form1.ComboBox1.ItemIndex;
  { Detect File }
  if NextFileNameAfter(t_in_ms,'xy',FN)<>0 then begin
    { Fields }
    ReadFieldsFromXYfile(FN);
    { Writing }
    t2:='RadialProfile(r)_from_xy.dat';
    assign(bbb,t2);    rewrite(bbb);
    for l:=0 to NR do begin
        R:=l/NR*rPW;
        x:=i_Center + R*cos(Theta/180*pi);
        y:=j_Center + R*sin(Theta/180*pi);
        { Interpolation on the radius }
        Interpolate_at_xy(x,y, z_);
        {*****************************}
        write  (bbb,t_in_ms:5,' ',R:9:3,' ');
        for iv :=0 to N_vars-1 do
        write  (bbb,z_[iv]:10:5,' ');
        writeln(bbb);
        Form1.LineSeries1.AddXY(R,z_[iv_Select]);
        Application.ProcessMessages;
    end;
    close(bbb);
  end;
end;

procedure ExtractHorizontalProfileAt(t_in_ms,rPW :integer);
{ Writes distribution on a horizontal line through two pinwheel centers,
  interpolating values from rectangular mesh. }
var
    R,x,y                                                     :double;
    z_                                                        :arr_vars;
    i_Center,j_Center,l,NR,iv,iv_Select                       :integer;
    t2,FN                                                     :string;
    bbb                                                       :text;
begin
  Form1.LineSeries1.Clear;
  { Parameters of the circle to plot }
  j_Center:=trunc(rPW);
  NR:=400;
  iv_Select:=Form1.ComboBox1.ItemIndex;
  { Detect File }
  if NextFileNameAfter(t_in_ms,'xy',FN)<>0 then begin
    { Fields }
    ReadFieldsFromXYfile(FN);
    { Writing }
    t2:='HorizontalProfile(x)_from_xy.dat';
    assign(bbb,t2);    rewrite(bbb);
    for l:=0 to NR do begin
        x:=l/NR*4*rPW;
        y:=j_Center;
        { Interpolation on the radius }
        Interpolate_at_xy(x,y, z_);
        {*****************************}
        write  (bbb,t_in_ms:5,' ',x:9:3,' ');
        for iv :=0 to N_vars-1 do
        write  (bbb,z_[iv]:10:5,' ');
        writeln(bbb);
        Form1.LineSeries1.AddXY(x,z_[iv_Select]);
        Application.ProcessMessages;
    end;
    close(bbb);
  end;
end;


end.
