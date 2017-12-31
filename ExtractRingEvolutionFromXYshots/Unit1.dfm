object Form1: TForm1
  Left = 512
  Top = 166
  Width = 653
  Height = 860
  Caption = 'ExtractRing v17.10'
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 37
    Width = 38
    Height = 16
    Caption = 'rPW='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 373
    Width = 47
    Height = 16
    Caption = 't (ms)='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 405
    Width = 86
    Height = 16
    Caption = 'Theta (dgr)='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 61
    Width = 75
    Height = 16
    Caption = 'rPlot/rPW='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 8
    Top = 8
    Width = 38
    Height = 16
    Caption = 'Time='
    Color = clRed
    ParentColor = False
  end
  object Label9: TLabel
    Left = 24
    Top = 661
    Width = 43
    Height = 16
    Caption = 'i,j_view'
  end
  object Label10: TLabel
    Left = 40
    Top = 85
    Width = 52
    Height = 16
    Caption = 'near i,j:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 8
    Top = 725
    Width = 56
    Height = 16
    Caption = 'fix_min='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label12: TLabel
    Left = 8
    Top = 749
    Width = 60
    Height = 16
    Caption = 'fix_max='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 8
    Top = 240
    Width = 297
    Height = 57
    Caption = 'View, extract ring and average the var:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object DDSpinEdit1: TDDSpinEdit
    Left = 96
    Top = 32
    Width = 73
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 1.000000000000000000
    TabOrder = 1
    Value = 6.000000000000000000
  end
  object Button2: TButton
    Left = 312
    Top = 304
    Width = 281
    Height = 25
    Caption = 'Extract Profile Across Radius at  t and Theta'
    TabOrder = 2
    OnClick = Button2Click
  end
  object DDSpinEdit2: TDDSpinEdit
    Left = 80
    Top = 368
    Width = 73
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 10.000000000000000000
    TabOrder = 3
    Value = 300.000000000000000000
  end
  object DDSpinEdit3: TDDSpinEdit
    Left = 96
    Top = 400
    Width = 73
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 45.000000000000000000
    TabOrder = 4
    Value = -90.000000000000000000
  end
  object Button3: TButton
    Left = 312
    Top = 328
    Width = 281
    Height = 25
    Caption = 'Extract Horizontal Profile at PWCenters at  t'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Chart1: TChart
    Left = 176
    Top = 0
    Width = 424
    Height = 233
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    MarginBottom = 2
    MarginTop = 0
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    BottomAxis.Title.Caption = 'degrees'
    LeftAxis.Title.Caption = 'Hz'
    Legend.Alignment = laTop
    Legend.ShadowSize = 0
    View3D = False
    Color = clMoneyGreen
    TabOrder = 6
    object Button6: TButton
      Left = 373
      Top = 0
      Width = 51
      Height = 17
      Caption = 'BMP'
      TabOrder = 0
      OnClick = Button6Click
    end
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clPurple
      Title = 'Integr_z'
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
    object Series2: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'Interpolated variable z'
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Style = psCircle
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
  object ComboBox1: TComboBox
    Left = 312
    Top = 256
    Width = 105
    Height = 24
    ItemHeight = 16
    ItemIndex = 13
    TabOrder = 11
    Text = 'VSD or LFP'
    Items.Strings = (
      'rext'
      'U1'
      'nu1'
      'U2'
      'nu2'
      'U3'
      'nu3'
      'U4'
      'nu4'
      'VisualStimulation'
      'z'
      'ss[1]'
      'ss[2]'
      'VSD or LFP'
      'VisualStim from "Visual...dat"'
      'Screen from "Visual...dat"'
      '')
  end
  object GroupBox1: TGroupBox
    Left = 456
    Top = 234
    Width = 145
    Height = 65
    Caption = 'Averaging epoach'
    TabOrder = 7
    object Label4: TLabel
      Left = 8
      Top = 16
      Width = 59
      Height = 16
      Caption = 't_start, ms'
    end
    object Label5: TLabel
      Left = 8
      Top = 40
      Width = 57
      Height = 16
      Caption = 't_end, ms'
    end
    object DDSpinEdit4: TDDSpinEdit
      Left = 80
      Top = 14
      Width = 56
      Height = 22
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Increment = 100.000000000000000000
      ParentFont = False
      TabOrder = 0
    end
    object DDSpinEdit5: TDDSpinEdit
      Left = 80
      Top = 36
      Width = 56
      Height = 22
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Increment = 100.000000000000000000
      ParentFont = False
      TabOrder = 1
      Value = 1000.000000000000000000
    end
  end
  object DDSpinEdit6: TDDSpinEdit
    Left = 96
    Top = 56
    Width = 73
    Height = 26
    StrWidth = 2
    StrDecimals = 2
    Increment = 0.250000000000000000
    TabOrder = 8
    Value = 0.750000000000000000
  end
  object Chart2: TChart
    Left = 176
    Top = 368
    Width = 424
    Height = 217
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    BottomAxis.Title.Caption = 'r or x'
    LeftAxis.Title.Caption = 'Hz'
    Legend.Visible = False
    View3D = False
    Color = clMoneyGreen
    TabOrder = 9
    object LineSeries1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clPurple
      Title = 'Integr_z'
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
  object Button4: TButton
    Left = 56
    Top = 136
    Width = 81
    Height = 25
    Caption = 'Change Dir'
    TabOrder = 10
    OnClick = Button4Click
  end
  object Chart3: TChart
    Left = 176
    Top = 592
    Width = 424
    Height = 217
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'Extract chosen variable at  i_view, j_view')
    BottomAxis.Title.Caption = 'ms'
    LeftAxis.Title.Caption = 'Hz or mV'
    Legend.Visible = False
    View3D = False
    Color = clMoneyGreen
    TabOrder = 12
    object CheckBox1: TCheckBox
      Left = 328
      Top = 200
      Width = 97
      Height = 17
      Caption = 'Don'#39't clean'
      TabOrder = 0
    end
    object Series3: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'at (i_view, j_view)'
      LinePen.Width = 3
      Pointer.Brush.Color = 8421631
      Pointer.HorizSize = 2
      Pointer.InflateMargins = True
      Pointer.Pen.Visible = False
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
      SeriesColor = clGreen
      Title = 'Average across domain'
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
  object DDSpinEdit7: TDDSpinEdit
    Left = 80
    Top = 656
    Width = 41
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 1.000000000000000000
    TabOrder = 13
    Value = 1.000000000000000000
  end
  object DDSpinEdit8: TDDSpinEdit
    Left = 120
    Top = 656
    Width = 41
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 1.000000000000000000
    TabOrder = 14
    Value = 1.000000000000000000
  end
  object Button5: TButton
    Left = 8
    Top = 176
    Width = 161
    Height = 57
    Hint = 'Press any key to keep stepping'
    Caption = 'Step by step'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 15
    OnClick = Button5Click
  end
  object DDSpinEdit9: TDDSpinEdit
    Left = 133
    Top = 80
    Width = 36
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 1.000000000000000000
    TabOrder = 16
  end
  object DDSpinEdit10: TDDSpinEdit
    Left = 96
    Top = 80
    Width = 36
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 1.000000000000000000
    TabOrder = 17
  end
  object Memo1: TMemo
    Left = 0
    Top = 456
    Width = 169
    Height = 161
    Lines.Strings = (
      'Averaged var across the '
      'ring is plotted in the top '
      'graph in purple and written '
      'in '#39'Ring(t,x)_from_xy.dat'#39'.'
      'Averaged var distributed in  '
      'x-y space is plotted as a '
      'final lattice and written in '
      #39'AveragedSelected_z(x,y).'
      'dat'#39'.')
    TabOrder = 18
  end
  object DDSpinEdit11: TDDSpinEdit
    Left = 80
    Top = 722
    Width = 73
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 10.000000000000000000
    TabOrder = 19
    Value = -70.000000000000000000
    OnDblClick = DDSpinEdit11DblClick
  end
  object DDSpinEdit12: TDDSpinEdit
    Left = 80
    Top = 746
    Width = 73
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 10.000000000000000000
    TabOrder = 20
    Value = -50.000000000000000000
    OnDblClick = DDSpinEdit12DblClick
  end
  object Button7: TButton
    Left = 8
    Top = 304
    Width = 161
    Height = 57
    Hint = 'Press any key to keep stepping'
    Caption = 'Stop'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 21
    OnClick = Button7Click
  end
  object OpenDialog1: TOpenDialog
    Title = 'Open any file in the desired directory'
    Left = 80
    Top = 168
  end
end
