object Form26: TForm26
  Left = 1237
  Top = 594
  Width = 673
  Height = 428
  AutoSize = True
  Caption = 'Form26: K and Cl dynamics'
  Color = 10673344
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
    Width = 665
    Height = 393
    ActivePage = TabSheet1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Parameters'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      object DDSpinEdit24: TDDSpinEdit
        Left = 311
        Top = 302
        Width = 56
        Height = 27
        StrWidth = 2
        StrDecimals = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Increment = 1.000000000000000000
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 26
        Value = 10.000000000000000000
        OnChange = DDSpinEdit24Change
      end
      object DDSpinEdit25: TDDSpinEdit
        Left = 433
        Top = 302
        Width = 55
        Height = 27
        StrWidth = 2
        StrDecimals = 1
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Increment = 1.000000000000000000
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 27
        OnChange = DDSpinEdit25Change
      end
      object StaticText1: TStaticText
        Left = 9
        Top = 14
        Width = 102
        Height = 20
        Caption = ' gL_K, mS/cm^2 '
        TabOrder = 0
      end
      object DDSpinEdit1: TDDSpinEdit
        Left = 121
        Top = 9
        Width = 72
        Height = 27
        Hint = '0.042 in [Bazhenov]'
        StrWidth = 2
        StrDecimals = 3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Increment = 0.042000000000000000
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Value = 0.035000000000000010
      end
      object StaticText2: TStaticText
        Left = 9
        Top = 39
        Width = 106
        Height = 20
        Caption = ' gL_Cl, mS/cm^2 '
        TabOrder = 2
      end
      object DDSpinEdit2: TDDSpinEdit
        Left = 121
        Top = 34
        Width = 72
        Height = 27
        Hint = '0.0085 in [Bazhenov]'
        StrWidth = 2
        StrDecimals = 3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Increment = 0.001000000000000000
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Value = 0.010000000000000000
      end
      object StaticText3: TStaticText
        Left = 9
        Top = 118
        Width = 113
        Height = 20
        Caption = 'factor_IKleak_IKtot'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
        TabOrder = 5
      end
      object CheckBox1: TCheckBox
        Left = 9
        Top = 143
        Width = 150
        Height = 16
        Caption = 'Glial buffer for K'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        TabOrder = 6
        OnClick = CheckBox1Click
      end
      object DDSpinEdit4: TDDSpinEdit
        Left = 121
        Top = 162
        Width = 72
        Height = 27
        Hint = '0.008 in [Bazhenov]'
        StrWidth = 2
        StrDecimals = 3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Increment = 0.001000000000000000
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        Value = 0.008000000000000000
        OnChange = DDSpinEdit4Change
      end
      object StaticText4: TStaticText
        Left = 9
        Top = 166
        Width = 18
        Height = 20
        Caption = 'k1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
        TabOrder = 8
      end
      object DDSpinEdit5: TDDSpinEdit
        Left = 121
        Top = 190
        Width = 72
        Height = 27
        Hint = '10 {*10^2 cm^3} in [Bazhenov]'
        StrWidth = 2
        StrDecimals = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Increment = 1.000000000000000000
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        Value = 10.000000000000000000
        OnChange = DDSpinEdit5Change
      end
      object StaticText5: TStaticText
        Left = 9
        Top = 194
        Width = 102
        Height = 20
        Caption = 'k_K  /10^2 cm^3 '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
        TabOrder = 10
      end
      object DDSpinEdit6: TDDSpinEdit
        Left = 121
        Top = 218
        Width = 72
        Height = 27
        Hint = '100 {*10^6 cm^2} in [Bazhenov]'
        StrWidth = 2
        StrDecimals = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Increment = 1.000000000000000000
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        Value = 100.000000000000000000
        OnChange = DDSpinEdit6Change
      end
      object StaticText6: TStaticText
        Left = 9
        Top = 222
        Width = 103
        Height = 20
        Caption = 'k_Cl  /10^6 cm^2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
        TabOrder = 12
      end
      object GroupBox1: TGroupBox
        Left = 198
        Top = 121
        Width = 299
        Height = 176
        Caption = 'KCC2'
        TabOrder = 13
        object DDSpinEdit11: TDDSpinEdit
          Left = 217
          Top = 14
          Width = 73
          Height = 27
          Hint = '0.0085 in [Bazhenov]'
          StrWidth = 2
          StrDecimals = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Increment = 0.001000000000000000
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          Value = 0.080000000000000000
          OnChange = DDSpinEdit11Change
        end
        object RadioGroup1: TRadioGroup
          Left = 9
          Top = 16
          Width = 96
          Height = 65
          Caption = 'type'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ItemIndex = 1
          Items.Strings = (
            'Bazhenov'
            'Doyon')
          ParentFont = False
          TabOrder = 0
          OnClick = RadioGroup1Click
        end
        object DDSpinEdit14: TDDSpinEdit
          Left = 113
          Top = 141
          Width = 56
          Height = 27
          StrWidth = 2
          StrDecimals = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Increment = 0.100000000000000000
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Value = 0.500000000000000000
          OnChange = DDSpinEdit14Change
        end
        object StaticText12: TStaticText
          Left = 10
          Top = 122
          Width = 266
          Height = 20
          Caption = 'Ikcc2, muA/cm^2:  Pop 1        Pop 2        Pop 3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 2
        end
        object DDSpinEdit15: TDDSpinEdit
          Left = 217
          Top = 92
          Width = 73
          Height = 27
          Hint = '0.0085 in [Bazhenov]'
          StrWidth = 2
          StrDecimals = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Increment = 0.001000000000000000
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          Value = 40.000000000000000000
          OnChange = DDSpinEdit15Change
        end
        object StaticText13: TStaticText
          Left = 122
          Top = 99
          Width = 57
          Height = 20
          Caption = 'V1/2, mV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 4
        end
        object StaticText9: TStaticText
          Left = 122
          Top = 21
          Width = 68
          Height = 20
          Caption = 'alpha_KCl '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 6
        end
        object DDSpinEdit18: TDDSpinEdit
          Left = 233
          Top = 141
          Width = 56
          Height = 27
          StrWidth = 2
          StrDecimals = 2
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Increment = 0.100000000000000000
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          Value = 0.500000000000000000
          OnChange = DDSpinEdit18Change
        end
        object DDSpinEdit7: TDDSpinEdit
          Left = 217
          Top = 40
          Width = 72
          Height = 27
          Hint = '100 ms in [Bazhenov]'
          StrWidth = 2
          StrDecimals = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Increment = 50.000000000000000000
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          Value = 100.000000000000000000
          OnChange = DDSpinEdit7Change
        end
        object StaticText7: TStaticText
          Left = 121
          Top = 47
          Width = 88
          Height = 20
          Caption = 'tau_Cl_0,   ms '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 9
        end
        object DDSpinEdit8: TDDSpinEdit
          Left = 217
          Top = 66
          Width = 72
          Height = 27
          StrWidth = 2
          StrDecimals = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Increment = 1000.000000000000000000
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
          Value = 20000.000000000000000000
          OnChange = DDSpinEdit8Change
        end
        object StaticText8: TStaticText
          Left = 121
          Top = 74
          Width = 94
          Height = 20
          Caption = 'tau_Cl_inf,   ms '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 11
        end
        object DDSpinEdit26: TDDSpinEdit
          Left = 176
          Top = 141
          Width = 53
          Height = 27
          StrWidth = 2
          StrDecimals = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Increment = 0.100000000000000000
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 12
          Value = 0.500000000000000000
          OnChange = DDSpinEdit26Change
        end
      end
      object GroupBox2: TGroupBox
        Left = 6
        Top = 273
        Width = 177
        Height = 88
        Caption = 'Diffusion'
        TabOrder = 14
        object CheckBox4: TCheckBox
          Left = 6
          Top = 17
          Width = 91
          Height = 16
          Caption = 'Diffusion'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          TabOrder = 0
          OnClick = CheckBox4Click
        end
        object DDSpinEdit13: TDDSpinEdit
          Left = 102
          Top = 34
          Width = 72
          Height = 27
          Hint = '0.0085 in [Bazhenov]'
          StrWidth = 2
          StrDecimals = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Increment = 0.500000000000000000
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Value = 3.500000000000000000
          OnChange = DDSpinEdit13Change
        end
        object StaticText11: TStaticText
          Left = 9
          Top = 37
          Width = 87
          Height = 20
          Caption = 'Bath Kext, mM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 2
        end
        object DDSpinEdit12: TDDSpinEdit
          Left = 102
          Top = 58
          Width = 72
          Height = 27
          Hint = '0.0085 in [Bazhenov]'
          StrWidth = 2
          StrDecimals = 4
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Increment = 0.001000000000000000
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          Value = 0.040000000000000000
          OnChange = DDSpinEdit12Change
        end
        object StaticText10: TStaticText
          Left = 9
          Top = 62
          Width = 58
          Height = 20
          Caption = 'Diff, 1/ms'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 4
        end
      end
      object DDSpinEdit16: TDDSpinEdit
        Left = 121
        Top = 246
        Width = 72
        Height = 27
        StrWidth = 2
        StrDecimals = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Increment = 10.000000000000000000
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 15
        Value = 130.000000000000000000
        OnChange = DDSpinEdit16Change
      end
      object StaticText14: TStaticText
        Left = 9
        Top = 250
        Width = 52
        Height = 20
        Caption = 'Clo, mM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
        TabOrder = 16
      end
      object GroupBox3: TGroupBox
        Left = 200
        Top = 0
        Width = 97
        Height = 105
        Caption = 'Initial, mM'
        TabOrder = 17
        object DDSpinEdit9: TDDSpinEdit
          Left = 33
          Top = 20
          Width = 56
          Height = 27
          StrWidth = 2
          StrDecimals = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Increment = 0.100000000000000000
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Value = 4.500000000000000000
        end
        object DDSpinEdit10: TDDSpinEdit
          Left = 33
          Top = 46
          Width = 56
          Height = 27
          StrWidth = 2
          StrDecimals = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Increment = 0.100000000000000000
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Value = 5.000000000000000000
        end
        object StaticText15: TStaticText
          Left = 9
          Top = 25
          Width = 12
          Height = 20
          Caption = 'K'
          TabOrder = 2
        end
        object StaticText16: TStaticText
          Left = 9
          Top = 50
          Width = 16
          Height = 20
          Caption = 'Cl'
          TabOrder = 3
        end
        object DDSpinEdit29: TDDSpinEdit
          Left = 33
          Top = 70
          Width = 56
          Height = 27
          StrWidth = 2
          StrDecimals = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Increment = 0.100000000000000000
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Value = 15.000000000000000000
        end
        object StaticText24: TStaticText
          Left = 9
          Top = 74
          Width = 22
          Height = 20
          Caption = 'Na'
          TabOrder = 5
        end
      end
      object StaticText17: TStaticText
        Left = 9
        Top = 90
        Width = 109
        Height = 20
        Caption = ' q_Na, muC/cm^2'
        TabOrder = 18
      end
      object StaticText18: TStaticText
        Left = 9
        Top = 64
        Width = 112
        Height = 20
        Caption = ' gL_Na, mS/cm^2 '
        TabOrder = 20
      end
      object DDSpinEdit21: TDDSpinEdit
        Left = 121
        Top = 59
        Width = 72
        Height = 27
        Hint = '0.02 in [Bazhenov]'
        StrWidth = 2
        StrDecimals = 3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Increment = 0.001000000000000000
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 21
        Value = 0.018000000000000000
      end
      object StaticText19: TStaticText
        Left = 201
        Top = 335
        Width = 161
        Height = 20
        Caption = 'Contribution to K of Pop 2,3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
        TabOrder = 22
      end
      object DDSpinEdit19: TDDSpinEdit
        Left = 433
        Top = 330
        Width = 55
        Height = 27
        StrWidth = 2
        StrDecimals = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Increment = 0.100000000000000000
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 23
        Value = 0.500000000000000000
        OnChange = DDSpinEdit19Change
      end
      object GroupBox4: TGroupBox
        Left = 306
        Top = 0
        Width = 183
        Height = 81
        Caption = 'Fixed concentrations, mM '
        TabOrder = 24
        object DDSpinEdit22: TDDSpinEdit
          Left = 33
          Top = 20
          Width = 56
          Height = 27
          StrWidth = 2
          StrDecimals = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Increment = 0.100000000000000000
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Value = 4.500000000000000000
          OnChange = DDSpinEdit22Change
        end
        object DDSpinEdit23: TDDSpinEdit
          Left = 33
          Top = 46
          Width = 56
          Height = 27
          StrWidth = 2
          StrDecimals = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Increment = 0.100000000000000000
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Value = 5.000000000000000000
          OnChange = DDSpinEdit23Change
        end
        object StaticText21: TStaticText
          Left = 9
          Top = 25
          Width = 12
          Height = 20
          Caption = 'K'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 2
        end
        object StaticText22: TStaticText
          Left = 9
          Top = 50
          Width = 16
          Height = 20
          Caption = 'Cl'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 3
        end
        object CheckBox2: TCheckBox
          Left = 98
          Top = 25
          Width = 79
          Height = 16
          Caption = ' K fixed'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          TabOrder = 4
          OnClick = CheckBox2Click
        end
        object CheckBox3: TCheckBox
          Left = 98
          Top = 50
          Width = 79
          Height = 16
          Caption = 'Cl fixed'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          TabOrder = 5
          OnClick = CheckBox3Click
        end
      end
      object StaticText23: TStaticText
        Left = 201
        Top = 308
        Width = 101
        Height = 20
        Caption = 'Vgaba_shift, mV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ParentFont = False
        TabOrder = 25
      end
      object DDSpinEdit27: TDDSpinEdit
        Left = 373
        Top = 302
        Width = 55
        Height = 27
        StrWidth = 2
        StrDecimals = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Increment = 1.000000000000000000
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 28
        Value = 10.000000000000000000
        OnChange = DDSpinEdit27Change
      end
      object DDSpinEdit17: TDDSpinEdit
        Left = 121
        Top = 86
        Width = 72
        Height = 27
        Hint = '0.1muC/cm^2=0.1mA/cm^2 * 1ms'
        StrWidth = 2
        StrDecimals = 3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Increment = 0.001000000000000000
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 19
        Value = 0.100000000000000000
      end
      object DDSpinEdit3: TDDSpinEdit
        Left = 121
        Top = 114
        Width = 72
        Height = 27
        Hint = '200 in [Bazhenov]'
        StrWidth = 2
        StrDecimals = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Increment = 199.000000000000000000
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Value = 1.000000000000000000
        OnChange = DDSpinEdit3Change
      end
      object RadioGroup3: TRadioGroup
        Left = 496
        Top = 0
        Width = 97
        Height = 81
        Caption = 'VL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsUnderline]
        ItemIndex = 0
        Items.Strings = (
          'fixed'
          'f(K,Cl,Na)'
          'corrected')
        ParentFont = False
        TabOrder = 29
        OnClick = RadioGroup3Click
      end
      object DDSpinEdit28: TDDSpinEdit
        Left = 373
        Top = 330
        Width = 55
        Height = 27
        StrWidth = 2
        StrDecimals = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Increment = 0.100000000000000000
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 30
        Value = 0.200000000000000000
        OnChange = DDSpinEdit28Change
      end
      object GroupBox5: TGroupBox
        Left = 507
        Top = 121
        Width = 118
        Height = 109
        Caption = 'Na-K-pump'
        TabOrder = 31
        object StaticText20: TStaticText
          Left = 9
          Top = 81
          Width = 32
          Height = 20
          Caption = 'Imax'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsUnderline]
          ParentFont = False
          TabOrder = 0
        end
        object DDSpinEdit20: TDDSpinEdit
          Left = 48
          Top = 77
          Width = 65
          Height = 27
          Hint = 'muA/cm^2'
          StrWidth = 2
          StrDecimals = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          Increment = 0.100000000000000000
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Value = 20.000000000000000000
          OnChange = DDSpinEdit20Change
        end
        object RadioGroup4: TRadioGroup
          Left = 10
          Top = 16
          Width = 103
          Height = 57
          Caption = 'type'
          ItemIndex = 1
          Items.Strings = (
            'Bazhenov'
            'Cressman')
          TabOrder = 2
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Currents'
      ImageIndex = 1
      object Chart2: TChart
        Left = 0
        Top = 0
        Width = 657
        Height = 361
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'VK and VCl calculated by ')
        Title.Visible = False
        BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -17
        BottomAxis.LabelsFont.Name = 'Arial'
        BottomAxis.LabelsFont.Style = []
        BottomAxis.Title.Caption = 'ms'
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -17
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = []
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -17
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = []
        LeftAxis.Title.Caption = 'muA/cm^2'
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -17
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = []
        Legend.Alignment = laTop
        Legend.ColorWidth = 60
        Legend.Font.Charset = DEFAULT_CHARSET
        Legend.Font.Color = clBlack
        Legend.Font.Height = -17
        Legend.Font.Name = 'Arial'
        Legend.Font.Style = []
        Legend.LegendStyle = lsSeries
        Legend.ShadowSize = 0
        Legend.TopPos = 0
        View3D = False
        Color = 10673344
        TabOrder = 0
        object Button4: TButton
          Left = 608
          Top = 336
          Width = 41
          Height = 17
          Caption = 'BMP'
          TabOrder = 0
          OnClick = Button4Click
        end
        object Series3: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Pump'
          OnDblClick = Series3DblClick
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series4: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = 16744448
          Title = 'IK'
          OnDblClick = Series4DblClick
          LinePen.Width = 3
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series7: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = 16777088
          Title = 'IK_leak'
          OnDblClick = Series7DblClick
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series17: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = 16744576
          Title = 'IK_glu'
          OnDblClick = Series17DblClick
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series10: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = 8388672
          Title = 'KCC2'
          OnDblClick = Series10DblClick
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series11: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlack
          Title = 'Glia+Diff'
          OnDblClick = Series11DblClick
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series8: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = 65408
          Title = 'ICl_leak'
          OnDblClick = Series8DblClick
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series9: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          Title = 'IGABA'
          OnDblClick = Series9DblClick
          LinePen.Width = 3
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series18: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = 33023
          Title = 'INa_glu'
          OnDblClick = Series18DblClick
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Concentrations'
      ImageIndex = 2
      object Chart3: TChart
        Left = 0
        Top = 0
        Width = 657
        Height = 361
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'VK and VCl calculated by ')
        Title.Visible = False
        BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -17
        BottomAxis.LabelsFont.Name = 'Arial'
        BottomAxis.LabelsFont.Style = []
        BottomAxis.Title.Caption = 'ms'
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -17
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = []
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -17
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = []
        LeftAxis.Title.Caption = 'mM'
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -17
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = []
        Legend.Alignment = laTop
        Legend.ColorWidth = 85
        Legend.Font.Charset = DEFAULT_CHARSET
        Legend.Font.Color = clBlack
        Legend.Font.Height = -17
        Legend.Font.Name = 'Arial'
        Legend.Font.Style = []
        Legend.LegendStyle = lsSeries
        Legend.ShadowSize = 0
        Legend.TopPos = 0
        View3D = False
        Color = 10673344
        TabOrder = 0
        object Button5: TButton
          Left = 608
          Top = 336
          Width = 41
          Height = 17
          Caption = 'BMP'
          TabOrder = 0
          OnClick = Button5Click
        end
        object Series5: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = 16744448
          Title = 'K'
          OnDblClick = Series5DblClick
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series6: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          Title = 'Cl'
          OnDblClick = Series6DblClick
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series13: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = 208892
          Title = 'Na'
          OnDblClick = Series13DblClick
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Reversals'
      ImageIndex = 3
      object Chart1: TChart
        Left = 0
        Top = 0
        Width = 657
        Height = 361
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'VK and VCl calculated by ')
        Title.Visible = False
        BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
        BottomAxis.LabelsFont.Color = clBlack
        BottomAxis.LabelsFont.Height = -17
        BottomAxis.LabelsFont.Name = 'Arial'
        BottomAxis.LabelsFont.Style = []
        BottomAxis.Title.Caption = 'ms'
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -17
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = []
        LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
        LeftAxis.LabelsFont.Color = clBlack
        LeftAxis.LabelsFont.Height = -17
        LeftAxis.LabelsFont.Name = 'Arial'
        LeftAxis.LabelsFont.Style = []
        LeftAxis.Title.Caption = 'mV'
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -17
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = []
        Legend.Alignment = laTop
        Legend.ColorWidth = 15
        Legend.Font.Charset = DEFAULT_CHARSET
        Legend.Font.Color = clBlack
        Legend.Font.Height = -17
        Legend.Font.Name = 'Arial'
        Legend.Font.Style = []
        Legend.LegendStyle = lsSeries
        Legend.ShadowSize = 0
        Legend.TopPos = 0
        RightAxis.LabelsFont.Charset = DEFAULT_CHARSET
        RightAxis.LabelsFont.Color = clRed
        RightAxis.LabelsFont.Height = -17
        RightAxis.LabelsFont.Name = 'Arial'
        RightAxis.LabelsFont.Style = []
        RightAxis.Title.Caption = 'VNa, mV'
        RightAxis.Title.Font.Charset = DEFAULT_CHARSET
        RightAxis.Title.Font.Color = clRed
        RightAxis.Title.Font.Height = -17
        RightAxis.Title.Font.Name = 'Arial'
        RightAxis.Title.Font.Style = []
        View3D = False
        Color = 10673344
        TabOrder = 0
        object Button6: TButton
          Left = 601
          Top = 336
          Width = 40
          Height = 17
          Caption = 'BMP'
          TabOrder = 0
          OnClick = Button6Click
        end
        object Button9: TButton
          Left = 503
          Top = 336
          Width = 98
          Height = 17
          Caption = 'As for Rate_E'
          TabOrder = 1
          OnClick = Button9Click
        end
        object Button7: TButton
          Left = 463
          Top = 336
          Width = 40
          Height = 17
          Caption = 'Auto'
          TabOrder = 2
          OnClick = Button7Click
        end
        object Series1: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = 16744448
          Title = 'VK'
          OnDblClick = Series1DblClick
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series2: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          Title = 'VGABA'
          OnDblClick = Series2DblClick
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series12: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'VNa'
          VertAxis = aRightAxis
          OnDblClick = Series12DblClick
          LinePen.Color = clMaroon
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series14: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clLime
          Title = 'VGABA[1]'
          OnDblClick = Series14DblClick
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series15: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = 4227327
          Title = 'VNa[1]'
          VertAxis = aRightAxis
          OnDblClick = Series15DblClick
          LinePen.Color = clMaroon
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series16: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clYellow
          Title = 'VL'
          OnDblClick = Series16DblClick
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
    end
  end
  object RadioGroup2: TRadioGroup
    Left = 464
    Top = 109
    Width = 193
    Height = 36
    Caption = 'View in'
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Pop 1'
      'Pop 2'
      'Pop 3')
    TabOrder = 1
    OnClick = RadioGroup2Click
  end
end
