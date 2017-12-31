unit Lattice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  Frame_2DO,MathMyO,Unit1;

PROCEDURE Draw_Lattice(z :arr_X_Y; ni,nj,rPW:integer; fix_min,fix_max :double);

implementation
uses Unit15;

procedure Min_Max(z :arr_X_Y; ni,nj:integer; var min,max,dmin,dmax :double);
var  i,j :integer;
begin
  min:= 1e10;
  max:=-1e10;
  for i:=1 to ni do for j:=1 to nj do begin
          if z[i,j]>max then max:=z[i,j];
          if z[i,j]<min then min:=z[i,j];
  end;
  { Discretization of steps for min and max}
  i:=trunc(dln(abs(min))/ln(10)*10);
  dmin:=step(10,i/10)*sgn(min);
  j:=trunc(dln(abs(max))/ln(10)*10)+1;
  dmax:=step(10,j/10)*sgn(max);
end;

function GreenVioletColor(col :integer) :TColor;
var tmp :TColor;
begin
{  TableOfColors(col,tmp);
  GreenVioletColor:=tmp;
  exit;            }
       if col=14 then  GreenVioletColor:=$00B00000
  else if col=13 then  GreenVioletColor:=$00F01000
  else if col=12 then  GreenVioletColor:=$00F0A000
  else if col=11 then  GreenVioletColor:=$00F0C000
  else if col=10 then  GreenVioletColor:=$00F0F000
  else if col= 9 then  GreenVioletColor:=$00B0F000
  else if col= 8 then  GreenVioletColor:=$0080F000
  else if col= 7 then  GreenVioletColor:=$0000F000
  else if col= 6 then  GreenVioletColor:=$0000F080
  else if col= 5 then  GreenVioletColor:=$0010F0B0
  else if col= 4 then  GreenVioletColor:=$0010F0E0
  else if col= 3 then  GreenVioletColor:=$0010B0F0
  else if col= 2 then  GreenVioletColor:=$001050F0
  else if col= 1 then  GreenVioletColor:=$000000F0
  else if col= 0 then  GreenVioletColor:=$001010B0
  else if col=15 then  GreenVioletColor:=$00808080
  else if col=16 then  GreenVioletColor:=$00101010
end;

procedure PaletteInFrame(min,max,dmin,dmax :double);
var  i,x,y,n_null,x0 :integer;
     t1,t2           :string;
begin
  for i:=1 to 15 do begin
      Form15.Frame15.Series3.AddBubble(i,0,1,'',GreenVioletColor(15-i));
  end;
  str(min:8:3,t1);
  Form15.Frame15.Label1.Caption:=t1;
  str(max:8:3,t1);
  Form15.Frame15.Label2.Caption:=t1;
end;

function Color_u(x,min,max :double) :integer;
var  sc :double;
begin
  sc:=abs(max-min);  if sc<1e-6 then sc:=1e-6;
  if x<min then x:=min else if x>max then x:=max;
  Color_u:=14-round(abs(x-min)/sc*14);
end;

{*********************************************************************}
PROCEDURE Draw_Lattice(z :arr_X_Y; ni,nj,rPW:integer; fix_min,fix_max :double);
var
     i,j,col,iPWCenter,jPWCenter      :integer;
     min,max,dmin,dmax,D              :double;
BEGIN
//   ExtractFieldFromColumns(s1,z);
//   Form3.Chart1.BottomAxis.Maximum:=ni;
   Form15.Frame15.Series2.ColorEachPoint:=true;
   Form15.Frame15.Chart1.BottomAxis.Maximum:=imax(ni,nj)+1;
   Form15.Frame15.Chart1.LeftAxis.Maximum  :=imax(ni,nj)+1;
   Form15.Frame15.Series1.Clear;
   Form15.Frame15.Series2.Clear;
   Form15.Frame15.Series5.Clear;
   Form15.Frame15.Series6.Clear;
   { ***** }
   Form15.Frame15.Visible:=true;
      Min_Max(z, ni,nj, min,max,dmin,dmax);
      if min>0 then min:=0; //for zero level of firing rates and conductances
      if (min>-65)and(min<-40) then min:=-65; //for zero level of voltages
      if fix_min<fix_max then begin min:=fix_min; max:=fix_max; end;
      dmin:=min;  dmax:=max;
      PaletteInFrame(min,max,dmin,dmax);
                     { Lattice }
      for i:=2 to ni do begin
          for j:=2 to nj do begin
              D:=(z[i-1,j-1]+z[i,j]+z[i-1,j]+z[i,j-1])/4;
              col:=Color_u(D,dmin,dmax);
              Form15.Frame15.Series2.AddBubble(i-0.5,j-0.5,0.6,'',GreenVioletColor(col));
          end;
      end;
   { Pinwheel centers }
   if rPW>0 then begin
      iPWCenter:=0;
      while 2*rPW*iPWCenter<=ni do begin
         iPWCenter:=iPWCenter+1;
         jPWCenter:=0;
         while 2*rPW*jPWCenter<=nj do begin
               jPWCenter:=jPWCenter+1;
               i:=(2*iPWCenter-1)*rPW;
               j:=(2*jPWCenter-1)*rPW;
               Form15.Frame15.Series6.AddXY(i,j);
         end;
      end;
   end;
   Application.ProcessMessages;
END;

end.
