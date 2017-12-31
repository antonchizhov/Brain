unit Unit18;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DDSpinEdit,
  TeEngine, Series, ExtCtrls, TeeProcs, Chart,
  slice_2DO,ConnectionsO,t_dtO,Init,MathMyO,ColumnO,
  Unit3,typeNrnParsO;

type
  TForm18 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DDSpinEdit1: TDDSpinEdit;
    DDSpinEdit2: TDDSpinEdit;
    DDSpinEdit3: TDDSpinEdit;
    DDSpinEdit4: TDDSpinEdit;
    ComboBox1: TComboBox;
    Label4: TLabel;
    ComboBox2: TComboBox;
    Label5: TLabel;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    Chart1: TChart;
    Series1: TLineSeries;
    Button1: TButton;
    ComboBox6: TComboBox;
    DDSpinEdit5: TDDSpinEdit;
    Label6: TLabel;
    CheckBox1: TCheckBox;
    Chart2: TChart;
    Series2: TLineSeries;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form18: TForm18;

  function FieldToSee(ACol :TColumn) :double;
  procedure RunInspector;

implementation

{$R *.dfm}

function FieldToSee(ACol :TColumn) :double;
var {i,j,}ip,jp,iSyn,its  :integer;
    f,S                 :double;
    SeeColumn           :TColumn;
begin
  FieldToSee:=0;
//  i   :=iMinMod(ni,trunc(Form18.DDSpinEdit1.Value));
//  j   :=iMinMod(nj,trunc(Form18.DDSpinEdit2.Value));
  ip  :=iMinMod(4, trunc(Form18.DDSpinEdit3.Value));
  its :=trunc(Form18.DDSpinEdit4.Value);
  if (its<0)or(its>Nts[2-ip mod 2]) then its:=Nts[2-ip mod 2];
  iSyn:=iMinMod(NSyn,iOfSyn(Form18.ComboBox3.Items[Form18.ComboBox3.ItemIndex]));
  jp  :=iMinMod(4, trunc(Form18.DDSpinEdit5.Value));
  //Form18.DDSpinEdit3.Enabled:=false;
  Form18.DDSpinEdit4.Enabled:=false;
  //Form18.DDSpinEdit5.Enabled:=false;
{10.10.2013}//  if Columns[i,j]<>nil then SeeColumn:=Columns[i,j] else SeeColumn:=AColumn;
{10.10.2013} SeeColumn:=ACol;
  if SeeColumn=nil then EXIT; 
  { "See variable of" }
  case Form18.ComboBox1.ItemIndex of
  {See variable of Column}
  0: begin
       Form18.ComboBox2.Visible:=false;
       Form18.ComboBox4.Visible:=false;
       Form18.ComboBox5.Visible:=false;
       Form18.ComboBox6.Visible:=true;
       Form18.ComboBox3.Enabled:=false;
       Form18.ComboBox5.Enabled:=true;
       with SeeColumn do
       case Form18.ComboBox6.ItemIndex of
       0: f:=rext       ;
       1: f:=Q[ip]      ;
       2: f:=dQdt[ip]   ;
       3: f:=r[ip,jp]   ;
       4: f:=rn[ip,jp]  ;
       5: f:=rold[ip,jp];
       6: f:=u[ip,jp]   ;
       7: f:=un[ip,jp]  ;
       8: f:=v[ip,jp]   ;
       9: f:=vn[ip,jp]  ;
       10: f:=w[ip,jp]  ;
       end;
     end;
  {See variable of Population}
  1: begin
       Form18.ComboBox3.Enabled:=false;
       Form18.ComboBox4.Visible:=false;
       Form18.ComboBox5.Visible:=false;
       Form18.ComboBox6.Visible:=false;
       Form18.ComboBox2.Visible:=true;
       Form18.DDSpinEdit3.Enabled:=true;
       S:=SeeColumn.Pop[ip].PP.NP.Square;
       with SeeColumn.Pop[ip] do
       case Form18.ComboBox2.ItemIndex of
       0: f:=uE   *S*1e9; {pA}
       1: f:=sE   ;
       2: f:=uI   *S*1e9; {pA}
       3: f:=sI   ;
       4: f:=(uE+uI)*S*1e9; {pA}
       5: f:=sE+sI;
       6: f:=tt   ;
       7: f:=Iind ;
       8: f:=nu   ;
       9: f:=Isyn ; {pA}
       10: f:=U   *1e3;
       11: f:=dUdt;
       12: f:=Bum[1];
       13: f:=tBum;
       14: f:=Norm;
       15: f:=uE - sE*(U-Vus) + Nrn[PP.Nts].NV.gNMDA*(Nrn[PP.Nts].NV.V-Nrn[PP.Nts].NP.VNMDA);  {IsynE}
       16: f:=uI - sI*(U-Vus);  {IsynI}
       17: f:=sE/(PP.NP.gL+sE+sI); {sE/(gL+ss)}
       18: f:=mean_U *1e3;
       19: f:=VT[PP.Nts]*1e3;
       end;
     end;
  {See variable of Neuron}
  2: begin
       Form18.ComboBox2.Visible:=false;
       Form18.ComboBox3.Enabled:=false;
       Form18.ComboBox5.Visible:=false;
       Form18.ComboBox6.Visible:=false;
       Form18.ComboBox4.Visible:=true;
       Form18.DDSpinEdit3.Enabled:=true;
       Form18.DDSpinEdit4.Enabled:=true;
       S:=SeeColumn.Pop[ip].Nrn[its].NP.Square;
       with SeeColumn.Pop[ip].Nrn[its].NV do
       case Form18.ComboBox4.ItemIndex of
       0: f:=indic        ;
       1: f:=V            *1e3;
       2: f:=gActive  ;
       3: f:=Ca           ;
       4: f:=Vold         *1e3;
       5: f:=Im           *S*1e9; {pA}
       6: f:=PSC          ;
       7: f:=Isyn         *S*1e9; {pA}
       8: f:=IsynE        *S*1e9; {pA}
       9: f:=IsynI        *S*1e9; {pA}
       10:f:=IsynE_old    *S*1e9; {pA}
       11: f:=IsynI_old   *S*1e9; {pA}
       12: f:=Vd          *1e3;
       13: f:=DVDt        ;
       14: f:=ddV         ;
       15: f:=Thr         *1e3;
       16: f:=tAP         *1e3;
       17: f:=ISI0        ;
       18: f:=mmR         ;
       19: f:=hhR         ;
       20: f:=mm          ;
       21: f:=nn          ;
       22: f:=hh          ;
       23: f:=ii          ;
       24: f:=yK          ;
       25: f:=yKA         ;
       26: f:=nM          ;
       27: f:=nA          ;
       28: f:=lA          ;
       29: f:=yH          ;
       30: f:=mCaH        ;
       31: f:=hCaH        ;
       32: f:=kCaH        ;
       33: f:=nKCa        ;
       34: f:=wADP        ;
       35: f:=wAHP        ;
       36: f:=mCaT        ;
       37: f:=hCaT        ;
       38: f:=mBst        ;
       39: f:=mNaP        ;
       40: f:=xD          ;
       41: f:=yD          ;
       42: f:=gNMDA       ;
       end;
     end;
  {See variable of Synapse}
  3: begin
       Form18.ComboBox2.Visible:=false;
       Form18.ComboBox4.Visible:=false;
       Form18.ComboBox6.Visible:=false;
       Form18.ComboBox5.Visible:=true;
       Form18.ComboBox3.Enabled:=true;
       with SeeColumn.Syn[iSyn] do
       case Form18.ComboBox5.ItemIndex of
       0: f:=g            ;
       1: f:=m            ;
       2: f:=U            ;
       3: f:=W            ;
       4: f:=eM           ;
       5: f:=UeM          ;
       6: f:=WeM          ;
       7: f:=xD           ;
       end;
     end;
  end;
  FieldToSee:=f;
