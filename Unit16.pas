unit Unit16;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, StdCtrls,
  DDSpinEdit;

type
  TForm16 = class(TForm)
    Chart2: TChart;
    Series2: TLineSeries;
    Chart3: TChart;
    Series3: TLineSeries;
    Chart1: TChart;
    Series1: TLineSeries;
    DDSpinEdit8: TDDSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Series4: TLineSeries;
    Series5: TLineSeries;
    GroupBox1: TGroupBox;
    DDSpinEdit1: TDDSpinEdit;
    Label3: TLabel;
    DDSpinEdit2: TDDSpinEdit;
    DDSpinEdit3: TDDSpinEdit;
    DDSpinEdit4: TDDSpinEdit;
    DDSpinEdit5: TDDSpinEdit;
    DDSpinEdit6: TDDSpinEdit;
    DDSpinEdit7: TDDSpinEdit;
    DDSpinEdit9: TDDSpinEdit;
    DDSpinEdit10: TDDSpinEdit;
    DDSpinEdit11: TDDSpinEdit;
    DDSpinEdit12: TDDSpinEdit;
    DDSpinEdit13: TDDSpinEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Button2: TButton;
    GroupBox2: TGroupBox;
    DDSpinEdit14: TDDSpinEdit;
    DDSpinEdit15: TDDSpinEdit;
    DDSpinEdit16: TDDSpinEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DDSpinEdit17: TDDSpinEdit;
    Label18: TLabel;
    DDSpinEdit18: TDDSpinEdit;
    Label19: TLabel;
    ComboBox1: TComboBox;
    Button3: TButton;
    GroupBox4: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    DDSpinEdit20: TDDSpinEdit;
    DDSpinEdit21: TDDSpinEdit;
    DDSpinEdit22: TDDSpinEdit;
    DDSpinEdit23: TDDSpinEdit;
    Chart4: TChart;
    LineSeries1: TLineSeries;
    LineSeries2: TLineSeries;
    DDSpinEdit19: TDDSpinEdit;
    Label20: TLabel;
    DDSpinEdit24: TDDSpinEdit;
    Label25: TLabel;
    DDSpinEdit25: TDDSpinEdit;
    DDSpinEdit26: TDDSpinEdit;
    DDSpinEdit27: TDDSpinEdit;
    DDSpinEdit28: TDDSpinEdit;
    Label26: TLabel;
    Button1: TButton;
    Series6: TLineSeries;
    Series7: TLineSeries;
    CheckBox1: TCheckBox;
    Label27: TLabel;
    DDSpinEdit29: TDDSpinEdit;
    Label28: TLabel;
    ComboBox2: TComboBox;
    DDSpinEdit30: TDDSpinEdit;
    DDSpinEdit31: TDDSpinEdit;
    DDSpinEdit32: TDDSpinEdit;
    DDSpinEdit33: TDDSpinEdit;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    DDSpinEdit34: TDDSpinEdit;
    Label33: TLabel;
    CheckBox2: TCheckBox;
    ComboBox3: TComboBox;
    DDSpinEdit35: TDDSpinEdit;
    Label34: TLabel;
    DDSpinEdit36: TDDSpinEdit;
    Label35: TLabel;
    Label36: TLabel;
    DDSpinEdit37: TDDSpinEdit;
    Series8: TPointSeries;
    Series9: TPointSeries;
    Series10: TLineSeries;
    Series11: TLineSeries;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure DDSpinEdit20ClickChange(Sender: TObject);
    procedure DDSpinEdit21ClickChange(Sender: TObject);
    procedure DDSpinEdit22ClickChange(Sender: TObject);
    procedure DDSpinEdit23ClickChange(Sender: TObject);
    procedure DDSpinEdit16DblClick(Sender: TObject);
    procedure DDSpinEdit20DblClick(Sender: TObject);
    procedure DDSpinEdit21DblClick(Sender: TObject);
    procedure DDSpinEdit22DblClick(Sender: TObject);
    procedure DDSpinEdit23DblClick(Sender: TObject);
    procedure DDSpinEdit30DblClick(Sender: TObject);
    procedure DDSpinEdit32DblClick(Sender: TObject);
    procedure DDSpinEdit33DblClick(Sender: TObject);
    procedure DDSpinEdit31DblClick(Sender: TObject);
    procedure DDSpinEdit30Change(Sender: TObject);
    procedure DDSpinEdit31Change(Sender: TObject);
    procedure DDSpinEdit32Change(Sender: TObject);
    procedure DDSpinEdit33Change(Sender: TObject);
    procedure DDSpinEdit37DblClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DDSpinEdit14Change(Sender: TObject);
    procedure DDSpinEdit15Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation
uses KFP_ringO;

{$R *.dfm}

procedure TForm16.Button1Click(Sender: TObject);
{ Set parameters used in [Smirnova,Chizhov, Neuroinformatics 2009] }
begin
  with KFP do begin
       Nnrn:=40;
       tau:=10;
       R  :=100;
       Vrest:=0;
       Vrev:=Vrest;
       Vth :=15;
       V0:=Vrev-10;
       Nv:=150;
       Vstep :=(Vth-V0)/Nv;
       tstep :=0.02;
       sgm2  :=4;
       teta1 :=0;
       teta2 :=pi/2;
       II0   :=150;
       II1   :=5;
       J0    :=-1.2;
       J1    :=3;
       K0:=0;
       K1:=0;
       L0:=0;
       L1:=0;
       Form16.DDSpinEdit16.Value:=0;   {I_about}
       Form16.ComboBox2.ItemIndex:=0;
       KFP.ParametersToForm;
  end;
