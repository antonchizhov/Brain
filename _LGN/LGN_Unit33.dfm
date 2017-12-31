object LGN_Form33: TLGN_Form33
  Left = 451
  Top = 744
  Width = 778
  Height = 270
  Caption = 'LGN_Form33: Saccades'
  Color = clMoneyGreen
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
    Left = 8
    Top = 16
    Width = 401
    Height = 25
    Caption = 'Saccades is on if this form is visible'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ListBox1: TListBox
    Left = 16
    Top = 104
    Width = 121
    Height = 97
    ItemHeight = 16
    Items.Strings = (
      ' 0.972590E+03 0.170324E+02    '
      ' 0.109717E+04 0.173059E+02    '
      ' 0.114222E+04 0.142832E+02    '
      ' 0.122252E+04 0.132866E+02    '
      ' 0.130277E+04 0.125426E+02    '
      ' 0.135640E+04 0.112890E+02    '
      ' 0.144547E+04 0.110514E+02    '
      ' 0.149074E+04 0.676613E+01    '
      ' 0.151771E+04 0.525552E+01    '
      ' 0.162445E+04 0.577854E+01    '
      ' 0.172246E+04 0.528999E+01    '
      ' 0.186466E+04 0.657655E+01    '
      ' 0.193565E+04 0.785113E+01    '
      ' 0.199832E+04 0.584148E+01    '
      ' 0.201693E+04 0.129916E+01    '
      ' 0.205353E+04 -.425024E+01    '
      ' 0.211589E+04 -.449227E+01    '
      ' 0.220464E+04 -.296218E+01    '
      ' 0.225814E+04 -.345822E+01    '
      ' 0.230247E+04 -.244065E+01    '
      ' 0.242709E+04 -.241967E+01    '
      ' 0.246131E+04 0.541437E+01    '
      ' 0.252146E+04 0.175457E+02    '
      ' 0.261043E+04 0.178132E+02    '
      ' 0.266384E+04 0.178222E+02    '
      ' 0.274414E+04 0.168256E+02    '
      ' 0.284188E+04 0.178522E+02    '
      ' 0.293980E+04 0.178687E+02    '
      ' 0.303772E+04 0.178852E+02    '
      ' 0.308205E+04 0.189027E+02')
    TabOrder = 0
  end
  object ListBox2: TListBox
    Left = 192
    Top = 104
    Width = 121
    Height = 97
    ItemHeight = 16
    Items.Strings = (
      ' 0.966476E+03 0.137484E+01    '
      ' 0.103792E+04 0.124236E+00    '
      ' 0.109124E+04 0.638264E+00    '
      ' 0.112752E+04 -.314351E+01    '
      ' 0.114618E+04 -.793835E+01    '
      ' 0.117356E+04 -.117216E+02    '
      ' 0.123591E+04 -.119636E+02    '
      ' 0.128964E+04 -.137223E+02    '
      ' 0.136072E+04 -.129527E+02    '
      ' 0.143198E+04 -.131933E+02    '
      ' 0.147514E+04 -.561024E+01    '
      ' 0.150971E+04 0.203664E+00    '
      ' 0.156303E+04 0.717692E+00    '
      ' 0.159855E+04 0.122872E+01    '
      ' 0.164310E+04 0.983696E+00    '
      ' 0.172322E+04 0.997184E+00    '
      ' 0.179430E+04 0.176673E+01    '
      ' 0.188332E+04 0.178171E+01    '
      ' 0.195440E+04 0.255125E+01    '
      ' 0.198133E+04 0.129316E+01    '
      ' 0.201554E+04 0.912720E+01    '
      ' 0.203231E+04 0.149381E+02    '
      ' 0.205839E+04 0.184779E+02    '
      ' 0.213859E+04 0.179863E+02    '
      ' 0.218306E+04 0.182463E+02    '
      ' 0.223660E+04 0.174978E+02    '
      ' 0.231654E+04 0.185213E+02    '
      ' 0.241441E+04 0.187903E+02    '
      ' 0.245834E+04 0.220805E+02    '
      ' 0.247520E+04 0.273864E+02    '
      ' 0.250150E+04 0.296636E+02    '
      ' 0.257280E+04 0.291705E+02    '
      ' 0.267077E+04 0.289345E+02    '
      ' 0.272458E+04 0.266708E+02    '
      ' 0.277799E+04 0.266798E+02    '
      ' 0.283136E+04 0.269413E+02    '
      ' 0.289367E+04 0.269518E+02    '
      ' 0.296471E+04 0.279739E+02    '
      ' 0.304487E+04 0.277348E+02')
    TabOrder = 1
  end
  object Chart1: TChart
    Left = 448
    Top = 8
    Width = 313
    Height = 225
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    Legend.Visible = False
    View3D = False
    Color = clMoneyGreen
    TabOrder = 2
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Pointer.Brush.Color = clYellow
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
    object Series2: TPointSeries
      Marks.ArrowLength = 0
      Marks.Visible = False
      SeriesColor = clGreen
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
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
  object Button1: TButton
    Left = 352
    Top = 136
    Width = 65
    Height = 25
    Caption = 'Write'
    TabOrder = 3
    OnClick = Button1Click
  end
end
