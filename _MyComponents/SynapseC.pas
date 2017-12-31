unit SynapseC;

interface

uses
  Windows, Messages, Variants, Graphics, Forms,
  Dialogs, StdCtrls, DDSpinEdit, Spin,
  SysUtils, Classes, Controls, ExtCtrls, typeSynParsO;

type
  {*******************************}
  TSynapseC = class(TCustomControl)
  {*******************************}
    procedure GroupBox1VisibleOrNot;
    procedure Shape1ContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure Label0ContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure CheckBox1Click(Sender: TObject);
    procedure DDSpinEdit1Change(Sender: TObject);
    procedure DDSpinEdit2Change(Sender: TObject);
    procedure DDSpinEdit3Change(Sender: TObject);
    procedure DDSpinEdit4Change(Sender: TObject);
  private
    Shape1: TShape;
    DDSpinEdit1,DDSpinEdit2,DDSpinEdit3,DDSpinEdit4: TDDSpinEdit;
    GroupBox1: TGroupBox;
    Label0,Label1,Label2,Label3,Label4: TLabel;
    CheckBox1: TCheckBox;
  protected
  public
    SP :SynapseProperties;
    constructor Create(AOwner: TComponent); override;
    property Canvas;
  published
    property gmax   :double read SP.gmax write SP.gmax;
    property Vrev   :double read SP.Vrev write SP.Vrev;
    property alpha  :double read SP.alpha write SP.alpha;
    property beta   :double read SP.beta write SP.beta;
    property factor :double read SP.factor write SP.factor;
    property IfBlock :double read SP.IfBlock write SP.IfBlock;
    property IfApplySigmoidToAxonRate :integer read SP.IfApplySigmoidToAxonRate write SP.IfApplySigmoidToAxonRate;
    property PName :string read SP.Name write SP.Name;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Neurons', [TSynapseC]);
end;

