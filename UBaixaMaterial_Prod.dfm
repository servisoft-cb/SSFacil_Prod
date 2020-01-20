object frmBaixaMaterial_Prod: TfrmBaixaMaterial_Prod
  Left = 250
  Top = 125
  Width = 928
  Height = 480
  Caption = 'frmBaixaMaterial_Prod'
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
  object NxPanel1: TNxPanel
    Left = 0
    Top = 0
    Width = 920
    Height = 102
    Align = alTop
    UseDockManager = False
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 20
      Top = 43
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
      Transparent = True
    end
    object Edit1: TEdit
      Left = 108
      Top = 37
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
      TabOrder = 0
      OnKeyDown = Edit1KeyDown
    end
    object NxPanel2: TNxPanel
      Left = 361
      Top = 0
      Width = 559
      Height = 102
      Align = alRight
      ColorScheme = csSilver
      UseDockManager = False
      ParentBackground = False
      TabOrder = 1
      object Label2: TLabel
        Left = 42
        Top = 11
        Width = 45
        Height = 16
        Alignment = taRightJustify
        Caption = 'N'#186' OP:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label3: TLabel
        Left = 209
        Top = 11
        Width = 36
        Height = 16
        Alignment = taRightJustify
        Caption = 'Item:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label4: TLabel
        Left = 10
        Top = 31
        Width = 77
        Height = 16
        Alignment = taRightJustify
        Caption = 'ID Material:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label5: TLabel
        Left = 17
        Top = 52
        Width = 72
        Height = 16
        Alignment = taRightJustify
        Caption = 'Nome Mat:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object CurrencyEdit1: TCurrencyEdit
        Left = 89
        Top = 6
        Width = 82
        Height = 21
        AutoSize = False
        Ctl3D = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        ParentCtl3D = False
        TabOrder = 0
      end
      object CurrencyEdit2: TCurrencyEdit
        Left = 247
        Top = 6
        Width = 63
        Height = 21
        AutoSize = False
        Ctl3D = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        ParentCtl3D = False
        TabOrder = 1
      end
      object CurrencyEdit3: TCurrencyEdit
        Left = 89
        Top = 26
        Width = 82
        Height = 21
        AutoSize = False
        Ctl3D = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
      end
      object Edit2: TEdit
        Left = 89
        Top = 46
        Width = 330
        Height = 19
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 3
      end
      object NxButton1: TNxButton
        Left = 90
        Top = 71
        Width = 98
        Caption = 'Efetuar Pesquisa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = NxButton1Click
      end
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 102
    Width = 920
    Height = 317
    Align = alClient
    Ctl3D = False
    DataSource = DMBaixaMaterial_Prod.dsConsLoteMat_Prod
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = SMDBGrid1DblClick
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
    OnGetCellParams = SMDBGrid1GetCellParams
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 15
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'NUM_ORDEM'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Ordem'
        Title.Color = 8454143
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ITEM'
        Title.Alignment = taCenter
        Title.Caption = 'Item'
        Title.Color = 8454143
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_MATERIAL'
        Title.Alignment = taCenter
        Title.Caption = 'ID Material'
        Title.Color = 8454143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_MATERIAL'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Material'
        Title.Color = 8454143
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_COR_MAT'
        Title.Alignment = taCenter
        Title.Caption = 'Cor Material'
        Title.Color = 8454143
        Width = 202
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD_CONSUMO'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Necessidade'
        Title.Color = 8454143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD_PAGO'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Pago'
        Title.Color = 8454143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD_RETORNO'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Retorno'
        Title.Color = 8454143
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD_DIFERENCA'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Diferen'#231'a'
        Title.Color = 8454143
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD_CONES'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Cones'
        Title.Color = 8454143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTPAGO'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Pago'
        Title.Color = 8454143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTRETORNO'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Retorno'
        Title.Color = 8454143
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCIA'
        Title.Alignment = taCenter
        Title.Caption = 'Refer'#234'ncia'
        Title.Color = 8454143
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_COR_PROD'
        Title.Alignment = taCenter
        Title.Caption = 'Cor da Refer'#234'ncia'
        Title.Color = 8454143
        Width = 64
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 419
    Width = 920
    Height = 30
    Align = alBottom
    Color = clSilver
    TabOrder = 2
    object Shape1: TShape
      Left = 10
      Top = 8
      Width = 28
      Height = 18
      Brush.Color = clYellow
    end
    object Label6: TLabel
      Left = 44
      Top = 12
      Width = 78
      Height = 13
      Caption = 'Sem Pagamento'
    end
    object Shape2: TShape
      Left = 154
      Top = 8
      Width = 28
      Height = 18
      Brush.Color = 4227327
    end
    object Label7: TLabel
      Left = 188
      Top = 12
      Width = 62
      Height = 13
      Caption = 'Sem Retorno'
    end
  end
end
