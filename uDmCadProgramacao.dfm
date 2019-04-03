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
      'HEN ROUND((((l.qtd * 100) / VP.qtd_por_min) / 60),2)'#13#10'  ELSE 0'#13#10 +
      '  END TEMPO_PROD, VP.setup_inicio, VP.setup_troca, '#39'S'#39' SOMA_SETU' +
      'P_INI, '#39'S'#39' SOMA_SETUP_TRO'#13#10'from BAIXA_PROCESSO BP'#13#10'inner join PR' +
      'OCESSO P on BP.ID_PROCESSO = P.ID'#13#10'inner join LOTE L on BP.ID_LO' +
      'TE = L.ID'#13#10'inner join PRODUTO PROD on L.ID_PRODUTO = PROD.ID'#13#10'LE' +
      'FT JOIN vprod_textil VP ON PROD.ID = VP.ID_PRODUTO AND VP.tipo_p' +
      'roducao = PROD.tipo_producao'#13#10'left join PROGRAMACAO PG on BP.ID ' +
      '= PG.ID_BAIXA AND BP.ITEM = PG.ITEM_BAIXA'#13#10'where P.CONTROLE_MAQU' +
      'INA = '#39'S'#39' and'#13#10'      BP.DTENTRADA is null and'#13#10'      PG.dtinicia' +
      'l IS NULL'
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
    OnCalcFields = cdsPendCalcFields
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
    object cdsPendSETUP_INICIO: TFloatField
      FieldName = 'SETUP_INICIO'
    end
    object cdsPendSETUP_TROCA: TFloatField
      FieldName = 'SETUP_TROCA'
    end
    object cdsPendSOMA_SETUP_INI: TStringField
      FieldName = 'SOMA_SETUP_INI'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsPendSOMA_SETUP_TRO: TStringField
      FieldName = 'SOMA_SETUP_TRO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsPendclTempo_Hora: TFloatField
      FieldKind = fkCalculated
      FieldName = 'clTempo_Hora'
      Calculated = True
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
      'select P.ID, M.NOME NOME_MAQUINA, M.QTD_BOCA, M.QTD_FUSO, M.ESPE' +
      'SSURA, PMAQ.ID_MAQUINA, M.QTD_BOCA -'#13#10'            coalesce((sele' +
      'ct V.CONTADOR from VMAQ_EM_USO V where V.ID_MAQUINA = PMAQ.ID_MA' +
      'QUINA), 0) BOCA_DISPONIVEL'#13#10'      from PRODUTO P'#13#10'      inner jo' +
      'in PRODUTO_MAQ PMAQ on P.ID = PMAQ.ID'#13#10'      inner join MAQUINA ' +
      'M on PMAQ.ID_MAQUINA = M.ID'#13#10'      where P.ID = :ID'#13#10#13#10'  '
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
    OnCalcFields = cdsMaqPendCalcFields
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
    object cdsMaqPendclTempo_Hora: TFloatField
      FieldKind = fkCalculated
      FieldName = 'clTempo_Hora'
      Calculated = True
    end
  end
  object dsMaqPend: TDataSource
    DataSet = cdsMaqPend
    Left = 488
    Top = 101
  end
  object mMaq: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Qtd_Bocas'
        DataType = ftInteger
      end
      item
        Name = 'Qtd_Disponivel'
        DataType = ftInteger
      end
      item
        Name = 'Qtd_Prog'
        DataType = ftFloat
      end>
    IndexDefs = <>
    IndexFieldNames = 'ID'
    Params = <>
    StoreDefs = True
    Left = 744
    Top = 168
    Data = {
      780000009619E0BD010000001800000005000000000003000000780002494404
      00010000000000044E6F6D650100490000000100055749445448020002002800
      095174645F426F63617304000100000000000E5174645F446973706F6E697665
      6C0400010000000000085174645F50726F6708000400000000000000}
    object mMaqID: TIntegerField
      FieldName = 'ID'
    end
    object mMaqNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object mMaqQtd_Bocas: TIntegerField
      FieldName = 'Qtd_Bocas'
    end
    object mMaqQtd_Disponivel: TIntegerField
      FieldName = 'Qtd_Disponivel'
    end
    object mMaqQtd_Prog: TFloatField
      FieldName = 'Qtd_Prog'
      DisplayFormat = '0.00'
    end
  end
  object dsmMaq: TDataSource
    DataSet = mMaq
    Left = 784
    Top = 168
  end
  object mProg: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_Maquina'
        DataType = ftInteger
      end
      item
        Name = 'Nome_Maquina'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Num_Boca'
        DataType = ftInteger
      end
      item
        Name = 'Qtd'
        DataType = ftFloat
      end
      item
        Name = 'DtFinal'
        DataType = ftDate
      end
      item
        Name = 'HrFinal'
        DataType = ftTime
      end
      item
        Name = 'Tempo'
        DataType = ftFloat
      end
      item
        Name = 'DtInicial'
        DataType = ftDate
      end
      item
        Name = 'HrInicial'
        DataType = ftTime
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 745
    Top = 224
    Data = {
      BD0000009619E0BD010000001800000009000000000003000000BD000A49445F
      4D617175696E6104000100000000000C4E6F6D655F4D617175696E6101004900
      00000100055749445448020002002800084E756D5F426F636104000100000000
      0003517464080004000000000007447446696E616C0400060000000000074872
      46696E616C04000700000000000554656D706F0800040000000000094474496E
      696369616C0400060000000000094872496E696369616C040007000000000000
      00}
    object mProgID_Maquina: TIntegerField
      FieldName = 'ID_Maquina'
    end
    object mProgNome_Maquina: TStringField
      FieldName = 'Nome_Maquina'
      Size = 40
    end
    object mProgNum_Boca: TIntegerField
      FieldName = 'Num_Boca'
    end
    object mProgQtd: TFloatField
      FieldName = 'Qtd'
      DisplayFormat = '0.00'
    end
    object mProgDtFinal: TDateField
      FieldName = 'DtFinal'
    end
    object mProgHrFinal: TTimeField
      FieldName = 'HrFinal'
    end
    object mProgTempo: TFloatField
      FieldName = 'Tempo'
    end
    object mProgDtInicial: TDateField
      FieldName = 'DtInicial'
    end
    object mProgHrInicial: TTimeField
      FieldName = 'HrInicial'
    end
  end
  object dsmProg: TDataSource
    DataSet = mProg
    Left = 792
    Top = 224
  end
  object sdsMaqUsada: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select B.ID_MAQUINA, B.num_boca, B.dtentrada, P.dtinicial, P.dtf' +
      'inal, B.QTD QTD_PROCESSO,'#13#10'P.QTD QTD_PROGRAMADA, P.hrinicial, P.' +
      'hrfinal'#13#10'from BAIXA_PROCESSO B'#13#10'INNER JOIN PROGRAMACAO P'#13#10'ON B.I' +
      'D = P.id_baixa'#13#10'where B.DTBAIXA is null'#13#10'  and B.ID_MAQUINA = :I' +
      'D_MAQUINA'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_MAQUINA'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 664
    Top = 21
  end
  object dspMaqUsada: TDataSetProvider
    DataSet = sdsMaqUsada
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspProgramacaoUpdateError
    Left = 704
    Top = 21
  end
  object cdsMaqUsada: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMaqUsada'
    OnCalcFields = cdsMaqPendCalcFields
    Left = 744
    Top = 21
    object cdsMaqUsadaID_MAQUINA: TIntegerField
      FieldName = 'ID_MAQUINA'
    end
    object cdsMaqUsadaNUM_BOCA: TIntegerField
      FieldName = 'NUM_BOCA'
    end
    object cdsMaqUsadaDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object cdsMaqUsadaDTINICIAL: TDateField
      FieldName = 'DTINICIAL'
    end
    object cdsMaqUsadaDTFINAL: TDateField
      FieldName = 'DTFINAL'
    end
    object cdsMaqUsadaQTD_PROCESSO: TFloatField
      FieldName = 'QTD_PROCESSO'
    end
    object cdsMaqUsadaQTD_PROGRAMADA: TFloatField
      FieldName = 'QTD_PROGRAMADA'
    end
    object cdsMaqUsadaHRINICIAL: TTimeField
      FieldName = 'HRINICIAL'
    end
    object cdsMaqUsadaHRFINAL: TTimeField
      FieldName = 'HRFINAL'
    end
  end
  object dsMaqUsada: TDataSource
    DataSet = cdsMaqUsada
    Left = 784
    Top = 24
  end
  object mMaq_Boca: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Qtd_Programada'
        DataType = ftFloat
      end
      item
        Name = 'DtFinal'
        DataType = ftDate
      end
      item
        Name = 'HrFinal'
        DataType = ftTime
      end
      item
        Name = 'Qtd_Gerar'
        DataType = ftFloat
      end
      item
        Name = 'Tempo'
        DataType = ftFloat
      end
      item
        Name = 'ID_Maquina'
        DataType = ftInteger
      end
      item
        Name = 'Num_Boca'
        DataType = ftInteger
      end
      item
        Name = 'Selecionado'
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
    IndexFieldNames = 'ID_Maquina'
    MasterFields = 'ID'
    MasterSource = dsmMaq
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 735
    Top = 80
    Data = {
      CB0000009619E0BD010000001800000008000000000003000000CB000E517464
      5F50726F6772616D616461080004000000000007447446696E616C0400060000
      00000007487246696E616C0400070000000000095174645F4765726172080004
      00000000000554656D706F08000400000000000A49445F4D617175696E610400
      010000000000084E756D5F426F636104000100000000000B53656C6563696F6E
      61646F010049000000010005574944544802000200010001000D44454641554C
      545F4F524445520200820000000000}
    object mMaq_BocaID_Maquina: TIntegerField
      FieldName = 'ID_Maquina'
    end
    object mMaq_BocaQtd_Programada: TFloatField
      FieldName = 'Qtd_Programada'
      DisplayFormat = '0.00'
    end
    object mMaq_BocaDtFinal: TDateField
      FieldName = 'DtFinal'
    end
    object mMaq_BocaHrFinal: TTimeField
      FieldName = 'HrFinal'
    end
    object mMaq_BocaQtd_Gerar: TFloatField
      FieldName = 'Qtd_Gerar'
      DisplayFormat = '0.00'
    end
    object mMaq_BocaTempo: TFloatField
      FieldName = 'Tempo'
    end
    object mMaq_BocaNum_Boca: TIntegerField
      FieldName = 'Num_Boca'
    end
    object mMaq_BocaSelecionado: TStringField
      FieldName = 'Selecionado'
      Size = 1
    end
  end
  object dsmMaq_Boca: TDataSource
    DataSet = mMaq_Boca
    Left = 776
    Top = 80
  end
end
