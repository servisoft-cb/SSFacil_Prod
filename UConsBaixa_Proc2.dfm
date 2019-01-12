object frmConsBaixa_Proc2: TfrmConsBaixa_Proc2
  Left = 293
  Top = 89
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta das Baixas'
  ClientHeight = 544
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
  object gbxProcessos: TRzGroupBox
    Left = 0
    Top = 0
    Width = 920
    Height = 249
    Align = alTop
    BorderColor = clNavy
    BorderInner = fsButtonUp
    BorderOuter = fsBump
    Caption = ' Consulta Processos '
    Ctl3D = True
    FlatColor = clNavy
    FlatColorAdjustment = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    VisualStyle = vsGradient
    object SMDBGrid1: TSMDBGrid
      Left = 5
      Top = 18
      Width = 910
      Height = 226
      Align = alClient
      Ctl3D = False
      DataSource = dsConsProcesso
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clNavy
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
          Alignment = taCenter
          Expanded = False
          FieldName = 'ITEM'
          Title.Alignment = taCenter
          Title.Caption = 'Item'
          Title.Color = 13369239
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REFERENCIA'
          Title.Alignment = taCenter
          Title.Caption = 'Refer'#234'ncia'
          Title.Color = 13369239
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_COMBINACAO'
          Title.Alignment = taCenter
          Title.Caption = 'Cor'
          Title.Color = 13369239
          Width = 232
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_PROCESSO'
          Title.Alignment = taCenter
          Title.Caption = 'Processo'
          Title.Color = 13369239
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTD'
          Title.Alignment = taCenter
          Title.Caption = 'Qtde.'
          Title.Color = 13369239
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTD_CONFERIDO'
          Title.Alignment = taCenter
          Title.Caption = 'Qtd. J'#225' Conferido'
          Title.Color = 13369239
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTENTRADA'
          Title.Alignment = taCenter
          Title.Caption = 'Data Entrada'
          Title.Color = 13369239
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTBAIXA'
          Title.Alignment = taCenter
          Title.Caption = 'Data Baixa'
          Title.Color = 13369239
          Visible = True
        end>
    end
  end
  object RzGroupBox1: TRzGroupBox
    Left = 0
    Top = 249
    Width = 920
    Height = 295
    Align = alClient
    BorderColor = clRed
    BorderInner = fsButtonUp
    BorderOuter = fsBump
    Caption = ' Consulta Etiquetas '
    Ctl3D = True
    FlatColor = clRed
    FlatColorAdjustment = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    VisualStyle = vsGradient
    object SMDBGrid2: TSMDBGrid
      Left = 5
      Top = 45
      Width = 910
      Height = 245
      Align = alClient
      Ctl3D = False
      DataSource = dsConsEtiquetas
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clRed
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
      OnGetCellParams = SMDBGrid2GetCellParams
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
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ITEM_TALAO'
          Title.Alignment = taCenter
          Title.Caption = 'Item Tal'#227'o'
          Width = 80
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'QTD'
          Title.Alignment = taCenter
          Title.Caption = 'Qtde.'
          Width = 75
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DTBAIXA'
          Title.Alignment = taCenter
          Title.Caption = 'Data Conferido'
          Width = 111
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'clCodBarra'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'd. Barra'
          Width = 186
          Visible = True
        end>
    end
    object Panel1: TPanel
      Left = 5
      Top = 18
      Width = 910
      Height = 27
      Align = alTop
      TabOrder = 1
      object Shape2: TShape
        Left = 208
        Top = 6
        Width = 22
        Height = 15
        Brush.Color = 8454016
      end
      object Label14: TLabel
        Left = 232
        Top = 8
        Width = 59
        Height = 13
        Caption = 'J'#225' Conferido'
      end
      object NxButton1: TNxButton
        Left = 0
        Top = 2
        Width = 97
        Caption = 'Excluir Baixa'
        TabOrder = 0
        OnClick = NxButton1Click
      end
    end
  end
  object sdsConsProcesso: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT I.ID, I.ITEM, I.qtd,  I.qtd_conferido, B.DTBAIXA, I.REFER' +
      'ENCIA,'#13#10'PR.NOME NOME_PROCESSO, B.DTENTRADA, B.hrentrada, B.hrbai' +
      'xa, I.nomeproduto,'#13#10'COMB.NOME NOME_COMBINACAO'#13#10'FROM PEDIDO_ITEM ' +
      'I'#13#10'LEFT JOIN BAIXA_PROCESSO B'#13#10'ON I.ID = B.ID_PEDIDO'#13#10'AND I.ITEM' +
      ' = B.ITEM_PEDIDO'#13#10'LEFT JOIN PROCESSO PR'#13#10'ON B.ID_PROCESSO = PR.I' +
      'D'#13#10'LEFT JOIN COMBINACAO COMB'#13#10'ON I.ID_COR = COMB.ID'#13#10'WHERE I.ID ' +
      '= :ID'#13#10'  AND I.ITEM = :ITEM'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ITEM'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 184
    Top = 104
  end
  object dspConsProcesso: TDataSetProvider
    DataSet = sdsConsProcesso
    Left = 224
    Top = 104
  end
  object cdsConsProcesso: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'ITEM;NOME_PROCESSO'
    Params = <>
    ProviderName = 'dspConsProcesso'
    Left = 264
    Top = 104
    object cdsConsProcessoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsProcessoITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsConsProcessoQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsConsProcessoQTD_CONFERIDO: TFloatField
      FieldName = 'QTD_CONFERIDO'
    end
    object cdsConsProcessoDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object cdsConsProcessoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsConsProcessoNOME_PROCESSO: TStringField
      FieldName = 'NOME_PROCESSO'
      Size = 30
    end
    object cdsConsProcessoDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object cdsConsProcessoHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object cdsConsProcessoHRBAIXA: TTimeField
      FieldName = 'HRBAIXA'
    end
    object cdsConsProcessoNOMEPRODUTO: TStringField
      FieldName = 'NOMEPRODUTO'
      Size = 100
    end
    object cdsConsProcessoNOME_COMBINACAO: TStringField
      FieldName = 'NOME_COMBINACAO'
      Size = 60
    end
  end
  object dsConsProcesso: TDataSource
    DataSet = cdsConsProcesso
    Left = 304
    Top = 104
  end
  object sdsConsEtiquetas: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT T.QTD, T.item_talao, T.ITEM, T.dtbaixa, T.ID, P.NUM_PEDID' +
      'O'#13#10'FROM PEDIDO_TALAO T'#13#10'INNER JOIN PEDIDO P'#13#10'ON T.ID = P.ID'#13#10'WHE' +
      'RE T.ID = :ID'#13#10'  AND T.ITEM = :ITEM'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ITEM'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 208
    Top = 296
  end
  object dspConsEtiquetas: TDataSetProvider
    DataSet = sdsConsEtiquetas
    Left = 248
    Top = 296
  end
  object cdsConsEtiquetas: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ITEM;ITEM_TALAO'
    Params = <>
    ProviderName = 'dspConsEtiquetas'
    OnCalcFields = cdsConsEtiquetasCalcFields
    Left = 288
    Top = 296
    object cdsConsEtiquetasQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsConsEtiquetasITEM_TALAO: TIntegerField
      FieldName = 'ITEM_TALAO'
      Required = True
    end
    object cdsConsEtiquetasITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsConsEtiquetasDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object cdsConsEtiquetasID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsEtiquetasclCodBarra: TStringField
      FieldKind = fkCalculated
      FieldName = 'clCodBarra'
      Size = 14
      Calculated = True
    end
    object cdsConsEtiquetasNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
  end
  object dsConsEtiquetas: TDataSource
    DataSet = cdsConsEtiquetas
    Left = 328
    Top = 296
  end
  object qVerVolume: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ITEM_PEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ITEM_TALAO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT P.ID'
      'FROM PREFAT_VOL_ETIQ P'
      'WHERE P.id_pedido = :ID_PEDIDO'
      '  AND P.item_pedido = :ITEM_PEDIDO'
      '  AND P.item_talao = :ITEM_TALAO')
    SQLConnection = dmDatabase.scoDados
    Left = 456
    Top = 353
    object qVerVolumeID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
  end
end
