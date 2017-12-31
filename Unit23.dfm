object Form23: TForm23
  Left = 258
  Top = 681
  Width = 435
  Height = 333
  Caption = 'Form23: Fit synaptic kinetics'
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
    Width = 425
    Height = 297
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    BottomAxis.Title.Caption = 'ms'
    Legend.Visible = False
    View3D = False
    TabOrder = 0
    object Label1: TLabel
      Left = 176
      Top = 56
      Width = 41
      Height = 16
      Caption = 'Label1'
    end
    object Label2: TLabel
      Left = 120
      Top = 16
      Width = 41
      Height = 16
      Caption = 'Label2'
    end
    object Label3: TLabel
      Left = 224
      Top = 16
      Width = 41
      Height = 16
      Caption = 'Label3'
    end
    object Label4: TLabel
      Left = 176
      Top = 80
      Width = 41
      Height = 16
      Caption = 'Label4'
    end
    object Label5: TLabel
      Left = 176
      Top = 104
      Width = 41
      Height = 16
      Caption = 'Label5'
    end
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clBlack
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
    object Series2: TPointSeries
      Marks.ArrowLength = 0
      Marks.Visible = False
      SeriesColor = clRed
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
end
