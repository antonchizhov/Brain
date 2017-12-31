unit Stimulation_2D;

interface
uses Math,Forms, MathMyO,Init,t_dtO,ConnectionsO,
     Unit1,Unit3,Unit4,Unit21,Unit24,
     slice_2DO,Stimulation,graph_2DO,Erf_Hazard;

procedure PinWheelCoordinates(iPWCenter,jPWCenter:integer;
                          var xPWCenter,yPWCenter :integer);
procedure PinWheelCoordinates_near_ij(i,j :integer;
                        var iPWCenter,jPWCenter,xPWCenter,yPWCenter :integer);
procedure PinWheel_fi_for_ij(i,j :integer; fi0 :double; var fi,dx_,dy_ :double;
                                        var iPWCenter,jPWCenter,charge :integer);
procedure StimulusOrientationAngle(t :double; var fi0 :double);
procedure Translate_i_j_to_r_phi(i,j :integer; var r_V1_,phi_V1_ :double);
function Screen_Projection_to_Cortex(i,j :integer) :double;
procedure PinWheels(i,j :integer; fi0 :double; var W :double);
procedure StimulusMovement(t_:double; i,j :integer; var pext :double);
function VisualStimulation(t_:double; i,j :integer) :double;
procedure WriteVisualStimulation;
procedure Set_Ps_2D(i,j :integer; var pext :double);
procedure BipolarElectrodeStimulation_2D(i,j :integer);
function StereoStimulus(t_:double; i,j :integer) :double;


implementation
uses LGN_main;

var
     zLGN_Convolution :arr_X_Y;

procedure PinWheelCoordinates(iPWCenter,jPWCenter:integer;
                          var xPWCenter,yPWCenter :integer);
{ Calculate coordinates of and in pinwheels }
var Rx   :double;
    even :integer;
begin
  if Form3.CheckBox4.Checked then begin  // Chess
     { Chess mesh of pin-wheels }
     Rx:=sqrt(3)/2*rPW;
     even:=1 - (iPWCenter mod 2);
     xPWCenter:=round((2*iPWCenter-1)*Rx);
     yPWCenter:=      (2*jPWCenter-1)*rPW-rPW*even;
  end else begin
     { Rectangular mesh of pin-wheels }
     xPWCenter:=(2*iPWCenter-1)*rPW;
     yPWCenter:=(2*jPWCenter-1)*rPW;
  end;
end;

procedure PinWheelCoordinates_near_ij(i,j :integer;
                        var iPWCenter,jPWCenter,xPWCenter,yPWCenter :integer);
{ Calculate coordinates of and in pinwheels }
var Rx   :double;
    even :integer;
begin
  if Form3.CheckBox4.Checked then begin  // Chess
     { Chess mesh of pin-wheels }
     Rx:=sqrt(3)/2*rPW;
     iPWCenter:=trunc(i/2/Rx)+1;              //number of the pinwheel in x-direction
     even:=1 - (iPWCenter mod 2);
     jPWCenter:=trunc((j+rPW*even)/2/rPW)+1;  //number of the pinwheel in y-direction
     xPWCenter:=round((2*iPWCenter-1)*Rx);
     yPWCenter:=(2*jPWCenter-1)*rPW-rPW*even;
  end else begin
     { Rectangular mesh of pin-wheels }
     iPWCenter:=trunc(i/2/rPW)+1;  //number of the pinwheel in x-direction
     jPWCenter:=trunc(j/2/rPW)+1;  //number of the pinwheel in y-direction
     xPWCenter:=(2*iPWCenter-1)*rPW;
     yPWCenter:=(2*jPWCenter-1)*rPW;
  end;
end;

type
  TPWfromfile=record
    fi,cosfi :array[0..200,0..200] of double;
    IfRead :integer;
  end;
var PWfromfile :TPWfromfile;

procedure ReadPinWheelsFromFile;
var
   aaa :text;
   i,j :integer;
begin
  assign(aaa,'OM.dat'); reset(aaa);
  repeat
    readln(aaa,i,j,PWfromfile.cosfi[i,j],PWfromfile.fi[i,j]);
  until eof(aaa);
  PWfromfile.IfRead:=1;
end;

