object DMConsProc: TDMConsProc
  OldCreateOrder = False
  Left = 467
  Top = 186
  Height = 408
  Width = 534
  object sdsProc_Ref: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select SUM(V.qtd) QTD, SUM(V.qtd_nao_enviado) QTD_NAO_ENVIADO,'#13#10 +
      'SUM(V.qtd_no_processo) QTD_NO_PROCESSO, SUM(QTD_BAIXADO) QTD_BAI' +
      'XADO,'#13#10'V.id_produto, V.referencia, V.nome_combinacao, V.nome_pro' +
      'cesso, V.id_processo,'#13#10'V.id_combinacao'#13#10'from vcons_proc V'#13#10'GROUP' +
      ' BY V.id_produto, V.referencia, V.nome_combinacao, V.nome_proces' +
      'so, V.id_processo,'#13#10'V.id_combinacao'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 24
    Top = 72
  end
  object dspProc_Ref: TDataSetProvider
    DataSet = sdsProc_Ref
    Left = 64
    Top = 72
  end
  object cdsProc_Ref: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_PRODUTO;ID_COMBINACAO;ID_PROCESSO'
    Params = <>
    ProviderName = 'dspProc_Ref'
    Left = 104
    Top = 72
    object cdsProc_RefQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsProc_RefQTD_NAO_ENVIADO: TFloatField
      FieldName = 'QTD_NAO_ENVIADO'
    end
    object cdsProc_RefQTD_NO_PROCESSO: TFloatField
      FieldName = 'QTD_NO_PROCESSO'
    end
    object cdsProc_RefQTD_BAIXADO: TFloatField
      FieldName = 'QTD_BAIXADO'
    end
    object cdsProc_RefID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsProc_RefREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsProc_RefNOME_COMBINACAO: TStringField
      FieldName = 'NOME_COMBINACAO'
      Size = 60
    end
    object cdsProc_RefNOME_PROCESSO: TStringField
      FieldName = 'NOME_PROCESSO'
      Size = 30
    end
    object cdsProc_RefID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object cdsProc_RefID_COMBINACAO: TIntegerField
      FieldName = 'ID_COMBINACAO'
    end
  end
  object sdsProc: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'select V.nome_processo, V.id_processo, sum(coalesce(v.qtd_no_pro' +
      'cesso,0)) qtd_no_processo,'#13#10'sum(coalesce(v.qtd_nao_enviado,0)) q' +
      'td_nao_enviado'#13#10'from vcons_proc V'#13#10'group by V.nome_processo, V.i' +
      'd_processo'#13#10'ORDER by V.id_processo'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 24
    Top = 24
  end
  object dspProc: TDataSetProvider
    DataSet = sdsProc
    Left = 64
    Top = 24
  end
  object cdsProc: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_PROCESSO'
    Params = <>
    ProviderName = 'dspProc'
    Left = 104
    Top = 24
    object cdsProcNOME_PROCESSO: TStringField
      FieldName = 'NOME_PROCESSO'
      Size = 30
    end
    object cdsProcID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object cdsProcQTD_NO_PROCESSO: TFloatField
      FieldName = 'QTD_NO_PROCESSO'
    end
    object cdsProcQTD_NAO_ENVIADO: TFloatField
      FieldName = 'QTD_NAO_ENVIADO'
    end
  end
  object mConsProc: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_Mov'
        DataType = ftInteger
      end
      item
        Name = 'ID_Produto'
        DataType = ftInteger
      end
      item
        Name = 'Referencia'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ID_Combinacao'
        DataType = ftInteger
      end
      item
        Name = 'Nome_Combinacao'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Qtd1'
        DataType = ftFloat
      end
      item
        Name = 'Qtd2'
        DataType = ftFloat
      end
      item
        Name = 'Qtd3'
        DataType = ftFloat
      end
      item
        Name = 'Qtd4'
        DataType = ftFloat
      end
      item
        Name = 'Qtd5'
        DataType = ftFloat
      end
      item
        Name = 'Qtd6'
        DataType = ftFloat
      end
      item
        Name = 'Qtd7'
        DataType = ftFloat
      end
      item
        Name = 'Qtd8'
        DataType = ftFloat
      end
      item
        Name = 'Qtd9'
        DataType = ftFloat
      end
      item
        Name = 'Qtd10'
        DataType = ftFloat
      end
      item
        Name = 'Qtd11'
        DataType = ftFloat
      end
      item
        Name = 'Qtd12'
        DataType = ftFloat
      end
      item
        Name = 'Qtd13'
        DataType = ftFloat
      end
      item
        Name = 'Qtd14'
        DataType = ftFloat
      end
      item
        Name = 'Qtd15'
        DataType = ftFloat
      end
      item
        Name = 'Qtd16'
        DataType = ftFloat
      end
      item
        Name = 'Qtd17'
        DataType = ftFloat
      end
      item
        Name = 'Qtd18'
        DataType = ftFloat
      end
      item
        Name = 'Qtd19'
        DataType = ftFloat
      end
      item
        Name = 'Qtd20'
        DataType = ftFloat
      end
      item
        Name = 'QTotal'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'ID_MOV;REFERENCIA'
    Params = <>
    StoreDefs = True
    Left = 328
    Top = 72
    Data = {
      C90100009619E0BD01000000180000001A000000000003000000C9010649445F
      4D6F7604000100000000000A49445F50726F6475746F04000100000000000A52
      65666572656E63696101004900000001000557494454480200020014000D4944
      5F436F6D62696E6163616F04000100000000000F4E6F6D655F436F6D62696E61
      63616F0100490000000100055749445448020002003C00045174643108000400
      0000000004517464320800040000000000045174643308000400000000000451
      7464340800040000000000045174643508000400000000000451746436080004
      0000000000045174643708000400000000000451746438080004000000000004
      5174643908000400000000000551746431300800040000000000055174643131
      0800040000000000055174643132080004000000000005517464313308000400
      0000000005517464313408000400000000000551746431350800040000000000
      0551746431360800040000000000055174643137080004000000000005517464
      3138080004000000000005517464313908000400000000000551746432300800
      0400000000000651546F74616C080004000000000001000D44454641554C545F
      4F524445520200820000000000}
    object mConsProcID_Mov: TIntegerField
      FieldName = 'ID_Mov'
    end
    object mConsProcID_Produto: TIntegerField
      FieldName = 'ID_Produto'
    end
    object mConsProcReferencia: TStringField
      FieldName = 'Referencia'
    end
    object mConsProcID_Combinacao: TIntegerField
      FieldName = 'ID_Combinacao'
    end
    object mConsProcNome_Combinacao: TStringField
      FieldName = 'Nome_Combinacao'
      Size = 60
    end
    object mConsProcQtd1: TFloatField
      FieldName = 'Qtd1'
    end
    object mConsProcQtd2: TFloatField
      FieldName = 'Qtd2'
    end
    object mConsProcQtd3: TFloatField
      FieldName = 'Qtd3'
    end
    object mConsProcQtd4: TFloatField
      FieldName = 'Qtd4'
    end
    object mConsProcQtd5: TFloatField
      FieldName = 'Qtd5'
    end
    object mConsProcQtd6: TFloatField
      FieldName = 'Qtd6'
    end
    object mConsProcQtd7: TFloatField
      FieldName = 'Qtd7'
    end
    object mConsProcQtd8: TFloatField
      FieldName = 'Qtd8'
    end
    object mConsProcQtd9: TFloatField
      FieldName = 'Qtd9'
    end
    object mConsProcQtd10: TFloatField
      FieldName = 'Qtd10'
    end
    object mConsProcQtd11: TFloatField
      FieldName = 'Qtd11'
    end
    object mConsProcQtd12: TFloatField
      FieldName = 'Qtd12'
    end
    object mConsProcQtd13: TFloatField
      FieldName = 'Qtd13'
    end
    object mConsProcQtd14: TFloatField
      FieldName = 'Qtd14'
    end
    object mConsProcQtd15: TFloatField
      FieldName = 'Qtd15'
    end
    object mConsProcQtd16: TFloatField
      FieldName = 'Qtd16'
    end
    object mConsProcQtd17: TFloatField
      FieldName = 'Qtd17'
    end
    object mConsProcQtd18: TFloatField
      FieldName = 'Qtd18'
    end
    object mConsProcQtd19: TFloatField
      FieldName = 'Qtd19'
    end
    object mConsProcQtd20: TFloatField
      FieldName = 'Qtd20'
    end
    object mConsProcQTotal: TFloatField
      FieldName = 'QTotal'
    end
  end
  object dsmConsProc: TDataSource
    DataSet = mConsProc
    Left = 368
    Top = 72
  end
  object mProc: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_Mov'
        DataType = ftInteger
      end
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
        Name = 'Qtd_Processo'
        DataType = ftFloat
      end
      item
        Name = 'Enviado'
        DataType = ftBoolean
      end
      item
        Name = 'Item'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'ID_MOV;ITEM'
    Params = <>
    StoreDefs = True
    Left = 328
    Top = 120
    Data = {
      910000009619E0BD01000000180000000600000000000300000091000649445F
      4D6F7604000100000000000B49445F50726F636573736F04000100000000000D
      4E6F6D655F50726F636573736F0100490000000100055749445448020002003C
      000C5174645F50726F636573736F080004000000000007456E766961646F0200
      030000000000044974656D04000100000000000000}
    object mProcID_Mov: TIntegerField
      FieldName = 'ID_Mov'
    end
    object mProcID_Processo: TIntegerField
      FieldName = 'ID_Processo'
    end
    object mProcNome_Processo: TStringField
      FieldName = 'Nome_Processo'
      Size = 60
    end
    object mProcQtd_Processo: TFloatField
      FieldName = 'Qtd_Processo'
    end
    object mProcEnviado: TBooleanField
      FieldName = 'Enviado'
    end
    object mProcItem: TIntegerField
      FieldName = 'Item'
    end
  end
  object dsmProc: TDataSource
    DataSet = mProc
    Left = 376
    Top = 120
  end
  object mAuxProc: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Item'
        DataType = ftInteger
      end
      item
        Name = 'ID_Processo'
        DataType = ftInteger
      end
      item
        Name = 'Nome_Processo'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <>
    IndexFieldNames = 'Item'
    Params = <>
    StoreDefs = True
    Left = 336
    Top = 176
    Data = {
      5D0000009619E0BD0100000018000000030000000000030000005D0004497465
      6D04000100000000000B49445F50726F636573736F04000100000000000D4E6F
      6D655F50726F636573736F0100490000000100055749445448020002003C0000
      00}
    object mAuxProcItem: TIntegerField
      FieldName = 'Item'
    end
    object mAuxProcID_Processo: TIntegerField
      FieldName = 'ID_Processo'
    end
    object mAuxProcNome_Processo: TStringField
      FieldName = 'Nome_Processo'
      Size = 60
    end
  end
  object dsmAuxProc: TDataSource
    DataSet = mAuxProc
    Left = 384
    Top = 176
  end
  object dsProc: TDataSource
    DataSet = cdsProc
    Left = 144
    Top = 24
  end
  object dsProc_Ref: TDataSource
    DataSet = cdsProc_Ref
    Left = 144
    Top = 72
  end
  object mConsProc_Nao: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_Mov'
        DataType = ftInteger
      end
      item
        Name = 'ID_Produto'
        DataType = ftInteger
      end
      item
        Name = 'Referencia'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ID_Combinacao'
        DataType = ftInteger
      end
      item
        Name = 'Nome_Combinacao'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Qtd1'
        DataType = ftFloat
      end
      item
        Name = 'Qtd2'
        DataType = ftFloat
      end
      item
        Name = 'Qtd3'
        DataType = ftFloat
      end
      item
        Name = 'Qtd4'
        DataType = ftFloat
      end
      item
        Name = 'Qtd5'
        DataType = ftFloat
      end
      item
        Name = 'Qtd6'
        DataType = ftFloat
      end
      item
        Name = 'Qtd7'
        DataType = ftFloat
      end
      item
        Name = 'Qtd8'
        DataType = ftFloat
      end
      item
        Name = 'Qtd9'
        DataType = ftFloat
      end
      item
        Name = 'Qtd10'
        DataType = ftFloat
      end
      item
        Name = 'Qtd11'
        DataType = ftFloat
      end
      item
        Name = 'Qtd12'
        DataType = ftFloat
      end
      item
        Name = 'Qtd13'
        DataType = ftFloat
      end
      item
        Name = 'Qtd14'
        DataType = ftFloat
      end
      item
        Name = 'Qtd15'
        DataType = ftFloat
      end
      item
        Name = 'Qtd16'
        DataType = ftFloat
      end
      item
        Name = 'Qtd17'
        DataType = ftFloat
      end
      item
        Name = 'Qtd18'
        DataType = ftFloat
      end
      item
        Name = 'Qtd19'
        DataType = ftFloat
      end
      item
        Name = 'Qtd20'
        DataType = ftFloat
      end
      item
        Name = 'QTotal'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 336
    Top = 232
    Data = {
      B30100009619E0BD01000000180000001A000000000003000000B3010649445F
      4D6F7604000100000000000A49445F50726F6475746F04000100000000000A52
      65666572656E63696101004900000001000557494454480200020014000D4944
      5F436F6D62696E6163616F04000100000000000F4E6F6D655F436F6D62696E61
      63616F0100490000000100055749445448020002003C00045174643108000400
      0000000004517464320800040000000000045174643308000400000000000451
      7464340800040000000000045174643508000400000000000451746436080004
      0000000000045174643708000400000000000451746438080004000000000004
      5174643908000400000000000551746431300800040000000000055174643131
      0800040000000000055174643132080004000000000005517464313308000400
      0000000005517464313408000400000000000551746431350800040000000000
      0551746431360800040000000000055174643137080004000000000005517464
      3138080004000000000005517464313908000400000000000551746432300800
      0400000000000651546F74616C08000400000000000000}
    object mConsProc_NaoID_Mov: TIntegerField
      FieldName = 'ID_Mov'
    end
    object mConsProc_NaoID_Produto: TIntegerField
      FieldName = 'ID_Produto'
    end
    object mConsProc_NaoReferencia: TStringField
      FieldName = 'Referencia'
    end
    object mConsProc_NaoID_Combinacao: TIntegerField
      FieldName = 'ID_Combinacao'
    end
    object mConsProc_NaoNome_Combinacao: TStringField
      FieldName = 'Nome_Combinacao'
      Size = 60
    end
    object mConsProc_NaoQtd1: TFloatField
      FieldName = 'Qtd1'
    end
    object mConsProc_NaoQtd2: TFloatField
      FieldName = 'Qtd2'
    end
    object mConsProc_NaoQtd3: TFloatField
      FieldName = 'Qtd3'
    end
    object mConsProc_NaoQtd4: TFloatField
      FieldName = 'Qtd4'
    end
    object mConsProc_NaoQtd5: TFloatField
      FieldName = 'Qtd5'
    end
    object mConsProc_NaoQtd6: TFloatField
      FieldName = 'Qtd6'
    end
    object mConsProc_NaoQtd7: TFloatField
      FieldName = 'Qtd7'
    end
    object mConsProc_NaoQtd8: TFloatField
      FieldName = 'Qtd8'
    end
    object mConsProc_NaoQtd9: TFloatField
      FieldName = 'Qtd9'
    end
    object mConsProc_NaoQtd10: TFloatField
      FieldName = 'Qtd10'
    end
    object mConsProc_NaoQtd11: TFloatField
      FieldName = 'Qtd11'
    end
    object mConsProc_NaoQtd12: TFloatField
      FieldName = 'Qtd12'
    end
    object mConsProc_NaoQtd13: TFloatField
      FieldName = 'Qtd13'
    end
    object mConsProc_NaoQtd14: TFloatField
      FieldName = 'Qtd14'
    end
    object mConsProc_NaoQtd15: TFloatField
      FieldName = 'Qtd15'
    end
    object mConsProc_NaoQtd16: TFloatField
      FieldName = 'Qtd16'
    end
    object mConsProc_NaoQtd17: TFloatField
      FieldName = 'Qtd17'
    end
    object mConsProc_NaoQtd18: TFloatField
      FieldName = 'Qtd18'
    end
    object mConsProc_NaoQtd19: TFloatField
      FieldName = 'Qtd19'
    end
    object mConsProc_NaoQtd20: TFloatField
      FieldName = 'Qtd20'
    end
    object mConsProc_NaoQTotal: TFloatField
      FieldName = 'QTotal'
    end
  end
  object dsmConsProc_Nao: TDataSource
    DataSet = mConsProc_Nao
    Left = 384
    Top = 232
  end
end
