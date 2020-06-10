object DMCadLote: TDMCadLote
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 111
  Top = 7
  Height = 715
  Width = 1223
  object sdsLote: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM LOTE'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 112
    Top = 11
    object sdsLoteID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsLoteNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object sdsLoteQTD_TALOES: TIntegerField
      FieldName = 'QTD_TALOES'
    end
    object sdsLoteDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object sdsLoteHREMISSAO: TTimeField
      FieldName = 'HREMISSAO'
    end
    object sdsLoteFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object sdsLoteOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object sdsLoteID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object sdsLoteQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsLoteDTENTREGA: TDateField
      FieldName = 'DTENTREGA'
    end
    object sdsLoteNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object sdsLoteCARIMBO: TStringField
      FieldName = 'CARIMBO'
      Size = 25
    end
    object sdsLoteID_COMBINACAO: TIntegerField
      FieldName = 'ID_COMBINACAO'
    end
    object sdsLoteNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object sdsLoteNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object sdsLoteTALAO_AUX_GERADO: TStringField
      FieldName = 'TALAO_AUX_GERADO'
      FixedChar = True
      Size = 1
    end
    object sdsLoteID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object sdsLoteTIPO_LOTE: TStringField
      FieldName = 'TIPO_LOTE'
      FixedChar = True
      Size = 1
    end
    object sdsLoteREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object sdsLoteUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object sdsLoteDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object sdsLoteHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object sdsLoteDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object sdsLoteHRBAIXA: TTimeField
      FieldName = 'HRBAIXA'
    end
    object sdsLoteQTD_PENDENTE: TFloatField
      FieldName = 'QTD_PENDENTE'
    end
    object sdsLoteQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
    end
    object sdsLoteITEM_ORDEM: TIntegerField
      FieldName = 'ITEM_ORDEM'
    end
    object sdsLoteITEM_ORDEM_TOTAL: TIntegerField
      FieldName = 'ITEM_ORDEM_TOTAL'
    end
    object sdsLoteOBS_PED: TStringField
      FieldName = 'OBS_PED'
      Size = 100
    end
    object sdsLoteID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object sdsLoteIMPRESSO: TStringField
      FieldName = 'IMPRESSO'
      Size = 1
    end
    object sdsLoteQTD_ORIGINAL: TFloatField
      FieldName = 'QTD_ORIGINAL'
    end
    object sdsLoteQTD_PARES: TFloatField
      FieldName = 'QTD_PARES'
    end
    object sdsLoteID_PROCESSO_GRUPO: TIntegerField
      FieldName = 'ID_PROCESSO_GRUPO'
    end
    object sdsLoteCOMPLETO: TStringField
      FieldName = 'COMPLETO'
      Size = 1
    end
    object sdsLoteID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object sdsLoteCONSUMO_MAT: TFloatField
      FieldName = 'CONSUMO_MAT'
    end
    object sdsLoteID_MATERIAL2: TIntegerField
      FieldName = 'ID_MATERIAL2'
    end
    object sdsLoteCONSUMO_MAT2: TFloatField
      FieldName = 'CONSUMO_MAT2'
    end
    object sdsLoteID_PRODUTO_PRI: TIntegerField
      FieldName = 'ID_PRODUTO_PRI'
    end
    object sdsLoteID_COR_MAT: TIntegerField
      FieldName = 'ID_COR_MAT'
    end
    object sdsLoteID_COR_MAT2: TIntegerField
      FieldName = 'ID_COR_MAT2'
    end
    object sdsLoteENCERADO: TStringField
      FieldName = 'ENCERADO'
      Size = 1
    end
    object sdsLoteNUM_REMESSA: TStringField
      FieldName = 'NUM_REMESSA'
      Size = 15
    end
    object sdsLoteITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object sdsLoteBAIXADO: TStringField
      FieldName = 'BAIXADO'
      Size = 1
    end
    object sdsLoteID_MOVESTOQUE_RES: TIntegerField
      FieldName = 'ID_MOVESTOQUE_RES'
    end
    object sdsLoteQTD_ESTOQUE_USADA: TFloatField
      FieldName = 'QTD_ESTOQUE_USADA'
    end
    object sdsLoteNUM_LOTE_CONTROLE: TStringField
      FieldName = 'NUM_LOTE_CONTROLE'
    end
    object sdsLoteNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object sdsLoteTIPO_LOTE_ESTOQUE: TStringField
      FieldName = 'TIPO_LOTE_ESTOQUE'
      FixedChar = True
      Size = 1
    end
    object sdsLoteCARGA: TFloatField
      FieldName = 'CARGA'
    end
    object sdsLoteID_MOVESTOQUE: TIntegerField
      FieldName = 'ID_MOVESTOQUE'
    end
  end
  object dspLote: TDataSetProvider
    DataSet = sdsLote
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspLoteUpdateError
    Left = 160
    Top = 8
  end
  object cdsLote: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspLote'
    OnNewRecord = cdsLoteNewRecord
    Left = 207
    Top = 8
    object cdsLoteID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLoteNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object cdsLoteQTD_TALOES: TIntegerField
      FieldName = 'QTD_TALOES'
    end
    object cdsLoteDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsLoteHREMISSAO: TTimeField
      FieldName = 'HREMISSAO'
    end
    object cdsLotesdsTalao: TDataSetField
      FieldName = 'sdsTalao'
    end
    object cdsLoteFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsLoteOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsLoteID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsLoteQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsLoteDTENTREGA: TDateField
      FieldName = 'DTENTREGA'
    end
    object cdsLoteNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsLoteCARIMBO: TStringField
      FieldName = 'CARIMBO'
      Size = 25
    end
    object cdsLoteID_COMBINACAO: TIntegerField
      FieldName = 'ID_COMBINACAO'
    end
    object cdsLotesdsTalao_Aux: TDataSetField
      FieldName = 'sdsTalao_Aux'
    end
    object cdsLoteNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object cdsLoteNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object cdsLoteTALAO_AUX_GERADO: TStringField
      FieldName = 'TALAO_AUX_GERADO'
      FixedChar = True
      Size = 1
    end
    object cdsLoteID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object cdsLoteTIPO_LOTE: TStringField
      FieldName = 'TIPO_LOTE'
      FixedChar = True
      Size = 1
    end
    object cdsLoteREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsLoteUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsLotesdsLote_Ped: TDataSetField
      FieldName = 'sdsLote_Ped'
    end
    object cdsLoteDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object cdsLoteHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object cdsLoteDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object cdsLoteHRBAIXA: TTimeField
      FieldName = 'HRBAIXA'
    end
    object cdsLoteQTD_PENDENTE: TFloatField
      FieldName = 'QTD_PENDENTE'
    end
    object cdsLoteQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
    end
    object cdsLoteITEM_ORDEM: TIntegerField
      FieldName = 'ITEM_ORDEM'
    end
    object cdsLoteITEM_ORDEM_TOTAL: TIntegerField
      FieldName = 'ITEM_ORDEM_TOTAL'
    end
    object cdsLoteOBS_PED: TStringField
      FieldName = 'OBS_PED'
      Size = 100
    end
    object cdsLoteID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsLoteIMPRESSO: TStringField
      FieldName = 'IMPRESSO'
      Size = 1
    end
    object cdsLoteQTD_ORIGINAL: TFloatField
      FieldName = 'QTD_ORIGINAL'
    end
    object cdsLoteQTD_PARES: TFloatField
      FieldName = 'QTD_PARES'
    end
    object cdsLoteID_PROCESSO_GRUPO: TIntegerField
      FieldName = 'ID_PROCESSO_GRUPO'
    end
    object cdsLoteCOMPLETO: TStringField
      FieldName = 'COMPLETO'
      Size = 1
    end
    object cdsLoteID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object cdsLoteCONSUMO_MAT: TFloatField
      FieldName = 'CONSUMO_MAT'
    end
    object cdsLoteID_MATERIAL2: TIntegerField
      FieldName = 'ID_MATERIAL2'
    end
    object cdsLoteCONSUMO_MAT2: TFloatField
      FieldName = 'CONSUMO_MAT2'
    end
    object cdsLoteID_PRODUTO_PRI: TIntegerField
      FieldName = 'ID_PRODUTO_PRI'
    end
    object cdsLoteID_COR_MAT: TIntegerField
      FieldName = 'ID_COR_MAT'
    end
    object cdsLoteID_COR_MAT2: TIntegerField
      FieldName = 'ID_COR_MAT2'
    end
    object cdsLotesdsLote_Ped_Calc: TDataSetField
      FieldName = 'sdsLote_Ped_Calc'
    end
    object cdsLoteENCERADO: TStringField
      FieldName = 'ENCERADO'
      Size = 1
    end
    object cdsLoteNUM_REMESSA: TStringField
      FieldName = 'NUM_REMESSA'
      Size = 15
    end
    object cdsLoteITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object cdsLoteBAIXADO: TStringField
      FieldName = 'BAIXADO'
      Size = 1
    end
    object cdsLoteID_MOVESTOQUE_RES: TIntegerField
      FieldName = 'ID_MOVESTOQUE_RES'
    end
    object cdsLoteQTD_ESTOQUE_USADA: TFloatField
      FieldName = 'QTD_ESTOQUE_USADA'
    end
    object cdsLoteNUM_LOTE_CONTROLE: TStringField
      FieldName = 'NUM_LOTE_CONTROLE'
    end
    object cdsLoteNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object cdsLoteTIPO_LOTE_ESTOQUE: TStringField
      FieldName = 'TIPO_LOTE_ESTOQUE'
      FixedChar = True
      Size = 1
    end
    object cdsLoteCARGA: TFloatField
      FieldName = 'CARGA'
    end
    object cdsLoteID_MOVESTOQUE: TIntegerField
      FieldName = 'ID_MOVESTOQUE'
    end
  end
  object dsLote: TDataSource
    DataSet = cdsLote
    Left = 255
    Top = 8
  end
  object dsLote_Mestre: TDataSource
    DataSet = sdsLote
    Left = 64
    Top = 32
  end
  object sdsTalao: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM TALAO'#13#10'WHERE ID = :ID'#13#10
    DataSource = dsLote_Mestre
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 128
    Top = 72
    object sdsTalaoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsTalaoNUM_TALAO: TIntegerField
      FieldName = 'NUM_TALAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsTalaoID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object sdsTalaoTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object sdsTalaoQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsTalaoQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
    end
    object sdsTalaoQTD_PENDENTE: TFloatField
      FieldName = 'QTD_PENDENTE'
    end
    object sdsTalaoDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object sdsTalaoHRBAIXA: TTimeField
      FieldName = 'HRBAIXA'
    end
    object sdsTalaoID_COMBINACAO: TIntegerField
      FieldName = 'ID_COMBINACAO'
    end
    object sdsTalaoID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object sdsTalaoIMPRESSO: TStringField
      FieldName = 'IMPRESSO'
      FixedChar = True
      Size = 1
    end
    object sdsTalaoDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object sdsTalaoHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object sdsTalaoITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object sdsTalaoID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object sdsTalaoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object sdsTalaoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
  end
  object cdsTalao: TClientDataSet
    Aggregates = <>
    DataSetField = cdsLotesdsTalao
    IndexFieldNames = 'ID;NUM_TALAO'
    Params = <>
    Left = 184
    Top = 72
    object cdsTalaoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTalaoNUM_TALAO: TIntegerField
      FieldName = 'NUM_TALAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTalaoID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsTalaoTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object cdsTalaoQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsTalaoQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
    end
    object cdsTalaoQTD_PENDENTE: TFloatField
      FieldName = 'QTD_PENDENTE'
    end
    object cdsTalaoDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object cdsTalaoHRBAIXA: TTimeField
      FieldName = 'HRBAIXA'
    end
    object cdsTalaoID_COMBINACAO: TIntegerField
      FieldName = 'ID_COMBINACAO'
    end
    object cdsTalaosdsTalao_Ped: TDataSetField
      FieldName = 'sdsTalao_Ped'
    end
    object cdsTalaoID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object cdsTalaoIMPRESSO: TStringField
      FieldName = 'IMPRESSO'
      FixedChar = True
      Size = 1
    end
    object cdsTalaoDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object cdsTalaoHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object cdsTalaosdsTalao_Processo: TDataSetField
      FieldName = 'sdsTalao_Processo'
    end
    object cdsTalaoITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object cdsTalaoID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object cdsTalaoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsTalaoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
  end
  object dsTalao: TDataSource
    DataSet = cdsTalao
    Left = 240
    Top = 72
  end
  object dsTalao_Mestre: TDataSource
    DataSet = sdsTalao
    Left = 96
    Top = 96
  end
  object sdsTalao_Ped: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT *'#13#10'FROM TALAO_PED'#13#10'WHERE ID = :ID'#13#10'  AND NUM_TALAO = :NUM' +
      '_TALAO'#13#10
    DataSource = dsTalao_Mestre
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
        Name = 'NUM_TALAO'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 144
    Top = 136
    object sdsTalao_PedID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsTalao_PedNUM_TALAO: TIntegerField
      FieldName = 'NUM_TALAO'
      Required = True
    end
    object sdsTalao_PedID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
      Required = True
    end
    object sdsTalao_PedITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
      Required = True
    end
    object sdsTalao_PedQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsTalao_PedID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object sdsTalao_PedNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object sdsTalao_PedBAIXADO: TStringField
      FieldName = 'BAIXADO'
      FixedChar = True
      Size = 1
    end
  end
  object cdsTalao_Ped: TClientDataSet
    Aggregates = <>
    DataSetField = cdsTalaosdsTalao_Ped
    IndexFieldNames = 'ID;NUM_TALAO;ID_PEDIDO;ITEM_PEDIDO'
    Params = <>
    Left = 200
    Top = 136
    object cdsTalao_PedID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTalao_PedNUM_TALAO: TIntegerField
      FieldName = 'NUM_TALAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTalao_PedID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTalao_PedITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTalao_PedQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsTalao_PedID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsTalao_PedBAIXADO: TStringField
      FieldName = 'BAIXADO'
      FixedChar = True
      Size = 1
    end
  end
  object dsTalao_Ped: TDataSource
    DataSet = cdsTalao_Ped
    Left = 256
    Top = 136
  end
  object qProximo_Lote: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT MAX(NUM_LOTE) NUM_LOTE'
      'FROM LOTE')
    SQLConnection = dmDatabase.scoDados
    Left = 904
    Top = 384
    object qProximo_LoteNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
  end
  object sdsPendente: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT prod.tipo_algodao tipo_algodao_prod, PED.NUM_PEDIDO, PED.' +
      'PEDIDO_CLIENTE, PED.ID_CLIENTE, PED.DTEMISSAO, PED.ID, PED.FILIA' +
      'L,'#13#10'PI.item, PI.id_produto, PI.id_cor,  PI.tamanho, PI.dtentrega' +
      ', PI.numos,'#13#10'PI.nomeproduto, PI.referencia, CLI.nome NOME_CLIENT' +
      'E, CLI.fantasia, PI.CARIMBO,'#13#10'COMB.NOME NOME_COMBINACAO, PI.item' +
      '_original, PI.selecionado, PROD.id_cor ID_COR_PROD,'#13#10'COR.NOME NO' +
      'ME_COR_PROD, PROD.TIPO_MAT, PROD.id_processo_grupo,'#13#10'PROD.tipo_r' +
      'eg TIPO_REG_PROD, SEMI.id_material1 ID_MATERIAL, SEMI.qtd_consum' +
      'o1 QTD_CONSUMO_MAT,'#13#10'SEMI.unidade1 UNIDADE_MAT, PROD.ID_FORMA, P' +
      'I.ENCERADO, PSEMI.TIPO_ALGODAO,  PI.qtd_estoque_res,'#13#10'CASE'#13#10'  WH' +
      'EN (SELECT PP.usa_reserva_est FROM PARAMETROS_PED PP) = '#39'S'#39' THEN' +
      ' PI.QTD - coalesce(PI.qtd_estoque_res,0)'#13#10'  WHEN (PI.unidade_pro' +
      'd IS not NULL) AND (PI.unidade_prod <> PI.unidade) THEN PI.QTD *' +
      ' COALESCE(PI.CONV_UNIDADE,1)'#13#10'  ELSE PI.QTD'#13#10'  END QTD_RESTANTE,' +
      #13#10'CASE'#13#10'  WHEN (PI.unidade_prod IS not NULL) AND (PI.unidade_pro' +
      'd <> PI.unidade) THEN PI.UNIDADE_PROD'#13#10'  ELSE PI.UNIDADE'#13#10'  END ' +
      'UNIDADE,'#13#10'CASE'#13#10'  WHEN (PI.unidade_prod IS not NULL) AND (PI.uni' +
      'dade_prod <> PI.unidade) THEN ((PI.QTD * COALESCE(PI.CONV_UNIDAD' +
      'E,1)) *  COALESCE(SEMI.qtd_consumo1,1))'#13#10'  ELSE coalesce(semi.qt' +
      'd_consumo1,1) * pi.qtd'#13#10'  END consumo_calc, PSEMI.id_processo_gr' +
      'upo id_processo_SEMI,'#13#10'case'#13#10'  WHEN (SELECT GRAVAR_OBS_LOTE FROM' +
      ' PARAMETROS_LOTE WHERE ID = 1) = '#39'I'#39' THEN PI.OBS'#13#10'  WHEN (SELECT' +
      ' GRAVAR_OBS_LOTE FROM PARAMETROS_LOTE WHERE ID = 1) = '#39'P'#39' THEN P' +
      'ROD.OBS'#13#10'  WHEN (SELECT GRAVAR_OBS_LOTE FROM PARAMETROS_LOTE WHE' +
      'RE ID = 1) = '#39'A'#39' THEN coalesce(PI.obs,'#39#39') || '#39' '#39' || coalesce(pro' +
      'd.obs,'#39#39')'#13#10'  ELSE '#39#39#13#10'  END OBS_LOTE, cast (0 as Double precisio' +
      'n) qtd_estoque'#13#10#13#10'FROM PEDIDO PED'#13#10'INNER JOIN PEDIDO_ITEM PI'#13#10'ON' +
      ' PED.ID = PI.ID'#13#10'INNER JOIN PESSOA CLI'#13#10'ON PED.ID_CLIENTE = CLI.' +
      'codigo'#13#10'LEFT JOIN COMBINACAO COMB'#13#10'ON PI.ID_COR = COMB.ID'#13#10'LEFT ' +
      'JOIN PRODUTO PROD'#13#10'ON PI.id_produto = PROD.ID'#13#10'LEFT JOIN COR'#13#10'ON' +
      ' PROD.ID_COR = COR.ID'#13#10'LEFT JOIN PRODUTO_SEMI SEMI'#13#10'ON PROD.ID =' +
      ' SEMI.ID'#13#10'LEFT JOIN PRODUTO PSEMI'#13#10'ON PSEMI.ID = SEMI.ID_MATERIA' +
      'L1'#13#10'WHERE PED.TIPO_REG = '#39'P'#39#13#10'  AND PI.GERAR_LOTE = '#39'S'#39#13#10#13#10#13#10#13#10#13 +
      #10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 452
    Top = 7
  end
  object dspPendente: TDataSetProvider
    DataSet = sdsPendente
    Left = 512
    Top = 6
  end
  object cdsPendente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPendente'
    Left = 577
    Top = 6
    object cdsPendenteNUM_PEDIDO: TIntegerField
      DisplayLabel = 'N'#186' Ped. Interno'
      FieldName = 'NUM_PEDIDO'
    end
    object cdsPendentePEDIDO_CLIENTE: TStringField
      DisplayLabel = 'Pedido Cliente (OC)'
      FieldName = 'PEDIDO_CLIENTE'
    end
    object cdsPendenteID_CLIENTE: TIntegerField
      DisplayLabel = 'ID Cliente'
      FieldName = 'ID_CLIENTE'
    end
    object cdsPendenteDTEMISSAO: TDateField
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'DTEMISSAO'
    end
    object cdsPendenteID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPendenteFILIAL: TIntegerField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
    end
    object cdsPendenteITEM: TIntegerField
      DisplayLabel = 'Item Ped.'
      FieldName = 'ITEM'
      Required = True
    end
    object cdsPendenteID_PRODUTO: TIntegerField
      DisplayLabel = 'ID Produto'
      FieldName = 'ID_PRODUTO'
    end
    object cdsPendenteTAMANHO: TStringField
      DisplayLabel = 'Tamanho'
      FieldName = 'TAMANHO'
      Size = 10
    end
    object cdsPendenteDTENTREGA: TDateField
      DisplayLabel = 'Data Entrega'
      FieldName = 'DTENTREGA'
    end
    object cdsPendenteNUMOS: TStringField
      DisplayLabel = 'N'#186' OS'
      FieldName = 'NUMOS'
      Size = 30
    end
    object cdsPendenteNOMEPRODUTO: TStringField
      DisplayLabel = 'Nome Produto'
      FieldName = 'NOMEPRODUTO'
      Size = 100
    end
    object cdsPendenteREFERENCIA: TStringField
      DisplayLabel = 'Refer'#234'ncia'
      FieldName = 'REFERENCIA'
    end
    object cdsPendenteNOME_CLIENTE: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object cdsPendenteFANTASIA: TStringField
      DisplayLabel = 'Fantasia'
      FieldName = 'FANTASIA'
      Size = 30
    end
    object cdsPendenteCARIMBO: TStringField
      FieldName = 'CARIMBO'
      Size = 25
    end
    object cdsPendenteID_COR: TFMTBCDField
      FieldName = 'ID_COR'
      Precision = 15
      Size = 0
    end
    object cdsPendenteNOME_COMBINACAO: TStringField
      DisplayLabel = 'Nome Combina'#231#227'o'
      FieldName = 'NOME_COMBINACAO'
      Size = 60
    end
    object cdsPendenteQTD_RESTANTE: TFloatField
      FieldName = 'QTD_RESTANTE'
    end
    object cdsPendenteITEM_ORIGINAL: TIntegerField
      FieldName = 'ITEM_ORIGINAL'
    end
    object cdsPendenteSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object cdsPendenteID_COR_PROD: TIntegerField
      FieldName = 'ID_COR_PROD'
    end
    object cdsPendenteNOME_COR_PROD: TStringField
      FieldName = 'NOME_COR_PROD'
      Size = 45
    end
    object cdsPendenteTIPO_MAT: TStringField
      FieldName = 'TIPO_MAT'
      Size = 1
    end
    object cdsPendenteID_PROCESSO_GRUPO: TIntegerField
      FieldName = 'ID_PROCESSO_GRUPO'
    end
    object cdsPendenteUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsPendenteTIPO_REG_PROD: TStringField
      FieldName = 'TIPO_REG_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsPendenteID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object cdsPendenteQTD_CONSUMO_MAT: TFloatField
      FieldName = 'QTD_CONSUMO_MAT'
      DisplayFormat = '0.000##'
    end
    object cdsPendenteUNIDADE_MAT: TStringField
      FieldName = 'UNIDADE_MAT'
      Size = 6
    end
    object cdsPendenteCONSUMO_CALC: TFloatField
      FieldName = 'CONSUMO_CALC'
      DisplayFormat = '0.000##'
    end
    object cdsPendenteID_FORMA: TIntegerField
      FieldName = 'ID_FORMA'
    end
    object cdsPendenteID_PROCESSO_SEMI: TIntegerField
      FieldName = 'ID_PROCESSO_SEMI'
    end
    object cdsPendenteENCERADO: TStringField
      FieldName = 'ENCERADO'
      FixedChar = True
      Size = 1
    end
    object cdsPendenteOBS_LOTE: TMemoField
      FieldName = 'OBS_LOTE'
      BlobType = ftMemo
      Size = 1
    end
    object cdsPendenteTIPO_ALGODAO: TStringField
      FieldName = 'TIPO_ALGODAO'
      FixedChar = True
      Size = 1
    end
    object cdsPendenteTIPO_ALGODAO_PROD: TStringField
      FieldName = 'TIPO_ALGODAO_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsPendenteQTD_ESTOQUE: TFloatField
      FieldName = 'QTD_ESTOQUE'
      Required = True
      DisplayFormat = '0.000##'
    end
    object cdsPendenteQTD_ESTOQUE_RES: TFloatField
      FieldName = 'QTD_ESTOQUE_RES'
    end
  end
  object dsPendente: TDataSource
    DataSet = cdsPendente
    Left = 624
    Top = 6
  end
  object sdsConsulta_Lote: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT L.dtemissao, L.num_lote, L.filial, L.hremissao, L.DTENTRE' +
      'GA,'#13#10'L.qtd_taloes, L.NUM_ORDEM, L.CARIMBO, L.TALAO_AUX_GERADO,'#13#10 +
      'T.id, T.num_talao, T.id, T.id_produto, T.tamanho, T.qtd, T.qtd_p' +
      'endente, T.qtd_produzido,'#13#10'T.dtbaixa, T.hrbaixa, T.impresso, T.i' +
      'd_combinacao, T.dtentrada,'#13#10'T.hrentrada, T.item_pedido, T.id_ped' +
      'ido, PRO.REFERENCIA, PRO.NOME NOME_PRODUTO, PRO.UNIDADE, FIL.NOM' +
      'E NOME_FILIAL, PRO.ID_GRADE,'#13#10'PCP.acabamento, PCP.cor_acabamento' +
      ', PCP.id_tipo_matriz, TM.NOME NOME_TIPOMATRIZ,'#13#10'COMB.nome NOME_C' +
      'OMBINACAO, L.NOME NOME_LOTE, PR.NOME NOME_PROCESSO, L.TIPO_LOTE,' +
      #13#10'L.num_pedido, PED.pedido_cliente, CLI.nome NOME_CLIENTE, PRO.i' +
      'd_cor ID_COR_PROD, T.unidade UNIDADE_TALAO, t.id_processo,'#13#10'PRO.' +
      'id_forma, FORMA.NOME NOME_FORMA, L.OBS_PED, L.NUM_REMESSA'#13#10'FROM ' +
      'LOTE L'#13#10'INNER JOIN TALAO T'#13#10'ON L.ID = T.ID'#13#10'INNER JOIN FILIAL FI' +
      'L'#13#10'ON L.FILIAL = FIL.ID'#13#10'LEFT JOIN PRODUTO PRO'#13#10'ON T.ID_PRODUTO ' +
      '= PRO.ID'#13#10'LEFT JOIN PRODUTO_PCP PCP'#13#10'ON T.ID_PRODUTO = PCP.ID'#13#10'L' +
      'EFT JOIN TIPO_MATRIZ TM'#13#10'ON PCP.ID_TIPO_MATRIZ = TM.ID'#13#10'LEFT JOI' +
      'N combinacao COMB'#13#10'ON L.id_combinacao = COMB.id'#13#10'LEFT JOIN PROCE' +
      'SSO PR'#13#10'ON T.id_processo = PR.ID'#13#10'LEFT JOIN pedido PED'#13#10'ON L.id_' +
      'pedido = PED.ID'#13#10'LEFT JOIN PESSOA CLI'#13#10'ON PED.id_cliente = CLI.c' +
      'odigo'#13#10'LEFT JOIN PRODUTO FORMA'#13#10'ON PRO.ID_FORMA = FORMA.ID'#13#10#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 456
    Top = 97
  end
  object dspConsulta_Lote: TDataSetProvider
    DataSet = sdsConsulta_Lote
    Left = 512
    Top = 97
  end
  object cdsConsulta_Lote: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta_Lote'
    Left = 576
    Top = 97
    object cdsConsulta_LoteDTEMISSAO: TDateField
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'DTEMISSAO'
    end
    object cdsConsulta_LoteNUM_LOTE: TIntegerField
      DisplayLabel = 'N'#186' Lote'
      FieldName = 'NUM_LOTE'
    end
    object cdsConsulta_LoteFILIAL: TIntegerField
      DisplayLabel = 'Filial'
      FieldName = 'FILIAL'
    end
    object cdsConsulta_LoteHREMISSAO: TTimeField
      DisplayLabel = 'Hora Emiss'#227'o'
      FieldName = 'HREMISSAO'
    end
    object cdsConsulta_LoteID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsulta_LoteNUM_TALAO: TIntegerField
      DisplayLabel = 'N'#186' Tal'#227'o'
      FieldName = 'NUM_TALAO'
      Required = True
    end
    object cdsConsulta_LoteID_PRODUTO: TIntegerField
      DisplayLabel = 'ID Produto'
      FieldName = 'ID_PRODUTO'
    end
    object cdsConsulta_LoteTAMANHO: TStringField
      DisplayLabel = 'Tamanho'
      FieldName = 'TAMANHO'
      Size = 10
    end
    object cdsConsulta_LoteQTD: TFloatField
      DisplayLabel = 'Qtd'
      FieldName = 'QTD'
    end
    object cdsConsulta_LoteQTD_PRODUZIDO: TFloatField
      DisplayLabel = 'Qtd. Produzido'
      FieldName = 'QTD_PRODUZIDO'
    end
    object cdsConsulta_LoteQTD_PENDENTE: TFloatField
      DisplayLabel = 'Qtd. Pendente'
      FieldName = 'QTD_PENDENTE'
    end
    object cdsConsulta_LoteDTBAIXA: TDateField
      DisplayLabel = 'Data Baixa'
      FieldName = 'DTBAIXA'
    end
    object cdsConsulta_LoteHRBAIXA: TTimeField
      DisplayLabel = 'Hora Baixa'
      FieldName = 'HRBAIXA'
    end
    object cdsConsulta_LoteNOME_PRODUTO: TStringField
      DisplayLabel = 'Nome do Produto'
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object cdsConsulta_LoteIMPRESSO: TStringField
      FieldName = 'IMPRESSO'
      FixedChar = True
      Size = 1
    end
    object cdsConsulta_LoteDTENTREGA: TDateField
      DisplayLabel = 'Data Entrega'
      FieldName = 'DTENTREGA'
    end
    object cdsConsulta_LoteQTD_TALOES: TIntegerField
      DisplayLabel = 'N'#186' de Tal'#245'es'
      FieldName = 'QTD_TALOES'
    end
    object cdsConsulta_LoteNOME_FILIAL: TStringField
      DisplayLabel = 'Nome Filial'
      FieldName = 'NOME_FILIAL'
      Size = 60
    end
    object cdsConsulta_LoteUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 3
    end
    object cdsConsulta_LoteNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsConsulta_LoteCARIMBO: TStringField
      FieldName = 'CARIMBO'
      Size = 25
    end
    object cdsConsulta_LoteID_GRADE: TIntegerField
      FieldName = 'ID_GRADE'
    end
    object cdsConsulta_LoteACABAMENTO: TStringField
      FieldName = 'ACABAMENTO'
      FixedChar = True
      Size = 1
    end
    object cdsConsulta_LoteCOR_ACABAMENTO: TStringField
      FieldName = 'COR_ACABAMENTO'
      Size = 30
    end
    object cdsConsulta_LoteID_TIPO_MATRIZ: TIntegerField
      FieldName = 'ID_TIPO_MATRIZ'
    end
    object cdsConsulta_LoteNOME_TIPOMATRIZ: TStringField
      FieldName = 'NOME_TIPOMATRIZ'
      Size = 40
    end
    object cdsConsulta_LoteID_COMBINACAO: TIntegerField
      FieldName = 'ID_COMBINACAO'
    end
    object cdsConsulta_LoteTALAO_AUX_GERADO: TStringField
      FieldName = 'TALAO_AUX_GERADO'
      FixedChar = True
      Size = 1
    end
    object cdsConsulta_LoteNOME_COMBINACAO: TStringField
      FieldName = 'NOME_COMBINACAO'
      Size = 60
    end
    object cdsConsulta_LoteNOME_LOTE: TStringField
      FieldName = 'NOME_LOTE'
      Size = 30
    end
    object cdsConsulta_LoteITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object cdsConsulta_LoteID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object cdsConsulta_LoteNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object cdsConsulta_LotePEDIDO_CLIENTE: TStringField
      FieldName = 'PEDIDO_CLIENTE'
    end
    object cdsConsulta_LoteNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object cdsConsulta_LoteTIPO_LOTE: TStringField
      FieldName = 'TIPO_LOTE'
      FixedChar = True
      Size = 1
    end
    object cdsConsulta_LoteUNIDADE_TALAO: TStringField
      FieldName = 'UNIDADE_TALAO'
      Size = 6
    end
    object cdsConsulta_LoteREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsConsulta_LoteNOME_PROCESSO: TStringField
      FieldName = 'NOME_PROCESSO'
      Size = 30
    end
    object cdsConsulta_LoteID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object cdsConsulta_LoteID_FORMA: TIntegerField
      FieldName = 'ID_FORMA'
    end
    object cdsConsulta_LoteNOME_FORMA: TStringField
      FieldName = 'NOME_FORMA'
      Size = 100
    end
    object cdsConsulta_LoteOBS_PED: TStringField
      FieldName = 'OBS_PED'
      Size = 100
    end
    object cdsConsulta_LoteNUM_REMESSA: TStringField
      FieldName = 'NUM_REMESSA'
      Size = 15
    end
  end
  object dsConsulta_Lote: TDataSource
    DataSet = cdsConsulta_Lote
    Left = 624
    Top = 97
  end
  object sdsProduto: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT PRO.*, PCP.cavidade_molde, PCP.cavidade_peca, PCP.ciclo, ' +
      'PCP.qtd_talao,'#13#10'PCP.tempo_troca_matriz, PCP.tempo_troca_cor, TRA' +
      'NC.metros_carga'#13#10'FROM PRODUTO PRO'#13#10'LEFT JOIN PRODUTO_PCP PCP'#13#10'ON' +
      ' PRO.id = PCP.ID'#13#10'LEFT JOIN PRODUTO_TRANC TRANC'#13#10'ON PRO.ID = TRA' +
      'NC.ID'#13#10'WHERE ((PRO.TIPO_REG = '#39'P'#39') or (PRO.TIPO_REG = '#39'S'#39'))'#13#10'   ' +
      ' AND PRO.INATIVO = '#39'N'#39#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 456
    Top = 192
  end
  object dspProduto: TDataSetProvider
    DataSet = sdsProduto
    Left = 512
    Top = 192
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspProduto'
    Left = 577
    Top = 192
    object cdsProdutoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsProdutoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsProdutoNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsProdutoPERC_QUEBRAMAT: TFloatField
      FieldName = 'PERC_QUEBRAMAT'
    end
    object cdsProdutoCAVIDADE_MOLDE: TFloatField
      FieldName = 'CAVIDADE_MOLDE'
    end
    object cdsProdutoCAVIDADE_PECA: TFloatField
      FieldName = 'CAVIDADE_PECA'
    end
    object cdsProdutoCICLO: TFloatField
      FieldName = 'CICLO'
    end
    object cdsProdutoQTD_TALAO: TIntegerField
      FieldName = 'QTD_TALAO'
    end
    object cdsProdutoTEMPO_TROCA_MATRIZ: TFloatField
      FieldName = 'TEMPO_TROCA_MATRIZ'
    end
    object cdsProdutoTEMPO_TROCA_COR: TFloatField
      FieldName = 'TEMPO_TROCA_COR'
    end
    object cdsProdutoID_PROCESSO_GRUPO: TIntegerField
      FieldName = 'ID_PROCESSO_GRUPO'
    end
    object cdsProdutoMETROS_CARGA: TFloatField
      FieldName = 'METROS_CARGA'
    end
    object cdsProdutoTIPO_PRODUCAO: TStringField
      FieldName = 'TIPO_PRODUCAO'
      Size = 1
    end
  end
  object dsProduto: TDataSource
    DataSet = cdsProduto
    Left = 624
    Top = 192
  end
  object mLote: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Num_Lote'
        DataType = ftInteger
      end
      item
        Name = 'Num_Talao'
        DataType = ftInteger
      end
      item
        Name = 'ID_Produto'
        DataType = ftInteger
      end
      item
        Name = 'DtEntrega'
        DataType = ftDate
      end
      item
        Name = 'Qtd_Taloes'
        DataType = ftInteger
      end
      item
        Name = 'Qtd'
        DataType = ftFloat
      end
      item
        Name = 'Filial'
        DataType = ftInteger
      end
      item
        Name = 'Referencia'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Nome_Produto'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'DtEmissao'
        DataType = ftDate
      end
      item
        Name = 'Nome_Filial'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Unidade'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'ID_Lote'
        DataType = ftInteger
      end
      item
        Name = 'Tamanho'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Carimbo'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'ID_Grade'
        DataType = ftInteger
      end
      item
        Name = 'Num_Ordem'
        DataType = ftInteger
      end
      item
        Name = 'Acabamento'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Cor_Acabamento'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Nome_TipoMatriz'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Selecionado'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Nome_Combinacao'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ID_Combinacao'
        DataType = ftInteger
      end
      item
        Name = 'Talao_Aux_Gerado'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Nome_Lote'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ID_Processo'
        DataType = ftInteger
      end
      item
        Name = 'Nome_Processo'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Tipo_Lote'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Descricao_Tipo'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Pedido_Cliente'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Num_Pedido'
        DataType = ftInteger
      end
      item
        Name = 'Nome_Cliente'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'ID_Forma'
        DataType = ftInteger
      end
      item
        Name = 'Nome_Forma'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Obs'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ImprimirPor'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Foto'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Num_Remessa'
        DataType = ftString
        Size = 15
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'Num_Lote'
    Params = <>
    StoreDefs = True
    Left = 568
    Top = 438
    Data = {
      110400009619E0BD0100000018000000260000000000030000001104084E756D
      5F4C6F74650400010000000000094E756D5F54616C616F04000100000000000A
      49445F50726F6475746F0400010000000000094474456E747265676104000600
      000000000A5174645F54616C6F65730400010000000000035174640800040000
      0000000646696C69616C04000100000000000A5265666572656E636961010049
      00000001000557494454480200020014000C4E6F6D655F50726F6475746F0100
      490000000100055749445448020002002800094474456D697373616F04000600
      000000000B4E6F6D655F46696C69616C01004900000001000557494454480200
      02003C0007556E69646164650100490000000100055749445448020002000600
      0749445F4C6F746504000100000000000754616D616E686F0100490000000100
      055749445448020002000A0007436172696D626F010049000000010005574944
      54480200020019000849445F47726164650400010000000000094E756D5F4F72
      64656D04000100000000000A41636162616D656E746F01004900000001000557
      49445448020002000F000E436F725F41636162616D656E746F01004900000001
      00055749445448020002001E000F4E6F6D655F5469706F4D617472697A010049
      0000000100055749445448020002001E000B53656C6563696F6E61646F010049
      00000001000557494454480200020001000F4E6F6D655F436F6D62696E616361
      6F01004900000001000557494454480200020028000D49445F436F6D62696E61
      63616F04000100000000001054616C616F5F4175785F47657261646F01004900
      00000100055749445448020002000100094E6F6D655F4C6F7465010049000000
      0100055749445448020002001E000B49445F50726F636573736F040001000000
      00000D4E6F6D655F50726F636573736F01004900000001000557494454480200
      02003C00095469706F5F4C6F7465010049000000010005574944544802000200
      01000E44657363726963616F5F5469706F010049000000010005574944544802
      0002001E000E50656469646F5F436C69656E7465010049000000010005574944
      54480200020014000A4E756D5F50656469646F04000100000000000C4E6F6D65
      5F436C69656E74650100490000000100055749445448020002003C000849445F
      466F726D6104000100000000000A4E6F6D655F466F726D610100490000000100
      055749445448020002003C00034F627301004900000001000557494454480200
      020064000B496D7072696D6972506F7201004900000001000557494454480200
      0200010004466F746F01004900000001000557494454480200020064000B4E75
      6D5F52656D657373610100490000000100055749445448020002000F0001000D
      44454641554C545F4F524445520200820000000000}
    object mLoteNum_Lote: TIntegerField
      FieldName = 'Num_Lote'
    end
    object mLoteNum_Talao: TIntegerField
      FieldName = 'Num_Talao'
    end
    object mLoteID_Produto: TIntegerField
      FieldName = 'ID_Produto'
    end
    object mLoteDtEntrega: TDateField
      FieldName = 'DtEntrega'
    end
    object mLoteQtd_Taloes: TIntegerField
      FieldName = 'Qtd_Taloes'
    end
    object mLoteQtd: TFloatField
      FieldName = 'Qtd'
    end
    object mLoteFilial: TIntegerField
      FieldName = 'Filial'
    end
    object mLoteReferencia: TStringField
      FieldName = 'Referencia'
    end
    object mLoteNome_Produto: TStringField
      FieldName = 'Nome_Produto'
      Size = 40
    end
    object mLoteDtEmissao: TDateField
      FieldName = 'DtEmissao'
    end
    object mLoteNome_Filial: TStringField
      FieldName = 'Nome_Filial'
      Size = 60
    end
    object mLoteUnidade: TStringField
      FieldName = 'Unidade'
      Size = 6
    end
    object mLoteID_Lote: TIntegerField
      FieldName = 'ID_Lote'
    end
    object mLoteTamanho: TStringField
      FieldName = 'Tamanho'
      Size = 10
    end
    object mLoteCarimbo: TStringField
      FieldName = 'Carimbo'
      Size = 25
    end
    object mLoteID_Grade: TIntegerField
      FieldName = 'ID_Grade'
    end
    object mLoteNum_Ordem: TIntegerField
      FieldName = 'Num_Ordem'
    end
    object mLoteAcabamento: TStringField
      FieldName = 'Acabamento'
      Size = 15
    end
    object mLoteCor_Acabamento: TStringField
      FieldName = 'Cor_Acabamento'
      Size = 30
    end
    object mLoteNome_TipoMatriz: TStringField
      FieldName = 'Nome_TipoMatriz'
      Size = 30
    end
    object mLoteSelecionado: TStringField
      FieldName = 'Selecionado'
      Size = 1
    end
    object mLoteNome_Combinacao: TStringField
      FieldName = 'Nome_Combinacao'
      Size = 40
    end
    object mLoteID_Combinacao: TIntegerField
      FieldName = 'ID_Combinacao'
    end
    object mLoteTalao_Aux_Gerado: TStringField
      FieldName = 'Talao_Aux_Gerado'
      Size = 1
    end
    object mLoteNome_Lote: TStringField
      FieldName = 'Nome_Lote'
      Size = 30
    end
    object mLoteID_Processo: TIntegerField
      FieldName = 'ID_Processo'
    end
    object mLoteNome_Processo: TStringField
      FieldName = 'Nome_Processo'
      Size = 60
    end
    object mLoteTipo_Lote: TStringField
      FieldName = 'Tipo_Lote'
      Size = 1
    end
    object mLoteDescricao_Tipo: TStringField
      FieldName = 'Descricao_Tipo'
      Size = 30
    end
    object mLotePedido_Cliente: TStringField
      FieldName = 'Pedido_Cliente'
    end
    object mLoteNum_Pedido: TIntegerField
      FieldName = 'Num_Pedido'
    end
    object mLoteNome_Cliente: TStringField
      FieldName = 'Nome_Cliente'
      Size = 60
    end
    object mLoteID_Forma: TIntegerField
      FieldName = 'ID_Forma'
    end
    object mLoteNome_Forma: TStringField
      FieldName = 'Nome_Forma'
      Size = 60
    end
    object mLoteObs: TStringField
      FieldName = 'Obs'
      Size = 100
    end
    object mLoteImprimirPor: TStringField
      FieldName = 'ImprimirPor'
      Size = 1
    end
    object mLoteFoto: TStringField
      FieldName = 'Foto'
      Size = 100
    end
    object mLoteNum_Remessa: TStringField
      FieldName = 'Num_Remessa'
      Size = 15
    end
  end
  object mTalao: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'Num_Lote;Tamanho;Num_Talao'
    MasterFields = 'Num_Lote;Tamanho;Num_Talao'
    MasterSource = dsmLote
    PacketRecords = 0
    Params = <>
    Left = 640
    Top = 438
    Data = {
      650000009619E0BD0100000018000000040000000000030000006500084E756D
      5F4C6F74650400010000000000094E756D5F54616C616F040001000000000007
      54616D616E686F0100490000000100055749445448020002000A000351746408
      000400000000000000}
    object mTalaoNum_Lote: TIntegerField
      FieldName = 'Num_Lote'
    end
    object mTalaoNum_Talao: TIntegerField
      FieldName = 'Num_Talao'
    end
    object mTalaoTamanho: TStringField
      FieldName = 'Tamanho'
      Size = 10
    end
    object mTalaoQtd: TFloatField
      FieldName = 'Qtd'
    end
  end
  object dsmLote: TDataSource
    DataSet = mLote
    Left = 600
    Top = 438
  end
  object dsmTalao: TDataSource
    DataSet = mTalao
    Left = 680
    Top = 438
  end
  object qProxima_Ordem: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT MAX(NUM_ORDEM) NUM_ORDEM'
      'FROM LOTE')
    SQLConnection = dmDatabase.scoDados
    Left = 1008
    Top = 376
    object qProxima_OrdemNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
  end
  object qVerificaExclusao: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_ORDEM'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT COUNT(1)'
      'FROM baixa_processo B'
      'WHERE ((B.dtentrada IS NOT NULL) or (B.DTBAIXA IS NOT NULL))'
      'AND B.NUM_ORDEM = :NUM_ORDEM'
      'and b.qtd > 0')
    SQLConnection = dmDatabase.scoDados
    Left = 360
    Top = 32
    object qVerificaExclusaoCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
  object sdsProduto_Consumo: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT PC.*, PS.IMP_TALAO IMP_TALAO_POS, MAT.NOME NOME_MATERIAL,' +
      ' MAT.ID_GRADE, MAT.REFERENCIA REF_MATERIAL,'#13#10'PS.NOME NOME_POSICA' +
      'O, PS.imp_material, PS.imp_agrupado_material, COR.NOME NOME_COR,' +
      ' PMAT.ID_COR'#13#10'FROM PRODUTO_COMB PCOMB'#13#10'INNER JOIN PRODUTO_COMB_M' +
      'AT PMAT'#13#10'ON PCOMB.ID = PMAT.ID'#13#10'AND PCOMB.ITEM = PMAT.ITEM'#13#10'INNE' +
      'R JOIN PRODUTO_CONSUMO PC'#13#10'ON PMAT.ID = PC.ID'#13#10'AND PMAT.ID_MATER' +
      'IAL = PC.ID_MATERIAL'#13#10'AND PMAT.ID_POSICAO = PC.ID_POSICAO'#13#10'LEFT ' +
      'JOIN POSICAO PS'#13#10'ON PC.ID_POSICAO = PS.ID'#13#10'INNER JOIN PRODUTO MA' +
      'T'#13#10'ON PC.ID_MATERIAL = MAT.ID'#13#10'LEFT JOIN COMBINACAO COR'#13#10'ON PMAT' +
      '.ID_COR = COR.ID'#13#10'WHERE PCOMB.ID = :ID'#13#10'  AND PCOMB.ID_COR_COMBI' +
      'NACAO = :ID_COR_COMBINACAO'#13#10'  AND ((PS.IMP_TALAO = '#39'S'#39'  AND PC.I' +
      'D_POSICAO > 0) OR (PC.IMP_TALAO = '#39'S'#39'))'#13#10'ORDER BY PC.ID_SETOR'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_COR_COMBINACAO'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 544
    Top = 486
  end
  object dspProduto_Consumo: TDataSetProvider
    DataSet = sdsProduto_Consumo
    Left = 600
    Top = 486
  end
  object cdsProduto_Consumo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto_Consumo'
    Left = 664
    Top = 486
    object cdsProduto_ConsumoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsProduto_ConsumoITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsProduto_ConsumoID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object cdsProduto_ConsumoQTD_CONSUMO: TFloatField
      FieldName = 'QTD_CONSUMO'
    end
    object cdsProduto_ConsumoQTD_UNIDADE: TFloatField
      FieldName = 'QTD_UNIDADE'
    end
    object cdsProduto_ConsumoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsProduto_ConsumoID_POSICAO: TIntegerField
      FieldName = 'ID_POSICAO'
    end
    object cdsProduto_ConsumoTIPO_CONSUMO: TStringField
      FieldName = 'TIPO_CONSUMO'
      FixedChar = True
      Size = 1
    end
    object cdsProduto_ConsumoNOME_MATERIAL: TStringField
      FieldName = 'NOME_MATERIAL'
      Size = 100
    end
    object cdsProduto_ConsumoID_GRADE: TIntegerField
      FieldName = 'ID_GRADE'
    end
    object cdsProduto_ConsumoREF_MATERIAL: TStringField
      FieldName = 'REF_MATERIAL'
    end
    object cdsProduto_ConsumoIMP_ROTULO: TStringField
      FieldName = 'IMP_ROTULO'
      FixedChar = True
      Size = 1
    end
    object cdsProduto_ConsumoIMP_TALAO: TStringField
      FieldName = 'IMP_TALAO'
      FixedChar = True
      Size = 1
    end
    object cdsProduto_ConsumoIMP_TALAO_POS: TStringField
      FieldName = 'IMP_TALAO_POS'
      FixedChar = True
      Size = 1
    end
    object cdsProduto_ConsumoNOME_POSICAO: TStringField
      FieldName = 'NOME_POSICAO'
      Size = 30
    end
    object cdsProduto_ConsumoIMP_MATERIAL: TStringField
      FieldName = 'IMP_MATERIAL'
      FixedChar = True
      Size = 1
    end
    object cdsProduto_ConsumoIMP_AGRUPADO_MATERIAL: TStringField
      FieldName = 'IMP_AGRUPADO_MATERIAL'
      FixedChar = True
      Size = 1
    end
    object cdsProduto_ConsumoNOME_COR: TStringField
      FieldName = 'NOME_COR'
      Size = 45
    end
    object cdsProduto_ConsumoID_COR: TIntegerField
      FieldName = 'ID_COR'
    end
  end
  object dsProduto_Consumo: TDataSource
    DataSet = cdsProduto_Consumo
    Left = 712
    Top = 486
  end
  object qParametros: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT *'
      'FROM PARAMETROS')
    SQLConnection = dmDatabase.scoDados
    Left = 904
    Top = 448
    object qParametrosMOSTRAR_MAT_LOTE: TStringField
      FieldName = 'MOSTRAR_MAT_LOTE'
      FixedChar = True
      Size = 1
    end
    object qParametrosUSA_CARIMBO: TStringField
      FieldName = 'USA_CARIMBO'
      FixedChar = True
      Size = 1
    end
    object qParametrosALTURA_ETIQ_ROT: TIntegerField
      FieldName = 'ALTURA_ETIQ_ROT'
    end
    object qParametrosIMP_NOME_POSICAO: TStringField
      FieldName = 'IMP_NOME_POSICAO'
      FixedChar = True
      Size = 1
    end
    object qParametrosINFORMAR_COR_PROD: TStringField
      FieldName = 'INFORMAR_COR_PROD'
      FixedChar = True
      Size = 1
    end
    object qParametrosMOSTRAR_LINHA_PROD: TStringField
      FieldName = 'MOSTRAR_LINHA_PROD'
      FixedChar = True
      Size = 1
    end
    object qParametrosMOSTRAR_EMBALAGEM: TStringField
      FieldName = 'MOSTRAR_EMBALAGEM'
      FixedChar = True
      Size = 1
    end
    object qParametrosUSA_SETOR_CONSUMO: TStringField
      FieldName = 'USA_SETOR_CONSUMO'
      FixedChar = True
      Size = 1
    end
    object qParametrosMOSTRAR_ATELIER_PROD: TStringField
      FieldName = 'MOSTRAR_ATELIER_PROD'
      FixedChar = True
      Size = 1
    end
    object qParametrosGERAR_TALAO_AUXILIAR: TStringField
      FieldName = 'GERAR_TALAO_AUXILIAR'
      FixedChar = True
      Size = 1
    end
    object qParametrosUSA_POSICAO_CONSUMO: TStringField
      FieldName = 'USA_POSICAO_CONSUMO'
      FixedChar = True
      Size = 1
    end
    object qParametrosUSA_ROTULO2: TStringField
      FieldName = 'USA_ROTULO2'
      FixedChar = True
      Size = 1
    end
    object qParametrosOPCAO_DTENTREGAPEDIDO: TStringField
      FieldName = 'OPCAO_DTENTREGAPEDIDO'
      FixedChar = True
      Size = 1
    end
    object qParametrosUSA_GRADE: TStringField
      FieldName = 'USA_GRADE'
      FixedChar = True
      Size = 1
    end
  end
  object mTamanho: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'Tamanho'
    Params = <>
    Left = 488
    Top = 438
    Data = {
      420000009619E0BD01000000180000000200000000000300000042000754616D
      616E686F0100490000000100055749445448020002000A000351746408000400
      000000000000}
    object mTamanhoTamanho: TStringField
      FieldName = 'Tamanho'
      Size = 10
    end
    object mTamanhoQtd: TFloatField
      FieldName = 'Qtd'
    end
  end
  object dsmTamanho: TDataSource
    DataSet = mTamanho
    Left = 520
    Top = 438
  end
  object qProduto_Consumo: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT PC.id, PC.id_material, MAT.nome NOME_MATERIAL'
      'FROM PRODUTO_CONSUMO PC'
      'INNER JOIN PRODUTO MAT'
      'ON PC.id_material = MAT.ID'
      'WHERE PC.IMP_ROTULO = '#39'S'#39
      '     AND PC.ID = :ID')
    SQLConnection = dmDatabase.scoDados
    Left = 752
    Top = 112
    object qProduto_ConsumoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qProduto_ConsumoID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object qProduto_ConsumoNOME_MATERIAL: TStringField
      FieldName = 'NOME_MATERIAL'
      Size = 100
    end
  end
  object qProduto_Consumo_Tam: TSQLQuery
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
      end
      item
        DataType = ftString
        Name = 'TAMANHO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM PRODUTO_CONSUMO_TAM'
      'WHERE ID = :ID'
      '    AND ITEM = :ITEM'
      '    AND TAMANHO = :TAMANHO'
      '')
    SQLConnection = dmDatabase.scoDados
    Left = 752
    Top = 176
    object qProduto_Consumo_TamID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qProduto_Consumo_TamITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object qProduto_Consumo_TamTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Required = True
      Size = 10
    end
    object qProduto_Consumo_TamQTD_CONSUMO: TFloatField
      FieldName = 'QTD_CONSUMO'
    end
  end
  object sdsTalao_Aux: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM TALAO_AUX'#13#10'WHERE ID = :ID'
    DataSource = dsLote_Mestre
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 128
    Top = 240
    object sdsTalao_AuxID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsTalao_AuxITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsTalao_AuxID_ATELIER: TIntegerField
      FieldName = 'ID_ATELIER'
    end
    object sdsTalao_AuxID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
    end
    object sdsTalao_AuxID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object sdsTalao_AuxID_COMBINACAO: TIntegerField
      FieldName = 'ID_COMBINACAO'
    end
    object sdsTalao_AuxQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsTalao_AuxDTSAIDA: TDateField
      FieldName = 'DTSAIDA'
    end
    object sdsTalao_AuxHRSAIDA: TTimeField
      FieldName = 'HRSAIDA'
    end
    object sdsTalao_AuxDTRETORNO: TDateField
      FieldName = 'DTRETORNO'
    end
    object sdsTalao_AuxHRRETORNO: TTimeField
      FieldName = 'HRRETORNO'
    end
    object sdsTalao_AuxID_ATELIER_ORIG: TIntegerField
      FieldName = 'ID_ATELIER_ORIG'
    end
    object sdsTalao_AuxDTSISTEMA: TDateField
      FieldName = 'DTSISTEMA'
    end
    object sdsTalao_AuxHRSISTEMA: TTimeField
      FieldName = 'HRSISTEMA'
    end
    object sdsTalao_AuxDTPAGAMENTO: TDateField
      FieldName = 'DTPAGAMENTO'
    end
    object sdsTalao_AuxSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      Size = 1
    end
  end
  object cdsTalao_Aux: TClientDataSet
    Aggregates = <>
    DataSetField = cdsLotesdsTalao_Aux
    IndexFieldNames = 'ID;ITEM'
    Params = <>
    BeforePost = cdsTalao_AuxBeforePost
    Left = 184
    Top = 240
    object cdsTalao_AuxID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTalao_AuxITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTalao_AuxID_ATELIER: TIntegerField
      FieldName = 'ID_ATELIER'
    end
    object cdsTalao_AuxID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
    end
    object cdsTalao_AuxID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsTalao_AuxID_COMBINACAO: TIntegerField
      FieldName = 'ID_COMBINACAO'
    end
    object cdsTalao_AuxQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsTalao_AuxDTSAIDA: TDateField
      FieldName = 'DTSAIDA'
    end
    object cdsTalao_AuxHRSAIDA: TTimeField
      FieldName = 'HRSAIDA'
    end
    object cdsTalao_AuxDTRETORNO: TDateField
      FieldName = 'DTRETORNO'
    end
    object cdsTalao_AuxHRRETORNO: TTimeField
      FieldName = 'HRRETORNO'
    end
    object cdsTalao_AuxID_ATELIER_ORIG: TIntegerField
      FieldName = 'ID_ATELIER_ORIG'
    end
    object cdsTalao_AuxsdsTalao_Aux_Tam: TDataSetField
      FieldName = 'sdsTalao_Aux_Tam'
    end
    object cdsTalao_AuxDTSISTEMA: TDateField
      FieldName = 'DTSISTEMA'
    end
    object cdsTalao_AuxHRSISTEMA: TTimeField
      FieldName = 'HRSISTEMA'
    end
    object cdsTalao_AuxDTPAGAMENTO: TDateField
      FieldName = 'DTPAGAMENTO'
    end
    object cdsTalao_AuxSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      Size = 1
    end
  end
  object dsTalao_Aux: TDataSource
    DataSet = cdsTalao_Aux
    Left = 232
    Top = 240
  end
  object dsTalao_Aux_Mestre: TDataSource
    DataSet = sdsTalao_Aux
    Left = 96
    Top = 272
  end
  object sdsTalao_Aux_Tam: TSQLDataSet
    CommandText = 
      'SELECT *'#13#10'FROM TALAO_AUX_TAM'#13#10'WHERE ID = :ID'#13#10'      AND ITEM = :' +
      'ITEM'
    DataSource = dsTalao_Aux_Mestre
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
        Name = 'ITEM'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 136
    Top = 320
    object sdsTalao_Aux_TamID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsTalao_Aux_TamITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsTalao_Aux_TamITEM_TAM: TIntegerField
      FieldName = 'ITEM_TAM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsTalao_Aux_TamTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object sdsTalao_Aux_TamQTD: TFloatField
      FieldName = 'QTD'
    end
  end
  object cdsTalao_Aux_Tam: TClientDataSet
    Aggregates = <>
    DataSetField = cdsTalao_AuxsdsTalao_Aux_Tam
    IndexFieldNames = 'ID;ITEM;ITEM_TAM'
    Params = <>
    Left = 200
    Top = 312
    object cdsTalao_Aux_TamID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTalao_Aux_TamITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTalao_Aux_TamITEM_TAM: TIntegerField
      FieldName = 'ITEM_TAM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTalao_Aux_TamTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object cdsTalao_Aux_TamQTD: TFloatField
      FieldName = 'QTD'
    end
  end
  object dsTalao_Aux_Tam: TDataSource
    DataSet = cdsTalao_Aux_Tam
    Left = 264
    Top = 312
  end
  object qMaterial: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT P.id, P.id_grade, P.NOME, P.ID_FORNECEDOR, FORN.NOME NOME' +
        '_FORNECEDOR, P.PRECO_CUSTO, P.PERC_IPI, P.REFERENCIA, P.ID_NCM, ' +
        'P.TIPO_REG'
      'FROM PRODUTO P'
      'LEFT JOIN PESSOA FORN'
      'ON P.ID_FORNECEDOR = FORN.CODIGO'
      'WHERE P.ID = :ID')
    SQLConnection = dmDatabase.scoDados
    Left = 424
    Top = 312
    object qMaterialID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qMaterialID_GRADE: TIntegerField
      FieldName = 'ID_GRADE'
    end
    object qMaterialNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object qMaterialID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
    end
    object qMaterialNOME_FORNECEDOR: TStringField
      FieldName = 'NOME_FORNECEDOR'
      Size = 60
    end
    object qMaterialPRECO_CUSTO: TFloatField
      FieldName = 'PRECO_CUSTO'
    end
    object qMaterialPERC_IPI: TFloatField
      FieldName = 'PERC_IPI'
    end
    object qMaterialREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object qMaterialID_NCM: TIntegerField
      FieldName = 'ID_NCM'
    end
    object qMaterialTIPO_REG: TStringField
      FieldName = 'TIPO_REG'
      FixedChar = True
      Size = 1
    end
  end
  object sdsLote_Mat: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM LOTE_MAT'#13#10'WHERE NUM_ORDEM = :NUM_ORDEM'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_ORDEM'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 72
    Top = 522
    object sdsLote_MatNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsLote_MatITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsLote_MatID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object sdsLote_MatID_COR: TIntegerField
      FieldName = 'ID_COR'
    end
    object sdsLote_MatCARIMBO: TStringField
      FieldName = 'CARIMBO'
      Size = 25
    end
    object sdsLote_MatTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object sdsLote_MatQTD_CONSUMO: TFloatField
      FieldName = 'QTD_CONSUMO'
    end
    object sdsLote_MatQTD_PRODUTO: TFloatField
      FieldName = 'QTD_PRODUTO'
    end
    object sdsLote_MatCARIMBOAUX: TStringField
      FieldName = 'CARIMBOAUX'
      Size = 25
    end
    object sdsLote_MatID_OC: TIntegerField
      FieldName = 'ID_OC'
    end
    object sdsLote_MatITEM_OC: TIntegerField
      FieldName = 'ITEM_OC'
    end
    object sdsLote_MatNUM_OC: TIntegerField
      FieldName = 'NUM_OC'
    end
    object sdsLote_MatID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
    end
    object sdsLote_MatQTD_OC_FAT: TFloatField
      FieldName = 'QTD_OC_FAT'
    end
    object sdsLote_MatGERADO: TStringField
      FieldName = 'GERADO'
      FixedChar = True
      Size = 1
    end
    object sdsLote_MatTINGIMENTO: TStringField
      FieldName = 'TINGIMENTO'
      FixedChar = True
      Size = 1
    end
    object sdsLote_MatTINGIMENTO_GERADO: TStringField
      FieldName = 'TINGIMENTO_GERADO'
      FixedChar = True
      Size = 1
    end
    object sdsLote_MatTIPO_PRODUCAO: TStringField
      FieldName = 'TIPO_PRODUCAO'
      FixedChar = True
      Size = 1
    end
    object sdsLote_MatNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object sdsLote_MatID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
    end
    object sdsLote_MatDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
  end
  object dspLote_Mat: TDataSetProvider
    DataSet = sdsLote_Mat
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspLoteUpdateError
    Left = 144
    Top = 522
  end
  object cdsLote_Mat: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NUM_ORDEM;ITEM'
    Params = <>
    ProviderName = 'dspLote_Mat'
    OnNewRecord = cdsLote_MatNewRecord
    Left = 191
    Top = 522
    object cdsLote_MatNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLote_MatITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLote_MatID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object cdsLote_MatID_COR: TIntegerField
      FieldName = 'ID_COR'
    end
    object cdsLote_MatCARIMBO: TStringField
      FieldName = 'CARIMBO'
      Size = 25
    end
    object cdsLote_MatTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object cdsLote_MatQTD_CONSUMO: TFloatField
      FieldName = 'QTD_CONSUMO'
    end
    object cdsLote_MatQTD_PRODUTO: TFloatField
      FieldName = 'QTD_PRODUTO'
    end
    object cdsLote_MatCARIMBOAUX: TStringField
      FieldName = 'CARIMBOAUX'
      Size = 25
    end
    object cdsLote_MatID_OC: TIntegerField
      FieldName = 'ID_OC'
    end
    object cdsLote_MatITEM_OC: TIntegerField
      FieldName = 'ITEM_OC'
    end
    object cdsLote_MatNUM_OC: TIntegerField
      FieldName = 'NUM_OC'
    end
    object cdsLote_MatID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
    end
    object cdsLote_MatQTD_OC_FAT: TFloatField
      FieldName = 'QTD_OC_FAT'
    end
    object cdsLote_MatGERADO: TStringField
      FieldName = 'GERADO'
      FixedChar = True
      Size = 1
    end
    object cdsLote_MatTINGIMENTO: TStringField
      FieldName = 'TINGIMENTO'
      FixedChar = True
      Size = 1
    end
    object cdsLote_MatTINGIMENTO_GERADO: TStringField
      FieldName = 'TINGIMENTO_GERADO'
      FixedChar = True
      Size = 1
    end
    object cdsLote_MatTIPO_PRODUCAO: TStringField
      FieldName = 'TIPO_PRODUCAO'
      FixedChar = True
      Size = 1
    end
    object cdsLote_MatNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object cdsLote_MatID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
    end
    object cdsLote_MatDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
  end
  object dsLote_Mat: TDataSource
    DataSet = cdsLote_Mat
    Left = 239
    Top = 522
  end
  object sdsConsumo: TSQLDataSet
    CommandText = 
      'SELECT PC.ID, PC.id_material, PC.qtd_consumo, PC.unidade,'#13#10'P.nom' +
      'e NOME_PRODUTO, P.REFERENCIA, MAT.nome NOME_MATERIAL, MAT.refere' +
      'ncia REFERENCIA_MAT, '#13#10'MAT.TIPO_REG TIPO_REG_MAT, MAT.ID_FORNECE' +
      'DOR, PC.IMP_TALAO, PC.tingimento, PC.id_cor,'#13#10'mat.id_material_cr' +
      'u, p.tipo_producao'#13#10'FROM PRODUTO_COMB PCOMB'#13#10'INNER JOIN PRODUTO_' +
      'COMB_MAT PC'#13#10'ON PCOMB.ID = PC.ID'#13#10'AND PCOMB.ITEM = PC.item'#13#10'INNE' +
      'R JOIN PRODUTO P'#13#10'ON PCOMB.ID = P.ID'#13#10'INNER JOIN PRODUTO MAT'#13#10'ON' +
      ' PC.id_material = MAT.ID'#13#10'WHERE PCOMB.ID = :ID_PRODUTO'#13#10'  and PC' +
      'OMB.id_cor_combinacao = :ID_COMBINACAO'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_COMBINACAO'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 552
    Top = 344
  end
  object dspConsumo: TDataSetProvider
    DataSet = sdsConsumo
    Left = 584
    Top = 344
  end
  object cdsConsumo: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_MATERIAL'
    Params = <>
    ProviderName = 'dspConsumo'
    Left = 616
    Top = 344
    object cdsConsumoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsumoID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object cdsConsumoQTD_CONSUMO: TFloatField
      FieldName = 'QTD_CONSUMO'
    end
    object cdsConsumoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsConsumoNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object cdsConsumoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsConsumoNOME_MATERIAL: TStringField
      FieldName = 'NOME_MATERIAL'
      Size = 100
    end
    object cdsConsumoREFERENCIA_MAT: TStringField
      FieldName = 'REFERENCIA_MAT'
    end
    object cdsConsumoTIPO_REG_MAT: TStringField
      FieldName = 'TIPO_REG_MAT'
      FixedChar = True
      Size = 1
    end
    object cdsConsumoID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
    end
    object cdsConsumoIMP_TALAO: TStringField
      FieldName = 'IMP_TALAO'
      FixedChar = True
      Size = 1
    end
    object cdsConsumoTINGIMENTO: TStringField
      FieldName = 'TINGIMENTO'
      Size = 1
    end
    object cdsConsumoID_COR: TIntegerField
      FieldName = 'ID_COR'
    end
    object cdsConsumoID_MATERIAL_CRU: TIntegerField
      FieldName = 'ID_MATERIAL_CRU'
    end
    object cdsConsumoTIPO_PRODUCAO: TStringField
      FieldName = 'TIPO_PRODUCAO'
      Size = 1
    end
  end
  object qVerificaExclusao2: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_ORDEM'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT COUNT(1) CONTADOR'
      'FROM LOTE_MAT'
      'WHERE NUM_ORDEM = :NUM_ORDEM'
      '  AND ID_OC > 0')
    SQLConnection = dmDatabase.scoDados
    Left = 360
    Top = 88
    object qVerificaExclusao2CONTADOR: TIntegerField
      FieldName = 'CONTADOR'
      Required = True
    end
  end
  object sdsTalao_Processo: TSQLDataSet
    CommandText = 
      'SELECT *'#13#10'FROM TALAO_PROCESSO'#13#10'WHERE ID = :ID'#13#10'  AND NUM_TALAO =' +
      ' :NUM_TALAO'
    DataSource = dsTalao_Mestre
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
        Name = 'NUM_TALAO'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 144
    Top = 184
    object sdsTalao_ProcessoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsTalao_ProcessoNUM_TALAO: TIntegerField
      FieldName = 'NUM_TALAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsTalao_ProcessoITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsTalao_ProcessoID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object sdsTalao_ProcessoDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object sdsTalao_ProcessoHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object sdsTalao_ProcessoDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object sdsTalao_ProcessoHRBAIXA: TTimeField
      FieldName = 'HRBAIXA'
    end
    object sdsTalao_ProcessoQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsTalao_ProcessoQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
    end
  end
  object cdsTalao_Processo: TClientDataSet
    Aggregates = <>
    DataSetField = cdsTalaosdsTalao_Processo
    IndexFieldNames = 'ID;NUM_TALAO;ITEM'
    Params = <>
    Left = 200
    Top = 184
    object cdsTalao_ProcessoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTalao_ProcessoNUM_TALAO: TIntegerField
      FieldName = 'NUM_TALAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTalao_ProcessoITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTalao_ProcessoID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object cdsTalao_ProcessoDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object cdsTalao_ProcessoHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object cdsTalao_ProcessoDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object cdsTalao_ProcessoHRBAIXA: TTimeField
      FieldName = 'HRBAIXA'
    end
    object cdsTalao_ProcessoQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsTalao_ProcessoQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
    end
  end
  object dsTalao_Processo: TDataSource
    DataSet = cdsTalao_Processo
    Left = 256
    Top = 184
  end
  object qParametros_Lote: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT *'
      'FROM PARAMETROS_LOTE')
    SQLConnection = dmDatabase.scoDados
    Left = 808
    Top = 496
    object qParametros_LoteLOTE_POR_PEDIDO: TStringField
      FieldName = 'LOTE_POR_PEDIDO'
      FixedChar = True
      Size = 1
    end
    object qParametros_LoteLOTE_TEXTIL: TStringField
      FieldName = 'LOTE_TEXTIL'
      FixedChar = True
      Size = 1
    end
    object qParametros_LoteID_COR_CRU: TIntegerField
      FieldName = 'ID_COR_CRU'
    end
    object qParametros_LoteTIPO_LOTE: TStringField
      FieldName = 'TIPO_LOTE'
      FixedChar = True
      Size = 1
    end
    object qParametros_LoteUSA_LOTE_PEDIDO: TStringField
      FieldName = 'USA_LOTE_PEDIDO'
      FixedChar = True
      Size = 1
    end
    object qParametros_LoteID_PROCESSO_EST: TIntegerField
      FieldName = 'ID_PROCESSO_EST'
    end
    object qParametros_LoteUSA_LOTE_PED_SPROC: TStringField
      FieldName = 'USA_LOTE_PED_SPROC'
      FixedChar = True
      Size = 1
    end
    object qParametros_LoteID_PROCESSO_SEMI_EST: TIntegerField
      FieldName = 'ID_PROCESSO_SEMI_EST'
    end
    object qParametros_LoteRESERVA_EST_LOTE: TStringField
      FieldName = 'RESERVA_EST_LOTE'
      FixedChar = True
      Size = 1
    end
    object qParametros_LoteGERAR_MAT_POR_LOTE: TStringField
      FieldName = 'GERAR_MAT_POR_LOTE'
      FixedChar = True
      Size = 1
    end
  end
  object sdsPendente_Ped: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT PED.NUM_PEDIDO, PED.PEDIDO_CLIENTE, PED.ID_CLIENTE, PED.D' +
      'TEMISSAO, PED.ID, PED.FILIAL,'#13#10'CLI.nome NOME_CLIENTE, CLI.fantas' +
      'ia, PED.SELECIONADO'#13#10'FROM PEDIDO PED'#13#10'INNER JOIN PESSOA CLI'#13#10'ON ' +
      'PED.ID_CLIENTE = CLI.codigo'#13#10'WHERE PED.TIPO_REG = '#39'P'#39#13#10'  AND PED' +
      '.faturado <> '#39'S'#39#13#10'  AND PED.faturado <> '#39'P'#39#13#10'  AND NOT EXISTS( S' +
      'ELECT 1'#13#10'                     FROM TALAO_PED'#13#10'                  ' +
      '   WHERE TALAO_PED.ID_PEDIDO =  PED.ID)'#13#10'  AND NOT EXISTS ( SELE' +
      'CT 1 FROM LOTE WHERE LOTE.ID_PEDIDO = PED.ID)'#13#10#13#10#13#10#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 457
    Top = 53
    object sdsPendente_PedNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object sdsPendente_PedPEDIDO_CLIENTE: TStringField
      FieldName = 'PEDIDO_CLIENTE'
    end
    object sdsPendente_PedID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object sdsPendente_PedDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object sdsPendente_PedID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsPendente_PedFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object sdsPendente_PedNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object sdsPendente_PedFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 30
    end
    object sdsPendente_PedSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      FixedChar = True
      Size = 1
    end
  end
  object dspPendente_Ped: TDataSetProvider
    DataSet = sdsPendente_Ped
    Left = 512
    Top = 53
  end
  object cdsPendente_Ped: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPendente_Ped'
    Left = 576
    Top = 53
    object cdsPendente_PedNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object cdsPendente_PedPEDIDO_CLIENTE: TStringField
      FieldName = 'PEDIDO_CLIENTE'
    end
    object cdsPendente_PedID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsPendente_PedDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsPendente_PedID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPendente_PedFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsPendente_PedNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object cdsPendente_PedFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Size = 30
    end
    object cdsPendente_PedSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      FixedChar = True
      Size = 1
    end
  end
  object dsPendente_Ped: TDataSource
    DataSet = cdsPendente_Ped
    Left = 624
    Top = 53
  end
  object mMaterial: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_Material'
        DataType = ftInteger
      end
      item
        Name = 'Nome_Material'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Qtd_Consumo'
        DataType = ftFloat
      end
      item
        Name = 'Referencia_Mat'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Unidade'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'ID_Fornecedor'
        DataType = ftInteger
      end
      item
        Name = 'ID_Cor'
        DataType = ftInteger
      end
      item
        Name = 'Qtd_Produto'
        DataType = ftFloat
      end
      item
        Name = 'Tingimento'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ID_Material_Cru'
        DataType = ftInteger
      end
      item
        Name = 'Tipo_Producao'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    BeforePost = mMaterialBeforePost
    Left = 368
    Top = 422
    Data = {
      350100009619E0BD01000000180000000B00000000000300000035010B49445F
      4D6174657269616C04000100000000000D4E6F6D655F4D6174657269616C0100
      490000000100055749445448020002003C000B5174645F436F6E73756D6F0800
      0400000000000E5265666572656E6369615F4D61740100490000000100055749
      44544802000200140007556E6964616465010049000000010005574944544802
      00020006000D49445F466F726E656365646F7204000100000000000649445F43
      6F7204000100000000000B5174645F50726F6475746F08000400000000000A54
      696E67696D656E746F01004900000001000557494454480200020001000F4944
      5F4D6174657269616C5F43727504000100000000000D5469706F5F50726F6475
      63616F01004900000001000557494454480200020001000000}
    object mMaterialID_Material: TIntegerField
      FieldName = 'ID_Material'
    end
    object mMaterialNome_Material: TStringField
      FieldName = 'Nome_Material'
      Size = 60
    end
    object mMaterialQtd_Consumo: TFloatField
      FieldName = 'Qtd_Consumo'
    end
    object mMaterialReferencia_Mat: TStringField
      FieldName = 'Referencia_Mat'
    end
    object mMaterialUnidade: TStringField
      FieldName = 'Unidade'
      Size = 6
    end
    object mMaterialID_Fornecedor: TIntegerField
      FieldName = 'ID_Fornecedor'
    end
    object mMaterialID_Cor: TIntegerField
      FieldName = 'ID_Cor'
    end
    object mMaterialQtd_Produto: TFloatField
      FieldName = 'Qtd_Produto'
    end
    object mMaterialTingimento: TStringField
      FieldName = 'Tingimento'
      Size = 1
    end
    object mMaterialID_Material_Cru: TIntegerField
      FieldName = 'ID_Material_Cru'
    end
    object mMaterialTipo_Producao: TStringField
      FieldName = 'Tipo_Producao'
      Size = 1
    end
  end
  object dsmMaterial: TDataSource
    DataSet = mMaterial
    Left = 408
    Top = 422
  end
  object mMaterial_Tam: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'ID_Material;Tamanho'
    MasterFields = 'ID_Material'
    MasterSource = dsmMaterial
    PacketRecords = 0
    Params = <>
    Left = 368
    Top = 470
    Data = {
      560000009619E0BD01000000180000000300000000000300000056000B49445F
      4D6174657269616C04000100000000000754616D616E686F0100490000000100
      055749445448020002000A000351746408000400000000000000}
    object mMaterial_TamID_Material: TIntegerField
      FieldName = 'ID_Material'
    end
    object mMaterial_TamTamanho: TStringField
      FieldName = 'Tamanho'
      Size = 10
    end
    object mMaterial_TamQtd: TFloatField
      FieldName = 'Qtd'
    end
  end
  object dsmMaterial_Tam: TDataSource
    DataSet = mMaterial_Tam
    Left = 408
    Top = 470
  end
  object qProcesso_Ope: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'TIPO_MAT'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT OPE.id_processo, OPE.tipo_mat, P.nome, P.tipo TIPO_PROCES' +
        'SO'
      'FROM PROCESSO_OPE OPE'
      'INNER JOIN PROCESSO P'
      'ON OPE.id_processo = P.ID'
      'WHERE OPE.TIPO_MAT = :TIPO_MAT')
    SQLConnection = dmDatabase.scoDados
    Left = 976
    Top = 432
    object qProcesso_OpeID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object qProcesso_OpeTIPO_MAT: TStringField
      FieldName = 'TIPO_MAT'
      FixedChar = True
      Size = 1
    end
    object qProcesso_OpeNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object qProcesso_OpeTIPO_PROCESSO: TStringField
      FieldName = 'TIPO_PROCESSO'
      FixedChar = True
      Size = 1
    end
  end
  object sdsLote_Ped: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM LOTE_PED'#13#10'WHERE ID = :ID'
    DataSource = dsLote_Mestre
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 96
    Top = 368
    object sdsLote_PedID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsLote_PedID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsLote_PedITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsLote_PedQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsLote_PedID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object sdsLote_PedNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object sdsLote_PedBAIXADO: TStringField
      FieldName = 'BAIXADO'
      FixedChar = True
      Size = 1
    end
    object sdsLote_PedNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object sdsLote_PedPEDIDO_CLIENTE: TStringField
      FieldName = 'PEDIDO_CLIENTE'
    end
    object sdsLote_PedQTD_PARES: TFloatField
      FieldName = 'QTD_PARES'
    end
  end
  object cdsLote_Ped: TClientDataSet
    Aggregates = <>
    DataSetField = cdsLotesdsLote_Ped
    IndexFieldNames = 'ID;ID_PEDIDO;ITEM_PEDIDO'
    Params = <>
    Left = 168
    Top = 368
    object cdsLote_PedID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLote_PedID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLote_PedITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLote_PedQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsLote_PedID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsLote_PedNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object cdsLote_PedBAIXADO: TStringField
      FieldName = 'BAIXADO'
      FixedChar = True
      Size = 1
    end
    object cdsLote_PedNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object cdsLote_PedPEDIDO_CLIENTE: TStringField
      FieldName = 'PEDIDO_CLIENTE'
    end
    object cdsLote_PedQTD_PARES: TFloatField
      FieldName = 'QTD_PARES'
    end
  end
  object dsLote_Ped: TDataSource
    DataSet = cdsLote_Ped
    Left = 232
    Top = 368
  end
  object sdsConsulta_Lote_SL: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT L.dtemissao, L.num_lote, L.filial, L.hremissao, L.DTENTRE' +
      'GA,'#13#10'L.qtd_taloes, L.NUM_ORDEM, L.CARIMBO, L.TALAO_AUX_GERADO,'#13#10 +
      'L.id, L.id_produto, L.qtd, L.qtd_pendente, L.qtd_produzido,'#13#10'L.d' +
      'tbaixa, L.hrbaixa, L.impresso, L.id_combinacao, L.dtentrada,'#13#10'L.' +
      'hrentrada, L.REFERENCIA, PRO.NOME NOME_PRODUTO,'#13#10'L.UNIDADE, FIL.' +
      'NOME NOME_FILIAL,'#13#10'COMB.nome NOME_COMBINACAO, L.NOME NOME_LOTE, ' +
      'L.TIPO_LOTE,'#13#10'L.obs_ped, CLI.nome NOME_CLIENTE, PRO.id_cor ID_CO' +
      'R_PROD,'#13#10'L.unidade UNIDADE_TALAO, L.qtd_original,'#13#10'CASE'#13#10'  WHEN ' +
      'L.TIPO_LOTE = '#39'S'#39' THEN '#39'Semi Acabado'#39#13#10'  WHEN L.TIPO_LOTE = '#39'L'#39' ' +
      'THEN '#39'Produto'#39#13#10'  WHEN L.TIPO_LOTE = '#39'E'#39' THEN '#39'Estoque'#39#13#10'  end D' +
      'ESCRICAO_TIPO'#13#10'FROM LOTE L'#13#10'INNER JOIN FILIAL FIL'#13#10'ON L.FILIAL =' +
      ' FIL.ID'#13#10'LEFT JOIN PRODUTO PRO'#13#10'ON L.ID_PRODUTO = PRO.ID'#13#10'LEFT J' +
      'OIN combinacao COMB'#13#10'ON L.id_combinacao = COMB.id'#13#10'LEFT JOIN PES' +
      'SOA CLI'#13#10'ON L.id_cliente = CLI.codigo'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 928
    Top = 256
  end
  object dspConsulta_Lote_SL: TDataSetProvider
    DataSet = sdsConsulta_Lote_SL
    Left = 984
    Top = 256
  end
  object cdsConsulta_Lote_SL: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta_Lote_SL'
    Left = 1040
    Top = 256
    object cdsConsulta_Lote_SLDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsConsulta_Lote_SLNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object cdsConsulta_Lote_SLFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsConsulta_Lote_SLHREMISSAO: TTimeField
      FieldName = 'HREMISSAO'
    end
    object cdsConsulta_Lote_SLDTENTREGA: TDateField
      FieldName = 'DTENTREGA'
    end
    object cdsConsulta_Lote_SLQTD_TALOES: TIntegerField
      FieldName = 'QTD_TALOES'
    end
    object cdsConsulta_Lote_SLNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsConsulta_Lote_SLCARIMBO: TStringField
      FieldName = 'CARIMBO'
      Size = 25
    end
    object cdsConsulta_Lote_SLTALAO_AUX_GERADO: TStringField
      FieldName = 'TALAO_AUX_GERADO'
      FixedChar = True
      Size = 1
    end
    object cdsConsulta_Lote_SLID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsulta_Lote_SLID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsConsulta_Lote_SLQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsConsulta_Lote_SLQTD_PENDENTE: TFloatField
      FieldName = 'QTD_PENDENTE'
    end
    object cdsConsulta_Lote_SLQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
    end
    object cdsConsulta_Lote_SLDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object cdsConsulta_Lote_SLHRBAIXA: TTimeField
      FieldName = 'HRBAIXA'
    end
    object cdsConsulta_Lote_SLIMPRESSO: TStringField
      FieldName = 'IMPRESSO'
      Size = 1
    end
    object cdsConsulta_Lote_SLID_COMBINACAO: TIntegerField
      FieldName = 'ID_COMBINACAO'
    end
    object cdsConsulta_Lote_SLDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object cdsConsulta_Lote_SLHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object cdsConsulta_Lote_SLREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsConsulta_Lote_SLNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object cdsConsulta_Lote_SLUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsConsulta_Lote_SLNOME_FILIAL: TStringField
      FieldName = 'NOME_FILIAL'
      Size = 60
    end
    object cdsConsulta_Lote_SLNOME_COMBINACAO: TStringField
      FieldName = 'NOME_COMBINACAO'
      Size = 60
    end
    object cdsConsulta_Lote_SLNOME_LOTE: TStringField
      FieldName = 'NOME_LOTE'
      Size = 30
    end
    object cdsConsulta_Lote_SLTIPO_LOTE: TStringField
      FieldName = 'TIPO_LOTE'
      FixedChar = True
      Size = 1
    end
    object cdsConsulta_Lote_SLOBS_PED: TStringField
      FieldName = 'OBS_PED'
      Size = 100
    end
    object cdsConsulta_Lote_SLNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object cdsConsulta_Lote_SLID_COR_PROD: TIntegerField
      FieldName = 'ID_COR_PROD'
    end
    object cdsConsulta_Lote_SLUNIDADE_TALAO: TStringField
      FieldName = 'UNIDADE_TALAO'
      Size = 6
    end
    object cdsConsulta_Lote_SLDESCRICAO_TIPO: TStringField
      FieldName = 'DESCRICAO_TIPO'
      FixedChar = True
      Size = 12
    end
    object cdsConsulta_Lote_SLQTD_ORIGINAL: TFloatField
      FieldName = 'QTD_ORIGINAL'
    end
  end
  object dsConsulta_Lote_SL: TDataSource
    DataSet = cdsConsulta_Lote_SL
    Left = 1096
    Top = 256
  end
  object qProcesso_Grupo_Item: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT PG.*, P.TIPO, P.ENCERADO'
      'FROM PROCESSO_GRUPO_ITENS PG'
      'INNER JOIN PROCESSO P'
      'ON PG.id_processo = P.ID'
      'WHERE PG.ID = :ID'
      'ORDER BY PG.item')
    SQLConnection = dmDatabase.scoDados
    Left = 1128
    Top = 456
    object qProcesso_Grupo_ItemID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qProcesso_Grupo_ItemITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object qProcesso_Grupo_ItemID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object qProcesso_Grupo_ItemTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object qProcesso_Grupo_ItemENCERADO: TStringField
      FieldName = 'ENCERADO'
      FixedChar = True
      Size = 1
    end
  end
  object sdsConsulta_Processo_SL: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT L.*, P.NOME NOME_PROCESSO'#13#10'FROM LOTE_PROCESSO L'#13#10'INNER JO' +
      'IN PROCESSO P'#13#10'ON L.id_processo = P.ID'#13#10'WHERE L.ID = :ID'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 928
    Top = 208
  end
  object dspConsulta_Processo_SL: TDataSetProvider
    DataSet = sdsConsulta_Processo_SL
    Left = 984
    Top = 208
  end
  object cdsConsulta_Processo_SL: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta_Processo_SL'
    Left = 1040
    Top = 208
    object cdsConsulta_Processo_SLID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsulta_Processo_SLITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsConsulta_Processo_SLID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object cdsConsulta_Processo_SLDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object cdsConsulta_Processo_SLHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object cdsConsulta_Processo_SLDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object cdsConsulta_Processo_SLHRBAIXA: TTimeField
      FieldName = 'HRBAIXA'
    end
    object cdsConsulta_Processo_SLQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsConsulta_Processo_SLQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
    end
    object cdsConsulta_Processo_SLNOME_PROCESSO: TStringField
      FieldName = 'NOME_PROCESSO'
      Size = 30
    end
  end
  object dsConsulta_Processo_SL: TDataSource
    DataSet = cdsConsulta_Processo_SL
    Left = 1096
    Top = 208
  end
  object sdsBaixa_Processo: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM BAIXA_PROCESSO'#13#10'WHERE NUM_ORDEM = :NUM_ORDEM'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_ORDEM'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 72
    Top = 578
    object sdsBaixa_ProcessoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsBaixa_ProcessoITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsBaixa_ProcessoID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object sdsBaixa_ProcessoID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
    end
    object sdsBaixa_ProcessoID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object sdsBaixa_ProcessoITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object sdsBaixa_ProcessoDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object sdsBaixa_ProcessoHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object sdsBaixa_ProcessoDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object sdsBaixa_ProcessoHRBAIXA: TTimeField
      FieldName = 'HRBAIXA'
    end
    object sdsBaixa_ProcessoQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsBaixa_ProcessoQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
    end
    object sdsBaixa_ProcessoNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object sdsBaixa_ProcessoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object sdsBaixa_ProcessoQTD_PENDENTE: TFloatField
      FieldName = 'QTD_PENDENTE'
    end
    object sdsBaixa_ProcessoPARCIAL: TStringField
      FieldName = 'PARCIAL'
      Size = 1
    end
    object sdsBaixa_ProcessoQTD_LIBERADA: TFloatField
      FieldName = 'QTD_LIBERADA'
    end
    object sdsBaixa_ProcessoAJUSTE: TStringField
      FieldName = 'AJUSTE'
      Size = 1
    end
    object sdsBaixa_ProcessoRETRABALHO: TStringField
      FieldName = 'RETRABALHO'
      Size = 1
    end
  end
  object dspBaixa_Processo: TDataSetProvider
    DataSet = sdsBaixa_Processo
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspLoteUpdateError
    Left = 144
    Top = 578
  end
  object cdsBaixa_Processo: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID;ITEM'
    Params = <>
    ProviderName = 'dspBaixa_Processo'
    OnNewRecord = cdsBaixa_ProcessoNewRecord
    Left = 191
    Top = 578
    object cdsBaixa_ProcessoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsBaixa_ProcessoITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsBaixa_ProcessoID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object cdsBaixa_ProcessoID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
    end
    object cdsBaixa_ProcessoID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object cdsBaixa_ProcessoITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object cdsBaixa_ProcessoDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object cdsBaixa_ProcessoHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object cdsBaixa_ProcessoDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object cdsBaixa_ProcessoHRBAIXA: TTimeField
      FieldName = 'HRBAIXA'
    end
    object cdsBaixa_ProcessoQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsBaixa_ProcessoQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
    end
    object cdsBaixa_ProcessoNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsBaixa_ProcessoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object cdsBaixa_ProcessoQTD_PENDENTE: TFloatField
      FieldName = 'QTD_PENDENTE'
    end
    object cdsBaixa_ProcessoPARCIAL: TStringField
      FieldName = 'PARCIAL'
      Size = 1
    end
    object cdsBaixa_ProcessoQTD_LIBERADA: TFloatField
      FieldName = 'QTD_LIBERADA'
    end
    object cdsBaixa_ProcessoAJUSTE: TStringField
      FieldName = 'AJUSTE'
      Size = 1
    end
    object cdsBaixa_ProcessoRETRABALHO: TStringField
      FieldName = 'RETRABALHO'
      Size = 1
    end
  end
  object dsBaixa_Processo: TDataSource
    DataSet = cdsBaixa_Processo
    Left = 239
    Top = 578
  end
  object qVerificaGrupo_Proc: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT IT.id, P.tipo, P.nome'
      'FROM processo_grupo_itens IT'
      'INNER JOIN PROCESSO P'
      'ON IT.id_processo = P.ID'
      'WHERE P.tipo = '#39'T'#39
      '  AND IT.id = :ID')
    SQLConnection = dmDatabase.scoDados
    Left = 816
    Top = 440
    object qVerificaGrupo_ProcID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qVerificaGrupo_ProcTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object qVerificaGrupo_ProcNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
  end
  object qProdQtd: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT P.qtd_estoque_min, PCP.QTD_TALAO'
      'FROM PRODUTO P'
      'LEFT JOIN PRODUTO_PCP PCP'
      'ON P.ID = PCP.ID'
      'WHERE P.ID = :ID')
    SQLConnection = dmDatabase.scoDados
    Left = 776
    Top = 336
    object qProdQtdQTD_TALAO: TIntegerField
      FieldName = 'QTD_TALAO'
    end
    object qProdQtdQTD_ESTOQUE_MIN: TFloatField
      FieldName = 'QTD_ESTOQUE_MIN'
    end
  end
  object sdsEstoque_Semi: TSQLDataSet
    CommandText = 
      'WITH RECURSIVE'#13#10'    pedidos as ('#13#10'        SELECT PED.id,'#13#10'      ' +
      '         PI.id_produto,'#13#10'               comb.id id_cor,'#13#10'       ' +
      '        COALESCE(COMB.NOME, '#39'CRU'#39') NOME_COMBINACAO,'#13#10'           ' +
      '    PI.QTD qtd_pedido,'#13#10'               PI.referencia,'#13#10'         ' +
      '      pi.unidade,'#13#10'               prod.tipo_reg,'#13#10'              ' +
      ' prod.nome'#13#10'          FROM PEDIDO PED'#13#10'         INNER JOIN PEDID' +
      'O_ITEM PI ON PED.ID = PI.ID'#13#10'          LEFT JOIN PRODUTO PROD ON' +
      ' PI.id_produto = PROD.ID'#13#10'          LEFT JOIN COMBINACAO COMB ON' +
      ' (PI.ID_COR = COMB.ID)'#13#10'         WHERE PED.TIPO_REG = '#39'P'#39#13#10'     ' +
      '     AND PI.GERAR_LOTE = '#39'S'#39#13#10'          AND NOT EXISTS( SELECT 1' +
      ' FROM LOTE_PED'#13#10'                          WHERE LOTE_PED.ID_PEDI' +
      'DO =  PI.ID'#13#10'                            AND LOTE_PED.ITEM_PEDID' +
      'O = PI.ITEM)'#13#10'          AND PI.QTD_RESTANTE > 0'#13#10'    ),'#13#10'    pro' +
      'dutos as ('#13#10'        SELECT cons.id,'#13#10'               ped.tipo_reg' +
      ' tipo_reg_pedido,'#13#10'               ped.qtd_pedido,'#13#10'             ' +
      '  cons.id_material,'#13#10'               cons.qtd_consumo qtd_consumo' +
      ','#13#10'               ped.qtd_pedido tot_pai,'#13#10'               round(' +
      'cons.qtd_consumo * ped.qtd_pedido, 4) tot_consumo,'#13#10'            ' +
      '   cons.id_cor,'#13#10'               comb.nome nome_combinacao,'#13#10'    ' +
      '           prod.tipo_reg,'#13#10'               --cons.tingimento,'#13#10'  ' +
      '             cons.unidade,'#13#10'               prod.referencia,'#13#10'   ' +
      '            prod.nome'#13#10'          FROM pedidos ped'#13#10'          JOI' +
      'N (SELECT MAT.*, comb.id_cor_combinacao'#13#10'                  FROM ' +
      'PRODUTO_COMB_MAT MAT'#13#10'                  INNER JOIN PRODUTO_COMB ' +
      'COMB  ON MAT.ID = COMB.ID'#13#10'                                     ' +
      '          AND MAT.ITEM = COMB.ITEM) cons ON ped.id_produto = con' +
      's.id'#13#10'                                                          ' +
      '                   and ped.id_cor = cons.id_cor_combinacao'#13#10#13#10'  ' +
      '        JOIN produto prod ON prod.id = cons.id'#13#10'          JOIN c' +
      'ombinacao comb on comb.id = cons.id_cor'#13#10#13#10'        UNION ALL'#13#10#13#10 +
      '        SELECT pai.id_material id,'#13#10'               pai.tipo_reg_' +
      'pedido,'#13#10'               pai.qtd_pedido,'#13#10'               filho.id' +
      '_material,'#13#10'               filho.qtd_consumo qtd_consumo,'#13#10'     ' +
      '          pai.tot_consumo tot_pai,'#13#10'               round(filho.q' +
      'td_consumo * pai.tot_consumo, 4) tot_consumo,'#13#10'               fi' +
      'lho.id_cor,'#13#10'               comb.nome nome_combinacao,'#13#10'        ' +
      '       prod.tipo_reg,'#13#10'               prod.unidade,'#13#10'           ' +
      '    prod.referencia,'#13#10'               prod.nome'#13#10'          FROM (' +
      'SELECT MAT.*, comb.id_cor_combinacao'#13#10'                  FROM PRO' +
      'DUTO_COMB_MAT MAT'#13#10'                  INNER JOIN PRODUTO_COMB COM' +
      'B  ON MAT.ID = COMB.ID'#13#10'                                        ' +
      '       AND MAT.ITEM = COMB.ITEM) filho'#13#10'          JOIN produtos ' +
      'pai ON pai.ID_Material = filho.ID and pai.id_cor = filho.id_cor_' +
      'combinacao'#13#10'          JOIN produto prod ON prod.id = filho.id_ma' +
      'terial'#13#10'          JOIN combinacao comb on comb.id = filho.id_cor' +
      #13#10'         WHERE (prod.tipo_reg = '#39'S'#39' OR filho.tingimento = '#39'S'#39')' +
      #13#10'    ),'#13#10'    produtos_1 as ('#13#10'        SELECT prods.id,'#13#10'       ' +
      '        tipo_reg_pedido,'#13#10'               prods.qtd_pedido qtd_pe' +
      'dido,'#13#10'               prods.id_material,'#13#10'               prods.q' +
      'td_consumo qtd_consumo,'#13#10'               prods.tot_pai tot_pai,'#13#10 +
      '               prods.tot_consumo tot_consumo,'#13#10'               pr' +
      'ods.id_cor,'#13#10'               prods.nome_combinacao,'#13#10'            ' +
      '   prods.tipo_reg,'#13#10'               prods.unidade,'#13#10'             ' +
      '  prods.referencia,'#13#10'               prods.nome'#13#10'          FROM p' +
      'rodutos prods'#13#10#13#10'        UNION ALL'#13#10#13#10'        SELECT ped.id_prod' +
      'uto,'#13#10'               ped.tipo_reg tipo_reg_pedido,'#13#10'            ' +
      '   ped.qtd_pedido,'#13#10'               ped.id_produto id_material,'#13#10 +
      '               1 qtd_consumo,'#13#10'               ped.qtd_pedido tot' +
      '_pai,'#13#10'               ped.qtd_pedido tot_consumo,'#13#10'             ' +
      '  ped.id_cor,'#13#10'               ped.nome_combinacao,'#13#10'            ' +
      '   NULL tipo_reg,'#13#10'               ped.unidade,'#13#10'               p' +
      'ed.referencia,'#13#10'               ped.nome'#13#10'          FROM pedidos ' +
      'ped'#13#10'         WHERE ped.tipo_reg = '#39'S'#39#13#10'    ),'#13#10'    produtos_2 a' +
      's ('#13#10'        SELECT prods.id,'#13#10'               tipo_reg_pedido,'#13#10 +
      '               prods.qtd_pedido qtd_pedido,'#13#10'               prod' +
      's.id_material,'#13#10'               prods.qtd_consumo qtd_consumo,'#13#10' ' +
      '              prods.tot_pai tot_pai,'#13#10'               prods.tot_c' +
      'onsumo tot_consumo,'#13#10'               prods.id_cor,'#13#10'             ' +
      '  prods.nome_combinacao,'#13#10'               prods.tipo_reg,'#13#10'      ' +
      '         prods.unidade,'#13#10'               prods.referencia,'#13#10'     ' +
      '          prods.nome'#13#10'          FROM produtos_1 prods'#13#10#13#10'       ' +
      '   UNION ALL'#13#10#13#10'        SELECT prods.id,'#13#10'               tipo_re' +
      'g_pedido,'#13#10'               prods.qtd_pedido qtd_pedido,'#13#10'        ' +
      '       prods.id_material,'#13#10'               prods.qtd_consumo qtd_' +
      'consumo,'#13#10'               prods.tot_pai tot_pai,'#13#10'               ' +
      'prods.tot_consumo tot_consumo,'#13#10'               0 id_cor,'#13#10'      ' +
      '         '#39'CRU'#39' nome_combinacao,'#13#10'               prods.tipo_reg,'#13 +
      #10'               prods.unidade,'#13#10'               prods.referencia,' +
      #13#10'               prods.nome'#13#10'          FROM produtos_1 prods'#13#10'  ' +
      '       WHERE prods.id_cor > 0'#13#10'    ),'#13#10'    produtos_calc as ('#13#10' ' +
      '       SELECT prods.id_material,'#13#10'               prods.id_cor,'#13#10 +
      '               prods.nome_combinacao,'#13#10'               SUM(prods.' +
      'tot_consumo) tot_consumo,'#13#10'               prods.unidade,'#13#10'      ' +
      '         prods.referencia,'#13#10'               prods.nome'#13#10'         ' +
      ' FROM produtos_2 prods'#13#10'         GROUP BY prods.id_material,'#13#10'  ' +
      '                prods.id_cor,'#13#10'                  prods.nome_comb' +
      'inacao,'#13#10'                  prods.unidade,'#13#10'                  pro' +
      'ds.referencia,'#13#10'                  prods.nome)'#13#10'SELECT prods.*, m' +
      'at2.nome nome_material, mat2.referencia ref_material,'#13#10'       co' +
      'alesce(est.qtd, 0) estoque_atual'#13#10'  FROM produtos_calc prods'#13#10'  ' +
      'LEFT JOIN estoque_atual est ON est.id_produto = prods.id_materia' +
      'l AND'#13#10'                                 est.id_cor = prods.id_co' +
      'r'#13#10'  left join produto mat2 on prods.id_material = mat2.id'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 936
    Top = 112
  end
  object dspEstoque_Semi: TDataSetProvider
    DataSet = sdsEstoque_Semi
    Left = 976
    Top = 112
  end
  object cdsEstoque_Semi: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'REFERENCIA;ID_COR'
    Params = <>
    ProviderName = 'dspEstoque_Semi'
    Left = 1032
    Top = 112
    object cdsEstoque_SemiID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object cdsEstoque_SemiID_COR: TFMTBCDField
      FieldName = 'ID_COR'
      Precision = 15
      Size = 0
    end
    object cdsEstoque_SemiNOME_COMBINACAO: TStringField
      FieldName = 'NOME_COMBINACAO'
      Size = 60
    end
    object cdsEstoque_SemiTOT_CONSUMO: TFloatField
      FieldName = 'TOT_CONSUMO'
      DisplayFormat = '0.000##'
    end
    object cdsEstoque_SemiUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsEstoque_SemiREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsEstoque_SemiESTOQUE_ATUAL: TFMTBCDField
      FieldName = 'ESTOQUE_ATUAL'
      DisplayFormat = '0.000##'
      Precision = 15
      Size = 6
    end
    object cdsEstoque_SemiNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsEstoque_SemiNOME_MATERIAL: TStringField
      FieldName = 'NOME_MATERIAL'
      Size = 100
    end
    object cdsEstoque_SemiREF_MATERIAL: TStringField
      FieldName = 'REF_MATERIAL'
    end
  end
  object dsEstoque_Semi: TDataSource
    DataSet = cdsEstoque_Semi
    Left = 1088
    Top = 112
  end
  object mAuxLote: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_Produto'
        DataType = ftInteger
      end
      item
        Name = 'Referencia'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DtEntrega'
        DataType = ftDate
      end
      item
        Name = 'Qtd'
        DataType = ftFloat
      end
      item
        Name = 'ID_Combinacao'
        DataType = ftInteger
      end
      item
        Name = 'Tipo_Lote'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Unidade'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Obs_Pedido'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'Qtd_Original'
        DataType = ftFloat
      end
      item
        Name = 'Qtd_Pares'
        DataType = ftFloat
      end
      item
        Name = 'ID_Processo_Grupo'
        DataType = ftInteger
      end
      item
        Name = 'Num_Pedido'
        DataType = ftInteger
      end
      item
        Name = 'ID_Cliente'
        DataType = ftInteger
      end
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'Nome_Cliente'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Nome_Combinacao'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Total_Talao'
        DataType = ftInteger
      end
      item
        Name = 'Qtd_Por_Talao'
        DataType = ftFloat
      end
      item
        Name = 'ID_PRODUTO_PRI'
        DataType = ftInteger
      end
      item
        Name = 'Tipo_Reg_Prod'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Tipo_Mat'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Encerado'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Tipo_Geracao'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Qtd_Estoque'
        DataType = ftFloat
      end
      item
        Name = 'Usa_Estoque'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Qtd_Estoque_Usa'
        DataType = ftFloat
      end
      item
        Name = 'Num_Lote_Controle'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Possui_Lote_Controle'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Qtd_Minimo'
        DataType = ftFloat
      end
      item
        Name = 'Metros_Carga'
        DataType = ftFloat
      end
      item
        Name = 'Carga'
        DataType = ftFloat
      end
      item
        Name = 'Tipo_Algodao'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'ID'
    Params = <>
    StoreDefs = True
    OnNewRecord = mAuxLoteNewRecord
    Left = 752
    Top = 565
    Data = {
      560300009619E0BD01000000180000002000000000000300000056030A49445F
      50726F6475746F04000100000000000A5265666572656E636961010049000000
      0100055749445448020002001400094474456E74726567610400060000000000
      0351746408000400000000000D49445F436F6D62696E6163616F040001000000
      0000095469706F5F4C6F74650100490000000100055749445448020002000100
      07556E696461646501004900000001000557494454480200020006000A4F6273
      5F50656469646F010049000000010005574944544802000200FA000C5174645F
      4F726967696E616C0800040000000000095174645F5061726573080004000000
      00001149445F50726F636573736F5F477275706F04000100000000000A4E756D
      5F50656469646F04000100000000000A49445F436C69656E7465040001000000
      000002494404000100000000000C4E6F6D655F436C69656E7465010049000000
      0100055749445448020002003C000F4E6F6D655F436F6D62696E6163616F0100
      490000000100055749445448020002003C000B546F74616C5F54616C616F0400
      0100000000000D5174645F506F725F54616C616F08000400000000000E49445F
      50524F4455544F5F50524904000100000000000D5469706F5F5265675F50726F
      640100490000000100055749445448020002000100085469706F5F4D61740100
      49000000010005574944544802000200010008456E63657261646F0100490000
      0001000557494454480200020001000C5469706F5F4765726163616F01004900
      000001000557494454480200020001000B5174645F4573746F71756508000400
      000000000B5573615F4573746F71756501004900000001000557494454480200
      020001000F5174645F4573746F7175655F5573610800040000000000114E756D
      5F4C6F74655F436F6E74726F6C65010049000000010005574944544802000200
      140014506F737375695F4C6F74655F436F6E74726F6C65010049000000010005
      57494454480200020001000A5174645F4D696E696D6F08000400000000000C4D
      6574726F735F4361726761080004000000000005436172676108000400000000
      000C5469706F5F416C676F64616F010049000000010005574944544802000200
      010001000D44454641554C545F4F524445520200820000000000}
    object mAuxLoteID_Produto: TIntegerField
      FieldName = 'ID_Produto'
    end
    object mAuxLoteReferencia: TStringField
      FieldName = 'Referencia'
    end
    object mAuxLoteDtEntrega: TDateField
      FieldName = 'DtEntrega'
    end
    object mAuxLoteQtd: TFloatField
      FieldName = 'Qtd'
    end
    object mAuxLoteID_Combinacao: TIntegerField
      FieldName = 'ID_Combinacao'
    end
    object mAuxLoteTipo_Lote: TStringField
      FieldName = 'Tipo_Lote'
      Size = 1
    end
    object mAuxLoteUnidade: TStringField
      FieldName = 'Unidade'
      Size = 6
    end
    object mAuxLoteObs_Pedido: TStringField
      FieldName = 'Obs_Pedido'
      Size = 250
    end
    object mAuxLoteQtd_Original: TFloatField
      FieldName = 'Qtd_Original'
    end
    object mAuxLoteQtd_Pares: TFloatField
      FieldName = 'Qtd_Pares'
    end
    object mAuxLoteID_Processo_Grupo: TIntegerField
      FieldName = 'ID_Processo_Grupo'
    end
    object mAuxLoteNum_Pedido: TIntegerField
      FieldName = 'Num_Pedido'
    end
    object mAuxLoteID_Cliente: TIntegerField
      FieldName = 'ID_Cliente'
    end
    object mAuxLoteID: TIntegerField
      FieldName = 'ID'
    end
    object mAuxLoteNome_Cliente: TStringField
      FieldName = 'Nome_Cliente'
      Size = 60
    end
    object mAuxLoteNome_Combinacao: TStringField
      FieldName = 'Nome_Combinacao'
      Size = 60
    end
    object mAuxLoteTotal_Talao: TIntegerField
      FieldName = 'Total_Talao'
    end
    object mAuxLoteQtd_Por_Talao: TFloatField
      FieldName = 'Qtd_Por_Talao'
    end
    object mAuxLoteID_PRODUTO_PRI: TIntegerField
      FieldName = 'ID_PRODUTO_PRI'
    end
    object mAuxLoteTipo_Reg_Prod: TStringField
      FieldName = 'Tipo_Reg_Prod'
      Size = 1
    end
    object mAuxLoteTipo_Mat: TStringField
      FieldName = 'Tipo_Mat'
      Size = 1
    end
    object mAuxLoteEncerado: TStringField
      FieldName = 'Encerado'
      Size = 1
    end
    object mAuxLoteTipo_Geracao: TStringField
      FieldName = 'Tipo_Geracao'
      Size = 1
    end
    object mAuxLoteQtd_Estoque: TFloatField
      FieldName = 'Qtd_Estoque'
    end
    object mAuxLoteUsa_Estoque: TStringField
      FieldName = 'Usa_Estoque'
      Size = 1
    end
    object mAuxLoteQtd_Estoque_Usa: TFloatField
      FieldName = 'Qtd_Estoque_Usa'
    end
    object mAuxLoteNum_Lote_Controle: TStringField
      FieldName = 'Num_Lote_Controle'
    end
    object mAuxLotePossui_Lote_Controle: TStringField
      FieldName = 'Possui_Lote_Controle'
      Size = 1
    end
    object mAuxLoteQtd_Minimo: TFloatField
      FieldName = 'Qtd_Minimo'
    end
    object mAuxLoteMetros_Carga: TFloatField
      FieldName = 'Metros_Carga'
    end
    object mAuxLoteCarga: TFloatField
      FieldName = 'Carga'
    end
    object mAuxLoteTipo_Algodao: TStringField
      FieldName = 'Tipo_Algodao'
      Size = 1
    end
  end
  object dsmAuxLote: TDataSource
    DataSet = mAuxLote
    Left = 792
    Top = 568
  end
  object mAuxLote_Ped: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_Pedido'
        DataType = ftInteger
      end
      item
        Name = 'Qtd'
        DataType = ftFloat
      end
      item
        Name = 'ID_Cliente'
        DataType = ftInteger
      end
      item
        Name = 'Num_Pedido'
        DataType = ftInteger
      end
      item
        Name = 'Pedido_Cliente'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Qtd_Pares'
        DataType = ftFloat
      end
      item
        Name = 'Item_Pedido'
        DataType = ftInteger
      end
      item
        Name = 'ID_Produto'
        DataType = ftInteger
      end
      item
        Name = 'Encerado'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    IndexFieldNames = 'ID'
    MasterFields = 'ID'
    MasterSource = dsmAuxLote
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 752
    Top = 608
    Data = {
      E20000009619E0BD01000000180000000A000000000003000000E20002494404
      000100000000000949445F50656469646F040001000000000003517464080004
      00000000000A49445F436C69656E746504000100000000000A4E756D5F506564
      69646F04000100000000000E50656469646F5F436C69656E7465010049000000
      0100055749445448020002001400095174645F50617265730800040000000000
      0B4974656D5F50656469646F04000100000000000A49445F50726F6475746F04
      0001000000000008456E63657261646F01004900000001000557494454480200
      020001000000}
    object mAuxLote_PedID: TIntegerField
      FieldName = 'ID'
    end
    object mAuxLote_PedID_Pedido: TIntegerField
      FieldName = 'ID_Pedido'
    end
    object mAuxLote_PedQtd: TFloatField
      FieldName = 'Qtd'
    end
    object mAuxLote_PedID_Cliente: TIntegerField
      FieldName = 'ID_Cliente'
    end
    object mAuxLote_PedNum_Pedido: TIntegerField
      FieldName = 'Num_Pedido'
    end
    object mAuxLote_PedPedido_Cliente: TStringField
      FieldName = 'Pedido_Cliente'
    end
    object mAuxLote_PedQtd_Pares: TFloatField
      FieldName = 'Qtd_Pares'
    end
    object mAuxLote_PedItem_Pedido: TIntegerField
      FieldName = 'Item_Pedido'
    end
    object mAuxLote_PedID_Produto: TIntegerField
      FieldName = 'ID_Produto'
    end
    object mAuxLote_PedEncerado: TStringField
      FieldName = 'Encerado'
      Size = 1
    end
  end
  object dsmAuxLote_Ped: TDataSource
    DataSet = mAuxLote_Ped
    Left = 800
    Top = 608
  end
  object mAuxLote_Talao: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'ID;Item'
    MasterFields = 'ID'
    MasterSource = dsmAuxLote
    PacketRecords = 0
    Params = <>
    Left = 888
    Top = 528
    Data = {
      3E0000009619E0BD0100000018000000030000000000030000003E0002494404
      00010000000000044974656D0400010000000000035174640800040000000000
      0000}
    object mAuxLote_TalaoID: TIntegerField
      FieldName = 'ID'
    end
    object mAuxLote_TalaoItem: TIntegerField
      FieldName = 'Item'
    end
    object mAuxLote_TalaoQtd: TFloatField
      FieldName = 'Qtd'
    end
  end
  object dsmAuxLote_Talao: TDataSource
    DataSet = mAuxLote_Talao
    Left = 928
    Top = 528
  end
  object mAuxPed: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_Pedido'
        DataType = ftInteger
      end
      item
        Name = 'Item_Pedido'
        DataType = ftInteger
      end
      item
        Name = 'ID_Processo_Grupo'
        DataType = ftInteger
      end
      item
        Name = 'ID_Cliente'
        DataType = ftInteger
      end
      item
        Name = 'Num_Pedido'
        DataType = ftInteger
      end
      item
        Name = 'Pedido_Cliente'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Qtd_Pares'
        DataType = ftFloat
      end
      item
        Name = 'Qtd'
        DataType = ftFloat
      end
      item
        Name = 'ID_Produto'
        DataType = ftInteger
      end
      item
        Name = 'Tipo_Mat'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Tipo_Produto_Reg'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ID_Cor'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 672
    Top = 592
    Data = {
      250100009619E0BD01000000180000000C00000000000300000025010949445F
      50656469646F04000100000000000B4974656D5F50656469646F040001000000
      00001149445F50726F636573736F5F477275706F04000100000000000A49445F
      436C69656E746504000100000000000A4E756D5F50656469646F040001000000
      00000E50656469646F5F436C69656E7465010049000000010005574944544802
      0002001400095174645F50617265730800040000000000035174640800040000
      0000000A49445F50726F6475746F0400010000000000085469706F5F4D617401
      00490000000100055749445448020002000100105469706F5F50726F6475746F
      5F52656701004900000001000557494454480200020001000649445F436F7204
      000100000000000000}
    object mAuxPedID_Pedido: TIntegerField
      FieldName = 'ID_Pedido'
    end
    object mAuxPedItem_Pedido: TIntegerField
      FieldName = 'Item_Pedido'
    end
    object mAuxPedID_Processo_Grupo: TIntegerField
      FieldName = 'ID_Processo_Grupo'
    end
    object mAuxPedID_Cliente: TIntegerField
      FieldName = 'ID_Cliente'
    end
    object mAuxPedNum_Pedido: TIntegerField
      FieldName = 'Num_Pedido'
    end
    object mAuxPedPedido_Cliente: TStringField
      FieldName = 'Pedido_Cliente'
    end
    object mAuxPedQtd_Pares: TFloatField
      FieldName = 'Qtd_Pares'
    end
    object mAuxPedQtd: TFloatField
      FieldName = 'Qtd'
    end
    object mAuxPedID_Produto: TIntegerField
      FieldName = 'ID_Produto'
    end
    object mAuxPedTipo_Mat: TStringField
      FieldName = 'Tipo_Mat'
      Size = 1
    end
    object mAuxPedTipo_Produto_Reg: TStringField
      FieldName = 'Tipo_Produto_Reg'
      Size = 1
    end
    object mAuxPedID_Cor: TIntegerField
      FieldName = 'ID_Cor'
    end
  end
  object sdsLote_Ting: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM LOTE_TING'#13#10'WHERE NUM_ORDEM = :NUM_ORDEM'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_ORDEM'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 88
    Top = 626
    object sdsLote_TingNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsLote_TingITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsLote_TingID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object sdsLote_TingID_COR: TIntegerField
      FieldName = 'ID_COR'
    end
    object sdsLote_TingQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsLote_TingUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object sdsLote_TingQTD_ORIGINAL: TFloatField
      FieldName = 'QTD_ORIGINAL'
    end
    object sdsLote_TingCRU: TStringField
      FieldName = 'CRU'
      FixedChar = True
      Size = 1
    end
  end
  object dspLote_Ting: TDataSetProvider
    DataSet = sdsLote_Ting
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspLoteUpdateError
    Left = 136
    Top = 626
  end
  object cdsLote_Ting: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NUM_ORDEM;ITEM'
    Params = <>
    ProviderName = 'dspLote_Ting'
    OnNewRecord = cdsLote_TingNewRecord
    Left = 183
    Top = 626
    object cdsLote_TingNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLote_TingITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLote_TingID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object cdsLote_TingID_COR: TIntegerField
      FieldName = 'ID_COR'
    end
    object cdsLote_TingQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsLote_TingUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsLote_TingQTD_ORIGINAL: TFloatField
      FieldName = 'QTD_ORIGINAL'
    end
    object cdsLote_TingCRU: TStringField
      FieldName = 'CRU'
      FixedChar = True
      Size = 1
    end
  end
  object dsLote_Ting: TDataSource
    DataSet = cdsLote_Ting
    Left = 231
    Top = 626
  end
  object qParametros_Ped: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT *'
      'FROM PARAMETROS_PED'
      '')
    SQLConnection = dmDatabase.scoDados
    Left = 689
    Top = 328
    object qParametros_PedUSA_NUM_TALAO: TStringField
      FieldName = 'USA_NUM_TALAO'
      FixedChar = True
      Size = 1
    end
    object qParametros_PedUSA_RESERVA_EST: TStringField
      FieldName = 'USA_RESERVA_EST'
      FixedChar = True
      Size = 1
    end
  end
  object sdsTingimento: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT lt.num_ordem, lt.item, lt.id_material, lt.id_cor, lt.qtd,' +
      #13#10'MAT.NOME NOME_MATERIAL, COMB.NOME NOME_COR, LT.UNIDADE,'#13#10'(SELE' +
      'CT SUM(coalesce(E.qtd,0)) QTD FROM ESTOQUE_ATUAL E'#13#10'   WHERE E.i' +
      'd_produto = LT.id_material'#13#10'     AND E.id_cor = LT.id_cor) QTD_E' +
      'STOQUE, lt.cru'#13#10'FROM lote_ting lt'#13#10'inner join PRODUTO MAT'#13#10'ON LT' +
      '.id_material = MAT.ID'#13#10'LEFT JOIN COMBINACAO COMB'#13#10'ON LT.ID_COR =' +
      ' COMB.ID'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 960
    Top = 24
  end
  object dspTingimento: TDataSetProvider
    DataSet = sdsTingimento
    OnUpdateError = dspLoteUpdateError
    Left = 1008
    Top = 24
  end
  object cdsTingimento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTingimento'
    Left = 1055
    Top = 24
    object cdsTingimentoNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
      Required = True
    end
    object cdsTingimentoITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsTingimentoID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object cdsTingimentoID_COR: TIntegerField
      FieldName = 'ID_COR'
    end
    object cdsTingimentoQTD: TFloatField
      FieldName = 'QTD'
      DisplayFormat = '0.000##'
    end
    object cdsTingimentoNOME_MATERIAL: TStringField
      FieldName = 'NOME_MATERIAL'
      Size = 100
    end
    object cdsTingimentoNOME_COR: TStringField
      FieldName = 'NOME_COR'
      Size = 60
    end
    object cdsTingimentoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsTingimentoQTD_ESTOQUE: TFMTBCDField
      FieldName = 'QTD_ESTOQUE'
      DisplayFormat = '0.000##'
      Precision = 15
      Size = 6
    end
    object cdsTingimentoCRU: TStringField
      FieldName = 'CRU'
      FixedChar = True
      Size = 1
    end
  end
  object dsTingimento: TDataSource
    DataSet = cdsTingimento
    Left = 1103
    Top = 24
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
    ReportOptions.LastChange = 43790.671092893500000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 1005
    Top = 518
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 1040
    Top = 472
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
    Left = 1048
    Top = 519
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
    Left = 1088
    Top = 519
  end
  object frxRichObject1: TfrxRichObject
    Left = 1120
    Top = 519
  end
  object frxTingimento: TfrxDBDataset
    UserName = 'frxTingimento'
    CloseDataSource = False
    FieldAliases.Strings = (
      'NUM_ORDEM=NUM_ORDEM'
      'ITEM=ITEM'
      'ID_MATERIAL=ID_MATERIAL'
      'ID_COR=ID_COR'
      'QTD=QTD'
      'NOME_MATERIAL=NOME_MATERIAL'
      'NOME_COR=NOME_COR'
      'UNIDADE=UNIDADE'
      'QTD_ESTOQUE=QTD_ESTOQUE')
    DataSource = dsTingimento
    BCDToCurrency = False
    Left = 1028
    Top = 567
  end
  object qParametros_Geral: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT *'
      'FROM PARAMETROS_GERAL')
    SQLConnection = dmDatabase.scoDados
    Left = 455
    Top = 349
    object qParametros_GeralEMPRESA_CALCADOS: TStringField
      FieldName = 'EMPRESA_CALCADOS'
      FixedChar = True
      Size = 1
    end
  end
  object sdsAtelier: TSQLDataSet
    CommandText = 
      'SELECT CODIGO, NOME, CNPJ_CPF'#13#10'FROM PESSOA P'#13#10'WHERE P.TP_ATELIER' +
      ' = '#39'S'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 912
    Top = 72
  end
  object dspAtelier: TDataSetProvider
    DataSet = sdsAtelier
    Left = 968
    Top = 72
  end
  object cdsAtelier: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspAtelier'
    Left = 1024
    Top = 72
    object cdsAtelierCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsAtelierNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsAtelierCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
    end
  end
  object dsAtelier: TDataSource
    DataSet = cdsAtelier
    Left = 1064
    Top = 72
  end
  object sdsSetor: TSQLDataSet
    CommandText = 'SELECT S.id, S.nome'#13#10'FROM SETOR S'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 944
    Top = 160
  end
  object dspSetor: TDataSetProvider
    DataSet = sdsSetor
    Left = 1000
    Top = 160
  end
  object cdsSetor: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspSetor'
    Left = 1056
    Top = 160
    object cdsSetorID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsSetorNOME: TStringField
      FieldName = 'NOME'
    end
  end
  object dsSetor: TDataSource
    DataSet = cdsSetor
    Left = 1096
    Top = 160
  end
  object sdsPedOriginal: TSQLDataSet
    CommandText = 
      'select i.id, i.item_original, SUM(I.QTD_RESTANTE) QTD_RESTANTE'#13#10 +
      'from pedido_item i'#13#10'where i.ID = :ID'#13#10'GROUP BY I.ID, I.ITEM_ORIG' +
      'INAL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 552
    Top = 288
  end
  object dspPedOriginal: TDataSetProvider
    DataSet = sdsPedOriginal
    Left = 584
    Top = 288
  end
  object cdsPedOriginal: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ITEM_ORIGINAL'
    Params = <>
    ProviderName = 'dspPedOriginal'
    Left = 616
    Top = 288
    object cdsPedOriginalID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPedOriginalITEM_ORIGINAL: TIntegerField
      FieldName = 'ITEM_ORIGINAL'
    end
    object cdsPedOriginalQTD_RESTANTE: TFloatField
      FieldName = 'QTD_RESTANTE'
    end
  end
  object sdsLote_Ped_Calc: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM LOTE_PED_CALC'#13#10'WHERE ID = :ID'#13#10
    DataSource = dsLote_Mestre
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
        Size = 4
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 88
    Top = 416
    object sdsLote_Ped_CalcID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsLote_Ped_CalcID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
      Required = True
    end
  end
  object cdsLote_Ped_Calc: TClientDataSet
    Aggregates = <>
    DataSetField = cdsLotesdsLote_Ped_Calc
    IndexFieldNames = 'ID;ID_PEDIDO'
    Params = <>
    Left = 159
    Top = 416
    object cdsLote_Ped_CalcID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsLote_Ped_CalcID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
      Required = True
    end
  end
  object dLote_Ped_Calc: TDataSource
    DataSet = cdsLote_Ped_Calc
    Left = 231
    Top = 416
  end
  object sdsConsumoCalc: TSQLDataSet
    CommandText = 
      'SELECT AUX.*, COR.NOME NOME_COR'#13#10'from'#13#10'  (SELECT P.id, P.referen' +
      'cia, P.nome NOME_PRODUTO, PB.id_cor_combinacao, Mat.TIPO_REG TIP' +
      'O_REG_MAT,'#13#10'    PB.nome NOME_COMBINACAO, pc.id_material, pc.qtd_' +
      'consumo, PC.TIPO_CONSUMO,'#13#10'    PC.ITEM ITEM_CONSUMO, MAT.NOME NO' +
      'ME_MATERIAL, MAT.TRANSFER, MAT.ID_GRADE ID_GRADE_MAT,  MAT.ID_FO' +
      'RNECEDOR,'#13#10'    MAT.USA_CARIMBO_OC, PC.UNIDADE, MAT.referencia RE' +
      'FERENCIA_MAT,'#13#10'   ( SELECT PMAT.id_cor'#13#10'       FROM PRODUTO_COMB' +
      '_MAT PMAT'#13#10'      WHERE PMAT.id = PB.id'#13#10'        AND PMAT.item = ' +
      'PB.item'#13#10'         AND PMAT.id_material = PC.id_material'#13#10'       ' +
      '  and pmat.id_posicao = pc.id_posicao) ID_COR_MAT'#13#10'FROM PRODUTO ' +
      'P'#13#10'INNER JOIN PRODUTO_CONSUMO PC'#13#10'ON P.id = PC.id'#13#10'LEFT JOIN PRO' +
      'DUTO_COMB PB'#13#10'ON PC.id = pb.ID'#13#10'AND PB.id_cor_combinacao = :ID_C' +
      'OMBINACAO'#13#10'LEFT JOIN PRODUTO MAT'#13#10'ON PC.id_material = MAT.id'#13#10'WH' +
      'ERE P.TIPO_REG = '#39'P'#39#13#10'  and p.id = :ID_PRODUTO)'#13#10'  AUX'#13#10'  LEFT J' +
      'OIN COMBINACAO COR'#13#10'  ON AUX.ID_COR_MAT = COR.ID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_COMBINACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 712
    Top = 256
  end
  object dspConsumoCalc: TDataSetProvider
    DataSet = sdsConsumoCalc
    Left = 744
    Top = 256
  end
  object cdsConsumoCalc: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_MATERIAL;ID_COR_MAT'
    Params = <>
    ProviderName = 'dspConsumoCalc'
    Left = 776
    Top = 256
    object cdsConsumoCalcID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsumoCalcREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsConsumoCalcNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object cdsConsumoCalcID_COR_COMBINACAO: TIntegerField
      FieldName = 'ID_COR_COMBINACAO'
    end
    object cdsConsumoCalcTIPO_REG_MAT: TStringField
      FieldName = 'TIPO_REG_MAT'
      FixedChar = True
      Size = 1
    end
    object cdsConsumoCalcNOME_COMBINACAO: TStringField
      FieldName = 'NOME_COMBINACAO'
      Size = 50
    end
    object cdsConsumoCalcID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object cdsConsumoCalcQTD_CONSUMO: TFloatField
      FieldName = 'QTD_CONSUMO'
    end
    object cdsConsumoCalcTIPO_CONSUMO: TStringField
      FieldName = 'TIPO_CONSUMO'
      FixedChar = True
      Size = 1
    end
    object cdsConsumoCalcITEM_CONSUMO: TIntegerField
      FieldName = 'ITEM_CONSUMO'
      Required = True
    end
    object cdsConsumoCalcNOME_MATERIAL: TStringField
      FieldName = 'NOME_MATERIAL'
      Size = 100
    end
    object cdsConsumoCalcTRANSFER: TStringField
      FieldName = 'TRANSFER'
      FixedChar = True
      Size = 1
    end
    object cdsConsumoCalcID_GRADE_MAT: TIntegerField
      FieldName = 'ID_GRADE_MAT'
    end
    object cdsConsumoCalcID_FORNECEDOR: TIntegerField
      FieldName = 'ID_FORNECEDOR'
    end
    object cdsConsumoCalcUSA_CARIMBO_OC: TStringField
      FieldName = 'USA_CARIMBO_OC'
      FixedChar = True
      Size = 1
    end
    object cdsConsumoCalcUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsConsumoCalcREFERENCIA_MAT: TStringField
      FieldName = 'REFERENCIA_MAT'
    end
    object cdsConsumoCalcID_COR_MAT: TIntegerField
      FieldName = 'ID_COR_MAT'
    end
    object cdsConsumoCalcNOME_COR: TStringField
      FieldName = 'NOME_COR'
      Size = 60
    end
  end
  object qConsumo_Tam: TSQLQuery
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
      end
      item
        DataType = ftString
        Name = 'TAMANHO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT CT.qtd_consumo'
      'FROM produto_consumo_tam CT'
      'WHERE CT.id = :ID'
      '  AND CT.item = :ITEM'
      '  AND CT.tamanho = :TAMANHO')
    SQLConnection = dmDatabase.scoDados
    Left = 385
    Top = 256
    object qConsumo_TamQTD_CONSUMO: TFloatField
      FieldName = 'QTD_CONSUMO'
    end
  end
  object sdsPedido_Calc: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT distinct L.num_ordem, PED.pedido_cliente,'#13#10'PED.dtemissao ' +
      'DTEMISSAO_PED, PED.cancelado, PED.num_pedido'#13#10'FROM lote_ped_calc' +
      ' CALC'#13#10'INNER JOIN LOTE L'#13#10'ON CALC.ID = L.ID'#13#10'INNER JOIN PEDIDO P' +
      'ED'#13#10'ON CALC.id_pedido = PED.ID'#13#10#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 392
    Top = 529
  end
  object dspPedido_Calc: TDataSetProvider
    DataSet = sdsPedido_Calc
    Left = 448
    Top = 529
  end
  object cdsPedido_Calc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPedido_Calc'
    Left = 512
    Top = 529
    object cdsPedido_CalcNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsPedido_CalcPEDIDO_CLIENTE: TStringField
      FieldName = 'PEDIDO_CLIENTE'
    end
    object cdsPedido_CalcDTEMISSAO_PED: TDateField
      FieldName = 'DTEMISSAO_PED'
    end
    object cdsPedido_CalcCANCELADO: TStringField
      FieldName = 'CANCELADO'
      FixedChar = True
      Size = 1
    end
    object cdsPedido_CalcNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
  end
  object dsPedido_Calc: TDataSource
    DataSet = cdsPedido_Calc
    Left = 560
    Top = 529
  end
  object qProduto_Comb: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_COR_COMBINACAO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select *'
      'from PRODUTO_COMB'
      'WHERE ID = :ID AND'
      '      ID_COR_COMBINACAO = :ID_COR_COMBINACAO')
    SQLConnection = dmDatabase.scoDados
    Left = 904
    Top = 600
    object qProduto_CombID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qProduto_CombITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object qProduto_CombID_COR_COMBINACAO: TIntegerField
      FieldName = 'ID_COR_COMBINACAO'
    end
    object qProduto_CombFOTO: TStringField
      FieldName = 'FOTO'
      Size = 200
    end
  end
  object qProduto: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select FOTO'
      'from PRODUTO'
      'WHERE ID = :ID')
    SQLConnection = dmDatabase.scoDados
    Left = 976
    Top = 600
    object qProdutoFOTO: TStringField
      FieldName = 'FOTO'
      Size = 150
    end
  end
  object qImpressao: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_ORDEM'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select NUM_ORDEM, count(*)'
      'from LOTE'
      'where NUM_ORDEM = :NUM_ORDEM and IMPRESSO = '#39'S'#39
      'group by NUM_ORDEM'
      'having count(*) > 0')
    SQLConnection = dmDatabase.scoDados
    Left = 816
    Top = 392
    object qImpressaoNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object qImpressaoCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
  object qProcesso: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT P.*'
      'FROM PRODUTO_PROCESSO P'
      'WHERE P.ID = :ID')
    SQLConnection = dmDatabase.scoDados
    Left = 1112
    Top = 392
    object qProcessoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qProcessoITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object qProcessoID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
      Required = True
    end
    object qProcessoID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
    end
    object qProcessoQTD: TFloatField
      FieldName = 'QTD'
    end
    object qProcessoUN: TStringField
      FieldName = 'UN'
      Size = 3
    end
    object qProcessoVLR_UNIT: TFloatField
      FieldName = 'VLR_UNIT'
    end
    object qProcessoVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
    end
    object qProcessoOBS: TStringField
      FieldName = 'OBS'
      Size = 100
    end
  end
  object sdsConsulta_Lote_Proc: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT L.dtemissao, L.num_lote, L.filial, L.hremissao, L.DTENTRE' +
      'GA,'#13#10'L.NUM_ORDEM, L.id, L.id_produto, L.id_combinacao,'#13#10'L.REFERE' +
      'NCIA, PRO.NOME NOME_PRODUTO, L.UNIDADE, FIL.NOME NOME_FILIAL,'#13#10'C' +
      'OMB.nome NOME_COMBINACAO, L.obs_ped, CLI.nome NOME_CLIENTE, PRO.' +
      'id_cor ID_COR_PROD,'#13#10'L.unidade UNIDADE_TALAO, B.id_processo, B.d' +
      'tentrada, B.hrentrada, B.dtbaixa, B.hrbaixa,'#13#10'B.qtd, B.qtd_produ' +
      'zido, PP.NOME NOME_PROCESSO, B.selecionado,'#13#10'PED.NUM_PEDIDO, PED' +
      '.PEDIDO_CLIENTE, CLI.fantasia FANTASIA_CLIENTE, IT.qtd_restante ' +
      'QTD_NAOFATURADO'#13#10'FROM LOTE L'#13#10'LEFT JOIN PEDIDO PED'#13#10'ON L.ID_PEDI' +
      'DO = PED.ID'#13#10'LEFT JOIN PEDIDO_ITEM IT'#13#10'ON L.ID_PEDIDO = IT.ID'#13#10'A' +
      'ND L.ITEM_PEDIDO = IT.ITEM'#13#10'INNER JOIN BAIXA_PROCESSO B'#13#10'ON L.ID' +
      ' = B.ID_LOTE'#13#10'INNER JOIN PROCESSO PP'#13#10'ON B.ID_PROCESSO = PP.ID'#13#10 +
      'INNER JOIN FILIAL FIL'#13#10'ON L.FILIAL = FIL.ID'#13#10'LEFT JOIN PRODUTO P' +
      'RO'#13#10'ON L.ID_PRODUTO = PRO.ID'#13#10'LEFT JOIN combinacao COMB'#13#10'ON L.id' +
      '_combinacao = COMB.id'#13#10'LEFT JOIN PESSOA CLI'#13#10'ON L.id_cliente = C' +
      'LI.codigo'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 928
    Top = 304
  end
  object dspConsulta_Lote_Proc: TDataSetProvider
    DataSet = sdsConsulta_Lote_Proc
    Left = 984
    Top = 304
  end
  object cdsConsulta_Lote_Proc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta_Lote_Proc'
    Left = 1040
    Top = 304
    object cdsConsulta_Lote_ProcDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsConsulta_Lote_ProcNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object cdsConsulta_Lote_ProcFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsConsulta_Lote_ProcHREMISSAO: TTimeField
      FieldName = 'HREMISSAO'
    end
    object cdsConsulta_Lote_ProcDTENTREGA: TDateField
      FieldName = 'DTENTREGA'
    end
    object cdsConsulta_Lote_ProcNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsConsulta_Lote_ProcID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsulta_Lote_ProcID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsConsulta_Lote_ProcID_COMBINACAO: TIntegerField
      FieldName = 'ID_COMBINACAO'
    end
    object cdsConsulta_Lote_ProcREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsConsulta_Lote_ProcNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object cdsConsulta_Lote_ProcUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsConsulta_Lote_ProcNOME_FILIAL: TStringField
      FieldName = 'NOME_FILIAL'
      Size = 60
    end
    object cdsConsulta_Lote_ProcNOME_COMBINACAO: TStringField
      FieldName = 'NOME_COMBINACAO'
      Size = 60
    end
    object cdsConsulta_Lote_ProcOBS_PED: TStringField
      FieldName = 'OBS_PED'
      Size = 100
    end
    object cdsConsulta_Lote_ProcNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object cdsConsulta_Lote_ProcID_COR_PROD: TIntegerField
      FieldName = 'ID_COR_PROD'
    end
    object cdsConsulta_Lote_ProcUNIDADE_TALAO: TStringField
      FieldName = 'UNIDADE_TALAO'
      Size = 6
    end
    object cdsConsulta_Lote_ProcID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object cdsConsulta_Lote_ProcDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object cdsConsulta_Lote_ProcHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object cdsConsulta_Lote_ProcDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object cdsConsulta_Lote_ProcHRBAIXA: TTimeField
      FieldName = 'HRBAIXA'
    end
    object cdsConsulta_Lote_ProcQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsConsulta_Lote_ProcQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
    end
    object cdsConsulta_Lote_ProcNOME_PROCESSO: TStringField
      FieldName = 'NOME_PROCESSO'
      Size = 30
    end
    object cdsConsulta_Lote_ProcSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      Size = 1
    end
    object cdsConsulta_Lote_ProcNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object cdsConsulta_Lote_ProcPEDIDO_CLIENTE: TStringField
      FieldName = 'PEDIDO_CLIENTE'
    end
    object cdsConsulta_Lote_ProcFANTASIA_CLIENTE: TStringField
      FieldName = 'FANTASIA_CLIENTE'
      Size = 30
    end
    object cdsConsulta_Lote_ProcQTD_NAOFATURADO: TFloatField
      FieldName = 'QTD_NAOFATURADO'
    end
  end
  object dsConsulta_Lote_Proc: TDataSource
    DataSet = cdsConsulta_Lote_Proc
    Left = 1096
    Top = 304
  end
  object sdsExc_Baixa_Processo: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM BAIXA_PROCESSO'#13#10'WHERE ID_LOTE = :ID_LOTE'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_LOTE'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 391
    Top = 576
    object sdsExc_Baixa_ProcessoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsExc_Baixa_ProcessoITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object sdsExc_Baixa_ProcessoID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object sdsExc_Baixa_ProcessoID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
    end
    object sdsExc_Baixa_ProcessoID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object sdsExc_Baixa_ProcessoITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object sdsExc_Baixa_ProcessoDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object sdsExc_Baixa_ProcessoHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object sdsExc_Baixa_ProcessoDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object sdsExc_Baixa_ProcessoHRBAIXA: TTimeField
      FieldName = 'HRBAIXA'
    end
    object sdsExc_Baixa_ProcessoQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsExc_Baixa_ProcessoQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
    end
    object sdsExc_Baixa_ProcessoNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object sdsExc_Baixa_ProcessoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
  end
  object dspExc_Baixa_Processo: TDataSetProvider
    DataSet = sdsExc_Baixa_Processo
    Left = 451
    Top = 577
  end
  object cdsExc_Baixa_Processo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspExc_Baixa_Processo'
    Left = 515
    Top = 575
    object cdsExc_Baixa_ProcessoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsExc_Baixa_ProcessoITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsExc_Baixa_ProcessoID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object cdsExc_Baixa_ProcessoID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
    end
    object cdsExc_Baixa_ProcessoID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object cdsExc_Baixa_ProcessoITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object cdsExc_Baixa_ProcessoDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object cdsExc_Baixa_ProcessoHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object cdsExc_Baixa_ProcessoDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object cdsExc_Baixa_ProcessoHRBAIXA: TTimeField
      FieldName = 'HRBAIXA'
    end
    object cdsExc_Baixa_ProcessoQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsExc_Baixa_ProcessoQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
    end
    object cdsExc_Baixa_ProcessoNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsExc_Baixa_ProcessoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
  end
  object dsExc_Baixa_Processo: TDataSource
    DataSet = cdsExc_Baixa_Processo
    Left = 560
    Top = 571
  end
  object qBaixaProcesso: TSQLQuery
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
    SQL.Strings = (
      'SELECT B.*'
      'FROM BAIXA_PROCESSO B'
      'WHERE B.ID = :ID'
      '  AND B.ITEM = :ITEM'
      '')
    SQLConnection = dmDatabase.scoDados
    Left = 1024
    Top = 614
    object qBaixaProcessoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qBaixaProcessoITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object qBaixaProcessoID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object qBaixaProcessoID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
    end
    object qBaixaProcessoID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object qBaixaProcessoITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object qBaixaProcessoDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object qBaixaProcessoHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object qBaixaProcessoDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object qBaixaProcessoHRBAIXA: TTimeField
      FieldName = 'HRBAIXA'
    end
    object qBaixaProcessoQTD: TFloatField
      FieldName = 'QTD'
    end
    object qBaixaProcessoQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
    end
    object qBaixaProcessoNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object qBaixaProcessoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object qBaixaProcessoTOTAL_HORAS: TFloatField
      FieldName = 'TOTAL_HORAS'
    end
    object qBaixaProcessoQTD_PENDENTE: TFloatField
      FieldName = 'QTD_PENDENTE'
    end
    object qBaixaProcessoSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      Size = 1
    end
    object qBaixaProcessoPARCIAL: TStringField
      FieldName = 'PARCIAL'
      Size = 1
    end
    object qBaixaProcessoITEM_ORIGINAL: TIntegerField
      FieldName = 'ITEM_ORIGINAL'
    end
    object qBaixaProcessoQTD_LIBERADA: TFloatField
      FieldName = 'QTD_LIBERADA'
    end
    object qBaixaProcessoAJUSTE: TStringField
      FieldName = 'AJUSTE'
      Size = 1
    end
  end
  object sdsProcesso: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT P.ID, P.NOME, P.TIPO'#13#10'FROM PROCESSO P'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 456
    Top = 240
  end
  object dspProcesso: TDataSetProvider
    DataSet = sdsProcesso
    Left = 512
    Top = 240
  end
  object cdsProcesso: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspProcesso'
    Left = 576
    Top = 240
    object cdsProcessoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsProcessoNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object cdsProcessoTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
  end
  object dsProcesso: TDataSource
    DataSet = cdsProcesso
    Left = 624
    Top = 240
  end
  object qLoteVer: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_ORDEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUM_LOTE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT L.*'
      'FROM LOTE L'
      'WHERE L.NUM_ORDEM = :NUM_ORDEM'
      '  AND L.NUM_LOTE = :NUM_LOTE')
    SQLConnection = dmDatabase.scoDados
    Left = 1144
    Top = 576
    object qLoteVerID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qLoteVerNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object qLoteVerQTD_TALOES: TIntegerField
      FieldName = 'QTD_TALOES'
    end
    object qLoteVerDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object qLoteVerHREMISSAO: TTimeField
      FieldName = 'HREMISSAO'
    end
    object qLoteVerFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object qLoteVerOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object qLoteVerID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object qLoteVerDTENTREGA: TDateField
      FieldName = 'DTENTREGA'
    end
    object qLoteVerQTD: TFloatField
      FieldName = 'QTD'
    end
    object qLoteVerNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object qLoteVerCARIMBO: TStringField
      FieldName = 'CARIMBO'
      Size = 25
    end
    object qLoteVerID_COMBINACAO: TIntegerField
      FieldName = 'ID_COMBINACAO'
    end
    object qLoteVerNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object qLoteVerNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object qLoteVerTALAO_AUX_GERADO: TStringField
      FieldName = 'TALAO_AUX_GERADO'
      FixedChar = True
      Size = 1
    end
    object qLoteVerDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object qLoteVerHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object qLoteVerDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object qLoteVerHRBAIXA: TTimeField
      FieldName = 'HRBAIXA'
    end
    object qLoteVerID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object qLoteVerTIPO_LOTE: TStringField
      FieldName = 'TIPO_LOTE'
      FixedChar = True
      Size = 1
    end
    object qLoteVerREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object qLoteVerUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object qLoteVerQTD_PENDENTE: TFloatField
      FieldName = 'QTD_PENDENTE'
    end
    object qLoteVerQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
    end
    object qLoteVerITEM_ORDEM: TIntegerField
      FieldName = 'ITEM_ORDEM'
    end
    object qLoteVerITEM_ORDEM_TOTAL: TIntegerField
      FieldName = 'ITEM_ORDEM_TOTAL'
    end
    object qLoteVerOBS_PED: TStringField
      FieldName = 'OBS_PED'
      Size = 100
    end
    object qLoteVerID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object qLoteVerIMPRESSO: TStringField
      FieldName = 'IMPRESSO'
      Size = 1
    end
    object qLoteVerQTD_ORIGINAL: TFloatField
      FieldName = 'QTD_ORIGINAL'
    end
    object qLoteVerQTD_PARES: TFloatField
      FieldName = 'QTD_PARES'
    end
    object qLoteVerID_PROCESSO_GRUPO: TIntegerField
      FieldName = 'ID_PROCESSO_GRUPO'
    end
    object qLoteVerBAIXADO: TStringField
      FieldName = 'BAIXADO'
      Size = 1
    end
    object qLoteVerCOMPLETO: TStringField
      FieldName = 'COMPLETO'
      Size = 1
    end
    object qLoteVerID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object qLoteVerCONSUMO_MAT: TFloatField
      FieldName = 'CONSUMO_MAT'
    end
    object qLoteVerID_MATERIAL2: TIntegerField
      FieldName = 'ID_MATERIAL2'
    end
    object qLoteVerCONSUMO_MAT2: TFloatField
      FieldName = 'CONSUMO_MAT2'
    end
    object qLoteVerID_PRODUTO_PRI: TIntegerField
      FieldName = 'ID_PRODUTO_PRI'
    end
    object qLoteVerID_COR_MAT: TIntegerField
      FieldName = 'ID_COR_MAT'
    end
    object qLoteVerID_COR_MAT2: TIntegerField
      FieldName = 'ID_COR_MAT2'
    end
    object qLoteVerENCERADO: TStringField
      FieldName = 'ENCERADO'
      Size = 1
    end
    object qLoteVerNUM_REMESSA: TStringField
      FieldName = 'NUM_REMESSA'
      Size = 15
    end
    object qLoteVerSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      Size = 1
    end
    object qLoteVerITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
  end
  object sdsSaldoEst: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT AUX2.*'#13#10'FROM ('#13#10'select AUX.*,'#13#10'       case '#13#10'         whe' +
      'n AUX.TIPO = '#39'L'#39' then AUX.QTD '#13#10'         else coalesce(AUX.QTD,0' +
      ') - coalesce(AUX.QTD_LOTE,0)'#13#10'       end QTD2 '#13#10'from ( select su' +
      'm(V.QTD) - sum(coalesce(V.QTD_RESERVA, 0)) QTD,'#13#10'        V.TIPO,' +
      ' V.NUM_LOTE_CONTROLE, (select sum(V2.QTD) - sum(coalesce(V2.QTD_' +
      'RESERVA, 0)) QTD_LOTE'#13#10'            from VESTOQUE_RES_LOTE V2'#13#10'  ' +
      '             where V2.ID_PRODUTO = :ID_PRODUTO'#13#10'                ' +
      ' and (V2.ID_COR = :ID_COR)'#13#10'                 and V2.TIPO = '#39'L'#39') ' +
      'QTD_LOTE'#13#10'               from VESTOQUE_RES_LOTE V '#13#10'            ' +
      '   where V.ID_PRODUTO = :ID_PRODUTO  and'#13#10'                     (' +
      'V.ID_COR = :ID_COR)'#13#10'               group by V.TIPO, V.NUM_LOTE_' +
      'CONTROLE ) AUX) AUX2'#13#10'WHERE AUX2.QTD2 > 0'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_COR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_COR'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 688
    Top = 32
  end
  object dspSaldoEst: TDataSetProvider
    DataSet = sdsSaldoEst
    Left = 720
    Top = 32
  end
  object cdsSaldoEst: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSaldoEst'
    Left = 752
    Top = 32
    object cdsSaldoEstQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsSaldoEstTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsSaldoEstNUM_LOTE_CONTROLE: TStringField
      FieldName = 'NUM_LOTE_CONTROLE'
    end
    object cdsSaldoEstQTD_LOTE: TFloatField
      FieldName = 'QTD_LOTE'
    end
    object cdsSaldoEstQTD2: TFloatField
      FieldName = 'QTD2'
    end
  end
  object dsSaldoEst: TDataSource
    DataSet = cdsSaldoEst
    Left = 784
    Top = 32
  end
  object qParametros_Est: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT USA_RESERVA_PROD'
      'FROM PARAMETROS_EST')
    SQLConnection = dmDatabase.scoDados
    Left = 840
    Top = 328
    object qParametros_EstUSA_RESERVA_PROD: TStringField
      FieldName = 'USA_RESERVA_PROD'
      FixedChar = True
      Size = 1
    end
  end
  object sdsConsulta_Lote_Ped: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT L.dtemissao, L.num_lote, L.filial, L.hremissao, L.DTENTRE' +
      'GA,'#13#10'L.NUM_ORDEM, L.id, L.id_produto, L.id_combinacao,'#13#10'L.REFERE' +
      'NCIA, L.UNIDADE, FIL.NOME NOME_FILIAL, L.nome_produto,'#13#10'COMB.nom' +
      'e NOME_COMBINACAO, L.obs_ped, L.obs,'#13#10'CLI.nome NOME_CLIENTE, L.u' +
      'nidade UNIDADE_TALAO,'#13#10'CLI.fantasia FANTASIA_CLIENTE,'#13#10'IT.qtd_re' +
      'stante QTD_NAOFATURADO, L.qtd, L.dtentrada, L.dtbaixa,'#13#10'L.hrentr' +
      'ada, L.hrbaixa, PED.num_pedido, IT.qtd_estoque_res'#13#10'FROM LOTE L'#13 +
      #10'LEFT JOIN PEDIDO_ITEM IT'#13#10'ON L.ID_PEDIDO = IT.ID'#13#10'AND L.ITEM_PE' +
      'DIDO = IT.ITEM'#13#10'INNER JOIN PEDIDO PED'#13#10'ON IT.ID = PED.ID'#13#10'INNER ' +
      'JOIN FILIAL FIL'#13#10'ON L.FILIAL = FIL.ID'#13#10'LEFT JOIN combinacao COMB' +
      #13#10'ON L.id_combinacao = COMB.id'#13#10'LEFT JOIN PESSOA CLI'#13#10'ON L.id_cl' +
      'iente = CLI.codigo'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 544
    Top = 392
  end
  object dspConsulta_Lote_Ped: TDataSetProvider
    DataSet = sdsConsulta_Lote_Ped
    Left = 584
    Top = 392
  end
  object cdsConsulta_Lote_Ped: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta_Lote_Ped'
    Left = 623
    Top = 393
    object cdsConsulta_Lote_PedDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsConsulta_Lote_PedNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object cdsConsulta_Lote_PedFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsConsulta_Lote_PedHREMISSAO: TTimeField
      FieldName = 'HREMISSAO'
    end
    object cdsConsulta_Lote_PedDTENTREGA: TDateField
      FieldName = 'DTENTREGA'
    end
    object cdsConsulta_Lote_PedNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsConsulta_Lote_PedID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsulta_Lote_PedID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsConsulta_Lote_PedID_COMBINACAO: TIntegerField
      FieldName = 'ID_COMBINACAO'
    end
    object cdsConsulta_Lote_PedREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsConsulta_Lote_PedUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsConsulta_Lote_PedNOME_FILIAL: TStringField
      FieldName = 'NOME_FILIAL'
      Size = 60
    end
    object cdsConsulta_Lote_PedNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object cdsConsulta_Lote_PedNOME_COMBINACAO: TStringField
      FieldName = 'NOME_COMBINACAO'
      Size = 60
    end
    object cdsConsulta_Lote_PedOBS_PED: TStringField
      FieldName = 'OBS_PED'
      Size = 100
    end
    object cdsConsulta_Lote_PedOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsConsulta_Lote_PedNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object cdsConsulta_Lote_PedUNIDADE_TALAO: TStringField
      FieldName = 'UNIDADE_TALAO'
      Size = 6
    end
    object cdsConsulta_Lote_PedFANTASIA_CLIENTE: TStringField
      FieldName = 'FANTASIA_CLIENTE'
      Size = 30
    end
    object cdsConsulta_Lote_PedQTD_NAOFATURADO: TFloatField
      FieldName = 'QTD_NAOFATURADO'
    end
    object cdsConsulta_Lote_PedQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsConsulta_Lote_PedDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object cdsConsulta_Lote_PedDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object cdsConsulta_Lote_PedHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object cdsConsulta_Lote_PedHRBAIXA: TTimeField
      FieldName = 'HRBAIXA'
    end
    object cdsConsulta_Lote_PedNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object cdsConsulta_Lote_PedQTD_ESTOQUE_RES: TFloatField
      FieldName = 'QTD_ESTOQUE_RES'
    end
  end
  object dsConsulta_Lote_Ped: TDataSource
    DataSet = cdsConsulta_Lote_Ped
    Left = 664
    Top = 392
  end
  object qEstSemi: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT cast(SUM(VE.qtd) as Double Precision)  QTD, cast(SUM(VE.q' +
        'td_reserva) as double precision) QTD_RESERVA'
      'FROM vestoque_res_lote VE'
      'WHERE VE.id_produto = :ID_PRODUTO'
      
        '  AND VE.id_cor = (SELECT PL.id_cor_cru FROM parametros_lote PL ' +
        'WHERE PL.ID = 1)'
      ''
      '')
    SQLConnection = dmDatabase.scoDados
    Left = 840
    Top = 112
    object qEstSemiQTD: TFloatField
      FieldName = 'QTD'
    end
    object qEstSemiQTD_RESERVA: TFloatField
      FieldName = 'QTD_RESERVA'
    end
  end
  object qUltBaixaParcial: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ITEM'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT bp.qtd'
      'FROM BAIXA_PARCIAL BP'
      'WHERE BP.ID = :ID'
      '  AND BP.ID_PROCESSO = :ID_PROCESSO'
      
        '  and BP.ITEM_PARCIAL = (SELECT MAX(BP2.item_parcial) FROM BAIXA' +
        '_PARCIAL BP2'
      
        '                          where BP2.ID = BP.ID AND BP2.ID_PROCES' +
        'SO = BP.ID_PROCESSO'
      '                             and bp2.item = :ITEM)')
    SQLConnection = dmDatabase.scoDados
    Left = 848
    Top = 168
    object qUltBaixaParcialQTD: TFloatField
      FieldName = 'QTD'
    end
  end
  object sdsConsLote_Mat_Prod: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT L.referencia,'#13#10'M.nome NOME_MATERIAL, COMB.nome NOME_COR_M' +
      'AT, L.qtd_consumo, L.qtd_produto,'#13#10'L.num_ordem, L.item, L.ID_MAT' +
      'ERIAL, L.id_cor_produto, L.id_cor_material,'#13#10'COMB2.NOME NOME_COM' +
      'BINACAO, '#39'3'#39' || lpad(L.num_ordem,8,0) || lpad(L.Item,3,0) CODBAR' +
      'RAS,'#13#10'L.dtretorno, L.dtpago, L.qtd_pago, L.qtd_retorno, L.qtd_di' +
      'ferenca, L.qtd_cones, L.IMPRESSO, L.NUM_LOTE,'#13#10'l.dtgeracao'#13#10'FROM' +
      ' lote_mat_prod L'#13#10'INNER JOIN PRODUTO M'#13#10'ON L.id_material = M.id'#13 +
      #10'LEFT JOIN COMBINACAO COMB'#13#10'ON L.id_cor_material = COMB.ID'#13#10'LEFT' +
      ' JOIN COMBINACAO COMB2'#13#10'ON L.id_cor_produto = COMB2.id'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 456
    Top = 139
  end
  object dspConsLote_Mat_Prod: TDataSetProvider
    DataSet = sdsConsLote_Mat_Prod
    Left = 511
    Top = 139
  end
  object cdsConsLote_Mat_Prod: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsLote_Mat_Prod'
    Left = 575
    Top = 139
    object cdsConsLote_Mat_ProdREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsConsLote_Mat_ProdNOME_MATERIAL: TStringField
      FieldName = 'NOME_MATERIAL'
      Size = 100
    end
    object cdsConsLote_Mat_ProdNOME_COR_MAT: TStringField
      FieldName = 'NOME_COR_MAT'
      Size = 60
    end
    object cdsConsLote_Mat_ProdQTD_CONSUMO: TFloatField
      FieldName = 'QTD_CONSUMO'
    end
    object cdsConsLote_Mat_ProdQTD_PRODUTO: TFloatField
      FieldName = 'QTD_PRODUTO'
    end
    object cdsConsLote_Mat_ProdNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsConsLote_Mat_ProdITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsConsLote_Mat_ProdID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object cdsConsLote_Mat_ProdID_COR_PRODUTO: TIntegerField
      FieldName = 'ID_COR_PRODUTO'
    end
    object cdsConsLote_Mat_ProdID_COR_MATERIAL: TIntegerField
      FieldName = 'ID_COR_MATERIAL'
    end
    object cdsConsLote_Mat_ProdNOME_COMBINACAO: TStringField
      FieldName = 'NOME_COMBINACAO'
      Size = 60
    end
    object cdsConsLote_Mat_ProdCODBARRAS: TStringField
      FieldName = 'CODBARRAS'
      Size = 12
    end
    object cdsConsLote_Mat_ProdDTRETORNO: TDateField
      FieldName = 'DTRETORNO'
    end
    object cdsConsLote_Mat_ProdDTPAGO: TDateField
      FieldName = 'DTPAGO'
    end
    object cdsConsLote_Mat_ProdQTD_PAGO: TFloatField
      FieldName = 'QTD_PAGO'
    end
    object cdsConsLote_Mat_ProdQTD_RETORNO: TFloatField
      FieldName = 'QTD_RETORNO'
    end
    object cdsConsLote_Mat_ProdQTD_DIFERENCA: TFloatField
      FieldName = 'QTD_DIFERENCA'
    end
    object cdsConsLote_Mat_ProdQTD_CONES: TIntegerField
      FieldName = 'QTD_CONES'
    end
    object cdsConsLote_Mat_ProdIMPRESSO: TStringField
      FieldName = 'IMPRESSO'
      FixedChar = True
      Size = 1
    end
    object cdsConsLote_Mat_ProdNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object cdsConsLote_Mat_ProdDTGERACAO: TDateField
      FieldName = 'DTGERACAO'
    end
  end
  object dsConsLote_Mat_Prod: TDataSource
    DataSet = cdsConsLote_Mat_Prod
    Left = 624
    Top = 139
  end
  object frxConsLote_Mat_SL: TfrxDBDataset
    UserName = 'frxConsLote_Mat_SL'
    CloseDataSource = False
    FieldAliases.Strings = (
      'REFERENCIA=REFERENCIA'
      'NOME_MATERIAL=NOME_MATERIAL'
      'NOME_COR_MAT=NOME_COR_MAT'
      'QTD_CONSUMO=QTD_CONSUMO'
      'QTD_PRODUTO=QTD_PRODUTO'
      'NUM_ORDEM=NUM_ORDEM'
      'ITEM=ITEM'
      'ID_MATERIAL=ID_MATERIAL'
      'ID_COR_PRODUTO=ID_COR_PRODUTO'
      'ID_COR_MATERIAL=ID_COR_MATERIAL'
      'NOME_COMBINACAO=NOME_COMBINACAO'
      'CODBARRAS=CODBARRAS'
      'DTRETORNO=DTRETORNO'
      'DTPAGO=DTPAGO'
      'QTD_PAGO=QTD_PAGO'
      'QTD_RETORNO=QTD_RETORNO'
      'QTD_DIFERENCA=QTD_DIFERENCA'
      'QTD_CONES=QTD_CONES'
      'IMPRESSO=IMPRESSO'
      'NUM_LOTE=NUM_LOTE'
      'DTGERACAO=DTGERACAO')
    DataSource = dsConsLote_Mat_Prod
    BCDToCurrency = False
    Left = 1094
    Top = 569
  end
  object sdsLote_Mat_Prod: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM LOTE_MAT_PROD'#13#10'WHERE NUM_ORDEM = :NUM_ORDEM'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_ORDEM'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 70
    Top = 473
    object sdsLote_Mat_ProdID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsLote_Mat_ProdITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object sdsLote_Mat_ProdNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object sdsLote_Mat_ProdID_COR_PRODUTO: TIntegerField
      FieldName = 'ID_COR_PRODUTO'
    end
    object sdsLote_Mat_ProdID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object sdsLote_Mat_ProdID_COR_MATERIAL: TIntegerField
      FieldName = 'ID_COR_MATERIAL'
    end
    object sdsLote_Mat_ProdQTD_CONSUMO: TFloatField
      FieldName = 'QTD_CONSUMO'
    end
    object sdsLote_Mat_ProdQTD_PRODUTO: TFloatField
      FieldName = 'QTD_PRODUTO'
    end
    object sdsLote_Mat_ProdQTD_PAGO: TFloatField
      FieldName = 'QTD_PAGO'
    end
    object sdsLote_Mat_ProdQTD_RETORNO: TFloatField
      FieldName = 'QTD_RETORNO'
    end
    object sdsLote_Mat_ProdQTD_DIFERENCA: TFloatField
      FieldName = 'QTD_DIFERENCA'
    end
    object sdsLote_Mat_ProdQTD_CONES: TIntegerField
      FieldName = 'QTD_CONES'
    end
    object sdsLote_Mat_ProdDTRETORNO: TDateField
      FieldName = 'DTRETORNO'
    end
    object sdsLote_Mat_ProdDTPAGO: TDateField
      FieldName = 'DTPAGO'
    end
    object sdsLote_Mat_ProdNUM_LOTE_AUX: TIntegerField
      FieldName = 'NUM_LOTE_AUX'
    end
    object sdsLote_Mat_ProdREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object sdsLote_Mat_ProdIMPRESSO: TStringField
      FieldName = 'IMPRESSO'
      FixedChar = True
      Size = 1
    end
    object sdsLote_Mat_ProdFINALIZADO: TStringField
      FieldName = 'FINALIZADO'
      FixedChar = True
      Size = 1
    end
    object sdsLote_Mat_ProdDTGERACAO: TDateField
      FieldName = 'DTGERACAO'
    end
    object sdsLote_Mat_ProdNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
  end
  object dspLote_Mat_Prod: TDataSetProvider
    DataSet = sdsLote_Mat_Prod
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspLoteUpdateError
    Left = 142
    Top = 473
  end
  object cdsLote_Mat_Prod: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID;ITEM'
    Params = <>
    ProviderName = 'dspLote_Mat_Prod'
    OnNewRecord = cdsLote_Mat_ProdNewRecord
    Left = 188
    Top = 472
    object cdsLote_Mat_ProdID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsLote_Mat_ProdITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsLote_Mat_ProdNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsLote_Mat_ProdID_COR_PRODUTO: TIntegerField
      FieldName = 'ID_COR_PRODUTO'
    end
    object cdsLote_Mat_ProdID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object cdsLote_Mat_ProdID_COR_MATERIAL: TIntegerField
      FieldName = 'ID_COR_MATERIAL'
    end
    object cdsLote_Mat_ProdQTD_CONSUMO: TFloatField
      FieldName = 'QTD_CONSUMO'
    end
    object cdsLote_Mat_ProdQTD_PRODUTO: TFloatField
      FieldName = 'QTD_PRODUTO'
    end
    object cdsLote_Mat_ProdQTD_PAGO: TFloatField
      FieldName = 'QTD_PAGO'
    end
    object cdsLote_Mat_ProdQTD_RETORNO: TFloatField
      FieldName = 'QTD_RETORNO'
    end
    object cdsLote_Mat_ProdQTD_DIFERENCA: TFloatField
      FieldName = 'QTD_DIFERENCA'
    end
    object cdsLote_Mat_ProdQTD_CONES: TIntegerField
      FieldName = 'QTD_CONES'
    end
    object cdsLote_Mat_ProdDTRETORNO: TDateField
      FieldName = 'DTRETORNO'
    end
    object cdsLote_Mat_ProdDTPAGO: TDateField
      FieldName = 'DTPAGO'
    end
    object cdsLote_Mat_ProdNUM_LOTE_AUX: TIntegerField
      FieldName = 'NUM_LOTE_AUX'
    end
    object cdsLote_Mat_ProdREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsLote_Mat_ProdIMPRESSO: TStringField
      FieldName = 'IMPRESSO'
      FixedChar = True
      Size = 1
    end
    object cdsLote_Mat_ProdFINALIZADO: TStringField
      FieldName = 'FINALIZADO'
      FixedChar = True
      Size = 1
    end
    object cdsLote_Mat_ProdDTGERACAO: TDateField
      FieldName = 'DTGERACAO'
    end
    object cdsLote_Mat_ProdNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
  end
  object dsLote_Mat_Prod: TDataSource
    DataSet = cdsLote_Mat_Prod
    Left = 237
    Top = 473
  end
  object mAuxEst: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    OnNewRecord = mAuxEstNewRecord
    Left = 756
    Top = 400
    Data = {
      6E0000009619E0BD0100000018000000040000000000030000006E000A49445F
      50726F6475746F04000100000000000649445F436F720400010000000000114E
      756D5F4C6F74655F436F6E74726F6C6501004900000001000557494454480200
      020014000351746408000400000000000000}
    object mAuxEstID_Produto: TIntegerField
      FieldName = 'ID_Produto'
    end
    object mAuxEstID_Cor: TIntegerField
      FieldName = 'ID_Cor'
    end
    object mAuxEstNum_Lote_Controle: TStringField
      FieldName = 'Num_Lote_Controle'
    end
    object mAuxEstQtd: TFloatField
      FieldName = 'Qtd'
    end
  end
  object sdsLote_Canc: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM LOTE_CANC'#13#10'WHERE ID = :ID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 389
    Top = 629
    object sdsLote_CancID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsLote_CancITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsLote_CancQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsLote_CancDATA: TDateField
      FieldName = 'DATA'
    end
    object sdsLote_CancHORA: TTimeField
      FieldName = 'HORA'
    end
    object sdsLote_CancUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object sdsLote_CancMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Size = 200
    end
  end
  object dspLote_Canc: TDataSetProvider
    DataSet = sdsLote_Canc
    UpdateMode = upWhereKeyOnly
    Left = 449
    Top = 630
  end
  object cdsLote_Canc: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID;ITEM'
    Params = <>
    ProviderName = 'dspLote_Canc'
    OnNewRecord = cdsLote_CancNewRecord
    Left = 513
    Top = 628
    object cdsLote_CancID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLote_CancITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLote_CancQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsLote_CancDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsLote_CancHORA: TTimeField
      FieldName = 'HORA'
    end
    object cdsLote_CancUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object cdsLote_CancMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Size = 200
    end
  end
  object dsLote_Canc: TDataSource
    DataSet = cdsLote_Canc
    Left = 558
    Top = 624
  end
end