procedure PinWheel_fi_for_ij(i,j :integer; fi0 :double; var fi,dx_,dy_ :double;
                                        var iPWCenter,jPWCenter,charge :integer);
{ Calculate coordinates of and in pinwheels.
  fi is the doubled preferred direction;
  dx_,dy_ are cooredinates from the PW center. }
var ipi_2,jpi_2                   :double;
    xPWCenter,yPWCenter           :integer;
begin
  if Form3.CheckBox9.Checked then begin  // from file
     if PWfromfile.IfRead<>1 then ReadPinWheelsFromFile;
     fi:=PWfromfile.fi[i,j];
     exit;
  end;
  PinWheelCoordinates_near_ij(i,j, iPWCenter,jPWCenter,xPWCenter,yPWCenter);
  dx_:=i-xPWCenter;
  dy_:=j-yPWCenter;
  fi:=ArcTan2(dy_,dx_);
  if Form3.CheckBox4.Checked then begin  // Chess
     ipi_2:=({pi/12}-pi/2)   *(iPWCenter mod 2);
     jpi_2:=(2*pi-pi/6)   *(jPWCenter mod 2);
  end else begin
     ipi_2:=  pi*(iPWCenter mod 2);
     jpi_2:=2*pi*(jPWCenter mod 2);
  end;
  charge:=(2*(iPWCenter mod 2)-1)*(2*(jPWCenter mod 2)-1);//       istep(-1,iPWCenter+1)*istep(-1,jPWCenter+1);
//  if sqr(dx_)+sqr(dy_)<1e-8 then fi:=(ipi_2+jpi_2)*charge;
  if sqr(dx_)+sqr(dy_)<1e-8 then fi:=(fi0+ipi_2+jpi_2)*charge;
  fi:=fi*charge - ipi_2-jpi_2;
  fi:=fi+10*pi-trunc((fi+10*pi)/(2*pi))*2*pi;
end;

procedure StimulusOrientationAngle(t :double; var fi0 :double);
begin
  { time of the second stimulus }
  if t_stim2=0 then t_stim2 :=Form3.DDSpinEdit18.Value/1e3;
  { orientation }
  if (t<t_stim2)or(t_stim2=0) then fi0:=Form3.DDSpinEdit12.Value/180*pi  //First
                              else fi0:=Form3.DDSpinEdit17.Value/180*pi; //Second
end;

procedure Translate_i_j_to_r_phi(i,j :integer; var r_V1_,phi_V1_ :double);
var dx_,dy_ :double;
begin
  dx_:=dx*(i-ni_stim);
  dy_:=dy*(j-nj_stim);
  r_V1_  :=sqrt(sqr(dx_)+sqr(dy_));  {m}
  phi_V1_:=ArcTan2(dy_,dx_);
end;

function Screen_Projection_to_Cortex(i,j :integer) :double;
var r_V1_,phi_V1_             :double;
begin
  Translate_i_j_to_r_phi(i,j, r_V1_,phi_V1_);
  Screen_Projection_to_Cortex:=LGN_Screen_Projection_to_Cortex(r_V1_,phi_V1_);
end;

procedure PinWheels(i,j :integer; fi0 :double; var W :double);
{ from [Kang, Shelley, Sompol.] : I_LGN = A + B cos(fi-2*fi0) }
var fi,dx_,dy_,sm,r_V1_,phi_V1_             :double;
    iPWCenter,jPWCenter,charge              :integer;
begin
  { Find preferred orientation }
  PinWheel_fi_for_ij(i,j,fi0, fi,dx_,dy_, iPWCenter,jPWCenter,charge);
  { If orientation in this PW is orthogonal }
  if IfOrthogonalPW(iPWCenter,jPWCenter) then fi0:=fi0+pi;
  { Smooth pinwheels}
  sm:=1;  if Form3.CheckBox7.Checked then  sm:=max(abs(dx_),abs(dy_))/rPW;
  {*****************************************************}
  { Stimulation from LGN }
  if IfExtracellOrThalamOrVisualOrLGN_Stimul in [4,5] then begin
     Translate_i_j_to_r_phi(i,j, r_V1_,phi_V1_);
     if (nt=1)or(nt mod 10=0) then begin
         {********************************************************************}
         zLGN_Convolution[i,j]:=
          LGN_Convolve_with_ElongatedGaussian(r_V1_,phi_V1_,fi,LagOfDS,charge);
         {********************************************************************}
     end;
     W:=zLGN_Convolution[i,j];
  end else begin
     W:=W*( 1 + sm * cos(fi{*charge - ipi_2-jpi_2} - fi0) );
  end;
  {*****************************************************}
