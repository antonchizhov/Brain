object Form4: TForm4
  Left = 0
  Top = 10
  Width = 1170
  Height = 770
  AutoSize = True
  Caption = 'Form4: Parameters'
  Color = 11206655
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -8
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Label9: TLabel
    Left = 9
    Top = 636
    Width = 79
    Height = 16
    Caption = 'HH_type[1]'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 9
    Top = 652
    Width = 79
    Height = 16
    Caption = 'HH_type[1]'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 9
    Top = 668
    Width = 79
    Height = 16
    Caption = 'HH_type[1]'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label12: TLabel
    Left = 9
    Top = 684
    Width = 79
    Height = 16
    Caption = 'HH_type[1]'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox3: TGroupBox
    Left = 618
    Top = 0
    Width = 335
    Height = 129
    Caption = 'Intracellular stimulation and Noise '
    TabOrder = 5
    Visible = False
    object CheckBox8: TCheckBox
      Left = 167
      Top = 58
      Width = 159
      Height = 21
      Caption = 'Noise inside cell '
      TabOrder = 10
    end
    object DDSpinEdit46: TDDSpinEdit
      Left = 96
      Top = 15
      Width = 63
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 5.000000000000000000
      ParentFont = False
      TabOrder = 0
      OnChange = DDSpinEdit46Change
      OnDblClick = DDSpinEdit46DblClick
    end
    object StaticText28: TStaticText
      Left = 9
      Top = 17
      Width = 72
      Height = 20
      Caption = ' I_ind, pA '
      TabOrder = 1
    end
    object StaticText29: TStaticText
      Left = 9
      Top = 59
      Width = 83
      Height = 20
      Caption = ' nu_ind, Hz '
      TabOrder = 2
    end
    object StaticText30: TStaticText
      Left = 9
      Top = 80
      Width = 73
      Height = 20
      Caption = ' t_ind, ms '
      TabOrder = 5
    end
    object StaticText40: TStaticText
      Left = 167
      Top = 17
      Width = 102
      Height = 20
      Caption = ' tauNoise, ms '
      TabOrder = 6
    end
    object DDSpinEdit6: TDDSpinEdit
      Left = 268
      Top = 15
      Width = 62
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 1.000000000000000000
      ParentFont = False
      TabOrder = 7
      OnChange = DDSpinEdit6Change
    end
    object StaticText41: TStaticText
      Left = 167
      Top = 37
      Width = 99
      Height = 20
      Caption = ' NoiseToSgn '
      TabOrder = 8
    end
    object DDSpinEdit70: TDDSpinEdit
      Left = 268
      Top = 34
      Width = 62
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.100000000000000000
      ParentFont = False
      TabOrder = 9
      OnChange = DDSpinEdit70Change
    end
    object ComboBox1: TComboBox
      Left = 167
      Top = 78
      Width = 164
      Height = 24
      Hint = 'For what cells I_ind is set.'
      ItemHeight = 16
      ItemIndex = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      Text = 'I_ind in E-cells'
      Items.Strings = (
        'I_ind in E and I'
        'I_ind in I-cells'
        'I_ind in E-cells'
        'Meander')
    end
    object DDSpinEdit13: TDDSpinEdit
      Left = 96
      Top = 34
      Width = 63
      Height = 26
      Hint = 'in C_m/tau_m'
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.100000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      OnChange = DDSpinEdit13Change
      OnDblClick = DDSpinEdit13DblClick
    end
    object StaticText12: TStaticText
      Left = 9
      Top = 38
      Width = 79
      Height = 20
      Caption = ' s_ind/g_in'
      TabOrder = 13
    end
    object DDSpinEdit47: TDDSpinEdit
      Left = 96
      Top = 57
      Width = 63
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 1.000000000000000000
      ParentFont = False
      TabOrder = 3
      OnChange = DDSpinEdit47Change
      OnDblClick = DDSpinEdit47DblClick
    end
    object DDSpinEdit48: TDDSpinEdit
      Left = 96
      Top = 78
      Width = 63
      Height = 26
      Hint = 
        'For the secod stimulus, set "t0s2", t_ind also determined the en' +
        'd of visual stimulus.'
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 1.000000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnChange = DDSpinEdit48Change
      OnDblClick = DDSpinEdit48DblClick
    end
    object DDSpinEdit65: TDDSpinEdit
      Left = 96
      Top = 98
      Width = 63
      Height = 26
      Hint = 'For the secod stimulus, set "t0s2"'
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 1.000000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
      OnChange = DDSpinEdit65Change
    end
    object StaticText10: TStaticText
      Left = 9
      Top = 101
      Width = 81
      Height = 20
      Caption = ' t0_ind, ms '
      TabOrder = 15
    end
    object ComboBox7: TComboBox
      Left = 167
      Top = 100
      Width = 164
      Height = 24
      ItemHeight = 16
      TabOrder = 16
      Text = 'Constant'
      Items.Strings = (
        'Constant'
        'Sin(2*pi*nu*t)'
        'sin with growing freq.'
        '(1-cos(2*pi*nu*t))/2'
        'Current from file'
        'cos with growing freq.')
    end
  end
  object gsynC1: TgsynC
    Left = 0
    Top = 230
    Width = 267
    Height = 382
    NSyn = 50
    OnDblClick = gsynC1DblClick
    OnChange = gsynC1Change
    OnMouseDown = gsynC1MouseDown
  end
  object DDSpinEdit7: TDDSpinEdit
    Left = 84
    Top = 25
    Width = 74
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 50.000000000000000000
    TabOrder = 0
    OnChange = DDSpinEdit7Change
  end
  object StaticText27: TStaticText
    Left = 169
    Top = 30
    Width = 43
    Height = 20
    Caption = 'NPop'
    TabOrder = 4
  end
  object DDSpinEdit45: TDDSpinEdit
    Left = 217
    Top = 25
    Width = 48
    Height = 26
    Hint = 'Number of populations. DblClick sets 2.'
    StrWidth = 2
    StrDecimals = 0
    Increment = 1.000000000000000000
    TabOrder = 3
    Value = 2.000000000000000000
    OnChange = DDSpinEdit45Change
    OnDblClick = DDSpinEdit45DblClick
  end
  object GroupBox5: TGroupBox
    Left = 758
    Top = 357
    Width = 195
    Height = 116
    Caption = 'Show parameters '
    TabOrder = 7
    Visible = False
    object DDSpinEdit71: TDDSpinEdit
      Left = 64
      Top = 16
      Width = 49
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 1.000000000000000000
      TabOrder = 0
      OnChange = DDSpinEdit71Change
    end
    object StaticText42: TStaticText
      Left = 7
      Top = 18
      Width = 55
      Height = 20
      Caption = 'n_show'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object DDSpinEdit80: TDDSpinEdit
      Left = 112
      Top = 60
      Width = 49
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 1.000000000000000000
      TabOrder = 2
      OnChange = DDSpinEdit80Change
    end
    object DDSpinEdit81: TDDSpinEdit
      Left = 64
      Top = 36
      Width = 49
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 1.000000000000000000
      TabOrder = 3
      OnChange = DDSpinEdit81Change
    end
    object StaticText52: TStaticText
      Left = 7
      Top = 64
      Width = 99
      Height = 20
      Caption = 'n_DrawPhase'
      TabOrder = 4
    end
    object StaticText53: TStaticText
      Left = 7
      Top = 41
      Width = 56
      Height = 20
      Caption = 'n_Write'
      TabOrder = 5
    end
    object CheckBox23: TCheckBox
      Left = 9
      Top = 89
      Width = 88
      Height = 17
      Caption = 'showBG'
      TabOrder = 6
      OnClick = CheckBox23Click
    end
  end
  object GroupBox8: TGroupBox
    Left = 618
    Top = 478
    Width = 335
    Height = 67
    Caption = 'Extrasynaptic mediator affects  alpha, beta'
    TabOrder = 9
    Visible = False
    object StaticText58: TStaticText
      Left = 57
      Top = 18
      Width = 143
      Height = 20
      Caption = 'AMPA  NMDA GABA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object DDSpinEdit89: TDDSpinEdit
      Left = 105
      Top = 37
      Width = 48
      Height = 26
      Hint = 'factorI'
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 1.000000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Value = 15.000000000000000000
      OnChange = DDSpinEdit89Change
      OnDblClick = DDSpinEdit89DblClick
    end
    object StaticText59: TStaticText
      Left = 9
      Top = 39
      Width = 43
      Height = 20
      Caption = 'factor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object DDSpinEdit90: TDDSpinEdit
      Left = 288
      Top = 37
      Width = 42
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 1.000000000000000000
      ParentFont = False
      TabOrder = 3
      Value = 5.000000000000000000
      OnDblClick = DDSpinEdit90DblClick
    end
    object StaticText60: TStaticText
      Left = 217
      Top = 39
      Width = 69
      Height = 20
      Caption = 'alpha, Hz'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnDblClick = StaticText60DblClick
    end
    object DDSpinEdit92: TDDSpinEdit
      Left = 57
      Top = 37
      Width = 48
      Height = 26
      Hint = 'factorE'
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 1.000000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      Value = 15.000000000000000000
      OnChange = DDSpinEdit92Change
      OnDblClick = DDSpinEdit92DblClick
    end
    object DDSpinEdit117: TDDSpinEdit
      Left = 153
      Top = 37
      Width = 55
      Height = 26
      Hint = 'factorI'
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 1.000000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      Value = 15.000000000000000000
      OnChange = DDSpinEdit117Change
      OnDblClick = DDSpinEdit117DblClick
    end
  end
  object GroupBox9: TGroupBox
    Left = 521
    Top = 357
    Width = 232
    Height = 116
    Caption = 'Others'
    TabOrder = 10
    Visible = False
    object CheckBox11: TCheckBox
      Left = 9
      Top = 41
      Width = 112
      Height = 17
      Caption = 'Background'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object DDSpinEdit12: TDDSpinEdit
      Left = 169
      Top = 38
      Width = 51
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 50.000000000000000000
      TabOrder = 1
      Value = 100.000000000000000000
      OnChange = DDSpinEdit12Change
    end
    object StaticText11: TStaticText
      Left = 134
      Top = 41
      Width = 33
      Height = 20
      Caption = ' tBG'
      TabOrder = 2
    end
    object StaticText25: TStaticText
      Left = 9
      Top = 18
      Width = 49
      Height = 20
      Caption = 'dt, ms '
      TabOrder = 3
    end
    object DDSpinEdit43: TDDSpinEdit
      Left = 73
      Top = 14
      Width = 72
      Height = 26
      StrWidth = 2
      StrDecimals = 4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.050000000000000000
      ParentFont = False
      TabOrder = 4
      OnChange = DDSpinEdit43Change
    end
    object CheckBox19: TCheckBox
      Left = 9
      Top = 63
      Width = 200
      Height = 16
      Caption = 'Predictor-Corrector'
      TabOrder = 5
      OnClick = CheckBox19Click
    end
    object DDSpinEdit100: TDDSpinEdit
      Left = 88
      Top = 80
      Width = 65
      Height = 26
      Hint = 'limit: mS/cm^2 for G;  mV for u; -35 mV for V'
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.010000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnChange = DDSpinEdit100Change
    end
    object StaticText51: TStaticText
      Left = 9
      Top = 84
      Width = 76
      Height = 20
      Caption = 'DepBlock:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
    object DDSpinEdit72: TDDSpinEdit
      Left = 154
      Top = 80
      Width = 65
      Height = 26
      Hint = 'slope: 7mV for V'
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.010000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnChange = DDSpinEdit72Change
    end
  end
  object Button4: TButton
    Left = 202
    Top = 229
    Width = 64
    Height = 16
    Caption = 'Binzegger'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -10
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    Visible = False
    OnClick = Button4Click
  end
  object GroupBox2: TGroupBox
    Left = 268
    Top = 492
    Width = 344
    Height = 243
    Caption = 'Synaptic kinetics'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -10
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object StaticText16: TStaticText
      Left = 60
      Top = 28
      Width = 94
      Height = 20
      Caption = 'alpha     beta'
      TabOrder = 0
    end
    object StaticText23: TStaticText
      Left = 286
      Top = 28
      Width = 36
      Height = 20
      Caption = 'Vrev'
      TabOrder = 25
    end
    object StaticText22: TStaticText
      Left = 172
      Top = 28
      Width = 94
      Height = 20
      Caption = 'alpha     beta'
      TabOrder = 22
    end
    object DDSpinEdit44: TDDSpinEdit
      Left = 281
      Top = 148
      Width = 55
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 0.050000000000000000
      TabOrder = 29
      OnChange = DDSpinEdit44Change
    end
    object StaticText18: TStaticText
      Left = 9
      Top = 50
      Width = 46
      Height = 20
      Caption = 'AMPA'
      TabOrder = 2
    end
    object StaticText19: TStaticText
      Left = 9
      Top = 76
      Width = 48
      Height = 20
      Caption = 'NMDA'
      TabOrder = 3
    end
    object StaticText20: TStaticText
      Left = 9
      Top = 98
      Width = 45
      Height = 20
      Caption = 'GABA'
      TabOrder = 4
    end
    object StaticText21: TStaticText
      Left = 9
      Top = 124
      Width = 45
      Height = 20
      Caption = 'GABB'
      TabOrder = 5
    end
    object DDSpinEdit22: TDDSpinEdit
      Left = 57
      Top = 47
      Width = 48
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 10.000000000000000000
      PopupMenu = PopupMenu1
      TabOrder = 6
      OnChange = DDSpinEdit22Change
      OnMouseDown = DDSpinEdit22MouseDown
    end
    object DDSpinEdit23: TDDSpinEdit
      Left = 57
      Top = 71
      Width = 48
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 10.000000000000000000
      PopupMenu = PopupMenu2
      TabOrder = 7
      OnChange = DDSpinEdit23Change
    end
    object DDSpinEdit24: TDDSpinEdit
      Left = 57
      Top = 95
      Width = 48
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 10.000000000000000000
      PopupMenu = PopupMenu3
      TabOrder = 8
      OnChange = DDSpinEdit24Change
      OnMouseDown = DDSpinEdit24MouseDown
    end
    object DDSpinEdit25: TDDSpinEdit
      Left = 57
      Top = 119
      Width = 48
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 1.000000000000000000
      PopupMenu = PopupMenu4
      TabOrder = 9
      OnChange = DDSpinEdit25Change
    end
    object DDSpinEdit26: TDDSpinEdit
      Left = 105
      Top = 47
      Width = 56
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 10.000000000000000000
      PopupMenu = PopupMenu1
      TabOrder = 10
      OnChange = DDSpinEdit26Change
      OnMouseDown = DDSpinEdit26MouseDown
    end
    object DDSpinEdit27: TDDSpinEdit
      Left = 105
      Top = 71
      Width = 56
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 10.000000000000000000
      PopupMenu = PopupMenu2
      TabOrder = 11
      OnChange = DDSpinEdit27Change
    end
    object DDSpinEdit28: TDDSpinEdit
      Left = 105
      Top = 95
      Width = 56
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 10.000000000000000000
      PopupMenu = PopupMenu3
      TabOrder = 12
      OnChange = DDSpinEdit28Change
      OnMouseDown = DDSpinEdit28MouseDown
    end
    object DDSpinEdit29: TDDSpinEdit
      Left = 105
      Top = 119
      Width = 56
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 1.000000000000000000
      PopupMenu = PopupMenu4
      TabOrder = 13
      OnChange = DDSpinEdit29Change
    end
    object DDSpinEdit30: TDDSpinEdit
      Left = 167
      Top = 47
      Width = 50
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 10.000000000000000000
      PopupMenu = PopupMenu5
      TabOrder = 14
      OnChange = DDSpinEdit30Change
      OnMouseDown = DDSpinEdit30MouseDown
    end
    object DDSpinEdit31: TDDSpinEdit
      Left = 167
      Top = 71
      Width = 50
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 10.000000000000000000
      PopupMenu = PopupMenu6
      TabOrder = 15
      OnChange = DDSpinEdit31Change
    end
    object DDSpinEdit32: TDDSpinEdit
      Left = 167
      Top = 95
      Width = 50
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 10.000000000000000000
      PopupMenu = PopupMenu7
      TabOrder = 16
      OnChange = DDSpinEdit32Change
      OnMouseDown = DDSpinEdit32MouseDown
    end
    object DDSpinEdit33: TDDSpinEdit
      Left = 167
      Top = 119
      Width = 50
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 1.000000000000000000
      PopupMenu = PopupMenu8
      TabOrder = 17
      OnChange = DDSpinEdit33Change
    end
    object DDSpinEdit34: TDDSpinEdit
      Left = 217
      Top = 47
      Width = 56
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 10.000000000000000000
      PopupMenu = PopupMenu5
      TabOrder = 18
      OnChange = DDSpinEdit34Change
      OnMouseDown = DDSpinEdit34MouseDown
    end
    object DDSpinEdit35: TDDSpinEdit
      Left = 217
      Top = 71
      Width = 56
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 10.000000000000000000
      PopupMenu = PopupMenu6
      TabOrder = 19
      OnChange = DDSpinEdit35Change
    end
    object DDSpinEdit36: TDDSpinEdit
      Left = 217
      Top = 95
      Width = 56
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 10.000000000000000000
      PopupMenu = PopupMenu7
      TabOrder = 20
      OnChange = DDSpinEdit36Change
      OnMouseDown = DDSpinEdit36MouseDown
    end
    object DDSpinEdit37: TDDSpinEdit
      Left = 217
      Top = 119
      Width = 56
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 1.000000000000000000
      PopupMenu = PopupMenu8
      TabOrder = 21
      OnChange = DDSpinEdit37Change
    end
    object CheckBox5: TCheckBox
      Left = 9
      Top = 148
      Width = 168
      Height = 16
      Caption = 'IfInSyn_al_EQ_beta'
      TabOrder = 23
      OnMouseUp = CheckBox5MouseUp
    end
    object DDSpinEdit38: TDDSpinEdit
      Left = 281
      Top = 47
      Width = 55
      Height = 26
      StrWidth = 2
      StrDecimals = 1
      Increment = 1.000000000000000000
      TabOrder = 24
      OnChange = DDSpinEdit38Change
      OnMouseDown = DDSpinEdit38MouseDown
    end
    object DDSpinEdit39: TDDSpinEdit
      Left = 281
      Top = 71
      Width = 55
      Height = 26
      StrWidth = 2
      StrDecimals = 1
      Increment = 1.000000000000000000
      TabOrder = 26
      OnChange = DDSpinEdit39Change
    end
    object DDSpinEdit40: TDDSpinEdit
      Left = 281
      Top = 95
      Width = 55
      Height = 26
      StrWidth = 2
      StrDecimals = 1
      Increment = 1.000000000000000000
      TabOrder = 27
      OnChange = DDSpinEdit40Change
      OnMouseDown = DDSpinEdit40MouseDown
    end
    object DDSpinEdit41: TDDSpinEdit
      Left = 281
      Top = 119
      Width = 55
      Height = 26
      StrWidth = 2
      StrDecimals = 1
      Increment = 1.000000000000000000
      TabOrder = 28
      OnChange = DDSpinEdit41Change
    end
    object StaticText26: TStaticText
      Left = 226
      Top = 151
      Width = 53
      Height = 20
      Hint = 'in mM'
      Caption = 'Mg,mM'
      TabOrder = 30
    end
    object CheckBox15: TCheckBox
      Left = 9
      Top = 164
      Width = 200
      Height = 16
      Caption = 'IfSigmoidForPresynRate'
      TabOrder = 31
      OnMouseUp = CheckBox15MouseUp
    end
    object CheckBox18: TCheckBox
      Left = 9
      Top = 180
      Width = 136
      Height = 16
      Caption = 'If_m_Saturates'
      TabOrder = 32
      OnMouseUp = CheckBox18MouseUp
    end
    object StaticText33: TStaticText
      Left = 4
      Top = 197
      Width = 113
      Height = 20
      Caption = ' t_axon de E,ms'
      TabOrder = 33
    end
    object StaticText70: TStaticText
      Left = 4
      Top = 217
      Width = 111
      Height = 20
      Caption = ' t_axon de I, ms'
      TabOrder = 34
    end
    object DDSpinEdit58: TDDSpinEdit
      Left = 122
      Top = 196
      Width = 56
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 1000.000000000000000000
      TabOrder = 35
      OnChange = DDSpinEdit58Change
    end
    object DDSpinEdit59: TDDSpinEdit
      Left = 122
      Top = 215
      Width = 56
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 10.000000000000000000
      TabOrder = 36
      OnChange = DDSpinEdit59Change
    end
    object DDSpinEdit112: TDDSpinEdit
      Left = 178
      Top = 196
      Width = 57
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 10.000000000000000000
      TabOrder = 37
      OnChange = DDSpinEdit112Change
    end
    object DDSpinEdit113: TDDSpinEdit
      Left = 178
      Top = 215
      Width = 57
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 10.000000000000000000
      TabOrder = 38
      OnChange = DDSpinEdit113Change
    end
    object StaticText45: TStaticText
      Left = 203
      Top = 14
      Width = 20
      Height = 20
      Caption = 'Int'
      TabOrder = 39
    end
    object StaticText17: TStaticText
      Left = 91
      Top = 14
      Width = 27
      Height = 20
      Caption = 'Pyr'
      TabOrder = 1
    end
    object StaticText72: TStaticText
      Left = 252
      Top = 197
      Width = 83
      Height = 20
      Caption = 'Speed, m/s'
      TabOrder = 41
    end
    object DDSpinEdit101: TDDSpinEdit
      Left = 273
      Top = 215
      Width = 56
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 0.050000000000000000
      TabOrder = 40
      Value = 0.300000000000000000
      OnChange = DDSpinEdit101Change
    end
    object CheckBox25: TCheckBox
      Left = 214
      Top = 176
      Width = 120
      Height = 16
      Alignment = taLeftJustify
      Caption = 'dendr. NMDA'
      TabOrder = 42
      OnClick = CheckBox25Click
    end
  end
  object GroupBox4: TGroupBox
    Left = 268
    Top = 0
    Width = 344
    Height = 178
    Caption = 'Passive props.:  Pyr           Int            Reg. cell '
    TabOrder = 6
    object StaticText24: TStaticText
      Left = 9
      Top = 18
      Width = 78
      Height = 20
      Caption = ' Vrest, mV '
      TabOrder = 0
    end
    object DDSpinEdit42: TDDSpinEdit
      Left = 252
      Top = 16
      Width = 69
      Height = 26
      StrWidth = 2
      StrDecimals = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 5.000000000000000000
      ParentFont = False
      TabOrder = 1
      OnChange = DDSpinEdit42Change
      OnDblClick = DDSpinEdit42DblClick
    end
    object DDSpinEdit49: TDDSpinEdit
      Left = 105
      Top = 16
      Width = 64
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 1.000000000000000000
      ParentFont = False
      TabOrder = 2
      OnChange = DDSpinEdit49Change
      OnMouseDown = DDSpinEdit49MouseDown
    end
    object DDSpinEdit50: TDDSpinEdit
      Left = 170
      Top = 16
      Width = 69
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 1.000000000000000000
      ParentFont = False
      TabOrder = 3
      OnChange = DDSpinEdit50Change
      OnMouseDown = DDSpinEdit50MouseDown
    end
    object StaticText6: TStaticText
      Left = 9
      Top = 57
      Width = 89
      Height = 20
      Caption = ' tau_m0, ms '
      TabOrder = 4
    end
    object StaticText5: TStaticText
      Left = 9
      Top = 132
      Width = 95
      Height = 20
      Caption = ' ThrShift, mV '
      TabOrder = 8
    end
    object StaticText31: TStaticText
      Left = 9
      Top = 151
      Width = 85
      Height = 20
      Caption = ' sgm_V, mV'
      TabOrder = 12
    end
    object DDSpinEdit4: TDDSpinEdit
      Left = 252
      Top = 111
      Width = 69
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 1.000000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 17
      OnChange = DDSpinEdit4Change
      OnMouseMove = DDSpinEdit4MouseMove
    end
    object DDSpinEdit116: TDDSpinEdit
      Left = 252
      Top = 130
      Width = 69
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 1.000000000000000000
      ParentFont = False
      TabOrder = 16
      OnChange = DDSpinEdit116Change
    end
    object StaticText65: TStaticText
      Left = 9
      Top = 37
      Width = 73
      Height = 20
      Caption = ' C_membr'
      TabOrder = 18
    end
    object DDSpinEdit96: TDDSpinEdit
      Left = 105
      Top = 34
      Width = 64
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.100000000000000000
      ParentFont = False
      TabOrder = 19
      OnChange = DDSpinEdit96Change
      OnMouseDown = DDSpinEdit96MouseDown
    end
    object DDSpinEdit97: TDDSpinEdit
      Left = 170
      Top = 34
      Width = 69
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.100000000000000000
      ParentFont = False
      TabOrder = 20
      OnChange = DDSpinEdit97Change
      OnMouseDown = DDSpinEdit97MouseDown
    end
    object StaticText71: TStaticText
      Left = 9
      Top = 75
      Width = 22
      Height = 20
      Caption = ' ro'
      TabOrder = 21
    end
    object StaticText2: TStaticText
      Left = 9
      Top = 113
      Width = 89
      Height = 20
      Caption = ' Square*1e5'
      TabOrder = 24
    end
    object DDSpinEdit52: TDDSpinEdit
      Left = 170
      Top = 54
      Width = 69
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 1.000000000000000000
      ParentFont = False
      TabOrder = 6
      OnChange = DDSpinEdit52Change
      OnMouseDown = DDSpinEdit52MouseDown
    end
    object DDSpinEdit51: TDDSpinEdit
      Left = 105
      Top = 54
      Width = 64
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 1.000000000000000000
      ParentFont = False
      TabOrder = 5
      OnChange = DDSpinEdit51Change
      OnMouseDown = DDSpinEdit51MouseDown
    end
    object DDSpinEdit114: TDDSpinEdit
      Left = 105
      Top = 73
      Width = 64
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.100000000000000000
      ParentFont = False
      TabOrder = 22
      OnChange = DDSpinEdit114Change
    end
    object DDSpinEdit115: TDDSpinEdit
      Left = 170
      Top = 73
      Width = 69
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.100000000000000000
      ParentFont = False
      TabOrder = 23
      OnChange = DDSpinEdit115Change
    end
    object CheckBox20: TCheckBox
      Left = 250
      Top = 156
      Width = 70
      Height = 16
      Alignment = taLeftJustify
      Caption = 'IfNoise'
      Checked = True
      State = cbChecked
      TabOrder = 25
    end
    object ComboBox6: TComboBox
      Left = 252
      Top = 37
      Width = 88
      Height = 25
      Color = 11206604
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ItemHeight = 17
      ParentFont = False
      TabOrder = 26
      Text = 'ComboBox1'
      OnChange = ComboBox6Change
      Items.Strings = (
        'V-clamp'
        'I-clamp'
        'Rate'
        'VatE')
    end
    object DDSpinEdit77: TDDSpinEdit
      Left = 105
      Top = 92
      Width = 64
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.100000000000000000
      ParentFont = False
      TabOrder = 27
      OnChange = DDSpinEdit77Change
    end
    object DDSpinEdit78: TDDSpinEdit
      Left = 170
      Top = 92
      Width = 69
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.100000000000000000
      ParentFont = False
      TabOrder = 28
      OnChange = DDSpinEdit78Change
    end
    object DDSpinEdit2: TDDSpinEdit
      Left = 105
      Top = 111
      Width = 64
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 1.000000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnChange = DDSpinEdit2Change
      OnMouseDown = DDSpinEdit2MouseDown
      OnMouseMove = DDSpinEdit2MouseMove
    end
    object DDSpinEdit5: TDDSpinEdit
      Left = 105
      Top = 130
      Width = 64
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 1.000000000000000000
      ParentFont = False
      TabOrder = 9
      OnChange = DDSpinEdit5Change
      OnMouseDown = DDSpinEdit5MouseDown
    end
    object DDSpinEdit55: TDDSpinEdit
      Left = 105
      Top = 149
      Width = 64
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.200000000000000000
      ParentFont = False
      TabOrder = 13
      OnChange = DDSpinEdit55Change
      OnMouseDown = DDSpinEdit55MouseDown
    end
    object DDSpinEdit54: TDDSpinEdit
      Left = 170
      Top = 111
      Width = 69
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 1.000000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnChange = DDSpinEdit54Change
      OnMouseDown = DDSpinEdit54MouseDown
      OnMouseMove = DDSpinEdit54MouseMove
    end
    object DDSpinEdit53: TDDSpinEdit
      Left = 170
      Top = 130
      Width = 69
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 1.000000000000000000
      ParentFont = False
      TabOrder = 10
      OnChange = DDSpinEdit53Change
      OnMouseDown = DDSpinEdit53MouseDown
    end
    object DDSpinEdit73: TDDSpinEdit
      Left = 170
      Top = 149
      Width = 69
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.200000000000000000
      ParentFont = False
      TabOrder = 14
      OnChange = DDSpinEdit73Change
      OnMouseDown = DDSpinEdit73MouseDown
    end
    object StaticText46: TStaticText
      Left = 9
      Top = 94
      Width = 90
      Height = 20
      Caption = ' l=L^2/lam^2'
      TabOrder = 29
    end
    object i3_Combo: TComboBox
      Left = 252
      Top = 63
      Width = 88
      Height = 25
      Color = 11206604
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ItemHeight = 17
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 15
      Text = 'i3_Combo'
      OnChange = i3_ComboChange
      Items.Strings = (
        ' i3=1'
        ' i3=2'
        ' i3=3'
        ' i3=4')
    end
    object CheckBox22: TCheckBox
      Left = 252
      Top = 92
      Width = 85
      Height = 18
      Alignment = taLeftJustify
      Caption = 'If Thresh'
      Checked = True
      State = cbChecked
      TabOrder = 30
      OnClick = CheckBox22Click
    end
  end
  object GroupBox1: TGroupBox
    Left = 142
    Top = 603
    Width = 115
    Height = 132
    Caption = 'Blockage'
    Color = 11206655
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -10
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    object Label4: TLabel
      Left = 82
      Top = 97
      Width = 23
      Height = 16
      Caption = 'Bic'
    end
    object Label8: TLabel
      Left = 82
      Top = 113
      Width = 24
      Height = 16
      Caption = 'Glu'
    end
    object CheckBox1: TCheckBox
      Left = 2
      Top = 16
      Width = 108
      Height = 17
      Caption = 'BlockAMPA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = CheckBox1Click
      OnMouseUp = CheckBox1MouseUp
    end
    object CheckBox2: TCheckBox
      Left = 2
      Top = 32
      Width = 108
      Height = 17
      Caption = 'BlockNMDA'
      Color = 11206655
      ParentColor = False
      TabOrder = 1
      OnClick = CheckBox2Click
      OnMouseUp = CheckBox2MouseUp
    end
    object CheckBox3: TCheckBox
      Left = 2
      Top = 48
      Width = 105
      Height = 17
      Caption = 'BlockGABA'
      TabOrder = 2
      OnClick = CheckBox3Click
      OnMouseUp = CheckBox3MouseUp
    end
    object CheckBox4: TCheckBox
      Left = 2
      Top = 64
      Width = 105
      Height = 17
      Caption = 'BlockGABB'
      TabOrder = 3
      OnClick = CheckBox4Click
      OnMouseUp = CheckBox4MouseUp
    end
    object CheckBox6: TCheckBox
      Left = 2
      Top = 80
      Width = 89
      Height = 17
      Caption = 'BlockK'
      TabOrder = 4
      OnClick = CheckBox6Click
      OnMouseUp = CheckBox6MouseUp
    end
    object TrackBar3: TTrackBar
      Left = 2
      Top = 95
      Width = 80
      Height = 15
      TabOrder = 5
      OnChange = TrackBar3Change
      OnEnter = TrackBar3Enter
    end
    object TrackBar1: TTrackBar
      Left = 2
      Top = 111
      Width = 80
      Height = 15
      Hint = 'NBQX+APV'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnChange = TrackBar1Change
      OnEnter = TrackBar1Enter
    end
  end
  object GroupBox6: TGroupBox
    Left = 268
    Top = 448
    Width = 246
    Height = 44
    Caption = 'Gap Junctions '
    TabOrder = 13
    object DDSpinEdit10: TDDSpinEdit
      Left = 105
      Top = 14
      Width = 64
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.100000000000000000
      ParentFont = False
      TabOrder = 0
      OnChange = DDSpinEdit10Change
    end
    object DDSpinEdit11: TDDSpinEdit
      Left = 170
      Top = 14
      Width = 69
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.100000000000000000
      ParentFont = False
      TabOrder = 1
      OnChange = DDSpinEdit11Change
    end
    object StaticText9: TStaticText
      Left = 10
      Top = 15
      Width = 36
      Height = 20
      Caption = ' gGJ'
      TabOrder = 2
    end
  end
  object GroupBox10: TGroupBox
    Left = 2
    Top = 78
    Width = 265
    Height = 148
    Caption = 'Extracellular stimulation'
    TabOrder = 14
    object StaticText1: TStaticText
      Left = 2
      Top = 23
      Width = 74
      Height = 20
      Hint = 'fi_TU=Iext*pext_Iext'
      Caption = ' Iext, muA '
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object DDSpinEdit1: TDDSpinEdit
      Left = 73
      Top = 20
      Width = 66
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 0.500000000000000000
      TabOrder = 1
      OnChange = DDSpinEdit1Change
      OnDblClick = DDSpinEdit1DblClick
      OnMouseDown = DDSpinEdit1MouseDown
    end
    object StaticText3: TStaticText
      Left = 138
      Top = 25
      Width = 58
      Height = 20
      Caption = ' tSt, ms '
      TabOrder = 2
    end
    object DDSpinEdit3: TDDSpinEdit
      Left = 199
      Top = 20
      Width = 58
      Height = 26
      StrWidth = 2
      StrDecimals = 1
      Increment = 1.000000000000000000
      TabOrder = 3
      OnChange = DDSpinEdit3Change
    end
    object StaticText38: TStaticText
      Left = 138
      Top = 48
      Width = 67
      Height = 20
      Caption = ' dtSt, ms '
      TabOrder = 4
    end
    object DDSpinEdit67: TDDSpinEdit
      Left = 199
      Top = 44
      Width = 58
      Height = 26
      Hint = 'time of the second external and injected stimuli'
      StrWidth = 2
      StrDecimals = 2
      Increment = 1.000000000000000000
      TabOrder = 5
      OnChange = DDSpinEdit67Change
      OnDblClick = DDSpinEdit67DblClick
    end
    object StaticText15: TStaticText
      Left = 2
      Top = 49
      Width = 65
      Height = 20
      Hint = 'fi_BG=Qns+Iext*pext_Iext'
      Caption = ' Qns, Hz '
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
    end
    object DDSpinEdit21: TDDSpinEdit
      Left = 73
      Top = 44
      Width = 66
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 2.000000000000000000
      TabOrder = 7
      OnChange = DDSpinEdit21Change
      OnDblClick = DDSpinEdit21DblClick
      OnMouseDown = DDSpinEdit21MouseDown
    end
    object ComboBox2: TComboBox
      Left = 6
      Top = 71
      Width = 251
      Height = 24
      Color = 11206621
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ItemIndex = 0
      ParentFont = False
      TabOrder = 8
      Text = 'Stimul in layer 2/3'
      OnChange = ComboBox2Change
      Items.Strings = (
        'Stimul in layer 2/3'
        'Stimul in layer 4')
    end
    object ComboBox3: TComboBox
      Left = 6
      Top = 95
      Width = 251
      Height = 24
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ItemIndex = 0
      ParentFont = False
      TabOrder = 9
      Text = 'Extracellular stimul (bipolar)'
      OnChange = ComboBox3Change
      Items.Strings = (
        'Extracellular stimul (bipolar)'
        'Thalamic stimul'
        'Visual stim. without LGN'
        'Visual stim. through LGN'
        'LGN + thalamic stimul')
    end
    object ComboBox4: TComboBox
      Left = 6
      Top = 119
      Width = 251
      Height = 24
      Color = 11206604
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 16
      ItemIndex = 0
      ParentFont = False
      TabOrder = 10
      Text = 'View in layer 2/3'
      OnChange = ComboBox4Change
      Items.Strings = (
        'View in layer 2/3'
        'View in layer 4'
        'View pops. 1 and 3'
        'View pops. 2 and 4')
    end
  end
  object GroupBox11: TGroupBox
    Left = 618
    Top = 130
    Width = 207
    Height = 67
    Caption = 't*-space          Pyr         Int    '
    TabOrder = 15
    Visible = False
    object StaticText35: TStaticText
      Left = 9
      Top = 39
      Width = 35
      Height = 20
      Caption = ' Nts '
      TabOrder = 0
    end
    object StaticText36: TStaticText
      Left = 10
      Top = 18
      Width = 86
      Height = 20
      Caption = ' ts_end, ms '
      TabOrder = 2
    end
    object DDSpinEdit64: TDDSpinEdit
      Left = 96
      Top = 17
      Width = 49
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 2.000000000000000000
      ParentFont = False
      TabOrder = 3
      OnChange = DDSpinEdit64Change
    end
    object DDSpinEdit63: TDDSpinEdit
      Left = 96
      Top = 36
      Width = 49
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 2.000000000000000000
      ParentFont = False
      TabOrder = 1
      OnChange = DDSpinEdit63Change
      OnDblClick = DDSpinEdit63DblClick
    end
    object DDSpinEdit17: TDDSpinEdit
      Left = 153
      Top = 17
      Width = 49
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 2.000000000000000000
      ParentFont = False
      TabOrder = 4
      OnChange = DDSpinEdit17Change
    end
    object DDSpinEdit18: TDDSpinEdit
      Left = 153
      Top = 36
      Width = 49
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 2.000000000000000000
      ParentFont = False
      TabOrder = 5
      OnChange = DDSpinEdit18Change
      OnDblClick = DDSpinEdit18DblClick
    end
  end
  object GroupBox12: TGroupBox
    Left = 962
    Top = 592
    Width = 200
    Height = 143
    Caption = 'Connectivity'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -10
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 16
    Visible = False
    object Label3: TLabel
      Left = 9
      Top = 17
      Width = 110
      Height = 16
      Caption = 'gNMDA/gAMPA'
    end
    object Label1: TLabel
      Left = 9
      Top = 37
      Width = 116
      Height = 16
      Caption = 'SynSensitivity_E'
    end
    object Label2: TLabel
      Left = 9
      Top = 57
      Width = 110
      Height = 16
      Caption = 'SynSensitivity_I'
    end
    object Label5: TLabel
      Left = 9
      Top = 78
      Width = 137
      Height = 16
      Caption = 'SynSensitivity_Thal'
    end
    object Label6: TLabel
      Left = 9
      Top = 97
      Width = 97
      Height = 16
      Caption = 'SynEffect_Glu'
    end
    object Label7: TLabel
      Left = 9
      Top = 117
      Width = 115
      Height = 16
      Caption = 'SynEffect_GABA'
    end
    object DDSpinEdit16: TDDSpinEdit
      Left = 138
      Top = 15
      Width = 60
      Height = 26
      StrWidth = 2
      StrDecimals = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.010000000000000000
      ParentFont = False
      TabOrder = 0
      OnChange = DDSpinEdit16Change
    end
    object DDSpinEdit14: TDDSpinEdit
      Left = 138
      Top = 34
      Width = 60
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.100000000000000000
      ParentFont = False
      TabOrder = 1
      OnChange = DDSpinEdit14Change
    end
    object DDSpinEdit15: TDDSpinEdit
      Left = 138
      Top = 55
      Width = 60
      Height = 26
      StrWidth = 2
      StrDecimals = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.100000000000000000
      ParentFont = False
      TabOrder = 2
      OnChange = DDSpinEdit15Change
    end
    object DDSpinEdit19: TDDSpinEdit
      Left = 138
      Top = 75
      Width = 60
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 1.000000000000000000
      ParentFont = False
      TabOrder = 3
      OnChange = DDSpinEdit19Change
    end
    object DDSpinEdit20: TDDSpinEdit
      Left = 138
      Top = 95
      Width = 60
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.100000000000000000
      ParentFont = False
      TabOrder = 4
      OnChange = DDSpinEdit20Change
    end
    object DDSpinEdit62: TDDSpinEdit
      Left = 138
      Top = 114
      Width = 60
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.100000000000000000
      ParentFont = False
      TabOrder = 5
      OnChange = DDSpinEdit62Change
    end
  end
  object GroupBox13: TGroupBox
    Left = 758
    Top = 197
    Width = 195
    Height = 161
    Caption = 'Hazard function'
    TabOrder = 17
    Visible = False
    object CheckBox9: TCheckBox
      Left = 9
      Top = 33
      Width = 91
      Height = 21
      Hint = 'Calculate rate without A.'
      Caption = 'without A'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object CheckBox14: TCheckBox
      Left = 9
      Top = 50
      Width = 91
      Height = 20
      Hint = 'Calculate rate without F.'
      Caption = 'without F'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object CheckBox10: TCheckBox
      Left = 9
      Top = 66
      Width = 144
      Height = 23
      Hint = 'sgm is proportional to sqrt of total conductance'
      Caption = 'sgm=k*sqrt(1+s)'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      State = cbChecked
      TabOrder = 2
    end
    object StaticText66: TStaticText
      Left = 9
      Top = 16
      Width = 120
      Height = 20
      Hint = 'set dtSt between stimuli'
      Caption = 'tau_m/tau_Noise'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object DDSpinEdit98: TDDSpinEdit
      Left = 144
      Top = 14
      Width = 47
      Height = 26
      Hint = 'color of noise'
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 1.000000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnChange = DDSpinEdit98Change
    end
    object CheckBox13: TCheckBox
      Left = 9
      Top = 84
      Width = 88
      Height = 21
      Hint = 'Lognormal'
      Caption = 'LogN - P'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = CheckBox13Click
    end
    object DDSpinEdit79: TDDSpinEdit
      Left = 39
      Top = 105
      Width = 55
      Height = 26
      Hint = 'color of noise'
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.250000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      Value = 0.250000000000000000
      OnChange = DDSpinEdit79Change
    end
    object StaticText47: TStaticText
      Left = 6
      Top = 107
      Width = 33
      Height = 20
      Hint = 'set dtSt between stimuli'
      Caption = 'sgm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
    end
    object StaticText48: TStaticText
      Left = 118
      Top = 107
      Width = 22
      Height = 20
      Hint = 'set dtSt between stimuli'
      Caption = 'Nx'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
    end
    object DDSpinEdit82: TDDSpinEdit
      Left = 144
      Top = 105
      Width = 47
      Height = 26
      Hint = 'Discretization of lognormal distribution'
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 1.000000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      Value = 10.000000000000000000
      OnChange = DDSpinEdit82Change
      OnDblClick = DDSpinEdit82DblClick
    end
    object CheckBox17: TCheckBox
      Left = 111
      Top = 84
      Width = 80
      Height = 21
      Hint = 'Lognormal'
      Caption = 'LogN - I'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnClick = CheckBox17Click
    end
    object CheckBox24: TCheckBox
      Left = 9
      Top = 132
      Width = 121
      Height = 18
      Caption = 'Ufree=-90 mV'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      OnClick = CheckBox22Click
    end
    object DDSpinEdit120: TDDSpinEdit
      Left = 128
      Top = 41
      Width = 63
      Height = 26
      Hint = 'Finite size [Schwalger et al. 2017]'
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 1000.000000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      OnDblClick = DDSpinEdit120DblClick
    end
    object StaticText43: TStaticText
      Left = 110
      Top = 45
      Width = 15
      Height = 20
      Hint = 'set dtSt between stimuli'
      Caption = 'N'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
    end
  end
  object StaticText7: TStaticText
    Left = 9
    Top = 30
    Width = 70
    Height = 20
    Caption = 't_end, ms'
    TabOrder = 18
  end
  object ComboBox5: TComboBox
    Left = 4
    Top = 52
    Width = 261
    Height = 24
    Hint = 'Scheme of connections'
    ItemHeight = 16
    ParentShowHint = False
    ShowHint = True
    TabOrder = 19
    Text = 'Thomson, cat, doubled l4'
    OnChange = ComboBox5Change
    Items.Strings = (
      '1 layer'
      'Zilberter-Thomson'
      'Thomson, cat'
      'Thomson, cat, averaged'
      'Thomson, cat, 2/3 and 4'
      'Thomson, cat, doubled l4'
      'Cotrast invarience scheme'
      'Thomson, cat, 2/3 and 4, stable')
  end
  object GroupBox14: TGroupBox
    Left = 825
    Top = 592
    Width = 128
    Height = 143
    Caption = 'Pops. 3 and 4'
    TabOrder = 20
    Visible = False
    object StaticText13: TStaticText
      Left = 1
      Top = 46
      Width = 73
      Height = 20
      Caption = ' sgm_V[3]'
      TabOrder = 0
    end
    object StaticText14: TStaticText
      Left = 1
      Top = 22
      Width = 83
      Height = 20
      Caption = ' ThrShift[3] '
      TabOrder = 3
    end
    object DDSpinEdit75: TDDSpinEdit
      Left = 82
      Top = 21
      Width = 44
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 1.000000000000000000
      ParentFont = False
      TabOrder = 2
      OnChange = DDSpinEdit75Change
    end
    object StaticText49: TStaticText
      Left = 1
      Top = 94
      Width = 83
      Height = 20
      Caption = ' ThrShift[4] '
      TabOrder = 4
    end
    object StaticText50: TStaticText
      Left = 1
      Top = 117
      Width = 73
      Height = 20
      Caption = ' sgm_V[4]'
      TabOrder = 5
    end
    object DDSpinEdit95: TDDSpinEdit
      Left = 82
      Top = 94
      Width = 44
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 1.000000000000000000
      ParentFont = False
      TabOrder = 6
      OnChange = DDSpinEdit95Change
    end
    object DDSpinEdit99: TDDSpinEdit
      Left = 82
      Top = 114
      Width = 44
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.100000000000000000
      ParentFont = False
      TabOrder = 7
      OnChange = DDSpinEdit99Change
    end
    object DDSpinEdit66: TDDSpinEdit
      Left = 82
      Top = 42
      Width = 44
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.100000000000000000
      ParentFont = False
      TabOrder = 1
      OnChange = DDSpinEdit66Change
    end
  end
  object StaticText37: TStaticText
    Left = 9
    Top = 613
    Width = 61
    Height = 20
    Hint = 'fi_TU=Iext*pext_Iext'
    Caption = 'Contrast'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 21
  end
  object DDSpinEdit76: TDDSpinEdit
    Left = 80
    Top = 610
    Width = 57
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 5.000000000000000000
    MaxValue = 100.000000000000000000
    TabOrder = 22
    Value = 25.000000000000000000
    OnChange = DDSpinEdit76Change
  end
  object GroupBox7: TGroupBox
    Left = 268
    Top = 178
    Width = 246
    Height = 271
    Caption = 'Active props.:     Pyr           Int   '
    TabOrder = 8
    object DDSpinEdit83: TDDSpinEdit
      Left = 105
      Top = 18
      Width = 64
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 1.000000000000000000
      ParentFont = False
      TabOrder = 0
      OnChange = DDSpinEdit83Change
      OnDblClick = DDSpinEdit83DblClick
      OnMouseDown = DDSpinEdit83MouseDown
    end
    object DDSpinEdit84: TDDSpinEdit
      Left = 170
      Top = 18
      Width = 69
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 1.000000000000000000
      ParentFont = False
      TabOrder = 1
      OnChange = DDSpinEdit84Change
      OnDblClick = DDSpinEdit84DblClick
      OnMouseDown = DDSpinEdit84MouseDown
    end
    object StaticText56: TStaticText
      Left = 9
      Top = 84
      Width = 40
      Height = 20
      Caption = ' gKA '
      TabOrder = 2
    end
    object StaticText57: TStaticText
      Left = 9
      Top = 65
      Width = 30
      Height = 20
      Caption = ' gK '
      TabOrder = 5
    end
    object DDSpinEdit87: TDDSpinEdit
      Left = 105
      Top = 63
      Width = 64
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.100000000000000000
      ParentFont = False
      TabOrder = 6
      OnChange = DDSpinEdit87Change
    end
    object DDSpinEdit88: TDDSpinEdit
      Left = 170
      Top = 63
      Width = 69
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.100000000000000000
      ParentFont = False
      TabOrder = 7
      OnChange = DDSpinEdit88Change
    end
    object DDSpinEdit85: TDDSpinEdit
      Left = 105
      Top = 82
      Width = 64
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.100000000000000000
      ParentFont = False
      TabOrder = 3
      OnChange = DDSpinEdit85Change
    end
    object DDSpinEdit86: TDDSpinEdit
      Left = 170
      Top = 82
      Width = 69
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.100000000000000000
      ParentFont = False
      TabOrder = 4
      OnChange = DDSpinEdit86Change
    end
    object DDSpinEdit106: TDDSpinEdit
      Left = 105
      Top = 37
      Width = 64
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.100000000000000000
      ParentFont = False
      TabOrder = 8
      OnChange = DDSpinEdit106Change
    end
    object StaticText67: TStaticText
      Left = 9
      Top = 38
      Width = 77
      Height = 20
      Caption = ' dt_AP, ms'
      TabOrder = 10
    end
    object DDSpinEdit108: TDDSpinEdit
      Left = 105
      Top = 101
      Width = 64
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.100000000000000000
      ParentFont = False
      TabOrder = 11
      OnChange = DDSpinEdit108Change
    end
    object DDSpinEdit109: TDDSpinEdit
      Left = 170
      Top = 101
      Width = 69
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.100000000000000000
      ParentFont = False
      TabOrder = 12
      OnChange = DDSpinEdit109Change
    end
    object StaticText68: TStaticText
      Left = 9
      Top = 103
      Width = 37
      Height = 20
      Caption = ' gKD'
      TabOrder = 13
    end
    object DDSpinEdit110: TDDSpinEdit
      Left = 105
      Top = 121
      Width = 64
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.100000000000000000
      ParentFont = False
      TabOrder = 14
      OnChange = DDSpinEdit110Change
    end
    object DDSpinEdit111: TDDSpinEdit
      Left = 170
      Top = 121
      Width = 69
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.100000000000000000
      ParentFont = False
      TabOrder = 15
      OnChange = DDSpinEdit111Change
    end
    object StaticText69: TStaticText
      Left = 9
      Top = 122
      Width = 28
      Height = 20
      Caption = ' gH'
      TabOrder = 16
    end
    object StaticText55: TStaticText
      Left = 9
      Top = 20
      Width = 87
      Height = 20
      Caption = ' Vreset, mV '
      TabOrder = 17
    end
    object DDSpinEdit60: TDDSpinEdit
      Left = 105
      Top = 139
      Width = 64
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.100000000000000000
      ParentFont = False
      TabOrder = 18
      OnChange = DDSpinEdit60Change
    end
    object DDSpinEdit61: TDDSpinEdit
      Left = 170
      Top = 139
      Width = 69
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.100000000000000000
      ParentFont = False
      TabOrder = 19
      OnChange = DDSpinEdit60Change
    end
    object StaticText34: TStaticText
      Left = 10
      Top = 142
      Width = 43
      Height = 20
      Caption = ' gBst '
      TabOrder = 20
    end
    object DDSpinEdit68: TDDSpinEdit
      Left = 105
      Top = 158
      Width = 64
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.010000000000000000
      ParentFont = False
      TabOrder = 21
      OnChange = DDSpinEdit68Change
    end
    object DDSpinEdit69: TDDSpinEdit
      Left = 170
      Top = 158
      Width = 69
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.100000000000000000
      ParentFont = False
      TabOrder = 22
      OnChange = DDSpinEdit69Change
    end
    object StaticText39: TStaticText
      Left = 10
      Top = 160
      Width = 51
      Height = 20
      Caption = ' gNaP '
      TabOrder = 23
    end
    object DDSpinEdit107: TDDSpinEdit
      Left = 170
      Top = 37
      Width = 69
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 1.000000000000000000
      ParentFont = False
      TabOrder = 9
      OnChange = DDSpinEdit107Change
    end
    object DDSpinEdit56: TDDSpinEdit
      Left = 105
      Top = 177
      Width = 64
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.100000000000000000
      ParentFont = False
      TabOrder = 24
      OnChange = DDSpinEdit56Change
      OnDblClick = DDSpinEdit56DblClick
    end
    object DDSpinEdit57: TDDSpinEdit
      Left = 170
      Top = 177
      Width = 69
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.100000000000000000
      ParentFont = False
      TabOrder = 25
      OnChange = DDSpinEdit57Change
    end
    object DDSpinEdit74: TDDSpinEdit
      Left = 105
      Top = 196
      Width = 64
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.010000000000000000
      ParentFont = False
      TabOrder = 26
      OnChange = DDSpinEdit74Change
      OnDblClick = DDSpinEdit74DblClick
    end
    object StaticText32: TStaticText
      Left = 10
      Top = 178
      Width = 52
      Height = 20
      Caption = ' gAHP '
      TabOrder = 27
    end
    object StaticText44: TStaticText
      Left = 10
      Top = 198
      Width = 42
      Height = 20
      Caption = ' gKM '
      TabOrder = 28
    end
    object ComboBox8: TComboBox
      Left = 48
      Top = 218
      Width = 193
      Height = 24
      ItemHeight = 16
      TabOrder = 29
      Text = 'SpecCond'
      OnChange = ComboBox8Change
      Items.Strings = (
        'Fix VT=10mV'
        'Nothing'
        ''
        ''
        'VT(dVdt)'
        'VT(t*), dep. block V'
        'VT(t*), dep. block G'
        'Fix VT, dep. block G'
        'VT(t*), dep. block u'
        'VT(t*)')
    end
    object ComboBox9: TComboBox
      Left = 48
      Top = 242
      Width = 193
      Height = 24
      ItemHeight = 16
      TabOrder = 30
      Text = 'SpecCond'
      OnChange = ComboBox9Change
      Items.Strings = (
        'Fix VT=10mV'
        'Nothing'
        ''
        ''
        'VT(dVdt)'
        'VT(t*), dep. block V'
        'VT(t*), dep. block G'
        'Fix VT, dep. block G'
        'VT(t*), dep. block u'
        'VT(t*)')
    end
    object StaticText54: TStaticText
      Left = 10
      Top = 220
      Width = 35
      Height = 20
      Caption = ' Pyr:'
      TabOrder = 31
    end
    object StaticText64: TStaticText
      Left = 10
      Top = 244
      Width = 28
      Height = 20
      Caption = ' Int:'
      TabOrder = 32
    end
  end
  object CheckBox12: TCheckBox
    Left = 526
    Top = 177
    Width = 80
    Height = 21
    Alignment = taLeftJustify
    Caption = 'More >>'
    Color = clMaroon
    ParentColor = False
    TabOrder = 23
    OnClick = CheckBox12Click
  end
  object GroupBox15: TGroupBox
    Left = 618
    Top = 548
    Width = 335
    Height = 44
    Caption = 'Dynamics of K and Cl '
    TabOrder = 24
    Visible = False
    object CheckBox21: TCheckBox
      Left = 7
      Top = 17
      Width = 138
      Height = 17
      Caption = 'IfDynamic_K_Cl'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = CheckBox21Click
    end
    object CheckBox7: TCheckBox
      Left = 181
      Top = 17
      Width = 138
      Height = 17
      Caption = 'calculated in BG'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 1
      OnClick = CheckBox7Click
    end
  end
  object RadioGroup1: TRadioGroup
    Left = 832
    Top = 128
    Width = 121
    Height = 69
    Caption = 'FR-model'
    ItemIndex = 0
    Items.Strings = (
      'A+max(F,0)'
      'max(A+F,0)'
      'Lognorm')
    TabOrder = 25
    Visible = False
  end
  object GroupBox16: TGroupBox
    Left = 521
    Top = 197
    Width = 232
    Height = 161
    Caption = 'Extracell. stimulation'
    TabOrder = 26
    Visible = False
    object CheckBox16: TCheckBox
      Left = 10
      Top = 137
      Width = 207
      Height = 16
      Caption = 'Bip. not for I-cells'
      Color = clMoneyGreen
      ParentColor = False
      TabOrder = 0
    end
    object StaticText62: TStaticText
      Left = 9
      Top = 18
      Width = 52
      Height = 20
      Caption = 't0s, ms'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object DDSpinEdit93: TDDSpinEdit
      Left = 73
      Top = 15
      Width = 56
      Height = 26
      Hint = 'about 2000Hz/max(Iext)'
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 1.000000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnChange = DDSpinEdit93Change
      OnDblClick = DDSpinEdit93DblClick
    end
    object DDSpinEdit94: TDDSpinEdit
      Left = 73
      Top = 39
      Width = 56
      Height = 26
      Hint = 'about 2000Hz/max(Iext)'
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 1.000000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnChange = DDSpinEdit94Change
      OnDblClick = DDSpinEdit94DblClick
    end
    object StaticText63: TStaticText
      Left = 9
      Top = 42
      Width = 58
      Height = 20
      Hint = 'set dtSt between stimuli'
      Caption = 'nStimuli'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object StaticText8: TStaticText
      Left = 9
      Top = 114
      Width = 71
      Height = 20
      Caption = 'T_bipolar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    object StaticText61: TStaticText
      Left = 9
      Top = 66
      Width = 126
      Height = 20
      Caption = 'pext_Iext, Hz/muA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
    object DDSpinEdit91: TDDSpinEdit
      Left = 160
      Top = 62
      Width = 60
      Height = 26
      Hint = 'about 2000Hz/max(Iext)'
      StrWidth = 2
      StrDecimals = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 1.000000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnChange = DDSpinEdit91Change
      OnDblClick = DDSpinEdit91DblClick
    end
    object StaticText4: TStaticText
      Left = 9
      Top = 90
      Width = 151
      Height = 20
      Hint = 'Effective area of stimulation per muA'
      Caption = 'Sbip_Iext, mm^2/muA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
    end
    object DDSpinEdit8: TDDSpinEdit
      Left = 160
      Top = 86
      Width = 60
      Height = 26
      Hint = 'about 2000Hz/max(Iext)'
      StrWidth = 2
      StrDecimals = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.001000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnChange = DDSpinEdit8Change
      OnDblClick = DDSpinEdit8DblClick
    end
    object DDSpinEdit9: TDDSpinEdit
      Left = 160
      Top = 110
      Width = 60
      Height = 26
      Hint = 'about 2000Hz/max(Iext)'
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.200000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnChange = DDSpinEdit9Change
    end
  end
  object Memo1: TMemo
    Left = 4
    Top = 0
    Width = 261
    Height = 25
    Hint = 'Task description'
    BevelOuter = bvRaised
    Color = clGradientActiveCaption
    ParentShowHint = False
    ShowHint = True
    TabOrder = 27
  end
  object GroupBox17: TGroupBox
    Left = 618
    Top = 592
    Width = 200
    Height = 143
    Caption = 'Synaptic depression'
    TabOrder = 28
    Visible = False
    object DDSpinEdit102: TDDSpinEdit
      Left = 66
      Top = 41
      Width = 66
      Height = 26
      StrWidth = 2
      StrDecimals = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.100000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnChange = DDSpinEdit102Change
      OnDblClick = DDSpinEdit102DblClick
    end
    object StaticText73: TStaticText
      Left = 6
      Top = 43
      Width = 15
      Height = 20
      Hint = 'set dtSt between stimuli'
      Caption = 'U'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object StaticText74: TStaticText
      Left = 6
      Top = 66
      Width = 53
      Height = 20
      Hint = 'set dtSt between stimuli'
      Caption = 'tau, ms'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object DDSpinEdit103: TDDSpinEdit
      Left = 66
      Top = 64
      Width = 66
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.010000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Value = 400.000000000000000000
      OnChange = DDSpinEdit103Change
    end
    object StaticText75: TStaticText
      Left = 86
      Top = 18
      Width = 96
      Height = 20
      Hint = 'set dtSt between stimuli'
      Caption = 'Glu       GABA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnDblClick = Button1Click
    end
    object DDSpinEdit104: TDDSpinEdit
      Left = 130
      Top = 41
      Width = 64
      Height = 26
      StrWidth = 2
      StrDecimals = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.100000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnChange = DDSpinEdit104Change
      OnDblClick = DDSpinEdit104DblClick
    end
    object DDSpinEdit105: TDDSpinEdit
      Left = 130
      Top = 64
      Width = 64
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.010000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      Value = 400.000000000000000000
      OnChange = DDSpinEdit105Change
    end
    object DDSpinEdit118: TDDSpinEdit
      Left = 66
      Top = 89
      Width = 66
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.010000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      Value = 888.000000000000000000
      OnChange = DDSpinEdit118Change
    end
    object DDSpinEdit119: TDDSpinEdit
      Left = 130
      Top = 89
      Width = 64
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Increment = 0.010000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      Value = 888.000000000000000000
      OnChange = DDSpinEdit119Change
    end
    object StaticText76: TStaticText
      Left = 6
      Top = 91
      Width = 45
      Height = 20
      Hint = 'set dtSt between stimuli'
      Caption = 'nu_thr'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 368
    Top = 472
  end
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 464
    Top = 472
  end
  object PopupMenu3: TPopupMenu
    OnPopup = PopupMenu3Popup
    Left = 368
    Top = 496
  end
  object PopupMenu4: TPopupMenu
    OnPopup = PopupMenu4Popup
    Left = 496
    Top = 496
  end
  object PopupMenu5: TPopupMenu
    OnPopup = PopupMenu5Popup
    Left = 352
    Top = 520
  end
  object PopupMenu6: TPopupMenu
    OnPopup = PopupMenu6Popup
    Left = 464
    Top = 520
  end
  object PopupMenu7: TPopupMenu
    OnPopup = PopupMenu7Popup
    Left = 352
    Top = 544
  end
  object PopupMenu8: TPopupMenu
    OnPopup = PopupMenu8Popup
    Left = 464
    Top = 544
  end
end
