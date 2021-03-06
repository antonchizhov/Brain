object Form6: TForm6
  Left = 0
  Top = 472
  Width = 993
  Height = 690
  AutoSize = True
  Caption = 'Form6: Representatives'
  Color = 11190500
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object CheckBox3: TCheckBox
    Left = 0
    Top = 0
    Width = 113
    Height = 17
    Caption = 'Conductances'
    Checked = True
    State = cbChecked
    TabOrder = 0
    OnClick = CheckBox3Click
  end
  object Chart3: TChart
    Left = 0
    Top = 446
    Width = 489
    Height = 209
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'Conductances for representative neuron "i3"')
    BottomAxis.Automatic = False
    BottomAxis.AutomaticMinimum = False
    BottomAxis.MinorTickCount = 4
    BottomAxis.Title.Caption = 't, ms'
    LeftAxis.MinorTickCount = 4
    Legend.Alignment = laTop
    Legend.ColorWidth = 30
    Legend.HorizMargin = 2
    Legend.ResizeChart = False
    Legend.ShadowSize = 0
    Legend.VertMargin = 1
    RightAxis.MinorTickCount = 4
    View3D = False
    Color = 11190500
    TabOrder = 1
    object Series3: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clBlue
      Title = 'nM'
      LinePen.Color = clBlue
      LinePen.Width = 2
      Pointer.HorizSize = 2
      Pointer.InflateMargins = True
      Pointer.Pen.Color = 16777088
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
      SeriesColor = clPurple
      Title = 'wAHP'
      VertAxis = aRightAxis
      LinePen.Color = clPurple
      LinePen.Width = 2
      Pointer.HorizSize = 2
      Pointer.InflateMargins = True
      Pointer.Pen.Color = clPurple
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
  object Chart4: TChart
    Left = 0
    Top = 222
    Width = 489
    Height = 209
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clGreen
    Title.Font.Height = -13
    Title.Font.Name = 'Arial'
    Title.Font.Style = [fsBold, fsItalic]
    Title.Text.Strings = (
      'Pyramidal neuron in 2-3 layer:')
    BottomAxis.LabelsSeparation = 20
    BottomAxis.MinorTickCount = 4
    BottomAxis.Title.Caption = 't, ms'
    BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
    BottomAxis.Title.Font.Color = clBlack
    BottomAxis.Title.Font.Height = -13
    BottomAxis.Title.Font.Name = 'Arial'
    BottomAxis.Title.Font.Style = [fsBold]
    LeftAxis.MinorTickCount = 4
    LeftAxis.Title.Caption = 'Hz'
    LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
    LeftAxis.Title.Font.Color = clBlack
    LeftAxis.Title.Font.Height = -13
    LeftAxis.Title.Font.Name = 'Arial'
    LeftAxis.Title.Font.Style = [fsBold]
    Legend.Visible = False
    RightAxis.MinorTickCount = 4
    RightAxis.Title.Caption = 'mV'
    RightAxis.Title.Font.Charset = DEFAULT_CHARSET
    RightAxis.Title.Font.Color = clBlack
    RightAxis.Title.Font.Height = -13
    RightAxis.Title.Font.Name = 'Arial'
    RightAxis.Title.Font.Style = [fsBold]
    View3D = False
    Color = 11190500
    TabOrder = 2
    object Series7: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clGreen
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
    object Series9: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
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
    Left = 496
    Top = 222
    Width = 489
    Height = 209
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clGreen
    Title.Font.Height = -13
    Title.Font.Name = 'Arial'
    Title.Font.Style = [fsBold, fsItalic]
    Title.Text.Strings = (
      'Interneuron in 2-3 layer:')
    BottomAxis.LabelsSeparation = 20
    BottomAxis.MinorTickCount = 4
    BottomAxis.Title.Caption = 't, ms'
    BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
    BottomAxis.Title.Font.Color = clBlack
    BottomAxis.Title.Font.Height = -13
    BottomAxis.Title.Font.Name = 'Arial'
    BottomAxis.Title.Font.Style = [fsBold]
    LeftAxis.MinorTickCount = 4
    LeftAxis.Title.Caption = 'Hz'
    LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
    LeftAxis.Title.Font.Color = clBlack
    LeftAxis.Title.Font.Height = -13
    LeftAxis.Title.Font.Name = 'Arial'
    LeftAxis.Title.Font.Style = [fsBold]
    Legend.Visible = False
    RightAxis.MinorTickCount = 4
    RightAxis.Title.Caption = 'mV'
    RightAxis.Title.Font.Charset = DEFAULT_CHARSET
    RightAxis.Title.Font.Color = clBlack
    RightAxis.Title.Font.Height = -13
    RightAxis.Title.Font.Name = 'Arial'
    RightAxis.Title.Font.Style = [fsBold]
    View3D = False
    Color = 11190500
    TabOrder = 3
    object Series8: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clGreen
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
    object Series10: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
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
  object Chart1: TChart
    Left = 0
    Top = 14
    Width = 489
    Height = 209
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clGreen
    Title.Font.Height = -13
    Title.Font.Name = 'Arial'
    Title.Font.Style = [fsBold, fsItalic]
    Title.Text.Strings = (
      'Pyramidal neuron:')
    BottomAxis.LabelsSeparation = 20
    BottomAxis.MinorTickCount = 4
    BottomAxis.Title.Caption = 't, ms'
    BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
    BottomAxis.Title.Font.Color = clBlack
    BottomAxis.Title.Font.Height = -13
    BottomAxis.Title.Font.Name = 'Arial'
    BottomAxis.Title.Font.Style = [fsBold]
    LeftAxis.MinorTickCount = 4
    LeftAxis.Title.Caption = 'Hz'
    LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
    LeftAxis.Title.Font.Color = clBlack
    LeftAxis.Title.Font.Height = -13
    LeftAxis.Title.Font.Name = 'Arial'
    LeftAxis.Title.Font.Style = [fsBold]
    Legend.Alignment = laTop
    Legend.HorizMargin = 1
    Legend.LegendStyle = lsSeries
    Legend.ResizeChart = False
    Legend.ShadowSize = 0
    Legend.VertMargin = 1
    Legend.Visible = False
    RightAxis.MinorTickCount = 4
    RightAxis.Title.Caption = 'mV'
    RightAxis.Title.Font.Charset = DEFAULT_CHARSET
    RightAxis.Title.Font.Color = clBlack
    RightAxis.Title.Font.Height = -13
    RightAxis.Title.Font.Name = 'Arial'
    RightAxis.Title.Font.Style = [fsBold]
    View3D = False
    Color = 11190500
    TabOrder = 4
    object Button7: TButton
      Left = 441
      Top = 0
      Width = 40
      Height = 17
      Caption = 'Auto'
      TabOrder = 0
      OnClick = Button7Click
    end
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clGreen
      VertAxis = aRightAxis
      LinePen.Color = clGreen
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
    object Series5: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      LinePen.Width = 2
      Pointer.HorizSize = 1
      Pointer.InflateMargins = True
      Pointer.Style = psCircle
      Pointer.VertSize = 1
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
    Left = 496
    Top = 14
    Width = 489
    Height = 209
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clGreen
    Title.Font.Height = -13
    Title.Font.Name = 'Arial'
    Title.Font.Style = [fsBold, fsItalic]
    Title.Text.Strings = (
      'Interneuron:')
    BottomAxis.LabelsSeparation = 20
    BottomAxis.MinorTickCount = 4
    BottomAxis.Title.Caption = 't, ms'
    BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
    BottomAxis.Title.Font.Color = clBlack
    BottomAxis.Title.Font.Height = -13
    BottomAxis.Title.Font.Name = 'Arial'
    BottomAxis.Title.Font.Style = [fsBold]
    LeftAxis.MinorTickCount = 4
    LeftAxis.Title.Caption = 'Hz'
    LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
    LeftAxis.Title.Font.Color = clBlack
    LeftAxis.Title.Font.Height = -13
    LeftAxis.Title.Font.Name = 'Arial'
    LeftAxis.Title.Font.Style = [fsBold]
    Legend.Visible = False
    RightAxis.MinorTickCount = 4
    RightAxis.Title.Caption = 'mV'
    RightAxis.Title.Font.Charset = DEFAULT_CHARSET
    RightAxis.Title.Font.Color = clBlack
    RightAxis.Title.Font.Height = -13
    RightAxis.Title.Font.Name = 'Arial'
    RightAxis.Title.Font.Style = [fsBold]
    View3D = False
    Color = 11190500
    TabOrder = 5
    object Series2: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clGreen
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
    object Series6: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      LinePen.Width = 2
      Pointer.HorizSize = 1
      Pointer.InflateMargins = True
      Pointer.Style = psCircle
      Pointer.VertSize = 1
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
