unit graph_2DO;

interface
uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     StdCtrls,TeEngine,
     Init,t_dtO, slice_2DO,ColumnO,PopulationO,ConnectionsO,Frame_2DO;

//procedure Palette(min,max,dmin,dmax :double);
function VSD(ACol :TColumn) :double;
procedure GraphicsFor1or2Nodes(i,j,i2,j2 :integer);
procedure ExtractFieldFromColumns(s1 :string; var z :arr_X_Y);
procedure ExtractRingFromPinWheels(t1:string; Nfi:integer; DrawOrWrite :string);
procedure SetNameOfTheField(s1 :string);
PROCEDURE Draw_Lattice(s1:string; jview:integer);
PROCEDURE Draw_1D_Plots(jview :integer);
procedure WriteOneField(s1 :string);

implementation
uses MathMyO,Unit1,Unit2,Unit3,Unit4,Unit15,Unit18,BP2Delphi,graph_0d,
     Stimulation_2D;

procedure OutText2D(x1,y1 :integer; t1 :string);
begin
  Form3.Canvas.TextOut(x1,y1,t1);
end;

procedure Min_Max(z :arr_X_Y; var min,max,dmin,dmax :double);
var  i,j :integer;
begin
  min:= 1e10;
  max:=-1e10;
  for i:=1 to ni do begin
      for j:=1 to nj do if if_ni_nj_ne_1(i,j) then begin
          if z[i,j]>max then max:=z[i,j];
          if z[i,j]<min then min:=z[i,j];
      end;
  end;
  { Discretization of steps for min and max}
  i:=trunc(dln(abs(min))/ln(10)*10);
  dmin:=step(10,i/10)*sgn(min);
  j:=trunc(dln(abs(max))/ln(10)*10)+1;
  dmax:=step(10,j/10)*sgn(max);
end;

procedure PaletteInFrame(min,max :double);
var  i              :integer;
     t1,t2          :string;
begin
  for i:=1 to 15 do begin
      Form15.Frame15.Series3.AddBubble(i,0,1,'',GreenVioletColor(15-i));
  end;
  str(min:8:3,t1);
  Form15.Frame15.Label1.Caption:=t1;
  str(max:8:3,t1);
  Form15.Frame15.Label2.Caption:=t1;
end;

function VSD(ACol :TColumn) :double;
{ VSD }
begin
  if      NPop>=4 then VSD:=(3*ACol.Pop[3].U+ACol.Pop[4].U)/4*0.95*1e3
                           +(3*ACol.Pop[1].U+ACol.Pop[2].U)/4*0.05*1e3
  else if NPop>=2 then VSD:=(3*ACol.Pop[1].U+ACol.Pop[2].U)/4*1e3
  else if NPop=1  then VSD:=   ACol.Pop[1].U*1e3;
end;

procedure GraphicsFor1or2Nodes(i,j,i2,j2 :integer);
var
     tl,tl_,t_sc,dum      :double;
     ntl                  :integer;
