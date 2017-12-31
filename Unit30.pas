unit Unit30;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DDSpinEdit,
  Init, Unit3;

type
  TForm30 = class(TForm)
    GroupBox6: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label1: TLabel;
    DDSpinEdit1: TDDSpinEdit;
    DDSpinEdit2: TDDSpinEdit;
    DDSpinEdit3: TDDSpinEdit;
    DDSpinEdit4: TDDSpinEdit;
    DDSpinEdit5: TDDSpinEdit;
    DDSpinEdit6: TDDSpinEdit;
    DDSpinEdit7: TDDSpinEdit;
    DDSpinEdit8: TDDSpinEdit;
    DDSpinEdit9: TDDSpinEdit;
    DDSpinEdit10: TDDSpinEdit;
    DDSpinEdit11: TDDSpinEdit;
    DDSpinEdit12: TDDSpinEdit;
    DDSpinEdit13: TDDSpinEdit;
    DDSpinEdit14: TDDSpinEdit;
    DDSpinEdit15: TDDSpinEdit;
    DDSpinEdit16: TDDSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure DDSpinEdit1Change(Sender: TObject);
    procedure DDSpinEdit2Change(Sender: TObject);
    procedure DDSpinEdit3Change(Sender: TObject);
    procedure DDSpinEdit4Change(Sender: TObject);
    procedure DDSpinEdit5Change(Sender: TObject);
    procedure DDSpinEdit6Change(Sender: TObject);
    procedure DDSpinEdit7Change(Sender: TObject);
    procedure DDSpinEdit8Change(Sender: TObject);
    procedure DDSpinEdit9Change(Sender: TObject);
    procedure DDSpinEdit10Change(Sender: TObject);
    procedure DDSpinEdit11Change(Sender: TObject);
    procedure DDSpinEdit12Change(Sender: TObject);
    procedure DDSpinEdit13Change(Sender: TObject);
    procedure DDSpinEdit14Change(Sender: TObject);
    procedure DDSpinEdit15Change(Sender: TObject);
    procedure DDSpinEdit16Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form30: TForm30;

implementation

{$R *.dfm}

procedure Get_r_axon_from_Form;
begin
  if Form30.DDSpinEdit1.Value =0 then Form30.DDSpinEdit1.Value :=Form3.DDSpinEdit24.Value;
  if Form30.DDSpinEdit2.Value =0 then Form30.DDSpinEdit2.Value :=Form3.DDSpinEdit26.Value;
  if Form30.DDSpinEdit3.Value =0 then Form30.DDSpinEdit3.Value :=Form3.DDSpinEdit24.Value;
  if Form30.DDSpinEdit4.Value =0 then Form30.DDSpinEdit4.Value :=Form3.DDSpinEdit26.Value;
  if Form30.DDSpinEdit5.Value =0 then Form30.DDSpinEdit5.Value :=Form3.DDSpinEdit25.Value;
  if Form30.DDSpinEdit6.Value =0 then Form30.DDSpinEdit6.Value :=Form3.DDSpinEdit27.Value;
  if Form30.DDSpinEdit7.Value =0 then Form30.DDSpinEdit7.Value :=Form3.DDSpinEdit25.Value;
  if Form30.DDSpinEdit8.Value =0 then Form30.DDSpinEdit8.Value :=Form3.DDSpinEdit27.Value;
  if Form30.DDSpinEdit9.Value =0 then Form30.DDSpinEdit9.Value :=Form3.DDSpinEdit24.Value;
  if Form30.DDSpinEdit10.Value=0 then Form30.DDSpinEdit10.Value:=Form3.DDSpinEdit26.Value;
  if Form30.DDSpinEdit11.Value=0 then Form30.DDSpinEdit11.Value:=Form3.DDSpinEdit24.Value;
  if Form30.DDSpinEdit12.Value=0 then Form30.DDSpinEdit12.Value:=Form3.DDSpinEdit26.Value;
  if Form30.DDSpinEdit13.Value=0 then Form30.DDSpinEdit13.Value:=Form3.DDSpinEdit25.Value;
  if Form30.DDSpinEdit14.Value=0 then Form30.DDSpinEdit14.Value:=Form3.DDSpinEdit27.Value;
  if Form30.DDSpinEdit15.Value=0 then Form30.DDSpinEdit15.Value:=Form3.DDSpinEdit25.Value;
  if Form30.DDSpinEdit16.Value=0 then Form30.DDSpinEdit16.Value:=Form3.DDSpinEdit27.Value;
  r_axon[1,1]:=Form30.DDSpinEdit1.Value/1e6; {mum}
  r_axon[1,2]:=Form30.DDSpinEdit2.Value/1e6; {mum}
  r_axon[1,3]:=Form30.DDSpinEdit3.Value/1e6; {mum}
  r_axon[1,4]:=Form30.DDSpinEdit4.Value/1e6; {mum}
  r_axon[2,1]:=Form30.DDSpinEdit5.Value/1e6; {mum}
  r_axon[2,2]:=Form30.DDSpinEdit6.Value/1e6; {mum}
  r_axon[2,3]:=Form30.DDSpinEdit7.Value/1e6; {mum}
  r_axon[2,4]:=Form30.DDSpinEdit8.Value/1e6; {mum}
  r_axon[3,1]:=Form30.DDSpinEdit9.Value/1e6; {mum}
  r_axon[3,2]:=Form30.DDSpinEdit10.Value/1e6; {mum}
  r_axon[3,3]:=Form30.DDSpinEdit11.Value/1e6; {mum}
  r_axon[3,4]:=Form30.DDSpinEdit12.Value/1e6; {mum}
  r_axon[4,1]:=Form30.DDSpinEdit13.Value/1e6; {mum}
  r_axon[4,2]:=Form30.DDSpinEdit14.Value/1e6; {mum}
  r_axon[4,3]:=Form30.DDSpinEdit15.Value/1e6; {mum}
  r_axon[4,4]:=Form30.DDSpinEdit16.Value/1e6; {mum}
