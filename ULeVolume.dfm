object frmLeVolume: TfrmLeVolume
  Left = 243
  Top = 35
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmLeVolume'
  ClientHeight = 550
  ClientWidth = 947
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 947
    Height = 550
    Align = alClient
    TabOrder = 0
    object RzPageControl1: TRzPageControl
      Left = 1
      Top = 1
      Width = 945
      Height = 548
      ActivePage = TabSheet1
      Align = alClient
      TabIndex = 0
      TabOrder = 0
      FixedDimension = 19
      object TabSheet1: TRzTabSheet
        Caption = 'Volumes'
        object Panel1: TPanel
          Left = 0
          Top = 97
          Width = 941
          Height = 72
          Align = alTop
          TabOrder = 1
          object Label5: TLabel
            Left = 16
            Top = 8
            Width = 897
            Height = 57
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -17
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
          end
        end
        object NxPanel1: TNxPanel
          Left = 0
          Top = 0
          Width = 941
          Height = 97
          Align = alTop
          UseDockManager = False
          ParentBackground = False
          TabOrder = 0
          object Label1: TLabel
            Left = 40
            Top = 15
            Width = 73
            Height = 16
            Alignment = taRightJustify
            Caption = 'N'#186' Volume:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label2: TLabel
            Left = 526
            Top = 14
            Width = 75
            Height = 16
            Alignment = taRightJustify
            Caption = 'C'#243'd. Barra:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object Label3: TLabel
            Left = 27
            Top = 35
            Width = 86
            Height = 16
            Alignment = taRightJustify
            Caption = 'Qtd. Pacote:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            Transparent = True
          end
          object CurrencyEdit1: TCurrencyEdit
            Left = 115
            Top = 10
            Width = 89
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clBtnFace
            Ctl3D = False
            DecimalPlaces = 0
            DisplayFormat = '0'
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
          object Edit1: TEdit
            Left = 603
            Top = 8
            Width = 181
            Height = 22
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            OnChange = Edit1Change
            OnKeyDown = Edit1KeyDown
          end
          object btnFecharVolume: TNxButton
            Left = 115
            Top = 54
            Width = 129
            Height = 28
            Caption = 'Fechar Volume'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -12
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            TabStop = False
            OnClick = btnFecharVolumeClick
          end
          object CurrencyEdit2: TCurrencyEdit
            Left = 115
            Top = 30
            Width = 89
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clBtnFace
            Ctl3D = False
            DecimalPlaces = 0
            DisplayFormat = '0'
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
        end
        object Panel4: TPanel
          Left = 0
          Top = 169
          Width = 475
          Height = 356
          Align = alLeft
          TabOrder = 2
          object SMDBGrid2: TSMDBGrid
            Left = 1
            Top = 42
            Width = 473
            Height = 313
            Align = alClient
            Ctl3D = False
            DataSource = DMCadPreFat.dsPreFat_Vol
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
            RowCount = 2
            Columns = <
              item
                Expanded = False
                FieldName = 'NUM_VOLUME'
                Title.Alignment = taCenter
                Title.Caption = 'N'#186' Volume'
                Title.Color = 16777088
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QTD_PROD'
                Title.Alignment = taCenter
                Title.Caption = 'Qtd. Produto'
                Title.Color = 16777088
                Width = 82
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QTD_ETIQ'
                Title.Alignment = taCenter
                Title.Caption = 'Total Etiqueta'
                Title.Color = 16777088
                Width = 91
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHADA'
                Title.Alignment = taCenter
                Title.Caption = 'Fechado'
                Title.Color = 16777088
                Width = 69
                Visible = True
              end>
          end
          object Panel3: TPanel
            Left = 1
            Top = 1
            Width = 473
            Height = 41
            Align = alTop
            TabOrder = 1
            object Label6: TLabel
              Left = 184
              Top = 17
              Width = 117
              Height = 18
              Caption = '... Volumes ...'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
            end
            object btnExcluirVolume: TNxButton
              Left = 3
              Top = 5
              Width = 129
              Height = 28
              Caption = 'Excluir Volume'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -12
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              TabStop = False
              OnClick = btnExcluirVolumeClick
            end
          end
        end
        object Panel5: TPanel
          Left = 475
          Top = 169
          Width = 466
          Height = 356
          Align = alClient
          TabOrder = 3
          object Label4: TLabel
            Left = 72
            Top = 9
            Width = 112
            Height = 18
            Caption = '... Pacotes ...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object SMDBGrid1: TSMDBGrid
            Left = 1
            Top = 36
            Width = 464
            Height = 319
            Align = alBottom
            Anchors = [akLeft, akTop, akRight, akBottom]
            Ctl3D = False
            DataSource = DMCadPreFat.dsPreFat_Vol_Etiq
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
                FieldName = 'ITEM_ETIQ'
                Title.Alignment = taCenter
                Title.Caption = 'Item'
                Title.Color = 12058479
                Width = 29
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ITEM_TALAO'
                Title.Alignment = taCenter
                Title.Caption = 'Item Tal'#227'o'
                Title.Color = 12058479
                Width = 46
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QTD'
                Title.Alignment = taCenter
                Title.Caption = 'Qtde.'
                Title.Color = 12058479
                Width = 84
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'clPedido_Cliente'
                Title.Alignment = taCenter
                Title.Caption = 'N'#186' Pedido Cliente'
                Title.Color = 12058479
                Width = 134
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'clNum_Pedido'
                Title.Alignment = taCenter
                Title.Caption = 'N'#186' Ped. Interno'
                Title.Color = 12058479
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ITEM_PEDIDO'
                Title.Alignment = taCenter
                Title.Caption = 'Item Pedido'
                Title.Color = 12058479
                Width = 38
                Visible = True
              end>
          end
          object btnExcluirPacote: TNxButton
            Left = 325
            Top = 4
            Width = 110
            Height = 25
            Caption = 'Excluir Pacote'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -12
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            TabStop = False
            OnClick = btnExcluirPacoteClick
          end
        end
      end
    end
  end
end
