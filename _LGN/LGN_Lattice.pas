unit LGN_Lattice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  Frame_2DO,MathMyO,Unit1,LGN_Init;


function abs(x:double):double;
function sgn(x:double):integer;
function max(x,y:double):double;
function min(x,y:double):double;
function imax(x,y:integer):integer;
function imin(x,y:integer):integer;
PROCEDURE Draw_Lattice(Pz :Parr_X_Y; ni,nj,rPW,IfGray :integer);

implementation
uses LGN_Unit15;

function abs(x:double):double;
  begin  if x<0 then abs:=-x else abs:=x;  end;
function sgn(x:double):integer;
  begin  if x<0 then sgn:=-1 else sgn:=1;  end;
function max(x,y:double):double;
  begin  if x>y then max:=x  else max:=y;  end;
function min(x,y:double):double;
  begin  if x<y then min:=x  else min:=y;  end;
function imax(x,y:integer):integer;
  begin  if x>y then imax:=x  else imax:=y;  end;
function imin(x,y:integer):integer;
  begin  if x<y then imin:=x  else imin:=y;  end;

procedure Min_Max(Pz :Parr_X_Y; ni,nj:integer; var min,max,dmin,dmax :double);
var  i,j :integer;
begin
  min:= 1e10;
  max:=-1e10;
  for i:=1 to ni do for j:=1 to nj do begin
          if Pz^[i,j]>max then max:=Pz^[i,j];
          if Pz^[i,j]<min then min:=Pz^[i,j];
  end;
  { Discretization of steps for min and max}
  i:=trunc(dln(abs(min))/ln(10)*10);
  dmin:=step(10,i/10)*sgn(min);
  j:=trunc(dln(abs(max))/ln(10)*10)+1;
  dmax:=step(10,j/10)*sgn(max);
end;

function GreenVioletColor(col,IfGray :integer) :TColor;
var tmp :TColor;
begin
{  TableOfColors(col,tmp);
  GreenVioletColor:=tmp;
  exit;            }
  if IfGray=1 then begin     { Grayscale }
       if col= 2 then  GreenVioletColor:=$00D0D0D0
  else if col= 3 then  GreenVioletColor:=$00C0C0C0
  else if col= 4 then  GreenVioletColor:=$00B0B0B0
  else if col= 5 then  GreenVioletColor:=$00A0A0A0
  else if col= 6 then  GreenVioletColor:=$00909090
  else if col= 7 then  GreenVioletColor:=$00808080
  else if col= 8 then  GreenVioletColor:=$00707070
  else if col= 9 then  GreenVioletColor:=$00606060
  else if col=10 then  GreenVioletColor:=$00505050
  else if col=11 then  GreenVioletColor:=$00404040
  else if col=12 then  GreenVioletColor:=$00303030
  else if col=13 then  GreenVioletColor:=$00202020
  else if col=14 then  GreenVioletColor:=$00101010
  else if col=15 then  GreenVioletColor:=$00080808
  else if col=16 then  GreenVioletColor:=$00000000
  else if col= 1 then  GreenVioletColor:=$00E0E0E0
  else if col= 0 then  GreenVioletColor:=$00F0F0F0
  end else begin
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
end;

procedure PaletteInFrame(min,max,dmin,dmax :double; IfGray :integer);
var  i,x,y,n_null,x0 :integer;
     t1,t2           :string;
begin
  for i:=1 to 15 do begin
      LGN_Form15.Frame15.Series3.AddBubble(i,0,1,'',GreenVioletColor(15-i,IfGray));
  end;
  str(dmin:8:3,t1);
  LGN_Form15.Frame15.Label1.Caption:=t1;
  str(dmax:8:3,t1);
  LGN_Form15.Frame15.Label2.Caption:=t1;
end;

function Color_u(x,min,max :double) :integer;
var  sc :double;
begin
  sc:=abs(max-min);  if sc<1e-6 then sc:=1e-6;
  if x<min then x:=min else if x>max then x:=max;
  Color_u:=14-round(abs(x-min)/sc*14);
end;

{*********************************************************************}
PROCEDURE Draw_Lattice(Pz :Parr_X_Y; ni,nj,rPW,IfGray :integer);
var
     i,j,col,iPWCenter,jPWCenter      :integer;
     min,max,dmin,dmax,D              :double;
BEGIN
//   ExtractFieldFromColumns(s1,z);
//   Form3.Chart1.BottomAxis.Maximum:=ni;
   LGN_Form15.Frame15.Series2.ColorEachPoint:=true;
   LGN_Form15.Frame15.Chart1.BottomAxis.Maximum:=imax(ni,nj)+1;
   LGN_Form15.Frame15.Chart1.LeftAxis.Maximum  :=imax(ni,nj)+1;
   LGN_Form15.Frame15.Series1.Clear;
   LGN_Form15.Frame15.Series2.Clear;
   LGN_Form15.Frame15.Series5.Clear;
   LGN_Form15.Frame15.Series6.Clear;
   { ***** }
   LGN_Form15.Frame15.Visible:=true;
      Min_Max(Pz, ni,nj, min,max,dmin,dmax);
      dmin:=min;  dmax:=max;
      if IfGray=1 then dmin:=0;
      PaletteInFrame(min,max,dmin,dmax, IfGray);
                     { Lattice }
      for i:=1 to ni+1 do begin
          for j:=1 to nj+1 do begin
              D:=(Pz^[i-1,j-1]+Pz^[i,j]+Pz^[i-1,j]+Pz^[i,j-1])/4;
              col:=Color_u(D,dmin,dmax);
              LGN_Form15.Frame15.Series2.AddBubble(i-0.5,j-0.5,0.6,'',GreenVioletColor(col,IfGray));
          end;
      end;
   { Pinwheel centers }
   {if rPW>0 then begin
      iPWCenter:=0;
      while 2*rPW*iPWCenter<=ni do begin
         iPWCenter:=iPWCenter+1;
         jPWCenter:=0;
         while 2*rPW*jPWCenter<=nj do begin
               jPWCenter:=jPWCenter+1;
               i:=(2*iPWCenter-1)*rPW;
               j:=(2*jPWCenter-1)*rPW;
               LGN_Form15.Frame15.Series6.AddXY(i,j);
         end;
      end;
   end;}
   { Center of stimulus }
   LGN_Form15.Frame15.Series5.AddXY(ni2_Screen,nj2_Screen);
   { Recorded neuron }
   LGN_Form15.Frame15.Series6.AddXY(Diagram.i_RecNrn,Diagram.j_RecNrn);
   Application.ProcessMessages;
END;

end.
