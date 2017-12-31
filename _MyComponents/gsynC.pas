unit gsynC;

interface
uses
  Windows, Messages, Variants, Graphics, Forms,
  Dialogs, StdCtrls, DDSpinEdit, Spin,
  SysUtils, Classes, Controls, ExtCtrls;

const MaxNSyn=50;  IfSmallScreen={true}false;
type
  ADDSpinEdit=array[1..MaxNSyn] of TDDSpinEdit;

  {*******************************}
  TgsynC = class(TWinControl)
  {*******************************}
  private
  public
    GroupBox1: TGroupBox;
    StaticTextA: array[1..20] of TStaticText;
    DDSpinEdit1: TDDSpinEdit;
    DDSpinEditA: ADDSpinEdit;
    FNSyn :integer;
    FOnChange,FOnDblClick,FOnMouseDown: TNotifyEvent;
    constructor Create(AOwner: TComponent); override;
    procedure DDSpinEdit1Change(Sender: TObject);
    procedure Renew;
  protected
//    procedure Change; dynamic;
    procedure DblClick (Sender: TObject); virtual;
    procedure UpClick (Sender: TObject); virtual;
    procedure MyMouseDown(Sender: TObject); virtual;
    procedure Zero (Sender: TObject); virtual;
  published
    property NSyn :integer read FNSyn write FNSyn;
    property Visible;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnMouseDown: TNotifyEvent read FOnMouseDown write FOnMouseDown;
    property PopupMenu;
  end;
procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Neurons', [TgsynC]);
end;

constructor TgsynC.Create(AOwner: TComponent);
var i{,NSyn} :integer;
begin
  NSyn:=MaxNSyn;
  inherited Create(AOwner);
  Height:=284+88;
  Width:=235;
  GroupBox1:=TGroupBox.Create(self);
  GroupBox1.Parent:=self;
//  GroupBox1.OnClick:=Click;
  GroupBox1.OnDblClick:=DblClick;
