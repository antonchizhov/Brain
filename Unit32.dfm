object Form32: TForm32
  Left = 1405
  Top = 583
  Width = 511
  Height = 548
  AutoSize = True
  Caption = 'Form32: CV dependence on I_ind'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 503
    Height = 513
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'CV dependence on I_ind'
      object Chart1: TChart
        Left = 0
        Top = 148
        Width = 492
        Height = 326
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'TChart')
        Title.Visible = False
        BottomAxis.Title.Caption = 'I_ind, pA'
        LeftAxis.Title.Caption = 'nu, Hz'
        Legend.Alignment = laTop
        Legend.ColorWidth = 60
        Legend.LegendStyle = lsSeries
        Legend.ShadowSize = 0
        RightAxis.Title.Caption = 'CV, units'
        View3D = False
        TabOrder = 0
        object Button1: TButton
          Left = 432
          Top = 14
          Width = 58
          Height = 22
          Caption = 'Clear'
          TabOrder = 0
          OnClick = Button1Click
        end
        object Button3: TButton
          Left = 432
          Top = 310
          Width = 58
          Height = 16
          Caption = 'Write'
          TabOrder = 1
          OnClick = Button3Click
        end
        object Series1: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = 8454016
          Title = 'nu'
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
        object Series2: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'CV'
          VertAxis = aRightAxis
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
        object Series3: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clSilver
          Title = 'nu'
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
        object Series4: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          Title = 'nu'
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
      object GroupBox1: TGroupBox
        Left = 293
        Top = 0
        Width = 201
        Height = 145
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
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
          Value = 10.000000000000000000
        end
        object DDSpinEdit2: TDDSpinEdit
          Left = 128
          Top = 41
          Width = 65
          Height = 31
          StrWidth = 2
          StrDecimals = 0
          Increment = 50.000000000000000000
          TabOrder = 1
          Value = 100.000000000000000000
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
          Value = 2100.000000000000000000
        end
        object DDSpinEdit4: TDDSpinEdit
          Left = 128
          Top = 89
          Width = 65
          Height = 31
          StrWidth = 2
          StrDecimals = 0
          Increment = 50.000000000000000000
          TabOrder = 3
          Value = 310.000000000000000000
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
          Value = 10.000000000000000000
        end
        object StaticText46: TStaticText
          Left = 9
          Top = 16
          Width = 53
          Height = 24
          Caption = 't0, ms'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -18
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object StaticText1: TStaticText
          Left = 9
          Top = 41
          Width = 53
          Height = 24
          Caption = 't1, ms'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -18
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
          Font.Height = -18
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object StaticText3: TStaticText
          Left = 9
          Top = 89
          Width = 118
          Height = 24
          Caption = 'I_ind_max, pA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -18
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
          Font.Height = -18
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
      end
    end
  end
end
