unit LGN_main;

interface
uses  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
      Dialogs, Math,
      LGN_Init;

procedure LGN_Parameters;
procedure WriteParametersInFile;
procedure DrawReceptiveField;
procedure CalculateAndWrite2DReceptiveField;
procedure LGN_InitialConditions;
function LGN_Convolve_with_ElongatedGaussian(r_V1,phi_V1,fi,Lag,charge :double) :double;
function LGN_Screen_Projection_to_Cortex(r_V1,phi_V1 :double) :double;
procedure LGN_Draw_RF(r_V1,phi_V1,fi,charge :double);
procedure Define_z_view;
procedure WriteNonlinearFunction;
procedure LGN_RunOneStep(t_,dt_ :double);
procedure Translate_r_phi_V1_to_x_y_LGN(r,phi :double; var x,y :double);
procedure LGN_Draw(t_ :double);
procedure LGN_Draw_Retinotopy(r_0_0, phi_0_0,  r_0_nj, phi_0_nj,
                              r_ni_0,phi_ni_0, r_ni_nj,phi_ni_nj :double);
procedure RunTillTheEnd;
procedure RunEntireDiagram;

implementation
uses LGN_Unit1,LGN_Unit30,LGN_Lattice,MathMyO,LGN_Unit15,LGN_Unit33;

procedure LGN_Parameters;
var i,j :integer;
begin
  ni:=trunc(LGN_Form1.DDSpinEdit3.Value);
  nj:=trunc(LGN_Form1.DDSpinEdit4.Value);
  ni2_Screen:=trunc((ni+1)/2);
  nj2_Screen:=trunc((nj+1)/2);
  ni2_LGN   :=trunc((ni+1)/2);
  nj2_LGN   :=trunc((nj+1)/2);
  AmplOfStimLum    :=LGN_Form1.DDSpinEdit6.Value;
  MeanStimLum      :=LGN_Form1.DDSpinEdit27.Value;
  Background       :=LGN_Form1.DDSpinEdit17.Value;
  ScaleOfSaturation:=LGN_Form1.DDSpinEdit26.Value;
  ShapeOfSaturation:=LGN_Form1.ComboBox2.Items[LGN_Form1.ComboBox2.ItemIndex];
  rPW :=6; { dummy }
  dxy_LGN:=LGN_Form1.DDSpinEdit7.Value{grad};
  V1_to_LGN_deg_per_mm:=LGN_Form1.DDSpinEdit29.Value{deg/mm};
  tau_cen   :=LGN_Form1.DDSpinEdit9.Value {ms}/1000;
  tau_sur   :=LGN_Form1.DDSpinEdit10.Value{ms}/1000;
  tau_late  :=LGN_Form1.DDSpinEdit30.Value{ms}/1000;
  K_late_to_early:=LGN_Form1.DDSpinEdit31.Value;
  sgm_cen_h :=LGN_Form1.DDSpinEdit11.Value{grad};
  sgm_cen_v1:=LGN_Form1.DDSpinEdit19.Value{grad};
  sgm_cen_v2:=LGN_Form1.DDSpinEdit28.Value{grad};
  sgm_sur_h :=LGN_Form1.DDSpinEdit12.Value{grad};
  sgm_sur_v :=LGN_Form1.DDSpinEdit25.Value{grad};
  k_cen_sur :=LGN_Form1.DDSpinEdit13.Value;
  L_spont   :=LGN_Form1.DDSpinEdit23.Value{Hz};
  sgm_pref  :=LGN_Form1.DDSpinEdit14.Value{grad};
  sgm_orth  :=LGN_Form1.DDSpinEdit15.Value{grad};
  Off_shift :=LGN_Form1.DDSpinEdit32.Value{grad};
  t_end     :=LGN_Form1.DDSpinEdit16.Value{ms}/1000;
  dt_LGN    :=LGN_Form1.DDSpinEdit18.Value{ms}/1000;
  t_stim    :=LGN_Form1.DDSpinEdit24.Value{ms}/1000;
  Diagram.Vert_shift :=LGN_Form1.DDSpinEdit20.Value{grad};
  Diagram.Horiz_shift:=LGN_Form1.DDSpinEdit21.Value{grad};
  Diagram.i_RecNrn:=ni2_LGN+trunc(Diagram.Horiz_shift/dxy_LGN);
  Diagram.j_RecNrn:=nj2_LGN+trunc(Diagram.Vert_shift /dxy_LGN);
  IfRunOneLGNneuron:=0;
  //if LGN_Form1.PageControl1.ActivePageIndex<>1 then IfRunOneLGNneuron:=1;
  if IfRunOneLGNneuron=1 then begin
     LGN_Form1.RadioGroup1.Items[4]:='';
     LGN_Form1.RadioGroup1.Items[5]:='';
     LGN_Form1.RadioGroup1.Items[6]:='';
     LGN_Form1.RadioGroup1.Items[7]:='';
     LGN_Form1.RadioGroup1.Items[9]:='';
  end else begin
     LGN_Form1.RadioGroup1.Items[4]:='zLGN_cen';
     LGN_Form1.RadioGroup1.Items[5]:='zLGN_sur';
     LGN_Form1.RadioGroup1.Items[6]:='zLGN_subthr';
     LGN_Form1.RadioGroup1.Items[7]:='zLGN';
     LGN_Form1.RadioGroup1.Items[9]:='zLGN_Off';
  end;
  { Complex Stimulus }
  LGN_Form30.Visible:=(LGN_Form1.ComboBox1.ItemIndex=6)and(LGN_Form1.Visible);
  LGN_Form33.Visible:=(LGN_Form1.CheckBox2.Checked)and(LGN_Form1.Visible);
end;

procedure WriteParametersInFile;
var FName :string;
    Year, Month, Day, Hour, Min, Sec, MSec: Word;
    ccc :text;
    Frequency,Length,Radius_2,fi0 :double;
    t1 :string;
