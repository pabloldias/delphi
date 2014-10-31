object Sobre: TSobre
  Left = 224
  Top = 220
  BorderStyle = bsNone
  Caption = 'Sobre'
  ClientHeight = 242
  ClientWidth = 330
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clSilver
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = [fsBold, fsItalic]
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 330
    Height = 244
    AutoSize = True
    Transparent = True
  end
  object Label1: TLabel
    Left = 200
    Top = 220
    Width = 117
    Height = 16
    Caption = '© Pablo Lima 2003'
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 50
    Top = 20
  end
end