end;

procedure StimulusMovement(t_:double; i,j :integer; var pext :double);
var Velocity,Length,Frequency,fi0,r_,l_,al   :double;
    ni2,nj2 :integer;
begin
  ni2:=trunc((ni+1)/2);
  nj2:=trunc((nj+1)/2);
  Frequency:=Form3.DDSpinEdit15.Value; {Hz}
  Length   :=Form3.DDSpinEdit14.Value/1000; {m}
  Velocity :=Frequency*Length; {m/s}
  StimulusOrientationAngle(t_,fi0);
  r_:=sqrt(sqr((i-ni2)*dx)+sqr((j-nj2)*dy));
  al:=ArcTan2((i-ni2)*dx,(j-nj2)*dy);
  l_:=r_*cos(al+fi0/2);   //26.07.2012
  pext:=pext*1/2*(1 + cos((l_-Velocity*t_)/Length*2*pi) );
end;

function IfBlank(i,j :integer) :boolean;
var dum3,dum4,dum5   :double;
    charge,iPWCenter,jPWCenter,iPW00,jPW00,dum1,dum2 :integer;
begin
  if not(Form24.CheckBox1.Checked) then begin IfBlank:=false; EXIT; end;
  { 'Blank PW in the center of the screen' }
  PinWheel_fi_for_ij(i,j,0, dum3,dum4,dum5, iPWCenter,jPWCenter,charge);
//  PinWheelCoordinates_near_ij(trunc(ni/2),trunc(nj/2), iPW00,jPW00,dum1,dum2);
//  IfBlank:=(iPWCenter=iPW00)and(jPWCenter=jPW00);
  IfBlank:=IfBlankedPW(iPWCenter,jPWCenter);
end;

function BlankLevel :double;
begin
  case Form24.ComboBox1.ItemIndex of
    0: BlankLevel:=Qns{Hz}+Iext{muA}*pext_Iext{Hz/muA};  {Gray}
    1: BlankLevel:=Qns{Hz};                              {min}
    2: BlankLevel:=0;                                    {Black}
  end;
end;

{***********************************************}
function VisualStimulation(t_:double; i,j :integer) :double;
var Iext4,fi0 :double;
begin
  { PinWheels }
  if (Form3.CheckBox2.Checked{PW})and(Form21.Visible{Stereo}=false) then begin
     Iext4:=Iext{muA} * pext_Iext {Hz/muA};
     StimulusOrientationAngle(t_,fi0);
     {*** PinWheels and DS **}
     PinWheels(i,j,fi0,Iext4);
     {***********************}
     { Gratings not from LGN }
     if (Form3.CheckBox3.Checked)and(not(IfExtracellOrThalamOrVisualOrLGN_Stimul in [4,5])) then begin
        StimulusMovement(t_,i,j,Iext4);
     end;
     pext:=Qns{Hz} + Iext4;
     { Blanking }
     if IfBlank(i,j) then pext:=BlankLevel;
     { End of stimulus - grey background }
     if t>=t_ind then pext:=Qns{Hz}+Iext{muA}*pext_Iext{Hz/muA};
  { Stereo stimulus }
  end else if Form21.Visible then begin
     {*************************************************}
     pext:=Qns + Iext*pext_Iext*StereoStimulus(t_,i,j);
     {*************************************************}
  end else begin
     pext:=0;
  end;
  VisualStimulation:=pext;
end;
{***********************************************}

procedure WriteVisualStimulation;
var  i,j,ip,iPWCenter,jPWCenter         :integer;
     s1                                 :string;
begin
  Form3.Button3.Enabled:=false;
  nt:=0;  t:=0;
  if IfExtracellOrThalamOrVisualOrLGN_Stimul in [4,5] then LGN_InitialConditions; {LGN}
  REPEAT
    { Frame by frame }
    t:=t+dt; nt:=nt+1;
    {*********************************************************************}
    if IfExtracellOrThalamOrVisualOrLGN_Stimul in [4,5] then LGN_RunOneStep(t,dt);{LGN}
    {*********************************************************************}
    dt_out:=Form3.DDSpinEdit7.Value/1000;
    if (abs(t-0.001)<dt)or(abs(t-trunc(t/dt_out)*dt_out)<dt) then begin
        str(round(t*1000):3, s1);
        s1:='Visual'+s1+'e.dat';
        assign(ccc,s1);  rewrite(ccc);
        writeln(ccc,'ZONE T="',s1,'"');
        writeln(ccc,'I=',nj:3,',J=',ni:3,',K=1,F=POINT');
        for i:=1 to ni do  for j:=1 to nj do if if_ni_nj_ne_1(i,j) then begin
