object Hiscore: THiscore
  Left = 452
  Top = 264
  Cursor = crHandPoint
  BorderStyle = bsDialog
  Caption = 'Top 10'
  ClientHeight = 338
  ClientWidth = 321
  Color = clLime
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 155
    Top = 217
    Width = 170
    Height = 121
    AutoSize = True
    Center = True
  end
  object siFlatBtn1: TsiFlatBtn
    Left = 10
    Top = 300
    Width = 101
    Height = 31
    Caption = 'OK!'
    DrawFrame = True
    FrameColor = clRed
    GlyphLayout = glGlyphTop
    A3DTopCl = clBtnHighlight
    A3DBotCl = clBtnShadow
    Elliptic = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    OnClick = siFlatBtn1Click
  end
  inline fScore1: TfScore
    Top = 10
    inherited Label1: TLabel
      Left = 10
      Width = 11
      Caption = '1.'
    end
  end
  inline fScore2: TfScore
    Top = 30
    TabOrder = 1
    inherited Label1: TLabel
      Left = 10
      Width = 11
      Caption = '2.'
    end
  end
  inline fScore3: TfScore
    Top = 50
    TabOrder = 2
    inherited Label1: TLabel
      Left = 10
      Width = 11
      Caption = '3.'
    end
  end
  inline fScore4: TfScore
    Top = 70
    TabOrder = 3
    inherited Label1: TLabel
      Left = 10
      Width = 11
      Caption = '4.'
    end
  end
  inline fScore5: TfScore
    Top = 90
    TabOrder = 4
    inherited Label1: TLabel
      Left = 10
      Width = 11
      Caption = '5.'
    end
  end
  inline fScore6: TfScore
    Top = 110
    TabOrder = 5
    inherited Label1: TLabel
      Left = 10
      Width = 11
      Caption = '6.'
    end
  end
  inline fScore7: TfScore
    Top = 130
    TabOrder = 6
    inherited Label1: TLabel
      Left = 10
      Width = 11
      Caption = '7.'
    end
  end
  inline fScore8: TfScore
    Top = 150
    TabOrder = 7
    inherited Label1: TLabel
      Left = 10
      Width = 11
      Caption = '8.'
    end
  end
  inline fScore9: TfScore
    Top = 170
    TabOrder = 8
    inherited Label1: TLabel
      Left = 10
      Width = 11
      Caption = '9.'
    end
  end
  inline fScore10: TfScore
    Top = 190
    TabOrder = 9
  end
end
