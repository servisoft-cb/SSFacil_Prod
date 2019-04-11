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
    Left = 860
    Top = 0
    Width = 8
    Height = 565
    Color = 16744448
    ParentColor = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 860
    Height = 565
    Align = alLeft
    Caption = 'Panel1'
    TabOrder = 0
    object NxPanel2: TNxPanel
      Left = 1
      Top = 1
      Width = 858
      Height = 41
      Align = alTop
      UseDockManager = False
      ParentBackground = False
      TabOrder = 1
      object btnProgramar: TNxButton
        Left = 213
        Top = 8
        Width = 100
        Height = 27
        Caption = 'Programar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btnProgramarClick
      end
      object btnConsultar: TNxButton
        Left = 9
        Top = 7
        Width = 149
        Height = 26
        Caption = 'Efetuar Pesquisa'
        TabOrder = 1
        OnClick = btnConsultarClick
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 532
      Width = 858
      Height = 32
      Align = alBottom
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object Label2: TLabel
        Left = 40
        Top = 8
        Width = 235
        Height = 16
        Caption = 'F3 Setup Inicial      F4 Setup Troca'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
    end
    object SMDBGrid1: TSMDBGrid
      Left = 1
      Top = 42
      Width = 858
      Height = 490
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
      OnKeyDown = SMDBGrid1KeyDown
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
      ColCount = 14
      RowCount = 2
      Columns = <
        item
          Expanded = False
          FieldName = 'NOME_PROCESSO'
          Title.Alignment = taCenter
          Title.Caption = 'Processo'
          Title.Color = 9109503
          Width = 70
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NUM_ORDEM'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' Ordem'
          Title.Color = 9109503
          Width = 50
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
          Width = 98
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
          Width = 40
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'SETUP_INICIO'
          Title.Alignment = taCenter
          Title.Caption = 'S. In'#237'cio'
          Title.Color = 9109503
          Width = 37
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'SOMA_SETUP_INI'
          Title.Alignment = taCenter
          Title.Caption = 'I'
          Title.Color = 9109503
          Width = 14
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'SETUP_TROCA'
          Title.Alignment = taCenter
          Title.Caption = 'S. Troca'
          Title.Color = 9109503
          Width = 31
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'SOMA_SETUP_TRO'
          Title.Alignment = taCenter
          Title.Caption = 'T'
          Title.Color = 9109503
          Width = 15
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
          FieldName = 'clTempo_Hora'
          Title.Alignment = taCenter
          Title.Caption = 'Tempo'
          Title.Color = 16777088
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 868
    Top = 0
    Width = 233
    Height = 565
    Align = alClient
    TabOrder = 1
    object SMDBGrid2: TSMDBGrid
      Left = 1
      Top = 42
      Width = 231
      Height = 522
      Align = alClient
      Color = clWhite
      Ctl3D = False
      DataSource = DMCadProgramacao.dsMaqPend
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentCtl3D = False
      ReadOnly = True
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
      ExOptions = [eoCheckBoxSelect, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
      OnGetCellParams = SMDBGrid2GetCellParams
      RegistryKey = 'Software\Scalabium'
      RegistrySection = 'SMDBGrid'
      WidthOfIndicator = 27
      DefaultRowHeight = 17
      ScrollBars = ssHorizontal
      ColCount = 6
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
          Width = 89
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
          Width = 44
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
          Title.Caption = 'Qtd. Disp.'
          Title.Color = 8453888
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Width = 51
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
          Title.Caption = 'Largura'
          Title.Color = 8453888
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'clTempo_Hora'
          Title.Alignment = taCenter
          Title.Caption = 'Tempo'
          Title.Color = 16777088
          Visible = True
        end>
    end
    object NxPanel3: TNxPanel
      Left = 1
      Top = 1
      Width = 231
      Height = 41
      Align = alTop
      Ctl3D = True
      UseDockManager = False
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 1
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
