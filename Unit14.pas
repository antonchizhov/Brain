unit Unit14;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SynapseC, StdCtrls, DDSpinEdit, Grids, ValEdit, gsynC;

type

  TForm14 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DDSpinEdit1: TDDSpinEdit;
    Shape1: TShape;
    Label2: TLabel;
    DDSpinEdit2: TDDSpinEdit;
    DDSpinEdit3: TDDSpinEdit;
    DDSpinEdit4: TDDSpinEdit;
    CheckBox1: TCheckBox;
    Label3: TLabel;
    Label4: TLabel;
    Label0: TLabel;
    SynapseC1: TSynapseC;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    SynapseC2: TSynapseC;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    SynapseC3: TSynapseC;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    SynapseC4: TSynapseC;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    SynapseC5: TSynapseC;
    SynapseC6: TSynapseC;
    SynapseC7: TSynapseC;
    Shape14: TShape;
    Shape15: TShape;
    SynapseC8: TSynapseC;
    SynapseC9: TSynapseC;
    Shape16: TShape;
    Shape17: TShape;
    Shape18: TShape;
    Shape19: TShape;
    SynapseC10: TSynapseC;
    gsynC1: TgsynC;
    procedure FormShow(Sender: TObject);
    procedure SynapseC1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure Shape1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure Label0ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure CheckBox1Click(Sender: TObject);
    procedure DDSpinEdit1Change(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form14: TForm14;

implementation

{$R *.dfm}

procedure TForm14.FormShow(Sender: TObject);
begin
//  ArrOfSyn[1]:=SynapseC1;
  Form14.Shape3.BringToFront;
end;

procedure TForm14.SynapseC1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
  Form14.GroupBox1.Visible:=true;
end;

procedure TForm14.Shape1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
  Form14.GroupBox1.Visible:=not(Form14.GroupBox1.Visible);
  GroupBox1.SendToBack;
end;

procedure TForm14.Label0ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
  Form14.GroupBox1.Visible:=not(Form14.GroupBox1.Visible);
end;

procedure TForm14.CheckBox1Click(Sender: TObject);
begin
  CheckBox1.Checked:=not(CheckBox1.Checked);
end;

procedure TForm14.DDSpinEdit1Change(Sender: TObject);
begin
  DDSpinEdit1.Value:=DDSpinEdit1.Value;
end;

procedure TForm14.FormDblClick(Sender: TObject);
begin
  Form14.gsynC1.Renew;
end;

end.
