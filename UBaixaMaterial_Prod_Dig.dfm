object frmBaixaMaterial_Prod_Dig: TfrmBaixaMaterial_Prod_Dig
  Left = 257
  Top = 171
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmBaixaMaterial_Prod_Dig'
  ClientHeight = 443
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
    Left = 18
    Top = 93
    Width = 137
    Height = 16
    Alignment = taRightJustify
    Caption = 'Qtd. Consumo Total:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 66
    Top = 114
    Width = 89
    Height = 16
    Alignment = taRightJustify
    Caption = 'Qtd. j'#225' Paga:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 31
    Top = 135
    Width = 124
    Height = 16
    Alignment = taRightJustify
    Caption = 'Qtd. j'#225' Retornada:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 65
    Top = 14
    Width = 90
    Height = 16
    Alignment = taRightJustify
    Caption = 'N'#186' da Ordem:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 312
    Top = 14
    Width = 36
    Height = 16
    Alignment = taRightJustify
    Caption = 'Item:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 97
    Top = 35
    Width = 58
    Height = 16
    Alignment = taRightJustify
    Caption = 'Material:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 70
    Top = 56
    Width = 85
    Height = 16
    Alignment = taRightJustify
    Caption = 'Cor Material:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 87
    Top = 156
    Width = 68
    Height = 16
    Alignment = taRightJustify
    Caption = 'Diferen'#231'a:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object DBEdit1: TDBEdit
    Left = 157
    Top = 86
    Width = 121
    Height = 22
    TabStop = False
    Color = clBtnFace
    Ctl3D = False
    DataField = 'QTD_CONSUMO'
    DataSource = DMBaixaMaterial_Prod.dsConsLoteMat_Prod
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 157
    Top = 107
    Width = 121
    Height = 22
    TabStop = False
    Color = clBtnFace
    Ctl3D = False
    DataField = 'QTD_PAGO'
    DataSource = DMBaixaMaterial_Prod.dsConsLoteMat_Prod
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 157
    Top = 128
    Width = 121
    Height = 22
    TabStop = False
    Color = clBtnFace
    Ctl3D = False
    DataField = 'QTD_RETORNO'
    DataSource = DMBaixaMaterial_Prod.dsConsLoteMat_Prod
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object DBEdit4: TDBEdit
    Left = 157
    Top = 8
    Width = 121
    Height = 22
    TabStop = False
    Color = clBtnFace
    Ctl3D = False
    DataField = 'NUM_ORDEM'
    DataSource = DMBaixaMaterial_Prod.dsConsLoteMat_Prod
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
  object DBEdit5: TDBEdit
    Left = 351
    Top = 8
    Width = 120
    Height = 22
    TabStop = False
    Color = clBtnFace
    Ctl3D = False
    DataField = 'ITEM'
    DataSource = DMBaixaMaterial_Prod.dsConsLoteMat_Prod
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
  end
  object DBEdit6: TDBEdit
    Left = 157
    Top = 29
    Width = 64
    Height = 22
    TabStop = False
    Color = clBtnFace
    Ctl3D = False
    DataField = 'ID_MATERIAL'
    DataSource = DMBaixaMaterial_Prod.dsConsLoteMat_Prod
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
  end
  object DBEdit7: TDBEdit
    Left = 220
    Top = 29
    Width = 251
    Height = 22
    TabStop = False
    Color = clBtnFace
    Ctl3D = False
    DataField = 'NOME_MATERIAL'
    DataSource = DMBaixaMaterial_Prod.dsConsLoteMat_Prod
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
  end
  object DBEdit8: TDBEdit
    Left = 157
    Top = 50
    Width = 314
    Height = 22
    TabStop = False
    Color = clBtnFace
    Ctl3D = False
    DataField = 'NOME_COR_MAT'
    DataSource = DMBaixaMaterial_Prod.dsConsLoteMat_Prod
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 8
  end
  object Panel1: TPanel
    Left = 3
    Top = 181
    Width = 477
    Height = 262
    Align = alCustom
    Color = 16763541
    TabOrder = 0
    object Label9: TLabel
      Left = 20
      Top = 62
      Width = 95
      Height = 16
      Alignment = taRightJustify
      Caption = 'Pago/Retorno:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 85
      Top = 93
      Width = 30
      Height = 16
      Alignment = taRightJustify
      Caption = 'Qtd:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object NxComboBox1: TNxComboBox
      Left = 117
      Top = 53
      Width = 121
      Height = 24
      Cursor = crArrow
      BevelOuter = bvSpace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ReadOnly = True
      HideFocus = False
      Style = dsDropDownList
      AutoComplete = True
      AutoCompleteDelay = 0
      ItemIndex = 0
      Items.Strings = (
        ''
        'Pago'
        'Retorno')
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 118
      Top = 88
      Width = 121
      Height = 21
      AutoSize = False
      Ctl3D = False
      DecimalPlaces = 4
      DisplayFormat = '0.0000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
    end
    object btnConfirmar: TNxButton
      Left = 117
      Top = 128
      Width = 122
      Height = 32
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnConfirmarClick
    end
    object btnCancelar: TNxButton
      Left = 238
      Top = 128
      Width = 122
      Height = 32
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnCancelarClick
    end
  end
  object DBEdit9: TDBEdit
    Left = 157
    Top = 149
    Width = 121
    Height = 22
    TabStop = False
    Color = clBtnFace
    Ctl3D = False
    DataField = 'QTD_DIFERENCA'
    DataSource = DMBaixaMaterial_Prod.dsConsLoteMat_Prod
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 9
  end
  object NxPanel1: TNxPanel
    Left = 480
    Top = 0
    Width = 440
    Height = 443
    Align = alRight
    Caption = 'NxPanel1'
    UseDockManager = False
    ParentBackground = False
    TabOrder = 10
    object SMDBGrid1: TSMDBGrid
      Left = 0
      Top = 32
      Width = 440
      Height = 411
      Align = alClient
      Ctl3D = False
      DataSource = DMBaixaMaterial_Prod.dsLote_Mat_Prod_Est
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
          Alignment = taCenter
          Expanded = False
          FieldName = 'DESC_TIPO_ES'
          Title.Alignment = taCenter
          Title.Caption = 'Tipo'
          Title.Color = 8454016
          Width = 69
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ITEM_EST'
          Title.Alignment = taCenter
          Title.Caption = 'Item'
          Title.Color = 8454016
          Width = 25
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DATA'
          Title.Alignment = taCenter
          Title.Caption = 'Data'
          Title.Color = 8454016
          Width = 73
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'HORA'
          Title.Alignment = taCenter
          Title.Caption = 'Hora'
          Title.Color = 8454016
          Width = 41
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QTD'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd'
          Title.Color = 8454016
          Width = 87
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'USUARIO'
          Title.Alignment = taCenter
          Title.Caption = 'Usu'#225'rio'
          Title.Color = 8454016
          Visible = True
        end>
    end
    object NxPanel2: TNxPanel
      Left = 0
      Top = 0
      Width = 440
      Height = 32
      Align = alTop
      Color = clSilver
      ColorScheme = csSilver
      UseDockManager = False
      ParentBackground = False
      ParentColor = False
      TabOrder = 1
      object btnExcluir: TNxButton
        Left = 369
        Top = 4
        Width = 65
        Caption = 'Excluir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btnExcluirClick
      end
    end
  end
end