constructor TSynapseC.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Shape1:=TShape.Create(self);
  Shape1.Parent:=self;
  GroupBox1:=TGroupBox.Create(self);
  GroupBox1.Parent:=self;
  GroupBox1.Visible:=true;
  DDSpinEdit1:=TDDSpinEdit.Create(self);
  DDSpinEdit1.Parent:=GroupBox1;
  DDSpinEdit2:=TDDSpinEdit.Create(self);
  DDSpinEdit2.Parent:=GroupBox1;
  DDSpinEdit3:=TDDSpinEdit.Create(self);
  DDSpinEdit3.Parent:=GroupBox1;
  DDSpinEdit4:=TDDSpinEdit.Create(self);
  DDSpinEdit4.Parent:=GroupBox1;
  Label0:=TLabel.Create(self);
  Label0.Parent:=self;
  Label1:=TLabel.Create(self);
  Label1.Parent:=GroupBox1;
  Label2:=TLabel.Create(self);
  Label2.Parent:=GroupBox1;
  Label3:=TLabel.Create(self);
  Label3.Parent:=GroupBox1;
  Label4:=TLabel.Create(self);
  Label4.Parent:=GroupBox1;
  CheckBox1:=TCheckBox.Create(self);
  CheckBox1.Parent:=GroupBox1;
{************************************************************}
  with Shape1 do begin
    Left := 0;
    Top := 2;
    Width := 10;
    Height := 10;
    Shape := stCircle; 
    OnContextPopup := Shape1ContextPopup;
  end;
  with Label0 do begin
    Left := 12;
    Top := 0;
    Width := 56;
    Height := 13;
    Caption := 'NameLabel ';
    Font.Charset := DEFAULT_CHARSET;
    Font.Color := clWindowText;
    Font.Height := -10;
    Font.Name := 'Microsoft Sans Serif';
    Font.Style := [fsItalic];
    ParentFont := False;
    OnContextPopup := Label0ContextPopup;
  end;
  with GroupBox1 do begin
    Left := 16;
    Top := 12;
    Width := 100;
    Height := 121;
    Caption := 'Properties:';
    Font.Charset := DEFAULT_CHARSET;
    Font.Color := clWindowText;
    Font.Height := -13;
    Font.Name := 'Microsoft Sans Serif';
    Font.Style := [];
    ParentFont := False;
    TabOrder := 0;
    with Label1 do begin
      Left := 8;
      Top := 18;
      Width := 33;
      Height := 16;
      Caption := 'gmax';
    end;
    with Label2 do begin
      Left := 8;
      Top := 38;
      Width := 28;
      Height := 16;
      Caption := 'Vrev';
    end;
    with Label3 do begin
      Left := 8;
      Top := 58;
      Width := 34;
      Height := 16;
      Caption := 'alpha';
    end;
    with Label4 do begin
      Left := 8;
      Top := 78;
      Width := 27;
      Height := 16;
      Caption := 'beta';
    end;
    with DDSpinEdit1 do begin
      Left := 48;
      Top := 16;
      Width := 49;
      Height := 22;
      StrWidth := 2;
      StrDecimals := 3;
      Font.Charset := DEFAULT_CHARSET;
      Font.Color := clWindowText;
      Font.Height := -10;
      Font.Name := 'Microsoft Sans Serif';
      Font.Style := [];
      Increment := 0.100000000000000000;
      ParentFont := False;
      TabOrder := 0;
      OnChange := DDSpinEdit1Change;
    end;
    with DDSpinEdit2 do begin
      Left := 48;
      Top := 36;
      Width := 49;
      Height := 22;
      StrWidth := 2;
      StrDecimals := 1;
      Font.Charset := DEFAULT_CHARSET;
      Font.Color := clWindowText;
      Font.Height := -10;
      Font.Name := 'Microsoft Sans Serif';
      Font.Style := [];
      Increment := 1.000000000000000000;
      ParentFont := False;
      TabOrder := 1;
      OnChange := DDSpinEdit2Change;
    end;
    with DDSpinEdit3 do begin
      Left := 48;
      Top := 56;
      Width := 49;
      Height := 22;
      StrWidth := 2;
      StrDecimals := 0;
      Font.Charset := DEFAULT_CHARSET;
      Font.Color := clWindowText;
      Font.Height := -10;
      Font.Name := 'Microsoft Sans Serif';
      Font.Style := [];
      Increment := 10.000000000000000000;
      ParentFont := False;
      TabOrder := 2;
      OnChange := DDSpinEdit3Change;
    end;
    with DDSpinEdit4 do begin
      Left := 48;
      Top := 76;
      Width := 49;
      Height := 22;
      StrWidth := 2;
      StrDecimals := 0;
      Font.Charset := DEFAULT_CHARSET;
      Font.Color := clWindowText;
      Font.Height := -10;
      Font.Name := 'Microsoft Sans Serif';
      Font.Style := [];
      Increment := 10.000000000000000000;
      ParentFont := False;
      TabOrder := 3;
      OnChange := DDSpinEdit4Change;
    end;
    with CheckBox1 do begin
      Left := 8;
      Top := 98;
      Width := 89;
      Height := 17;
      Caption := ' If Block';
      TabOrder := 4;
      OnClick := CheckBox1Click;
    end;
  end;
  GroupBox1VisibleOrNot;
end;

procedure TSynapseC.GroupBox1VisibleOrNot;
begin
  if not(GroupBox1.Visible) then GroupBox1.SendToBack else GroupBox1.BringToFront;
  if not(GroupBox1.Visible) then begin
     Width :=Shape1.Width;
     Height:=Shape1.Height+Shape1.Top;
  end else begin
     Width :=GroupBox1.Left+GroupBox1.Width;
     Height:=GroupBox1.Height+GroupBox1.Top;
  end;
end;

procedure TSynapseC.Shape1ContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin
  GroupBox1.Visible:=not(GroupBox1.Visible);
  GroupBox1VisibleOrNot;
end;

procedure TSynapseC.Label0ContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin
  GroupBox1.Visible:=not(GroupBox1.Visible);
  GroupBox1VisibleOrNot;
end;

procedure TSynapseC.CheckBox1Click(Sender: TObject);
begin
  SP.IfBlock:=1-SP.IfBlock;
  CheckBox1.Checked:=(SP.IfBlock=1);
end;

procedure TSynapseC.DDSpinEdit1Change(Sender: TObject);
begin
  SP.gmax:=DDSpinEdit1.Value;
end;

procedure TSynapseC.DDSpinEdit2Change(Sender: TObject);
begin
  SP.Vrev:=DDSpinEdit2.Value;
end;

procedure TSynapseC.DDSpinEdit3Change(Sender: TObject);
begin
  SP.alpha:=DDSpinEdit3.Value;
end;

procedure TSynapseC.DDSpinEdit4Change(Sender: TObject);
begin
  SP.beta:=DDSpinEdit4.Value;
end;

end.
