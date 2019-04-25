object DMLoteImp: TDMLoteImp
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 213
  Top = 75
  Height = 596
  Width = 1059
  object frxReport1: TfrxReport
    Tag = 1
    Version = '5.6.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42751.456864641200000000
    ReportOptions.LastChange = 43579.746433333330000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 800
    Top = 367
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
    Left = 840
    Top = 367
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
    Left = 880
    Top = 367
  end
  object frxRichObject1: TfrxRichObject
    Left = 912
    Top = 367
  end
  object sdsTalao_SL: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT L.ID, L.num_lote, L.num_ordem, L.qtd Qtd_Lote, L.id_produ' +
      'to,'#13#10'L.referencia, P.nome NOME_PRODUTO, L.num_pedido,'#13#10'L.unidade' +
      ', L.tipo_lote, COMB.NOME NOME_COMBINACAO, l.DTENTREGA, l.obs_ped' +
      ','#13#10'L.item_ordem, L.item_ordem_total, L.qtd_pares, L.id_material,' +
      #13#10'MAT.NOME NOME_MATERIAL, MAT.REFERENCIA REF_MATERIAL, L.CONSUMO' +
      '_MAT, '#13#10'l.id_material2, l.consumo_mat2, L.id_cor_mat, L.id_cor_m' +
      'at2,'#13#10'MAT2.NOME NOME_MATERIAL2, MAT2.REFERENCIA REF_MATERIAL2,'#13#10 +
      'COR1.nome NOME_COR_MAT, COR2.NOME NOME_COR_MAT2, L.id_cliente,'#13#10 +
      'CLI.NOME NOME_CLIENTE, L.qtd_estoque_usada,'#13#10'CASE'#13#10'  WHEN L.TIPO' +
      '_LOTE = '#39'S'#39' THEN '#39'SEMI ACABADO'#39#13#10'  WHEN L.TIPO_LOTE = '#39'E'#39' THEN '#39 +
      'ESTOQUE'#39#13#10'  ELSE '#39'PRODUTO'#39#13#10'  END DESCRICAO_TIPO_LOTE, L.DTEMISS' +
      'AO, L.CARGA'#13#10'FROM LOTE L'#13#10'LEFT JOIN PRODUTO P'#13#10'ON L.id_produto =' +
      ' P.ID'#13#10'LEFT JOIN COMBINACAO COMB'#13#10'ON l.id_combinacao = COMB.ID'#13#10 +
      'left join produto mat'#13#10'on l.id_material = mat.id'#13#10'left join prod' +
      'uto mat2'#13#10'on l.id_material2 = mat2.id'#13#10'LEFT JOIN COMBINACAO COR1' +
      #13#10'ON L.id_cor_mat = COR1.id'#13#10'LEFT JOIN COMBINACAO COR2'#13#10'ON L.id_' +
      'cor_mat2 = COR2.id'#13#10'LEFT JOIN PESSOA CLI'#13#10'ON L.ID_CLIENTE = CLI.' +
      'CODIGO'#13#10'WHERE L.NUM_ORDEM = :NUM_ORDEM'#13#10'   AND L.NUM_LOTE = :NUM' +
      '_LOTE'#13#10#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_ORDEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUM_LOTE'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 153
    Top = 17
  end
  object dspTalao_SL: TDataSetProvider
    DataSet = sdsTalao_SL
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspLoteUpdateError
    Left = 200
    Top = 16
  end
  object cdsTalao_SL: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspTalao_SL'
    OnCalcFields = cdsTalao_SLCalcFields
    Left = 248
    Top = 16
    object cdsTalao_SLID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsTalao_SLNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object cdsTalao_SLNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsTalao_SLQTD_LOTE: TFloatField
      FieldName = 'QTD_LOTE'
    end
    object cdsTalao_SLID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsTalao_SLREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsTalao_SLNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object cdsTalao_SLNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object cdsTalao_SLUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsTalao_SLTIPO_LOTE: TStringField
      FieldName = 'TIPO_LOTE'
      FixedChar = True
      Size = 1
    end
    object cdsTalao_SLNOME_COMBINACAO: TStringField
      FieldName = 'NOME_COMBINACAO'
      Size = 60
    end
    object cdsTalao_SLDTENTREGA: TDateField
      FieldName = 'DTENTREGA'
    end
    object cdsTalao_SLOBS_PED: TStringField
      FieldName = 'OBS_PED'
      Size = 100
    end
    object cdsTalao_SLDESCRICAO_TIPO_LOTE: TStringField
      FieldName = 'DESCRICAO_TIPO_LOTE'
      Required = True
      FixedChar = True
      Size = 12
    end
    object cdsTalao_SLclCodBarra_Lote: TStringField
      FieldKind = fkCalculated
      FieldName = 'clCodBarra_Lote'
      Size = 14
      Calculated = True
    end
    object cdsTalao_SLITEM_ORDEM: TIntegerField
      FieldName = 'ITEM_ORDEM'
    end
    object cdsTalao_SLITEM_ORDEM_TOTAL: TIntegerField
      FieldName = 'ITEM_ORDEM_TOTAL'
    end
    object cdsTalao_SLQTD_PARES: TFloatField
      FieldName = 'QTD_PARES'
    end
    object cdsTalao_SLID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object cdsTalao_SLNOME_MATERIAL: TStringField
      FieldName = 'NOME_MATERIAL'
      Size = 100
    end
    object cdsTalao_SLREF_MATERIAL: TStringField
      FieldName = 'REF_MATERIAL'
    end
    object cdsTalao_SLCONSUMO_MAT: TFloatField
      FieldName = 'CONSUMO_MAT'
    end
    object cdsTalao_SLID_MATERIAL2: TIntegerField
      FieldName = 'ID_MATERIAL2'
    end
    object cdsTalao_SLNOME_MATERIAL2: TStringField
      FieldName = 'NOME_MATERIAL2'
      Size = 100
    end
    object cdsTalao_SLREF_MATERIAL2: TStringField
      FieldName = 'REF_MATERIAL2'
    end
    object cdsTalao_SLCONSUMO_MAT2: TFloatField
      FieldName = 'CONSUMO_MAT2'
    end
    object cdsTalao_SLID_COR_MAT: TIntegerField
      FieldName = 'ID_COR_MAT'
    end
    object cdsTalao_SLID_COR_MAT2: TIntegerField
      FieldName = 'ID_COR_MAT2'
    end
    object cdsTalao_SLNOME_COR_MAT: TStringField
      FieldName = 'NOME_COR_MAT'
      Size = 60
    end
    object cdsTalao_SLNOME_COR_MAT2: TStringField
      FieldName = 'NOME_COR_MAT2'
      Size = 60
    end
    object cdsTalao_SLID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsTalao_SLNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object cdsTalao_SLDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsTalao_SLQTD_ESTOQUE_USADA: TFloatField
      FieldName = 'QTD_ESTOQUE_USADA'
    end
    object cdsTalao_SLCARGA: TFloatField
      FieldName = 'CARGA'
    end
  end
  object dsTalao_SL: TDataSource
    DataSet = cdsTalao_SL
    Left = 295
    Top = 16
  end
  object frxTalao_SL: TfrxDBDataset
    UserName = 'frxTalao_SL'
    OnFirst = frxTalao_SLFirst
    OnNext = frxTalao_SLNext
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'NUM_LOTE=NUM_LOTE'
      'NUM_ORDEM=NUM_ORDEM'
      'QTD_LOTE=QTD_LOTE'
      'ID_PRODUTO=ID_PRODUTO'
      'REFERENCIA=REFERENCIA'
      'NOME_PRODUTO=NOME_PRODUTO'
      'NUM_PEDIDO=NUM_PEDIDO'
      'UNIDADE=UNIDADE'
      'TIPO_LOTE=TIPO_LOTE'
      'NOME_COMBINACAO=NOME_COMBINACAO'
      'DTENTREGA=DTENTREGA'
      'OBS_PED=OBS_PED'
      'DESCRICAO_TIPO_LOTE=DESCRICAO_TIPO_LOTE'
      'clCodBarra_Lote=clCodBarra_Lote'
      'ITEM_ORDEM=ITEM_ORDEM'
      'ITEM_ORDEM_TOTAL=ITEM_ORDEM_TOTAL'
      'QTD_PARES=QTD_PARES'
      'ID_MATERIAL=ID_MATERIAL'
      'NOME_MATERIAL=NOME_MATERIAL'
      'REF_MATERIAL=REF_MATERIAL'
      'CONSUMO_MAT=CONSUMO_MAT'
      'ID_MATERIAL2=ID_MATERIAL2'
      'NOME_MATERIAL2=NOME_MATERIAL2'
      'REF_MATERIAL2=REF_MATERIAL2'
      'CONSUMO_MAT2=CONSUMO_MAT2'
      'ID_COR_MAT=ID_COR_MAT'
      'ID_COR_MAT2=ID_COR_MAT2'
      'NOME_COR_MAT=NOME_COR_MAT'
      'NOME_COR_MAT2=NOME_COR_MAT2'
      'ID_CLIENTE=ID_CLIENTE'
      'NOME_CLIENTE=NOME_CLIENTE'
      'DTEMISSAO=DTEMISSAO'
      'QTD_ESTOQUE_USADA=QTD_ESTOQUE_USADA'
      'CARGA=CARGA')
    DataSource = dsTalao_SL
    BCDToCurrency = False
    Left = 800
    Top = 423
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 832
    Top = 320
  end
  object sdsLote_Processo: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT BP.*, P.nome NOME_PROCESSO'#13#10'FROM baixa_processo BP'#13#10'INNER' +
      ' JOIN processo P'#13#10'ON BP.id_processo = P.id'#13#10'WHERE BP.id_lote = :' +
      'ID_LOTE'#13#10'  AND coalesce(BP.PARCIAL,'#39'N'#39') <> '#39'P'#39#13#10'  AND ((BP.ajust' +
      'e = '#39'N'#39') or (BP.ajuste IS NULL))'#13#10'  AND ((BP.RETRABALHO = '#39'N'#39') o' +
      'r (BP.RETRABALHO IS NULL))'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ID_LOTE'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 152
    Top = 72
  end
  object dspLote_Processo: TDataSetProvider
    DataSet = sdsLote_Processo
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspLoteUpdateError
    Left = 200
    Top = 72
  end
  object cdsLote_Processo: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID;ITEM'
    Params = <>
    ProviderName = 'dspLote_Processo'
    OnCalcFields = cdsTalao_SLCalcFields
    Left = 247
    Top = 72
    object cdsLote_ProcessoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsLote_ProcessoITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsLote_ProcessoID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object cdsLote_ProcessoID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
    end
    object cdsLote_ProcessoID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object cdsLote_ProcessoITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object cdsLote_ProcessoDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object cdsLote_ProcessoHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object cdsLote_ProcessoDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object cdsLote_ProcessoHRBAIXA: TTimeField
      FieldName = 'HRBAIXA'
    end
    object cdsLote_ProcessoQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsLote_ProcessoQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
    end
    object cdsLote_ProcessoNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsLote_ProcessoTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object cdsLote_ProcessoNOME_PROCESSO: TStringField
      FieldName = 'NOME_PROCESSO'
      Size = 30
    end
  end
  object dsLote_Processo: TDataSource
    DataSet = cdsLote_Processo
    Left = 295
    Top = 72
  end
  object frxLote_Processo: TfrxDBDataset
    UserName = 'frxLote_Processo'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'ITEM=ITEM'
      'ID_PROCESSO=ID_PROCESSO'
      'ID_LOTE=ID_LOTE'
      'ID_PEDIDO=ID_PEDIDO'
      'ITEM_PEDIDO=ITEM_PEDIDO'
      'DTENTRADA=DTENTRADA'
      'HRENTRADA=HRENTRADA'
      'DTBAIXA=DTBAIXA'
      'HRBAIXA=HRBAIXA'
      'QTD=QTD'
      'QTD_PRODUZIDO=QTD_PRODUZIDO'
      'NUM_ORDEM=NUM_ORDEM'
      'TIPO=TIPO'
      'NOME_PROCESSO=NOME_PROCESSO')
    DataSource = dsLote_Processo
    BCDToCurrency = False
    Left = 840
    Top = 423
  end
  object mLoteEmProc: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_Processo'
        DataType = ftInteger
      end
      item
        Name = 'Nome_Processo'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DtEntrada'
        DataType = ftDate
      end
      item
        Name = 'HrEntrada'
        DataType = ftTime
      end
      item
        Name = 'NumOrdem_Em_Proc'
        DataType = ftInteger
      end
      item
        Name = 'Qtd_Em_Proc'
        DataType = ftFloat
      end
      item
        Name = 'NumLote_Em_Proc'
        DataType = ftInteger
      end
      item
        Name = 'Qtd_Aguardando'
        DataType = ftFloat
      end
      item
        Name = 'Qtd_Em_Pedido'
        DataType = ftFloat
      end
      item
        Name = 'Referencia'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Nome_Produto'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Num_Talao'
        DataType = ftInteger
      end
      item
        Name = 'Total_Talao_Aberto'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 872
    Top = 88
    Data = {
      530100009619E0BD01000000180000000D00000000000300000053010B49445F
      50726F636573736F04000100000000000D4E6F6D655F50726F636573736F0100
      490000000100055749445448020002003C00094474456E747261646104000600
      00000000094872456E74726164610400070000000000104E756D4F7264656D5F
      456D5F50726F6304000100000000000B5174645F456D5F50726F630800040000
      0000000F4E756D4C6F74655F456D5F50726F6304000100000000000E5174645F
      416775617264616E646F08000400000000000D5174645F456D5F50656469646F
      08000400000000000A5265666572656E63696101004900000001000557494454
      480200020014000C4E6F6D655F50726F6475746F010049000000010005574944
      5448020002006400094E756D5F54616C616F040001000000000012546F74616C
      5F54616C616F5F41626572746F04000100000000000000}
    object mLoteEmProcID_Processo: TIntegerField
      FieldName = 'ID_Processo'
    end
    object mLoteEmProcNome_Processo: TStringField
      FieldName = 'Nome_Processo'
      Size = 60
    end
    object mLoteEmProcDtEntrada: TDateField
      FieldName = 'DtEntrada'
    end
    object mLoteEmProcHrEntrada: TTimeField
      FieldName = 'HrEntrada'
    end
    object mLoteEmProcNumOrdem_Em_Proc: TIntegerField
      FieldName = 'NumOrdem_Em_Proc'
    end
    object mLoteEmProcQtd_Em_Proc: TFloatField
      FieldName = 'Qtd_Em_Proc'
    end
    object mLoteEmProcNumLote_Em_Proc: TIntegerField
      FieldName = 'NumLote_Em_Proc'
    end
    object mLoteEmProcQtd_Aguardando: TFloatField
      FieldName = 'Qtd_Aguardando'
    end
    object mLoteEmProcQtd_Em_Pedido: TFloatField
      FieldName = 'Qtd_Em_Pedido'
    end
    object mLoteEmProcReferencia: TStringField
      FieldName = 'Referencia'
    end
    object mLoteEmProcNome_Produto: TStringField
      FieldName = 'Nome_Produto'
      Size = 100
    end
    object mLoteEmProcNum_Talao: TIntegerField
      FieldName = 'Num_Talao'
    end
    object mLoteEmProcTotal_Talao_Aberto: TIntegerField
      FieldName = 'Total_Talao_Aberto'
    end
  end
  object dsmLoteEmProc: TDataSource
    DataSet = mLoteEmProc
    Left = 904
    Top = 88
  end
  object qLoteEmProc: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PROCESSO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT L.id, L.num_lote, L.num_ordem, L.id_produto, T.qtd QTD_EM' +
        '_PROCESSO,'
      'T.id_processo, PROD.REFERENCIA,'
      'PROD.NOME NOME_PRODUTO, T.dtentrada, T.hrentrada, T.NUM_TALAO'
      'FROM LOTE L'
      'INNER JOIN TALAO T'
      'ON L.ID = T.ID'
      'INNER JOIN PRODUTO PROD'
      'ON L.ID_PRODUTO = PROD.ID'
      'WHERE T.DTBAIXA IS NULL'
      '  and T.dtentrada IS NOT NULL'
      '  and T.id_processo = :ID_PROCESSO')
    SQLConnection = dmDatabase.scoDados
    Left = 880
    Top = 144
    object qLoteEmProcID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qLoteEmProcNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object qLoteEmProcNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object qLoteEmProcID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object qLoteEmProcQTD_EM_PROCESSO: TFloatField
      FieldName = 'QTD_EM_PROCESSO'
    end
    object qLoteEmProcID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object qLoteEmProcREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object qLoteEmProcNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object qLoteEmProcDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object qLoteEmProcHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object qLoteEmProcNUM_TALAO: TIntegerField
      FieldName = 'NUM_TALAO'
      Required = True
    end
  end
  object sdsConsulta_Lote: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT PROD.NOME NOME_PRODUTO, AUX.*, AUX.REFERENCIA || '#39' '#39' || c' +
      'oalesce(AUX.NOME_COMBINACAO,'#39#39') AS ORDEM_REF,'#13#10'AUX.PEDIDO_CLIENT' +
      'E || '#39' '#39' || AUX.REFERENCIA || '#39' '#39' || coalesce(AUX.NOME_COMBINACA' +
      'O,'#39#39') AS ORDEM_PED'#13#10'FROM ('#13#10'SELECT B.id ID_BAIXA, B.ITEM ITEM_BA' +
      'IXA, B.id_processo, B.id_lote, B.id_pedido,'#13#10'B.item_pedido, B.dt' +
      'entrada, B.hrentrada,B.dtbaixa,B.hrbaixa, B.qtd,'#13#10'B.qtd_produzid' +
      'o,B.num_ordem, B.tipo TIPO, P.nome NOME_PROCESSO, B.total_horas,' +
      #13#10'L.num_lote, B.qtd_liberada, B.qtd_pendente, B.AJUSTE, B.retrab' +
      'alho,  PED.NUM_PEDIDO, l.dtemissao,'#13#10'l.qtd_estoque_usada,'#13#10'case'#13 +
      #10'  when B.ajuste = '#39'S'#39' THEN '#39'S'#39#13#10'  ELSE '#39#39#13#10'  end DESCRICAO_AJUS' +
      'TE,'#13#10'  case'#13#10'    WHEN B.retrabalho = '#39'S'#39' then '#39'S'#39#13#10'    ELSE '#39#39#13#10 +
      '    END DESCRICAO_RETRABALHO,'#13#10'  CASE'#13#10'    WHEN L.id_combinacao ' +
      '> 0 THEN (SELECT COMB.nome NOME_COMBINACAO FROM COMBINACAO COMB ' +
      'WHERE COMB.ID = L.ID_COMBINACAO)'#13#10'    WHEN PI.id_cor > 0 THEN (S' +
      'ELECT COMB.nome NOME_COMBINACAO FROM COMBINACAO COMB WHERE COMB.' +
      'ID = PI.id_cor)'#13#10'    END NOME_COMBINACAO,'#13#10'  CASE'#13#10'    WHEN B.ti' +
      'po = '#39'1'#39' THEN '#39'Semi Acabado'#39#13#10'    WHEN B.tipo = '#39'2'#39' THEN '#39'Lote/T' +
      'al'#227'o'#39#13#10'    WHEN B.tipo = '#39'5'#39' THEN '#39'Pedido'#39#13#10'    end DESC_TIPO_BA' +
      'IXA,'#13#10'  CASE'#13#10'    WHEN B.TIPO <> '#39'5'#39' THEN L.REFERENCIA'#13#10'    WHEN' +
      ' B.TIPO = '#39'5'#39' THEN PI.referencia'#13#10'    END REFERENCIA,'#13#10'  CASE'#13#10' ' +
      '   WHEN B.TIPO <> '#39'5'#39' THEN L.obs_ped'#13#10'    WHEN B.TIPO = '#39'5'#39' THEN' +
      ' '#39'<'#39'||PED.pedido_cliente||'#39'>'#39#13#10'    END PEDIDO_CLIENTE,'#13#10'  CASE'#13#10 +
      '    WHEN B.TIPO <> '#39'5'#39' THEN L.dtentrega'#13#10'    WHEN B.TIPO = '#39'5'#39' T' +
      'HEN PI.dtentrega'#13#10'    END DTENTREGA,'#13#10'  CASE'#13#10'    WHEN B.TIPO <>' +
      ' '#39'5'#39' THEN (SELECT CLI.fantasia NOME_CLIENTE FROM PESSOA CLI WHER' +
      'E CLI.CODIGO = L.ID_CLIENTE)'#13#10'    WHEN B.TIPO = '#39'5'#39' THEN (SELECT' +
      ' CLI.fantasia NOME_CLIENTE FROM PESSOA CLI WHERE CLI.CODIGO = PE' +
      'D.ID_CLIENTE)'#13#10'    END NOME_CLIENTE,'#13#10'  CASE'#13#10'    WHEN B.TIPO <>' +
      ' '#39'5'#39' THEN L.ID_CLIENTE'#13#10'    WHEN B.TIPO = '#39'5'#39' THEN PED.ID_CLIENT' +
      'E'#13#10'    END ID_CLIENTE,'#13#10'  CASE'#13#10'    WHEN B.TIPO <> '#39'5'#39' THEN L.un' +
      'idade'#13#10'    WHEN B.TIPO = '#39'5'#39' THEN PI.unidade'#13#10'    END UNIDADE,'#13#10 +
      '  CASE'#13#10'    WHEN B.TIPO <> '#39'5'#39' THEN L.ID_PRODUTO'#13#10'    WHEN B.TIP' +
      'O = '#39'5'#39' THEN PI.ID_PRODUTO'#13#10'    END ID_PRODUTO'#13#10'FROM baixa_proce' +
      'sso B'#13#10'INNER JOIN PROCESSO P'#13#10'ON B.ID_PROCESSO = P.ID'#13#10'LEFT JOIN' +
      ' LOTE l'#13#10'ON L.id = B.id_lote'#13#10'LEFT JOIN PEDIDO_ITEM PI'#13#10'ON B.ID_' +
      'PEDIDO = PI.ID'#13#10'AND B.ITEM_PEDIDO = PI.ITEM'#13#10'LEFT JOIN PEDIDO PE' +
      'D'#13#10'ON B.ID_PEDIDO = PED.id'#13#10') AUX'#13#10'LEFT JOIN PRODUTO PROD'#13#10'ON AU' +
      'X.ID_PRODUTO = PROD.ID'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 161
    Top = 280
  end
  object dspConsulta_Lote: TDataSetProvider
    DataSet = sdsConsulta_Lote
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspLoteUpdateError
    Left = 208
    Top = 280
  end
  object cdsConsulta_Lote: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta_Lote'
    OnCalcFields = cdsConsulta_LoteCalcFields
    Left = 256
    Top = 280
    object cdsConsulta_LoteID_BAIXA: TIntegerField
      FieldName = 'ID_BAIXA'
      Required = True
    end
    object cdsConsulta_LoteITEM_BAIXA: TIntegerField
      FieldName = 'ITEM_BAIXA'
      Required = True
    end
    object cdsConsulta_LoteID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object cdsConsulta_LoteID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
    end
    object cdsConsulta_LoteID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object cdsConsulta_LoteITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object cdsConsulta_LoteDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object cdsConsulta_LoteHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object cdsConsulta_LoteDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object cdsConsulta_LoteHRBAIXA: TTimeField
      FieldName = 'HRBAIXA'
    end
    object cdsConsulta_LoteQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsConsulta_LoteQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
    end
    object cdsConsulta_LoteNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsConsulta_LoteTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object cdsConsulta_LoteNOME_PROCESSO: TStringField
      FieldName = 'NOME_PROCESSO'
      Size = 30
    end
    object cdsConsulta_LoteNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object cdsConsulta_LoteNOME_COMBINACAO: TStringField
      FieldName = 'NOME_COMBINACAO'
      Size = 60
    end
    object cdsConsulta_LoteDESC_TIPO_BAIXA: TStringField
      FieldName = 'DESC_TIPO_BAIXA'
      FixedChar = True
      Size = 12
    end
    object cdsConsulta_LoteREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsConsulta_LoteDTENTREGA: TDateField
      FieldName = 'DTENTREGA'
    end
    object cdsConsulta_LoteNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object cdsConsulta_LotePEDIDO_CLIENTE: TStringField
      FieldName = 'PEDIDO_CLIENTE'
      Size = 100
    end
    object cdsConsulta_LoteID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsConsulta_LoteUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsConsulta_LoteTOTAL_HORAS: TFloatField
      FieldName = 'TOTAL_HORAS'
      DisplayFormat = '0.00'
    end
    object cdsConsulta_LoteORDEM_REF: TStringField
      FieldName = 'ORDEM_REF'
      Size = 81
    end
    object cdsConsulta_LoteORDEM_PED: TStringField
      FieldName = 'ORDEM_PED'
      Size = 182
    end
    object cdsConsulta_LoteQTD_LIBERADA: TFloatField
      FieldName = 'QTD_LIBERADA'
    end
    object cdsConsulta_LoteQTD_PENDENTE: TFloatField
      FieldName = 'QTD_PENDENTE'
    end
    object cdsConsulta_LoteAJUSTE: TStringField
      FieldName = 'AJUSTE'
      Size = 1
    end
    object cdsConsulta_LoteDESCRICAO_AJUSTE: TStringField
      FieldName = 'DESCRICAO_AJUSTE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsConsulta_LoteNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object cdsConsulta_LoteCodBarra_Ped: TStringField
      FieldKind = fkCalculated
      FieldName = 'CodBarra_Ped'
      Size = 14
      Calculated = True
    end
    object cdsConsulta_LoteDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsConsulta_LoteQTD_ESTOQUE_USADA: TFloatField
      FieldName = 'QTD_ESTOQUE_USADA'
    end
    object cdsConsulta_LoteRETRABALHO: TStringField
      FieldName = 'RETRABALHO'
      Size = 1
    end
    object cdsConsulta_LoteDESCRICAO_RETRABALHO: TStringField
      FieldName = 'DESCRICAO_RETRABALHO'
      Required = True
      FixedChar = True
      Size = 1
    end
    object cdsConsulta_LoteNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object cdsConsulta_LoteID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
  end
  object dsConsulta_Lote: TDataSource
    DataSet = cdsConsulta_Lote
    Left = 303
    Top = 280
  end
  object sdsProcesso: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM PROCESSO'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 424
    Top = 224
  end
  object dspProcesso: TDataSetProvider
    DataSet = sdsProcesso
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspLoteUpdateError
    Left = 472
    Top = 224
  end
  object cdsProcesso: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProcesso'
    OnCalcFields = cdsTalao_SLCalcFields
    Left = 519
    Top = 224
    object cdsProcessoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsProcessoNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object cdsProcessoLIMITE_POR_TALAO: TStringField
      FieldName = 'LIMITE_POR_TALAO'
      FixedChar = True
      Size = 1
    end
    object cdsProcessoQTD_LIMITE_POR_TALAO: TIntegerField
      FieldName = 'QTD_LIMITE_POR_TALAO'
    end
    object cdsProcessoAGRUPAR_PEDIDOS: TStringField
      FieldName = 'AGRUPAR_PEDIDOS'
      FixedChar = True
      Size = 1
    end
    object cdsProcessoTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsProcessoRETRABALHO: TStringField
      FieldName = 'RETRABALHO'
      FixedChar = True
      Size = 1
    end
  end
  object dsProcesso: TDataSource
    DataSet = cdsProcesso
    Left = 567
    Top = 224
  end
  object qCliente: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT CODIGO, NOME, CNPJ_CPF'
      'FROM PESSOA'
      'WHERE CODIGO = :CODIGO')
    SQLConnection = dmDatabase.scoDados
    Left = 488
    Top = 432
    object qClienteCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object qClienteNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qClienteCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
    end
  end
  object frxConsulta_Lote: TfrxDBDataset
    UserName = 'frxConsulta_Lote'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID_BAIXA=ID_BAIXA'
      'ITEM_BAIXA=ITEM_BAIXA'
      'ID_PROCESSO=ID_PROCESSO'
      'ID_LOTE=ID_LOTE'
      'ID_PEDIDO=ID_PEDIDO'
      'ITEM_PEDIDO=ITEM_PEDIDO'
      'DTENTRADA=DTENTRADA'
      'HRENTRADA=HRENTRADA'
      'DTBAIXA=DTBAIXA'
      'HRBAIXA=HRBAIXA'
      'QTD=QTD'
      'QTD_PRODUZIDO=QTD_PRODUZIDO'
      'NUM_ORDEM=NUM_ORDEM'
      'TIPO=TIPO'
      'NOME_PROCESSO=NOME_PROCESSO'
      'NUM_LOTE=NUM_LOTE'
      'NOME_COMBINACAO=NOME_COMBINACAO'
      'DESC_TIPO_BAIXA=DESC_TIPO_BAIXA'
      'REFERENCIA=REFERENCIA'
      'DTENTREGA=DTENTREGA'
      'NOME_CLIENTE=NOME_CLIENTE'
      'PEDIDO_CLIENTE=PEDIDO_CLIENTE'
      'ID_CLIENTE=ID_CLIENTE'
      'UNIDADE=UNIDADE'
      'TOTAL_HORAS=TOTAL_HORAS'
      'ORDEM_REF=ORDEM_REF'
      'ORDEM_PED=ORDEM_PED'
      'QTD_LIBERADA=QTD_LIBERADA'
      'QTD_PENDENTE=QTD_PENDENTE'
      'AJUSTE=AJUSTE'
      'DESCRICAO_AJUSTE=DESCRICAO_AJUSTE'
      'NUM_PEDIDO=NUM_PEDIDO'
      'CodBarra_Ped=CodBarra_Ped'
      'DTEMISSAO=DTEMISSAO'
      'QTD_ESTOQUE_USADA=QTD_ESTOQUE_USADA'
      'RETRABALHO=RETRABALHO'
      'DESCRICAO_RETRABALHO=DESCRICAO_RETRABALHO'
      'NOME_PRODUTO=NOME_PRODUTO'
      'ID_PRODUTO=ID_PRODUTO')
    DataSource = dsConsulta_Lote
    BCDToCurrency = False
    Left = 880
    Top = 423
  end
  object sdsTalao_Proc: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT L.ID, L.num_lote, L.num_ordem, L.qtd Qtd_Lote, L.id_produ' +
      'to,'#13#10'L.referencia, P.nome NOME_PRODUTO, L.num_pedido, L.unidade,' +
      ' L.tipo_lote,'#13#10'COMB.NOME NOME_COMBINACAO, l.DTENTREGA, l.obs_ped' +
      ', L.item_ordem,'#13#10'L.item_ordem_total, L.qtd_pares, L.id_cliente, ' +
      'CLI.NOME NOME_CLIENTE,'#13#10'PP.NOME NOME_PROCESSO, B.QTD, PP.ID ID_P' +
      'ROCESSO'#13#10'FROM LOTE L'#13#10'INNER JOIN BAIXA_PROCESSO B'#13#10'ON L.ID = B.I' +
      'D_LOTE'#13#10'INNER JOIN PROCESSO PP'#13#10'ON B.ID_PROCESSO = PP.ID'#13#10'LEFT J' +
      'OIN PRODUTO P'#13#10'ON L.id_produto = P.ID'#13#10'LEFT JOIN COMBINACAO COMB' +
      #13#10'ON l.id_combinacao = COMB.ID'#13#10'LEFT JOIN PESSOA CLI'#13#10'ON L.ID_CL' +
      'IENTE = CLI.CODIGO'#13#10'WHERE L.NUM_ORDEM = :NUM_ORDEM'#13#10'  AND PP.IMP' +
      '_TALAO = '#39'S'#39#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_ORDEM'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 160
    Top = 392
  end
  object dspTalao_Proc: TDataSetProvider
    DataSet = sdsTalao_Proc
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspLoteUpdateError
    Left = 208
    Top = 392
  end
  object cdsTalao_Proc: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspTalao_Proc'
    OnCalcFields = cdsTalao_ProcCalcFields
    Left = 256
    Top = 392
    object cdsTalao_ProcID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsTalao_ProcNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object cdsTalao_ProcNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsTalao_ProcQTD_LOTE: TFloatField
      FieldName = 'QTD_LOTE'
    end
    object cdsTalao_ProcID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsTalao_ProcREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsTalao_ProcNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object cdsTalao_ProcNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object cdsTalao_ProcUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsTalao_ProcTIPO_LOTE: TStringField
      FieldName = 'TIPO_LOTE'
      FixedChar = True
      Size = 1
    end
    object cdsTalao_ProcNOME_COMBINACAO: TStringField
      FieldName = 'NOME_COMBINACAO'
      Size = 60
    end
    object cdsTalao_ProcDTENTREGA: TDateField
      FieldName = 'DTENTREGA'
    end
    object cdsTalao_ProcOBS_PED: TStringField
      FieldName = 'OBS_PED'
      Size = 100
    end
    object cdsTalao_ProcITEM_ORDEM: TIntegerField
      FieldName = 'ITEM_ORDEM'
    end
    object cdsTalao_ProcITEM_ORDEM_TOTAL: TIntegerField
      FieldName = 'ITEM_ORDEM_TOTAL'
    end
    object cdsTalao_ProcQTD_PARES: TFloatField
      FieldName = 'QTD_PARES'
    end
    object cdsTalao_ProcID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
    end
    object cdsTalao_ProcNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object cdsTalao_ProcNOME_PROCESSO: TStringField
      FieldName = 'NOME_PROCESSO'
      Size = 30
    end
    object cdsTalao_ProcQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsTalao_ProcclCodBarra: TStringField
      FieldKind = fkCalculated
      FieldName = 'clCodBarra'
      Size = 14
      Calculated = True
    end
    object cdsTalao_ProcID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
      Required = True
    end
  end
  object dsTalao_Proc: TDataSource
    DataSet = cdsTalao_Proc
    Left = 303
    Top = 392
  end
  object frxTalao_Proc: TfrxDBDataset
    UserName = 'frxTalao_Proc'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'NUM_LOTE=NUM_LOTE'
      'NUM_ORDEM=NUM_ORDEM'
      'QTD_LOTE=QTD_LOTE'
      'ID_PRODUTO=ID_PRODUTO'
      'REFERENCIA=REFERENCIA'
      'NOME_PRODUTO=NOME_PRODUTO'
      'NUM_PEDIDO=NUM_PEDIDO'
      'UNIDADE=UNIDADE'
      'TIPO_LOTE=TIPO_LOTE'
      'NOME_COMBINACAO=NOME_COMBINACAO'
      'DTENTREGA=DTENTREGA'
      'OBS_PED=OBS_PED'
      'ITEM_ORDEM=ITEM_ORDEM'
      'ITEM_ORDEM_TOTAL=ITEM_ORDEM_TOTAL'
      'QTD_PARES=QTD_PARES'
      'ID_CLIENTE=ID_CLIENTE'
      'NOME_CLIENTE=NOME_CLIENTE'
      'NOME_PROCESSO=NOME_PROCESSO'
      'QTD=QTD'
      'clCodBarra=clCodBarra'
      'ID_PROCESSO=ID_PROCESSO')
    DataSource = dsTalao_Proc
    BCDToCurrency = False
    Left = 928
    Top = 423
  end
  object sdsConsLoteRef: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT SUM(QTD) QTD, SUM(QTD_PRODUZIDO) QTD_PRODUZIDO, ID_PROCES' +
      'SO,'#13#10'NOME_PROCESSO, NOME_COMBINACAO, REFERENCIA, UNIDADE'#13#10'FROM v' +
      'consloteprod'#13#10'GROUP BY ID_PROCESSO, NOME_PROCESSO, NOME_COMBINAC' +
      'AO, REFERENCIA, UNIDADE'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 160
    Top = 232
  end
  object dspConsLoteRef: TDataSetProvider
    DataSet = sdsConsLoteRef
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspLoteUpdateError
    Left = 208
    Top = 232
  end
  object cdsConsLoteRef: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsLoteRef'
    OnCalcFields = cdsTalao_SLCalcFields
    Left = 247
    Top = 224
    object cdsConsLoteRefQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsConsLoteRefQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
    end
    object cdsConsLoteRefID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object cdsConsLoteRefNOME_PROCESSO: TStringField
      FieldName = 'NOME_PROCESSO'
      Size = 30
    end
    object cdsConsLoteRefNOME_COMBINACAO: TStringField
      FieldName = 'NOME_COMBINACAO'
      Size = 60
    end
    object cdsConsLoteRefREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsConsLoteRefUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
  end
  object dsConsLoteRef: TDataSource
    DataSet = cdsConsLoteRef
    Left = 303
    Top = 232
  end
  object frxConsLoteRef: TfrxDBDataset
    UserName = 'frxConsLoteRef'
    CloseDataSource = False
    FieldAliases.Strings = (
      'QTD=QTD'
      'QTD_PRODUZIDO=QTD_PRODUZIDO'
      'ID_PROCESSO=ID_PROCESSO'
      'NOME_PROCESSO=NOME_PROCESSO'
      'NOME_COMBINACAO=NOME_COMBINACAO'
      'REFERENCIA=REFERENCIA'
      'UNIDADE=UNIDADE')
    DataSource = dsConsLoteRef
    BCDToCurrency = False
    Left = 976
    Top = 423
  end
  object sdsDtEntrega: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT L.DTENTREGA, L.REFERENCIA, SUM(L.QTD) QTD, CLI.NOME NOME_' +
      'CLIENTE,'#13#10'COMB.NOME NOME_COMBINACAO'#13#10'FROM LOTE L'#13#10'LEFT JOIN PESS' +
      'OA CLI'#13#10'ON L.ID_CLIENTE = CLI.CODIGO'#13#10'LEFT JOIN COMBINACAO COMB'#13 +
      #10'ON L.ID_COMBINACAO = COMB.ID'#13#10'WHERE (SELECT COUNT (1) FROM BAIX' +
      'A_PROCESSO B WHERE B.ID_LOTE = L.ID AND B.dtbaixa IS NULL)  > 0'#13 +
      #10'AND L.DTENTREGA >= :DATA1 AND L.DTENTREGA <= :DATA2'#13#10'GROUP BY L' +
      '.DTENTREGA, L.REFERENCIA, CLI.NOME, COMB.NOME'#13#10#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DATA2'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 120
    Top = 144
  end
  object dspDtEntrega: TDataSetProvider
    DataSet = sdsDtEntrega
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspLoteUpdateError
    Left = 168
    Top = 144
  end
  object cdsDtEntrega: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDtEntrega'
    OnCalcFields = cdsTalao_SLCalcFields
    Left = 215
    Top = 144
    object cdsDtEntregaDTENTREGA: TDateField
      FieldName = 'DTENTREGA'
    end
    object cdsDtEntregaREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsDtEntregaQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsDtEntregaNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object cdsDtEntregaNOME_COMBINACAO: TStringField
      FieldName = 'NOME_COMBINACAO'
      Size = 60
    end
  end
  object dsDtEntrega: TDataSource
    DataSet = cdsDtEntrega
    Left = 279
    Top = 144
  end
  object frxDtEntrega: TfrxDBDataset
    UserName = 'frxDtEntrega'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DTENTREGA=DTENTREGA'
      'REFERENCIA=REFERENCIA'
      'QTD=QTD'
      'NOME_CLIENTE=NOME_CLIENTE'
      'NOME_COMBINACAO=NOME_COMBINACAO')
    DataSource = dsDtEntrega
    BCDToCurrency = False
    Left = 799
    Top = 473
  end
  object mImpLote_SL: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Num_Ordem'
        DataType = ftInteger
      end
      item
        Name = 'Num_Lote'
        DataType = ftInteger
      end
      item
        Name = 'Reimpresso'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 528
    Top = 344
    Data = {
      5C0000009619E0BD0100000018000000030000000000030000005C00094E756D
      5F4F7264656D0400010000000000084E756D5F4C6F746504000100000000000A
      5265696D70726573736F01004900000001000557494454480200020001000000}
    object mImpLote_SLNum_Ordem: TIntegerField
      FieldName = 'Num_Ordem'
    end
    object mImpLote_SLNum_Lote: TIntegerField
      FieldName = 'Num_Lote'
    end
    object mImpLote_SLReimpresso: TStringField
      FieldName = 'Reimpresso'
      Size = 1
    end
  end
  object dsmImpLote_SL: TDataSource
    DataSet = mImpLote_SL
    Left = 576
    Top = 344
  end
  object frxmImpLote_SL: TfrxDBDataset
    UserName = 'frxmImpLote_SL'
    OnFirst = frxmImpLote_SLFirst
    OnNext = frxmImpLote_SLNext
    CloseDataSource = False
    FieldAliases.Strings = (
      'Num_Ordem=Num_Ordem'
      'Num_Lote=Num_Lote'
      'Reimpresso=Reimpresso')
    DataSource = dsmImpLote_SL
    BCDToCurrency = False
    Left = 855
    Top = 471
  end
  object sdsTalao_Ajuste: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT BP.*, P.nome NOME_PROCESSO, L.NUM_LOTE, L.obs_ped, CLI.NO' +
      'ME NOME_CLIENTE,'#13#10'PROD.REFERENCIA, PROD.NOME NOME_PRODUTO, COMB.' +
      'NOME NOME_COMBINACAO, L.UNIDADE, l.dtentrega'#13#10'FROM baixa_process' +
      'o BP'#13#10'INNER JOIN processo P'#13#10'ON BP.id_processo = P.id'#13#10'INNER JOI' +
      'N LOTE L'#13#10'ON BP.id_lote = L.ID'#13#10'INNER JOIN PRODUTO PROD'#13#10'ON L.ID' +
      '_PRODUTO = PROD.ID'#13#10'LEFT JOIN COMBINACAO COMB'#13#10'ON L.ID_COMBINACA' +
      'O = COMB.ID'#13#10'LEFT JOIN PESSOA CLI'#13#10'ON L.id_cliente = CLI.CODIGO'#13 +
      #10'WHERE BP.ID = :ID'#13#10'  AND BP.ITEM = :ITEM'#13#10'  AND BP.ID_PROCESSO ' +
      '= :ID_PROCESSO'#13#10
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
      end
      item
        DataType = ftInteger
        Name = 'ID_PROCESSO'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 520
    Top = 48
  end
  object dspTalao_Ajuste: TDataSetProvider
    DataSet = sdsTalao_Ajuste
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspLoteUpdateError
    Left = 568
    Top = 48
  end
  object cdsTalao_Ajuste: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID;ITEM'
    Params = <>
    ProviderName = 'dspTalao_Ajuste'
    OnCalcFields = cdsTalao_AjusteCalcFields
    Left = 615
    Top = 48
    object cdsTalao_AjusteID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsTalao_AjusteITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsTalao_AjusteID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object cdsTalao_AjusteID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
    end
    object cdsTalao_AjusteID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object cdsTalao_AjusteITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object cdsTalao_AjusteDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object cdsTalao_AjusteHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object cdsTalao_AjusteDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object cdsTalao_AjusteHRBAIXA: TTimeField
      FieldName = 'HRBAIXA'
    end
    object cdsTalao_AjusteQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsTalao_AjusteQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
    end
    object cdsTalao_AjusteNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsTalao_AjusteTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object cdsTalao_AjusteTOTAL_HORAS: TFloatField
      FieldName = 'TOTAL_HORAS'
    end
    object cdsTalao_AjusteQTD_PENDENTE: TFloatField
      FieldName = 'QTD_PENDENTE'
    end
    object cdsTalao_AjusteSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      Size = 1
    end
    object cdsTalao_AjustePARCIAL: TStringField
      FieldName = 'PARCIAL'
      Size = 1
    end
    object cdsTalao_AjusteITEM_ORIGINAL: TIntegerField
      FieldName = 'ITEM_ORIGINAL'
    end
    object cdsTalao_AjusteQTD_LIBERADA: TFloatField
      FieldName = 'QTD_LIBERADA'
    end
    object cdsTalao_AjusteAJUSTE: TStringField
      FieldName = 'AJUSTE'
      Size = 1
    end
    object cdsTalao_AjusteNOME_PROCESSO: TStringField
      FieldName = 'NOME_PROCESSO'
      Size = 30
    end
    object cdsTalao_AjusteNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object cdsTalao_AjusteclCodBarra_Lote: TStringField
      FieldKind = fkCalculated
      FieldName = 'clCodBarra_Lote'
      Size = 14
      Calculated = True
    end
    object cdsTalao_AjusteOBS_PED: TStringField
      FieldName = 'OBS_PED'
      Size = 100
    end
    object cdsTalao_AjusteNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object cdsTalao_AjusteREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsTalao_AjusteNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object cdsTalao_AjusteNOME_COMBINACAO: TStringField
      FieldName = 'NOME_COMBINACAO'
      Size = 60
    end
    object cdsTalao_AjusteUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsTalao_AjusteDTENTREGA: TDateField
      FieldName = 'DTENTREGA'
    end
    object cdsTalao_AjusteRETRABALHO: TStringField
      FieldName = 'RETRABALHO'
      Size = 1
    end
  end
  object dsTalao_Ajuste: TDataSource
    DataSet = cdsTalao_Ajuste
    Left = 663
    Top = 48
  end
  object frxTalao_Ajuste: TfrxDBDataset
    UserName = 'frxTalao_Ajuste'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'ITEM=ITEM'
      'ID_PROCESSO=ID_PROCESSO'
      'ID_LOTE=ID_LOTE'
      'ID_PEDIDO=ID_PEDIDO'
      'ITEM_PEDIDO=ITEM_PEDIDO'
      'DTENTRADA=DTENTRADA'
      'HRENTRADA=HRENTRADA'
      'DTBAIXA=DTBAIXA'
      'HRBAIXA=HRBAIXA'
      'QTD=QTD'
      'QTD_PRODUZIDO=QTD_PRODUZIDO'
      'NUM_ORDEM=NUM_ORDEM'
      'TIPO=TIPO'
      'TOTAL_HORAS=TOTAL_HORAS'
      'QTD_PENDENTE=QTD_PENDENTE'
      'SELECIONADO=SELECIONADO'
      'PARCIAL=PARCIAL'
      'ITEM_ORIGINAL=ITEM_ORIGINAL'
      'QTD_LIBERADA=QTD_LIBERADA'
      'AJUSTE=AJUSTE'
      'NOME_PROCESSO=NOME_PROCESSO'
      'NUM_LOTE=NUM_LOTE'
      'clCodBarra_Lote=clCodBarra_Lote'
      'OBS_PED=OBS_PED'
      'NOME_CLIENTE=NOME_CLIENTE'
      'REFERENCIA=REFERENCIA'
      'NOME_PRODUTO=NOME_PRODUTO'
      'NOME_COMBINACAO=NOME_COMBINACAO'
      'UNIDADE=UNIDADE'
      'DTENTREGA=DTENTREGA'
      'RETRABALHO=RETRABALHO')
    DataSource = dsTalao_Ajuste
    BCDToCurrency = False
    Left = 912
    Top = 471
  end
  object sdsLote_Ped: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT L.dtemissao, L.num_lote, L.filial, L.hremissao, L.DTENTRE' +
      'GA,'#13#10'L.NUM_ORDEM, L.id, L.id_produto, L.id_combinacao,'#13#10'L.REFERE' +
      'NCIA, L.UNIDADE, FIL.NOME NOME_FILIAL, L.nome_produto,'#13#10'COMB.nom' +
      'e NOME_COMBINACAO, L.obs_ped, L.obs,'#13#10'CLI.nome NOME_CLIENTE, L.u' +
      'nidade UNIDADE_TALAO,'#13#10'CLI.fantasia FANTASIA_CLIENTE,'#13#10'IT.qtd_re' +
      'stante QTD_NAOFATURADO, L.qtd, L.dtentrada, L.dtbaixa,'#13#10'L.hrentr' +
      'ada, L.hrbaixa, CLI.CIDADE CIDADE_CLI, CLI.uf UF_CLI, P.num_pedi' +
      'do'#13#10'FROM LOTE L'#13#10'LEFT JOIN PEDIDO P'#13#10'ON L.id_pedido = P.ID'#13#10'LEFT' +
      ' JOIN PEDIDO_ITEM IT'#13#10'ON L.ID_PEDIDO = IT.ID'#13#10'AND L.ITEM_PEDIDO ' +
      '= IT.ITEM'#13#10'INNER JOIN FILIAL FIL'#13#10'ON L.FILIAL = FIL.ID'#13#10'LEFT JOI' +
      'N combinacao COMB'#13#10'ON L.id_combinacao = COMB.id'#13#10'LEFT JOIN PESSO' +
      'A CLI'#13#10'ON L.id_cliente = CLI.codigo'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 512
    Top = 112
  end
  object dspLote_Ped: TDataSetProvider
    DataSet = sdsLote_Ped
    Left = 552
    Top = 112
  end
  object cdsLote_Ped: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLote_Ped'
    OnCalcFields = cdsLote_PedCalcFields
    Left = 592
    Top = 112
    object cdsLote_PedDTEMISSAO: TDateField
      FieldName = 'DTEMISSAO'
    end
    object cdsLote_PedNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object cdsLote_PedFILIAL: TIntegerField
      FieldName = 'FILIAL'
    end
    object cdsLote_PedHREMISSAO: TTimeField
      FieldName = 'HREMISSAO'
    end
    object cdsLote_PedDTENTREGA: TDateField
      FieldName = 'DTENTREGA'
    end
    object cdsLote_PedNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsLote_PedID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsLote_PedID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsLote_PedID_COMBINACAO: TIntegerField
      FieldName = 'ID_COMBINACAO'
    end
    object cdsLote_PedREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsLote_PedUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsLote_PedNOME_FILIAL: TStringField
      FieldName = 'NOME_FILIAL'
      Size = 60
    end
    object cdsLote_PedNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object cdsLote_PedNOME_COMBINACAO: TStringField
      FieldName = 'NOME_COMBINACAO'
      Size = 60
    end
    object cdsLote_PedOBS_PED: TStringField
      FieldName = 'OBS_PED'
      Size = 100
    end
    object cdsLote_PedOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsLote_PedNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 60
    end
    object cdsLote_PedUNIDADE_TALAO: TStringField
      FieldName = 'UNIDADE_TALAO'
      Size = 6
    end
    object cdsLote_PedFANTASIA_CLIENTE: TStringField
      FieldName = 'FANTASIA_CLIENTE'
      Size = 30
    end
    object cdsLote_PedQTD_NAOFATURADO: TFloatField
      FieldName = 'QTD_NAOFATURADO'
    end
    object cdsLote_PedQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsLote_PedDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object cdsLote_PedDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object cdsLote_PedHRENTRADA: TTimeField
      FieldName = 'HRENTRADA'
    end
    object cdsLote_PedHRBAIXA: TTimeField
      FieldName = 'HRBAIXA'
    end
    object cdsLote_PedclCodBarra: TStringField
      FieldKind = fkCalculated
      FieldName = 'clCodBarra'
      Size = 7
      Calculated = True
    end
    object cdsLote_PedCIDADE_CLI: TStringField
      FieldName = 'CIDADE_CLI'
      Size = 40
    end
    object cdsLote_PedUF_CLI: TStringField
      FieldName = 'UF_CLI'
      FixedChar = True
      Size = 2
    end
    object cdsLote_PedNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
  end
  object dsLote_Ped: TDataSource
    DataSet = cdsLote_Ped
    Left = 632
    Top = 112
  end
  object frxLote_Ped: TfrxDBDataset
    UserName = 'frxLote_Ped'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DTEMISSAO=DTEMISSAO'
      'NUM_LOTE=NUM_LOTE'
      'FILIAL=FILIAL'
      'HREMISSAO=HREMISSAO'
      'DTENTREGA=DTENTREGA'
      'NUM_ORDEM=NUM_ORDEM'
      'ID=ID'
      'ID_PRODUTO=ID_PRODUTO'
      'ID_COMBINACAO=ID_COMBINACAO'
      'REFERENCIA=REFERENCIA'
      'UNIDADE=UNIDADE'
      'NOME_FILIAL=NOME_FILIAL'
      'NOME_PRODUTO=NOME_PRODUTO'
      'NOME_COMBINACAO=NOME_COMBINACAO'
      'OBS_PED=OBS_PED'
      'OBS=OBS'
      'NOME_CLIENTE=NOME_CLIENTE'
      'UNIDADE_TALAO=UNIDADE_TALAO'
      'FANTASIA_CLIENTE=FANTASIA_CLIENTE'
      'QTD_NAOFATURADO=QTD_NAOFATURADO'
      'QTD=QTD'
      'DTENTRADA=DTENTRADA'
      'DTBAIXA=DTBAIXA'
      'HRENTRADA=HRENTRADA'
      'HRBAIXA=HRBAIXA'
      'clCodBarra=clCodBarra'
      'CIDADE_CLI=CIDADE_CLI'
      'UF_CLI=UF_CLI')
    DataSource = dsLote_Ped
    BCDToCurrency = False
    Left = 952
    Top = 471
  end
  object mImpAux: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 488
    Data = {
      250000009619E0BD010000001800000001000000000003000000250002494404
      000100000000000000}
    object mImpAuxID: TIntegerField
      FieldName = 'ID'
    end
  end
  object dsmImpAux: TDataSource
    DataSet = mImpAux
    Left = 416
    Top = 488
  end
  object frxmImpAux: TfrxDBDataset
    UserName = 'frxmImpAux'
    OnFirst = frxmImpAuxFirst
    OnNext = frxmImpAuxFirst
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID')
    DataSource = dsmImpAux
    BCDToCurrency = False
    Left = 992
    Top = 471
  end
  object qParametros_Lote: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT *'
      'FROM PARAMETROS_LOTE')
    SQLConnection = dmDatabase.scoDados
    Left = 704
    Top = 440
    object qParametros_LoteUSA_LOTE_PED_SPROC: TStringField
      FieldName = 'USA_LOTE_PED_SPROC'
      FixedChar = True
      Size = 1
    end
  end
end
