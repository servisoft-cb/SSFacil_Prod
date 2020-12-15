object frmEstornarBaixa_Talao: TfrmEstornarBaixa_Talao
  Left = 247
  Top = 176
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmEstornarBaixa_Talao'
  ClientHeight = 368
  ClientWidth = 920
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 920
    Height = 47
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 9
      Top = 18
      Width = 87
      Height = 18
      Alignment = taRightJustify
      Caption = 'C'#243'd.Barra:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Edit1: TEdit
      Left = 98
      Top = 12
      Width = 202
      Height = 24
      Color = 16777119
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnKeyDown = Edit1KeyDown
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 80
    Width = 920
    Height = 288
    Align = alClient
    Ctl3D = False
    DataSource = DMBaixaProd_Calc.dsEstornoTalao
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
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
    ExOptions = [eoCheckBoxSelect, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 27
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 10
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'NUM_LOTE'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Lote'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUM_TALAO'
        Title.Alignment = taCenter
        Title.Caption = 'N'#186' Tal'#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_SETOR'
        Title.Alignment = taCenter
        Title.Caption = 'ID Setor'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_SETOR'
        Title.Alignment = taCenter
        Title.Caption = 'Nome Setor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTENTRADA'
        Title.Alignment = taCenter
        Title.Caption = 'DT. Inicio'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTSAIDA'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. Baixa'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD'
        Title.Alignment = taCenter
        Title.Caption = 'Qtde.'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD_PRODUZIDO'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Produzido'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD_PENDENTE'
        Title.Alignment = taCenter
        Title.Caption = 'Qtd. Pendente'
        Width = 86
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 47
    Width = 920
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    Color = clSilver
    TabOrder = 2
    object NxButton1: TNxButton
      Left = 96
      Top = 3
      Width = 261
      Height = 28
      Caption = 'Estornar Selecionado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = NxButton1Click
    end
  end
end
