object frmBaixaLote_Calc2: TfrmBaixaLote_Calc2
  Left = 207
  Top = 195
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Seleciona os Setores para dar Baixa'
  ClientHeight = 329
  ClientWidth = 910
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 910
    Height = 329
    Align = alClient
    Color = clSilver
    TabOrder = 0
    object Label5: TLabel
      Left = 0
      Top = 288
      Width = 891
      Height = 77
      AutoSize = False
      Color = 11908533
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -29
      Font.Name = 'Verdana'
      Font.Style = [fsBold, fsUnderline]
      ParentColor = False
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 8
      Top = 11
      Width = 891
      Height = 267
      BevelOuter = bvNone
      Color = 14671839
      TabOrder = 0
      object Label3: TLabel
        Left = 33
        Top = 11
        Width = 67
        Height = 18
        Caption = 'SETOR:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 232
        Top = 16
        Width = 238
        Height = 13
        Caption = 'Informe o ID do Setor e pressione ENTER'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SMDBGrid1: TSMDBGrid
        Left = 0
        Top = 40
        Width = 891
        Height = 227
        TabStop = False
        Align = alBottom
        BorderStyle = bsNone
        Ctl3D = False
        DataSource = DMBaixaProd_Calc.dsmLote_Setor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = SMDBGrid1DblClick
        OnKeyDown = SMDBGrid1KeyDown
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
        ExOptions = [eoBooleanAsCheckBox, eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
        OnGetCellParams = SMDBGrid1GetCellParams
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 10
        RowCount = 2
        Columns = <
          item
            Expanded = False
            FieldName = 'Selecionado'
            ReadOnly = True
            Title.Color = 13565902
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID_Setor'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'ID Setor'
            Title.Color = 13565902
            Width = 44
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Item'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Color = 13565902
            Width = 39
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome_Setor'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Setor'
            Title.Color = 13565902
            Width = 218
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DtEntrada'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Dt. Inicio'
            Title.Color = 13565902
            Width = 90
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Qtd'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Qtde'
            Title.Color = 13565902
            Width = 74
            Visible = True
          end
          item
            Alignment = taCenter
            Color = 11599871
            Expanded = False
            FieldName = 'Qtd_Pendente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Pendente'
            Title.Color = 13565902
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_Esteira'
            Title.Alignment = taCenter
            Title.Caption = 'ID Est.'
            Title.Color = 13565902
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome_Esteira'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Nome Esteira'
            Title.Color = 13565902
            Visible = True
          end>
      end
      object btnConfirmar: TNxButton
        Left = 638
        Top = 7
        Width = 130
        Height = 30
        Caption = 'Confirmar (F7)'
        Down = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = []
        GlyphSpacing = 5
        ParentFont = False
        TabOrder = 2
        Transparent = True
        Visible = False
        OnClick = btnConfirmarClick
      end
      object btnCancelar: TNxButton
        Left = 769
        Top = 7
        Width = 109
        Height = 30
        Caption = 'Cancelar'
        Down = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = []
        GlyphSpacing = 5
        ParentFont = False
        TabOrder = 3
        Transparent = True
        Visible = False
        OnClick = btnCancelarClick
      end
      object CurrencyEdit1: TCurrencyEdit
        Left = 104
        Top = 4
        Width = 122
        Height = 27
        AutoSize = False
        Ctl3D = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnKeyDown = CurrencyEdit1KeyDown
      end
    end
  end
end