end;

procedure TForm16.Button2Click(Sender: TObject);
begin
  Form16.Button2.Enabled:=false;
  Form16.CheckBox1.Visible:=true;
  {**********}
  KFP.Run_KFP;
  {**********}
  Form16.Button2.Enabled:=true;
  Form16.CheckBox1.Visible:=false;
end;

procedure TForm16.Button3Click(Sender: TObject);
begin
  Form16.Button3.Enabled:=false;
  {**********}
  KFP.Run_FR;
  {**********}
  Form16.Button3.Enabled:=true;
end;

procedure TForm16.FormShow(Sender: TObject);
begin
  KFP:=TKFP.Create;
end;

procedure TForm16.ComboBox2Change(Sender: TObject);
begin
  Form16.DDSpinEdit29.Enabled:=(Form16.ComboBox2.ItemIndex=1);
end;

procedure TForm16.DDSpinEdit20ClickChange(Sender: TObject);
begin
  KFP.SetConnectionsFromForm_Map_FR_to_KFP;
end;

procedure TForm16.DDSpinEdit21ClickChange(Sender: TObject);
begin
  KFP.SetConnectionsFromForm_Map_FR_to_KFP;
end;

procedure TForm16.DDSpinEdit22ClickChange(Sender: TObject);
begin
  KFP.SetConnectionsFromForm_Map_FR_to_KFP;
end;

procedure TForm16.DDSpinEdit23ClickChange(Sender: TObject);
begin
  KFP.SetConnectionsFromForm_Map_FR_to_KFP;
end;

procedure TForm16.DDSpinEdit16DblClick(Sender: TObject);
begin
  Form16.DDSpinEdit16.Value:=0;
end;

procedure TForm16.DDSpinEdit20DblClick(Sender: TObject);
begin
  Form16.DDSpinEdit20.Value:=0;
  KFP.SetConnectionsFromForm_Map_FR_to_KFP;
end;

procedure TForm16.DDSpinEdit21DblClick(Sender: TObject);
begin
  Form16.DDSpinEdit21.Value:=0;
  KFP.SetConnectionsFromForm_Map_FR_to_KFP;
end;

procedure TForm16.DDSpinEdit22DblClick(Sender: TObject);
begin
  Form16.DDSpinEdit22.Value:=0;
  KFP.SetConnectionsFromForm_Map_FR_to_KFP;
end;

procedure TForm16.DDSpinEdit23DblClick(Sender: TObject);
begin
  Form16.DDSpinEdit23.Value:=0;
  KFP.SetConnectionsFromForm_Map_FR_to_KFP;
end;

procedure TForm16.DDSpinEdit30DblClick(Sender: TObject);
begin
  KFP.K0:=0;
  Form16.DDSpinEdit30.Value:=0;
end;

procedure TForm16.DDSpinEdit31DblClick(Sender: TObject);
begin
  KFP.K1:=0;
  Form16.DDSpinEdit31.Value:=0;
end;

procedure TForm16.DDSpinEdit32DblClick(Sender: TObject);
begin
  KFP.L0:=0;
  Form16.DDSpinEdit32.Value:=0;
end;

procedure TForm16.DDSpinEdit33DblClick(Sender: TObject);
begin
  KFP.L1:=0;
  Form16.DDSpinEdit33.Value:=0;
end;

procedure TForm16.DDSpinEdit30Change(Sender: TObject);
begin
  KFP.K0:=Form16.DDSpinEdit30.Value;
end;

procedure TForm16.DDSpinEdit31Change(Sender: TObject);
begin
  KFP.K1:=Form16.DDSpinEdit31.Value;
end;

procedure TForm16.DDSpinEdit32Change(Sender: TObject);
begin
  KFP.L0:=Form16.DDSpinEdit32.Value;
end;

procedure TForm16.DDSpinEdit33Change(Sender: TObject);
begin
  KFP.L1:=Form16.DDSpinEdit33.Value;
end;

procedure TForm16.DDSpinEdit37DblClick(Sender: TObject);
begin
  Form16.DDSpinEdit37.Value:=0;
end;

procedure TForm16.Button4Click(Sender: TObject);
begin
   Form16.Button4.Enabled:=false;
   { Plot nu(I,s) }
   KFP.PlotWrite_Johannesma_nu_I_s({Ns=}2);
   Form16.Button4.Enabled:=true;
end;

procedure TForm16.DDSpinEdit14Change(Sender: TObject);
begin
   KFP.k_Joh:=Form16.DDSpinEdit14.Value;
   KFP.ParametersToForm;
end;

procedure TForm16.DDSpinEdit15Change(Sender: TObject);
begin
   KFP.I0_Joh:=Form16.DDSpinEdit15.Value;
   KFP.ParametersToForm;
end;

end.
