unit Unit15;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Frame_2DO, StdCtrls, TeEngine, Series, ExtCtrls, TeeProcs, Chart;

type
  TForm15 = class(TForm)
    Frame15: TFrame15;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form15: TForm15;

implementation
uses Lattice;

{$R *.dfm}

procedure TForm15.Button1Click(Sender: TObject);
begin
  Form15.Frame15.Chart1.AxisVisible:=false;
  Form15.Frame15.Chart1.CopyToClipboardBitmap;
  Form15.Frame15.Chart1.AxisVisible:=true;
end;

end.
