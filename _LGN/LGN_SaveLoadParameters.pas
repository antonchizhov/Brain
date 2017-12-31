unit LGN_SaveLoadParameters;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  StdCtrls, DDSpinEdit, ExtCtrls, TeEngine, Series,
  TeeProcs, Chart, ComCtrls;

procedure SaveParameters;
procedure LGN_LoadParameters;

implementation
uses LGN_Init,LGN_Unit1,LGN_Lattice,MathMyO,LGN_Unit30,LGN_main;

procedure SaveParameters;
var
    bbb :text;
begin
  assign(bbb,'SavedParameters.txt'); rewrite(bbb);
  writeln(bbb,LGN_Form1.DDSpinEdit1.Value :12:3);
  writeln(bbb,LGN_Form1.DDSpinEdit2.Value :12:3);
  writeln(bbb,LGN_Form1.DDSpinEdit3.Value :12:3);
  writeln(bbb,LGN_Form1.DDSpinEdit4.Value :12:3);
  writeln(bbb,LGN_Form1.DDSpinEdit5.Value :12:3);
  writeln(bbb,LGN_Form1.DDSpinEdit6.Value :12:3);
  writeln(bbb,LGN_Form1.DDSpinEdit7.Value :12:3);
  writeln(bbb,LGN_Form1.DDSpinEdit8.Value :12:3);
  writeln(bbb,LGN_Form1.DDSpinEdit9.Value :12:3);
  writeln(bbb,LGN_Form1.DDSpinEdit10.Value :12:3);
  writeln(bbb,LGN_Form1.DDSpinEdit11.Value :12:3);
  writeln(bbb,LGN_Form1.DDSpinEdit12.Value :12:3);
  writeln(bbb,LGN_Form1.DDSpinEdit13.Value :12:3);
  writeln(bbb,LGN_Form1.DDSpinEdit14.Value :12:3);
  writeln(bbb,LGN_Form1.DDSpinEdit15.Value :12:3);
  writeln(bbb,LGN_Form1.DDSpinEdit16.Value :12:3);
  writeln(bbb,LGN_Form1.DDSpinEdit17.Value :12:3);
  writeln(bbb,LGN_Form1.DDSpinEdit18.Value :12:3);
  writeln(bbb,LGN_Form1.DDSpinEdit19.Value :12:3);
  writeln(bbb,LGN_Form1.DDSpinEdit20.Value :12:3);
  writeln(bbb,LGN_Form1.DDSpinEdit21.Value :12:3);
  writeln(bbb,LGN_Form1.DDSpinEdit22.Value :12:3);
  writeln(bbb,LGN_Form1.DDSpinEdit23.Value :12:3);
  writeln(bbb,LGN_Form1.DDSpinEdit24.Value :12:3);
  writeln(bbb,LGN_Form1.DDSpinEdit25.Value :12:3);
  writeln(bbb,LGN_Form1.DDSpinEdit26.Value :12:3);
  writeln(bbb,LGN_Form1.DDSpinEdit27.Value :12:3);
  writeln(bbb,LGN_Form1.DDSpinEdit28.Value :12:3);
  writeln(bbb,LGN_Form1.DDSpinEdit29.Value :12:3);
  writeln(bbb,LGN_Form1.RadioGroup1.ItemIndex:3);
  writeln(bbb,LGN_Form1.ComboBox1.ItemIndex:3);
  writeln(bbb,LGN_Form1.ComboBox2.ItemIndex:3);
  writeln(bbb,LGN_Form1.DDSpinEdit30.Value :12:3);
  writeln(bbb,LGN_Form1.DDSpinEdit31.Value :12:3);
  writeln(bbb,IfTrue(LGN_Form1.CheckBox1.Checked):3);
  writeln(bbb,IfTrue(LGN_Form1.CheckBox2.Checked):3);
  writeln(bbb,LGN_Form30.DDSpinEdit1.Value :12:3);
  writeln(bbb,LGN_Form30.DDSpinEdit2.Value :12:3);
  writeln(bbb,LGN_Form30.DDSpinEdit3.Value :12:3);
  writeln(bbb,LGN_Form30.DDSpinEdit4.Value :12:3);
  writeln(bbb,LGN_Form30.DDSpinEdit5.Value :12:3);
  writeln(bbb,LGN_Form30.DDSpinEdit6.Value :12:3);
  writeln(bbb,LGN_Form30.DDSpinEdit7.Value :12:3);
  writeln(bbb,LGN_Form30.DDSpinEdit8.Value :12:3);
  writeln(bbb,LGN_Form30.DDSpinEdit9.Value :12:3);
  writeln(bbb,LGN_Form30.DDSpinEdit10.Value :12:3);
  writeln(bbb,LGN_Form30.DDSpinEdit11.Value :12:3);
  writeln(bbb,LGN_Form30.DDSpinEdit12.Value :12:3);
  writeln(bbb,LGN_Form30.DDSpinEdit13.Value :12:3);
  writeln(bbb,LGN_Form30.DDSpinEdit14.Value :12:3);
  writeln(bbb,LGN_Form30.DDSpinEdit15.Value :12:3);
  writeln(bbb,LGN_Form30.DDSpinEdit16.Value :12:3);
  writeln(bbb,LGN_Form30.DDSpinEdit17.Value :12:3);
  writeln(bbb,LGN_Form30.DDSpinEdit18.Value :12:3);
  writeln(bbb,LGN_Form30.DDSpinEdit19.Value :12:3);
  writeln(bbb,LGN_Form30.DDSpinEdit20.Value :12:3);
  writeln(bbb,LGN_Form30.DDSpinEdit21.Value :12:3);
  writeln(bbb,LGN_Form30.PageControl1.TabIndex:3);
  writeln(bbb,IfTrue(LGN_Form1.CheckBox3.Checked):3);
  writeln(bbb,LGN_Form1.DDSpinEdit32.Value :12:3);
  close(bbb);
