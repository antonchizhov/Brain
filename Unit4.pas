unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Classes,
  Graphics, Controls, Forms, Dialogs,
  StdCtrls, DDSpinEdit,
  Init,t_dtO,mathMyO,Correspond,ExtCtrls, {Shape1,}
  gsynC, ComCtrls, Menus;

type
  TForm4 = class(TForm)
    DDSpinEdit7: TDDSpinEdit;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    GroupBox2: TGroupBox;
    StaticText16: TStaticText;
    StaticText17: TStaticText;
    StaticText18: TStaticText;
    StaticText19: TStaticText;
    StaticText20: TStaticText;
    StaticText21: TStaticText;
    DDSpinEdit22: TDDSpinEdit;
    DDSpinEdit23: TDDSpinEdit;
    DDSpinEdit24: TDDSpinEdit;
    DDSpinEdit25: TDDSpinEdit;
    DDSpinEdit26: TDDSpinEdit;
    DDSpinEdit27: TDDSpinEdit;
    DDSpinEdit28: TDDSpinEdit;
    DDSpinEdit29: TDDSpinEdit;
    DDSpinEdit30: TDDSpinEdit;
    DDSpinEdit31: TDDSpinEdit;
    DDSpinEdit32: TDDSpinEdit;
    DDSpinEdit33: TDDSpinEdit;
    DDSpinEdit34: TDDSpinEdit;
    DDSpinEdit35: TDDSpinEdit;
    DDSpinEdit36: TDDSpinEdit;
    DDSpinEdit37: TDDSpinEdit;
    StaticText22: TStaticText;
    CheckBox5: TCheckBox;
    DDSpinEdit38: TDDSpinEdit;
    StaticText23: TStaticText;
    DDSpinEdit39: TDDSpinEdit;
    DDSpinEdit40: TDDSpinEdit;
    DDSpinEdit41: TDDSpinEdit;
    DDSpinEdit44: TDDSpinEdit;
    StaticText26: TStaticText;
    CheckBox6: TCheckBox;
    DDSpinEdit45: TDDSpinEdit;
    StaticText27: TStaticText;
    GroupBox3: TGroupBox;
    DDSpinEdit46: TDDSpinEdit;
    StaticText28: TStaticText;
    StaticText29: TStaticText;
    DDSpinEdit47: TDDSpinEdit;
    DDSpinEdit48: TDDSpinEdit;
    StaticText30: TStaticText;
    GroupBox4: TGroupBox;
    StaticText24: TStaticText;
    DDSpinEdit42: TDDSpinEdit;
    DDSpinEdit49: TDDSpinEdit;
    DDSpinEdit50: TDDSpinEdit;
    StaticText6: TStaticText;
    DDSpinEdit51: TDDSpinEdit;
    DDSpinEdit52: TDDSpinEdit;
    DDSpinEdit2: TDDSpinEdit;
    StaticText5: TStaticText;
    DDSpinEdit5: TDDSpinEdit;
    DDSpinEdit53: TDDSpinEdit;
    DDSpinEdit54: TDDSpinEdit;
    StaticText31: TStaticText;
    DDSpinEdit55: TDDSpinEdit;
    StaticText40: TStaticText;
    DDSpinEdit6: TDDSpinEdit;
    StaticText41: TStaticText;
    DDSpinEdit70: TDDSpinEdit;
    GroupBox5: TGroupBox;
    DDSpinEdit71: TDDSpinEdit;
    StaticText42: TStaticText;
    DDSpinEdit73: TDDSpinEdit;
    CheckBox8: TCheckBox;
    i3_Combo: TComboBox;
    ComboBox1: TComboBox;
    DDSpinEdit80: TDDSpinEdit;
    DDSpinEdit81: TDDSpinEdit;
    StaticText52: TStaticText;
    StaticText53: TStaticText;
    GroupBox7: TGroupBox;
    DDSpinEdit83: TDDSpinEdit;
    DDSpinEdit84: TDDSpinEdit;
    StaticText56: TStaticText;
    DDSpinEdit85: TDDSpinEdit;
    DDSpinEdit86: TDDSpinEdit;
    StaticText57: TStaticText;
    DDSpinEdit87: TDDSpinEdit;
    DDSpinEdit88: TDDSpinEdit;
    CheckBox15: TCheckBox;
    GroupBox8: TGroupBox;
    StaticText58: TStaticText;
    DDSpinEdit89: TDDSpinEdit;
    StaticText59: TStaticText;
    DDSpinEdit90: TDDSpinEdit;
    StaticText60: TStaticText;
    GroupBox9: TGroupBox;
    DDSpinEdit92: TDDSpinEdit;
    DDSpinEdit106: TDDSpinEdit;
    DDSpinEdit107: TDDSpinEdit;
    StaticText67: TStaticText;
    gsynC1: TgsynC;
    Button4: TButton;
    DDSpinEdit108: TDDSpinEdit;
    DDSpinEdit109: TDDSpinEdit;
    StaticText68: TStaticText;
    DDSpinEdit110: TDDSpinEdit;
    DDSpinEdit111: TDDSpinEdit;
    StaticText69: TStaticText;
    CheckBox18: TCheckBox;
    DDSpinEdit116: TDDSpinEdit;
    DDSpinEdit4: TDDSpinEdit;
    GroupBox6: TGroupBox;
    DDSpinEdit10: TDDSpinEdit;
    DDSpinEdit11: TDDSpinEdit;
    StaticText9: TStaticText;
    DDSpinEdit13: TDDSpinEdit;
    StaticText12: TStaticText;
    GroupBox10: TGroupBox;
    StaticText1: TStaticText;
    DDSpinEdit1: TDDSpinEdit;
    StaticText3: TStaticText;
    DDSpinEdit3: TDDSpinEdit;
    StaticText38: TStaticText;
    DDSpinEdit67: TDDSpinEdit;
    StaticText15: TStaticText;
    DDSpinEdit21: TDDSpinEdit;
    GroupBox11: TGroupBox;
    StaticText35: TStaticText;
    DDSpinEdit63: TDDSpinEdit;
    StaticText36: TStaticText;
    DDSpinEdit64: TDDSpinEdit;
    ComboBox2: TComboBox;
    CheckBox11: TCheckBox;
    ComboBox3: TComboBox;
    DDSpinEdit12: TDDSpinEdit;
    StaticText11: TStaticText;
    DDSpinEdit17: TDDSpinEdit;
    DDSpinEdit18: TDDSpinEdit;
    Label4: TLabel;
    TrackBar3: TTrackBar;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    PopupMenu3: TPopupMenu;
    PopupMenu4: TPopupMenu;
    PopupMenu5: TPopupMenu;
    PopupMenu6: TPopupMenu;
    PopupMenu7: TPopupMenu;
    PopupMenu8: TPopupMenu;
    ComboBox4: TComboBox;
    TrackBar1: TTrackBar;
    GroupBox12: TGroupBox;
    Label3: TLabel;
    DDSpinEdit16: TDDSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    DDSpinEdit14: TDDSpinEdit;
    DDSpinEdit15: TDDSpinEdit;
    Label5: TLabel;
    DDSpinEdit19: TDDSpinEdit;
    StaticText33: TStaticText;
    StaticText70: TStaticText;
    DDSpinEdit58: TDDSpinEdit;
    DDSpinEdit59: TDDSpinEdit;
    DDSpinEdit112: TDDSpinEdit;
    DDSpinEdit113: TDDSpinEdit;
    GroupBox13: TGroupBox;
    CheckBox9: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox10: TCheckBox;
    StaticText65: TStaticText;
    DDSpinEdit96: TDDSpinEdit;
    DDSpinEdit97: TDDSpinEdit;
    StaticText71: TStaticText;
    DDSpinEdit114: TDDSpinEdit;
    DDSpinEdit115: TDDSpinEdit;
    StaticText2: TStaticText;
    StaticText55: TStaticText;
    DDSpinEdit60: TDDSpinEdit;
    DDSpinEdit61: TDDSpinEdit;
    StaticText34: TStaticText;
    DDSpinEdit68: TDDSpinEdit;
    DDSpinEdit69: TDDSpinEdit;
    StaticText39: TStaticText;
    StaticText66: TStaticText;
    DDSpinEdit98: TDDSpinEdit;
    StaticText7: TStaticText;
    StaticText25: TStaticText;
    DDSpinEdit43: TDDSpinEdit;
    Label6: TLabel;
    DDSpinEdit20: TDDSpinEdit;
    Label7: TLabel;
    DDSpinEdit62: TDDSpinEdit;
    DDSpinEdit65: TDDSpinEdit;
    StaticText10: TStaticText;
    ComboBox5: TComboBox;
    GroupBox14: TGroupBox;
    StaticText13: TStaticText;
    DDSpinEdit66: TDDSpinEdit;
    DDSpinEdit75: TDDSpinEdit;
    StaticText14: TStaticText;
    StaticText37: TStaticText;
    DDSpinEdit76: TDDSpinEdit;
    CheckBox19: TCheckBox;
    CheckBox20: TCheckBox;
    DDSpinEdit56: TDDSpinEdit;
    DDSpinEdit57: TDDSpinEdit;
    DDSpinEdit74: TDDSpinEdit;
    StaticText32: TStaticText;
    StaticText44: TStaticText;
    CheckBox12: TCheckBox;
    StaticText45: TStaticText;
    ComboBox6: TComboBox;
    CheckBox13: TCheckBox;
    GroupBox15: TGroupBox;
    CheckBox21: TCheckBox;
    Label8: TLabel;
    DDSpinEdit77: TDDSpinEdit;
    DDSpinEdit78: TDDSpinEdit;
    StaticText46: TStaticText;
    DDSpinEdit79: TDDSpinEdit;
    StaticText47: TStaticText;
    StaticText48: TStaticText;
    DDSpinEdit82: TDDSpinEdit;
    CheckBox7: TCheckBox;
    RadioGroup1: TRadioGroup;
    ComboBox7: TComboBox;
    CheckBox17: TCheckBox;
    StaticText49: TStaticText;
    StaticText50: TStaticText;
    DDSpinEdit95: TDDSpinEdit;
    DDSpinEdit99: TDDSpinEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DDSpinEdit100: TDDSpinEdit;
    StaticText51: TStaticText;
    ComboBox8: TComboBox;
    ComboBox9: TComboBox;
    StaticText54: TStaticText;
    StaticText64: TStaticText;
    GroupBox16: TGroupBox;
    CheckBox16: TCheckBox;
    StaticText62: TStaticText;
    DDSpinEdit93: TDDSpinEdit;
    DDSpinEdit94: TDDSpinEdit;
    StaticText63: TStaticText;
    DDSpinEdit9: TDDSpinEdit;
    StaticText8: TStaticText;
    StaticText61: TStaticText;
    DDSpinEdit91: TDDSpinEdit;
    StaticText4: TStaticText;
    DDSpinEdit8: TDDSpinEdit;
    Memo1: TMemo;
    DDSpinEdit101: TDDSpinEdit;
    StaticText72: TStaticText;
    CheckBox22: TCheckBox;
    GroupBox17: TGroupBox;
    DDSpinEdit102: TDDSpinEdit;
    StaticText73: TStaticText;
    StaticText74: TStaticText;
    DDSpinEdit103: TDDSpinEdit;
    StaticText75: TStaticText;
    DDSpinEdit104: TDDSpinEdit;
    DDSpinEdit105: TDDSpinEdit;
    DDSpinEdit117: TDDSpinEdit;
    DDSpinEdit118: TDDSpinEdit;
    DDSpinEdit119: TDDSpinEdit;
    StaticText76: TStaticText;
    CheckBox23: TCheckBox;
    DDSpinEdit72: TDDSpinEdit;
    CheckBox24: TCheckBox;
    DDSpinEdit120: TDDSpinEdit;
    StaticText43: TStaticText;
    CheckBox25: TCheckBox;
    procedure DDSpinEdit1Change(Sender: TObject);
    procedure DDSpinEdit2Change(Sender: TObject);
    procedure DDSpinEdit3Change(Sender: TObject);
    procedure DDSpinEdit5Change(Sender: TObject);
    procedure DDSpinEdit7Change(Sender: TObject);
    procedure DDSpinEdit21Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DDSpinEdit22Change(Sender: TObject);
    procedure DDSpinEdit23Change(Sender: TObject);
    procedure DDSpinEdit24Change(Sender: TObject);
    procedure DDSpinEdit25Change(Sender: TObject);
    procedure DDSpinEdit26Change(Sender: TObject);
    procedure DDSpinEdit27Change(Sender: TObject);
    procedure DDSpinEdit28Change(Sender: TObject);
    procedure DDSpinEdit29Change(Sender: TObject);
    procedure DDSpinEdit30Change(Sender: TObject);
    procedure DDSpinEdit31Change(Sender: TObject);
    procedure DDSpinEdit32Change(Sender: TObject);
    procedure DDSpinEdit33Change(Sender: TObject);
    procedure DDSpinEdit34Change(Sender: TObject);
    procedure DDSpinEdit35Change(Sender: TObject);
    procedure DDSpinEdit36Change(Sender: TObject);
    procedure DDSpinEdit37Change(Sender: TObject);
    procedure DDSpinEdit38Change(Sender: TObject);
    procedure DDSpinEdit39Change(Sender: TObject);
    procedure DDSpinEdit40Change(Sender: TObject);
    procedure DDSpinEdit41Change(Sender: TObject);
    procedure DDSpinEdit42Change(Sender: TObject);
    procedure DDSpinEdit43Change(Sender: TObject);
    procedure DDSpinEdit44Change(Sender: TObject);
    procedure DDSpinEdit45Change(Sender: TObject);
    procedure DDSpinEdit46Change(Sender: TObject);
    procedure DDSpinEdit47Change(Sender: TObject);
    procedure DDSpinEdit48Change(Sender: TObject);
    procedure DDSpinEdit53Change(Sender: TObject);
    procedure DDSpinEdit54Change(Sender: TObject);
    procedure DDSpinEdit52Change(Sender: TObject);
    procedure DDSpinEdit50Change(Sender: TObject);
    procedure DDSpinEdit49Change(Sender: TObject);
    procedure DDSpinEdit51Change(Sender: TObject);
    procedure DDSpinEdit56Change(Sender: TObject);
    procedure DDSpinEdit57Change(Sender: TObject);
    procedure DDSpinEdit58Change(Sender: TObject);
    procedure DDSpinEdit59Change(Sender: TObject);
    procedure DDSpinEdit60Change(Sender: TObject);
    procedure DDSpinEdit61Change(Sender: TObject);
    procedure DDSpinEdit63Change(Sender: TObject);
    procedure DDSpinEdit64Change(Sender: TObject);
    procedure DDSpinEdit67Change(Sender: TObject);
    procedure DDSpinEdit68Change(Sender: TObject);
    procedure DDSpinEdit69Change(Sender: TObject);
    procedure DDSpinEdit6Change(Sender: TObject);
    procedure DDSpinEdit70Change(Sender: TObject);
    procedure DDSpinEdit71Change(Sender: TObject);
    procedure DDSpinEdit73Change(Sender: TObject);
    procedure DDSpinEdit74Change(Sender: TObject);
    procedure i3_ComboChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DDSpinEdit80Change(Sender: TObject);
    procedure DDSpinEdit81Change(Sender: TObject);
    procedure DDSpinEdit56DblClick(Sender: TObject);
    procedure DDSpinEdit74DblClick(Sender: TObject);
    procedure DDSpinEdit55Change(Sender: TObject);
    procedure DDSpinEdit46DblClick(Sender: TObject);
    procedure DDSpinEdit83Change(Sender: TObject);
    procedure DDSpinEdit84Change(Sender: TObject);
    procedure DDSpinEdit87Change(Sender: TObject);
    procedure DDSpinEdit85Change(Sender: TObject);
    procedure DDSpinEdit88Change(Sender: TObject);
    procedure DDSpinEdit86Change(Sender: TObject);
    procedure DDSpinEdit63DblClick(Sender: TObject);
    procedure DDSpinEdit83DblClick(Sender: TObject);
    procedure DDSpinEdit84DblClick(Sender: TObject);
    procedure DDSpinEdit89DblClick(Sender: TObject);
    procedure DDSpinEdit91Change(Sender: TObject);
    procedure DDSpinEdit89Change(Sender: TObject);
    procedure DDSpinEdit90DblClick(Sender: TObject);
    procedure DDSpinEdit92DblClick(Sender: TObject);
    procedure DDSpinEdit92Change(Sender: TObject);
    procedure StaticText60DblClick(Sender: TObject);
    procedure DDSpinEdit93Change(Sender: TObject);
    procedure DDSpinEdit94Change(Sender: TObject);
    procedure DDSpinEdit93DblClick(Sender: TObject);
    procedure DDSpinEdit94DblClick(Sender: TObject);
    procedure DDSpinEdit67DblClick(Sender: TObject);
    procedure DDSpinEdit96Change(Sender: TObject);
    procedure DDSpinEdit97Change(Sender: TObject);
    procedure DDSpinEdit1DblClick(Sender: TObject);
    procedure DDSpinEdit48DblClick(Sender: TObject);
    procedure DDSpinEdit106Change(Sender: TObject);
    procedure DDSpinEdit107Change(Sender: TObject);
    procedure gsynC1Change(Sender: TObject);
    procedure gsynC1DblClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DDSpinEdit108Change(Sender: TObject);
    procedure DDSpinEdit109Change(Sender: TObject);
    procedure DDSpinEdit110Change(Sender: TObject);
    procedure DDSpinEdit111Change(Sender: TObject);
    procedure DDSpinEdit21DblClick(Sender: TObject);
    procedure DDSpinEdit112Change(Sender: TObject);
    procedure DDSpinEdit113Change(Sender: TObject);
    procedure DDSpinEdit114Change(Sender: TObject);
    procedure DDSpinEdit115Change(Sender: TObject);
    procedure DDSpinEdit116Change(Sender: TObject);
    procedure DDSpinEdit4Change(Sender: TObject);
    procedure DDSpinEdit4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DDSpinEdit2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DDSpinEdit54MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure CheckBox12Click(Sender: TObject);
    procedure DDSpinEdit8DblClick(Sender: TObject);
    procedure DDSpinEdit8Change(Sender: TObject);
    procedure DDSpinEdit91DblClick(Sender: TObject);
    procedure DDSpinEdit5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit22MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit24MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit28MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit26MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit30MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit34MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit32MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit36MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit51MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit49MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit55MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit52MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit54MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit53MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit50MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure gsynC1MouseDown(Sender: TObject);
    procedure DDSpinEdit73MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit21MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit38MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit40MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit96MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit83MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit84MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit9Change(Sender: TObject);
    procedure DDSpinEdit10Change(Sender: TObject);
    procedure DDSpinEdit11Change(Sender: TObject);
    procedure DDSpinEdit13Change(Sender: TObject);
    procedure DDSpinEdit13DblClick(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure DDSpinEdit42DblClick(Sender: TObject);
    procedure DDSpinEdit14Change(Sender: TObject);
    procedure DDSpinEdit15Change(Sender: TObject);
    procedure DDSpinEdit97MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit16Change(Sender: TObject);
    procedure DDSpinEdit17Change(Sender: TObject);
    procedure DDSpinEdit18Change(Sender: TObject);
    procedure DDSpinEdit18DblClick(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);
    procedure TrackBar3Enter(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure PopupMenu5Popup(Sender: TObject);
    procedure PopupMenu4Popup(Sender: TObject);
    procedure PopupMenu6Popup(Sender: TObject);
    procedure PopupMenu7Popup(Sender: TObject);
    procedure PopupMenu8Popup(Sender: TObject);
    procedure CheckBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit19Change(Sender: TObject);
    procedure TrackBar1Enter(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure DDSpinEdit20Change(Sender: TObject);
    procedure DDSpinEdit62Change(Sender: TObject);
    procedure DDSpinEdit65Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure DDSpinEdit66Change(Sender: TObject);
    procedure DDSpinEdit75Change(Sender: TObject);
    procedure DDSpinEdit76Change(Sender: TObject);
    procedure DDSpinEdit98Change(Sender: TObject);
    procedure DDSpinEdit12Change(Sender: TObject);
    procedure CheckBox19Click(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure CheckBox6MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DDSpinEdit45DblClick(Sender: TObject);
    procedure CheckBox21Click(Sender: TObject);
    procedure DDSpinEdit77Change(Sender: TObject);
    procedure DDSpinEdit78Change(Sender: TObject);
    procedure CheckBox15MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox18MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox5MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox7Click(Sender: TObject);
    procedure DDSpinEdit82Change(Sender: TObject);
    procedure CheckBox13Click(Sender: TObject);
    procedure DDSpinEdit47DblClick(Sender: TObject);
    procedure DDSpinEdit82DblClick(Sender: TObject);
    procedure CheckBox17Click(Sender: TObject);
    procedure DDSpinEdit95Change(Sender: TObject);
    procedure DDSpinEdit99Change(Sender: TObject);
    procedure DDSpinEdit100Change(Sender: TObject);
    procedure ComboBox8Change(Sender: TObject);
    procedure ComboBox9Change(Sender: TObject);
    procedure DDSpinEdit101Change(Sender: TObject);
    procedure DDSpinEdit79Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox22Click(Sender: TObject);
    procedure DDSpinEdit102Change(Sender: TObject);
    procedure DDSpinEdit103Change(Sender: TObject);
    procedure DDSpinEdit102DblClick(Sender: TObject);
    procedure DDSpinEdit104Change(Sender: TObject);
    procedure DDSpinEdit104DblClick(Sender: TObject);
    procedure DDSpinEdit105Change(Sender: TObject);
    procedure DDSpinEdit117DblClick(Sender: TObject);
    procedure DDSpinEdit117Change(Sender: TObject);
    procedure DDSpinEdit118Change(Sender: TObject);
    procedure DDSpinEdit119Change(Sender: TObject);
    procedure CheckBox23Click(Sender: TObject);
    procedure DDSpinEdit72Change(Sender: TObject);
    procedure DDSpinEdit120DblClick(Sender: TObject);
    procedure CheckBox25Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure SetInputAccordingToContrast;

var
  Form4: TForm4;
  iTrackPos3_old,iTrackPos1_old :integer;

implementation

uses Unit1,ConnectionsO,ColumnO,slice_2DO,Unit20,Unit23,Stimulation,
     Unit26,Unit27,Unit3;

{$R *.DFM}

procedure TForm4.DDSpinEdit42Change(Sender: TObject);
begin
  R.NP.Vrest:=Form4.DDSpinEdit42.Value/1e3;
end;

procedure TForm4.DDSpinEdit43Change(Sender: TObject);
begin
  if Form4.DDSpinEdit43.Value>0 then dt:=Form4.DDSpinEdit43.Value/1000;
  nt_end:={imin(}trunc(t_end/dt){, mMaxExp)};
//  dx:=max(dx,3*dt/t_axon[1]);       dy:=max(dy,dx);   {Courant condition}
end;

procedure TForm4.DDSpinEdit1Change(Sender: TObject);
begin
  Iext:=Form4.DDSpinEdit1.Value;
end;

procedure TForm4.DDSpinEdit2Change(Sender: TObject);
begin
  NP0[1].Square:=Form4.DDSpinEdit2.Value/1e5;
end;

procedure TForm4.DDSpinEdit3Change(Sender: TObject);
begin
  tSt:=Form4.DDSpinEdit3.Value/1000;
end;

procedure TForm4.DDSpinEdit21Change(Sender: TObject);
begin
  Qns:=Form4.DDSpinEdit21.Value;
end;

procedure TForm4.DDSpinEdit5Change(Sender: TObject);
begin
  NP0[1].ThrShift:=Form4.DDSpinEdit5.Value/1000;
end;

procedure TForm4.DDSpinEdit6Change(Sender: TObject);
begin
  tauNoise:=Form4.DDSpinEdit6.Value/1000;
end;

procedure TForm4.DDSpinEdit7Change(Sender: TObject);
begin
  t_end:=Form4.DDSpinEdit7.Value/1000;
  nt_end:={imin(}trunc(t_end/dt){, mMaxExp)};
end;

procedure TForm4.DDSpinEdit45Change(Sender: TObject);
begin
  if NPop<>trunc(Form4.DDSpinEdit45.Value) then IfAColumnCreated:=false;
  NPop:=trunc(Form4.DDSpinEdit45.Value);
  if i3>NPop then i3:=1;
  if (IfViewInLayer2or4=2)and(NPop<=2) then IfViewInLayer2or4:=4;
  CorrespondParametersToTheForm;
end;

{*** CheckBoxes ***}

procedure TForm4.CheckBox1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  IfBlockAMPA:=IfTrue(Form4.CheckBox1.Checked);
  DisableSpinEdits;
end;

procedure TForm4.CheckBox2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  IfBlockNMDA:=IfTrue(Form4.CheckBox2.Checked);
  DisableSpinEdits;
end;

procedure TForm4.CheckBox3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  IfBlockGABA:=IfTrue(Form4.CheckBox3.Checked);
  DisableSpinEdits;
end;

procedure TForm4.CheckBox4MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  IfBlockGABB:=IfTrue(Form4.CheckBox4.Checked);
  DisableSpinEdits;
end;

procedure TForm4.CheckBox6MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  IfBlockK:=IfTrue(Form4.CheckBox6.Checked);
  NP0[1].IfBlockK  :=IfBlockK;
  NP0[1].IfBlockKM :=IfBlockK;
  NP0[1].IfBlockKA :=IfBlockK;
  NP0[1].IfBlockKD :=IfBlockK;
  NP0[1].IfBlockAHP:=IfBlockK;
  NP0[1].IfBlockH  :=IfBlockK;
  NP0[2].IfBlockK  :=IfBlockK;
  NP0[2].IfBlockKM :=IfBlockK;
  NP0[2].IfBlockKA :=IfBlockK;
  NP0[2].IfBlockKD :=IfBlockK;
  NP0[2].IfBlockAHP:=IfBlockK;
  NP0[2].IfBlockH  :=IfBlockK;
  DisableSpinEdits;
end;

procedure TForm4.CheckBox15MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  IfSigmoidForPresynRate:=IfTrue(Form4.CheckBox15.Checked);
  DisableSpinEdits;
end;

procedure TForm4.CheckBox18MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  If_m_Saturates:=IfTrue(Form4.CheckBox18.Checked);
  DisableSpinEdits;
end;

procedure TForm4.CheckBox5MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  IfInSyn_al_EQ_beta:=IfTrue(Form4.CheckBox5.Checked);
  DisableSpinEdits;
end;

procedure TForm4.CheckBox21Click(Sender: TObject);
begin
  IfDynamic_K_Cl:=IfTrue(Form4.CheckBox21.Checked);
  if IfDynamic_K_Cl=1 then Form26.Visible:=true;
end;

procedure TForm4.CheckBox12Click(Sender: TObject);
begin
  if (Form4.CheckBox12.Checked) then begin
      Form4.RadioGroup1.Visible:=true;
      Form4.GroupBox3.Visible:=true;
      Form4.GroupBox5.Visible:=true;
      Form4.GroupBox8.Visible:=true;
      Form4.GroupBox9.Visible:=true;
      Form4.GroupBox11.Visible:=true;
      //Form4.GroupBox12.Visible:=true;
      Form4.GroupBox13.Visible:=true;
      Form4.GroupBox14.Visible:=true;
      Form4.GroupBox15.Visible:=true;
      Form4.GroupBox16.Visible:=true;
      Form4.GroupBox17.Visible:=true;
  end else begin
      Form4.RadioGroup1.Visible:=false;
      Form4.GroupBox3.Visible:=false;
      Form4.GroupBox5.Visible:=false;
      Form4.GroupBox8.Visible:=false;
      Form4.GroupBox9.Visible:=false;
      Form4.GroupBox11.Visible:=false;
      Form4.GroupBox12.Visible:=false;
      Form4.GroupBox13.Visible:=false;
      Form4.GroupBox14.Visible:=false;
      Form4.GroupBox15.Visible:=false;
      Form4.GroupBox16.Visible:=false;
      Form4.GroupBox17.Visible:=false;
  end;
end;

procedure TForm4.CheckBox19Click(Sender: TObject);
begin
  NP0[1].IfPredictorCorrector:=IfTrue(Form4.CheckBox19.Checked);
  NP0[2].IfPredictorCorrector:=IfTrue(Form4.CheckBox19.Checked);
end;

{ Details: time constants }

procedure TForm4.Button1Click(Sender: TObject);
begin
  Form4.GroupBox2.Visible:=not(Form4.GroupBox2.Visible);
  Form4.GroupBox3.Visible:=not(Form4.GroupBox3.Visible);
  Form4.GroupBox4.Visible:=not(Form4.GroupBox4.Visible);
  Form4.GroupBox5.Visible:=not(Form4.GroupBox5.Visible);
  Form4.gsynC1.Visible:=true;
end;

procedure TForm4.DDSpinEdit22Change(Sender: TObject);
begin
  alAMPA[1]:=Form4.DDSpinEdit22.Value;
end;

procedure TForm4.DDSpinEdit23Change(Sender: TObject);
begin
  alNMDA[1]:=Form4.DDSpinEdit23.Value;
end;

procedure TForm4.DDSpinEdit24Change(Sender: TObject);
begin
  alGABA[1]:=Form4.DDSpinEdit24.Value;
end;

procedure TForm4.DDSpinEdit25Change(Sender: TObject);
begin
  alGABB[1]:=Form4.DDSpinEdit25.Value;
end;

procedure TForm4.DDSpinEdit26Change(Sender: TObject);
begin
  beAMPA[1]:=Form4.DDSpinEdit26.Value;
end;

procedure TForm4.DDSpinEdit27Change(Sender: TObject);
begin
  beNMDA[1]:=Form4.DDSpinEdit27.Value;
end;

procedure TForm4.DDSpinEdit28Change(Sender: TObject);
begin
  beGABA[1]:=Form4.DDSpinEdit28.Value;
end;

procedure TForm4.DDSpinEdit29Change(Sender: TObject);
begin
  beGABB[1]:=Form4.DDSpinEdit29.Value;
end;

procedure TForm4.DDSpinEdit30Change(Sender: TObject);
begin
  alAMPA[2]:=Form4.DDSpinEdit30.Value;
end;

procedure TForm4.DDSpinEdit31Change(Sender: TObject);
begin
  alNMDA[2]:=Form4.DDSpinEdit31.Value;
end;

procedure TForm4.DDSpinEdit32Change(Sender: TObject);
begin
  alGABA[2]:=Form4.DDSpinEdit32.Value;
end;

procedure TForm4.DDSpinEdit33Change(Sender: TObject);
begin
  alGABB[2]:=Form4.DDSpinEdit33.Value;
end;

procedure TForm4.DDSpinEdit34Change(Sender: TObject);
begin
  beAMPA[2]:=Form4.DDSpinEdit34.Value;
end;

procedure TForm4.DDSpinEdit35Change(Sender: TObject);
begin
  beNMDA[2]:=Form4.DDSpinEdit35.Value;
end;

procedure TForm4.DDSpinEdit36Change(Sender: TObject);
begin
  beGABA[2]:=Form4.DDSpinEdit36.Value;
end;

procedure TForm4.DDSpinEdit37Change(Sender: TObject);
begin
  beGABB[2]:=Form4.DDSpinEdit37.Value;
end;

procedure TForm4.DDSpinEdit38Change(Sender: TObject);
begin
  VAMPA:=Form4.DDSpinEdit38.Value/1e3;
end;

procedure TForm4.DDSpinEdit39Change(Sender: TObject);
begin
  NP0[1].VNMDA:=Form4.DDSpinEdit39.Value/1e3;
  NP0[2].VNMDA:=Form4.DDSpinEdit39.Value/1e3;
end;

procedure TForm4.DDSpinEdit40Change(Sender: TObject);
begin
  VGABA:=Form4.DDSpinEdit40.Value/1e3;
end;

procedure TForm4.DDSpinEdit41Change(Sender: TObject);
begin
  VGABB:=Form4.DDSpinEdit41.Value/1e3;
end;

procedure TForm4.DDSpinEdit44Change(Sender: TObject);
begin
  NP0[1].Mg:=Form4.DDSpinEdit44.Value;
  NP0[2].Mg:=Form4.DDSpinEdit44.Value;
end;

{ Stimulation Group }
procedure TForm4.DDSpinEdit46Change(Sender: TObject);
begin
  I_ind:=Form4.DDSpinEdit46.Value;
end;

procedure TForm4.DDSpinEdit47Change(Sender: TObject);
begin
  nu_ind:=Form4.DDSpinEdit47.Value;
end;

procedure TForm4.DDSpinEdit48Change(Sender: TObject);
begin
  t_ind:=Form4.DDSpinEdit48.Value/1e3;
end;

procedure TForm4.DDSpinEdit70Change(Sender: TObject);
begin
  NoiseToSgn:=Form4.DDSpinEdit70.Value;
end;

{ Properties Group }
procedure TForm4.DDSpinEdit49Change(Sender: TObject);
begin
  NP0[1].Vrest:=Form4.DDSpinEdit49.Value/1e3;
end;

procedure TForm4.DDSpinEdit50Change(Sender: TObject);
begin
  NP0[2].Vrest:=Form4.DDSpinEdit50.Value/1e3;
end;

procedure TForm4.DDSpinEdit51Change(Sender: TObject);
begin
  NP0[1].tau_m0:=Form4.DDSpinEdit51.Value/1e3;
end;

procedure TForm4.DDSpinEdit52Change(Sender: TObject);
begin
  NP0[2].tau_m0:=Form4.DDSpinEdit52.Value/1e3;
end;

procedure TForm4.DDSpinEdit53Change(Sender: TObject);
begin
  NP0[2].ThrShift:=Form4.DDSpinEdit53.Value/1e3;
end;

procedure TForm4.DDSpinEdit54Change(Sender: TObject);
begin
  NP0[2].Square:=Form4.DDSpinEdit54.Value/1e5;
end;

procedure TForm4.DDSpinEdit55Change(Sender: TObject);
begin
  if Form4.DDSpinEdit55.Value>0 then begin
     sgm_V[1]:=Form4.DDSpinEdit55.Value/1000;
     if IfAColumnCreated then begin
        AColumn.Pop[1].PP.sgm_V:=sgm_V[1];
        if NPop>=3 then AColumn.Pop[3].PP.sgm_V:=sgm_V[1];
     end;
  end else CorrespondParametersToTheForm;
end;

procedure TForm4.DDSpinEdit73Change(Sender: TObject);
begin
  if Form4.DDSpinEdit73.Value>0 then begin
     sgm_V[2]:=Form4.DDSpinEdit73.Value/1000;
     if (IfAColumnCreated)and(NPop>=2) then begin
        AColumn.Pop[2].PP.sgm_V:=sgm_V[2];
        if NPop>=4 then AColumn.Pop[4].PP.sgm_V:=sgm_V[2];
     end;
  end else CorrespondParametersToTheForm;   
end;

procedure TForm4.DDSpinEdit66Change(Sender: TObject);
begin
  sgm_V[3]:=Form4.DDSpinEdit66.Value/1000;
end;

procedure TForm4.DDSpinEdit56Change(Sender: TObject);
begin
  NP0[1].gAHP:=Form4.DDSpinEdit56.Value;
end;

procedure TForm4.DDSpinEdit57Change(Sender: TObject);
begin
  NP0[2].gAHP:=Form4.DDSpinEdit57.Value;
end;

procedure TForm4.DDSpinEdit58Change(Sender: TObject);
begin
  t_axon[1,1]:=Form4.DDSpinEdit58.Value/1e3;
end;

procedure TForm4.DDSpinEdit59Change(Sender: TObject);
begin
  t_axon[2,1]:=Form4.DDSpinEdit59.Value/1e3;
end;

procedure TForm4.DDSpinEdit112Change(Sender: TObject);
begin
  t_axon[1,2]:=Form4.DDSpinEdit112.Value/1e3;
end;
                             
procedure TForm4.DDSpinEdit113Change(Sender: TObject);
begin
  t_axon[2,2]:=Form4.DDSpinEdit113.Value/1e3;
end;

procedure TForm4.DDSpinEdit60Change(Sender: TObject);
begin
  NP0[1].gBst:=Form4.DDSpinEdit60.Value;
end;

procedure TForm4.DDSpinEdit61Change(Sender: TObject);
begin
  NP0[2].gBst:=Form4.DDSpinEdit61.Value;
end;

procedure TForm4.DDSpinEdit63Change(Sender: TObject);
begin
  Nts[1]:=trunc(Form4.DDSpinEdit63.Value);
  Nts[1]:=imin(Nts[1],MaxPh);
end;

procedure TForm4.DDSpinEdit63DblClick(Sender: TObject);
begin
  Form4.DDSpinEdit63.Value:=1;
  Nts[1]:=trunc(Form4.DDSpinEdit63.Value);
end;

procedure TForm4.DDSpinEdit64Change(Sender: TObject);
begin
  ts_end[1]:=Form4.DDSpinEdit64.Value/1000;
end;

procedure TForm4.DDSpinEdit17Change(Sender: TObject);
begin
  ts_end[2]:=Form4.DDSpinEdit17.Value/1000;
end;

procedure TForm4.DDSpinEdit18Change(Sender: TObject);
begin
  Nts[2]:=trunc(Form4.DDSpinEdit18.Value);
  Nts[2]:=imin(Nts[2],MaxPh);
end;

procedure TForm4.DDSpinEdit18DblClick(Sender: TObject);
begin
  Form4.DDSpinEdit18.Value:=1;
  Nts[2]:=trunc(Form4.DDSpinEdit18.Value);
end;

procedure TForm4.DDSpinEdit67Change(Sender: TObject);
begin
  dtSt:=Form4.DDSpinEdit67.Value/1000;
end;

procedure TForm4.DDSpinEdit68Change(Sender: TObject);
begin
  NP0[1].gNaP:=Form4.DDSpinEdit68.Value;
end;

procedure TForm4.DDSpinEdit69Change(Sender: TObject);
begin
  NP0[2].gNaP:=Form4.DDSpinEdit69.Value;
end;

procedure TForm4.DDSpinEdit74Change(Sender: TObject);
begin
  NP0[1].gKM:=Form4.DDSpinEdit74.Value;
end;

{ Show parameters group }

procedure TForm4.DDSpinEdit71Change(Sender: TObject);
begin
  n_show:=trunc(Form4.DDSpinEdit71.Value);
end;

procedure TForm4.DDSpinEdit80Change(Sender: TObject);
begin
  n_DrawPhase:=trunc(Form4.DDSpinEdit80.Value);
end;

procedure TForm4.DDSpinEdit81Change(Sender: TObject);
begin
  n_Write:=trunc(Form4.DDSpinEdit81.Value);
end;

procedure TForm4.i3_ComboChange(Sender: TObject);
begin
  i3:=Form4.i3_Combo.ItemIndex+1;
  CorrespondParametersToTheForm;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  Form4.ComboBox1.ItemIndex:=0;
end;

procedure TForm4.DDSpinEdit56DblClick(Sender: TObject);
begin
  if Form4.DDSpinEdit56.Value=0 then begin
     if NP0[1].HH_order='1-point' then {Form4.DDSpinEdit56.Value:=0.6*(3+NP0[1].ro)/(3+2*NP0[1].ro)
                                  else }Form4.DDSpinEdit56.Value:=0.6;
  end else Form4.DDSpinEdit56.Value:=0;
  NP0[1].gAHP:=Form4.DDSpinEdit56.Value;
end;

procedure TForm4.DDSpinEdit74DblClick(Sender: TObject);
begin
  if Form4.DDSpinEdit74.Value=0 then begin
     if NP0[1].HH_order='1-point' then {Form4.DDSpinEdit74.Value:=0.76*(3+NP0[1].ro)/(3+2*NP0[1].ro)
                                  else }Form4.DDSpinEdit74.Value:=0.76;
  end else  Form4.DDSpinEdit74.Value:=0;
  NP0[1].gKM:=Form4.DDSpinEdit74.Value;
end;

procedure TForm4.DDSpinEdit46DblClick(Sender: TObject);
begin
  if Form4.DDSpinEdit46.Value<>0 then Form4.DDSpinEdit46.Value:=0
                                 else Form4.DDSpinEdit46.Value:=500 {pA};
  I_ind:=Form4.DDSpinEdit46.Value;
end;

procedure TForm4.DDSpinEdit77Change(Sender: TObject);
begin
  NP0[1].l:=Form4.DDSpinEdit77.Value;
end;

procedure TForm4.DDSpinEdit78Change(Sender: TObject);
begin
  NP0[2].l:=Form4.DDSpinEdit78.Value;
end;

procedure TForm4.DDSpinEdit83Change(Sender: TObject);
begin
  NP0[1].Vreset:=Form4.DDSpinEdit83.Value/1e3;
end;

procedure TForm4.DDSpinEdit84Change(Sender: TObject);
begin
  NP0[2].Vreset:=Form4.DDSpinEdit84.Value/1e3;
end;

procedure TForm4.DDSpinEdit83DblClick(Sender: TObject);
begin
  NP0[1].Vreset:=NP0[1].Vrest;
  Form4.DDSpinEdit83.Value:=NP0[1].Vreset*1e3;
end;

procedure TForm4.DDSpinEdit84DblClick(Sender: TObject);
begin
  NP0[2].Vreset:=NP0[2].Vrest;
  Form4.DDSpinEdit84.Value:=NP0[2].Vreset*1e3;
end;

procedure TForm4.DDSpinEdit85Change(Sender: TObject);
begin
  NP0[1].gKA:=Form4.DDSpinEdit85.Value;
end;

procedure TForm4.DDSpinEdit86Change(Sender: TObject);
begin
  NP0[2].gKA:=Form4.DDSpinEdit86.Value;
end;

procedure TForm4.DDSpinEdit87Change(Sender: TObject);
begin
  NP0[1].gK:=Form4.DDSpinEdit87.Value;
end;

procedure TForm4.DDSpinEdit88Change(Sender: TObject);
begin
  NP0[2].gK:=Form4.DDSpinEdit88.Value;
end;

procedure TForm4.DDSpinEdit89DblClick(Sender: TObject);
begin
  Form4.DDSpinEdit89.Value:=0;
end;

procedure TForm4.DDSpinEdit91DblClick(Sender: TObject);
begin
  Form4.DDSpinEdit91.Value:=0;
end;

procedure TForm4.DDSpinEdit8DblClick(Sender: TObject);
begin
  Form4.DDSpinEdit8.Value:=0;
end;

procedure TForm4.DDSpinEdit92DblClick(Sender: TObject);
begin
  Form4.DDSpinEdit92.Value:=0;
end;

procedure TForm4.DDSpinEdit91Change(Sender: TObject);
begin
  pext_Iext:=Form4.DDSpinEdit91.Value;
end;

procedure TForm4.DDSpinEdit8Change(Sender: TObject);
begin
  Sbipolar_Iext:=Form4.DDSpinEdit8.Value; {mm^2/muA}
end;

procedure TForm4.DDSpinEdit89Change(Sender: TObject);
begin
  factorNMDA:=Form4.DDSpinEdit89.Value;
end;

procedure TForm4.DDSpinEdit92Change(Sender: TObject);
begin
  factorAMPA:=Form4.DDSpinEdit92.Value;
end;

procedure TForm4.DDSpinEdit90DblClick(Sender: TObject);
begin
  Form4.DDSpinEdit90.Enabled:=not(Form4.DDSpinEdit90.Enabled);
end;

procedure TForm4.StaticText60DblClick(Sender: TObject);
begin
  Form4.DDSpinEdit90.Enabled:=not(Form4.DDSpinEdit90.Enabled);
end;

procedure TForm4.DDSpinEdit93Change(Sender: TObject);
begin
  t0s:=Form4.DDSpinEdit93.Value/1e3;
end;

procedure TForm4.DDSpinEdit94Change(Sender: TObject);
begin
  nStimuli:=trunc(Form4.DDSpinEdit94.Value);
end;

procedure TForm4.DDSpinEdit93DblClick(Sender: TObject);
begin
  Form4.DDSpinEdit93.Value:=0;
  t0s:=0;
end;

procedure TForm4.DDSpinEdit94DblClick(Sender: TObject);
begin
  Form4.DDSpinEdit94.Value:=0;
  nStimuli:=0;
end;

procedure TForm4.DDSpinEdit67DblClick(Sender: TObject);
begin
  Form4.DDSpinEdit67.Value:=0;
  dtSt:=0;
end;

procedure TForm4.DDSpinEdit96Change(Sender: TObject);
begin
  NP0[1].C_membr:=Form4.DDSpinEdit96.Value/1e3;
end;

procedure TForm4.DDSpinEdit97Change(Sender: TObject);
begin
  NP0[2].C_membr:=Form4.DDSpinEdit97.Value/1e3;
end;

procedure TForm4.DDSpinEdit106Change(Sender: TObject);
begin
  NP0[1].dt_AP:=Form4.DDSpinEdit106.Value/1e3;
end;

procedure TForm4.DDSpinEdit107Change(Sender: TObject);
begin
  NP0[2].dt_AP:=Form4.DDSpinEdit107.Value/1e3;
end;

procedure TForm4.DDSpinEdit1DblClick(Sender: TObject);
begin
  Form4.DDSpinEdit1.Value:=0;
  Iext:=0;
end;

procedure TForm4.DDSpinEdit48DblClick(Sender: TObject);
begin
  if Form4.DDSpinEdit48.Value<>0 then Form4.DDSpinEdit48.Value:=0
                                 else Form4.DDSpinEdit48.Value:=1000 {ms};
  t_ind:=Form4.DDSpinEdit48.Value/1e3;
end;

procedure TForm4.gsynC1Change(Sender: TObject);
var i{,ic,jc} :integer;
begin
//  CorrespondParametersToTheForm;
  NSyn:=trunc(gsynC1.DDSpinEdit1.Value);
  gsynC1.NSyn:=NSyn;
  ReplaceDDSpinEdits;
  for i:=1 to NSyn do begin
      if Assigned(AColumn) and
         Assigned(AColumn.Syn[i]) and (AColumn.Syn[i]<>nil) then begin
         AColumn.Syn[i].SP.gmax:=gsynC1.DDSpinEditA[i].Value;
      end;
      SP_[i].gmax              :=gsynC1.DDSpinEditA[i].Value;
      { Disable unused }
      gsynC1.DDSpinEditA[i].Enabled:=(SP_[i].IfBlock<>1);
      { Change gmax for all columns }
{      for ic:=0 to ni+1 do begin
          for jc:=0 to nj+1 do if if_ni_nj_ne_1(ic,jc) then begin
              if Columns[ic,jc]<>nil then begin
                 Columns[ic,jc].Syn[i].SP.gmax:=SP_[i].gmax;
              end;
          end;
      end;}
  end;
  RenewSynapticPropertiesForAColumn;
end;

procedure TForm4.gsynC1DblClick(Sender: TObject);
begin
  Form4.gsynC1.Visible:=false;
end;

procedure TForm4.Button4Click(Sender: TObject);
begin
  If_Binzegger_V1:=1;
  V1_Binzegger;
  RenewSynapticPropertiesForAColumn;
  CorrespondParametersToTheForm;
end;

procedure TForm4.DDSpinEdit108Change(Sender: TObject);
begin
  NP0[1].gKD:=Form4.DDSpinEdit108.Value;
end;

procedure TForm4.DDSpinEdit109Change(Sender: TObject);
begin
  NP0[2].gKD:=Form4.DDSpinEdit109.Value;
end;

procedure TForm4.DDSpinEdit110Change(Sender: TObject);
begin
  NP0[1].gH:=Form4.DDSpinEdit110.Value;
end;

procedure TForm4.DDSpinEdit111Change(Sender: TObject);
begin
  NP0[2].gH:=Form4.DDSpinEdit111.Value;
end;

procedure TForm4.DDSpinEdit21DblClick(Sender: TObject);
begin
  Form4.DDSpinEdit21.Value:=0;
end;

procedure TForm4.DDSpinEdit114Change(Sender: TObject);
begin
  NP0[1].ro:=Form4.DDSpinEdit114.Value;
end;

procedure TForm4.DDSpinEdit115Change(Sender: TObject);
begin
  NP0[2].ro:=Form4.DDSpinEdit115.Value;
end;

procedure TForm4.DDSpinEdit116Change(Sender: TObject);
begin
  R.NP.ThrShift:=Form4.DDSpinEdit116.Value/1000;
end;

procedure TForm4.DDSpinEdit4Change(Sender: TObject);
begin
  R.NP.Square:=Form4.DDSpinEdit4.Value/1e5;
end;

procedure TForm4.DDSpinEdit4MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var t1 :string;
    Rin :double;
    k :integer;
begin
   k:=EorI(i3);
   if R.NP.Square>0 then begin
     Rin:=NP0[k].tau_m0/NP0[k].C_membr/R.NP.Square;
     if (NP0[k].HH_order='2-points')or(NP0[k].HH_order='2-p-ActiveDend') then
         Rin:=Rin*(3+NP0[k].ro)/(3+2*NP0[k].ro);
     str(Rin/1e3:7:2,t1);
     t1:='Rin='+t1+' MOhm';
     Form4.DDSpinEdit4.Hint:=t1;
   end;
end;

procedure TForm4.DDSpinEdit2MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var t1 :string;
    Rin :double;
begin
   if NP0[1].Square>0 then begin
     Rin:=NP0[1].tau_m0/NP0[1].C_membr/NP0[1].Square;
     if (NP0[1].HH_order='2-points')or(NP0[1].HH_order='2-p-ActiveDend') then
         Rin:=Rin*(3+NP0[1].ro)/(3+2*NP0[1].ro);
     str(Rin/1e3:7:2,t1);
     t1:='Rin='+t1+' MOhm';
     Form4.DDSpinEdit2.Hint:=t1;
   end;
end;

procedure TForm4.DDSpinEdit54MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var t1 :string;
    Rin :double;
begin
   if NP0[2].Square>0 then begin
     Rin:=NP0[2].tau_m0/NP0[2].C_membr/NP0[2].Square;
     if NP0[2].HH_order='2-points' then Rin:=Rin*(3+NP0[2].ro)/(3+2*NP0[2].ro);
     str(Rin/1e3:7:2,t1);
     t1:='Rin='+t1+' MOhm';
     Form4.DDSpinEdit54.Hint:=t1;
   end;
end;

procedure TForm4.DDSpinEdit5MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Rose(@AColumn.Pop[1].PP.NP.ThrShift);
end;

procedure TForm4.DDSpinEdit22MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Rose(@AColumn.Syn[iOfSyn('AMPA on P')].SP.alpha);
end;

procedure TForm4.DDSpinEdit24MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Rose(@AColumn.Syn[iOfSyn('GABA on P')].SP.alpha);
end;

procedure TForm4.DDSpinEdit28MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Rose(@AColumn.Syn[iOfSyn('GABA on P')].SP.beta);
end;

procedure TForm4.DDSpinEdit26MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Rose(@AColumn.Syn[iOfSyn('AMPA on P')].SP.beta);
end;

procedure TForm4.DDSpinEdit30MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Rose(@AColumn.Syn[iOfSyn('AMPA on I')].SP.alpha);
end;

procedure TForm4.DDSpinEdit34MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Rose(@AColumn.Syn[iOfSyn('AMPA on I')].SP.beta);
end;

procedure TForm4.DDSpinEdit32MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Rose(@AColumn.Syn[iOfSyn('GABA on I')].SP.alpha);
end;

procedure TForm4.DDSpinEdit36MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Rose(@AColumn.Syn[iOfSyn('GABA on I')].SP.beta);
end;

procedure TForm4.DDSpinEdit49MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Rose(@AColumn.Pop[1].PP.NP.Vrest);
end;

procedure TForm4.DDSpinEdit2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Rose(@AColumn.Pop[1].PP.NP.Square);
end;

procedure TForm4.DDSpinEdit51MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Rose(@AColumn.Pop[1].PP.NP.tau_m0);
end;

procedure TForm4.DDSpinEdit55MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Rose(@sgm_V[1]);
end;

procedure TForm4.DDSpinEdit73MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Rose(@sgm_V[2]);
end;

procedure TForm4.DDSpinEdit52MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Rose(@AColumn.Pop[2].PP.NP.tau_m0);
end;

procedure TForm4.DDSpinEdit54MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Rose(@AColumn.Pop[2].PP.NP.Square);
end;

procedure TForm4.DDSpinEdit53MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Rose(@AColumn.Pop[2].PP.NP.ThrShift);
end;

procedure TForm4.DDSpinEdit50MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Rose(@AColumn.Pop[2].PP.NP.Vrest);
end;

procedure TForm4.gsynC1MouseDown(Sender: TObject);
begin
  Form20.Visible:=true;
  Form20.RadioGroup1.Visible:=true;
end;

procedure TForm4.DDSpinEdit21MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Rose(@Qns);
end;

procedure TForm4.DDSpinEdit1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Rose(@Iext);
end;

procedure TForm4.DDSpinEdit38MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Rose(@VAMPA);
end;

procedure TForm4.DDSpinEdit40MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Rose(@VGABA);
end;

procedure TForm4.DDSpinEdit96MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Rose(@AColumn.Pop[1].PP.NP.C_membr);
end;

procedure TForm4.DDSpinEdit97MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Rose(@AColumn.Pop[2].PP.NP.C_membr);
end;

procedure TForm4.DDSpinEdit83MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Rose(@AColumn.Pop[1].PP.NP.Vreset);
end;

procedure TForm4.DDSpinEdit84MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Rose(@AColumn.Pop[2].PP.NP.Vreset);
end;

procedure TForm4.DDSpinEdit9Change(Sender: TObject);
begin
  T_bipolar:=Form4.DDSpinEdit9.Value;
end;

procedure TForm4.DDSpinEdit10Change(Sender: TObject);
begin
  gGJ[1]:=Form4.DDSpinEdit10.Value;
end;

procedure TForm4.DDSpinEdit11Change(Sender: TObject);
begin
  gGJ[2]:=Form4.DDSpinEdit11.Value;
end;

procedure TForm4.DDSpinEdit13Change(Sender: TObject);
begin
  s_ind:=Form4.DDSpinEdit13.Value;
end;

procedure TForm4.DDSpinEdit13DblClick(Sender: TObject);
begin
  Form4.DDSpinEdit13.Value:=0;
  s_ind:=Form4.DDSpinEdit13.Value;
end;

procedure TForm4.ComboBox2Change(Sender: TObject);
begin
  case Form4.ComboBox2.ItemIndex of
  0: IfStimLayer2or4:=2;
  1: IfStimLayer2or4:=4;
  end;
  CorrespondParametersToTheForm;
end;

procedure TForm4.ComboBox3Change(Sender: TObject);
begin
  case Form4.ComboBox3.ItemIndex of
  0:   IfExtracellOrThalamOrVisualOrLGN_Stimul:=1; // Extracellular stimul (bipolar)
  1:   IfExtracellOrThalamOrVisualOrLGN_Stimul:=2; // Thalamic stimul
  2: begin
       IfExtracellOrThalamOrVisualOrLGN_Stimul:=3; // Visual stim. without LGN
       Form3.CheckBox2.Checked{PW}:=true;
       SetInputAccordingToContrast;
     end;
  3: IfExtracellOrThalamOrVisualOrLGN_Stimul:=4;   // Visual stim. through LGN
  4: IfExtracellOrThalamOrVisualOrLGN_Stimul:=5;   // LGN + thalamic stimul
  end;
  CorrespondParametersToTheForm;
end;

procedure TForm4.ComboBox4Change(Sender: TObject);
begin
  case Form4.ComboBox4.ItemIndex of
  0: IfViewInLayer2or4:=2;
  1: IfViewInLayer2or4:=4;
  end;
  CorrespondParametersToTheForm;
end;

procedure TForm4.DDSpinEdit42DblClick(Sender: TObject);
begin
  Form4.DDSpinEdit42.Value:=0;
  R.NP.Vrest:=0;
end;

procedure TForm4.DDSpinEdit14Change(Sender: TObject);
begin
  SynSensitivity_E:=Form4.DDSpinEdit14.Value;
  if If_Binzegger_V1=1 then V1_Binzegger;
  RenewSynapticPropertiesForAColumn;
  CorrespondParametersToTheForm;
end;

procedure TForm4.DDSpinEdit15Change(Sender: TObject);
begin
  SynSensitivity_I:=Form4.DDSpinEdit15.Value;
  if If_Binzegger_V1=1 then V1_Binzegger;
  RenewSynapticPropertiesForAColumn;
  CorrespondParametersToTheForm;
end;

procedure TForm4.DDSpinEdit16Change(Sender: TObject);
begin
  gNMDA_gAMPA:=Form4.DDSpinEdit16.Value;
  if IfConnectionsSet=1 then DeriveNMDAfromAMPA;
//  if If_Binzegger_V1=1 then V1_Binzegger;
  RenewSynapticPropertiesForAColumn;
  CorrespondParametersToTheForm;
end;

procedure TForm4.TrackBar3Change(Sender: TObject);
var //max :double;
    iP :integer;
begin
  iP:= Form4.TrackBar3.Position;
//  max:=Form4.TrackBar3.Max;
  if (iP<>iTrackPos3_old){and(iP<>max)} then begin
     IfBlockGABA:=iP/10;
     CorrespondParametersToTheForm;
     iTrackPos3_old:=iP;
  end;
end;

procedure TForm4.TrackBar1Change(Sender: TObject);
var //max :double;
    iP :integer;
begin
  iP:= Form4.TrackBar1.Position;
//  max:=Form4.TrackBar1.Max;
  if (iP<>iTrackPos1_old){and(iP<>max)} then begin
     IfBlockAMPA:=iP/10;
     IfBlockNMDA:=iP/10;
     CorrespondParametersToTheForm;
     iTrackPos1_old:=iP;
  end;
end;

procedure TForm4.TrackBar3Enter(Sender: TObject);
begin
  iTrackPos3_old:=Form4.TrackBar3.Position;
end;

procedure TForm4.TrackBar1Enter(Sender: TObject);
begin
  iTrackPos1_old:=Form4.TrackBar1.Position;
end;

procedure TForm4.PopupMenu1Popup(Sender: TObject);
begin
  DrawKinetics(Form4.DDSpinEdit22.Value,Form4.DDSpinEdit26.Value);
end;

procedure TForm4.PopupMenu2Popup(Sender: TObject);
begin
  DrawKinetics(Form4.DDSpinEdit23.Value,Form4.DDSpinEdit27.Value);
end;

procedure TForm4.PopupMenu3Popup(Sender: TObject);
begin
  DrawKinetics(Form4.DDSpinEdit24.Value,Form4.DDSpinEdit28.Value);
end;

procedure TForm4.PopupMenu4Popup(Sender: TObject);
begin
  DrawKinetics(Form4.DDSpinEdit25.Value,Form4.DDSpinEdit29.Value);
end;

procedure TForm4.PopupMenu5Popup(Sender: TObject);
begin
  DrawKinetics(Form4.DDSpinEdit30.Value,Form4.DDSpinEdit34.Value);
end;

procedure TForm4.PopupMenu6Popup(Sender: TObject);
begin
  DrawKinetics(Form4.DDSpinEdit31.Value,Form4.DDSpinEdit35.Value);
end;

procedure TForm4.PopupMenu7Popup(Sender: TObject);
begin
  DrawKinetics(Form4.DDSpinEdit32.Value,Form4.DDSpinEdit36.Value);
end;

procedure TForm4.PopupMenu8Popup(Sender: TObject);
begin
  DrawKinetics(Form4.DDSpinEdit33.Value,Form4.DDSpinEdit37.Value);
end;

procedure TForm4.DDSpinEdit19Change(Sender: TObject);
begin
  SynSensitivity_Thalamic:=Form4.DDSpinEdit19.Value;
  if If_Binzegger_V1=1 then V1_Binzegger;
  RenewSynapticPropertiesForAColumn;
  CorrespondParametersToTheForm;
end;

procedure TForm4.DDSpinEdit20Change(Sender: TObject);
begin
  SynEffect_Glu:=Form4.DDSpinEdit20.Value;
  if If_Binzegger_V1=1 then V1_Binzegger;
  RenewSynapticPropertiesForAColumn;
  CorrespondParametersToTheForm;
end;

procedure TForm4.DDSpinEdit62Change(Sender: TObject);
begin
  SynEffect_GABA:=Form4.DDSpinEdit62.Value;
  if If_Binzegger_V1=1 then V1_Binzegger;
  RenewSynapticPropertiesForAColumn;
  CorrespondParametersToTheForm;
end;

procedure TForm4.DDSpinEdit65Change(Sender: TObject);
begin
  t0_ind:=Form4.DDSpinEdit65.Value/1e3;
end;

procedure TForm4.ComboBox5Change(Sender: TObject);
begin
  If_Binzegger_V1:=1;
  V1_Binzegger;
  RenewSynapticPropertiesForAColumn;
  CorrespondParametersToTheForm;
end;

procedure TForm4.DDSpinEdit75Change(Sender: TObject);
begin
  NP0[3].ThrShift:=Form4.DDSpinEdit75.Value/1000;
end;

procedure SetInputAccordingToContrast;
var BG,TU,Contrast :double;
begin
  Contrast:=Form4.DDSpinEdit76.Value;
  LGN_input_Troyer1998(Contrast, BG,TU);
  if (IfExtracellOrThalamOrVisualOrLGN_Stimul=3) then begin  // Visual w/o LGN
      Qns:=BG;
      Form4.DDSpinEdit21.Value:=Qns;
      Iext:=TU/pext_Iext;
      Form4.DDSpinEdit1.Value:=Iext;
  end;
end;

procedure TForm4.DDSpinEdit76Change(Sender: TObject);
begin
  SetInputAccordingToContrast;
end;

procedure TForm4.DDSpinEdit98Change(Sender: TObject);
begin
  taum_taus:=Form4.DDSpinEdit98.Value;
end;

procedure TForm4.DDSpinEdit12Change(Sender: TObject);
begin
  tBG:=Form4.DDSpinEdit12.Value/1e3;
end;

procedure TForm4.ComboBox6Change(Sender: TObject);
begin
  R.NP.If_I_V_or_g:=Form4.ComboBox6.ItemIndex+1;
end;

procedure TForm4.DDSpinEdit45DblClick(Sender: TObject);
begin
  Form4.DDSpinEdit45.Value:=2;
end;

procedure TForm4.CheckBox7Click(Sender: TObject);
begin
  If_K_Cl_CalculatedInBG:=IfTrue(Form4.CheckBox7.Checked);
end;

procedure TForm4.DDSpinEdit82Change(Sender: TObject);
begin
  if Form4.DDSpinEdit82.Value<=0 then exit;
  Form27.Visible:=true;
  DrawLognormalDistribution(AColumn.Pop[1],1);
end;

procedure TForm4.CheckBox13Click(Sender: TObject);
begin
//4.08.2016   CorrespondParametersToTheForm;
  DisableSpinEdits;
end;

procedure TForm4.DDSpinEdit47DblClick(Sender: TObject);
begin
  Form4.DDSpinEdit47.Value:=0;
end;

procedure TForm4.DDSpinEdit82DblClick(Sender: TObject);
begin
  if Form4.DDSpinEdit82.Value<=0 then exit;
  Form27.Visible:=true;
  DrawLognormalDistribution(AColumn.Pop[1],1);
end;

procedure TForm4.CheckBox17Click(Sender: TObject);
begin
//4.08.2016  CorrespondParametersToTheForm;
  DisableSpinEdits;
end;

procedure TForm4.DDSpinEdit95Change(Sender: TObject);
begin
  NP0[4].ThrShift:=Form4.DDSpinEdit95.Value/1000;
end;

procedure TForm4.DDSpinEdit99Change(Sender: TObject);
begin
  sgm_V[4]:=Form4.DDSpinEdit99.Value/1000;
end;

procedure TForm4.DDSpinEdit100Change(Sender: TObject);
begin
  NP0[1].DepBlock_limit:=Form4.DDSpinEdit100.Value;
  NP0[2].DepBlock_limit:=Form4.DDSpinEdit100.Value;
end;

procedure TForm4.DDSpinEdit102Change(Sender: TObject);
begin
  U_Depr_Glu:=Form4.DDSpinEdit102.Value;
end;

procedure TForm4.DDSpinEdit103Change(Sender: TObject);
begin
  tau_Depr_Glu:=Form4.DDSpinEdit103.Value/1e3;  {s}
end;

procedure TForm4.DDSpinEdit102DblClick(Sender: TObject);
begin
  Form4.DDSpinEdit102.Value:=0;
end;

procedure TForm4.DDSpinEdit104Change(Sender: TObject);
begin
  U_Depr_GABA:=Form4.DDSpinEdit104.Value;
end;

procedure TForm4.DDSpinEdit104DblClick(Sender: TObject);
begin
  Form4.DDSpinEdit104.Value:=0;
end;

procedure TForm4.DDSpinEdit105Change(Sender: TObject);
begin
  tau_Depr_GABA:=Form4.DDSpinEdit105.Value/1e3;   {s}
end;

procedure TForm4.ComboBox8Change(Sender: TObject);
begin
  CorrespondParametersToTheForm;
end;

procedure TForm4.ComboBox9Change(Sender: TObject);
begin
  CorrespondParametersToTheForm;
end;

procedure TForm4.DDSpinEdit101Change(Sender: TObject);
begin
  Speed:=Form4.DDSpinEdit101.Value;  {m/s}
end;

procedure TForm4.DDSpinEdit79Change(Sender: TObject);
begin
  DrawLognormalDistribution(AColumn.Pop[1],1);
end;

procedure TForm4.CheckBox1Click(Sender: TObject);
begin
  IfBlockAMPA:=IfTrue(Form4.CheckBox1.Checked);
  CorrespondParametersToTheForm;
  RenewSynapticPropertiesForAColumn;
end;

procedure TForm4.CheckBox2Click(Sender: TObject);
begin
  IfBlockNMDA:=IfTrue(Form4.CheckBox2.Checked);
  CorrespondParametersToTheForm;
  RenewSynapticPropertiesForAColumn;
end;

procedure TForm4.CheckBox3Click(Sender: TObject);
begin
  IfBlockGABA:=IfTrue(Form4.CheckBox3.Checked);
  CorrespondParametersToTheForm;
  RenewSynapticPropertiesForAColumn;
end;

procedure TForm4.CheckBox4Click(Sender: TObject);
begin
  IfBlockGABB:=IfTrue(Form4.CheckBox4.Checked);
  CorrespondParametersToTheForm;
  RenewSynapticPropertiesForAColumn;
end;

procedure TForm4.CheckBox6Click(Sender: TObject);
begin
  IfBlockK:=IfTrue(Form4.CheckBox6.Checked);
  CorrespondParametersToTheForm;
  RenewSynapticPropertiesForAColumn;
end;

procedure TForm4.CheckBox22Click(Sender: TObject);
begin
  R.NP.IfThrModel:=IfTrue(Form4.CheckBox22.Checked);
  CorrespondParametersToTheForm;
end;

procedure TForm4.DDSpinEdit117DblClick(Sender: TObject);
begin
  Form4.DDSpinEdit117.Value:=0;
end;

procedure TForm4.DDSpinEdit117Change(Sender: TObject);
begin
  factorGABA:=Form4.DDSpinEdit117.Value;
end;

procedure TForm4.DDSpinEdit118Change(Sender: TObject);
begin
  nu_thr_Depr_Glu:=Form4.DDSpinEdit118.Value;  {Hz}
end;

procedure TForm4.DDSpinEdit119Change(Sender: TObject);
begin
  nu_thr_Depr_GABA:=Form4.DDSpinEdit119.Value;  {Hz}
end;

procedure TForm4.CheckBox23Click(Sender: TObject);
begin
  IfShowBG:=IfTrue(Form4.CheckBox23.Checked);
end;

procedure TForm4.DDSpinEdit72Change(Sender: TObject);
begin
  NP0[1].DepBlock_slope:=Form4.DDSpinEdit72.Value;
  NP0[2].DepBlock_slope:=Form4.DDSpinEdit72.Value;
end;

procedure TForm4.DDSpinEdit120DblClick(Sender: TObject);
begin
  Form4.DDSpinEdit120.Value:=0;
end;

procedure TForm4.CheckBox25Click(Sender: TObject);
begin
  NP0[1].If_NMDA_on_dendrite:=IfTrue(Form4.CheckBox25.Checked);
  NP0[2].If_NMDA_on_dendrite:=IfTrue(Form4.CheckBox25.Checked);
end;

end.
