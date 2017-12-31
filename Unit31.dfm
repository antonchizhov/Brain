object Form31: TForm31
  Left = 417
  Top = 754
  Width = 541
  Height = 371
  AutoSize = True
  Caption = 'Form31: Experimental conductances'
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 148
    Top = 6
    Width = 82
    Height = 16
    Caption = 'To be added:'
  end
  object Button1: TButton
    Left = 0
    Top = 0
    Width = 112
    Height = 32
    Caption = 'Read data'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Chart1: TChart
    Left = 0
    Top = 32
    Width = 533
    Height = 304
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    MarginRight = 10
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
    BottomAxis.LabelsFont.Color = clBlack
    BottomAxis.LabelsFont.Height = -17
    BottomAxis.LabelsFont.Name = 'Arial'
    BottomAxis.LabelsFont.Style = []
    BottomAxis.MinorTickCount = 4
    BottomAxis.Title.Caption = 'ms'
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
    LeftAxis.Title.Caption = 'nS'
    LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
    LeftAxis.Title.Font.Color = clBlack
    LeftAxis.Title.Font.Height = -17
    LeftAxis.Title.Font.Name = 'Arial'
    LeftAxis.Title.Font.Style = []
    Legend.Alignment = laTop
    Legend.ColorWidth = 50
    Legend.Font.Charset = DEFAULT_CHARSET
    Legend.Font.Color = clBlack
    Legend.Font.Height = -17
    Legend.Font.Name = 'Arial'
    Legend.Font.Style = []
    Legend.LegendStyle = lsSeries
    Legend.ShadowSize = 0
    View3D = False
    Color = clSkyBlue
    TabOrder = 1
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'gAMPA'
      LinePen.Width = 2
      Pointer.Brush.Color = 33023
      Pointer.HorizSize = 2
      Pointer.InflateMargins = True
      Pointer.Pen.Color = clRed
      Pointer.Pen.Width = 2
      Pointer.Style = psCircle
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
    object Series2: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = 33023
      Title = 'gNMDA'
      LinePen.Color = clYellow
      LinePen.Width = 2
      Pointer.Brush.Color = 33023
      Pointer.HorizSize = 2
      Pointer.InflateMargins = True
      Pointer.Pen.Color = 33023
      Pointer.Pen.Width = 2
      Pointer.Style = psCircle
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
    object Series3: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clBlue
      Title = 'gGABA'
      LinePen.Width = 2
      Pointer.Brush.Color = clAqua
      Pointer.HorizSize = 2
      Pointer.InflateMargins = True
      Pointer.Pen.Color = clBlue
      Pointer.Pen.Width = 2
      Pointer.Style = psCircle
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
  object CheckBox1: TCheckBox
    Left = 236
    Top = 5
    Width = 80
    Height = 21
    Caption = 'AMPA'
    Checked = True
    State = cbChecked
    TabOrder = 2
  end
  object CheckBox2: TCheckBox
    Left = 335
    Top = 5
    Width = 80
    Height = 21
    Caption = 'NMDA'
    Checked = True
    State = cbChecked
    TabOrder = 3
  end
  object CheckBox3: TCheckBox
    Left = 433
    Top = 5
    Width = 80
    Height = 21
    Caption = 'GABA'
    Checked = True
    State = cbChecked
    TabOrder = 4
  end
end