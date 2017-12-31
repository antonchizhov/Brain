object Form11: TForm11
  Left = 336
  Top = 539
  Width = 534
  Height = 592
  Caption = 'Form11- Nullclines'
  Color = clBackground
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object Chart1: TChart
    Left = 8
    Top = 200
    Width = 513
    Height = 353
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
    BottomAxis.LabelsFont.Color = clBlack
    BottomAxis.LabelsFont.Height = -17
    BottomAxis.LabelsFont.Name = 'Arial'
    BottomAxis.LabelsFont.Style = []
    BottomAxis.Title.Caption = 'nuE, Hz'
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
    LeftAxis.Title.Caption = 'nuI, Hz'
    LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
    LeftAxis.Title.Font.Color = clBlack
    LeftAxis.Title.Font.Height = -17
    LeftAxis.Title.Font.Name = 'Arial'
    LeftAxis.Title.Font.Style = []
    Legend.Alignment = laTop
    Legend.ColorWidth = 60
    Legend.LegendStyle = lsSeries
    Legend.ShadowSize = 0
    Legend.TopPos = 0
    RightAxis.LabelsFont.Charset = DEFAULT_CHARSET
    RightAxis.LabelsFont.Color = clBlack
    RightAxis.LabelsFont.Height = -17
    RightAxis.LabelsFont.Name = 'Arial'
    RightAxis.LabelsFont.Style = []
    RightAxis.Title.Font.Charset = DEFAULT_CHARSET
    RightAxis.Title.Font.Color = clBlack
    RightAxis.Title.Font.Height = -17
    RightAxis.Title.Font.Name = 'Arial'
    RightAxis.Title.Font.Style = []
    View3D = False
    Color = clWhite
    TabOrder = 0
    object Button1: TButton
      Left = 440
      Top = 13
      Width = 59
      Height = 23
      Caption = 'Clear'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 448
      Top = 328
      Width = 49
      Height = 17
      Caption = 'BMP'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 392
      Top = 328
      Width = 59
      Height = 17
      Caption = 'Write'
      TabOrder = 2
      OnClick = Button3Click
    end
    object DDSpinEdit15: TDDSpinEdit
      Left = 112
      Top = 320
      Width = 65
      Height = 26
      StrWidth = 2
      StrDecimals = 4
      Increment = 0.010000000000000000
      TabOrder = 3
      Value = 0.100000000000000000
    end
    object StaticText14: TStaticText
      Left = 9
      Top = 322
      Width = 100
      Height = 24
      Caption = 'vector scale'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clPurple
      Title = 'nuE(nuI)'
      LinePen.Width = 2
      LinePen.Visible = False
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Pen.Color = -1
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
    object Series2: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = 33023
      Title = 'nuE(nuI)'
      LinePen.Width = 2
      LinePen.Visible = False
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Pen.Color = -1
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
    object Series3: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clGreen
      Title = 'nuE(nuI)'
      LinePen.Width = 2
      LinePen.Visible = False
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Pen.Color = -1
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
    object Series4: TArrowSeries
      Marks.ArrowLength = 0
      Marks.Frame.Visible = False
      Marks.Transparent = True
      Marks.Visible = False
      SeriesColor = 8404992
      Title = 'Vectors'
      Pointer.InflateMargins = False
      Pointer.Style = psRectangle
      Pointer.VertSize = 6
      Pointer.Visible = True
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      EndXValues.DateTime = True
      EndXValues.Name = 'EndX'
      EndXValues.Multiplier = 1.000000000000000000
      EndXValues.Order = loNone
      EndYValues.DateTime = False
      EndYValues.Name = 'EndY'
      EndYValues.Multiplier = 1.000000000000000000
      EndYValues.Order = loNone
      StartXValues.DateTime = True
      StartXValues.Name = 'X'
      StartXValues.Multiplier = 1.000000000000000000
      StartXValues.Order = loAscending
      StartYValues.DateTime = False
      StartYValues.Name = 'Y'
      StartYValues.Multiplier = 1.000000000000000000
      StartYValues.Order = loNone
    end
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 513
    Height = 185
    ActivePage = TabSheet2
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Inject current'
      object Memo1: TMemo
        Left = 8
        Top = 8
        Width = 289
        Height = 137
        Lines.Strings = (
          'In order to calculate nullclines as steady-state '
          'solutions of 0-d system, set proper stimulation '
          'Qns, rate and range of change for I_ind and '
          'press the button "0d" on the main form. I_ind will '
          'follow a ramp with maximum at t1 and minimum '
          'at t2, starting at t0.'
          'Choose "I_ind=0 for E-cells" to plot nuE(nuI).'
          'Choose "I_ind=0 for I-cells" to plot nuI(nuE).')
        TabOrder = 0
      end
      object GroupBox1: TGroupBox
        Left = 304
        Top = 0
        Width = 201
        Height = 145
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object DDSpinEdit1: TDDSpinEdit
          Left = 128
          Top = 16
          Width = 65
          Height = 31
          StrWidth = 2
          StrDecimals = 0
          Increment = 50.000000000000000000
          TabOrder = 0
          Value = 200.000000000000000000
        end
        object DDSpinEdit2: TDDSpinEdit
          Left = 128
          Top = 40
          Width = 65
          Height = 31
          StrWidth = 2
          StrDecimals = 0
          Increment = 50.000000000000000000
          TabOrder = 1
          Value = 2200.000000000000000000
        end
        object DDSpinEdit3: TDDSpinEdit
          Left = 128
          Top = 64
          Width = 65
          Height = 31
          StrWidth = 2
          StrDecimals = 0
          Increment = 50.000000000000000000
          TabOrder = 2
          Value = 5400.000000000000000000
        end
        object DDSpinEdit4: TDDSpinEdit
          Left = 128
          Top = 88
          Width = 65
          Height = 31
          StrWidth = 2
          StrDecimals = 0
          Increment = 50.000000000000000000
          TabOrder = 3
          Value = 500.000000000000000000
        end
        object DDSpinEdit5: TDDSpinEdit
          Left = 128
          Top = 112
          Width = 65
          Height = 31
          StrWidth = 2
          StrDecimals = 0
          Increment = 50.000000000000000000
          TabOrder = 4
          Value = -300.000000000000000000
        end
        object StaticText46: TStaticText
          Left = 9
          Top = 16
          Width = 53
          Height = 24
          Caption = 't0, ms'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object StaticText1: TStaticText
          Left = 9
          Top = 40
          Width = 53
          Height = 24
          Caption = 't1, ms'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object StaticText2: TStaticText
          Left = 9
          Top = 64
          Width = 53
          Height = 24
          Caption = 't2, ms'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object StaticText3: TStaticText
          Left = 9
          Top = 88
          Width = 118
          Height = 24
          Caption = 'I_ind_max, pA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object StaticText4: TStaticText
          Left = 9
          Top = 112
          Width = 114
          Height = 24
          Caption = 'I_ind_min, pA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Vary nuE or nuI'
      ImageIndex = 1
      object Memo2: TMemo
        Left = 8
        Top = 8
        Width = 289
        Height = 137
        Lines.Strings = (
          'In order to calculate nullclines as steady-state '
          'solutions of 0-d system, set proper ranges for '
          'the firing rates and ramp durations and press '
          'the button "0d" on the main form. ')
        TabOrder = 0
      end
      object GroupBox2: TGroupBox
        Left = 304
        Top = 0
        Width = 201
        Height = 145
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object DDSpinEdit6: TDDSpinEdit
          Left = 128
          Top = 16
          Width = 65
          Height = 31
          StrWidth = 2
          StrDecimals = 0
          Increment = 50.000000000000000000
          TabOrder = 0
          Value = 200.000000000000000000
        end
        object DDSpinEdit7: TDDSpinEdit
          Left = 128
          Top = 40
          Width = 65
          Height = 31
          StrWidth = 2
          StrDecimals = 0
          Increment = 50.000000000000000000
          TabOrder = 1
          Value = 1000.000000000000000000
        end
        object DDSpinEdit9: TDDSpinEdit
          Left = 128
          Top = 88
          Width = 65
          Height = 31
          StrWidth = 2
          StrDecimals = 0
          Increment = 10.000000000000000000
          TabOrder = 2
          Value = 100.000000000000000000
        end
        object DDSpinEdit10: TDDSpinEdit
          Left = 128
          Top = 112
          Width = 65
          Height = 31
          StrWidth = 2
          StrDecimals = 0
          Increment = 10.000000000000000000
          TabOrder = 3
          Value = 200.000000000000000000
        end
        object StaticText5: TStaticText
          Left = 9
          Top = 18
          Width = 53
          Height = 24
          Caption = 't0, ms'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object StaticText6: TStaticText
          Left = 9
          Top = 42
          Width = 103
          Height = 24
          Caption = 'duration, ms'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object StaticText8: TStaticText
          Left = 9
          Top = 90
          Width = 110
          Height = 24
          Caption = 'nuE_max, Hz'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object StaticText9: TStaticText
          Left = 9
          Top = 114
          Width = 104
          Height = 24
          Caption = 'nuI_max, Hz'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Just plot'
      ImageIndex = 2
      object Memo3: TMemo
        Left = 8
        Top = 8
        Width = 289
        Height = 137
        Lines.Strings = (
          'Plots trajectory')
        TabOrder = 0
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Vector field'
      ImageIndex = 3
      object GroupBox3: TGroupBox
        Left = 304
        Top = 0
        Width = 201
        Height = 145
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object DDSpinEdit8: TDDSpinEdit
          Left = 128
          Top = 16
          Width = 65
          Height = 31
          StrWidth = 2
          StrDecimals = 0
          Increment = 5.000000000000000000
          TabOrder = 0
          Value = 20.000000000000000000
        end
        object DDSpinEdit11: TDDSpinEdit
          Left = 128
          Top = 40
          Width = 65
          Height = 31
          StrWidth = 2
          StrDecimals = 0
          Increment = 5.000000000000000000
          TabOrder = 1
          Value = 20.000000000000000000
        end
        object StaticText7: TStaticText
          Left = 9
          Top = 18
          Width = 24
          Height = 24
          Caption = 'Nx'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object StaticText10: TStaticText
          Left = 9
          Top = 42
          Width = 24
          Height = 24
          Caption = 'Ny'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object StaticText11: TStaticText
          Left = 9
          Top = 90
          Width = 110
          Height = 24
          Caption = 'nuE_max, Hz'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object StaticText12: TStaticText
          Left = 9
          Top = 114
          Width = 104
          Height = 24
          Caption = 'nuI_max, Hz'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object DDSpinEdit14: TDDSpinEdit
          Left = 128
          Top = 64
          Width = 65
          Height = 31
          StrWidth = 2
          StrDecimals = 0
          Increment = 1.000000000000000000
          TabOrder = 8
          Value = 5.000000000000000000
        end
        object DDSpinEdit12: TDDSpinEdit
          Left = 128
          Top = 88
          Width = 65
          Height = 31
          StrWidth = 2
          StrDecimals = 0
          Increment = 10.000000000000000000
          TabOrder = 6
          Value = 100.000000000000000000
        end
        object DDSpinEdit13: TDDSpinEdit
          Left = 128
          Top = 112
          Width = 65
          Height = 31
          StrWidth = 2
          StrDecimals = 0
          Increment = 10.000000000000000000
          TabOrder = 7
          Value = 200.000000000000000000
        end
        object StaticText13: TStaticText
          Left = 9
          Top = 66
          Width = 111
          Height = 24
          Caption = 'time step, ms'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -17
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
      end
      object Memo4: TMemo
        Left = 8
        Top = 8
        Width = 289
        Height = 137
        Lines.Strings = (
          'Plots vector field of d(nuE)/dt, d(nuI)/dt on a '
          'mesh Nx*Ny. This mesh discretizes the area '
          'with the ranges [0..nuE_max, 0..nuI_max].')
        TabOrder = 1
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'u-s-plot'
      ImageIndex = 4
      OnExit = TabSheet5Exit
      OnShow = TabSheet5Show
    end
  end
  object Chart2: TChart
    Left = 8
    Top = 199
    Width = 513
    Height = 353
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    BottomAxis.LabelsFont.Charset = DEFAULT_CHARSET
    BottomAxis.LabelsFont.Color = clBlack
    BottomAxis.LabelsFont.Height = -17
    BottomAxis.LabelsFont.Name = 'Arial'
    BottomAxis.LabelsFont.Style = []
    BottomAxis.Title.Caption = 'u/g_L, mV'
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
    LeftAxis.Title.Caption = 's/g_L'
    LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
    LeftAxis.Title.Font.Color = clBlack
    LeftAxis.Title.Font.Height = -17
    LeftAxis.Title.Font.Name = 'Arial'
    LeftAxis.Title.Font.Style = []
    Legend.Alignment = laTop
    Legend.ColorWidth = 60
    Legend.LegendStyle = lsSeries
    Legend.ShadowSize = 0
    Legend.TopPos = 0
    RightAxis.LabelsFont.Charset = DEFAULT_CHARSET
    RightAxis.LabelsFont.Color = clBlack
    RightAxis.LabelsFont.Height = -17
    RightAxis.LabelsFont.Name = 'Arial'
    RightAxis.LabelsFont.Style = []
    RightAxis.Title.Font.Charset = DEFAULT_CHARSET
    RightAxis.Title.Font.Color = clBlack
    RightAxis.Title.Font.Height = -17
    RightAxis.Title.Font.Name = 'Arial'
    RightAxis.Title.Font.Style = []
    View3D = False
    Color = clWhite
    TabOrder = 2
    object Button4: TButton
      Left = 440
      Top = 13
      Width = 59
      Height = 23
      Caption = 'Clear'
      TabOrder = 0
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 448
      Top = 328
      Width = 49
      Height = 17
      Caption = 'BMP'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button6: TButton
      Left = 392
      Top = 328
      Width = 59
      Height = 17
      Caption = 'Write'
      TabOrder = 2
      OnClick = Button3Click
    end
    object LineSeries1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'trajectory for E'
      LinePen.Width = 2
      LinePen.Visible = False
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Pen.Color = -1
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
    object LineSeries2: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = 12615680
      Title = 'trajectory for I'
      LinePen.Width = 2
      LinePen.Visible = False
      Pointer.HorizSize = 3
      Pointer.InflateMargins = True
      Pointer.Pen.Color = -1
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
end
