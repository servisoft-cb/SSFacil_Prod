object DMConsRemessa_Prod: TDMConsRemessa_Prod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 313
  Top = 117
  Height = 344
  Width = 610
  object sdsRemessa_Ref: TSQLDataSet
    CommandText = 
      'SELECT L.referencia, PC.obsmaterial, QTD, NUM_LOTE, P.ref_ord, P' +
      '.ref_ord || '#39' '#39' || P.referencia REF_ORDENADA'#13#10'FROM LOTE L'#13#10'INNER' +
      ' JOIN PRODUTO P ON L.ID_PRODUTO = P.ID'#13#10'INNER JOIN PRODUTO_COMB ' +
      'PC ON L.ID_PRODUTO = PC.ID'#13#10'                         AND L.id_co' +
      'mbinacao = PC.id_cor_combinacao'#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 56
    Top = 24
  end
  object dspRemessa_Ref: TDataSetProvider
    DataSet = sdsRemessa_Ref
    Left = 104
    Top = 24
  end
  object cdsRemessa_Ref: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRemessa_Ref'
    Left = 160
    Top = 24
    object cdsRemessa_RefREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsRemessa_RefOBSMATERIAL: TStringField
      FieldName = 'OBSMATERIAL'
      Size = 100
    end
    object cdsRemessa_RefQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsRemessa_RefNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object cdsRemessa_RefREF_ORD: TStringField
      FieldName = 'REF_ORD'
    end
    object cdsRemessa_RefREF_ORDENADA: TStringField
      FieldName = 'REF_ORDENADA'
      Size = 41
    end
  end
  object dsRemessa_Ref: TDataSource
    DataSet = cdsRemessa_Ref
    Left = 200
    Top = 24
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
    ReportOptions.CreateDate = 43248.673105763900000000
    ReportOptions.LastChange = 43249.731576481480000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 352
    Top = 103
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
    Left = 392
    Top = 103
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
    Left = 432
    Top = 103
  end
  object frxRichObject1: TfrxRichObject
    Left = 464
    Top = 103
  end
  object frxRemessa_Ref: TfrxDBDataset
    UserName = 'frxRemessa_Ref'
    CloseDataSource = False
    FieldAliases.Strings = (
      'REFERENCIA=REFERENCIA'
      'OBSMATERIAL=OBSMATERIAL'
      'QTD=QTD'
      'NUM_LOTE=NUM_LOTE'
      'REF_ORD=REF_ORD'
      'REF_ORDENADA=REF_ORDENADA')
    DataSource = dsRemessa_Ref
    BCDToCurrency = False
    Left = 352
    Top = 159
  end
  object SQLDataSet1: TSQLDataSet
    CommandText = 
      'SELECT L.referencia, PC.obsmaterial, SUM(L.QTD) QTD, count(1) NU' +
      'M_LOTE_MAX'#13#10'FROM LOTE L'#13#10'INNER JOIN PRODUTO_COMB PC ON L.ID_PROD' +
      'UTO = PC.ID'#13#10'                         AND L.id_combinacao = PC.i' +
      'd_cor_combinacao'#13#10'GROUP BY L.referencia, PC.obsmaterial'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 96
    Top = 168
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet1
    Left = 144
    Top = 168
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRemessa_Ref'
    Left = 200
    Top = 168
    object StringField1: TStringField
      FieldName = 'REFERENCIA'
    end
    object StringField2: TStringField
      FieldName = 'OBSMATERIAL'
      Size = 100
    end
    object FloatField1: TFloatField
      FieldName = 'QTD'
    end
    object IntegerField1: TIntegerField
      FieldName = 'NUM_LOTE_MAX'
      Required = True
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 240
    Top = 168
  end
end
