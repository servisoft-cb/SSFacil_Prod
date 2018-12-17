object DMConsPedido: TDMConsPedido
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 329
  Top = 186
  Height = 439
  Width = 688
  object sdsPedido_Itens: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT P.ID ID_PEDIDO, P.num_pedido, P.pedido_cliente, P.ID_CLIE' +
      'NTE, I.REFERENCIA,'#13#10'I.QTD, COMB.NOME NOME_COR, I.DTENTREGA, P.DT' +
      'EMISSAO, L.BAIXADO, CLI.NOME NOME_CLIENTE,'#13#10'I.ITEM ITEM_PEDIDO, ' +
      'CLI.FANTASIA FANTASIA_CLIENTE'#13#10'FROM PEDIDO P'#13#10'INNER JOIN PESSOA ' +
      'CLI'#13#10'ON P.ID_CLIENTE = CLI.CODIGO'#13#10'INNER JOIN PEDIDO_ITEM I'#13#10'ON ' +
      'P.ID = I.ID'#13#10'LEFT JOIN COMBINACAO COMB'#13#10'ON I.ID_COR = COMB.ID'#13#10'L' +
      'EFT JOIN LOTE L'#13#10'ON I.ID = L.id_pedido'#13#10'AND I.ITEM = L.item_pedi' +
      'do'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 80
    Top = 40
  end
  object dspPedido_Itens: TDataSetProvider
    DataSet = sdsPedido_Itens
    Left = 128
    Top = 40
  end
  object cdsPedido_Itens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPedido_Itens'
    Left = 176
    Top = 40
    object cdsPedido_ItensID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
      Required = True
    end
    object cdsPedido_ItensNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object cdsPedido_ItensPEDIDO_CLIENTE: TStringField
      FieldName = 'PEDIDO_CLIENTE'
    end
    object cdsPedido_ItensID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsPedido_ItensREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsPedido_ItensQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsPedido_ItensNOME_COR: TStringField
      FieldName = 'NOME_COR'
      Size = 60
    end
    object cdsPedido_ItensDTENTREGA: TDateField
      FieldName = 'DTENTREGA'
    end
    object cdsPedido_ItensDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsPedido_ItensBAIXADO: TStringField
      FieldName = 'BAIXADO'
      Size = 1
    end
    object cdsPedido_ItensNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object cdsPedido_ItensITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
      Required = True
    end
    object cdsPedido_ItensFANTASIA_CLIENTE: TStringField
      FieldName = 'FANTASIA_CLIENTE'
      Size = 30
    end
  end
  object dsPedido_Itens: TDataSource
    DataSet = cdsPedido_Itens
    Left = 224
    Top = 40
  end
  object frxReport1: TfrxReport
    Tag = 1
    Version = '5.6.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42751.456864641200000000
    ReportOptions.LastChange = 43282.864130462960000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 376
    Top = 247
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    Left = 424
    Top = 247
  end
  object frxMailExport1: TfrxMailExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ShowExportDialog = True
    SmtpPort = 25
    UseIniFile = True
    TimeOut = 60
    ConfurmReading = False
    UseMAPI = SMTP
    MAPISendFlag = 0
    Left = 464
    Top = 247
  end
  object frxRichObject1: TfrxRichObject
    Left = 496
    Top = 247
  end
  object frxPedido_Itens: TfrxDBDataset
    UserName = 'frxPedido_Itens'
    OnFirst = frxPedido_ItensFirst
    OnNext = frxPedido_ItensNext
    OnPrior = frxPedido_ItensPrior
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID_PEDIDO=ID_PEDIDO'
      'NUM_PEDIDO=NUM_PEDIDO'
      'PEDIDO_CLIENTE=PEDIDO_CLIENTE'
      'ID_CLIENTE=ID_CLIENTE'
      'REFERENCIA=REFERENCIA'
      'QTD=QTD'
      'NOME_COR=NOME_COR'
      'DTENTREGA=DTENTREGA'
      'DTEMISSAO=DTEMISSAO'
      'BAIXADO=BAIXADO'
      'NOME_CLIENTE=NOME_CLIENTE'
      'ITEM_PEDIDO=ITEM_PEDIDO'
      'FANTASIA_CLIENTE=FANTASIA_CLIENTE')
    OnOpen = frxPedido_ItensOpen
    DataSource = dsPedido_Itens
    BCDToCurrency = False
    Left = 376
    Top = 303
  end
  object sdsBaixaPed: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select P.id ID_PROCESSO, P.NOME NOME_PROCESSO, P.ordem_mapa, B.i' +
      'd_pedido,'#13#10'B.qtd, B.qtd_produzido, B.qtd_pendente,'#13#10'CASE'#13#10'  WHEN' +
      ' B.ID_PEDIDO IS NULL THEN '#39'X'#39#13#10'  ELSE ROUND(B.QTD_PENDENTE,0)'#13#10' ' +
      ' END QTD_PEND_IMPRIMIR'#13#10'from PROCESSO P'#13#10'LEFT JOIN BAIXA_PROCESS' +
      'O B'#13#10'ON P.ID = B.ID_PROCESSO'#13#10'  AND B.ID_PEDIDO = :ID_PEDIDO'#13#10'  ' +
      'AND B.ITEM_PEDIDO = :ITEM_PEDIDO'#13#10'WHERE P.ordem_mapa > 0'#13#10
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
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 80
    Top = 96
  end
  object dspBaixaPed: TDataSetProvider
    DataSet = sdsBaixaPed
    Left = 128
    Top = 96
  end
  object cdsBaixaPed: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ORDEM_MAPA'
    Params = <>
    ProviderName = 'dspBaixaPed'
    Left = 176
    Top = 96
    object cdsBaixaPedID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
      Required = True
    end
    object cdsBaixaPedNOME_PROCESSO: TStringField
      FieldName = 'NOME_PROCESSO'
      Size = 30
    end
    object cdsBaixaPedORDEM_MAPA: TIntegerField
      FieldName = 'ORDEM_MAPA'
    end
    object cdsBaixaPedID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object cdsBaixaPedQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsBaixaPedQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
    end
    object cdsBaixaPedQTD_PENDENTE: TFloatField
      FieldName = 'QTD_PENDENTE'
    end
    object cdsBaixaPedQTD_PEND_IMPRIMIR: TStringField
      FieldName = 'QTD_PEND_IMPRIMIR'
      Size = 24
    end
  end
  object dsBaixaPed: TDataSource
    DataSet = cdsBaixaPed
    Left = 224
    Top = 96
  end
  object frxBaixaPed: TfrxDBDataset
    UserName = 'frxBaixaPed'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID_PROCESSO=ID_PROCESSO'
      'NOME_PROCESSO=NOME_PROCESSO'
      'ORDEM_MAPA=ORDEM_MAPA'
      'ID_PEDIDO=ID_PEDIDO'
      'QTD=QTD'
      'QTD_PRODUZIDO=QTD_PRODUZIDO'
      'QTD_PENDENTE=QTD_PENDENTE'
      'QTD_PEND_IMPRIMIR=QTD_PEND_IMPRIMIR')
    DataSource = dsBaixaPed
    BCDToCurrency = False
    Left = 416
    Top = 303
  end
  object sdsProcesso: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT P.NOME, P.ordem_mapa'#13#10'FROM PROCESSO P'#13#10'WHERE P.ORDEM_MAPA' +
      ' > 0'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 80
    Top = 152
  end
  object dspProcesso: TDataSetProvider
    DataSet = sdsProcesso
    Left = 128
    Top = 152
  end
  object cdsProcesso: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ORDEM_MAPA'
    Params = <>
    ProviderName = 'dspProcesso'
    Left = 176
    Top = 152
    object cdsProcessoNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object cdsProcessoORDEM_MAPA: TIntegerField
      FieldName = 'ORDEM_MAPA'
    end
  end
  object dsProcesso: TDataSource
    DataSet = cdsProcesso
    Left = 224
    Top = 152
  end
  object frxProcesso: TfrxDBDataset
    UserName = 'frxProcesso'
    CloseDataSource = False
    FieldAliases.Strings = (
      'NOME=NOME'
      'ORDEM_MAPA=ORDEM_MAPA')
    DataSource = dsProcesso
    BCDToCurrency = False
    Left = 464
    Top = 303
  end
  object qCliente: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT CODIGO, NOME, CNPJ_CPF'
      'FROM PESSOA'
      'WHERE CODIGO = :CODIGO')
    SQLConnection = dmDatabase.scoDados
    Left = 360
    Top = 112
    object qClienteCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object qClienteNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qClienteCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
    end
  end
end
