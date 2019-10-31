object DMConsLote: TDMConsLote
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 379
  Top = 144
  Height = 475
  Width = 707
  object qParametros: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT GERAR_TALAO_AUXILIAR, USA_LOTE'
      'FROM PARAMETROS')
    SQLConnection = dmDatabase.scoDados
    Left = 560
    Top = 56
    object qParametrosGERAR_TALAO_AUXILIAR: TStringField
      FieldName = 'GERAR_TALAO_AUXILIAR'
      FixedChar = True
      Size = 1
    end
    object qParametrosUSA_LOTE: TStringField
      FieldName = 'USA_LOTE'
      FixedChar = True
      Size = 1
    end
  end
  object qParametros_Lote: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT LOTE_TEXTIL'
      'FROM PARAMETROS_LOTE')
    SQLConnection = dmDatabase.scoDados
    Left = 522
    Top = 56
    object qParametros_LoteLOTE_TEXTIL: TStringField
      FieldName = 'LOTE_TEXTIL'
      FixedChar = True
      Size = 1
    end
  end
  object sdsMatLote: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT L.ID ID_LOTE, PMAT.id_material, PMAT.id_cor ID_COR_MAT,'#13#10 +
      'COMB.NOME NOME_COR_MAT, MAT.NOME NOME_MATERIAL, PMAT.qtd_consumo' +
      ' ,'#13#10'S.NOME NOME_SETOR, PMAT.ID_SETOR, MAT.ID_GRADE ID_GRADE_MAT,' +
      #13#10'PRO.ID_GRADE ID_GRADE_PROD, L.QTD'#13#10'FROM LOTE L'#13#10'INNER JOIN PRO' +
      'DUTO PRO'#13#10'ON L.ID_PRODUTO = PRO.ID'#13#10'INNER JOIN PRODUTO_COMB PC'#13#10 +
      'ON L.ID_PRODUTO = PC.ID'#13#10'AND L.id_combinacao = PC.id_cor_combina' +
      'cao'#13#10'INNER JOIN PRODUTO_COMB_MAT PMAT'#13#10'ON PC.ID = PMAT.ID'#13#10'AND P' +
      'C.item = PMAT.item'#13#10'INNER JOIN PRODUTO MAT'#13#10'ON PMAT.ID_MATERIAL ' +
      '= MAT.ID'#13#10'LEFT JOIN COMBINACAO COMB'#13#10'ON PMAT.ID_COR = COMB.ID'#13#10'L' +
      'EFT JOIN SETOR S'#13#10'ON PMAT.ID_SETOR = S.ID'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 40
    Top = 16
  end
  object dspMatLote: TDataSetProvider
    DataSet = sdsMatLote
    Left = 80
    Top = 16
  end
  object cdsMatLote: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMatLote'
    Left = 121
    Top = 16
    object cdsMatLoteID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object cdsMatLoteID_COR_MAT: TIntegerField
      FieldName = 'ID_COR_MAT'
    end
    object cdsMatLoteNOME_COR_MAT: TStringField
      FieldName = 'NOME_COR_MAT'
      Size = 60
    end
    object cdsMatLoteNOME_MATERIAL: TStringField
      FieldName = 'NOME_MATERIAL'
      Size = 100
    end
    object cdsMatLoteQTD_CONSUMO: TFloatField
      FieldName = 'QTD_CONSUMO'
    end
    object cdsMatLoteNOME_SETOR: TStringField
      FieldName = 'NOME_SETOR'
    end
    object cdsMatLoteID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
    end
    object cdsMatLoteID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
      Required = True
    end
    object cdsMatLoteID_GRADE_MAT: TIntegerField
      FieldName = 'ID_GRADE_MAT'
    end
    object cdsMatLoteID_GRADE_PROD: TIntegerField
      FieldName = 'ID_GRADE_PROD'
    end
    object cdsMatLoteQTD: TFloatField
      FieldName = 'QTD'
    end
  end
  object dsMatLote: TDataSource
    DataSet = cdsMatLote
    Left = 164
    Top = 16
  end
  object mMat: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    OnNewRecord = mMatNewRecord
    Left = 312
    Top = 56
    Data = {
      C00000009619E0BD010000001800000007000000000003000000C0000B49445F
      4D6174657269616C04000100000000000649445F436F7204000100000000000D
      4E6F6D655F4D6174657269616C01004900000001000557494454480200020064
      00084E6F6D655F436F720100490000000100055749445448020002003C000B51
      74645F436F6E73756D6F08000400000000000A4E6F6D655F5365746F72010049
      00000001000557494454480200020028000849445F5365746F72040001000000
      00000000}
    object mMatID_Material: TIntegerField
      FieldName = 'ID_Material'
    end
    object mMatID_Cor: TIntegerField
      FieldName = 'ID_Cor'
    end
    object mMatNome_Material: TStringField
      FieldName = 'Nome_Material'
      Size = 100
    end
    object mMatNome_Cor: TStringField
      FieldName = 'Nome_Cor'
      Size = 60
    end
    object mMatQtd_Consumo: TFloatField
      FieldName = 'Qtd_Consumo'
    end
    object mMatNome_Setor: TStringField
      FieldName = 'Nome_Setor'
      Size = 40
    end
    object mMatID_Setor: TIntegerField
      FieldName = 'ID_Setor'
    end
  end
  object dsmMat: TDataSource
    DataSet = mMat
    Left = 344
    Top = 56
  end
  object mMatGrade: TClientDataSet
    Active = True
    Aggregates = <>
    IndexFieldNames = 'ID_Setor;ID_Material;ID_Cor'
    MasterFields = 'ID_Setor;ID_Material;ID_Cor'
    MasterSource = dsmMat
    PacketRecords = 0
    Params = <>
    OnNewRecord = mMatGradeNewRecord
    Left = 424
    Top = 56
    Data = {
      7E0000009619E0BD0100000018000000050000000000030000007E000849445F
      5365746F7204000100000000000B49445F4D6174657269616C04000100000000
      000649445F436F7204000100000000000754616D616E686F0100490000000100
      055749445448020002000A000B5174645F436F6E73756D6F0800040000000000
      0000}
    object mMatGradeID_Setor: TIntegerField
      FieldName = 'ID_Setor'
    end
    object mMatGradeID_Material: TIntegerField
      FieldName = 'ID_Material'
    end
    object mMatGradeID_Cor: TIntegerField
      FieldName = 'ID_Cor'
    end
    object mMatGradeTamanho: TStringField
      FieldName = 'Tamanho'
      Size = 10
    end
    object mMatGradeQtd_Consumo: TFloatField
      FieldName = 'Qtd_Consumo'
    end
  end
  object dsmMatGrade: TDataSource
    DataSet = mMatGrade
    Left = 456
    Top = 56
  end
  object sdsTalao: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM TALAO'#13#10'WHERE ID = :ID'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 40
    Top = 64
  end
  object dspTalao: TDataSetProvider
    DataSet = sdsTalao
    Left = 80
    Top = 64
  end
  object cdsTalao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTalao'
    Left = 122
    Top = 64
    object cdsTalaoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsTalaoNUM_TALAO: TIntegerField
      FieldName = 'NUM_TALAO'
      Required = True
    end
    object cdsTalaoTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object cdsTalaoQTD: TFloatField
      FieldName = 'QTD'
    end
  end
  object qParametros_Prod: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT USA_TAM_REFER_GRADE'
      'FROM PARAMETROS_PROD')
    SQLConnection = dmDatabase.scoDados
    Left = 599
    Top = 57
    object qParametros_ProdUSA_TAM_REFER_GRADE: TStringField
      FieldName = 'USA_TAM_REFER_GRADE'
      FixedChar = True
      Size = 1
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
    ReportOptions.CreateDate = 42052.436473541700000000
    ReportOptions.LastChange = 43769.668638414350000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 504
    Top = 143
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
    Left = 544
    Top = 143
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
    Left = 584
    Top = 143
  end
  object frxRichObject1: TfrxRichObject
    Left = 616
    Top = 143
  end
  object frxmMat: TfrxDBDataset
    UserName = 'frxmMat'
    OnFirst = frxmMatFirst
    OnNext = frxmMatNext
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID_Material=ID_Material'
      'ID_Cor=ID_Cor'
      'Nome_Material=Nome_Material'
      'Nome_Cor=Nome_Cor'
      'Qtd_Consumo=Qtd_Consumo'
      'Nome_Setor=Nome_Setor'
      'ID_Setor=ID_Setor')
    OnOpen = frxmMatOpen
    DataSource = dsmMat
    BCDToCurrency = False
    Left = 504
    Top = 199
  end
  object frxmMatGrade: TfrxDBDataset
    UserName = 'frxmMatGrade'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID_Setor=ID_Setor'
      'ID_Material=ID_Material'
      'ID_Cor=ID_Cor'
      'Tamanho=Tamanho'
      'Qtd_Consumo=Qtd_Consumo')
    DataSource = dsmMatGrade
    BCDToCurrency = False
    Left = 536
    Top = 199
  end
  object sdsLoteProduto: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select sum(L.QTD) QTD, PRO.REFERENCIA, PRO.NOME_MODELO ||'#39' - '#39'||' +
      ' COMB.NOME AS MODELO_COMBINACAO'#13#10'from LOTE L'#13#10'inner join PRODUTO' +
      ' PRO on L.ID_PRODUTO = PRO.ID'#13#10'left join COMBINACAO COMB on L.ID' +
      '_COMBINACAO = COMB.ID'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 48
    Top = 120
  end
  object cdsLoteProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLoteProduto'
    Left = 125
    Top = 120
    object cdsLoteProdutoQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsLoteProdutoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsLoteProdutoMODELO_COMBINACAO: TStringField
      FieldName = 'MODELO_COMBINACAO'
      Size = 163
    end
  end
  object dspLoteProduto: TDataSetProvider
    DataSet = sdsLoteProduto
    Left = 88
    Top = 120
  end
  object dsLoteProduto: TDataSource
    DataSet = cdsLoteProduto
    Left = 165
    Top = 120
  end
  object sdsModelo_Setor: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select P.ID ID_PRODUTO, P.NOME_MODELO, P.REFERENCIA, P.NOME NOME' +
      '_PRODUTO, COMB.ID ID_COMBINACAO,'#13#10'       COMB.NOME NOME_COMBINAC' +
      'AO, S.ID ID_SETOR, S.NOME NOME_SETOR, sum(TS.QTD) QTD_PARES, P.I' +
      'D_CLIENTE,'#13#10'       CLI.NOME NOME_CLIENTE, cast(0 as float) TEMPO' +
      ', cast(0 as float) VLR_HORA'#13#10'from LOTE L'#13#10'inner join PRODUTO P o' +
      'n L.ID_PRODUTO = P.ID'#13#10'inner join TALAO T on L.ID = T.ID'#13#10'inner ' +
      'join TALAO_SETOR TS on T.ID = TS.ID and T.NUM_TALAO = TS.NUM_TAL' +
      'AO'#13#10'inner join SETOR S on TS.ID_SETOR = S.ID'#13#10'left join COMBINAC' +
      'AO COMB on L.ID_COMBINACAO = COMB.ID'#13#10'left join PESSOA CLI on P.' +
      'ID_CLIENTE = CLI.CODIGO'#13#10'where S.IMP_MAT_CUSTO = '#39'S'#39' and'#13#10'      ' +
      'TS.DTSAIDA between :DATA1 and :DATA2 and'#13#10'      (TS.ID_SETOR = :' +
      'ID_SETOR or :ID_SETOR = 0)'#13#10'group by P.ID, P.NOME_MODELO, P.REFE' +
      'RENCIA, P.NOME, COMB.ID, COMB.NOME, S.ID, S.NOME, P.ID_CLIENTE, ' +
      'CLI.NOME  '
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_SETOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_SETOR'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 65
    Top = 222
  end
  object dspModelo_Setor: TDataSetProvider
    DataSet = sdsModelo_Setor
    Left = 107
    Top = 221
  end
  object cdsModelo_Setor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspModelo_Setor'
    OnCalcFields = cdsModelo_SetorCalcFields
    Left = 148
    Top = 223
    object cdsModelo_SetorID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object cdsModelo_SetorNOME_MODELO: TStringField
      FieldName = 'NOME_MODELO'
      Size = 100
    end
    object cdsModelo_SetorREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsModelo_SetorNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object cdsModelo_SetorID_COMBINACAO: TFMTBCDField
      FieldName = 'ID_COMBINACAO'
      Precision = 15
      Size = 0
    end
    object cdsModelo_SetorNOME_COMBINACAO: TStringField
      FieldName = 'NOME_COMBINACAO'
      Size = 60
    end
    object cdsModelo_SetorTEMPO: TFloatField
      FieldName = 'TEMPO'
      Required = True
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
    object cdsModelo_SetorVLR_HORA: TFloatField
      FieldName = 'VLR_HORA'
      Required = True
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
    object cdsModelo_Setorcl_Vlr_Total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'cl_Vlr_Total'
      DisplayFormat = '##0.00'
      Calculated = True
    end
    object cdsModelo_SetorID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
      Required = True
    end
    object cdsModelo_SetorNOME_SETOR: TStringField
      FieldName = 'NOME_SETOR'
    end
    object cdsModelo_SetorQTD_PARES: TFloatField
      FieldName = 'QTD_PARES'
    end
    object cdsModelo_SetorID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsModelo_SetorNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
  end
  object dsModelo_Setor: TDataSource
    DataSet = cdsModelo_Setor
    Left = 190
    Top = 224
  end
  object sdsSetor: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT S.ID, S.NOME'#13#10'FROM SETOR S'#13#10'WHERE IMP_MAT_CUSTO = '#39'S'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 394
    Top = 281
  end
  object dspSetor: TDataSetProvider
    DataSet = sdsSetor
    Left = 436
    Top = 280
  end
  object cdsSetor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSetor'
    Left = 478
    Top = 282
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
    Left = 520
    Top = 283
  end
  object sdsModelo_Mat: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select ps.ordem_imp, P.ID ID_PRODUTO, cmat.id_material, mat.nome' +
      ' nome_material, cmat.id_setor,'#13#10'cmat.id_posicao, ps.nome nome_po' +
      'sicao, cormat.nome nome_cor_mat,'#13#10'case'#13#10'  when coalesce(cormat.p' +
      'reco_custo,0) > 0 then cormat.preco_custo'#13#10'  else mat.preco_cust' +
      'o'#13#10'  end preco_custo, cmat.qtd_consumo'#13#10#13#10'from produto p'#13#10'INNER ' +
      'JOIN PRODUTO_COMB COMB'#13#10'ON p.id = comb.id'#13#10'inner join produto_co' +
      'mb_mat cmat'#13#10'on comb.id = cmat.id'#13#10'and comb.item = cmat.item'#13#10'in' +
      'ner join produto mat'#13#10'on cmat.id_material = mat.id'#13#10'left join po' +
      'sicao ps'#13#10'on cmat.id_posicao = ps.id'#13#10'left join produto_comb Cor' +
      'Mat'#13#10'on cmat.id_material = cormat.id'#13#10'and cmat.id_cor = cormat.i' +
      'd_cor_combinacao'#13#10'where p.id = :id_produto'#13#10'  and cmat.id_setor ' +
      '= :id_setor'#13#10'order by coalesce(ps.ordem_imp,99), ps.nome'#13#10#13#10#13#10#13#10 +
      #13#10#13#10#13#10#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id_produto'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id_setor'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 144
    Top = 307
  end
  object dspModelo_Mat: TDataSetProvider
    DataSet = sdsModelo_Mat
    Left = 189
    Top = 306
  end
  object cdsModelo_Mat: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspModelo_Mat'
    OnCalcFields = cdsModelo_MatCalcFields
    Left = 229
    Top = 308
    object cdsModelo_MatORDEM_IMP: TIntegerField
      FieldName = 'ORDEM_IMP'
    end
    object cdsModelo_MatID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Required = True
    end
    object cdsModelo_MatID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object cdsModelo_MatNOME_MATERIAL: TStringField
      FieldName = 'NOME_MATERIAL'
      Size = 100
    end
    object cdsModelo_MatID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
    end
    object cdsModelo_MatID_POSICAO: TIntegerField
      FieldName = 'ID_POSICAO'
    end
    object cdsModelo_MatNOME_POSICAO: TStringField
      FieldName = 'NOME_POSICAO'
      Size = 30
    end
    object cdsModelo_MatNOME_COR_MAT: TStringField
      FieldName = 'NOME_COR_MAT'
      Size = 50
    end
    object cdsModelo_MatPRECO_CUSTO: TFloatField
      FieldName = 'PRECO_CUSTO'
    end
    object cdsModelo_MatQTD_CONSUMO: TFloatField
      FieldName = 'QTD_CONSUMO'
    end
    object cdsModelo_Matcl_Vlr_Total: TFloatField
      FieldKind = fkCalculated
      FieldName = 'cl_Vlr_Total'
      Calculated = True
    end
  end
  object dsModelo_Mat: TDataSource
    DataSet = cdsModelo_Mat
    Left = 271
    Top = 309
  end
  object frxModeloSetor: TfrxDBDataset
    UserName = 'frxModeloSetor'
    OnFirst = frxModeloSetorFirst
    OnNext = frxModeloSetorNext
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID_PRODUTO=ID_PRODUTO'
      'NOME_MODELO=NOME_MODELO'
      'REFERENCIA=REFERENCIA'
      'NOME_PRODUTO=NOME_PRODUTO'
      'ID_COMBINACAO=ID_COMBINACAO'
      'NOME_COMBINACAO=NOME_COMBINACAO'
      'TEMPO=TEMPO'
      'VLR_HORA=VLR_HORA'
      'cl_Vlr_Total=cl_Vlr_Total'
      'ID_SETOR=ID_Setor'
      'NOME_SETOR=NOME_SETOR'
      'QTD_PARES=QTD_PARES'
      'ID_CLIENTE=ID_CLIENTE'
      'NOME_CLIENTE=NOME_CLIENTE')
    DataSource = dsModelo_Setor
    BCDToCurrency = False
    Left = 576
    Top = 255
  end
  object frxModelo_Mat: TfrxDBDataset
    UserName = 'frxModelo_Mat'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ORDEM_IMP=ORDEM_IMP'
      'ID_PRODUTO=ID_PRODUTO'
      'ID_MATERIAL=ID_MATERIAL'
      'NOME_MATERIAL=NOME_MATERIAL'
      'ID_SETOR=ID_Setor'
      'ID_POSICAO=ID_POSICAO'
      'NOME_POSICAO=NOME_POSICAO'
      'NOME_COR_MAT=NOME_COR_MAT'
      'PRECO_CUSTO=PRECO_CUSTO'
      'QTD_CONSUMO=QTD_CONSUMO'
      'cl_Vlr_Total=cl_Vlr_Total')
    DataSource = dsModelo_Mat
    BCDToCurrency = False
    Left = 624
    Top = 255
  end
end
