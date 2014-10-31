object main: Tmain
  Left = 172
  Top = 119
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Algoritmo das Cinco Cores'
  ClientHeight = 471
  ClientWidth = 691
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Shape2: TShape
    Left = 120
    Top = 10
    Width = 561
    Height = 361
    Brush.Color = clNavy
    Pen.Color = clNavy
  end
  object Label2: TLabel
    Left = 130
    Top = 20
    Width = 128
    Height = 13
    Caption = 'Tabela de Adjac'#234'ncias'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Shape1: TShape
    Left = 10
    Top = 10
    Width = 111
    Height = 361
    Pen.Color = clNavy
  end
  object Label1: TLabel
    Left = 20
    Top = 20
    Width = 86
    Height = 13
    Caption = 'N'#186' de v'#233'rtices:'
    Transparent = True
  end
  object Shape3: TShape
    Left = 10
    Top = 370
    Width = 111
    Height = 91
    Brush.Color = clNavy
    Pen.Color = clNavy
  end
  object Shape4: TShape
    Left = 120
    Top = 370
    Width = 561
    Height = 91
    Pen.Color = clNavy
  end
  object btAvancar: TSpeedButton
    Left = 20
    Top = 330
    Width = 91
    Height = 31
    Caption = 'Avan'#231'ar >>'
    Flat = True
    OnClick = btAvancarClick
  end
  object btColorir: TSpeedButton
    Left = 20
    Top = 380
    Width = 91
    Height = 31
    Caption = 'Colorir >>'
    Enabled = False
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    OnClick = btColorirClick
  end
  object btExemplo: TSpeedButton
    Left = 20
    Top = 420
    Width = 91
    Height = 31
    Caption = 'Exemplo'
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = btExemploClick
  end
  object btSobre: TSpeedButton
    Left = 20
    Top = 170
    Width = 91
    Height = 31
    Caption = 'Sobre'
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    OnClick = btSobreClick
  end
  object grid: TStringGrid
    Left = 130
    Top = 40
    Width = 541
    Height = 321
    BorderStyle = bsNone
    Ctl3D = True
    DefaultColWidth = 25
    DefaultRowHeight = 20
    Enabled = False
    FixedColor = clSkyBlue
    Options = [goVertLine, goHorzLine, goThumbTracking]
    ParentCtl3D = False
    TabOrder = 0
    OnClick = gridClick
  end
  object edNVert: TEdit
    Left = 20
    Top = 40
    Width = 91
    Height = 21
    BevelKind = bkTile
    BorderStyle = bsNone
    TabOrder = 1
    OnChange = edNVertChange
    OnKeyPress = edNVertKeyPress
  end
  object grid2: TStringGrid
    Left = 130
    Top = 380
    Width = 541
    Height = 71
    BorderStyle = bsNone
    ColCount = 1
    Ctl3D = True
    DefaultColWidth = 25
    DefaultRowHeight = 20
    Enabled = False
    FixedColor = clSkyBlue
    FixedCols = 0
    RowCount = 2
    Options = [goVertLine, goHorzLine, goThumbTracking]
    ParentCtl3D = False
    TabOrder = 2
    ColWidths = (
      25)
  end
  object Panel1: TPanel
    Left = 680
    Top = 460
    Width = 561
    Height = 361
    BevelOuter = bvNone
    Color = clNavy
    TabOrder = 3
    Visible = False
    object Label7: TLabel
      Left = 110
      Top = 140
      Width = 92
      Height = 13
      Caption = '*'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 110
      Top = 80
      Width = 102
      Height = 13
      Caption = 'Teoria dos Grafos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 110
      Top = 160
      Width = 84
      Height = 13
      Caption = '*'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 110
      Top = 100
      Width = 105
      Height = 13
      Caption = '*'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 110
      Top = 120
      Width = 58
      Height = 13
      Caption = '*'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 110
      Top = 180
      Width = 62
      Height = 13
      Caption = 'Pablo Lima'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 30
      Top = 80
      Width = 67
      Height = 13
      Caption = 'Disciplina:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clSkyBlue
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label14: TLabel
      Left = 30
      Top = 20
      Width = 492
      Height = 23
      Caption = 'Implementa'#231#227'o do Algoritmo das Cinco Cores'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clSkyBlue
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Label15: TLabel
      Left = 30
      Top = 100
      Width = 67
      Height = 13
      Caption = 'Professor:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clSkyBlue
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label16: TLabel
      Left = 30
      Top = 120
      Width = 48
      Height = 13
      Caption = 'Equipe:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clSkyBlue
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
  end
end
