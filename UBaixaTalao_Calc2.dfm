object frmBaixaTalao_Calc2: TfrmBaixaTalao_Calc2
  Left = 166
  Top = 32
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 
    'Ordem de Produ'#231#227'o/Lote/Tal'#227'o Controle de Entrada e Sa'#237'da    (frm' +
    'BaixaTalao_Calc2)'
  ClientHeight = 600
  ClientWidth = 992
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 992
    Height = 600
    Align = alClient
    Color = clSilver
    TabOrder = 0
    object Label1: TLabel
      Left = 20
      Top = 87
      Width = 87
      Height = 18
      Alignment = taRightJustify
      Caption = 'C'#243'd.Barra:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label5: TLabel
      Left = 8
      Top = 184
      Width = 977
      Height = 401
      AutoSize = False
      Color = 11908533
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -29
      Font.Name = 'Verdana'
      Font.Style = [fsBold, fsUnderline]
      ParentColor = False
      ParentFont = False
    end
    object Label6: TLabel
      Left = 61
      Top = 15
      Width = 46
      Height = 18
      Alignment = taRightJustify
      Caption = 'Data:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 265
      Top = 15
      Width = 45
      Height = 18
      Alignment = taRightJustify
      Caption = 'Hora:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 414
      Top = 3
      Width = 321
      Height = 32
      Caption = 
        'Deixar Data e Hora em branco para assumir '#13#10'a hora do sistema au' +
        'tom'#225'tico'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 7
      Top = 57
      Width = 100
      Height = 18
      Alignment = taRightJustify
      Caption = 'Funcion'#225'rio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lblFuncionario: TLabel
      Left = 312
      Top = 54
      Width = 6
      Height = 18
      Caption = '.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 108
      Top = 81
      Width = 202
      Height = 24
      Color = 16777119
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      Visible = False
      OnChange = Edit1Change
      OnKeyDown = Edit1KeyDown
    end
    object DateEdit1: TDateEdit
      Left = 108
      Top = 7
      Width = 144
      Height = 23
      Ctl3D = False
      DefaultToday = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object RzDateTimeEdit1: TRzDateTimeEdit
      Left = 312
      Top = 7
      Width = 95
      Height = 23
      EditType = etTime
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object CurrencyEdit2: TCurrencyEdit
      Left = 108
      Top = 52
      Width = 202
      Height = 23
      Alignment = taCenter
      AutoSize = False
      Ctl3D = False
      DecimalPlaces = 4
      DisplayFormat = '0.####'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      OnChange = CurrencyEdit2Change
      OnKeyDown = CurrencyEdit2KeyDown
    end
    object btnConfirmar: TNxButton
      Left = 702
      Top = 79
      Width = 109
      Height = 30
      Caption = 'Confirmar'
      Down = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      GlyphSpacing = 5
      ParentFont = False
      TabOrder = 4
      Transparent = True
      Visible = False
      OnClick = btnConfirmarClick
    end
  end
end
