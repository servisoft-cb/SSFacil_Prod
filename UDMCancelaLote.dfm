object DMCancelaLote: TDMCancelaLote
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 329
  Top = 208
  Height = 360
  Width = 706
  object sdsConsultaLote: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT ITE.REFERENCIA, COMB.NOME NOME_COMBINACAO, AUX.*'#13#10'FROM (S' +
      'ELECT bp.num_ordem, 0 num_lote, PR.NOME NOME_PROCESSO, BP.item I' +
      'TEM_PROCESSO, BP.id_processo, BP.id_lote,'#13#10'BP.id_pedido, BP.item' +
      '_pedido, BP.dtentrada, BP.dtbaixa, BP.qtd, BP.qtd_produzido,'#13#10'(S' +
      'ELECT PS.qtd_consumo1 FROM PRODUTO_SEMI PS'#13#10'  WHERE PS.ID = (SEL' +
      'ECT ID_PRODUTO FROM PEDIDO_ITEM PIT WHERE PIT.ID = BP.ID_PEDIDO'#13 +
      #10'                    AND PIT.ITEM = BP.ITEM_PEDIDO)) QTD_CONSUMO' +
      ','#13#10'(SELECT PP.PEDIDO_CLIENTE FROM PEDIDO PP WHERE PP.ID = BP.ID_' +
      'PEDIDO) PEDIDO_CLIENTE, BP.ID ID_BAIXA, BP.ITEM ITEM_BAIXA'#13#10#13#10'FR' +
      'OM BAIXA_PROCESSO BP'#13#10'INNER JOIN PROCESSO PR'#13#10'ON BP.ID_PROCESSO ' +
      '= PR.ID'#13#10#13#10'UNION ALL'#13#10#13#10'SELECT L.num_ordem, L.num_lote, PR.NOME ' +
      'NOME_PROCESSO, BP.item ITEM_PROCESSO, BP.id_processo, BP.id_lote' +
      ','#13#10'LP.id_pedido, LP.item_pedido, BP.dtentrada, BP.dtbaixa, BP.qt' +
      'd, BP.qtd_produzido,'#13#10'(SELECT PS.qtd_consumo1 FROM PRODUTO_SEMI ' +
      'PS'#13#10'  WHERE PS.ID = (SELECT ID_PRODUTO FROM PEDIDO_ITEM PIT WHER' +
      'E PIT.ID = LP.ID_PEDIDO'#13#10'                    AND PIT.ITEM = LP.I' +
      'TEM_PEDIDO)) QTD_CONSUMO, L.OBS_PED PEDIDO_CLIENTE, BP.ID ID_BAI' +
      'XA, BP.ITEM ITEM_BAIXA'#13#10'FROM BAIXA_PROCESSO BP'#13#10'INNER JOIN PROCE' +
      'SSO PR'#13#10'ON BP.ID_PROCESSO = PR.ID'#13#10'INNER JOIN LOTE_PED LP'#13#10'ON BP' +
      '.ID_LOTE = LP.ID'#13#10'INNER JOIN LOTE L'#13#10'ON LP.ID = L.ID) AUX'#13#10'INNER' +
      ' JOIN PEDIDO_ITEM ITE'#13#10'   ON AUX.ID_PEDIDO = ITE.ID'#13#10'  AND AUX.I' +
      'TEM_PEDIDO = ITE.ITEM'#13#10'LEFT JOIN COMBINACAO COMB'#13#10'ON ITE.ID_COR ' +
      '= COMB.ID'#13#10#13#10'WHERE ID_PEDIDO = (SELECT PP.ID FROM PEDIDO PP WHER' +
      'E PP.NUM_PEDIDO = :NUM_PEDIDO AND TIPO_REG = '#39'P'#39' )'#13#10#13#10#13#10#13#10#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_PEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 304
    Top = 24
  end
  object dspConsultaLote: TDataSetProvider
    DataSet = sdsConsultaLote
    Left = 344
    Top = 24
  end
  object cdsConsultaLote: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsultaLote'
    Left = 392
    Top = 24
    object cdsConsultaLoteREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsConsultaLoteNOME_COMBINACAO: TStringField
      FieldName = 'NOME_COMBINACAO'
      Size = 60
    end
    object cdsConsultaLoteNUM_ORDEM: TIntegerField
      FieldName = 'NUM_ORDEM'
    end
    object cdsConsultaLoteNUM_LOTE: TIntegerField
      FieldName = 'NUM_LOTE'
    end
    object cdsConsultaLoteNOME_PROCESSO: TStringField
      FieldName = 'NOME_PROCESSO'
      Size = 30
    end
    object cdsConsultaLoteITEM_PROCESSO: TIntegerField
      FieldName = 'ITEM_PROCESSO'
      Required = True
    end
    object cdsConsultaLoteID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
    end
    object cdsConsultaLoteID_LOTE: TIntegerField
      FieldName = 'ID_LOTE'
    end
    object cdsConsultaLoteID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
    end
    object cdsConsultaLoteITEM_PEDIDO: TIntegerField
      FieldName = 'ITEM_PEDIDO'
    end
    object cdsConsultaLoteDTENTRADA: TDateField
      FieldName = 'DTENTRADA'
    end
    object cdsConsultaLoteDTBAIXA: TDateField
      FieldName = 'DTBAIXA'
    end
    object cdsConsultaLoteQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsConsultaLoteQTD_PRODUZIDO: TFloatField
      FieldName = 'QTD_PRODUZIDO'
    end
    object cdsConsultaLoteQTD_CONSUMO: TFloatField
      FieldName = 'QTD_CONSUMO'
    end
    object cdsConsultaLotePEDIDO_CLIENTE: TStringField
      FieldName = 'PEDIDO_CLIENTE'
      Size = 100
    end
    object cdsConsultaLoteID_BAIXA: TIntegerField
      FieldName = 'ID_BAIXA'
      Required = True
    end
    object cdsConsultaLoteITEM_BAIXA: TIntegerField
      FieldName = 'ITEM_BAIXA'
      Required = True
    end
  end
  object dsConsultaLote: TDataSource
    DataSet = cdsConsultaLote
    Left = 440
    Top = 24
  end
  object qPed: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'item'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select p2.qtd'
      'from pedido_item p2'
      'where p2.id = :id'
      '  and p2.item = :item')
    SQLConnection = dmDatabase.scoDados
    Left = 400
    Top = 120
    object qPedQTD: TFloatField
      FieldName = 'QTD'
    end
  end
  object qPedAnt: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_PEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ITEM_PEDIDO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'select b2.qtd'
      'from baixa_processo b2'
      'where b2.ID_PEDIDO = :ID_PEDIDO'
      '  and b2.ITEM_PEDIDO = :ITEM_PEDIDO')
    SQLConnection = dmDatabase.scoDados
    Left = 464
    Top = 128
    object qPedAntQTD: TFloatField
      FieldName = 'QTD'
    end
  end
  object mItens: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 344
    Top = 184
    Data = {
      BE0000009619E0BD010000001800000008000000000003000000BE000949445F
      50656469646F04000100000000000B4974656D5F50656469646F040001000000
      00000A49445F50726F6475746F04000100000000000649645F436F7204000100
      000000000351746408000400000000000C4E6F6D655F50726F6475746F010049
      00000001000557494454480200020078000A5265666572656E63696101004900
      00000100055749445448020002001400075174645F416E740800040000000000
      0000}
    object mItensID_Pedido: TIntegerField
      FieldName = 'ID_Pedido'
    end
    object mItensItem_Pedido: TIntegerField
      FieldName = 'Item_Pedido'
    end
    object mItensID_Produto: TIntegerField
      FieldName = 'ID_Produto'
    end
    object mItensId_Cor: TIntegerField
      FieldName = 'Id_Cor'
    end
    object mItensQtd: TFloatField
      FieldName = 'Qtd'
    end
    object mItensNome_Produto: TStringField
      FieldName = 'Nome_Produto'
      Size = 120
    end
    object mItensReferencia: TStringField
      FieldName = 'Referencia'
    end
    object mItensQtd_Ant: TFloatField
      FieldName = 'Qtd_Ant'
    end
  end
  object dsmItens: TDataSource
    DataSet = mItens
    Left = 376
    Top = 184
  end
  object sdsPedido_Item: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT I.ID, I.ITEM, I.ID_PRODUTO, I.ID_COR, I.QTD, I.nomeprodut' +
      'o  || '#39' '#39' || C.nome Nome_Produto, I.referencia, C.NOME NOME_COR'#13 +
      #10'FROM PEDIDO_ITEM I'#13#10'INNER JOIN PEDIDO P'#13#10'ON I.ID = P.ID'#13#10'LEFT J' +
      'OIN COMBINACAO C'#13#10'ON I.ID_COR = C.ID'#13#10'WHERE P.NUM_PEDIDO = :NUM_' +
      'PEDIDO'#13#10'  AND P.TIPO_REG = '#39'P'#39#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'NUM_PEDIDO'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 136
    Top = 120
  end
  object dspPedido_Item: TDataSetProvider
    DataSet = sdsPedido_Item
    Left = 176
    Top = 120
  end
  object cdsPedido_Item: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPedido_Item'
    Left = 224
    Top = 120
    object cdsPedido_ItemID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPedido_ItemITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsPedido_ItemID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
    end
    object cdsPedido_ItemID_COR: TFMTBCDField
      FieldName = 'ID_COR'
      Precision = 15
      Size = 0
    end
    object cdsPedido_ItemQTD: TFloatField
      FieldName = 'QTD'
    end
    object cdsPedido_ItemNOME_PRODUTO: TStringField
      FieldName = 'NOME_PRODUTO'
      Size = 161
    end
    object cdsPedido_ItemREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsPedido_ItemNOME_COR: TStringField
      FieldName = 'NOME_COR'
      Size = 60
    end
  end
end