end;

procedure LGN_LoadParameters;
var
    bbb :text;
    y :double;
    i :integer;
begin
  if not(FileExists('SavedParameters.txt')) then EXIT;
  assign(bbb,'SavedParameters.txt'); reset(bbb);
  readln(bbb,y);  LGN_Form1.DDSpinEdit1.Value:=y;
  readln(bbb,y);  LGN_Form1.DDSpinEdit2.Value:=y;
  readln(bbb,y);  LGN_Form1.DDSpinEdit3.Value:=y;
  readln(bbb,y);  LGN_Form1.DDSpinEdit4.Value:=y;
  readln(bbb,y);  LGN_Form1.DDSpinEdit5.Value:=y;
  readln(bbb,y);  LGN_Form1.DDSpinEdit6.Value:=y;
  readln(bbb,y);  LGN_Form1.DDSpinEdit7.Value:=y;
  readln(bbb,y);  LGN_Form1.DDSpinEdit8.Value:=y;
  readln(bbb,y);  LGN_Form1.DDSpinEdit9.Value:=y;
  readln(bbb,y);  LGN_Form1.DDSpinEdit10.Value:=y;
  readln(bbb,y);  LGN_Form1.DDSpinEdit11.Value:=y;
  readln(bbb,y);  LGN_Form1.DDSpinEdit12.Value:=y;
  readln(bbb,y);  LGN_Form1.DDSpinEdit13.Value:=y;
  readln(bbb,y);  LGN_Form1.DDSpinEdit14.Value:=y;
  readln(bbb,y);  LGN_Form1.DDSpinEdit15.Value:=y;
  readln(bbb,y);  LGN_Form1.DDSpinEdit16.Value:=y;
  readln(bbb,y);  LGN_Form1.DDSpinEdit17.Value:=y;
  readln(bbb,y);  LGN_Form1.DDSpinEdit18.Value:=y;
  readln(bbb,y);  LGN_Form1.DDSpinEdit19.Value:=y;
  readln(bbb,y);  LGN_Form1.DDSpinEdit20.Value:=y;
  readln(bbb,y);  LGN_Form1.DDSpinEdit21.Value:=y;
  readln(bbb,y);  LGN_Form1.DDSpinEdit22.Value:=y;
  readln(bbb,y);  LGN_Form1.DDSpinEdit23.Value:=y;
  readln(bbb,y);  LGN_Form1.DDSpinEdit24.Value:=y;
  readln(bbb,y);  LGN_Form1.DDSpinEdit25.Value:=y;
  readln(bbb,y);  LGN_Form1.DDSpinEdit26.Value:=y;
  readln(bbb,y);  LGN_Form1.DDSpinEdit27.Value:=y;
  readln(bbb,y);  LGN_Form1.DDSpinEdit28.Value:=y;
  readln(bbb,y);  LGN_Form1.DDSpinEdit29.Value:=y;
  readln(bbb,i);  LGN_Form1.RadioGroup1.ItemIndex:=i;
  readln(bbb,i);  LGN_Form1.ComboBox1.ItemIndex:=i;
  readln(bbb,i);  LGN_Form1.ComboBox2.ItemIndex:=i;
  if not(eof(bbb)) then begin readln(bbb,y);  LGN_Form1.DDSpinEdit30.Value:=y; end;
  if not(eof(bbb)) then begin readln(bbb,y);  LGN_Form1.DDSpinEdit31.Value:=y; end;
  if not(eof(bbb)) then begin readln(bbb,i);  LGN_Form1.CheckBox1.Checked:=(i=1); end;
  if not(eof(bbb)) then begin readln(bbb,i);  LGN_Form1.CheckBox2.Checked:=(i=1); end;
  if not(eof(bbb)) then begin readln(bbb,y);  LGN_Form30.DDSpinEdit1.Value:=y; end;
  if not(eof(bbb)) then begin readln(bbb,y);  LGN_Form30.DDSpinEdit2.Value:=y; end;
  if not(eof(bbb)) then begin readln(bbb,y);  LGN_Form30.DDSpinEdit3.Value:=y; end;
  if not(eof(bbb)) then begin readln(bbb,y);  LGN_Form30.DDSpinEdit4.Value:=y; end;
  if not(eof(bbb)) then begin readln(bbb,y);  LGN_Form30.DDSpinEdit5.Value:=y; end;
  if not(eof(bbb)) then begin readln(bbb,y);  LGN_Form30.DDSpinEdit6.Value:=y; end;
  if not(eof(bbb)) then begin readln(bbb,y);  LGN_Form30.DDSpinEdit7.Value:=y; end;
  if not(eof(bbb)) then begin readln(bbb,y);  LGN_Form30.DDSpinEdit8.Value:=y; end;
  if not(eof(bbb)) then begin readln(bbb,y);  LGN_Form30.DDSpinEdit9.Value:=y; end;
  if not(eof(bbb)) then begin readln(bbb,y);  LGN_Form30.DDSpinEdit10.Value:=y; end;
  if not(eof(bbb)) then begin readln(bbb,y);  LGN_Form30.DDSpinEdit11.Value:=y; end;
  if not(eof(bbb)) then begin readln(bbb,y);  LGN_Form30.DDSpinEdit12.Value:=y; end;
  if not(eof(bbb)) then begin readln(bbb,y);  LGN_Form30.DDSpinEdit13.Value:=y; end;
  if not(eof(bbb)) then begin readln(bbb,y);  LGN_Form30.DDSpinEdit14.Value:=y; end;
  if not(eof(bbb)) then begin readln(bbb,y);  LGN_Form30.DDSpinEdit15.Value:=y; end;
  if not(eof(bbb)) then begin readln(bbb,y);  LGN_Form30.DDSpinEdit16.Value:=y; end;
  if not(eof(bbb)) then begin readln(bbb,y);  LGN_Form30.DDSpinEdit17.Value:=y; end;
  if not(eof(bbb)) then begin readln(bbb,y);  LGN_Form30.DDSpinEdit18.Value:=y; end;
  if not(eof(bbb)) then begin readln(bbb,y);  LGN_Form30.DDSpinEdit19.Value:=y; end;
  if not(eof(bbb)) then begin readln(bbb,y);  LGN_Form30.DDSpinEdit20.Value:=y; end;
  if not(eof(bbb)) then begin readln(bbb,y);  LGN_Form30.DDSpinEdit21.Value:=y; end;
  if not(eof(bbb)) then begin readln(bbb,i);  LGN_Form30.PageControl1.TabIndex:=i; end;
  if not(eof(bbb)) then begin readln(bbb,i);  LGN_Form1.CheckBox3.Checked:=(i=1); end;
  if not(eof(bbb)) then begin readln(bbb,y);  LGN_Form1.DDSpinEdit32.Value:=y; end;
  close(bbb);
  {*************}
  LGN_Parameters;
  {*************}
end;

end.
