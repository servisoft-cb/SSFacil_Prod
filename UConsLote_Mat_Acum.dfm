object frmConsLote_Mat_Acum: TfrmConsLote_Mat_Acum
  Left = 229
  Top = 120
  Width = 928
  Height = 480
  Caption = 'Consulta Material Acumulado'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 920
    Height = 83
    Align = alTop
    Color = clSilver
    TabOrder = 0
    object Label1: TLabel
      Left = 39
      Top = 14
      Width = 91
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dt. Gera'#231#227'o Inicial:'
    end
    object Label2: TLabel
      Left = 238
      Top = 14
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'Final:'
    end
    object Label3: TLabel
      Left = 67
      Top = 37
      Width = 63
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' OP Inicial:'
    end
    object Label4: TLabel
      Left = 238
      Top = 36
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'Final:'
    end
    object DateEdit1: TDateEdit
      Left = 132
      Top = 6
      Width = 100
      Height = 21
      NumGlyphs = 2
      TabOrder = 0
    end
    object DateEdit2: TDateEdit
      Left = 265
      Top = 6
      Width = 100
      Height = 21
      NumGlyphs = 2
      TabOrder = 1
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 132
      Top = 29
      Width = 100
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      TabOrder = 2
    end
    object CurrencyEdit2: TCurrencyEdit
      Left = 265
      Top = 28
      Width = 100
      Height = 21
      AutoSize = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      TabOrder = 3
    end
    object NxButton1: TNxButton
      Left = 132
      Top = 53
      Width = 118
      Height = 27
      Caption = 'Efetuar Pesquisa'
      TabOrder = 4
      OnClick = NxButton1Click
    end
    object NxButton2: TNxButton
      Left = 249
      Top = 53
      Width = 118
      Height = 27
      Caption = 'Imprimir'
      TabOrder = 5
      OnClick = NxButton2Click
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 83
    Width = 920
    Height = 366
    Align = alClient
    Ctl3D = False
    DataSource = DMConsLote.dsConsLote_Mat_Acum
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Flat = True
    BandsFont.Charset = DEFAULT_CHARSET
    BandsFont.Color = clWindowText
    BandsFont.Height = -11
    BandsFont.Name = 'MS Sans Serif'
    BandsFont.Style = []
    Groupings = <>
    GridStyle.Style = gsCustom
    GridStyle.OddColor = clWindow
    GridStyle.EvenColor = clWindow
    TitleHeight.PixelCount = 24
    FooterColor = clBtnFace
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID_MATERIAL'
        Title.Alignment = taCenter
        Title.Caption = 'ID Material'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Material'
        Width = 542
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'UNIDADE'
        Title.Alignment = taCenter
        Title.Caption = 'Unid.'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD_CONSUMO'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Consumo'
        Width = 128
        Visible = True
      end>
  end
end
