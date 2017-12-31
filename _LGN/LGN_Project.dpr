program LGN_Project;

uses
  Forms,
  LGN_Unit1 in 'LGN_Unit1.pas' {Form1},
  LGN_main in 'LGN_main.pas',
  LGN_Init in 'LGN_Init.pas',
  Frame_2DO in 'Frame_2DO.pas' {Frame15: TFrame},
  MathMyO in 'MathMyO.pas',
  LGN_Unit15 in 'LGN_Unit15.pas' {Form15},
  LGN_Lattice in 'LGN_Lattice.pas',
  LGN_SaveLoadParameters in 'LGN_SaveLoadParameters.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TLGN_Form1, LGN_Form1);
  Application.CreateForm(TLGN_Form15, LGN_Form15);
  Application.Run;
end.
