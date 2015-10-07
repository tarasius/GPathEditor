object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 689
  ClientWidth = 793
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 120
  TextHeight = 16
  object Panel1: TPanel
    Left = 592
    Top = 0
    Width = 201
    Height = 689
    Align = alRight
    BevelOuter = bvNone
    Color = clSilver
    ParentBackground = False
    TabOrder = 0
    object MemoCode: TMemo
      Left = 1
      Top = 97
      Width = 195
      Height = 584
      Color = clCream
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Courier'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object ButtonFinish: TButton
      Left = 2
      Top = 10
      Width = 62
      Height = 25
      Hint = 'Click to see how the final figure looks like'
      Caption = 'Finish'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ButtonFinishClick
    end
    object ButtonClear: TButton
      Left = 134
      Top = 10
      Width = 62
      Height = 25
      Hint = 'Clear figure'
      Caption = 'Clear'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ButtonClearClick
    end
    object EditFigureName: TEdit
      Left = 3
      Top = 113
      Width = 171
      Height = 13
      Hint = 'Specify figure name here'
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Courier'
      Font.Style = []
      MaxLength = 20
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Text = 'GENERATED'
      OnExit = EditFigureNameExit
      OnKeyPress = EditFigureNameKeyPress
    end
    object ButtonCopy: TButton
      Left = 68
      Top = 10
      Width = 62
      Height = 25
      Hint = 'Copy source code to the clipboard'
      Caption = 'Copy'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = ButtonCopyClick
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 38
      Width = 195
      Height = 51
      Caption = ' Size '
      TabOrder = 5
      object Label1: TLabel
        Left = 94
        Top = 19
        Width = 6
        Height = 21
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SpinEditSizeX: TSpinEdit
        Left = 12
        Top = 17
        Width = 66
        Height = 26
        Hint = 'Size of the drawing canvas'
        MaxValue = 144
        MinValue = 1
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Value = 144
        OnChange = SpinEditSizeXChange
      end
      object SpinEditSizeY: TSpinEdit
        Left = 116
        Top = 17
        Width = 66
        Height = 26
        Hint = 'Size of the drawing canvas'
        MaxValue = 168
        MinValue = 1
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Value = 168
        OnChange = SpinEditSizeXChange
      end
    end
  end
end