begin
  Frequency:=LGN_Form1.DDSpinEdit1.Value; {Hz}
  Length   :=LGN_Form1.DDSpinEdit2.Value{grad};
  Radius_2 :=LGN_Form1.DDSpinEdit22.Value{grad};
  fi0      :=LGN_Form1.DDSpinEdit5.Value{degrees}+90;
  Str(LGN_Form1.ComboBox1.ItemIndex:1,t1);
  { File name }
  DecodeTime(Now, Hour, Min, Sec, MSec);
  FName := IntToStr(Hour) + '_' + IntToStr(Min) + '_' + IntToStr(Sec)+'_Stimul='+t1+'.par';
  { Opening }
  assign(ccc,FName); rewrite(ccc);
  { Writing }
  write(ccc,'ni=');           writeln(ccc,'            ',ni:3,' ');
  write(ccc,'nj=');           writeln(ccc,'            ',nj:3,' ');
  write(ccc,'AmplOfStimLum=');     writeln(ccc,'            ',AmplOfStimLum:10:0,' ');
  write(ccc,'MeanStimLum=');       writeln(ccc,'            ',MeanStimLum:10:0,' ');
  write(ccc,'Background=');        writeln(ccc,'            ',Background:10:0,' ');
  write(ccc,'dxy_LGN=');        writeln(ccc,'            ',dxy_LGN:10:3,' ');
  write(ccc,'tau_cen=');        writeln(ccc,'            ',tau_cen*1e3:10:0,' ');
  write(ccc,'tau_sur=');        writeln(ccc,'            ',tau_sur*1e3:10:0,' ');
  write(ccc,'sgm_cen_h=');        writeln(ccc,'            ',sgm_cen_h:10:3,' ');
  write(ccc,'sgm_cen_v1=');        writeln(ccc,'            ',sgm_cen_v1:10:3,' ');
  write(ccc,'sgm_cen_v2=');        writeln(ccc,'            ',sgm_cen_v2:10:3,' ');
  write(ccc,'sgm_sur_h=');        writeln(ccc,'            ',sgm_sur_h:10:3,' ');
  write(ccc,'sgm_sur_v=');        writeln(ccc,'            ',sgm_sur_v:10:3,' ');
  write(ccc,'k_cen_sur=');        writeln(ccc,'            ',k_cen_sur:10:3,' ');
  write(ccc,'L_spont=');        writeln(ccc,'            ',L_spont:10:0,' ');
  write(ccc,'sgm_pref=');        writeln(ccc,'            ',sgm_pref:10:3,' ');
  write(ccc,'sgm_orth=');        writeln(ccc,'            ',sgm_orth:10:3,' ');
  write(ccc,'t_end=');        writeln(ccc,'            ',t_end*1e3:10:0,' ');
  write(ccc,'dt_LGN=');        writeln(ccc,'            ',dt_LGN*1e3:10:3,' ');
  write(ccc,'t_stim=');        writeln(ccc,'            ',t_stim*1e3:10:0,' ');
  write(ccc,'Vert_shift=');        writeln(ccc,'            ',Diagram.Vert_shift:10:3,' ');
  write(ccc,'Horiz_shift=');        writeln(ccc,'            ',Diagram.Horiz_shift:10:3,' ');
  write(ccc,'Frequency=');        writeln(ccc,'            ',Frequency:10:3,' ');
  write(ccc,'Length=');        writeln(ccc,'            ',Length:10:3,' ');
  write(ccc,'Radius_2=');        writeln(ccc,'            ',Radius_2:10:3,' ');
  write(ccc,'fi0=');        writeln(ccc,'            ',fi0:6:0,' ');
  write(ccc,'tau_late=');   writeln(ccc,'            ',tau_late*1e3:10:0,' ');
  write(ccc,'K_late_to_early=');   writeln(ccc,'            ',K_late_to_early:10:3,' ');
  close(ccc);
end;

procedure DrawReceptiveField;
var
    i,Ni_,nt :integer;
    f,f_cen,f_sur,y,t,Dcen_,Dsur_ :double;
    ppp,qqq :text;
begin
  { Opening }
  assign(ppp,'RF_profile.dat');  rewrite(ppp);
  assign(qqq,'RF_kinetics.dat'); rewrite(qqq);
  { Parameters }
  LGN_Parameters;
  {*** Profile *********}
  LGN_Form1.Series3.Clear;
  LGN_Form1.Series4.Clear;
  LGN_Form1.Series5.Clear;
  Ni_:=100;
  for i:=-Ni_ to Ni_ do begin
      y:=i*4/Ni_;
      if y<0 then begin
         f_cen:=         exp(-sqr(y/sgm_cen_v1));
      end else begin
         f_cen:=         exp(-sqr(y/sgm_cen_v2));
      end;
      f_cen:= f_cen/pi/(sgm_cen_h*(sgm_cen_v1+sgm_cen_v2)/2);
      f_sur:=-k_cen_sur/pi/(sgm_sur_h*sgm_sur_v)*exp(-sqr(y/sgm_sur_v));
      f    :=  f_cen + f_sur;
      LGN_Form1.Series3.AddXY(y,f);
      LGN_Form1.Series4.AddXY(y,f_cen);
      LGN_Form1.Series5.AddXY(y,f_sur);
      { Writing }
      writeln(ppp,y:9:5,' ',f:8:4,' ',f_cen:8:4,' ',f_sur:8:4);
  end;
  {*** Kinetics *********}
  LGN_Form1.Series6.Clear;
  LGN_Form1.Series7.Clear;
  Ni_:=100;
  for nt:=0 to Ni_ do begin
      t:=max(4*max(tau_cen,tau_sur),4*tau_late)*nt/Ni_;
      Dcen_:=t/sqr(tau_cen)*dexp(-t/tau_cen)
            - K_late_to_early*t/sqr(tau_late)*dexp(-t/tau_late);  //8.02.2016
      Dsur_:=t/sqr(tau_sur)*dexp(-t/tau_sur)
            - K_late_to_early*t/sqr(tau_late)*dexp(-t/tau_late);  //8.02.2016
      LGN_Form1.Series6.AddXY(t*1e3,Dcen_);
      LGN_Form1.Series7.AddXY(t*1e3,Dsur_);
      { Writing }
      writeln(qqq,t*1e3:9:5,' ',Dcen_:8:4,' ',Dsur_:8:4);
  end;
  Application.ProcessMessages;
  close(ppp);
  close(qqq);
end;

procedure CalculateAndWrite2DReceptiveField;
var i,j :integer;
    ccc,ddd :text;
    d_cen,d_sur,x,y :double;
begin
  { Opening }
  assign(ccc,'RF.dat'); rewrite(ccc);
  writeln(ccc,'ZONE T="RF.dat"');
  writeln(ccc,'I=',nj+2:3,',J=',ni+2:3,',K=1,F=POINT');
  assign(ddd,'RF_matrix.dat'); rewrite(ddd);
  { Calculate And Write 2D-Receptive Field }
  for j:=nj+1 downto 0 do begin
      for i:=0 to ni+1 do begin
          x:=(i-ni/2)*dxy_LGN;  y:=(j-nj/2)*dxy_LGN;
          if y<0 then d_cen:=sqr(x/sgm_cen_h)+sqr(y/sgm_cen_v1)
                 else d_cen:=sqr(x/sgm_cen_h)+sqr(y/sgm_cen_v2);
          d_sur:=sqr(x/sgm_sur_h)+sqr(y/sgm_sur_v);
          {********************************************************************}
          zRF[i,j]:=         dexp(-d_cen)/pi/sgm_cen_h/(sgm_cen_v1+sgm_cen_v2)*2
                 - k_cen_sur*dexp(-d_sur)/pi/sgm_sur_h/sgm_sur_v;
          {********************************************************************}
          { Writing }
          writeln(ccc,x:9:5,' ',y:9:5,' ',zRF[i,j]:8:4);
          write(ddd,' ',zRF[i,j]:8:4);
      end;
      writeln(ddd);
  end;
  close(ccc);
  close(ddd);
end;

procedure LGN_InitialConditions;
var i,j :integer;
begin
  { Parameters }
  LGN_Parameters;
  MeanLum:=Background;
