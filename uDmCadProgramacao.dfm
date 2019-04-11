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
    Top = 28
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
    object sdsProgramacaoNUM_BOCA: TIntegerField
      FieldName = 'NUM_BOCA'
    end
    object sdsProgramacaoDTPROGRAMACAO: TDateField
      FieldName = 'DTPROGRAMACAO'
    end
    object sdsProgramacaoTEMPO: TFloatField
      FieldName = 'TEMPO'
    end
    object sdsProgramacaoQTD: TFloatField
      FieldName = 'QTD'
    end
    object sdsProgramacaoSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
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
    object cdsProgramacaoNUM_BOCA: TIntegerField
      FieldName = 'NUM_BOCA'
    end
    object cdsProgramacaoDTPROGRAMACAO: TDateField
      FieldName = 'DTPROGRAMACAO'
    end
    object cdsProgramacaoTEMPO: TFloatField
      FieldName = 'TEMPO'
    end
    object cdsProgramacaoQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsProgramacaoSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
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
      'select P.NOME NOME_PROCESSO, L.NUM_ORDEM, L.NUM_LOTE, PROD.NOME ' +
      'NOME_PRODUTO, PROD.REFERENCIA,'#13#10'       BP.ID ID_BAIXA, BP.ITEM I' +
      'TEM_BAIXA, BP.QTD, L.ID_PRODUTO, VP.total_batidas, VP.qtd_por_mi' +
      'n,'#13#10'CASE'#13#10'  WHEN coalesce(VP.qtd_por_min,0) > 0 THEN ROUND((((l.' +
      'qtd * 100) / VP.qtd_por_min) / 60),2)'#13#10'  ELSE 0'#13#10'  END TEMPO_PRO' +
      'D, VP.setup_inicio, VP.setup_troca, '#39'S'#39' SOMA_SETUP_INI, '#39'S'#39' SOMA' +
      '_SETUP_TRO,'#13#10'  BP.ID_PROCESSO, BP.ID_LOTE'#13#10'from BAIXA_PROCESSO B' +
      'P'#13#10'inner join PROCESSO P on BP.ID_PROCESSO = P.ID'#13#10'inner join LO' +
      'TE L on BP.ID_LOTE = L.ID'#13#10'inner join PRODUTO PROD on L.ID_PRODU' +
      'TO = PROD.ID'#13#10'LEFT JOIN vprod_textil VP ON PROD.ID = VP.ID_PRODU' +
      'TO AND VP.tipo_producao = PROD.tipo_producao'#13#10'where P.CONTROLE_M' +
      'AQUINA = '#39'S'#39' and'#13#10'      (BP.DTENTRADA is null AND coalesce(BP.pr' +
      'ogramado,'#39'N'#39') = '#39'N'#39')'#13#10
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
    object cdsPendID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object cdsPendID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
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
    Top = 102
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
      end
      item
        Name = 'ID_Baixa'
        DataType = ftInteger
      end
      item
        Name = 'Item_Baixa'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 748
    Top = 224
    Data = {
      E10000009619E0BD01000000180000000B000000000003000000E1000A49445F
      4D617175696E6104000100000000000C4E6F6D655F4D617175696E6101004900
      00000100055749445448020002002800084E756D5F426F636104000100000000
      0003517464080004000000000007447446696E616C0400060000000000074872
      46696E616C04000700000000000554656D706F0800040000000000094474496E
      696369616C0400060000000000094872496E696369616C040007000000000008
      49445F426169786104000100000000000A4974656D5F42616978610400010000
      0000000000}
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
      DisplayFormat = 'HH:mm'
    end
    object mProgTempo: TFloatField
      FieldName = 'Tempo'
    end
    object mProgDtInicial: TDateField
      FieldName = 'DtInicial'
    end
    object mProgHrInicial: TTimeField
      FieldName = 'HrInicial'
      DisplayFormat = 'HH:mm'
    end
    object mProgID_Baixa: TIntegerField
      FieldName = 'ID_Baixa'
    end
    object mProgItem_Baixa: TIntegerField
      FieldName = 'Item_Baixa'
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
      'select P.ID_MAQUINA, P.num_boca, B.dtentrada, P.dtinicial, P.dtf' +
      'inal, B.QTD QTD_PROCESSO,'#13#10'P.QTD QTD_PROGRAMADA, P.hrinicial, P.' +
      'hrfinal'#13#10'from BAIXA_PROCESSO B'#13#10'INNER JOIN PROGRAMACAO P'#13#10'ON B.I' +
      'D = P.id_baixa'#13#10'AND B.ITEM = P.item_baixa'#13#10'where B.DTBAIXA is nu' +
      'll'#13#10'  and P.ID_MAQUINA = :ID_MAQUINA'
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
    Top = 20
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
        Name = 'ID_Maquina'
        DataType = ftInteger
      end
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
        Name = 'Num_Boca'
        DataType = ftInteger
      end
      item
        Name = 'Selecionado'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DtPrevista'
        DataType = ftDate
      end
      item
        Name = 'HrPrevista'
        DataType = ftTime
      end
      item
        Name = 'DtPrevista2'
        DataType = ftTimeStamp
      end
      item
        Name = 'DtInicial'
        DataType = ftDate
      end
      item
        Name = 'HrInicial'
        DataType = ftTime
      end
      item
        Name = 'Primeira_Hora'
        DataType = ftTime
      end
      item
        Name = 'Primeira_Data'
        DataType = ftDate
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
    Left = 736
    Top = 79
    Data = {
      6D0100009619E0BD02000000180000000F0000000000030000006D010A49445F
      4D617175696E6104000100000000000E5174645F50726F6772616D6164610800
      04000000000007447446696E616C040006000000000007487246696E616C0400
      070000000000095174645F476572617208000400000000000554656D706F0800
      040000000000084E756D5F426F636104000100000000000B53656C6563696F6E
      61646F01004900000001000557494454480200020001000A4474507265766973
      746104000600000000000A4872507265766973746104000700000000000B4474
      50726576697374613210001100000001000753554254595045020049000A0046
      6F726D617474656400094474496E696369616C0400060000000000094872496E
      696369616C04000700000000000D5072696D656972615F486F72610400070000
      0000000D5072696D656972615F44617461040006000000000001000D44454641
      554C545F4F524445520200820000000000}
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
      DisplayFormat = 'HH:mm'
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
    object mMaq_BocaDtPrevista: TDateField
      FieldName = 'DtPrevista'
    end
    object mMaq_BocaHrPrevista: TTimeField
      FieldName = 'HrPrevista'
      DisplayFormat = 'HH:mm'
    end
    object mMaq_BocaDtPrevista2: TSQLTimeStampField
      FieldName = 'DtPrevista2'
    end
    object mMaq_BocaDtInicial: TDateField
      FieldName = 'DtInicial'
    end
    object mMaq_BocaHrInicial: TTimeField
      FieldName = 'HrInicial'
      DisplayFormat = 'HH:mm'
    end
    object mMaq_BocaPrimeira_Hora: TTimeField
      FieldName = 'Primeira_Hora'
      DisplayFormat = 'HH:mm'
    end
    object mMaq_BocaPrimeira_Data: TDateField
      FieldName = 'Primeira_Data'
    end
  end
  object dsmMaq_Boca: TDataSource
    DataSet = mMaq_Boca
    Left = 776
    Top = 80
  end
  object qParametros_Lote: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT L.total_horas_prod'
      'FROM PARAMETROS_LOTE L')
    SQLConnection = dmDatabase.scoDados
    Left = 440
    Top = 191
    object qParametros_LoteTOTAL_HORAS_PROD: TFloatField
      FieldName = 'TOTAL_HORAS_PROD'
    end
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
    Left = 63
    Top = 221
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
    object sdsBaixa_ProcessoPROGRAMADO: TStringField
      FieldName = 'PROGRAMADO'
      FixedChar = True
      Size = 1
    end
  end
  object dspBaixa_Processo: TDataSetProvider
    DataSet = sdsBaixa_Processo
    UpdateMode = upWhereKeyOnly
    Left = 120
    Top = 221
  end
  object cdsBaixa_Processo: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID;ITEM'
    Params = <>
    ProviderName = 'dspBaixa_Processo'
    Left = 177
    Top = 220
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
    object cdsBaixa_ProcessoPROGRAMADO: TStringField
      FieldName = 'PROGRAMADO'
      FixedChar = True
      Size = 1
    end
  end
  object dsBaixa_Processo: TDataSource
    DataSet = cdsBaixa_Processo
    Left = 224
    Top = 221
  end
end