BEGIN
  if Form3.Visible=false then exit;
{  dum:=MinIfNotZero(Form4.DDSpinEdit72.Value,t_end*1000)+1e-4;
  if dum<>0 then Form3.Chart3.BottomAxis.Maximum:=dum;
  t_sc:=Form3.Chart3.BottomAxis.Maximum;}
  tl:=t*1000{ms};//-trunc(t*1000{ms}/t_sc)*t_sc;  tl_:=tl+dt;
  with  Columns[i,j].Pop[1] do begin
        Form3.Series8.AddXY(tl, nu);
        Form3.Series5.AddXY(tl, Nrn[PP.Nts].NV.V*1e3);
  end;
  if NPop>=2 then
  with  Columns[i,j].Pop[2] do begin
        Form3.Series9.AddXY(tl, nu);
        Form3.Series6.AddXY(tl, Nrn[PP.Nts].NV.V*1e3);
  end;
  if NPop>=3 then
  with  Columns[i,j].Pop[3] do begin
        Form3.Series11.AddXY(tl, nu);
        Form3.Series7.AddXY(tl, Nrn[PP.Nts].NV.V*1e3);
  end;
  if NPop>=4 then
  with  Columns[i,j].Pop[4] do begin
        Form3.Series12.AddXY(tl, nu);
        Form3.Series10.AddXY(tl, Nrn[PP.Nts].NV.V*1e3);
  end;
  { VSD }
  Form3.Series26.AddXY(tl, VSD(Columns[i,j]));
  {******************** Second node ******************}
  if (i2<=0)or(j2<=0) then begin         // it was and before 24.05.2016
      Form3.Series18.Active:=false;
      Form3.Series19.Active:=false;
      Form3.Series20.Active:=false;
      Form3.Series21.Active:=false;
      Form3.Series22.Active:=false;
      Form3.Series23.Active:=false;
      Form3.Series24.Active:=false;
      Form3.Series25.Active:=false;
      EXIT;
  end;
  with  Columns[i2,j2].Pop[1] do begin
        Form3.Series18.AddXY(tl, nu);
        Form3.Series22.AddXY(tl, Nrn[PP.Nts].NV.V*1e3);
  end;
  if NPop>=2 then
  with  Columns[i2,j2].Pop[2] do begin
        Form3.Series19.AddXY(tl, nu);
        Form3.Series23.AddXY(tl, Nrn[PP.Nts].NV.V*1e3);
  end;
  if NPop>=3 then
  with  Columns[i2,j2].Pop[3] do begin
        Form3.Series20.AddXY(tl, nu);
        Form3.Series24.AddXY(tl, Nrn[PP.Nts].NV.V*1e3);
  end;
  if NPop>=4 then
  with  Columns[i2,j2].Pop[4] do begin
        Form3.Series21.AddXY(tl, nu);
        Form3.Series25.AddXY(tl, Nrn[PP.Nts].NV.V*1e3);
  end;
END;

procedure ExtractFieldFromColumns(s1 :string; var z :arr_X_Y);
var
   iPWCenter,jPWCenter,charge,
   i,j,ip,n_maxV                  :integer;
   fi_,fi0_,dx_,dy_,remQns,pext   :double;
begin
  if s1='ElectricalStimulus' then EmulateFieldsOfBipolarStimulation_WQ_Wrn;
  if s1='PatchyConnections'  then EmulateReceptiveFieldOfTheViewPoint;
  for i:=0 to ni+1 do begin
      for j:=0 to nj+1 do if if_ni_nj_ne_1(i,j) then begin
          z[i,j]:=0;
          if (s1='nu1')and(NPop>=1) then z[i,j]:=Columns[i,j].Pop[1].nu;
          if (s1='nu2')and(NPop>=2) then z[i,j]:=Columns[i,j].Pop[2].nu;
          if (s1='nu3')and(NPop>=3) then z[i,j]:=Columns[i,j].Pop[3].nu;
          if (s1='nu4')and(NPop>=4) then z[i,j]:=Columns[i,j].Pop[4].nu;
          if (s1='U1')and(NPop>=1) then z[i,j]:=Columns[i,j].Pop[1].U*1e3;
          if (s1='U2')and(NPop>=2) then z[i,j]:=Columns[i,j].Pop[2].U*1e3;
          if (s1='U3')and(NPop>=3) then z[i,j]:=Columns[i,j].Pop[3].U*1e3;
          if (s1='U4')and(NPop>=4) then z[i,j]:=Columns[i,j].Pop[4].U*1e3;
          if (s1='uE1')and(NPop>=1) then z[i,j]:=Columns[i,j].Pop[1].uE;
          if (s1='uE2')and(NPop>=2) then z[i,j]:=Columns[i,j].Pop[2].uE;
          if (s1='uE3')and(NPop>=3) then z[i,j]:=Columns[i,j].Pop[3].uE;
          if (s1='uE4')and(NPop>=4) then z[i,j]:=Columns[i,j].Pop[4].uE;
          if  s1='rext' then z[i,j]:=Columns[i,j].rext;
          if  s1='PinWheels' then begin
             remQns:=Qns;  Qns:=1;
