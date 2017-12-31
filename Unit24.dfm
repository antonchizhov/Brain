object Form24: TForm24
  Left = 210
  Top = 706
  Width = 381
  Height = 212
  AutoSize = True
  Caption = 'Form24: Blank'
  Color = 11193599
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 209
    Top = 59
    Width = 77
    Height = 16
    Caption = 'i_PW, j_PW='
  end
  object CheckBox1: TCheckBox
    Left = 0
    Top = 0
    Width = 313
    Height = 17
    Caption = 'Blank stimulus for selected PWs'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = CheckBox1Click
  end
  object Memo1: TMemo
    Left = 0
    Top = 25
    Width = 198
    Height = 88
    Lines.Strings = (
      'List of coordinates of blanked '
      'pinwheels - BlankedPW')
    TabOrder = 1
  end
  object Button1: TButton
    Left = 212
    Top = 25
    Width = 161
    Height = 24
    Caption = 'Add PW to blank-list'
    TabOrder = 2
    OnClick = Button1Click
  end
  object DDSpinEdit1: TDDSpinEdit
    Left = 292
    Top = 57
    Width = 40
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 1.000000000000000000
    TabOrder = 3
  end
  object DDSpinEdit2: TDDSpinEdit
    Left = 332
    Top = 57
    Width = 41
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 1.000000000000000000
    TabOrder = 4
  end
  object Button2: TButton
    Left = 212
    Top = 89
    Width = 161
    Height = 24
    Caption = 'Delete PW from blank-list'
    TabOrder = 5
    OnClick = Button2Click
  end
  object CheckBox2: TCheckBox
    Left = 0
    Top = 121
    Width = 353
    Height = 24
    Caption = 'Set orthogonal orientation for them'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = CheckBox1Click
  end
  object Button3: TButton
    Left = 335
    Top = 2
    Width = 37
    Height = 20
    Caption = 'All'
    TabOrder = 7
    OnClick = Button3Click
  end
  object ComboBox1: TComboBox
    Left = 0
    Top = 153
    Width = 185
    Height = 24
    ItemHeight = 16
    ItemIndex = 0
    TabOrder = 8
    Text = '"Gray" for blank: pext=Qns+Iext*pext_Iext'
    Items.Strings = (
      '"Gray" for blank: pext=Qns+Iext*pext_Iext'
      '"min"   for blank: pext=Qns'
      '"Black" for blank: pext=0')
  end
end
