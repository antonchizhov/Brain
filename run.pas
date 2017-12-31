unit run;

interface
{procedure InitiateCalculation_2D;}
procedure Simplex;
procedure AssignSmpl;
procedure Shower;

implementation
uses Init,slice,other,simplex,Unit1,graph_0d;

{procedure InitiateCalculation_2D;
begin
  iHist:=1;
  ParametersFromFile;
  ReadFrequencyFunction;
  InitHistory;
end;}

procedure Simplex;
begin
         Run_Simplex(m);
         OutputHistory;
end;


procedure AssignSmpl;
begin
  if      Form1.Smpl1 .Checked                 then Smpl:=1
  else if(Form1.Smpl2 .Checked)and(NSmpls>= 2) then Smpl:=2
  else if(Form1.Smpl3 .Checked)and(NSmpls>= 3) then Smpl:=3
  else if(Form1.Smpl4 .Checked)and(NSmpls>= 4) then Smpl:=4
  else if(Form1.Smpl5 .Checked)and(NSmpls>= 5) then Smpl:=5
  else if(Form1.Smpl6 .Checked)and(NSmpls>= 6) then Smpl:=6
  else if(Form1.Smpl7 .Checked)and(NSmpls>= 7) then Smpl:=7
  else if(Form1.Smpl8 .Checked)and(NSmpls>= 8) then Smpl:=8
  else if(Form1.Smpl9 .Checked)and(NSmpls>= 9) then Smpl:=9
  else if(Form1.Smpl10.Checked)and(NSmpls>=10) then Smpl:=10
  else if(Form1.Smpl11.Checked)and(NSmpls>=11) then Smpl:=11
  else if(Form1.Smpl12.Checked)and(NSmpls>=12) then Smpl:=12
  else if(Form1.Smpl13.Checked)and(NSmpls>=13) then Smpl:=13
  else if(Form1.Smpl14.Checked)and(NSmpls>=14) then Smpl:=14
  else if(Form1.Smpl15.Checked)and(NSmpls>=15) then Smpl:=15
  else if(Form1.Smpl16.Checked)and(NSmpls>=16) then Smpl:=16
  else if(Form1.Smpl17.Checked)and(NSmpls>=17) then Smpl:=17
  else if(Form1.Smpl18.Checked)and(NSmpls>=18) then Smpl:=18
  else if(Form1.Smpl19.Checked)and(NSmpls>=19) then Smpl:=19
  else if(Form1.Smpl0 .Checked)                then Smpl:=0
  else                                              Smpl:=1;

      case Smpl of
      0: ;
      1: ParametersFromFile;
      2: ParametersFromFile2;
      3: ParametersFromFile3;
      4: ParametersFromFile4;
      5: ParametersFromFile5;
      6: ParametersFromFile6;
      7: ParametersFromFile7;
      8: ParametersFromFile8;
      9: ParametersFromFile9;
      10: ParametersFromFile10;
      11: ParametersFromFile11;
      12: ParametersFromFile12;
      13: ParametersFromFile13;
      14: ParametersFromFile14;
      15: ParametersFromFile15;
      16: ParametersFromFile16;
      17: ParametersFromFile17;
      18: ParametersFromFile18;
      19: ParametersFromFile19;
      else
         ParametersFromFile;
      end;
end;

procedure Shower;
begin
         AssignSmpl;
         if Smpl>NSmpls then begin
            //Warning('Smpl>NSmpls!');
            //Pause;
         end;
         m:=1;
         Functional:=Calc_Functional(m,VFunc);
                  { Results }
         OutputSignals;
end;

end.
 