unit Unit5;  {Form5 - Conductances}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TeEngine, Series, ExtCtrls, TeeProcs, Chart,
  ColumnO,MathMyO;

type
  TForm5 = class(TForm)
    Chart1: TChart;
    Series1: TFastLineSeries;
    Series2: TFastLineSeries;
    Series3: TFastLineSeries;
    Series4: TFastLineSeries;
    Chart2: TChart;
    Series5: TFastLineSeries;
    Series6: TFastLineSeries;
    Chart3: TChart;
    Series7: TFastLineSeries;
    Series8: TFastLineSeries;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Series9: TFastLineSeries;
    CheckBox3: TCheckBox;
    Chart4: TChart;
    Series10: TFastLineSeries;
    Button2: TButton;
    Button1: TButton;
    Button3: TButton;
    Button4: TButton;
    Series11: TLineSeries;
    Series12: TLineSeries;
    Series13: TLineSeries;
    Series14: TLineSeries;
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Chart1ClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure Chart3ClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure Chart2ClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure CheckBox3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  f51: TextFile;
  f52: TextFile;

procedure Draw_Conductances(ACol :TColumn);
procedure Write_Conductances(ACol :TColumn);

implementation
uses Init,t_dtO,Unit1,ConnectionsO;

{$R *.DFM}

procedure TForm5.CheckBox1Click(Sender: TObject);
begin
  Form5.Chart3.Visible:=Form5.CheckBox1.Checked;
end;

procedure TForm5.CheckBox3Click(Sender: TObject);
begin
  Form5.Chart4.Visible:=Form5.CheckBox3.Checked;
end;

procedure TForm5.CheckBox2Click(Sender: TObject);
begin
  if Form5.CheckBox2.Checked then begin
     AssignFile(f51,'SynCond.dat');
     if  FileExists('SynCond.dat')   then append(f51) else rewrite(f51);
     CloseFile(f51);
     AssignFile(f52,'InnerCond.dat');
     if  FileExists('InnerCond.dat') then append(f52) else rewrite(f52);
     CloseFile(f52);
  end;
end;

procedure TForm5.Chart1ClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Series.Active:=not(Series.Active);
end;

procedure TForm5.Chart3ClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Series.Active:=not(Series.Active);
end;

procedure TForm5.Chart2ClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Series.Active:=not(Series.Active);
end;

procedure Draw_Conductances(ACol :TColumn);
var tl,S1_,S2_,Si3_,f1_,f2_ :double;
begin
  { Conductances }
  if Form1.CheckBox2.Checked then begin
     tl:=t*1000{ms};
     S1_ :=ACol.Pop[1].PP.NP.Square;
     f1_:=fNMDA(R.NP.Vrest, {ACol.Pop[1].PP.NP.Mg}0);
     Form5.Series2.AddXY(tl,(ACol.Syn[1].g + ACol.Syn[3].g)*S1_*1e6);//mAMPA[1]+mAMP3[1]);
     Form5.Series3.AddXY(tl,(ACol.Syn[9].g + ACol.Syn[11].g)*f1_*S1_*1e6);//mNMDA[1]+mNMD3[1]);
     Form5.Series13.AddXY(tl,ACol.Syn[3].xD); // xD_glu   for 'AMPA on P'
     if NPop>1 then begin
      S2_ :=ACol.Pop[2].PP.NP.Square;
      Si3_:=ACol.Pop[i3].PP.NP.Square;
      f2_:=fNMDA(R.NP.Vrest, {ACol.Pop[2].PP.NP.Mg}0);
      Form5.Series1.AddXY(tl,ACol.Syn[29].g*S1_*1e6);// mGABB[1]);
      Form5.Series4.AddXY(tl,(ACol.Syn[5].g + ACol.Syn[7].g)*S1_*1e6);//mGABA[1]+mGAB3[1]);
      Form5.Series5.AddXY(tl,(ACol.Syn[2].g + ACol.Syn[4].g)*S2_*1e6);//mAMPA[2]+mAMP3[2]);
      Form5.Series6.AddXY(tl,(ACol.Syn[6].g + ACol.Syn[8].g)*S2_*1e6);//mGABA[2]+mGAB3[2]);
      Form5.Series7.AddXY(tl,ACol.Pop[i3].Nrn[ACol.Pop[i3].PP.Nts].NV.mBst);//mBst[1]);
      Form5.Series8.AddXY(tl,ACol.Pop[i3].Nrn[ACol.Pop[i3].PP.Nts].NV.wAHP);
      Form5.Series9.AddXY(tl,ACol.Pop[i3].Nrn[ACol.Pop[i3].PP.Nts].NV.nM  );
      Form5.Series10.AddXY(tl,ACol.Pop[i3].Nrn[ACol.Pop[i3].PP.Nts].NV.gActive*Si3_*1e6);
      Form5.Series11.AddXY(tl,ACol.Pop[i3].Nrn[ACol.Pop[i3].PP.Nts].NV.gNMDA*Si3_*1e6);
      Form5.Series12.AddXY(tl,(ACol.Syn[10].g + ACol.Syn[12].g)*f2_*S2_*1e6);//mNMDA[2]+mNMD3[2]);
      Form5.Series14.AddXY(tl,ACol.Syn[8].xD); // xD_GABA  for 'GABA on I'
     end;
  end;
