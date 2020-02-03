object frmConsBaixaMaterial_Prod: TfrmConsBaixaMaterial_Prod
  Left = 250
  Top = 125
  Width = 928
  Height = 480
  Caption = 'Consulta Pagamento/Retorno de Materiais (Almoxarifado)'
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
    Height = 93
    Align = alTop
    UseDockManager = False
    ParentBackground = False
    TabOrder = 0
    object Label2: TLabel
      Left = 54
      Top = 14
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' OP:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 198
      Top = 14
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'Item:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 33
      Top = 34
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'ID Material:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label5: TLabel
      Left = 190
      Top = 34
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nome:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label1: TLabel
      Left = 32
      Top = 54
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Refer'#234'ncia:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label8: TLabel
      Left = 318
      Top = 54
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Op'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label9: TLabel
      Left = 491
      Top = 33
      Width = 62
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dt. Pagto Ini:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object Label10: TLabel
      Left = 662
      Top = 33
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'Final:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object Label11: TLabel
      Left = 481
      Top = 53
      Width = 72
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dt. Retorno Ini:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object Label12: TLabel
      Left = 662
      Top = 53
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'Final:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object Label17: TLabel
      Left = 495
      Top = 13
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dt.Gera'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label18: TLabel
      Left = 662
      Top = 13
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'Final:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
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
      Left = 223
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
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
    end
    object Edit2: TEdit
      Left = 223
      Top = 26
      Width = 251
      Height = 19
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
    end
    object btnConsultar: TNxButton
      Left = 88
      Top = 67
      Width = 98
      Caption = 'Efetuar Pesquisa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnConsultarClick
    end
    object edtRef: TEdit
      Left = 89
      Top = 46
      Width = 128
      Height = 19
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 5
    end
    object NxComboBox1: TNxComboBox
      Left = 354
      Top = 46
      Width = 121
      Height = 21
      Cursor = crArrow
      TabOrder = 6
      Text = 'Ambos'
      ReadOnly = True
      HideFocus = False
      Style = dsDropDownList
      AutoCompleteDelay = 0
      ItemIndex = 0
      Items.Strings = (
        'Ambos'
        'Pago'
        'Retorno'
        'Sem Pagamento'
        'Sem Retorno')
    end
    object DateEdit1: TDateEdit
      Left = 555
      Top = 25
      Width = 100
      Height = 21
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NumGlyphs = 2
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 7
      Visible = False
    end
    object DateEdit2: TDateEdit
      Left = 689
      Top = 25
      Width = 100
      Height = 21
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NumGlyphs = 2
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 8
      Visible = False
    end
    object DateEdit3: TDateEdit
      Left = 555
      Top = 45
      Width = 100
      Height = 21
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NumGlyphs = 2
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 9
      Visible = False
    end
    object DateEdit4: TDateEdit
      Left = 689
      Top = 45
      Width = 100
      Height = 21
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NumGlyphs = 2
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 10
      Visible = False
    end
    object DateEdit5: TDateEdit
      Left = 555
      Top = 5
      Width = 100
      Height = 21
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NumGlyphs = 2
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 11
    end
    object DateEdit6: TDateEdit
      Left = 689
      Top = 5
      Width = 100
      Height = 21
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NumGlyphs = 2
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 12
    end
    object btnImprimir: TNxButton
      Left = 186
      Top = 67
      Width = 98
      Caption = 'Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
      OnClick = btnImprimirClick
    end
    object btnExcel: TNxButton
      Left = 285
      Top = 67
      Width = 98
      Caption = 'Excel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
      OnClick = btnExcelClick
    end
  end
  object NxPageControl1: TNxPageControl
    Left = 0
    Top = 93
    Width = 920
    Height = 356
    ActivePage = TS_Consulta
    ActivePageIndex = 0
    Align = alClient
    TabOrder = 1
    OnChange = NxPageControl1Change
    Margin = 0
    Spacing = 0
    TabHeight = 17
    TabStyle = tsClassic
    object TS_Consulta: TNxTabSheet
      Caption = 'Materiais Detalhado'
      PageIndex = 0
      TabFont.Charset = DEFAULT_CHARSET
      TabFont.Color = clWindowText
      TabFont.Height = -11
      TabFont.Name = 'MS Sans Serif'
      TabFont.Style = []
      object SMDBGrid1: TSMDBGrid
        Left = 0
        Top = 0
        Width = 920
        Height = 305
        Align = alClient
        Ctl3D = False
        DataSource = DMBaixaMaterial_Prod.dsConsLoteMat_Prod
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
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
        OnGetCellParams = SMDBGrid1GetCellParams
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 17
        RowCount = 2
        Columns = <
          item
            Expanded = False
            FieldName = 'NUM_ORDEM'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Ordem'
            Title.Color = 13750737
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ITEM'
            Title.Alignment = taCenter
            Title.Caption = 'Item'
            Title.Color = 13750737
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REFERENCIA'
            Title.Alignment = taCenter
            Title.Caption = 'Refer'#234'ncia'
            Title.Color = 13750737
            Width = 115
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_COR_PROD'
            Title.Alignment = taCenter
            Title.Caption = 'Cor da Refer'#234'ncia'
            Title.Color = 13750737
            Width = 138
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_MATERIAL'
            Title.Alignment = taCenter
            Title.Caption = 'ID Material'
            Title.Color = 13750737
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_MATERIAL'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Material'
            Title.Color = 13750737
            Width = 219
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_COR_MAT'
            Title.Alignment = taCenter
            Title.Caption = 'Cor Material'
            Title.Color = 13750737
            Width = 122
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_CONSUMO'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Necessidade'
            Title.Color = 13750737
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_PAGO'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Pago'
            Title.Color = 13750737
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_RETORNO'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Retorno'
            Title.Color = 13750737
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_DIFERENCA'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Diferen'#231'a'
            Title.Color = 13750737
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PERC_DIFERENCA'
            Title.Alignment = taCenter
            Title.Caption = '% Diferen'#231'a'
            Title.Color = 13750737
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_REAL'
            Title.Alignment = taCenter
            Title.Caption = 'Q. Consumo Real'
            Title.Color = 13750737
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTPAGO'
            Title.Alignment = taCenter
            Title.Caption = 'Dt. Pago'
            Title.Color = 13750737
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTRETORNO'
            Title.Alignment = taCenter
            Title.Caption = 'Dt. Retorno'
            Title.Color = 13750737
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUM_LOTE'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Lote'
            Visible = True
          end>
      end
      object Panel1: TPanel
        Left = 0
        Top = 305
        Width = 920
        Height = 30
        Align = alBottom
        Color = clSilver
        TabOrder = 1
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
    object TS_Ref_Geracao: TNxTabSheet
      Caption = 'Refer'#234'ncia (Gera'#231#227'o)'
      PageIndex = 1
      TabFont.Charset = DEFAULT_CHARSET
      TabFont.Color = clWindowText
      TabFont.Height = -11
      TabFont.Name = 'MS Sans Serif'
      TabFont.Style = []
      object SMDBGrid5: TSMDBGrid
        Left = 0
        Top = 0
        Width = 920
        Height = 305
        Align = alClient
        Ctl3D = False
        DataSource = DMBaixaMaterial_Prod.dsConsPagRet_Ref_Geracao
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnTitleClick = SMDBGrid5TitleClick
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
        OnGetCellParams = SMDBGrid5GetCellParams
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 13
        RowCount = 2
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'REFERENCIA'
            Title.Alignment = taCenter
            Title.Caption = 'Refer'#234'ncia'
            Title.Color = 13750737
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_COR_PROD'
            Title.Alignment = taCenter
            Title.Caption = 'Cor Produto'
            Title.Color = 13750737
            Width = 165
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID_MATERIAL'
            Title.Alignment = taCenter
            Title.Caption = 'ID Material'
            Title.Color = 13750737
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_MATERIAL'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Material'
            Title.Color = 13750737
            Width = 213
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_COR_MAT'
            Title.Alignment = taCenter
            Title.Caption = 'Cor Material'
            Title.Color = 13750737
            Width = 139
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'UNIDADE_MATERIAL'
            Title.Alignment = taCenter
            Title.Caption = 'Unid.'
            Title.Color = 13750737
            Width = 43
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_CONSUMO'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Necessidade'
            Title.Color = 13750737
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_PAGO'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Pago'
            Title.Color = 13750737
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_RETORNO'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Retorno'
            Title.Color = 13750737
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_DIFERENCA'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Diferen'#231'a'
            Title.Color = 13750737
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PERC_DIFERENCA'
            Title.Alignment = taCenter
            Title.Caption = '% Dif.'
            Title.Color = 13750737
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_REAL'
            Title.Alignment = taCenter
            Title.Caption = 'Q. Consumo Real'
            Title.Color = 13750737
            Visible = True
          end>
      end
      object Panel4: TPanel
        Left = 0
        Top = 305
        Width = 920
        Height = 30
        Align = alBottom
        Color = clSilver
        TabOrder = 1
        object Shape8: TShape
          Left = 154
          Top = 8
          Width = 28
          Height = 18
          Brush.Color = 4227327
        end
        object Label20: TLabel
          Left = 188
          Top = 12
          Width = 62
          Height = 13
          Caption = 'Sem Retorno'
        end
      end
    end
    object TS_ConsPagRet: TNxTabSheet
      Caption = 'Pagamento/Retorno (Material)'
      PageIndex = 2
      TabFont.Charset = DEFAULT_CHARSET
      TabFont.Color = clWindowText
      TabFont.Height = -11
      TabFont.Name = 'MS Sans Serif'
      TabFont.Style = []
      object SMDBGrid2: TSMDBGrid
        Left = 0
        Top = 0
        Width = 920
        Height = 305
        Align = alClient
        Ctl3D = False
        DataSource = DMBaixaMaterial_Prod.dsConsPagRet
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnTitleClick = SMDBGrid2TitleClick
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
        OnGetCellParams = SMDBGrid2GetCellParams
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 12
        RowCount = 2
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DESC_TIPO'
            Title.Alignment = taCenter
            Title.Caption = 'Tipo'
            Title.Color = clSilver
            Width = 60
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DATA'
            Title.Alignment = taCenter
            Title.Caption = 'Data'
            Title.Color = clSilver
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNIDADE_MATERIAL'
            Title.Alignment = taCenter
            Title.Caption = 'Unid.'
            Title.Color = clSilver
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD'
            Title.Alignment = taCenter
            Title.Caption = 'Qtde'
            Title.Color = clSilver
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'REFERENCIA'
            Title.Alignment = taCenter
            Title.Caption = 'Refer'#234'ncia'
            Title.Color = clSilver
            Width = 104
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_COR_PROD'
            Title.Alignment = taCenter
            Title.Caption = 'Cor Produto'
            Title.Color = clSilver
            Width = 121
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID_MATERIAL'
            Title.Alignment = taCenter
            Title.Caption = 'ID Material'
            Title.Color = clSilver
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_MATERIAL'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Material'
            Title.Color = clSilver
            Width = 220
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_COR_MAT'
            Title.Alignment = taCenter
            Title.Caption = 'Cor Material'
            Title.Color = clSilver
            Width = 90
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NUM_ORDEM'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Ordem'
            Title.Color = clSilver
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ITEM'
            Title.Alignment = taCenter
            Title.Caption = 'Item'
            Title.Color = clSilver
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 305
        Width = 920
        Height = 30
        Align = alBottom
        Color = clSilver
        TabOrder = 1
        object Shape3: TShape
          Left = 11
          Top = 8
          Width = 28
          Height = 18
          Brush.Color = 16777147
        end
        object Label13: TLabel
          Left = 44
          Top = 12
          Width = 59
          Height = 13
          Caption = 'Pagamentos'
        end
        object Shape4: TShape
          Left = 154
          Top = 8
          Width = 28
          Height = 18
          Brush.Color = 8847117
        end
        object Label14: TLabel
          Left = 188
          Top = 12
          Width = 38
          Height = 13
          Caption = 'Retorno'
        end
      end
    end
    object TS_ConsPagRet_Acum: TNxTabSheet
      Caption = 'Pagamento/Retorno Acumulado'
      PageIndex = 3
      TabFont.Charset = DEFAULT_CHARSET
      TabFont.Color = clWindowText
      TabFont.Height = -11
      TabFont.Name = 'MS Sans Serif'
      TabFont.Style = []
      object SMDBGrid3: TSMDBGrid
        Left = 0
        Top = 0
        Width = 920
        Height = 305
        Align = alClient
        Ctl3D = False
        DataSource = DMBaixaMaterial_Prod.dsConsPagRet_Acum
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnTitleClick = SMDBGrid3TitleClick
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
        OnGetCellParams = SMDBGrid3GetCellParams
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 7
        RowCount = 2
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DESC_TIPO'
            Title.Alignment = taCenter
            Title.Caption = 'Tipo'
            Title.Color = 13750737
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'UNIDADE_MATERIAL'
            Title.Alignment = taCenter
            Title.Caption = 'Unid.'
            Title.Color = 13750737
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD'
            Title.Alignment = taCenter
            Title.Caption = 'Qtde'
            Title.Color = 13750737
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID_MATERIAL'
            Title.Alignment = taCenter
            Title.Caption = 'ID Material'
            Title.Color = 13750737
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_MATERIAL'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Material'
            Title.Color = 13750737
            Width = 263
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_COR_MAT'
            Title.Alignment = taCenter
            Title.Caption = 'Cor Material'
            Title.Color = 13750737
            Width = 226
            Visible = True
          end>
      end
      object Panel3: TPanel
        Left = 0
        Top = 305
        Width = 920
        Height = 30
        Align = alBottom
        Color = clSilver
        TabOrder = 1
        object Shape5: TShape
          Left = 11
          Top = 8
          Width = 28
          Height = 18
          Brush.Color = 16777147
        end
        object Label15: TLabel
          Left = 44
          Top = 12
          Width = 59
          Height = 13
          Caption = 'Pagamentos'
        end
        object Shape6: TShape
          Left = 154
          Top = 8
          Width = 28
          Height = 18
          Brush.Color = 8847117
        end
        object Label16: TLabel
          Left = 188
          Top = 12
          Width = 38
          Height = 13
          Caption = 'Retorno'
        end
      end
    end
    object TS_Ref: TNxTabSheet
      Caption = 'Por Refer'#234'ncia (Pag/Ret)'
      PageIndex = 4
      TabFont.Charset = DEFAULT_CHARSET
      TabFont.Color = clWindowText
      TabFont.Height = -11
      TabFont.Name = 'MS Sans Serif'
      TabFont.Style = []
      object SMDBGrid4: TSMDBGrid
        Left = 0
        Top = 0
        Width = 920
        Height = 335
        Align = alClient
        Ctl3D = False
        DataSource = DMBaixaMaterial_Prod.dsmPagRet_Ref
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnTitleClick = SMDBGrid3TitleClick
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
        OnGetCellParams = SMDBGrid3GetCellParams
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 8
        RowCount = 2
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Referencia'
            Title.Alignment = taCenter
            Title.Caption = 'Refer'#234'ncia'
            Title.Color = 13224393
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome_Cor_Produto'
            Title.Alignment = taCenter
            Title.Caption = 'Cor Refer'#234'ncia'
            Title.Color = 13224393
            Width = 160
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID_Material'
            Title.Alignment = taCenter
            Title.Caption = 'ID Material'
            Title.Color = 13224393
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome_Material'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Material'
            Title.Color = 13224393
            Width = 223
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome_Cor_Material'
            Title.Alignment = taCenter
            Title.Caption = 'Cor Material'
            Title.Color = 13224393
            Width = 249
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Qtd_Pagto'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd Pagto'
            Title.Color = 13224393
            Width = 106
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Qtd_Retorno'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Retorno'
            Title.Color = 13224393
            Width = 107
            Visible = True
          end>
      end
    end
  end
end
