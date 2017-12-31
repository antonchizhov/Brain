object Form13: TForm13
  Left = 974
  Top = 260
  Hint = 'Ghystogramand correlation function of the signal set'
  Anchors = []
  AutoScroll = False
  AutoSize = True
  Caption = 'Form13: Statistics'
  ClientHeight = 786
  ClientWidth = 401
  Color = 12239044
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  PixelsPerInch = 120
  TextHeight = 16
  object Chart1: TChart
    Left = 0
    Top = 0
    Width = 400
    Height = 233
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'Histogram')
    BottomAxis.MinorTickCount = 4
    BottomAxis.Title.Caption = 'Hz'
    LeftAxis.MinorTickCount = 4
    Legend.Visible = False
    RightAxis.MinorTickCount = 4
    View3D = False
    Color = 12239044
    TabOrder = 0
    object Button2: TButton
      Left = 320
      Top = 8
      Width = 75
      Height = 20
      Caption = 'In file'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Series1: TBarSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      object TeeFunction1: TAverageTeeFunction
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 234
    Width = 145
    Height = 97
    Caption = 'Hystogram'
    TabOrder = 1
    object DDSpinEdit5: TDDSpinEdit
      Left = 80
      Top = 18
      Width = 57
      Height = 26
      StrWidth = 2
      StrDecimals = 1
      Increment = 10.000000000000000000
      TabOrder = 4
    end
    object DDSpinEdit1: TDDSpinEdit
      Left = 80
      Top = 42
      Width = 57
      Height = 26
      StrWidth = 2
      StrDecimals = 1
      Increment = 10.000000000000000000
      TabOrder = 0
      Value = 100.000000000000000000
    end
    object StaticText42: TStaticText
      Left = 8
      Top = 45
      Width = 65
      Height = 20
      Caption = 'Max value'
      TabOrder = 1
    end
    object DDSpinEdit2: TDDSpinEdit
      Left = 80
      Top = 64
      Width = 57
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 10.000000000000000000
      TabOrder = 2
      Value = 50.000000000000000000
    end
    object StaticText1: TStaticText
      Left = 8
      Top = 68
      Width = 68
      Height = 20
      Caption = 'n_intervals'
      TabOrder = 3
    end
    object StaticText4: TStaticText
      Left = 8
      Top = 22
      Width = 61
      Height = 20
      Caption = 'Min value'
      TabOrder = 5
    end
  end
  object Chart2: TChart
    Left = 0
    Top = 336
    Width = 400
    Height = 258
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'Correlation function ')
    BottomAxis.MinorTickCount = 4
    BottomAxis.Title.Caption = 'tau, ms'
    LeftAxis.Automatic = False
    LeftAxis.AutomaticMaximum = False
    LeftAxis.AutomaticMinimum = False
    LeftAxis.ExactDateTime = False
    LeftAxis.Increment = 0.200000000000000000
    LeftAxis.Maximum = 1.200000000000000000
    LeftAxis.Minimum = -0.200000000000000000
    LeftAxis.MinorTickCount = 4
    Legend.Visible = False
    RightAxis.MinorTickCount = 4
    TopAxis.Title.Caption = 'tau, ms'
    View3D = False
    Color = 12239044
    TabOrder = 2
    object Label1: TLabel
      Left = 248
      Top = 72
      Width = 31
      Height = 16
      Caption = ' tau= '
    end
    object Label2: TLabel
      Left = 248
      Top = 40
      Width = 47
      Height = 16
      Caption = ' Mean= '
    end
    object Label3: TLabel
      Left = 248
      Top = 56
      Width = 67
      Height = 16
      Caption = ' Variance= '
    end
    object Button1: TButton
      Left = 312
      Top = 8
      Width = 75
      Height = 20
      Caption = 'Spectrum'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Series2: TFastLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = 4194432
      LinePen.Color = 4194432
      LinePen.Width = 3
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
    Left = 280
    Top = 234
    Width = 121
    Height = 73
    Caption = 'Corr. function'
    TabOrder = 3
    object DDSpinEdit3: TDDSpinEdit
      Left = 56
      Top = 18
      Width = 57
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 10.000000000000000000
      TabOrder = 0
      Value = 1000.000000000000000000
    end
    object StaticText2: TStaticText
      Left = 8
      Top = 22
      Width = 44
      Height = 20
      Caption = 'nt_corr'
      TabOrder = 1
    end
  end
  object Chart3: TChart
    Left = 0
    Top = 592
    Width = 400
    Height = 194
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'Spectrum')
    BottomAxis.Automatic = False
    BottomAxis.AutomaticMaximum = False
    BottomAxis.AutomaticMinimum = False
    BottomAxis.Maximum = 25.000000000000000000
    BottomAxis.Title.Caption = 'Hz'
    Legend.Visible = False
    View3D = False
    Color = 12239044
    DragMode = dmAutomatic
    TabOrder = 4
    Visible = False
    DragKind = dkDock
    object StaticText3: TStaticText
      Left = 264
      Top = 6
      Width = 58
      Height = 20
      Caption = 'Max freq.'
      TabOrder = 0
    end
    object DDSpinEdit4: TDDSpinEdit
      Left = 328
      Top = 2
      Width = 57
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 50.000000000000000000
      TabOrder = 1
      Value = 100.000000000000000000
    end
    object Series3: TFastLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      LinePen.Color = clRed
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
  object ComboBox1: TComboBox
    Left = 152
    Top = 264
    Width = 124
    Height = 24
    ItemHeight = 16
    ItemIndex = 1
    TabOrder = 5
    Text = 'nu[1]'
    Items.Strings = (
      'Input (Iadd/pext)'
      'nu[1]'
      'LFP')
  end
end
