object frmBaixaTalao_Calc: TfrmBaixaTalao_Calc
  Left = 261
  Top = 64
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Ordem de Produ'#231#227'o/Lote/Tal'#227'o Controle de Entrada e Sa'#237'da'
  ClientHeight = 600
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
    Height = 600
    Align = alClient
    Color = clSilver
    TabOrder = 0
    object Label1: TLabel
      Left = 20
      Top = 87
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
    end
    object Label5: TLabel
      Left = 8
      Top = 430
      Width = 891
      Height = 155
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
    object Label6: TLabel
      Left = 61
      Top = 15
      Width = 46
      Height = 18
      Alignment = taRightJustify
      Caption = 'Data:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 265
      Top = 15
      Width = 45
      Height = 18
      Alignment = taRightJustify
      Caption = 'Hora:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 414
      Top = 3
      Width = 321
      Height = 32
      Caption = 
        'Deixar Data e Hora em branco para assumir '#13#10'a hora do sistema au' +
        'tom'#225'tico'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 7
      Top = 57
      Width = 100
      Height = 18
      Alignment = taRightJustify
      Caption = 'Funcion'#225'rio:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object lblFuncionario: TLabel
      Left = 640
      Top = 62
      Width = 6
      Height = 18
      Caption = '.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 108
      Top = 81
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
      TabOrder = 3
      OnChange = Edit1Change
      OnKeyDown = Edit1KeyDown
    end
    object DateEdit1: TDateEdit
      Left = 108
      Top = 7
      Width = 144
      Height = 23
      Ctl3D = False
      DefaultToday = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      NumGlyphs = 2
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object RzDateTimeEdit1: TRzDateTimeEdit
      Left = 312
      Top = 7
      Width = 95
      Height = 23
      EditType = etTime
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object Panel2: TPanel
      Left = 8
      Top = 155
      Width = 891
      Height = 273
      BevelOuter = bvNone
      Color = 14671839
      TabOrder = 4
      Visible = False
      object Label3: TLabel
        Left = 33
        Top = 13
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Setor:'
      end
      object Label4: TLabel
        Left = 33
        Top = 33
        Width = 26
        Height = 13
        Alignment = taRightJustify
        Caption = 'Qtde:'
      end
      object Label8: TLabel
        Left = 504
        Top = 8
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
        Left = 504
        Top = 46
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
      object Label10: TLabel
        Left = 536
        Top = 28
        Width = 5
        Height = 18
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 4194432
        Font.Height = -15
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object SMDBGrid1: TSMDBGrid
        Left = 6
        Top = 79
        Width = 880
        Height = 188
        TabStop = False
        BorderStyle = bsNone
        Ctl3D = False
        DataSource = DMBaixaProd_Calc.dsTalao_Setor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
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
        OnGetCellParams = SMDBGrid1GetCellParams
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
            Title.Color = 13565902
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'clNome_Setor'
            Title.Alignment = taCenter
            Title.Caption = 'Setor'
            Title.Color = 13565902
            Width = 249
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DTENTRADA'
            Title.Alignment = taCenter
            Title.Caption = 'Dt. Entrada'
            Title.Color = 13565902
            Width = 83
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'HRENTRADA'
            Title.Alignment = taCenter
            Title.Caption = 'Hr Entrada'
            Title.Color = 13565902
            Width = 65
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DTSAIDA'
            Title.Alignment = taCenter
            Title.Caption = 'Dt.Baixa'
            Title.Color = 13565902
            Width = 88
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'HRSAIDA'
            Title.Alignment = taCenter
            Title.Caption = 'Hr.Baixa'
            Title.Color = 13565902
            Width = 71
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QTD'
            Title.Alignment = taCenter
            Title.Caption = 'Qtde'
            Title.Color = 13565902
            Width = 88
            Visible = True
          end>
      end
      object RxDBLookupCombo1: TRxDBLookupCombo
        Left = 62
        Top = 5
        Width = 403
        Height = 21
        DropDownCount = 8
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        LookupField = 'ID_SETOR'
        LookupDisplay = 'clNome_Setor'
        LookupSource = DMBaixaProd_Calc.dsTalao_Setor
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnExit = RxDBLookupCombo1Exit
        OnKeyDown = RxDBLookupCombo1KeyDown
      end
      object CurrencyEdit1: TCurrencyEdit
        Left = 62
        Top = 25
        Width = 121
        Height = 21
        AutoSize = False
        Ctl3D = False
        DecimalPlaces = 4
        DisplayFormat = '0.####'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        OnKeyDown = CurrencyEdit1KeyDown
      end
      object btnConfirmar: TNxButton
        Left = 62
        Top = 47
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
        TabOrder = 3
        Transparent = True
        OnClick = btnConfirmarClick
      end
      object btnCancelar: TNxButton
        Left = 169
        Top = 47
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
        TabOrder = 4
        Transparent = True
        OnClick = btnCancelarClick
      end
      object ckBaixaSetor: TCheckBox
        Left = 328
        Top = 40
        Width = 161
        Height = 17
        Caption = 'Baixar todos os Setores'
        TabOrder = 5
      end
    end
    object CurrencyEdit2: TCurrencyEdit
      Left = 108
      Top = 52
      Width = 202
      Height = 23
      AutoSize = False
      Ctl3D = False
      DecimalPlaces = 4
      DisplayFormat = '0.####'
      ParentCtl3D = False
      TabOrder = 2
      Visible = False
      OnChange = CurrencyEdit2Change
      OnKeyDown = CurrencyEdit2KeyDown
    end
  end
end
