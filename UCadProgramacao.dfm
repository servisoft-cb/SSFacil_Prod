object frmCadProgramacao: TfrmCadProgramacao
  Left = 149
  Top = 63
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #39
  ClientHeight = 598
  ClientWidth = 1105
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
  object SMDBGrid3: TSMDBGrid
    Left = 0
    Top = 227
    Width = 1105
    Height = 371
    Align = alClient
    Ctl3D = False
    DataSource = DMCadProgramacao.dsmMaq_Boca
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = SMDBGrid3DblClick
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
    OnGetCellParams = SMDBGrid3GetCellParams
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 14
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Selecionado'
        Title.Alignment = taCenter
        Title.Caption = 'Sel.'
        Title.Color = 8235263
        Width = 32
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Num_Boca'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Boca'
        Title.Color = 8235263
        Width = 33
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Qtd_Programada'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Program.'
        Title.Color = 8235263
        Width = 51
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DtFinal'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Data Programada'
        Title.Color = 8235263
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HrFinal'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Hora Progr.'
        Title.Color = 8235263
        Width = 58
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DtInicial'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Inicial'
        Title.Color = 8235263
        Width = 78
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'HrInicial'
        Title.Alignment = taCenter
        Title.Caption = 'Hr. Inicial'
        Title.Color = 8235263
        Width = 43
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Qtd_Gerar'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. A Gerar'
        Title.Color = 8235263
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Tempo'
        ReadOnly = True
        Title.Color = 8235263
        Width = 42
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Primeira_Data'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Data Original'
        Title.Color = 8235263
        Width = 78
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Primeira_Hora'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Hora original'
        Title.Color = 8235263
        Width = 49
        Visible = True
      end
      item
        Alignment = taCenter
        Color = 8454143
        Expanded = False
        FieldName = 'DtPrevista'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Data Prevista Encerramento'
        Title.Color = 8454143
        Width = 80
        Visible = True
      end
      item
        Alignment = taCenter
        Color = 8454143
        Expanded = False
        FieldName = 'HrPrevista'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = 'Hora Prevista Encerramento'
        Title.Color = 8454143
        Width = 76
        Visible = True
      end>
  end
  object NxPanel1: TNxPanel
    Left = 0
    Top = 0
    Width = 1105
    Height = 62
    Align = alTop
    UseDockManager = False
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      Left = 60
      Top = 16
      Width = 57
      Height = 13
      Alignment = taRightJustify
      Caption = 'Qtde (MT) .:'
      Transparent = True
    end
    object Label2: TLabel
      Left = 5
      Top = 40
      Width = 112
      Height = 13
      Alignment = taRightJustify
      Caption = 'Qtde. N'#227'o Programada:'
      Transparent = True
    end
    object Label3: TLabel
      Left = 646
      Top = 30
      Width = 32
      Height = 13
      Caption = 'Label3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 118
      Top = 8
      Width = 77
      Height = 21
      AutoSize = False
      Ctl3D = False
      DecimalPlaces = 4
      DisplayFormat = '0.00##'
      ParentCtl3D = False
      TabOrder = 0
    end
    object NxButton2: TNxButton
      Left = 209
      Top = 23
      Width = 121
      Height = 29
      Caption = 'Ajustar Qtdes Maq.'
      TabOrder = 1
      Transparent = True
      OnClick = NxButton2Click
    end
    object CurrencyEdit2: TCurrencyEdit
      Left = 118
      Top = 32
      Width = 77
      Height = 21
      AutoSize = False
      Ctl3D = False
      DecimalPlaces = 4
      DisplayFormat = '0.00##'
      ParentCtl3D = False
      TabOrder = 2
    end
    object NxButton1: TNxButton
      Left = 474
      Top = 23
      Width = 121
      Height = 29
      Caption = 'Calcular Tempo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = NxButton1Click
    end
    object NxButton3: TNxButton
      Left = 330
      Top = 23
      Width = 121
      Height = 29
      Caption = 'Excluir M'#225'quina'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Transparent = True
      OnClick = NxButton3Click
    end
    object btnGravar_Prog: TNxButton
      Left = 887
      Top = 3
      Width = 191
      Height = 34
      Caption = 'Gravar Programa'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      Glyph.Data = {
        AE060000424DAE06000000000000360000002800000017000000170000000100
        18000000000078060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF3F9F4C6CEC7799D7C4D7B4D235C241C561C225E
        224B7B507B9C7CC6CEC7F4F9F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF95A996456A443E663E29682B306B30
        3871373B713A386C3731643129642B3D663D456C4494AA97FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFEFFFFFFFFFFFFFF4E794D2A602A4F844F0F
        5E0F055A08005001015004014E03004B01004700054C050E4C0E4D774F2B622A
        4C7A4EFFFFFFFFFFFFFEFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF4868483F6E
        402F7B30005400045C07075A0B06590906550907550A075309064F08034C0601
        4B03003D002E64303F6C4349694DFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        4D7A4E3E6B3F207723005B0208610E075F0B065B0900560105570907550A0854
        0B085109054F07064C07034C080042001E5B1D3D6B414D7B4FFFFFFFFFFFFF00
        0000FFFFFF97AA992A6028308833006400076809076508056308005600397739
        04550500550505560707540B065309065008044D06034D050042002F65312860
        2898AA99FFFFFF000000F5F9F64266464F9051006100066B0C07690A07670A00
        54004B854CFFFFFFA6C1A6004D0000550306550908530A075209065007044C05
        044B09003E004E7850456D46F6F9F6000000C6CEC63F6640107C12056D09066C
        0A056A0A0059003C7F3BFFFFFFFFFFFFFFFFFFABC6AD004D0203550605550908
        550B065209054F07044C06014C040D4C0F3B643CC6CFC600000079997A37823A
        2183260F761407720E005E00559256FFFFFFFFFFFFFEFEFEFEFFFEFFFFFFBED2
        C0004A0002540506560806540907530A064F08034D05054C062A632B7DA08000
        00004A7B4D4C954F29892F218426006500639E66FFFFFFFFFFFFFEFEFFFFFFFF
        FFFFFFFFFEFFFFFFFFA6C1A8004B0002550506550907540A085209054F080047
        002E6330517E52000000245E2767AE6D39964028872D79B37DFFFFFFF7F9F9F9
        FCFAFFFFFFD2DFD1FCFEFDFFFFFFFFFFFFFFFFFFBED2C0014E02005503055608
        07540A075309004C01376C3427612A0000001F562078BA80479F4D449948DFEF
        DFF6FBF8F0F4EDFFFFFFB4CFB5004F00639663FFFFFFFFFFFFFEFEFFFFFFFFAD
        C6B0014D0200550207540A07540A014E033970371B561C000000275E2782BF87
        5DAA604DA0533D9141F1FAF0FFFFFFBAD4B8005B00006A04005A00689967FFFF
        FFFFFFFFFEFFFFFFFFFFA9C4AC004B00015605065509014F0436723529602900
        000048764A7DB18171B87565B16957A55A519E56A2CCA4248729177A20016D06
        056E0A005400568C55FFFFFFFFFFFFFFFFFEFFFFFFC0D6C30048000055040052
        022E6C2E517D530000007494746B9F6F89C88B75B7776BB26F5BA85F45994C4E
        9C51429748258227006604006E090056006E9C6DFFFFFFFFFFFFFEFEFFFFFFFF
        B3C9B4145F150157062A682D7B9F80000000C4CCC4476C46A0D3A382C3887EBC
        8072B67569AE6B5DA76153A2554E9D52358F3A0B7110006C030055005B8E59FF
        FFFFFFFFFFFFFFFFAEC9B00053000D600F3E653EC6CFC6000000F6FBF72E572F
        B5CFB495CC9B8FC69183BF8779B97C6EB17263AA675AA45D519E5446984E2885
        2D0C7413005100639261FFFFFFB6D0B50044000051004D8452456A45F6FBF700
        0000FFFFFF9BAA9A1F571FDBF9DD99CC9C92C79789C28A7DB98271B37868AD6B
        5CA661549F5B4C9A503F8F422F89350D6D143A8537006208005900338035295C
        299BAE9AFFFFFF000000FEFFFFFFFFFF45744B507850D2F0D2A1D0A798CC9D91
        C79384C0887CBA8070B27466AD685CA460519C5546954B3F8F432B83321E7922
        36873B3E6C3E4E7C51FFFFFFFFFEFF000000FFFFFFFFFFFFFFFFFF4160404F77
        4FE9FFEAAAD7AE9FCEA093C7988AC28D81BA8376B5786CAD6F60A664569D5A49
        984D32893961A8653B6C3C476848FFFFFFFFFFFFFFFFFF000000FFFFFFFFFEFF
        FFFFFFFFFFFF45744A20561EC3D8C3C0E5C3B1DDB69ED0A493C69587BF8A7EBA
        7F71B37570B37564AB6B81AE822259234F7A4FFFFFFFFFFFFFFFFFFEFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9BAB9B29552C466B4985AA849EC5A0
        B2D5B5B0D8B5A0CCA482B2856295644169433B5D3C99AE9BFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FCF6C3
        CBC3719270447545255F24225624245E28457649739575C5CDC5F6FBF7FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
      ParentFont = False
      TabOrder = 5
      Transparent = True
      OnClick = btnGravar_ProgClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 62
    Width = 1105
    Height = 165
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 2
    object SMDBGrid1: TSMDBGrid
      Left = 1
      Top = 1
      Width = 439
      Height = 163
      Align = alLeft
      Ctl3D = False
      DataSource = DMCadProgramacao.dsmMaq
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      TabOrder = 0
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
      ExOptions = [eoDisableDelete, eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
      RegistryKey = 'Software\Scalabium'
      RegistrySection = 'SMDBGrid'
      WidthOfIndicator = 11
      DefaultRowHeight = 17
      ScrollBars = ssHorizontal
      RowCount = 2
      Columns = <
        item
          Expanded = False
          FieldName = 'Nome'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'M'#225'quina'
          Title.Color = 11075409
          Width = 138
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Qtd_Bocas'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. Boca'
          Title.Color = 11075409
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Qtd_Disponivel'
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. Dispon'#237'vel'
          Title.Color = 11075409
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Qtd_Prog'
          Title.Caption = 'Qtd. Prod'
          Title.Color = 11075409
          Width = 71
          Visible = True
        end>
    end
    object SMDBGrid2: TSMDBGrid
      Left = 496
      Top = 1
      Width = 608
      Height = 163
      Align = alRight
      Ctl3D = False
      DataSource = DMCadProgramacao.dsmProg
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
      DefaultRowHeight = 16
      ScrollBars = ssHorizontal
      ColCount = 9
      RowCount = 2
      Columns = <
        item
          Expanded = False
          FieldName = 'Nome_Maquina'
          Title.Alignment = taCenter
          Title.Caption = 'M'#225'quina'
          Title.Color = 16777145
          Width = 164
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Num_Boca'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' Boca'
          Title.Color = 16777145
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Qtd'
          Title.Alignment = taCenter
          Title.Caption = 'Qtde.'
          Title.Color = 16777145
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DtInicial'
          Title.Alignment = taCenter
          Title.Caption = 'Data Inicial'
          Title.Color = 16777145
          Width = 67
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'HrInicial'
          Title.Alignment = taCenter
          Title.Caption = 'Hora'
          Title.Color = 16777145
          Width = 39
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Tempo'
          Title.Alignment = taCenter
          Title.Color = 16777145
          Width = 38
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DtFinal'
          Title.Alignment = taCenter
          Title.Caption = 'Data Final'
          Title.Color = 16777145
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'HrFinal'
          Title.Alignment = taCenter
          Title.Caption = 'Hora'
          Title.Color = 16777145
          Width = 44
          Visible = True
        end>
    end
  end
end
