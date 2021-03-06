object DMBaixaMaterial: TDMBaixaMaterial
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 238
  Top = 113
  Height = 493
  Width = 992
  object sdsLoteMat: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT LOT.NUM_ORDEM, LOT.ITEM, LOT.ID_MATERIAL, LOT.QTD_CONSUMO' +
      ', LOT.QTD_EST_BAIXADO, PRO.NOME, PRO.UNIDADE, PRO.PRECO_VENDA'#13#10'F' +
      'ROM LOTE_MAT LOT'#13#10'INNER JOIN PRODUTO PRO ON LOT.ID_MATERIAL = PR' +
      'O.ID'#13#10'WHERE NUM_ORDEM = :NUM_ORDEM  '
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_ORDEM'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 48
    Top = 24
    object sdsLoteMatNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
      Required = True
    end
    object sdsLoteMatITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object sdsLoteMatID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object sdsLoteMatQTD_CONSUMO: TFloatField
      FieldName = 'QTD_CONSUMO'
    end
    object sdsLoteMatQTD_EST_BAIXADO: TFloatField
      FieldName = 'QTD_EST_BAIXADO'
    end
    object sdsLoteMatNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object sdsLoteMatUNIDADE: TStringField
      FieldName = 'UNIDADE'
      ProviderFlags = []
      Size = 6
    end
    object sdsLoteMatPRECO_VENDA: TFloatField
      FieldName = 'PRECO_VENDA'
      ProviderFlags = []
    end
  end
  object dspLoteMat: TDataSetProvider
    DataSet = sdsLoteMat
    Left = 120
    Top = 24
  end
  object dsLoteMat: TDataSource
    DataSet = cdsLoteMat
    Left = 288
    Top = 24
  end
  object cdsLoteMat: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NUM_ORDEM;ITEM'
    Params = <>
    ProviderName = 'dspLoteMat'
    OnCalcFields = cdsLoteMatCalcFields
    Left = 216
    Top = 24
    object cdsLoteMatNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
      Required = True
    end
    object cdsLoteMatITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsLoteMatID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object cdsLoteMatQTD_CONSUMO: TFloatField
      FieldName = 'QTD_CONSUMO'
      DisplayFormat = '###,##0.0000'
    end
    object cdsLoteMatQTD_EST_BAIXADO: TFloatField
      FieldName = 'QTD_EST_BAIXADO'
      DisplayFormat = '###,##0.0000'
    end
    object cdsLoteMatNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsLoteMatSaldo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Saldo'
      DisplayFormat = '###,##0.0000'
      Calculated = True
    end
    object cdsLoteMatUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsLoteMatPRECO_VENDA: TFloatField
      FieldName = 'PRECO_VENDA'
      ProviderFlags = []
    end
  end
  object sdsLoteMatEst: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT * FROM LOTE_MAT_EST'#13#10'WHERE NUM_ORDEM = :NUM_ORD AND ITEM ' +
      '= :ITEM'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_ORD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ITEM'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 48
    Top = 104
    object sdsLoteMatEstID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsLoteMatEstNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object sdsLoteMatEstITEM: TIntegerField
      FieldName = 'ITEM'
    end
    object sdsLoteMatEstQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsLoteMatEstDTMOVIMENTO: TDateField
      FieldName = 'DTMOVIMENTO'
    end
    object sdsLoteMatEstID_MOVESTOQUE: TIntegerField
      FieldName = 'ID_MOVESTOQUE'
    end
    object sdsLoteMatEstFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
  end
  object dspLoteMatEst: TDataSetProvider
    DataSet = sdsLoteMatEst
    Left = 128
    Top = 104
  end
  object cdsLoteMatEst: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspLoteMatEst'
    Left = 216
    Top = 104
    object cdsLoteMatEstID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsLoteMatEstNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsLoteMatEstITEM: TIntegerField
      FieldName = 'ITEM'
    end
    object cdsLoteMatEstQTD: TFloatField
      FieldName = 'QTD'
      DisplayFormat = '###,##0.0000'
    end
    object cdsLoteMatEstDTMOVIMENTO: TDateField
      FieldName = 'DTMOVIMENTO'
    end
    object cdsLoteMatEstID_MOVESTOQUE: TIntegerField
      FieldName = 'ID_MOVESTOQUE'
    end
    object cdsLoteMatEstFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
  end
  object dsLotMatEst: TDataSource
    DataSet = cdsLoteMatEst
    Left = 296
    Top = 104
  end
  object sdsFilial: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT ID,NOME FROM FILIAL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 40
    Top = 184
    object sdsFilialID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsFilialNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object dspFilial: TDataSetProvider
    DataSet = sdsFilial
    Left = 128
    Top = 184
  end
  object cdsFilial: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFilial'
    Left = 216
    Top = 184
    object cdsFilialID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsFilialNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object dsFilial: TDataSource
    DataSet = cdsFilial
    Left = 312
    Top = 184
  end
  object sdsMaterial_Nec: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT AUX.*,'#13#10' ((COALESCE(AUX.QTD_ESTOQUE,0) + COALESCE(AUX.QTD' +
      '_OC,0)) - COALESCE(AUX.QTD_PED,0) - COALESCE(AUX.QTD_REM,0) - CO' +
      'ALESCE(AUX.QTD_ESTOQUE_MIN,0)) QTD_SALDO'#13#10'FROM ('#13#10'SELECT SUM(V.q' +
      'td_pedido_prod) QPED, SUM(V.qtd_remessa_prod) QREM,'#13#10'VF.ID_MATER' +
      'IAL, vf.id_cor_mat, sum(vf.qtd_consumo * V.qtd_pedido_prod) QTD_' +
      'PED,'#13#10'vf.material, vf.nome_cor, vf.unidade, VF.qtd_estoque_min,'#13 +
      #10'SUM(VF.QTD_CONSUMO * V.qtd_remessa_prod) QTD_REM,'#13#10'(SELECT SUM(' +
      'EST.QTD) FROM ESTOQUE_ATUAL EST'#13#10'  WHERE EST.ID_PRODUTO = VF.ID_' +
      'MATERIAL'#13#10'    AND EST.ID_COR = VF.ID_COR_MAT) QTD_ESTOQUE,'#13#10'(SEL' +
      'ECT SUM(OC.QTD_RESTANTE) FROM PEDIDO_ITEM OC'#13#10'  INNER JOIN PEDID' +
      'O POC'#13#10'  ON OC.ID = POC.ID'#13#10'  WHERE OC.TIPO_REG = '#39'C'#39#13#10'    AND O' +
      'C.ID_PRODUTO = VF.ID_MATERIAL'#13#10'    AND OC.ID_COR = VF.ID_COR_MAT' +
      #13#10'    AND OC.QTD_RESTANTE > 0 /*1*/ ) QTD_OC'#13#10'FROM vsaldoprod V'#13 +
      #10'INNER JOIN VFICHA_TECNICA VF'#13#10'  ON V.ID_PRODUTO = VF.ID'#13#10' AND V' +
      '.ID_COR = VF.ID_COR_COMBINACAO'#13#10'WHERE ((V.DTPEDIDO >= :DTPEDIDO1' +
      #13#10'  AND V.DTPEDIDO <= :DTPEDIDO2)'#13#10'  OR  (V.DTREMESSA >= :DTREME' +
      'SSA1'#13#10'  AND V.DTREMESSA <= :DTREMESSA2)) /*2*/'#13#10'GROUP BY VF.ID_M' +
      'ATERIAL, vf.id_cor_mat, vf.material, vf.nome_cor, vf.unidade, VF' +
      '.qtd_estoque_min) AUX'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DTPEDIDO1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DTPEDIDO2'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DTREMESSA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DTREMESSA2'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 656
    Top = 72
  end
  object dspMaterial_Nec: TDataSetProvider
    DataSet = sdsMaterial_Nec
    Left = 712
    Top = 72
  end
  object cdsMaterial_Nec: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMaterial_Nec'
    Left = 760
    Top = 72
    object cdsMaterial_NecQPED: TFloatField
      FieldName = 'QPED'
    end
    object cdsMaterial_NecQREM: TFloatField
      FieldName = 'QREM'
    end
    object cdsMaterial_NecID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object cdsMaterial_NecID_COR_MAT: TFMTBCDField
      FieldName = 'ID_COR_MAT'
      Precision = 15
      Size = 0
    end
    object cdsMaterial_NecQTD_PED: TFloatField
      FieldName = 'QTD_PED'
      DisplayFormat = '###,###,##0.0000'
    end
    object cdsMaterial_NecMATERIAL: TStringField
      FieldName = 'MATERIAL'
      Size = 100
    end
    object cdsMaterial_NecNOME_COR: TStringField
      FieldName = 'NOME_COR'
      Size = 60
    end
    object cdsMaterial_NecUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsMaterial_NecQTD_REM: TFloatField
      FieldName = 'QTD_REM'
      DisplayFormat = '###,###,##0.0000'
    end
    object cdsMaterial_NecQTD_ESTOQUE: TFMTBCDField
      FieldName = 'QTD_ESTOQUE'
      DisplayFormat = '###,###,##0.0000'
      Precision = 15
      Size = 6
    end
    object cdsMaterial_NecQTD_OC: TFloatField
      FieldName = 'QTD_OC'
      DisplayFormat = '###,###,##0.0000'
    end
    object cdsMaterial_NecQTD_ESTOQUE_MIN: TFloatField
      FieldName = 'QTD_ESTOQUE_MIN'
      DisplayFormat = '###,###,##0.0000'
    end
    object cdsMaterial_NecQTD_SALDO: TFloatField
      FieldName = 'QTD_SALDO'
      DisplayFormat = '###,###,##0.0000'
    end
  end
  object dsMaterial_Nec: TDataSource
    DataSet = cdsMaterial_Nec
    Left = 816
    Top = 72
  end
  object sdsTalao_Est: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM TALAO_EST'#13#10'WHERE ID = :ID'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 40
    Top = 256
    object sdsTalao_EstID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsTalao_EstID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
    end
    object sdsTalao_EstNUM_TALAO: TIntegerField
      FieldName = 'NUM_TALAO'
    end
    object sdsTalao_EstID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
    end
    object sdsTalao_EstID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object sdsTalao_EstQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsTalao_EstFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object sdsTalao_EstID_MOVESTOQUE: TIntegerField
      FieldName = 'ID_MOVESTOQUE'
    end
  end
  object dspTalao_Est: TDataSetProvider
    DataSet = sdsTalao_Est
    Left = 120
    Top = 256
  end
  object cdsTalao_Est: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTalao_Est'
    Left = 208
    Top = 256
    object cdsTalao_EstID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsTalao_EstID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
    end
    object cdsTalao_EstNUM_TALAO: TIntegerField
      FieldName = 'NUM_TALAO'
    end
    object cdsTalao_EstID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
    end
    object cdsTalao_EstID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object cdsTalao_EstQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsTalao_EstFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsTalao_EstID_MOVESTOQUE: TIntegerField
      FieldName = 'ID_MOVESTOQUE'
    end
  end
  object dsTalao_Est: TDataSource
    DataSet = cdsTalao_Est
    Left = 288
    Top = 256
  end
end
