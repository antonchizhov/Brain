object Form20: TForm20
  Left = 2
  Top = 899
  Width = 497
  Height = 260
  AutoSize = True
  Caption = 'Form20: Rose'
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 376
    Top = 0
    Width = 41
    Height = 16
    Caption = 'Label1'
  end
  object Chart1: TChart
    Left = 0
    Top = 0
    Width = 369
    Height = 225
    BackWall.Brush.Color = clWhite
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    View3D = False
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    Color = clSkyBlue
    TabOrder = 0
    object Series1: TBarSeries
      ColorEachPoint = True
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clWhite
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object RadioGroup1: TRadioGroup
    Left = 376
    Top = 80
    Width = 113
    Height = 121
    Caption = 'Conductances'
    Items.Strings = (
      'AMP3 on P'
      'AMP3 on I'
      'AMPA on P'
      'AMPA on I'
      'GABA on P'
      'GABA on I')
    TabOrder = 1
    OnClick = RadioGroup1Click
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 424
    Top = 48
    object AMP3onP1: TMenuItem
      Caption = 'Calculates Rose for synaptic conductances'
      RadioItem = True
    end
  end
end