//  if LGN_Form1.ComboBox1.ItemIndex in [1,3] then MeanLum:=MeanLum+AmplOfStimLum/2;
  t_LGN:=0;
  nt_LGN:=0;
  LGN_Form1.DDSpinEdit8.Value:=t_LGN*1000;
  { Initial conditions }
  for i:=0 to ni+1 do begin
      for j:=0 to nj+1 do begin
          zScreen[i,j]:=MeanLum;
          zD_cen[i,j]:=MeanLum;
          zD_sur[i,j]:=MeanLum;
          zU_cen[i,j]:=MeanLum;
          zU_sur[i,j]:=MeanLum;
          zU_late[i,j]:=MeanLum;
          zD_late[i,j]:=MeanLum;
          zLGN_cen[i,j]:=MeanLum;
          zLGN_sur[i,j]:=MeanLum;
          zLGN_subthr[i,j]:=L_spont +
                            MeanLum/pi*( 1/(sgm_cen_h*(sgm_cen_v1+sgm_cen_v2)/2)
                                -k_cen_sur/(sgm_sur_h*sgm_sur_v));
          zLGN[i,j]:=max(0,zLGN_subthr[i,j]);
          zLGN_Off[i,j]:=max(0,2*L_spont-zLGN_subthr[i,j]);
          dzLGN_dt[i,j]:=0;
      end;
  end;
  LGN_Form1.LineSeries1.Clear;
//  LGN_Form1.LineSeries1.AddXY(t*1000,zLGN[trunc(ni/2),trunc(nj/2)]);
  DrawReceptiveField;
  Application.ProcessMessages;
  CalculateAndWrite2DReceptiveField;
  Diagram.Trace[0]:=zLGN[trunc(ni/2),trunc(nj/2)];
end;

procedure MovingGratings(t_ :double; i,j :integer; var pext :double);
var Velocity,Length,Frequency,fi0,r_,l_,al,R_2   :double;
begin
  Frequency:=LGN_Form1.DDSpinEdit1.Value; {Hz}
  Length   :=LGN_Form1.DDSpinEdit2.Value{deg};
  fi0      :=LGN_Form1.DDSpinEdit5.Value{degrees}/180*pi+pi/2;
  if LGN_Form1.ComboBox1.ItemIndex=7 then begin
     R_2:=LGN_Form1.DDSpinEdit22.Value{deg};
  end else R_2:=888;
  Velocity :=Frequency*Length; {deg/s}
  r_:=sqrt(sqr((i-ni2_Screen)*dxy_LGN)+sqr((j-nj2_Screen)*dxy_LGN));
  al:=ArcTan2((i-ni2_Screen)*dxy_LGN,(j-nj2_Screen)*dxy_LGN);
  l_:=r_*cos(al+fi0);
  pext:=Background +
        AmplOfStimLum*cos((l_-Velocity*t_)/Length*2*pi);
  if r_>R_2 then pext:=Background;
end;

procedure Bar(i,j :integer; var pext :double);
var Length,fi0,n_,l_,al   :double;
begin
  Length   :=LGN_Form1.DDSpinEdit2.Value{grad};
  fi0      :=LGN_Form1.DDSpinEdit5.Value{degrees}/180*pi+pi/2;
  { normal to the central line of the bar oriented with fi_0 }
  n_:=(i-ni2_Screen)*dxy_LGN*cos(fi0)+(j-nj2_Screen)*dxy_LGN*sin(fi0);
  if abs(n_)>Length/2 then pext:=Background
                      else pext:=Background + AmplOfStimLum;
end;

procedure Gradient(i,j :integer; var pext :double);
var R,fi0,r_,n_,Lum   :double;
begin
  R:=LGN_Form1.DDSpinEdit2.Value; {grad.}
  fi0      :=LGN_Form1.DDSpinEdit5.Value{degrees}/180*pi;
  { distance from the center of the screen }
  r_:=sqrt(sqr((i-ni2_Screen)*dxy_LGN)+sqr((j-nj2_Screen)*dxy_LGN));
  { normal to the central line oriented with fi_0 }
  n_:=(i-ni2_Screen)*dxy_LGN*cos(fi0+pi/2)+(j-nj2_Screen)*dxy_LGN*sin(fi0+pi/2);
  { Luminance changing along the normal }
  Lum:=n_/R;//(n_/R+1)/2;
  if abs(r_)<=R then begin
                     pext:=Background + MeanStimLum + AmplOfStimLum*Lum;
                end else begin
                     pext:=Background;
                end;
end;

procedure Spot(i,j :integer; var pext :double);
var R,fi0,r_,n_,Lum   :double;
begin
  R:=LGN_Form1.DDSpinEdit2.Value; {grad.}
  { distance from the center of the screen }
  r_:=sqrt(sqr((i-ni2_Screen)*dxy_LGN)+sqr((j-nj2_Screen)*dxy_LGN));
  Lum:=AmplOfStimLum*dexp(-r_*r_/2/R/R);
  { Luminance outside the spot }
  if abs(r_)>R then pext:=Background
               else pext:=Background + {AmplOfStim}Lum;
end;

procedure Ring(i,j :integer; var pext :double);
var R1,R2,fi0,r_,n_,Lum   :double;
begin
  R1:=LGN_Form1.DDSpinEdit2.Value; {grad.}
  R2:=LGN_Form1.DDSpinEdit22.Value; {grad.}
  { distance from the center of the screen }
  r_:=sqrt(sqr((i-ni2_Screen)*dxy_LGN)+sqr((j-nj2_Screen)*dxy_LGN));
  { Luminance outside the spot }
  if abs(r_)<R1 then pext:=Background
                else if abs(r_)>R2 then pext:=Background
                                   else pext:=Background + AmplOfStimLum;
end;

procedure ComplexStimulus(t_:double; i,j :integer; var pext :double);
var R,delay,r_,SpeedOfSpot,EndOfFirstSpot,DurationOfSecondSpot,
    DurationOfThirdSpot,Lum,
    x_shift,y_shift,r_shift,Vx,Vy,x1_,x2_,y1_,x_,y_,dx_,dy_           :double;
    ni_First,nj_First,ni_Second,nj_Second,ni_Third,nj_Third           :integer;
