object LGN_Form15: TLGN_Form15
  Left = 1437
  Top = 663
  Width = 481
  Height = 500
  AutoSize = True
  Caption = 'LGN_Form15: 2D-lattice'
  Color = 11193599
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  inline Frame15: TFrame15
    Left = 0
    Top = 0
    Width = 473
    Height = 465
    AutoSize = True
    Color = clMoneyGreen
    ParentColor = False
    TabOrder = 0
    Visible = False
    inherited Label2: TLabel
      Left = 249
    end
    inherited Chart1: TChart
      Width = 473
      Height = 433
      BottomAxis.Automatic = False
      BottomAxis.AutomaticMaximum = False
      BottomAxis.AutomaticMinimum = False
      BottomAxis.Maximum = 100.000000000000000000
      LeftAxis.Automatic = False
      LeftAxis.AutomaticMaximum = False
      LeftAxis.AutomaticMinimum = False
      LeftAxis.Maximum = 100.000000000000000000
      LeftAxis.Minimum = 0.000000000000000000
      RightAxis.Automatic = False
      RightAxis.AutomaticMaximum = False
      RightAxis.AutomaticMinimum = False
      RightAxis.Maximum = 1.000000000000000000
      RightAxis.Minimum = 0.000000000000000000
      RightAxis.Visible = False
      Color = clMoneyGreen
      inherited Series2: TBubbleSeries
        Pointer.HorizSize = 443
        Pointer.VertSize = 443
      end
      inherited Series6: TPointSeries
        Pointer.Brush.Color = 10485760
        Pointer.HorizSize = 6
        Pointer.Pen.Color = 16744448
        Pointer.Style = psTriangle
        Pointer.VertSize = 6
      end
      inherited Series8: TPointSeries
        Pointer.Brush.Color = 33023
      end
      inherited Series9: TLineSeries
        LinePen.Width = 2
      end
      inherited Series11: TLineSeries
        SeriesColor = 16744448
      end
    end
    inherited Chart2: TChart
      Color = 11193548
      inherited Series3: TBubbleSeries
        Pointer.HorizSize = 2245
        Pointer.VertSize = 2245
      end
    end
    inherited ComboBox1: TComboBox
      Left = 328
      Width = 145
      ItemIndex = -1
      Visible = False
      Items.Strings = (
        'zScreen'
        'zD_cen'
        'zD_sur'
        'zLGN_cen'
        'zLGN_sur'
        'zLGN_subthr'
        'zLGN')
    end
  end
  object Button5: TButton
    Left = 416
    Top = 32
    Width = 51
    Height = 17
    Caption = 'BMP'
    TabOrder = 1
    OnClick = Button5Click
  end
end
