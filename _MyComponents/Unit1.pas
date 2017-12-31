unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, gsynC;

type
  TForm1 = class(TForm)
    gsynC1: TgsynC;
    procedure FormDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormDblClick(Sender: TObject);
begin
  gsynC1.Renew;
end;

end.
