unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DDSpinEdit, TeEngine, Series, ExtCtrls, TeeProcs,
  Chart;

Const mXmax=201; mYmax=81;

type
  TForm1 = class(TForm)
    Button1: TButton;
    DDSpinEdit1: TDDSpinEdit;
    Label1: TLabel;
    Button2: TButton;
    DDSpinEdit2: TDDSpinEdit;
    Label2: TLabel;
    DDSpinEdit3: TDDSpinEdit;
    Label3: TLabel;
    Button3: TButton;
    Chart1: TChart;
    Series1: TLineSeries;
    ComboBox1: TComboBox;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    DDSpinEdit4: TDDSpinEdit;
    DDSpinEdit5: TDDSpinEdit;
    Label6: TLabel;
    DDSpinEdit6: TDDSpinEdit;
    Chart2: TChart;
    LineSeries1: TLineSeries;
    OpenDialog1: TOpenDialog;
    Button4: TButton;
    Series2: TLineSeries;
    Label7: TLabel;
    Chart3: TChart;
    DDSpinEdit7: TDDSpinEdit;
    DDSpinEdit8: TDDSpinEdit;
    Label9: TLabel;
    Series3: TLineSeries;
    CheckBox1: TCheckBox;
    Button5: TButton;
    DDSpinEdit9: TDDSpinEdit;
    DDSpinEdit10: TDDSpinEdit;
    Label10: TLabel;
    Button6: TButton;
    Memo1: TMemo;
    Label11: TLabel;
    DDSpinEdit11: TDDSpinEdit;
    Label12: TLabel;
    DDSpinEdit12: TDDSpinEdit;
    Series4: TLineSeries;
    Button7: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DDSpinEdit11DblClick(Sender: TObject);
    procedure DDSpinEdit12DblClick(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  arr_X_Y  =array[0..mXmax,0..mYMax] of double;
  arr_vars =array[0..15] of double;

var
  Form1                                  :TForm1;

implementation
uses Extractor, Unit15;

{$R *.dfm}
{===========================================================================}

procedure TForm1.Button1Click(Sender: TObject);
{ View, extract ring and integrate var: }
begin
  Form1.Button1.Enabled:=false;
  if IfStepByStep=1 then begin { Finish stepping }
     IfStopSteppingAndKeepMoving:=1;
  end else begin
     IfStop:=0;
     Extract(trunc(Form1.DDSpinEdit1.Value));
  end;
  Form1.Button1.Enabled:=true;
end;

procedure TForm1.Button2Click(Sender: TObject);
var t_in_ms,rPW,Theta :integer;
begin
  Form1.Button2.Enabled:=false;
  rPW     :=trunc(Form1.DDSpinEdit1.Value);
  t_in_ms :=trunc(Form1.DDSpinEdit2.Value);
  Theta   :=trunc(Form1.DDSpinEdit3.Value);
  ExtractProfileAcrossRadiusAt(t_in_ms-1,rPW,Theta);
  Form1.Button2.Enabled:=true;
end;

procedure TForm1.Button3Click(Sender: TObject);
var t_in_ms,rPW :integer;
begin
  Form1.Button3.Enabled:=false;
  rPW     :=trunc(Form1.DDSpinEdit1.Value);
  t_in_ms :=trunc(Form1.DDSpinEdit2.Value);
  ExtractHorizontalProfileAt(t_in_ms-1,rPW);
  Form1.Button3.Enabled:=true;
end;

//    U1-V4        nu1-V5                             U2-V6        nu2-V7      }
           {                                    U3-V8        nu3-V9      }
           {                                    U4-V10       nu4-V11     }

procedure TForm1.Button4Click(Sender: TObject);
begin
  GetDir(0,CurrentDir);
  Form1.OpenDialog1.InitialDir:=CurrentDir;
  Form1.OpenDialog1.Execute;
  GetDir(0,CurrentDir);
end;

procedure TForm1.Button5Click(Sender: TObject);
{ Step by step }
begin
  Form1.Button5.Enabled:=false;
  if IfStepByStep=0 then begin { Initialize }
     IfStepByStep:=1;
     Extract(trunc(Form1.DDSpinEdit1.Value));
  end else begin               { Continue }
     IfDoNextStep:=1;
  end;
  Form1.Button5.Enabled:=true;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  Form1.Chart1.CopyToClipboardBitmap;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IfDoNextStep:=1;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IfStop:=1;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Form15.Frame15.ComboBox1.Visible:=false;
end;

procedure TForm1.DDSpinEdit11DblClick(Sender: TObject);
begin
  Form1.DDSpinEdit11.Value:=0;
end;

procedure TForm1.DDSpinEdit12DblClick(Sender: TObject);
begin
  Form1.DDSpinEdit12.Value:=0;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  IfStop:=1;
end;

end.
