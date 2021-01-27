object frmConsTalao_Etiq: TfrmConsTalao_Etiq
  Left = 510
  Top = 134
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmConsTalao_Etiq'
  ClientHeight = 473
  ClientWidth = 505
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
  object PnlConsRapida: TPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 473
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Cons. Baixa Confer'#234'ncia'
    TabOrder = 0
    object SMDBGrid2: TSMDBGrid
      Left = 0
      Top = 47
      Width = 505
      Height = 404
      Align = alClient
      Ctl3D = False
      DataSource = DMBaixaProd.dsRapido
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = SMDBGrid2DblClick
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
      OnGetCellParams = SMDBGrid2GetCellParams
      RegistryKey = 'Software\Scalabium'
      RegistrySection = 'SMDBGrid'
      WidthOfIndicator = 11
      DefaultRowHeight = 17
      ScrollBars = ssHorizontal
      ColCount = 8
      RowCount = 2
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ITEM'
          Title.Alignment = taCenter
          Title.Caption = 'Item'
          Width = 27
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REFERENCIA'
          Title.Alignment = taCenter
          Title.Caption = 'Refer'#234'ncia'
          Width = 105
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QTD'
          Title.Alignment = taCenter
          Title.Caption = 'Qtde.'
          Width = 53
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QTD_CONFERIDO'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. Conf.'
          Width = 53
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QTD_LIBERADA'
          Title.Alignment = taCenter
          Title.Caption = 'Q. Pr'#233' Fat.'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QTD_FATURADO'
          Title.Alignment = taCenter
          Title.Caption = 'Q.Fat.'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QTD_REST_CONF'
          Title.Alignment = taCenter
          Title.Caption = 'Q.Falta Conf.'
          Width = 56
          Visible = True
        end>
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 505
      Height = 47
      Align = alTop
      BevelOuter = bvNone
      Color = 16768667
      TabOrder = 1
      object Label12: TLabel
        Left = 35
        Top = 13
        Width = 51
        Height = 13
        Caption = 'N'#186' Pedido:'
      end
      object Shape1: TShape
        Left = 232
        Top = 23
        Width = 22
        Height = 15
        Brush.Color = clYellow
      end
      object Label13: TLabel
        Left = 256
        Top = 24
        Width = 43
        Height = 13
        Caption = 'N'#227'o Lido'
      end
      object Shape2: TShape
        Left = 232
        Top = 6
        Width = 22
        Height = 15
        Brush.Color = 8454016
      end
      object Label14: TLabel
        Left = 256
        Top = 8
        Width = 59
        Height = 13
        Caption = 'J'#225' Conferido'
      end
      object Label15: TLabel
        Left = 8
        Top = 31
        Width = 78
        Height = 13
        Caption = 'Ped. Cliente OC:'
      end
      object CurrencyEdit3: TCurrencyEdit
        Left = 88
        Top = 5
        Width = 121
        Height = 21
        AutoSize = False
        Ctl3D = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        ParentCtl3D = False
        TabOrder = 0
        OnKeyDown = CurrencyEdit3KeyDown
      end
      object Edit2: TEdit
        Left = 88
        Top = 25
        Width = 121
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        OnKeyDown = Edit2KeyDown
      end
    end
    object NxPanel1: TNxPanel
      Left = 0
      Top = 451
      Width = 505
      Height = 22
      Align = alBottom
      Caption = 'Duplo Clique para Consultar e Excluir Baixa'
      Ctl3D = False
      UseDockManager = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentBackground = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
    end
  end
end
