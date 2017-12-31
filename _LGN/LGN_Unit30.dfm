object LGN_Form30: TLGN_Form30
  Left = 962
  Top = 311
  Width = 241
  Height = 236
  AutoSize = True
  Caption = 'LGN_Form30: complex stimulus'
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 233
    Height = 201
    ActivePage = TabSheet2
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Two/three spots'
      object Label14: TLabel
        Left = 1
        Top = 4
        Width = 116
        Height = 16
        Caption = 'Inter-spot delay, ms'
      end
      object Label1: TLabel
        Left = 1
        Top = 28
        Width = 125
        Height = 16
        Caption = 'Next spot x_shift, deg'
      end
      object Label2: TLabel
        Left = 1
        Top = 52
        Width = 126
        Height = 16
        Caption = 'Next spot y_shift, deg'
      end
      object Label3: TLabel
        Left = 1
        Top = 76
        Width = 123
        Height = 16
        Caption = 'Duration of I spot, ms'
      end
      object Label15: TLabel
        Left = 1
        Top = 100
        Width = 126
        Height = 16
        Caption = 'Duration of II spot, ms'
      end
      object Label17: TLabel
        Left = 1
        Top = 148
        Width = 98
        Height = 16
        Caption = 'Spot radius, deg'
      end
      object Label21: TLabel
        Left = 1
        Top = 124
        Width = 129
        Height = 16
        Caption = 'Duration of III spot, ms'
      end
      object DDSpinEdit19: TDDSpinEdit
        Left = 153
        Top = 1
        Width = 64
        Height = 26
        StrWidth = 2
        StrDecimals = 0
        Increment = 5.000000000000000000
        TabOrder = 0
        Value = 50.000000000000000000
      end
      object DDSpinEdit1: TDDSpinEdit
        Left = 153
        Top = 25
        Width = 64
        Height = 26
        StrWidth = 2
        StrDecimals = 2
        Increment = 0.500000000000000000
        TabOrder = 1
        Value = 2.000000000000000000
      end
      object DDSpinEdit2: TDDSpinEdit
        Left = 153
        Top = 49
        Width = 64
        Height = 26
        StrWidth = 2
        StrDecimals = 2
        Increment = 0.500000000000000000
        TabOrder = 2
      end
      object DDSpinEdit14: TDDSpinEdit
        Left = 153
        Top = 73
        Width = 64
        Height = 26
        StrWidth = 2
        StrDecimals = 0
        Increment = 5.000000000000000000
        TabOrder = 4
        Value = 50.000000000000000000
      end
      object DDSpinEdit3: TDDSpinEdit
        Left = 153
        Top = 97
        Width = 64
        Height = 26
        StrWidth = 2
        StrDecimals = 0
        Increment = 5.000000000000000000
        TabOrder = 3
        Value = 50.000000000000000000
      end
      object DDSpinEdit21: TDDSpinEdit
        Left = 153
        Top = 121
        Width = 64
        Height = 26
        StrWidth = 2
        StrDecimals = 0
        Increment = 5.000000000000000000
        TabOrder = 6
        Value = 50.000000000000000000
      end
      object DDSpinEdit16: TDDSpinEdit
        Left = 153
        Top = 145
        Width = 64
        Height = 26
        StrWidth = 2
        StrDecimals = 2
        Increment = 0.500000000000000000
        TabOrder = 5
        Value = 0.500000000000000000
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Moving spot'
      ImageIndex = 1
      object Label4: TLabel
        Left = 1
        Top = 4
        Width = 123
        Height = 16
        Caption = 'SpeedOfSpot, deg/s'
      end
      object Label18: TLabel
        Left = 1
        Top = 124
        Width = 98
        Height = 16
        Caption = 'Spot radius, deg'
      end
      object Label19: TLabel
        Left = 1
        Top = 28
        Width = 103
        Height = 16
        Caption = 'max    x_shift, deg'
      end
      object Label20: TLabel
        Left = 1
        Top = 52
        Width = 104
        Height = 16
        Caption = 'max    y_shift, deg'
      end
      object DDSpinEdit4: TDDSpinEdit
        Left = 153
        Top = 1
        Width = 64
        Height = 26
        StrWidth = 2
        StrDecimals = 0
        Increment = 1.000000000000000000
        TabOrder = 0
        Value = 32.000000000000000000
      end
      object DDSpinEdit18: TDDSpinEdit
        Left = 153
        Top = 25
        Width = 64
        Height = 26
        StrWidth = 2
        StrDecimals = 2
        Increment = 0.500000000000000000
        TabOrder = 2
        Value = 2.000000000000000000
      end
      object DDSpinEdit20: TDDSpinEdit
        Left = 153
        Top = 49
        Width = 64
        Height = 26
        StrWidth = 2
        StrDecimals = 2
        Increment = 0.500000000000000000
        TabOrder = 3
      end
      object DDSpinEdit17: TDDSpinEdit
        Left = 153
        Top = 121
        Width = 64
        Height = 26
        StrWidth = 2
        StrDecimals = 2
        Increment = 0.500000000000000000
        TabOrder = 1
        Value = 0.500000000000000000
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'SquareAndLine'
      ImageIndex = 2
      object Label6: TLabel
        Left = 1
        Top = 28
        Width = 123
        Height = 16
        Caption = 'Line end  x_shift, deg'
      end
      object Label8: TLabel
        Left = 1
        Top = 76
        Width = 116
        Height = 16
        Caption = 'Duration of Line, ms'
      end
      object Label5: TLabel
        Left = 1
        Top = 4
        Width = 107
        Height = 16
        Caption = 'Square width, deg'
      end
      object Label13: TLabel
        Left = 1
        Top = 52
        Width = 86
        Height = 16
        Caption = 'Line delay, ms'
      end
      object Label16: TLabel
        Left = 1
        Top = 100
        Width = 135
        Height = 16
        Caption = 'Duration of Square, ms'
      end
      object DDSpinEdit5: TDDSpinEdit
        Left = 153
        Top = 1
        Width = 64
        Height = 26
        StrWidth = 2
        StrDecimals = 2
        Increment = 0.500000000000000000
        TabOrder = 2
        Value = 1.500000000000000000
      end
      object DDSpinEdit6: TDDSpinEdit
        Left = 153
        Top = 25
        Width = 64
        Height = 26
        StrWidth = 2
        StrDecimals = 2
        Increment = 0.500000000000000000
        TabOrder = 0
        Value = 3.000000000000000000
      end
      object DDSpinEdit13: TDDSpinEdit
        Left = 153
        Top = 49
        Width = 64
        Height = 26
        StrWidth = 2
        StrDecimals = 0
        Increment = 5.000000000000000000
        TabOrder = 3
        Value = 10.000000000000000000
      end
      object DDSpinEdit8: TDDSpinEdit
        Left = 153
        Top = 73
        Width = 64
        Height = 26
        StrWidth = 2
        StrDecimals = 0
        Increment = 5.000000000000000000
        TabOrder = 1
        Value = 100.000000000000000000
      end
      object DDSpinEdit15: TDDSpinEdit
        Left = 153
        Top = 97
        Width = 64
        Height = 26
        StrWidth = 2
        StrDecimals = 0
        Increment = 5.000000000000000000
        TabOrder = 4
        Value = 50.000000000000000000
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'GrowingLine'
      ImageIndex = 3
      object Label7: TLabel
        Left = 1
        Top = 28
        Width = 123
        Height = 16
        Caption = 'Line end  x_shift, deg'
      end
      object Label9: TLabel
        Left = 1
        Top = 76
        Width = 58
        Height = 16
        Caption = 't_stim, ms'
      end
      object Label12: TLabel
        Left = 1
        Top = 4
        Width = 64
        Height = 16
        Caption = 'Width, deg'
      end
      object DDSpinEdit12: TDDSpinEdit
        Left = 153
        Top = 1
        Width = 64
        Height = 26
        StrWidth = 2
        StrDecimals = 2
        Increment = 0.500000000000000000
        TabOrder = 2
        Value = 1.500000000000000000
      end
      object DDSpinEdit7: TDDSpinEdit
        Left = 153
        Top = 25
        Width = 64
        Height = 26
        StrWidth = 2
        StrDecimals = 2
        Increment = 0.500000000000000000
        TabOrder = 0
        Value = 2.000000000000000000
      end
      object DDSpinEdit9: TDDSpinEdit
        Left = 153
        Top = 73
        Width = 64
        Height = 26
        StrWidth = 2
        StrDecimals = 0
        Increment = 5.000000000000000000
        TabOrder = 1
        Value = 100.000000000000000000
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'MovingSquare'
      ImageIndex = 4
      object Label10: TLabel
        Left = 1
        Top = 4
        Width = 123
        Height = 16
        Caption = 'SpeedOfSpot, deg/s'
      end
      object Label11: TLabel
        Left = 1
        Top = 28
        Width = 64
        Height = 16
        Caption = 'Width, deg'
      end
      object DDSpinEdit10: TDDSpinEdit
        Left = 153
        Top = 1
        Width = 64
        Height = 26
        StrWidth = 2
        StrDecimals = 0
        Increment = 1.000000000000000000
        TabOrder = 0
        Value = 32.000000000000000000
      end
      object DDSpinEdit11: TDDSpinEdit
        Left = 153
        Top = 25
        Width = 64
        Height = 26
        StrWidth = 2
        StrDecimals = 2
        Increment = 0.500000000000000000
        TabOrder = 1
        Value = 1.500000000000000000
      end
    end
  end
end
