object frmCadProgramacao_Maq: TfrmCadProgramacao_Maq
  Left = 313
  Top = 113
  Width = 928
  Height = 480
  Caption = 'frmCadProgramacao_Maq'
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
  object SMDBGrid1: TSMDBGrid
    Left = 8
    Top = 40
    Width = 737
    Height = 305
    Ctl3D = False
    DataSource = DMCadProgramacao.dsMaq_Boca
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
    ColCount = 8
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'Qtd_Programada'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DtFinal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HrFinal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtd_Gerar'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tempo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_Maquina'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Num_Boca'
        Visible = True
      end>
  end
end
