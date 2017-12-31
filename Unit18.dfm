object Form18: TForm18
  Left = 639
  Top = 726
  Width = 865
  Height = 436
  AutoSize = True
  Caption = 'Form18: Inspector'
  Color = 11193548
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
    Left = 16
    Top = 8
    Width = 137
    Height = 16
    Caption = 'Column coordinates, i,j:'
  end
  object Label2: TLabel
    Left = 16
    Top = 32
    Width = 84
    Height = 16
    Caption = 'Population, ip:'
  end
  object Label3: TLabel
    Left = 16
    Top = 56
    Width = 135
    Height = 16
    Caption = 'Coordinate in t*-space:'
  end
  object Label4: TLabel
    Left = 280
    Top = 0
    Width = 91
    Height = 16
    Caption = 'See variable of'
  end
  object Label5: TLabel
    Left = 16
    Top = 80
    Width = 94
    Height = 16
    Caption = 'Synapse name:'
  end
  object Label6: TLabel
    Left = 16
    Top = 104
    Width = 163
    Height = 16
    Caption = 'Postsynaptic population, jp:'
  end
  object DDSpinEdit1: TDDSpinEdit
    Left = 164
    Top = 0
    Width = 45
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 1.000000000000000000
    TabOrder = 0
    Value = 1.000000000000000000
  end
  object DDSpinEdit2: TDDSpinEdit
    Left = 212
    Top = 0
    Width = 45
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 1.000000000000000000
    TabOrder = 1
    Value = 1.000000000000000000
  end
  object DDSpinEdit3: TDDSpinEdit
    Left = 164
    Top = 24
    Width = 45
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 1.000000000000000000
    TabOrder = 2
    Value = 1.000000000000000000
  end
  object DDSpinEdit4: TDDSpinEdit
    Left = 164
    Top = 48
    Width = 45
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 1.000000000000000000
    TabOrder = 3
    Value = 100.000000000000000000
  end
  object ComboBox1: TComboBox
    Left = 280
    Top = 16
    Width = 113
    Height = 24
    ItemHeight = 16
    ItemIndex = 1
    TabOrder = 4
    Text = 'Population'
    Items.Strings = (
      'Column'
      'Population'
      'Neuron'
      'Synapse')
  end
  object ComboBox2: TComboBox
    Left = 280
    Top = 40
    Width = 145
    Height = 24
    Hint = 'Population'
    ItemHeight = 16
    ItemIndex = 10
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Text = 'U'
    Items.Strings = (
      'uE'
      'sE'
      'uI'
      'sI'
      'uu'
      'ss'
      'tt'
      'Iind        '
      'nu'
      'Isyn'
      'U'
      'dUdt'
      'Bum'
      'tBum'
      'Norm'
      'IsynE'
      'IsynI'
      'sE/(gL+ss)'
      'Uav'
      'VT[PP.Nts]')
  end
  object ComboBox3: TComboBox
    Left = 120
    Top = 72
    Width = 145
    Height = 24
    ItemHeight = 16
    ItemIndex = 0
    TabOrder = 6
    Text = 'AMP3 on P'
    Items.Strings = (
      'AMP3 on P'
      'AMP3 on I'
      'AMPA on P'
      'AMPA on I'
      'AMPA on P23 de 23'
      'AMPA on I23 de 23'
      'AMPA on P de 23'
      'AMPA on I de 23'
      'AMPA on P23'
      'AMPA on I23'
      'AMP3 on P23'
      'AMP3 on I23'
      'GAB3 on P'
      'GAB3 on I'
      'GABA on P'
      'GABA on I'
      'GABA on P23 de 23'
      'GABA on I23 de 23'
      'GABA on P de 23'
      'GABA on I de 23'
      'GABA on P23'
      'GABA on I23'
      'GAB3 on P23'
      'GAB3 on I23'
      'NMD3 on P'
      'NMD3 on I'
      'NMDA on P'
      'NMDA on I'
      'NMDA on P23 de 23'
      'NMDA on I23 de 23'
      'NMDA on P de 23'
      'NMDA on I de 23'
      'NMDA on P23'
      'NMDA on I23'
      'NMD3 on P23'
      'NMD3 on I23'
      'GABB on P'
      'GABB on I')
  end
  object ComboBox4: TComboBox
    Left = 280
    Top = 64
    Width = 145
    Height = 24
    Hint = 'Neuron'
    ItemHeight = 16
    ItemIndex = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    Text = 'V'
    Items.Strings = (
      'indic'
      'V'
      'Conductance'
      'Ca'
      'Vold'
      'Im'
      'PSC'
      'Isyn'
      'IsynE'
      'IsynI'
      'IsynE_old'
      'IsynI_old'
      'VatE'
      'DVDt'
      'ddV'
      'Thr'
      'tAP'
      'ISI0'
      'mmR'
      'hhR'
      'mm'
      'nn'
      'hh'
      'ii'
      'yK'
      'yKA'
      'nM'
      'nA'
      'lA'
      'yKsl'
      'mCaH'
      'hCaH'
      'kCaH'
      'nKCa'
      'wADP'
      'wAHP'
      'mCaT'
      'hCaT'
      'mBst'
      'mNaP'
      'xD'
      'yD'
      'gNMDA')
  end
  object ComboBox5: TComboBox
    Left = 280
    Top = 88
    Width = 145
    Height = 24
    Hint = 'Synapse'
    ItemHeight = 16
    ItemIndex = 1
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    Text = 'm'
    Items.Strings = (
      'g'
      'm'
      'U'
      'W'
      'eM'
      'UeM'
      'WeM'
      'xD')
  end
  object Chart1: TChart
    Left = 0
    Top = 144
    Width = 425
    Height = 257
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    BottomAxis.Title.Caption = 'ms'
    Legend.Visible = False
    View3D = False
    Color = 11193548
    TabOrder = 9
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clBlack
      LinePen.Width = 2
      Pointer.Brush.Color = 4227327
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
  end
  object Button1: TButton
    Left = 192
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Clear'
    TabOrder = 10
    OnClick = Button1Click
  end
  object ComboBox6: TComboBox
    Left = 280
    Top = 112
    Width = 145
    Height = 24
    Hint = 'Column'
    ItemHeight = 16
    ItemIndex = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    Text = 'rext'
    Items.Strings = (
      'rext'
      'Q[ip]'
      'dQdt[ip]'
      'r[ip,jp]'
      'rn[ip,jp]'
      'ro[ip,jp]'
      'u[ip,jp]'
      'un[ip,jp]'
      'v[ip,jp]'
      'vn[ip,jp]'
      'w[ip,jp]'
      '')
  end
  object DDSpinEdit5: TDDSpinEdit
    Left = 212
    Top = 96
    Width = 45
    Height = 26
    StrWidth = 2
    StrDecimals = 0
    Increment = 1.000000000000000000
    TabOrder = 12
    Value = 1.000000000000000000
  end
  object CheckBox1: TCheckBox
    Left = 16
    Top = 128
    Width = 145
    Height = 17
    Caption = 'distribution versus i'
    TabOrder = 13
    OnClick = CheckBox1Click
  end
  object Chart2: TChart
    Left = 432
    Top = 144
    Width = 425
    Height = 257
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    BottomAxis.Title.Caption = 'i'
    Legend.Visible = False
    View3D = False
    Color = 11193548
    TabOrder = 14
    Visible = False
    object Series2: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clBlack
      Title = 'Series2'
      LinePen.Width = 2
      Pointer.Brush.Color = 4227327
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
  end
end
