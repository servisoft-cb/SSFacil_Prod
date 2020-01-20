object DMBaixaMaterial_Prod: TDMBaixaMaterial_Prod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 360
  Top = 225
  Height = 375
  Width = 652
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
      '_CUSTO, M.UNIDADE UNIDADE_MATERIAL'#13#10'from LOTE_MAT_PROD L'#13#10'inner ' +
      'join PRODUTO M on L.ID_MATERIAL = M.ID'#13#10'left join COMBINACAO CMA' +
      'T on L.ID_COR_MATERIAL = CMAT.ID'#13#10'left join COMBINACAO CPROD on ' +
      'L.ID_COR_PRODUTO = CPROD.ID  '
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 343
    Top = 18
  end
  object dspConsLoteMat_Prod: TDataSetProvider
    DataSet = sdsConsLoteMat_Prod
    UpdateMode = upWhereKeyOnly
    Left = 390
    Top = 19
  end
  object cdsConsLoteMat_Prod: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsLoteMat_Prod'
    Left = 441
    Top = 18
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
    end
    object cdsConsLoteMat_ProdQTD_PRODUTO: TFloatField
      FieldName = 'QTD_PRODUTO'
    end
    object cdsConsLoteMat_ProdQTD_PAGO: TFloatField
      FieldName = 'QTD_PAGO'
    end
    object cdsConsLoteMat_ProdQTD_RETORNO: TFloatField
      FieldName = 'QTD_RETORNO'
    end
    object cdsConsLoteMat_ProdQTD_DIFERENCA: TFloatField
      FieldName = 'QTD_DIFERENCA'
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
  end
  object dsConsLoteMat_Prod: TDataSource
    DataSet = cdsConsLoteMat_Prod
    Left = 484
    Top = 18
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
    Left = 339
    Top = 143
    object qParametros_EstID_FILIAL_LOTE_MAT_EST: TIntegerField
      FieldName = 'ID_FILIAL_LOTE_MAT_EST'
    end
  end
end