begin
  case LGN_Form30.PageControl1.TabIndex of
  0: begin { Two/three spots }
       R                    :=LGN_Form30.DDSpinEdit16.Value; {grad.}
       delay                :=LGN_Form30.DDSpinEdit19.Value/1000; {s}
       EndOfFirstSpot       :=LGN_Form30.DDSpinEdit14.Value/1000; {s}
       DurationOfSecondSpot :=LGN_Form30.DDSpinEdit3.Value/1000; {s}
       DurationOfThirdSpot  :=LGN_Form30.DDSpinEdit21.Value/1000; {s}
       t_stim:=EndOfFirstSpot+delay+DurationOfSecondSpot;
       if DurationOfThirdSpot>0 then t_stim:=t_stim+delay+DurationOfThirdSpot;
       ni_First:=ni2_Screen;
       nj_First:=nj2_Screen;
       ni_Second:=ni_First  +trunc(LGN_Form30.DDSpinEdit1.Value/dxy_LGN);
       nj_Second:=nj_First  +trunc(LGN_Form30.DDSpinEdit2.Value/dxy_LGN);
       ni_Third :=ni_First+2*trunc(LGN_Form30.DDSpinEdit1.Value/dxy_LGN);
       nj_Third :=nj_First+2*trunc(LGN_Form30.DDSpinEdit2.Value/dxy_LGN);
       if t_<=EndOfFirstSpot then begin  { First spot }
          { distance from the center of the screen }
          r_:=sqrt(sqr((i-ni_First)*dxy_LGN)+sqr((j-nj_First)*dxy_LGN));
          Lum:=AmplOfStimLum*dexp(-r_*r_/2/R/R);
          { Luminance outside the spot }
          if abs(r_)>R then pext:=Background
                       else pext:=Background + {AmplOfStim}Lum;
       end else if (t_> EndOfFirstSpot+delay)and
                   (t_<=EndOfFirstSpot+delay+DurationOfSecondSpot) then begin
          { distance from the center of the screen }
          r_:=sqrt(sqr((i-ni_Second)*dxy_LGN)+sqr((j-nj_Second)*dxy_LGN));
          Lum:=AmplOfStimLum*dexp(-r_*r_/2/R/R);
          { Luminance outside the spot }
          if abs(r_)>R then pext:=Background
                       else pext:=Background + {AmplOfStim}Lum;
       end else if (t_> EndOfFirstSpot+delay+DurationOfSecondSpot+delay)and
                   (t_<=t_stim) then begin
          { distance from the center of the screen }
          r_:=sqrt(sqr((i-ni_Third )*dxy_LGN)+sqr((j-nj_Third )*dxy_LGN));
          Lum:=AmplOfStimLum*dexp(-r_*r_/2/R/R);
          { Luminance outside the spot }
          if abs(r_)>R then pext:=Background
                       else pext:=Background + {AmplOfStim}Lum;
       end else pext:=Background;
     end;
  1: begin { Moving spot }
       R                    :=LGN_Form30.DDSpinEdit17.Value; {grad.}
       SpeedOfSpot          :=LGN_Form30.DDSpinEdit4.Value; {deg/s}
       x_shift              :=LGN_Form30.DDSpinEdit18.Value;
       y_shift              :=LGN_Form30.DDSpinEdit20.Value;
       r_shift:=sqrt(sqr(x_shift)+sqr(y_shift));
       if r_shift>0 then begin Vx:=x_shift/r_shift; Vy:=y_shift/r_shift end else
                         begin Vx:=1;               Vy:=0; end;
       t_stim:=t_end;
       ni_First:=imin(ni2_Screen+trunc(t_*SpeedOfSpot/dxy_LGN*Vx), trunc(ni2_Screen+x_shift/dxy_LGN));
       nj_First:=imin(nj2_Screen+trunc(t_*SpeedOfSpot/dxy_LGN*Vy), trunc(nj2_Screen+y_shift/dxy_LGN));
       { distance from the center of the screen }
       r_:=sqrt(sqr((i-ni_First)*dxy_LGN)+sqr((j-nj_First)*dxy_LGN));
       Lum:=AmplOfStimLum*dexp(-r_*r_/2/R/R);
       { Luminance outside the spot }
       if abs(r_)>R then pext:=Background
                    else pext:=Background + {AmplOfStim}Lum;
     end;
  2: begin { Square and Line }
       R                    :=LGN_Form30.DDSpinEdit5.Value/2; {grad.}
       delay                :=LGN_Form30.DDSpinEdit13.Value/1000; {s}
       EndOfFirstSpot       :=LGN_Form30.DDSpinEdit15.Value/1000; {s}
       DurationOfSecondSpot :=LGN_Form30.DDSpinEdit8.Value/1000; {s}
       t_stim:=EndOfFirstSpot+delay+DurationOfSecondSpot;
       ni_First:=ni2_Screen;
       nj_First:=nj2_Screen;
       ni_Second:=ni_First+trunc(LGN_Form30.DDSpinEdit6.Value/dxy_LGN);
       if t_<EndOfFirstSpot then begin  { First spot }
          { distance from the center of the first }
          dx_:=(i-ni_First)*dxy_LGN;
          dy_:=(j-nj_First)*dxy_LGN;
          { Luminance inside the Line }
          if (abs(dx_)<=R)and(abs(dy_)<=R) then pext:=Background + AmplOfStimLum
                                           else pext:=Background;
       end else if t_>EndOfFirstSpot+delay then begin
          { distance from the end of the Line }
          x1_:=ni_First *dxy_LGN-R;
          x2_:=ni_Second*dxy_LGN+R;
          y1_:=nj_First *dxy_LGN;
          x_:=i*dxy_LGN;
          y_:=j*dxy_LGN;
          { Luminance inside the Line }
          if (x_>=x1_)and(x_<=x2_)and(abs(y_-y1_)<=R) then
                                                pext:=Background + AmplOfStimLum
                                           else pext:=Background;
       end else pext:=Background;
     end;
  3: begin { Growing Line }
       R                    :=LGN_Form30.DDSpinEdit12.Value/2; {grad.}
       t_stim               :=LGN_Form30.DDSpinEdit9.Value/1000; {s}
       ni_First:=ni2_Screen;
       nj_First:=nj2_Screen;
       ni_Second:=ni_First+trunc(LGN_Form30.DDSpinEdit7.Value/dxy_LGN);
       { distance from the end of the Line }
       x1_:=ni_First *dxy_LGN - R;
       x2_:=ni_First *dxy_LGN + (ni_Second-ni_First)/t_stim*t_*dxy_LGN + R;
       y1_:=nj_First *dxy_LGN;
       x_:=i*dxy_LGN;
       y_:=j*dxy_LGN;
       { Luminance inside the Line }
       if (x_>=x1_)and(x_<=x2_)and(abs(y_-y1_)<=R) then
                                                pext:=Background + AmplOfStimLum
                                           else pext:=Background;
     end;
  4: begin { Moving Square }
       R                    :=LGN_Form30.DDSpinEdit11.Value/2; {grad.}
       SpeedOfSpot          :=LGN_Form30.DDSpinEdit10.Value; {deg/s}
       t_stim:=t_end;
       x1_:=ni2_Screen*dxy_LGN + t_*SpeedOfSpot;
       y1_:=nj2_Screen*dxy_LGN;
       { Luminance inside the Square }
       if (abs(i*dxy_LGN-x1_)<=R)and(abs(j*dxy_LGN-y1_)<=R) then
                                                pext:=Background + AmplOfStimLum
                                           else pext:=Background;
     end;
  end;
end;

{function if_ni_nj_ne_1(i,j :integer) :boolean;
begin
  if_ni_nj_ne_1:=true;
  if (ni=1)and((i=0)or(i=2)) or
     (nj=1)and((j=0)or(j=2)) then if_ni_nj_ne_1:=false;
end;}

procedure PoissonEq_without_Symmetry(i,j:integer; sgmx,sgmy1,sgmy2,Back_:double;
                                     Pz_inp,Pz_out :Parr_X_Y);
{  Integrating input rate WQ with exponential weight.
   Int exp(-r) dx dy = 2*pi, Int exp(-r^2) dx dy = pi }
