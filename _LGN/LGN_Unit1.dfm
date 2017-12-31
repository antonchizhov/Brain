object LGN_Form1: TLGN_Form1
  Left = 107
  Top = 4
  Width = 1081
  Height = 500
  AutoSize = True
  Caption = 
    'Mapping of a retina input-image to an input into a V1-hypercolum' +
    'n: v17.10 '
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Label8: TLabel
    Left = 0
    Top = 0
    Width = 80
    Height = 25
    Caption = 'Time, ms'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label16: TLabel
    Left = 4
    Top = 36
    Width = 57
    Height = 16
    Caption = 't_end, ms'
  end
  object Label18: TLabel
    Left = 4
    Top = 60
    Width = 35
    Height = 16
    Caption = 'dt, ms'
  end
  object Label24: TLabel
    Left = 4
    Top = 84
    Width = 58
    Height = 16
    Caption = 't_stim, ms'
  end
  object Button1: TButton
    Left = 168
    Top = 8
    Width = 81
    Height = 33
    Caption = 'Start'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 168
    Top = 46
    Width = 201
    Height = 251
    Caption = 'Input to Retina'
    TabOrder = 2
    object Label1: TLabel
      Left = 9
      Top = 24
      Width = 83
      Height = 16
      Caption = 'Frequency,Hz'
    end
    object Label2: TLabel
      Left = 9
      Top = 48
      Width = 70
      Height = 16
      Caption = 'Length, deg'
    end
    object Label5: TLabel
      Left = 9
      Top = 96
      Width = 70
      Height = 16
      Caption = 'fi0, degrees'
    end
    object Label6: TLabel
      Left = 9
      Top = 120
      Width = 95
      Height = 16
      Caption = 'AmplOfStimLum'
    end
    object Label17: TLabel
      Left = 9
      Top = 168
      Width = 73
      Height = 16
      Caption = 'Background'
    end
    object Label22: TLabel
      Left = 9
      Top = 72
      Width = 87
      Height = 16
      Caption = 'Radius_2, deg'
    end
    object Label28: TLabel
      Left = 9
      Top = 144
      Width = 85
      Height = 16
      Caption = 'MeanStimLum'
    end
    object DDSpinEdit1: TDDSpinEdit
      Left = 128
      Top = 20
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 1
      Increment = 5.000000000000000000
      TabOrder = 0
      OnDblClick = DDSpinEdit1DblClick
    end
    object DDSpinEdit2: TDDSpinEdit
      Left = 128
      Top = 44
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 0.100000000000000000
      TabOrder = 1
      Value = 1.000000000000000000
    end
    object ComboBox1: TComboBox
      Left = 8
      Top = 192
      Width = 185
      Height = 24
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 4
      Text = 'Bar'
      OnChange = ComboBox1Change
      Items.Strings = (
        'Bar'
        'Gratings'
        'delta-function'
        'Gradient'
        'Spot'
        'Ring'
        'Complex stimulus'
        'Gratings inside Radius_2')
    end
    object DDSpinEdit22: TDDSpinEdit
      Left = 128
      Top = 68
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Enabled = False
      Increment = 0.100000000000000000
      TabOrder = 6
      Value = 1.500000000000000000
    end
    object DDSpinEdit5: TDDSpinEdit
      Left = 128
      Top = 92
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 5.000000000000000000
      TabOrder = 2
      Value = 45.000000000000000000
    end
    object DDSpinEdit6: TDDSpinEdit
      Left = 128
      Top = 116
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 10.000000000000000000
      TabOrder = 3
      Value = 100.000000000000000000
    end
    object DDSpinEdit27: TDDSpinEdit
      Left = 128
      Top = 140
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 10.000000000000000000
      TabOrder = 7
      Value = 100.000000000000000000
    end
    object DDSpinEdit17: TDDSpinEdit
      Left = 128
      Top = 164
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 1.000000000000000000
      TabOrder = 5
      Value = 20.000000000000000000
      OnDblClick = DDSpinEdit17DblClick
    end
    object CheckBox2: TCheckBox
      Left = 8
      Top = 224
      Width = 97
      Height = 17
      Caption = 'Saccades'
      TabOrder = 8
      OnClick = CheckBox2Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 168
    Top = 296
    Width = 201
    Height = 113
    Caption = 'Grid'
    TabOrder = 3
    object Label3: TLabel
      Left = 9
      Top = 16
      Width = 10
      Height = 16
      Caption = 'ni'
    end
    object Label4: TLabel
      Left = 9
      Top = 40
      Width = 10
      Height = 16
      Caption = 'nj'
    end
    object Label7: TLabel
      Left = 9
      Top = 64
      Width = 62
      Height = 16
      Caption = 'dx,dy, deg'
    end
    object Label31: TLabel
      Left = 9
      Top = 88
      Width = 116
      Height = 16
      Caption = 'V1 to LGN, deg/mm'
    end
    object DDSpinEdit3: TDDSpinEdit
      Left = 128
      Top = 12
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 1.000000000000000000
      TabOrder = 0
      Value = 50.000000000000000000
    end
    object DDSpinEdit4: TDDSpinEdit
      Left = 128
      Top = 36
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 1.000000000000000000
      TabOrder = 1
      Value = 50.000000000000000000
    end
    object DDSpinEdit7: TDDSpinEdit
      Left = 128
      Top = 60
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 0.050000000000000000
      TabOrder = 2
      Value = 0.100000000000000000
    end
    object DDSpinEdit29: TDDSpinEdit
      Left = 128
      Top = 84
      Width = 65
      Height = 26
      Hint = '[Hooser et al. 2005; Chavane et al. 2011]'
      StrWidth = 2
      StrDecimals = 1
      Increment = 0.500000000000000000
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Value = 1.500000000000000000
    end
  end
  object DDSpinEdit8: TDDSpinEdit
    Left = 96
    Top = 0
    Width = 65
    Height = 26
    Hint = 'Step by step'
    StrWidth = 2
    StrDecimals = 2
    Increment = 1.000000000000000000
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnChange = DDSpinEdit8Change
    OnClick = DDSpinEdit8Click
  end
  object GroupBox3: TGroupBox
    Left = 376
    Top = 0
    Width = 201
    Height = 113
    Caption = 'LGN temporal filter'
    TabOrder = 5
    object Label9: TLabel
      Left = 9
      Top = 16
      Width = 71
      Height = 16
      Caption = 'tau_cen, ms'
    end
    object Label10: TLabel
      Left = 9
      Top = 40
      Width = 67
      Height = 16
      Caption = 'tau_sur, ms'
    end
    object Label32: TLabel
      Left = 9
      Top = 64
      Width = 71
      Height = 16
      Caption = 'tau_late, ms'
    end
    object Label33: TLabel
      Left = 9
      Top = 88
      Width = 92
      Height = 16
      Caption = 'K_late_to_early'
    end
    object DDSpinEdit9: TDDSpinEdit
      Left = 128
      Top = 12
      Width = 65
      Height = 26
      Hint = 't/tau*exp(-t/tau) - K*t/tau2*exp(-t/tau2)  [Dayan&Abbott]'
      StrWidth = 2
      StrDecimals = 2
      Increment = 1.000000000000000000
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Value = 10.000000000000000000
    end
    object DDSpinEdit10: TDDSpinEdit
      Left = 128
      Top = 36
      Width = 65
      Height = 26
      Hint = 't/tau*exp(-t/tau) - K*t/tau2*exp(-t/tau2)  [Dayan&Abbott]'
      StrWidth = 2
      StrDecimals = 2
      Increment = 1.000000000000000000
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Value = 20.000000000000000000
    end
    object DDSpinEdit30: TDDSpinEdit
      Left = 128
      Top = 60
      Width = 65
      Height = 26
      Hint = 
        't/tau^2*exp(-t/tau) - K*t/tau_late^2*exp(-t/tau_late)  [Dayan&Ab' +
        'bott]'
      StrWidth = 2
      StrDecimals = 2
      Increment = 1.000000000000000000
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Value = 64.000000000000000000
    end
    object DDSpinEdit31: TDDSpinEdit
      Left = 128
      Top = 84
      Width = 65
      Height = 26
      Hint = 
        't/tau^2*exp(-t/tau) - K*t/tau_late^2*exp(-t/tau_late)  [Dayan&Ab' +
        'bott]'
      StrWidth = 2
      StrDecimals = 2
      Increment = 0.100000000000000000
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Value = 1.000000000000000000
    end
  end
  object GroupBox4: TGroupBox
    Left = 376
    Top = 112
    Width = 201
    Height = 185
    Caption = 'LGN spatial filter'
    TabOrder = 6
    object Label11: TLabel
      Left = 9
      Top = 16
      Width = 99
      Height = 16
      Caption = 'sgm_cen_h, deg'
    end
    object Label12: TLabel
      Left = 9
      Top = 88
      Width = 95
      Height = 16
      Caption = 'sgm_sur_h, deg'
    end
    object Label13: TLabel
      Left = 9
      Top = 136
      Width = 61
      Height = 16
      Caption = 'k_cen_sur'
    end
    object Label19: TLabel
      Left = 9
      Top = 40
      Width = 106
      Height = 16
      Caption = 'sgm_cen_v1, deg'
    end
    object Label23: TLabel
      Left = 9
      Top = 160
      Width = 69
      Height = 16
      Caption = 'L_spont, Hz'
    end
    object Label25: TLabel
      Left = 9
      Top = 112
      Width = 95
      Height = 16
      Caption = 'sgm_sur_v, deg'
    end
    object Label29: TLabel
      Left = 9
      Top = 64
      Width = 106
      Height = 16
      Caption = 'sgm_cen_v2, deg'
    end
    object DDSpinEdit11: TDDSpinEdit
      Left = 128
      Top = 12
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 0.100000000000000000
      TabOrder = 0
      Value = 0.300000000000000000
      OnChange = DDSpinEdit11Change
      OnClick = DDSpinEdit11Click
    end
    object DDSpinEdit19: TDDSpinEdit
      Left = 128
      Top = 36
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 0.100000000000000000
      TabOrder = 3
      Value = 0.300000000000000000
      OnChange = DDSpinEdit19Change
      OnClick = DDSpinEdit19Click
    end
    object DDSpinEdit28: TDDSpinEdit
      Left = 128
      Top = 60
      Width = 65
      Height = 26
      Hint = 'for asymmetric RF'
      StrWidth = 2
      StrDecimals = 2
      Increment = 0.100000000000000000
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      Value = 0.300000000000000000
      OnChange = DDSpinEdit28Change
      OnClick = DDSpinEdit28Click
    end
    object DDSpinEdit12: TDDSpinEdit
      Left = 128
      Top = 84
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 0.100000000000000000
      TabOrder = 1
      Value = 1.500000000000000000
      OnChange = DDSpinEdit12Change
      OnClick = DDSpinEdit12Click
    end
    object DDSpinEdit25: TDDSpinEdit
      Left = 128
      Top = 108
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 0.100000000000000000
      TabOrder = 5
      Value = 1.500000000000000000
      OnChange = DDSpinEdit25Change
      OnClick = DDSpinEdit25Click
    end
    object DDSpinEdit13: TDDSpinEdit
      Left = 128
      Top = 132
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 0.100000000000000000
      TabOrder = 2
      Value = 1.000000000000000000
      OnChange = DDSpinEdit13Change
      OnClick = DDSpinEdit13Click
    end
    object DDSpinEdit23: TDDSpinEdit
      Left = 128
      Top = 156
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 1
      Increment = 1.000000000000000000
      TabOrder = 4
      Value = 10.000000000000000000
      OnDblClick = DDSpinEdit23DblClick
    end
  end
  object GroupBox5: TGroupBox
    Left = 376
    Top = 368
    Width = 201
    Height = 97
    Caption = 'LGN to V1 projections'
    TabOrder = 7
    object Label14: TLabel
      Left = 9
      Top = 20
      Width = 86
      Height = 16
      Caption = 'sgm_pref, deg'
    end
    object Label15: TLabel
      Left = 9
      Top = 44
      Width = 85
      Height = 16
      Caption = 'sgm_orth, deg'
    end
    object Label34: TLabel
      Left = 64
      Top = 68
      Width = 53
      Height = 16
      Caption = 'shift, deg'
    end
    object DDSpinEdit14: TDDSpinEdit
      Left = 128
      Top = 16
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 0.100000000000000000
      TabOrder = 0
      Value = 0.200000000000000000
    end
    object DDSpinEdit15: TDDSpinEdit
      Left = 128
      Top = 40
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 0.100000000000000000
      TabOrder = 1
      Value = 0.400000000000000000
    end
    object CheckBox3: TCheckBox
      Left = 8
      Top = 68
      Width = 49
      Height = 17
      Caption = 'Off'
      TabOrder = 2
    end
    object DDSpinEdit32: TDDSpinEdit
      Left = 128
      Top = 64
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 0.100000000000000000
      TabOrder = 3
      OnChange = DDSpinEdit32Change
    end
  end
  object RadioGroup1: TRadioGroup
    Left = 0
    Top = 112
    Width = 161
    Height = 233
    Caption = 'Field to plot in 2D-lattice'
    ItemIndex = 0
    Items.Strings = (
      'zScreen'
      'zScreen_Sat'
      'zD_cen'
      'zD_sur'
      'zLGN_cen'
      'zLGN_sur'
      'zLGN_subthr'
      'zLGN'
      'ReceptiveField'
      'zLGN_Off')
    TabOrder = 0
    OnClick = RadioGroup1Click
  end
  object DDSpinEdit16: TDDSpinEdit
    Left = 96
    Top = 32
    Width = 65
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 50.000000000000000000
    TabOrder = 8
    Value = 100.000000000000000000
  end
  object DDSpinEdit18: TDDSpinEdit
    Left = 96
    Top = 56
    Width = 65
    Height = 26
    StrWidth = 2
    StrDecimals = 2
    Increment = 0.500000000000000000
    TabOrder = 9
    Value = 1.000000000000000000
  end
  object PageControl1: TPageControl
    Left = 584
    Top = 0
    Width = 489
    Height = 449
    ActivePage = TabSheet1
    TabOrder = 10
    object TabSheet1: TTabSheet
      Caption = 'LGN cell reponse'
      object Chart2: TChart
        Left = 0
        Top = 0
        Width = 481
        Height = 417
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'Response of the recorded cell (triangle) as a function of time')
        BottomAxis.Title.Caption = 't, ms'
        LeftAxis.Automatic = False
        LeftAxis.AutomaticMinimum = False
        LeftAxis.Title.Caption = 'zLGN'
        Legend.Alignment = laTop
        Legend.ColorWidth = 45
        Legend.LegendStyle = lsSeries
        Legend.ShadowSize = 0
        Legend.TextStyle = ltsPlain
        Legend.VertMargin = 2
        View3D = False
        Color = clMoneyGreen
        TabOrder = 0
        object Button5: TButton
          Left = 424
          Top = 0
          Width = 51
          Height = 17
          Caption = 'BMP'
          TabOrder = 0
          OnClick = Button5Click
        end
        object LineSeries1: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'zLGN(i_RecNrn,j_RecNrn)'
          LinePen.Width = 2
          Pointer.Brush.Color = 33023
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
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'V1-hypercolumn'
      ImageIndex = 1
      TabVisible = False
      object Chart1: TChart
        Left = 0
        Top = 0
        Width = 481
        Height = 417
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'Input into V1 at the central point i=ni/2, j=nj/2')
        BottomAxis.Automatic = False
        BottomAxis.AutomaticMaximum = False
        BottomAxis.AutomaticMinimum = False
        BottomAxis.ExactDateTime = False
        BottomAxis.Increment = 30.000000000000000000
        BottomAxis.Maximum = 180.000000000000000000
        BottomAxis.Title.Caption = 'Theta, degrees'
        LeftAxis.Automatic = False
        LeftAxis.AutomaticMinimum = False
        LeftAxis.Title.Caption = 'zV1'
        Legend.Alignment = laTop
        Legend.ColorWidth = 45
        Legend.LegendStyle = lsSeries
        Legend.ResizeChart = False
        Legend.ShadowSize = 0
        Legend.TextStyle = ltsPlain
        Legend.VertMargin = 1
        View3D = False
        Color = clMoneyGreen
        TabOrder = 0
        object Button8: TButton
          Left = 424
          Top = 0
          Width = 51
          Height = 17
          Caption = 'BMP'
          TabOrder = 0
          OnClick = Button8Click
        end
        object Series1: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'zV1'
          LinePen.Width = 2
          Pointer.Brush.Color = 33023
          Pointer.HorizSize = 3
          Pointer.InflateMargins = True
          Pointer.Style = psCircle
          Pointer.VertSize = 3
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
    end
    object TabSheet3: TTabSheet
      Caption = 'Orientation diagram'
      ImageIndex = 2
      TabVisible = False
      object Chart3: TChart
        Left = 32
        Top = 0
        Width = 425
        Height = 417
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'diagram of the maxima of LGN neuron'#39's responses')
        Title.Visible = False
        LeftAxis.ExactDateTime = False
        LeftAxis.Increment = 20.000000000000000000
        Legend.Alignment = laTop
        Legend.ColorWidth = 45
        Legend.LegendStyle = lsSeries
        Legend.ShadowSize = 0
        Legend.TextStyle = ltsPlain
        Legend.VertMargin = 1
        View3D = False
        Color = clMoneyGreen
        TabOrder = 0
        object Button6: TButton
          Left = 350
          Top = 0
          Width = 51
          Height = 17
          Caption = 'BMP'
          TabOrder = 0
          OnClick = Button6Click
        end
        object LineSeries2: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'maximum'
          LinePen.Width = 2
          Pointer.Brush.Color = 33023
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
        object Series2: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          Title = 'average'
          LinePen.Width = 2
          Pointer.Brush.Color = clLime
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
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'ReceptiveField'
      ImageIndex = 3
      object Label27: TLabel
        Left = 124
        Top = 4
        Width = 257
        Height = 16
        Caption = 'RF profile across vertical coordinate:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label30: TLabel
        Left = 228
        Top = 260
        Width = 82
        Height = 16
        Caption = 'RF kinetics:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Chart4: TChart
        Left = 8
        Top = 24
        Width = 465
        Height = 233
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'TChart')
        Title.Visible = False
        BottomAxis.Title.Caption = 'y, degrees'
        Legend.Alignment = laTop
        Legend.LegendStyle = lsSeries
        Legend.ShadowSize = 0
        Legend.VertMargin = 2
        View3D = False
        Color = clMoneyGreen
        TabOrder = 0
        object Button7: TButton
          Left = 414
          Top = 0
          Width = 51
          Height = 17
          Caption = 'BMP'
          TabOrder = 0
          OnClick = Button7Click
        end
        object Series3: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = 16384
          Title = 'Receptive field'
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
        object Series4: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Excitation'
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
        object Series5: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlue
          Title = 'Inhibition'
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
      object Chart5: TChart
        Left = 8
        Top = 276
        Width = 465
        Height = 141
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        MarginTop = 0
        Title.Text.Strings = (
          'TChart')
        Title.Visible = False
        BottomAxis.Title.Caption = 't, ms'
        Legend.Alignment = laTop
        Legend.LegendStyle = lsSeries
        Legend.ShadowSize = 0
        Legend.VertMargin = 2
        View3D = False
        Color = clMoneyGreen
        TabOrder = 1
        object Button10: TButton
          Left = 414
          Top = 0
          Width = 51
          Height = 17
          Caption = 'BMP'
          TabOrder = 0
          OnClick = Button10Click
        end
        object Series6: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Excitation'
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
          SeriesColor = clBlue
          Title = 'Inhibition'
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
  object Button3: TButton
    Left = 168
    Top = 416
    Width = 201
    Height = 33
    Caption = 'Re-InitializeAndRunOneStep'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 424
    Top = 0
    Width = 105
    Height = 25
    Caption = 'Diagram'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    Visible = False
    OnClick = Button4Click
  end
  object GroupBox6: TGroupBox
    Left = 376
    Top = 296
    Width = 201
    Height = 73
    Caption = 'Coords. of recorded neuron'
    TabOrder = 13
    object Label20: TLabel
      Left = 9
      Top = 24
      Width = 84
      Height = 16
      Caption = 'Vert_shift, deg'
    end
    object Label21: TLabel
      Left = 9
      Top = 48
      Width = 91
      Height = 16
      Caption = 'Horiz_shift, deg'
    end
    object DDSpinEdit20: TDDSpinEdit
      Left = 128
      Top = 20
      Width = 65
      Height = 26
      Hint = '(white dot in LGN_Form15)'
      StrWidth = 2
      StrDecimals = 2
      Increment = 0.100000000000000000
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Value = 0.500000000000000000
      OnDblClick = DDSpinEdit20DblClick
    end
    object DDSpinEdit21: TDDSpinEdit
      Left = 128
      Top = 44
      Width = 65
      Height = 26
      Hint = '(white dot in LGN_Form15)'
      StrWidth = 2
      StrDecimals = 2
      Increment = 0.100000000000000000
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object DDSpinEdit24: TDDSpinEdit
    Left = 96
    Top = 80
    Width = 65
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 50.000000000000000000
    TabOrder = 14
    Value = 50.000000000000000000
  end
  object GroupBox7: TGroupBox
    Left = 0
    Top = 344
    Width = 161
    Height = 73
    Caption = 'Saturation'
    TabOrder = 15
    object Label26: TLabel
      Left = 9
      Top = 45
      Width = 82
      Height = 16
      Caption = 'ScaleOfSatur.'
    end
    object DDSpinEdit26: TDDSpinEdit
      Left = 96
      Top = 41
      Width = 57
      Height = 26
      Hint = 
        'zScreen_Saturated[i,j]:=2/(1+dexp(-2*zScreen[i,j]/ScaleOfSaturat' +
        'ion))-1, it is turned off if 0'
      StrWidth = 2
      StrDecimals = 1
      Increment = 50.000000000000000000
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnDblClick = DDSpinEdit26DblClick
    end
    object ComboBox2: TComboBox
      Left = 8
      Top = 16
      Width = 145
      Height = 24
      Hint = 
        'Half of Sigmoid = Scale*(2/(1+dexp(-2*x/Scale))-1); Broken-line ' +
        '= Scale if x>Scale; Sigmoid =2*AmplOfStimLum*(1/(1+dexp(-(x-Back' +
        'ground-MeanStimLum)/Scale))) '
      ItemHeight = 16
      ItemIndex = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Text = 'Broken-line'
      Items.Strings = (
        'Half of Sigmoid'
        'Broken-line'
        'Sigmoid')
    end
  end
  object CheckBox1: TCheckBox
    Left = 0
    Top = 424
    Width = 161
    Height = 17
    Caption = 'Include time in file'
    TabOrder = 16
  end
  object Button2: TButton
    Left = 256
    Top = 8
    Width = 113
    Height = 17
    Hint = 'Write parameters to '#39'SavedParameters.txt'#39
    Caption = 'Save parameters'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 18
    OnClick = Button2Click
  end
  object Button9: TButton
    Left = 256
    Top = 24
    Width = 113
    Height = 17
    Hint = 'Set parameters from '#39'SavedParameters.txt'#39
    Caption = 'Load parameters'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 17
    OnClick = Button9Click
  end
end
