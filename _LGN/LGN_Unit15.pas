unit LGN_Unit15;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Frame_2DO, StdCtrls, TeEngine, Series, ExtCtrls, TeeProcs, Chart;

type
  TLGN_Form15 = class(TForm)
    Frame15: TFrame15;
    Button5: TButton;
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LGN_Form15: TLGN_Form15;

implementation
uses LGN_Lattice;

{$R *.dfm}

procedure TLGN_Form15.Button5Click(Sender: TObject);
begin
  LGN_Form15.Frame15.Chart1.CopyToClipboardBitmap;
end;

end.
