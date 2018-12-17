object DMLoteImp_Calc: TDMLoteImp_Calc
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 363
  Top = 115
  Height = 603
  Width = 798
  object frxReport1: TfrxReport
    Tag = 1
    Version = '5.6.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43402.700424687500000000
    ReportOptions.LastChange = 43420.474039398150000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 368
    Top = 335
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
    Left = 408
    Top = 335
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
    Left = 448
    Top = 335
  end
  object frxRichObject1: TfrxRichObject
    Left = 480
    Top = 335
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 312
    Top = 304
  end
  object sdsConsulta_Lote: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT L.NUM_REMESSA, TS.id, TS.num_talao, TS.item, TS.id_setor,' +
      ' TS.dtentrada, TS.hrentrada,'#13#10'TS.dtsaida, TS.hrsaida, TS.qtd, TS' +
      '.total_horas, T.id_produto, T.tamanho,'#13#10'T.referencia, L.num_lote' +
      ', L.num_ordem, t.id_combinacao,  S.nome NOME_SETOR,'#13#10'COMB.nome N' +
      'OME_COMBINACAO, l.dtentrega, ts.qtd_produzido, ts.qtd_pendente'#13#10 +
      'FROM TALAO_SETOR TS'#13#10'INNER JOIN TALAO T'#13#10'ON TS.ID = T.id'#13#10'AND TS' +
      '.NUM_TALAO = T.NUM_TALAO'#13#10'INNER JOIN LOTE L'#13#10'ON TS.ID = L.ID'#13#10'IN' +
      'NER JOIN SETOR S'#13#10'ON TS.ID_SETOR = S.ID'#13#10'LEFT JOIN COMBINACAO CO' +
      'MB'#13#10'ON T.id_combinacao = COMB.ID'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 32
    Top = 32
  end
  object dspConsulta_Lote: TDataSetProvider
    DataSet = sdsConsulta_Lote
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspLoteUpdateError
    Left = 80
    Top = 32
  end
  object cdsConsulta_Lote: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta_Lote'
    Left = 127
    Top = 32
    object cdsConsulta_LoteID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsulta_LoteNUM_TALAO: TIntegerField
      FieldName = 'NUM_TALAO'
      Required = True
    end
    object cdsConsulta_LoteITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsConsulta_LoteID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
    end
    object cdsConsulta_LoteDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object cdsConsulta_LoteHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object cdsConsulta_LoteDTSAIDA: TDateField
      FieldName = 'DTSAIDA'
    end
    object cdsConsulta_LoteHRSAIDA: TTimeField
      FieldName = 'HRSAIDA'
    end
    object cdsConsulta_LoteQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsConsulta_LoteTOTAL_HORAS: TFloatField
      FieldName = 'TOTAL_HORAS'
    end
    object cdsConsulta_LoteID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsConsulta_LoteTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object cdsConsulta_LoteREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsConsulta_LoteNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object cdsConsulta_LoteNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsConsulta_LoteNOME_SETOR: TStringField
      FieldName = 'NOME_SETOR'
    end
    object cdsConsulta_LoteID_COMBINACAO: TIntegerField
      FieldName = 'ID_COMBINACAO'
    end
    object cdsConsulta_LoteNOME_COMBINACAO: TStringField
      FieldName = 'NOME_COMBINACAO'
      Size = 60
    end
    object cdsConsulta_LoteDTENTREGA: TDateField
      FieldName = 'DTENTREGA'
    end
    object cdsConsulta_LoteNUM_REMESSA: TStringField
      FieldName = 'NUM_REMESSA'
      Size = 15
    end
    object cdsConsulta_LoteQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
      DisplayFormat = '#'
    end
    object cdsConsulta_LoteQTD_PENDENTE: TFloatField
      FieldName = 'QTD_PENDENTE'
      DisplayFormat = '#'
    end
  end
  object dsConsulta_Lote: TDataSource
    DataSet = cdsConsulta_Lote
    Left = 175
    Top = 32
  end
  object sdsSetor: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM SETOR'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 32
    Top = 152
  end
  object dspSetor: TDataSetProvider
    DataSet = sdsSetor
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspLoteUpdateError
    Left = 72
    Top = 152
  end
  object cdsSetor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSetor'
    Left = 127
    Top = 152
    object cdsSetorID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsSetorNOME: TStringField
      FieldName = 'NOME'
    end
    object cdsSetorDESPESA_RATEIO: TFloatField
      FieldName = 'DESPESA_RATEIO'
    end
    object cdsSetorGERAR_TALAO: TStringField
      FieldName = 'GERAR_TALAO'
      FixedChar = True
      Size = 1
    end
    object cdsSetorLIMITE_POR_TALAO: TStringField
      FieldName = 'LIMITE_POR_TALAO'
      FixedChar = True
      Size = 1
    end
    object cdsSetorQTD_LIMITE_POR_TALAO: TIntegerField
      FieldName = 'QTD_LIMITE_POR_TALAO'
    end
    object cdsSetorMOSTRAR_ORC: TStringField
      FieldName = 'MOSTRAR_ORC'
      FixedChar = True
      Size = 1
    end
    object cdsSetorORDEM_ORC: TIntegerField
      FieldName = 'ORDEM_ORC'
    end
    object cdsSetorENTRADA_AUT: TStringField
      FieldName = 'ENTRADA_AUT'
      FixedChar = True
      Size = 1
    end
    object cdsSetorIMP_MAPA: TStringField
      FieldName = 'IMP_MAPA'
      FixedChar = True
      Size = 1
    end
    object cdsSetorENCERRA_PROD: TStringField
      FieldName = 'ENCERRA_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsSetorLER_CBARRA1: TStringField
      FieldName = 'LER_CBARRA1'
      FixedChar = True
      Size = 1
    end
  end
  object dsSetor: TDataSource
    DataSet = cdsSetor
    Left = 175
    Top = 152
  end
  object frxConsulta_Lote: TfrxDBDataset
    UserName = 'frxConsulta_Lote'
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
      'QTD=QTD'
      'TOTAL_HORAS=TOTAL_HORAS'
      'ID_PRODUTO=ID_PRODUTO'
      'TAMANHO=TAMANHO'
      'REFERENCIA=REFERENCIA'
      'NUM_LOTE=NUM_LOTE'
      'NUM_ORDEM=NUM_ORDEM'
      'NOME_SETOR=NOME_SETOR'
      'ID_COMBINACAO=ID_COMBINACAO'
      'NOME_COMBINACAO=NOME_COMBINACAO'
      'DTENTREGA=DTENTREGA'
      'NUM_REMESSA=NUM_REMESSA'
      'QTD_PRODUZIDO=QTD_PRODUZIDO'
      'QTD_PENDENTE=QTD_PENDENTE')
    DataSource = dsConsulta_Lote
    BCDToCurrency = False
    Left = 368
    Top = 383
  end
  object qParametros_Lote: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT USA_REMESSA, LOTE_CALCADO_NOVO'
      'FROM PARAMETROS_LOTE')
    SQLConnection = dmDatabase.scoDados
    Left = 88
    Top = 264
    object qParametros_LoteUSA_REMESSA: TStringField
      FieldName = 'USA_REMESSA'
      FixedChar = True
      Size = 1
    end
    object qParametros_LoteLOTE_CALCADO_NOVO: TStringField
      FieldName = 'LOTE_CALCADO_NOVO'
      FixedChar = True
      Size = 1
    end
  end
  object sdsConsLote_Novo: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT L.id_produto, L.id_combinacao, COMB.nome NOME_COMBINACAO,' +
      ' L.num_lote,'#13#10'L.num_ordem, l.dtentrega, L.dtemissao, L.qtd_taloe' +
      's, L.qtd, '#13#10'P.nome NOME_PRODUTO, P.REFERENCIA, L.ID, CLI.NOME NO' +
      'ME_CLIENTE, PED.NUM_PEDIDO,'#13#10'PED.pedido_cliente, P.ID_FORMA, F.N' +
      'OME NOME_FORMA, L.CARIMBO, L.CAIXINHA,'#13#10'P.ID_LINHA, LIN.NOME NOM' +
      'E_CONSTRUCAO'#13#10'FROM LOTE L'#13#10'INNER JOIN PRODUTO P'#13#10'ON L.ID_PRODUTO' +
      ' = P.ID'#13#10'LEFT JOIN COMBINACAO COMB'#13#10'ON L.id_combinacao = COMB.ID' +
      #13#10'left join PESSOA CLI'#13#10'ON L.ID_CLIENTE = CLI.CODIGO'#13#10'LEFT JOIN ' +
      'PEDIDO PED'#13#10'ON L.ID_PEDIDO = PED.ID'#13#10'LEFT JOIN PRODUTO F'#13#10'ON P.I' +
      'D_FORMA = F.ID'#13#10'LEFT JOIN LINHA LIN'#13#10'ON P.ID_LINHA = LIN.ID'#13#10'WHE' +
      'RE L.ID = :ID'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 368
    Top = 16
  end
  object dspConsLote_Novo: TDataSetProvider
    DataSet = sdsConsLote_Novo
    Left = 408
    Top = 16
  end
  object cdsConsLote_Novo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsLote_Novo'
    OnCalcFields = cdsConsLote_NovoCalcFields
    Left = 456
    Top = 16
    object cdsConsLote_NovoID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsConsLote_NovoID_COMBINACAO: TIntegerField
      FieldName = 'ID_COMBINACAO'
    end
    object cdsConsLote_NovoNOME_COMBINACAO: TStringField
      FieldName = 'NOME_COMBINACAO'
      Size = 60
    end
    object cdsConsLote_NovoNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object cdsConsLote_NovoNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsConsLote_NovoDTENTREGA: TDateField
      FieldName = 'DTENTREGA'
    end
    object cdsConsLote_NovoDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsConsLote_NovoQTD_TALOES: TIntegerField
      FieldName = 'QTD_TALOES'
    end
    object cdsConsLote_NovoQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsConsLote_NovoNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object cdsConsLote_NovoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsConsLote_NovoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsLote_NovoNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object cdsConsLote_NovoNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object cdsConsLote_NovoPEDIDO_CLIENTE: TStringField
      FieldName = 'PEDIDO_CLIENTE'
    end
    object cdsConsLote_NovoclCodBarra: TStringField
      FieldKind = fkCalculated
      FieldName = 'clCodBarra'
      Size = 14
      Calculated = True
    end
    object cdsConsLote_NovoID_FORMA: TIntegerField
      FieldName = 'ID_FORMA'
    end
    object cdsConsLote_NovoNOME_FORMA: TStringField
      FieldName = 'NOME_FORMA'
      Size = 100
    end
    object cdsConsLote_NovoCARIMBO: TStringField
      FieldName = 'CARIMBO'
      Size = 25
    end
    object cdsConsLote_NovoCAIXINHA: TStringField
      FieldName = 'CAIXINHA'
      Size = 30
    end
    object cdsConsLote_NovoID_LINHA: TIntegerField
      FieldName = 'ID_LINHA'
    end
    object cdsConsLote_NovoNOME_CONSTRUCAO: TStringField
      FieldName = 'NOME_CONSTRUCAO'
      Size = 40
    end
  end
  object dsConsLote_Novo: TDataSource
    DataSet = cdsConsLote_Novo
    Left = 504
    Top = 16
  end
  object frxConsLote_Novo: TfrxDBDataset
    UserName = 'frxConsLote_Novo'
    OnFirst = frxConsLote_NovoFirst
    OnNext = frxConsLote_NovoFirst
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID_PRODUTO=ID_PRODUTO'
      'ID_COMBINACAO=ID_COMBINACAO'
      'NOME_COMBINACAO=NOME_COMBINACAO'
      'NUM_LOTE=NUM_LOTE'
      'NUM_ORDEM=NUM_ORDEM'
      'DTENTREGA=DTENTREGA'
      'DTEMISSAO=DTEMISSAO'
      'QTD_TALOES=QTD_TALOES'
      'QTD=QTD'
      'NOME_PRODUTO=NOME_PRODUTO'
      'REFERENCIA=REFERENCIA'
      'ID=ID'
      'NOME_CLIENTE=NOME_CLIENTE'
      'NUM_PEDIDO=NUM_PEDIDO'
      'PEDIDO_CLIENTE=PEDIDO_CLIENTE'
      'clCodBarra=clCodBarra'
      'ID_FORMA=ID_FORMA'
      'NOME_FORMA=NOME_FORMA'
      'CARIMBO=CARIMBO'
      'CAIXINHA=CAIXINHA'
      'ID_LINHA=ID_LINHA'
      'NOME_CONSTRUCAO=NOME_CONSTRUCAO')
    OnOpen = frxConsLote_NovoFirst
    DataSource = dsConsLote_Novo
    BCDToCurrency = False
    Left = 408
    Top = 383
  end
  object sdsConsTalao_Novo: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT T.ID, T.qtd, T.num_talao, T.id_combinacao, T.id_produto, ' +
      'T.tamanho, '#13#10'(SELECT L.num_lote FROM LOTE L WHERE L.ID = :ID) NU' +
      'M_LOTE'#13#10'FROM TALAO T'#13#10'WHERE T.ID = :ID'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 368
    Top = 64
  end
  object dspConsTalao_Novo: TDataSetProvider
    DataSet = sdsConsTalao_Novo
    Left = 408
    Top = 64
  end
  object cdsConsTalao_Novo: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'TAMANHO'
    Params = <>
    ProviderName = 'dspConsTalao_Novo'
    OnCalcFields = cdsConsTalao_NovoCalcFields
    Left = 456
    Top = 64
    object cdsConsTalao_NovoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsTalao_NovoQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsConsTalao_NovoNUM_TALAO: TIntegerField
      FieldName = 'NUM_TALAO'
      Required = True
    end
    object cdsConsTalao_NovoID_COMBINACAO: TIntegerField
      FieldName = 'ID_COMBINACAO'
    end
    object cdsConsTalao_NovoID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsConsTalao_NovoTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object cdsConsTalao_NovoNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object cdsConsTalao_NovoclCodBarra: TStringField
      FieldKind = fkCalculated
      FieldName = 'clCodBarra'
      Size = 9
      Calculated = True
    end
  end
  object dsConsTalao_Novo: TDataSource
    DataSet = cdsConsTalao_Novo
    Left = 504
    Top = 64
  end
  object frxConsTalao_Novo: TfrxDBDataset
    UserName = 'frxConsTalao_Novo'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'QTD=QTD'
      'NUM_TALAO=NUM_TALAO'
      'ID_COMBINACAO=ID_COMBINACAO'
      'ID_PRODUTO=ID_PRODUTO'
      'TAMANHO=TAMANHO'
      'NUM_LOTE=NUM_LOTE'
      'clCodBarra=clCodBarra')
    DataSource = dsConsTalao_Novo
    BCDToCurrency = False
    Left = 448
    Top = 383
  end
  object sdsProdMat: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select PMAT.*, MAT.NOME NOME_MATERIAL, COMB.NOME NOME_COR_MAT, P' +
      '.NOME NOME_POSICAO,'#13#10'PC.id_cor_combinacao, S.NOME NOME_SETOR, S.' +
      'ORDEM_ORC'#13#10'from PRODUTO_COMB PC'#13#10'INNER JOIN produto_comb_mat PMA' +
      'T'#13#10'ON PC.ID = PMAT.ID'#13#10'AND PC.ITEM = PMAT.item'#13#10'INNER JOIN PRODU' +
      'TO MAT'#13#10'ON PMAT.id_material = MAT.ID'#13#10'LEFT JOIN COMBINACAO COMB'#13 +
      #10'ON PMAT.id_cor = COMB.ID'#13#10'LEFT JOIN POSICAO P'#13#10'ON PMAT.ID_POSIC' +
      'AO = P.ID'#13#10'left JOIN SETOR S'#13#10'ON PMAT.ID_SETOR = S.ID'#13#10'where PC.' +
      'ID = :ID'#13#10'  and PC.ID_COR_COMBINACAO = :ID_COR_COMBINACAO'#13#10#13#10#13#10#13 +
      #10#13#10#13#10
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
    Left = 368
    Top = 112
  end
  object dspProdMat: TDataSetProvider
    DataSet = sdsProdMat
    Left = 416
    Top = 112
  end
  object cdsProdMat: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ORDEM_ORC;ID_POSICAO;NOME_MATERIAL'
    Params = <>
    ProviderName = 'dspProdMat'
    Left = 464
    Top = 112
    object cdsProdMatID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsProdMatITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsProdMatITEM_MAT: TIntegerField
      FieldName = 'ITEM_MAT'
      Required = True
    end
    object cdsProdMatID_POSICAO: TIntegerField
      FieldName = 'ID_POSICAO'
    end
    object cdsProdMatID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object cdsProdMatID_COR: TIntegerField
      FieldName = 'ID_COR'
    end
    object cdsProdMatQTD_CONSUMO: TFloatField
      FieldName = 'QTD_CONSUMO'
    end
    object cdsProdMatQTD_UNIDADE: TFloatField
      FieldName = 'QTD_UNIDADE'
    end
    object cdsProdMatUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsProdMatTINGIMENTO: TStringField
      FieldName = 'TINGIMENTO'
      Size = 1
    end
    object cdsProdMatIMP_TALAO: TStringField
      FieldName = 'IMP_TALAO'
      FixedChar = True
      Size = 1
    end
    object cdsProdMatID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
    end
    object cdsProdMatNOME_MATERIAL: TStringField
      FieldName = 'NOME_MATERIAL'
      Size = 100
    end
    object cdsProdMatNOME_POSICAO: TStringField
      FieldName = 'NOME_POSICAO'
      Size = 30
    end
    object cdsProdMatID_COR_COMBINACAO: TIntegerField
      FieldName = 'ID_COR_COMBINACAO'
    end
    object cdsProdMatNOME_SETOR: TStringField
      FieldName = 'NOME_SETOR'
    end
    object cdsProdMatORDEM_ORC: TIntegerField
      FieldName = 'ORDEM_ORC'
    end
    object cdsProdMatNOME_COR_MAT: TStringField
      FieldName = 'NOME_COR_MAT'
      Size = 60
    end
  end
  object dsProdMat: TDataSource
    DataSet = cdsProdMat
    Left = 512
    Top = 112
  end
  object frxProdMat: TfrxDBDataset
    UserName = 'frxProdMat'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'ITEM=ITEM'
      'ITEM_MAT=ITEM_MAT'
      'ID_POSICAO=ID_POSICAO'
      'ID_MATERIAL=ID_MATERIAL'
      'ID_COR=ID_COR'
      'QTD_CONSUMO=QTD_CONSUMO'
      'QTD_UNIDADE=QTD_UNIDADE'
      'UNIDADE=UNIDADE'
      'TINGIMENTO=TINGIMENTO'
      'IMP_TALAO=IMP_TALAO'
      'ID_SETOR=ID_SETOR'
      'NOME_MATERIAL=NOME_MATERIAL'
      'NOME_POSICAO=NOME_POSICAO'
      'ID_COR_COMBINACAO=ID_COR_COMBINACAO'
      'NOME_SETOR=NOME_SETOR'
      'ORDEM_ORC=ORDEM_ORC'
      'NOME_COR_MAT=NOME_COR_MAT')
    DataSource = dsProdMat
    BCDToCurrency = False
    Left = 496
    Top = 383
  end
  object sdsConsTalao_Tam: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT T.qtd, T.tamanho'#13#10'FROM TALAO T'#13#10'WHERE T.ID = :ID'#13#10#13#10'UNION' +
      ' ALL'#13#10#13#10'SELECT SUM(T.qtd) , '#39'Total'#39#13#10'FROM TALAO T'#13#10'WHERE T.ID = ' +
      ':ID'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 368
    Top = 160
  end
  object dspConsTalao_Tam: TDataSetProvider
    DataSet = sdsConsTalao_Tam
    Left = 408
    Top = 160
  end
  object cdsConsTalao_Tam: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'TAMANHO'
    Params = <>
    ProviderName = 'dspConsTalao_Tam'
    Left = 464
    Top = 160
    object cdsConsTalao_TamQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsConsTalao_TamTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
  end
  object dsConsTalao_Tam: TDataSource
    DataSet = cdsConsTalao_Tam
    Left = 512
    Top = 160
  end
  object frxConsTalao_Tam: TfrxDBDataset
    UserName = 'frxConsTalao_Tam'
    CloseDataSource = False
    FieldAliases.Strings = (
      'QTD=QTD'
      'TAMANHO=TAMANHO')
    DataSource = dsConsTalao_Tam
    BCDToCurrency = False
    Left = 536
    Top = 383
  end
  object mImpAux: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'Item'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 296
    Top = 448
    Data = {
      320000009619E0BD010000001800000002000000000003000000320002494404
      00010000000000044974656D04000100000000000000}
    object mImpAuxID: TIntegerField
      FieldName = 'ID'
    end
    object mImpAuxItem: TIntegerField
      FieldName = 'Item'
    end
  end
  object dsmImpAux: TDataSource
    DataSet = mImpAux
    Left = 344
    Top = 448
  end
  object frxmImpAux: TfrxDBDataset
    UserName = 'frxmImpAux'
    OnFirst = frxmImpAuxFirst
    OnNext = frxmImpAuxFirst
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'Item=Item')
    DataSource = dsmImpAux
    BCDToCurrency = False
    Left = 576
    Top = 383
  end
  object sdsConsLote_Processo: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT B.id, B.ID_LOTE, B.id_processo, B.ID_SETOR, B.id_posicao,' +
      #13#10'P.NOME NOME_PROCESSO, S.NOME NOME_SETOR, PP.NOME NOME_POSICAO,' +
      ' B.QTD,'#13#10'B.qtd_pendente, B.qtd_produzido, B.ITEM'#13#10'FROM BAIXA_PRO' +
      'CESSO B'#13#10'INNER JOIN PROCESSO P'#13#10'ON B.ID_PROCESSO = P.ID'#13#10'LEFT JO' +
      'IN SETOR S'#13#10'ON B.ID_SETOR = S.ID'#13#10'LEFT JOIN POSICAO PP'#13#10'ON B.ID_' +
      'POSICAO = PP.ID'#13#10'WHERE B.ID_LOTE = :ID_LOTE'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_LOTE'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 368
    Top = 208
  end
  object dspConsLote_Processo: TDataSetProvider
    DataSet = sdsConsLote_Processo
    Left = 408
    Top = 208
  end
  object cdsConsLote_Processo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsLote_Processo'
    Left = 456
    Top = 208
    object cdsConsLote_ProcessoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsLote_ProcessoID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
    end
    object cdsConsLote_ProcessoID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object cdsConsLote_ProcessoID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
    end
    object cdsConsLote_ProcessoID_POSICAO: TIntegerField
      FieldName = 'ID_POSICAO'
    end
    object cdsConsLote_ProcessoNOME_PROCESSO: TStringField
      FieldName = 'NOME_PROCESSO'
      Size = 30
    end
    object cdsConsLote_ProcessoNOME_SETOR: TStringField
      FieldName = 'NOME_SETOR'
    end
    object cdsConsLote_ProcessoNOME_POSICAO: TStringField
      FieldName = 'NOME_POSICAO'
      Size = 30
    end
    object cdsConsLote_ProcessoQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsConsLote_ProcessoQTD_PENDENTE: TFloatField
      FieldName = 'QTD_PENDENTE'
    end
    object cdsConsLote_ProcessoQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
    end
    object cdsConsLote_ProcessoITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
  end
  object dsConsLote_Processo: TDataSource
    DataSet = cdsConsLote_Processo
    Left = 504
    Top = 208
  end
  object frxConsLote_Processo: TfrxDBDataset
    UserName = 'frxConsLote_Processo'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'ID_LOTE=ID_LOTE'
      'ID_PROCESSO=ID_PROCESSO'
      'ID_SETOR=ID_SETOR'
      'ID_POSICAO=ID_POSICAO'
      'NOME_PROCESSO=NOME_PROCESSO'
      'NOME_SETOR=NOME_SETOR'
      'NOME_POSICAO=NOME_POSICAO'
      'QTD=QTD'
      'QTD_PENDENTE=QTD_PENDENTE'
      'QTD_PRODUZIDO=QTD_PRODUZIDO'
      'ITEM=ITEM')
    DataSource = dsConsLote_Processo
    BCDToCurrency = False
    Left = 616
    Top = 383
  end
  object sdsConsProcesso: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT B.id, B.ID_LOTE, B.id_processo, B.ID_SETOR, B.id_posicao,' +
      #13#10'P.NOME NOME_PROCESSO, S.NOME NOME_SETOR, PP.NOME NOME_POSICAO,' +
      ' B.QTD,'#13#10'B.qtd_pendente, B.qtd_produzido, MAT.NOME NOME_MATERIAL' +
      ', B.ITEM,'#13#10'L.num_lote, L.num_ordem, L.referencia, PED.pedido_cli' +
      'ente, PED.num_pedido,'#13#10'PROD.NOME NOME_PRODUTO, COMB.NOME NOME_CO' +
      'MBINACAO, B.dtentrada, B.dtbaixa'#13#10'FROM BAIXA_PROCESSO B'#13#10'INNER J' +
      'OIN PROCESSO P'#13#10'ON B.ID_PROCESSO = P.ID'#13#10'INNER JOIN LOTE L'#13#10'ON B' +
      '.ID_LOTE = L.ID'#13#10'INNER JOIN PRODUTO PROD'#13#10'ON L.ID_PRODUTO = PROD' +
      '.ID'#13#10'LEFT JOIN PEDIDO PED'#13#10'ON L.ID_PEDIDO = PED.ID'#13#10'LEFT JOIN SE' +
      'TOR S'#13#10'ON B.ID_SETOR = S.ID'#13#10'LEFT JOIN POSICAO PP'#13#10'ON B.ID_POSIC' +
      'AO = PP.ID'#13#10'LEFT JOIN PRODUTO MAT'#13#10'ON B.ID_MATERIAL = MAT.ID'#13#10'LE' +
      'FT JOIN COMBINACAO COMB'#13#10'ON L.id_combinacao = COMB.ID'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 568
    Top = 272
  end
  object dspConsProcesso: TDataSetProvider
    DataSet = sdsConsProcesso
    Left = 600
    Top = 272
  end
  object cdsConsProcesso: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsProcesso'
    OnCalcFields = cdsConsProcessoCalcFields
    Left = 632
    Top = 272
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
    object cdsConsProcessoNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object cdsConsProcessoNOME_COMBINACAO: TStringField
      FieldName = 'NOME_COMBINACAO'
      Size = 60
    end
    object cdsConsProcessoDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object cdsConsProcessoDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
  end
  object dsConsProcesso: TDataSource
    DataSet = cdsConsProcesso
    Left = 666
    Top = 272
  end
  object frxConsProcesso: TfrxDBDataset
    UserName = 'frxConsProcesso'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'ID_LOTE=ID_LOTE'
      'ID_PROCESSO=ID_PROCESSO'
      'ID_SETOR=ID_SETOR'
      'ID_POSICAO=ID_POSICAO'
      'NOME_PROCESSO=NOME_PROCESSO'
      'NOME_SETOR=NOME_SETOR'
      'NOME_POSICAO=NOME_POSICAO'
      'QTD=QTD'
      'QTD_PENDENTE=QTD_PENDENTE'
      'QTD_PRODUZIDO=QTD_PRODUZIDO'
      'NOME_MATERIAL=NOME_MATERIAL'
      'clCodBarra=clCodBarra'
      'ITEM=ITEM'
      'NUM_LOTE=NUM_LOTE'
      'NUM_ORDEM=NUM_ORDEM'
      'REFERENCIA=REFERENCIA'
      'PEDIDO_CLIENTE=PEDIDO_CLIENTE'
      'NUM_PEDIDO=NUM_PEDIDO'
      'NOME_PRODUTO=NOME_PRODUTO'
      'NOME_COMBINACAO=NOME_COMBINACAO')
    DataSource = dsConsProcesso
    BCDToCurrency = False
    Left = 656
    Top = 383
  end
  object sdsProcesso: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM PROCESSO'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 32
    Top = 200
  end
  object dspProcesso: TDataSetProvider
    DataSet = sdsProcesso
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspLoteUpdateError
    Left = 72
    Top = 200
  end
  object cdsProcesso: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOME'
    Params = <>
    ProviderName = 'dspProcesso'
    Left = 127
    Top = 200
  end
  object dsProcesso: TDataSource
    DataSet = cdsProcesso
    Left = 175
    Top = 200
  end
end
