object frmBaixaLote_Calc: TfrmBaixaLote_Calc
  Left = 275
  Top = 96
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Baixa Setores por Lote'
  ClientHeight = 534
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
    Height = 534
    Align = alClient
    Color = clSilver
    TabOrder = 0
    object Label5: TLabel
      Left = 8
      Top = 368
      Width = 891
      Height = 165
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
    object Label1: TLabel
      Left = 40
      Top = 8
      Width = 40
      Height = 18
      Caption = 'Lote:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4194432
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 88
      Top = 40
      Width = 31
      Height = 18
      Caption = 'Ref:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4194432
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 88
      Top = 59
      Width = 100
      Height = 18
      Caption = 'Combina'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4194432
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 86
      Top = 8
      Width = 10
      Height = 18
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 4194432
      Font.Height = -15
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 8
      Top = 83
      Width = 891
      Height = 267
      BevelOuter = bvNone
      Color = 14671839
      TabOrder = 0
      object SMDBGrid1: TSMDBGrid
        Left = 6
        Top = 47
        Width = 880
        Height = 214
        TabStop = False
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
        ReadOnly = True
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
        ExOptions = [eoBooleanAsCheckBox, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
        OnGetCellParams = SMDBGrid1GetCellParams
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        RowCount = 2
        Columns = <
          item
            Expanded = False
            FieldName = 'Selecionado'
            Title.Color = 13565902
            Width = 77
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Item'
            Title.Alignment = taCenter
            Title.Color = 13565902
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome_Setor'
            Title.Alignment = taCenter
            Title.Caption = 'Setor'
            Title.Color = 13565902
            Width = 249
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'Qtd'
            Title.Alignment = taCenter
            Title.Caption = 'Qtde'
            Title.Color = 13565902
            Width = 88
            Visible = True
          end>
      end
      object btnConfirmar: TNxButton
        Left = 62
        Top = 7
        Width = 109
        Height = 30
        Caption = 'Confirmar'
        Down = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = []
        GlyphSpacing = 5
        ParentFont = False
        TabOrder = 1
        Transparent = True
        OnClick = btnConfirmarClick
      end
      object btnCancelar: TNxButton
        Left = 169
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
        TabOrder = 2
        Transparent = True
        OnClick = btnCancelarClick
      end
    end
  end
end