//             Set_Ps_2D(i,j,pext);
//             fi0_:=Form3.DDSpinEdit12.Value/180*pi;
             PinWheel_fi_for_ij(i,j,fi0_,fi_,dx_,dy_,iPWCenter,jPWCenter,charge);
             z[i,j]:={cos}(fi_)/pi*180;//pext;              // it was fi_ before 14.01.2016
             Qns:=remQns;
          end;
          if s1='from Inspector' then begin
//             Form18.DDSpinEdit1.Value:=i;
//             Form18.DDSpinEdit2.Value:=j;
             z[i,j]:=FieldToSee(Columns[i,j]);
          end;
          if s1='VisualStimulus' then begin
             z[i,j]:=VisualStimulation(t+0.001,i,j);
          end;
          if s1='Screen' then begin
             z[i,j]:=Screen_Projection_to_Cortex(i,j);
          end;
          if s1='ElectricalStimulus' then begin
             z[i,j]:=Wrn[1,i,j];
          end;
          if s1='PatchyConnections' then begin
             z[i,j]:=Wrn[1,i,j];
          end;
          if (s1='VSD-signal')and(NPop>1) then begin
             z[i,j]:=VSD(Columns[i,j]);
          end;
      end;
  end;
  { Extrapolation for boundaries if the domain is reduced }
  if ni=1 then begin
     for j:=0 to nj+1 do if if_ni_nj_ne_1(1,j) then begin
         z[0,j]:=z[1,j];
         z[2,j]:=z[1,j];
     end;
  end;
  if nj=1 then begin
     for i:=0 to ni+1 do if if_ni_nj_ne_1(i,1) then begin
         z[i,0]:=z[i,1];
         z[i,2]:=z[i,1];
     end;
  end;
end;

function MaxOfArray(z :arr_X; N :integer) :double;
var i :integer;
    S :double;
begin
  S:=-1e8;
  for i:=0 to N do begin
      if z[i]>S then S:=z[i];
  end;
  MaxOfArray:=S;
end;

procedure ExtractRingFromPinWheels(t1:string; Nfi:integer; DrawOrWrite :string);
{ Draws distribution on a circle, interpolating values from rectangular mesh. }
var fi,rPlot,x,y,S1,S2,S3,S4,ma                               :double;
    i_Center,j_Center,l,i,j,iPW,jPW,i_at,j_at                 :integer;
    z                                                         :arr_X_Y;
    z_fi                                                      :arr_X;
    t2                                                        :string;
    bbb                                                       :text;
begin
  if Form15.CheckBox1.Checked then Form15.Top:=imin(Form15.Top,494)
                              else EXIT;
  rPW     :=trunc(Form3.DDSpinEdit13.Value);        //radius of pinwheel
  i_at:=trunc(Form15.DDSpinEdit1.Value);
  j_at:=trunc(Form15.DDSpinEdit2.Value);
  { Parameters of the circle to plot }
  PinWheelCoordinates_near_ij(i_at,j_at, iPW,jPW,i_Center,j_Center);
