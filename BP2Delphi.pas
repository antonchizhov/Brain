unit BP2Delphi;
{Translator of graphics functions of TurboPascal}

interface
uses Graphics,Unit1,Unit3;

procedure TableOfColors(col: integer; var tcol :TColor);
procedure SetColor(col: integer);
procedure SetMyBrushColor(col :integer);
function GreenVioletColor(col :integer) :TColor;
procedure OutTextxy(x1,y1 :integer; t1 :string);

implementation

procedure TableOfColors(col: integer; var tcol :TColor);
begin
  if col= 0 then tcol:=clWhite else
  if col= 1 then tcol:=clBlack else
  if col= 2 then tcol:=clRed else
  if col= 3 then tcol:=clAqua else
  if col= 4 then tcol:=clYellow else
  if col= 5 then tcol:=clGreen else
  if col= 6 then tcol:=clBlue else
  if col= 7 then tcol:=clNavy else
  if col= 8 then tcol:=clPurple else
  if col= 9 then tcol:=clFuchsia else
  if col=10 then tcol:=clLime else
  if col=11 then tcol:=clDkGray else
  if col=12 then tcol:=clMaroon else
  if col=13 then tcol:=clSilver else
  if col=14 then tcol:=clGray else
                 tcol:=clOlive; 
end;

procedure SetColor(col: integer);
var tcol :TColor;
begin
  TableOfColors(col,tcol);
  Form1.Canvas.Brush.Color:=clBtnFace;
  Form1.Canvas.Pen.Color := tcol;
  Form1.Canvas.Font.Color := tcol;
  Form1.CoeMemo.Font.Color := tcol;
  Form3.Canvas.Brush.Color:=clBtnFace;
  Form3.Canvas.Pen.Color := tcol;
  Form3.Canvas.Font.Color := tcol;
end;

procedure SetMyBrushColor(col :integer);
begin
       if col= 0 then  Form3.Canvas.Brush.Color:=$00000000
  else if col= 1 then  Form3.Canvas.Brush.Color:=$00FF1080
  else if col= 2 then  Form3.Canvas.Brush.Color:=$00F02080
  else if col= 3 then  Form3.Canvas.Brush.Color:=$00E03080
  else if col= 4 then  Form3.Canvas.Brush.Color:=$00D04080
  else if col= 5 then  Form3.Canvas.Brush.Color:=$00C05080
  else if col= 6 then  Form3.Canvas.Brush.Color:=$00B06080
  else if col= 7 then  Form3.Canvas.Brush.Color:=$00A07080
  else if col= 8 then  Form3.Canvas.Brush.Color:=$00908080
  else if col= 9 then  Form3.Canvas.Brush.Color:=$00809080
  else if col=10 then  Form3.Canvas.Brush.Color:=$0070A080
  else if col=11 then  Form3.Canvas.Brush.Color:=$0060B080
  else if col=12 then  Form3.Canvas.Brush.Color:=$0050C080
  else if col=13 then  Form3.Canvas.Brush.Color:=$0040D080
  else if col=14 then  Form3.Canvas.Brush.Color:=$0030E080
  else if col=15 then  Form3.Canvas.Brush.Color:=$0020F080
  else if col=16 then  Form3.Canvas.Brush.Color:=$0010FF80
end;

{function GreenVioletColor(col :integer) :TColor;
var tmp :TColor;
begin
       if col= 0 then  GreenVioletColor:=$000000F0
  else if col= 1 then  GreenVioletColor:=$00FF10E0
  else if col= 2 then  GreenVioletColor:=$00F020C0
  else if col= 3 then  GreenVioletColor:=$00E030A0
  else if col= 4 then  GreenVioletColor:=$00D04080
  else if col= 5 then  GreenVioletColor:=$00C05060
  else if col= 6 then  GreenVioletColor:=$00B06040
  else if col= 7 then  GreenVioletColor:=$00A07020
  else if col= 8 then  GreenVioletColor:=$00908000
  else if col= 9 then  GreenVioletColor:=$00809020
  else if col=10 then  GreenVioletColor:=$0070A040
  else if col=11 then  GreenVioletColor:=$0060B060
  else if col=12 then  GreenVioletColor:=$0050C080
  else if col=13 then  GreenVioletColor:=$0040D0A0
  else if col=14 then  GreenVioletColor:=$0030E0C0
  else if col=15 then  GreenVioletColor:=$0020F0E0
  else if col=16 then  GreenVioletColor:=$0010FFF0
end;}

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

procedure OutTextxy(x1,y1 :integer; t1 :string);
begin
  Form1.Canvas.TextOut(x1,y1,t1);
{  Form1.Memo2.Lines.Add(t1);}
end;

{-----------------------------------------------------------}

end.
 