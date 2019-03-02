object DMBaixaProd_Calc: TDMBaixaProd_Calc
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 201
  Top = 106
  Height = 506
  Width = 1028
  object sdsLote: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT L.*, COMB.NOME NOME_COMBINACAO'#13#10'FROM LOTE L'#13#10'LEFT JOIN CO' +
      'MBINACAO COMB'#13#10'ON L.ID_COMBINACAO = COMB.ID'#13#10'WHERE L.NUM_LOTE = ' +
      ':NUM_LOTE'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_LOTE'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 144
    Top = 48
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
    object sdsLoteDTENTREGA: TDateField
      FieldName = 'DTENTREGA'
    end
    object sdsLoteQTD: TFloatField
      FieldName = 'QTD'
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
    object sdsLoteBAIXADO: TStringField
      FieldName = 'BAIXADO'
      Size = 1
    end
    object sdsLoteNOME_COMBINACAO: TStringField
      FieldName = 'NOME_COMBINACAO'
      Size = 60
    end
    object sdsLotePROCESSO_BAIXADO: TStringField
      FieldName = 'PROCESSO_BAIXADO'
      FixedChar = True
      Size = 1
    end
  end
  object dspLote: TDataSetProvider
    DataSet = sdsLote
    UpdateMode = upWhereKeyOnly
    Left = 192
    Top = 48
  end
  object cdsLote: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspLote'
    Left = 232
    Top = 48
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
    object cdsLoteDTENTREGA: TDateField
      FieldName = 'DTENTREGA'
    end
    object cdsLoteQTD: TFloatField
      FieldName = 'QTD'
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
    object cdsLoteBAIXADO: TStringField
      FieldName = 'BAIXADO'
      Size = 1
    end
    object cdsLoteNOME_COMBINACAO: TStringField
      FieldName = 'NOME_COMBINACAO'
      Size = 60
    end
    object cdsLotePROCESSO_BAIXADO: TStringField
      FieldName = 'PROCESSO_BAIXADO'
      FixedChar = True
      Size = 1
    end
  end
  object qPed: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_PEDIDO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT P.ID'
      'FROM PEDIDO P'
      'WHERE P.num_pedido = :NUM_PEDIDO')
    SQLConnection = dmDatabase.scoDados
    Left = 576
    Top = 48
    object qPedID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
  end
  object qSetor: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM SETOR'
      'WHERE ID = :ID')
    SQLConnection = dmDatabase.scoDados
    Left = 576
    Top = 104
    object qSetorID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qSetorNOME: TStringField
      FieldName = 'NOME'
    end
    object qSetorDESPESA_RATEIO: TFloatField
      FieldName = 'DESPESA_RATEIO'
    end
    object qSetorGERAR_TALAO: TStringField
      FieldName = 'GERAR_TALAO'
      FixedChar = True
      Size = 1
    end
    object qSetorLIMITE_POR_TALAO: TStringField
      FieldName = 'LIMITE_POR_TALAO'
      FixedChar = True
      Size = 1
    end
    object qSetorQTD_LIMITE_POR_TALAO: TIntegerField
      FieldName = 'QTD_LIMITE_POR_TALAO'
    end
    object qSetorMOSTRAR_ORC: TStringField
      FieldName = 'MOSTRAR_ORC'
      FixedChar = True
      Size = 1
    end
    object qSetorORDEM_ORC: TIntegerField
      FieldName = 'ORDEM_ORC'
    end
    object qSetorENTRADA_AUT: TStringField
      FieldName = 'ENTRADA_AUT'
      FixedChar = True
      Size = 1
    end
    object qSetorIMP_MAPA: TStringField
      FieldName = 'IMP_MAPA'
      FixedChar = True
      Size = 1
    end
    object qSetorENCERRA_PROD: TStringField
      FieldName = 'ENCERRA_PROD'
      FixedChar = True
      Size = 1
    end
    object qSetorLER_CBARRA1: TStringField
      FieldName = 'LER_CBARRA1'
      FixedChar = True
      Size = 1
    end
    object qSetorTIPO_LEITURA: TStringField
      FieldName = 'TIPO_LEITURA'
      FixedChar = True
      Size = 1
    end
  end
  object qFuncionario: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_CARTAO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM FUNCIONARIO'
      'WHERE INATIVO = '#39'N'#39
      '  AND NUM_CARTAO = :NUM_CARTAO')
    SQLConnection = dmDatabase.scoDados
    Left = 576
    Top = 152
    object qFuncionarioCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object qFuncionarioNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object qFuncionarioNUM_CARTAO: TIntegerField
      FieldName = 'NUM_CARTAO'
    end
    object qFuncionarioBAIXA_LOTE_COMPLETO: TStringField
      FieldName = 'BAIXA_LOTE_COMPLETO'
      FixedChar = True
      Size = 1
    end
    object qFuncionarioBAIXA_PROCESSO: TStringField
      FieldName = 'BAIXA_PROCESSO'
      FixedChar = True
      Size = 1
    end
  end
  object sdsTalao: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT T.*'#13#10'FROM TALAO T'#13#10'WHERE T.ID = :ID'#13#10'  AND T.NUM_TALAO = ' +
      ':NUM_TALAO'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUM_TALAO'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 144
    Top = 96
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
    object sdsTalaoIMPRESSO: TStringField
      FieldName = 'IMPRESSO'
      FixedChar = True
      Size = 1
    end
    object sdsTalaoID_COMBINACAO: TIntegerField
      FieldName = 'ID_COMBINACAO'
    end
    object sdsTalaoID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
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
  object dspTalao: TDataSetProvider
    DataSet = sdsTalao
    UpdateMode = upWhereKeyOnly
    Left = 192
    Top = 96
  end
  object cdsTalao: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID;NUM_TALAO'
    Params = <>
    ProviderName = 'dspTalao'
    Left = 240
    Top = 96
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
    object cdsTalaoIMPRESSO: TStringField
      FieldName = 'IMPRESSO'
      FixedChar = True
      Size = 1
    end
    object cdsTalaoID_COMBINACAO: TIntegerField
      FieldName = 'ID_COMBINACAO'
    end
    object cdsTalaoID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object cdsTalaoDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object cdsTalaoHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
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
  object sdsTalao_Setor: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM TALAO_SETOR'#13#10'WHERE ID = :ID'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 120
    Top = 152
    object sdsTalao_SetorID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsTalao_SetorNUM_TALAO: TIntegerField
      FieldName = 'NUM_TALAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsTalao_SetorITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsTalao_SetorID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
    end
    object sdsTalao_SetorDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object sdsTalao_SetorHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object sdsTalao_SetorDTSAIDA: TDateField
      FieldName = 'DTSAIDA'
    end
    object sdsTalao_SetorHRSAIDA: TTimeField
      FieldName = 'HRSAIDA'
    end
    object sdsTalao_SetorID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
    end
    object sdsTalao_SetorQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsTalao_SetorTOTAL_HORAS: TFloatField
      FieldName = 'TOTAL_HORAS'
    end
    object sdsTalao_SetorQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
    end
    object sdsTalao_SetorQTD_PENDENTE: TFloatField
      FieldName = 'QTD_PENDENTE'
    end
  end
  object dspTalao_Setor: TDataSetProvider
    DataSet = sdsTalao_Setor
    UpdateMode = upWhereKeyOnly
    Left = 168
    Top = 152
  end
  object cdsTalao_Setor: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID;NUM_TALAO;ITEM'
    Params = <>
    ProviderName = 'dspTalao_Setor'
    OnCalcFields = cdsTalao_SetorCalcFields
    Left = 216
    Top = 152
    object cdsTalao_SetorID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTalao_SetorNUM_TALAO: TIntegerField
      FieldName = 'NUM_TALAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTalao_SetorITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTalao_SetorID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
    end
    object cdsTalao_SetorDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object cdsTalao_SetorHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object cdsTalao_SetorDTSAIDA: TDateField
      FieldName = 'DTSAIDA'
    end
    object cdsTalao_SetorHRSAIDA: TTimeField
      FieldName = 'HRSAIDA'
    end
    object cdsTalao_SetorID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
    end
    object cdsTalao_SetorQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsTalao_SetorTOTAL_HORAS: TFloatField
      FieldName = 'TOTAL_HORAS'
    end
    object cdsTalao_SetorclNome_Setor: TStringField
      FieldKind = fkCalculated
      FieldName = 'clNome_Setor'
      Size = 30
      Calculated = True
    end
    object cdsTalao_SetorclLER_CBARRA1: TStringField
      FieldKind = fkCalculated
      FieldName = 'clLER_CBARRA1'
      Size = 1
      Calculated = True
    end
    object cdsTalao_SetorclEntrada_Aut: TStringField
      FieldKind = fkCalculated
      FieldName = 'clEntrada_Aut'
      Size = 1
      Calculated = True
    end
    object cdsTalao_SetorQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
    end
    object cdsTalao_SetorQTD_PENDENTE: TFloatField
      FieldName = 'QTD_PENDENTE'
    end
    object cdsTalao_SetorclTipo_Leitura: TStringField
      FieldKind = fkCalculated
      FieldName = 'clTipo_Leitura'
      ProviderFlags = []
      Size = 1
      Calculated = True
    end
  end
  object dsTalao_Setor: TDataSource
    DataSet = cdsTalao_Setor
    Left = 256
    Top = 152
  end
  object sdsLote_Setor: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT distinct TS.ID, TS.id_setor, L.qtd, S.NOME NOME_SETOR, l.' +
      'num_lote, ts.item'#13#10'FROM TALAO_SETOR TS'#13#10'INNER JOIN LOTE L'#13#10'ON TS' +
      '.ID = L.ID'#13#10'INNER JOIN SETOR S'#13#10'ON TS.ID_SETOR = S.ID'#13#10'WHERE L.N' +
      'UM_LOTE = :NUM_LOTE'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_LOTE'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 328
    Top = 328
  end
  object dspLote_Setor: TDataSetProvider
    DataSet = sdsLote_Setor
    UpdateMode = upWhereKeyOnly
    Left = 376
    Top = 328
  end
  object cdsLote_Setor: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ITEM'
    Params = <>
    ProviderName = 'dspLote_Setor'
    Left = 416
    Top = 328
    object cdsLote_SetorID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
    end
    object cdsLote_SetorQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsLote_SetorNOME_SETOR: TStringField
      FieldName = 'NOME_SETOR'
    end
    object cdsLote_SetorNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object cdsLote_SetorITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsLote_SetorID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
  end
  object qVerBaixaLote: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_LOTE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT count(1) contador'
      'FROM TALAO_SETOR TS'
      'INNER JOIN LOTE L'
      'ON TS.ID = L.ID'
      'WHERE L.NUM_LOTE = :NUM_LOTE'
      '  AND TS.DTSAIDA IS NULL')
    SQLConnection = dmDatabase.scoDados
    Left = 560
    Top = 320
    object qVerBaixaLoteCONTADOR: TIntegerField
      FieldName = 'CONTADOR'
      Required = True
    end
  end
  object mLote_Setor: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_Setor'
        DataType = ftInteger
      end
      item
        Name = 'Qtd'
        DataType = ftInteger
      end
      item
        Name = 'Nome_Setor'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Num_Lote'
        DataType = ftInteger
      end
      item
        Name = 'Item'
        DataType = ftInteger
      end
      item
        Name = 'Baixado'
        DataType = ftBoolean
      end
      item
        Name = 'Selecionado'
        DataType = ftBoolean
      end
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'Qtd_Pendente'
        DataType = ftFloat
      end
      item
        Name = 'DtEntrada'
        DataType = ftDate
      end
      item
        Name = 'DtSaida'
        DataType = ftDate
      end>
    IndexDefs = <>
    IndexFieldNames = 'Item'
    Params = <>
    StoreDefs = True
    OnNewRecord = mLote_SetorNewRecord
    Left = 328
    Top = 392
    Data = {
      DA0000009619E0BD01000000180000000B000000000003000000DA000849445F
      5365746F7204000100000000000351746404000100000000000A4E6F6D655F53
      65746F720100490000000100055749445448020002002800084E756D5F4C6F74
      650400010000000000044974656D0400010000000000074261697861646F0200
      0300000000000B53656C6563696F6E61646F0200030000000000024944040001
      00000000000C5174645F50656E64656E74650800040000000000094474456E74
      726164610400060000000000074474536169646104000600000000000000}
    object mLote_SetorID_Setor: TIntegerField
      FieldName = 'ID_Setor'
    end
    object mLote_SetorQtd: TIntegerField
      FieldName = 'Qtd'
    end
    object mLote_SetorNome_Setor: TStringField
      FieldName = 'Nome_Setor'
      Size = 40
    end
    object mLote_SetorNum_Lote: TIntegerField
      FieldName = 'Num_Lote'
    end
    object mLote_SetorItem: TIntegerField
      FieldName = 'Item'
    end
    object mLote_SetorBaixado: TBooleanField
      FieldName = 'Baixado'
    end
    object mLote_SetorSelecionado: TBooleanField
      FieldName = 'Selecionado'
    end
    object mLote_SetorID: TIntegerField
      FieldName = 'ID'
    end
    object mLote_SetorQtd_Pendente: TFloatField
      FieldName = 'Qtd_Pendente'
    end
    object mLote_SetorDtEntrada: TDateField
      FieldName = 'DtEntrada'
    end
    object mLote_SetorDtSaida: TDateField
      FieldName = 'DtSaida'
    end
  end
  object dsmLote_Setor: TDataSource
    DataSet = mLote_Setor
    Left = 376
    Top = 392
  end
  object qVerBaixaLoteSetor: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_SETOR'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT count(1) contador'
      'FROM TALAO_SETOR TS'
      'WHERE TS.ID = :ID'
      '  AND TS.id_setor = :ID_SETOR'
      '  AND TS.DTSAIDA IS NULL')
    SQLConnection = dmDatabase.scoDados
    Left = 560
    Top = 368
    object qVerBaixaLoteSetorCONTADOR: TIntegerField
      FieldName = 'CONTADOR'
      Required = True
    end
  end
  object sdsFuncionario_Setor: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT FS.*, TS.ID ID_LOTE, TS.num_talao, TS.dtentrada, TS.dtsai' +
      'da,'#13#10'TS.item item_talao, TS.qtd, S.TIPO_LEITURA, S.NOME NOME_SET' +
      'OR, TS.qtd_pendente,'#13#10'TS.qtd_produzido'#13#10'FROM FUNCIONARIO_SETOR F' +
      'S'#13#10'INNER JOIN TALAO_SETOR TS'#13#10'ON FS.ID_SETOR = TS.id_setor'#13#10'INNE' +
      'R JOIN SETOR S'#13#10'ON TS.ID_SETOR = S.ID'#13#10'WHERE FS.CODIGO = :CODIGO' +
      #13#10'  AND TS.ID = :ID'#13#10'  AND TS.dtsaida IS NULL'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'CODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 760
    Top = 208
  end
  object dspFuncionario_Setor: TDataSetProvider
    DataSet = sdsFuncionario_Setor
    Left = 800
    Top = 208
  end
  object cdsFuncionario_Setor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFuncionario_Setor'
    Left = 840
    Top = 208
    object cdsFuncionario_SetorCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsFuncionario_SetorITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsFuncionario_SetorID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
    end
    object cdsFuncionario_SetorID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
      Required = True
    end
    object cdsFuncionario_SetorNUM_TALAO: TIntegerField
      FieldName = 'NUM_TALAO'
      Required = True
    end
    object cdsFuncionario_SetorDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object cdsFuncionario_SetorDTSAIDA: TDateField
      FieldName = 'DTSAIDA'
    end
    object cdsFuncionario_SetorITEM_TALAO: TIntegerField
      FieldName = 'ITEM_TALAO'
      Required = True
    end
    object cdsFuncionario_SetorQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsFuncionario_SetorTIPO_LEITURA: TStringField
      FieldName = 'TIPO_LEITURA'
      FixedChar = True
      Size = 1
    end
    object cdsFuncionario_SetorNOME_SETOR: TStringField
      FieldName = 'NOME_SETOR'
    end
    object cdsFuncionario_SetorQTD_PENDENTE: TFloatField
      FieldName = 'QTD_PENDENTE'
    end
    object cdsFuncionario_SetorQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
    end
  end
  object dsFuncionario_Setor: TDataSource
    DataSet = cdsFuncionario_Setor
    Left = 888
    Top = 208
  end
  object sdsFuncLote_Setor: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT distinct FS.codigo, fs.id_setor, S.NOME NOME_SETOR'#13#10'FROM ' +
      'FUNCIONARIO_SETOR FS'#13#10'INNER JOIN TALAO_SETOR TS'#13#10'ON FS.ID_SETOR ' +
      '= TS.id_setor'#13#10'INNER JOIN SETOR S'#13#10'ON TS.ID_SETOR = S.ID'#13#10'WHERE ' +
      'FS.CODIGO = :CODIGO'#13#10'  AND TS.ID = :ID'#13#10'  AND TS.dtsaida IS NULL' +
      #13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 760
    Top = 256
  end
  object dspFuncLote_Setor: TDataSetProvider
    DataSet = sdsFuncLote_Setor
    Left = 800
    Top = 256
  end
  object cdsFuncLote_Setor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFuncLote_Setor'
    Left = 840
    Top = 256
    object cdsFuncLote_SetorCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object cdsFuncLote_SetorID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
    end
    object cdsFuncLote_SetorNOME_SETOR: TStringField
      FieldName = 'NOME_SETOR'
    end
  end
  object dsFuncLote_Setor: TDataSource
    DataSet = cdsFuncLote_Setor
    Left = 888
    Top = 256
  end
  object sdsBaixa_Processo: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT *'#13#10'FROM BAIXA_PROCESSO'#13#10'WHERE ID = :ID'#13#10'  AND ITEM = :ITE' +
      'M'
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
    Left = 128
    Top = 216
    object sdsBaixa_ProcessoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsBaixa_ProcessoITEM: TIntegerField
      FieldName = 'ITEM'
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
    object sdsBaixa_ProcessoTOTAL_HORAS: TFloatField
      FieldName = 'TOTAL_HORAS'
    end
    object sdsBaixa_ProcessoQTD_PENDENTE: TFloatField
      FieldName = 'QTD_PENDENTE'
    end
    object sdsBaixa_ProcessoSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      Size = 1
    end
    object sdsBaixa_ProcessoPARCIAL: TStringField
      FieldName = 'PARCIAL'
      Size = 1
    end
    object sdsBaixa_ProcessoITEM_ORIGINAL: TIntegerField
      FieldName = 'ITEM_ORIGINAL'
    end
    object sdsBaixa_ProcessoQTD_LIBERADA: TFloatField
      FieldName = 'QTD_LIBERADA'
    end
    object sdsBaixa_ProcessoAJUSTE: TStringField
      FieldName = 'AJUSTE'
      Size = 1
    end
    object sdsBaixa_ProcessoID_FUNCIONARIO_ENT: TIntegerField
      FieldName = 'ID_FUNCIONARIO_ENT'
    end
    object sdsBaixa_ProcessoID_FUNCIONARIO_BAIXA: TIntegerField
      FieldName = 'ID_FUNCIONARIO_BAIXA'
    end
    object sdsBaixa_ProcessoID_MOVESTOQUE: TIntegerField
      FieldName = 'ID_MOVESTOQUE'
    end
    object sdsBaixa_ProcessoID_MOVESTOQUE_RES: TIntegerField
      FieldName = 'ID_MOVESTOQUE_RES'
    end
    object sdsBaixa_ProcessoID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
    end
    object sdsBaixa_ProcessoID_POSICAO: TIntegerField
      FieldName = 'ID_POSICAO'
    end
    object sdsBaixa_ProcessoNUM_TALAO: TIntegerField
      FieldName = 'NUM_TALAO'
    end
    object sdsBaixa_ProcessoID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
  end
  object dspBaixa_Processo: TDataSetProvider
    DataSet = sdsBaixa_Processo
    Left = 176
    Top = 216
  end
  object cdsBaixa_Processo: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID;ITEM'
    Params = <>
    ProviderName = 'dspBaixa_Processo'
    Left = 216
    Top = 216
    object cdsBaixa_ProcessoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsBaixa_ProcessoITEM: TIntegerField
      FieldName = 'ITEM'
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
    object cdsBaixa_ProcessoTOTAL_HORAS: TFloatField
      FieldName = 'TOTAL_HORAS'
    end
    object cdsBaixa_ProcessoQTD_PENDENTE: TFloatField
      FieldName = 'QTD_PENDENTE'
    end
    object cdsBaixa_ProcessoSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      Size = 1
    end
    object cdsBaixa_ProcessoPARCIAL: TStringField
      FieldName = 'PARCIAL'
      Size = 1
    end
    object cdsBaixa_ProcessoITEM_ORIGINAL: TIntegerField
      FieldName = 'ITEM_ORIGINAL'
    end
    object cdsBaixa_ProcessoQTD_LIBERADA: TFloatField
      FieldName = 'QTD_LIBERADA'
    end
    object cdsBaixa_ProcessoAJUSTE: TStringField
      FieldName = 'AJUSTE'
      Size = 1
    end
    object cdsBaixa_ProcessoID_FUNCIONARIO_ENT: TIntegerField
      FieldName = 'ID_FUNCIONARIO_ENT'
    end
    object cdsBaixa_ProcessoID_FUNCIONARIO_BAIXA: TIntegerField
      FieldName = 'ID_FUNCIONARIO_BAIXA'
    end
    object cdsBaixa_ProcessoID_MOVESTOQUE: TIntegerField
      FieldName = 'ID_MOVESTOQUE'
    end
    object cdsBaixa_ProcessoID_MOVESTOQUE_RES: TIntegerField
      FieldName = 'ID_MOVESTOQUE_RES'
    end
    object cdsBaixa_ProcessoID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
    end
    object cdsBaixa_ProcessoID_POSICAO: TIntegerField
      FieldName = 'ID_POSICAO'
    end
    object cdsBaixa_ProcessoNUM_TALAO: TIntegerField
      FieldName = 'NUM_TALAO'
    end
    object cdsBaixa_ProcessoID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
  end
  object qBaixaProc: TSQLQuery
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
      
        'SELECT B.id, B.item, B.id_lote, B.id_processo, P.nome NOME_PROCE' +
        'SSO, L.num_lote,'
      'B.dtentrada, B.dtbaixa'
      'FROM BAIXA_PROCESSO B'
      'LEFT JOIN PROCESSO P'
      'ON B.id_processo = P.ID'
      'LEFT JOIN LOTE L'
      'ON B.id_lote = L.ID'
      'WHERE B.ID = :ID'
      '  AND B.item = :ITEM')
    SQLConnection = dmDatabase.scoDados
    Left = 584
    Top = 200
    object qBaixaProcID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qBaixaProcITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object qBaixaProcID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
    end
    object qBaixaProcID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object qBaixaProcNOME_PROCESSO: TStringField
      FieldName = 'NOME_PROCESSO'
      Size = 30
    end
    object qBaixaProcNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object qBaixaProcDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object qBaixaProcDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
  end
  object qProcLote: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_LOTE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT COUNT(1) CONTADOR'
      'FROM BAIXA_PROCESSO B'
      'WHERE B.dtbaixa IS NULL'
      '  AND B.ID_LOTE = :ID_LOTE'
      '')
    SQLConnection = dmDatabase.scoDados
    Left = 472
    Top = 184
    object qProcLoteCONTADOR: TIntegerField
      FieldName = 'CONTADOR'
      Required = True
    end
  end
  object qParametros_Lote: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select ID_SETOR_EST'
      'from parametros_lote')
    SQLConnection = dmDatabase.scoDados
    Left = 464
    Top = 96
    object qParametros_LoteID_SETOR_EST: TIntegerField
      FieldName = 'ID_SETOR_EST'
    end
  end
  object sdsTalao_Estoque: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM TALAO_ESTOQUE'#13#10'WHERE ID = :ID'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 120
    Top = 272
    object sdsTalao_EstoqueID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsTalao_EstoqueID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
    end
    object sdsTalao_EstoqueNUM_TALAO: TIntegerField
      FieldName = 'NUM_TALAO'
    end
    object sdsTalao_EstoqueID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
    end
    object sdsTalao_EstoqueQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsTalao_EstoqueID_MOVESTOQUE: TIntegerField
      FieldName = 'ID_MOVESTOQUE'
    end
    object sdsTalao_EstoqueDATA: TDateField
      FieldName = 'DATA'
    end
  end
  object dspTalao_Estoque: TDataSetProvider
    DataSet = sdsTalao_Estoque
    Left = 168
    Top = 272
  end
  object cdsTalao_Estoque: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspTalao_Estoque'
    Left = 208
    Top = 272
    object cdsTalao_EstoqueID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsTalao_EstoqueID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
    end
    object cdsTalao_EstoqueNUM_TALAO: TIntegerField
      FieldName = 'NUM_TALAO'
    end
    object cdsTalao_EstoqueID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
    end
    object cdsTalao_EstoqueQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsTalao_EstoqueID_MOVESTOQUE: TIntegerField
      FieldName = 'ID_MOVESTOQUE'
    end
    object cdsTalao_EstoqueDATA: TDateField
      FieldName = 'DATA'
    end
  end
end
