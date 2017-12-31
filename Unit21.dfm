object Form21: TForm21
  Left = 242
  Top = 97
  Width = 577
  Height = 220
  AutoSize = True
  Caption = 'Form21: Stereo input'
  Color = 11193599
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  PixelsPerInch = 120
  TextHeight = 16
  object RadioGroup1: TRadioGroup
    Left = 0
    Top = 0
    Width = 137
    Height = 73
    Caption = 'Visualize'
    ItemIndex = 1
    Items.Strings = (
      'Left eye'
      'Right eye')
    TabOrder = 0
  end
  object RadioGroup2: TRadioGroup
    Left = 192
    Top = 80
    Width = 185
    Height = 105
    Caption = 'Image in focus'
    ItemIndex = 0
    Items.Strings = (
      'Top edge'
      'Moving Edge'
      'Bar'
      'Gratings')
    TabOrder = 1
  end
  object RadioGroup3: TRadioGroup
    Left = 0
    Top = 80
    Width = 185
    Height = 105
    Caption = 'Left eye background'
    ItemIndex = 0
    Items.Strings = (
      'None'
      'Vertical edge')
    TabOrder = 2
  end
  object RadioGroup4: TRadioGroup
    Left = 384
    Top = 80
    Width = 185
    Height = 105
    Caption = 'Right eye background'
    ItemIndex = 1
    Items.Strings = (
      'None'
      'Vertical edge')
    TabOrder = 3
  end
  object Button3: TButton
    Left = 408
    Top = 8
    Width = 153
    Height = 17
    Caption = 'WriteVisualScreen'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 11193599
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = Button3Click
  end
end
