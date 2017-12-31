object Form12: TForm12
  Left = 1126
  Top = 269
  Width = 793
  Height = 796
  AutoSize = True
  Caption = 'Form12: FiberO'
  Color = 13430493
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 120
  TextHeight = 16
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 785
    Height = 465
    ActivePage = TabSheet5
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Voltage in space'
      object Chart1: TChart
        Left = 0
        Top = 32
        Width = 777
        Height = 369
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'TChart')
        Title.Visible = False
        BottomAxis.Title.Caption = 'z, mum'
        LeftAxis.Automatic = False
        LeftAxis.AutomaticMaximum = False
        LeftAxis.AutomaticMinimum = False
        LeftAxis.Maximum = 50.000000000000000000
        LeftAxis.Minimum = -80.000000000000000000
        LeftAxis.Title.Caption = 'mV'
        Legend.Alignment = laTop
        Legend.ColorWidth = 100
        Legend.HorizMargin = 1
        Legend.LegendStyle = lsSeries
        Legend.ResizeChart = False
        Legend.ShadowSize = 0
        Legend.VertMargin = 1
        RightAxis.Title.Caption = 'mV'
        View3D = False
        Color = 13430493
        TabOrder = 0
        object Button3: TButton
          Left = 680
          Top = 0
          Width = 97
          Height = 17
          Caption = 'CopyToBMP'
          TabOrder = 0
          OnClick = Button3Click
        end
        object Series1: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlue
          Title = 'V'
          OnDblClick = Series1DblClick
          LineBrush = bsClear
          LinePen.Width = 3
          Pointer.Brush.Color = clAqua
          Pointer.HorizSize = 3
          Pointer.InflateMargins = True
          Pointer.Pen.Width = 2
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
    end
    object TabSheet2: TTabSheet
      Caption = 'Conductances'
      ImageIndex = 1
      object Chart4: TChart
        Left = 0
        Top = 0
        Width = 777
        Height = 217
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'TChart')
        Title.Visible = False
        BottomAxis.Title.Caption = 'z, mum'
        LeftAxis.Automatic = False
        LeftAxis.AutomaticMinimum = False
        LeftAxis.Title.Caption = 'mS/cm^2'
        Legend.Alignment = laTop
        Legend.ColorWidth = 60
        Legend.HorizMargin = 1
        Legend.LegendStyle = lsSeries
        Legend.ResizeChart = False
        Legend.ShadowSize = 0
        Legend.VertMargin = 1
        RightAxis.Title.Caption = 'mV'
        View3D = False
        Color = 13430493
        TabOrder = 0
        object LineSeries2: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'g'
          OnDblClick = LineSeries2DblClick
          LineBrush = bsClear
          LinePen.Width = 2
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
      object Chart2: TChart
        Left = 0
        Top = 217
        Width = 769
        Height = 217
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'TChart')
        Title.Visible = False
        BottomAxis.Title.Caption = 'z, mum'
        LeftAxis.Automatic = False
        LeftAxis.AutomaticMinimum = False
        LeftAxis.Title.Caption = 'units'
        Legend.Alignment = laTop
        Legend.ColorWidth = 60
        Legend.HorizMargin = 1
        Legend.LegendStyle = lsSeries
        Legend.ResizeChart = False
        Legend.ShadowSize = 0
        Legend.VertMargin = 1
        RightAxis.Title.Caption = 'mV'
        View3D = False
        Color = 13430493
        TabOrder = 1
        object Series7: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'm'
          OnDblClick = Series7DblClick
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
        object Series8: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          Title = 'h'
          OnDblClick = Series8DblClick
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
    end
    object TabSheet3: TTabSheet
      Caption = 'Currents in time'
      ImageIndex = 2
      object Chart5: TChart
        Left = 0
        Top = 0
        Width = 777
        Height = 433
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'TChart')
        Title.Visible = False
        BottomAxis.Title.Caption = 't, ms'
        LeftAxis.Title.Caption = 'I, pA'
        Legend.Alignment = laTop
        Legend.ColorWidth = 40
        Legend.LegendStyle = lsSeries
        Legend.ResizeChart = False
        Legend.ShadowSize = 0
        Legend.TextStyle = ltsPlain
        Legend.VertMargin = 1
        RightAxis.Title.Caption = 'V,mV'
        View3D = False
        Color = 13430493
        TabOrder = 0
        object Button5: TButton
          Left = 608
          Top = 0
          Width = 169
          Height = 17
          Caption = 'Adjust range to voltage'
          TabOrder = 1
          OnClick = Button5Click
        end
        object Button6: TButton
          Left = 704
          Top = 16
          Width = 73
          Height = 17
          Caption = 'Auto'
          TabOrder = 2
          OnClick = Button6Click
        end
        object Button21: TButton
          Left = 680
          Top = 32
          Width = 97
          Height = 17
          Caption = 'CopyToBMP'
          TabOrder = 0
          OnClick = Button21Click
        end
        object LineSeries1: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Current an soma'
          OnDblClick = LineSeries1DblClick
          LinePen.Width = 3
          Pointer.Brush.Color = 33023
          Pointer.HorizSize = 3
          Pointer.InflateMargins = True
          Pointer.Pen.Color = clRed
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
        object LineSeries3: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          Title = 'Current at axon'
          OnDblClick = LineSeries3DblClick
          LinePen.Width = 2
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
        object Series11: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = 8421631
          Title = 'Jm an soma'
          OnDblClick = Series11DblClick
          LinePen.Style = psDash
          LinePen.Width = 2
          Pointer.Brush.Color = 8421631
          Pointer.HorizSize = 3
          Pointer.InflateMargins = True
          Pointer.Pen.Color = clRed
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
        object Series12: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clLime
          Title = 'Jm at axon'
          OnDblClick = Series12DblClick
          LinePen.Style = psDash
          LinePen.Width = 2
          Pointer.Brush.Color = 8454016
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
    end
    object TabSheet4: TTabSheet
      Caption = 'Input in time'
      ImageIndex = 3
      object Chart6: TChart
        Left = 0
        Top = 73
        Width = 777
        Height = 289
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'TChart')
        Title.Visible = False
        BottomAxis.Title.Caption = 't, ms'
        LeftAxis.Title.Caption = 'I, pA'
        Legend.Alignment = laTop
        Legend.ColorWidth = 40
        Legend.LegendStyle = lsSeries
        Legend.ResizeChart = False
        Legend.ShadowSize = 0
        Legend.TextStyle = ltsPlain
        Legend.VertMargin = 1
        RightAxis.Title.Caption = 'V,mV'
        View3D = False
        Color = 13430493
        TabOrder = 0
        object Button2: TButton
          Left = 680
          Top = 0
          Width = 97
          Height = 17
          Caption = 'CopyToBMP'
          TabOrder = 0
          OnClick = Button2Click
        end
        object LineSeries4: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Iind[0]'
          OnDblClick = LineSeries4DblClick
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
        object LineSeries5: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          Title = 'Ind[L]'
          OnDblClick = LineSeries5DblClick
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
    end
    object TabSheet5: TTabSheet
      Caption = 'Max.gNa,gK'
      ImageIndex = 4
      object Shape2: TShape
        Left = 216
        Top = 336
        Width = 353
        Height = 33
      end
      object Shape1: TShape
        Left = 160
        Top = 320
        Width = 65
        Height = 65
        Shape = stCircle
      end
      object Label4: TLabel
        Left = 168
        Top = 392
        Width = 52
        Height = 25
        Caption = 'Soma'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 360
        Top = 392
        Width = 46
        Height = 25
        Caption = 'Axon'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Chart7: TChart
        Left = 152
        Top = 56
        Width = 424
        Height = 250
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'TChart')
        Title.Visible = False
        Legend.Alignment = laTop
        Legend.ColorWidth = 40
        Legend.LegendStyle = lsSeries
        Legend.ShadowSize = 0
        Legend.TextStyle = ltsPlain
        View3D = False
        Color = 13430493
        TabOrder = 0
        object Series2: TPointSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'gNa'
          OnDblClick = Series2DblClick
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
        object Series10: TPointSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'gNaR'
          OnDblClick = Series10DblClick
          Pointer.Brush.Color = 33023
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
        object Series3: TPointSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clGreen
          Title = 'gK'
          OnDblClick = Series3DblClick
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
        object Series4: TPointSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clYellow
          Title = 'gKM'
          OnDblClick = Series4DblClick
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
        object Series9: TPointSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlue
          Title = 'gAHP'
          OnDblClick = Series9DblClick
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
      object Panel1: TPanel
        Left = 0
        Top = 8
        Width = 129
        Height = 41
        Caption = 'Refresh'
        Color = 13430493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Panel1Click
      end
      object GroupBox1: TGroupBox
        Left = 592
        Top = 8
        Width = 177
        Height = 129
        Caption = 'Derived values'
        TabOrder = 2
        object Label1: TLabel
          Left = 8
          Top = 24
          Width = 80
          Height = 16
          Caption = 'lamda, mum='
        end
        object Label2: TLabel
          Left = 8
          Top = 48
          Width = 41
          Height = 16
          Caption = 'Gs_R='
        end
        object Label3: TLabel
          Left = 8
          Top = 72
          Width = 14
          Height = 16
          Caption = 'ri='
        end
        object Label12: TLabel
          Left = 8
          Top = 96
          Width = 19
          Height = 16
          Hint = 'ro=ro_inf*tanh(L/lamda)'
          Caption = 'ro='
          ParentShowHint = False
          ShowHint = True
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'LFP'
      ImageIndex = 5
      object Shape3: TShape
        Left = 216
        Top = 336
        Width = 353
        Height = 33
      end
      object Shape4: TShape
        Left = 160
        Top = 320
        Width = 65
        Height = 65
        Shape = stCircle
      end
      object Label6: TLabel
        Left = 168
        Top = 392
        Width = 52
        Height = 25
        Caption = 'Soma'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 360
        Top = 392
        Width = 46
        Height = 25
        Caption = 'Axon'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Shape5: TShape
        Left = 296
        Top = 272
        Width = 25
        Height = 17
        Brush.Color = clBackground
        Shape = stRoundSquare
      end
      object Shape6: TShape
        Left = 308
        Top = 288
        Width = 1
        Height = 49
      end
      object Shape7: TShape
        Left = 196
        Top = 280
        Width = 105
        Height = 1
      end
      object Label8: TLabel
        Left = 316
        Top = 298
        Width = 11
        Height = 25
        Caption = 'h'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 246
        Top = 255
        Width = 11
        Height = 25
        Caption = 'd'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 664
        Top = 260
        Width = 32
        Height = 16
        Caption = 'd / L='
      end
      object Label11: TLabel
        Left = 664
        Top = 284
        Width = 31
        Height = 16
        Caption = 'h / L='
      end
      object Chart8: TChart
        Left = 0
        Top = 1
        Width = 777
        Height = 248
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'TChart')
        Title.Visible = False
        BottomAxis.Title.Caption = 't, ms'
        LeftAxis.Title.Caption = 'LFP, nV'
        Legend.Alignment = laTop
        Legend.ColorWidth = 40
        Legend.Font.Charset = DEFAULT_CHARSET
        Legend.Font.Color = clBlack
        Legend.Font.Height = -13
        Legend.Font.Name = 'Arial'
        Legend.Font.Style = [fsBold]
        Legend.LegendStyle = lsSeries
        Legend.ResizeChart = False
        Legend.ShadowSize = 0
        Legend.TextStyle = ltsPlain
        Legend.VertMargin = 1
        RightAxis.Title.Caption = 'pA'
        View3D = False
        Color = 13430493
        TabOrder = 0
        object Button4: TButton
          Left = 680
          Top = 0
          Width = 97
          Height = 17
          Caption = 'CopyToBMP'
          TabOrder = 0
          OnClick = Button4Click
        end
        object Series13: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = 8082692
          Title = 'LFP'
          OnDblClick = Series13DblClick
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
        object Series14: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = 8421631
          Title = '-Jm at soma'
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
      object DDSpinEdit5: TDDSpinEdit
        Left = 712
        Top = 255
        Width = 57
        Height = 26
        StrWidth = 2
        StrDecimals = 3
        Increment = 0.100000000000000000
        TabOrder = 1
        Value = 0.500000000000000000
      end
      object DDSpinEdit1: TDDSpinEdit
        Left = 712
        Top = 279
        Width = 57
        Height = 26
        StrWidth = 2
        StrDecimals = 3
        Increment = 0.100000000000000000
        TabOrder = 2
        Value = 0.500000000000000000
      end
    end
  end
  object Chart3: TChart
    Left = 0
    Top = 472
    Width = 785
    Height = 289
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    BottomAxis.Title.Caption = 't, ms'
    LeftAxis.Title.Caption = 'mV'
    Legend.Alignment = laTop
    Legend.ColorWidth = 40
    Legend.LegendStyle = lsSeries
    Legend.ResizeChart = False
    Legend.ShadowSize = 0
    Legend.TextStyle = ltsPlain
    Legend.VertMargin = 1
    RightAxis.Title.Caption = 'V,mV'
    View3D = False
    Color = 13430493
    TabOrder = 0
    object Button1: TButton
      Left = 688
      Top = 32
      Width = 97
      Height = 17
      Caption = 'CopyToBMP'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button11: TButton
      Left = 616
      Top = 0
      Width = 169
      Height = 17
      Caption = 'Adjust range to current'
      TabOrder = 1
      OnClick = Button11Click
    end
    object Button13: TButton
      Left = 712
      Top = 16
      Width = 73
      Height = 17
      Caption = 'Auto'
      TabOrder = 2
      OnClick = Button13Click
    end
    object CheckBox1: TCheckBox
      Left = 712
      Top = 48
      Width = 73
      Height = 17
      Caption = 'Clean'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object Series6: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clBlue
      Title = 'V(0,T)'
      OnDblClick = Series6DblClick
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
    object Series5: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = 33023
      Title = 'V(L,T)'
      OnDblClick = Series5DblClick
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
end
