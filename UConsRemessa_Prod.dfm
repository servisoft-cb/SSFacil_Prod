object frmConsRemessa_Prod: TfrmConsRemessa_Prod
  Left = 283
  Top = 135
  Width = 928
  Height = 480
  Caption = 'frmConsRemessa_Prod'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 69
    Align = alTop
    Color = clSilver
    TabOrder = 0
    object Label1: TLabel
      Left = 7
      Top = 12
      Width = 129
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' Remessa Selecionados:'
    end
    object Label2: TLabel
      Left = 98
      Top = 30
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Modelo:'
    end
    object Label3: TLabel
      Left = 432
      Top = 8
      Width = 254
      Height = 13
      Caption = 'F2 para selecionar as Remessas  (separar por v'#237'rgula)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 240
      Top = 28
      Width = 113
      Height = 13
      Caption = 'F2 consultar Refer'#234'ncia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 138
      Top = 4
      Width = 287
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      OnKeyDown = Edit1KeyDown
    end
    object Edit2: TEdit
      Left = 138
      Top = 22
      Width = 95
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      OnKeyDown = Edit2KeyDown
    end
    object btnConsultar: TNxButton
      Left = 138
      Top = 42
      Width = 86
      Height = 25
      Caption = 'Consultar'
      TabOrder = 2
      OnClick = btnConsultarClick
    end
    object btnImprimir: TNxButton
      Left = 223
      Top = 42
      Width = 86
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 3
      OnClick = btnImprimirClick
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 69
    Width = 912
    Height = 372
    Align = alClient
    Ctl3D = False
    DataSource = DMConsRemessa_Prod.dsRemessa_Ref
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
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'NUM_LOTE'
        Title.Alignment = taCenter
        Title.Caption = 'Lote'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCIA'
        Title.Alignment = taCenter
        Title.Caption = 'Modelo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSMATERIAL'
        Title.Alignment = taCenter
        Title.Caption = 'Produto'
        Width = 498
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd'
        Visible = True
      end>
  end
end