var
    ii,jj,degree_,i_left,i_right,j_bottom,j_top  :integer;
    x,y,xx,yy,S,d_,Norm,W,sgm_max_               :double;
begin
  degree_:=2;
  x:=i*dxy_LGN;  y:=j*dxy_LGN;
  sgm_max_:=max(max(sgmx,sgmy1),sgmy2);
  i_left  :=trunc((x-2*sgm_max_)/dxy_LGN);
  i_right :=trunc((x+2*sgm_max_)/dxy_LGN);
  j_bottom:=trunc((y-2*sgm_max_)/dxy_LGN);
  j_top   :=trunc((y+2*sgm_max_)/dxy_LGN);
  S:=0;  Norm:=0;
  for ii:=imax(0,i_left) to imin(ni+1,i_right) do begin
      for jj:=imax(0,j_bottom) to imin(nj+1,j_top) do begin
          xx:=ii*dxy_LGN;
          yy:=jj*dxy_LGN;
          if yy<y then d_:=sqrt(sqr((x-xx)/sgmx)+sqr((y-yy)/sgmy1))
                  else d_:=sqrt(sqr((x-xx)/sgmx)+sqr((y-yy)/sgmy2));
          if degree_=2 then d_:=sqr(d_);
          {*************************************************************}
          S   :=S    +  (Pz_inp^[ii,jj]-Back_)*dexp(-d_)*dxy_LGN*dxy_LGN;
          {*************************************************************}
          Norm:=Norm +                         dexp(-d_)*dxy_LGN*dxy_LGN;
      end;
  end;
                     W:=2*pi*sgmx*(sgmy1+sgmy2)/2;
  if degree_=2 then  W:=  pi*sgmx*(sgmy1+sgmy2)/2;
  Pz_out^[i,j]:=Back_+S/Norm;
end;

{******************************************************************************}
function LGN_Off_Convolve_with_RoundGaussian(r_V1,phi_V1,fi,charge :double) :double;
{  Integrating input rate WQ with exponential weight for a cortical cell with
   RF with the polar coordinates in V1: "r_V1", "phi_V1"
   with shift "Off_shift" along big axis,
   doubled preferred orientation "fi"
   and RF size equal to min("sgm_pref","sgm_orth").
}
var
    ii,jj,i_left,i_right,j_bottom,j_top                       :integer;
    xx,yy,S,d_,Norm,cos_,sin_,xRF,yRF,z_,sgm_,xx_Off          :double;
begin
  sgm_:=min(sgm_pref,sgm_orth);
  sin_:=sin(fi/2+pi/2);
  cos_:=cos(fi/2+pi/2);
  Translate_r_phi_V1_to_x_y_LGN(r_V1,phi_V1, xRF,yRF);
  { Shift RF center along big RF-axis }
  xx_Off:=-Off_shift*charge;
  xRF:=xRF + xx_Off*cos_;
  yRF:=yRF + xx_Off*sin_;
  { Define square embedding RF }
  i_left  :=trunc((xRF-2*sgm_)/dxy_LGN);
  i_right :=trunc((xRF+2*sgm_)/dxy_LGN);
  j_bottom:=trunc((yRF-2*sgm_)/dxy_LGN);
  j_top   :=trunc((yRF+2*sgm_)/dxy_LGN);
  { Integrate over RF }
  S:=0;  Norm:=0;
  for ii:=imax(0,i_left) to imin(ni+1,i_right) do begin
      for jj:=imax(0,j_bottom) to imin(nj+1,j_top) do begin
          { Rotation matrix ( cos, sin )
                            (-sin, cos )   }
          xx:= (ii*dxy_LGN-xRF)*cos_ + (jj*dxy_LGN-yRF)*sin_; //along big   RF-axis
          yy:=-(ii*dxy_LGN-xRF)*sin_ + (jj*dxy_LGN-yRF)*cos_; //along small RF-axis
          d_:=sqr(xx/sgm_)+sqr(yy/sgm_);
          z_:=zLGN_Off[ii,jj];
          {**************************************}
          S   :=S  +  z_*exp(-d_)*dxy_LGN*dxy_LGN;
          {**************************************}
      end;
  end;
  Norm:=pi*sgm_*sgm_;
  LGN_Off_Convolve_with_RoundGaussian:=S/Norm;
end;
{******************************************************************************}

{******************************************************************************}
function LGN_Convolve_with_ElongatedGaussian(r_V1,phi_V1,fi,Lag,charge :double) :double;
{  Integrating input rate WQ with exponential weight for a cortical cell with
   RF with the polar coordinates in V1: "r_V1", "phi_V1",
   doubled preferred orientation "fi"
   and elongations "sgm_pref" and "sgm_orth".
   DS is provided by "Lag".
}
var
    ii,jj,i_left,i_right,j_bottom,j_top                          :integer;
    xx,yy,S,d_,Norm,cos_,sin_,xRF,yRF,delay_,z_,RF_On,RF_Off     :double;
begin
  sin_:=sin(fi/2+pi/2);
  cos_:=cos(fi/2+pi/2);
  Translate_r_phi_V1_to_x_y_LGN(r_V1,phi_V1, xRF,yRF);
  i_left  :=trunc((xRF-2*max(sgm_pref,sgm_orth))/dxy_LGN);
  i_right :=trunc((xRF+2*max(sgm_pref,sgm_orth))/dxy_LGN);
  j_bottom:=trunc((yRF-2*max(sgm_pref,sgm_orth))/dxy_LGN);
  j_top   :=trunc((yRF+2*max(sgm_pref,sgm_orth))/dxy_LGN);
  { Integrate over RF }
  S:=0;  Norm:=0;
  for ii:=imax(0,i_left) to imin(ni+1,i_right) do begin
      for jj:=imax(0,j_bottom) to imin(nj+1,j_top) do begin
          { Rotation matrix ( cos, sin )
                            (-sin, cos )   }
          xx:= (ii*dxy_LGN-xRF)*cos_ + (jj*dxy_LGN-yRF)*sin_; //along big   RF-axis
          yy:=-(ii*dxy_LGN-xRF)*sin_ + (jj*dxy_LGN-yRF)*cos_; //along small RF-axis
          d_:=sqr(xx/sgm_pref)+sqr(yy/sgm_orth);
          if xx*charge<0 then delay_:=Lag else delay_:=0;   //it was yy before 13.01.2016
          z_:=max(0,zLGN[ii,jj] - delay_*dzLGN_dt[ii,jj]);  //max was inserted on 20.01.2016
          {****************************************}
          S   :=S    +  z_*exp(-d_)*dxy_LGN*dxy_LGN;
          {****************************************}
          //Norm:=Norm + dexp(-d_)*dx*dy;
      end;
  end;
  Norm:=pi*sgm_pref*sgm_orth;
  { Summarize contributions of On and Off-cells }
  if LGN_Form1.CheckBox3.Checked then begin  // "Off-cells" is checked
     RF_On :=pi*sgm_pref*sgm_orth;
     RF_Off:=pi*sqr(min(sgm_pref,sgm_orth));
     LGN_Convolve_with_ElongatedGaussian:=
         (S + LGN_Off_Convolve_with_RoundGaussian(r_V1,phi_V1,fi,charge)*RF_Off)
         /(RF_On+RF_Off);
  end else begin
     LGN_Convolve_with_ElongatedGaussian:=S/Norm;
  end;
