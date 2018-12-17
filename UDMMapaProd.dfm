object DMMapaProd: TDMMapaProd
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 339
  Top = 107
  Height = 482
  Width = 939
  object sdsConsulta_Lote: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT L.num_lote, L.DTENTREGA,'#13#10'L.NUM_ORDEM,'#13#10'T.id, T.id_produt' +
      'o, T.tamanho, sum(T.qtd) qtd,'#13#10'T.id_combinacao, PRO.REFERENCIA, ' +
      'PRO.NOME NOME_PRODUTO, PRO.UNIDADE, PRO.ID_GRADE,'#13#10'COMB.nome NOM' +
      'E_COMBINACAO'#13#10'FROM LOTE L'#13#10'INNER JOIN TALAO T'#13#10'ON L.ID = T.ID'#13#10'L' +
      'EFT JOIN PRODUTO PRO'#13#10'ON T.ID_PRODUTO = PRO.ID'#13#10'LEFT JOIN combin' +
      'acao COMB'#13#10'ON L.id_combinacao = COMB.id'#13#10'WHERE L.NUM_ORDEM BETWE' +
      'EN :NUM_INI AND :NUM_FIN'#13#10'group by L.num_lote, L.DTENTREGA,'#13#10'L.N' +
      'UM_ORDEM,'#13#10'T.id, T.id_produto, T.tamanho,'#13#10'T.id_combinacao, PRO.' +
      'REFERENCIA, PRO.NOME, PRO.UNIDADE, PRO.ID_GRADE,'#13#10'COMB.nome'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_INI'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUM_FIN'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 120
    Top = 24
  end
  object dspConsulta_Lote: TDataSetProvider
    DataSet = sdsConsulta_Lote
    Left = 176
    Top = 24
  end
  object cdsConsulta_Lote: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta_Lote'
    Left = 240
    Top = 24
    object cdsConsulta_LoteNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object cdsConsulta_LoteDTENTREGA: TDateField
      FieldName = 'DTENTREGA'
    end
    object cdsConsulta_LoteNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsConsulta_LoteID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsulta_LoteID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsConsulta_LoteTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object cdsConsulta_LoteQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsConsulta_LoteID_COMBINACAO: TIntegerField
      FieldName = 'ID_COMBINACAO'
    end
    object cdsConsulta_LoteREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsConsulta_LoteNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object cdsConsulta_LoteUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsConsulta_LoteID_GRADE: TIntegerField
      FieldName = 'ID_GRADE'
    end
    object cdsConsulta_LoteNOME_COMBINACAO: TStringField
      FieldName = 'NOME_COMBINACAO'
      Size = 60
    end
  end
  object dsConsulta_Lote: TDataSource
    DataSet = cdsConsulta_Lote
    Left = 288
    Top = 24
  end
  object mMapa: TClientDataSet
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
        Name = 'ID_Produto'
        DataType = ftInteger
      end
      item
        Name = 'ID_Combinacao'
        DataType = ftInteger
      end
      item
        Name = 'Referencia'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Nome_Produto'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Nome_Combinacao'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Qtd'
        DataType = ftInteger
      end
      item
        Name = 'QTam1'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'QTam2'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'QTam3'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'QTam4'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'QTam5'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'QTam6'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'QTam7'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'QTam8'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'QTam9'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'QTam10'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'QTam11'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'QTam12'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'QTam13'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'QTam14'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'QTam15'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'Tipo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Agrupar'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnNewRecord = mMapaNewRecord
    Left = 88
    Top = 224
    Data = {
      970200009619E0BD0100000018000000190000000000030000009702094E756D
      5F4F7264656D0400010000000000084E756D5F4C6F746504000100000000000A
      49445F50726F6475746F04000100000000000D49445F436F6D62696E6163616F
      04000100000000000A5265666572656E63696101004900000001000557494454
      480200020014000C4E6F6D655F50726F6475746F010049000000010005574944
      5448020002003C000F4E6F6D655F436F6D62696E6163616F0100490000000100
      055749445448020002003C00035174640400010000000000055154616D310100
      490000000100055749445448020002000700055154616D320100490000000100
      055749445448020002000700055154616D330100490000000100055749445448
      020002000700055154616D340100490000000100055749445448020002000700
      055154616D350100490000000100055749445448020002000700055154616D36
      0100490000000100055749445448020002000700055154616D37010049000000
      0100055749445448020002000700055154616D38010049000000010005574944
      5448020002000700055154616D39010049000000010005574944544802000200
      0700065154616D31300100490000000100055749445448020002000700065154
      616D31310100490000000100055749445448020002000700065154616D313201
      00490000000100055749445448020002000700065154616D3133010049000000
      0100055749445448020002000700065154616D31340100490000000100055749
      445448020002000700065154616D313501004900000001000557494454480200
      02000700045469706F0100490000000100055749445448020002000100074167
      727570617201004900000001000557494454480200020014000000}
    object mMapaNum_Ordem: TIntegerField
      FieldName = 'Num_Ordem'
    end
    object mMapaNum_Lote: TIntegerField
      FieldName = 'Num_Lote'
    end
    object mMapaID_Produto: TIntegerField
      FieldName = 'ID_Produto'
    end
    object mMapaID_Combinacao: TIntegerField
      FieldName = 'ID_Combinacao'
    end
    object mMapaReferencia: TStringField
      FieldName = 'Referencia'
    end
    object mMapaNome_Produto: TStringField
      FieldName = 'Nome_Produto'
      Size = 60
    end
    object mMapaNome_Combinacao: TStringField
      FieldName = 'Nome_Combinacao'
      Size = 60
    end
    object mMapaQtd: TIntegerField
      FieldName = 'Qtd'
    end
    object mMapaQTam1: TStringField
      FieldName = 'QTam1'
      Size = 7
    end
    object mMapaQTam2: TStringField
      FieldName = 'QTam2'
      Size = 7
    end
    object mMapaQTam3: TStringField
      FieldName = 'QTam3'
      Size = 7
    end
    object mMapaQTam4: TStringField
      FieldName = 'QTam4'
      Size = 7
    end
    object mMapaQTam5: TStringField
      FieldName = 'QTam5'
      Size = 7
    end
    object mMapaQTam6: TStringField
      FieldName = 'QTam6'
      Size = 7
    end
    object mMapaQTam7: TStringField
      FieldName = 'QTam7'
      Size = 7
    end
    object mMapaQTam8: TStringField
      FieldName = 'QTam8'
      Size = 7
    end
    object mMapaQTam9: TStringField
      FieldName = 'QTam9'
      Size = 7
    end
    object mMapaQTam10: TStringField
      FieldName = 'QTam10'
      Size = 7
    end
    object mMapaQTam11: TStringField
      FieldName = 'QTam11'
      Size = 7
    end
    object mMapaQTam12: TStringField
      FieldName = 'QTam12'
      Size = 7
    end
    object mMapaQTam13: TStringField
      FieldName = 'QTam13'
      Size = 7
    end
    object mMapaQTam14: TStringField
      FieldName = 'QTam14'
      Size = 7
    end
    object mMapaQTam15: TStringField
      FieldName = 'QTam15'
      Size = 7
    end
    object mMapaTipo: TStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object mMapaAgrupar: TStringField
      FieldName = 'Agrupar'
    end
  end
  object sdsTam: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select distinct t.tamanho'#13#10'from talao t'#13#10'inner join lote l'#13#10'on t' +
      '.id = l.id'#13#10'where L.ID_PRODUTO = :ID_PRODUTO'#13#10'  and L.NUM_ORDEM ' +
      '= :NUM_ORDEM'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUM_ORDEM'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 456
    Top = 72
  end
  object dspTam: TDataSetProvider
    DataSet = sdsTam
    Left = 512
    Top = 72
  end
  object cdsTam: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'TAMANHO'
    Params = <>
    ProviderName = 'dspTam'
    Left = 576
    Top = 72
    object cdsTamTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
  end
  object dsmMapa: TDataSource
    DataSet = mMapa
    Left = 152
    Top = 224
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
    ReportOptions.CreateDate = 42751.456864641200000000
    ReportOptions.LastChange = 43115.748148483800000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 480
    Top = 271
  end
  object frxmMapa: TfrxDBDataset
    UserName = 'frxmMapa'
    OnFirst = frxmMapaOpen
    OnNext = frxmMapaOpen
    CloseDataSource = False
    FieldAliases.Strings = (
      'Num_Ordem=Num_Ordem'
      'Num_Lote=Num_Lote'
      'ID_Produto=ID_Produto'
      'ID_Combinacao=ID_Combinacao'
      'Referencia=Referencia'
      'Nome_Produto=Nome_Produto'
      'Nome_Combinacao=Nome_Combinacao'
      'Qtd=Qtd'
      'QTam1=QTam1'
      'QTam2=QTam2'
      'QTam3=QTam3'
      'QTam4=QTam4'
      'QTam5=QTam5'
      'QTam6=QTam6'
      'QTam7=QTam7'
      'QTam8=QTam8'
      'QTam9=QTam9'
      'QTam10=QTam10'
      'QTam11=QTam11'
      'QTam12=QTam12'
      'QTam13=QTam13'
      'QTam14=QTam14'
      'QTam15=QTam15'
      'Tipo=Tipo'
      'Agrupar=Agrupar')
    OnOpen = frxmMapaOpen
    DataSource = dsmMapa
    BCDToCurrency = False
    Left = 480
    Top = 327
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
    Left = 520
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
    Left = 560
    Top = 271
  end
  object frxRichObject1: TfrxRichObject
    Left = 592
    Top = 271
  end
  object frxTam: TfrxDBDataset
    UserName = 'frxTam'
    CloseDataSource = False
    FieldAliases.Strings = (
      'TAMANHO=TAMANHO')
    DataSource = dsTam
    BCDToCurrency = False
    Left = 536
    Top = 327
  end
  object dsTam: TDataSource
    DataSet = cdsTam
    Left = 624
    Top = 72
  end
  object sdsTamQ: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select sum(t.qtd) qtd, t.tamanho'#13#10'from talao t'#13#10'inner join lote ' +
      'l'#13#10'on t.id = l.id'#13#10'where L.ID_PRODUTO = :ID_PRODUTO'#13#10'  and L.NUM' +
      '_ORDEM = :NUM_ORDEM'#13#10'  and L.NUM_LOTE = :NUM_LOTE'#13#10'group by t.ta' +
      'manho'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end
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
    Left = 456
    Top = 120
  end
  object dspTamQ: TDataSetProvider
    DataSet = sdsTamQ
    Left = 512
    Top = 120
  end
  object cdsTamQ: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'TAMANHO'
    Params = <>
    ProviderName = 'dspTamQ'
    Left = 576
    Top = 120
    object cdsTamQQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsTamQTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
  end
  object dsTamQ: TDataSource
    DataSet = cdsTamQ
    Left = 624
    Top = 120
  end
  object frxTamQ: TfrxDBDataset
    UserName = 'frxTamQ'
    CloseDataSource = False
    FieldAliases.Strings = (
      'QTD=QTD'
      'TAMANHO=TAMANHO')
    DataSource = dsTamQ
    BCDToCurrency = False
    Left = 584
    Top = 327
  end
  object sdsConsulta_Talao: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT L.num_lote, t.num_talao, L.DTENTREGA, L.NUM_ORDEM, T.id, ' +
      'T.id_produto,'#13#10'T.tamanho, T.qtd, T.id_combinacao, PRO.REFERENCIA' +
      ','#13#10'PRO.NOME NOME_PRODUTO, PRO.UNIDADE, PRO.ID_GRADE, COMB.nome N' +
      'OME_COMBINACAO'#13#10'FROM LOTE L'#13#10'INNER JOIN TALAO T'#13#10'ON L.ID = T.ID'#13 +
      #10'LEFT JOIN PRODUTO PRO'#13#10'ON T.ID_PRODUTO = PRO.ID'#13#10'LEFT JOIN comb' +
      'inacao COMB'#13#10'ON L.id_combinacao = COMB.id'#13#10'WHERE L.NUM_ORDEM BET' +
      'WEEN :NUM_INI AND :NUM_FIN'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_INI'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUM_FIN'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 112
    Top = 80
  end
  object dspConsulta_Talao: TDataSetProvider
    DataSet = sdsConsulta_Talao
    Left = 168
    Top = 80
  end
  object cdsConsulta_Talao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta_Talao'
    Left = 232
    Top = 80
    object cdsConsulta_TalaoNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object cdsConsulta_TalaoNUM_TALAO: TIntegerField
      FieldName = 'NUM_TALAO'
      Required = True
    end
    object cdsConsulta_TalaoDTENTREGA: TDateField
      FieldName = 'DTENTREGA'
    end
    object cdsConsulta_TalaoNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsConsulta_TalaoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsulta_TalaoID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsConsulta_TalaoTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object cdsConsulta_TalaoQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsConsulta_TalaoID_COMBINACAO: TIntegerField
      FieldName = 'ID_COMBINACAO'
    end
    object cdsConsulta_TalaoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsConsulta_TalaoNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 100
    end
    object cdsConsulta_TalaoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsConsulta_TalaoID_GRADE: TIntegerField
      FieldName = 'ID_GRADE'
    end
    object cdsConsulta_TalaoNOME_COMBINACAO: TStringField
      FieldName = 'NOME_COMBINACAO'
      Size = 60
    end
  end
  object dsConsulta_Talao: TDataSource
    DataSet = cdsConsulta_Talao
    Left = 280
    Top = 80
  end
  object mMapa_Talao: TClientDataSet
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
        Name = 'ID_Produto'
        DataType = ftInteger
      end
      item
        Name = 'ID_Combinacao'
        DataType = ftInteger
      end
      item
        Name = 'Referencia'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Nome_Produto'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Nome_Combinacao'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Qtd'
        DataType = ftInteger
      end
      item
        Name = 'Tipo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Agrupar'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Tamanho'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Talao'
        DataType = ftInteger
      end
      item
        Name = 'Data1'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Data2'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Data3'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Data4'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Data5'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Data6'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Data7'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Data8'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Data9'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Num_Talao'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnNewRecord = mMapa_TalaoNewRecord
    Left = 272
    Top = 216
    Data = {
      310200009619E0BD0100000018000000160000000000030000003102094E756D
      5F4F7264656D0400010000000000084E756D5F4C6F746504000100000000000A
      49445F50726F6475746F04000100000000000D49445F436F6D62696E6163616F
      04000100000000000A5265666572656E63696101004900000001000557494454
      480200020014000C4E6F6D655F50726F6475746F010049000000010005574944
      5448020002003C000F4E6F6D655F436F6D62696E6163616F0100490000000100
      055749445448020002003C00035174640400010000000000045469706F010049
      0000000100055749445448020002000100074167727570617201004900000001
      000557494454480200020014000754616D616E686F0100490000000100055749
      445448020002000A000554616C616F0400010000000000054461746131010049
      0000000100055749445448020002000500054461746132010049000000010005
      5749445448020002000500054461746133010049000000010005574944544802
      0002000500054461746134010049000000010005574944544802000200050005
      4461746135010049000000010005574944544802000200050005446174613601
      0049000000010005574944544802000200050005446174613701004900000001
      0005574944544802000200050005446174613801004900000001000557494454
      4802000200050005446174613901004900000001000557494454480200020005
      00094E756D5F54616C616F04000100000000000000}
    object mMapa_TalaoNum_Ordem: TIntegerField
      FieldName = 'Num_Ordem'
    end
    object mMapa_TalaoNum_Lote: TIntegerField
      FieldName = 'Num_Lote'
    end
    object mMapa_TalaoID_Produto: TIntegerField
      FieldName = 'ID_Produto'
    end
    object mMapa_TalaoID_Combinacao: TIntegerField
      FieldName = 'ID_Combinacao'
    end
    object mMapa_TalaoReferencia: TStringField
      FieldName = 'Referencia'
    end
    object mMapa_TalaoNome_Produto: TStringField
      FieldName = 'Nome_Produto'
      Size = 60
    end
    object mMapa_TalaoNome_Combinacao: TStringField
      FieldName = 'Nome_Combinacao'
      Size = 60
    end
    object mMapa_TalaoQtd: TIntegerField
      FieldName = 'Qtd'
    end
    object mMapa_TalaoTipo: TStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object mMapa_TalaoAgrupar: TStringField
      FieldName = 'Agrupar'
    end
    object mMapa_TalaoTamanho: TStringField
      FieldName = 'Tamanho'
      Size = 10
    end
    object mMapa_TalaoTalao: TIntegerField
      FieldName = 'Talao'
    end
    object mMapa_TalaoData1: TStringField
      FieldName = 'Data1'
      Size = 5
    end
    object mMapa_TalaoData2: TStringField
      FieldName = 'Data2'
      Size = 5
    end
    object mMapa_TalaoData3: TStringField
      FieldName = 'Data3'
      Size = 5
    end
    object mMapa_TalaoData4: TStringField
      FieldName = 'Data4'
      Size = 5
    end
    object mMapa_TalaoData5: TStringField
      FieldName = 'Data5'
      Size = 5
    end
    object mMapa_TalaoData6: TStringField
      FieldName = 'Data6'
      Size = 5
    end
    object mMapa_TalaoData7: TStringField
      FieldName = 'Data7'
      Size = 5
    end
    object mMapa_TalaoData8: TStringField
      FieldName = 'Data8'
      Size = 5
    end
    object mMapa_TalaoData9: TStringField
      FieldName = 'Data9'
      Size = 5
    end
    object mMapa_TalaoNum_Talao: TIntegerField
      FieldName = 'Num_Talao'
    end
  end
  object dsmMapa_Talao: TDataSource
    DataSet = mMapa_Talao
    Left = 344
    Top = 216
  end
  object sdsSetorM: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT S.*'#13#10'FROM SETOR S'#13#10'WHERE S.IMP_MAPA = '#39'S'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 232
    Top = 344
  end
  object dspSetorM: TDataSetProvider
    DataSet = sdsSetorM
    Left = 264
    Top = 344
  end
  object cdsSetorM: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ORDEM_ORC'
    Params = <>
    ProviderName = 'dspSetorM'
    Left = 296
    Top = 344
    object cdsSetorMID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsSetorMNOME: TStringField
      FieldName = 'NOME'
    end
    object cdsSetorMORDEM_ORC: TIntegerField
      FieldName = 'ORDEM_ORC'
    end
    object cdsSetorMENTRADA_AUT: TStringField
      FieldName = 'ENTRADA_AUT'
      FixedChar = True
      Size = 1
    end
    object cdsSetorMIMP_MAPA: TStringField
      FieldName = 'IMP_MAPA'
      FixedChar = True
      Size = 1
    end
    object cdsSetorMENCERRA_PROD: TStringField
      FieldName = 'ENCERRA_PROD'
      FixedChar = True
      Size = 1
    end
  end
  object sdsSetD: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select B.DTENTRADA, B.DTSAIDA, S.NOME, B.ITEM, S.IMP_MAPA, S.ENC' +
      'ERRA_PROD, B.QTD, B.ID_SETOR, L.NUM_LOTE'#13#10'from TALAO_SETOR B'#13#10'in' +
      'ner join LOTE L on B.ID = L.ID'#13#10'inner join SETOR S on B.ID_SETOR' +
      ' = S.ID'#13#10'where (S.IMP_MAPA = '#39'S'#39') and'#13#10'      (L.NUM_LOTE = :NUM_' +
      'LOTE) and'#13#10'      (B.NUM_TALAO = :NUM_TALAO)  '
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_LOTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUM_TALAO'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 456
    Top = 176
  end
  object dspSetD: TDataSetProvider
    DataSet = sdsSetD
    Left = 512
    Top = 176
  end
  object cdsSetD: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ITEM'
    Params = <>
    ProviderName = 'dspSetD'
    Left = 576
    Top = 176
    object cdsSetDDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object cdsSetDDTSAIDA: TDateField
      FieldName = 'DTSAIDA'
    end
    object cdsSetDNOME: TStringField
      FieldName = 'NOME'
    end
    object cdsSetDITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsSetDIMP_MAPA: TStringField
      FieldName = 'IMP_MAPA'
      FixedChar = True
      Size = 1
    end
    object cdsSetDENCERRA_PROD: TStringField
      FieldName = 'ENCERRA_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsSetDQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsSetDID_SETOR: TIntegerField
      FieldName = 'ID_SETOR'
    end
    object cdsSetDNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
  end
  object dsSetD: TDataSource
    DataSet = cdsSetD
    Left = 624
    Top = 176
  end
  object dsSetorM: TDataSource
    DataSet = cdsSetorM
    Left = 328
    Top = 344
  end
  object frxSetorM: TfrxDBDataset
    UserName = 'frxSetorM'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'NOME=NOME'
      'ORDEM_ORC=ORDEM_ORC'
      'ENTRADA_AUT=ENTRADA_AUT'
      'IMP_MAPA=IMP_MAPA'
      'ENCERRA_PROD=ENCERRA_PROD')
    DataSource = dsSetorM
    BCDToCurrency = False
    Left = 536
    Top = 375
  end
  object frxSetD: TfrxDBDataset
    UserName = 'frxSetD'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DTENTRADA=DTENTRADA'
      'DTSAIDA=DTSAIDA'
      'NOME=NOME'
      'ITEM=ITEM'
      'IMP_MAPA=IMP_MAPA'
      'ENCERRA_PROD=ENCERRA_PROD')
    DataSource = dsSetD
    BCDToCurrency = False
    Left = 584
    Top = 375
  end
  object frxmMapa_Talao: TfrxDBDataset
    UserName = 'frxmMapa_Talao'
    OnFirst = frxmMapa_TalaoFirst
    OnNext = frxmMapa_TalaoNext
    CloseDataSource = False
    FieldAliases.Strings = (
      'Num_Ordem=Num_Ordem'
      'Num_Lote=Num_Lote'
      'ID_Produto=ID_Produto'
      'ID_Combinacao=ID_Combinacao'
      'Referencia=Referencia'
      'Nome_Produto=Nome_Produto'
      'Nome_Combinacao=Nome_Combinacao'
      'Qtd=Qtd'
      'Tipo=Tipo'
      'Agrupar=Agrupar'
      'Tamanho=Tamanho'
      'Talao=Talao'
      'Data1=Data1'
      'Data2=Data2'
      'Data3=Data3'
      'Data4=Data4'
      'Data5=Data5'
      'Data6=Data6'
      'Data7=Data7'
      'Data8=Data8'
      'Data9=Data9'
      'Num_Talao=Num_Talao')
    OnOpen = frxmMapa_TalaoOpen
    DataSource = dsmMapa_Talao
    BCDToCurrency = False
    Left = 480
    Top = 375
  end
  object mMapaAux: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 272
    Data = {
      670000009619E0BD0100000018000000040000000000030000006700094E756D
      5F4F7264656D04000100000000000A49445F50726F6475746F04000100000000
      000754616D616E686F0100490000000100055749445448020002000A00035174
      6404000100000000000000}
    object mMapaAuxNum_Ordem: TIntegerField
      FieldName = 'Num_Ordem'
    end
    object mMapaAuxID_Produto: TIntegerField
      FieldName = 'ID_Produto'
    end
    object mMapaAuxTamanho: TStringField
      FieldName = 'Tamanho'
      Size = 10
    end
    object mMapaAuxQtd: TIntegerField
      FieldName = 'Qtd'
    end
  end
  object dsmMapaAux: TDataSource
    DataSet = mMapaAux
    Left = 304
    Top = 272
  end
  object frxTotal: TfrxDBDataset
    UserName = 'frxTotal'
    CloseDataSource = True
    FieldAliases.Strings = (
      'NUM_ORDEM=NUM_ORDEM'
      'ID_PRODUTO=ID_PRODUTO'
      'TAMANHO=TAMANHO'
      'QTD=QTD'
      'ID_COMBINACAO=ID_COMBINACAO')
    DataSource = dsTotal
    BCDToCurrency = False
    Left = 632
    Top = 375
  end
  object sdsTotal: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select L.NUM_ORDEM, T.ID_PRODUTO, T.TAMANHO, sum(T.QTD) QTD'#13#10'fro' +
      'm LOTE L'#13#10'inner join TALAO T on L.ID = T.ID'#13#10'where L.NUM_ORDEM =' +
      ' :NUM_ORDEM and'#13#10'      L.ID_PRODUTO = :ID_PRODUTO and'#13#10'      L.I' +
      'D_COMBINACAO = :ID_COMBINACAO'#13#10'group by L.NUM_ORDEM, T.ID_PRODUT' +
      'O, T.TAMANHO'#13#10#13#10'union all'#13#10#13#10'select L.NUM_ORDEM, T.ID_PRODUTO, '#39 +
      'Total'#39' TAMANHO, sum(T.QTD) QTD'#13#10'from LOTE L'#13#10'inner join TALAO T ' +
      'on L.ID = T.ID'#13#10'where L.NUM_ORDEM = :NUM_ORDEM and'#13#10'      L.ID_P' +
      'RODUTO = :ID_PRODUTO and'#13#10'      L.ID_COMBINACAO = :ID_COMBINACAO' +
      #13#10'group by L.NUM_ORDEM, T.ID_PRODUTO   '#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'NUM_ORDEM'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ID_COMBINACAO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'NUM_ORDEM'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ID_COMBINACAO'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 648
    Top = 8
  end
  object dspTotal: TDataSetProvider
    DataSet = sdsTotal
    Left = 680
    Top = 8
  end
  object cdsTotal: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'TAMANHO'
    Params = <>
    ProviderName = 'dspTotal'
    Left = 712
    Top = 8
    object cdsTotalNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsTotalID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsTotalTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object cdsTotalQTD: TFloatField
      FieldName = 'QTD'
    end
  end
  object dsTotal: TDataSource
    DataSet = cdsTotal
    Left = 744
    Top = 8
  end
  object frxTotalGeral: TfrxDBDataset
    UserName = 'frxTotalGeral'
    CloseDataSource = False
    FieldAliases.Strings = (
      'TAMANHO=TAMANHO'
      'QTD=QTD')
    DataSource = dsTotalGeral
    BCDToCurrency = False
    Left = 632
    Top = 328
  end
  object sdsTotalGeral: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select T.TAMANHO, sum(T.QTD) QTD'#13#10'from LOTE L'#13#10'inner join TALAO ' +
      'T on L.ID = T.ID'#13#10'where L.NUM_ORDEM between :ORDEM_INICIAL and :' +
      'ORDEM_FINAL'#13#10'group by T.TAMANHO'#13#10'union all'#13#10'select '#39'Total'#39', sum(' +
      'T.QTD) QTD'#13#10'from LOTE L'#13#10'inner join TALAO T on L.ID = T.ID'#13#10'wher' +
      'e L.NUM_ORDEM between :ORDEM_INICIAL and :ORDEM_FINAL    '
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'ORDEM_INICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ORDEM_FINAL'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ORDEM_INICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ORDEM_FINAL'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 712
    Top = 152
  end
  object dspTotalGeral: TDataSetProvider
    DataSet = sdsTotalGeral
    Left = 744
    Top = 152
  end
  object cdsTotalGeral: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTotalGeral'
    Left = 776
    Top = 152
    object cdsTotalGeralTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 10
    end
    object cdsTotalGeralQTD: TFloatField
      FieldName = 'QTD'
    end
  end
  object dsTotalGeral: TDataSource
    DataSet = cdsTotalGeral
    Left = 808
    Top = 152
  end
  object mSetorLote: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NUM_LOTE'
        DataType = ftInteger
      end
      item
        Name = 'ID_SETOR'
        DataType = ftInteger
      end
      item
        Name = 'QUANTIDADE'
        DataType = ftFloat
      end
      item
        Name = 'QUANTIDADE_ENCERRADO'
        DataType = ftFloat
      end
      item
        Name = 'NOME_SETOR'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'AGRUPAR'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    IndexFieldNames = 'NUM_LOTE'
    MasterFields = 'Num_Lote'
    MasterSource = dsmMapa_Talao
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    Left = 104
    Top = 312
    Data = {
      A70000009619E0BD010000001800000006000000000003000000A700084E554D
      5F4C4F544504000100000000000849445F5345544F5204000100000000000A51
      55414E5449444144450800040000000000145155414E5449444144455F454E43
      45525241444F08000400000000000A4E4F4D455F5345544F5201004900000001
      0005574944544802000200140007414752555041520100490000000100055749
      4454480200020014000000}
    object mSetorLoteNUM_LOTE: TIntegerField
      DisplayWidth = 12
      FieldName = 'NUM_LOTE'
    end
    object mSetorLoteID_SETOR: TIntegerField
      DisplayWidth = 12
      FieldName = 'ID_SETOR'
    end
    object mSetorLoteQUANTIDADE: TFloatField
      DisplayWidth = 14
      FieldName = 'QUANTIDADE'
    end
    object mSetorLoteQUANTIDADE_ENCERRADO: TFloatField
      DisplayWidth = 29
      FieldName = 'QUANTIDADE_ENCERRADO'
    end
    object mSetorLoteNOME_SETOR: TStringField
      DisplayWidth = 24
      FieldName = 'NOME_SETOR'
    end
    object mSetorLoteAGRUPAR: TStringField
      DisplayWidth = 58
      FieldName = 'AGRUPAR'
    end
  end
  object dsSetorLote: TDataSource
    DataSet = mSetorLote
    Left = 168
    Top = 312
  end
  object frxSetorLote: TfrxDBDataset
    UserName = 'frxSetorLote'
    CloseDataSource = False
    FieldAliases.Strings = (
      'NUM_LOTE=NUM_LOTE'
      'ID_SETOR=ID_SETOR'
      'QUANTIDADE=QUANTIDADE'
      'QUANTIDADE_ENCERRADO=QUANTIDADE_ENCERRADO'
      'NOME_SETOR=NOME_SETOR')
    DataSource = dsSetorLote
    BCDToCurrency = False
    Left = 688
    Top = 376
  end
end
