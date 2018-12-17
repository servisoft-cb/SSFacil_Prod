object DMCadPreFat: TDMCadPreFat
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 391
  Top = 6
  Height = 685
  Width = 896
  object sdsPreFat: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM PREFAT'#13#10'WHERE ID = :ID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 64
    Top = 29
    object sdsPreFatID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsPreFatID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
    end
    object sdsPreFatQTD_VOLUME: TIntegerField
      FieldName = 'QTD_VOLUME'
    end
    object sdsPreFatFATURADO: TStringField
      FieldName = 'FATURADO'
      Size = 1
    end
    object sdsPreFatFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object sdsPreFatID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object sdsPreFatDATA: TDateField
      FieldName = 'DATA'
    end
    object sdsPreFatID_NOTA: TIntegerField
      FieldName = 'ID_NOTA'
    end
    object sdsPreFatID_TRANSPORTADORA: TIntegerField
      FieldName = 'ID_TRANSPORTADORA'
    end
    object sdsPreFatLIBERADO_FAT: TStringField
      FieldName = 'LIBERADO_FAT'
      Size = 1
    end
  end
  object dspPreFat: TDataSetProvider
    DataSet = sdsPreFat
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspPreFatUpdateError
    Left = 104
    Top = 29
  end
  object cdsPreFat: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspPreFat'
    OnNewRecord = cdsPreFatNewRecord
    Left = 144
    Top = 29
    object cdsPreFatID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPreFatID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
    end
    object cdsPreFatQTD_VOLUME: TIntegerField
      FieldName = 'QTD_VOLUME'
    end
    object cdsPreFatFATURADO: TStringField
      FieldName = 'FATURADO'
      Size = 1
    end
    object cdsPreFatsdsPreFat_Itens: TDataSetField
      FieldName = 'sdsPreFat_Itens'
    end
    object cdsPreFatFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsPreFatID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsPreFatDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsPreFatID_NOTA: TIntegerField
      FieldName = 'ID_NOTA'
    end
    object cdsPreFatID_TRANSPORTADORA: TIntegerField
      FieldName = 'ID_TRANSPORTADORA'
    end
    object cdsPreFatsdsPreFat_Vol: TDataSetField
      FieldName = 'sdsPreFat_Vol'
    end
    object cdsPreFatLIBERADO_FAT: TStringField
      FieldName = 'LIBERADO_FAT'
      Size = 1
    end
  end
  object dsPreFat: TDataSource
    DataSet = cdsPreFat
    Left = 184
    Top = 29
  end
  object dsPreFat_Mestre: TDataSource
    DataSet = sdsPreFat
    Left = 32
    Top = 69
  end
  object sdsPreFat_Itens: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT PRE.*, PI.REFERENCIA, PI.NOMEPRODUTO, PI.NUMOS,'#13#10'PI.ID_PR' +
      'ODUTO'#13#10'FROM PREFAT_ITENS PRE'#13#10'LEFT JOIN PEDIDO_ITEM PI'#13#10'  ON PRE' +
      '.ID_PEDIDO = PI.ID'#13#10' AND PRE.ITEM_PEDIDO = PI.ITEM'#13#10'WHERE PRE.ID' +
      ' =:ID'
    DataSource = dsPreFat_Mestre
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 64
    Top = 96
    object sdsPreFat_ItensID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsPreFat_ItensITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsPreFat_ItensID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object sdsPreFat_ItensITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object sdsPreFat_ItensQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsPreFat_ItensID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      ProviderFlags = []
    end
    object sdsPreFat_ItensREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      ProviderFlags = []
    end
    object sdsPreFat_ItensNOMEPRODUTO: TStringField
      FieldName = 'NOMEPRODUTO'
      ProviderFlags = []
      Size = 100
    end
    object sdsPreFat_ItensNUMOS: TStringField
      FieldName = 'NUMOS'
      ProviderFlags = []
      Size = 30
    end
    object sdsPreFat_ItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      ProviderFlags = []
    end
    object sdsPreFat_ItensEXISTE_VOL_ETIQ: TStringField
      FieldName = 'EXISTE_VOL_ETIQ'
      FixedChar = True
      Size = 1
    end
  end
  object cdsPreFat_Itens: TClientDataSet
    Active = True
    Aggregates = <>
    DataSetField = cdsPreFatsdsPreFat_Itens
    IndexFieldNames = 'ID;ITEM'
    Params = <>
    OnCalcFields = cdsPreFat_ItensCalcFields
    OnNewRecord = cdsPreFat_ItensNewRecord
    Left = 144
    Top = 96
    object cdsPreFat_ItensID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPreFat_ItensITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPreFat_ItensID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object cdsPreFat_ItensITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object cdsPreFat_ItensQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsPreFat_ItensID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      ProviderFlags = []
    end
    object cdsPreFat_ItensREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      ProviderFlags = []
    end
    object cdsPreFat_ItensNOMEPRODUTO: TStringField
      FieldName = 'NOMEPRODUTO'
      ProviderFlags = []
      Size = 100
    end
    object cdsPreFat_ItensNUMOS: TStringField
      FieldName = 'NUMOS'
      ProviderFlags = []
      Size = 30
    end
    object cdsPreFat_ItensclPedido_Cliente: TStringField
      FieldKind = fkCalculated
      FieldName = 'clPedido_Cliente'
      Calculated = True
    end
    object cdsPreFat_ItensclNum_Pedido: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'clNum_Pedido'
      Calculated = True
    end
    object cdsPreFat_ItensID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      ProviderFlags = []
    end
    object cdsPreFat_ItensEXISTE_VOL_ETIQ: TStringField
      FieldName = 'EXISTE_VOL_ETIQ'
      FixedChar = True
      Size = 1
    end
  end
  object dsPedFat_Itens: TDataSource
    DataSet = cdsPreFat_Itens
    Left = 184
    Top = 96
  end
  object qParametros_NFe: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT GRAVAR_TAB_TAMANHO, PERMITE_IMPORTAR_S_CLIENTE'
      'FROM PARAMETROS_NFE'
      'WHERE ID = 1')
    SQLConnection = dmDatabase.scoDados
    Left = 360
    Top = 288
    object qParametros_NFeGRAVAR_TAB_TAMANHO: TStringField
      FieldName = 'GRAVAR_TAB_TAMANHO'
      FixedChar = True
      Size = 1
    end
    object qParametros_NFePERMITE_IMPORTAR_S_CLIENTE: TStringField
      FieldName = 'PERMITE_IMPORTAR_S_CLIENTE'
      FixedChar = True
      Size = 1
    end
  end
  object qParametros_Geral: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT EMPRESA_VAREJO'
      'FROM PARAMETROS_GERAL'
      'WHERE ID = 1')
    SQLConnection = dmDatabase.scoDados
    Left = 352
    Top = 360
    object qParametros_GeralEMPRESA_VAREJO: TStringField
      FieldName = 'EMPRESA_VAREJO'
      FixedChar = True
      Size = 1
    end
  end
  object dsPendente_Lib: TDataSource
    DataSet = cdsPendente_Lib
    Left = 608
    Top = 117
  end
  object cdsPendente_Lib: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID;ITEM'
    Params = <>
    ProviderName = 'dspPendente_Lib'
    Left = 560
    Top = 117
    object cdsPendente_LibID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPendente_LibITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsPendente_LibID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsPendente_LibREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsPendente_LibTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object cdsPendente_LibID_COR: TFMTBCDField
      FieldName = 'ID_COR'
      Precision = 15
      Size = 0
    end
    object cdsPendente_LibNOMEPRODUTO: TStringField
      FieldName = 'NOMEPRODUTO'
      Size = 100
    end
    object cdsPendente_LibCOD_PRODUTO_CLIENTE: TStringField
      FieldName = 'COD_PRODUTO_CLIENTE'
      Size = 15
    end
    object cdsPendente_LibCOD_COR_CLIENTE: TStringField
      FieldName = 'COD_COR_CLIENTE'
      Size = 10
    end
    object cdsPendente_LibUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsPendente_LibQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsPendente_LibQTD_RESTANTE: TFloatField
      FieldName = 'QTD_RESTANTE'
    end
    object cdsPendente_LibNUMOS: TStringField
      FieldName = 'NUMOS'
      Size = 30
    end
    object cdsPendente_LibENCERADO: TStringField
      FieldName = 'ENCERADO'
      FixedChar = True
      Size = 1
    end
    object cdsPendente_LibTAMANHO_CLIENTE: TStringField
      FieldName = 'TAMANHO_CLIENTE'
      Size = 10
    end
    object cdsPendente_LibIMP_COR_CLIENTE: TStringField
      FieldName = 'IMP_COR_CLIENTE'
      FixedChar = True
      Size = 1
    end
    object cdsPendente_LibNOME_COR_CLIENTE: TStringField
      FieldName = 'NOME_COR_CLIENTE'
      Size = 100
    end
    object cdsPendente_LibGEROU_PED_TALAO: TStringField
      FieldName = 'GEROU_PED_TALAO'
      FixedChar = True
      Size = 1
    end
    object cdsPendente_LibNOME_COR_COMBINACAO: TStringField
      FieldName = 'NOME_COR_COMBINACAO'
      Size = 60
    end
    object cdsPendente_LibDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsPendente_LibID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsPendente_LibFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsPendente_LibPEDIDO_CLIENTE: TStringField
      FieldName = 'PEDIDO_CLIENTE'
    end
    object cdsPendente_LibNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object cdsPendente_LibNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Size = 60
    end
    object cdsPendente_LibFANTASIA_CLI: TStringField
      FieldName = 'FANTASIA_CLI'
      Size = 30
    end
    object cdsPendente_LibNOME_INTERNO_FIL: TStringField
      FieldName = 'NOME_INTERNO_FIL'
      Size = 30
    end
    object cdsPendente_LibQTD_POR_ROTULO: TIntegerField
      FieldName = 'QTD_POR_ROTULO'
    end
    object cdsPendente_LibQTD_CONFERIDO: TFloatField
      FieldName = 'QTD_CONFERIDO'
    end
    object cdsPendente_LibQTD_LIBERADA: TFloatField
      FieldName = 'QTD_LIBERADA'
    end
    object cdsPendente_LibQTD_FATURADO: TFloatField
      FieldName = 'QTD_FATURADO'
    end
  end
  object dspPendente_Lib: TDataSetProvider
    DataSet = sdsPendente_Lib
    Left = 520
    Top = 117
  end
  object sdsPendente_Lib: TSQLDataSet
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
      'e_interno NOME_INTERNO_FIL, pi.qtd_por_rotulo, PI.qtd_conferido,' +
      ' PI.qtd_liberada,'#13#10'PI.qtd_faturado'#13#10'FROM PEDIDO_ITEM PI'#13#10'LEFT JO' +
      'IN PEDIDO PED'#13#10'ON PI.ID = PED.ID'#13#10'INNER JOIN PESSOA CLI'#13#10'ON PED.' +
      'ID_CLIENTE = CLI.CODIGO'#13#10'INNER JOIN FILIAL FIL'#13#10'ON PED.FILIAL = ' +
      'FIL.ID'#13#10'LEFT JOIN PRODUTO PRO ON (PI.ID_PRODUTO = PRO.ID)'#13#10'LEFT ' +
      'JOIN COMBINACAO COMB ON (PI.ID_COR = COMB.ID)'#13#10'WHERE  (PI.QTD > ' +
      '0)'#13#10' AND PED.TIPO_REG = '#39'P'#39#13#10' AND PI.QTD_RESTANTE > 0'#13#10' AND coal' +
      'esce(PI.QTD_CONFERIDO,0) > 0'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 480
    Top = 117
  end
  object dsConsulta: TDataSource
    DataSet = cdsConsulta
    Left = 496
    Top = 21
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta'
    Left = 448
    Top = 21
    object cdsConsultaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsultaID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
    end
    object cdsConsultaQTD_VOLUME: TIntegerField
      FieldName = 'QTD_VOLUME'
    end
    object cdsConsultaFATURADO: TStringField
      FieldName = 'FATURADO'
      Size = 1
    end
    object cdsConsultaFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsConsultaID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsConsultaFANTASIA_CLI: TStringField
      FieldName = 'FANTASIA_CLI'
      Size = 30
    end
    object cdsConsultaNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object cdsConsultaNOME_FILIAL: TStringField
      FieldName = 'NOME_FILIAL'
      Size = 60
    end
    object cdsConsultaDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsConsultaID_NOTA: TIntegerField
      FieldName = 'ID_NOTA'
    end
    object cdsConsultaID_TRANSPORTADORA: TIntegerField
      FieldName = 'ID_TRANSPORTADORA'
    end
    object cdsConsultaNOME_TRANSP: TStringField
      FieldName = 'NOME_TRANSP'
      Size = 60
    end
    object cdsConsultaNOME_INTERNO_FIL: TStringField
      FieldName = 'NOME_INTERNO_FIL'
      Size = 30
    end
    object cdsConsultaLIBERADO_FAT: TStringField
      FieldName = 'LIBERADO_FAT'
      Size = 1
    end
    object cdsConsultaNUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
    end
    object cdsConsultaDTEMISSAO_NOTA: TDateField
      FieldName = 'DTEMISSAO_NOTA'
    end
  end
  object dspConsulta: TDataSetProvider
    DataSet = sdsConsulta
    Left = 408
    Top = 21
  end
  object sdsConsulta: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT PRE.*, CLI.FANTASIA FANTASIA_CLI, CLI.NOME NOME_CLIENTE,'#13 +
      #10'F.NOME NOME_FILIAL, TRA.NOME NOME_TRANSP, F.nome_interno NOME_I' +
      'NTERNO_FIL,'#13#10'N.numnota, N.dtemissao DTEMISSAO_NOTA'#13#10'FROM PREFAT ' +
      'PRE'#13#10'INNER JOIN PESSOA CLI'#13#10'ON PRE.ID_CLIENTE = CLI.CODIGO'#13#10'INNE' +
      'R JOIN FILIAL F'#13#10'ON PRE.FILIAL = F.ID'#13#10'LEFT JOIN PESSOA TRA'#13#10'ON ' +
      'PRE.ID_TRANSPORTADORA = TRA.CODIGO'#13#10'LEFT JOIN NOTAFISCAL N'#13#10'ON P' +
      'RE.id_nota = N.ID'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 368
    Top = 21
  end
  object dsFilial: TDataSource
    DataSet = cdsFilial
    Left = 608
    Top = 173
  end
  object cdsFilial: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFilial'
    Left = 560
    Top = 173
    object cdsFilialID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsFilialNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsFilialNOME_INTERNO: TStringField
      FieldName = 'NOME_INTERNO'
      Size = 30
    end
    object cdsFilialCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      Size = 18
    end
  end
  object dspFilial: TDataSetProvider
    DataSet = sdsFilial
    Left = 520
    Top = 173
  end
  object sdsFilial: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT ID, NOME, NOME_INTERNO, CNPJ_CPF'#13#10'FROM FILIAL'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 480
    Top = 173
  end
  object dsClienteLib: TDataSource
    DataSet = cdsClienteLib
    Left = 616
    Top = 229
  end
  object cdsClienteLib: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClienteLib'
    Left = 568
    Top = 229
    object cdsClienteLibNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsClienteLibFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 30
    end
    object cdsClienteLibCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsClienteLibCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
    end
  end
  object dspClienteLib: TDataSetProvider
    DataSet = sdsClienteLib
    Left = 528
    Top = 229
  end
  object sdsClienteLib: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT DISTINCT CLI.NOME, CLI.FANTASIA, CLI.CODIGO, CLI.CNPJ_CPF' +
      #13#10'FROM PEDIDO_ITEM PI'#13#10'INNER JOIN PEDIDO PED'#13#10'ON PI.ID = PED.ID'#13 +
      #10'INNER JOIN PESSOA CLI'#13#10'ON PED.ID_CLIENTE = CLI.CODIGO'#13#10'INNER JO' +
      'IN FILIAL FIL'#13#10'ON PED.FILIAL = FIL.ID'#13#10'WHERE  (PI.QTD > 0)'#13#10' AND' +
      ' PED.TIPO_REG = '#39'P'#39#13#10' AND PI.QTD_RESTANTE > 0'#13#10' AND coalesce(PI.' +
      'QTD_CONFERIDO,0) > 0'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 488
    Top = 232
  end
  object dsPedido_Item: TDataSource
    DataSet = cdsPedido_Item
    Left = 624
    Top = 285
  end
  object cdsPedido_Item: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID;ITEM'
    Params = <>
    ProviderName = 'dspPedido_Item'
    Left = 576
    Top = 285
    object cdsPedido_ItemID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPedido_ItemITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsPedido_ItemQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsPedido_ItemQTD_CONFERIDO: TFloatField
      FieldName = 'QTD_CONFERIDO'
    end
    object cdsPedido_ItemQTD_LIBERADA: TFloatField
      FieldName = 'QTD_LIBERADA'
    end
  end
  object dspPedido_Item: TDataSetProvider
    DataSet = sdsPedido_Item
    Left = 536
    Top = 285
  end
  object sdsPedido_Item: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT I.ID, I.ITEM, I.qtd, I.qtd_conferido, I.qtd_liberada'#13#10'FRO' +
      'M PEDIDO_ITEM I'#13#10'WHERE I.ID = :ID'#13#10'  AND I.ITEM = :ITEM'
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
    Left = 496
    Top = 285
    object sdsPedido_ItemID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsPedido_ItemITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object sdsPedido_ItemQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsPedido_ItemQTD_CONFERIDO: TFloatField
      FieldName = 'QTD_CONFERIDO'
    end
    object sdsPedido_ItemQTD_LIBERADA: TFloatField
      FieldName = 'QTD_LIBERADA'
    end
  end
  object dsCliente: TDataSource
    DataSet = cdsCliente
    Left = 264
    Top = 477
  end
  object cdsCliente: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'FANTASIA'
    Params = <>
    ProviderName = 'dspCliente'
    Left = 216
    Top = 477
    object cdsClienteNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsClienteFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 30
    end
    object cdsClienteCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsClienteCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
    end
  end
  object dspCliente: TDataSetProvider
    DataSet = sdsCliente
    Left = 176
    Top = 477
  end
  object sdsCliente: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT DISTINCT CLI.NOME, CLI.FANTASIA, CLI.CODIGO, CLI.CNPJ_CPF' +
      #13#10'FROM PESSOA CLI'#13#10'WHERE  CLI.TP_CLIENTE = '#39'S'#39#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 136
    Top = 480
    object sdsClienteNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object sdsClienteFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 30
    end
    object sdsClienteCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sdsClienteCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
    end
  end
  object qPedido: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT NUM_PEDIDO, PEDIDO_CLIENTE'
      'FROM PEDIDO'
      'WHERE ID = :ID')
    SQLConnection = dmDatabase.scoDados
    Left = 368
    Top = 120
    object qPedidoNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object qPedidoPEDIDO_CLIENTE: TStringField
      FieldName = 'PEDIDO_CLIENTE'
    end
  end
  object dsTransp: TDataSource
    DataSet = cdsTransp
    Left = 264
    Top = 533
  end
  object cdsTransp: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspTransp'
    Left = 216
    Top = 533
    object cdsTranspNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsTranspFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 30
    end
    object cdsTranspCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsTranspCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
    end
  end
  object dspTransp: TDataSetProvider
    DataSet = sdsTransp
    Left = 176
    Top = 533
  end
  object sdsTransp: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT TRA.NOME, TRA.FANTASIA, TRA.CODIGO, TRA.CNPJ_CPF'#13#10'FROM PE' +
      'SSOA TRA'#13#10'WHERE  TRA.TP_TRANSPORTADORA = '#39'S'#39#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 136
    Top = 536
  end
  object sdsPreFat_Vol: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM PREFAT_VOL'#13#10'WHERE ID = :ID'
    DataSource = dsPreFat_Mestre
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 64
    Top = 152
    object sdsPreFat_VolID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsPreFat_VolNUM_VOLUME: TIntegerField
      FieldName = 'NUM_VOLUME'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsPreFat_VolQTD_PROD: TFloatField
      FieldName = 'QTD_PROD'
    end
    object sdsPreFat_VolQTD_ETIQ: TIntegerField
      FieldName = 'QTD_ETIQ'
    end
    object sdsPreFat_VolFECHADA: TStringField
      FieldName = 'FECHADA'
      FixedChar = True
      Size = 1
    end
  end
  object cdsPreFat_Vol: TClientDataSet
    Active = True
    Aggregates = <>
    DataSetField = cdsPreFatsdsPreFat_Vol
    IndexFieldNames = 'ID;NUM_VOLUME'
    Params = <>
    OnNewRecord = cdsPreFat_VolNewRecord
    Left = 144
    Top = 152
    object cdsPreFat_VolID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPreFat_VolNUM_VOLUME: TIntegerField
      FieldName = 'NUM_VOLUME'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPreFat_VolQTD_PROD: TFloatField
      FieldName = 'QTD_PROD'
    end
    object cdsPreFat_VolQTD_ETIQ: TIntegerField
      FieldName = 'QTD_ETIQ'
    end
    object cdsPreFat_VolFECHADA: TStringField
      FieldName = 'FECHADA'
      FixedChar = True
      Size = 1
    end
    object cdsPreFat_VolsdsPreFat_Vol_Etiq: TDataSetField
      FieldName = 'sdsPreFat_Vol_Etiq'
    end
  end
  object dsPreFat_Vol: TDataSource
    DataSet = cdsPreFat_Vol
    Left = 200
    Top = 152
  end
  object dsPreFat_Vol_Mestre: TDataSource
    DataSet = sdsPreFat_Vol
    Left = 48
    Top = 200
  end
  object sdsPreFat_Vol_Etiq: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT *'#13#10'FROM PREFAT_VOL_ETIQ'#13#10'WHERE ID = :ID'#13#10'  AND NUM_VOLUME' +
      ' = :NUM_VOLUME'#13#10
    DataSource = dsPreFat_Vol_Mestre
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftInteger
        Name = 'NUM_VOLUME'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 72
    Top = 248
    object sdsPreFat_Vol_EtiqID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsPreFat_Vol_EtiqNUM_VOLUME: TIntegerField
      FieldName = 'NUM_VOLUME'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsPreFat_Vol_EtiqITEM_ETIQ: TIntegerField
      FieldName = 'ITEM_ETIQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsPreFat_Vol_EtiqID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object sdsPreFat_Vol_EtiqITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object sdsPreFat_Vol_EtiqQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsPreFat_Vol_EtiqITEM_TALAO: TIntegerField
      FieldName = 'ITEM_TALAO'
    end
  end
  object cdsPreFat_Vol_Etiq: TClientDataSet
    Active = True
    Aggregates = <>
    DataSetField = cdsPreFat_VolsdsPreFat_Vol_Etiq
    IndexFieldNames = 'ID;NUM_VOLUME;ITEM_ETIQ'
    Params = <>
    OnCalcFields = cdsPreFat_Vol_EtiqCalcFields
    Left = 144
    Top = 248
    object cdsPreFat_Vol_EtiqID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPreFat_Vol_EtiqNUM_VOLUME: TIntegerField
      FieldName = 'NUM_VOLUME'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPreFat_Vol_EtiqITEM_ETIQ: TIntegerField
      FieldName = 'ITEM_ETIQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPreFat_Vol_EtiqID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object cdsPreFat_Vol_EtiqITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object cdsPreFat_Vol_EtiqQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsPreFat_Vol_EtiqITEM_TALAO: TIntegerField
      FieldName = 'ITEM_TALAO'
    end
    object cdsPreFat_Vol_EtiqclPedido_Cliente: TStringField
      FieldKind = fkCalculated
      FieldName = 'clPedido_Cliente'
      Size = 30
      Calculated = True
    end
    object cdsPreFat_Vol_EtiqclNum_Pedido: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'clNum_Pedido'
      Calculated = True
    end
  end
  object dsPreFat_Vol_Etiq: TDataSource
    DataSet = cdsPreFat_Vol_Etiq
    Left = 208
    Top = 248
  end
  object mAuxVolume: TClientDataSet
    Aggregates = <>
    Params = <>
    OnNewRecord = mAuxVolumeNewRecord
    Left = 216
    Top = 360
    object mAuxVolumeID_Pedido: TIntegerField
      FieldName = 'ID_Pedido'
    end
    object mAuxVolumeItem_Pedido: TIntegerField
      FieldName = 'Item_Pedido'
    end
    object mAuxVolumeID_Produto: TIntegerField
      FieldName = 'ID_Produto'
    end
    object mAuxVolumeID_Cor: TIntegerField
      FieldName = 'ID_Cor'
    end
    object mAuxVolumeReferencia: TStringField
      FieldName = 'Referencia'
    end
    object mAuxVolumeQtd: TFloatField
      FieldName = 'Qtd'
    end
    object mAuxVolumeItem_Talao: TIntegerField
      FieldName = 'Item_Talao'
    end
    object mAuxVolumeID_Cliente: TIntegerField
      FieldName = 'ID_Cliente'
    end
  end
  object dsmAuxVolume: TDataSource
    DataSet = mAuxVolume
    Left = 240
    Top = 360
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
    ReportOptions.CreateDate = 42423.001568946800000000
    ReportOptions.LastChange = 43339.428955277780000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 480
    Top = 480
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
    Left = 520
    Top = 479
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
    Left = 560
    Top = 479
  end
  object frxRichObject1: TfrxRichObject
    Left = 592
    Top = 479
  end
  object dsVolume: TDataSource
    DataSet = cdsVolume
    Left = 696
    Top = 381
  end
  object cdsVolume: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NUM_VOLUME;PEDIDO_CLIENTE;ITEM_PEDIDO'
    Params = <>
    ProviderName = 'dspVolume'
    Left = 648
    Top = 381
    object cdsVolumeID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsVolumeNUM_VOLUME: TIntegerField
      FieldName = 'NUM_VOLUME'
      Required = True
    end
    object cdsVolumeQTD_ETIQ: TIntegerField
      FieldName = 'QTD_ETIQ'
    end
    object cdsVolumeQTD_PROD: TFloatField
      FieldName = 'QTD_PROD'
    end
    object cdsVolumeID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object cdsVolumeITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object cdsVolumeID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsVolumeREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsVolumeNOMEPRODUTO: TStringField
      FieldName = 'NOMEPRODUTO'
      Size = 100
    end
    object cdsVolumeNOME_COR: TStringField
      FieldName = 'NOME_COR'
      Size = 60
    end
    object cdsVolumeQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsVolumeUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsVolumePEDIDO_CLIENTE: TStringField
      FieldName = 'PEDIDO_CLIENTE'
    end
    object cdsVolumeNUMOS: TStringField
      FieldName = 'NUMOS'
      Size = 30
    end
    object cdsVolumeNUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
    end
    object cdsVolumeSERIE: TStringField
      FieldName = 'SERIE'
      Size = 3
    end
  end
  object dspVolume: TDataSetProvider
    DataSet = sdsVolume
    Left = 608
    Top = 381
  end
  object sdsVolume: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select v.id, v.num_volume, v.qtd_etiq, v.qtd_prod, etiq.id_pedid' +
      'o, etiq.item_pedido,'#13#10'it.id_produto, it.referencia, it.nomeprodu' +
      'to, comb.nome nome_Cor, etiq.qtd, it.unidade,'#13#10'ped.pedido_client' +
      'e, it.numos, NT.NUMNOTA, NT.SERIE'#13#10'FROM prefat_vol v'#13#10'inner join' +
      ' prefat_vol_etiq etiq'#13#10'on v.id = etiq.id'#13#10'and v.num_volume = eti' +
      'q.num_volume'#13#10'INNER JOIN PREFAT PF'#13#10'ON V.ID = PF.ID'#13#10'inner join ' +
      'pedido_item it'#13#10'on etiq.id_pedido = it.id'#13#10'and etiq.item_pedido ' +
      '= it.item'#13#10'inner join pedido ped'#13#10'on it.id = ped.id'#13#10'left join c' +
      'ombinacao comb'#13#10'on it.id_cor = comb.id'#13#10'LEFT JOIN NOTAFISCAL NT'#13 +
      #10'ON PF.ID_NOTA = NT.ID'#13#10'WHERE V.ID = :ID'#13#10#13#10#13#10#13#10#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 568
    Top = 381
    object sdsVolumeID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsVolumeNUM_VOLUME: TIntegerField
      FieldName = 'NUM_VOLUME'
      Required = True
    end
    object sdsVolumeQTD_ETIQ: TIntegerField
      FieldName = 'QTD_ETIQ'
    end
    object sdsVolumeQTD_PROD: TFloatField
      FieldName = 'QTD_PROD'
    end
    object sdsVolumeID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object sdsVolumeITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object sdsVolumeID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object sdsVolumeREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object sdsVolumeNOMEPRODUTO: TStringField
      FieldName = 'NOMEPRODUTO'
      Size = 100
    end
    object sdsVolumeNOME_COR: TStringField
      FieldName = 'NOME_COR'
      Size = 60
    end
    object sdsVolumeQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsVolumeUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object sdsVolumePEDIDO_CLIENTE: TStringField
      FieldName = 'PEDIDO_CLIENTE'
    end
    object sdsVolumeNUMOS: TStringField
      FieldName = 'NUMOS'
      Size = 30
    end
    object sdsVolumeNUMNOTA: TIntegerField
      FieldName = 'NUMNOTA'
    end
    object sdsVolumeSERIE: TStringField
      FieldName = 'SERIE'
      Size = 3
    end
  end
  object frxVolume: TfrxDBDataset
    UserName = 'frxVolume'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'NUM_VOLUME=NUM_VOLUME'
      'QTD_ETIQ=QTD_ETIQ'
      'QTD_PROD=QTD_PROD'
      'ID_PEDIDO=ID_PEDIDO'
      'ITEM_PEDIDO=ITEM_PEDIDO'
      'ID_PRODUTO=ID_PRODUTO'
      'REFERENCIA=REFERENCIA'
      'NOMEPRODUTO=NOMEPRODUTO'
      'NOME_COR=NOME_COR'
      'QTD=QTD'
      'UNIDADE=UNIDADE'
      'PEDIDO_CLIENTE=PEDIDO_CLIENTE'
      'NUMOS=NUMOS'
      'NUMNOTA=NUMNOTA'
      'SERIE=SERIE')
    DataSource = dsVolume
    BCDToCurrency = False
    Left = 480
    Top = 535
  end
  object qVerExcluir: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_pedido'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'item_pedido'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select count(1) CONTADOR'
      'from prefat_vol_etiq i'
      'where (i.id_pedido = :id_pedido)'
      '  and (i.item_pedido = :item_pedido)')
    SQLConnection = dmDatabase.scoDados
    Left = 352
    Top = 488
    object qVerExcluirCONTADOR: TIntegerField
      FieldName = 'CONTADOR'
      Required = True
    end
  end
end
