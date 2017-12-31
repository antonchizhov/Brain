unit gsynC;

interface

uses
  Windows, Messages, Variants, Graphics, Forms,
  Dialogs, StdCtrls, DDSpinEdit, Spin,
  SysUtils, Classes, Controls, ExtCtrls, typeSynParsO;

type
  ADDSpinEdit=array[1..40] of TDDSpinEdit;

  {*******************************}
  TgsynC = class(TCustomControl)
  {*******************************}
  private
    GroupBox1: TGroupBox;
    DDSpinEdit1: TDDSpinEdit;
    DDSpinEditA: ADDSpinEdit;
  protected
  public
    constructor Create(AOwner: TComponent); override;
  published
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Neurons', [TgsynC]);
end;

constructor TgsynC.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DDSpinEdit1:=TDDSpinEdit.Create(self);
  DDSpinEdit1.Parent:=GroupBox1;
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
    end;
  end;
end;

end.
