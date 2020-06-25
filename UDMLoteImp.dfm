object DMLoteImp: TDMLoteImp
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 153
  Top = 57
  Height = 609
  Width = 1098
  object frxReport1: TfrxReport
    Tag = 1
    Version = '5.6.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42841.867818298600000000
    ReportOptions.LastChange = 43895.431066956000000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 795
    Top = 366
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
      'CLI.NOME NOME_CLIENTE, L.qtd_estoque_usada, l.id_combinacao,'#13#10'CA' +
      'SE'#13#10'  WHEN L.TIPO_LOTE = '#39'S'#39' THEN '#39'SEMI ACABADO'#39#13#10'  WHEN L.TIPO_' +
      'LOTE = '#39'E'#39' THEN '#39'ESTOQUE'#39#13#10'  ELSE '#39'PRODUTO'#39#13#10'  END DESCRICAO_TIP' +
      'O_LOTE, L.DTEMISSAO, L.CARGA'#13#10'FROM LOTE L'#13#10'LEFT JOIN PRODUTO P'#13#10 +
      'ON L.id_produto = P.ID'#13#10'LEFT JOIN COMBINACAO COMB'#13#10'ON l.id_combi' +
      'nacao = COMB.ID'#13#10'left join produto mat'#13#10'on l.id_material = mat.i' +
      'd'#13#10'left join produto mat2'#13#10'on l.id_material2 = mat2.id'#13#10'LEFT JOI' +
      'N COMBINACAO COR1'#13#10'ON L.id_cor_mat = COR1.id'#13#10'LEFT JOIN COMBINAC' +
      'AO COR2'#13#10'ON L.id_cor_mat2 = COR2.id'#13#10'LEFT JOIN PESSOA CLI'#13#10'ON L.' +
      'ID_CLIENTE = CLI.CODIGO'#13#10'WHERE L.NUM_ORDEM = :NUM_ORDEM'#13#10'   AND ' +
      'L.NUM_LOTE = :NUM_LOTE'#13#10#13#10
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
    object cdsTalao_SLID_COMBINACAO: TIntegerField
      FieldName = 'ID_COMBINACAO'
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
    Left = 842
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
      'O,'#39#39') AS ORDEM_PED,'#13#10'CASE'#13#10'  WHEN PROD.tipo_produto = '#39'ATAC'#39' the' +
      'n '#39'Atacador'#39#13#10'  WHEN PROD.tipo_produto = '#39'GORG'#39' then '#39'Gorgurao'#39#13 +
      #10'  WHEN PROD.tipo_produto = '#39'ELAS'#39' then '#39'Elastico'#39#13#10'  WHEN PROD.' +
      'tipo_produto = '#39'FITA'#39' then '#39'Fita'#39#13#10'  else '#39#39#13#10'  end DESC_TIPO_PR' +
      'ODUTO, TRANC.fuso'#13#10'FROM ('#13#10'SELECT B.id ID_BAIXA, B.ITEM ITEM_BAI' +
      'XA, B.id_processo, B.id_lote, B.id_pedido,'#13#10'B.item_pedido, B.dte' +
      'ntrada, B.hrentrada,B.dtbaixa,B.hrbaixa, B.qtd,'#13#10'B.qtd_produzido' +
      ',B.num_ordem, B.tipo TIPO, P.nome NOME_PROCESSO, B.total_horas,'#13 +
      #10'L.num_lote, B.qtd_liberada, B.qtd_pendente, B.AJUSTE, B.retraba' +
      'lho,  PED.NUM_PEDIDO, l.dtemissao,'#13#10'l.qtd_estoque_usada, l.carga' +
      ', b.id_funcionario_ent, b.id_funcionario_baixa,'#13#10'FE.NOME NOME_FU' +
      'NCIONARIO_ENTRADA, FB.NOME NOME_FUNCIONARIO_BAIXA,'#13#10'case'#13#10'  when' +
      ' B.ajuste = '#39'S'#39' THEN '#39'S'#39#13#10'  ELSE '#39#39#13#10'  end DESCRICAO_AJUSTE,'#13#10'  ' +
      'case'#13#10'    WHEN B.retrabalho = '#39'S'#39' then '#39'S'#39#13#10'    ELSE '#39#39#13#10'    END' +
      ' DESCRICAO_RETRABALHO,'#13#10'  CASE'#13#10'    WHEN L.id_combinacao > 0 THE' +
      'N (SELECT COMB.nome NOME_COMBINACAO FROM COMBINACAO COMB WHERE C' +
      'OMB.ID = L.ID_COMBINACAO)'#13#10'    WHEN PI.id_cor > 0 THEN (SELECT C' +
      'OMB.nome NOME_COMBINACAO FROM COMBINACAO COMB WHERE COMB.ID = PI' +
      '.id_cor)'#13#10'    END NOME_COMBINACAO,'#13#10'  CASE'#13#10'    WHEN B.tipo = '#39'1' +
      #39' THEN '#39'Semi Acabado'#39#13#10'    WHEN B.tipo = '#39'2'#39' THEN '#39'Lote/Tal'#227'o'#39#13#10 +
      '    WHEN B.tipo = '#39'5'#39' THEN '#39'Pedido'#39#13#10'    end DESC_TIPO_BAIXA,'#13#10' ' +
      ' CASE'#13#10'    WHEN B.TIPO <> '#39'5'#39' THEN L.REFERENCIA'#13#10'    WHEN B.TIPO' +
      ' = '#39'5'#39' THEN PI.referencia'#13#10'    END REFERENCIA,'#13#10'  CASE'#13#10'    WHEN' +
      ' B.TIPO <> '#39'5'#39' THEN L.obs_ped'#13#10'    WHEN B.TIPO = '#39'5'#39' THEN '#39'<'#39'||P' +
      'ED.pedido_cliente||'#39'>'#39#13#10'    END PEDIDO_CLIENTE,'#13#10'  CASE'#13#10'    WHE' +
      'N B.TIPO <> '#39'5'#39' THEN L.dtentrega'#13#10'    WHEN B.TIPO = '#39'5'#39' THEN PI.' +
      'dtentrega'#13#10'    END DTENTREGA,'#13#10'  CASE'#13#10'    WHEN B.TIPO <> '#39'5'#39' TH' +
      'EN (SELECT CLI.fantasia NOME_CLIENTE FROM PESSOA CLI WHERE CLI.C' +
      'ODIGO = L.ID_CLIENTE)'#13#10'    WHEN B.TIPO = '#39'5'#39' THEN (SELECT CLI.fa' +
      'ntasia NOME_CLIENTE FROM PESSOA CLI WHERE CLI.CODIGO = PED.ID_CL' +
      'IENTE)'#13#10'    END NOME_CLIENTE,'#13#10'  CASE'#13#10'    WHEN B.TIPO <> '#39'5'#39' TH' +
      'EN L.ID_CLIENTE'#13#10'    WHEN B.TIPO = '#39'5'#39' THEN PED.ID_CLIENTE'#13#10'    ' +
      'END ID_CLIENTE,'#13#10'  CASE'#13#10'    WHEN B.TIPO <> '#39'5'#39' THEN L.unidade'#13#10 +
      '    WHEN B.TIPO = '#39'5'#39' THEN PI.unidade'#13#10'    END UNIDADE,'#13#10'  CASE'#13 +
      #10'    WHEN B.TIPO <> '#39'5'#39' THEN L.ID_PRODUTO'#13#10'    WHEN B.TIPO = '#39'5'#39 +
      ' THEN PI.ID_PRODUTO'#13#10'    END ID_PRODUTO,'#13#10'  CASE'#13#10'    WHEN B.TIP' +
      'O <> '#39'5'#39' THEN L.id_combinacao'#13#10'    WHEN B.TIPO = '#39'5'#39' THEN PI.id_' +
      'cor'#13#10'    END ID_COMBINACAO'#13#10#13#10'FROM baixa_processo B'#13#10'INNER JOIN ' +
      'PROCESSO P'#13#10'ON B.ID_PROCESSO = P.ID'#13#10'LEFT JOIN LOTE l'#13#10'ON L.id =' +
      ' B.id_lote'#13#10'LEFT JOIN PEDIDO_ITEM PI'#13#10'ON B.ID_PEDIDO = PI.ID'#13#10'AN' +
      'D B.ITEM_PEDIDO = PI.ITEM'#13#10'LEFT JOIN PEDIDO PED'#13#10'ON B.ID_PEDIDO ' +
      '= PED.id'#13#10'LEFT JOIN FUNCIONARIO FE'#13#10'ON B.id_funcionario_ent = FE' +
      '.codigo'#13#10'LEFT JOIN FUNCIONARIO FB'#13#10'ON B.id_funcionario_baixa = F' +
      'B.codigo'#13#10') AUX'#13#10'LEFT JOIN PRODUTO PROD'#13#10'ON AUX.ID_PRODUTO = PRO' +
      'D.ID'#13#10'LEFT JOIN PRODUTO_TRANC TRANC'#13#10'ON PROD.ID = TRANC.ID'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 160
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
    Top = 281
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
    object cdsConsulta_LoteID_COMBINACAO: TFMTBCDField
      FieldName = 'ID_COMBINACAO'
      Precision = 15
      Size = 0
    end
    object cdsConsulta_LoteCARGA: TFloatField
      FieldName = 'CARGA'
    end
    object cdsConsulta_LoteID_FUNCIONARIO_ENT: TIntegerField
      FieldName = 'ID_FUNCIONARIO_ENT'
    end
    object cdsConsulta_LoteID_FUNCIONARIO_BAIXA: TIntegerField
      FieldName = 'ID_FUNCIONARIO_BAIXA'
    end
    object cdsConsulta_LoteNOME_FUNCIONARIO_ENTRADA: TStringField
      FieldName = 'NOME_FUNCIONARIO_ENTRADA'
      Size = 50
    end
    object cdsConsulta_LoteNOME_FUNCIONARIO_BAIXA: TStringField
      FieldName = 'NOME_FUNCIONARIO_BAIXA'
      Size = 50
    end
    object cdsConsulta_LoteFUSO: TFloatField
      FieldName = 'FUSO'
    end
    object cdsConsulta_LoteDESC_TIPO_PRODUTO: TStringField
      FieldName = 'DESC_TIPO_PRODUTO'
      Required = True
      FixedChar = True
      Size = 8
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
    Left = 426
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
    Top = 225
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
    object cdsProcessoUSA_CARGA: TStringField
      FieldName = 'USA_CARGA'
      FixedChar = True
      Size = 1
    end
    object cdsProcessoENTRADA_AUTO: TStringField
      FieldName = 'ENTRADA_AUTO'
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
    OnFirst = frxConsulta_LoteFirst
    OnNext = frxConsulta_LoteNext
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
      'ID_PRODUTO=ID_PRODUTO'
      'ID_COMBINACAO=ID_COMBINACAO'
      'CARGA=CARGA'
      'ID_FUNCIONARIO_ENT=ID_FUNCIONARIO_ENT'
      'ID_FUNCIONARIO_BAIXA=ID_FUNCIONARIO_BAIXA'
      'NOME_FUNCIONARIO_ENTRADA=NOME_FUNCIONARIO_ENTRADA'
      'NOME_FUNCIONARIO_BAIXA=NOME_FUNCIONARIO_BAIXA'
      'DESC_TIPO_PRODUTO=DESC_TIPO_PRODUTO'
      'FUSO=FUSO')
    OnOpen = frxConsulta_LoteOpen
    DataSource = dsConsulta_Lote
    BCDToCurrency = False
    Left = 881
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
    Left = 154
    Top = 457
  end
  object dspTalao_Proc: TDataSetProvider
    DataSet = sdsTalao_Proc
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspLoteUpdateError
    Left = 202
    Top = 457
  end
  object cdsTalao_Proc: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID'
    Params = <>
    ProviderName = 'dspTalao_Proc'
    OnCalcFields = cdsTalao_ProcCalcFields
    Left = 250
    Top = 457
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
    Left = 297
    Top = 457
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
    Left = 927
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
    Top = 232
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
    Left = 535
    Top = 362
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
    Left = 583
    Top = 362
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
    Top = 470
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
    Top = 47
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
      'do,'#13#10'P.usuario, VINT.NOME NOME_VENDEDOR_INT, IT.qtd_estoque_res'#13 +
      #10'FROM LOTE L'#13#10'LEFT JOIN PEDIDO P'#13#10'ON L.id_pedido = P.ID'#13#10'LEFT JO' +
      'IN PEDIDO_ITEM IT'#13#10'ON L.ID_PEDIDO = IT.ID'#13#10'AND L.ITEM_PEDIDO = I' +
      'T.ITEM'#13#10'INNER JOIN FILIAL FIL'#13#10'ON L.FILIAL = FIL.ID'#13#10'LEFT JOIN c' +
      'ombinacao COMB'#13#10'ON L.id_combinacao = COMB.id'#13#10'LEFT JOIN PESSOA C' +
      'LI'#13#10'ON L.id_cliente = CLI.codigo'#13#10'LEFT join pessoa vint'#13#10'on p.id' +
      '_vendedor_int = vint.Codigo'#13#10#13#10
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
    Left = 593
    Top = 113
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
    object cdsLote_PedUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 15
    end
    object cdsLote_PedNOME_VENDEDOR_INT: TStringField
      FieldName = 'NOME_VENDEDOR_INT'
      Size = 60
    end
    object cdsLote_PedQTD_ESTOQUE_RES: TFloatField
      FieldName = 'QTD_ESTOQUE_RES'
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
      'UF_CLI=UF_CLI'
      'NUM_PEDIDO=NUM_PEDIDO'
      'USUARIO=USUARIO'
      'NOME_VENDEDOR_INT=NOME_VENDEDOR_INT'
      'QTD_ESTOQUE_RES=QTD_ESTOQUE_RES')
    DataSource = dsLote_Ped
    BCDToCurrency = False
    Left = 949
    Top = 470
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
    Left = 995
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
  object sdsConsMatKG: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT AUX.ID_PROCESSO, AUX.NOME_PROCESSO, AUX.ID_MATERIAL, AUX.' +
      'NOME_MATERIAL,'#13#10'AUX.ID_COR_MAT, AUX.NOME_COR_MAT,'#13#10'AUX.UNIDADE, ' +
      'aux.qtd_consumo, sum(AUX.QTD_CONSUMO * AUX.QTD_PRODUZIDO) QTD_CO' +
      'NSUMO_PROD,'#13#10'SUM(AUX.QTD_PRODUZIDO) QTD_PRODUZIDO'#13#10'FROM('#13#10#13#10'SELE' +
      'CT B.id_processo, V.id_cor_mat, coalesce(cmat.nome,'#39#39') nome_cor_' +
      'mat,'#13#10'SUM(B.qtd) qtd,'#13#10'sum(B.qtd_produzido) qtd_produzido, P.nom' +
      'e NOME_PROCESSO,'#13#10' sum(coalesce(v.qtd_consumo,0)) qtd_consumo,'#13#10 +
      'mat.id id_material, mat.nome nome_material, upper(v.unidade) Uni' +
      'dade'#13#10'FROM baixa_processo B'#13#10'INNER JOIN PROCESSO P'#13#10'ON B.ID_PROC' +
      'ESSO = P.ID'#13#10'INNER JOIN LOTE l'#13#10'ON L.id = B.id_lote'#13#10'INNER JOIN ' +
      'PRODUTO PROD'#13#10'ON L.ID_PRODUTO = PROD.ID'#13#10'inner join vficha_tecni' +
      'ca_comb v'#13#10'on l.id_produto = v.id'#13#10'and v.id_cor_combinacao = (ca' +
      'se when l.id_combinacao = 0 then (select pl.id_cor_cru from para' +
      'metros_lote pl)'#13#10'                           else l.id_combinacao' +
      ' end)'#13#10'inner join produto mat'#13#10'on v.id_material = mat.id'#13#10'left j' +
      'oin combinacao cmat'#13#10'on v.id_cor_mat = cmat.id'#13#10'WHERE P.material' +
      '_kg = '#39'S'#39#13#10'  AND B.dtbaixa IS NOT NULL'#13#10'group by B.id_processo, ' +
      'P.nome, mat.id, mat.nome, upper(v.unidade), V.id_cor_mat, cmat.n' +
      'ome'#13#10') AUX'#13#10'GROUP BY AUX.ID_PROCESSO, AUX.NOME_PROCESSO, AUX.ID_' +
      'MATERIAL, AUX.NOME_MATERIAL,'#13#10'AUX.UNIDADE, aux.qtd_consumo, AUX.' +
      'ID_COR_MAT, AUX.NOME_COR_MAT'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 153
    Top = 341
  end
  object dspConsMatKG: TDataSetProvider
    DataSet = sdsConsMatKG
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspLoteUpdateError
    Left = 200
    Top = 341
  end
  object cdsConsMatKG: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsMatKG'
    OnCalcFields = cdsConsulta_LoteCalcFields
    Left = 248
    Top = 341
    object cdsConsMatKGID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object cdsConsMatKGNOME_PROCESSO: TStringField
      FieldName = 'NOME_PROCESSO'
      Size = 30
    end
    object cdsConsMatKGID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
      Required = True
    end
    object cdsConsMatKGNOME_MATERIAL: TStringField
      FieldName = 'NOME_MATERIAL'
      Size = 100
    end
    object cdsConsMatKGID_COR_MAT: TFMTBCDField
      FieldName = 'ID_COR_MAT'
      Precision = 15
      Size = 0
    end
    object cdsConsMatKGNOME_COR_MAT: TStringField
      FieldName = 'NOME_COR_MAT'
      Size = 60
    end
    object cdsConsMatKGUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsConsMatKGQTD_CONSUMO: TFloatField
      FieldName = 'QTD_CONSUMO'
      DisplayFormat = '0.000##'
    end
    object cdsConsMatKGQTD_CONSUMO_PROD: TFloatField
      FieldName = 'QTD_CONSUMO_PROD'
      DisplayFormat = '0.000#'
    end
    object cdsConsMatKGQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
      DisplayFormat = '0.000#'
    end
  end
  object dsConsMatKG: TDataSource
    DataSet = cdsConsMatKG
    Left = 295
    Top = 340
  end
  object sdsConsMatKG_Com_Pendentes_Juntos_Nao_apagar: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT AUX.ID_PROCESSO, AUX.NOME_PROCESSO, AUX.ID_MATERIAL, AUX.' +
      'NOME_MATERIAL,'#13#10'AUX.ID_COR_MAT, AUX.NOME_COR_MAT,'#13#10'AUX.UNIDADE, ' +
      'aux.qtd_consumo, SUM(AUX.QTD_CONSUMO * AUX.QTD_PRODUZIDO) QTD_CO' +
      'NSUMO_PROD,'#13#10'SUM(AUX.QTD_CONSUMO * AUX.QTD_PENDENTE) QTD_CONSUMO' +
      '_PEND,'#13#10'SUM(AUX.QTD_CONSUMO * AUX.QTD_LIBERADA) QTD_CONSUMO_LIB,' +
      ' SUM(AUX.QTD_PRODUZIDO) QTD_PRODUZIDO,'#13#10'SUM(AUX.QTD_PENDENTE) QT' +
      'D_PENDENTE, SUM(AUX.QTD_LIBERADA) QTD_LIBERADA'#13#10'FROM('#13#10'SELECT B.' +
      'id_processo, V.id_cor_mat, cmat.nome nome_cor_mat,'#13#10'SUM(B.qtd) q' +
      'td,'#13#10'sum(B.qtd_produzido) qtd_produzido, P.nome NOME_PROCESSO,'#13#10 +
      ' sum(coalesce(v.qtd_consumo,0)) qtd_consumo,'#13#10'mat.id id_material' +
      ', mat.nome nome_material, v.unidade,'#13#10'sum(case'#13#10'  when (B.qtd_li' +
      'berada) < 0 then 0'#13#10'  else b.qtd_liberada'#13#10'  end)  qtd_liberada,' +
      #13#10'sum(case'#13#10'  when (B.qtd_pendente) < 0 then 0'#13#10'  else B.qtd_pen' +
      'dente'#13#10'  end) qtd_pendente'#13#10'FROM baixa_processo B'#13#10'INNER JOIN PR' +
      'OCESSO P'#13#10'ON B.ID_PROCESSO = P.ID'#13#10'INNER JOIN LOTE l'#13#10'ON L.id = ' +
      'B.id_lote'#13#10'INNER JOIN PRODUTO PROD'#13#10'ON L.ID_PRODUTO = PROD.ID'#13#10'i' +
      'nner join vficha_tecnica_comb v'#13#10'on l.id_produto = v.id'#13#10'and v.i' +
      'd_cor_combinacao = (case when l.id_combinacao = 0 then (select p' +
      'l.id_cor_cru from parametros_lote pl)'#13#10'                         ' +
      '  else l.id_combinacao end)'#13#10'inner join produto mat'#13#10'on v.id_mat' +
      'erial = mat.id'#13#10'left join combinacao cmat'#13#10'on v.id_cor_mat = cma' +
      't.id'#13#10'WHERE P.material_kg = '#39'S'#39#13#10'group by B.id_processo, P.nome,' +
      ' mat.id, mat.nome, v.unidade, V.id_cor_mat, nome_cor_mat) AUX'#13#10#13 +
      #10'GROUP BY AUX.ID_PROCESSO, AUX.NOME_PROCESSO, AUX.ID_MATERIAL, A' +
      'UX.NOME_MATERIAL,'#13#10'AUX.UNIDADE, aux.qtd_consumo, AUX.ID_COR_MAT,' +
      ' AUX.NOME_COR_MAT'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 124
    Top = 507
  end
  object sdsConsMatKG_Ref: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT AUX.ID_PROCESSO, AUX.NOME_PROCESSO, AUX.ID_MATERIAL, AUX.' +
      'NOME_MATERIAL,'#13#10'AUX.ID_COR_MAT, AUX.NOME_COR_MAT,'#13#10'AUX.UNIDADE, ' +
      'aux.qtd_consumo, sum(AUX.QTD_CONSUMO * AUX.QTD_PRODUZIDO) QTD_CO' +
      'NSUMO_PROD,'#13#10'SUM(AUX.QTD_PRODUZIDO) QTD_PRODUZIDO, AUX.REFERENCI' +
      'A'#13#10'FROM('#13#10#13#10'SELECT B.id_processo, V.id_cor_mat, coalesce(cmat.no' +
      'me,'#39#39') nome_cor_mat,'#13#10'SUM(B.qtd) qtd,'#13#10'sum(B.qtd_produzido) qtd_' +
      'produzido, P.nome NOME_PROCESSO,'#13#10' sum(coalesce(v.qtd_consumo,0)' +
      ') qtd_consumo,'#13#10'mat.id id_material, mat.nome nome_material, uppe' +
      'r(v.unidade) Unidade, PROD.REFERENCIA'#13#10'FROM baixa_processo B'#13#10'IN' +
      'NER JOIN PROCESSO P'#13#10'ON B.ID_PROCESSO = P.ID'#13#10'INNER JOIN LOTE l'#13 +
      #10'ON L.id = B.id_lote'#13#10'INNER JOIN PRODUTO PROD'#13#10'ON L.ID_PRODUTO =' +
      ' PROD.ID'#13#10'inner join vficha_tecnica_comb v'#13#10'on l.id_produto = v.' +
      'id'#13#10'and v.id_cor_combinacao = (case when l.id_combinacao = 0 the' +
      'n (select pl.id_cor_cru from parametros_lote pl)'#13#10'              ' +
      '             else l.id_combinacao end)'#13#10'inner join produto mat'#13#10 +
      'on v.id_material = mat.id'#13#10'left join combinacao cmat'#13#10'on v.id_co' +
      'r_mat = cmat.id'#13#10'WHERE P.material_kg = '#39'S'#39#13#10'  AND B.dtbaixa IS N' +
      'OT NULL'#13#10'group by B.id_processo, P.nome, mat.id, mat.nome, upper' +
      '(v.unidade), V.id_cor_mat,'#13#10'cmat.nome, PROD.REFERENCIA'#13#10') AUX'#13#10'G' +
      'ROUP BY AUX.ID_PROCESSO, AUX.NOME_PROCESSO, AUX.ID_MATERIAL, AUX' +
      '.NOME_MATERIAL,'#13#10'AUX.UNIDADE, aux.qtd_consumo, AUX.ID_COR_MAT, A' +
      'UX.NOME_COR_MAT, AUX.REFERENCIA'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 151
    Top = 396
  end
  object dspConsMatKG_Ref: TDataSetProvider
    DataSet = sdsConsMatKG_Ref
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspLoteUpdateError
    Left = 198
    Top = 396
  end
  object cdsConsMatKG_Ref: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsMatKG_Ref'
    OnCalcFields = cdsConsulta_LoteCalcFields
    Left = 246
    Top = 395
    object cdsConsMatKG_RefID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object cdsConsMatKG_RefNOME_PROCESSO: TStringField
      FieldName = 'NOME_PROCESSO'
      Size = 30
    end
    object cdsConsMatKG_RefID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
      Required = True
    end
    object cdsConsMatKG_RefNOME_MATERIAL: TStringField
      FieldName = 'NOME_MATERIAL'
      Size = 100
    end
    object cdsConsMatKG_RefID_COR_MAT: TFMTBCDField
      FieldName = 'ID_COR_MAT'
      Precision = 15
      Size = 0
    end
    object cdsConsMatKG_RefNOME_COR_MAT: TStringField
      FieldName = 'NOME_COR_MAT'
      Size = 60
    end
    object cdsConsMatKG_RefUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsConsMatKG_RefQTD_CONSUMO: TFloatField
      FieldName = 'QTD_CONSUMO'
    end
    object cdsConsMatKG_RefQTD_CONSUMO_PROD: TFloatField
      FieldName = 'QTD_CONSUMO_PROD'
    end
    object cdsConsMatKG_RefQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
    end
    object cdsConsMatKG_RefREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
  end
  object dsConsMatKG_Ref: TDataSource
    DataSet = cdsConsMatKG_Ref
    Left = 293
    Top = 395
  end
  object frxConsMatKG: TfrxDBDataset
    UserName = 'frxConsMatKG'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID_PROCESSO=ID_PROCESSO'
      'NOME_PROCESSO=NOME_PROCESSO'
      'ID_MATERIAL=ID_MATERIAL'
      'NOME_MATERIAL=NOME_MATERIAL'
      'ID_COR_MAT=ID_COR_MAT'
      'NOME_COR_MAT=NOME_COR_MAT'
      'UNIDADE=UNIDADE'
      'QTD_CONSUMO=QTD_CONSUMO'
      'QTD_CONSUMO_PROD=QTD_CONSUMO_PROD'
      'QTD_PRODUZIDO=QTD_PRODUZIDO')
    DataSource = dsConsMatKG
    BCDToCurrency = False
    Left = 800
    Top = 526
  end
  object frxConsMatKG_Ref: TfrxDBDataset
    UserName = 'frxConsMatKG_Ref'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID_PROCESSO=ID_PROCESSO'
      'NOME_PROCESSO=NOME_PROCESSO'
      'ID_MATERIAL=ID_MATERIAL'
      'NOME_MATERIAL=NOME_MATERIAL'
      'ID_COR_MAT=ID_COR_MAT'
      'NOME_COR_MAT=NOME_COR_MAT'
      'UNIDADE=UNIDADE'
      'QTD_CONSUMO=QTD_CONSUMO'
      'QTD_CONSUMO_PROD=QTD_CONSUMO_PROD'
      'QTD_PRODUZIDO=QTD_PRODUZIDO'
      'REFERENCIA=REFERENCIA')
    DataSource = dsConsMatKG_Ref
    BCDToCurrency = False
    Left = 857
    Top = 526
  end
  object qConsumo: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_COMBINACAO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select SUM(CMAT.qtd_consumo) qtd_consumo'
      'from produto_comb PCOMB'
      'INNER JOIN PRODUTO_COMB_MAT CMAT'
      '   ON PCOMB.ID = CMAT.ID'
      '  AND PCOMB.ITEM = CMAT.ITEM'
      'WHERE UPPER(CMAT.unidade) = '#39'KG'#39
      '  AND PCOMB.ID = :ID'
      '  AND PCOMB.id_cor_combinacao = :ID_COMBINACAO')
    SQLConnection = dmDatabase.scoDados
    Left = 618
    Top = 493
    object qConsumoQTD_CONSUMO: TFloatField
      FieldName = 'QTD_CONSUMO'
    end
  end
  object sdsConsLote_Mat_Prod2: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select L.REFERENCIA, M.NOME NOME_MATERIAL, COMB.NOME NOME_COR_MA' +
      'T, L.QTD_CONSUMO, L.QTD_PRODUTO, L.NUM_ORDEM, L.ITEM,'#13#10'       L.' +
      'ID_MATERIAL, L.ID_COR_PRODUTO, L.ID_COR_MATERIAL, COMB2.NOME NOM' +
      'E_COMBINACAO,'#13#10'       '#39'3'#39' || lpad(L.NUM_ORDEM, 8, 0) || lpad(L.I' +
      'TEM, 3, 0) CODBARRAS, L.DTRETORNO, L.DTPAGO, L.QTD_PAGO, L.QTD_R' +
      'ETORNO,'#13#10'       L.QTD_DIFERENCA, L.QTD_CONES, L.IMPRESSO, l.num_' +
      'lote'#13#10'from LOTE_MAT_PROD L'#13#10'inner join PRODUTO M on L.ID_MATERIA' +
      'L = M.ID'#13#10'left join COMBINACAO COMB on L.ID_COR_MATERIAL = COMB.' +
      'ID'#13#10'left join COMBINACAO COMB2 on L.ID_COR_PRODUTO = COMB2.ID'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 470
    Top = 170
  end
  object dspConsLote_Mat_Prod2: TDataSetProvider
    DataSet = sdsConsLote_Mat_Prod2
    Left = 527
    Top = 170
  end
  object cdsConsLote_Mat_Prod2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsLote_Mat_Prod2'
    Left = 596
    Top = 169
    object cdsConsLote_Mat_Prod2REFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsConsLote_Mat_Prod2NOME_MATERIAL: TStringField
      FieldName = 'NOME_MATERIAL'
      Size = 100
    end
    object cdsConsLote_Mat_Prod2NOME_COR_MAT: TStringField
      FieldName = 'NOME_COR_MAT'
      Size = 60
    end
    object cdsConsLote_Mat_Prod2QTD_CONSUMO: TFloatField
      FieldName = 'QTD_CONSUMO'
    end
    object cdsConsLote_Mat_Prod2QTD_PRODUTO: TFloatField
      FieldName = 'QTD_PRODUTO'
    end
    object cdsConsLote_Mat_Prod2NUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsConsLote_Mat_Prod2ITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsConsLote_Mat_Prod2ID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object cdsConsLote_Mat_Prod2ID_COR_PRODUTO: TIntegerField
      FieldName = 'ID_COR_PRODUTO'
    end
    object cdsConsLote_Mat_Prod2ID_COR_MATERIAL: TIntegerField
      FieldName = 'ID_COR_MATERIAL'
    end
    object cdsConsLote_Mat_Prod2NOME_COMBINACAO: TStringField
      FieldName = 'NOME_COMBINACAO'
      Size = 60
    end
    object cdsConsLote_Mat_Prod2CODBARRAS: TStringField
      FieldName = 'CODBARRAS'
      Size = 12
    end
    object cdsConsLote_Mat_Prod2DTRETORNO: TDateField
      FieldName = 'DTRETORNO'
    end
    object cdsConsLote_Mat_Prod2DTPAGO: TDateField
      FieldName = 'DTPAGO'
    end
    object cdsConsLote_Mat_Prod2QTD_PAGO: TFloatField
      FieldName = 'QTD_PAGO'
    end
    object cdsConsLote_Mat_Prod2QTD_RETORNO: TFloatField
      FieldName = 'QTD_RETORNO'
    end
    object cdsConsLote_Mat_Prod2QTD_DIFERENCA: TFloatField
      FieldName = 'QTD_DIFERENCA'
    end
    object cdsConsLote_Mat_Prod2QTD_CONES: TIntegerField
      FieldName = 'QTD_CONES'
    end
    object cdsConsLote_Mat_Prod2IMPRESSO: TStringField
      FieldName = 'IMPRESSO'
      FixedChar = True
      Size = 1
    end
    object cdsConsLote_Mat_Prod2NUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
  end
  object dsConsLote_Mat_Prod2: TDataSource
    DataSet = cdsConsLote_Mat_Prod2
    Left = 641
    Top = 169
  end
  object frxConsLote_Mat_SL: TfrxDBDataset
    UserName = 'frxConsLote_Mat_SL'
    CloseDataSource = False
    FieldAliases.Strings = (
      'REFERENCIA=REFERENCIA'
      'NOME_MATERIAL=NOME_MATERIAL'
      'NOME_COR_MAT=NOME_COR_MAT'
      'QTD_CONSUMO=QTD_CONSUMO'
      'QTD_PRODUTO=QTD_PRODUTO'
      'NUM_ORDEM=NUM_ORDEM'
      'ITEM=ITEM'
      'ID_MATERIAL=ID_MATERIAL'
      'ID_COR_PRODUTO=ID_COR_PRODUTO'
      'ID_COR_MATERIAL=ID_COR_MATERIAL'
      'NOME_COMBINACAO=NOME_COMBINACAO'
      'CODBARRAS=CODBARRAS'
      'DTRETORNO=DTRETORNO'
      'DTPAGO=DTPAGO'
      'QTD_PAGO=QTD_PAGO'
      'QTD_RETORNO=QTD_RETORNO'
      'QTD_DIFERENCA=QTD_DIFERENCA'
      'QTD_CONES=QTD_CONES'
      'IMPRESSO=IMPRESSO'
      'NUM_LOTE=NUM_LOTE')
    DataSource = dsConsLote_Mat_Prod2
    BCDToCurrency = False
    Left = 924
    Top = 519
  end
  object mAuxProcesso_Ped: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
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
        Name = 'Nome_Cor'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Qtd'
        DataType = ftFloat
      end
      item
        Name = 'Unidade'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Num_Ordem'
        DataType = ftInteger
      end
      item
        Name = 'Num_Lote'
        DataType = ftInteger
      end
      item
        Name = 'Num_Pedido'
        DataType = ftInteger
      end
      item
        Name = 'Item_Pedido'
        DataType = ftInteger
      end
      item
        Name = 'Pedido_Cliente'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Nome_Cliente'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ID_Processo'
        DataType = ftInteger
      end
      item
        Name = 'Nome_Processo'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'DtEntrega'
        DataType = ftDate
      end
      item
        Name = 'Fuso'
        DataType = ftFloat
      end
      item
        Name = 'Desc_Tipo_Produto'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'Carga'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 869
    Top = 210
    Data = {
      B60100009619E0BD010000001800000011000000000003000000B6010A526566
      6572656E63696101004900000001000557494454480200020014000C4E6F6D65
      5F50726F6475746F0100490000000100055749445448020002006400084E6F6D
      655F436F72010049000000010005574944544802000200320003517464080004
      000000000007556E696461646501004900000001000557494454480200020006
      00094E756D5F4F7264656D0400010000000000084E756D5F4C6F746504000100
      000000000A4E756D5F50656469646F04000100000000000B4974656D5F506564
      69646F04000100000000000E50656469646F5F436C69656E7465010049000000
      01000557494454480200020014000C4E6F6D655F436C69656E74650100490000
      0001000557494454480200020032000B49445F50726F636573736F0400010000
      0000000D4E6F6D655F50726F636573736F010049000000010005574944544802
      0002002800094474456E74726567610400060000000000044675736F08000400
      0000000011446573635F5469706F5F50726F6475746F01004900000001000557
      4944544802000200080005436172676108000400000000000000}
    object mAuxProcesso_PedReferencia: TStringField
      FieldName = 'Referencia'
    end
    object mAuxProcesso_PedNome_Produto: TStringField
      FieldName = 'Nome_Produto'
      Size = 100
    end
    object mAuxProcesso_PedNome_Cor: TStringField
      FieldName = 'Nome_Cor'
      Size = 50
    end
    object mAuxProcesso_PedQtd: TFloatField
      FieldName = 'Qtd'
    end
    object mAuxProcesso_PedUnidade: TStringField
      FieldName = 'Unidade'
      Size = 6
    end
    object mAuxProcesso_PedNum_Ordem: TIntegerField
      FieldName = 'Num_Ordem'
    end
    object mAuxProcesso_PedNum_Lote: TIntegerField
      FieldName = 'Num_Lote'
    end
    object mAuxProcesso_PedNum_Pedido: TIntegerField
      FieldName = 'Num_Pedido'
    end
    object mAuxProcesso_PedItem_Pedido: TIntegerField
      FieldName = 'Item_Pedido'
    end
    object mAuxProcesso_PedPedido_Cliente: TStringField
      FieldName = 'Pedido_Cliente'
    end
    object mAuxProcesso_PedNome_Cliente: TStringField
      FieldName = 'Nome_Cliente'
      Size = 50
    end
    object mAuxProcesso_PedID_Processo: TIntegerField
      FieldName = 'ID_Processo'
    end
    object mAuxProcesso_PedNome_Processo: TStringField
      FieldName = 'Nome_Processo'
      Size = 40
    end
    object mAuxProcesso_PedDtEntrega: TDateField
      FieldName = 'DtEntrega'
    end
    object mAuxProcesso_PedFuso: TFloatField
      FieldName = 'Fuso'
    end
    object mAuxProcesso_PedDesc_Tipo_Produto: TStringField
      FieldName = 'Desc_Tipo_Produto'
      Size = 8
    end
    object mAuxProcesso_PedCarga: TFloatField
      FieldName = 'Carga'
    end
  end
  object sdsProcesso_Ped: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select sum(AUX.QTD_PRODUCAO_PEDIDO) QTD_PRODUCAO_PEDIDO, AUX.NUM' +
      '_PEDIDO, AUX.PEDIDO_CLIENTE, AUX.DTENTREGA'#13#10'from (select LP.NUM_' +
      'PEDIDO, LP.PEDIDO_CLIENTE, IT.DTENTREGA, IT.QTD QTD_PEDIDO,'#13#10'   ' +
      '          case'#13#10'               when round(PS.QTD_CONSUMO1, 3) > ' +
      '0 then round(PS.QTD_CONSUMO1 * LP.QTD_PARES, 4)'#13#10'               ' +
      'else LP.QTD_PARES'#13#10'             end QTD_PRODUCAO_PEDIDO'#13#10'      f' +
      'rom LOTE_PED LP'#13#10'      inner join PEDIDO_ITEM IT on LP.ID_PEDIDO' +
      ' = IT.ID and LP.ITEM_PEDIDO = IT.ITEM'#13#10'      left join PRODUTO_S' +
      'EMI PS on IT.ID_PRODUTO = PS.ID'#13#10'      where LP.ID = :ID) AUX'#13#10'g' +
      'roup by AUX.NUM_PEDIDO, AUX.PEDIDO_CLIENTE, AUX.DTENTREGA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 801
    Top = 22
  end
  object dspProcesso_Ped: TDataSetProvider
    DataSet = sdsProcesso_Ped
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspLoteUpdateError
    Left = 849
    Top = 22
  end
  object cdsProcesso_Ped: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NUM_PEDIDO;DTENTREGA'
    Params = <>
    ProviderName = 'dspProcesso_Ped'
    OnCalcFields = cdsTalao_SLCalcFields
    Left = 897
    Top = 22
    object cdsProcesso_PedQTD_PRODUCAO_PEDIDO: TFloatField
      FieldName = 'QTD_PRODUCAO_PEDIDO'
    end
    object cdsProcesso_PedNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object cdsProcesso_PedPEDIDO_CLIENTE: TStringField
      FieldName = 'PEDIDO_CLIENTE'
    end
    object cdsProcesso_PedDTENTREGA: TDateField
      FieldName = 'DTENTREGA'
    end
  end
  object dsProcesso_Ped: TDataSource
    DataSet = cdsProcesso_Ped
    Left = 944
    Top = 22
  end
  object dsmAuxProcesso_Ped: TDataSource
    DataSet = mAuxProcesso_Ped
    Left = 931
    Top = 210
  end
  object frxmAuxProcesso_Ped: TfrxDBDataset
    UserName = 'mAuxProcesso_Ped'
    CloseDataSource = False
    FieldAliases.Strings = (
      'Referencia=Referencia'
      'Nome_Produto=Nome_Produto'
      'Nome_Cor=Nome_Cor'
      'Qtd=Qtd'
      'Unidade=Unidade'
      'Num_Ordem=Num_Ordem'
      'Num_Lote=Num_Lote'
      'Num_Pedido=Num_Pedido'
      'Item_Pedido=Item_Pedido'
      'Pedido_Cliente=Pedido_Cliente'
      'Nome_Cliente=Nome_Cliente'
      'ID_Processo=ID_Processo'
      'Nome_Processo=Nome_Processo'
      'DtEntrega=DtEntrega'
      'Fuso=Fuso'
      'Desc_Tipo_Produto=Desc_Tipo_Produto'
      'Carga=Carga')
    DataSource = dsmAuxProcesso_Ped
    BCDToCurrency = False
    Left = 1015
    Top = 217
  end
end
