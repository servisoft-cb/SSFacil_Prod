object frmConsProgramacao: TfrmConsProgramacao
  Left = 104
  Top = 70
  Width = 1109
  Height = 596
  Caption = 'Consulta Programa'#231#227'o'
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
    Width = 1101
    Height = 565
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object NxPanel2: TNxPanel
      Left = 1
      Top = 1
      Width = 1099
      Height = 41
      Align = alTop
      UseDockManager = False
      ParentBackground = False
      TabOrder = 1
      object btnConsultar: TNxButton
        Left = 13
        Top = 7
        Width = 149
        Height = 26
        Caption = 'Efetuar Pesquisa'
        TabOrder = 0
        OnClick = btnConsultarClick
      end
      object btnImprimir: TNxButton
        Left = 164
        Top = 6
        Width = 149
        Height = 26
        Caption = 'Imprimir'
        TabOrder = 1
        OnClick = btnImprimirClick
      end
    end
    object SMDBGrid1: TSMDBGrid
      Left = 1
      Top = 42
      Width = 1099
      Height = 522
      Align = alClient
      Ctl3D = False
      DataSource = DMConsProgramacao.dsConsProg
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
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
      RegistryKey = 'Software\Scalabium'
      RegistrySection = 'SMDBGrid'
      WidthOfIndicator = 11
      DefaultRowHeight = 17
      ScrollBars = ssHorizontal
      ColCount = 16
      RowCount = 2
      Columns = <
        item
          Expanded = False
          FieldName = 'NOME_MAQUINA'
          Title.Alignment = taCenter
          Title.Caption = 'M'#225'quina'
          Width = 134
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NUM_BOCA'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' Boca'
          Width = 36
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QTD_PROGRAMADO'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. Programado'
          Width = 75
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'REFERENCIA'
          Title.Alignment = taCenter
          Title.Caption = 'Refer'#234'ncia'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_PRODUTO'
          Title.Alignment = taCenter
          Title.Caption = 'Nome Produto'
          Width = 287
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DTINICIAL'
          Title.Alignment = taCenter
          Title.Caption = 'Data Inicial'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'HRINICIAL'
          Title.Alignment = taCenter
          Title.Caption = 'Hora'
          Width = 41
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DTFINAL'
          Title.Alignment = taCenter
          Title.Caption = 'Data Final'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'HRFINAL'
          Title.Alignment = taCenter
          Title.Caption = 'Hora'
          Width = 46
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QTD_LOTE'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. Geral Lote'
          Width = 54
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_PROCESSO'
          Title.Alignment = taCenter
          Title.Caption = 'Processo'
          Width = 104
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ID_PRODUTO'
          Title.Alignment = taCenter
          Title.Caption = 'ID Produto'
          Width = 53
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NUM_ORDEM'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' Ordem'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NUM_LOTE'
          Title.Alignment = taCenter
          Title.Caption = 'N'#186' Lote'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DTPROGRAMACAO'
          Title.Alignment = taCenter
          Title.Caption = 'Data da Gera'#231#227'o'
          Visible = True
        end>
    end
  end
end
