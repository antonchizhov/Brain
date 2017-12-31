object Form1: TForm1
  Left = -4
  Top = -4
  Anchors = []
  AutoScroll = False
  AutoSize = True
  Caption = 'Hodgkin v.12.3'
  ClientHeight = 689
  ClientWidth = 1017
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object FileLabel: TLabel
    Left = 238
    Top = 85
    Width = 73
    Height = 16
    Caption = 'FileLabel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 352
    Top = 277
    Width = 5
    Height = 20
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 240
    Top = 70
    Width = 44
    Height = 16
    Caption = 'Time='
    Color = clMoneyGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object DDSpinEdit1: TDDSpinEdit
    Left = 160
    Top = 32
    Width = 68
    Height = 26
    StrWidth = 1
    StrDecimals = 0
    Increment = 10.000000000000000000
    TabOrder = 8
    OnChange = DDSpinEdit1Change
  end
  object StaticText4: TStaticText
    Left = 89
    Top = 34
    Width = 69
    Height = 20
    Caption = ' Vh-Vr, mV '
    TabOrder = 6
  end
  object DDSpinEdit4: TDDSpinEdit
    Left = 160
    Top = 32
    Width = 68
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 1.000000000000000000
    TabOrder = 11
    OnChange = DDSpinEdit4Change
  end
  object RunClampButton: TButton
    Left = 0
    Top = 0
    Width = 97
    Height = 25
    Hint = 'Run I-clamp or V-clamp'
    Caption = 'RunClamp'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    PopupMenu = RunClampPopMenu
    ShowHint = True
    TabOrder = 0
    OnClick = RunClampButtonClick
  end
  object SimplexButton: TButton
    Left = 194
    Top = 0
    Width = 97
    Height = 25
    Hint = 'Find parameters to fit model to experiment'
    Caption = 'Simplex'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = SimplexButtonClick
  end
  object ThresholdButton: TButton
    Left = 560
    Top = 24
    Width = 105
    Height = 24
    Caption = 'Threshold'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = ThresholdButtonClick
  end
  object StaticText1: TStaticText
    Left = 89
    Top = 34
    Width = 69
    Height = 20
    Caption = ' Iind, pA:     '
    DragMode = dmAutomatic
    TabOrder = 3
  end
  object StaticText2: TStaticText
    Left = 89
    Top = 57
    Width = 68
    Height = 20
    Caption = ' t_Iind, ms: '
    TabOrder = 4
  end
  object StaticText3: TStaticText
    Left = 89
    Top = 80
    Width = 70
    Height = 20
    Caption = ' t_end, ms: '
    TabOrder = 5
  end
  object ClearButton: TButton
    Left = 680
    Top = 0
    Width = 105
    Height = 25
    Caption = 'Clear'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Times New Roman'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 7
    OnClick = ClearButtonClick
  end
  object DDSpinEdit2: TDDSpinEdit
    Left = 160
    Top = 54
    Width = 68
    Height = 26
    StrWidth = 2
    StrDecimals = 1
    Increment = 1.000000000000000000
    TabOrder = 9
    OnChange = DDSpinEdit2Change
  end
  object DDSpinEdit3: TDDSpinEdit
    Left = 160
    Top = 78
    Width = 68
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 10.000000000000000000
    TabOrder = 10
    OnChange = DDSpinEdit3Change
  end
  object ActInactButton: TButton
    Left = 291
    Top = 0
    Width = 97
    Height = 25
    Hint = 'Plot Activation-Inactivation curves'
    Caption = 'Act/Inact'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    PopupMenu = RunClampPopMenu
    ShowHint = True
    TabOrder = 12
    OnClick = ActInactButtonClick
  end
  object FreqButton: TButton
    Left = 456
    Top = 0
    Width = 105
    Height = 25
    Caption = 'f-I -curve'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    PopupMenu = Plot2DPopMenu
    TabOrder = 13
    OnClick = FreqButtonClick
  end
  object Button2: TButton
    Left = 320
    Top = 409
    Width = 41
    Height = 16
    Caption = 'Save'
    TabOrder = 14
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 320
    Top = 112
    Width = 41
    Height = 17
    Caption = 'Save'
    TabOrder = 15
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 678
    Top = 47
    Width = 107
    Height = 25
    Caption = 'Save any curve'
    TabOrder = 16
    OnClick = Button4Click
  end
  object AdaptButton: TButton
    Left = 560
    Top = 0
    Width = 105
    Height = 25
    Caption = 'Adaptation'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 18
    OnClick = AdaptButtonClick
  end
  object Button5: TButton
    Left = 560
    Top = 48
    Width = 105
    Height = 24
    Hint = 'Form7: Rate of Gaussian ensemble'
    Caption = 'Rate (ens.)'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 19
    OnClick = Button5Click
  end
  object DDSpinEdit5: TDDSpinEdit
    Left = 24
    Top = 32
    Width = 57
    Height = 26
    StrWidth = 2
    StrDecimals = 3
    Increment = 1.000000000000000000
    TabOrder = 20
    OnChange = DDSpinEdit5Change
    OnDblClick = DDSpinEdit5DblClick
  end
  object StaticText5: TStaticText
    Left = 8
    Top = 34
    Width = 11
    Height = 20
    Caption = 'u'
    TabOrder = 21
  end
  object StaticText6: TStaticText
    Left = 8
    Top = 56
    Width = 11
    Height = 20
    Caption = 's'
    TabOrder = 22
  end
  object DDSpinEdit6: TDDSpinEdit
    Left = 24
    Top = 54
    Width = 57
    Height = 26
    StrWidth = 2
    StrDecimals = 3
    Increment = 0.100000000000000000
    TabOrder = 23
    OnChange = DDSpinEdit6Change
    OnDblClick = DDSpinEdit6DblClick
  end
  object Button7: TButton
    Left = 678
    Top = 71
    Width = 107
    Height = 25
    Caption = 'Draw any curve'
    TabOrder = 24
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 97
    Top = 0
    Width = 97
    Height = 25
    Hint = 'Press mouse to open Form for Firing-Clamp'
    Caption = 'WithNoise'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 25
    OnClick = Button8Click
    OnMouseDown = Button8MouseDown
  end
  object U_S_Button: TButton
    Left = 456
    Top = 24
    Width = 105
    Height = 25
    Caption = '(u,s) -plot'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    PopupMenu = Plot2DPopMenu
    TabOrder = 26
    OnClick = U_S_ButtonClick
  end
  object StaticText12: TStaticText
    Left = 238
    Top = 34
    Width = 83
    Height = 17
    AutoSize = False
    Caption = ' Freq_Iind, Hz '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -10
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 27
  end
  object StaticText19: TStaticText
    Left = 238
    Top = 54
    Width = 83
    Height = 17
    AutoSize = False
    Caption = ' t_IindShift, ms: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -10
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 30
  end
  object DDSpinEdit14: TDDSpinEdit
    Left = 328
    Top = 32
    Width = 44
    Height = 26
    StrWidth = 1
    StrDecimals = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Increment = 10.000000000000000000
    ParentFont = False
    TabOrder = 28
    OnChange = DDSpinEdit14Change
  end
  object DDSpinEdit20: TDDSpinEdit
    Left = 328
    Top = 54
    Width = 44
    Height = 26
    StrWidth = 1
    StrDecimals = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Increment = 10.000000000000000000
    ParentFont = False
    TabOrder = 29
    OnChange = DDSpinEdit20Change
  end
  object Button9: TButton
    Left = 680
    Top = 24
    Width = 105
    Height = 25
    Caption = 'Pause'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Times New Roman'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 31
    OnClick = Button9Click
  end
  object Button6: TButton
    Left = 456
    Top = 48
    Width = 105
    Height = 24
    Hint = 'Form7: Rate of Gaussian ensemble'
    Caption = 'HH approx.'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 32
    OnClick = Button6Click
  end
  object StaticText22: TStaticText
    Left = 8
    Top = 80
    Width = 7
    Height = 20
    Caption = 't'
    TabOrder = 33
  end
  object DDSpinEdit22: TDDSpinEdit
    Left = 24
    Top = 78
    Width = 57
    Height = 26
    Hint = 'NMDA amplitude, muA/cm^2'
    StrWidth = 2
    StrDecimals = 2
    Increment = 0.100000000000000000
    TabOrder = 34
    OnChange = DDSpinEdit22Change
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 104
    Width = 1017
    Height = 585
    ActivePage = TabSheet1
    TabOrder = 35
    object TabSheet1: TTabSheet
      Caption = 'Voltage and current trace'
      object Label2: TLabel
        Left = 940
        Top = 281
        Width = 61
        Height = 20
        Caption = 'Current'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 941
        Top = 5
        Width = 60
        Height = 20
        Caption = 'Voltage'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Chart1: TChart
        Left = 0
        Top = 0
        Width = 929
        Height = 289
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        MarginBottom = 1
        MarginLeft = 1
        MarginRight = 1
        MarginTop = 1
        Title.Color = clWhite
        Title.Text.Strings = (
          'TChart')
        Title.Visible = False
        BottomAxis.Automatic = False
        BottomAxis.AutomaticMinimum = False
        BottomAxis.MinorTickCount = 4
        BottomAxis.Title.Caption = 'ms'
        LeftAxis.MinorTickCount = 4
        LeftAxis.Title.Caption = 'mV'
        Legend.Alignment = laTop
        Legend.ColorWidth = 4
        Legend.LegendStyle = lsSeries
        Legend.ShadowSize = 0
        RightAxis.Automatic = False
        RightAxis.AutomaticMinimum = False
        RightAxis.MinorTickCount = 4
        RightAxis.Title.Caption = 'mS/cm^2'
        View3D = False
        BevelInner = bvRaised
        Color = clMoneyGreen
        TabOrder = 0
        object Button11: TButton
          Left = 760
          Top = 0
          Width = 169
          Height = 17
          Caption = 'Adjust range to current'
          TabOrder = 0
          OnClick = Button11Click
        end
        object Button13: TButton
          Left = 856
          Top = 16
          Width = 73
          Height = 17
          Caption = 'Auto'
          TabOrder = 1
          OnClick = Button13Click
        end
        object Button21: TButton
          Left = 832
          Top = 32
          Width = 97
          Height = 17
          Caption = 'CopyToBMP'
          TabOrder = 2
          OnClick = Button21Click
        end
        object Series1: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = 10485760
          Title = ' V '
          OnDblClick = Series1DblClick
          LinePen.Color = 10485760
          LinePen.Width = 2
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series2: TPointSeries
          Marks.ArrowLength = 0
          Marks.Visible = False
          SeriesColor = clRed
          Title = ' Surgery'
          OnDblClick = Series2DblClick
          Pointer.Brush.Color = 33023
          Pointer.HorizSize = 2
          Pointer.InflateMargins = True
          Pointer.Pen.Color = 33023
          Pointer.Style = psTriangle
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
        object Series3: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGray
          Title = 'Thr'
          OnDblClick = Series3DblClick
          LinePen.Color = clGray
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series9: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clPurple
          Title = 'VatE'
          OnDblClick = Series9DblClick
          LinePen.Color = clPurple
          LinePen.Style = psDot
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
          SeriesColor = clGreen
          Title = 'g'
          VertAxis = aRightAxis
          OnDblClick = Series20DblClick
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
        object Series21: TPointSeries
          Marks.ArrowLength = 0
          Marks.Visible = False
          SeriesColor = clYellow
          Title = 'Spike'
          OnDblClick = Series21DblClick
          Pointer.Brush.Color = 33023
          Pointer.HorizSize = 2
          Pointer.InflateMargins = True
          Pointer.Pen.Color = 33023
          Pointer.Style = psStar
          Pointer.VertSize = 2
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
      object Chart2: TChart
        Left = 0
        Top = 296
        Width = 929
        Height = 258
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        MarginBottom = 1
        MarginLeft = 1
        MarginRight = 1
        MarginTop = 1
        Title.Text.Strings = (
          'TChart')
        Title.Visible = False
        BottomAxis.Automatic = False
        BottomAxis.AutomaticMinimum = False
        BottomAxis.MinorTickCount = 4
        BottomAxis.Title.Caption = 'ms'
        LeftAxis.AxisValuesFormat = '#,####0.###'
        LeftAxis.MinorTickCount = 4
        LeftAxis.Title.Caption = 'nA'
        Legend.Alignment = laTop
        Legend.ColorWidth = 20
        Legend.ShadowSize = 0
        Legend.VertMargin = 1
        RightAxis.MinorTickCount = 4
        RightAxis.Title.Caption = 'mA/cm^2'
        TopAxis.MinorTickCount = 4
        View3D = False
        Color = clMoneyGreen
        TabOrder = 1
        object Button12: TButton
          Left = 760
          Top = 0
          Width = 169
          Height = 17
          Caption = 'Adjust range to voltage'
          TabOrder = 0
          OnClick = Button12Click
        end
        object Button14: TButton
          Left = 856
          Top = 16
          Width = 73
          Height = 17
          Caption = 'Auto'
          TabOrder = 1
          OnClick = Button14Click
        end
        object Button22: TButton
          Left = 832
          Top = 32
          Width = 97
          Height = 17
          Caption = 'CopyToBMP'
          TabOrder = 2
          OnClick = Button22Click
        end
        object Series4: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'PSC'
          OnDblClick = Series4DblClick
          LinePen.Color = clRed
          LinePen.Width = 2
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series5: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          Title = 'Im'
          VertAxis = aRightAxis
          OnDblClick = Series5DblClick
          LinePen.Color = clGreen
          LinePen.Width = 2
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series6: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clYellow
          Title = '-INa'
          VertAxis = aRightAxis
          OnDblClick = Series6DblClick
          LinePen.Color = clYellow
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series7: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlue
          Title = '-IK-IKA-IKD'
          VertAxis = aRightAxis
          OnDblClick = Series7DblClick
          LinePen.Color = clBlue
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loNone
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series8: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clPurple
          Title = 'du_Reset'
          VertAxis = aRightAxis
          OnDblClick = Series8DblClick
          LinePen.Color = clPurple
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
      object Button1: TButton
        Left = 657
        Top = 1
        Width = 40
        Height = 16
        Caption = 'Save'
        TabOrder = 2
        OnClick = Button1Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Conductances'
      ImageIndex = 1
      object Chart4: TChart
        Left = 0
        Top = 0
        Width = 929
        Height = 273
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'TChart')
        Title.Visible = False
        BottomAxis.Automatic = False
        BottomAxis.AutomaticMinimum = False
        LeftAxis.Automatic = False
        LeftAxis.AutomaticMaximum = False
        LeftAxis.AutomaticMinimum = False
        LeftAxis.Maximum = 1.000000000000000000
        Legend.Alignment = laTop
        Legend.ColorWidth = 40
        Legend.ShadowSize = 0
        Legend.VertMargin = 1
        View3D = False
        Color = clMoneyGreen
        TabOrder = 0
        object Button15: TButton
          Left = 760
          Top = 0
          Width = 169
          Height = 17
          Caption = 'Adjust range to voltage'
          TabOrder = 0
          OnClick = Button15Click
        end
        object Button17: TButton
          Left = 856
          Top = 16
          Width = 73
          Height = 17
          Caption = 'Auto'
          TabOrder = 1
          OnClick = Button17Click
        end
        object Button19: TButton
          Left = 832
          Top = 32
          Width = 97
          Height = 17
          Caption = 'CopyToBMP'
          TabOrder = 2
          OnClick = Button19Click
        end
        object Series14: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = 4227327
          Title = 'mmR'
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
          SeriesColor = 16744448
          Title = 'hhR'
          OnDblClick = Series15DblClick
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
          Title = 'mm'
          OnDblClick = Series12DblClick
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
          SeriesColor = clGreen
          Title = 'hh'
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
        object Series22: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'XNa[1]'
          OnDblClick = Series22DblClick
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
        object Series23: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          Title = '1-XNa[2]'
          OnDblClick = Series23DblClick
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
        object Series24: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clPurple
          Title = 'XNa[3]'
          OnDblClick = Series24DblClick
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
        object Series25: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clOlive
          Title = 'XNa[4]'
          OnDblClick = Series25DblClick
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
        Left = 0
        Top = 280
        Width = 929
        Height = 273
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'TChart')
        Title.Visible = False
        BottomAxis.Automatic = False
        BottomAxis.AutomaticMinimum = False
        LeftAxis.Automatic = False
        LeftAxis.AutomaticMaximum = False
        LeftAxis.AutomaticMinimum = False
        LeftAxis.Maximum = 1.000000000000000000
        Legend.Alignment = laTop
        Legend.ColorWidth = 40
        Legend.ShadowSize = 0
        Legend.VertMargin = 1
        View3D = False
        Color = clMoneyGreen
        TabOrder = 1
        object Button16: TButton
          Left = 760
          Top = 0
          Width = 169
          Height = 17
          Caption = 'Adjust range to voltage'
          TabOrder = 0
          OnClick = Button16Click
        end
        object Button18: TButton
          Left = 856
          Top = 16
          Width = 73
          Height = 17
          Caption = 'Auto'
          TabOrder = 1
          OnClick = Button18Click
        end
        object Button20: TButton
          Left = 832
          Top = 32
          Width = 97
          Height = 17
          Caption = 'CopyToBMP'
          TabOrder = 2
          OnClick = Button20Click
        end
        object Series16: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'nn'
          OnDblClick = Series16DblClick
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
          SeriesColor = clGreen
          Title = 'nM'
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
        object Series18: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = 16744448
          Title = 'wAHP'
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
        object Series19: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = 33023
          Title = 'wADP'
          OnDblClick = Series19DblClick
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
      Caption = 'Model and Experiment'
      ImageIndex = 2
      object Chart3: TChart
        Left = 0
        Top = 64
        Width = 873
        Height = 370
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'TChart')
        Title.Visible = False
        BottomAxis.Title.Caption = 'ms'
        Legend.ColorWidth = 30
        Legend.ResizeChart = False
        Legend.ShadowSize = 0
        View3D = False
        Color = clMoneyGreen
        TabOrder = 0
        object Button23: TButton
          Left = 768
          Top = 0
          Width = 105
          Height = 17
          Caption = 'CopyToBMP'
          TabOrder = 0
          OnClick = Button23Click
        end
        object Series10: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          Title = 'Model'
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
          Title = 'Experiment'
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
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Notes'
      ImageIndex = 3
      object SimplexMemo: TMemo
        Left = 0
        Top = 110
        Width = 353
        Height = 89
        Lines.Strings = (
          'SimplexMemo')
        TabOrder = 2
        Visible = False
      end
      object ParamsMemo: TMemo
        Left = 0
        Top = 128
        Width = 353
        Height = 193
        Lines.Strings = (
          'ParamsMemo')
        PopupMenu = RunClampPopMenu
        TabOrder = 1
        OnDblClick = ParamsMemoDblClick
      end
      object CoeMemo: TMemo
        Left = 0
        Top = 201
        Width = 353
        Height = 120
        Lines.Strings = (
          'CoeMemo')
        TabOrder = 0
        Visible = False
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Noise'
      ImageIndex = 4
      object Panel1: TPanel
        Left = 0
        Top = 104
        Width = 377
        Height = 297
        Hint = 'DblClick to switch it OFF'
        Caption = ' '
        Color = 15461355
        DockSite = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Visible = False
        OnDblClick = Panel1DblClick
        object RadioGroup2: TRadioGroup
          Left = 224
          Top = 186
          Width = 145
          Height = 109
          Caption = 'Function G to be measured:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = []
          ItemIndex = 3
          Items.Strings = (
            'Potential rate, dV/dt'
            'Average voltage'
            'MinVoltage'
            'MaxVoltage'
            'Convolution'
            'VxZ'
            'IxZ')
          ParentFont = False
          TabOrder = 0
          Visible = False
        end
        object StaticText11: TStaticText
          Left = 161
          Top = 41
          Width = 44
          Height = 20
          Caption = ' tau_I : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Visible = False
        end
        object StaticText10: TStaticText
          Left = 161
          Top = 21
          Width = 44
          Height = 20
          Caption = ' tau_E:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          Visible = False
        end
        object StaticText9: TStaticText
          Left = 1
          Top = 41
          Width = 68
          Height = 20
          Caption = ' dFreq/du: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          Visible = False
        end
        object StaticText8: TStaticText
          Left = 1
          Top = 21
          Width = 73
          Height = 20
          Caption = ' Freq. hold: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          Visible = False
        end
        object StaticText7: TStaticText
          Left = 1
          Top = 1
          Width = 104
          Height = 20
          Caption = ' NoiseToSignal: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          Visible = False
        end
        object DDSpinEdit7: TDDSpinEdit
          Left = 105
          Top = 1
          Width = 49
          Height = 26
          StrWidth = 2
          StrDecimals = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Increment = 0.100000000000000000
          ParentFont = False
          TabOrder = 10
          Visible = False
          OnChange = DDSpinEdit7Change
        end
        object DDSpinEdit12: TDDSpinEdit
          Left = 232
          Top = 1
          Width = 33
          Height = 26
          Hint = 'correlation lenght'
          StrWidth = 2
          StrDecimals = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Increment = 1.000000000000000000
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 11
          Visible = False
          OnChange = DDSpinEdit12Change
        end
        object StaticText13: TStaticText
          Left = 161
          Top = 1
          Width = 71
          Height = 20
          Caption = ' tau_Noise:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
          Visible = False
        end
        object DDSpinEdit8: TDDSpinEdit
          Left = 105
          Top = 21
          Width = 49
          Height = 26
          StrWidth = 2
          StrDecimals = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Increment = 10.000000000000000000
          ParentFont = False
          TabOrder = 8
          Visible = False
          OnChange = DDSpinEdit8Change
        end
        object DDSpinEdit9: TDDSpinEdit
          Left = 105
          Top = 41
          Width = 49
          Height = 26
          StrWidth = 2
          StrDecimals = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Increment = 1000.000000000000000000
          ParentFont = False
          TabOrder = 5
          Visible = False
          OnChange = DDSpinEdit9Change
        end
        object CheckBox1: TCheckBox
          Left = 280
          Top = 24
          Width = 89
          Height = 17
          Hint = 'Open window to analize statistics '
          Alignment = taLeftJustify
          Caption = ' Statistics'
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 13
          OnClick = CheckBox1Click
        end
        object DDSpinEdit13: TDDSpinEdit
          Left = 320
          Top = 1
          Width = 53
          Height = 26
          StrWidth = 2
          StrDecimals = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Increment = 0.005000000000000000
          ParentFont = False
          TabOrder = 14
          OnChange = DDSpinEdit13Change
        end
        object StaticText14: TStaticText
          Left = 272
          Top = 1
          Width = 47
          Height = 21
          Caption = ' dt, ms '
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Pitch = fpFixed
          Font.Style = []
          ParentFont = False
          TabOrder = 15
        end
        object CheckBox2: TCheckBox
          Left = 296
          Top = 40
          Width = 73
          Height = 17
          Hint = 'Open window for kernel calculation'
          Alignment = taLeftJustify
          Caption = ' Kernel '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 16
          OnClick = CheckBox2Click
        end
        object RadioGroup3: TRadioGroup
          Left = 0
          Top = 186
          Width = 145
          Height = 109
          Caption = 'Function F to be measured:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = []
          ItemIndex = 0
          Items.Strings = (
            'Frequency'
            'VxZ'
            'Width of AP'
            'MinVoltage'
            'Vmax-Vmin'
            'VT_1ms'
            'Th')
          ParentFont = False
          TabOrder = 17
        end
        object DDSpinEdit10: TDDSpinEdit
          Left = 217
          Top = 21
          Width = 48
          Height = 26
          StrWidth = 2
          StrDecimals = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Increment = 10.000000000000000000
          ParentFont = False
          TabOrder = 3
          Visible = False
          OnChange = DDSpinEdit10Change
          OnDblClick = DDSpinEdit10DblClick
        end
        object DDSpinEdit11: TDDSpinEdit
          Left = 217
          Top = 41
          Width = 48
          Height = 26
          StrWidth = 2
          StrDecimals = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Increment = 10.000000000000000000
          ParentFont = False
          TabOrder = 1
          Visible = False
          OnChange = DDSpinEdit11Change
          OnDblClick = DDSpinEdit11DblClick
        end
        object ComboBox1: TComboBox
          Left = 0
          Top = 64
          Width = 153
          Height = 24
          DropDownCount = 13
          ItemHeight = 16
          TabOrder = 18
          Text = 'ComboBox1'
          Items.Strings = (
            ' Adjust  u and s'
            ' Adjust  u'
            ' Adjust  s'
            ' Add adaptation  (-)'
            ' Nothing'
            ' Extract adaptation'
            ' Estimate lack of adapt'
            ' FC for adapted nu(u,s)'
            ' Add adapt. to freq_H'
            ' Adaptation and FC'
            ' Extract adapt. and FC'
            ' Estimate adaptation'
            ' Estimate ad., do FC')
        end
        object DDSpinEdit15: TDDSpinEdit
          Left = 105
          Top = 89
          Width = 49
          Height = 26
          StrWidth = 2
          StrDecimals = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Increment = 1000.000000000000000000
          ParentFont = False
          TabOrder = 19
          OnChange = DDSpinEdit15Change
        end
        object StaticText15: TStaticText
          Left = 1
          Top = 89
          Width = 89
          Height = 20
          Caption = ' I0, mkA/cm^2:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 20
        end
        object ComboBox2: TComboBox
          Left = 0
          Top = 112
          Width = 153
          Height = 24
          ItemHeight = 16
          TabOrder = 21
          Text = 'ComboBox2'
          OnChange = ComboBox2Change
          Items.Strings = (
            'Nothing'
            'Reset voltage'
            'Current pulse reset'
            'Meanders except apexes'
            'Meanders ')
        end
        object DDSpinEdit16: TDDSpinEdit
          Left = 89
          Top = 161
          Width = 49
          Height = 26
          StrWidth = 2
          StrDecimals = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Increment = 0.100000000000000000
          ParentFont = False
          TabOrder = 22
          Value = 1.500000000000000000
        end
        object StaticText16: TStaticText
          Left = 1
          Top = 164
          Width = 84
          Height = 17
          Caption = ' Surgery: thresh. '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 23
        end
        object DDSpinEdit17: TDDSpinEdit
          Left = 225
          Top = 161
          Width = 48
          Height = 26
          StrWidth = 2
          StrDecimals = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Increment = 1.000000000000000000
          ParentFont = False
          TabOrder = 24
          Value = 2.000000000000000000
        end
        object StaticText17: TStaticText
          Left = 145
          Top = 164
          Width = 73
          Height = 17
          Caption = ' du, mA/cm^2: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 25
        end
        object DDSpinEdit18: TDDSpinEdit
          Left = 114
          Top = 137
          Width = 40
          Height = 26
          Hint = 'correlation lenght'
          StrWidth = 2
          StrDecimals = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Increment = 5.000000000000000000
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 26
          Value = -15.000000000000000000
        end
        object StaticText18: TStaticText
          Left = 1
          Top = 140
          Width = 109
          Height = 17
          Caption = ' du_Reset, muA/cm^2:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 27
        end
        object DDSpinEdit19: TDDSpinEdit
          Left = 186
          Top = 137
          Width = 41
          Height = 26
          Hint = 'correlation lenght'
          StrWidth = 2
          StrDecimals = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Increment = 5.000000000000000000
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 28
          Value = -70.000000000000000000
          OnChange = DDSpinEdit12Change
        end
        object StaticText20: TStaticText
          Left = 155
          Top = 140
          Width = 30
          Height = 17
          Caption = ' Vmin'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 29
        end
        object StaticText21: TStaticText
          Left = 238
          Top = 140
          Width = 91
          Height = 17
          Caption = 'Reset at spike, mV'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'Microsoft Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 30
        end
        object DDSpinEdit21: TDDSpinEdit
          Left = 332
          Top = 137
          Width = 41
          Height = 26
          StrWidth = 2
          StrDecimals = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Increment = 5.000000000000000000
          ParentFont = False
          TabOrder = 31
          Value = -15.000000000000000000
        end
        object ComboBox3: TComboBox
          Left = 272
          Top = 56
          Width = 105
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 16
          ParentFont = False
          TabOrder = 32
          Text = 'ComboBox3'
          Items.Strings = (
            'noise-conductance'
            'noise-current')
        end
        object Button10: TButton
          Left = 272
          Top = 80
          Width = 105
          Height = 17
          Caption = 'Make linear F,G'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -10
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 33
          OnClick = Button10Click
        end
      end
    end
  end
  object RadioGroup1: TRadioGroup
    Left = 567
    Top = 96
    Width = 106
    Height = 505
    Caption = 'Var to write'
    Items.Strings = (
      'mm'
      'hh'
      'ii'
      'mmR'
      'hhR'
      'nn'
      'nA'
      'lA'
      'xD'
      'yD'
      'mCaT'
      'hCaT'
      'mCaH'
      'hCaH'
      'kCaH'
      'nM'
      'Ca'
      'nKCa'
      'mBst'
      'mNaP'
      'wAHP'
      'V'
      'Vexp'
      'PSC'
      'avPSC'
      'Vav '
      'INA'
      'IK'
      'IKA'
      'IKM'
      'IH'
      'IAHP'
      'Im'
      'Im-INa'
      'VatE'
      'yK'
      'du_Reset'
      'wADP'
      'Vr'
      'uu')
    PopupMenu = PopupMenu4
    TabOrder = 17
    OnClick = RadioGroup1Click
  end
  object Button24: TButton
    Left = 456
    Top = 72
    Width = 105
    Height = 24
    Hint = 'Form7: Rate of Gaussian ensemble'
    Caption = 'ramps/steps'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 36
    OnClick = Button24Click
  end
  object Button25: TButton
    Left = 560
    Top = 72
    Width = 105
    Height = 24
    Hint = 'Form7: Rate of Gaussian ensemble'
    Caption = 'Axon'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 37
    OnClick = Button25Click
  end
  object MainMenu1: TMainMenu
    BiDiMode = bdRightToLeft
    ParentBiDiMode = False
    Top = 8
    object aaa1: TMenuItem
      Caption = 'File'
      OnClick = aaa1Click
      object Openidfile1: TMenuItem
        Caption = 'Open *.id file'
        GroupIndex = 17
        ShortCut = 16463
        OnClick = Openidfile1Click
      end
      object N1: TMenuItem
        Caption = '-'
        GroupIndex = 17
      end
      object Default1: TMenuItem
        Caption = 'Default'
        GroupIndex = 17
        RadioItem = True
        OnClick = Default1Click
      end
      object NaSchmidtid1: TMenuItem
        Caption = #39'Na_Schmidt.id'#39
        GroupIndex = 17
        RadioItem = True
        OnClick = NaSchmidtid1Click
      end
      object Naslowid1: TMenuItem
        Caption = #39'Na_slow.id'#39
        GroupIndex = 17
        RadioItem = True
        OnClick = Naslowid1Click
      end
      object Naslowinaid1: TMenuItem
        Caption = #39'Na_slow_ina.id'#39
        GroupIndex = 17
        RadioItem = True
        OnClick = Naslowinaid1Click
      end
      object NaV10S12id1: TMenuItem
        Caption = #39'Na_V10&S12.id'#39
        GroupIndex = 17
        RadioItem = True
        OnClick = NaV10S12id1Click
      end
      object APKrylovid1: TMenuItem
        Caption = #39'AP_Krylov.id'#39
        GroupIndex = 17
        RadioItem = True
        OnClick = APKrylovid1Click
      end
      object APid1: TMenuItem
        Caption = #39'AP.id'#39
        GroupIndex = 17
        RadioItem = True
        OnClick = APid1Click
      end
      object Aliid1: TMenuItem
        Caption = #39'Ali.id'#39
        GroupIndex = 17
        RadioItem = True
        OnClick = Aliid1Click
      end
      object AliIid1: TMenuItem
        Caption = #39'Ali_I.id'#39
        GroupIndex = 17
        RadioItem = True
        OnClick = AliIid1Click
      end
      object JaponIid1: TMenuItem
        Caption = #39'Japon_I.id'#39
        GroupIndex = 17
        OnClick = JaponIid1Click
      end
      object Enterfromkeyboard1: TMenuItem
        Caption = 'Set params in window'
        GroupIndex = 17
        OnClick = Enterfromkeyboard1Click
      end
      object N2: TMenuItem
        Caption = '-'
        GroupIndex = 17
      end
      object Saveallsettings1: TMenuItem
        Caption = 'Save all settings'
        GroupIndex = 17
        OnClick = Saveallsettings1Click
      end
      object Restoreprevioussettings1: TMenuItem
        Caption = 'Restore previous settings'
        GroupIndex = 17
        OnClick = Restoreprevioussettings1Click
      end
    end
    object Parameters: TMenuItem
      Caption = 'Parameters'
      object HHtype2: TMenuItem
        Caption = 'HH_type'
        object Passive1: TMenuItem
          Caption = 'Passive'
          GroupIndex = 12
          RadioItem = True
          OnClick = Passive1Click
        end
        object Calmar1: TMenuItem
          Caption = 'Calmar'
          Checked = True
          GroupIndex = 12
          RadioItem = True
          OnClick = Calmar1Click
        end
        object Destexhe1: TMenuItem
          Caption = 'Destexhe'
          GroupIndex = 12
          RadioItem = True
          OnClick = Destexhe1Click
        end
        object Migliore1: TMenuItem
          Caption = 'Migliore'
          GroupIndex = 12
          RadioItem = True
          OnClick = Migliore1Click
        end
        object Cummins1: TMenuItem
          Caption = 'Cummins'
          GroupIndex = 12
          RadioItem = True
          OnClick = Cummins1Click
        end
        object Chow1: TMenuItem
          Caption = 'Chow'
          GroupIndex = 12
          RadioItem = True
          OnClick = Chow1Click
        end
        object Lyle1: TMenuItem
          Caption = 'Lyle'
          GroupIndex = 12
          RadioItem = True
          OnClick = Lyle1Click
        end
        object Naundorf1: TMenuItem
          Caption = 'Naundorf'
          GroupIndex = 12
          OnClick = Naundorf1Click
        end
        object White1: TMenuItem
          Caption = 'White'
          GroupIndex = 12
          OnClick = White1Click
        end
        object Shu1: TMenuItem
          Caption = 'Shu'
          GroupIndex = 12
          OnClick = Shu1Click
        end
      end
      object HHorder1: TMenuItem
        Caption = 'HH_order'
        object N1point1: TMenuItem
          Caption = '1-point'
          GroupIndex = 28
          RadioItem = True
          OnClick = N1point1Click
        end
        object N2points1: TMenuItem
          Caption = '2-points'
          GroupIndex = 28
          RadioItem = True
          OnClick = N2points1Click
        end
      end
      object ThrModel: TMenuItem
        Caption = 'ThrModel'
        GroupIndex = 111
        RadioItem = True
        ShortCut = 16468
        OnClick = ThrModelClick
      end
      object LIFmodel: TMenuItem
        Caption = 'LIF_model'
        GroupIndex = 111
        RadioItem = True
        ShortCut = 16460
        OnClick = LIFmodelClick
      end
      object Blockage2: TMenuItem
        Caption = 'Blockage'
        GroupIndex = 111
        object INaR1: TMenuItem
          Caption = 'I_NaR'
          OnClick = INaR1Click
        end
        object INa1: TMenuItem
          Caption = 'I_Na'
          OnClick = INa1Click
        end
        object IK1: TMenuItem
          Caption = 'I_K'
          OnClick = IK1Click
        end
        object IKM1: TMenuItem
          Caption = 'I_KM'
          OnClick = IKM1Click
        end
        object IKA1: TMenuItem
          Caption = 'I_KA'
          OnClick = IKA1Click
        end
        object IPass1: TMenuItem
          Caption = 'I_Pass'
          OnClick = IPass1Click
        end
      end
      object IfSetglortau1: TMenuItem
        Caption = 'IfSet_gL_or_tau'
        GroupIndex = 111
        object gLisfixed1: TMenuItem
          Caption = 'gL is fixed'
          RadioItem = True
          OnClick = gLisfixed1Click
        end
        object tauisfixed1: TMenuItem
          Caption = 'tau is fixed'
          RadioItem = True
          OnClick = tauisfixed1Click
        end
      end
      object IfSetVLorVrest1: TMenuItem
        Caption = 'IfSet_VL_or_Vrest'
        GroupIndex = 111
        object VLisfixed1: TMenuItem
          Caption = 'VL is fixed'
          RadioItem = True
          OnClick = VLisfixed1Click
        end
        object Vrestisfixed1: TMenuItem
          Caption = 'Vrest is fixed'
          RadioItem = True
          OnClick = Vrestisfixed1Click
        end
      end
      object N5: TMenuItem
        Caption = '-'
        GroupIndex = 111
      end
      object FitPictureToExpData1: TMenuItem
        Caption = 'FitPictureToExpData'
        GroupIndex = 111
        OnClick = FitPictureToExpData1Click
      end
      object Writing1: TMenuItem
        Caption = 'Writing'
        GroupIndex = 111
        OnClick = Writing1Click
      end
      object NoClear: TMenuItem
        Caption = 'NoCleaning'
        GroupIndex = 111
        OnClick = NoClearClick
      end
      object Enableallseries1: TMenuItem
        Caption = 'Enable all series'
        GroupIndex = 111
        OnClick = Enableallseries1Click
      end
    end
    object Clamp1: TMenuItem
      Caption = 'Clamp'
      object Currentclamp1: TMenuItem
        Caption = 'Current-Clamp'
        GroupIndex = 2
        RadioItem = True
        OnClick = Currentclamp1Click
        object IindVexp1: TMenuItem
          Caption = 'Iind=Vexp'
          OnClick = IindVexp1Click
        end
      end
      object VoltageClamp1: TMenuItem
        Caption = 'Voltage-Clamp'
        GroupIndex = 2
        RadioItem = True
        OnClick = VoltageClamp1Click
        object forIm1: TMenuItem
          Caption = 'for  Im'
          GroupIndex = 11
          OnClick = forIm1Click
        end
        object forgNa1: TMenuItem
          Caption = 'for  gNa'
          GroupIndex = 11
          OnClick = forgNa1Click
        end
        object VhVexp1: TMenuItem
          Caption = 'Vh=Vexp'
          GroupIndex = 11
          OnClick = VhVexp1Click
        end
      end
      object Samples1: TMenuItem
        Caption = 'Samples'
        GroupIndex = 2
        object Smpl1: TMenuItem
          Caption = 'Smpl=1'
          GroupIndex = 1
          RadioItem = True
          OnClick = Smpl1Click
        end
        object Smpl2: TMenuItem
          Caption = 'Smpl=2'
          GroupIndex = 1
          RadioItem = True
          OnClick = Smpl2Click
        end
        object Smpl3: TMenuItem
          Caption = 'Smpl=3'
          GroupIndex = 1
          RadioItem = True
          OnClick = Smpl3Click
        end
        object Smpl4: TMenuItem
          Caption = 'Smpl=4'
          GroupIndex = 1
          RadioItem = True
          OnClick = Smpl4Click
        end
        object Smpl5: TMenuItem
          Caption = 'Smpl=5'
          GroupIndex = 1
          RadioItem = True
          OnClick = Smpl5Click
        end
        object Smpl6: TMenuItem
          Caption = 'Smpl=6'
          GroupIndex = 1
          RadioItem = True
          OnClick = Smpl6Click
        end
        object Smpl7: TMenuItem
          Caption = 'Smpl=7'
          GroupIndex = 1
          RadioItem = True
          OnClick = Smpl7Click
        end
        object Smpl8: TMenuItem
          Caption = 'Smpl=8'
          GroupIndex = 1
          RadioItem = True
          OnClick = Smpl8Click
        end
        object Smpl9: TMenuItem
          Caption = 'Smpl=9'
          GroupIndex = 1
          RadioItem = True
          OnClick = Smpl9Click
        end
        object Smpl10: TMenuItem
          Caption = 'Smpl=10'
          GroupIndex = 1
          RadioItem = True
          OnClick = Smpl10Click
        end
        object Smpl11: TMenuItem
          Caption = 'Smpl=11'
          GroupIndex = 1
          RadioItem = True
          OnClick = Smpl11Click
        end
        object Smpl12: TMenuItem
          Caption = 'Smpl=12'
          GroupIndex = 1
          RadioItem = True
          OnClick = Smpl12Click
        end
        object Smpl13: TMenuItem
          Caption = 'Smpl=13'
          GroupIndex = 1
          RadioItem = True
          OnClick = Smpl13Click
        end
        object Smpl14: TMenuItem
          Caption = 'Smpl=14'
          GroupIndex = 1
          RadioItem = True
          OnClick = Smpl14Click
        end
        object Smpl15: TMenuItem
          Caption = 'Smpl=15'
          GroupIndex = 1
          RadioItem = True
          OnClick = Smpl15Click
        end
        object Smpl16: TMenuItem
          Caption = 'Smpl=16'
          GroupIndex = 1
          RadioItem = True
          OnClick = Smpl16Click
        end
        object Smpl17: TMenuItem
          Caption = 'Smpl=17'
          GroupIndex = 1
          RadioItem = True
          OnClick = Smpl17Click
        end
        object Smpl18: TMenuItem
          Caption = 'Smpl=18'
          GroupIndex = 1
          RadioItem = True
          OnClick = Smpl18Click
        end
        object Smpl19: TMenuItem
          Caption = 'Smpl=19'
          GroupIndex = 1
          RadioItem = True
          OnClick = Smpl19Click
        end
        object Smpl20: TMenuItem
          Caption = 'Smpl=20'
          GroupIndex = 1
          RadioItem = True
          OnClick = Smpl20Click
        end
        object Smpl0: TMenuItem
          Break = mbBarBreak
          Caption = 'Smpl=0'
          GroupIndex = 1
          RadioItem = True
          OnClick = Smpl0Click
        end
      end
    end
    object Simplex1: TMenuItem
      Caption = 'Simplex'
      object tau1: TMenuItem
        Caption = 'tau'
        GroupIndex = 21
        OnClick = tau1Click
      end
      object ro1: TMenuItem
        Caption = 'ro'
        GroupIndex = 21
        OnClick = ro1Click
      end
      object gNaR1: TMenuItem
        Caption = 'gNaR'
        GroupIndex = 21
        OnClick = gNaR1Click
      end
      object gNa1: TMenuItem
        Caption = 'gNa[1]'
        GroupIndex = 21
        OnClick = gNa1Click
      end
      object gK1: TMenuItem
        Caption = 'gK'
        GroupIndex = 21
        OnClick = gK1Click
      end
      object gKA1: TMenuItem
        Caption = 'gKA'
        GroupIndex = 21
        OnClick = gKA1Click
      end
      object gKD1: TMenuItem
        Caption = 'gKD'
        GroupIndex = 21
        OnClick = gKD1Click
      end
      object gL1: TMenuItem
        Caption = 'gL[1]'
        GroupIndex = 21
        OnClick = gL1Click
      end
      object VL11: TMenuItem
        Caption = 'VL[1]'
        GroupIndex = 21
        OnClick = VL11Click
      end
      object N3: TMenuItem
        Caption = '-'
        GroupIndex = 21
      end
      object a1NaR: TMenuItem
        Caption = 'a1NaR'
        GroupIndex = 21
        OnClick = a1NaRClick
      end
      object b1NaR: TMenuItem
        Caption = 'b1NaR'
        GroupIndex = 21
        OnClick = b1NaRClick
      end
      object a2NaR: TMenuItem
        Caption = 'a2NaR'
        GroupIndex = 21
        OnClick = a2NaRClick
      end
      object b2NaR: TMenuItem
        Caption = 'b2NaR'
        GroupIndex = 21
        OnClick = b2NaRClick
      end
      object a3NaR: TMenuItem
        Caption = 'a3NaR'
        GroupIndex = 21
        OnClick = a3NaRClick
      end
      object b3NaR: TMenuItem
        Caption = 'b3NaR'
        GroupIndex = 21
        OnClick = b3NaRClick
      end
      object c1NaR: TMenuItem
        Caption = 'c1NaR'
        GroupIndex = 21
        OnClick = c1NaRClick
      end
      object d1NaR: TMenuItem
        Caption = 'd1NaR'
        GroupIndex = 21
        OnClick = d1NaRClick
      end
      object c2NaR: TMenuItem
        Caption = 'c2NaR'
        GroupIndex = 21
        OnClick = c2NaRClick
      end
      object d2NaR: TMenuItem
        Caption = 'd2NaR'
        GroupIndex = 21
        OnClick = d2NaRClick
      end
      object c3NaR: TMenuItem
        Caption = 'c3NaR'
        GroupIndex = 21
        OnClick = c3NaRClick
      end
      object d3NaR: TMenuItem
        Caption = 'd3NaR'
        GroupIndex = 21
        OnClick = d3NaRClick
      end
      object VNaR: TMenuItem
        Caption = 'VNaR'
        GroupIndex = 21
        OnClick = VNaRClick
      end
      object a1K: TMenuItem
        Caption = 'a1K'
        GroupIndex = 21
        OnClick = a1KClick
      end
      object a2K: TMenuItem
        Caption = 'a2K'
        GroupIndex = 21
        OnClick = a2KClick
      end
      object a3K: TMenuItem
        Caption = 'a3K'
        GroupIndex = 21
        OnClick = a3KClick
      end
      object b1K: TMenuItem
        Caption = 'b1K'
        GroupIndex = 21
        OnClick = b1KClick
      end
      object b2K: TMenuItem
        Caption = 'b2K'
        GroupIndex = 21
        OnClick = b2KClick
      end
      object b3K: TMenuItem
        Caption = 'b3K'
        GroupIndex = 21
        OnClick = b3KClick
      end
      object VK: TMenuItem
        Caption = 'VK'
        GroupIndex = 21
        OnClick = VKClick
      end
      object N4: TMenuItem
        Caption = '-'
        GroupIndex = 21
      end
      object FitKcurrent1: TMenuItem
        Caption = 'Fit K-current'
        GroupIndex = 21
        OnClick = FitKcurrent1Click
      end
      object Clearallmarks1: TMenuItem
        Caption = 'Clear all marks'
        GroupIndex = 21
        OnClick = Clearallmarks1Click
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      OnClick = Help1Click
    end
  end
  object RunClampPopMenu: TPopupMenu
    Left = 40
    Top = 24
    object Smpl1_: TMenuItem
      Caption = 'Smpl=1'
      GroupIndex = 15
      RadioItem = True
      OnClick = Smpl1Click
    end
    object Smpl2_: TMenuItem
      Caption = 'Smpl=2'
      GroupIndex = 15
      RadioItem = True
      OnClick = Smpl2Click
    end
    object Smpl3_: TMenuItem
      Caption = 'Smpl=3'
      GroupIndex = 15
      RadioItem = True
      OnClick = Smpl3Click
    end
    object Smpl4_: TMenuItem
      Caption = 'Smpl=4'
      GroupIndex = 15
      RadioItem = True
      OnClick = Smpl4Click
    end
    object Smpl5_: TMenuItem
      Caption = 'Smpl=5'
      GroupIndex = 15
      RadioItem = True
      OnClick = Smpl5Click
    end
    object Smpl6_: TMenuItem
      Caption = 'Smpl=6'
      GroupIndex = 15
      RadioItem = True
      OnClick = Smpl6Click
    end
    object Smpl7_: TMenuItem
      Caption = 'Smpl=7'
      GroupIndex = 15
      RadioItem = True
      OnClick = Smpl7Click
    end
    object Smpl8_: TMenuItem
      Caption = 'Smpl=8'
      GroupIndex = 15
      RadioItem = True
      OnClick = Smpl8Click
    end
    object Smpl9_: TMenuItem
      Caption = 'Smpl=9'
      GroupIndex = 15
      RadioItem = True
      OnClick = Smpl9Click
    end
    object Smpl10_: TMenuItem
      Caption = 'Smpl=10'
      GroupIndex = 15
      RadioItem = True
      OnClick = Smpl10Click
    end
    object Smpl11_: TMenuItem
      Caption = 'Smpl=11'
      GroupIndex = 15
      RadioItem = True
      OnClick = Smpl11Click
    end
    object Smpl12_: TMenuItem
      Caption = 'Smpl=12'
      GroupIndex = 15
      RadioItem = True
      OnClick = Smpl12Click
    end
    object Smpl13_: TMenuItem
      Caption = 'Smpl=13'
      GroupIndex = 15
      RadioItem = True
      OnClick = Smpl13Click
    end
    object Smpl14_: TMenuItem
      Caption = 'Smpl=14'
      GroupIndex = 15
      RadioItem = True
      OnClick = Smpl14Click
    end
    object Smpl15_: TMenuItem
      Caption = 'Smpl=15'
      GroupIndex = 15
      RadioItem = True
      OnClick = Smpl15Click
    end
    object Smpl16_: TMenuItem
      Caption = 'Smpl=16'
      GroupIndex = 15
      RadioItem = True
      OnClick = Smpl16Click
    end
    object Smpl17_: TMenuItem
      Caption = 'Smpl=17'
      GroupIndex = 15
      RadioItem = True
      OnClick = Smpl17Click
    end
    object Smpl18_: TMenuItem
      Caption = 'Smpl=18'
      GroupIndex = 15
      RadioItem = True
      OnClick = Smpl18Click
    end
    object Smpl19_: TMenuItem
      Caption = 'Smpl=19'
      GroupIndex = 15
      RadioItem = True
      OnClick = Smpl19Click
    end
    object Smpl20_: TMenuItem
      Caption = 'Smpl=20'
      GroupIndex = 15
      RadioItem = True
      OnClick = Smpl20Click
    end
    object Smpl0_: TMenuItem
      Break = mbBarBreak
      Caption = 'Smpl=0'
      GroupIndex = 15
      RadioItem = True
      OnClick = Smpl0Click
    end
  end
  object Plot2DPopMenu: TPopupMenu
    Left = 416
    Top = 24
    object FrequencynuIind1: TMenuItem
      Caption = 'Frequency:  nu(Iind)'
      RadioItem = True
      OnClick = FrequencynuIind1Click
    end
    object Plot2Dnuus1: TMenuItem
      Caption = 'Plot 2D: nu(u,s)'
      RadioItem = True
      OnClick = Plot2Dnuus1Click
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 376
    Top = 88
    object SavemRandhRtofile1: TMenuItem
      Caption = 'Save mmR and hhR (m and h for slow Na-current) to file'
      OnClick = SavemRandhRtofile1Click
    end
  end
  object SaveDialog3: TSaveDialog
    OnCanClose = SaveDialog3CanClose
    Left = 400
    Top = 88
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Files with paremeters (*.id)|*.id'
    OnCanClose = OpenDialog1CanClose
    Left = 40
    Top = 56
  end
  object SaveDialog4: TSaveDialog
    Filter = 'data-files|*.dat|all files|*.*'
    OnCanClose = SaveDialog4CanClose
    Left = 704
    Top = 48
  end
  object PopupMenu4: TPopupMenu
    Left = 704
    Top = 80
    object CloseRadioGroup1: TMenuItem
      Caption = 'CloseRadioGroup'
      OnClick = CloseRadioGroup1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 328
    Top = 424
    object Saveexpmodcurvestofile1: TMenuItem
      Caption = 'Save exp.&mod. curves to file'
      OnClick = Saveexpmodcurvestofile1Click
    end
  end
  object SaveDialog2: TSaveDialog
    OnCanClose = SaveDialog2CanClose
    Left = 328
    Top = 448
  end
  object PopupMenu1: TPopupMenu
    Left = 744
    Top = 240
    object SaveVtofile1: TMenuItem
      Caption = 'Save V to file'
      OnClick = SaveVtofile1Click
    end
  end
  object SaveDialog1: TSaveDialog
    OnCanClose = SaveDialog1CanClose
    Left = 744
    Top = 272
  end
end
