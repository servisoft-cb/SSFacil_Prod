object frmCadProgramacao: TfrmCadProgramacao
  Left = 149
  Top = 63
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmCadProgramacao'
  ClientHeight = 568
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
    Left = -1
    Top = 50
    Width = 525
    Height = 208
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
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'Nome'
        Title.Alignment = taCenter
        Title.Caption = 'M'#225'quina'
        Title.Color = 11075409
        Width = 164
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtd_Bocas'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Boca'
        Title.Color = 11075409
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtd_Disponivel'
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
    Left = 3
    Top = 272
    Width = 545
    Height = 287
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
    ColCount = 9
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'Nome_Maquina'
        Title.Alignment = taCenter
        Title.Caption = 'M'#225'quina'
        Width = 101
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Num_Boca'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Boca'
        Width = 47
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Qtd'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Produto'
        Width = 74
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Tempo'
        Title.Alignment = taCenter
        Width = 54
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DtInicial'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Inicial'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'HrInicial'
        Title.Alignment = taCenter
        Title.Caption = 'Hr. Inicial'
        Width = 48
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DtFinal'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Final'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'HrFinal'
        Title.Alignment = taCenter
        Title.Caption = 'Hr, Final'
        Width = 46
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
    Left = 473
    Top = 1
    Width = 75
    Caption = 'Calcular'
    TabOrder = 3
    OnClick = NxButton1Click
  end
  object CurrencyEdit2: TCurrencyEdit
    Left = 338
    Top = 1
    Width = 121
    Height = 21
    AutoSize = False
    DecimalPlaces = 4
    DisplayFormat = '0.00##'
    TabOrder = 4
  end
  object SMDBGrid3: TSMDBGrid
    Left = 556
    Top = 8
    Width = 540
    Height = 390
    Ctl3D = False
    DataSource = DMCadProgramacao.dsmMaq_Boca
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    TabOrder = 5
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
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 10
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Selecionado'
        Title.Alignment = taCenter
        Title.Caption = 'Sel.'
        Width = 32
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Num_Boca'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Boca'
        Width = 33
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Qtd_Programada'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Program.'
        Width = 51
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DtInicial'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Inicial'
        Width = 68
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'HrInicial'
        Title.Alignment = taCenter
        Title.Caption = 'Hr. Inicial'
        Width = 43
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Qtd_Gerar'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. A Gerar'
        Width = 57
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Tempo'
        Width = 42
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DtPrevista'
        Title.Alignment = taCenter
        Title.Caption = 'Data Prevista'
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'HrPrevista'
        Title.Alignment = taCenter
        Title.Caption = 'Hora Prevista'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 566
    Top = 431
    Width = 504
    Height = 112
    TabOrder = 6
  end
end