//  i_Center:=trunc(rPW);//trunc((2*(trunc((ni/2)/2/rPW)+1)-1)*rPW);
//  j_Center:=trunc(rPW);//trunc((2*(trunc((nj/2)/2/rPW)+1)-1)*rPW);
  rPlot:=rPW*3/4;
  Nfi:=imin(100,mXmax);
  { Field to plot }
  ExtractFieldFromColumns(t1,z);
  { Interpolation on the circle }
  for l:=0 to Nfi do begin
      fi:=l/Nfi*2*pi;
      x:=i_Center + rPlot*cos(fi);
      y:=j_Center + rPlot*sin(fi);
      i:=trunc(x);
      j:=trunc(y);
      if (i<0)or(j<0)or(i>ni)or(j>nj) then EXIT;
      S1:=(i+1-x)*(j+1-y);
      S2:=(i+1-x)*(y-j);
      S3:=(x-i)  *(y-j);
      S4:=(x-i)  *(j+1-y);
      z_fi[l]:=S1*z[i,j] + S2*z[i,j+1] + S3*z[i+1,j+1] + S4*z[i+1,j];
  end;
  { Drawing }
  if (DrawOrWrite='Draw')or(DrawOrWrite='DrawAndWrite') then begin
      ma:=MaxOfArray(z_fi,Nfi);
      Form15.Chart1.LeftAxis.AutomaticMaximum:=not(ma>0);
      if (ma>0)and(ma>Form15.Chart1.LeftAxis.Minimum) then
         Form15.Chart1.LeftAxis.Maximum:=2*exp(ln(5)*(trunc(ln(ma/2)/ln(5))+1));
      Form15.Series1.Clear;
      for l:=0 to Nfi do begin
          fi:=l/Nfi*2*pi;
          Form15.Series1.AddXY(fi/pi*180,z_fi[l]);
      end;
      Form15.Frame15.Series4.X0:=i_Center-rPlot;
      Form15.Frame15.Series4.X1:=i_Center+rPlot;
      Form15.Frame15.Series4.Y0:=j_Center-rPlot;
      Form15.Frame15.Series4.Y1:=j_Center+rPlot;
      Application.ProcessMessages;
  end;
  { Writing }
  if (DrawOrWrite='Write')or(DrawOrWrite='DrawAndWrite') then begin
  { One file *************************************************}
  t2:='Ring(t,x).dat';
  assign(bbb,t2);
  if nt=1 then begin
     rewrite(bbb);
     writeln(bbb,'ZONE T="',t2,'"');
     writeln(bbb,'I=',Nfi+1:3,',J=',trunc(nt_end/n_Write)+1:3,',K=1,F=POINT');
  end else append(bbb);
  for l:=0 to Nfi do begin
      fi:=l/Nfi*2*pi;
      writeln(bbb,t*1000:9:5,' ',fi/pi*180:9:3,' ',z_fi[l]:10:5);
  end;
  close(bbb);
{      str(round(t*1000):3, t2);
      t2:='Ring'+t2+t1+'.dat';
      assign(bbb,t2);  rewrite(bbb);
      for l:=0 to Nfi do begin
          fi:=l/Nfi*2*pi;
          writeln(bbb,fi/pi*180:9:2,' ',z_fi[l]:13:5);
      end;
      close(bbb);}
  end;
end;

procedure PrintTimeOnForm3;
var  t1,t2 :string;
begin
   setcolor(1);
   str(t*1000:8:3,t1);
   t1:='t='+t1+' ';
   Form3.Label5.Caption:=t1;
   str(nt:3,t1);
   t1:='nt='+t1;
   Form3.Label6.Caption:=t1;
end;

procedure SetNameOfTheField(s1 :string);
begin
  if s1='nu1' then Form15.Frame15.ComboBox1.ItemIndex:=0 else
  if s1='nu2' then Form15.Frame15.ComboBox1.ItemIndex:=1 else
  if s1='nu3' then Form15.Frame15.ComboBox1.ItemIndex:=2 else
  if s1='nu4' then Form15.Frame15.ComboBox1.ItemIndex:=3 else
  if s1='U1' then Form15.Frame15.ComboBox1.ItemIndex:=4 else
  if s1='U2' then Form15.Frame15.ComboBox1.ItemIndex:=5 else
  if s1='U3' then Form15.Frame15.ComboBox1.ItemIndex:=6 else
  if s1='U4' then Form15.Frame15.ComboBox1.ItemIndex:=7 else
  if s1='uE1' then Form15.Frame15.ComboBox1.ItemIndex:=8 else
  if s1='uE2' then Form15.Frame15.ComboBox1.ItemIndex:=9 else
  if s1='uE3' then Form15.Frame15.ComboBox1.ItemIndex:=10 else
  if s1='uE4' then Form15.Frame15.ComboBox1.ItemIndex:=11 else
  if s1='rext' then Form15.Frame15.ComboBox1.ItemIndex:=12 else
  if s1='PinWheels' then Form15.Frame15.ComboBox1.ItemIndex:=13 else
  if s1='from Inspector' then Form15.Frame15.ComboBox1.ItemIndex:=14 else
  if s1='VisualStimulus' then Form15.Frame15.ComboBox1.ItemIndex:=15 else
  if s1='Screen' then Form15.Frame15.ComboBox1.ItemIndex:=16 else
  if s1='ElectricalStimulus' then Form15.Frame15.ComboBox1.ItemIndex:=17 else
  if s1='PatchyConnections' then Form15.Frame15.ComboBox1.ItemIndex:=18;
  if s1='VSD-signal' then Form15.Frame15.ComboBox1.ItemIndex:=19;
