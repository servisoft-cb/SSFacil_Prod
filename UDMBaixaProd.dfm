object DMBaixaProd: TDMBaixaProd
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 257
  Top = 20
  Height = 631
  Width = 909
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
    Top = 47
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
    object sdsLoteITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object sdsLoteNOME_COMBINACAO: TStringField
      FieldName = 'NOME_COMBINACAO'
      ProviderFlags = []
      Size = 60
    end
    object sdsLoteNUM_LOTE_CONTROLE: TStringField
      FieldName = 'NUM_LOTE_CONTROLE'
    end
    object sdsLoteTIPO_LOTE_ESTOQUE: TStringField
      FieldName = 'TIPO_LOTE_ESTOQUE'
      FixedChar = True
      Size = 1
    end
    object sdsLoteID_MOVESTOQUE_RES: TIntegerField
      FieldName = 'ID_MOVESTOQUE_RES'
    end
    object sdsLoteQTD_ESTOQUE_USADA: TFloatField
      FieldName = 'QTD_ESTOQUE_USADA'
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
    object cdsLoteITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object cdsLoteNOME_COMBINACAO: TStringField
      FieldName = 'NOME_COMBINACAO'
      ProviderFlags = []
      Size = 60
    end
    object cdsLoteNUM_LOTE_CONTROLE: TStringField
      FieldName = 'NUM_LOTE_CONTROLE'
    end
    object cdsLoteTIPO_LOTE_ESTOQUE: TStringField
      FieldName = 'TIPO_LOTE_ESTOQUE'
      FixedChar = True
      Size = 1
    end
    object cdsLoteID_MOVESTOQUE_RES: TIntegerField
      FieldName = 'ID_MOVESTOQUE_RES'
    end
    object cdsLoteQTD_ESTOQUE_USADA: TFloatField
      FieldName = 'QTD_ESTOQUE_USADA'
    end
  end
  object sdsPedido_Item: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT I.ID, I.ITEM, I.id_produto, I.id_cor, I.qtd, I.qtd_fatura' +
      'do,I.qtd_restante,'#13#10'I.qtd_cancelado,I.qtd_produzida, I.cancelado' +
      ', I.referencia,I.nomeproduto,'#13#10'COMB.NOME NOME_COMBINACAO, i.qtd_' +
      'liberada, i.qtd_conferido'#13#10'FROM PEDIDO_ITEM I'#13#10'LEFT JOIN COMBINA' +
      'CAO COMB'#13#10'ON I.ID_COR = COMB.ID'#13#10'WHERE I.ID = :ID'#13#10'  AND I.ITEM ' +
      '= :ITEM'#13#10
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
    Left = 144
    Top = 104
    object sdsPedido_ItemID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsPedido_ItemITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsPedido_ItemID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object sdsPedido_ItemID_COR: TFMTBCDField
      FieldName = 'ID_COR'
      Precision = 15
      Size = 0
    end
    object sdsPedido_ItemQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsPedido_ItemQTD_FATURADO: TFloatField
      FieldName = 'QTD_FATURADO'
    end
    object sdsPedido_ItemQTD_RESTANTE: TFloatField
      FieldName = 'QTD_RESTANTE'
    end
    object sdsPedido_ItemQTD_CANCELADO: TFloatField
      FieldName = 'QTD_CANCELADO'
    end
    object sdsPedido_ItemQTD_PRODUZIDA: TFloatField
      FieldName = 'QTD_PRODUZIDA'
    end
    object sdsPedido_ItemCANCELADO: TStringField
      FieldName = 'CANCELADO'
      FixedChar = True
      Size = 1
    end
    object sdsPedido_ItemREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object sdsPedido_ItemNOMEPRODUTO: TStringField
      FieldName = 'NOMEPRODUTO'
      Size = 100
    end
    object sdsPedido_ItemNOME_COMBINACAO: TStringField
      FieldName = 'NOME_COMBINACAO'
      ProviderFlags = []
      Size = 60
    end
    object sdsPedido_ItemQTD_LIBERADA: TFloatField
      FieldName = 'QTD_LIBERADA'
    end
    object sdsPedido_ItemQTD_CONFERIDO: TFloatField
      FieldName = 'QTD_CONFERIDO'
    end
  end
  object dspPedido_Item: TDataSetProvider
    DataSet = sdsPedido_Item
    UpdateMode = upWhereKeyOnly
    Left = 192
    Top = 104
  end
  object cdsPedido_Item: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID;ITEM'
    Params = <>
    ProviderName = 'dspPedido_Item'
    Left = 232
    Top = 104
    object cdsPedido_ItemID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPedido_ItemITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsPedido_ItemID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsPedido_ItemID_COR: TFMTBCDField
      FieldName = 'ID_COR'
      Precision = 15
      Size = 0
    end
    object cdsPedido_ItemQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsPedido_ItemQTD_FATURADO: TFloatField
      FieldName = 'QTD_FATURADO'
    end
    object cdsPedido_ItemQTD_RESTANTE: TFloatField
      FieldName = 'QTD_RESTANTE'
    end
    object cdsPedido_ItemQTD_CANCELADO: TFloatField
      FieldName = 'QTD_CANCELADO'
    end
    object cdsPedido_ItemQTD_PRODUZIDA: TFloatField
      FieldName = 'QTD_PRODUZIDA'
    end
    object cdsPedido_ItemCANCELADO: TStringField
      FieldName = 'CANCELADO'
      FixedChar = True
      Size = 1
    end
    object cdsPedido_ItemREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsPedido_ItemNOMEPRODUTO: TStringField
      FieldName = 'NOMEPRODUTO'
      Size = 100
    end
    object cdsPedido_ItemNOME_COMBINACAO: TStringField
      FieldName = 'NOME_COMBINACAO'
      ProviderFlags = []
      Size = 60
    end
    object cdsPedido_ItemQTD_LIBERADA: TFloatField
      FieldName = 'QTD_LIBERADA'
    end
    object cdsPedido_ItemQTD_CONFERIDO: TFloatField
      FieldName = 'QTD_CONFERIDO'
    end
  end
  object qPed: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT P.ID, P.ID_CLIENTE, CLI.baixar_etiq_prefat, CLI.NOME, P.F' +
        'ILIAL'
      'FROM PEDIDO P'
      'INNER JOIN PESSOA CLI'
      'ON P.ID_CLIENTE = CLI.CODIGO'
      '')
    SQLConnection = dmDatabase.scoDados
    Left = 608
    Top = 96
    object qPedID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qPedID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object qPedBAIXAR_ETIQ_PREFAT: TStringField
      FieldName = 'BAIXAR_ETIQ_PREFAT'
      FixedChar = True
      Size = 1
    end
    object qPedNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qPedFILIAL: TIntegerField
      FieldName = 'FILIAL'
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
      'SELECT *'
      'FROM PROCESSO'
      'WHERE ID = :ID')
    SQLConnection = dmDatabase.scoDados
    Left = 608
    Top = 152
    object qProcessoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qProcessoNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object qProcessoLIMITE_POR_TALAO: TStringField
      FieldName = 'LIMITE_POR_TALAO'
      FixedChar = True
      Size = 1
    end
    object qProcessoQTD_LIMITE_POR_TALAO: TIntegerField
      FieldName = 'QTD_LIMITE_POR_TALAO'
    end
    object qProcessoAGRUPAR_PEDIDOS: TStringField
      FieldName = 'AGRUPAR_PEDIDOS'
      FixedChar = True
      Size = 1
    end
    object qProcessoTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object qProcessoENTRADA_AUTO: TStringField
      FieldName = 'ENTRADA_AUTO'
      FixedChar = True
      Size = 1
    end
    object qProcessoESTOQUE: TStringField
      FieldName = 'ESTOQUE'
      Size = 1
    end
    object qProcessoESTOQUE_CRU: TStringField
      FieldName = 'ESTOQUE_CRU'
      Size = 1
    end
    object qProcessoESTOQUE_DT_ES: TStringField
      FieldName = 'ESTOQUE_DT_ES'
      Size = 1
    end
  end
  object sdsBaixa_Processo: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM BAIXA_PROCESSO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 135
    Top = 160
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
    object sdsBaixa_ProcessoTOTAL_HORAS: TFloatField
      FieldName = 'TOTAL_HORAS'
    end
    object sdsBaixa_ProcessoQTD_PENDENTE: TFloatField
      FieldName = 'QTD_PENDENTE'
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
    object sdsBaixa_ProcessoRETRABALHO: TStringField
      FieldName = 'RETRABALHO'
      Size = 1
    end
  end
  object dspBaixa_Processo: TDataSetProvider
    DataSet = sdsBaixa_Processo
    UpdateMode = upWhereKeyOnly
    Left = 192
    Top = 160
  end
  object cdsBaixa_Processo: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID;ITEM'
    Params = <>
    ProviderName = 'dspBaixa_Processo'
    OnCalcFields = cdsBaixa_ProcessoCalcFields
    Left = 247
    Top = 161
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
    object cdsBaixa_ProcessoclNome_Processo: TStringField
      FieldKind = fkCalculated
      FieldName = 'clNome_Processo'
      Size = 60
      Calculated = True
    end
    object cdsBaixa_ProcessoTOTAL_HORAS: TFloatField
      FieldName = 'TOTAL_HORAS'
      DisplayFormat = '0.00'
    end
    object cdsBaixa_ProcessoQTD_PENDENTE: TFloatField
      FieldName = 'QTD_PENDENTE'
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
    object cdsBaixa_ProcessoRETRABALHO: TStringField
      FieldName = 'RETRABALHO'
      Size = 1
    end
  end
  object dsBaixa_Processo: TDataSource
    DataSet = cdsBaixa_Processo
    Left = 296
    Top = 160
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
      
        'SELECT F.CODIGO, F.NOME, F.NUM_CARTAO, F.LIBERA_PED, F.baixa_eti' +
        'q_prefat, F.SENHA'
      'FROM FUNCIONARIO F'
      'WHERE INATIVO = '#39'N'#39
      '  AND NUM_CARTAO = :NUM_CARTAO')
    SQLConnection = dmDatabase.scoDados
    Left = 608
    Top = 208
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
    object qFuncionarioLIBERA_PED: TStringField
      FieldName = 'LIBERA_PED'
      FixedChar = True
      Size = 1
    end
    object qFuncionarioBAIXA_ETIQ_PREFAT: TStringField
      FieldName = 'BAIXA_ETIQ_PREFAT'
      FixedChar = True
      Size = 1
    end
    object qFuncionarioSENHA: TStringField
      FieldName = 'SENHA'
      Size = 15
    end
  end
  object qFuncionario_Processo: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select *'
      'from FUNCIONARIO_PROC'
      'where CODIGO = :CODIGO')
    SQLConnection = dmDatabase.scoDados
    Left = 608
    Top = 264
    object qFuncionario_ProcessoCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object qFuncionario_ProcessoID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
      Required = True
    end
  end
  object qParametros_Lote: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT P.LOTE_PROCESSO, P.LOTE_TEXTIL, R.NOME NOME_PROCESSO_CONF' +
        ', USA_LOTE_PEDIDO, '
      
        'ID_PROCESSO_EST, ID_PROCESSO_SEMI_EST, ID_COR_CRU, CONT_LOTE_ANT' +
        ', RESERVA_EST_LOTE'
      'FROM PARAMETROS_LOTE P'
      'LEFT JOIN PROCESSO R'
      'ON P.ID_PROCESSO_CONF = R.ID')
    SQLConnection = dmDatabase.scoDados
    Left = 536
    Top = 16
    object qParametros_LoteLOTE_PROCESSO: TStringField
      FieldName = 'LOTE_PROCESSO'
      FixedChar = True
      Size = 1
    end
    object qParametros_LoteLOTE_TEXTIL: TStringField
      FieldName = 'LOTE_TEXTIL'
      FixedChar = True
      Size = 1
    end
    object qParametros_LoteNOME_PROCESSO_CONF: TStringField
      FieldName = 'NOME_PROCESSO_CONF'
      Size = 30
    end
    object qParametros_LoteUSA_LOTE_PEDIDO: TStringField
      FieldName = 'USA_LOTE_PEDIDO'
      FixedChar = True
      Size = 1
    end
    object qParametros_LoteID_PROCESSO_EST: TIntegerField
      FieldName = 'ID_PROCESSO_EST'
    end
    object qParametros_LoteID_PROCESSO_SEMI_EST: TIntegerField
      FieldName = 'ID_PROCESSO_SEMI_EST'
    end
    object qParametros_LoteID_COR_CRU: TIntegerField
      FieldName = 'ID_COR_CRU'
    end
    object qParametros_LoteCONT_LOTE_ANT: TStringField
      FieldName = 'CONT_LOTE_ANT'
      Size = 1
    end
    object qParametros_LoteRESERVA_EST_LOTE: TStringField
      FieldName = 'RESERVA_EST_LOTE'
      FixedChar = True
      Size = 1
    end
  end
  object sdsPedido_Talao: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT *'#13#10'FROM PEDIDO_TALAO'#13#10'WHERE ID = :ID'#13#10'  AND ITEM = :ITEM'#13 +
      #10'  AND ITEM_TALAO = :ITEM_TALAO'#13#10
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
        DataType = ftInteger
        Name = 'ITEM_TALAO'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 488
    Top = 336
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
    object sdsPedido_TalaoUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
  end
  object dspPedido_Talao: TDataSetProvider
    DataSet = sdsPedido_Talao
    UpdateMode = upWhereKeyOnly
    Left = 528
    Top = 336
  end
  object cdsPedido_Talao: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID;ITEM;ITEM_TALAO'
    Params = <>
    ProviderName = 'dspPedido_Talao'
    Left = 576
    Top = 336
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
    object cdsPedido_TalaoUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
  end
  object dsPedido_Talao: TDataSource
    DataSet = cdsPedido_Talao
    Left = 624
    Top = 336
  end
  object dsPendente_Lib: TDataSource
    DataSet = cdsPendente_Lib
    Left = 656
    Top = 389
  end
  object cdsPendente_Lib: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPendente_Lib'
    Left = 608
    Top = 389
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
    Left = 568
    Top = 389
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
      ' PI.qtd_liberada,'#13#10'PI.qtd_faturado'#13#10'FROM PEDIDO_ITEM PI'#13#10'INNER J' +
      'OIN PEDIDO PED'#13#10'ON PI.ID = PED.ID'#13#10'INNER JOIN PESSOA CLI'#13#10'ON PED' +
      '.ID_CLIENTE = CLI.CODIGO'#13#10'INNER JOIN FILIAL FIL'#13#10'ON PED.FILIAL =' +
      ' FIL.ID'#13#10'LEFT JOIN PRODUTO PRO ON (PI.ID_PRODUTO = PRO.ID)'#13#10'LEFT' +
      ' JOIN PEDIDO_ITEM_TIPO PT ON (PI.ID = PT.ID AND PI.ITEM = PT.ITE' +
      'M)'#13#10'LEFT JOIN COMBINACAO COMB ON (PI.ID_COR = COMB.ID)'#13#10'LEFT JOI' +
      'N PRODUTO_COMB PCOMB ON PI.ID_PRODUTO = PCOMB.ID AND pi.id_cor =' +
      ' pcomb.id_cor_combinacao'#13#10'WHERE  (PI.QTD > 0)'#13#10' AND PED.TIPO_REG' +
      ' = '#39'P'#39#13#10' AND PI.QTD_RESTANTE > 0'#13#10' AND coalesce(PI.QTD_CONFERIDO' +
      ',0) > 0'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 528
    Top = 389
  end
  object qConf_Proc: TSQLQuery
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
    SQL.Strings = (
      'SELECT COUNT(1) CONTADOR'
      'FROM baixa_processo B'
      'WHERE B.ID_PEDIDO = :ID_PEDIDO'
      '  AND B.ITEM_PEDIDO = :ITEM_PEDIDO'
      
        '  AND B.ID_PROCESSO = (SELECT L.ID_PROCESSO_CONF FROM PARAMETROS' +
        '_LOTE L WHERE L.ID = 1)'
      '  AND ((B.dtbaixa IS NOT NULL) or (b.qtd_produzido > 0))')
    SQLConnection = dmDatabase.scoDados
    Left = 776
    Top = 280
    object qConf_ProcCONTADOR: TIntegerField
      FieldName = 'CONTADOR'
      Required = True
    end
  end
  object dsRapido: TDataSource
    DataSet = cdsRapido
    Left = 264
    Top = 389
  end
  object cdsRapido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRapido'
    Left = 215
    Top = 389
    object cdsRapidoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsRapidoITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsRapidoQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsRapidoQTD_CONFERIDO: TFloatField
      FieldName = 'QTD_CONFERIDO'
    end
    object cdsRapidoDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object cdsRapidoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsRapidoQTD_LIBERADA: TFloatField
      FieldName = 'QTD_LIBERADA'
    end
    object cdsRapidoQTD_FATURADO: TFloatField
      FieldName = 'QTD_FATURADO'
    end
    object cdsRapidoQTD_REST_CONF: TFloatField
      FieldName = 'QTD_REST_CONF'
    end
  end
  object dspRapido: TDataSetProvider
    DataSet = sdsRapido
    Left = 176
    Top = 389
  end
  object sdsRapido: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT I.ID, I.ITEM, I.qtd,  I.qtd_conferido, B.DTBAIXA, I.REFER' +
      'ENCIA, '#13#10'I.QTD_LIBERADA, I.QTD_FATURADO,'#13#10'i.qtd - (coalesce(i.qt' +
      'd_liberada,0) + coalesce(i.qtd_conferido,0) + coalesce(i.qtd_fat' +
      'urado,0)) qtd_rest_conf'#13#10'FROM PEDIDO_ITEM I'#13#10'LEFT JOIN BAIXA_PRO' +
      'CESSO B'#13#10'ON I.ID = B.ID_PEDIDO'#13#10'AND I.ITEM = B.ITEM_PEDIDO'#13#10'AND ' +
      'B.ID_PROCESSO = (SELECT LL.ID_PROCESSO_CONF FROM PARAMETROS_LOTE' +
      ' LL WHERE LL.ID = 1)'#13#10'WHERE I.tipo_reg = '#39'P'#39#13#10#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 136
    Top = 389
  end
  object qConfLoteBaixado: TSQLQuery
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
    SQL.Strings = (
      'SELECT COUNT(1) CONTADOR'
      'FROM baixa_processo B'
      'WHERE B.ID_PEDIDO = :ID_PEDIDO'
      '  AND B.ITEM_PEDIDO = :ITEM_PEDIDO'
      '  AND B.dtbaixa IS NULL')
    SQLConnection = dmDatabase.scoDados
    Left = 776
    Top = 344
    object qConfLoteBaixadoCONTADOR: TIntegerField
      FieldName = 'CONTADOR'
      Required = True
    end
  end
  object qVerBaixa: TSQLQuery
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
      '  AND B.ITEM = :ITEM')
    SQLConnection = dmDatabase.scoDados
    Left = 352
    Top = 336
    object qVerBaixaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qVerBaixaITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object qVerBaixaID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object qVerBaixaID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
    end
    object qVerBaixaID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object qVerBaixaITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object qVerBaixaDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object qVerBaixaHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object qVerBaixaDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object qVerBaixaHRBAIXA: TTimeField
      FieldName = 'HRBAIXA'
    end
    object qVerBaixaQTD: TFloatField
      FieldName = 'QTD'
    end
    object qVerBaixaQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
    end
    object qVerBaixaNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object qVerBaixaTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object qVerBaixaTOTAL_HORAS: TFloatField
      FieldName = 'TOTAL_HORAS'
    end
    object qVerBaixaQTD_PENDENTE: TFloatField
      FieldName = 'QTD_PENDENTE'
    end
    object qVerBaixaSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      Size = 1
    end
    object qVerBaixaPARCIAL: TStringField
      FieldName = 'PARCIAL'
      Size = 1
    end
  end
  object sdsBaixa_Parcial: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT *'#13#10'FROM BAIXA_PARCIAL'#13#10'WHERE ID = :ID'#13#10'  AND ITEM = :ITEM' +
      #13#10
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
    Left = 136
    Top = 216
    object sdsBaixa_ParcialID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsBaixa_ParcialITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsBaixa_ParcialITEM_PARCIAL: TIntegerField
      FieldName = 'ITEM_PARCIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsBaixa_ParcialID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object sdsBaixa_ParcialDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object sdsBaixa_ParcialHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object sdsBaixa_ParcialDTSAIDA: TDateField
      FieldName = 'DTSAIDA'
    end
    object sdsBaixa_ParcialHRSAIDA: TTimeField
      FieldName = 'HRSAIDA'
    end
    object sdsBaixa_ParcialQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsBaixa_ParcialID_FUNCIONARIO_ENT: TIntegerField
      FieldName = 'ID_FUNCIONARIO_ENT'
    end
    object sdsBaixa_ParcialID_FUNCIONARIO_BAIXA: TIntegerField
      FieldName = 'ID_FUNCIONARIO_BAIXA'
    end
    object sdsBaixa_ParcialID_ESTOQUE: TIntegerField
      FieldName = 'ID_ESTOQUE'
    end
    object sdsBaixa_ParcialQTD_FATURADA: TFloatField
      FieldName = 'QTD_FATURADA'
    end
    object sdsBaixa_ParcialQTD_RESTANTE_FAT: TFloatField
      FieldName = 'QTD_RESTANTE_FAT'
    end
  end
  object dspBaixa_Parcial: TDataSetProvider
    DataSet = sdsBaixa_Parcial
    UpdateMode = upWhereKeyOnly
    Left = 192
    Top = 216
  end
  object cdsBaixa_Parcial: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID;ITEM;ITEM_PARCIAL'
    Params = <>
    ProviderName = 'dspBaixa_Parcial'
    OnCalcFields = cdsBaixa_ProcessoCalcFields
    Left = 248
    Top = 216
    object cdsBaixa_ParcialID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsBaixa_ParcialITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsBaixa_ParcialITEM_PARCIAL: TIntegerField
      FieldName = 'ITEM_PARCIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsBaixa_ParcialID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object cdsBaixa_ParcialDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object cdsBaixa_ParcialHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object cdsBaixa_ParcialDTSAIDA: TDateField
      FieldName = 'DTSAIDA'
    end
    object cdsBaixa_ParcialHRSAIDA: TTimeField
      FieldName = 'HRSAIDA'
    end
    object cdsBaixa_ParcialQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsBaixa_ParcialID_FUNCIONARIO_ENT: TIntegerField
      FieldName = 'ID_FUNCIONARIO_ENT'
    end
    object cdsBaixa_ParcialID_FUNCIONARIO_BAIXA: TIntegerField
      FieldName = 'ID_FUNCIONARIO_BAIXA'
    end
    object cdsBaixa_ParcialID_ESTOQUE: TIntegerField
      FieldName = 'ID_ESTOQUE'
    end
    object cdsBaixa_ParcialQTD_FATURADA: TFloatField
      FieldName = 'QTD_FATURADA'
    end
    object cdsBaixa_ParcialQTD_RESTANTE_FAT: TFloatField
      FieldName = 'QTD_RESTANTE_FAT'
    end
  end
  object dsBaixa_Parcial: TDataSource
    DataSet = cdsBaixa_Parcial
    Left = 296
    Top = 216
  end
  object qProximoItemParcial: TSQLQuery
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
      'SELECT max(item_parcial) item_parcial'
      'FROM baixa_parcial'
      'where ID = :ID'
      '  and ITEM = :ITEM')
    SQLConnection = dmDatabase.scoDados
    Left = 392
    Top = 472
    object qProximoItemParcialITEM_PARCIAL: TIntegerField
      FieldName = 'ITEM_PARCIAL'
    end
  end
  object qVerProcesso: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_ORDEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_LOTE'
        ParamType = ptInput
      end
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
        Name = 'ID_PROCESSO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT FIRST 1  B.ID_PROCESSO, B.item, B.qtd'
      'FROM BAIXA_PROCESSO B'
      'WHERE B.num_ordem = :NUM_ORDEM'
      
        '  AND ((B.id_lote = :ID_LOTE) or ((B.id_pedido = :ID_PEDIDO) AND' +
        ' (B.ITEM_PEDIDO = :ITEM_PEDIDO)))'
      '  AND B.ID_PROCESSO = :ID_PROCESSO'
      '  AND B.qtd_pendente > 0'
      'ORDER BY B.ITEM DESC')
    SQLConnection = dmDatabase.scoDados
    Left = 680
    Top = 496
    object qVerProcessoID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object qVerProcessoITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object qVerProcessoQTD: TFloatField
      FieldName = 'QTD'
    end
  end
  object qParametros_Usuario: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'USUARIO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT MOSTRAR_CONS_ETIQ, coalesce(LIBERA_TALAO_ANT,'#39'N'#39') LIBERA_' +
        'TALAO_ANT'
      'FROM PARAMETROS_USUARIO'
      'WHERE USUARIO = :USUARIO')
    SQLConnection = dmDatabase.scoDados
    Left = 512
    Top = 112
    object qParametros_UsuarioMOSTRAR_CONS_ETIQ: TStringField
      FieldName = 'MOSTRAR_CONS_ETIQ'
      FixedChar = True
      Size = 1
    end
    object qParametros_UsuarioLIBERA_TALAO_ANT: TStringField
      FieldName = 'LIBERA_TALAO_ANT'
      FixedChar = True
      Size = 1
    end
  end
  object dsConsBaixaEtiq: TDataSource
    DataSet = cdsConsBaixaEtiq
    Left = 264
    Top = 493
  end
  object cdsConsBaixaEtiq: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsBaixaEtiq'
    Left = 216
    Top = 492
    object cdsConsBaixaEtiqCODBARRA: TStringField
      FieldName = 'CODBARRA'
      Size = 14
    end
    object cdsConsBaixaEtiqDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object cdsConsBaixaEtiqHRBAIXA: TTimeField
      FieldName = 'HRBAIXA'
    end
    object cdsConsBaixaEtiqUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
  end
  object dspConsBaixaEtiq: TDataSetProvider
    DataSet = sdsConsBaixaEtiq
    Left = 176
    Top = 493
  end
  object sdsConsBaixaEtiq: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT P.codbarra, P.dtbaixa, P.hrbaixa, P.USUARIO'#13#10'FROM PEDIDO_' +
      'TALAO P'#13#10'WHERE P.DTBAIXA >= :DATA'#13#10'ORDER BY P.DTBAIXA, P.HRBAIXA' +
      #13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 136
    Top = 493
  end
  object qProd: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT P.ID, P.NOME, P.preco_custo'
      'FROM PRODUTO P'
      'WHERE P.ID = :ID')
    SQLConnection = dmDatabase.scoDados
    Left = 448
    Top = 192
    object qProdID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qProdNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object qProdPRECO_CUSTO: TFloatField
      FieldName = 'PRECO_CUSTO'
    end
  end
  object qTingimento: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 552
    Top = 488
  end
  object qVerAnt: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_ORDEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ITEM'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT count(1) contador'
      'FROM baixa_processo B'
      'WHERE B.NUM_ORDEM = :NUM_ORDEM'
      ' AND B.ITEM < :ITEM'
      ' AND (B.dtbaixa IS NULL) AND (B.qtd_produzido <= 0)')
    SQLConnection = dmDatabase.scoDados
    Left = 792
    Top = 496
    object qVerAntCONTADOR: TIntegerField
      FieldName = 'CONTADOR'
      Required = True
    end
  end
  object sdsFuncionario: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT F.CODIGO, F.NOME, F.SENHA, F.NUM_CARTAO'#13#10'FROM FUNCIONARIO' +
      ' F'#13#10'WHERE F.NUM_CARTAO = :NUM_CARTAO'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_CARTAO'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 336
    Top = 24
    object sdsFuncionarioCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsFuncionarioNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object sdsFuncionarioSENHA: TStringField
      FieldName = 'SENHA'
      Size = 15
    end
    object sdsFuncionarioNUM_CARTAO: TIntegerField
      FieldName = 'NUM_CARTAO'
    end
  end
  object dspFuncionario: TDataSetProvider
    DataSet = sdsFuncionario
    UpdateMode = upWhereKeyOnly
    Left = 384
    Top = 24
  end
  object cdsFuncionario: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'CODIGO'
    Params = <>
    ProviderName = 'dspFuncionario'
    Left = 424
    Top = 23
    object cdsFuncionarioCODIGO: TIntegerField
      FieldName = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsFuncionarioNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object cdsFuncionarioSENHA: TStringField
      FieldName = 'SENHA'
      Size = 15
    end
    object cdsFuncionarioNUM_CARTAO: TIntegerField
      FieldName = 'NUM_CARTAO'
    end
  end
end
