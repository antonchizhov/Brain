unit Unit28;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm28 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Shape1: TShape;
    Button3: TButton;
    Image1: TImage;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Shape1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form28: TForm28;

implementation

{$R *.dfm}

var
  Status :string;
  xx,yy :integer;

procedure TForm28.Button1Click(Sender: TObject);
begin
  Status:='On';
  repeat
{    if Status='MouseDown' then begin
       Form28.Canvas.MoveTo(xx,yy);
       Status:='On';
    end;
    if Status='MouseUp' then begin
       Form28.Canvas.LineTo(xx,yy);
       Status:='On';
    end;}
{    if Status='MouseMove' then begin
       Form28.Canvas.LineTo(xx,yy);
    end;}

    Application.ProcessMessages;
  until Status='Off';
end;

procedure TForm28.Button2Click(Sender: TObject);
begin
  Status:='Off';
end;

procedure TForm28.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Status:='MouseDown';
  xx:=X;
  yy:=Y;
end;

procedure TForm28.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Status='Fill' then begin
     Form28.Image1.Canvas.Brush.Color:=Form28.Image1.Canvas.Pixels[X,Y];
     Form28.Image1.Canvas.FloodFill(X,Y,clBlack,fsBorder);
  end;
  Status:='MouseDown';
  xx:=X;
  yy:=Y;
end;

procedure TForm28.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Status:='MouseUp';
  xx:=X;
  yy:=Y;
end;

procedure TForm28.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Status:='MouseUp';
  xx:=X;
  yy:=Y;
end;

procedure TForm28.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if Status='MouseDown' then begin
     Form28.Canvas.MoveTo(X,Y);
     Status:='MouseMove';
  end;
  if Status='CircleDown' then begin
     Form28.Shape1.Left:=X-trunc(Form28.Shape1.Width/2);
     Form28.Shape1.Top :=Y-trunc(Form28.Shape1.Height/2);
     Status:='CircleMove';
  end;
  xx:=X;
  yy:=Y;
  if Status='MouseMove' then begin
     Form28.Canvas.LineTo(xx,yy);
  end;
  Application.ProcessMessages;
end;

procedure TForm28.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if Status='MouseDown' then begin
     xx:=X+Form28.Image1.Left;
     yy:=Y+Form28.Image1.Top;
     Form28.Canvas.MoveTo(xx,yy);
     Status:='MouseMove';
  end;
  if Status='CircleDown' then begin
     Form28.Shape1.Left:=X-trunc(Form28.Shape1.Width/2);
     Form28.Shape1.Top :=Y-trunc(Form28.Shape1.Height/2);
     Status:='CircleMove';
  end;
  xx:=X+Form28.Image1.Left;
  yy:=Y+Form28.Image1.Top;
  if Status='MouseMove' then begin
     Form28.Canvas.LineTo(xx,yy);
  end;
  Application.ProcessMessages;
end;

procedure TForm28.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Status:='CircleDown';
end;

procedure TForm28.Shape1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  //Status:='CircleUp';
end;

procedure TForm28.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Status='CircleMove')and(Key='+') then begin
      Form28.Shape1.Width :=trunc(Form28.Shape1.Width*1.2);
      Form28.Shape1.Height:=trunc(Form28.Shape1.Height*1.2);
  end;
  if (Status='CircleMove')and(Key='-') then begin
      Form28.Shape1.Width :=trunc(Form28.Shape1.Width/1.2);
      Form28.Shape1.Height:=trunc(Form28.Shape1.Height/1.2);
  end;
end;

procedure TForm28.FormShow(Sender: TObject);
begin
  Form28.Canvas.MoveTo(20,50);
  Form28.Canvas.LineTo(Form28.Width-20,50);
  Form28.Canvas.LineTo(Form28.Width-20,Form28.Height-20);
  Form28.Canvas.LineTo(20,Form28.Height-20);
  Form28.Canvas.LineTo(20,50);
  Application.ProcessMessages;
end;

procedure TForm28.Button3Click(Sender: TObject);
begin
  Status:='Fill';
end;

end.
