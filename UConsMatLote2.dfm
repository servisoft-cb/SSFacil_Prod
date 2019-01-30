object frmConsMatLote2: TfrmConsMatLote2
  Left = 270
  Top = 64
  Width = 1013
  Height = 570
  Caption = 'Consulta Materiais Por Lote'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 997
    Height = 51
    Align = alTop
    Color = clSilver
    TabOrder = 0
    object Label1: TLabel
      Left = 43
      Top = 16
      Width = 69
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' Lote Inicial:'
    end
    object Label2: TLabel
      Left = 215
      Top = 16
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'Final:'
    end
    object Label8: TLabel
      Left = 17
      Top = 34
      Width = 96
      Height = 13
      Alignment = taRightJustify
      Caption = 'Lotes Selecionados:'
    end
    object btnConsultar: TNxButton
      Left = 476
      Top = 24
      Width = 114
      Height = 25
      Caption = 'Consultar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnConsultarClick
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 114
      Top = 8
      Width = 85
      Height = 21
      AutoSize = False
      Ctl3D = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      ParentCtl3D = False
      TabOrder = 0
    end
    object CurrencyEdit2: TCurrencyEdit
      Left = 242
      Top = 8
      Width = 85
      Height = 21
      AutoSize = False
      Ctl3D = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      ParentCtl3D = False
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 114
      Top = 28
      Width = 362
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
    end
    object btnImprimir: TNxButton
      Left = 590
      Top = 24
      Width = 114
      Height = 25
      Caption = 'Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnImprimirClick
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 51
    Width = 997
    Height = 355
    Align = alClient
    Ctl3D = False
    DataSource = DMConsLote.dsmMat
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnTitleClick = SMDBGrid1TitleClick
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
    WidthOfIndicator = 13
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 6
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'Nome_Setor'
        Title.Alignment = taCenter
        Title.Caption = 'Setor'
        Width = 172
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_Material'
        Title.Alignment = taCenter
        Title.Caption = 'ID Material'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome_Material'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Material'
        Width = 367
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome_Cor'
        Title.Caption = 'Cor Material'
        Width = 195
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtd_Consumo'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Material Consumo'
        Width = 108
        Visible = True
      end>
  end
  object VDBGrid1: TVDBGrid
    Left = 0
    Top = 406
    Width = 997
    Height = 125
    Align = alBottom
    Ctl3D = False
    DataSource = DMConsLote.dsmMatGrade
    FixedColor = 16765606
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Vertical = True
    TitlesWidth = 70
    Columns = <
      item
        Alignment = taCenter
        FieldName = 'Tamanho'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ReadOnly = True
        Title.Alignment = taCenter
      end
      item
        Alignment = taCenter
        FieldName = 'Qtd_Consumo'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Quantidade'
      end>
  end
end
