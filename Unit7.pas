unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TeEngine, Series, ExtCtrls, TeeProcs, Chart, StdCtrls, DDSpinEdit,
  Init,EEGO,ColumnO;

type
  TForm7 = class(TForm)
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Chart2: TChart;
    Series3: TLineSeries;
    Series4: TLineSeries;
    Button1: TButton;
    Chart3: TChart;
    Series5: TLineSeries;
    GroupBox1: TGroupBox;
    DDSpinEdit1: TDDSpinEdit;
    DDSpinEdit2: TDDSpinEdit;
    DDSpinEdit3: TDDSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button2: TButton;
    SaveDialog1: TSaveDialog;
    CheckBox1: TCheckBox;
    DDSpinEdit4: TDDSpinEdit;
    GroupBox4: TGroupBox;
    Label8: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DDSpinEdit5: TDDSpinEdit;
    DDSpinEdit6: TDDSpinEdit;
    DDSpinEdit7: TDDSpinEdit;
    Button3: TButton;
    Button4: TButton;
    ComboBox1: TComboBox;
    procedure Series2DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Series1DblClick(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Button1Click(Sender: TObject);
    procedure Chart3DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SaveDialog1CanClose(Sender: TObject; var CanClose: Boolean);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;
  AEEG :TEEG;

implementation

{$R *.DFM}

procedure TForm7.Series2DblClick(Sender: TChartSeries; ValueIndex: Integer;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Form7.Series2.Active:=false;
end;

procedure TForm7.Series1DblClick(Sender: TChartSeries; ValueIndex: Integer;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Form7.Series1.Active:=false;
end;

procedure Rate_versus_tau_s_for_LIF;
var
    i,Ns :integer;
    Vinfty_VT,sgmV_VT,taum,taus, Rate :double;
begin
  Form7.Series5.Clear;
  Form7.Series3.Clear;
  Ns  :=trunc(Form7.DDSpinEdit5.Value);//10;
  Vinfty_VT :=Form7.DDSpinEdit1.Value;//8{mV}/10{mV};
  sgmV_VT   :=Form7.DDSpinEdit2.Value;//2{mV}/10{mV};
  taum      :=Form7.DDSpinEdit3.Value;//10{ms};
  for i:=1 to Ns do begin
      taus:=i*i*(200{ms}/sqr(Ns));
      if Form7.CheckBox1.Checked then
         sgmV_VT:=taum/1e3*sqrt(Form7.DDSpinEdit4.Value {sgm^2 from Moreno-Bote}
                 /(2*taus/1e3*(1+taum/taus)));
//      Rate:=SteadyRateOfPopModel(Vinfty_VT,sgmV_VT,taum,taum/taus)*1e3;{in Hz}
      Form7.Series5.AddXY(taus,Rate);
  end;
  Application.ProcessMessages;
end;

procedure TForm7.Button1Click(Sender: TObject);
begin
  Form7.Chart3.Visible:=true;
  Form7.GroupBox1.Visible:=true;
  Form7.GroupBox4.Visible:=true;
  Rate_versus_tau_s_for_LIF;
end;

procedure TForm7.Chart3DblClick(Sender: TObject);
begin
  Form7.Chart3.Visible:=false;
  Form7.GroupBox1.Visible:=false;
  Form7.GroupBox4.Visible:=false;
end;

procedure TForm7.Button2Click(Sender: TObject);
begin
  Form7.SaveDialog1.Execute;
end;

procedure TForm7.SaveDialog1CanClose(Sender: TObject;
  var CanClose: Boolean);
var  i :integer;
begin
  AssignFile(fff, SaveDialog1.FileName);  Rewrite(fff);
  for i:=0 to Form7.Series5.XValues.Count-1 do begin
      writeln(fff,Form7.Series5.XValues.Value[i]:13,' ',
                  Form7.Series5.YValues.Value[i]:13);
  end;
  CloseFile(fff);

end;

procedure TForm7.CheckBox1Click(Sender: TObject);
begin
  Form7.DDSpinEdit2.Enabled:=not(Form7.CheckBox1.Checked);
  Form7.DDSpinEdit4.Enabled:=    Form7.CheckBox1.Checked;
end;

procedure TForm7.Button3Click(Sender: TObject);
begin
  AEEG:=TEEG.Create;
  AEEG.InitialConditions('P',NP0[1],sgm_V[1]);
  AEEG.Free;
end;

procedure TForm7.Button4Click(Sender: TObject);
begin
  Form7.Series1.Clear;
  Form7.Series2.Clear;
end;

end.
