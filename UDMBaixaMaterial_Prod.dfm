object DMBaixaMaterial_Prod: TDMBaixaMaterial_Prod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 360
  Top = 119
  Height = 519
  Width = 912
  object sdsLote_Mat_Prod: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select *'#13#10'from lote_mat_prod'#13#10'where NUM_ORDEM = :NUM_ORDEM'#13#10'  AN' +
      'D ITEM = :ITEM'#13#10
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
    SQLConnection = dmDatabase.scoDados
    Left = 51
    Top = 29
    object sdsLote_Mat_ProdID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsLote_Mat_ProdITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
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
    object sdsLote_Mat_ProdDTPAGO: TDateField
      FieldName = 'DTPAGO'
    end
    object sdsLote_Mat_ProdDTRETORNO: TDateField
      FieldName = 'DTRETORNO'
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
  end
  object dspLote_Mat_Prod: TDataSetProvider
    DataSet = sdsLote_Mat_Prod
    UpdateMode = upWhereKeyOnly
    Left = 97
    Top = 29
  end
  object cdsLote_Mat_Prod: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID;ITEM'
    Params = <>
    ProviderName = 'dspLote_Mat_Prod'
    Left = 148
    Top = 29
    object cdsLote_Mat_ProdID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLote_Mat_ProdITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
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
    object cdsLote_Mat_ProdDTPAGO: TDateField
      FieldName = 'DTPAGO'
    end
    object cdsLote_Mat_ProdDTRETORNO: TDateField
      FieldName = 'DTRETORNO'
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
  end
  object dsLote_Mat_Prod: TDataSource
    DataSet = cdsLote_Mat_Prod
    Left = 192
    Top = 28
  end
  object sdsConsLoteMat_Prod: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select L.*, M.NOME NOME_MATERIAL, M.REFERENCIA REFERENCIA_MAT, C' +
      'MAT.NOME NOME_COR_MAT, CPROD.NOME NOME_COR_PROD,'#13#10'       M.PRECO' +
      '_CUSTO, M.UNIDADE UNIDADE_MATERIAL,'#13#10'       case'#13#10'         when ' +
      '(L.FINALIZADO = '#39'S'#39') and coalesce(L.QTD_CONSUMO, 0) <= 0 then 10' +
      '0'#13#10'         when (L.FINALIZADO = '#39'S'#39') and (round(coalesce(L.QTD_' +
      'PAGO, 0) - coalesce(L.QTD_RETORNO, 0) - L.QTD_CONSUMO, 4) <> 0) ' +
      'then ((L.QTD_PAGO - L.QTD_RETORNO - L.QTD_CONSUMO) * 100) / L.QT' +
      'D_CONSUMO'#13#10'         else 0'#13#10'       end PERC_DIFERENCA,'#13#10'       c' +
      'ase'#13#10'         when (L.FINALIZADO = '#39'S'#39') and (round(coalesce(L.QT' +
      'D_PAGO, 0) - coalesce(L.QTD_RETORNO, 0), 4) <> 0) then round((co' +
      'alesce(L.QTD_PAGO, 0) - coalesce(L.QTD_RETORNO, 0)), 4)'#13#10'       ' +
      '  else 0'#13#10'       end QTD_REAL'#13#10'from LOTE_MAT_PROD L'#13#10'inner join ' +
      'PRODUTO M on L.ID_MATERIAL = M.ID'#13#10'left join COMBINACAO CMAT on ' +
      'L.ID_COR_MATERIAL = CMAT.ID'#13#10'left join COMBINACAO CPROD on L.ID_' +
      'COR_PRODUTO = CPROD.ID '#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 342
    Top = 16
  end
  object dspConsLoteMat_Prod: TDataSetProvider
    DataSet = sdsConsLoteMat_Prod
    UpdateMode = upWhereKeyOnly
    Left = 390
    Top = 16
  end
  object cdsConsLoteMat_Prod: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsLoteMat_Prod'
    Left = 442
    Top = 16
    object cdsConsLoteMat_ProdID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsLoteMat_ProdITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsConsLoteMat_ProdNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsConsLoteMat_ProdID_COR_PRODUTO: TIntegerField
      FieldName = 'ID_COR_PRODUTO'
    end
    object cdsConsLoteMat_ProdID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object cdsConsLoteMat_ProdID_COR_MATERIAL: TIntegerField
      FieldName = 'ID_COR_MATERIAL'
    end
    object cdsConsLoteMat_ProdQTD_CONSUMO: TFloatField
      FieldName = 'QTD_CONSUMO'
      DisplayFormat = '###,###,##0.000#'
    end
    object cdsConsLoteMat_ProdQTD_PRODUTO: TFloatField
      FieldName = 'QTD_PRODUTO'
      DisplayFormat = '###,###,##0.000#'
    end
    object cdsConsLoteMat_ProdQTD_PAGO: TFloatField
      FieldName = 'QTD_PAGO'
      DisplayFormat = '###,###,##0.000#'
    end
    object cdsConsLoteMat_ProdQTD_RETORNO: TFloatField
      FieldName = 'QTD_RETORNO'
      DisplayFormat = '###,###,##0.000#'
    end
    object cdsConsLoteMat_ProdQTD_DIFERENCA: TFloatField
      FieldName = 'QTD_DIFERENCA'
      DisplayFormat = '###,###,##0.000#'
    end
    object cdsConsLoteMat_ProdQTD_CONES: TIntegerField
      FieldName = 'QTD_CONES'
    end
    object cdsConsLoteMat_ProdDTPAGO: TDateField
      FieldName = 'DTPAGO'
    end
    object cdsConsLoteMat_ProdDTRETORNO: TDateField
      FieldName = 'DTRETORNO'
    end
    object cdsConsLoteMat_ProdNUM_LOTE_AUX: TIntegerField
      FieldName = 'NUM_LOTE_AUX'
    end
    object cdsConsLoteMat_ProdREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsConsLoteMat_ProdIMPRESSO: TStringField
      FieldName = 'IMPRESSO'
      FixedChar = True
      Size = 1
    end
    object cdsConsLoteMat_ProdNOME_MATERIAL: TStringField
      FieldName = 'NOME_MATERIAL'
      Size = 100
    end
    object cdsConsLoteMat_ProdREFERENCIA_MAT: TStringField
      FieldName = 'REFERENCIA_MAT'
    end
    object cdsConsLoteMat_ProdNOME_COR_MAT: TStringField
      FieldName = 'NOME_COR_MAT'
      Size = 60
    end
    object cdsConsLoteMat_ProdNOME_COR_PROD: TStringField
      FieldName = 'NOME_COR_PROD'
      Size = 60
    end
    object cdsConsLoteMat_ProdPRECO_CUSTO: TFloatField
      FieldName = 'PRECO_CUSTO'
    end
    object cdsConsLoteMat_ProdUNIDADE_MATERIAL: TStringField
      FieldName = 'UNIDADE_MATERIAL'
      Size = 6
    end
    object cdsConsLoteMat_ProdFINALIZADO: TStringField
      FieldName = 'FINALIZADO'
      FixedChar = True
      Size = 1
    end
    object cdsConsLoteMat_ProdDTGERACAO: TDateField
      FieldName = 'DTGERACAO'
    end
    object cdsConsLoteMat_ProdPERC_DIFERENCA: TFloatField
      FieldName = 'PERC_DIFERENCA'
      DisplayFormat = '0.00'
    end
    object cdsConsLoteMat_ProdQTD_REAL: TFloatField
      FieldName = 'QTD_REAL'
      DisplayFormat = '0.000#'
    end
  end
  object dsConsLoteMat_Prod: TDataSource
    DataSet = cdsConsLoteMat_Prod
    Left = 484
    Top = 16
  end
  object sdsLote_Mat_Prod_Est: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT l.*,'#13#10'case'#13#10'  when l.tipo_es = '#39'E'#39' then '#39'Retorno'#39#13#10'  when' +
      ' l.tipo_es = '#39'S'#39' then '#39'Pago'#39#13#10'  end DESC_TIPO_ES'#13#10'FROM Lote_Mat_' +
      'Prod_Est l'#13#10'WHERE l.ID = :ID'#13#10'  AND l.ITEM = :ITEM'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ITEM'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 49
    Top = 89
    object sdsLote_Mat_Prod_EstID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsLote_Mat_Prod_EstITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsLote_Mat_Prod_EstITEM_EST: TIntegerField
      FieldName = 'ITEM_EST'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsLote_Mat_Prod_EstDATA: TDateField
      FieldName = 'DATA'
    end
    object sdsLote_Mat_Prod_EstHORA: TTimeField
      FieldName = 'HORA'
    end
    object sdsLote_Mat_Prod_EstQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsLote_Mat_Prod_EstID_MOVESTOQUE: TIntegerField
      FieldName = 'ID_MOVESTOQUE'
    end
    object sdsLote_Mat_Prod_EstTIPO_ES: TStringField
      FieldName = 'TIPO_ES'
      Size = 1
    end
    object sdsLote_Mat_Prod_EstDESC_TIPO_ES: TStringField
      FieldName = 'DESC_TIPO_ES'
      ProviderFlags = []
      FixedChar = True
      Size = 7
    end
    object sdsLote_Mat_Prod_EstFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object sdsLote_Mat_Prod_EstUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
  end
  object dspLote_Mat_Prod_Est: TDataSetProvider
    DataSet = sdsLote_Mat_Prod_Est
    UpdateMode = upWhereKeyOnly
    OnGetTableName = dspLote_Mat_Prod_EstGetTableName
    Left = 98
    Top = 89
  end
  object cdsLote_Mat_Prod_Est: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID;ITEM;ITEM_EST'
    Params = <>
    ProviderName = 'dspLote_Mat_Prod_Est'
    Left = 146
    Top = 88
    object cdsLote_Mat_Prod_EstID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLote_Mat_Prod_EstITEM: TIntegerField
      FieldName = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLote_Mat_Prod_EstITEM_EST: TIntegerField
      FieldName = 'ITEM_EST'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLote_Mat_Prod_EstDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsLote_Mat_Prod_EstHORA: TTimeField
      FieldName = 'HORA'
    end
    object cdsLote_Mat_Prod_EstQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsLote_Mat_Prod_EstID_MOVESTOQUE: TIntegerField
      FieldName = 'ID_MOVESTOQUE'
    end
    object cdsLote_Mat_Prod_EstTIPO_ES: TStringField
      FieldName = 'TIPO_ES'
      Size = 1
    end
    object cdsLote_Mat_Prod_EstDESC_TIPO_ES: TStringField
      FieldName = 'DESC_TIPO_ES'
      ProviderFlags = []
      FixedChar = True
      Size = 7
    end
    object cdsLote_Mat_Prod_EstFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsLote_Mat_Prod_EstUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
  end
  object dsLote_Mat_Prod_Est: TDataSource
    DataSet = cdsLote_Mat_Prod_Est
    Left = 192
    Top = 89
  end
  object qParametros_Est: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select p.id_filial_lote_mat_est'
      'from parametros_est p')
    SQLConnection = dmDatabase.scoDados
    Left = 320
    Top = 269
    object qParametros_EstID_FILIAL_LOTE_MAT_EST: TIntegerField
      FieldName = 'ID_FILIAL_LOTE_MAT_EST'
    end
  end
  object SQLQuery1: TSQLQuery
    Params = <>
    Left = 609
    Top = 202
  end
  object sdsPRC_Atualiza_Lote_Mat_Prod: TSQLDataSet
    CommandText = 'PRC_ATUALIZA_LOTE_MAT_PROD'
    CommandType = ctStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'P_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_ITEM'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 558
    Top = 273
  end
  object sdsConsPagRet: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select L.ID ID, L.ID_MATERIAL, L.NUM_ORDEM, L.ITEM, L.ID_COR_PRO' +
      'DUTO, L.ID_COR_MATERIAL, L.QTD_CONSUMO, L.QTD_PRODUTO,'#13#10'       L' +
      '.QTD_PAGO, L.QTD_RETORNO, L.QTD_DIFERENCA, L.QTD_CONES, M.NOME N' +
      'OME_MATERIAL, M.REFERENCIA REFERENCIA_MAT,'#13#10'       CMAT.NOME NOM' +
      'E_COR_MAT, CPROD.NOME NOME_COR_PROD, M.PRECO_CUSTO, M.UNIDADE UN' +
      'IDADE_MATERIAL,'#13#10'       LP.data, LP.item_est, LP.tipo_es, LP.qtd' +
      ', coalesce(L.finalizado,'#39'N'#39') FINALIZADO,'#13#10'case'#13#10'  when lp.tipo_e' +
      's = '#39'S'#39' then '#39'Pagamento'#39#13#10'  when lp.tipo_es = '#39'E'#39' then '#39'Retorno'#39 +
      #13#10'  else '#39#39#13#10'  end DESC_TIPO, L.REFERENCIA'#13#10'from LOTE_MAT_PROD L' +
      #13#10'inner join LOTE_MAT_PROD_EST LP on L.ID = LP.ID and L.ITEM = L' +
      'P.ITEM'#13#10'inner join PRODUTO M on L.ID_MATERIAL = M.ID'#13#10'left join ' +
      'COMBINACAO CMAT on L.ID_COR_MATERIAL = CMAT.ID'#13#10'left join COMBIN' +
      'ACAO CPROD on L.ID_COR_PRODUTO = CPROD.ID'#13#10'  '
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 344
    Top = 72
  end
  object dspConsPagRet: TDataSetProvider
    DataSet = sdsConsPagRet
    UpdateMode = upWhereKeyOnly
    Left = 394
    Top = 71
  end
  object cdsConsPagRet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsPagRet'
    Left = 446
    Top = 71
    object cdsConsPagRetID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsPagRetID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object cdsConsPagRetNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsConsPagRetITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsConsPagRetID_COR_PRODUTO: TIntegerField
      FieldName = 'ID_COR_PRODUTO'
    end
    object cdsConsPagRetID_COR_MATERIAL: TIntegerField
      FieldName = 'ID_COR_MATERIAL'
    end
    object cdsConsPagRetQTD_CONSUMO: TFloatField
      FieldName = 'QTD_CONSUMO'
      DisplayFormat = '###,###,##0.000#'
    end
    object cdsConsPagRetQTD_PRODUTO: TFloatField
      FieldName = 'QTD_PRODUTO'
      DisplayFormat = '###,###,##0.000#'
    end
    object cdsConsPagRetQTD_PAGO: TFloatField
      FieldName = 'QTD_PAGO'
      DisplayFormat = '###,###,##0.000#'
    end
    object cdsConsPagRetQTD_RETORNO: TFloatField
      FieldName = 'QTD_RETORNO'
      DisplayFormat = '###,###,##0.000#'
    end
    object cdsConsPagRetQTD_DIFERENCA: TFloatField
      FieldName = 'QTD_DIFERENCA'
      DisplayFormat = '###,###,##0.000#'
    end
    object cdsConsPagRetQTD_CONES: TIntegerField
      FieldName = 'QTD_CONES'
    end
    object cdsConsPagRetNOME_MATERIAL: TStringField
      FieldName = 'NOME_MATERIAL'
      Size = 100
    end
    object cdsConsPagRetREFERENCIA_MAT: TStringField
      FieldName = 'REFERENCIA_MAT'
    end
    object cdsConsPagRetNOME_COR_MAT: TStringField
      FieldName = 'NOME_COR_MAT'
      Size = 60
    end
    object cdsConsPagRetNOME_COR_PROD: TStringField
      FieldName = 'NOME_COR_PROD'
      Size = 60
    end
    object cdsConsPagRetPRECO_CUSTO: TFloatField
      FieldName = 'PRECO_CUSTO'
    end
    object cdsConsPagRetUNIDADE_MATERIAL: TStringField
      FieldName = 'UNIDADE_MATERIAL'
      Size = 6
    end
    object cdsConsPagRetDATA: TDateField
      FieldName = 'DATA'
    end
    object cdsConsPagRetITEM_EST: TIntegerField
      FieldName = 'ITEM_EST'
      Required = True
    end
    object cdsConsPagRetTIPO_ES: TStringField
      FieldName = 'TIPO_ES'
      Size = 1
    end
    object cdsConsPagRetQTD: TFloatField
      FieldName = 'QTD'
      DisplayFormat = '###,###,##0.000#'
    end
    object cdsConsPagRetFINALIZADO: TStringField
      FieldName = 'FINALIZADO'
      FixedChar = True
      Size = 1
    end
    object cdsConsPagRetDESC_TIPO: TStringField
      FieldName = 'DESC_TIPO'
      Required = True
      FixedChar = True
      Size = 9
    end
    object cdsConsPagRetREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
  end
  object dsConsPagRet: TDataSource
    DataSet = cdsConsPagRet
    Left = 488
    Top = 71
  end
  object sdsConsPagRet_Acum: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select L.ID_MATERIAL, L.ID_COR_MATERIAL,'#13#10'        M.NOME NOME_MA' +
      'TERIAL,'#13#10'       CMAT.NOME NOME_COR_MAT,'#13#10'       M.UNIDADE UNIDAD' +
      'E_MATERIAL, LP.TIPO_ES, SUM(LP.QTD) QTD,'#13#10'       case'#13#10'         ' +
      'when LP.TIPO_ES = '#39'S'#39' then '#39'Pagamento'#39' '#13#10'         when LP.TIPO_E' +
      'S = '#39'E'#39' then '#39'Retorno'#39' '#13#10'         else '#39#39' '#13#10'       end DESC_TIPO' +
      '  '#13#10'from LOTE_MAT_PROD L  '#13#10'inner join LOTE_MAT_PROD_EST LP on L' +
      '.ID = LP.ID and L.ITEM = LP.ITEM  '#13#10'inner join PRODUTO M on L.ID' +
      '_MATERIAL = M.ID  '#13#10'left join COMBINACAO CMAT on L.ID_COR_MATERI' +
      'AL = CMAT.ID  '#13#10'GROUP BY L.ID_MATERIAL, L.ID_COR_MATERIAL,'#13#10'    ' +
      '    M.NOME, CMAT.NOME, M.UNIDADE, LP.TIPO_ES'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 342
    Top = 123
  end
  object dspConsPagRet_Acum: TDataSetProvider
    DataSet = sdsConsPagRet_Acum
    UpdateMode = upWhereKeyOnly
    Left = 394
    Top = 125
  end
  object cdsConsPagRet_Acum: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsPagRet_Acum'
    Left = 447
    Top = 125
    object cdsConsPagRet_AcumID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object cdsConsPagRet_AcumID_COR_MATERIAL: TIntegerField
      FieldName = 'ID_COR_MATERIAL'
    end
    object cdsConsPagRet_AcumNOME_MATERIAL: TStringField
      FieldName = 'NOME_MATERIAL'
      Size = 100
    end
    object cdsConsPagRet_AcumNOME_COR_MAT: TStringField
      FieldName = 'NOME_COR_MAT'
      Size = 60
    end
    object cdsConsPagRet_AcumUNIDADE_MATERIAL: TStringField
      FieldName = 'UNIDADE_MATERIAL'
      Size = 6
    end
    object cdsConsPagRet_AcumTIPO_ES: TStringField
      FieldName = 'TIPO_ES'
      Size = 1
    end
    object cdsConsPagRet_AcumQTD: TFloatField
      FieldName = 'QTD'
      DisplayFormat = '###,###,##0.000#'
    end
    object cdsConsPagRet_AcumDESC_TIPO: TStringField
      FieldName = 'DESC_TIPO'
      Required = True
      FixedChar = True
      Size = 9
    end
  end
  object dsConsPagRet_Acum: TDataSource
    DataSet = cdsConsPagRet_Acum
    Left = 488
    Top = 125
  end
  object mPagRet_Ref: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 402
    Top = 362
    Data = {
      0F0100009619E0BD0100000018000000090000000000030000000F010A526566
      6572656E6369610100490000000100055749445448020002001400104E6F6D65
      5F436F725F50726F6475746F0100490000000100055749445448020002003C00
      0B49445F4D6174657269616C04000100000000000D4E6F6D655F4D6174657269
      616C0100490000000100055749445448020002003C00114E6F6D655F436F725F
      4D6174657269616C0100490000000100055749445448020002003C0009517464
      5F506167746F08000400000000000B5174645F5265746F726E6F080004000000
      00000F49445F436F725F4D6174657269616C04000100000000000E49445F436F
      725F50726F6475746F04000100000000000000}
    object mPagRet_RefReferencia: TStringField
      FieldName = 'Referencia'
    end
    object mPagRet_RefNome_Cor_Produto: TStringField
      FieldName = 'Nome_Cor_Produto'
      Size = 60
    end
    object mPagRet_RefID_Material: TIntegerField
      FieldName = 'ID_Material'
    end
    object mPagRet_RefNome_Material: TStringField
      FieldName = 'Nome_Material'
      Size = 60
    end
    object mPagRet_RefNome_Cor_Material: TStringField
      FieldName = 'Nome_Cor_Material'
      Size = 60
    end
    object mPagRet_RefQtd_Pagto: TFloatField
      FieldName = 'Qtd_Pagto'
      DisplayFormat = '0.000#'
    end
    object mPagRet_RefQtd_Retorno: TFloatField
      FieldName = 'Qtd_Retorno'
      DisplayFormat = '0.000#'
    end
    object mPagRet_RefID_Cor_Material: TIntegerField
      FieldName = 'ID_Cor_Material'
    end
    object mPagRet_RefID_Cor_Produto: TIntegerField
      FieldName = 'ID_Cor_Produto'
    end
  end
  object dsmPagRet_Ref: TDataSource
    DataSet = mPagRet_Ref
    Left = 456
    Top = 364
  end
  object sdsConsPagRet_Ref_Geracao: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT AUX.*,'#13#10'   case'#13#10'     when (aux.FINALIZADO = '#39'S'#39') and coa' +
      'lesce(aux.QTD_CONSUMO, 0) <= 0 then 100'#13#10'     when (aux.FINALIZA' +
      'DO = '#39'S'#39') and (round(coalesce(aux.QTD_PAGO, 0) - coalesce(aux.QT' +
      'D_RETORNO, 0) - aux.QTD_CONSUMO, 4) <> 0) then ((aux.QTD_PAGO - ' +
      'aux.QTD_RETORNO - aux.QTD_CONSUMO) * 100) / aux.QTD_CONSUMO'#13#10'   ' +
      '  else 0'#13#10'   end PERC_DIFERENCA,'#13#10'   case'#13#10'     when (aux.FINALI' +
      'ZADO = '#39'S'#39') and (round(coalesce(aux.QTD_PAGO, 0) - coalesce(aux.' +
      'QTD_RETORNO, 0), 4) <> 0) then round((coalesce(aux.QTD_PAGO, 0) ' +
      '- coalesce(aux.QTD_RETORNO, 0)), 4)'#13#10'     else 0'#13#10'   end QTD_REA' +
      'L'#13#10#13#10'FROM ('#13#10'select L.REFERENCIA, L.ID_MATERIAL, L.ID_COR_PRODUT' +
      'O, L.ID_COR_MATERIAL, sum(L.QTD_CONSUMO) QTD_CONSUMO,'#13#10'       M.' +
      'NOME NOME_MATERIAL, CMAT.NOME NOME_COR_MAT, CPROD.NOME NOME_COR_' +
      'PROD, M.UNIDADE UNIDADE_MATERIAL,'#13#10'       sum(coalesce(L.QTD_PAG' +
      'O, 0)) QTD_PAGO, sum(coalesce(L.QTD_RETORNO, 0)) QTD_RETORNO,'#13#10' ' +
      '      sum(coalesce(L.QTD_DIFERENCA, 0)) QTD_DIFERENCA, L.finaliz' +
      'ado'#13#10'from LOTE_MAT_PROD L'#13#10'inner join PRODUTO M on L.ID_MATERIAL' +
      ' = M.ID'#13#10'left join COMBINACAO CMAT on L.ID_COR_MATERIAL = CMAT.I' +
      'D'#13#10'left join COMBINACAO CPROD on L.ID_COR_PRODUTO = CPROD.ID'#13#10'gr' +
      'oup by L.REFERENCIA, L.ID_MATERIAL, L.ID_COR_PRODUTO, L.ID_COR_M' +
      'ATERIAL, M.NOME, CMAT.NOME, CPROD.NOME, M.UNIDADE, L.finalizado)' +
      ' AUX'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 342
    Top = 189
  end
  object dspConsPagRet_Ref_Geracao: TDataSetProvider
    DataSet = sdsConsPagRet_Ref_Geracao
    UpdateMode = upWhereKeyOnly
    Left = 394
    Top = 191
  end
  object cdsConsPagRet_Ref_Geracao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsPagRet_Ref_Geracao'
    Left = 446
    Top = 192
    object cdsConsPagRet_Ref_GeracaoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsConsPagRet_Ref_GeracaoID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object cdsConsPagRet_Ref_GeracaoID_COR_PRODUTO: TIntegerField
      FieldName = 'ID_COR_PRODUTO'
    end
    object cdsConsPagRet_Ref_GeracaoID_COR_MATERIAL: TIntegerField
      FieldName = 'ID_COR_MATERIAL'
    end
    object cdsConsPagRet_Ref_GeracaoQTD_CONSUMO: TFloatField
      FieldName = 'QTD_CONSUMO'
      DisplayFormat = '###,###,##0.000#'
    end
    object cdsConsPagRet_Ref_GeracaoNOME_MATERIAL: TStringField
      FieldName = 'NOME_MATERIAL'
      Size = 100
    end
    object cdsConsPagRet_Ref_GeracaoNOME_COR_MAT: TStringField
      FieldName = 'NOME_COR_MAT'
      Size = 60
    end
    object cdsConsPagRet_Ref_GeracaoNOME_COR_PROD: TStringField
      FieldName = 'NOME_COR_PROD'
      Size = 60
    end
    object cdsConsPagRet_Ref_GeracaoUNIDADE_MATERIAL: TStringField
      FieldName = 'UNIDADE_MATERIAL'
      Size = 6
    end
    object cdsConsPagRet_Ref_GeracaoQTD_PAGO: TFloatField
      FieldName = 'QTD_PAGO'
      DisplayFormat = '###,###,##0.000#'
    end
    object cdsConsPagRet_Ref_GeracaoQTD_RETORNO: TFloatField
      FieldName = 'QTD_RETORNO'
      DisplayFormat = '###,###,##0.000#'
    end
    object cdsConsPagRet_Ref_GeracaoQTD_DIFERENCA: TFloatField
      FieldName = 'QTD_DIFERENCA'
      DisplayFormat = '###,###,##0.000#'
    end
    object cdsConsPagRet_Ref_GeracaoFINALIZADO: TStringField
      FieldName = 'FINALIZADO'
      FixedChar = True
      Size = 1
    end
    object cdsConsPagRet_Ref_GeracaoPERC_DIFERENCA: TFloatField
      FieldName = 'PERC_DIFERENCA'
      DisplayFormat = '0.00'
    end
    object cdsConsPagRet_Ref_GeracaoQTD_REAL: TFloatField
      FieldName = 'QTD_REAL'
      DisplayFormat = '###,###,##0.000#'
    end
  end
  object dsConsPagRet_Ref_Geracao: TDataSource
    DataSet = cdsConsPagRet_Ref_Geracao
    Left = 484
    Top = 191
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
    ReportOptions.CreateDate = 43858.388081354200000000
    ReportOptions.LastChange = 43858.974793298610000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 636
    Top = 352
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
    Left = 676
    Top = 352
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
    Left = 716
    Top = 352
  end
  object frxRichObject1: TfrxRichObject
    Left = 748
    Top = 352
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 780
    Top = 353
  end
  object frxConsPagRet_Ref_Geracao: TfrxDBDataset
    UserName = 'frxConsPagRet_Ref_Geracao'
    CloseDataSource = False
    FieldAliases.Strings = (
      'REFERENCIA=REFERENCIA'
      'ID_MATERIAL=ID_MATERIAL'
      'ID_COR_PRODUTO=ID_COR_PRODUTO'
      'ID_COR_MATERIAL=ID_COR_MATERIAL'
      'QTD_CONSUMO=QTD_CONSUMO'
      'NOME_MATERIAL=NOME_MATERIAL'
      'NOME_COR_MAT=NOME_COR_MAT'
      'NOME_COR_PROD=NOME_COR_PROD'
      'UNIDADE_MATERIAL=UNIDADE_MATERIAL'
      'QTD_PAGO=QTD_PAGO'
      'QTD_RETORNO=QTD_RETORNO'
      'QTD_DIFERENCA=QTD_DIFERENCA'
      'FINALIZADO=FINALIZADO'
      'PERC_DIFERENCA=PERC_DIFERENCA'
      'QTD_REAL=QTD_REAL')
    DataSource = dsConsPagRet_Ref_Geracao
    BCDToCurrency = False
    Left = 636
    Top = 399
  end
end