//  GroupBox1.OnMouseDown:=MyMouseDown;
  { StaticTexts }
  for i:=1 to 20 do begin
      StaticTextA[i]:=TStaticText.Create(self);
      StaticTextA[i].Parent:=GroupBox1;
      StaticTextA[i].Left:=4;
  end;
  IF IfSmallScreen then BEGIN
     for i:=1 to 4 do StaticTextA[i].Left:=48{55};
     StaticTextA[1].Caption:='  P      I         P23      I23';
     StaticTextA[1].Top:=16{20};
     StaticTextA[2].Caption:='  P      I         P23      I23';
     StaticTextA[2].Top:=16{20}+78{88};
     StaticTextA[3].Caption:='  P      I         P23      I23';
     StaticTextA[3].Top:=16{20}+78{88}+78{88};
     StaticTextA[4].Caption:='  P      I         P23      I23';
     StaticTextA[4].Top:=16{20}+78{88}+78{88}+78{88};
     StaticTextA[5].Caption:='ext.';
     StaticTextA[5].Top:=34{42};
     StaticTextA[6].Caption:='4';
     StaticTextA[6].Top:=54{64};
     StaticTextA[7].Caption:='2/3';
     StaticTextA[7].Top:=74{86};
     StaticTextA[8].Caption:='ext.';
     StaticTextA[8].Top:=34{42}+78{88};
     StaticTextA[9].Caption:='4';
     StaticTextA[9].Top:=54{64}+78{88};
     StaticTextA[10].Caption:='2/3';
     StaticTextA[10].Top:=74{86}+78{88};
     StaticTextA[11].Caption:='ext.';
     StaticTextA[11].Top:=34{42}+78{88}+78{88};
     StaticTextA[12].Caption:='4';
     StaticTextA[12].Top:=54{64}+78{88}+78{88};
     StaticTextA[13].Caption:='2/3';
     StaticTextA[13].Top:=74{86}+78{88}+78{88};
     StaticTextA[14].Caption:='ext.';
     StaticTextA[14].Top:=34{42}+78{88}+78{88}+78{88};
     StaticTextA[15].Caption:='4';
     StaticTextA[15].Top:=54{64}+78{88}+78{88}+78{88};
     StaticTextA[16].Caption:='2/3';
     StaticTextA[16].Top:=74{86}+78{88}+78{88}+78{88};
     for i:=17 to 20 do StaticTextA[i].Font.Style:=[fsBold];
     for i:=17 to 20 do StaticTextA[i].Font.Size:=5;
     for i:=17 to 20 do StaticTextA[i].Font.Name:='MS Sans Serif';
     StaticTextA[17].Caption:='AMPA:';
     StaticTextA[17].Top:=16{20};
     StaticTextA[18].Caption:='GABA:';
     StaticTextA[18].Top:=16{20}+78{88};
     StaticTextA[19].Caption:='NMDA:';
     StaticTextA[19].Top:=16{20}+78{88}+78{88};
     StaticTextA[20].Caption:='GABB:';
     StaticTextA[20].Top:=16{20}+78{88}+78{88}+78{88};
  END ELSE BEGIN
     for i:=1 to 4 do StaticTextA[i].Left:=55;
     StaticTextA[1].Caption:='P          I           P23        I23';
     StaticTextA[1].Top:=20;
     StaticTextA[2].Caption:='P          I           P23        I23';
     StaticTextA[2].Top:=20+88;
     StaticTextA[3].Caption:='P          I           P23        I23';
     StaticTextA[3].Top:=20+88+88;
     StaticTextA[4].Caption:='P          I           P23        I23';
     StaticTextA[4].Top:=20+88+88+88;
     StaticTextA[5].Caption:='ext.';
     StaticTextA[5].Top:=42;
     StaticTextA[6].Caption:='4';
     StaticTextA[6].Top:=64;
     StaticTextA[7].Caption:='2/3';
     StaticTextA[7].Top:=86;
     StaticTextA[8].Caption:='ext.';
     StaticTextA[8].Top:=42+88;
     StaticTextA[9].Caption:='4';
     StaticTextA[9].Top:=64+88;
     StaticTextA[10].Caption:='2/3';
     StaticTextA[10].Top:=86+88;
     StaticTextA[11].Caption:='ext.';
     StaticTextA[11].Top:=42+88+88;
     StaticTextA[12].Caption:='4';
     StaticTextA[12].Top:=64+88+88;
     StaticTextA[13].Caption:='2/3';
     StaticTextA[13].Top:=86+88+88;
     StaticTextA[14].Caption:='ext.';
     StaticTextA[14].Top:=42+88+88+88;
     StaticTextA[15].Caption:='4';
     StaticTextA[15].Top:=64+88+88+88;
     StaticTextA[16].Caption:='2/3';
     StaticTextA[16].Top:=86+88+88+88;
     for i:=17 to 20 do StaticTextA[i].Font.Style:=[fsBold];
     for i:=17 to 20 do StaticTextA[i].Font.Size:=5;
     for i:=17 to 20 do StaticTextA[i].Font.Name:='MS Sans Serif';
     StaticTextA[17].Caption:='AMPA:';
     StaticTextA[17].Top:=20;
     StaticTextA[18].Caption:='GABA:';
     StaticTextA[18].Top:=20+88;
     StaticTextA[19].Caption:='NMDA:';
     StaticTextA[19].Top:=20+88+88;
     StaticTextA[20].Caption:='GABB:';
     StaticTextA[20].Top:=20+88+88+88;
  END;
  { DDSpinEdits }
  DDSpinEdit1:=TDDSpinEdit.Create(self);
  DDSpinEdit1.Parent:=GroupBox1;
  DDSpinEdit1.Top:=0;
  DDSpinEdit1.Width:=40;
  DDSpinEdit1.Left:=50;
  DDSpinEdit1.Value:=NSyn;
  DDSpinEdit1.StrDecimals:=0;
  DDSpinEdit1.Font.Name:='MS Sans Serif';
  DDSpinEdit1.Font.Size:=6;
  DDSpinEdit1.OnChange:=UpClick;
  DDSpinEdit1.Visible:=false;
  for i:=1 to MaxNSyn do begin
      DDSpinEditA[i]:=TDDSpinEdit.Create(self);
      DDSpinEditA[i].Parent:=GroupBox1;
      DDSpinEditA[i].Top:=20+25*(i-1);  if IfSmallScreen then
      DDSpinEditA[i].Top:=16+22*(i-1);
      DDSpinEditA[i].Width:=59;         if IfSmallScreen then
      DDSpinEditA[i].Width:=50;
      DDSpinEditA[i].Left:=5;
      DDSpinEditA[i].Font.Name:='MS Sans Serif';//'Times New Roman';Microsoft Sans Serif';
      DDSpinEditA[i].Font.Size:=7;
      DDSpinEditA[i].Font.Style:=[fsBold];
      DDSpinEditA[i].StrDecimals:=3;
      DDSpinEditA[i].OnChange:=UpClick;
      DDSpinEditA[i].OnDblClick:=Zero;
      DDSpinEditA[i].Increment:=0.01;
  end;
  with GroupBox1 do begin
    Left := 1;
    Top := 2;
    Width := 254;
    Height := 300+78{88};
    Caption := 'Synaptic conductances:';//'gsyn:';
    Font.Charset := DEFAULT_CHARSET;
    Font.Color := clWindowText;
    Font.Height := -13;
    Font.Name := 'MS Sans Serif';
    Font.Style := [];
    ParentFont := true;
    TabOrder := 0;
  end;
end;

{procedure TgsynC.Change;
begin
  inherited Changed;
  if Assigned(FOnChange) then FOnChange(Self);
end;}

procedure TgsynC.UpClick (Sender: TObject);
begin
//  Value := Value + FIncrement;
  if Assigned(FOnChange) then FOnChange(self);
end;

procedure TgsynC.DblClick (Sender: TObject);
begin
  if Assigned(FOnDblClick) then FOnDblClick(self);
end;

procedure TgsynC.MyMouseDown (Sender: TObject);
begin
  if Assigned(FOnMouseDown) then FOnMouseDown(self);
end;

procedure TgsynC.Zero (Sender: TObject);
begin
end;

procedure TgsynC.DDSpinEdit1Change(Sender: TObject);
begin
  NSyn:=trunc(DDSpinEdit1.Value);
  Renew;
end;

procedure TgsynC.Renew;
var i :integer;
begin
  NSyn:=trunc(DDSpinEdit1.Value);
  for i:=1 to NSyn do begin
      DDSpinEditA[i].Visible:=true;
  end;
  for i:=NSyn+1 to MaxNSyn do begin
      DDSpinEditA[i].Visible:=false;
  end;
  GroupBox1.Height := 25+25*NSyn;
end;


end.
