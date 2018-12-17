object DMPedido_Talao: TDMPedido_Talao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 322
  Top = 199
  Height = 460
  Width = 923
  object sdsPedido_Talao: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT *'#13#10'FROM PEDIDO_TALAO'#13#10'WHERE ID = :ID'#13#10'  AND ITEM = :ITEM'#13 +
      #10
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
    Left = 56
    Top = 48
    object sdsPedido_TalaoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsPedido_TalaoITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsPedido_TalaoITEM_TALAO: TIntegerField
      FieldName = 'ITEM_TALAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsPedido_TalaoQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsPedido_TalaoCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 14
    end
    object sdsPedido_TalaoDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object sdsPedido_TalaoHRBAIXA: TTimeField
      FieldName = 'HRBAIXA'
    end
    object sdsPedido_TalaoDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object sdsPedido_TalaoHREMISSAO: TTimeField
      FieldName = 'HREMISSAO'
    end
  end
  object dspPedido_Talao: TDataSetProvider
    DataSet = sdsPedido_Talao
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 48
  end
  object cdsPedido_Talao: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID;ITEM;ITEM_TALAO'
    Params = <>
    ProviderName = 'dspPedido_Talao'
    Left = 144
    Top = 48
    object cdsPedido_TalaoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPedido_TalaoITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPedido_TalaoITEM_TALAO: TIntegerField
      FieldName = 'ITEM_TALAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPedido_TalaoQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsPedido_TalaoCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 14
    end
    object cdsPedido_TalaoDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object cdsPedido_TalaoHRBAIXA: TTimeField
      FieldName = 'HRBAIXA'
    end
    object cdsPedido_TalaoDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsPedido_TalaoHREMISSAO: TTimeField
      FieldName = 'HREMISSAO'
    end
  end
  object dsPedido_Talao: TDataSource
    DataSet = cdsPedido_Talao
    Left = 192
    Top = 48
  end
  object dsPedidoImp_Itens: TDataSource
    DataSet = cdsPedidoImp_Itens
    Left = 520
    Top = 45
  end
  object cdsPedidoImp_Itens: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID;ITEM'
    Params = <>
    ProviderName = 'dspPedidoImp_Itens'
    Left = 472
    Top = 45
    object cdsPedidoImp_ItensID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPedidoImp_ItensITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsPedidoImp_ItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsPedidoImp_ItensREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsPedidoImp_ItensTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object cdsPedidoImp_ItensID_COR: TFMTBCDField
      FieldName = 'ID_COR'
      Precision = 15
      Size = 0
    end
    object cdsPedidoImp_ItensNOMEPRODUTO: TStringField
      FieldName = 'NOMEPRODUTO'
      Size = 100
    end
    object cdsPedidoImp_ItensCOD_PRODUTO_CLIENTE: TStringField
      FieldName = 'COD_PRODUTO_CLIENTE'
      Size = 15
    end
    object cdsPedidoImp_ItensCOD_COR_CLIENTE: TStringField
      FieldName = 'COD_COR_CLIENTE'
      Size = 10
    end
    object cdsPedidoImp_ItensUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsPedidoImp_ItensQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsPedidoImp_ItensQTD_RESTANTE: TFloatField
      FieldName = 'QTD_RESTANTE'
    end
    object cdsPedidoImp_ItensNUMOS: TStringField
      FieldName = 'NUMOS'
      Size = 30
    end
    object cdsPedidoImp_ItensENCERADO: TStringField
      FieldName = 'ENCERADO'
      FixedChar = True
      Size = 1
    end
    object cdsPedidoImp_ItensQTD_POR_ROTULO: TIntegerField
      FieldName = 'QTD_POR_ROTULO'
      Required = True
    end
    object cdsPedidoImp_ItensTAMANHO_CLIENTE: TStringField
      FieldName = 'TAMANHO_CLIENTE'
      Size = 10
    end
    object cdsPedidoImp_ItensNOME_COR_COMBINACAO: TStringField
      FieldName = 'NOME_COR_COMBINACAO'
      Size = 60
    end
    object cdsPedidoImp_ItensDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsPedidoImp_ItensID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsPedidoImp_ItensFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsPedidoImp_ItensPEDIDO_CLIENTE: TStringField
      FieldName = 'PEDIDO_CLIENTE'
    end
    object cdsPedidoImp_ItensNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object cdsPedidoImp_ItensNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Size = 60
    end
    object cdsPedidoImp_ItensFANTASIA_CLI: TStringField
      FieldName = 'FANTASIA_CLI'
      Size = 30
    end
    object cdsPedidoImp_ItensNOME_INTERNO_FIL: TStringField
      FieldName = 'NOME_INTERNO_FIL'
      Size = 30
    end
    object cdsPedidoImp_ItensIMP_COR_CLIENTE: TStringField
      FieldName = 'IMP_COR_CLIENTE'
      FixedChar = True
      Size = 1
    end
    object cdsPedidoImp_ItensNOME_COR_CLIENTE: TStringField
      FieldName = 'NOME_COR_CLIENTE'
      Size = 100
    end
    object cdsPedidoImp_ItensGEROU_PED_TALAO: TStringField
      FieldName = 'GEROU_PED_TALAO'
      FixedChar = True
      Size = 1
    end
    object cdsPedidoImp_ItensQTD_PENDENTE_TAL: TFloatField
      FieldName = 'QTD_PENDENTE_TAL'
    end
  end
  object dspPedidoImp_Itens: TDataSetProvider
    DataSet = sdsPedidoImp_Itens
    Left = 432
    Top = 45
  end
  object sdsPedidoImp_Itens: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT PI.ID, PI.item, PI.id_produto, PI.referencia, PI.tamanho,' +
      ' PI.id_cor,'#13#10'PI.nomeproduto, PI.cod_produto_cliente, PI.cod_cor_' +
      'cliente, PI.UNIDADE,'#13#10'PI.qtd, PI.qtd_restante, PI.numos, PI.ence' +
      'rado,'#13#10'PI.tamanho_cliente, CLI.imp_cor_cliente, PI.nome_cor_clie' +
      'nte, PI.gerou_ped_talao,'#13#10'COMB.NOME NOME_COR_COMBINACAO,'#13#10'PED.DT' +
      'EMISSAO, PED.id_cliente, PED.FILIAL, PED.PEDIDO_CLIENTE, PED.NUM' +
      '_PEDIDO,'#13#10'CLI.NOME NOME_CLI, CLI.fantasia FANTASIA_CLI,'#13#10'FIL.nom' +
      'e_interno NOME_INTERNO_FIL,'#13#10'PI.QTD - coalesce( (SELECT SUM(coal' +
      'esce(PL.QTD,0)) FROM PEDIDO_TALAO PL WHERE PL.ID = PI.ID AND PL.' +
      'ITEM = PI.ITEM),0)'#13#10' QTD_PENDENTE_TAL,'#13#10#13#10'case'#13#10'  WHEN PI.gerou_' +
      'ped_talao = '#39'S'#39' then pi.qtd_por_rotulo'#13#10'  when (SELECT coalesce(' +
      'PL.QTD_PADRAO_ETIQ,0) FROM PARAMETROS_LOTE PL WHERE PL.ID = 1) >' +
      ' 0 THEN (SELECT coalesce(PL.QTD_PADRAO_ETIQ,0) FROM PARAMETROS_L' +
      'OTE PL WHERE PL.ID = 1)'#13#10'  else 72'#13#10'  end QTD_POR_ROTULO'#13#10'FROM P' +
      'EDIDO_ITEM PI'#13#10'INNER JOIN PEDIDO PED'#13#10'ON PI.ID = PED.ID'#13#10'INNER J' +
      'OIN PESSOA CLI'#13#10'ON PED.ID_CLIENTE = CLI.CODIGO'#13#10'INNER JOIN FILIA' +
      'L FIL'#13#10'ON PED.FILIAL = FIL.ID'#13#10'LEFT JOIN PRODUTO PRO ON (PI.ID_P' +
      'RODUTO = PRO.ID)'#13#10'LEFT JOIN PEDIDO_ITEM_TIPO PT ON (PI.ID = PT.I' +
      'D AND PI.ITEM = PT.ITEM)'#13#10'LEFT JOIN COMBINACAO COMB ON (PI.ID_CO' +
      'R = COMB.ID)'#13#10'WHERE PED.NUM_PEDIDO = :NUM_PEDIDO'#13#10' AND (PI.QTD >' +
      ' 0)'#13#10' AND PED.TIPO_REG = '#39'P'#39#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_PEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 392
    Top = 45
  end
  object mEtiqueta_Nav: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Nome_Empresa'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Fone'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'Nome_Etiqueta'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'Tamanho'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Referencia'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Nome_Produto'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Nome_Cliente'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Qtd'
        DataType = ftInteger
      end
      item
        Name = 'Pedido_Cliente'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Fantasia_Cli'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'DtEmissao'
        DataType = ftDate
      end
      item
        Name = 'Prod_Cliente'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NumOS'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Encerado'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Item_Ped'
        DataType = ftInteger
      end
      item
        Name = 'Unidade'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'CodBarra'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Item_Talao'
        DataType = ftInteger
      end
      item
        Name = 'Num_Pedido'
        DataType = ftInteger
      end>
    IndexDefs = <>
    IndexFieldNames = 'Nome_Etiqueta;Tamanho'
    Params = <>
    StoreDefs = True
    Left = 416
    Top = 215
    Data = {
      1D0200009619E0BD0100000018000000130000000000030000001D020C4E6F6D
      655F456D70726573610100490000000100055749445448020002000F0004466F
      6E650100490000000100055749445448020002000C000D4E6F6D655F45746971
      7565746101004900000001000557494454480200020019000754616D616E686F
      0100490000000100055749445448020002000A000A5265666572656E63696101
      004900000001000557494454480200020014000C4E6F6D655F50726F6475746F
      01004900000001000557494454480200020064000C4E6F6D655F436C69656E74
      650100490000000100055749445448020002003C000351746404000100000000
      000E50656469646F5F436C69656E746501004900000001000557494454480200
      020014000C46616E74617369615F436C69010049000000010005574944544802
      0002002800094474456D697373616F04000600000000000C50726F645F436C69
      656E74650100490000000100055749445448020002001400054E756D4F530100
      490000000100055749445448020002001E0008456E63657261646F0100490000
      000100055749445448020002000A00084974656D5F5065640400010000000000
      07556E69646164650100490000000100055749445448020002000C0008436F64
      42617272610100490000000100055749445448020002000E000A4974656D5F54
      616C616F04000100000000000A4E756D5F50656469646F040001000000000000
      00}
    object mEtiqueta_NavNome_Empresa: TStringField
      FieldName = 'Nome_Empresa'
      Size = 15
    end
    object mEtiqueta_NavFone: TStringField
      FieldName = 'Fone'
      Size = 12
    end
    object mEtiqueta_NavNome_Etiqueta: TStringField
      FieldName = 'Nome_Etiqueta'
      Size = 25
    end
    object mEtiqueta_NavTamanho: TStringField
      FieldName = 'Tamanho'
      Size = 10
    end
    object mEtiqueta_NavReferencia: TStringField
      FieldName = 'Referencia'
    end
    object mEtiqueta_NavNome_Produto: TStringField
      FieldName = 'Nome_Produto'
      Size = 100
    end
    object mEtiqueta_NavNome_Cliente: TStringField
      FieldName = 'Nome_Cliente'
      Size = 60
    end
    object mEtiqueta_NavQtd: TIntegerField
      FieldName = 'Qtd'
    end
    object mEtiqueta_NavPedido_Cliente: TStringField
      FieldName = 'Pedido_Cliente'
    end
    object mEtiqueta_NavFantasia_Cli: TStringField
      FieldName = 'Fantasia_Cli'
      Size = 40
    end
    object mEtiqueta_NavDtEmissao: TDateField
      FieldName = 'DtEmissao'
    end
    object mEtiqueta_NavProd_Cliente: TStringField
      FieldName = 'Prod_Cliente'
    end
    object mEtiqueta_NavNumOS: TStringField
      FieldName = 'NumOS'
      Size = 30
    end
    object mEtiqueta_NavEncerado: TStringField
      FieldName = 'Encerado'
      Size = 10
    end
    object mEtiqueta_NavItem_Ped: TIntegerField
      FieldName = 'Item_Ped'
    end
    object mEtiqueta_NavUnidade: TStringField
      FieldName = 'Unidade'
      Size = 12
    end
    object mEtiqueta_NavCodBarra: TStringField
      FieldName = 'CodBarra'
      Size = 14
    end
    object mEtiqueta_NavItem_Talao: TIntegerField
      FieldName = 'Item_Talao'
    end
    object mEtiqueta_NavNum_Pedido: TIntegerField
      FieldName = 'Num_Pedido'
    end
  end
  object dsmEtiqueta_Nav: TDataSource
    DataSet = mEtiqueta_Nav
    Left = 448
    Top = 215
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
    ReportOptions.CreateDate = 41928.578144409700000000
    ReportOptions.LastChange = 43297.716358703700000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 368
    Top = 296
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
    Left = 408
    Top = 295
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
    Left = 448
    Top = 295
  end
  object frxRichObject1: TfrxRichObject
    Left = 480
    Top = 295
  end
  object frxmEtiqueta_Nav: TfrxDBDataset
    UserName = 'frxmEtiqueta_Nav'
    CloseDataSource = False
    FieldAliases.Strings = (
      'Nome_Empresa=Nome_Empresa'
      'Fone=Fone'
      'Nome_Etiqueta=Nome_Etiqueta'
      'Tamanho=Tamanho'
      'Referencia=Referencia'
      'Nome_Produto=Nome_Produto'
      'Nome_Cliente=Nome_Cliente'
      'Qtd=Qtd'
      'Pedido_Cliente=Pedido_Cliente'
      'Fantasia_Cli=Fantasia_Cli'
      'DtEmissao=DtEmissao'
      'Prod_Cliente=Prod_Cliente'
      'NumOS=NumOS'
      'Encerado=Encerado'
      'Item_Ped=Item_Ped'
      'Unidade=Unidade'
      'CodBarra=CodBarra'
      'Item_Talao=Item_Talao'
      'Num_Pedido=Num_Pedido')
    DataSource = dsmEtiqueta_Nav
    BCDToCurrency = False
    Left = 368
    Top = 349
  end
  object dsPedido_Itens: TDataSource
    DataSet = cdsPedido_Itens
    Left = 184
    Top = 125
  end
  object cdsPedido_Itens: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID;ITEM'
    Params = <>
    ProviderName = 'dspPedido_Itens'
    Left = 136
    Top = 125
    object cdsPedido_ItensID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPedido_ItensITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPedido_ItensGEROU_PED_TALAO: TStringField
      FieldName = 'GEROU_PED_TALAO'
      FixedChar = True
      Size = 1
    end
    object cdsPedido_ItensQTD_POR_ROTULO: TIntegerField
      FieldName = 'QTD_POR_ROTULO'
    end
  end
  object dspPedido_Itens: TDataSetProvider
    DataSet = sdsPedido_Itens
    UpdateMode = upWhereKeyOnly
    Left = 96
    Top = 125
  end
  object sdsPedido_Itens: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT I.ID, I.ITEM, I.gerou_ped_talao, I.qtd_por_rotulo'#13#10'FROM P' +
      'EDIDO_ITEM I'#13#10'WHERE I.ID = :ID'#13#10'  AND I.ITEM = :ITEM'#13#10
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
    Left = 56
    Top = 125
    object sdsPedido_ItensID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsPedido_ItensITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsPedido_ItensGEROU_PED_TALAO: TStringField
      FieldName = 'GEROU_PED_TALAO'
      FixedChar = True
      Size = 1
    end
    object sdsPedido_ItensQTD_POR_ROTULO: TIntegerField
      FieldName = 'QTD_POR_ROTULO'
    end
  end
  object dsConsulta_Talao: TDataSource
    DataSet = cdsConsulta_Talao
    Left = 520
    Top = 101
  end
  object cdsConsulta_Talao: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID;ITEM;ITEM_TALAO'
    Params = <>
    ProviderName = 'dspConsulta_Talao'
    Left = 472
    Top = 101
    object cdsConsulta_TalaoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsulta_TalaoITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsConsulta_TalaoITEM_TALAO: TIntegerField
      FieldName = 'ITEM_TALAO'
      Required = True
    end
    object cdsConsulta_TalaoQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsConsulta_TalaoCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 14
    end
    object cdsConsulta_TalaoDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object cdsConsulta_TalaoHRBAIXA: TTimeField
      FieldName = 'HRBAIXA'
    end
    object cdsConsulta_TalaoDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsConsulta_TalaoHREMISSAO: TTimeField
      FieldName = 'HREMISSAO'
    end
    object cdsConsulta_TalaoNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object cdsConsulta_TalaoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsConsulta_TalaoNOMEPRODUTO: TStringField
      FieldName = 'NOMEPRODUTO'
      Size = 100
    end
    object cdsConsulta_TalaoNOME_COR: TStringField
      FieldName = 'NOME_COR'
      Size = 60
    end
  end
  object dspConsulta_Talao: TDataSetProvider
    DataSet = sdsConsulta_Talao
    Left = 432
    Top = 101
  end
  object sdsConsulta_Talao: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select PL.*, P.num_pedido, PI.REFERENCIA, PI.NOMEPRODUTO, COMB.N' +
      'OME NOME_COR'#13#10'from pedido_talao PL'#13#10'INNER JOIN PEDIDO P'#13#10'ON PL.I' +
      'D = P.ID'#13#10'INNER JOIN PEDIDO_ITEM PI'#13#10' ON PL.ID = PI.ID'#13#10' AND PL.' +
      'ITEM = PI.ITEM'#13#10'LEFT JOIN COMBINACAO COMB'#13#10'ON PI.ID_COR = COMB.I' +
      'D'#13#10'where P.NUM_PEDIDO = :NUM_PEDIDO'#13#10#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_PEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 392
    Top = 101
  end
  object qParametros_Lote: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT QTD_PADRAO_ETIQ'
      'FROM PARAMETROS_LOTE')
    SQLConnection = dmDatabase.scoDados
    Left = 704
    Top = 216
    object qParametros_LoteQTD_PADRAO_ETIQ: TIntegerField
      FieldName = 'QTD_PADRAO_ETIQ'
    end
  end
end