end;
{******************************************************************************}

function LGN_Screen_Projection_to_Cortex(r_V1,phi_V1 :double) :double;
{  Interpolate screen luminance at the given cortical point
   with the polar coordinates in V1: "r_V1", "phi_V1".
}
var
    ii,jj                      :integer;
    S1,S2,S3,S4,xRF,yRF,z_     :double;
begin
  Translate_r_phi_V1_to_x_y_LGN(r_V1,phi_V1, xRF,yRF);
  ii:=trunc(xRF/dxy_LGN);  ii:=imin(ii,ni);  ii:=imax(ii,0);
  jj:=trunc(yRF/dxy_LGN);  jj:=imin(jj,nj);  jj:=imax(jj,0);
  S1:=(dxy_LGN-xRF+ii*dxy_LGN)*(dxy_LGN-yRF+jj*dxy_LGN);
  S2:=(dxy_LGN-xRF+ii*dxy_LGN)*(yRF-jj*dxy_LGN);
  S3:=(xRF-ii*dxy_LGN)       *(dxy_LGN-yRF+jj*dxy_LGN);
  S4:=(xRF-ii*dxy_LGN)       *(yRF-jj*dxy_LGN);
  z_:=(zScreen[ii,jj]  *S1 + zScreen[ii,jj+1]  *S2
     + zScreen[ii+1,jj]*S3 + zScreen[ii+1,jj+1]*S4)/dxy_LGN/dxy_LGN;
  LGN_Screen_Projection_to_Cortex:=z_;
end;

procedure Translate_r_phi_V1_to_x_y_LGN(r,phi :double; var x,y :double);
begin
  x:=ni2_LGN*dxy_LGN + r*V1_to_LGN_deg_per_mm*1000*cos(phi);
  y:=nj2_LGN*dxy_LGN + r*V1_to_LGN_deg_per_mm*1000*sin(phi);
end;

procedure LGN_Draw_RF(r_V1,phi_V1,fi,charge :double);
var
    iRF,jRF                                                           :integer;
    cos_,sin_,xRF,yRF,dx1,dx2,dx3,dx4,dy1,dy2,dy3,dy4, r_,phi_,x_,y_,
    dx1_,dx2_,dx3_,dx4_,dy1_,dy2_,dy3_,dy4_,xx_Off,sgm_               :double;
{                    x1,y1

           x2,y2
                   .
                       x3,y3

             x4,y4

  (x1,y1) -> ( sgm_pref,        0)
  (x2,y2) -> (        0, sgm_orth)
  (x3,y3) -> ( sgm_pref,-sgm_orth)
  (x4,y4) -> (-sgm_pref,        0)
}
begin
  Translate_r_phi_V1_to_x_y_LGN(r_V1,phi_V1, xRF,yRF);
  iRF:=trunc(xRF/dxy_LGN);
  jRF:=trunc(yRF/dxy_LGN);
  sin_:=sin(fi/2+pi/2);
  cos_:=cos(fi/2+pi/2);
  { Reverse rotation matrix ( cos, -sin )
                            ( sin,  cos )   }
  dx1:= sgm_pref*cos_/dxy_LGN;
  dy1:= sgm_pref*sin_/dxy_LGN;
  dx2:=-sgm_orth*sin_/dxy_LGN;
  dy2:= sgm_orth*cos_/dxy_LGN;
  dx3:= sgm_orth*sin_/dxy_LGN;
  dy3:=-sgm_orth*cos_/dxy_LGN;
  dx4:=-sgm_pref*cos_/dxy_LGN;
  dy4:=-sgm_pref*sin_/dxy_LGN;
  { Shift RF center along big RF-axis }
  xx_Off:=-Off_shift*charge;
  sgm_:=min(sgm_pref,sgm_orth);
  dx1_:= (sgm_     + xx_Off)*cos_/dxy_LGN;
  dy1_:= (sgm_     + xx_Off)*sin_/dxy_LGN;
  dx2_:=(-sgm_*sin_+ xx_Off*cos_)/dxy_LGN;
  dy2_:= (sgm_*cos_+ xx_Off*sin_)/dxy_LGN;
  dx3_:= (sgm_*sin_+ xx_Off*cos_)/dxy_LGN;
  dy3_:=(-sgm_*cos_+ xx_Off*sin_)/dxy_LGN;
  dx4_:=(-sgm_     + xx_Off)*cos_/dxy_LGN;
  dy4_:=(-sgm_     + xx_Off)*sin_/dxy_LGN;
  LGN_Form15.Frame15.Series8.Active:=true;
  LGN_Form15.Frame15.Series8.Clear;
  LGN_Form15.Frame15.Series5.Clear;
  LGN_Form15.Frame15.Series9.Clear;
  LGN_Form15.Frame15.Series12.Clear;
  LGN_Form15.Frame15.Series5.AddXY(xRF/dxy_LGN,    yRF/dxy_LGN);
  LGN_Form15.Frame15.Series9.AddXY(xRF/dxy_LGN,    yRF/dxy_LGN);
  if charge>0 then begin
     LGN_Form15.Frame15.Series9.AddXY(xRF/dxy_LGN+dx1,yRF/dxy_LGN+dy1)
  end else begin
     LGN_Form15.Frame15.Series9.AddXY(xRF/dxy_LGN+dx4,yRF/dxy_LGN+dy4);
  end;
  { On-domain of RF }
  LGN_Form15.Frame15.Series8.AddXY(xRF/dxy_LGN+dx1,yRF/dxy_LGN+dy1);
  LGN_Form15.Frame15.Series8.AddXY(xRF/dxy_LGN+dx2,yRF/dxy_LGN+dy2);
  LGN_Form15.Frame15.Series8.AddXY(xRF/dxy_LGN+dx3,yRF/dxy_LGN+dy3);
  LGN_Form15.Frame15.Series8.AddXY(xRF/dxy_LGN+dx4,yRF/dxy_LGN+dy4);
  { Off-domain of RF }
  LGN_Form15.Frame15.Series12.AddXY(xRF/dxy_LGN+dx1_,yRF/dxy_LGN+dy1_);
  LGN_Form15.Frame15.Series12.AddXY(xRF/dxy_LGN+dx2_,yRF/dxy_LGN+dy2_);
  LGN_Form15.Frame15.Series12.AddXY(xRF/dxy_LGN+dx3_,yRF/dxy_LGN+dy3_);
  LGN_Form15.Frame15.Series12.AddXY(xRF/dxy_LGN+dx4_,yRF/dxy_LGN+dy4_);
