unit Unit10;            {Form10 - Slice}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ActnMan, ActnCtrls, ActnMenus, TeEngine, Series,
  ExtCtrls, TeeProcs, Chart, ActnList, XPStyleActnCtrls, Jpeg,
  Unit1,Unit2,Unit4,Unit6,Unit12,Unit20,graph_0d,
  StdCtrls, DDSpinEdit, StdStyleActnCtrls,DB,ComCtrls;

type
  TForm10 = class(TForm)
    Chart1: TChart;
    Series1: TLineSeries;
    Image1: TImage;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series4: TLineSeries;
    Series5: TLineSeries;
    Series6: TLineSeries;
    Series7: TLineSeries;
    CheckBox6: TCheckBox;
    Button1: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    GroupBox1: TGroupBox;
    DDSpinEdit42: TDDSpinEdit;
    StaticText24: TStaticText;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    GroupBox3: TGroupBox;
    DDSpinEdit1: TDDSpinEdit;
    Button2: TButton;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    TrackBar3: TTrackBar;
    TrackBar4: TTrackBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Image2: TImage;
    DDSpinEdit2: TDDSpinEdit;
    StaticText7: TStaticText;
    StaticText1: TStaticText;
    DDSpinEdit3: TDDSpinEdit;
    Button3: TButton;
    SaveDialog1: TSaveDialog;
    Button4: TButton;
    CheckBox5: TCheckBox;
    TabSheet5: TTabSheet;
    Memo1: TMemo;
    GroupBox4: TGroupBox;
    StaticText3: TStaticText;
    DDSpinEdit5: TDDSpinEdit;
    CheckBox7: TCheckBox;
    StaticText2: TStaticText;
    DDSpinEdit4: TDDSpinEdit;
    DDSpinEdit6: TDDSpinEdit;
    DDSpinEdit7: TDDSpinEdit;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    CheckBox8: TCheckBox;
    procedure DDSpinEdit42Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Series1DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series2DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series3DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series4DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series5DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series6DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series7DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit1Change(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar1Enter(Sender: TObject);
    procedure TrackBar2Enter(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure TrackBar3Enter(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);
    procedure TrackBar4Change(Sender: TObject);
    procedure TrackBar4Enter(Sender: TObject);
    procedure DDSpinEdit2Change(Sender: TObject);
    procedure DDSpinEdit3Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure SaveDialog1CanClose(Sender: TObject; var CanClose: Boolean);
    procedure Button4Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DDSpinEdit4Change(Sender: TObject);
    procedure DDSpinEdit5Change(Sender: TObject);
    procedure DDSpinEdit1DblClick(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure DDSpinEdit6Change(Sender: TObject);
    procedure DDSpinEdit7Change(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10        :TForm10;
  NTrialToDraw  :integer;
  Iind_ReprNrn,ShiftOfVrest  :double;

implementation
uses Init,t_dtO,MathMyO,Correspond,RepresentativesO;

var
     SeriesA        :TLineSeries;
     col            :TColor;
     iTrackPos_old  :integer;

{$R *.dfm}

{ ************** Frames initiation *************** }

procedure TForm10.FormShow(Sender: TObject);
begin
  i3:=EorI(i3);
  Form10.RadioGroup1.ItemIndex:=i3-1;
  NTrialToDraw:=1;
  KeyPreview:=true;
  Form10.Caption:='Artificial slice';
  Form6.Caption:='Voltage traces in representative neurons:';
  { For Example: }
{  Form1.Visible:=false;
  Form1.Left:=2000+Form1.Left;
  Form2.Visible:=false;
  Form4.Visible:=false;
  Form12.Visible:=false;
  Form10.Button4.Caption:='Show detailed information';}
end;

procedure TForm10.Button4Click(Sender: TObject);
begin
  if Form10.Button4.Caption ='Show detailed information' then begin
     if Form1.Left>2000 then Form1.Left:=Form1.Left-2000;
     Form1.Visible:=true;
     //Form2.Visible:=true;
     Form4.Visible:=true;
     Form12.Visible:=true;
     Form10.Button4.Caption:='Hide detailed information';
  end else begin
     Form1.Visible:=false;
     //Form2.Visible:=false;
     Form4.Visible:=false;
     Form12.Visible:=false;
     Form20.Visible:=false;
     Form10.Button4.Caption:='Show detailed information';
  end;
end;

{ ************** Parameters *************** }

procedure TForm10.DDSpinEdit42Change(Sender: TObject);
begin
  if Form10.Visible then R.NP.Vrest:=Form10.DDSpinEdit42.Value/1e3;
end;

procedure TForm10.RadioGroup1Click(Sender: TObject);
begin
  Form10.RadioGroup2.ItemIndex:=Form10.RadioGroup1.ItemIndex;
  if Form10.Visible then i3:=Form10.RadioGroup1.ItemIndex+1;
  CorrespondParametersToTheForm;
end;

procedure TForm10.RadioGroup2Click(Sender: TObject);
begin
  Form10.RadioGroup1.ItemIndex:=Form10.RadioGroup2.ItemIndex;
  if Form10.Visible then i3:=Form10.RadioGroup2.ItemIndex+1;
  CorrespondParametersToTheForm;
end;

procedure TForm10.DDSpinEdit1Change(Sender: TObject);
begin
  if Form10.Visible then Iext:=Form10.DDSpinEdit1.Value;
  Form4.DDSpinEdit1.Value:=Iext;
end;

procedure TForm10.DDSpinEdit2Change(Sender: TObject);
begin
  if Form10.Visible then t_end:=Form10.DDSpinEdit2.Value/1000;
  Form4.DDSpinEdit7.Value:=Form10.DDSpinEdit2.Value;
  nt_end:={imin(}trunc(t_end/dt){, mMaxExp)};
end;

procedure TForm10.DDSpinEdit3Change(Sender: TObject);
begin
  if Form10.Visible then tSt:=Form10.DDSpinEdit3.Value/1000;
end;

{ ************** Figure ******************* }

procedure TForm10.Button1Click(Sender: TObject);
var memYesToClean :integer;
begin
  Form10.Series1.Active:=true;
  Form10.Series2.Active:=true;
  Form10.Series3.Active:=true;
  Form10.Series4.Active:=true;
  Form10.Series5.Active:=true;
  Form10.Series6.Active:=true;
  Form10.Series7.Active:=true;
  Form10.Series1.Clear;
  Form10.Series2.Clear;
  Form10.Series3.Clear;
  Form10.Series4.Clear;
  Form10.Series5.Clear;
  Form10.Series6.Clear;
  Form10.Series7.Clear;
  memYesToClean:=YesToClean;   YesToClean:=1;
  Initial_Picture;
  YesToClean:=memYesToClean;
end;

procedure TForm10.Series1DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form10.Series1.Active:=false;
end;

procedure TForm10.Series2DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form10.Series2.Active:=false;
end;

procedure TForm10.Series3DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form10.Series3.Active:=false;
end;

procedure TForm10.Series4DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form10.Series4.Active:=false;
end;

procedure TForm10.Series5DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form10.Series5.Active:=false;
end;

procedure TForm10.Series6DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form10.Series6.Active:=false;
end;

procedure TForm10.Series7DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form10.Series7.Active:=false;
end;

{ ******************* Clamp ********************************}

procedure TForm10.TabSheet1Show(Sender: TObject);
{ Current-Clamp }
begin
  R.NP.If_I_V_or_g:=2;
  Form10.Chart1.LeftAxis.Title.Caption:='mV';
  Form10.TabSheet1.Highlighted:=true;
  Form10.TabSheet2.Highlighted:=false;
  PrepareFormForRepresentativeNeuronsO;
{  Form1.CheckBox1.Checked:=false;
  Form10.CheckBox5.Checked:=false;
  Form6.Visible:=false;}
end;

procedure TForm10.TabSheet2Show(Sender: TObject);
{ Voltage-Clamp }
begin
  R.NP.If_I_V_or_g:=1;
  Form10.Chart1.LeftAxis.Title.Caption:='pA';
  Form10.TabSheet1.Highlighted:=false;
  Form10.TabSheet2.Highlighted:=true;
  PrepareFormForRepresentativeNeuronsO;
end;

{******************** Stimulation *************************}

procedure TForm10.Button2Click(Sender: TObject);
{ Stimulate }
var i :integer;
begin
  Form10.Button2.Enabled:=false;
  n_show:=2;
  { Define curves for Current- or Voltage-clamp. }
  case R.NP.If_I_V_or_g of
  1: Form10.Series1.DataSource:=Form1.Series11;
  2: case i3 of
     1: Form10.Series1.DataSource:=Form6.Series1;
     2: Form10.Series1.DataSource:=Form6.Series2;
     end;
  end;
  Form6.Series1.Active:=true;
  { Hide superfluous things }
//  Form1.Visible:=false;
//  Form2.Visible:=false;
  { Keep old curves }
  if Form10.CheckBox6.Checked then begin
     { Define new active series }
     NTrialToDraw:=NTrialToDraw+1;
     if NTrialToDraw>7 then NTrialToDraw:=NTrialToDraw-7;
     case NTrialToDraw of
     2: SeriesA:=Form10.Series2;
     3: SeriesA:=Form10.Series3;
     4: SeriesA:=Form10.Series4;
     5: SeriesA:=Form10.Series5;
     6: SeriesA:=Form10.Series6;
     7: SeriesA:=Form10.Series7;
     end;
     SeriesA.Clear;
     { Exchange data and color }
     for i:=0 to Form10.Series1.XValues.Count-1 do begin
         SeriesA.AddXY(Form10.Series1.XValues.Value[i],
                       Form10.Series1.YValues.Value[i]);
     end;
     col:=SeriesA.SeriesColor;
     SeriesA.SeriesColor:=Form10.Series1.SeriesColor;
     Form10.Series1.SeriesColor:=col;
     Application.ProcessMessages;
  end;
  {**************************************}
  StopKey:='h';
  DecideIfThreadAndExecute;
  {**************************************}
  Form10.Button2.Enabled:=true;
end;

{****************** Pharmacology *************************************}

procedure TForm10.CheckBox1Click(Sender: TObject);
{ Block AMPA }
begin
  if Form10.Visible then IfBlockAMPA:=IfTrue(Form10.CheckBox1.Checked);
  Form4.CheckBox1.Checked:=(IfBlockAMPA=1);
  Form10.TrackBar1.Position:=trunc(IfBlockAMPA*10);
end;

procedure TForm10.CheckBox2Click(Sender: TObject);
{ Block NMDA }
begin
  if Form10.Visible then IfBlockNMDA:=IfTrue(Form10.CheckBox2.Checked);
  Form4.CheckBox2.Checked:=(IfBlockNMDA=1);
  Form10.TrackBar2.Position:=trunc(IfBlockNMDA*10);
end;

procedure TForm10.CheckBox3Click(Sender: TObject);
{ Block GABA }
begin
  if Form10.Visible then IfBlockGABA:=IfTrue(Form10.CheckBox3.Checked);
  Form4.CheckBox3.Checked:=(IfBlockGABA=1);
  Form10.TrackBar3.Position:=trunc(IfBlockGABA*10);
end;

procedure TForm10.CheckBox4Click(Sender: TObject);
{ Block GABB }
begin
  if Form10.Visible then IfBlockGABB:=IfTrue(Form10.CheckBox4.Checked);
  Form4.CheckBox4.Checked:=(IfBlockGABB=1);
  Form10.TrackBar4.Position:=trunc(IfBlockGABB*10);
end;

procedure TForm10.TrackBar1Enter(Sender: TObject);
begin
  iTrackPos_old:=Form10.TrackBar1.Position;
end;

procedure TForm10.TrackBar2Enter(Sender: TObject);
begin
  iTrackPos_old:=Form10.TrackBar2.Position;
end;

procedure TForm10.TrackBar3Enter(Sender: TObject);
begin
  iTrackPos_old:=Form10.TrackBar3.Position;
end;

procedure TForm10.TrackBar4Enter(Sender: TObject);
begin
  iTrackPos_old:=Form10.TrackBar4.Position;
end;

procedure TForm10.TrackBar1Change(Sender: TObject);
var c,max :double;
    iP :integer;
begin
{  IfBlockAMPA:=Form10.TrackBar1.Position/100;}
  iP:= Form10.TrackBar1.Position;
  max:=Form10.TrackBar1.Max;
  if (iP<>iTrackPos_old)and(iP<>max) then begin
     IfBlockAMPA:=iP/10;
{     c:=(1-iP/max)/(1-iTrackPos_old/max);
     gAMP3[1]:=gAMP3[1]*c;  gAMP3[2]:=gAMP3[2]*c;  gAMP3[3]:=gAMP3[3]*c;
     gAMPA[1]:=gAMPA[1]*c;  gAMPA[2]:=gAMPA[2]*c;  gAMPA[3]:=gAMPA[3]*c;}
     CorrespondParametersToTheForm;
     iTrackPos_old:=iP;
  end;
end;

procedure TForm10.TrackBar2Change(Sender: TObject);
var c,max :double;
    iP :integer;
begin
{  IfBlockNMDA:=Form10.TrackBar2.Position/100;}
  iP:= Form10.TrackBar2.Position;
  max:=Form10.TrackBar2.Max;
  if (iP<>iTrackPos_old)and(iP<>max) then begin
     IfBlockNMDA:=iP/10;
{     c:=(1-iP/max)/(1-iTrackPos_old/max);
     gNMD3[1]:=gNMD3[1]*c;  gNMD3[2]:=gNMD3[2]*c;  gNMD3[3]:=gNMD3[3]*c;
     gNMDA[1]:=gNMDA[1]*c;  gNMDA[2]:=gNMDA[2]*c;  gNMDA[3]:=gNMDA[3]*c;}
     CorrespondParametersToTheForm;
     iTrackPos_old:=iP;
  end;
end;

procedure TForm10.TrackBar3Change(Sender: TObject);
var c,max :double;
    iP :integer;
begin
{  IfBlockGABA:=Form10.TrackBar3.Position/100;}
  iP:= Form10.TrackBar3.Position;
  max:=Form10.TrackBar3.Max;
  if (iP<>iTrackPos_old)and(iP<>max) then begin
     IfBlockGABA:=iP/10;
{     c:=(1-iP/max)/(1-iTrackPos_old/max);
     gGAB3[1]:=gGAB3[1]*c;  gGAB3[2]:=gGAB3[2]*c;  gGAB3[3]:=gGAB3[3]*c;
     gGABA[1]:=gGABA[1]*c;  gGABA[2]:=gGABA[2]*c;  gGABA[3]:=gGABA[3]*c;}
     CorrespondParametersToTheForm;
     iTrackPos_old:=iP;
  end;
end;

procedure TForm10.TrackBar4Change(Sender: TObject);
var c,max :double;
    iP :integer;
begin
{  IfBlockGABB:=Form10.TrackBar4.Position/100;}
  iP:= Form10.TrackBar4.Position;
  max:=Form10.TrackBar4.Max;
  if (iP<>iTrackPos_old)and(iP<>max) then begin
     IfBlockGABB:=iP/10;
{     c:=(1-iP/max)/(1-iTrackPos_old/max);
     gGABB[1]:=gGABB[1]*c;  gGABB[2]:=gGABB[2]*c;  gGABB[3]:=gGABB[3]*c;}
     CorrespondParametersToTheForm;
     iTrackPos_old:=iP;
  end;
end;

{ ************ Save in file ************** }

procedure TForm10.Button3Click(Sender: TObject);
begin
  Form10.SaveDialog1.Execute;
end;

procedure TForm10.SaveDialog1CanClose(Sender: TObject;
  var CanClose: Boolean);
var  i :integer;
begin
  AssignFile(fff, SaveDialog1.FileName);  Rewrite(fff);
  for i:=0 to Form10.Series1.XValues.Count-1 do begin
      writeln(fff,Form10.Series1.XValues.Value[i]:13,' ',
                  Form10.Series1.YValues.Value[i]:13);
  end;
  CloseFile(fff);
end;

procedure TForm10.CheckBox5Click(Sender: TObject);
begin
  if Form10.CheckBox5.Checked then PrepareFormForRepresentativeNeuronsO
                              else Form1.CheckBox1.Checked:=false;
  Form6.Visible:=Form10.CheckBox5.Checked;
end;

procedure TForm10.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Form1.Visible=false then Form1.Close else Form10.Visible:=false;
end;

procedure TForm10.DDSpinEdit4Change(Sender: TObject);
begin
  Iind_ReprNrn:=Form10.DDSpinEdit4.Value;
end;

procedure TForm10.DDSpinEdit5Change(Sender: TObject);
begin
  R.NP.Vrest:=R.NP.Vrest-ShiftOfVrest+Form10.DDSpinEdit5.Value/1000;
  ShiftOfVrest:=Form10.DDSpinEdit5.Value/1000;
  Form4.DDSpinEdit42.Value:=R.NP.Vrest*1000;
end;

procedure TForm10.DDSpinEdit1DblClick(Sender: TObject);
begin
  Form10.DDSpinEdit1.Value:=0;
end;

procedure TForm10.FormDblClick(Sender: TObject);
begin
  Form10.Visible:=false;
end;

procedure TForm10.CheckBox7Click(Sender: TObject);
begin
  { IfNoise }
  Form4.CheckBox20.Checked:=Form10.CheckBox7.Checked;
end;

procedure TForm10.DDSpinEdit6Change(Sender: TObject);
begin
  t0_ind:=Form10.DDSpinEdit6.Value;
  Form4.DDSpinEdit65.Value:=t0_ind;
end;

procedure TForm10.DDSpinEdit7Change(Sender: TObject);
begin
  t_ind:=Form10.DDSpinEdit7.Value;
  Form4.DDSpinEdit48.Value:=t_ind;
end;

procedure TForm10.CheckBox8Click(Sender: TObject);
begin
  if Form10.CheckBox8.Checked then Form4.ComboBox1.ItemIndex:=3
                              else Form4.ComboBox1.ItemIndex:=0;
//  nu_ind:=2/t_ind;
end;

end.