end;

procedure RunInspector;
var i,j,i_onForm18 :integer;
    f :double;
begin
  i   :=iMinMod(ni,trunc(Form18.DDSpinEdit1.Value));
  j   :=iMinMod(nj,trunc(Form18.DDSpinEdit2.Value));
  if Columns[i,j]=nil then f:=FieldToSee(AColumn)
                      else f:=FieldToSee(Columns[i,j]);
  Form18.Series1.AddXY(t*1e3,f);
  if (Form18.CheckBox1.Checked) then begin {Inspector}
      Form18.Series2.Clear;
      for i:=0 to ni+1 do begin
//          i_onForm18:=trunc(Form18.DDSpinEdit1.Value);
//          Form18.DDSpinEdit1.Value:=i;
          Form18.Series2.AddXY(i, FieldToSee(Columns[i,j]));
//          Form18.DDSpinEdit1.Value:=i_onForm18;
      end;
  end;
end;

procedure TForm18.Button1Click(Sender: TObject);
begin
  Application.ProcessMessages;
  Form18.Series1.Clear;
end;

procedure TForm18.CheckBox1Click(Sender: TObject);
begin
  Form18.Chart2.Visible:=Form18.CheckBox1.Checked;
end;

procedure TForm18.FormShow(Sender: TObject);
begin
  Form18.DDSpinEdit1.Value:=Form3.DDSpinEdit10.Value;
  Form18.DDSpinEdit2.Value:=Form3.DDSpinEdit11.Value;
end;

end.











