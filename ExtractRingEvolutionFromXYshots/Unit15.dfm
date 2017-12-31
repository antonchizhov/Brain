object Form15: TForm15
  Left = 6
  Top = 532
  Width = 509
  Height = 497
  AutoSize = True
  Caption = 'Form15: 2D-lattice'
  Color = 11193599
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 120
  TextHeight = 16
  inline Frame15: TFrame15
    Left = 0
    Top = 0
    Width = 490
    Height = 452
    TabOrder = 0
    inherited Label2: TLabel
      Left = 249
    end
    inherited Chart1: TChart
      BottomAxis.Automatic = False
      BottomAxis.AutomaticMaximum = False
      BottomAxis.AutomaticMinimum = False
      BottomAxis.Maximum = 100.000000000000000000
      LeftAxis.Automatic = False
      LeftAxis.AutomaticMaximum = False
      LeftAxis.AutomaticMinimum = False
      LeftAxis.Maximum = 100.000000000000000000
      RightAxis.Automatic = False
      RightAxis.AutomaticMaximum = False
      RightAxis.AutomaticMinimum = False
      RightAxis.Maximum = 1.000000000000000000
      Color = 11193599
      inherited Series2: TBubbleSeries
        Pointer.HorizSize = 516
        Pointer.VertSize = 516
      end
    end
    inherited Chart2: TChart
      Color = 11193548
      inherited Series3: TBubbleSeries
        Pointer.HorizSize = 1840
        Pointer.VertSize = 1840
      end
    end
    inherited ComboBox1: TComboBox
      Left = 313
      Width = 176
      Items.Strings = (
        'nu1'
        'nu2'
        'nu3'
        'nu4'
        'U1'
        'U2'
        'U3'
        'U4'
        'uE1'
        'uE2'
        'uE3'
        'uE4'
        'rext'
        'PinWheels'
        'from Inspector'
        'VisualStimulus'
        'PatchyConnections')
    end
  end
  object Button1: TButton
    Left = 440
    Top = 32
    Width = 51
    Height = 17
    Caption = 'BMP'
    TabOrder = 1
    OnClick = Button1Click
  end
end
