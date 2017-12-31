unit FrameLattice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Series, BubbleCh, TeEngine, TeeShape, ExtCtrls, TeeProcs, Chart,
  StdCtrls;

const
  mXmax=200; mYMax=200;

type
  arr_X_Y  =array[0..mXmax,0..mYMax] of double;

  TFrameLattice = class(TFrame)
    Chart1: TChart;
    Series2: TBubbleSeries;
    Series1: TLineSeries;
    Chart2: TChart;
    Series3: TBubbleSeries;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Series4: TChartShape;
    Series5: TPointSeries;
    Series6: TPointSeries;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Min_Max(z :arr_X_Y; ni,nj:integer;
                                var min_,max_,dmin,dmax :double);
    procedure PaletteInFrame(min,max,dmin,dmax :double);
    PROCEDURE Draw_Lattice(z,x,y :arr_X_Y; ni,nj,rPW:integer);
  end;

procedure Register;

implementation

{$R *.dfm}

procedure Register;
begin
  RegisterComponents('Neurons', [TFrameLattice]);
end;

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


function dln(x :double) :double;
begin
  if x<1e-20 then  dln:=0  else  dln:=ln(x);
end;

function dexp(x :double) :double;
begin
  if      x<-20 then begin
     dexp:=0{exp(-20)}
  end else if x> 20 then begin
     dexp:=exp( 20)
  end else begin
     dexp:=exp(x);
  end;
end;

function step(a,b :double) :double;    { step = a**b }
begin
  step:=exp(b*ln(a));
end;

procedure TFrameLattice.Min_Max(z :arr_X_Y; ni,nj:integer;
                                var min_,max_,dmin,dmax :double);
var  i,j :integer;
begin
  min_:= 1e10;
  max_:=-1e10;
  for i:=1 to ni do for j:=1 to nj do begin
          if z[i,j]>max_ then max_:=z[i,j];
          if z[i,j]<min_ then min_:=z[i,j];
  end;
  { Discretization of steps for min and max}
  i:=trunc(dln(abs(min_))/ln(10)*10);
  dmin:=step(10,i/10)*sgn(min_);
  j:=trunc(dln(abs(max_))/ln(10)*10)+1;
  dmax:=step(10,j/10)*sgn(max_);
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

procedure TFrameLattice.PaletteInFrame(min,max,dmin,dmax :double);
var  i,x,y,n_null,x0 :integer;
     t1,t2           :string;
begin
  for i:=1 to 15 do begin
      Series3.AddBubble(i,0,1,'',GreenVioletColor(15-i));
  end;
  str(min:8:3,t1);
  Label1.Caption:=t1;
  str(max:8:3,t1);
  Label2.Caption:=t1;
end;

function Color_u(x,min,max :double) :integer;
var  sc :double;
begin
  sc:=abs(max-min);  if sc<1e-6 then sc:=1e-6;
  if x<min then x:=min else if x>max then x:=max;
  Color_u:=14-round(abs(x-min)/sc*14);
end;

{*********************************************************************}
PROCEDURE TFrameLattice.Draw_Lattice(z,x,y :arr_X_Y; ni,nj,rPW:integer);
var
     i,j,col,iPWCenter,jPWCenter      :integer;
     min_,max_,dmin,dmax,D,x_,y_,dxy_   :double;
BEGIN
   Series2.ColorEachPoint:=true;
   Chart1.BottomAxis.Minimum:=0;
   Chart1.LeftAxis.Minimum  :=0;
   Chart1.BottomAxis.Maximum:=imax(ni,nj)+1;
   Chart1.LeftAxis.Maximum  :=imax(ni,nj)+1;
   Series1.Clear;
   Series2.Clear;
   Series5.Clear;
   Series6.Clear;
   { ***** }
   Visible:=true;
   { Min_Max(z, ni,nj, min_,max_,dmin,dmax); }
   min_:= 1e10;
   max_:=-1e10;
   for i:=1 to ni do for j:=1 to nj do begin
       if z[i,j]>max_ then max_:=z[i,j];
       if z[i,j]<min_ then min_:=z[i,j];
   end;
   { Discretization of steps for min and max}
   i:=trunc(dln(abs(min_))/ln(10)*10);
   dmin:=step(10,i/10)*sgn(min_);
   j:=trunc(dln(abs(max_))/ln(10)*10)+1;
   dmax:=step(10,j/10)*sgn(max_);

   dmin:=min_;  dmax:=max_;
   PaletteInFrame(min_,max_,dmin,dmax);
   { Lattice }
   for i:=2 to ni do begin
       for j:=2 to nj do begin
           D:=(z[i-1,j-1]+z[i,j]+z[i-1,j]+z[i,j-1])/4;
           col:=Color_u(D,dmin,dmax);
           x_:=(x[i-1,j]+x[i,j])/2;
           y_:=(y[i,j-1]+y[i,j])/2;
           dxy_:=min(abs(x[i,j]-x[i-1,j]),abs(y[i,j]-y[i,j-1]));
           Series2.AddBubble(x_,y_,dxy_,'',GreenVioletColor(col));
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
               Series6.AddXY(i,j);
         end;
      end;
   end;
   Application.ProcessMessages;
END;

end.
