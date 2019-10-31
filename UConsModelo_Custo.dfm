object frmConsModelo_Custo: TfrmConsModelo_Custo
  Left = 160
  Top = 77
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
    Width = 1005
    Height = 53
    Align = alTop
    Color = clSilver
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Inicial:'
    end
    object Label2: TLabel
      Left = 183
      Top = 16
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'Final:'
    end
    object Label3: TLabel
      Left = 36
      Top = 36
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Setor:'
    end
    object btnConsultar: TNxButton
      Left = 358
      Top = 16
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
    object btnImprimir: TNxButton
      Left = 470
      Top = 16
      Width = 114
      Height = 25
      Caption = 'Excel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnImprimirClick
    end
    object DateEdit1: TDateEdit
      Left = 67
      Top = 8
      Width = 100
      Height = 21
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 0
    end
    object DateEdit2: TDateEdit
      Left = 211
      Top = 8
      Width = 100
      Height = 21
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 1
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 67
      Top = 28
      Width = 244
      Height = 21
      DropDownCount = 8
      Ctl3D = False
      LookupField = 'ID'
      LookupDisplay = 'NOME'
      LookupSource = DMConsLote.dsSetor
      ParentCtl3D = False
      TabOrder = 2
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 53
    Width = 1005
    Height = 486
    Align = alClient
    Ctl3D = False
    DataSource = DMConsLote.dsModelo_Setor
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
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
    WidthOfIndicator = 13
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 8
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'NOME_SETOR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_MODELO'
        Width = 196
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_PRODUTO'
        Width = 273
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_COMBINACAO'
        Width = 179
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD_PARES'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_CLIENTE'
        Width = 322
        Visible = True
      end>
  end
end
