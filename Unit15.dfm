object Form15: TForm15
  Left = 765
  Top = 681
  Width = 498
  Height = 669
  AutoSize = True
  Caption = 'Form15: 2D-lattice'
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
  object Chart1: TChart
    Left = 0
    Top = 448
    Width = 489
    Height = 186
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    BottomAxis.Title.Caption = 'degrees'
    Legend.Alignment = laTop
    Legend.ColorWidth = 30
    Legend.LegendStyle = lsSeries
    Legend.ResizeChart = False
    Legend.ShadowSize = 0
    Legend.TextStyle = ltsPlain
    Legend.VertMargin = 1
    View3D = False
    Color = 11193599
    TabOrder = 2
    object Label1: TLabel
      Left = 320
      Top = 164
      Width = 70
      Height = 16
      Caption = 'PW near i,j.:'
    end
    object DDSpinEdit1: TDDSpinEdit
      Left = 398
      Top = 160
      Width = 43
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 1.000000000000000000
      TabOrder = 0
      Value = 1.000000000000000000
    end
    object DDSpinEdit2: TDDSpinEdit
      Left = 438
      Top = 160
      Width = 43
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 1.000000000000000000
      TabOrder = 1
      Value = 1.000000000000000000
    end
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'On a circle'
      LinePen.Width = 2
      Pointer.HorizSize = 1
      Pointer.InflateMargins = True
      Pointer.Style = psCircle
      Pointer.VertSize = 1
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
  inline Frame15: TFrame15
    Left = 0
    Top = 0
    Width = 490
    Height = 452
    TabOrder = 0
    inherited Label2: TLabel
      Left = 249
    end
    inherited Chart1: TChart
      OnClickSeries = Frame15Chart1ClickSeries
      BottomAxis.Automatic = False
      BottomAxis.AutomaticMaximum = False
      BottomAxis.AutomaticMinimum = False
      BottomAxis.Maximum = 100.000000000000000000
      LeftAxis.Automatic = False
      LeftAxis.AutomaticMaximum = False
      LeftAxis.AutomaticMinimum = False
      LeftAxis.Maximum = 100.000000000000000000
      LeftAxis.Minimum = 0.000000000000000000
      RightAxis.Automatic = False
      RightAxis.AutomaticMaximum = False
      RightAxis.AutomaticMinimum = False
      RightAxis.Maximum = 1.000000000000000000
      RightAxis.Minimum = 0.000000000000000000
      Color = 11193599
      inherited Series2: TBubbleSeries
        Pointer.HorizSize = 413
        Pointer.VertSize = 413
      end
      inherited Series11: TLineSeries
        SeriesColor = clBlack
        LinePen.Color = clBlack
        LinePen.Width = 5
      end
    end
    inherited Chart2: TChart
      Color = 11193548
      inherited Series3: TBubbleSeries
        Pointer.HorizSize = 1645
        Pointer.VertSize = 1645
      end
    end
    inherited ComboBox1: TComboBox
      Left = 313
      Width = 176
      OnChange = Frame15ComboBox1Change
      Items.Strings = (
        'nu1'
        'nu2'
        'nu3'
        'nu4'
        'U1'
        'U2'
        'U3'
        'U4'
        'uE1'
        'uE2'
        'uE3'
        'uE4'
        'rext'
        'PinWheels'
        'from Inspector'
        'VisualStimulus'
        'Screen'
        'ElectricalStimulus'
        'PatchyConnections'
        'VSD-signal')
    end
  end
  object Button2: TButton
    Left = 448
    Top = 32
    Width = 41
    Height = 17
    Caption = 'BMP'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 449
    Top = 48
    Width = 41
    Height = 17
    Caption = 'Save'
    TabOrder = 3
    OnClick = Button1Click
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 424
    Width = 121
    Height = 17
    Caption = 'Profile on a ring'
    TabOrder = 4
    OnClick = CheckBox1Click
  end
  object DDSpinEdit3: TDDSpinEdit
    Left = 336
    Top = 422
    Width = 52
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 5.000000000000000000
    TabOrder = 5
  end
  object StaticText1: TStaticText
    Left = 308
    Top = 425
    Width = 25
    Height = 20
    Caption = 'min'
    TabOrder = 6
  end
  object StaticText2: TStaticText
    Left = 401
    Top = 425
    Width = 29
    Height = 20
    Caption = 'max'
    TabOrder = 7
  end
  object DDSpinEdit4: TDDSpinEdit
    Left = 432
    Top = 422
    Width = 52
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 5.000000000000000000
    TabOrder = 8
  end
end
