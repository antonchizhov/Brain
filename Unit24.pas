unit Unit24;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  Unit3,Init,
  DDSpinEdit;

type
  TForm24 = class(TForm)
    CheckBox1: TCheckBox;
    Memo1: TMemo;
    Button1: TButton;
    DDSpinEdit1: TDDSpinEdit;
    DDSpinEdit2: TDDSpinEdit;
    Label1: TLabel;
    Button2: TButton;
    CheckBox2: TCheckBox;
    Button3: TButton;
    ComboBox1: TComboBox;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form24: TForm24;

function IfBlankedPW(iPW,jPW :integer) :boolean;
function IfOrthogonalPW(iPW,jPW :integer) :boolean;

implementation
uses Stimulation_2D;

{$R *.dfm}

function IfBlankedPW(iPW,jPW :integer) :boolean;
var i,j,ib :integer;
begin
  IfBlankedPW:=false;
  if not(Form24.CheckBox1.Checked) then EXIT;
  ib:=0;
  repeat ib:=ib+1;
    i:=BlankedPW[ib,1];
    j:=BlankedPW[ib,2];
  until ((i=iPW)and(j=jPW)) or ((i=0)and(j=0)) or (ib=NofPWmax);
  if (i=iPW)and(j=jPW) then IfBlankedPW:=true;
end;

function IfOrthogonalPW(iPW,jPW :integer) :boolean;
var i,j,ib :integer;
begin
  IfOrthogonalPW:=false;
  if not(Form24.CheckBox2.Checked) then EXIT;
  ib:=0;
  repeat ib:=ib+1;
    i:=BlankedPW[ib,1];
    j:=BlankedPW[ib,2];
  until ((i=iPW)and(j=jPW)) or ((i=0)and(j=0)) or (ib=NofPWmax);
  if (i=iPW)and(j=jPW) then IfOrthogonalPW:=true;
end;

procedure ListBlankedPWs;
{ List blanked pinwheels in Memo }
var i,j,ib,xPWCenter,yPWCenter :integer;
    t1,t2,t3,t4 :string;
begin
  Form24.Memo1.Clear;
  Form24.Memo1.Lines.Add('List of coordinates of blanked pinwheels - BlankedPW');
  ib:=0;
  repeat ib:=ib+1;
    i:=BlankedPW[ib,1];
    j:=BlankedPW[ib,2];
    Str(i:3,t1);
    Str(j:3,t2);
    xPWCenter:=(2*i-1)*rPW;
    yPWCenter:=(2*j-1)*rPW;
    Str(xPWCenter:3,t3);
    Str(yPWCenter:3,t4);
    if not((i=0)and(j=0)) then
       form24.Memo1.Lines.Add('iPW,jPW= '+t1+', '+t2+'  at  i,j= '+t3+', '+t4);
  until ((i=0)and(j=0)) or (ib=NofPWmax);
end;

procedure TForm24.CheckBox1Click(Sender: TObject);
var iPW00,jPW00,dum1,dum2 :integer;
begin
  Form24.Memo1.Clear;
  if Form24.CheckBox1.Checked then  Form3.Button5.Font.Size:=12
                              else  Form3.Button5.Font.Size:=8;
  if Form24.CheckBox1.Checked then begin
{     PinWheelCoordinates_near_ij(trunc(ni/2),trunc(nj/2), iPW00,jPW00,dum1,dum2);
     BlankedPW[1,1]:=iPW00;
     BlankedPW[1,2]:=jPW00;}
     ListBlankedPWs;
  end;
end;

procedure TForm24.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form24.CheckBox1.Checked:=false;
end;

procedure TForm24.FormShow(Sender: TObject);
begin
  { List blanked pinwheels in Memo }
  ListBlankedPWs;
end;

procedure AddPWToBlankList(iPW,jPW :integer);
{ Add PW to blank-list }
var ib :integer;
begin
  { Find last element }
  ib:=0;
  repeat ib:=ib+1;
  until ((BlankedPW[ib,1]=0)and(BlankedPW[ib,2]=0)) or (ib=NofPWmax);
  BlankedPW[ib,1]:=iPW;
  BlankedPW[ib,2]:=jPW;
end;

procedure TForm24.Button1Click(Sender: TObject);
{ Add PW to blank-list }
var iPW,jPW :integer;
begin
  iPW:=trunc(Form24.DDSpinEdit1.Value);
  jPW:=trunc(Form24.DDSpinEdit2.Value);
  AddPWToBlankList(iPW,jPW);
  ListBlankedPWs;
end;

procedure TForm24.Button2Click(Sender: TObject);
{ Delete PW from blank-list }
var i,j,ib :integer;
begin
  ib:=0;
  repeat ib:=ib+1;
    i:=trunc(Form24.DDSpinEdit1.Value);
    j:=trunc(Form24.DDSpinEdit2.Value);
  until ((i=BlankedPW[ib,1])and(j=BlankedPW[ib,2])) or (ib=NofPWmax);
  if (i=BlankedPW[ib,1])and(j=BlankedPW[ib,2]) then begin
      { Shift array, thus deleteng ib-element }
      repeat ib:=ib+1;
        i:=BlankedPW[ib,1];
        j:=BlankedPW[ib,2];
        BlankedPW[ib-1,1]:=BlankedPW[ib,1];
        BlankedPW[ib-1,2]:=BlankedPW[ib,2];
      until ((i=0)and(j=0)) or (ib=NofPWmax);
  end;
  ListBlankedPWs;
end;

procedure TForm24.Button3Click(Sender: TObject);
{ All }
var i,j,iPW,jPW,charge    :integer;
    dum3,dum4,dum5        :double;
begin
  { Add all possible pinwheels to the list of blanked ones. }
  Form24.CheckBox1.Checked:=true; // Check "Blank stimulus for selected PWs"
  for i:=0 to ni+1 do begin
      for j:=0 to nj+1 do begin
          PinWheel_fi_for_ij(i,j,0, dum3,dum4,dum5, iPW,jPW,charge);
          if IfBlankedPW(iPW,jPW)=false then begin
             AddPWToBlankList(iPW,jPW);
          end;
      end;
  end;
  ListBlankedPWs;
end;

end.
