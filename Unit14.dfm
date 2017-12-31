object Form14: TForm14
  Left = 143
  Top = 67
  Width = 727
  Height = 817
  Caption = 'Form14: Scheme of connections'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnDblClick = FormDblClick
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Shape1: TShape
    Left = 600
    Top = 32
    Width = 9
    Height = 25
    OnContextPopup = Shape1ContextPopup
  end
  object Label0: TLabel
    Left = 612
    Top = 30
    Width = 56
    Height = 13
    Caption = 'NameLabel '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -10
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = [fsItalic]
    ParentFont = False
    OnContextPopup = Label0ContextPopup
  end
  object Shape2: TShape
    Left = 40
    Top = 184
    Width = 89
    Height = 97
  end
  object Shape4: TShape
    Left = 136
    Top = 217
    Width = 169
    Height = 7
  end
  object Shape3: TShape
    Left = 312
    Top = 184
    Width = 97
    Height = 97
    Shape = stCircle
  end
  object Shape6: TShape
    Left = 624
    Top = 16
    Width = 65
    Height = 65
  end
  object Shape7: TShape
    Left = 56
    Top = 288
    Width = 9
    Height = 161
  end
  object Shape5: TShape
    Left = 144
    Top = 248
    Width = 169
    Height = 7
  end
  object Shape8: TShape
    Left = 40
    Top = 8
    Width = 89
    Height = 97
  end
  object Shape9: TShape
    Left = 312
    Top = 8
    Width = 97
    Height = 97
    Shape = stCircle
  end
  object Shape10: TShape
    Left = 56
    Top = 104
    Width = 9
    Height = 64
  end
  object Shape11: TShape
    Left = 88
    Top = 120
    Width = 9
    Height = 64
  end
  object Shape12: TShape
    Left = 344
    Top = 104
    Width = 9
    Height = 64
  end
  object Shape13: TShape
    Left = 368
    Top = 120
    Width = 9
    Height = 64
  end
  object Shape14: TShape
    Left = 128
    Top = 33
    Width = 169
    Height = 7
  end
  object Shape15: TShape
    Left = 144
    Top = 65
    Width = 169
    Height = 7
  end
  object Shape16: TShape
    Left = 344
    Top = 288
    Width = 9
    Height = 161
  end
  object Shape17: TShape
    Left = 0
    Top = 24
    Width = 9
    Height = 64
  end
  object Shape18: TShape
    Left = 8
    Top = 24
    Width = 33
    Height = 9
  end
  object Shape19: TShape
    Left = 8
    Top = 80
    Width = 33
    Height = 9
  end
  object GroupBox1: TGroupBox
    Left = 616
    Top = 44
    Width = 100
    Height = 121
    Caption = 'Properties:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 18
      Width = 33
      Height = 16
      Caption = 'gmax'
    end
    object Label2: TLabel
      Left = 8
      Top = 62
      Width = 28
      Height = 16
      Caption = 'Vrev'
    end
    object Label3: TLabel
      Left = 8
      Top = 42
      Width = 34
      Height = 16
      Caption = 'alpha'
    end
    object Label4: TLabel
      Left = 8
      Top = 78
      Width = 27
      Height = 16
      Caption = 'beta'
    end
    object DDSpinEdit1: TDDSpinEdit
      Left = 48
      Top = 16
      Width = 49
      Height = 22
      StrWidth = 2
      StrDecimals = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      Increment = 0.100000000000000000
      ParentFont = False
      TabOrder = 0
      OnChange = DDSpinEdit1Change
    end
    object DDSpinEdit2: TDDSpinEdit
      Left = 48
      Top = 36
      Width = 49
      Height = 22
      StrWidth = 2
      StrDecimals = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      Increment = 1.000000000000000000
      ParentFont = False
      TabOrder = 1
    end
    object DDSpinEdit3: TDDSpinEdit
      Left = 48
      Top = 56
      Width = 49
      Height = 22
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      Increment = 10.000000000000000000
      ParentFont = False
      TabOrder = 2
    end
    object DDSpinEdit4: TDDSpinEdit
      Left = 48
      Top = 76
      Width = 49
      Height = 22
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      Increment = 10.000000000000000000
      ParentFont = False
      TabOrder = 3
    end
    object CheckBox1: TCheckBox
      Left = 8
      Top = 98
      Width = 89
      Height = 17
      Caption = ' If Block'
      TabOrder = 4
      OnClick = CheckBox1Click
    end
  end
  object SynapseC1: TSynapseC
    Left = 136
    Top = 240
    Width = 121
    Height = 145
    IfBlock = 0
    IfApplySigmoidToAxonRate = 0
  end
  object SynapseC2: TSynapseC
    Left = 304
    Top = 208
    Width = 121
    Height = 137
    IfBlock = 0
    IfApplySigmoidToAxonRate = 0
  end
  object SynapseC3: TSynapseC
    Left = 56
    Top = 280
    Width = 121
    Height = 137
    IfBlock = 0
    IfApplySigmoidToAxonRate = 0
  end
  object SynapseC4: TSynapseC
    Left = 88
    Top = 104
    Width = 121
    Height = 137
    IfBlock = 0
    IfApplySigmoidToAxonRate = 0
  end
  object SynapseC5: TSynapseC
    Left = 56
    Top = 160
    Width = 121
    Height = 137
    IfBlock = 0
    IfApplySigmoidToAxonRate = 0
  end
  object SynapseC6: TSynapseC
    Left = 344
    Top = 160
    Width = 121
    Height = 137
    IfBlock = 0
    IfApplySigmoidToAxonRate = 0
  end
  object SynapseC7: TSynapseC
    Left = 368
    Top = 104
    Width = 121
    Height = 137
    IfBlock = 0
    IfApplySigmoidToAxonRate = 0
  end
  object SynapseC8: TSynapseC
    Left = 296
    Top = 24
    Width = 121
    Height = 137
    IfBlock = 0
    IfApplySigmoidToAxonRate = 0
  end
  object SynapseC9: TSynapseC
    Left = 128
    Top = 56
    Width = 121
    Height = 137
    IfBlock = 0
    IfApplySigmoidToAxonRate = 0
  end
  object SynapseC10: TSynapseC
    Left = 32
    Top = 16
    Width = 121
    Height = 137
    IfBlock = 0
    IfApplySigmoidToAxonRate = 0
  end
  object gsynC1: TgsynC
    Left = 8
    Top = 416
    Width = 401
    Height = 329
    NSyn = 5
  end
end