//  LGN_Form15.Frame15.Chart1.Canvas.EllipseWithZ(xRF,yRF,xRF+25,yRF+25,0);
//  LGN_Form15.Canvas.Ellipse(xRF,yRF,xRF+25,yRF+25);
//  LGN_Form15.Frame15.Series8.AddXY(xRF,yRF);
{  LGN_Form15.Frame15.Series8.X0:=iRF-trunc(sgm_orth/dxy_LGN);
  LGN_Form15.Frame15.Series8.Y0:=jRF-trunc(sgm_pref/dxy_LGN);
  LGN_Form15.Frame15.Series8.X1:=iRF+trunc(sgm_orth/dxy_LGN);
  LGN_Form15.Frame15.Series8.Y1:=jRF+trunc(sgm_pref/dxy_LGN);}
  Application.ProcessMessages;
end;

procedure LGN_Draw_Retinotopy(r_0_0, phi_0_0,  r_0_nj, phi_0_nj,
                              r_ni_0,phi_ni_0, r_ni_nj,phi_ni_nj :double);
{ Boundary of the cortical area back-projection }
var x_,y_ :double;
begin
  LGN_Form15.Frame15.Series11.Clear;
  Translate_r_phi_V1_to_x_y_LGN(r_0_0,  phi_0_0, x_,y_);
  LGN_Form15.Frame15.Series11.AddXY(x_/dxy_LGN,  y_/dxy_LGN);
  Translate_r_phi_V1_to_x_y_LGN(r_0_nj, phi_0_nj, x_,y_);
  LGN_Form15.Frame15.Series11.AddXY(x_/dxy_LGN,  y_/dxy_LGN);
  Translate_r_phi_V1_to_x_y_LGN(r_ni_nj,phi_ni_nj, x_,y_);
  LGN_Form15.Frame15.Series11.AddXY(x_/dxy_LGN,  y_/dxy_LGN);
  Translate_r_phi_V1_to_x_y_LGN(r_ni_0, phi_ni_0, x_,y_);
  LGN_Form15.Frame15.Series11.AddXY(x_/dxy_LGN,  y_/dxy_LGN);
  Translate_r_phi_V1_to_x_y_LGN(r_0_0,  phi_0_0, x_,y_);
  LGN_Form15.Frame15.Series11.AddXY(x_/dxy_LGN,  y_/dxy_LGN);
  Application.ProcessMessages;
end;

procedure Define_z_view;
begin
  case LGN_Form1.RadioGroup1.ItemIndex of
  0: Pz:=@zScreen;
  1: Pz:=@zScreen_Sat;
  2: Pz:=@zD_cen;
  3: Pz:=@zD_sur;
  4: Pz:=@zLGN_cen;
  5: Pz:=@zLGN_sur;
  6: Pz:=@zLGN_subthr;
  7: Pz:=@zLGN;
  8: Pz:=@zRF;
  9: Pz:=@zLGN_Off;
  end;
  if LGN_Form1.RadioGroup1.ItemIndex in [0,1] then IfGray:=1 else IfGray:=0;
end;

function Nonlinearity(z :double):double;
var  f :double;
begin
  f:=z;
  if ShapeOfSaturation='Half of Sigmoid' then begin
     f:=ScaleOfSaturation*(2/(1+dexp(-2*z/ScaleOfSaturation))-1)
  end else if ShapeOfSaturation='Broken-line' then begin
     if z>ScaleOfSaturation then  f:=ScaleOfSaturation;
  end else if ShapeOfSaturation='Sigmoid' then begin
     f:=2*AmplOfStimLum*(1/(1+dexp(-(z-Background-MeanStimLum)/ScaleOfSaturation)));
  end;
  Nonlinearity:=f;
end;

procedure WriteNonlinearFunction;
var
  ccc :text;
  i :integer;
  x :double;
begin
  if ScaleOfSaturation=0 then exit;
  { Opening }
  assign(ccc,'NonlinearFunction.dat'); rewrite(ccc);
  { Writing }
  for i:=0 to 500 do begin
      x:=ScaleOfSaturation/100*i;
      writeln(ccc,x:10:3,' ',Nonlinearity(x):13:3);
  end;
  close(ccc);
end;

{******************************************************************************}
procedure LGN_RunOneStep(t_,dt_ :double);
var
    i,j                     :integer;
    pext,znew_,dzdt_        :double;
begin
  LGN_Parameters;
  { Saccades }
  if LGN_Form33.Visible then begin
     ni2_Screen:=trunc(ni/2 + Saccades.X[trunc(t_*1000{ms}/Saccades.dt_in_ms)]/dxy_LGN);
     nj2_Screen:=trunc(nj/2 + Saccades.Y[trunc(t_*1000{ms}/Saccades.dt_in_ms)]/dxy_LGN);
  end;
  { Screen }
  for i:=0 to ni+1 do begin
      for j:=0 to nj+1 do begin
          case LGN_Form1.ComboBox1.ItemIndex of
          0: { Bar }        Bar(i,j,pext);
          1: { Gratings }           MovingGratings(t_,i,j,pext);
          2: { delta-function } if (i<>ni2_Screen)or(j<>nj2_Screen) then pext:=0;
          3: { Gradient }   Gradient(i,j,pext);
          4: { Spot }       Spot(i,j,pext);
          5: { Ring }       Ring(i,j,pext);
          6: { Complex stimulus }   ComplexStimulus(t_,i,j,pext);
          7: { Gratings in circle }  MovingGratings(t_,i,j,pext);
          end;
          zScreen[i,j]:=pext;
          { End of stimulation }
          if t_>t_stim then zScreen[i,j]:=Background;
      end;
  end;
  { Saturation }
  for i:=0 to ni+1 do  for j:=0 to nj+1 do  zScreen_Sat[i,j]:=zScreen[i,j];
  if ScaleOfSaturation<>0 then begin
     for i:=0 to ni+1 do  for j:=0 to nj+1 do begin
         zScreen_Sat[i,j]:=Nonlinearity(zScreen[i,j]);
     end;
  end;
  { Integrate Screen in time }
  for i:=0 to ni+1 do begin
      for j:=0 to nj+1 do begin
          New_m4(dt_/tau_late,zScreen_Sat[i,j], zD_late[i,j],zU_late[i,j]);
          New_m4(dt_/tau_cen, zScreen_Sat[i,j], zD_cen[i,j],zU_cen[i,j]);
          New_m4(dt_/tau_sur, zScreen_Sat[i,j], zD_sur[i,j],zU_sur[i,j]);
          zE_cen[i,j]:=zD_cen[i,j]-K_late_to_early*zD_late[i,j];
          zE_sur[i,j]:=zD_sur[i,j]-K_late_to_early*zD_late[i,j];
      end;
  end;
  { Spatial filtering }
  for i:=0 to ni+1 do begin
      for j:=0 to nj+1 do {if if_ni_nj_ne_1(i,j) then} begin
          if (IfRunOneLGNneuron=0) or
             ((i=Diagram.i_RecNrn)and(j=Diagram.j_RecNrn)) then begin
              PoissonEq_without_Symmetry(i,j, sgm_cen_h,sgm_cen_v1,sgm_cen_v2,Background, @zE_cen, @zLGN_cen);
              PoissonEq_without_Symmetry(i,j, sgm_sur_h,sgm_sur_v, sgm_sur_v, Background, @zE_sur, @zLGN_sur);
          end;
      end;
  end;
  { Summation and rectification }
  for i:=0 to ni+1 do begin
      for j:=0 to nj+1 do begin
          if (IfRunOneLGNneuron=0) or
             ((i=Diagram.i_RecNrn)and(j=Diagram.j_RecNrn)) then begin
               zLGN_subthr[i,j]:=L_spont + zLGN_cen[i,j] - k_cen_sur*zLGN_sur[i,j]
                                    {+ (k_cen_sur-1)*Background};
               znew_:=max(0,zLGN_subthr[i,j]);
               if (dt_>0)and(t_>2*dt_) then dzdt_:=(znew_-zLGN[i,j])/dt_
                                       else dzdt_:=0;
               { Lagged field }
               dzLGN_dt[i,j]:=dzLGN_dt[i,j] + dt_/0.020{s}*(dzdt_-dzLGN_dt[i,j]);
               zLGN[i,j]:=znew_;
               zLGN_Off[i,j]:=max(0,2*L_spont - zLGN_subthr[i,j]);
          end;
      end;
  end;
  LGN_Form1.DDSpinEdit8.Value:=t_*1000;
