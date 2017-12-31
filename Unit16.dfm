object Form16: TForm16
  Left = 518
  Top = 260
  Width = 861
  Height = 901
  Caption = 'Form16: KFP-ring'
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
    Left = 585
    Top = 20
    Width = 54
    Height = 16
    Caption = 't_end,ms'
  end
  object Label20: TLabel
    Left = 585
    Top = 44
    Width = 43
    Height = 16
    Caption = 'n_draw'
  end
  object Label25: TLabel
    Left = 585
    Top = 68
    Width = 41
    Height = 16
    Caption = 'n_write'
  end
  object Label27: TLabel
    Left = 8
    Top = 272
    Width = 150
    Height = 16
    Caption = 'V0 is greater than mu!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label2: TLabel
    Left = 400
    Top = 272
    Width = 172
    Height = 16
    Caption = 'Warning: tstep is too big!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label34: TLabel
    Left = 720
    Top = 20
    Width = 68
    Height = 16
    Caption = 'tSt_start,ms'
  end
  object Label35: TLabel
    Left = 720
    Top = 44
    Width = 66
    Height = 16
    Caption = 'tSt_end,ms'
  end
  object Label36: TLabel
    Left = 720
    Top = 68
    Width = 43
    Height = 16
    Caption = 'tBG,ms'
  end
  object Chart2: TChart
    Left = 0
    Top = 288
    Width = 569
    Height = 305
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    BottomAxis.Title.Caption = 'grad.'
    LeftAxis.Title.Caption = 'Hz'
    Legend.Alignment = laTop
    Legend.ColorWidth = 15
    Legend.LegendStyle = lsSeries
    Legend.ResizeChart = False
    Legend.ShadowSize = 0
    Legend.VertMargin = 1
    RightAxis.Title.Caption = 'pA'
    View3D = False
    Color = clSkyBlue
    TabOrder = 0
    object Series2: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'nu(Theta)'
      LinePen.Width = 3
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
    object Series4: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clYellow
      Title = 'Stimuls=(I0+I1*cos-I0_Joh)*k_Joh'
      LinePen.Width = 3
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
    object Series5: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clGreen
      Title = 'Isyn'
      VertAxis = aRightAxis
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
  object Chart3: TChart
    Left = 0
    Top = 600
    Width = 569
    Height = 265
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    BottomAxis.Title.Caption = 'ms'
    LeftAxis.Title.Caption = 'Hz'
    Legend.Alignment = laTop
    Legend.ColorWidth = 45
    Legend.LegendStyle = lsSeries
    Legend.ResizeChart = False
    Legend.ShadowSize = 0
    Legend.VertMargin = 1
    View3D = False
    Color = clSkyBlue
    TabOrder = 1
    object Series3: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = 33023
      Title = 'nu(t,teta1)'
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
      SeriesColor = clPurple
      Title = 'nu(t,teta2)'
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
    Top = 0
    Width = 569
    Height = 273
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    BottomAxis.Title.Caption = 'mV'
    LeftAxis.Title.Caption = 'Hz'
    Legend.Alignment = laTop
    Legend.ColorWidth = 45
    Legend.LegendStyle = lsSeries
    Legend.ResizeChart = False
    Legend.ShadowSize = 0
    Legend.VertMargin = 1
    View3D = False
    Color = clSkyBlue
    TabOrder = 2
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = 33023
      Title = 'ro(V,teta1)'
      LinePen.Color = clBlue
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
    object Series7: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = 16711808
      Title = 'ro(V,teta2)'
      LinePen.Color = clBlue
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
  object DDSpinEdit8: TDDSpinEdit
    Left = 649
    Top = 17
    Width = 57
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 50.000000000000000000
    TabOrder = 3
    Value = 100.000000000000000000
  end
  object GroupBox1: TGroupBox
    Left = 576
    Top = 288
    Width = 185
    Height = 401
    Caption = 'Parameters of KFP '
    TabOrder = 4
    object Label3: TLabel
      Left = 13
      Top = 20
      Width = 28
      Height = 16
      Caption = 'Nnrn'
    end
    object Label4: TLabel
      Left = 13
      Top = 44
      Width = 42
      Height = 16
      Caption = 'tau, ms'
    end
    object Label5: TLabel
      Left = 13
      Top = 68
      Width = 55
      Height = 16
      Caption = 'R, MOhm'
    end
    object Label6: TLabel
      Left = 13
      Top = 92
      Width = 54
      Height = 16
      Caption = 'Vrev, mV'
    end
    object Label7: TLabel
      Left = 13
      Top = 116
      Width = 57
      Height = 16
      Caption = 'Vrest, mV'
    end
    object Label8: TLabel
      Left = 13
      Top = 140
      Width = 45
      Height = 16
      Caption = 'Vth, mV'
    end
    object Label9: TLabel
      Left = 13
      Top = 164
      Width = 42
      Height = 16
      Caption = 'V0, mV'
    end
    object Label10: TLabel
      Left = 13
      Top = 188
      Width = 17
      Height = 16
      Caption = 'Nv'
    end
    object Label11: TLabel
      Left = 13
      Top = 212
      Width = 61
      Height = 16
      Caption = 'Vstep, mV'
    end
    object Label12: TLabel
      Left = 13
      Top = 236
      Width = 55
      Height = 16
      Caption = 'tstep, mV'
    end
    object Label13: TLabel
      Left = 13
      Top = 260
      Width = 73
      Height = 16
      Caption = 'sgm2, mV^2'
    end
    object Label14: TLabel
      Left = 13
      Top = 284
      Width = 29
      Height = 16
      Caption = 'teta1'
    end
    object Label18: TLabel
      Left = 13
      Top = 308
      Width = 29
      Height = 16
      Caption = 'teta2'
    end
    object Label19: TLabel
      Left = 13
      Top = 332
      Width = 69
      Height = 16
      Caption = 't_Teta2, ms'
    end
    object Label33: TLabel
      Left = 13
      Top = 356
      Width = 59
      Height = 16
      Caption = 'Noise, pA'
    end
    object DDSpinEdit1: TDDSpinEdit
      Left = 104
      Top = 16
      Width = 73
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Increment = 1.000000000000000000
      ParentFont = False
      TabOrder = 0
      Value = 1.000000000000000000
    end
    object DDSpinEdit2: TDDSpinEdit
      Left = 104
      Top = 40
      Width = 73
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Increment = 0.050000000000000000
      ParentFont = False
      TabOrder = 1
      Value = 0.800000000000000000
    end
    object DDSpinEdit3: TDDSpinEdit
      Left = 104
      Top = 64
      Width = 73
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Increment = 0.050000000000000000
      ParentFont = False
      TabOrder = 2
      Value = 0.800000000000000000
    end
    object DDSpinEdit4: TDDSpinEdit
      Left = 104
      Top = 88
      Width = 73
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Increment = 1.000000000000000000
      ParentFont = False
      TabOrder = 3
      Value = 0.800000000000000000
    end
    object DDSpinEdit5: TDDSpinEdit
      Left = 104
      Top = 112
      Width = 73
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Increment = 1.000000000000000000
      ParentFont = False
      TabOrder = 4
      Value = 0.800000000000000000
    end
    object DDSpinEdit6: TDDSpinEdit
      Left = 104
      Top = 136
      Width = 73
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Increment = 1.000000000000000000
      ParentFont = False
      TabOrder = 5
      Value = 0.800000000000000000
    end
    object DDSpinEdit7: TDDSpinEdit
      Left = 104
      Top = 160
      Width = 73
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Increment = 5.000000000000000000
      ParentFont = False
      TabOrder = 6
      Value = 0.800000000000000000
    end
    object DDSpinEdit9: TDDSpinEdit
      Left = 104
      Top = 184
      Width = 73
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Increment = 10.000000000000000000
      ParentFont = False
      TabOrder = 7
      Value = 1.000000000000000000
    end
    object DDSpinEdit10: TDDSpinEdit
      Left = 104
      Top = 208
      Width = 73
      Height = 26
      StrWidth = 2
      StrDecimals = 4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Increment = 0.050000000000000000
      ParentFont = False
      TabOrder = 8
      Value = 0.800000000000000000
    end
    object DDSpinEdit11: TDDSpinEdit
      Left = 104
      Top = 232
      Width = 73
      Height = 26
      StrWidth = 2
      StrDecimals = 4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Increment = 0.050000000000000000
      ParentFont = False
      TabOrder = 9
      Value = 0.800000000000000000
    end
    object DDSpinEdit12: TDDSpinEdit
      Left = 104
      Top = 256
      Width = 73
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Increment = 1.000000000000000000
      ParentFont = False
      TabOrder = 10
      Value = 0.800000000000000000
    end
    object DDSpinEdit13: TDDSpinEdit
      Left = 104
      Top = 280
      Width = 73
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Increment = 15.000000000000000000
      ParentFont = False
      TabOrder = 11
      Value = 1.000000000000000000
    end
    object DDSpinEdit17: TDDSpinEdit
      Left = 104
      Top = 304
      Width = 73
      Height = 26
      StrWidth = 2
      StrDecimals = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Increment = 15.000000000000000000
      ParentFont = False
      TabOrder = 12
      Value = 1.000000000000000000
    end
    object DDSpinEdit18: TDDSpinEdit
      Left = 104
      Top = 328
      Width = 73
      Height = 26
      StrWidth = 2
      StrDecimals = 4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Increment = 0.050000000000000000
      ParentFont = False
      TabOrder = 13
      Value = 0.800000000000000000
    end
    object DDSpinEdit34: TDDSpinEdit
      Left = 104
      Top = 352
      Width = 73
      Height = 26
      StrWidth = 2
      StrDecimals = 4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Increment = 0.050000000000000000
      ParentFont = False
      TabOrder = 14
      Value = 0.800000000000000000
    end
    object CheckBox2: TCheckBox
      Left = 11
      Top = 378
      Width = 109
      Height = 17
      Alignment = taLeftJustify
      BiDiMode = bdLeftToRight
      Caption = 'sgm=k(1+s)'
      ParentBiDiMode = False
      TabOrder = 15
    end
  end
  object Button2: TButton
    Left = 592
    Top = 256
    Width = 153
    Height = 25
    Caption = 'KFP'
    TabOrder = 5
    OnClick = Button2Click
  end
  object GroupBox2: TGroupBox
    Left = 576
    Top = 760
    Width = 185
    Height = 105
    Caption = 'Linearization of Johannesma'
    TabOrder = 6
    object Label15: TLabel
      Left = 13
      Top = 25
      Width = 79
      Height = 16
      Caption = 'k_Joh, Hz/pA'
    end
    object Label16: TLabel
      Left = 13
      Top = 49
      Width = 62
      Height = 16
      Caption = 'I0_Joh, pA'
    end
    object Label17: TLabel
      Left = 13
      Top = 73
      Width = 67
      Height = 16
      Caption = 'I_about, pA'
    end
    object DDSpinEdit14: TDDSpinEdit
      Left = 104
      Top = 23
      Width = 73
      Height = 26
      StrWidth = 2
      StrDecimals = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Increment = 0.050000000000000000
      ParentFont = False
      TabOrder = 0
      Value = 0.800000000000000000
      OnChange = DDSpinEdit14Change
    end
    object DDSpinEdit15: TDDSpinEdit
      Left = 104
      Top = 47
      Width = 73
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Increment = 0.050000000000000000
      ParentFont = False
      TabOrder = 1
      Value = 0.800000000000000000
      OnChange = DDSpinEdit15Change
    end
    object DDSpinEdit16: TDDSpinEdit
      Left = 104
      Top = 71
      Width = 73
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Increment = 0.050000000000000000
      ParentFont = False
      TabOrder = 2
      Value = 140.000000000000000000
      OnDblClick = DDSpinEdit16DblClick
    end
  end
  object ComboBox1: TComboBox
    Left = 576
    Top = 728
    Width = 185
    Height = 24
    ItemHeight = 16
    ItemIndex = 0
    TabOrder = 7
    Text = 'FR with Johannesma+shunt'
    Items.Strings = (
      'FR with Johannesma+shunt'
      'FR with Plusik+shunt'
      'FR, Classic Ring')
  end
  object Button3: TButton
    Left = 592
    Top = 696
    Width = 153
    Height = 25
    Caption = 'FR'
    TabOrder = 8
    OnClick = Button3Click
  end
  object GroupBox4: TGroupBox
    Left = 576
    Top = 88
    Width = 273
    Height = 161
    Caption = 'Connections '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -10
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    object Label21: TLabel
      Left = 9
      Top = 36
      Width = 10
      Height = 16
      Caption = 'I0'
    end
    object Label22: TLabel
      Left = 9
      Top = 60
      Width = 10
      Height = 16
      Caption = 'I1'
    end
    object Label23: TLabel
      Left = 9
      Top = 84
      Width = 14
      Height = 16
      Caption = 'J0'
    end
    object Label24: TLabel
      Left = 9
      Top = 108
      Width = 14
      Height = 16
      Caption = 'J1'
    end
    object Label26: TLabel
      Left = 32
      Top = 16
      Width = 212
      Height = 16
      Caption = '-----"+"-----       ------------ KFP ------------'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object Label28: TLabel
      Left = 9
      Top = 132
      Width = 17
      Height = 16
      Caption = 'fi_r'
    end
    object Label29: TLabel
      Left = 249
      Top = 36
      Width = 15
      Height = 16
      Caption = 'K0'
    end
    object Label30: TLabel
      Left = 249
      Top = 60
      Width = 15
      Height = 16
      Caption = 'K1'
    end
    object Label31: TLabel
      Left = 249
      Top = 84
      Width = 14
      Height = 16
      Caption = 'L0'
    end
    object Label32: TLabel
      Left = 249
      Top = 108
      Width = 14
      Height = 16
      Caption = 'L1'
    end
    object DDSpinEdit20: TDDSpinEdit
      Left = 32
      Top = 33
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 1.000000000000000000
      TabOrder = 0
      Value = 1.000000000000000000
      OnDblClick = DDSpinEdit20DblClick
      OnClickChange = DDSpinEdit20ClickChange
    end
    object DDSpinEdit21: TDDSpinEdit
      Left = 32
      Top = 56
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 3
      Increment = 1.000000000000000000
      TabOrder = 1
      Value = 0.180000000000000000
      OnDblClick = DDSpinEdit21DblClick
      OnClickChange = DDSpinEdit21ClickChange
    end
    object DDSpinEdit22: TDDSpinEdit
      Left = 32
      Top = 81
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 4
      Increment = 1.000000000000000000
      TabOrder = 2
      Value = -0.400000000000000000
      OnDblClick = DDSpinEdit22DblClick
      OnClickChange = DDSpinEdit22ClickChange
    end
    object DDSpinEdit23: TDDSpinEdit
      Left = 32
      Top = 104
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 1.000000000000000000
      TabOrder = 3
      Value = 4.000000000000000000
      OnDblClick = DDSpinEdit23DblClick
      OnClickChange = DDSpinEdit23ClickChange
    end
    object DDSpinEdit25: TDDSpinEdit
      Left = 112
      Top = 33
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Enabled = False
      Increment = 1.000000000000000000
      TabOrder = 4
      Value = 1.000000000000000000
    end
    object DDSpinEdit26: TDDSpinEdit
      Left = 112
      Top = 57
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Enabled = False
      Increment = 1.000000000000000000
      TabOrder = 5
      Value = 1.000000000000000000
    end
    object DDSpinEdit27: TDDSpinEdit
      Left = 112
      Top = 81
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Enabled = False
      Increment = 1.000000000000000000
      TabOrder = 6
      Value = 1.000000000000000000
    end
    object DDSpinEdit28: TDDSpinEdit
      Left = 112
      Top = 105
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Enabled = False
      Increment = 1.000000000000000000
      TabOrder = 7
      Value = 1.000000000000000000
    end
    object DDSpinEdit29: TDDSpinEdit
      Left = 32
      Top = 128
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 1.000000000000000000
      TabOrder = 8
      Value = 1.000000000000000000
    end
    object ComboBox2: TComboBox
      Left = 112
      Top = 128
      Width = 65
      Height = 24
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 9
      Text = 'cos'
      OnChange = ComboBox2Change
      Items.Strings = (
        'cos'
        'exp')
    end
    object DDSpinEdit30: TDDSpinEdit
      Left = 176
      Top = 33
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 1.000000000000000000
      TabOrder = 10
      Value = 1.000000000000000000
      OnChange = DDSpinEdit30Change
      OnDblClick = DDSpinEdit30DblClick
    end
    object DDSpinEdit31: TDDSpinEdit
      Left = 176
      Top = 57
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 1.000000000000000000
      TabOrder = 11
      Value = 1.000000000000000000
      OnChange = DDSpinEdit31Change
      OnDblClick = DDSpinEdit31DblClick
    end
    object DDSpinEdit32: TDDSpinEdit
      Left = 176
      Top = 81
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 1.000000000000000000
      TabOrder = 12
      Value = 1.000000000000000000
      OnChange = DDSpinEdit32Change
      OnDblClick = DDSpinEdit32DblClick
    end
    object DDSpinEdit33: TDDSpinEdit
      Left = 176
      Top = 105
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 2
      Increment = 1.000000000000000000
      TabOrder = 13
      Value = 1.000000000000000000
      OnChange = DDSpinEdit33Change
      OnDblClick = DDSpinEdit33DblClick
    end
  end
  object Chart4: TChart
    Left = 0
    Top = 0
    Width = 568
    Height = 273
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    BottomAxis.Title.Caption = 'pA'
    LeftAxis.Title.Caption = 'Hz'
    Legend.Alignment = laTop
    Legend.ColorWidth = 30
    Legend.LegendStyle = lsSeries
    Legend.ShadowSize = 0
    View3D = False
    Color = clSkyBlue
    TabOrder = 10
    Visible = False
    object LineSeries1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'nu_Joh'
      LinePen.Width = 2
      LinePen.Visible = False
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
    object LineSeries2: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clGreen
      Title = 'nu_not-noisy_LIF'
      LinePen.Width = 2
      LinePen.Visible = False
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
    object Series10: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = 33023
      Title = 'nu_Plus'
      LinePen.Width = 2
      LinePen.Visible = False
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
    object Series9: TPointSeries
      Marks.ArrowLength = 0
      Marks.Visible = False
      SeriesColor = clBlue
      Pointer.Brush.Color = clRed
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Pen.Visible = False
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
    object Series8: TPointSeries
      Marks.ArrowLength = 0
      Marks.Visible = False
      SeriesColor = clYellow
      Pointer.Brush.Color = clYellow
      Pointer.InflateMargins = True
      Pointer.Pen.Visible = False
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
    object Series11: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'nu_full_neuron'
      LinePen.Width = 2
      LinePen.Visible = False
      Pointer.Brush.Color = clWhite
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
  end
  object DDSpinEdit19: TDDSpinEdit
    Left = 649
    Top = 41
    Width = 57
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 1.000000000000000000
    TabOrder = 11
    Value = 200.000000000000000000
  end
  object DDSpinEdit24: TDDSpinEdit
    Left = 649
    Top = 65
    Width = 57
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 1.000000000000000000
    TabOrder = 12
    Value = 100.000000000000000000
  end
  object Button1: TButton
    Left = 592
    Top = 0
    Width = 153
    Height = 17
    Caption = 'Default parameters'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -10
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
    OnClick = Button1Click
  end
  object CheckBox1: TCheckBox
    Left = 592
    Top = 256
    Width = 65
    Height = 17
    Caption = 'Pause'
    TabOrder = 14
    Visible = False
  end
  object ComboBox3: TComboBox
    Left = 752
    Top = 256
    Width = 97
    Height = 24
    ItemHeight = 16
    ItemIndex = 1
    TabOrder = 15
    Text = 'Progonka'
    Items.Strings = (
      'Explicit'
      'Progonka')
  end
  object DDSpinEdit35: TDDSpinEdit
    Left = 792
    Top = 17
    Width = 57
    Height = 26
    StrWidth = 2
    StrDecimals = 2
    Increment = 50.000000000000000000
    TabOrder = 16
  end
  object DDSpinEdit36: TDDSpinEdit
    Left = 792
    Top = 41
    Width = 57
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 1.000000000000000000
    TabOrder = 17
    Value = 1000.000000000000000000
  end
  object DDSpinEdit37: TDDSpinEdit
    Left = 792
    Top = 65
    Width = 57
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 1.000000000000000000
    TabOrder = 18
    Value = 100.000000000000000000
    OnDblClick = DDSpinEdit37DblClick
  end
  object Button4: TButton
    Left = 752
    Top = 696
    Width = 97
    Height = 25
    Caption = 'Plot  nu(I,s)'
    TabOrder = 19
    OnClick = Button4Click
  end
end
