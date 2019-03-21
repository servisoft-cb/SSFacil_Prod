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
      'AIXA, BP.ITEM ITEM_BAIXA, BP.QTD'#13#10'from BAIXA_PROCESSO BP'#13#10'inner ' +
      'join PROCESSO P on BP.ID_PROCESSO = P.ID'#13#10'inner join LOTE L on B' +
      'P.ID_LOTE = L.ID'#13#10'inner join PRODUTO PROD on L.ID_PRODUTO = PROD' +
      '.ID'#13#10'left join PROGRAMACAO PG on BP.ID = PG.ID_BAIXA AND BP.ITEM' +
      ' = PG.ITEM_BAIXA'#13#10'where P.CONTROLE_MAQUINA = '#39'S'#39' and'#13#10'      BP.D' +
      'TENTRADA is null and'#13#10'      PG.dtinicial IS NULL'#13#10
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
    IndexFieldNames = 'ID'
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
  end
  object dsPend: TDataSource
    DataSet = cdsPend
    Left = 488
    Top = 37
  end
end
