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
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 8
    Top = 48
    Width = 713
    Height = 393
    DataSource = DMCadProgramacao.dsPend
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Flat = False
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
    ColCount = 7
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'NOME_PROCESSO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_ORDEM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_LOTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_PRODUTO'
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD'
        Visible = True
      end>
  end
end