end;

{*********************************************************************}
PROCEDURE Draw_Lattice(s1 :string; jview :integer);
var
     i,j,col,iPWCenter,jPWCenter          :integer;
     min,max,dmin,dmax,D,fix_min,fix_max  :double;
     z                                    :arr_X_Y;
BEGIN
   if Form15.Visible=false then EXIT;
   {****************************}
   ExtractFieldFromColumns(s1,z);
   SetNameOfTheField(s1);
   {****************************}
   Form3.Chart1.BottomAxis.Maximum:=ni;
   Form15.Frame15.Series2.ColorEachPoint:=true;
   Form15.Frame15.Chart1.BottomAxis.Maximum:=imax(ni,nj)+1;
   Form15.Frame15.Chart1.LeftAxis.Maximum  :=imax(ni,nj)+1;
   Form15.Frame15.Series1.Clear;
   Form15.Frame15.Series2.Clear;
   Form15.Frame15.Series5.Clear;
   Form15.Frame15.Series6.Clear;
   Form15.Frame15.Series7.Clear;
   Form15.Frame15.Series10.Clear;
   Form15.Frame15.Series11.Clear;
   { Time }
   PrintTimeOnForm3;
   { ***** }
   Form15.Frame15.Visible:=Form3.CheckBox1.Checked;
   if Form3.CheckBox1.Checked then begin
      { Scales }
      Min_Max(z, min,max,dmin,dmax);
      dmin:=min;  dmax:=max;   // it neglects the log-stepping of limits
      if  dmin>0                 then begin dmin:=0;   min:=0;   end; //for zero level of firing rates and conductances
      if (dmin>-65)and(dmin<-40) then begin dmin:=-65; min:=-65; end; //for zero level of voltages
      fix_min:=Form15.DDSpinEdit3.Value;
      fix_max:=Form15.DDSpinEdit4.Value;
      if fix_min<>fix_max then begin min:=fix_min; max:=fix_max; dmin:=min;  dmax:=max; end;
      { Palette }
      PaletteInFrame(min,max);
      { Lattice }
      for i:=1 to ni+1 do begin
          for j:=1 to nj+1 do if if_ni_nj_ne_1(i,j) then begin
              D:=(z[i-1,j-1]+z[i,j]+z[i-1,j]+z[i,j-1])/4;
              col:=Color_u(D,dmin,dmax);
              Form15.Frame15.Series2.AddBubble(i-0.5,j-0.5,0.6,'',GreenVioletColor(col));
          end;
      end;
                     { Distribution along line }
//      Form15.Frame15.Series1.AddXY(i,(z[i,jview]-dmin)/(dmax-dmin+1e-6));
   end;
   Form15.Frame15.Series5.AddXY(ni_stim, nj_stim);
   Form15.Frame15.Series5.AddXY(ni_stim2,nj_stim2);
   Form15.Frame15.Series7.AddXY(i_view,j_view);
   if (i_view2>0)and(j_view2>0) then
   Form15.Frame15.Series10.AddXY(i_view2,j_view2);
   { Pinwheel centers }
   if rPW>0 then begin
      iPWCenter:=0;
      while 2*rPW*iPWCenter<=ni do begin
         iPWCenter:=iPWCenter+1;
         jPWCenter:=0;
         while 2*rPW*jPWCenter<=nj do begin
               jPWCenter:=jPWCenter+1;
               PinWheelCoordinates(iPWCenter,jPWCenter, i,j);
               {i:=2*rPW*(iPWCenter-1)+rPW;
               j:=2*rPW*(jPWCenter-1)+rPW;}
               Form15.Frame15.Series6.AddXY(i,j);
         end;
      end;
   end;
   { Cut }
   if IfCut=1 then begin
      Form15.Frame15.Series11.AddXY(i_cut,imax(nj_2-trunc(h_cut/2),0));
      Form15.Frame15.Series11.AddXY(i_cut,imin(nj_2+trunc(h_cut/2),nj+1));
   end;
   Application.ProcessMessages;
END;