end;

procedure Write_Conductances(ACol :TColumn);
var tl,S1_,S2_,Si3_,f1_,f2_ :double;
begin
  { Conductances }
  if (Form1.CheckBox2.Checked) and (Form5.CheckBox2.Checked) then begin
     tl:=t*1000{ms};
     S1_ :=ACol.Pop[1].PP.NP.Square;
     f1_:=fNMDA(R.NP.Vrest, {ACol.Pop[1].PP.NP.Mg}0);
     Si3_:=ACol.Pop[i3].PP.NP.Square;
     if NPop>1 then begin
        S2_ :=ACol.Pop[2].PP.NP.Square;
        f2_:=fNMDA(R.NP.Vrest, {ACol.Pop[2].PP.NP.Mg}0);
     end else begin S2_:=0; f2_:=0; end;
     { Writing }
        append(f51);  append(f52);
        {           v1                                                         }
        write  (f51,t*1e3:10:3,' ');
        {           v2                                                         }
        write  (f51,ACol.Syn[3].g*S1_*1e6{AMPA[1]}:10:5,' ');   {nS}
        {           v3                                                         }
        write  (f51,ACol.Syn[4].g*S2_*1e6{AMPA[2]}:10:5,' ');
        {           v4                                                         }
        write  (f51,ACol.Syn[11].g*S1_*f1_*1e6{NMDA[1]}:10:5,' ');
        {           v5                                                         }
        write  (f51,ACol.Syn[12].g*S2_*f2_*1e6{NMDA[2]}:10:5,' ');
        {           v6                                                         }
        write  (f51,ACol.Syn[7].g*S1_*1e6{GABA[1]}:10:5,' ');
        {           v7                                                         }
        write  (f51,ACol.Syn[8].g*S2_*1e6{GABA[2]}:10:5,' ');
        {           v8                                                         }
        write  (f51,ACol.Syn[29].g*S1_*1e6{GABB[1]}:10:5,' ');
        {           v9                                                         }
        write  (f51,ACol.Syn[30].g*S2_*1e6{GABB[2]}:10:5,' ');
        {           v10                                                        }
        write  (f51,ACol.Syn[3].xD{'AMPA on P'}:10:5,' ');
        {           v11                                                        }
        write  (f51,ACol.Syn[8].xD{'GABA on I'}:10:5,' ');
        {           v12                                                        }
        write  (f51,(ACol.Syn[3].g +ACol.Syn[1].g)    *S1_*1e6{'AMPA on P' and 'AMP3 on P'}:10:5,' ');
        {           v13                                                        }
        writeln(f51,(ACol.Syn[11].g+ACol.Syn[9].g)*f1_*S1_*1e6{'NMDA on P' and 'NMD3 on P'}:10:5,' ');
        {           v1                                                         }
        write  (f52,t*1e3:10:3,' ');
        {           v2                                                         }
        write  (f52,ACol.Pop[i3].Nrn[ACol.Pop[i3].PP.Nts].NV.mBst*Si3_*1e6:10:5,' ');
        {           v3                                                         }
        writeln(f52,ACol.Pop[i3].Nrn[ACol.Pop[i3].PP.Nts].NV.wAHP*Si3_*1e6:10:5,' ');
        close(f51);   close(f52);
  end;
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
  Form5.Chart1.CopyToClipboardBitmap;
end;

procedure TForm5.Button1Click(Sender: TObject);
begin
  Form5.Chart2.CopyToClipboardBitmap;
end;

procedure TForm5.Button3Click(Sender: TObject);
begin
  Form5.Chart3.CopyToClipboardBitmap;
end;

procedure TForm5.Button4Click(Sender: TObject);
begin
  Form5.Chart4.CopyToClipboardBitmap;
end;

end.
