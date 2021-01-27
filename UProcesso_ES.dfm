object frmProcesso_ES: TfrmProcesso_ES
  Left = 140
  Top = 24
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsSingle
  Caption = 
    'Ordem de Produ'#231#227'o/Lote/Tal'#227'o Controle de Entrada e Sa'#237'da  (Baixa' +
    ' Processo)'
  ClientHeight = 626
  ClientWidth = 1152
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 964
    Height = 608
    Align = alClient
    Color = clSilver
    TabOrder = 0
    object Label1: TLabel
      Left = 20
      Top = 71
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
    object Label5: TLabel
      Left = 1
      Top = 425
      Width = 962
      Height = 182
      Align = alBottom
      Anchors = [akLeft, akTop, akRight, akBottom]
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
      Top = 41
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
    end
    object lblFuncionario: TLabel
      Left = 351
      Top = 41
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
    object SpeedButton1: TSpeedButton
      Left = 311
      Top = 37
      Width = 23
      Height = 22
      Hint = 'Alterar a Senha'
      Caption = '...'
      OnClick = SpeedButton1Click
    end
    object Edit1: TEdit
      Left = 108
      Top = 65
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
      Visible = False
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
      Left = 1
      Top = 112
      Width = 962
      Height = 313
      Align = alBottom
      BevelOuter = bvNone
      Color = 14671839
      TabOrder = 4
      Visible = False
      object Label3: TLabel
        Left = 14
        Top = 13
        Width = 47
        Height = 13
        Alignment = taRightJustify
        Caption = 'Processo:'
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
        Left = 5
        Top = 81
        Width = 1139
        Height = 222
        TabStop = False
        BorderStyle = bsNone
        Ctl3D = False
        DataSource = DMBaixaProd.dsBaixa_Processo
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
        ColCount = 15
        RowCount = 2
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID'
            Title.Alignment = taCenter
            Title.Caption = 'ID Baixa'
            Title.Color = 13565902
            Width = 69
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID_PROCESSO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Verdana'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'ID Processo'
            Title.Color = 13565902
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'clNome_Processo'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Processo'
            Title.Color = 13565902
            Width = 199
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DTENTRADA'
            Title.Alignment = taCenter
            Title.Caption = 'Dt. Entrada'
            Title.Color = 13565902
            Width = 72
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
            FieldName = 'DTBAIXA'
            Title.Alignment = taCenter
            Title.Caption = 'Dt.Baixa'
            Title.Color = 13565902
            Width = 88
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'HRBAIXA'
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
            Title.Caption = 'Qtde Inicial'
            Title.Color = 13565902
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_PENDENTE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Pendente'
            Title.Color = 13565902
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_LIBERADA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Liberada'
            Title.Color = 13565902
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 90
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QTD_PRODUZIDO'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Produzido'
            Title.Color = 13565902
            Width = 74
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'TOTAL_HORAS'
            Title.Alignment = taCenter
            Title.Caption = 'Total Horas'
            Title.Color = 13565902
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AJUSTE'
            Title.Alignment = taCenter
            Title.Caption = 'Ajuste'
            Title.Color = 13565902
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RETRABALHO'
            Title.Alignment = taCenter
            Title.Caption = 'Ret.'
            Title.Color = 13565902
            Width = 64
            Visible = True
          end>
      end
      object RxDBLookupCombo1: TRxDBLookupCombo
        Left = 182
        Top = 5
        Width = 305
        Height = 21
        DropDownCount = 8
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        LookupField = 'ID_PROCESSO'
        LookupDisplay = 'clNome_Processo'
        LookupSource = DMBaixaProd.dsBaixa_Processo
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
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
        TabOrder = 2
        OnEnter = CurrencyEdit1Enter
        OnExit = CurrencyEdit1Exit
        OnKeyDown = CurrencyEdit1KeyDown
      end
      object btnConfirmar: TNxButton
        Left = 62
        Top = 47
        Width = 109
        Height = 30
        Cursor = crHandPoint
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
        Left = 170
        Top = 47
        Width = 109
        Height = 30
        Cursor = crHandPoint
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
      object CurrencyEdit3: TCurrencyEdit
        Left = 62
        Top = 5
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
        TabOrder = 5
        OnKeyDown = CurrencyEdit3KeyDown
      end
    end
    object CurrencyEdit2: TCurrencyEdit
      Left = 108
      Top = 36
      Width = 202
      Height = 23
      AutoSize = False
      Ctl3D = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      OnChange = CurrencyEdit2Change
      OnEnter = CurrencyEdit2Enter
      OnKeyDown = CurrencyEdit2KeyDown
    end
    object btnTalaoEtiqueta: TNxButton
      Left = 768
      Top = 79
      Width = 124
      Height = 30
      Cursor = crHandPoint
      Caption = 'Tal'#245'es Etiqueta'
      Down = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      GlyphSpacing = 5
      ParentFont = False
      TabOrder = 5
      Transparent = True
      OnClick = btnTalaoEtiquetaClick
    end
  end
  object Panel3: TPanel
    Left = 964
    Top = 0
    Width = 188
    Height = 608
    Align = alRight
    TabOrder = 1
    object SMDBGrid2: TSMDBGrid
      Left = 1
      Top = 24
      Width = 186
      Height = 542
      Align = alClient
      Ctl3D = False
      DataSource = DMBaixaProd.dsConsBaixaEtiq
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
          Alignment = taCenter
          Expanded = False
          FieldName = 'CODBARRA'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd. Barra'
          Width = 102
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DTBAIXA'
          Title.Alignment = taCenter
          Title.Caption = 'Dt. Baixa'
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'HRBAIXA'
          Title.Alignment = taCenter
          Title.Caption = 'Hr. Baixa'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'USUARIO'
          Title.Alignment = taCenter
          Title.Caption = 'Usu'#225'rio'
          Visible = True
        end>
    end
    object NxButton1: TNxButton
      Left = 1
      Top = 1
      Width = 186
      Align = alTop
      Caption = 'Atualiza Pesquisa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = NxButton1Click
    end
    object Panel4: TPanel
      Left = 1
      Top = 566
      Width = 186
      Height = 41
      Align = alBottom
      TabOrder = 2
      object Label12: TLabel
        Left = 16
        Top = 11
        Width = 72
        Height = 14
        Caption = 'Total Lidas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object StaticText1: TStaticText
    Left = 0
    Top = 608
    Width = 1152
    Height = 18
    Align = alBottom
    Caption = 'F5 Consultar Estoque'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object UCControls1: TUCControls
    GroupName = 'Baixa Processo'
    UserControl = fMenu.UserControl1
    NotAllowed = naInvisible
    Left = 736
    Top = 136
  end
end
