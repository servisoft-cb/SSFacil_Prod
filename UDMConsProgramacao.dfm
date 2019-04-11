object DMConsProgramacao: TDMConsProgramacao
  OldCreateOrder = False
  Left = 304
  Top = 155
  Height = 458
  Width = 839
  object sdsConsProg: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT PG.ID ID_PROGRAMACAO, PG.id_baixa, PG.item_baixa, PG.id_p' +
      'rocesso,'#13#10'PG.num_ordem, PG.id_lote, PG.num_lote, PG.dtinicial, P' +
      'G.hrinicial, PG.dtfinal,'#13#10'PG.hrfinal, PG.id_maquina, PG.num_boca' +
      ', PG.dtprogramacao, PG.qtd QTD_PROGRAMADO,'#13#10'PG.status, M.NOME NO' +
      'ME_MAQUINA, L.ID_PRODUTO, L.referencia, L.QTD QTD_LOTE,'#13#10'P.NOME ' +
      'NOME_PRODUTO, PC.NOME NOME_PROCESSO'#13#10'FROM PROGRAMACAO PG'#13#10'INNER ' +
      'JOIN MAQUINA M'#13#10'ON PG.ID_MAQUINA = M.ID'#13#10'INNER JOIN LOTE L'#13#10'ON P' +
      'G.ID_LOTE = L.ID'#13#10'INNER JOIN PRODUTO P'#13#10'ON L.ID_PRODUTO = P.ID'#13#10 +
      'INNER JOIN PROCESSO PC'#13#10'ON PG.ID_PROCESSO = PC.ID'#13#10'WHERE PG.STAT' +
      'US <> '#39'E'#39#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 53
    Top = 37
  end
  object dspConsProg: TDataSetProvider
    DataSet = sdsConsProg
    Left = 112
    Top = 37
  end
  object cdsConsProg: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsProg'
    Left = 168
    Top = 37
    object cdsConsProgID_PROGRAMACAO: TIntegerField
      FieldName = 'ID_PROGRAMACAO'
      Required = True
    end
    object cdsConsProgID_BAIXA: TIntegerField
      FieldName = 'ID_BAIXA'
    end
    object cdsConsProgITEM_BAIXA: TIntegerField
      FieldName = 'ITEM_BAIXA'
    end
    object cdsConsProgID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object cdsConsProgNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsConsProgID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
    end
    object cdsConsProgNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object cdsConsProgDTINICIAL: TDateField
      FieldName = 'DTINICIAL'
    end
    object cdsConsProgHRINICIAL: TTimeField
      FieldName = 'HRINICIAL'
      DisplayFormat = 'HH:MM'
    end
    object cdsConsProgDTFINAL: TDateField
      FieldName = 'DTFINAL'
    end
    object cdsConsProgHRFINAL: TTimeField
      FieldName = 'HRFINAL'
      DisplayFormat = 'HH:MM'
    end
    object cdsConsProgID_MAQUINA: TIntegerField
      FieldName = 'ID_MAQUINA'
    end
    object cdsConsProgNUM_BOCA: TIntegerField
      FieldName = 'NUM_BOCA'
    end
    object cdsConsProgDTPROGRAMACAO: TDateField
      FieldName = 'DTPROGRAMACAO'
    end
    object cdsConsProgQTD_PROGRAMADO: TFloatField
      FieldName = 'QTD_PROGRAMADO'
    end
    object cdsConsProgSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object cdsConsProgNOME_MAQUINA: TStringField
      FieldName = 'NOME_MAQUINA'
      Size = 30
    end
    object cdsConsProgID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsConsProgREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsConsProgQTD_LOTE: TFloatField
      FieldName = 'QTD_LOTE'
    end
    object cdsConsProgNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object cdsConsProgNOME_PROCESSO: TStringField
      FieldName = 'NOME_PROCESSO'
      Size = 30
    end
  end
  object dsConsProg: TDataSource
    DataSet = cdsConsProg
    Left = 218
    Top = 38
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
    ReportOptions.CreateDate = 42423.001568946800000000
    ReportOptions.LastChange = 43566.634089606480000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 520
    Top = 271
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
    Left = 560
    Top = 271
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
    Left = 600
    Top = 271
  end
  object frxRichObject1: TfrxRichObject
    Left = 632
    Top = 271
  end
  object frxConsProg: TfrxDBDataset
    UserName = 'frxConsProg'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID_PROGRAMACAO=ID_PROGRAMACAO'
      'ID_BAIXA=ID_BAIXA'
      'ITEM_BAIXA=ITEM_BAIXA'
      'ID_PROCESSO=ID_PROCESSO'
      'NUM_ORDEM=NUM_ORDEM'
      'ID_LOTE=ID_LOTE'
      'NUM_LOTE=NUM_LOTE'
      'DTINICIAL=DTINICIAL'
      'HRINICIAL=HRINICIAL'
      'DTFINAL=DTFINAL'
      'HRFINAL=HRFINAL'
      'ID_MAQUINA=ID_MAQUINA'
      'NUM_BOCA=NUM_BOCA'
      'DTPROGRAMACAO=DTPROGRAMACAO'
      'QTD_PROGRAMADO=QTD_PROGRAMADO'
      'STATUS=STATUS'
      'NOME_MAQUINA=NOME_MAQUINA'
      'ID_PRODUTO=ID_PRODUTO'
      'REFERENCIA=REFERENCIA'
      'QTD_LOTE=QTD_LOTE'
      'NOME_PRODUTO=NOME_PRODUTO'
      'NOME_PROCESSO=NOME_PROCESSO')
    DataSource = dsConsProg
    BCDToCurrency = False
    Left = 517
    Top = 320
  end
end