//            with Columns[i,j] do begin
                 write  (ccc,i*dx:9:5,' ',j*dy:9:5,' ');
                 write  (ccc,VisualStimulation(t,i,j):9:5,' ');
                 if IfExtracellOrThalamOrVisualOrLGN_Stimul in [4,5] then begin   {LGN}
                    write  (ccc,Screen_Projection_to_Cortex(i,j):9:5,' ');
                 end;
                 writeln(ccc);
//            end;
        end;
        close(ccc);
        { Drawing }
        if (nt mod n_show = 0) then begin
            if IfExtracellOrThalamOrVisualOrLGN_Stimul in [4,5] then LGN_Draw(t); {LGN}
            Draw_Lattice('VisualStimulus',j_view);
            Application.ProcessMessages;
        end;
    end;
    if (Form1.Pausejustbeforetend1.Checked)and(nt=nt_end-1) then StopKey:='P';
    Pause;
  UNTIL nt>=nt_end;
   { Pinwheel centers }
   if rPW>0 then begin
      assign(ccc,'PWCenters.dat');  rewrite(ccc);
      iPWCenter:=0;
      while 2*rPW*iPWCenter<=ni do begin
         iPWCenter:=iPWCenter+1;
         jPWCenter:=0;
         while 2*rPW*jPWCenter<=nj do begin
               jPWCenter:=jPWCenter+1;
               PinWheelCoordinates(iPWCenter,jPWCenter, i,j);
               writeln(ccc,i:3,' ',j:3,' ',i*dx:9:5,' ',j*dy:9:5);
         end;
      end;
      close(ccc);
   end;
  Form3.Button3.Enabled:=true;
end;

{**************************************************}
procedure Set_Ps_2D(i,j :integer; var pext :double);
{**************************************************}
var R_,Iext4,fi0 :double;
    iStim        :integer;
begin
  pext:=0;         // 22.10.2016
  if (IfExtracellOrThalamOrVisualOrLGN_Stimul in [2,5]) then begin
     {*** Electrical stimulation ***}
     pext:=Qns{Hz};
     if dtSt>0 then iStim:=trunc((t-t0s)/dtSt) else iStim:=0;
     if ((t>t0s)and(t<t0s+tSt))or
        ((dtSt>0)and(iStim<nStimuli)and(t-t0s>iStim*dtSt)
                 and(t-t0s<iStim*dtSt+tSt)) then begin
        { distance from electrode center}
        R_:=sqrt(sqr(i-ni_stim)+sqr(j-nj_stim));
        case Form3.ComboBox3.ItemIndex of      // changed on 13.10.2016
        0: { 1/r-decay }
           if R_<=R_stim then pext:=Qns + Iext{muA} * pext_Iext {Hz/muA}
           else if R_decay>0 then pext:=Qns + Iext{muA} * pext_Iext {Hz/muA} * R_decay/R_;
        1: { exp-decay }
           if R_decay>0 then
           pext:=Qns + Iext{muA} * pext_Iext {Hz/muA} * dexp(-    (R_-R_stim)/R_decay );
        2: { Gauss }
           if R_decay>0 then
           pext:=Qns + Iext{muA} * pext_Iext {Hz/muA} * dexp(-sqr((R_-R_stim)/R_decay));
        3: { flat circle }
           if R_<=R_stim then pext:=Qns + Iext{muA} * pext_Iext {Hz/muA};
        end;
        if IfBlank(i,j) then pext:=Qns{Hz}{+Iext*pext_Iext};  {blanked is gray} {introduced on 13.05.2013}
     end;
  end;
  if (IfExtracellOrThalamOrVisualOrLGN_Stimul in [3,4,5]) then begin
      {*** Visual stimulation ***}
      pext:=pext + VisualStimulation(t,i,j);    // 22.10.2016
  end;
end;
{**************************************************}

