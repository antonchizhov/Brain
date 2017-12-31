object Form29: TForm29
  Left = 614
  Top = 284
  Width = 626
  Height = 417
  Caption = 'Form29: BOLD'
  Color = 4674797
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
    Top = 32
    Width = 617
    Height = 345
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      '')
    Title.Visible = False
    BottomAxis.Title.Caption = 't, ms'
    LeftAxis.Title.Caption = 'BOLD'
    Legend.Alignment = laTop
    Legend.ColorWidth = 65
    Legend.LegendStyle = lsSeries
    Legend.ShadowSize = 0
    View3D = False
    Color = 4674797
    TabOrder = 0
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = -1
      Title = 'BOLD'
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
  end
end
