object frmGerar_Programacao: TfrmGerar_Programacao
  Left = 93
  Top = 68
  Width = 1109
  Height = 596
  Caption = 'frmGerar_Programacao'
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
  object Splitter1: TSplitter
    Left = 814
    Top = 40
    Width = 8
    Height = 525
    Color = 16744448
    ParentColor = False
  end
  object NxPanel1: TNxPanel
    Left = 0
    Top = 0
    Width = 1101
    Height = 40
    Align = alTop
    UseDockManager = False
    ParentBackground = False
    TabOrder = 0
    object NxButton1: TNxButton
      Left = 24
      Top = 8
      Width = 149
      Caption = 'Efetuar Pesquisa'
      TabOrder = 0
      OnClick = NxButton1Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 40
    Width = 814
    Height = 525
    Align = alLeft
    Caption = 'Panel1'
    TabOrder = 1
    object SMDBGrid1: TSMDBGrid
      Left = 1
      Top = 42
      Width = 812
      Height = 482
      Align = alClient
      Ctl3D = False
      DataSource = DMCadProgramacao.dsPend
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      TabOrder = 0
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
      ColCount = 10
      RowCount = 2
      Columns = <
        item
          Expanded = False
          FieldName = 'NOME_PROCESSO'
          Title.Alignment = taCenter
          Title.Caption = 'Processo'
          Title.Color = 9109503
          Width = 90
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NUM_ORDEM'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' Ordem'
          Title.Color = 9109503
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NUM_LOTE'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' Lote'
          Title.Color = 9109503
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REFERENCIA'
          Title.Alignment = taCenter
          Title.Caption = 'Refer'#234'ncia'
          Title.Color = 9109503
          Width = 106
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_PRODUTO'
          Title.Alignment = taCenter
          Title.Caption = 'Produto'
          Title.Color = 9109503
          Width = 228
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTD'
          Title.Alignment = taCenter
          Title.Caption = 'Qtde.'
          Title.Color = 9109503
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QTD_POR_MIN'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. Por Min'
          Title.Color = 9109503
          Width = 49
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TOTAL_BATIDAS'
          Title.Alignment = taCenter
          Title.Caption = 'Total Batidas'
          Title.Color = 9109503
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TEMPO_PROD'
          Title.Alignment = taCenter
          Title.Caption = 'Tempo Prod. (Hora)'
          Title.Color = 16777088
          Width = 77
          Visible = True
        end>
    end
    object NxPanel2: TNxPanel
      Left = 1
      Top = 1
      Width = 812
      Height = 41
      Align = alTop
      UseDockManager = False
      ParentBackground = False
      TabOrder = 1
      object NxButton2: TNxButton
        Left = 24
        Top = 8
        Width = 75
        Caption = 'Programar'
        TabOrder = 0
      end
    end
  end
  object Panel2: TPanel
    Left = 822
    Top = 40
    Width = 279
    Height = 525
    Align = alClient
    TabOrder = 2
    object SMDBGrid2: TSMDBGrid
      Left = 1
      Top = 42
      Width = 277
      Height = 482
      Align = alClient
      Color = clWhite
      Ctl3D = False
      DataSource = DMCadProgramacao.dsMaqPend
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      TabOrder = 0
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
          FieldName = 'NOME_MAQUINA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'M'#225'quina'
          Title.Color = 8453888
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Width = 123
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTD_BOCA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. Boca'
          Title.Color = 8453888
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Width = 75
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'BOCA_DISPONIVEL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Dispon'#237'vel'
          Title.Color = 8453888
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESPESSURA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'Espessura'
          Title.Color = 8453888
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Width = 73
          Visible = True
        end>
    end
    object NxPanel3: TNxPanel
      Left = 1
      Top = 1
      Width = 277
      Height = 41
      Align = alTop
      Ctl3D = True
      UseDockManager = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 1
      object Label1: TLabel
        Left = 240
        Top = 16
        Width = 142
        Height = 14
        Caption = 'M'#225'quinas Dispon'#237'veis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object NxButton3: TNxButton
        Left = 8
        Top = 16
        Width = 95
        Caption = 'Verificar Tempos'
        TabOrder = 0
      end
    end
  end
end
