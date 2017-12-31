object Form8: TForm8
  Left = 1282
  Top = 0
  Width = 633
  Height = 981
  AutoSize = True
  Caption = 'Form8: V1-RING'
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 120
  TextHeight = 16
  object Label4: TLabel
    Left = 9
    Top = 0
    Width = 75
    Height = 16
    Caption = 'LabelTime'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBackground
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox3: TGroupBox
    Left = 354
    Top = 534
    Width = 128
    Height = 99
    Caption = 'Write and Draw'
    TabOrder = 0
    object DDSpinEdit7: TDDSpinEdit
      Left = 73
      Top = 15
      Width = 48
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 1.000000000000000000
      TabOrder = 0
      OnChange = DDSpinEdit7Change
    end
    object StaticText9: TStaticText
      Left = 9
      Top = 21
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
      Value = 5.000000000000000000
    end
    object StaticText8: TStaticText
      Left = 25
      Top = 46
      Width = 47
      Height = 20
      Caption = 'n_draw'
      TabOrder = 3
    end
    object DDSpinEdit12: TDDSpinEdit
      Left = 73
      Top = 66
      Width = 48
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 1.000000000000000000
      TabOrder = 4
      Value = 12.000000000000000000
    end
    object StaticText14: TStaticText
      Left = 25
      Top = 70
      Width = 41
      Height = 20
      Caption = 'i_view'
      TabOrder = 5
    end
  end
  object Button1: TButton
    Left = 265
    Top = 0
    Width = 88
    Height = 25
    Caption = 'CBRD-ring'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 552
    Top = 0
    Width = 66
    Height = 25
    Caption = 'Clear'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Chart1: TChart
    Left = 0
    Top = 25
    Width = 625
    Height = 256
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'Excitatory population')
    BottomAxis.Title.Caption = 'X, degrees'
    LeftAxis.Automatic = False
    LeftAxis.AutomaticMinimum = False
    LeftAxis.Title.Caption = 'Hz'
    LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
    LeftAxis.Title.Font.Color = clBlack
    LeftAxis.Title.Font.Height = -13
    LeftAxis.Title.Font.Name = 'Arial'
    LeftAxis.Title.Font.Style = [fsBold]
    Legend.Alignment = laTop
    Legend.ColorWidth = 25
    Legend.ResizeChart = False
    Legend.ShadowSize = 0
    Legend.VertMargin = 1
    RightAxis.Title.Caption = 'mV'
    RightAxis.Title.Font.Charset = DEFAULT_CHARSET
    RightAxis.Title.Font.Color = clBlack
    RightAxis.Title.Font.Height = -13
    RightAxis.Title.Font.Name = 'Arial'
    RightAxis.Title.Font.Style = [fsBold]
    View3D = False
    Color = clMoneyGreen
    TabOrder = 3
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clBlue
      Title = 'U[L+1]'
      VertAxis = aRightAxis
      LinePen.Color = clBlue
      LinePen.Width = 3
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
    object Series2: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clBlack
      Title = 'rn[1,1]'
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
    object Series3: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'nu[L+1]'
      LinePen.Width = 3
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
    object Series4: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = 8454143
      Title = 'rext[1]'
      LinePen.Width = 3
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
  object GroupBox2: TGroupBox
    Left = 237
    Top = 534
    Width = 113
    Height = 99
    Caption = 'Stimulus'
    TabOrder = 4
    object StaticText3: TStaticText
      Left = 9
      Top = 21
      Width = 93
      Height = 20
      Caption = 'R_stim - Form3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object StaticText6: TStaticText
      Left = 9
      Top = 44
      Width = 65
      Height = 20
      Caption = 'fi0 - Form3'
      TabOrder = 1
    end
    object ComboBox1: TComboBox
      Left = 9
      Top = 64
      Width = 96
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ItemIndex = 2
      ParentFont = False
      TabOrder = 2
      Text = 'cos'
      Items.Strings = (
        'Localized'
        'R_stim / R'
        'cos'
        'cos-Illusion'
        'cos-"gratings"')
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 534
    Width = 233
    Height = 161
    Caption = 'Mesh and connections'
    TabOrder = 5
    object StaticText4: TStaticText
      Left = 137
      Top = 18
      Width = 73
      Height = 20
      Caption = 'on P       on I'
      TabOrder = 10
    end
    object DDSpinEdit1: TDDSpinEdit
      Left = 25
      Top = 46
      Width = 48
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 1.000000000000000000
      TabOrder = 0
      Value = 20.000000000000000000
      OnChange = DDSpinEdit1Change
    end
    object StaticText2: TStaticText
      Left = 9
      Top = 47
      Width = 14
      Height = 20
      Caption = 'ni'
      TabOrder = 1
    end
    object StaticText1: TStaticText
      Left = 81
      Top = 18
      Width = 21
      Height = 20
      Caption = 'q='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object DDSpinEdit2: TDDSpinEdit
      Left = 128
      Top = 36
      Width = 49
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 1.000000000000000000
      TabOrder = 3
      Value = 1.000000000000000000
    end
    object DDSpinEdit6: TDDSpinEdit
      Left = 128
      Top = 62
      Width = 49
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 1.000000000000000000
      TabOrder = 4
      Value = 1.000000000000000000
    end
    object ComboBox2: TComboBox
      Left = 9
      Top = 16
      Width = 64
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ItemIndex = 1
      ParentFont = False
      TabOrder = 5
      Text = 'cos'
      OnChange = ComboBox2Change
      Items.Strings = (
        'exp'
        'cos')
    end
    object DDSpinEdit4: TDDSpinEdit
      Left = 176
      Top = 36
      Width = 49
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 1.000000000000000000
      TabOrder = 6
      Value = 0.010000000000000000
    end
    object DDSpinEdit5: TDDSpinEdit
      Left = 176
      Top = 62
      Width = 49
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 1.000000000000000000
      TabOrder = 7
      Value = 1.000000000000000000
    end
    object StaticText5: TStaticText
      Left = 89
      Top = 38
      Width = 32
      Height = 20
      Caption = 'de P'
      TabOrder = 8
    end
    object StaticText7: TStaticText
      Left = 89
      Top = 63
      Width = 26
      Height = 20
      Caption = 'de I'
      TabOrder = 9
    end
    object CheckBox1: TCheckBox
      Left = 9
      Top = 76
      Width = 96
      Height = 18
      Caption = 'phi_22=nu_I'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 11
      OnClick = CheckBox1Click
    end
    object DDSpinEdit8: TDDSpinEdit
      Left = 128
      Top = 110
      Width = 49
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 1.000000000000000000
      TabOrder = 12
      Value = 1.000000000000000000
    end
    object DDSpinEdit9: TDDSpinEdit
      Left = 176
      Top = 109
      Width = 49
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 1.000000000000000000
      TabOrder = 13
      Value = 1.000000000000000000
    end
    object StaticText10: TStaticText
      Left = 137
      Top = 90
      Width = 73
      Height = 20
      Caption = 'on P       on I'
      TabOrder = 14
    end
    object StaticText11: TStaticText
      Left = 81
      Top = 90
      Width = 33
      Height = 20
      Caption = 'fi_r='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 15
    end
    object StaticText12: TStaticText
      Left = 89
      Top = 110
      Width = 32
      Height = 20
      Caption = 'de P'
      TabOrder = 16
    end
    object StaticText13: TStaticText
      Left = 89
      Top = 135
      Width = 26
      Height = 20
      Caption = 'de I'
      TabOrder = 17
    end
    object DDSpinEdit10: TDDSpinEdit
      Left = 128
      Top = 134
      Width = 49
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 1.000000000000000000
      TabOrder = 18
      Value = 1.000000000000000000
    end
    object DDSpinEdit11: TDDSpinEdit
      Left = 176
      Top = 133
      Width = 49
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 1.000000000000000000
      TabOrder = 19
      Value = 1.000000000000000000
    end
  end
  object Chart2: TChart
    Left = 0
    Top = 281
    Width = 625
    Height = 249
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'Inhibitory population')
    BottomAxis.Title.Caption = 'X, degrees'
    LeftAxis.Automatic = False
    LeftAxis.AutomaticMinimum = False
    LeftAxis.Title.Caption = 'Hz'
    LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
    LeftAxis.Title.Font.Color = clBlack
    LeftAxis.Title.Font.Height = -13
    LeftAxis.Title.Font.Name = 'Arial'
    LeftAxis.Title.Font.Style = [fsBold]
    Legend.Alignment = laTop
    Legend.ColorWidth = 25
    Legend.ResizeChart = False
    Legend.ShadowSize = 0
    Legend.VertMargin = 1
    RightAxis.LabelsSeparation = 30
    RightAxis.Title.Caption = 'mV'
    RightAxis.Title.Font.Charset = DEFAULT_CHARSET
    RightAxis.Title.Font.Color = clBlack
    RightAxis.Title.Font.Height = -13
    RightAxis.Title.Font.Name = 'Arial'
    RightAxis.Title.Font.Style = [fsBold]
    View3D = False
    Color = clMoneyGreen
    TabOrder = 6
    object Series6: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = 16744448
      Title = 'U[L+2]'
      VertAxis = aRightAxis
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
    object Series7: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'nu[L+2]'
      LinePen.Width = 3
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
    object Series5: TPointSeries
      Marks.ArrowLength = 0
      Marks.Visible = False
      SeriesColor = clGreen
      Title = 'Check nu_I(nu_E)'
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = True
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
  object Button5: TButton
    Left = 488
    Top = 569
    Width = 137
    Height = 24
    Caption = 'Map CBRD to KFP'
    TabOrder = 7
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 488
    Top = 669
    Width = 137
    Height = 24
    Caption = 'KFP Ring'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = Button6Click
  end
  object Button3: TButton
    Left = 488
    Top = 537
    Width = 137
    Height = 24
    Caption = 'Map 2-d to ring'
    TabOrder = 9
    OnClick = Button3Click
  end
  object CheckBox2: TCheckBox
    Left = 360
    Top = 8
    Width = 177
    Height = 17
    Caption = 'RDA-ring  with I0,I1,J0,J1'
    TabOrder = 10
  end
  object Button4: TButton
    Left = 353
    Top = 0
    Width = 184
    Height = 25
    Caption = 'CBRD-ring  with I0,I1,J0,J1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    OnClick = Button4Click
  end
  object Chart3: TChart
    Left = 0
    Top = 697
    Width = 625
    Height = 249
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'Excitatory population')
    Title.Visible = False
    BottomAxis.Title.Caption = 'X, degrees'
    LeftAxis.Title.Caption = 'Hz'
    LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
    LeftAxis.Title.Font.Color = clBlack
    LeftAxis.Title.Font.Height = -13
    LeftAxis.Title.Font.Name = 'Arial'
    LeftAxis.Title.Font.Style = [fsBold]
    Legend.Alignment = laTop
    Legend.ColorWidth = 50
    Legend.LegendStyle = lsSeries
    Legend.ResizeChart = False
    Legend.ShadowSize = 0
    Legend.VertMargin = 1
    RightAxis.Title.Caption = 'pA'
    RightAxis.Title.Font.Charset = DEFAULT_CHARSET
    RightAxis.Title.Font.Color = clBlack
    RightAxis.Title.Font.Height = -13
    RightAxis.Title.Font.Name = 'Arial'
    RightAxis.Title.Font.Style = [fsBold]
    View3D = False
    Color = clMoneyGreen
    TabOrder = 12
    object Series9: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clGreen
      Title = 'Isyn[L+1]'
      VertAxis = aRightAxis
      LinePen.Color = clGreen
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
  object GroupBox4: TGroupBox
    Left = 488
    Top = 592
    Width = 137
    Height = 73
    Caption = 'Mapping options'
    TabOrder = 13
    object ComboBox3: TComboBox
      Left = 3
      Top = 19
      Width = 129
      Height = 24
      ItemHeight = 16
      ItemIndex = 1
      TabOrder = 0
      Text = 'appr. noisy LIF '
      Items.Strings = (
        'appr. full neuron'
        'appr. noisy LIF '
        'nLIF: V_about=Vth/2')
    end
  end
end
