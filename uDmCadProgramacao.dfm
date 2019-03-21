object DMCadProgramacao: TDMCadProgramacao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 218
  Top = 219
  Height = 391
  Width = 896
  object sdsProgramacao: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM PROGRAMACAO'#13#10'WHERE ID = :ID'
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
    object sdsProgramacaoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsProgramacaoID_BAIXA: TIntegerField
      FieldName = 'ID_BAIXA'
    end
    object sdsProgramacaoITEM_BAIXA: TIntegerField
      FieldName = 'ITEM_BAIXA'
    end
    object sdsProgramacaoID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object sdsProgramacaoID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
    end
    object sdsProgramacaoNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object sdsProgramacaoNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object sdsProgramacaoDTINICIAL: TDateField
      FieldName = 'DTINICIAL'
    end
    object sdsProgramacaoHRINICIAL: TTimeField
      FieldName = 'HRINICIAL'
    end
    object sdsProgramacaoDTFINAL: TDateField
      FieldName = 'DTFINAL'
    end
    object sdsProgramacaoHRFINAL: TTimeField
      FieldName = 'HRFINAL'
    end
    object sdsProgramacaoID_MAQUINA: TIntegerField
      FieldName = 'ID_MAQUINA'
    end
  end
  object dspProgramacao: TDataSetProvider
    DataSet = sdsProgramacao
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspProgramacaoUpdateError
    Left = 104
    Top = 29
  end
  object cdsProgramacao: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspProgramacao'
    Left = 144
    Top = 29
    object cdsProgramacaoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsProgramacaoID_BAIXA: TIntegerField
      FieldName = 'ID_BAIXA'
    end
    object cdsProgramacaoITEM_BAIXA: TIntegerField
      FieldName = 'ITEM_BAIXA'
    end
    object cdsProgramacaoID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object cdsProgramacaoID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
    end
    object cdsProgramacaoNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsProgramacaoNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object cdsProgramacaoDTINICIAL: TDateField
      FieldName = 'DTINICIAL'
    end
    object cdsProgramacaoHRINICIAL: TTimeField
      FieldName = 'HRINICIAL'
    end
    object cdsProgramacaoDTFINAL: TDateField
      FieldName = 'DTFINAL'
    end
    object cdsProgramacaoHRFINAL: TTimeField
      FieldName = 'HRFINAL'
    end
    object cdsProgramacaoID_MAQUINA: TIntegerField
      FieldName = 'ID_MAQUINA'
    end
  end
  object dsProgramacao: TDataSource
    DataSet = cdsProgramacao
    Left = 184
    Top = 29
  end
  object sdsPend: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select P.NOME NOME_PROCESSO, BP.ID_MAQUINA, L.NUM_ORDEM, L.NUM_L' +
      'OTE, PROD.NOME NOME_PRODUTO, PROD.REFERENCIA,'#13#10'       BP.ID ID_B' +
      'AIXA, BP.ITEM ITEM_BAIXA, BP.QTD, L.ID_PRODUTO, VP.total_batidas' +
      ', VP.qtd_por_min,'#13#10'CASE'#13#10'  WHEN coalesce(VP.qtd_por_min,0) > 0 T' +
      'HEN ROUND((((l.qtd * 100) / VP.qtd_por_min) / 60),3)'#13#10'  ELSE 0'#13#10 +
      '  END TEMPO_PROD'#13#10'from BAIXA_PROCESSO BP'#13#10'inner join PROCESSO P ' +
      'on BP.ID_PROCESSO = P.ID'#13#10'inner join LOTE L on BP.ID_LOTE = L.ID' +
      #13#10'inner join PRODUTO PROD on L.ID_PRODUTO = PROD.ID'#13#10'LEFT JOIN v' +
      'prod_textil VP ON PROD.ID = VP.ID_PRODUTO'#13#10'left join PROGRAMACAO' +
      ' PG on BP.ID = PG.ID_BAIXA AND BP.ITEM = PG.ITEM_BAIXA'#13#10'where P.' +
      'CONTROLE_MAQUINA = '#39'S'#39' and'#13#10'      BP.DTENTRADA is null and'#13#10'    ' +
      '  PG.dtinicial IS NULL'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 368
    Top = 37
  end
  object dspPend: TDataSetProvider
    DataSet = sdsPend
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspProgramacaoUpdateError
    Left = 408
    Top = 37
  end
  object cdsPend: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPend'
    Left = 448
    Top = 37
    object cdsPendNOME_PROCESSO: TStringField
      FieldName = 'NOME_PROCESSO'
      Size = 30
    end
    object cdsPendID_MAQUINA: TIntegerField
      FieldName = 'ID_MAQUINA'
    end
    object cdsPendNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsPendNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object cdsPendNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object cdsPendREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsPendID_BAIXA: TIntegerField
      FieldName = 'ID_BAIXA'
      Required = True
    end
    object cdsPendITEM_BAIXA: TIntegerField
      FieldName = 'ITEM_BAIXA'
      Required = True
    end
    object cdsPendQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsPendID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsPendTOTAL_BATIDAS: TFloatField
      FieldName = 'TOTAL_BATIDAS'
    end
    object cdsPendQTD_POR_MIN: TFloatField
      FieldName = 'QTD_POR_MIN'
    end
    object cdsPendTEMPO_PROD: TFloatField
      FieldName = 'TEMPO_PROD'
    end
  end
  object dsPend: TDataSource
    DataSet = cdsPend
    Left = 488
    Top = 37
  end
  object sdsMaqPend: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select AUX.*'#13#10'from (select P.ID, M.NOME NOME_MAQUINA, M.QTD_BOCA' +
      ', M.QTD_FUSO, M.ESPESSURA, PMAQ.ID_MAQUINA, M.QTD_BOCA -'#13#10'      ' +
      '      coalesce((select V.CONTADOR from VMAQ_EM_USO V where V.ID_' +
      'MAQUINA = PMAQ.ID_MAQUINA), 0) BOCA_DISPONIVEL'#13#10'      from PRODU' +
      'TO P'#13#10'      inner join PRODUTO_MAQ PMAQ on P.ID = PMAQ.ID'#13#10'     ' +
      ' inner join MAQUINA M on PMAQ.ID_MAQUINA = M.ID'#13#10'      where P.I' +
      'D = :ID) AUX'#13#10'where AUX.BOCA_DISPONIVEL > 0'#13#10#13#10'  '
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 368
    Top = 101
  end
  object dspMaqPend: TDataSetProvider
    DataSet = sdsMaqPend
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspProgramacaoUpdateError
    Left = 408
    Top = 101
  end
  object cdsMaqPend: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMaqPend'
    Left = 448
    Top = 101
    object cdsMaqPendID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsMaqPendNOME_MAQUINA: TStringField
      FieldName = 'NOME_MAQUINA'
      Size = 30
    end
    object cdsMaqPendQTD_BOCA: TIntegerField
      FieldName = 'QTD_BOCA'
    end
    object cdsMaqPendQTD_FUSO: TIntegerField
      FieldName = 'QTD_FUSO'
    end
    object cdsMaqPendESPESSURA: TFloatField
      FieldName = 'ESPESSURA'
    end
    object cdsMaqPendID_MAQUINA: TIntegerField
      FieldName = 'ID_MAQUINA'
    end
    object cdsMaqPendBOCA_DISPONIVEL: TFMTBCDField
      FieldName = 'BOCA_DISPONIVEL'
      Precision = 15
      Size = 0
    end
  end
  object dsMaqPend: TDataSource
    DataSet = cdsMaqPend
    Left = 488
    Top = 101
  end
end
