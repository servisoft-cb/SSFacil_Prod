object frmCadProgramacao: TfrmCadProgramacao
  Left = 265
  Top = 162
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmCadProgramacao'
  ClientHeight = 449
  ClientWidth = 920
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
  object Label1: TLabel
    Left = 32
    Top = 8
    Width = 29
    Height = 13
    Caption = 'Qtde.:'
  end
  object SMDBGrid1: TSMDBGrid
    Left = 8
    Top = 40
    Width = 737
    Height = 120
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
    ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 6
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 164
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtd_Bocas'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtd_Disponivel'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtd_Prog'
        Visible = True
      end>
  end
  object SMDBGrid2: TSMDBGrid
    Left = 16
    Top = 224
    Width = 737
    Height = 120
    Ctl3D = False
    DataSource = DMCadProgramacao.dsmProg
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
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
        FieldName = 'ID_Maquina'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome_Maquina'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Num_Boca'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtd'
        Visible = True
      end>
  end
  object CurrencyEdit1: TCurrencyEdit
    Left = 64
    Top = 0
    Width = 121
    Height = 21
    AutoSize = False
    DecimalPlaces = 4
    DisplayFormat = '0.00##'
    TabOrder = 2
  end
  object NxButton1: TNxButton
    Left = 456
    Top = 8
    Width = 75
    Caption = 'Gerar'
    TabOrder = 3
  end
  object StaticText1: TStaticText
    Left = 32
    Top = 168
    Width = 255
    Height = 18
    Caption = 'Duplo Clique para Programar a M'#225'quina'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
end
