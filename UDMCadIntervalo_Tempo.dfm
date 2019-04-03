object DMCadIntervalo_Tempo: TDMCadIntervalo_Tempo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 523
  Top = 147
  Height = 296
  Width = 473
  object sdsIntervalo_Tempo: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM INTERVALO_TEMPO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 56
    Top = 32
    object sdsIntervalo_TempoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sdsIntervalo_TempoHRINICIAL: TTimeField
      FieldName = 'HRINICIAL'
    end
    object sdsIntervalo_TempoHRFINAL: TTimeField
      FieldName = 'HRFINAL'
    end
    object sdsIntervalo_TempoTEMPO: TFloatField
      FieldName = 'TEMPO'
    end
    object sdsIntervalo_TempoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
  end
  object dspIntervalo_Tempo: TDataSetProvider
    DataSet = sdsIntervalo_Tempo
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspIntervalo_TempoUpdateError
    Left = 128
    Top = 32
  end
  object cdsIntervalo_Tempo: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspIntervalo_Tempo'
    Left = 192
    Top = 32
    object cdsIntervalo_TempoID: TIntegerField
      FieldName = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsIntervalo_TempoHRINICIAL: TTimeField
      FieldName = 'HRINICIAL'
    end
    object cdsIntervalo_TempoHRFINAL: TTimeField
      FieldName = 'HRFINAL'
    end
    object cdsIntervalo_TempoTEMPO: TFloatField
      FieldName = 'TEMPO'
    end
    object cdsIntervalo_TempoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
  end
  object dsIntervalo_Tempo: TDataSource
    DataSet = cdsIntervalo_Tempo
    Left = 264
    Top = 32
  end
end
