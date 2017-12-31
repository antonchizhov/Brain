unit Unit15;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Frame_2DO, StdCtrls, TeEngine, Series, ExtCtrls, TeeProcs, Chart,
  DDSpinEdit,Math;

type
  TForm15 = class(TForm)
    Frame15: TFrame15;
    Chart1: TChart;
    Series1: TLineSeries;
    Button2: TButton;
    Label1: TLabel;
    DDSpinEdit1: TDDSpinEdit;
    DDSpinEdit2: TDDSpinEdit;
    Button1: TButton;
    CheckBox1: TCheckBox;
    DDSpinEdit3: TDDSpinEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    DDSpinEdit4: TDDSpinEdit;
    procedure Frame15Chart1ClickSeries(Sender: TCustomChart;
      Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Frame15ComboBox1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form15: TForm15;

implementation
uses Init,Unit18,LGN_Unit15,graph_2DO,slice_2DO,LGN_main,Stimulation_2D;

{$R *.dfm}

procedure TForm15.Frame15Chart1ClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
    i,j,
    iPWCenter,jPWCenter,charge                          :integer;
    a,b,fi,dx_,dy_,sm,r_V1_,phi_V1_,
    r_0_0, phi_0_0,  r_0_nj, phi_0_nj,
    r_ni_0,phi_ni_0, r_ni_nj,phi_ni_nj
                                                        :double;
begin
  Series.GetCursorValues(a,b);
  i:=round(a); j:=round(b);
  if Button=mbLeft then begin
     { Open Inspector }
     if (i>0)and(i<=ni+1)and(j>0)and(j<=nj+1) then begin
         Form18.DDSpinEdit1.Value:=i;
         Form18.DDSpinEdit2.Value:=j;
         Form18.Visible:=true;
     end;
  end else if ((Button=mbMiddle)or(Button=mbRight))and(LGN_Form15.Visible) then begin
     { Draw RF in LGN }
     PinWheel_fi_for_ij(i,j,0, fi,dx_,dy_, iPWCenter,jPWCenter,charge);
     Translate_i_j_to_r_phi(i,j, r_V1_,phi_V1_);
     LGN_Draw_RF(r_V1_,phi_V1_,fi,charge);
     Form15.Frame15.Series8.Active:=true;
     Form15.Frame15.Series8.Clear;
     Form15.Frame15.Series8.AddXY(i,j);
     { Boundary of the cortical area back-projection }
     Translate_i_j_to_r_phi(0,0,       r_0_0,  phi_0_0);
     Translate_i_j_to_r_phi(0,nj+1,    r_0_nj, phi_0_nj);
     Translate_i_j_to_r_phi(ni+1,0,    r_ni_0, phi_ni_0);
     Translate_i_j_to_r_phi(ni+1,nj+1, r_ni_nj,phi_ni_nj);
     LGN_Draw_Retinotopy(r_0_0, phi_0_0,  r_0_nj, phi_0_nj,
                         r_ni_0,phi_ni_0, r_ni_nj,phi_ni_nj);
  end;
end;

procedure TForm15.Frame15ComboBox1Change(Sender: TObject);
var s1 :string;
begin
  s1:=Form15.Frame15.ComboBox1.Items[Form15.Frame15.ComboBox1.ItemIndex];
  FieldToDraw:=s1;
  if (s1='PinWheels')or(s1='from Inspector')or
     (s1='VisualStimulus')or(s1='Screen')or
     (s1='ElectricalStimulus')or(s1='PatchyConnections') then
      Draw_Lattice(s1,j_view);
end;

procedure TForm15.Button2Click(Sender: TObject);
begin
  Form15.Frame15.Chart1.AxisVisible:=false;
  Form15.Frame15.Chart1.CopyToClipboardBitmap;
  Form15.Frame15.Chart1.AxisVisible:=true;
end;

procedure TForm15.Button1Click(Sender: TObject);
begin
  WriteExtractedField;
end;

procedure TForm15.FormShow(Sender: TObject);
begin
  Draw_Lattice('ElectricalStimulus',j_view);
end;

procedure TForm15.CheckBox1Click(Sender: TObject);
begin
  if Form15.CheckBox1.Checked then if Form15.Top>494 then Form15.Top:=494;
end;

end.
