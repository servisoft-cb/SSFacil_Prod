object frmLote_Cancela: TfrmLote_Cancela
  Left = 449
  Top = 260
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cancelar o Lote'
  ClientHeight = 313
  ClientWidth = 525
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 525
    Height = 151
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 28
      Top = 19
      Width = 136
      Height = 13
      Caption = 'Qtd. do Ordem de Produ'#231#227'o:'
    end
    object Label2: TLabel
      Left = 71
      Top = 52
      Width = 93
      Height = 13
      Caption = 'Qtd. Para Cancelar:'
    end
    object Label3: TLabel
      Left = 129
      Top = 75
      Width = 35
      Height = 13
      Caption = 'Motivo:'
    end
    object DBEdit1: TDBEdit
      Left = 165
      Top = 13
      Width = 113
      Height = 19
      TabStop = False
      Color = clBtnFace
      Ctl3D = False
      DataField = 'QTD'
      DataSource = DMCadLote.dsLote
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
    end
    object ceQtdCancelar: TCurrencyEdit
      Left = 165
      Top = 47
      Width = 121
      Height = 21
      AutoSize = False
      Ctl3D = False
      DecimalPlaces = 4
      DisplayFormat = '0.00##'
      ParentCtl3D = False
      TabOrder = 1
    end
    object btnConfirmar: TNxButton
      Left = 164
      Top = 119
      Width = 75
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnConfirmarClick
    end
    object Memo1: TMemo
      Left = 165
      Top = 67
      Width = 345
      Height = 50
      Ctl3D = False
      ParentCtl3D = False
      ScrollBars = ssVertical
      TabOrder = 2
      OnKeyPress = Memo1KeyPress
    end
    object btnExcluir: TNxButton
      Left = 241
      Top = 119
      Width = 75
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btnExcluirClick
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 151
    Width = 525
    Height = 162
    Align = alClient
    Ctl3D = False
    DataSource = DMCadLote.dsLote_Canc
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 6
    RowCount = 2
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ITEM'
        Title.Alignment = taCenter
        Title.Caption = 'Item'
        Title.Color = 16771538
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'QTD'
        Title.Alignment = taCenter
        Title.Caption = 'Qtde.'
        Title.Color = 16771538
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DATA'
        Title.Alignment = taCenter
        Title.Caption = 'Data'
        Title.Color = 16771538
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'HORA'
        Title.Alignment = taCenter
        Title.Caption = 'Hora'
        Title.Color = 16771538
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USUARIO'
        Title.Alignment = taCenter
        Title.Caption = 'Usu'#225'rio'
        Title.Color = 16771538
        Visible = True
      end>
  end
end
