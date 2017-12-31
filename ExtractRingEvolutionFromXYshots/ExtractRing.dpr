program ExtractRing;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Frame_2DO in 'Frame_2DO.pas' {Frame15: TFrame},
  MathMyO in 'MathMyO.pas',
  Unit15 in 'Unit15.pas' {Form15},
  Lattice in 'Lattice.pas',
  Extractor in 'Extractor.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm15, Form15);
  Application.Run;
end.
