unit Unit20;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart,
  Unit8,Unit16,
  Init,KFP_ringO,DDSpinEdit,ConnectionsO,ColumnO,MathMyO,MappingsO,
  StdCtrls, Menus;

type
  TForm20 = class(TForm)
    Chart1: TChart;
    RadioGroup1: TRadioGroup;
    PopupMenu1: TPopupMenu;
    AMP3onP1: TMenuItem;
    Series1: TBarSeries;
    Label1: TLabel;
    procedure RadioGroup1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure Rose(AValue :Pdouble);

var
  Form20: TForm20;

implementation

{$R *.dfm}


procedure Rose(AValue :Pdouble);
{ Calculates derivatives of I0,I1,J0,J1 on the variable AValue }
var
    I0_,I1_,J0_,J1_,dI0,dI1,dJ0,dJ1,mem :double;
    t1 :string;
begin
  if IfRose<>1 then exit;
  Form20.Visible:=true;
  mem:=AValue^;
  str(mem:13:4,t1);
  Form20.Label1.Caption:='Actual value='+t1;
  { Increment }
  AValue^:=AValue^+abs(AValue^)*0.03;
  {******************}
  Map_2d_CBRD_to_Ring;
  Map_CBRD_to_KFP;
  {******************}
  I0_:=Form16.DDSpinEdit20.Value;
  I1_:=Form16.DDSpinEdit21.Value;
  J0_:=Form16.DDSpinEdit22.Value;
  J1_:=Form16.DDSpinEdit23.Value;
  { Return to initial value }
  AValue^:=mem;
  {******************}
  Map_2d_CBRD_to_Ring;
  Map_CBRD_to_KFP;
  {******************}
  dI0:=-(Form16.DDSpinEdit20.Value-I0_)/max(abs(I0_),0.001);
  dI1:=-(Form16.DDSpinEdit21.Value-I1_)/max(abs(I1_),0.001);
  dJ0:=-(Form16.DDSpinEdit22.Value-J0_)/max(abs(J0_),0.001);
  dJ1:=-(Form16.DDSpinEdit23.Value-J1_)/max(abs(J1_),0.001);
  { Draw the results }
  Form20.Series1.Clear;
  Form20.Series1.AddBar(dI0,'I0',clRed);
  Form20.Series1.AddBar(dI1,'I1',clBlue);
  Form20.Series1.AddBar(dJ0,'J0',clGreen);
  Form20.Series1.AddBar(dJ1,'J1',clYellow);
  Application.ProcessMessages;
end;

procedure TForm20.RadioGroup1Click(Sender: TObject);
var i_syn :integer;
begin
  i_syn:=iOfSyn(Form20.RadioGroup1.Items[Form20.RadioGroup1.ItemIndex]);
  Rose(@AColumn.Syn[i_syn].SP.gmax);
end;

procedure TForm20.PopupMenu1Popup(Sender: TObject);
begin
  Form20.Visible:=true;
  Form20.RadioGroup1.Visible:=true;
end;

procedure TForm20.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form20.RadioGroup1.Visible:=false;
end;

end.
