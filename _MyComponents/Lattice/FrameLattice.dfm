object FrameLattice: TFrameLattice
  Left = 0
  Top = 0
  Width = 490
  Height = 452
  TabOrder = 0
  object Label1: TLabel
    Left = 0
    Top = 16
    Width = 41
    Height = 16
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 248
    Top = 16
    Width = 41
    Height = 16
    Caption = 'Label2'
  end
  object Chart1: TChart
    Left = 0
    Top = 32
    Width = 489
    Height = 417
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    BottomAxis.Title.Caption = 'i'
    LeftAxis.Title.Caption = 'j'
    Legend.Visible = False
    RightAxis.Title.Caption = 'z'
    View3D = False
    TabOrder = 0
    object Series2: TBubbleSeries
      Marks.ArrowLength = 0
      Marks.BackColor = clBlue
      Marks.Frame.Visible = False
      Marks.Transparent = True
      Marks.Visible = False
      SeriesColor = clRed
      Pointer.Brush.Color = 33023
      Pointer.HorizSize = 31
      Pointer.InflateMargins = False
      Pointer.Style = psRectangle
      Pointer.VertSize = 31
      Pointer.Visible = True
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      RadiusValues.DateTime = False
      RadiusValues.Name = 'Radius'
      RadiusValues.Multiplier = 1.000000000000000000
      RadiusValues.Order = loNone
    end
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clGreen
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
    object Series4: TChartShape
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clWhite
      Title = 'Ring'
      Brush.Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Pen.Width = 2
      Transparent = True
      X0 = 0.875000000000000600
      X1 = 6.125000000000004000
      Y0 = 155.666666666666700000
      Y1 = 694.333333333333400000
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
      SeriesColor = clYellow
      Pointer.Brush.Color = clWhite
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
    object Series6: TPointSeries
      Marks.ArrowLength = 0
      Marks.Visible = False
      SeriesColor = clBlue
      Pointer.Brush.Color = clBlack
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Pen.Width = 2
      Pointer.Style = psDiagCross
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
  object Chart2: TChart
    Left = 0
    Top = 0
    Width = 297
    Height = 17
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    AxisVisible = False
    LeftAxis.Automatic = False
    LeftAxis.AutomaticMaximum = False
    LeftAxis.AutomaticMinimum = False
    LeftAxis.Maximum = 1.000000000000000000
    Legend.Visible = False
    View3D = False
    TabOrder = 1
    object Series3: TBubbleSeries
      Marks.ArrowLength = 0
      Marks.Frame.Visible = False
      Marks.Transparent = True
      Marks.Visible = False
      SeriesColor = clRed
      Pointer.HorizSize = 2365
      Pointer.InflateMargins = False
      Pointer.Style = psRectangle
      Pointer.VertSize = 2365
      Pointer.Visible = True
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      RadiusValues.DateTime = False
      RadiusValues.Name = 'Radius'
      RadiusValues.Multiplier = 1.000000000000000000
      RadiusValues.Order = loNone
    end
  end
  object ComboBox1: TComboBox
    Left = 312
    Top = 0
    Width = 177
    Height = 24
    ItemHeight = 16
    ItemIndex = 4
    TabOrder = 2
    Text = 'U1'
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
      'PinWheels')
  end
end
