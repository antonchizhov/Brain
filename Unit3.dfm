object Form3: TForm3
  Left = 1245
  Top = 0
  Width = 665
  Height = 972
  ActiveControl = DDSpinEdit2
  AutoSize = True
  Caption = 'Form3: 2D-slice'
  Color = 11193599
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Label5: TLabel
    Left = 9
    Top = 0
    Width = 32
    Height = 16
    Caption = 'time='
  end
  object Label6: TLabel
    Left = 121
    Top = 0
    Width = 17
    Height = 16
    Caption = 'nt='
  end
  object GroupBox4: TGroupBox
    Left = 502
    Top = 672
    Width = 153
    Height = 129
    BiDiMode = bdLeftToRight
    Caption = '    PinWheels'
    ParentBiDiMode = False
    TabOrder = 6
    object CheckBox2: TCheckBox
      Left = 0
      Top = 1
      Width = 16
      Height = 16
      Alignment = taLeftJustify
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = CheckBox2Click
    end
    object DDSpinEdit12: TDDSpinEdit
      Left = 96
      Top = 17
      Width = 49
      Height = 22
      Hint = 'in hypercolumn space'
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      Increment = 30.000000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnChange = DDSpinEdit12Change
    end
    object DDSpinEdit13: TDDSpinEdit
      Left = 96
      Top = 39
      Width = 49
      Height = 22
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      Increment = 1.000000000000000000
      ParentFont = False
      TabOrder = 2
      Value = 6.000000000000000000
      OnChange = DDSpinEdit13Change
    end
    object StaticText10: TStaticText
      Left = 9
      Top = 20
      Width = 74
      Height = 20
      Caption = 'fi0, degrees'
      TabOrder = 3
    end
    object StaticText11: TStaticText
      Left = 9
      Top = 42
      Width = 68
      Height = 20
      Caption = 'radius, pts.'
      TabOrder = 4
    end
    object CheckBox7: TCheckBox
      Left = 111
      Top = 0
      Width = 42
      Height = 16
      Alignment = taLeftJustify
      Caption = 'sm.'
      TabOrder = 5
    end
    object StaticText17: TStaticText
      Left = 9
      Top = 64
      Width = 87
      Height = 20
      Caption = 'Lag of DS, ms'
      TabOrder = 6
    end
    object DDSpinEdit22: TDDSpinEdit
      Left = 96
      Top = 62
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
      TabOrder = 7
      Value = 20.000000000000000000
      OnChange = DDSpinEdit22Change
      OnDblClick = DDSpinEdit22DblClick
    end
    object CheckBox9: TCheckBox
      Left = 9
      Top = 89
      Width = 136
      Height = 16
      Caption = 'PinWheels from file'
      TabOrder = 8
    end
    object CheckBox4: TCheckBox
      Left = 9
      Top = 107
      Width = 120
      Height = 16
      BiDiMode = bdRightToLeftNoAlign
      Caption = 'chess order'
      ParentBiDiMode = False
      TabOrder = 9
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 672
    Width = 233
    Height = 73
    Caption = '2D-mesh '
    TabOrder = 0
    object Label9: TLabel
      Left = 9
      Top = 20
      Width = 49
      Height = 16
      Caption = 'dx, mum'
    end
    object Label10: TLabel
      Left = 9
      Top = 44
      Width = 50
      Height = 16
      Caption = 'dy, mum'
    end
    object DDSpinEdit1: TDDSpinEdit
      Left = 176
      Top = 15
      Width = 49
      Height = 26
      Hint = 'DblClick sets 1'
      StrWidth = 2
      StrDecimals = 0
      Increment = 1.000000000000000000
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnChange = DDSpinEdit1Change
      OnDblClick = DDSpinEdit1DblClick
    end
    object StaticText1: TStaticText
      Left = 160
      Top = 46
      Width = 14
      Height = 20
      Caption = 'nj'
      TabOrder = 1
    end
    object StaticText2: TStaticText
      Left = 160
      Top = 20
      Width = 14
      Height = 20
      Caption = 'ni'
      TabOrder = 3
    end
    object DDSpinEdit8: TDDSpinEdit
      Left = 65
      Top = 15
      Width = 64
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 10.000000000000000000
      TabOrder = 4
      Value = 3.000000000000000000
      OnChange = DDSpinEdit8Change
    end
    object DDSpinEdit9: TDDSpinEdit
      Left = 65
      Top = 39
      Width = 64
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 10.000000000000000000
      TabOrder = 5
      Value = 3.000000000000000000
      OnChange = DDSpinEdit9Change
    end
    object DDSpinEdit2: TDDSpinEdit
      Left = 176
      Top = 39
      Width = 49
      Height = 26
      Hint = 'DblClick sets 1'
      StrWidth = 2
      StrDecimals = 0
      Increment = 1.000000000000000000
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnChange = DDSpinEdit2Change
      OnDblClick = DDSpinEdit2DblClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 238
    Top = 672
    Width = 113
    Height = 193
    Caption = 'Electric Stimulus'
    TabOrder = 1
    object DDSpinEdit4: TDDSpinEdit
      Left = 60
      Top = 15
      Width = 48
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 1.000000000000000000
      TabOrder = 0
      OnChange = DDSpinEdit4Change
    end
    object StaticText3: TStaticText
      Left = 6
      Top = 20
      Width = 45
      Height = 20
      Caption = 'R_stim'
      TabOrder = 1
    end
    object DDSpinEdit5: TDDSpinEdit
      Left = 60
      Top = 39
      Width = 48
      Height = 26
      Hint = 
        'Center of stimulus or center of screen projection (white dot in ' +
        'Form15)'
      StrWidth = 2
      StrDecimals = 0
      Increment = 1.000000000000000000
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnChange = DDSpinEdit5Change
      OnDblClick = DDSpinEdit5DblClick
    end
    object DDSpinEdit6: TDDSpinEdit
      Left = 60
      Top = 63
      Width = 48
      Height = 26
      Hint = 
        'Center of stimulus or center of screen projection (white dot in ' +
        'Form15)'
      StrWidth = 2
      StrDecimals = 0
      Increment = 1.000000000000000000
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnChange = DDSpinEdit6Change
      OnDblClick = DDSpinEdit6DblClick
    end
    object StaticText6: TStaticText
      Left = 6
      Top = 44
      Width = 45
      Height = 20
      Caption = 'ni_stim'
      TabOrder = 4
    end
    object StaticText7: TStaticText
      Left = 6
      Top = 68
      Width = 45
      Height = 20
      Caption = 'nj_stim'
      TabOrder = 5
    end
    object DDSpinEdit19: TDDSpinEdit
      Left = 60
      Top = 87
      Width = 48
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 1.000000000000000000
      TabOrder = 6
      OnChange = DDSpinEdit19Change
      OnDblClick = DDSpinEdit19DblClick
    end
    object DDSpinEdit20: TDDSpinEdit
      Left = 60
      Top = 111
      Width = 48
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 1.000000000000000000
      TabOrder = 7
      OnChange = DDSpinEdit20Change
      OnDblClick = DDSpinEdit20DblClick
    end
    object StaticText14: TStaticText
      Left = 6
      Top = 92
      Width = 52
      Height = 20
      Caption = 'ni_stim2'
      TabOrder = 8
    end
    object StaticText15: TStaticText
      Left = 6
      Top = 116
      Width = 52
      Height = 20
      Caption = 'nj_stim2'
      TabOrder = 9
    end
    object ComboBox3: TComboBox
      Left = 5
      Top = 137
      Width = 102
      Height = 24
      ItemHeight = 16
      ItemIndex = 1
      TabOrder = 10
      Text = 'exp-decay'
      OnChange = ComboBox3Change
      Items.Strings = (
        '1/r-decay'
        'exp-decay'
        'Gauss'
        'flat circle')
    end
    object DDSpinEdit21: TDDSpinEdit
      Left = 68
      Top = 162
      Width = 40
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 1.000000000000000000
      TabOrder = 11
      OnChange = DDSpinEdit21Change
    end
    object StaticText16: TStaticText
      Left = 6
      Top = 165
      Width = 59
      Height = 20
      Caption = 'R_decay'
      TabOrder = 12
    end
  end
  object GroupBox3: TGroupBox
    Left = 357
    Top = 672
    Width = 140
    Height = 121
    Caption = 'Writing and Drawing'
    TabOrder = 2
    object Label3: TLabel
      Left = 5
      Top = 70
      Width = 46
      Height = 16
      Caption = 'i,j_view '
    end
    object Label2: TLabel
      Left = 5
      Top = 94
      Width = 50
      Height = 16
      Caption = 'ij_view2 '
    end
    object DDSpinEdit7: TDDSpinEdit
      Left = 73
      Top = 15
      Width = 48
      Height = 26
      StrWidth = 2
      StrDecimals = 1
      Increment = 0.100000000000000000
      TabOrder = 0
      OnChange = DDSpinEdit7Change
    end
    object StaticText9: TStaticText
      Left = 6
      Top = 18
      Width = 64
      Height = 20
      Caption = 'dt_out, ms'
      TabOrder = 1
    end
    object DDSpinEdit3: TDDSpinEdit
      Left = 73
      Top = 41
      Width = 48
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 1.000000000000000000
      TabOrder = 2
      Value = 10.000000000000000000
    end
    object StaticText8: TStaticText
      Left = 6
      Top = 44
      Width = 47
      Height = 20
      Caption = 'n_draw'
      TabOrder = 3
    end
    object DDSpinEdit10: TDDSpinEdit
      Left = 55
      Top = 66
      Width = 42
      Height = 26
      Hint = 'Coordinate of recordings'
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Increment = 1.000000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnChange = DDSpinEdit10Change
      OnDblClick = DDSpinEdit10DblClick
    end
    object DDSpinEdit11: TDDSpinEdit
      Left = 95
      Top = 66
      Width = 42
      Height = 26
      Hint = 'Coordinate of recordings'
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Increment = 1.000000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      Value = 1.000000000000000000
      OnChange = DDSpinEdit11Change
      OnDblClick = DDSpinEdit11DblClick
    end
    object DDSpinEdit23: TDDSpinEdit
      Left = 55
      Top = 90
      Width = 42
      Height = 26
      Hint = 'Coordinate of recordings'
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Increment = 1.000000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnChange = DDSpinEdit23Change
      OnDblClick = DDSpinEdit23DblClick
    end
    object DDSpinEdit28: TDDSpinEdit
      Left = 95
      Top = 90
      Width = 42
      Height = 26
      Hint = 'Coordinate of recordings'
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Increment = 1.000000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnChange = DDSpinEdit28Change
      OnDblClick = DDSpinEdit28DblClick
    end
  end
  object Button1: TButton
    Left = 288
    Top = 0
    Width = 89
    Height = 25
    Caption = 'Run'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 377
    Top = 0
    Width = 66
    Height = 25
    Caption = 'Clear'
    TabOrder = 4
    OnClick = Button2Click
  end
  object CheckBox1: TCheckBox
    Left = 457
    Top = 0
    Width = 104
    Height = 17
    Caption = 'IfShowLattice'
    Checked = True
    State = cbChecked
    TabOrder = 5
  end
  object GroupBox5: TGroupBox
    Left = 502
    Top = 803
    Width = 153
    Height = 64
    Hint = 'in hypercolumn space'
    Caption = 'Second visual stimulus'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    object DDSpinEdit17: TDDSpinEdit
      Left = 96
      Top = 17
      Width = 49
      Height = 22
      Hint = 'in hypercolumn space'
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      Increment = 30.000000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Value = 90.000000000000000000
      OnDblClick = DDSpinEdit17DblClick
    end
    object DDSpinEdit18: TDDSpinEdit
      Left = 96
      Top = 38
      Width = 49
      Height = 22
      Hint = 'in hypercolumn space'
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      Increment = 25.000000000000000000
      ParentFont = False
      TabOrder = 1
      OnChange = DDSpinEdit18Change
    end
    object StaticText4: TStaticText
      Left = 9
      Top = 20
      Width = 74
      Height = 20
      Caption = 'fi0, degrees'
      TabOrder = 2
    end
    object StaticText5: TStaticText
      Left = 9
      Top = 42
      Width = 53
      Height = 20
      Caption = 'time, ms'
      TabOrder = 3
    end
  end
  object GroupBox6: TGroupBox
    Left = 0
    Top = 752
    Width = 233
    Height = 185
    Caption = 'Morphology '
    TabOrder = 8
    object Label8: TLabel
      Left = 9
      Top = 17
      Width = 55
      Height = 16
      Caption = 'Eq. type: '
    end
    object Label11: TLabel
      Left = 9
      Top = 38
      Width = 192
      Height = 16
      Caption = 'r_axon, mum:          on E            on I'
    end
    object Label14: TLabel
      Left = 65
      Top = 60
      Width = 31
      Height = 16
      Caption = 'de E:'
    end
    object Label15: TLabel
      Left = 65
      Top = 84
      Width = 25
      Height = 16
      Caption = 'de I:'
    end
    object Label1: TLabel
      Left = 9
      Top = 112
      Width = 52
      Height = 16
      Caption = 'Patches:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object ComboBox2: TComboBox
      Left = 64
      Top = 14
      Width = 165
      Height = 24
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 0
      Text = 'Wave equation'
      Items.Strings = (
        'Wave equation'
        'Integral with exp(-d)'
        'Integral with exp(-d^2)'
        'Time-conv. exp(-d^2)')
    end
    object DDSpinEdit24: TDDSpinEdit
      Left = 105
      Top = 55
      Width = 56
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 50.000000000000000000
      TabOrder = 1
      OnChange = DDSpinEdit24Change
      OnMouseDown = DDSpinEdit24MouseDown
    end
    object DDSpinEdit25: TDDSpinEdit
      Left = 105
      Top = 79
      Width = 56
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 50.000000000000000000
      TabOrder = 2
      OnChange = DDSpinEdit25Change
      OnMouseDown = DDSpinEdit25MouseDown
    end
    object DDSpinEdit26: TDDSpinEdit
      Left = 169
      Top = 55
      Width = 56
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 50.000000000000000000
      TabOrder = 3
      OnChange = DDSpinEdit26Change
      OnMouseDown = DDSpinEdit26MouseDown
    end
    object DDSpinEdit27: TDDSpinEdit
      Left = 169
      Top = 79
      Width = 56
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 50.000000000000000000
      TabOrder = 4
      OnChange = DDSpinEdit27Change
      OnMouseDown = DDSpinEdit27MouseDown
    end
    object DDSpinEdit16: TDDSpinEdit
      Left = 65
      Top = 108
      Width = 48
      Height = 26
      Hint = 'DblClick sets 1'
      StrWidth = 2
      StrDecimals = 4
      Increment = 0.100000000000000000
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnChange = DDSpinEdit16Change
      OnDblClick = DDSpinEdit16DblClick
    end
    object CheckBox6: TCheckBox
      Left = 64
      Top = 161
      Width = 66
      Height = 16
      Alignment = taLeftJustify
      Caption = 'smooth'
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
    object CheckBox5: TCheckBox
      Left = 154
      Top = 113
      Width = 72
      Height = 16
      Alignment = taLeftJustify
      Caption = 'to I-cells'
      TabOrder = 7
    end
    object CheckBox11: TCheckBox
      Left = 10
      Top = 161
      Width = 44
      Height = 16
      Alignment = taLeftJustify
      Caption = 'add'
      Checked = True
      State = cbChecked
      TabOrder = 8
    end
    object CheckBox12: TCheckBox
      Left = 9
      Top = 71
      Width = 48
      Height = 18
      Caption = '4x4'
      TabOrder = 9
      OnClick = CheckBox12Click
    end
    object ComboBox6: TComboBox
      Left = 4
      Top = 134
      Width = 221
      Height = 24
      Hint = 'Manus manum lavat'
      ItemHeight = 16
      ItemIndex = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      Text = 'One-to-one & Mexican hat '
      OnChange = ComboBox6Change
      Items.Strings = (
        'One-to-one & Gauss(r12) '
        'One-to-one & Mexican hat '
        'Pref-to-pref: cos(fi12)*Gauss(r12)'
        'Pref-to-pref & Mexican hat'
        '')
    end
    object CheckBox13: TCheckBox
      Left = 144
      Top = 161
      Width = 81
      Height = 16
      Alignment = taLeftJustify
      Caption = 'symmetry'
      TabOrder = 11
    end
  end
  object GroupBox7: TGroupBox
    Left = 502
    Top = 868
    Width = 153
    Height = 67
    Caption = '    Gratings'
    TabOrder = 9
    object DDSpinEdit14: TDDSpinEdit
      Left = 96
      Top = 17
      Width = 49
      Height = 22
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      Increment = 0.100000000000000000
      ParentFont = False
      TabOrder = 0
      Value = 2.000000000000000000
      OnChange = DDSpinEdit12Change
    end
    object DDSpinEdit15: TDDSpinEdit
      Left = 96
      Top = 38
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
      TabOrder = 1
      Value = 10.000000000000000000
    end
    object StaticText12: TStaticText
      Left = 9
      Top = 18
      Width = 72
      Height = 20
      Caption = 'Length, mm'
      TabOrder = 2
    end
    object StaticText13: TStaticText
      Left = 9
      Top = 39
      Width = 87
      Height = 20
      Caption = 'Frequency,Hz'
      TabOrder = 3
    end
    object CheckBox3: TCheckBox
      Left = 1
      Top = 1
      Width = 16
      Height = 16
      Alignment = taLeftJustify
      TabOrder = 4
      OnClick = CheckBox2Click
    end
  end
  object Button3: TButton
    Left = 361
    Top = 889
    Width = 136
    Height = 24
    Caption = 'WriteVisualScreen'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 11193599
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = Button3Click
  end
  object GroupBox9: TGroupBox
    Left = 357
    Top = 794
    Width = 140
    Height = 49
    Caption = 'Boundary conditions'
    TabOrder = 11
    object ComboBox1: TComboBox
      Left = 9
      Top = 16
      Width = 120
      Height = 24
      ItemHeight = 16
      ItemIndex = 1
      TabOrder = 0
      Text = 'Cut edge, normalized'
      Items.Strings = (
        'Symmetry'
        'Cut edge, normalized'
        'Cut edge, not-normalized'
        'Dead boundary')
    end
  end
  object CheckBox8: TCheckBox
    Left = 585
    Top = 0
    Width = 72
    Height = 17
    Caption = 'Music'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
  end
  object Button4: TButton
    Left = 428
    Top = 846
    Width = 68
    Height = 40
    Caption = 'Stereo'
    TabOrder = 13
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 361
    Top = 846
    Width = 67
    Height = 40
    Caption = 'Blank'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
    OnClick = Button5Click
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 25
    Width = 657
    Height = 640
    ActivePage = TabSheet1
    TabOrder = 15
    object TabSheet1: TTabSheet
      Caption = 'Evolution'
      object Chart3: TChart
        Left = 0
        Top = 0
        Width = 657
        Height = 305
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Alignment = taLeftJustify
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -20
        Title.Font.Name = 'Arial'
        Title.Font.Style = []
        Title.Text.Strings = (
          'Firing rate')
        BottomAxis.MinorTickCount = 4
        BottomAxis.Title.Caption = 'ms'
        LeftAxis.Automatic = False
        LeftAxis.AutomaticMinimum = False
        LeftAxis.MinorTickCount = 4
        LeftAxis.Title.Caption = 'Hz'
        Legend.Alignment = laTop
        Legend.ColorWidth = 40
        Legend.ShadowSize = 0
        Legend.VertMargin = 1
        RightAxis.MinorTickCount = 4
        View3D = False
        Color = 11193599
        TabOrder = 0
        object Series8: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'nu[1]'
          LinePen.Width = 2
          Pointer.HorizSize = 3
          Pointer.InflateMargins = True
          Pointer.Style = psCircle
          Pointer.Visible = True
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
          SeriesColor = 16744448
          Title = 'nu[2]'
          LinePen.Style = psDash
          LinePen.Width = 2
          Pointer.HorizSize = 3
          Pointer.InflateMargins = True
          Pointer.Style = psCircle
          Pointer.VertSize = 3
          Pointer.Visible = True
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
          SeriesColor = 33023
          Title = 'nu[3]'
          LinePen.Width = 2
          Pointer.HorizSize = 3
          Pointer.InflateMargins = True
          Pointer.Style = psCircle
          Pointer.Visible = True
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
          SeriesColor = clLime
          Title = 'nu[4]'
          LinePen.Width = 2
          Pointer.HorizSize = 3
          Pointer.InflateMargins = True
          Pointer.Style = psCircle
          Pointer.VertSize = 3
          Pointer.Visible = True
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
          SeriesColor = clRed
          Title = 'ij_view2: nu[1]'
          Pointer.HorizSize = 3
          Pointer.InflateMargins = True
          Pointer.Style = psCircle
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
        object Series19: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = 16744448
          Title = 'nu[2]'
          LinePen.Style = psDash
          Pointer.HorizSize = 3
          Pointer.InflateMargins = True
          Pointer.Style = psCircle
          Pointer.VertSize = 3
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
        object Series20: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = 33023
          Title = 'nu[3]'
          Pointer.HorizSize = 3
          Pointer.InflateMargins = True
          Pointer.Style = psCircle
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
        object Series21: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clLime
          Title = 'nu[4]'
          Pointer.HorizSize = 3
          Pointer.InflateMargins = True
          Pointer.Style = psCircle
          Pointer.VertSize = 3
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
      object Chart2: TChart
        Left = 0
        Top = 304
        Width = 657
        Height = 313
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.AdjustFrame = False
        Title.Alignment = taLeftJustify
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMaroon
        Title.Font.Height = -20
        Title.Font.Name = 'Arial'
        Title.Font.Style = []
        Title.Text.Strings = (
          'Voltage')
        BottomAxis.MinorTickCount = 4
        BottomAxis.Title.Caption = 'ms'
        LeftAxis.MinorTickCount = 4
        LeftAxis.Title.Caption = 'mV'
        Legend.Alignment = laTop
        Legend.ColorWidth = 40
        Legend.ShadowSize = 0
        Legend.TextStyle = ltsPlain
        Legend.VertMargin = 1
        RightAxis.MinorTickCount = 4
        View3D = False
        Color = 11193599
        TabOrder = 1
        object Series5: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'V[1]'
          LinePen.Width = 2
          Pointer.HorizSize = 3
          Pointer.InflateMargins = True
          Pointer.Style = psCircle
          Pointer.Visible = True
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
          SeriesColor = 16744448
          Title = 'V[2]'
          LinePen.Style = psDash
          LinePen.Width = 2
          Pointer.HorizSize = 3
          Pointer.InflateMargins = True
          Pointer.Style = psCircle
          Pointer.VertSize = 3
          Pointer.Visible = True
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
          SeriesColor = 33023
          Title = 'V[3]'
          LinePen.Width = 2
          Pointer.HorizSize = 3
          Pointer.InflateMargins = True
          Pointer.Style = psCircle
          Pointer.Visible = True
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
          SeriesColor = clLime
          Title = 'V[4]'
          LinePen.Width = 2
          Pointer.HorizSize = 3
          Pointer.InflateMargins = True
          Pointer.Style = psCircle
          Pointer.VertSize = 3
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series26: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clYellow
          Title = 'VSD'
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
        object Series22: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'ij_view2: V[1]'
          Pointer.HorizSize = 3
          Pointer.InflateMargins = True
          Pointer.Style = psCircle
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
        object Series23: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = 16744448
          Title = 'V[2]'
          LinePen.Style = psDash
          Pointer.HorizSize = 3
          Pointer.InflateMargins = True
          Pointer.Style = psCircle
          Pointer.VertSize = 3
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
        object Series24: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = 33023
          Title = 'V[3]'
          Pointer.HorizSize = 3
          Pointer.InflateMargins = True
          Pointer.Style = psCircle
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
        object Series25: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clLime
          Title = 'V[4]'
          Pointer.HorizSize = 3
          Pointer.InflateMargins = True
          Pointer.Style = psCircle
          Pointer.VertSize = 3
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
    object TabSheet2: TTabSheet
      Caption = 'Profiles'
      ImageIndex = 1
      object Label7: TLabel
        Left = 121
        Top = 0
        Width = 430
        Height = 25
        Caption = 'Voltage and firing rate horizontal profiles at  j_view'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -20
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Chart4: TChart
        Left = 0
        Top = 25
        Width = 657
        Height = 272
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'TChart')
        Title.Visible = False
        BottomAxis.MinorTickCount = 4
        BottomAxis.Title.Caption = 'X, nodes'
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -17
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = [fsBold]
        LeftAxis.Automatic = False
        LeftAxis.AutomaticMinimum = False
        LeftAxis.MinorTickCount = 4
        LeftAxis.Title.Caption = 'Hz'
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -17
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = []
        Legend.Alignment = laTop
        Legend.ColorWidth = 60
        Legend.ShadowSize = 0
        Legend.TextStyle = ltsPlain
        RightAxis.Automatic = False
        RightAxis.AutomaticMaximum = False
        RightAxis.AutomaticMinimum = False
        RightAxis.Maximum = 854.000000000000000000
        RightAxis.MinorTickCount = 4
        RightAxis.Title.Caption = 'Hz'
        View3D = False
        Color = 11193599
        TabOrder = 1
        object LineSeries1: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          DataSource = Series1
          SeriesColor = clRed
          Title = 'nu[1]'
          LinePen.Width = 2
          Pointer.Brush.Color = clRed
          Pointer.InflateMargins = True
          Pointer.Style = psTriangle
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object LineSeries2: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          DataSource = Series2
          SeriesColor = 16744448
          Title = 'nu[2]'
          LinePen.Style = psDash
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psTriangle
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object LineSeries3: TLineSeries
          Active = False
          Marks.ArrowLength = 8
          Marks.Visible = False
          DataSource = Series3
          SeriesColor = clRed
          Title = 'V[1]'
          LinePen.Style = psDash
          LinePen.Width = 3
          Pointer.Brush.Color = clRed
          Pointer.HorizSize = 2
          Pointer.InflateMargins = True
          Pointer.Style = psCircle
          Pointer.VertSize = 3
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object LineSeries4: TLineSeries
          Active = False
          Marks.ArrowLength = 8
          Marks.Visible = False
          DataSource = Series4
          SeriesColor = 16744448
          Title = 'V[2]'
          LinePen.Style = psDash
          LinePen.Width = 2
          Pointer.HorizSize = 2
          Pointer.InflateMargins = True
          Pointer.Style = psCircle
          Pointer.VertSize = 3
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object LineSeries5: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          DataSource = Series13
          SeriesColor = 33023
          Title = 'nu[3]'
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psTriangle
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object LineSeries6: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          DataSource = Series14
          SeriesColor = clLime
          Title = 'nu[4]'
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psTriangle
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object LineSeries7: TLineSeries
          Active = False
          Marks.ArrowLength = 8
          Marks.Visible = False
          DataSource = Series15
          SeriesColor = 33023
          Title = 'V[3]'
          LinePen.Style = psDash
          LinePen.Width = 3
          Pointer.HorizSize = 2
          Pointer.InflateMargins = True
          Pointer.Style = psCircle
          Pointer.VertSize = 3
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object LineSeries8: TLineSeries
          Active = False
          Marks.ArrowLength = 8
          Marks.Visible = False
          DataSource = Series16
          SeriesColor = clLime
          Title = 'V[4]'
          LinePen.Style = psDash
          LinePen.Width = 2
          Pointer.HorizSize = 2
          Pointer.InflateMargins = True
          Pointer.Style = psCircle
          Pointer.VertSize = 3
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object LineSeries9: TLineSeries
          Active = False
          Marks.ArrowLength = 8
          Marks.Visible = False
          DataSource = Series17
          SeriesColor = clGreen
          Title = 'Inspector'
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
      object Chart1: TChart
        Left = 0
        Top = 304
        Width = 657
        Height = 306
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'TChart')
        Title.Visible = False
        BottomAxis.MinorTickCount = 4
        BottomAxis.Title.Caption = 'X, nodes'
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clBlack
        BottomAxis.Title.Font.Height = -17
        BottomAxis.Title.Font.Name = 'Arial'
        BottomAxis.Title.Font.Style = [fsBold]
        LeftAxis.MinorTickCount = 4
        LeftAxis.Title.Caption = 'mV'
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clBlack
        LeftAxis.Title.Font.Height = -17
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Style = []
        Legend.Alignment = laTop
        Legend.ColorWidth = 50
        Legend.ShadowSize = 0
        Legend.TextStyle = ltsPlain
        RightAxis.Automatic = False
        RightAxis.AutomaticMinimum = False
        RightAxis.MinorTickCount = 4
        RightAxis.Title.Caption = 'Hz'
        View3D = False
        Color = 11193599
        TabOrder = 0
        object Series1: TLineSeries
          Active = False
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'nu[1]'
          VertAxis = aRightAxis
          LinePen.Width = 2
          Pointer.Brush.Color = clRed
          Pointer.InflateMargins = True
          Pointer.Style = psTriangle
          Pointer.Visible = True
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
          Active = False
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = 16744448
          Title = 'nu[2]'
          VertAxis = aRightAxis
          LinePen.Style = psDash
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psTriangle
          Pointer.Visible = True
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series3: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'V[1]'
          LinePen.Style = psDash
          LinePen.Width = 3
          Pointer.Brush.Color = clRed
          Pointer.HorizSize = 2
          Pointer.InflateMargins = True
          Pointer.Style = psCircle
          Pointer.VertSize = 3
          Pointer.Visible = True
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
          Title = 'V[2]'
          LinePen.Style = psDash
          LinePen.Width = 2
          Pointer.HorizSize = 2
          Pointer.InflateMargins = True
          Pointer.Style = psCircle
          Pointer.VertSize = 3
          Pointer.Visible = True
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
          Active = False
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = 33023
          Title = 'nu[3]'
          VertAxis = aRightAxis
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psTriangle
          Pointer.Visible = True
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
          Active = False
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clLime
          Title = 'nu[4]'
          VertAxis = aRightAxis
          LinePen.Width = 2
          Pointer.InflateMargins = True
          Pointer.Style = psTriangle
          Pointer.Visible = True
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
          SeriesColor = 33023
          Title = 'V[3]'
          LinePen.Style = psDash
          LinePen.Width = 3
          Pointer.HorizSize = 2
          Pointer.InflateMargins = True
          Pointer.Style = psCircle
          Pointer.VertSize = 3
          Pointer.Visible = True
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
          SeriesColor = clLime
          Title = 'V[4]'
          LinePen.Style = psDash
          LinePen.Width = 2
          Pointer.HorizSize = 2
          Pointer.InflateMargins = True
          Pointer.Style = psCircle
          Pointer.VertSize = 3
          Pointer.Visible = True
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
          SeriesColor = clGreen
          Title = 'Inspector'
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
        object Series27: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clYellow
          Title = 'VSD'
          LinePen.Style = psDash
          LinePen.Width = 2
          Pointer.Brush.Color = clRed
          Pointer.HorizSize = 2
          Pointer.InflateMargins = True
          Pointer.Style = psCircle
          Pointer.VertSize = 3
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
  end
  object GroupBox8: TGroupBox
    Left = 238
    Top = 864
    Width = 113
    Height = 49
    Hint = 'To cut or not to cut the local connections'
    Caption = '    Cut'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 16
    object Label4: TLabel
      Left = 6
      Top = 21
      Width = 13
      Height = 16
      Caption = 'i,h'
    end
    object DDSpinEdit29: TDDSpinEdit
      Left = 25
      Top = 17
      Width = 41
      Height = 26
      Hint = 'Horizontal coordinate of the cut'
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Increment = 1.000000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Value = 20.000000000000000000
      OnChange = DDSpinEdit29Change
    end
    object CheckBox10: TCheckBox
      Left = 0
      Top = 1
      Width = 16
      Height = 16
      Alignment = taLeftJustify
      TabOrder = 1
      OnClick = CheckBox10Click
    end
    object DDSpinEdit30: TDDSpinEdit
      Left = 65
      Top = 17
      Width = 42
      Height = 26
      Hint = 'Height of the cut'
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Increment = 2.000000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Value = 6.000000000000000000
      OnChange = DDSpinEdit30Change
    end
  end
  object GroupBox10: TGroupBox
    Left = 502
    Top = 800
    Width = 153
    Height = 97
    Caption = 'Parameter distribution'
    TabOrder = 17
    object ComboBox4: TComboBox
      Left = 9
      Top = 16
      Width = 136
      Height = 24
      Hint = 'Choose parameter to distribute'
      ItemHeight = 16
      ItemIndex = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = 'none'
      Items.Strings = (
        'none'
        'gGABA'
        'gAMPA')
    end
    object ComboBox5: TComboBox
      Left = 9
      Top = 41
      Width = 136
      Height = 24
      Hint = 'Set form of distribution'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ItemIndex = 0
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Text = 'linear: min-left, 1-right'
      OnChange = ComboBox5Change
      Items.Strings = (
        'linear: min-left, 1-right'
        'linear: 1-left, min-right'
        'square: 1-left, 0-right'
        'horiz. line: min-left, 1-right '
        'horiz. line: constant')
    end
    object DDSpinEdit31: TDDSpinEdit
      Left = 96
      Top = 70
      Width = 49
      Height = 22
      Hint = 'Set minimum for the distributed parameter'
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      Increment = 10.000000000000000000
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Value = 20.000000000000000000
      OnChange = DDSpinEdit22Change
      OnDblClick = DDSpinEdit22DblClick
    end
    object StaticText18: TStaticText
      Left = 9
      Top = 72
      Width = 43
      Height = 20
      Hint = 'Set minimum for the distributed parameter'
      Caption = 'min, %'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
  end
end
