unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, ColorGrd,
  Menus, DDSpinEdit, TeEngine, Series, TeeProcs, Chart, Jpeg,
  Unit2,Unit6,SynapseC, MPlayer,typeNrnParsO,ReadWriteSettings
  {,VclTee.TeeGDIPlus};

type
  TForm1 = class(TForm)
    StopButton: TButton;
    ShowButton: TButton;
    WaveButton: TButton;
    ClearButton: TButton;
    PauseButton: TButton;
    PopupMenuForShow: TPopupMenu;
    Smpl1: TMenuItem;
    Smpl2: TMenuItem;
    Smpl3: TMenuItem;
    Smpl4: TMenuItem;
    Smpl5: TMenuItem;
    Smpl6: TMenuItem;
    Smpl7: TMenuItem;
    Smpl8: TMenuItem;
    Smpl9: TMenuItem;
    Smpl0: TMenuItem;
    Smpl10: TMenuItem;
    Smpl11: TMenuItem;
    Smpl12: TMenuItem;
    Smpl13: TMenuItem;
    Smpl14: TMenuItem;
    Smpl15: TMenuItem;
    Smpl16: TMenuItem;
    Smpl17: TMenuItem;
    Smpl18: TMenuItem;
    Smpl19: TMenuItem;
    GroupBox1: TGroupBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Parameters1: TMenuItem;
    HHtype2: TMenuItem;
    Passive1: TMenuItem;
    Calmar1: TMenuItem;
    Destexhe1: TMenuItem;
    Migliore1: TMenuItem;
    HHorder1: TMenuItem;
    N1point1: TMenuItem;
    N2points1: TMenuItem;
    Chow1: TMenuItem;
    Lyle1: TMenuItem;
    Label1: TLabel;
    TVDscheme1: TMenuItem;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    Thread1: TMenuItem;
    CheckBox6: TCheckBox;
    PopupMenu1: TPopupMenu;
    NotNoisySteadyRate1: TMenuItem;
    NoisySteadyRate1: TMenuItem;
    Button1: TButton;
    SteadyStateOfPopModel1: TMenuItem;
    HHtype11: TMenuItem;
    Chow2: TMenuItem;
    Calmar2: TMenuItem;
    Passive2: TMenuItem;
    HHorder11: TMenuItem;
    N2points2: TMenuItem;
    N1point2: TMenuItem;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    MediaPlayer1: TMediaPlayer;
    View1: TMenuItem;
    Phasespace1: TMenuItem;
    Inspector1: TMenuItem;
    Putwindowsattopleft1: TMenuItem;
    HotKey1: THotKey;
    Run1: TMenuItem;
    N0d1: TMenuItem;
    Simplex1: TMenuItem;
    N2D1: TMenuItem;
    V1Ring1: TMenuItem;
    HotKey2: THotKey;
    HotKey3: THotKey;
    RebuildAColumn1: TMenuItem;
    Pause1: TMenuItem;
    Stop1: TMenuItem;
    Clear1: TMenuItem;
    N1: TMenuItem;
    fIcurve1: TMenuItem;
    Rose1: TMenuItem;
    ArtificialSlice1: TMenuItem;
    ListBox1: TListBox;
    ListBox2: TListBox;
    ListBox3: TListBox;
    Thomsoncat1: TMenuItem;
    V1ringtest5: TMenuItem;
    V1ringtest55: TMenuItem;
    V1ringtest6: TMenuItem;
    GJ_Sotn: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    ArtificialSlice: TMenuItem;
    FullForm11: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    V1ringtest5PSP: TMenuItem;
    FittoPSCsPSPs: TMenuItem;
    Help1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Chart1: TChart;
    Series1: TLineSeries;
    Chart4: TChart;
    Series4: TLineSeries;
    Series5: TLineSeries;
    Chart5: TChart;
    Series6: TLineSeries;
    Series7: TLineSeries;
    Chart6: TChart;
    Series8: TLineSeries;
    Series9: TLineSeries;
    Series10: TLineSeries;
    Series11: TLineSeries;
    Chart2: TChart;
    Series2: TLineSeries;
    Chart7: TChart;
    Series12: TLineSeries;
    Series13: TLineSeries;
    Chart3: TChart;
    Series3: TLineSeries;
    TabSheet4: TTabSheet;
    Memo2: TMemo;
    CoeMemo: TMemo;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    LIF1: TMenuItem;
    PouillePSCPSP1: TMenuItem;
    Button2: TButton;
    N7: TMenuItem;
    Savesettingstofile1: TMenuItem;
    Loadsettingsfromfile1: TMenuItem;
    LFP1: TMenuItem;
    Gammarhythm40HzCA3id1: TMenuItem;
    Button3: TButton;
    Button5: TButton;
    Bazhenov1: TMenuItem;
    N2pMainenSejn1: TMenuItem;
    Bazhenov2: TMenuItem;
    N2pMainenSejn2: TMenuItem;
    N2pActiveDend1: TMenuItem;
    BOLDsignal1: TMenuItem;
    Button7: TButton;
    Button8: TButton;
    Button10: TButton;
    Button11: TButton;
    Button6: TButton;
    Showalltraces1: TMenuItem;
    Loadsettingsfrom1: TMenuItem;
    Pausejustbeforetend1: TMenuItem;
    OpenDialog1: TOpenDialog;
    PlotNullclines1: TMenuItem;
    LGN1: TMenuItem;
    Experimentalconductances1: TMenuItem;
    OpenDialog2: TOpenDialog;
    CheckBox7: TCheckBox;
    CalculateCVdependenceonIind1: TMenuItem;
    CheckBox8: TCheckBox;
    Experimentalnuus1: TMenuItem;
    procedure StopButtonClick(Sender: TObject);
    procedure ShowButtonClick(Sender: TObject);
    procedure WaveButtonClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure VariationButtonClick(Sender: TObject);
    procedure PauseButtonClick(Sender: TObject);
    procedure Smpl1Click(Sender: TObject);
    procedure Smpl2Click(Sender: TObject);
    procedure Smpl3Click(Sender: TObject);
    procedure Smpl4Click(Sender: TObject);
    procedure Smpl6Click(Sender: TObject);
    procedure Smpl5Click(Sender: TObject);
    procedure Smpl7Click(Sender: TObject);
    procedure Smpl8Click(Sender: TObject);
    procedure Smpl9Click(Sender: TObject);
    procedure Smpl0Click(Sender: TObject);
    procedure PopupMenuForShowPopup(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Smpl10Click(Sender: TObject);
    procedure Smpl11Click(Sender: TObject);
    procedure Smpl12Click(Sender: TObject);
    procedure Smpl13Click(Sender: TObject);
    procedure Smpl14Click(Sender: TObject);
    procedure Smpl15Click(Sender: TObject);
    procedure Smpl16Click(Sender: TObject);
    procedure Smpl17Click(Sender: TObject);
    procedure Smpl18Click(Sender: TObject);
    procedure Smpl19Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure N1point1Click(Sender: TObject);
    procedure N2points1Click(Sender: TObject);
    procedure Passive1Click(Sender: TObject);
    procedure Calmar1Click(Sender: TObject);
    procedure Destexhe1Click(Sender: TObject);
    procedure Migliore1Click(Sender: TObject);
    procedure Chow1Click(Sender: TObject);
    procedure Lyle1Click(Sender: TObject);
    procedure TVDscheme1Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure Chart4DblClick(Sender: TObject);
    procedure Chart1DblClick(Sender: TObject);
    procedure Chart6ClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure Chart7ClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure Chart3ClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure Chart2ClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure Chart5ClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure Chart4ClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure NotNoisySteadyRate1Click(Sender: TObject);
    procedure NoisySteadyRate1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SteadyStateOfPopModel1Click(Sender: TObject);
    procedure Series10DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series9DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure N1point2Click(Sender: TObject);
    procedure N2points2Click(Sender: TObject);
    procedure Passive2Click(Sender: TObject);
    procedure Calmar2Click(Sender: TObject);
    procedure Chow2Click(Sender: TObject);
    procedure Phasespace1Click(Sender: TObject);
    procedure Inspector1Click(Sender: TObject);
    procedure Putwindowsattopleft1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RebuildAColumn1Click(Sender: TObject);
    procedure fIcurve1Click(Sender: TObject);
    procedure Rose1Click(Sender: TObject);
    procedure ArtificialSlice1Click(Sender: TObject);
    procedure Thomsoncat1Click(Sender: TObject);
    procedure V1ringtest5Click(Sender: TObject);
    procedure V1ringtest55Click(Sender: TObject);
    procedure V1ringtest6Click(Sender: TObject);
    procedure GJ_SotnClick(Sender: TObject);
    procedure ArtificialSliceClick(Sender: TObject);
    procedure FullForm11Click(Sender: TObject);
    procedure Simplex1Click(Sender: TObject);
    procedure V1ringtest5PSPClick(Sender: TObject);
    procedure FittoPSCsPSPsClick(Sender: TObject);
    procedure Help1Click(Sender: TObject);
    procedure LIF1Click(Sender: TObject);
    procedure PouillePSCPSP1Click(Sender: TObject);
    procedure Series8DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series11DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series12DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series13DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Button2Click(Sender: TObject);
    procedure Savesettingstofile1Click(Sender: TObject);
    procedure Loadsettingsfromfile1Click(Sender: TObject);
    procedure LFP1Click(Sender: TObject);
    procedure Gammarhythm40HzCA3id1Click(Sender: TObject);
    procedure Series1DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Bazhenov1Click(Sender: TObject);
    procedure N2pMainenSejn1Click(Sender: TObject);
    procedure Bazhenov2Click(Sender: TObject);
    procedure N2pMainenSejn2Click(Sender: TObject);
    procedure N2pActiveDend1Click(Sender: TObject);
    procedure BOLDsignal1Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Showalltraces1Click(Sender: TObject);
    procedure Loadsettingsfrom1Click(Sender: TObject);
    procedure Pausejustbeforetend1Click(Sender: TObject);
    procedure PlotNullclines1Click(Sender: TObject);
    procedure LGN1Click(Sender: TObject);
    procedure Experimentalconductances1Click(Sender: TObject);
    procedure CalculateCVdependenceonIind1Click(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure Experimentalnuus1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

//
//  BrainThread
//
  BrainThread = class(TThread)
  private
    { Private declarations }
  protected
  public
    procedure Execute; override;
    procedure Treat_Key;
    procedure ForSynchronization;
    procedure MySynchronize;
  end;
//
// WaitingThread
//
  WaitingThread = class(TThread)
  private
    { Private declarations }
  protected
//  public
    procedure Execute; override;
    procedure ForSynchronization;
  end;
  procedure Pause; {in 'key.inc'}

var
  MyThread1 :BrainThread;
  MyThread2 :WaitingThread;
  Thread1Active : boolean; // used to test if thread 1 is active
  Thread2Active : boolean; // used to test if thread 2 is active

var
  Form1: TForm1;
  gtest   :integer;
  dum :longint;
  s1,InitialDir  :string;
  StopKey :Char;

procedure DecideIfThreadAndExecute;
procedure Change_HH_type(ie :integer);
procedure Change_HH_order(ie :integer);
procedure ShrinkForm1(IfShrink :boolean);
procedure StartMusic;
procedure PrintScreen;

implementation

uses Init,t_dtO,mathMyO,coeff,
     other,BP2Delphi,graph_0d,EEGO,SetNrnParsO,
     wave,exp_nu_Pyr,Slice,slice_2DO,V1O,KFP_ringO,RepresentativesO,
     run,Correspond,ColumnO,ConnectionsO,MappingsO,LGN_SaveLoadParameters,
     Unit3,Unit4,Unit5,Unit8,Unit7,Unit9,Unit10,
     Unit11,Unit12,Unit13,Unit14,Unit15,Unit16,Unit17,Unit18,Unit19,Unit20,
     Unit21,Unit22,Unit23,Unit24,Unit25,Unit26,Unit27,Unit28,Unit29,Unit30,
     Unit31,Unit32,
     LGN_Unit1,LGN_Unit15,LGN_Unit30;

{$R *.DFM}

{===================================================}

procedure ChooseAndExecute;
begin
  if StopKey='2' then begin
     StopKey:=' ';
     System_2D;
  end else if StopKey='h' then begin  { 1D Show }
     StopKey:=' ';
     Shower;
  end else if StopKey='F' then begin  { Simplex }
     StopKey:=' ';
     Simplex;
  end else if StopKey='C' then begin
     StopKey:=' ';
     V1HyperColumn;
  end;
end;

procedure DecideIfThreadAndExecute;
begin
  if Form1.Thread1.Checked then begin
     MyThread1:=BrainThread.Create(False);
     Thread1Active:=true;
  end else begin
     ChooseAndExecute;
  end;
end;

{===================================================}

procedure TForm1.ClearButtonClick(Sender: TObject);
var memYesToClean :integer;
begin
  memYesToClean:=YesToClean;   YesToClean:=1;
  Initial_Picture;
  Form1.Series1.Clear;
  Form1.Series2.Clear;
  Form1.Series3.Clear;
  Form1.Series4.Clear;
  Form1.Series5.Clear;
  Form1.Series6.Clear;
  Form1.Series7.Clear;
  Form1.Series8.Clear;
  Form1.Series9.Clear;
  Form1.Series10.Clear;
  Form1.Series11.Clear;
  Form1.Series12.Clear;
  Form1.Series13.Clear;
  Form1.Series1.Active:=true;
  Form1.Series2.Active:=true;
  Form1.Series3.Active:=true;
  Form1.Series4.Active:=true;
  Form1.Series5.Active:=true;
  Form1.Series6.Active:=true;
  Form1.Series7.Active:=true;
  Form1.Series8.Active:=true;
  Form1.Series9.Active:=true;
  Form1.Series10.Active:=true;
  Form1.Series11.Active:=true;
  Form1.Series12.Active:=true;
  Form1.Series13.Active:=true;
  //Form2.Visible:=false;//true;
  YesToClean:=memYesToClean;
end;

procedure TForm1.StopButtonClick(Sender: TObject);
begin
  StopKey:='S';
  t_end:=t;
  nt_end:={imin(}trunc(t_end/dt){, mMaxExp)};
  CorrespondParametersToTheForm;
end;

procedure TForm1.Simplex1Click(Sender: TObject);
begin
  Form1.Memo2.Visible    :=true;
  Form1.CoeMemo.Visible  :=true;
  StopKey:='F';
  DecideIfThreadAndExecute;
end;

procedure TForm1.ShowButtonClick(Sender: TObject);
begin
  Form1.ShowButton.Enabled:=false;
  ShrinkForm1(false);
  Form1.Memo2.Visible    :=true;
  StopKey:='h';
  DecideIfThreadAndExecute;
  Form1.ShowButton.Enabled:=true;
end;

procedure TForm1.WaveButtonClick(Sender: TObject);
begin
//  ShrinkForm1(true);
  Form1.Memo2.Visible    :=false;
  Form1.CoeMemo.Visible  :=false;
  Form3.Visible:=true;
//  Form1.ThreadCheckBox.Checked:=True;
  StopKey:='2';
end;

procedure TForm1.VariationButtonClick(Sender: TObject);
begin
  Form1.Memo2.Visible    :=true;
  Form1.CoeMemo.Visible  :=false;
  StopKey:='V';
  DecideIfThreadAndExecute;
end;

procedure TForm1.Button1Click(Sender: TObject);
{***************** V1 *****************}
begin
  ShrinkForm1(true);
  Form1.Memo2.Visible    :=false;
  Form1.CoeMemo.Visible  :=false;
  Form8.Visible:=true;
  StopKey:='C';
//  KFP:=TKFP.Create;
  {**********************************}
  PrepareParameters_and_CreateAColumn;
  {**********************************}
//  RingParameters;
  Map_2d_CBRD_to_Ring;
end;

procedure TForm1.PauseButtonClick(Sender: TObject);
begin
  if StopKey='P' then StopKey:=' ' else
  StopKey:='P';
{  if (MyThread1<>nil) then begin
      if Thread1Active then  MyThread1.Suspend else MyThread1.Resume;
      Thread1Active:=not(Thread1Active);
  end;}
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  if Status='SettingDefaultParameters' then begin
     DefaultParameters_2D;
     DefaultParameters;
     Status:='ParametersAreSet';
  end;
  TeeDefaultCapacity:=100000;
  Form1.WaveButton.Font.Color:=$00AACCFF;
  Form12.Visible:=Form1.Phasespace1.Checked;
end;

{===========================================================}
                        { THREADS }
{===========================================================}

{ WaitingThread }

procedure Pause;
begin
  if StopKey='P' then begin
     Form1.PauseButton.Font.Style:=[fsBold];
     Form1.PauseButton.Font.Color:=clRed;
     Form1.PauseButton.Caption:='Paused';
     beep;
     repeat
       Application.ProcessMessages;
     until StopKey<>'P';
     Form1.PauseButton.Font.Style:=[];
     Form1.PauseButton.Font.Color:=clBlack;
     Form1.PauseButton.Caption:='Pause';
     beep;
  end;
{  if MyThread2=nil then begin
     MyThread2:=WaitingThread.Create(False);
     Thread2Active:=true;
  end;}
end;

procedure WaitingThread.ForSynchronization;
begin
  StopKey:=StopKey;
end;

procedure WaitingThread.Execute;
begin
  StopKey:=' ';
  repeat
    MyThread2.Synchronize(MyThread2.ForSynchronization);
  until StopKey='P';
  StopKey:=' ';
  MyThread2.Suspend;
  MyThread2.Terminate;
end;

{ BrainThread }

procedure BrainThread.Treat_Key;
var  a              :char;
begin
  a:=StopKey;
  if (a<>' ')and(ord(a)<>0) then begin
     if a='S' then begin
        iHist:=0; nt:=nt_end; istop:=1
     end else
     if a='P' then Pause;
  end;
end;

procedure BrainThread.Execute;
begin
  ChooseAndExecute;
end;

procedure BrainThread.ForSynchronization;
begin
  StopKey:=StopKey;
end;

procedure BrainThread.MySynchronize;
begin
  Synchronize(MyThread1.ForSynchronization);
end;

{===========================================================}
                        { PopMenu }
{===========================================================}

procedure TForm1.Smpl1Click(Sender: TObject);
begin
  Form1.Smpl1.Checked:=true;
  AssignSmpl;
end;

procedure TForm1.Smpl2Click(Sender: TObject);
begin
  Form1.Smpl2.Checked:=true;
  AssignSmpl;
end;

procedure TForm1.Smpl3Click(Sender: TObject);
begin
  Form1.Smpl3.Checked:=true;
  AssignSmpl;
end;

procedure TForm1.Smpl4Click(Sender: TObject);
begin
  Form1.Smpl4.Checked:=true;
  AssignSmpl;
end;

procedure TForm1.Smpl5Click(Sender: TObject);
begin
  Form1.Smpl5.Checked:=true;
  AssignSmpl;
end;

procedure TForm1.Smpl6Click(Sender: TObject);
begin
  Form1.Smpl6.Checked:=true;
  AssignSmpl;
end;

procedure TForm1.Smpl7Click(Sender: TObject);
begin
  Form1.Smpl7.Checked:=true;
  AssignSmpl;
end;

procedure TForm1.Smpl8Click(Sender: TObject);
begin
  Form1.Smpl8.Checked:=true;
  AssignSmpl;
end;

procedure TForm1.Smpl9Click(Sender: TObject);
begin
  Form1.Smpl9.Checked:=true;
  AssignSmpl;
end;

procedure TForm1.Smpl10Click(Sender: TObject);
begin
  Form1.Smpl10.Checked:=true;
  AssignSmpl;
end;

procedure TForm1.Smpl11Click(Sender: TObject);
begin
  Form1.Smpl11.Checked:=true;
  AssignSmpl;
end;

procedure TForm1.Smpl12Click(Sender: TObject);
begin
  Form1.Smpl12.Checked:=true;
  AssignSmpl;
end;

procedure TForm1.Smpl13Click(Sender: TObject);
begin
  Form1.Smpl13.Checked:=true;
  AssignSmpl;
end;

procedure TForm1.Smpl14Click(Sender: TObject);
begin
  Form1.Smpl14.Checked:=true;
  AssignSmpl;
end;

procedure TForm1.Smpl15Click(Sender: TObject);
begin
  Form1.Smpl15.Checked:=true;
  AssignSmpl;
end;

procedure TForm1.Smpl16Click(Sender: TObject);
begin
  Form1.Smpl16.Checked:=true;
  AssignSmpl;
end;

procedure TForm1.Smpl17Click(Sender: TObject);
begin
  Form1.Smpl17.Checked:=true;
  AssignSmpl;
end;

procedure TForm1.Smpl18Click(Sender: TObject);
begin
  Form1.Smpl18.Checked:=true;
  AssignSmpl;
end;

procedure TForm1.Smpl19Click(Sender: TObject);
begin
  Form1.Smpl19.Checked:=true;
  AssignSmpl;
end;

procedure TForm1.Smpl0Click(Sender: TObject);
begin
  Form1.Smpl0.Checked:=true;
  AssignSmpl;
end;

procedure TForm1.PopupMenuForShowPopup(Sender: TObject);
begin
  CorrespondParametersToTheForm;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if Form1.CheckBox1.Checked then PrepareFormForRepresentativeNeuronsO;
  Form6.Visible:=Form1.CheckBox1.Checked;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  Form5.Visible:=Form1.CheckBox2.Checked;
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
begin
  Form13.Visible:=Form1.CheckBox3.Checked;
end;

procedure TForm1.CheckBox4Click(Sender: TObject);
begin
  if Form1.CheckBox4.Checked then  begin
     WriteOrNot:=1;
     InitiateWriting;
  end else begin
     WriteOrNot:=0;
//     CloseFile(ccc);
  end;
end;

procedure TForm1.CheckBox6Click(Sender: TObject);
begin
  YesToClean:=1-YesToClean;
//  CorrespondParametersToTheForm;
end;

{===========================================================}
                        { Main Menu }
{===========================================================}

procedure ChangeOrderIfNecessary(order_:string; var NP_:NeuronProperties);
begin
  if order_<>NP_.HH_order then begin
     NP_.HH_order:=order_;
     HodgkinPhysParameters(NP_);
  end;
end;

procedure Change_HH_order(ie :integer);
var
   HH_order_o :string;
begin
  HH_order_o:=NP0[ie].HH_order;
  if ie=1 then begin
     if Form1.N1point1. Checked      then  ChangeOrderIfNecessary('1-point',NP0[1]);
     if Form1.N2points1.Checked      then  ChangeOrderIfNecessary('2-points',NP0[1]);
     if Form1.N2pMainenSejn1.Checked then  ChangeOrderIfNecessary('2-p-MainenSejn',NP0[1]);
     if Form1.N2pActiveDend1.Checked then  ChangeOrderIfNecessary('2-p-ActiveDend',NP0[1]);
     if  (HH_order_o='1-point' ) and
        ((NP0[1].HH_order='2-points')or
         (NP0[1].HH_order='2-p-ActiveDend'))
                               then Change_gmax_AccordingToNewHHorder(1,'1to2');
     if ((HH_order_o='2-points')or
         (NP0[1].HH_order='2-p-ActiveDend')) and
         (NP0[1].HH_order='1-point' )
                               then Change_gmax_AccordingToNewHHorder(1,'2to1');
  end else if ie=2 then begin
     if Form1.N1point2. Checked      then  ChangeOrderIfNecessary('1-point',NP0[2]);
     if Form1.N2points2.Checked      then  ChangeOrderIfNecessary('2-points',NP0[2]);
     if Form1.N2pMainenSejn2.Checked then  ChangeOrderIfNecessary('2-p-MainenSejn',NP0[2]);
     if (HH_order_o='1-point' )and(NP0[2].HH_order='2-points') then Change_gmax_AccordingToNewHHorder(2,'1to2');
     if (HH_order_o='2-points')and(NP0[2].HH_order='1-point' ) then Change_gmax_AccordingToNewHHorder(2,'2to1');
  end;
end;

procedure TForm1.N1point1Click(Sender: TObject);
begin
  Form1.N1point1.Checked:=true;
  Change_HH_order(1);
  CorrespondParametersToTheForm;
end;

procedure TForm1.N2points1Click(Sender: TObject);
begin
  Form1.N2points1.Checked:=true;
  Change_HH_order(1);
  CorrespondParametersToTheForm;
end;

procedure TForm1.N2pMainenSejn1Click(Sender: TObject);
begin
  Form1.N2pMainenSejn1.Checked:=true;
  Change_HH_order(1);
  CorrespondParametersToTheForm;
end;

procedure TForm1.N2pActiveDend1Click(Sender: TObject);
begin
  Form1.N2pActiveDend1.Checked:=true;
  Change_HH_order(1);
  CorrespondParametersToTheForm;
end;

procedure TForm1.N2pMainenSejn2Click(Sender: TObject);
begin
  Form1.N2pMainenSejn2.Checked:=true;
  Change_HH_order(2);
  CorrespondParametersToTheForm;
end;

procedure TForm1.N1point2Click(Sender: TObject);
begin
  Form1.N1point2.Checked:=true;
  Change_HH_order(2);
  CorrespondParametersToTheForm;
end;

procedure TForm1.N2points2Click(Sender: TObject);
begin
  Form1.N2points2.Checked:=true;
  Change_HH_order(2);
  CorrespondParametersToTheForm;
end;

procedure ChangeTypeIfNecessary(type_:string; var NP_:NeuronProperties);
begin
  if type_<>NP_.HH_type then begin
     NP_.HH_type:=type_;
     HodgkinPhysParameters(NP_);
  end;
end;

procedure Change_HH_type(ie :integer);
begin
  if ie=1 then begin
     if Form1.Passive1. Checked then  ChangeTypeIfNecessary('Passive' ,NP0[1]);
     if Form1.Calmar1.  Checked then  ChangeTypeIfNecessary('Calmar'  ,NP0[1]);
     if Form1.Destexhe1.Checked then  ChangeTypeIfNecessary('Destexhe',NP0[1]);
     if Form1.Migliore1.Checked then  ChangeTypeIfNecessary('Migliore',NP0[1]);
     if Form1.Chow1.    Checked then  ChangeTypeIfNecessary('Chow'    ,NP0[1]);
     if Form1.Bazhenov1.Checked then  ChangeTypeIfNecessary('Bazhenov',NP0[1]);
     if Form1.Lyle1.    Checked then  ChangeTypeIfNecessary('Lyle'    ,NP0[1]);
  end else if ie=2 then begin
     if Form1.Passive2. Checked then  ChangeTypeIfNecessary('Passive' ,NP0[2]);
     if Form1.Calmar2.  Checked then  ChangeTypeIfNecessary('Calmar'  ,NP0[2]);
     if Form1.Chow2.    Checked then  ChangeTypeIfNecessary('Chow'    ,NP0[2]);
     if Form1.Bazhenov2.Checked then  ChangeTypeIfNecessary('Bazhenov',NP0[2]);
  end else begin
  end;
end;

procedure TForm1.Passive1Click(Sender: TObject);
begin
  Form1.Passive1. Checked:=true;
  Form4.CheckBox12.Checked:=true;
  Form4.GroupBox7.Visible:=true;
  Change_HH_type(1);
  CorrespondParametersToTheForm;
end;

procedure TForm1.Calmar1Click(Sender: TObject);
begin
  Form1.Calmar1. Checked:=true;
  Change_HH_type(1);
  CorrespondParametersToTheForm;
end;

procedure TForm1.Destexhe1Click(Sender: TObject);
begin
  Form1.Destexhe1. Checked:=true;
  Change_HH_type(1);
  CorrespondParametersToTheForm;
end;

procedure TForm1.Migliore1Click(Sender: TObject);
begin
  Form1.Migliore1. Checked:=true;
  Change_HH_type(1);
  CorrespondParametersToTheForm;
end;

procedure TForm1.Chow1Click(Sender: TObject);
begin
  Form1.Chow1. Checked:=true;
  Change_HH_type(1);
  CorrespondParametersToTheForm;
end;

procedure TForm1.Bazhenov1Click(Sender: TObject);
begin
  Form1.Bazhenov1.Checked:=true;
  Change_HH_type(1);
  CorrespondParametersToTheForm;
end;

procedure TForm1.Lyle1Click(Sender: TObject);
begin
  Form1.Lyle1. Checked:=true;
  Change_HH_type(1);
  CorrespondParametersToTheForm;
end;

procedure TForm1.Passive2Click(Sender: TObject);
begin
  Form1.Passive2. Checked:=true;
  Form4.CheckBox12.Checked:=true;
  Form4.GroupBox7.Visible:=true;
  Change_HH_type(2);
  CorrespondParametersToTheForm;
end;

procedure TForm1.Calmar2Click(Sender: TObject);
begin
  Form1.Calmar2. Checked:=true;
  Change_HH_type(2);
  CorrespondParametersToTheForm;
end;

procedure TForm1.Chow2Click(Sender: TObject);
begin
  Form1.Chow2. Checked:=true;
  Change_HH_type(2);
  CorrespondParametersToTheForm;
end;

procedure TForm1.Bazhenov2Click(Sender: TObject);
begin
  Form1.Bazhenov2.Checked:=true;
  Change_HH_type(2);
  CorrespondParametersToTheForm;
end;

procedure TForm1.TVDscheme1Click(Sender: TObject);
begin
  IfSecondOrder:=1-IfSecondOrder;
  CorrespondParametersToTheForm;
end;

procedure TForm1.Chart4DblClick(Sender: TObject);
begin
  Form1.Chart4.Enabled:=false;
  Form1.Chart4.Visible:=false;
  Form1.Chart5.Visible:=false;
end;

procedure TForm1.Chart1DblClick(Sender: TObject);
begin
  Form1.Chart1.Enabled:=false;
  Form1.Chart1.Visible:=false;
end;

procedure TForm1.Chart6ClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//  Series.Active:=not(Series.Active);
end;

procedure TForm1.Chart7ClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//  Series.Active:=not(Series.Active);
end;

procedure TForm1.Chart3ClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//  Series.Active:=not(Series.Active);
end;

procedure TForm1.Chart2ClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//  Series.Active:=not(Series.Active);
end;

procedure TForm1.Chart5ClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Series.Active:=not(Series.Active);
end;

procedure TForm1.Chart4ClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Series.Active:=not(Series.Active);
end;

procedure TForm1.CheckBox5Click(Sender: TObject);
begin
  if Form1.CheckBox5.Checked=false then begin
     if (NP0[1].HH_type<>'Passive')and(NP0[1].Vreset=NP0[1].Vrest) then NP0[1].Vreset:=-0.040{V};
     if (NP0[2].HH_type<>'Passive')and(NP0[2].Vreset=NP0[2].Vrest) then NP0[2].Vreset:=-0.040{V};
     if Nts[1]=0 then Nts[1]:=100;
     if Nts[2]=0 then Nts[2]:=50;
     Form4.DDSpinEdit63.Value:=trunc(Nts[1]);
     Form4.DDSpinEdit18.Value:=trunc(Nts[2]);
     exit;
  end;
  Form7.Visible:=true;
  Nts[1]:=0;  Nts[2]:=0;
  gAHP_EEG:=Form4.DDSpinEdit56.Value;
  gKM_EEG :=Form4.DDSpinEdit74.Value;
  {More details}
  Form4.CheckBox12.Checked:=true;
  Form4.GroupBox7.Visible:=true;
  Form4.GroupBox8.Visible:=true;
  { Warnings }
  Form17.Visible:=true;
  Form17.Memo1.Visible:=true;
  Form17.Memo1.Lines.Add('Neurons must be passive in EEG-mode.');
  Form17.Memo1.Lines.Add('Threshold must be constant.');
  if NP0[1].Vreset>=-0.041{V} then begin
     NP0[1].Vreset:=NP0[1].Vrest;
     Form17.Memo1.Lines.Add('Vreset[1] is set to be Vrest.');
  end;
  if NP0[2].Vreset>=-0.041{V} then begin
     NP0[2].Vreset:=NP0[2].Vrest;
     Form17.Memo1.Lines.Add('Vreset[2] is set to be Vrest.');
  end;
  {***}
  Form1.CheckBox6.Checked:=false;
  YesToClean:=0;
//  CorrespondParametersToTheForm;
end;

procedure TForm1.NotNoisySteadyRate1Click(Sender: TObject);
begin
  Form1.NotNoisySteadyRate1.Checked:=true;
end;

procedure TForm1.NoisySteadyRate1Click(Sender: TObject);
begin
  Form1.NoisySteadyRate1.Checked:=true;
end;

procedure TForm1.SteadyStateOfPopModel1Click(Sender: TObject);
begin
  Form1.SteadyStateOfPopModel1.Checked:=true;
  Form4.DDSpinEdit83.Value:=NP0[1].Vrest*1000;
  NP0[1].Vreset:=Form4.DDSpinEdit83.Value/1000;
end;

procedure TForm1.Series10DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form1.Series10.Active:=false;
end;

procedure TForm1.Series8DblClick(Sender: TChartSeries; ValueIndex: Integer;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Form1.Series8.Active:=false;
end;

procedure TForm1.Series11DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form1.Series11.Active:=false;
end;

procedure TForm1.Series12DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form1.Series12.Active:=false;
end;

procedure TForm1.Series13DblClick(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Form1.Series13.Active:=false;
end;

procedure TForm1.Series9DblClick(Sender: TChartSeries; ValueIndex: Integer;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Form1.Series9.Active:=false;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  StopKey:=Key;
end;

procedure ShrinkForm1(IfShrink :boolean);
begin
{  Form1.Chart1.Visible:=not(IfShrink);
  Form1.Chart2.Visible:=not(IfShrink);
  Form1.Chart3.Visible:=not(IfShrink);
  Form1.Chart4.Visible:=not(IfShrink);
  Form1.Chart5.Visible:=not(IfShrink);
  Form1.Chart6.Visible:=not(IfShrink);
  Form1.Chart7.Visible:=not(IfShrink);}
  Form1.PageControl1.Visible:=not(IfShrink);
end;

procedure StartMusic;
begin
  if Form3.CheckBox8.Checked then
  With Form1.MediaPlayer1 do begin
       Open;
       Play;
  end;
end;

procedure PrintScreen;
var bmp:TBitmap;
    DC :HDC;
    jpg :TJPEGImage;
begin
   bmp:=TBitmap.Create;
   jpg:=TJPEGImage.Create;
   bmp.Height:=Screen.Height;
   bmp.Width:=Screen.Width;
   DC:=GetDC(0);
   bitblt(bmp.Canvas.Handle, 0, 0, Screen.Width, Screen.Height,DC, 0, 0, SRCCOPY);
   jpg.Assign(bmp);
   jpg.SaveToFile('Screen.jpg');
   ReleaseDC(0, DC);
   bmp.Free;
   jpg.Free;
end;

procedure TForm1.Phasespace1Click(Sender: TObject);
begin
  Form1.Phasespace1.Checked:=not(Form1.Phasespace1.Checked);
  Form12.Visible:=Form1.Phasespace1.Checked;
  Form2.Visible:=Form1.Phasespace1.Checked;
end;

procedure TForm1.Inspector1Click(Sender: TObject);
begin
  Form1.Inspector1.Checked:=(Form1.Inspector1.Checked);
  Form18.Visible:=not(Form18.Visible);
  Form18.Series1.Clear;
  Application.ProcessMessages;
end;

procedure TForm1.Rose1Click(Sender: TObject);
begin
  Form1.Rose1.Checked:=not(Form1.Rose1.Checked);
  IfRose:=IfTrue(Form1.Rose1.Checked);
end;

procedure TForm1.Putwindowsattopleft1Click(Sender: TObject);
begin
  Form1.Left:=0; Form1.Top:=0;
  Form2.Left:=0; Form2.Top:=0;
  Form3.Left:=0; Form3.Top:=0;
  Form4.Left:=0; Form4.Top:=0;
  Form5.Left:=0; Form5.Top:=0;
  Form6.Left:=0; Form6.Top:=0;
  Form7.Left:=0; Form7.Top:=0;
  Form8.Left:=0; Form8.Top:=0;
  Form10.Left:=0; Form10.Top:=0;
  Form12.Left:=0; Form12.Top:=0;
  Form13.Left:=0; Form13.Top:=0;
  Form14.Left:=0; Form14.Top:=0;
  Form15.Left:=0; Form15.Top:=0;
  Form16.Left:=0; Form16.Top:=0;
  Form17.Left:=0; Form17.Top:=0;
  Form18.Left:=0; Form18.Top:=0;
  Form19.Left:=0; Form19.Top:=0;
  Form20.Left:=0; Form20.Top:=0;
  Form21.Left:=0; Form21.Top:=0;
  Form22.Left:=0; Form22.Top:=0;
  Form23.Left:=0; Form23.Top:=0;
  Form24.Left:=0; Form24.Top:=0;
  Form25.Left:=0; Form25.Top:=0;
  Form26.Left:=0; Form26.Top:=0;
  Form27.Left:=0; Form27.Top:=0;
  Form28.Left:=0; Form28.Top:=0;
  Form29.Left:=0; Form29.Top:=0;
  Form30.Left:=0; Form30.Top:=0;
  Form31.Left:=0; Form31.Top:=0;
  LGN_Form1.Left:=0;  LGN_Form1.Top:=0;
  LGN_Form15.Left:=0; LGN_Form15.Top:=0;
  LGN_Form30.Left:=0; LGN_Form30.Top:=0;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  N0d1.ShortCut     :=HotKey1.HotKey;
  N2d1.ShortCut     :=HotKey2.HotKey;
  V1Ring1.ShortCut  :=HotKey3.HotKey;
end;

procedure TForm1.RebuildAColumn1Click(Sender: TObject);
begin
  if IfAColumnCreated then begin AColumn.Free; IfAColumnCreated:=false; end;
//  DefaultParameters_2D;
//  DefaultParameters;
  AColumn:=TColumn.Create; IfAColumnCreated:=true;
  Rose(@Iext);
end;

procedure TForm1.fIcurve1Click(Sender: TObject);
begin
  Form22.Visible:=true;
end;

{**************** Subproblems *******************}
procedure TForm1.ArtificialSlice1Click(Sender: TObject);
begin
  Form1.ArtificialSlice1.Checked:=not(Form1.ArtificialSlice1.Checked);
  Form10.Visible:=Form1.ArtificialSlice1.Checked;
end;

procedure TForm1.Thomsoncat1Click(Sender: TObject);
begin
  Form1.Thomsoncat1.Checked:=not(Form1.Thomsoncat1.Checked);
  DefaultParameters;
end;

procedure TForm1.V1ringtest5PSPClick(Sender: TObject);
begin
  Form1.V1ringtest5PSP.Checked:=not(Form1.V1ringtest5PSP.Checked);
  DefaultParameters;
end;

procedure TForm1.V1ringtest5Click(Sender: TObject);
begin
  Form1.V1ringtest5.Checked:=not(Form1.V1ringtest5.Checked);
  DefaultParameters;
end;

procedure TForm1.V1ringtest55Click(Sender: TObject);
begin
  Form1.V1ringtest55.Checked:=not(Form1.V1ringtest55.Checked);
  DefaultParameters;
end;

procedure TForm1.V1ringtest6Click(Sender: TObject);
begin
  Form1.V1ringtest6.Checked:=not(Form1.V1ringtest6.Checked);
  DefaultParameters;
end;

procedure TForm1.GJ_SotnClick(Sender: TObject);
begin
  Form1.GJ_Sotn.Checked:=not(Form1.GJ_Sotn.Checked);
  DefaultParameters;
end;

procedure TForm1.ArtificialSliceClick(Sender: TObject);
begin
  Form1.ArtificialSlice.Checked:=not(Form1.ArtificialSlice.Checked);
  DefaultParameters;
end;

procedure TForm1.FittoPSCsPSPsClick(Sender: TObject);
begin
  Form1.FittoPSCsPSPs.Checked:=not(Form1.FittoPSCsPSPs.Checked);
  DefaultParameters;
end;

procedure TForm1.LIF1Click(Sender: TObject);
begin
  Form1.LIF1.Checked:=not(Form1.LIF1.Checked);
  DefaultParameters;
end;
{************************************************}

procedure TForm1.FullForm11Click(Sender: TObject);
begin
  ShrinkForm1(false);
end;

procedure TForm1.Help1Click(Sender: TObject);
begin
  Application.HelpFile := 'MyHelpBrain.hlp';
  Application.HelpCommand(HELP_FINDER, 0);
//  Application.HelpJump('Models');
end;

procedure TForm1.PouillePSCPSP1Click(Sender: TObject);
begin
  Form1.PouillePSCPSP1.Checked:=not(Form1.PouillePSCPSP1.Checked);
  DefaultParameters;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Form1.Chart6.CopyToClipboardBitmap;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Form1.Chart2.CopyToClipboardBitmap;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  Form1.Chart7.CopyToClipboardBitmap;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Form1.Chart3.CopyToClipboardBitmap;
end;

procedure TForm1.Savesettingstofile1Click(Sender: TObject);
begin
  SaveSettings(InitialDir+'Settings.txt');
end;

procedure TForm1.Loadsettingsfromfile1Click(Sender: TObject);
begin
  LoadSettings('Settings.txt');
  LoadSettings('Settings.txt');      { Second time is needed to reset the neuron type }
  LGN_LoadParameters;
end;

procedure TForm1.LFP1Click(Sender: TObject);
begin
  Form1.LFP1.Checked:=not(Form1.LFP1.Checked);
  if Form1.LFP1.Checked then Form25.Visible:=true;
end;

procedure TForm1.Gammarhythm40HzCA3id1Click(Sender: TObject);
begin
  Form1.Gammarhythm40HzCA3id1.Checked:=not(Form1.Gammarhythm40HzCA3id1.Checked);
  DefaultParameters;
end;

procedure TForm1.Series1DblClick(Sender: TChartSeries; ValueIndex: Integer;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Form1.Series1.Active:=false;
end;

procedure TForm1.BOLDsignal1Click(Sender: TObject);
begin
  Form1.BOLDsignal1.Checked:=not(Form1.BOLDsignal1.Checked);
  Form29.Show;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  Form1.Chart2.LeftAxis.AutomaticMaximum:=true;
  Form1.Chart2.LeftAxis.AutomaticMinimum:=true;
  Form1.Chart2.BottomAxis.AutomaticMaximum:=true;
  Form1.Chart2.BottomAxis.AutomaticMinimum:=false;
  Form1.Chart2.BottomAxis.Minimum:=0;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  Form1.Chart3.LeftAxis.AutomaticMaximum:=true;
  Form1.Chart3.LeftAxis.AutomaticMinimum:=true;
  Form1.Chart3.BottomAxis.AutomaticMaximum:=true;
  Form1.Chart3.BottomAxis.AutomaticMinimum:=true;
end;

procedure TForm1.Button9Click(Sender: TObject);
{ Button "As for Rate E" }
begin
  Form1.CheckBox8.Checked:=true;
  if Form1.Chart2.BottomAxis.AutomaticMaximum then begin
     Form1.Chart3.BottomAxis.AutomaticMaximum:=true;
     Form1.Chart6.BottomAxis.AutomaticMaximum:=true;
     Form1.Chart7.BottomAxis.AutomaticMaximum:=true;
     Form5.Chart1.BottomAxis.AutomaticMaximum:=true;
     Form5.Chart2.BottomAxis.AutomaticMaximum:=true;
     Form5.Chart3.BottomAxis.AutomaticMaximum:=true;
  end else begin
     Form1.Chart3.BottomAxis.AutomaticMaximum:=false;
     Form1.Chart3.BottomAxis.AutomaticMinimum:=false;
     try Form1.Chart3.BottomAxis.Maximum:=Form1.Chart2.BottomAxis.Maximum; except end;
     try Form1.Chart3.BottomAxis.Minimum:=Form1.Chart2.BottomAxis.Minimum; except end;
     Form1.Chart6.BottomAxis.AutomaticMaximum:=false;
     Form1.Chart6.BottomAxis.AutomaticMinimum:=false;
     try Form1.Chart6.BottomAxis.Maximum:=Form1.Chart2.BottomAxis.Maximum; except end;
     try Form1.Chart6.BottomAxis.Minimum:=Form1.Chart2.BottomAxis.Minimum; except end;
     Form1.Chart7.BottomAxis.AutomaticMaximum:=false;
     Form1.Chart7.BottomAxis.AutomaticMinimum:=false;
     try Form1.Chart7.BottomAxis.Maximum:=Form1.Chart2.BottomAxis.Maximum; except end;
     try Form1.Chart7.BottomAxis.Minimum:=Form1.Chart2.BottomAxis.Minimum; except end;
     Form5.Chart1.BottomAxis.AutomaticMaximum:=false;
     Form5.Chart1.BottomAxis.AutomaticMinimum:=false;
     try Form5.Chart1.BottomAxis.Maximum:=Form1.Chart2.BottomAxis.Maximum; except end;
     try Form5.Chart1.BottomAxis.Minimum:=Form1.Chart2.BottomAxis.Minimum; except end;
     Form5.Chart2.BottomAxis.AutomaticMaximum:=false;
     Form5.Chart2.BottomAxis.AutomaticMinimum:=false;
     try Form5.Chart2.BottomAxis.Maximum:=Form1.Chart2.BottomAxis.Maximum; except end;
     try Form5.Chart2.BottomAxis.Minimum:=Form1.Chart2.BottomAxis.Minimum; except end;
     Form5.Chart3.BottomAxis.AutomaticMaximum:=false;
     Form5.Chart3.BottomAxis.AutomaticMinimum:=false;
     try Form5.Chart3.BottomAxis.Maximum:=Form1.Chart2.BottomAxis.Maximum; except end;
     try Form5.Chart3.BottomAxis.Minimum:=Form1.Chart2.BottomAxis.Minimum; except end;
  end;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  Form1.Chart6.LeftAxis.AutomaticMaximum:=true;
  Form1.Chart6.LeftAxis.AutomaticMinimum:=true;
  Form1.Chart6.BottomAxis.AutomaticMaximum:=true;
  Form1.Chart6.BottomAxis.AutomaticMinimum:=true;
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  Form1.Chart7.LeftAxis.AutomaticMaximum:=true;
  Form1.Chart7.LeftAxis.AutomaticMinimum:=true;
  Form1.Chart7.BottomAxis.AutomaticMaximum:=true;
  Form1.Chart7.BottomAxis.AutomaticMinimum:=true;
end;

procedure TForm1.Showalltraces1Click(Sender: TObject);
{ "Show all traces" }
begin
  Form1.Series1.Active:=true;
  Form1.Series2.Active:=true;
  Form1.Series3.Active:=true;
  Form1.Series4.Active:=true;
  Form1.Series5.Active:=true;
  Form1.Series6.Active:=true;
  Form1.Series7.Active:=true;
  Form1.Series8.Active:=true;
  Form1.Series9.Active:=true;
  Form1.Series10.Active:=true;
  Form1.Series11.Active:=true;
  Form1.Series12.Active:=true;
  Form1.Series13.Active:=true;
  Form2.Series1.Active:=true;
  Form2.Series2.Active:=true;
  Form2.Series3.Active:=true;
  Form2.Series7.Active:=true;
  Form2.Series9.Active:=true;
  Form2.SeriesE_V.Active:=true;
  Form2.SeriesI_V.Active:=true;
  Form2.Series13.Active:=true;
  Form2.SeriesE_VT.Active:=true;
  Form2.SeriesI_VT.Active:=true;
  Form2.Series16.Active:=true;
  Form2.Series17.Active:=true;
  Form2.SeriesE_ro.Active:=true;
  Form2.SeriesE_VE.Active:=true;
  Form2.Series11.Active:=true;
  Form2.SeriesI_ro.Active:=true;
  Form2.SeriesI_VE.Active:=true;
  Form2.Series12.Active:=true;
  Form2.SeriesE_nn.Active:=true;
  Form2.SeriesI_nn.Active:=true;
  Form26.Series1.Active:=true;
  Form26.Series2.Active:=true;
  Form26.Series3.Active:=true;
  Form26.Series4.Active:=true;
  Form26.Series5.Active:=true;
  Form26.Series6.Active:=true;
  Form26.Series7.Active:=true;
  Form26.Series8.Active:=true;
  Form26.Series9.Active:=true;
  Form26.Series14.Active:=true;
  Form26.Series15.Active:=true;
  Form25.Series1.Active:=true;
  Form25.Series2.Active:=true;
  Form25.Series3.Active:=true;
  Form25.Series4.Active:=true;
  Form25.Series5.Active:=true;
  Form25.Series6.Active:=true;
  Form3.Series1.Active:=true;
  Form3.Series2.Active:=true;
  Form3.Series3.Active:=true;
  Form3.Series4.Active:=true;
  Form3.Series5.Active:=true;
  Form3.Series6.Active:=true;
  Form3.Series7.Active:=true;
  Form3.Series8.Active:=true;
  Form3.Series9.Active:=true;
  Form3.Series10.Active:=true;
  Form3.Series11.Active:=true;
  Form3.Series12.Active:=true;
  Form3.Series13.Active:=true;
  Form3.Series14.Active:=true;
  Form3.Series15.Active:=true;
  Form3.Series16.Active:=true;
  Form3.Series17.Active:=true;
  Form3.LineSeries1.Active:=true;
  Form3.LineSeries2.Active:=true;
  Form3.LineSeries3.Active:=true;
  Form3.LineSeries4.Active:=true;
  Form3.LineSeries5.Active:=true;
  Form3.LineSeries6.Active:=true;
  Form3.LineSeries7.Active:=true;
  Form3.LineSeries8.Active:=true;
  Form3.LineSeries9.Active:=true;
  Form5.Series1.Active:=true;
  Form5.Series2.Active:=true;
  Form5.Series3.Active:=true;
  Form5.Series4.Active:=true;
  Form5.Series5.Active:=true;
  Form5.Series6.Active:=true;
  Form5.Series7.Active:=true;
  Form5.Series8.Active:=true;
  Form5.Series9.Active:=true;
  Form5.Series10.Active:=true;
  Form5.Series11.Active:=true;
end;

procedure TForm1.Loadsettingsfrom1Click(Sender: TObject);
begin
  Form1.OpenDialog1.Execute;
  if Form1.OpenDialog1.FileName='' then  exit;
  LoadSettings(Form1.OpenDialog1.FileName);
  LoadSettings(Form1.OpenDialog1.FileName);
  InitialDir:=ExtractFilePath(Form1.OpenDialog1.FileName);
  Form1.Label2.Caption:='Folder: '+InitialDir;
end;

procedure TForm1.Pausejustbeforetend1Click(Sender: TObject);
begin
  Form1.Pausejustbeforetend1.Checked:=not(Form1.Pausejustbeforetend1.Checked);
end;

procedure TForm1.PlotNullclines1Click(Sender: TObject);
begin
  Form11.Visible:=true;
end;

procedure TForm1.LGN1Click(Sender: TObject);
begin
  LGN_Form15.Visible:=true;
  LGN_Form1.Visible:=true;
  Form4.ComboBox3.ItemIndex:=3;  { Visual stim. through LGN }
  IfExtracellOrThalamOrVisualOrLGN_Stimul:=4;
end;

procedure TForm1.Experimentalconductances1Click(Sender: TObject);
begin
  Form31.Visible:=true;
end;

procedure TForm1.CalculateCVdependenceonIind1Click(Sender: TObject);
begin
  Form32.Visible:=true;
end;

procedure TForm1.CheckBox8Click(Sender: TObject);
{ Button "As for Rate E" }
begin
  Form1.CheckBox8.Checked:=true;
  if Form1.Chart2.BottomAxis.AutomaticMaximum then begin
     Form1.Chart3.BottomAxis.AutomaticMaximum:=true;
     Form1.Chart6.BottomAxis.AutomaticMaximum:=true;
     Form1.Chart7.BottomAxis.AutomaticMaximum:=true;
     Form5.Chart1.BottomAxis.AutomaticMaximum:=true;
     Form5.Chart2.BottomAxis.AutomaticMaximum:=true;
     Form5.Chart3.BottomAxis.AutomaticMaximum:=true;
  end else begin
     Form1.Chart3.BottomAxis.AutomaticMaximum:=false;
     Form1.Chart3.BottomAxis.AutomaticMinimum:=false;
     try Form1.Chart3.BottomAxis.Maximum:=Form1.Chart2.BottomAxis.Maximum; except end;
     try Form1.Chart3.BottomAxis.Minimum:=Form1.Chart2.BottomAxis.Minimum; except end;
     Form1.Chart6.BottomAxis.AutomaticMaximum:=false;
     Form1.Chart6.BottomAxis.AutomaticMinimum:=false;
     try Form1.Chart6.BottomAxis.Maximum:=Form1.Chart2.BottomAxis.Maximum; except end;
     try Form1.Chart6.BottomAxis.Minimum:=Form1.Chart2.BottomAxis.Minimum; except end;
     Form1.Chart7.BottomAxis.AutomaticMaximum:=false;
     Form1.Chart7.BottomAxis.AutomaticMinimum:=false;
     try Form1.Chart7.BottomAxis.Maximum:=Form1.Chart2.BottomAxis.Maximum; except end;
     try Form1.Chart7.BottomAxis.Minimum:=Form1.Chart2.BottomAxis.Minimum; except end;
     Form5.Chart1.BottomAxis.AutomaticMaximum:=false;
     Form5.Chart1.BottomAxis.AutomaticMinimum:=false;
     try Form5.Chart1.BottomAxis.Maximum:=Form1.Chart2.BottomAxis.Maximum; except end;
     try Form5.Chart1.BottomAxis.Minimum:=Form1.Chart2.BottomAxis.Minimum; except end;
     Form5.Chart2.BottomAxis.AutomaticMaximum:=false;
     Form5.Chart2.BottomAxis.AutomaticMinimum:=false;
     try Form5.Chart2.BottomAxis.Maximum:=Form1.Chart2.BottomAxis.Maximum; except end;
     try Form5.Chart2.BottomAxis.Minimum:=Form1.Chart2.BottomAxis.Minimum; except end;
     Form5.Chart3.BottomAxis.AutomaticMaximum:=false;
     Form5.Chart3.BottomAxis.AutomaticMinimum:=false;
     try Form5.Chart3.BottomAxis.Maximum:=Form1.Chart2.BottomAxis.Maximum; except end;
     try Form5.Chart3.BottomAxis.Minimum:=Form1.Chart2.BottomAxis.Minimum; except end;
  end;
end;

procedure TForm1.Experimentalnuus1Click(Sender: TObject);
begin
  Form1.Experimentalnuus1.Checked:=true;
end;

END.
