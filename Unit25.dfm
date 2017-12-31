object Form25: TForm25
  Left = 2
  Top = 597
  Width = 625
  Height = 425
  AutoSize = True
  Caption = 'Form25: LFP'
  Color = clSkyBlue
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
    Top = 50
    Width = 617
    Height = 340
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    BottomAxis.Automatic = False
    BottomAxis.AutomaticMinimum = False
    BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
    BottomAxis.LabelsFont.Color = clBlack
    BottomAxis.LabelsFont.Height = -17
    BottomAxis.LabelsFont.Name = 'Arial'
    BottomAxis.LabelsFont.Style = []
    BottomAxis.MinorTickCount = 4
    BottomAxis.Title.Caption = 't, ms'
    BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
    BottomAxis.Title.Font.Color = clBlack
    BottomAxis.Title.Font.Height = -17
    BottomAxis.Title.Font.Name = 'Arial'
    BottomAxis.Title.Font.Style = []
    LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
    LeftAxis.LabelsFont.Color = clBlack
    LeftAxis.LabelsFont.Height = -17
    LeftAxis.LabelsFont.Name = 'Arial'
    LeftAxis.LabelsFont.Style = []
    LeftAxis.MinorTickCount = 4
    LeftAxis.Title.Caption = 'LFP'
    LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
    LeftAxis.Title.Font.Color = clBlack
    LeftAxis.Title.Font.Height = -17
    LeftAxis.Title.Font.Name = 'Arial'
    LeftAxis.Title.Font.Style = []
    Legend.Alignment = laTop
    Legend.ColorWidth = 20
    Legend.Font.Charset = DEFAULT_CHARSET
    Legend.Font.Color = clBlack
    Legend.Font.Height = -15
    Legend.Font.Name = 'Arial'
    Legend.Font.Style = []
    Legend.LegendStyle = lsSeries
    Legend.ShadowSize = 0
    Legend.TopPos = 0
    RightAxis.MinorTickCount = 4
    View3D = False
    Color = clSkyBlue
    TabOrder = 0
    object Button2: TButton
      Left = 576
      Top = 322
      Width = 41
      Height = 18
      Caption = 'BMP'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button9: TButton
      Left = 480
      Top = 322
      Width = 97
      Height = 18
      Caption = 'As for Rate_E'
      TabOrder = 1
      OnClick = Button9Click
    end
    object Button7: TButton
      Left = 441
      Top = 322
      Width = 39
      Height = 18
      Caption = 'Auto'
      TabOrder = 2
      OnClick = Button7Click
    end
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'LFP'
      OnDblClick = Series1DblClick
      LinePen.Width = 3
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
    object Series4: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = 8421631
      Title = 'IsynE_'
      OnDblClick = Series4DblClick
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
    object Series2: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clGreen
      Title = 'Isyn_dend'
      OnDblClick = Series2DblClick
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
      SeriesColor = clBlue
      Title = 'IsynI_'
      OnDblClick = Series5DblClick
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
    object Series3: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clYellow
      Title = 'I_C+I_L'
      OnDblClick = Series3DblClick
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
    object Series6: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clBlack
      Title = 'I_Glia'
      OnDblClick = Series6DblClick
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
  object StaticText47: TStaticText
    Left = 10
    Top = 16
    Width = 132
    Height = 20
    Caption = 'SpikeAmpl, mA/cm^2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object DDSpinEdit79: TDDSpinEdit
    Left = 145
    Top = 12
    Width = 72
    Height = 24
    StrWidth = 2
    StrDecimals = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    Increment = 0.100000000000000000
    ParentFont = False
    TabOrder = 2
  end
  object RadioGroup1: TRadioGroup
    Left = 297
    Top = 0
    Width = 320
    Height = 43
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'LFP at somatic level'
      'LFP at dendritic level')
    ParentFont = False
    TabOrder = 3
  end
  object CheckBox1: TCheckBox
    Left = 240
    Top = 16
    Width = 41
    Height = 17
    Caption = '2D'
    TabOrder = 4
  end
end
