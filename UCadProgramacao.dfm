object frmCadProgramacao: TfrmCadProgramacao
  Left = 188
  Top = 143
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmCadProgramacao'
  ClientHeight = 449
  ClientWidth = 1072
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
    Alignment = taRightJustify
    Caption = 'Qtde.:'
  end
  object Label2: TLabel
    Left = 225
    Top = 9
    Width = 112
    Height = 13
    Alignment = taRightJustify
    Caption = 'Qtde. N'#227'o Programada:'
  end
  object SMDBGrid1: TSMDBGrid
    Left = 6
    Top = 38
    Width = 514
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
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtd_Prog'
        Visible = True
      end>
  end
  object SMDBGrid2: TSMDBGrid
    Left = 7
    Top = 203
    Width = 511
    Height = 184
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
    Left = 486
    Top = 4
    Width = 75
    Caption = 'Gerar'
    TabOrder = 3
    OnClick = NxButton1Click
  end
  object StaticText1: TStaticText
    Left = 31
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
  object CurrencyEdit2: TCurrencyEdit
    Left = 338
    Top = 1
    Width = 121
    Height = 21
    AutoSize = False
    DecimalPlaces = 4
    DisplayFormat = '0.00##'
    TabOrder = 5
  end
  object SMDBGrid3: TSMDBGrid
    Left = 531
    Top = 39
    Width = 511
    Height = 323
    Ctl3D = False
    DataSource = DMCadProgramacao.dsmMaq_Boca
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    TabOrder = 6
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
    ColCount = 8
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'Selecionado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Num_Boca'
        Visible = True
      end
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
      end>
  end
end
