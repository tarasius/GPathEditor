object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 689
  ClientWidth = 793
  Color = clSilver
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Courier'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 120
  TextHeight = 13
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
      Top = 135
      Width = 195
      Height = 547
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
      Left = 115
      Top = 7
      Width = 40
      Height = 25
      Hint = 'Click to see how the final figure looks like'
      Caption = 'Finish'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ButtonFinishClick
    end
    object ButtonClear: TButton
      Left = 1
      Top = 7
      Width = 40
      Height = 25
      Hint = 'Clear figure'
      Caption = 'Clear'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ButtonClearClick
    end
    object EditFigureName: TEdit
      Left = 4
      Top = 151
      Width = 170
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
      Left = 160
      Top = 7
      Width = 36
      Height = 25
      Hint = 'Copy source code to the clipboard'
      Caption = 'Copy'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = ButtonCopyClick
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 32
      Width = 195
      Height = 51
      Caption = ' Size '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
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
      object seSizeX: TSpinEdit
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
        OnChange = seSizeXChange
      end
      object seSizeY: TSpinEdit
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
        OnChange = seSizeXChange
      end
    end
    object ButtonUndo: TButton
      Left = 47
      Top = 7
      Width = 40
      Height = 25
      Hint = 'Clear figure'
      Caption = 'Undo'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = ButtonUndoClick
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 82
      Width = 195
      Height = 51
      Caption = ' Offset '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      object Label2: TLabel
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
      object seOffsetX: TSpinEdit
        Left = 12
        Top = 17
        Width = 66
        Height = 26
        Hint = 'Size of the drawing canvas'
        MaxValue = 143
        MinValue = -143
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Value = 0
        OnChange = seSizeXChange
      end
      object seOffsetY: TSpinEdit
        Left = 116
        Top = 17
        Width = 66
        Height = 26
        Hint = 'Size of the drawing canvas'
        MaxValue = 167
        MinValue = -167
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Value = 0
        OnChange = seSizeXChange
      end
    end
  end
end
