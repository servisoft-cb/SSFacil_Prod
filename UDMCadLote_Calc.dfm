object DMCadLote_Calc: TDMCadLote_Calc
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 20
  Top = 4
  Height = 715
  Width = 1313
  object sdsLote: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM LOTE'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 56
    Top = 8
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
    object sdsLoteCAIXINHA: TStringField
      FieldName = 'CAIXINHA'
      Size = 30
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
    OnUpdateError = dspLoteUpdateError
    Left = 88
    Top = 8
  end
  object cdsLote: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspLote'
    OnNewRecord = cdsLoteNewRecord
    Left = 119
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
    object cdsLoteENCERADO: TStringField
      FieldName = 'ENCERADO'
      Size = 1
    end
    object cdsLotesdsTalao: TDataSetField
      FieldName = 'sdsTalao'
    end
    object cdsLotesdsLote_Ped_Calc: TDataSetField
      FieldName = 'sdsLote_Ped_Calc'
    end
    object cdsLoteNUM_REMESSA: TStringField
      FieldName = 'NUM_REMESSA'
      Size = 15
    end
    object cdsLoteCAIXINHA: TStringField
      FieldName = 'CAIXINHA'
      Size = 30
    end
    object cdsLotePROCESSO_BAIXADO: TStringField
      FieldName = 'PROCESSO_BAIXADO'
      FixedChar = True
      Size = 1
    end
  end
  object dsLote: TDataSource
    DataSet = cdsLote
    Left = 151
    Top = 8
  end
  object dsLote_Mestre: TDataSource
    DataSet = sdsLote
    Left = 56
    Top = 48
  end
  object qProximo_Lote: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT MAX(NUM_LOTE) NUM_LOTE'
      'FROM LOTE')
    SQLConnection = dmDatabase.scoDados
    Left = 840
    Top = 80
    object qProximo_LoteNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
  end
  object sdsPendente: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT PED.NUM_PEDIDO, PED.PEDIDO_CLIENTE, PED.ID_CLIENTE, PED.D' +
      'TEMISSAO, PED.ID, PED.FILIAL,'#13#10'PI.item, PI.id_produto, PI.id_cor' +
      ',  PI.tamanho, PI.dtentrega, PI.numos,'#13#10'PI.nomeproduto, PI.refer' +
      'encia, CLI.nome NOME_CLIENTE, CLI.fantasia, PI.CARIMBO,'#13#10'COMB.NO' +
      'ME NOME_COMBINACAO, PI.item_original, PI.selecionado, PROD.id_co' +
      'r ID_COR_PROD,'#13#10'COR.NOME NOME_COR_PROD, PROD.TIPO_MAT, PROD.id_p' +
      'rocesso_grupo,'#13#10'PROD.tipo_reg TIPO_REG_PROD, SEMI.id_material1 I' +
      'D_MATERIAL, SEMI.qtd_consumo1 QTD_CONSUMO_MAT,'#13#10'SEMI.unidade1 UN' +
      'IDADE_MAT, PROD.ID_FORMA, PI.ENCERADO,'#13#10'CASE'#13#10'  WHEN (PI.unidade' +
      '_prod IS not NULL) AND (PI.unidade_prod <> PI.unidade) THEN PI.Q' +
      'TD * COALESCE(PI.CONV_UNIDADE,1)'#13#10'  ELSE PI.QTD'#13#10'  END QTD_RESTA' +
      'NTE,'#13#10'CASE'#13#10'  WHEN (PI.unidade_prod IS not NULL) AND (PI.unidade' +
      '_prod <> PI.unidade) THEN PI.UNIDADE_PROD'#13#10'  ELSE PI.UNIDADE'#13#10'  ' +
      'END UNIDADE,'#13#10'CASE'#13#10'  WHEN (PI.unidade_prod IS not NULL) AND (PI' +
      '.unidade_prod <> PI.unidade) THEN ((PI.QTD * COALESCE(PI.CONV_UN' +
      'IDADE,1)) *  COALESCE(SEMI.qtd_consumo1,1))'#13#10'  ELSE coalesce(sem' +
      'i.qtd_consumo1,1) * pi.qtd'#13#10'  END consumo_calc, PSEMI.id_process' +
      'o_grupo id_processo_SEMI, G.nome NOME_GRUPO,'#13#10'G.TIPO_PROD TIPO_G' +
      'RUPO, G.CODIGO COD_GRUPO, PI.CAIXINHA'#13#10#13#10'FROM PEDIDO PED'#13#10'INNER ' +
      'JOIN PEDIDO_ITEM PI'#13#10'ON PED.ID = PI.ID'#13#10'INNER JOIN PESSOA CLI'#13#10'O' +
      'N PED.ID_CLIENTE = CLI.codigo'#13#10'LEFT JOIN COMBINACAO COMB'#13#10'ON PI.' +
      'ID_COR = COMB.ID'#13#10'LEFT JOIN PRODUTO PROD'#13#10'ON PI.id_produto = PRO' +
      'D.ID'#13#10'LEFT JOIN COR'#13#10'ON PROD.ID_COR = COR.ID'#13#10'LEFT JOIN PRODUTO_' +
      'SEMI SEMI'#13#10'ON PROD.ID = SEMI.ID'#13#10'LEFT JOIN PRODUTO PSEMI'#13#10'ON PSE' +
      'MI.ID = SEMI.ID_MATERIAL1'#13#10'LEFT JOIN GRUPO G'#13#10'ON PROD.ID_GRUPO =' +
      ' G.ID'#13#10'WHERE PED.TIPO_REG = '#39'P'#39#13#10'  AND PI.GERAR_LOTE = '#39'S'#39#13#10#13#10#13#10 +
      #13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 56
    Top = 456
  end
  object dspPendente: TDataSetProvider
    DataSet = sdsPendente
    Left = 88
    Top = 456
  end
  object cdsPendente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPendente'
    Left = 120
    Top = 456
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
    object cdsPendenteNOME_GRUPO: TStringField
      FieldName = 'NOME_GRUPO'
      Size = 40
    end
    object cdsPendenteTIPO_GRUPO: TStringField
      FieldName = 'TIPO_GRUPO'
      FixedChar = True
      Size = 1
    end
    object cdsPendenteCOD_GRUPO: TStringField
      FieldName = 'COD_GRUPO'
    end
    object cdsPendenteCAIXINHA: TStringField
      FieldName = 'CAIXINHA'
      Size = 30
    end
  end
  object dsPendente: TDataSource
    DataSet = cdsPendente
    Left = 152
    Top = 456
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
    Left = 56
    Top = 568
  end
  object dspConsulta_Lote: TDataSetProvider
    DataSet = sdsConsulta_Lote
    Left = 88
    Top = 568
  end
  object cdsConsulta_Lote: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta_Lote'
    Left = 120
    Top = 568
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
    Left = 152
    Top = 568
  end
  object sdsProduto: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT PRO.*, PCP.cavidade_molde, PCP.cavidade_peca, PCP.ciclo, ' +
      'PCP.qtd_talao, PCP.tempo_troca_matriz, PCP.tempo_troca_cor'#13#10'FROM' +
      ' PRODUTO PRO'#13#10'LEFT JOIN PRODUTO_PCP PCP'#13#10'ON PRO.id = PCP.ID'#13#10'WHE' +
      'RE ((PRO.TIPO_REG = '#39'P'#39') or (PRO.TIPO_REG = '#39'S'#39'))'#13#10'    AND PRO.I' +
      'NATIVO = '#39'N'#39#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 56
    Top = 616
  end
  object dspProduto: TDataSetProvider
    DataSet = sdsProduto
    Left = 88
    Top = 616
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspProduto'
    Left = 120
    Top = 616
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
  end
  object dsProduto: TDataSource
    DataSet = cdsProduto
    Left = 152
    Top = 616
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
    IndexFieldNames = 'Num_Lote;Num_Talao'
    Params = <>
    StoreDefs = True
    Left = 992
    Top = 320
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
        Name = 'Tamanho'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Qtd'
        DataType = ftFloat
      end
      item
        Name = 'Num_Remessa'
        DataType = ftString
        Size = 15
      end>
    IndexDefs = <>
    IndexFieldNames = 'Num_Lote;Num_Talao'
    MasterFields = 'Num_Lote;Num_Talao'
    MasterSource = dsmLote
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 992
    Top = 368
    Data = {
      850000009619E0BD0100000018000000050000000000030000008500084E756D
      5F4C6F74650400010000000000094E756D5F54616C616F040001000000000007
      54616D616E686F0100490000000100055749445448020002000A000351746408
      000400000000000B4E756D5F52656D6573736101004900000001000557494454
      48020002000F000000}
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
    object mTalaoNum_Remessa: TStringField
      FieldName = 'Num_Remessa'
      Size = 15
    end
  end
  object dsmLote: TDataSource
    DataSet = mLote
    Left = 1024
    Top = 320
  end
  object dsmTalao: TDataSource
    DataSet = mTalao
    Left = 1026
    Top = 368
  end
  object qProxima_Ordem: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT MAX(NUM_ORDEM) NUM_ORDEM'
      'FROM LOTE')
    SQLConnection = dmDatabase.scoDados
    Left = 712
    Top = 80
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
      'AND B.NUM_ORDEM = :NUM_ORDEM')
    SQLConnection = dmDatabase.scoDados
    Left = 712
    Top = 192
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
    Left = 256
    Top = 272
  end
  object dspProduto_Consumo: TDataSetProvider
    DataSet = sdsProduto_Consumo
    Left = 288
    Top = 272
  end
  object cdsProduto_Consumo: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'ID_SETOR;ITEM'
    Params = <>
    ProviderName = 'dspProduto_Consumo'
    Left = 320
    Top = 272
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
    object cdsProduto_ConsumoID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
    end
  end
  object dsProduto_Consumo: TDataSource
    DataSet = cdsProduto_Consumo
    Left = 352
    Top = 272
  end
  object qParametros: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT *'
      'FROM PARAMETROS')
    SQLConnection = dmDatabase.scoDados
    Left = 704
    Top = 16
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
    object qParametrosUSA_APROVACAO_PED: TStringField
      FieldName = 'USA_APROVACAO_PED'
      FixedChar = True
      Size = 1
    end
  end
  object mTamanho: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'Tamanho'
    Params = <>
    Left = 993
    Top = 224
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
    Left = 1025
    Top = 224
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
    Left = 743
    Top = 136
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
    Left = 776
    Top = 136
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
    Left = 840
    Top = 136
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
    Left = 61
    Top = 348
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
    object sdsLote_MatID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
    end
  end
  object dspLote_Mat: TDataSetProvider
    DataSet = sdsLote_Mat
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspLoteUpdateError
    Left = 93
    Top = 348
  end
  object cdsLote_Mat: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NUM_ORDEM;ITEM'
    Params = <>
    ProviderName = 'dspLote_Mat'
    OnNewRecord = cdsLote_MatNewRecord
    Left = 124
    Top = 348
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
    object cdsLote_MatID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
    end
  end
  object dsLote_Mat: TDataSource
    DataSet = cdsLote_Mat
    Left = 156
    Top = 348
  end
  object sdsConsumo: TSQLDataSet
    CommandText = 
      'SELECT PC.ID, PC.id_material, PC.qtd_consumo, PC.unidade,'#13#10'P.nom' +
      'e NOME_PRODUTO, P.REFERENCIA, MAT.nome NOME_MATERIAL, MAT.refere' +
      'ncia REFERENCIA_MAT, '#13#10'MAT.TIPO_REG TIPO_REG_MAT, MAT.ID_FORNECE' +
      'DOR, PC.IMP_TALAO, PC.tingimento, PC.id_cor,'#13#10'mat.id_material_cr' +
      'u'#13#10'FROM PRODUTO_COMB PCOMB'#13#10'INNER JOIN PRODUTO_COMB_MAT PC'#13#10'ON P' +
      'COMB.ID = PC.ID'#13#10'AND PCOMB.ITEM = PC.item'#13#10'INNER JOIN PRODUTO P'#13 +
      #10'ON PCOMB.ID = P.ID'#13#10'INNER JOIN PRODUTO MAT'#13#10'ON PC.id_material =' +
      ' MAT.ID'#13#10'WHERE PCOMB.ID = :ID_PRODUTO'#13#10'  and PCOMB.id_cor_combin' +
      'acao = :ID_COMBINACAO'#13#10
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
    Left = 248
    Top = 152
  end
  object dspConsumo: TDataSetProvider
    DataSet = sdsConsumo
    Left = 280
    Top = 152
  end
  object cdsConsumo: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_MATERIAL'
    Params = <>
    ProviderName = 'dspConsumo'
    Left = 312
    Top = 152
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
    Left = 744
    Top = 192
    object qVerificaExclusao2CONTADOR: TIntegerField
      FieldName = 'CONTADOR'
      Required = True
    end
  end
  object qParametros_Lote: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT *'
      'FROM PARAMETROS_LOTE')
    SQLConnection = dmDatabase.scoDados
    Left = 771
    Top = 14
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
    object qParametros_LoteGERAR_SETOR_MAT: TStringField
      FieldName = 'GERAR_SETOR_MAT'
      FixedChar = True
      Size = 1
    end
    object qParametros_LoteQTD_DIV_LOTE: TIntegerField
      FieldName = 'QTD_DIV_LOTE'
    end
    object qParametros_LoteUSA_MAT_COMB: TStringField
      FieldName = 'USA_MAT_COMB'
      FixedChar = True
      Size = 1
    end
    object qParametros_LoteUSA_REMESSA: TStringField
      FieldName = 'USA_REMESSA'
      FixedChar = True
      Size = 1
    end
    object qParametros_LoteUSA_LOTE_REM: TStringField
      FieldName = 'USA_LOTE_REM'
      FixedChar = True
      Size = 1
    end
    object qParametros_LoteIMP_TALAO_POR: TStringField
      FieldName = 'IMP_TALAO_POR'
      FixedChar = True
      Size = 1
    end
    object qParametros_LoteLOTE_CALCADO_NOVO: TStringField
      FieldName = 'LOTE_CALCADO_NOVO'
      FixedChar = True
      Size = 1
    end
    object qParametros_LoteTIPO_PROCESSO: TStringField
      FieldName = 'TIPO_PROCESSO'
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
    Left = 56
    Top = 512
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
    Left = 88
    Top = 512
  end
  object cdsPendente_Ped: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPendente_Ped'
    Left = 120
    Top = 512
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
    Left = 152
    Top = 512
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
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 992
    Top = 24
    Data = {
      130100009619E0BD01000000180000000A00000000000300000013010B49445F
      4D6174657269616C04000100000000000D4E6F6D655F4D6174657269616C0100
      490000000100055749445448020002003C000B5174645F436F6E73756D6F0800
      0400000000000E5265666572656E6369615F4D61740100490000000100055749
      44544802000200140007556E6964616465010049000000010005574944544802
      00020006000D49445F466F726E656365646F7204000100000000000649445F43
      6F7204000100000000000B5174645F50726F6475746F08000400000000000A54
      696E67696D656E746F01004900000001000557494454480200020001000F4944
      5F4D6174657269616C5F43727504000100000000000000}
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
  end
  object dsmMaterial: TDataSource
    DataSet = mMaterial
    Left = 1027
    Top = 24
  end
  object mMaterial_Tam: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'ID_Material;Tamanho'
    MasterFields = 'ID_Material'
    MasterSource = dsmMaterial
    PacketRecords = 0
    Params = <>
    Left = 992
    Top = 274
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
    Left = 1026
    Top = 274
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
      'SELECT QTD_TALAO'
      'FROM PRODUTO_PCP'
      'WHERE ID = :ID')
    SQLConnection = dmDatabase.scoDados
    Left = 808
    Top = 136
    object qProdQtdQTD_TALAO: TIntegerField
      FieldName = 'QTD_TALAO'
    end
  end
  object qParametros_Ped: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT *'
      'FROM PARAMETROS_PED'
      '')
    SQLConnection = dmDatabase.scoDados
    Left = 832
    Top = 16
    object qParametros_PedUSA_NUM_TALAO: TStringField
      FieldName = 'USA_NUM_TALAO'
      FixedChar = True
      Size = 1
    end
  end
  object qParametros_Geral: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT *'
      'FROM PARAMETROS_GERAL')
    SQLConnection = dmDatabase.scoDados
    Left = 802
    Top = 15
    object qParametros_GeralEMPRESA_CALCADOS: TStringField
      FieldName = 'EMPRESA_CALCADOS'
      FixedChar = True
      Size = 1
    end
  end
  object sdsSetor: TSQLDataSet
    CommandText = 'SELECT S.id, S.nome'#13#10'FROM SETOR S'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 256
    Top = 600
  end
  object dspSetor: TDataSetProvider
    DataSet = sdsSetor
    Left = 286
    Top = 600
  end
  object cdsSetor: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspSetor'
    Left = 321
    Top = 600
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
    Left = 354
    Top = 600
  end
  object sdsPedOriginal: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select i.id, i.item_original, SUM(coalesce(I.QTD_RESTANTE,0)) QT' +
      'D_RESTANTE,'#13#10'I.id_produto,  I.id_cor, I.dtentrega, I.carimbo, I.' +
      'REFERENCIA, i.caixinha'#13#10'from pedido_item i'#13#10'where i.ID = :ID'#13#10'GR' +
      'OUP BY I.ID, I.ITEM_ORIGINAL, I.id_produto,  I.id_cor, I.dtentre' +
      'ga, I.carimbo,'#13#10'I.REFERENCIA, i.caixinha'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 248
    Top = 88
  end
  object dspPedOriginal: TDataSetProvider
    DataSet = sdsPedOriginal
    Left = 280
    Top = 88
  end
  object cdsPedOriginal: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ITEM_ORIGINAL'
    Params = <>
    ProviderName = 'dspPedOriginal'
    Left = 312
    Top = 88
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
    object cdsPedOriginalID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsPedOriginalID_COR: TFMTBCDField
      FieldName = 'ID_COR'
      Precision = 15
      Size = 0
    end
    object cdsPedOriginalDTENTREGA: TDateField
      FieldName = 'DTENTREGA'
    end
    object cdsPedOriginalCARIMBO: TStringField
      FieldName = 'CARIMBO'
      Size = 25
    end
    object cdsPedOriginalREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsPedOriginalCAIXINHA: TStringField
      FieldName = 'CAIXINHA'
      Size = 30
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
    Left = 53
    Top = 292
    object sdsLote_Ped_CalcID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsLote_Ped_CalcID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object cdsLote_Ped_Calc: TClientDataSet
    Aggregates = <>
    DataSetField = cdsLotesdsLote_Ped_Calc
    IndexFieldNames = 'ID;ID_PEDIDO'
    Params = <>
    Left = 92
    Top = 292
    object cdsLote_Ped_CalcID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLote_Ped_CalcID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dLote_Ped_Calc: TDataSource
    DataSet = cdsLote_Ped_Calc
    Left = 124
    Top = 292
  end
  object sdsConsumoCalc: TSQLDataSet
    CommandText = 
      'SELECT P.id, P.referencia, P.nome NOME_PRODUTO, PB.id_cor_combin' +
      'acao, Mat.TIPO_REG TIPO_REG_MAT,'#13#10'    PB.nome NOME_COMBINACAO, P' +
      'MAT.id_material, PC.TIPO_CONSUMO, PC.qtd_consumo,'#13#10'    PC.ITEM I' +
      'TEM_CONSUMO, MAT.NOME NOME_MATERIAL, MAT.TRANSFER, MAT.ID_GRADE ' +
      'ID_GRADE_MAT,  MAT.ID_FORNECEDOR,'#13#10'    MAT.USA_CARIMBO_OC, PC.UN' +
      'IDADE, MAT.referencia REFERENCIA_MAT, PMAT.ID_COR ID_COR_MAT, CO' +
      'R.NOME NOME_COR,'#13#10'    PC.ID_SETOR, P.ID_GRADE ID_GRADE_PROD'#13#10'FRO' +
      'M PRODUTO P'#13#10'INNER JOIN PRODUTO_COMB PB'#13#10'ON P.id = pb.ID'#13#10'AND PB' +
      '.id_cor_combinacao = :ID_COMBINACAO'#13#10'INNER JOIN PRODUTO_COMB_MAT' +
      ' PMAT'#13#10'ON PB.ID = PMAT.ID'#13#10'AND PB.ITEM = PMAT.ITEM'#13#10'INNER JOIN P' +
      'RODUTO_CONSUMO PC'#13#10'ON PMAT.id = PC.id'#13#10'AND PMAT.id_material = PC' +
      '.ID_MATERIAL'#13#10'AND PMAT.id_posicao = PC.id_posicao'#13#10'LEFT JOIN PRO' +
      'DUTO MAT'#13#10'ON PC.id_material = MAT.id'#13#10'LEFT JOIN COMBINACAO COR'#13#10 +
      'ON PMAT.ID_COR = COR.ID'#13#10'WHERE P.TIPO_REG = '#39'P'#39#13#10'  and p.id = :I' +
      'D_PRODUTO'#13#10
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
    Left = 248
    Top = 216
  end
  object dspConsumoCalc: TDataSetProvider
    DataSet = sdsConsumoCalc
    Left = 280
    Top = 216
  end
  object cdsConsumoCalc: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_MATERIAL;ID_COR_MAT'
    Params = <>
    ProviderName = 'dspConsumoCalc'
    Left = 312
    Top = 216
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
    object cdsConsumoCalcID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
    end
    object cdsConsumoCalcID_GRADE_PROD: TIntegerField
      FieldName = 'ID_GRADE_PROD'
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
    Left = 809
    Top = 192
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
    Left = 248
    Top = 328
  end
  object dspPedido_Calc: TDataSetProvider
    DataSet = sdsPedido_Calc
    Left = 280
    Top = 328
  end
  object cdsPedido_Calc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPedido_Calc'
    Left = 312
    Top = 328
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
    Left = 344
    Top = 328
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
    Left = 743
    Top = 80
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
    Left = 808
    Top = 80
    object qProdutoFOTO: TStringField
      FieldName = 'FOTO'
      Size = 150
    end
  end
  object mAcum: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ID_Produto'
        DataType = ftInteger
      end
      item
        Name = 'ID_Combinacao'
        DataType = ftInteger
      end
      item
        Name = 'ID_Pedido'
        DataType = ftInteger
      end
      item
        Name = 'ID_Cliente'
        DataType = ftInteger
      end
      item
        Name = 'DtEntrega'
        DataType = ftDate
      end
      item
        Name = 'Qtd'
        DataType = ftInteger
      end
      item
        Name = 'Item_Original'
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
        Name = 'Referencia'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Caixinha'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'ID_PRODUTO;ID_COMBINACAO;TAMANHO'
    Params = <>
    StoreDefs = True
    OnNewRecord = mAcumNewRecord
    Left = 989
    Top = 76
    Data = {
      310100009619E0BD01000000180000000C000000000003000000310102494404
      000100000000000A49445F50726F6475746F04000100000000000D49445F436F
      6D62696E6163616F04000100000000000949445F50656469646F040001000000
      00000A49445F436C69656E74650400010000000000094474456E747265676104
      000600000000000351746404000100000000000D4974656D5F4F726967696E61
      6C04000100000000000754616D616E686F010049000000010005574944544802
      0002000A0007436172696D626F01004900000001000557494454480200020019
      000A5265666572656E6369610100490000000100055749445448020002001400
      0843616978696E68610100490000000100055749445448020002001E0001000D
      44454641554C545F4F524445520200820000000000}
    object mAcumID: TIntegerField
      FieldName = 'ID'
    end
    object mAcumID_Produto: TIntegerField
      FieldName = 'ID_Produto'
    end
    object mAcumID_Combinacao: TIntegerField
      FieldName = 'ID_Combinacao'
    end
    object mAcumID_Pedido: TIntegerField
      FieldName = 'ID_Pedido'
    end
    object mAcumID_Cliente: TIntegerField
      FieldName = 'ID_Cliente'
    end
    object mAcumDtEntrega: TDateField
      FieldName = 'DtEntrega'
    end
    object mAcumQtd: TIntegerField
      FieldName = 'Qtd'
    end
    object mAcumItem_Original: TIntegerField
      FieldName = 'Item_Original'
    end
    object mAcumTamanho: TStringField
      FieldName = 'Tamanho'
      Size = 10
    end
    object mAcumCarimbo: TStringField
      FieldName = 'Carimbo'
      Size = 25
    end
    object mAcumReferencia: TStringField
      FieldName = 'Referencia'
    end
    object mAcumCaixinha: TStringField
      FieldName = 'Caixinha'
      Size = 30
    end
  end
  object mAcum_Ped: TClientDataSet
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
        Name = 'Item_Pedido'
        DataType = ftInteger
      end
      item
        Name = 'Qtd'
        DataType = ftInteger
      end
      item
        Name = 'Tamanho'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'ID;Tamanho;ID_Pedido;Item_Pedido'
    MasterFields = 'ID;Tamanho'
    MasterSource = dsmAcum_Tam
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 993
    Top = 172
    Data = {
      730000009619E0BD010000001800000005000000000003000000730002494404
      000100000000000949445F50656469646F04000100000000000B4974656D5F50
      656469646F04000100000000000351746404000100000000000754616D616E68
      6F0100490000000100055749445448020002000A000000}
    object mAcum_PedID: TIntegerField
      FieldName = 'ID'
    end
    object mAcum_PedID_Pedido: TIntegerField
      FieldName = 'ID_Pedido'
    end
    object mAcum_PedItem_Pedido: TIntegerField
      FieldName = 'Item_Pedido'
    end
    object mAcum_PedQtd: TIntegerField
      FieldName = 'Qtd'
    end
    object mAcum_PedTamanho: TStringField
      FieldName = 'Tamanho'
      Size = 10
    end
  end
  object dsmAcum: TDataSource
    DataSet = mAcum
    Left = 1023
    Top = 76
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
    Left = 56
    Top = 88
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
    Left = 96
    Top = 88
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
    object cdsTalaosdsTalao_Ped: TDataSetField
      FieldName = 'sdsTalao_Ped'
    end
    object cdsTalaosdsTalao_Setor: TDataSetField
      FieldName = 'sdsTalao_Setor'
    end
  end
  object dsTalao: TDataSource
    DataSet = cdsTalao
    Left = 136
    Top = 88
  end
  object dsTalao_Mestre: TDataSource
    DataSet = sdsTalao
    Left = 56
    Top = 133
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
    Left = 56
    Top = 176
    object sdsTalao_PedID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsTalao_PedNUM_TALAO: TIntegerField
      FieldName = 'NUM_TALAO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsTalao_PedID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsTalao_PedITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
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
    Left = 96
    Top = 176
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
    Left = 128
    Top = 176
  end
  object dsmAcum_Ped: TDataSource
    DataSet = mAcum_Ped
    Left = 1027
    Top = 172
  end
  object mAcum_Tam: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'ID;Tamanho'
    MasterFields = 'ID'
    MasterSource = dsmAcum
    PacketRecords = 0
    Params = <>
    Left = 993
    Top = 124
    Data = {
      4D0000009619E0BD0100000018000000030000000000030000004D0002494404
      000100000000000754616D616E686F0100490000000100055749445448020002
      000A000351746404000100000000000000}
    object mAcum_TamID: TIntegerField
      FieldName = 'ID'
    end
    object mAcum_TamTamanho: TStringField
      FieldName = 'Tamanho'
      Size = 10
    end
    object mAcum_TamQtd: TIntegerField
      FieldName = 'Qtd'
    end
  end
  object dsmAcum_Tam: TDataSource
    DataSet = mAcum_Tam
    Left = 1025
    Top = 124
  end
  object mProduto_Consumo: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'ITEM'
        DataType = ftInteger
      end
      item
        Name = 'ID_MATERIAL'
        DataType = ftInteger
      end
      item
        Name = 'QTD_CONSUMO'
        DataType = ftFloat
      end
      item
        Name = 'QTD_UNIDADE'
        DataType = ftFloat
      end
      item
        Name = 'UNIDADE'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'ID_POSICAO'
        DataType = ftInteger
      end
      item
        Name = 'TIPO_CONSUMO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NOME_MATERIAL'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ID_GRADE'
        DataType = ftInteger
      end
      item
        Name = 'REF_MATERIAL'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'IMP_ROTULO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IMP_TALAO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IMP_TALAO_POS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NOME_POSICAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IMP_MATERIAL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'IMP_AGRUPADO_MATERIAL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NOME_COR'
        DataType = ftString
        Size = 45
      end
      item
        Name = 'ID_COR'
        DataType = ftInteger
      end
      item
        Name = 'ID_SETOR'
        DataType = ftInteger
      end
      item
        Name = 'ORDEM_RELATORIO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'IMP_SUBLINHADO'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'mProduto_ConsumoIndex4'
        Fields = 'ORDEM_RELATORIO'
      end>
    IndexFieldNames = 'ORDEM_RELATORIO'
    MasterFields = 'ID_Produto'
    MasterSource = dsmLote
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 992
    Top = 424
    Data = {
      610200009619E0BD010000001800000016000000000003000000610202494404
      00010000000000044954454D04000100000000000B49445F4D4154455249414C
      04000100000000000B5154445F434F4E53554D4F08000400000000000B515444
      5F554E4944414445080004000000000007554E49444144450100490000000100
      0557494454480200020006000A49445F504F534943414F04000100000000000C
      5449504F5F434F4E53554D4F0100490000000100055749445448020002000100
      0D4E4F4D455F4D4154455249414C010049000000010005574944544802000200
      64000849445F475241444504000100000000000C5245465F4D4154455249414C
      01004900000001000557494454480200020014000A494D505F524F54554C4F01
      0049000000010005574944544802000200010009494D505F54414C414F010049
      00000001000557494454480200020001000D494D505F54414C414F5F504F5301
      004900000001000557494454480200020001000C4E4F4D455F504F534943414F
      0100490000000100055749445448020002001E000C494D505F4D415445524941
      4C010049000000010005574944544802000200010015494D505F414752555041
      444F5F4D4154455249414C010049000000010005574944544802000200010008
      4E4F4D455F434F520100490000000100055749445448020002002D000649445F
      434F5204000100000000000849445F5345544F5204000100000000000F4F5244
      454D5F52454C41544F52494F0100490000000100055749445448020002000A00
      0E494D505F5355424C494E4841444F0100490000000100055749445448020002
      0001000000}
    object mProduto_ConsumoID: TIntegerField
      FieldName = 'ID'
    end
    object mProduto_ConsumoITEM: TIntegerField
      FieldName = 'ITEM'
    end
    object mProduto_ConsumoID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object mProduto_ConsumoQTD_CONSUMO: TFloatField
      FieldName = 'QTD_CONSUMO'
    end
    object mProduto_ConsumoQTD_UNIDADE: TFloatField
      FieldName = 'QTD_UNIDADE'
    end
    object mProduto_ConsumoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object mProduto_ConsumoID_POSICAO: TIntegerField
      FieldName = 'ID_POSICAO'
    end
    object mProduto_ConsumoTIPO_CONSUMO: TStringField
      DisplayWidth = 1
      FieldName = 'TIPO_CONSUMO'
      Size = 1
    end
    object mProduto_ConsumoNOME_MATERIAL: TStringField
      FieldName = 'NOME_MATERIAL'
      Size = 100
    end
    object mProduto_ConsumoID_GRADE: TIntegerField
      FieldName = 'ID_GRADE'
    end
    object mProduto_ConsumoREF_MATERIAL: TStringField
      FieldName = 'REF_MATERIAL'
    end
    object mProduto_ConsumoIMP_ROTULO: TStringField
      FieldName = 'IMP_ROTULO'
      Size = 1
    end
    object mProduto_ConsumoIMP_TALAO: TStringField
      FieldName = 'IMP_TALAO'
      Size = 1
    end
    object mProduto_ConsumoIMP_TALAO_POS: TStringField
      FieldName = 'IMP_TALAO_POS'
      Size = 1
    end
    object mProduto_ConsumoNOME_POSICAO: TStringField
      FieldName = 'NOME_POSICAO'
      Size = 30
    end
    object mProduto_ConsumoIMP_MATERIAL: TStringField
      FieldName = 'IMP_MATERIAL'
      Size = 1
    end
    object mProduto_ConsumoIMP_AGRUPADO_MATERIAL: TStringField
      FieldName = 'IMP_AGRUPADO_MATERIAL'
      Size = 1
    end
    object mProduto_ConsumoNOME_COR: TStringField
      FieldName = 'NOME_COR'
      Size = 45
    end
    object mProduto_ConsumoID_COR: TIntegerField
      FieldName = 'ID_COR'
    end
    object mProduto_ConsumoID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
    end
    object mProduto_ConsumoORDEM_RELATORIO: TStringField
      FieldName = 'ORDEM_RELATORIO'
      Size = 10
    end
    object mProduto_ConsumoIMP_SUBLINHADO: TStringField
      FieldName = 'IMP_SUBLINHADO'
      Size = 1
    end
  end
  object mdsProduto_Consumo: TDataSource
    DataSet = mProduto_Consumo
    Left = 1028
    Top = 423
  end
  object sdsTalao_Setor: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT *'#13#10'FROM TALAO_SETOR'#13#10'WHERE ID = :ID'#13#10'  AND NUM_TALAO = :N' +
      'UM_TALAO'
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
    Left = 56
    Top = 238
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
    object sdsTalao_SetorQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
    end
    object sdsTalao_SetorQTD_PENDENTE: TFloatField
      FieldName = 'QTD_PENDENTE'
    end
  end
  object cdsTalao_Setor: TClientDataSet
    Aggregates = <>
    DataSetField = cdsTalaosdsTalao_Setor
    IndexFieldNames = 'ID;NUM_TALAO;ITEM'
    Params = <>
    OnNewRecord = cdsTalao_SetorNewRecord
    Left = 96
    Top = 238
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
    object cdsTalao_SetorQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
    end
    object cdsTalao_SetorQTD_PENDENTE: TFloatField
      FieldName = 'QTD_PENDENTE'
    end
  end
  object dsTalao_Setor: TDataSource
    DataSet = cdsTalao_Setor
    Left = 128
    Top = 238
  end
  object sdsSetor_Talao: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT S.ID, S.NOME, S.GERAR_TALAO, S.ORDEM_ORC'#13#10'FROM SETOR S'#13#10'W' +
      'HERE S.GERAR_TALAO = '#39'S'#39#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 432
    Top = 16
  end
  object dspSetor_Talao: TDataSetProvider
    DataSet = sdsSetor_Talao
    Left = 464
    Top = 16
  end
  object cdsSetor_Talao: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ORDEM_ORC'
    Params = <>
    ProviderName = 'dspSetor_Talao'
    Left = 495
    Top = 16
    object cdsSetor_TalaoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsSetor_TalaoNOME: TStringField
      FieldName = 'NOME'
    end
    object cdsSetor_TalaoGERAR_TALAO: TStringField
      FieldName = 'GERAR_TALAO'
      FixedChar = True
      Size = 1
    end
    object cdsSetor_TalaoORDEM_ORC: TIntegerField
      FieldName = 'ORDEM_ORC'
    end
  end
  object qVerificaExclusao3: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'NUM_REMESSA'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT COUNT(1) CONTADOR'
      'FROM talao_setor B'
      'inner join lote l'
      'on b.id = l.id'
      'WHERE ((B.dtentrada IS NOT NULL) or (B.dtsaida IS NOT NULL))'
      'AND l.num_remessa = :NUM_REMESSA')
    SQLConnection = dmDatabase.scoDados
    Left = 776
    Top = 192
    object qVerificaExclusao3CONTADOR: TIntegerField
      FieldName = 'CONTADOR'
      Required = True
    end
  end
  object qUltRemessa: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT L.NUM_REMESSA'
      'FROM LOTE L'
      'WHERE ID = (SELECT MAX(ID) FROM LOTE)')
    SQLConnection = dmDatabase.scoDados
    Left = 776
    Top = 80
    object qUltRemessaNUM_REMESSA: TStringField
      FieldName = 'NUM_REMESSA'
      Size = 15
    end
  end
  object sdsBusca_Ped: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT DISTINCT TP.id, TP.id_pedido, PED.num_pedido, PED.pedido_' +
      'cliente'#13#10'FROM TALAO_PED TP'#13#10'INNER JOIN PEDIDO PED'#13#10'ON TP.ID_PEDI' +
      'DO = PED.ID'#13#10'WHERE TP.ID = :ID'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 256
    Top = 448
  end
  object dspBusca_Ped: TDataSetProvider
    DataSet = sdsBusca_Ped
    Left = 286
    Top = 448
  end
  object cdsBusca_Ped: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBusca_Ped'
    Left = 319
    Top = 448
    object cdsBusca_PedID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsBusca_PedID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
      Required = True
    end
    object cdsBusca_PedNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object cdsBusca_PedPEDIDO_CLIENTE: TStringField
      FieldName = 'PEDIDO_CLIENTE'
    end
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
    ReportOptions.CreateDate = 43159.436197395800000000
    ReportOptions.LastChange = 43249.344436307900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 704
    Top = 368
    Datasets = <
      item
        DataSet = frxLote_Bol
        DataSetName = 'frxLote_Bol'
      end
      item
        DataSet = frxTalao_Setor_Bol
        DataSetName = 'frxTalao_Setor_Bol'
      end
      item
        DataSet = frxProduto_Comb_Mat
        DataSetName = 'Produto_Comb_Mat'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 7.000000000000000000
      RightMargin = 7.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 10.000000000000000000
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Height = 276.661424650000000000
        Top = 317.480520000000000000
        Width = 740.787880000000000000
        DataSet = frxTalao_Setor_Bol
        DataSetName = 'frxTalao_Setor_Bol'
        PrintIfDetailEmpty = True
        RowCount = 0
        object Subreport2: TfrxSubreport
          Left = 2.000000000000000000
          Top = 0.377952755905512000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Page = frxReport1.Page3
        end
        object Memo11: TfrxMemoView
          Left = 642.520100000000000000
          Top = 258.669450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            '.')
        end
      end
      object MasterData2: TfrxMasterData
        FillType = ftBrush
        Height = 151.181200000000000000
        Top = 18.897650000000000000
        Width = 740.787880000000000000
        DataSet = frxLote_Bol
        DataSetName = 'frxLote_Bol'
        RowCount = 0
        object Shape2: TfrxShapeView
          Left = 2.000000000000000000
          Top = 8.779530000000000000
          Width = 143.622140000000000000
          Height = 41.574830000000000000
        end
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 11.779530000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'Remessa:')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 30.677180000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'Lote:')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 3.779530000000000000
          Top = 53.133890000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'Modelo:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 3.779530000000000000
          Top = 72.031540000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'Produto:')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 3.779530000000000000
          Top = 90.929190000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'Obs Ped:')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 3.779530000000000000
          Top = 128.724490000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'Cliente:')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 71.811070000000000000
          Top = 11.779530000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxLote_Bol."NUM_REMESSA"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 71.811070000000000000
          Top = 30.677180000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxLote_Bol."NUM_LOTE"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 86.929190000000000000
          Top = 53.133890000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxLote_Bol."REFERENCIA"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 86.929190000000000000
          Top = 72.031540000000000000
          Width = 544.252320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' [frxLote_Bol."OBSMATERIAL"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Memo24: TfrxMemoView
          Left = 86.929190000000000000
          Top = 90.929190000000000000
          Width = 544.252320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxLote_Bol."OBS_PED"]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 86.929190000000000000
          Top = 128.724490000000000000
          Width = 506.457020000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxLote_Bol."NOME_CLIENTE"]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 158.740260000000000000
          Top = 30.677180000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'Tal'#195#163'o:')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 226.771800000000000000
          Top = 30.677180000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxLote_Bol."NUM_TALAO"]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 457.323130000000000000
          Top = 11.779530000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxLote_Bol."NUM_LOTE"] / [frxLote_Bol."NUM_LOTE_MAX"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 532.913730000000000000
          Top = 11.779530000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'Pedido:')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 584.827150000000000000
          Top = 11.779530000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxLote_Bol."PEDIDO_CLIENTE"]')
          ParentFont = False
        end
        object Picture1: TfrxPictureView
          Left = 639.740570000000000000
          Top = 35.015770000000000000
          Width = 117.165430000000000000
          Height = 86.929190000000000000
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo31: TfrxMemoView
          Left = 611.504330000000000000
          Top = 131.944960000000000000
          Width = 139.842610000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Entrega: [frxLote_Bol."DTENTREGA"]')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 3.779530000000000000
          Top = 110.047310000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'Obs Rem:')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 86.929190000000000000
          Top = 110.047310000000000000
          Width = 544.252320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxLote_Bol."OBS"]')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 257.008040000000000000
          Top = 11.779530000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'Qtd:')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 325.039580000000000000
          Top = 11.779530000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxLote_Bol."QTD"]')
          ParentFont = False
        end
      end
      object DetailData2: TfrxDetailData
        FillType = ftBrush
        Height = 102.047244090000000000
        Top = 192.756030000000000000
        Width = 740.787880000000000000
        DataSet = frxProduto_Comb_Mat
        DataSetName = 'Produto_Comb_Mat'
        RowCount = 0
        object Subreport1: TfrxSubreport
          Top = 0.755905510000000000
          Width = 94.488250000000000000
          Height = 15.874015750000000000
          Page = frxReport1.Page2
        end
        object Line1: TfrxLineView
          Left = 381.732530000000000000
          Height = 102.047310000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line2: TfrxLineView
          Align = baBottom
          Top = 102.047244090000000000
          Width = 740.787880000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          Top = -0.000000000000004857
          Width = 740.787880000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
    end
    object Page2: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 139.700000000000000000
      PaperSize = 256
      LeftMargin = 7.000000000000000000
      RightMargin = 7.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 15.874015750000000000
        Top = 18.897650000000000000
        Width = 763.087107000000000000
        Columns = 2
        ColumnWidth = 377.952755905512000000
        ColumnGap = 7.559055118110240000
        DataSet = frxProduto_Comb_Mat
        DataSetName = 'Produto_Comb_Mat'
        RowCount = 0
        object Memo7: TfrxMemoView
          Top = 0.755905510000000000
          Width = 283.464750000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '[Produto_Comb_Mat."NOME_POSICAO"] [Produto_Comb_Mat."NOME_MATERI' +
              'AL"] [Produto_Comb_Mat."NOME_COR"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end
            item
            end>
        end
        object Memo9: TfrxMemoView
          Left = 290.362400000000000000
          Top = 0.755905510000000000
          Width = 49.889763780000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '%2.4f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Produto_Comb_Mat."QTD_CONSUMO"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 341.496290000000000000
          Width = 22.677180000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[Produto_Comb_Mat."UNIDADE"]')
          ParentFont = False
        end
      end
    end
    object Page3: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 139.700000000000000000
      PaperSize = 256
      LeftMargin = 7.000000000000000000
      RightMargin = 7.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData3: TfrxMasterData
        FillType = ftBrush
        Height = 86.929133860000000000
        Top = 18.897650000000000000
        Width = 763.087107000000000000
        Columns = 3
        ColumnWidth = 253.228346456693000000
        DataSet = frxTalao_Setor_Bol
        DataSetName = 'frxTalao_Setor_Bol'
        RowCount = 0
        object Memo36: TfrxMemoView
          Top = 3.779530000000000000
          Width = 245.669450000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frxTalao_Setor_Bol."NOME_SETOR"]')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Top = 20.677180000000000000
          Width = 60.472480000000000000
          Height = 13.984251970000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'REMESSA:')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Top = 36.039372520000000000
          Width = 60.472392130000000000
          Height = 13.984251970000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'MODELO:')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Top = 53.472480000000000000
          Width = 245.669362130000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxLote_Bol."OBSMATERIAL"]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 170.078850000000000000
          Top = 19.677180000000000000
          Width = 45.354360000000000000
          Height = 13.984251970000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'LOTE:')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 170.078850000000000000
          Top = 36.039372520000000000
          Width = 45.354272130000000000
          Height = 13.984251970000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'PARES:')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 60.472480000000000000
          Top = 20.677180000000000000
          Width = 109.606370000000000000
          Height = 13.984251970000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxLote_Bol."NUM_REMESSA"]')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 60.472480000000000000
          Top = 36.039372520000000000
          Width = 109.606282130000000000
          Height = 13.984251970000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxLote_Bol."REFERENCIA"]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 215.433210000000000000
          Top = 19.677180000000000000
          Width = 34.015770000000000000
          Height = 13.984251970000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxLote_Bol."NUM_LOTE"]')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 215.433210000000000000
          Top = 36.039372520000000000
          Width = 34.015682130000000000
          Height = 13.984251970000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frxLote_Bol."QTD"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 230.551330000000000000
          Top = 70.031540000000000000
          Width = 15.118120000000000000
          Height = 15.118120000000000000
          Memo.UTF8 = (
            '.')
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxProdutoConsumo'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'ITEM=ITEM'
      'ID_MATERIAL=ID_MATERIAL'
      'QTD_CONSUMO=QTD_CONSUMO'
      'QTD_UNIDADE=QTD_UNIDADE'
      'UNIDADE=UNIDADE'
      'ID_POSICAO=ID_POSICAO'
      'TIPO_CONSUMO=TIPO_CONSUMO'
      'NOME_MATERIAL=NOME_MATERIAL'
      'ID_GRADE=ID_GRADE'
      'REF_MATERIAL=REF_MATERIAL'
      'IMP_ROTULO=IMP_ROTULO'
      'IMP_TALAO=IMP_TALAO'
      'IMP_TALAO_POS=IMP_TALAO_POS'
      'NOME_POSICAO=NOME_POSICAO'
      'IMP_MATERIAL=IMP_MATERIAL'
      'IMP_AGRUPADO_MATERIAL=IMP_AGRUPADO_MATERIAL'
      'NOME_COR=NOME_COR'
      'ID_COR=ID_COR'
      'ID_SETOR=ID_SETOR')
    DataSource = dsProduto_Consumo
    BCDToCurrency = False
    Left = 392
    Top = 272
  end
  object sdsLote_Bol: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT AUX.*, P.PEDIDO_CLIENTE, CLI.NOME NOME_CLIENTE'#13#10'FROM ('#13#10's' +
      'elect l.num_remessa, t.num_talao, l.num_lote, t.qtd, PC.FOTO, L.' +
      'obs, L.obs_ped,'#13#10'l.dtentrega, T.referencia, L.id_produto, PC.nom' +
      'e NOME_COMBINACAO,'#13#10'(select first 1 TP.ID_PEDIDO  from talao_ped' +
      ' tp where t.id = tp.id and t.num_talao = tp.num_talao ) ID_PEDID' +
      'O,'#13#10'PC.obsmaterial, (SELECT MAX(NUM_LOTE) NUM_LOTE_MAX FROM LOTE' +
      ' L2 WHERE L2.NUM_REMESSA = L.NUM_REMESSA),'#13#10'PROD.UNIDADE, L.fili' +
      'al, L.dtemissao, L.NUM_ORDEM, L.SELECIONADO, L.ID_COMBINACAO, L.' +
      'ID ID_LOTE'#13#10'from lote l'#13#10'inner join talao t'#13#10'on l.id = t.id'#13#10'inn' +
      'er JOIN PRODUTO_COMB PC'#13#10'ON T.id_produto = PC.id'#13#10'AND T.id_combi' +
      'nacao = PC.id_cor_combinacao'#13#10'INNER JOIN PRODUTO PROD'#13#10'ON L.ID_P' +
      'RODUTO = PROD.ID ) AUX'#13#10'inner join  pedido p'#13#10'on p.id = AUX.id_p' +
      'edido'#13#10'INNER JOIN PESSOA CLI'#13#10'ON P.ID_CLIENTE = CLI.CODIGO'#13#10#13#10#13#10 +
      #13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 256
    Top = 496
  end
  object dspLote_Bol: TDataSetProvider
    DataSet = sdsLote_Bol
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspLoteUpdateError
    Left = 286
    Top = 496
  end
  object cdsLote_Bol: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLote_Bol'
    Left = 318
    Top = 496
    object cdsLote_BolNUM_REMESSA: TStringField
      FieldName = 'NUM_REMESSA'
      Size = 15
    end
    object cdsLote_BolNUM_TALAO: TIntegerField
      FieldName = 'NUM_TALAO'
      Required = True
    end
    object cdsLote_BolNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object cdsLote_BolQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsLote_BolFOTO: TStringField
      FieldName = 'FOTO'
      Size = 200
    end
    object cdsLote_BolOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsLote_BolOBS_PED: TStringField
      FieldName = 'OBS_PED'
      Size = 100
    end
    object cdsLote_BolDTENTREGA: TDateField
      FieldName = 'DTENTREGA'
    end
    object cdsLote_BolREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsLote_BolID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object cdsLote_BolOBSMATERIAL: TStringField
      FieldName = 'OBSMATERIAL'
      Size = 100
    end
    object cdsLote_BolPEDIDO_CLIENTE: TStringField
      FieldName = 'PEDIDO_CLIENTE'
    end
    object cdsLote_BolNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object cdsLote_BolNUM_LOTE_MAX: TIntegerField
      FieldName = 'NUM_LOTE_MAX'
    end
    object cdsLote_BolID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsLote_BolNOME_COMBINACAO: TStringField
      FieldName = 'NOME_COMBINACAO'
      Size = 50
    end
    object cdsLote_BolUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsLote_BolFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsLote_BolDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsLote_BolNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsLote_BolSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      Size = 1
    end
    object cdsLote_BolID_COMBINACAO: TIntegerField
      FieldName = 'ID_COMBINACAO'
    end
    object cdsLote_BolID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
      Required = True
    end
  end
  object dsLote_Bol: TDataSource
    DataSet = cdsLote_Bol
    Left = 353
    Top = 496
  end
  object frxLote_Bol: TfrxDBDataset
    UserName = 'frxLote_Bol'
    OnFirst = frxLote_BolFirst
    OnNext = frxLote_BolNext
    CloseDataSource = False
    FieldAliases.Strings = (
      'NUM_REMESSA=NUM_REMESSA'
      'NUM_TALAO=NUM_TALAO'
      'NUM_LOTE=NUM_LOTE'
      'QTD=QTD'
      'FOTO=FOTO'
      'OBS=OBS'
      'OBS_PED=OBS_PED'
      'DTENTREGA=DTENTREGA'
      'REFERENCIA=REFERENCIA'
      'ID_PEDIDO=ID_PEDIDO'
      'OBSMATERIAL=OBSMATERIAL'
      'PEDIDO_CLIENTE=PEDIDO_CLIENTE'
      'NOME_CLIENTE=NOME_CLIENTE'
      'NUM_LOTE_MAX=NUM_LOTE_MAX'
      'ID_PRODUTO=ID_PRODUTO'
      'NOME_COMBINACAO=NOME_COMBINACAO'
      'UNIDADE=UNIDADE'
      'FILIAL=FILIAL'
      'DTEMISSAO=DTEMISSAO'
      'NUM_ORDEM=NUM_ORDEM'
      'SELECIONADO=SELECIONADO')
    OnOpen = frxLote_BolOpen
    DataSource = dsLote_Bol
    BCDToCurrency = False
    Left = 392
    Top = 495
  end
  object sdsTalao_Setor_Bol: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT TS.*, S.NOME NOME_SETOR, S.ordem_orc'#13#10'FROM talao_setor TS' +
      #13#10'LEFT JOIN SETOR S'#13#10'ON TS.ID_SETOR = S.ID'#13#10'where TS.ID = :ID'#13#10'o' +
      'rder by S.ordem_orc desc'#13#10#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 256
    Top = 544
  end
  object dspTalao_Setor_Bol: TDataSetProvider
    DataSet = sdsTalao_Setor_Bol
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspLoteUpdateError
    Left = 286
    Top = 544
  end
  object cdsTalao_Setor_Bol: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTalao_Setor_Bol'
    Left = 318
    Top = 544
    object cdsTalao_Setor_BolID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsTalao_Setor_BolNUM_TALAO: TIntegerField
      FieldName = 'NUM_TALAO'
      Required = True
    end
    object cdsTalao_Setor_BolITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsTalao_Setor_BolID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
    end
    object cdsTalao_Setor_BolDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object cdsTalao_Setor_BolHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object cdsTalao_Setor_BolDTSAIDA: TDateField
      FieldName = 'DTSAIDA'
    end
    object cdsTalao_Setor_BolHRSAIDA: TTimeField
      FieldName = 'HRSAIDA'
    end
    object cdsTalao_Setor_BolID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
    end
    object cdsTalao_Setor_BolQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsTalao_Setor_BolTOTAL_HORAS: TFloatField
      FieldName = 'TOTAL_HORAS'
    end
    object cdsTalao_Setor_BolNOME_SETOR: TStringField
      FieldName = 'NOME_SETOR'
    end
    object cdsTalao_Setor_BolORDEM_ORC: TIntegerField
      FieldName = 'ORDEM_ORC'
    end
  end
  object dsTalao_Setor_Bol: TDataSource
    DataSet = cdsTalao_Setor_Bol
    Left = 353
    Top = 544
  end
  object frxTalao_Setor_Bol: TfrxDBDataset
    UserName = 'frxTalao_Setor_Bol'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'NUM_TALAO=NUM_TALAO'
      'ITEM=ITEM'
      'ID_SETOR=ID_SETOR'
      'DTENTRADA=DTENTRADA'
      'HRENTRADA=HRENTRADA'
      'DTSAIDA=DTSAIDA'
      'HRSAIDA=HRSAIDA'
      'ID_FUNCIONARIO=ID_FUNCIONARIO'
      'QTD=QTD'
      'TOTAL_HORAS=TOTAL_HORAS'
      'NOME_SETOR=NOME_SETOR'
      'ORDEM_ORC=ORDEM_ORC')
    DataSource = dsTalao_Setor_Bol
    BCDToCurrency = False
    Left = 392
    Top = 543
  end
  object sdsProduto_Comb_Mat: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT first 12 PS.IMP_TALAO IMP_TALAO_POS, MAT.NOME NOME_MATERI' +
      'AL, MAT.ID_GRADE, MAT.REFERENCIA REF_MATERIAL,'#13#10'PS.NOME NOME_POS' +
      'ICAO, PS.imp_material, PS.imp_agrupado_material, COR.NOME NOME_C' +
      'OR, PMAT.ID_COR,'#13#10'PMAT.qtd_consumo, PMAT.ID_SETOR, PMAT.ID_POSIC' +
      'AO, PMAT.item_mat, MAT.unidade'#13#10'FROM PRODUTO_COMB PCOMB'#13#10'INNER J' +
      'OIN PRODUTO_COMB_MAT PMAT'#13#10'ON PCOMB.ID = PMAT.ID'#13#10'AND PCOMB.ITEM' +
      ' = PMAT.ITEM'#13#10'LEFT JOIN POSICAO PS'#13#10'ON PMAT.ID_POSICAO = PS.ID'#13#10 +
      'INNER JOIN PRODUTO MAT'#13#10'ON PMAT.ID_MATERIAL = MAT.ID'#13#10'LEFT JOIN ' +
      'COMBINACAO COR'#13#10'ON PMAT.ID_COR = COR.ID'#13#10'WHERE PCOMB.ID = :ID'#13#10' ' +
      ' AND PCOMB.ID_COR_COMBINACAO = :ID_COR_COMBINACAO'#13#10'  AND ((PS.IM' +
      'P_TALAO = '#39'S'#39') OR (PMAT.IMP_TALAO = '#39'S'#39'))'#13#10'ORDER BY PMAT.ID_SETO' +
      'R, PMAT.ID_POSICAO'#13#10
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
    Left = 256
    Top = 392
  end
  object dspProduto_Comb_Mat: TDataSetProvider
    DataSet = sdsProduto_Comb_Mat
    Left = 288
    Top = 392
  end
  object cdsProduto_Comb_Mat: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_SETOR;ID_POSICAO;ITEM_MAT'
    Params = <>
    ProviderName = 'dspProduto_Comb_Mat'
    Left = 320
    Top = 391
    object cdsProduto_Comb_MatIMP_TALAO_POS: TStringField
      FieldName = 'IMP_TALAO_POS'
      FixedChar = True
      Size = 1
    end
    object cdsProduto_Comb_MatNOME_MATERIAL: TStringField
      FieldName = 'NOME_MATERIAL'
      Size = 100
    end
    object cdsProduto_Comb_MatID_GRADE: TIntegerField
      FieldName = 'ID_GRADE'
    end
    object cdsProduto_Comb_MatREF_MATERIAL: TStringField
      FieldName = 'REF_MATERIAL'
    end
    object cdsProduto_Comb_MatNOME_POSICAO: TStringField
      FieldName = 'NOME_POSICAO'
      Size = 30
    end
    object cdsProduto_Comb_MatIMP_MATERIAL: TStringField
      FieldName = 'IMP_MATERIAL'
      FixedChar = True
      Size = 1
    end
    object cdsProduto_Comb_MatIMP_AGRUPADO_MATERIAL: TStringField
      FieldName = 'IMP_AGRUPADO_MATERIAL'
      FixedChar = True
      Size = 1
    end
    object cdsProduto_Comb_MatNOME_COR: TStringField
      FieldName = 'NOME_COR'
      Size = 60
    end
    object cdsProduto_Comb_MatID_COR: TIntegerField
      FieldName = 'ID_COR'
    end
    object cdsProduto_Comb_MatQTD_CONSUMO: TFloatField
      FieldName = 'QTD_CONSUMO'
    end
    object cdsProduto_Comb_MatID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
    end
    object cdsProduto_Comb_MatID_POSICAO: TIntegerField
      FieldName = 'ID_POSICAO'
    end
    object cdsProduto_Comb_MatITEM_MAT: TIntegerField
      FieldName = 'ITEM_MAT'
      Required = True
    end
    object cdsProduto_Comb_MatUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
  end
  object dsProduto_Comb_Mat: TDataSource
    DataSet = cdsProduto_Comb_Mat
    Left = 351
    Top = 392
  end
  object frxProduto_Comb_Mat: TfrxDBDataset
    UserName = 'Produto_Comb_Mat'
    CloseDataSource = False
    FieldAliases.Strings = (
      'IMP_TALAO_POS=IMP_TALAO_POS'
      'NOME_MATERIAL=NOME_MATERIAL'
      'ID_GRADE=ID_GRADE'
      'REF_MATERIAL=REF_MATERIAL'
      'NOME_POSICAO=NOME_POSICAO'
      'IMP_MATERIAL=IMP_MATERIAL'
      'IMP_AGRUPADO_MATERIAL=IMP_AGRUPADO_MATERIAL'
      'NOME_COR=NOME_COR'
      'ID_COR=ID_COR'
      'QTD_CONSUMO=QTD_CONSUMO'
      'ID_SETOR=ID_SETOR'
      'ID_POSICAO=ID_POSICAO'
      'ITEM_MAT=ITEM_MAT'
      'UNIDADE=UNIDADE')
    DataSource = dsProduto_Comb_Mat
    BCDToCurrency = False
    Left = 384
    Top = 391
  end
  object sdsConsLote_Novo: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select L.ID, L.DTEMISSAO, L.NUM_LOTE, L.FILIAL, L.HREMISSAO, L.D' +
      'TENTREGA, L.QTD_TALOES, L.NUM_ORDEM, L.CARIMBO,'#13#10'       L.TALAO_' +
      'AUX_GERADO, L.ID_PRODUTO, L.QTD, L.QTD_PENDENTE, L.QTD_PRODUZIDO' +
      ', L.DTBAIXA, L.HRBAIXA, L.IMPRESSO,'#13#10'       L.ID_COMBINACAO, L.I' +
      'D_PEDIDO, L.ITEM_PEDIDO, PRO.REFERENCIA,'#13#10'       case'#13#10'         ' +
      'when PRO.NOME_MODELO <> '#39#39' then PRO.NOME_MODELO'#13#10'         else P' +
      'RO.NOME'#13#10'       end NOME_PRODUTO,'#13#10'       PRO.NOME NOME_PRODUTO,' +
      ' PRO.UNIDADE, FIL.NOME NOME_FILIAL, PRO.ID_GRADE, PCP.ID_TIPO_MA' +
      'TRIZ,'#13#10'       TM.NOME NOME_TIPOMATRIZ, COMB.NOME NOME_COMBINACAO' +
      ', L.NOME NOME_LOTE, L.NUM_PEDIDO, PED.PEDIDO_CLIENTE,'#13#10'       CL' +
      'I.NOME NOME_CLIENTE, L.UNIDADE UNIDADE_LOTE, PRO.ID_FORMA, FORMA' +
      '.NOME NOME_FORMA, L.OBS_PED, L.NUM_REMESSA,'#13#10'       PRO.FOTO'#13#10'fr' +
      'om LOTE L'#13#10'inner join FILIAL FIL on L.FILIAL = FIL.ID'#13#10'left join' +
      ' PRODUTO PRO on L.ID_PRODUTO = PRO.ID'#13#10'left join PRODUTO_PCP PCP' +
      ' on L.ID_PRODUTO = PCP.ID'#13#10'left join TIPO_MATRIZ TM on PCP.ID_TI' +
      'PO_MATRIZ = TM.ID'#13#10'left join COMBINACAO COMB on L.ID_COMBINACAO ' +
      '= COMB.ID'#13#10'left join PEDIDO PED on L.ID_PEDIDO = PED.ID'#13#10'left jo' +
      'in PESSOA CLI on PED.ID_CLIENTE = CLI.CODIGO'#13#10'left join PRODUTO ' +
      'FORMA on PRO.ID_FORMA = FORMA.ID'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 248
    Top = 16
  end
  object dspConsLote_Novo: TDataSetProvider
    DataSet = sdsConsLote_Novo
    Left = 280
    Top = 16
  end
  object cdsConsLote_Novo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsLote_Novo'
    Left = 312
    Top = 16
    object cdsConsLote_NovoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsLote_NovoDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsConsLote_NovoNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object cdsConsLote_NovoFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsConsLote_NovoHREMISSAO: TTimeField
      FieldName = 'HREMISSAO'
    end
    object cdsConsLote_NovoDTENTREGA: TDateField
      FieldName = 'DTENTREGA'
    end
    object cdsConsLote_NovoQTD_TALOES: TIntegerField
      FieldName = 'QTD_TALOES'
    end
    object cdsConsLote_NovoNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsConsLote_NovoCARIMBO: TStringField
      FieldName = 'CARIMBO'
      Size = 25
    end
    object cdsConsLote_NovoTALAO_AUX_GERADO: TStringField
      FieldName = 'TALAO_AUX_GERADO'
      FixedChar = True
      Size = 1
    end
    object cdsConsLote_NovoID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsConsLote_NovoQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsConsLote_NovoQTD_PENDENTE: TFloatField
      FieldName = 'QTD_PENDENTE'
    end
    object cdsConsLote_NovoQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
    end
    object cdsConsLote_NovoDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object cdsConsLote_NovoHRBAIXA: TTimeField
      FieldName = 'HRBAIXA'
    end
    object cdsConsLote_NovoIMPRESSO: TStringField
      FieldName = 'IMPRESSO'
      Size = 1
    end
    object cdsConsLote_NovoID_COMBINACAO: TIntegerField
      FieldName = 'ID_COMBINACAO'
    end
    object cdsConsLote_NovoID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object cdsConsLote_NovoITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object cdsConsLote_NovoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsConsLote_NovoNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object cdsConsLote_NovoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsConsLote_NovoNOME_FILIAL: TStringField
      FieldName = 'NOME_FILIAL'
      Size = 60
    end
    object cdsConsLote_NovoID_GRADE: TIntegerField
      FieldName = 'ID_GRADE'
    end
    object cdsConsLote_NovoID_TIPO_MATRIZ: TIntegerField
      FieldName = 'ID_TIPO_MATRIZ'
    end
    object cdsConsLote_NovoNOME_TIPOMATRIZ: TStringField
      FieldName = 'NOME_TIPOMATRIZ'
      Size = 40
    end
    object cdsConsLote_NovoNOME_COMBINACAO: TStringField
      FieldName = 'NOME_COMBINACAO'
      Size = 60
    end
    object cdsConsLote_NovoNOME_LOTE: TStringField
      FieldName = 'NOME_LOTE'
      Size = 30
    end
    object cdsConsLote_NovoNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object cdsConsLote_NovoPEDIDO_CLIENTE: TStringField
      FieldName = 'PEDIDO_CLIENTE'
    end
    object cdsConsLote_NovoNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object cdsConsLote_NovoUNIDADE_LOTE: TStringField
      FieldName = 'UNIDADE_LOTE'
      Size = 6
    end
    object cdsConsLote_NovoID_FORMA: TIntegerField
      FieldName = 'ID_FORMA'
    end
    object cdsConsLote_NovoNOME_FORMA: TStringField
      FieldName = 'NOME_FORMA'
      Size = 100
    end
    object cdsConsLote_NovoOBS_PED: TStringField
      FieldName = 'OBS_PED'
      Size = 100
    end
    object cdsConsLote_NovoNUM_REMESSA: TStringField
      FieldName = 'NUM_REMESSA'
      Size = 15
    end
    object cdsConsLote_NovoFOTO: TStringField
      FieldName = 'FOTO'
      Size = 150
    end
  end
  object dsConsLote_Novo: TDataSource
    DataSet = cdsConsLote_Novo
    Left = 344
    Top = 16
  end
  object sdsBaixa_Processo: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM BAIXA_PROCESSO'#13#10'WHERE ID = :ID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 69
    Top = 404
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
    object sdsBaixa_ProcessoID_COR_MAT: TIntegerField
      FieldName = 'ID_COR_MAT'
    end
  end
  object dspBaixa_Processo: TDataSetProvider
    DataSet = sdsBaixa_Processo
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspLoteUpdateError
    Left = 101
    Top = 404
  end
  object cdsBaixa_Processo: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID;ITEM'
    Params = <>
    ProviderName = 'dspBaixa_Processo'
    Left = 132
    Top = 404
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
    object cdsBaixa_ProcessoID_COR_MAT: TIntegerField
      FieldName = 'ID_COR_MAT'
    end
  end
  object dsBaixa_Processo: TDataSource
    DataSet = cdsBaixa_Processo
    Left = 164
    Top = 404
  end
  object sdsProduto_Consumo_Proc: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT PC.*, P.id_setor, P.id_posicao, p.id_material, cmat.id_co' +
      'r ID_COR_MAT'#13#10'FROM PRODUTO_CONSUMO_PROC PC'#13#10'INNER JOIN PRODUTO_C' +
      'ONSUMO P'#13#10' ON  PC.ID = P.ID'#13#10' AND PC.item = P.item'#13#10'left join pr' +
      'oduto_comb comb'#13#10'on pc.id = comb.id'#13#10'and comb.id_cor_combinacao ' +
      '= :ID_COR'#13#10'left join produto_comb_mat cmat'#13#10'on comb.id = cmat.id' +
      #13#10'and comb.item = cmat.item'#13#10'and p.item = cmat.item_mat'#13#10'WHERE P' +
      'C.ID = :ID'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_COR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 432
    Top = 224
  end
  object dspProduto_Consumo_Proc: TDataSetProvider
    DataSet = sdsProduto_Consumo_Proc
    Left = 464
    Top = 224
  end
  object cdsProduto_Consumo_Proc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto_Consumo_Proc'
    Left = 499
    Top = 224
    object cdsProduto_Consumo_ProcID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsProduto_Consumo_ProcITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsProduto_Consumo_ProcITEM_PROC: TIntegerField
      FieldName = 'ITEM_PROC'
      Required = True
    end
    object cdsProduto_Consumo_ProcID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object cdsProduto_Consumo_ProcID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
    end
    object cdsProduto_Consumo_ProcID_POSICAO: TIntegerField
      FieldName = 'ID_POSICAO'
    end
    object cdsProduto_Consumo_ProcID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object cdsProduto_Consumo_ProcID_COR_MAT: TIntegerField
      FieldName = 'ID_COR_MAT'
    end
  end
  object sdsConsBaixaProc: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT B.*, P.NOME NOME_PROCESSO'#13#10'FROM baixa_processo B'#13#10'INNER J' +
      'OIN PROCESSO P'#13#10'ON B.id_processo = P.id'#13#10'WHERE B.ID_LOTE = :ID_L' +
      'OTE'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_LOTE'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 435
    Top = 160
  end
  object dspConsBaixaProc: TDataSetProvider
    DataSet = sdsConsBaixaProc
    Left = 467
    Top = 160
  end
  object cdsConsBaixaProc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsBaixaProc'
    Left = 499
    Top = 160
    object cdsConsBaixaProcID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsBaixaProcITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsConsBaixaProcID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object cdsConsBaixaProcID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
    end
    object cdsConsBaixaProcID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object cdsConsBaixaProcITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object cdsConsBaixaProcDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object cdsConsBaixaProcHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object cdsConsBaixaProcDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object cdsConsBaixaProcHRBAIXA: TTimeField
      FieldName = 'HRBAIXA'
    end
    object cdsConsBaixaProcQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsConsBaixaProcQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
    end
    object cdsConsBaixaProcNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsConsBaixaProcTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object cdsConsBaixaProcTOTAL_HORAS: TFloatField
      FieldName = 'TOTAL_HORAS'
    end
    object cdsConsBaixaProcQTD_PENDENTE: TFloatField
      FieldName = 'QTD_PENDENTE'
    end
    object cdsConsBaixaProcSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      Size = 1
    end
    object cdsConsBaixaProcPARCIAL: TStringField
      FieldName = 'PARCIAL'
      Size = 1
    end
    object cdsConsBaixaProcITEM_ORIGINAL: TIntegerField
      FieldName = 'ITEM_ORIGINAL'
    end
    object cdsConsBaixaProcQTD_LIBERADA: TFloatField
      FieldName = 'QTD_LIBERADA'
    end
    object cdsConsBaixaProcAJUSTE: TStringField
      FieldName = 'AJUSTE'
      Size = 1
    end
    object cdsConsBaixaProcID_FUNCIONARIO_ENT: TIntegerField
      FieldName = 'ID_FUNCIONARIO_ENT'
    end
    object cdsConsBaixaProcID_FUNCIONARIO_BAIXA: TIntegerField
      FieldName = 'ID_FUNCIONARIO_BAIXA'
    end
    object cdsConsBaixaProcID_MOVESTOQUE: TIntegerField
      FieldName = 'ID_MOVESTOQUE'
    end
    object cdsConsBaixaProcID_MOVESTOQUE_RES: TIntegerField
      FieldName = 'ID_MOVESTOQUE_RES'
    end
    object cdsConsBaixaProcID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
    end
    object cdsConsBaixaProcID_POSICAO: TIntegerField
      FieldName = 'ID_POSICAO'
    end
    object cdsConsBaixaProcNUM_TALAO: TIntegerField
      FieldName = 'NUM_TALAO'
    end
    object cdsConsBaixaProcNOME_PROCESSO: TStringField
      FieldName = 'NOME_PROCESSO'
      Size = 30
    end
  end
  object dsConsBaixaProc: TDataSource
    DataSet = cdsConsBaixaProc
    Left = 533
    Top = 160
  end
  object sdsConsProcesso: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT B.id, B.ID_LOTE, B.id_processo, B.ID_SETOR, B.id_posicao,' +
      #13#10'P.NOME NOME_PROCESSO, S.NOME NOME_SETOR, PP.NOME NOME_POSICAO,' +
      ' B.QTD,'#13#10'B.qtd_pendente, B.qtd_produzido, MAT.NOME NOME_MATERIAL' +
      ', B.ITEM,'#13#10'L.num_lote, L.num_ordem, L.referencia, PED.pedido_cli' +
      'ente, PED.num_pedido,'#13#10'B.ID_COR_MAT, CMAT.NOME NOME_COR_MAT, PRO' +
      'D.NOME_MODELO'#13#10'FROM BAIXA_PROCESSO B'#13#10'INNER JOIN PROCESSO P'#13#10'ON ' +
      'B.ID_PROCESSO = P.ID'#13#10'INNER JOIN LOTE L'#13#10'ON B.ID_LOTE = L.ID'#13#10'IN' +
      'NER JOIN PRODUTO PROD'#13#10'ON L.ID_PRODUTO = PROD.ID'#13#10'LEFT JOIN PEDI' +
      'DO PED'#13#10'ON L.ID_PEDIDO = PED.ID'#13#10'LEFT JOIN SETOR S'#13#10'ON B.ID_SETO' +
      'R = S.ID'#13#10'LEFT JOIN POSICAO PP'#13#10'ON B.ID_POSICAO = PP.ID'#13#10'LEFT JO' +
      'IN PRODUTO MAT'#13#10'ON B.ID_MATERIAL = MAT.ID'#13#10'LEFT JOIN COMBINACAO ' +
      'CMAT'#13#10'ON B.ID_COR_MAT = CMAT.ID'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 435
    Top = 96
  end
  object dspConsProcesso: TDataSetProvider
    DataSet = sdsConsProcesso
    Left = 467
    Top = 96
  end
  object cdsConsProcesso: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsProcesso'
    Left = 496
    Top = 96
    object cdsConsProcessoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsProcessoID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
    end
    object cdsConsProcessoID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object cdsConsProcessoID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
    end
    object cdsConsProcessoID_POSICAO: TIntegerField
      FieldName = 'ID_POSICAO'
    end
    object cdsConsProcessoNOME_PROCESSO: TStringField
      FieldName = 'NOME_PROCESSO'
      Size = 30
    end
    object cdsConsProcessoNOME_SETOR: TStringField
      FieldName = 'NOME_SETOR'
    end
    object cdsConsProcessoNOME_POSICAO: TStringField
      FieldName = 'NOME_POSICAO'
      Size = 30
    end
    object cdsConsProcessoQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsConsProcessoQTD_PENDENTE: TFloatField
      FieldName = 'QTD_PENDENTE'
    end
    object cdsConsProcessoQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
    end
    object cdsConsProcessoNOME_MATERIAL: TStringField
      FieldName = 'NOME_MATERIAL'
      Size = 100
    end
    object cdsConsProcessoclCodBarra: TStringField
      FieldKind = fkCalculated
      FieldName = 'clCodBarra'
      Size = 11
      Calculated = True
    end
    object cdsConsProcessoITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsConsProcessoNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object cdsConsProcessoNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsConsProcessoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsConsProcessoPEDIDO_CLIENTE: TStringField
      FieldName = 'PEDIDO_CLIENTE'
    end
    object cdsConsProcessoNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object cdsConsProcessoID_COR_MAT: TIntegerField
      FieldName = 'ID_COR_MAT'
    end
    object cdsConsProcessoNOME_COR_MAT: TStringField
      FieldName = 'NOME_COR_MAT'
      Size = 60
    end
    object cdsConsProcessoNOME_MODELO: TStringField
      FieldName = 'NOME_MODELO'
      Size = 100
    end
  end
  object dsConsProcesso: TDataSource
    DataSet = cdsConsProcesso
    Left = 529
    Top = 96
  end
  object qParametros_Prod: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT USA_TAM_REFER_GRADE'
      'FROM PARAMETROS_PROD')
    SQLConnection = dmDatabase.scoDados
    Left = 736
    Top = 15
    object qParametros_ProdUSA_TAM_REFER_GRADE: TStringField
      FieldName = 'USA_TAM_REFER_GRADE'
      FixedChar = True
      Size = 1
    end
  end
  object qVerBaixaProc: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_LOTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_MATERIAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_COR_MAT'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT COUNT(1) CONTADOR'
      'FROM BAIXA_PROCESSO B'
      'WHERE B.ID_PROCESSO = :ID_PROCESSO'
      '  AND B.ID_LOTE = :ID_LOTE'
      '  AND B.ID_MATERIAL = :ID_MATERIAL'
      '  AND B.ID_COR_MAT = :ID_COR_MAT')
    SQLConnection = dmDatabase.scoDados
    Left = 711
    Top = 136
    object qVerBaixaProcCONTADOR: TIntegerField
      FieldName = 'CONTADOR'
      Required = True
    end
  end
end
