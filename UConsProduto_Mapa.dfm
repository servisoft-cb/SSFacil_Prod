object frmConsProduto_Mapa: TfrmConsProduto_Mapa
  Left = 82
  Top = 172
  Width = 1117
  Height = 480
  Caption = 'frmConsProduto_Mapa'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Grid: TStringGrid
    Left = 0
    Top = 100
    Width = 1109
    Height = 349
    Align = alClient
    BorderStyle = bsNone
    ColCount = 6
    Ctl3D = False
    DefaultRowHeight = 20
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected]
    ParentCtl3D = False
    TabOrder = 1
    OnDrawCell = GridDrawCell
    ColWidths = (
      64
      64
      64
      64
      64
      64)
    RowHeights = (
      20
      20
      20
      20
      20)
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1109
    Height = 100
    Align = alTop
    Color = clSilver
    TabOrder = 0
    object Shape6: TShape
      Left = 728
      Top = 2
      Width = 32
      Height = 17
      Brush.Color = 16777145
    end
    object Label6: TLabel
      Left = 763
      Top = 6
      Width = 93
      Height = 13
      Caption = 'Tal'#227'o em Produ'#231#227'o'
    end
    object Shape4: TShape
      Left = 728
      Top = 18
      Width = 32
      Height = 17
      Brush.Color = 7864183
    end
    object Label4: TLabel
      Left = 762
      Top = 22
      Width = 79
      Height = 13
      Caption = 'Tal'#227'o Encerrado'
    end
    object Label1: TLabel
      Left = 23
      Top = 12
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Refer'#234'ncia:'
    end
    object Label2: TLabel
      Left = 9
      Top = 32
      Width = 69
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' Lote Inicial:'
    end
    object Label3: TLabel
      Left = 184
      Top = 32
      Width = 64
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' Lote Final:'
    end
    object Label5: TLabel
      Left = 15
      Top = 52
      Width = 63
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' OP Inicial:'
    end
    object Label7: TLabel
      Left = 189
      Top = 52
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' OP Final:'
    end
    object Shape1: TShape
      Left = 891
      Top = 2
      Width = 32
      Height = 17
      Brush.Color = 11075583
    end
    object Label8: TLabel
      Left = 926
      Top = 6
      Width = 110
      Height = 13
      Caption = 'Processo em Produ'#231#227'o'
    end
    object Shape2: TShape
      Left = 891
      Top = 18
      Width = 32
      Height = 17
      Brush.Color = 4227327
    end
    object Label9: TLabel
      Left = 925
      Top = 22
      Width = 96
      Height = 13
      Caption = 'Processo Encerrado'
    end
    object NxButton1: TNxButton
      Left = 76
      Top = 66
      Width = 115
      Height = 33
      Caption = 'Consultar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = NxButton1Click
    end
    object edtReferencia: TEdit
      Left = 79
      Top = 6
      Width = 173
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      OnKeyDown = edtReferenciaKeyDown
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 79
      Top = 24
      Width = 68
      Height = 21
      AutoSize = False
      Ctl3D = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      ParentCtl3D = False
      TabOrder = 1
    end
    object CurrencyEdit2: TCurrencyEdit
      Left = 249
      Top = 24
      Width = 68
      Height = 21
      AutoSize = False
      Ctl3D = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      ParentCtl3D = False
      TabOrder = 2
    end
    object CurrencyEdit3: TCurrencyEdit
      Left = 79
      Top = 44
      Width = 68
      Height = 21
      AutoSize = False
      Ctl3D = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      ParentCtl3D = False
      TabOrder = 3
    end
    object CurrencyEdit4: TCurrencyEdit
      Left = 249
      Top = 44
      Width = 68
      Height = 21
      AutoSize = False
      Ctl3D = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      ParentCtl3D = False
      TabOrder = 4
    end
  end
end