procedure BipolarElectrodeStimulation_2D(i,j :integer);
{ Simulates the simulation by extracellular electrode as a voltage increment
  reverse proportional to distance. }
var ip,inrn,iStim   :integer;
    S_R,ro_BP,R_    :double;
begin
  if dtSt>0 then iStim:=trunc((t-t0s)/dtSt) else iStim:=0;
  if not(Form3.CheckBox2.Checked{PW})and(IfExtracellOrThalamOrVisualOrLGN_Stimul in [1])and
      ((abs(t-t0s-dt)<dt/2) or
      ((dtSt>0)and(iStim<nStimuli)and(abs(t-t0s-iStim*dtSt-dt)<dt/2))) then begin
       { distance from electrode center}
         R_:=sqrt(sqr((i-ni_stim) *dx)+sqr((j-nj_stim) *dy))*1e3; {mm}
         S_R:=      Iext{muA} * Sbipolar_Iext {mm^2/muA} / sqr(max(0.010{mm},R_));
      { Second Bipolar Electrode }
      if not((ni_stim2=0)and(nj_stim2=0)) then begin
         R_:=sqrt(sqr((i-ni_stim2)*dy)+sqr((j-nj_stim2)*dy))*1e3; {mm}
         S_R:=S_R + Iext{muA} * Sbipolar_Iext {mm^2/muA} / sqr(max(0.010{mm},R_));
      end;
      { Fraction of survived neurons of the population }
      ro_BP:=(1+Erfic(T_bipolar-S_R))/(1+Erfic(T_bipolar));
  end else EXIT;
  for ip:=1 to NPop do begin
      if (((IfStimLayer2or4=4)and((ip=1)or(ip=2)))or
          ((IfStimLayer2or4=2)and((ip=3)or(ip=4)))) and
          (not((Form4.CheckBox16.Checked)and(ip mod 2 = 0))) then begin
          {****************************************************************}
          ApplyBipolarVoltageShockToPopulation(Columns[i,j].Pop[ip], ro_BP);
          {****************************************************************}
      end;
  end;
end;

{************ Stereo *************************************}

procedure StereoStimulusAtOneEye(t_:double; i,j,IfLeftEye:integer; var fi0,grad :double);
var BG, Focus,fi0_0 :double;
    ni_S,nj_S       :integer;
begin
  StimulusOrientationAngle(t_,fi0_0);
  ni_S:=trunc(ni/4/rPW)*2*rPW;
  nj_S:=trunc(ni/4/rPW)*2*rPW;
  { Background }
  BG:=0;
  if IfLeftEye=1 then begin  { Left eye }
     case Form21.RadioGroup3.ItemIndex of
     { Vertical edge }
     1: if abs(i-ni_S)<2*rPW then begin BG:=1; fi0:=fi0_0+pi; end;  //26.07.2012
     end;
  end else begin             { Right eye }
     case Form21.RadioGroup4.ItemIndex of
     { Vertical edge }
     1: if abs(i-ni_S)<2*rPW then begin BG:=1; fi0:=fi0_0+pi; end;  //26.07.2012
     end;
  end;
  { Focus }
  Focus:=BG; // Focus is over the background
  case Form21.RadioGroup2.ItemIndex of
  0: begin { Top edge }
       if j<=nj_S then Focus:=0;
       if abs(j-nj_S)<2*rPW then begin Focus:=1; fi0:=fi0_0+0; end;
     end;
  end;
  grad:=Focus;
end;

function StereoStimulus(t_:double; i,j :integer) :double;
var
    W,fi0                                           :double;
    iPWCenter,jPWCenter,IfLeftEye                   :integer;
begin
  W:=1; //default stimulus
  iPWCenter:=trunc(i/2/rPW)+1;  //number of the pinwheel in x-direction
  jPWCenter:=trunc(j/2/rPW)+1;  //number of the pinwheel in y-direction
  { Left or right eye }
  if iPWCenter mod 2 = 0 then IfLeftEye:=1 else IfLeftEye:=0;
  { Stimulus orientation and intensity }
  StereoStimulusAtOneEye(t_,i,j,IfLeftEye, fi0,W);
  { Pinwheels}
  if Form3.CheckBox2.Checked{PW} then begin
     PinWheels(i,j,fi0, W);
  end;
  StereoStimulus:=W;
end;

end.