procedure DiscontinuousRateAxisMaximum(Axis :TChartAxis);
var am :double;
begin
  Axis.AutomaticMaximum:=true;
  Application.ProcessMessages;
  Axis.AutomaticMaximum:=false;
  am:=Axis.Maximum;
  if (am>0)and(am>Axis.Minimum) then
         Axis.Maximum:=2*exp(ln(5)*(trunc(ln(am/2)/ln(5))+1));
end;

procedure DiscontinuousVoltageAxisMaximum(Axis :TChartAxis);
var am,bm :double;
begin
  Axis.AutomaticMaximum:=true;
  Axis.AutomaticMinimum:=true;
  Application.ProcessMessages;
  Axis.AutomaticMaximum:=false;
  Axis.AutomaticMinimum:=false;
  am:=Axis.Maximum;
  bm:=Axis.Minimum;
  if (am>bm) then begin
      am:=(trunc(am/10)  )*10;
      bm:=(trunc(bm/10)-1)*10;
  end;
  if (am>bm) then begin
      Axis.Maximum:=am;
      Axis.Minimum:=bm;
  end;
end;

PROCEDURE Draw_1D_Plots(jview :integer);
var
   i   :integer;
begin
   if Form3.Visible=false then exit;
   if Form3.PageControl1.ActivePageIndex<>1 then exit;
   { Time }
   PrintTimeOnForm3;
   {Spatial distribution }
   Form3.LineSeries1.Clear;
   Form3.LineSeries2.Clear;
   Form3.Series3.Clear;
   Form3.Series4.Clear;
   Form3.Series13.Clear;
   Form3.Series14.Clear;
   Form3.Series15.Clear;
   Form3.Series16.Clear;
   Form3.Series27.Clear;
   for i:=0 to ni+1 do if if_ni_nj_ne_1(i,jview) then begin
       with  Columns[i,jview].Pop[1] do begin
             Form3.LineSeries1.AddXY(i, nu);
             Form3.Series3.AddXY(i, Nrn[PP.Nts].NV.V*1e3);
       end;
       if NPop>=2 then
       with  Columns[i,jview].Pop[2] do begin
             Form3.LineSeries2.AddXY(i, nu);
             Form3.Series4.AddXY(i, Nrn[PP.Nts].NV.V*1e3);
       end;
       if NPop>=3 then
       with  Columns[i,jview].Pop[3] do begin
             Form3.LineSeries5.AddXY(i, nu);      {Series13}
             Form3.Series15.AddXY(i, Nrn[PP.Nts].NV.V*1e3);
       end;
       if NPop>=4 then
       with  Columns[i,jview].Pop[4] do begin
             Form3.LineSeries6.AddXY(i, nu);      {Series14}
             Form3.Series16.AddXY(i, Nrn[PP.Nts].NV.V*1e3);
       end;
       { VSD }
       Form3.Series27.AddXY(i, VSD(Columns[i,jview]));
   end;
   { Scales }
   if nt mod 10*trunc(Form3.DDSpinEdit3.Value) = 0 then begin
//      DiscontinuousRateAxisMaximum(Form3.Chart1.RightAxis);
      DiscontinuousRateAxisMaximum(Form3.Chart4.LeftAxis);
      DiscontinuousVoltageAxisMaximum(Form3.Chart1.LeftAxis);
//      DiscontinuousVoltageAxisMaximum(Form3.Chart4.LeftAxis);
   end;
   Application.ProcessMessages;
END;

procedure WriteOneField(s1 :string);
var  i,j :integer;
     z   :arr_X_Y;
begin
  ExtractFieldFromColumns(s1,z);
  s1:=s1+'.dat';
  assign(bbb,s1);  rewrite(bbb);
  writeln(bbb,'ZONE T="',s1,'"');
  writeln(bbb,'I=',nj+2:3,',J=',ni+2:3,',K=1,F=POINT');
  for i:=0 to ni+1 do  for j:=0 to nj+1 do if if_ni_nj_ne_1(i,j) then begin
      writeln(bbb,i*dx:9:5,' ',j*dy:9:5,' ',z[i,j]:8:4,' ',i:3,' ',j:3);
  end;
  close(bbb);
end;

end.
