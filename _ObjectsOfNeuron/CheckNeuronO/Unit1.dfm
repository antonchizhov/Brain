object Form1: TForm1
  Left = 315
  Top = 248
  Width = 451
  Height = 363
  Caption = 'Form1'
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
    Left = 232
    Top = 8
    Width = 44
    Height = 16
    Caption = 'Iind, pA'
  end
  object Button1: TButton
    Left = 192
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Run'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Chart1: TChart
    Left = 24
    Top = 32
    Width = 400
    Height = 250
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'Voltage')
    BottomAxis.Title.Caption = 'ms'
    LeftAxis.Title.Caption = 'mV'
    Legend.Visible = False
    View3D = False
    TabOrder = 1
    object Series1: TLineSeries
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
      XValues.Order = loNone
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object SpinEdit1: TSpinEdit
    Left = 288
    Top = 0
    Width = 65
    Height = 26
    MaxValue = 0
    MinValue = 0
    TabOrder = 2
    Value = 400
  end
end