end;
{******************************************************************************}

procedure LGN_Draw(t_ :double);
var nt_ :integer;
begin
  { Draw single LGN cell's response }
  LGN_Form1.LineSeries1.AddXY(t_*1000,zLGN[Diagram.i_RecNrn,Diagram.j_RecNrn]);
//  if (nt_LGN<=1)or(nt_LGN mod 10 = 0) then begin
     { Draw Lattice }
     Define_z_view;
     Draw_Lattice(Pz, ni,nj,rPW, IfGray);
     { Saccades }
     if LGN_Form33.Visible then begin
        LGN_Form33.Series2.Clear;
        nt_:=trunc(t_*1000{ms}/Saccades.dt_in_ms);
        LGN_Form33.Series2.AddXY(Saccades.X[nt_], Saccades.Y[nt_]);
     end;
     Application.ProcessMessages;
//  end;
end;

procedure WriteTraceInFile;
var FName :string;
    Year, Month, Day, Hour, Min, Sec, MSec: Word;
    bbb :text;
    t1 :string;
    i :integer;
    t,fi0 :double;
begin
  { File name }
  DecodeTime(Now, Hour, Min, Sec, MSec);
  fi0:=LGN_Form1.DDSpinEdit5.Value{degrees};
  Str(fi0:3:0,t1);
  FName := IntToStr(Hour) + '_' + IntToStr(Min) + '_' + IntToStr(Sec)+'_fi0='+t1+'.dat';
  { Writing signals }
  assign(bbb,FName); rewrite(bbb);
  i:=0;
  repeat    i:=i+1;
    t:=i*dt_LGN;
    if LGN_Form1.CheckBox1.Checked then begin
       writeln(bbb,t*1000:10:3,' ',Diagram.Trace[i]:10:3);
    end else begin
       writeln(bbb,                Diagram.Trace[i]:10:3);
    end;
  until t>=t_end;
  close(bbb);
end;

procedure RunTillTheEnd;
var  k   :integer;
     fi_ :double;
begin
  LGN_InitialConditions;
  repeat  nt_LGN:=nt_LGN+1;
    t_LGN:=t_LGN+dt_LGN;
//    LGN_Form1.DDSpinEdit8.Value:=t_LGN*1000;
    {***************************}
    LGN_RunOneStep(t_LGN,dt_LGN);
    {***************************}
    { LGN projection to V1 }
    if (IfRunOneLGNneuron=0)and
       (LGN_Form1.PageControl1.ActivePageIndex=1) then begin
        LGN_Form1.Series1.Clear;
        for k:=0 to 180 do begin
            fi_:=k/180*pi;
            zV1[k]:=LGN_Convolve_with_ElongatedGaussian(0,0,fi_,0,0);
            LGN_Form1.Series1.AddXY(fi_/pi*180,zV1[k])
        end;
    end;
    { Remember the trace - LGN central neuron's response }
    Diagram.Trace[nt_LGN]:=zLGN[Diagram.i_RecNrn,Diagram.j_RecNrn];
    { Draw }
    if (nt_LGN<=1)or(nt_LGN mod 10 = 0)or(dt_LGN>=0.001) then LGN_Draw(t_LGN);
  until t_LGN>=t_end;
  WriteTraceInFile;
end;

{******************************************************************************}
procedure RunEntireDiagram;
{******************************************************************************}
var iOrientation,nt_end_,nt_ :integer;
    fi0,max_,x,y,av_,maxAxis :double;
begin
  LGN_Form1.LineSeries2.Clear;
  LGN_Form1.Series2.Clear;
  for iOrientation:=0 to 8 do begin
      { Define orientation fi0 }
      fi0:=45*iOrientation;
      LGN_Form1.DDSpinEdit5.Value:=fi0;
      {************}
      RunTillTheEnd;
      {************}
      { Insert the trace in the array of traces }
      nt_end_:=nt_LGN;
      for nt_:=1 to nt_end_ do begin
          Diagram.Traces[iOrientation,nt_]:=Diagram.Trace[nt_];
      end;
      { Analysis }
      max_:=0;  av_:=0;
      for nt_:=1 to nt_end_ do begin
          if Diagram.Trace[nt_]>max_ then max_:=Diagram.Trace[nt_];
          if nt_end_>0 then av_:=av_+Diagram.Trace[nt_]/nt_end_ else av_:=0;
      end;
      { Take into account the absolute latency }
      av_:=(av_*t_end + L_spont*0.030{s})/(t_end+0.030{s});  // 30ms - absolute latency
      { Plotting }
      x:= av_*cos((fi0+90){degrees}/180*pi);
      y:= av_*sin((fi0+90){degrees}/180*pi);
      LGN_Form1.Series2.AddXY(x,y);
      x:=max_*cos((fi0+90){degrees}/180*pi);
      y:=max_*sin((fi0+90){degrees}/180*pi);
      LGN_Form1.LineSeries2.AddXY(x,y);
      Application.ProcessMessages;
      { Scales of the plot }
      LGN_Form1.Chart3.LeftAxis.Automatic:=false;
      LGN_Form1.Chart3.BottomAxis.Automatic:=false;
      maxAxis:=abs(y)+3;
      maxAxis:=max(maxAxis,abs(LGN_Form1.Chart3.BottomAxis.Maximum));
      maxAxis:=max(maxAxis,abs(LGN_Form1.Chart3.BottomAxis.Minimum));
      maxAxis:=max(maxAxis,abs(LGN_Form1.Chart3.LeftAxis.Maximum));
      maxAxis:=max(maxAxis,abs(LGN_Form1.Chart3.LeftAxis.Minimum));
      LGN_Form1.Chart3.BottomAxis.Maximum:= maxAxis;
      LGN_Form1.Chart3.BottomAxis.Minimum:=-maxAxis;
      LGN_Form1.Chart3.LeftAxis.Maximum  := maxAxis;
      LGN_Form1.Chart3.LeftAxis.Minimum  :=-maxAxis;
      Application.ProcessMessages;
      { Writing }
  end;
end;

end.