end;

procedure TForm30.FormShow(Sender: TObject);
begin
  Get_r_axon_from_Form;
end;

procedure TForm30.DDSpinEdit1Change(Sender: TObject);
begin
  Get_r_axon_from_Form;
end;

procedure TForm30.DDSpinEdit2Change(Sender: TObject);
begin
  Get_r_axon_from_Form;
end;

procedure TForm30.DDSpinEdit3Change(Sender: TObject);
begin
  Get_r_axon_from_Form;
end;

procedure TForm30.DDSpinEdit4Change(Sender: TObject);
begin
  Get_r_axon_from_Form;
end;

procedure TForm30.DDSpinEdit5Change(Sender: TObject);
begin
  Get_r_axon_from_Form;
end;

procedure TForm30.DDSpinEdit6Change(Sender: TObject);
begin
  Get_r_axon_from_Form;
end;

procedure TForm30.DDSpinEdit7Change(Sender: TObject);
begin
  Get_r_axon_from_Form;
end;

procedure TForm30.DDSpinEdit8Change(Sender: TObject);
begin
  Get_r_axon_from_Form;
end;

procedure TForm30.DDSpinEdit9Change(Sender: TObject);
begin
  Get_r_axon_from_Form;
end;

procedure TForm30.DDSpinEdit10Change(Sender: TObject);
begin
  Get_r_axon_from_Form;
end;

procedure TForm30.DDSpinEdit11Change(Sender: TObject);
begin
  Get_r_axon_from_Form;
end;

procedure TForm30.DDSpinEdit12Change(Sender: TObject);
begin
  Get_r_axon_from_Form;
end;

procedure TForm30.DDSpinEdit13Change(Sender: TObject);
begin
  Get_r_axon_from_Form;
end;

procedure TForm30.DDSpinEdit14Change(Sender: TObject);
begin
  Get_r_axon_from_Form;
end;

procedure TForm30.DDSpinEdit15Change(Sender: TObject);
begin
  Get_r_axon_from_Form;
end;

procedure TForm30.DDSpinEdit16Change(Sender: TObject);
begin
  Get_r_axon_from_Form;
end;

end.
