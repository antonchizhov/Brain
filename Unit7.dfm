object Form7: TForm7
  Left = 263
  Top = 74
  Width = 409
  Height = 948
  AutoSize = True
  Caption = 'Form7'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object Chart1: TChart
    Left = 0
    Top = 0
    Width = 400
    Height = 257
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    Legend.Alignment = laTop
    Legend.ColorWidth = 30
    Legend.LegendStyle = lsSeries
    Legend.ShadowSize = 0
    View3D = False
    TabOrder = 0
    object Button4: TButton
      Left = 329
      Top = 9
      Width = 64
      Height = 24
      Hint = 'DrawAndWriteSigmoid'
      Caption = 'Clean'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = Button4Click
    end
    object ComboBox1: TComboBox
      Left = 153
      Top = 233
      Width = 120
      Height = 24
      ItemHeight = 16
      ItemIndex = 1
      TabOrder = 1
      Text = 'X=Vrest+I/gtot'
      Items.Strings = (
        'X=Current'
        'X=Vrest+I/gtot')
    end
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'Sigmoid_E'
      OnDblClick = Series1DblClick
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
    object Series2: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clGreen
      Title = 'Sigmoid_I'
      OnDblClick = Series2DblClick
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
  end
  object Chart2: TChart
    Left = 0
    Top = 256
    Width = 400
    Height = 250
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    BottomAxis.Automatic = False
    BottomAxis.AutomaticMaximum = False
    BottomAxis.AutomaticMinimum = False
    BottomAxis.Maximum = 4.000000000000000000
    BottomAxis.Title.Caption = 'ts_'
    LeftAxis.Automatic = False
    LeftAxis.AutomaticMaximum = False
    LeftAxis.AutomaticMinimum = False
    LeftAxis.Maximum = 1.000000000000000000
    LeftAxis.Title.Caption = 'ro/ro0'
    Legend.TextStyle = ltsPlain
    Legend.Visible = False
    RightAxis.Automatic = False
    RightAxis.AutomaticMinimum = False
    RightAxis.Title.Caption = 'u'
    View3D = False
    TabOrder = 1
    object Series3: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = 8404992
      LinePen.Width = 2
      Pointer.Brush.Color = 16744576
      Pointer.HorizSize = 2
      Pointer.InflateMargins = True
      Pointer.Pen.Color = 16744576
      Pointer.Style = psCircle
      Pointer.VertSize = 2
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
      SeriesColor = 33023
      VertAxis = aRightAxis
      Pointer.Brush.Color = 8454143
      Pointer.HorizSize = 2
      Pointer.InflateMargins = True
      Pointer.Style = psCircle
      Pointer.VertSize = 2
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
  object Button1: TButton
    Left = 153
    Top = 512
    Width = 128
    Height = 25
    Caption = 'Rate versus tau_s'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Chart3: TChart
    Left = 0
    Top = 537
    Width = 400
    Height = 249
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    BottomAxis.Title.Caption = 'tau_s, ms'
    LeftAxis.Title.Caption = 'Rate, Hz'
    Legend.Alignment = laTop
    Legend.LegendStyle = lsSeries
    Legend.ShadowSize = 0
    Legend.TopPos = 1
    Legend.VertMargin = 3
    View3D = False
    TabOrder = 3
    Visible = False
    OnDblClick = Chart3DblClick
    object Button2: TButton
      Left = 336
      Top = 0
      Width = 59
      Height = 17
      Caption = 'Save'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Series5: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      LinePen.Width = 2
      LinePen.Visible = False
      Pointer.InflateMargins = True
      Pointer.Style = psCircle
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 793
    Width = 401
    Height = 72
    Caption = 'Parameters for LIF with colored noise'
    TabOrder = 4
    Visible = False
    object Label1: TLabel
      Left = 9
      Top = 18
      Width = 54
      Height = 16
      Caption = 'Vinfty/VT'
    end
    object Label2: TLabel
      Left = 9
      Top = 42
      Width = 57
      Height = 16
      Caption = 'sgmV/VT'
    end
    object Label3: TLabel
      Left = 153
      Top = 18
      Width = 60
      Height = 16
      Caption = 'tau_m, ms'
    end
    object DDSpinEdit3: TDDSpinEdit
      Left = 217
      Top = 16
      Width = 40
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 1.000000000000000000
      TabOrder = 2
      Value = 10.000000000000000000
    end
    object DDSpinEdit1: TDDSpinEdit
      Left = 73
      Top = 16
      Width = 56
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Increment = 0.050000000000000000
      ParentFont = False
      TabOrder = 0
      Value = 0.800000000000000000
    end
    object DDSpinEdit2: TDDSpinEdit
      Left = 73
      Top = 41
      Width = 56
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 0.050000000000000000
      TabOrder = 1
      Value = 0.200000000000000000
    end
    object CheckBox1: TCheckBox
      Left = 137
      Top = 42
      Width = 216
      Height = 17
      Caption = 'if Moreno-Bote then sgm^2 in Hz:'
      TabOrder = 3
      OnClick = CheckBox1Click
    end
    object DDSpinEdit4: TDDSpinEdit
      Left = 352
      Top = 41
      Width = 41
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Enabled = False
      Increment = 1.000000000000000000
      TabOrder = 4
      Value = 4.000000000000000000
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 864
    Width = 401
    Height = 49
    Caption = 'Numeric'
    TabOrder = 5
    Visible = False
    object Label8: TLabel
      Left = 7
      Top = 18
      Width = 47
      Height = 16
      Caption = 'NPoints'
    end
    object Label5: TLabel
      Left = 128
      Top = 18
      Width = 78
      Height = 16
      Caption = 'discretization'
    end
    object Label6: TLabel
      Left = 288
      Top = 18
      Width = 23
      Height = 16
      Caption = 'eps'
    end
    object DDSpinEdit5: TDDSpinEdit
      Left = 57
      Top = 16
      Width = 48
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 10.000000000000000000
      TabOrder = 0
      Value = 10.000000000000000000
    end
    object DDSpinEdit6: TDDSpinEdit
      Left = 208
      Top = 16
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Increment = 10000.000000000000000000
      TabOrder = 1
      Value = 10000.000000000000000000
    end
    object DDSpinEdit7: TDDSpinEdit
      Left = 313
      Top = 16
      Width = 80
      Height = 26
      StrWidth = 2
      StrDecimals = 6
      Increment = 0.001000000000000000
      TabOrder = 2
      Value = 0.001000000000000000
    end
  end
  object Button3: TButton
    Left = 1
    Top = 9
    Width = 96
    Height = 24
    Hint = 'DrawAndWriteSigmoid'
    Caption = 'Johannesma'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = Button3Click
  end
  object SaveDialog1: TSaveDialog
    OnCanClose = SaveDialog1CanClose
    Left = 360
    Top = 552
  end
end
