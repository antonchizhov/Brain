object Form22: TForm22
  Left = 158
  Top = 654
  Width = 583
  Height = 505
  Caption = 'Form22: Analysis'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 160
    Top = 16
    Width = 130
    Height = 16
    Caption = 'max number of spikes'
  end
  object Label2: TLabel
    Left = 160
    Top = 40
    Width = 89
    Height = 16
    Caption = 'VSpikeCrit, mV'
  end
  object Label3: TLabel
    Left = 160
    Top = 112
    Width = 76
    Height = 16
    Caption = 'Iind_max, pA'
  end
  object Label4: TLabel
    Left = 160
    Top = 136
    Width = 52
    Height = 16
    Caption = 'dIind, pA'
  end
  object Label5: TLabel
    Left = 160
    Top = 64
    Width = 64
    Height = 16
    Caption = 't_end_, ms'
  end
  object Label6: TLabel
    Left = 160
    Top = 88
    Width = 98
    Height = 16
    Caption = 't_start_count, ms'
  end
  object Label7: TLabel
    Left = 8
    Top = 40
    Width = 33
    Height = 16
    Caption = 's/gL='
  end
  object Chart1: TChart
    Left = 8
    Top = 168
    Width = 561
    Height = 298
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'f-I-curve')
    BottomAxis.Title.Caption = 'pA'
    LeftAxis.Title.Caption = 'Hz'
    Legend.Alignment = laTop
    Legend.ColorWidth = 50
    Legend.LegendStyle = lsSeries
    Legend.ResizeChart = False
    Legend.ShadowSize = 0
    Legend.TextStyle = ltsPlain
    Legend.VertMargin = 1
    View3D = False
    TabOrder = 0
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'nu'
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
    object Series2: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = 4227327
      Title = 'nu_Joh'
      LinePen.Width = 2
      Pointer.Brush.Color = clYellow
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
    object Series3: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clGreen
      Title = 'nu_ad'
      LinePen.Width = 2
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
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
  end
  object DDSpinEdit1: TDDSpinEdit
    Left = 296
    Top = 13
    Width = 49
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 1.000000000000000000
    TabOrder = 1
    Value = 20.000000000000000000
  end
  object DDSpinEdit2: TDDSpinEdit
    Left = 296
    Top = 37
    Width = 49
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 1.000000000000000000
    TabOrder = 2
    Value = -30.000000000000000000
  end
  object CheckBox1: TCheckBox
    Left = 440
    Top = 16
    Width = 73
    Height = 17
    Caption = 'IfNoise'
    Checked = True
    State = cbChecked
    TabOrder = 3
  end
  object DDSpinEdit5: TDDSpinEdit
    Left = 296
    Top = 61
    Width = 57
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 100.000000000000000000
    TabOrder = 6
    Value = 2000.000000000000000000
  end
  object DDSpinEdit6: TDDSpinEdit
    Left = 296
    Top = 85
    Width = 57
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 100.000000000000000000
    TabOrder = 7
    Value = 1000.000000000000000000
  end
  object DDSpinEdit3: TDDSpinEdit
    Left = 296
    Top = 109
    Width = 57
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 100.000000000000000000
    TabOrder = 4
    Value = 1000.000000000000000000
  end
  object DDSpinEdit4: TDDSpinEdit
    Left = 296
    Top = 133
    Width = 57
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 10.000000000000000000
    TabOrder = 5
    Value = 10.000000000000000000
  end
  object Button1: TButton
    Left = 432
    Top = 64
    Width = 97
    Height = 25
    Caption = 'Plot f-I-curve'
    TabOrder = 8
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 432
    Top = 88
    Width = 97
    Height = 25
    Caption = 'Clean'
    TabOrder = 9
    OnClick = Button2Click
  end
  object DDSpinEdit7: TDDSpinEdit
    Left = 48
    Top = 37
    Width = 49
    Height = 26
    StrWidth = 2
    StrDecimals = 2
    Increment = 0.500000000000000000
    TabOrder = 10
  end
end
