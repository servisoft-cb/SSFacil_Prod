unit UDMCadLote_Calc;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, Variants, LogTypes, frxClass, frxDBSet, frxRich, frxExportMail,
  frxExportPDF, frxBarcode;

type
  TDMCadLote_Calc = class(TDataModule)
    sdsLote: TSQLDataSet;
    dspLote: TDataSetProvider;
    cdsLote: TClientDataSet;
    dsLote: TDataSource;
    sdsLoteID: TIntegerField;
    sdsLoteNUM_LOTE: TIntegerField;
    sdsLoteQTD_TALOES: TIntegerField;
    sdsLoteDTEMISSAO: TDateField;
    sdsLoteHREMISSAO: TTimeField;
    cdsLoteID: TIntegerField;
    cdsLoteNUM_LOTE: TIntegerField;
    cdsLoteQTD_TALOES: TIntegerField;
    cdsLoteDTEMISSAO: TDateField;
    cdsLoteHREMISSAO: TTimeField;
    dsLote_Mestre: TDataSource;
    cdsLotesdsTalao: TDataSetField;
    qProximo_Lote: TSQLQuery;
    qProximo_LoteNUM_LOTE: TIntegerField;
    sdsPendente: TSQLDataSet;
    dspPendente: TDataSetProvider;
    cdsPendente: TClientDataSet;
    dsPendente: TDataSource;
    cdsPendenteNUM_PEDIDO: TIntegerField;
    cdsPendentePEDIDO_CLIENTE: TStringField;
    cdsPendenteID_CLIENTE: TIntegerField;
    cdsPendenteDTEMISSAO: TDateField;
    cdsPendenteID: TIntegerField;
    cdsPendenteFILIAL: TIntegerField;
    cdsPendenteITEM: TIntegerField;
    cdsPendenteID_PRODUTO: TIntegerField;
    cdsPendenteTAMANHO: TStringField;
    cdsPendenteDTENTREGA: TDateField;
    cdsPendenteNUMOS: TStringField;
    cdsPendenteNOMEPRODUTO: TStringField;
    cdsPendenteREFERENCIA: TStringField;
    cdsPendenteNOME_CLIENTE: TStringField;
    cdsPendenteFANTASIA: TStringField;
    sdsConsulta_Lote: TSQLDataSet;
    dspConsulta_Lote: TDataSetProvider;
    cdsConsulta_Lote: TClientDataSet;
    dsConsulta_Lote: TDataSource;
    cdsConsulta_LoteDTEMISSAO: TDateField;
    cdsConsulta_LoteNUM_LOTE: TIntegerField;
    cdsConsulta_LoteFILIAL: TIntegerField;
    cdsConsulta_LoteHREMISSAO: TTimeField;
    cdsConsulta_LoteID: TIntegerField;
    cdsConsulta_LoteNUM_TALAO: TIntegerField;
    cdsConsulta_LoteID_PRODUTO: TIntegerField;
    cdsConsulta_LoteTAMANHO: TStringField;
    cdsConsulta_LoteQTD: TFloatField;
    cdsConsulta_LoteQTD_PRODUZIDO: TFloatField;
    cdsConsulta_LoteQTD_PENDENTE: TFloatField;
    cdsConsulta_LoteDTBAIXA: TDateField;
    cdsConsulta_LoteHRBAIXA: TTimeField;
    sdsProduto: TSQLDataSet;
    dspProduto: TDataSetProvider;
    cdsProduto: TClientDataSet;
    dsProduto: TDataSource;
    cdsProdutoID: TIntegerField;
    cdsProdutoREFERENCIA: TStringField;
    cdsProdutoNOME: TStringField;
    cdsConsulta_LoteNOME_PRODUTO: TStringField;
    sdsLoteFILIAL: TIntegerField;
    sdsLoteOBS: TMemoField;
    sdsLoteID_PRODUTO: TIntegerField;
    cdsLoteFILIAL: TIntegerField;
    cdsLoteOBS: TMemoField;
    cdsLoteID_PRODUTO: TIntegerField;
    mLote: TClientDataSet;
    mLoteID_Produto: TIntegerField;
    mLoteDtEntrega: TDateField;
    mLoteQtd_Taloes: TIntegerField;
    mLoteQtd: TFloatField;
    mLoteFilial: TIntegerField;
    mTalao: TClientDataSet;
    mTalaoTamanho: TStringField;
    mTalaoQtd: TFloatField;
    sdsLoteQTD: TFloatField;
    cdsLoteQTD: TFloatField;
    sdsLoteDTENTREGA: TDateField;
    cdsLoteDTENTREGA: TDateField;
    cdsConsulta_LoteIMPRESSO: TStringField;
    cdsConsulta_LoteDTENTREGA: TDateField;
    mLoteReferencia: TStringField;
    mLoteNome_Produto: TStringField;
    mLoteDtEmissao: TDateField;
    mLoteNum_Lote: TIntegerField;
    mLoteNum_Talao: TIntegerField;
    mTalaoNum_Lote: TIntegerField;
    mTalaoNum_Talao: TIntegerField;
    cdsConsulta_LoteQTD_TALOES: TIntegerField;
    dsmLote: TDataSource;
    dsmTalao: TDataSource;
    cdsConsulta_LoteNOME_FILIAL: TStringField;
    mLoteNome_Filial: TStringField;
    mLoteUnidade: TStringField;
    cdsConsulta_LoteUNIDADE: TStringField;
    mLoteID_Lote: TIntegerField;
    mLoteTamanho: TStringField;
    qProxima_Ordem: TSQLQuery;
    qProxima_OrdemNUM_ORDEM: TIntegerField;
    sdsLoteNUM_ORDEM: TIntegerField;
    cdsLoteNUM_ORDEM: TIntegerField;
    cdsConsulta_LoteNUM_ORDEM: TIntegerField;
    qVerificaExclusao: TSQLQuery;
    qVerificaExclusaoCOUNT: TIntegerField;
    sdsLoteCARIMBO: TStringField;
    cdsLoteCARIMBO: TStringField;
    cdsPendenteCARIMBO: TStringField;
    sdsProduto_Consumo: TSQLDataSet;
    dspProduto_Consumo: TDataSetProvider;
    cdsProduto_Consumo: TClientDataSet;
    dsProduto_Consumo: TDataSource;
    cdsProduto_ConsumoID: TIntegerField;
    cdsProduto_ConsumoITEM: TIntegerField;
    cdsProduto_ConsumoID_MATERIAL: TIntegerField;
    cdsProduto_ConsumoQTD_CONSUMO: TFloatField;
    cdsProduto_ConsumoQTD_UNIDADE: TFloatField;
    cdsProduto_ConsumoUNIDADE: TStringField;
    cdsProduto_ConsumoID_POSICAO: TIntegerField;
    cdsProduto_ConsumoTIPO_CONSUMO: TStringField;
    cdsProduto_ConsumoNOME_MATERIAL: TStringField;
    qParametros: TSQLQuery;
    qParametrosMOSTRAR_MAT_LOTE: TStringField;
    cdsProduto_ConsumoID_GRADE: TIntegerField;
    mLoteCarimbo: TStringField;
    cdsConsulta_LoteCARIMBO: TStringField;
    qParametrosUSA_CARIMBO: TStringField;
    mLoteID_Grade: TIntegerField;
    cdsConsulta_LoteID_GRADE: TIntegerField;
    mTamanho: TClientDataSet;
    mTamanhoTamanho: TStringField;
    mTamanhoQtd: TFloatField;
    dsmTamanho: TDataSource;
    cdsProduto_ConsumoREF_MATERIAL: TStringField;
    mLoteNum_Ordem: TIntegerField;
    cdsProdutoPERC_QUEBRAMAT: TFloatField;
    cdsProdutoCAVIDADE_MOLDE: TFloatField;
    cdsProdutoCAVIDADE_PECA: TFloatField;
    cdsProdutoCICLO: TFloatField;
    cdsProdutoQTD_TALAO: TIntegerField;
    cdsProdutoTEMPO_TROCA_MATRIZ: TFloatField;
    cdsProdutoTEMPO_TROCA_COR: TFloatField;
    cdsConsulta_LoteACABAMENTO: TStringField;
    cdsConsulta_LoteCOR_ACABAMENTO: TStringField;
    mLoteAcabamento: TStringField;
    mLoteCor_Acabamento: TStringField;
    qProduto_Consumo: TSQLQuery;
    qProduto_ConsumoID: TIntegerField;
    qProduto_ConsumoID_MATERIAL: TIntegerField;
    qProduto_ConsumoNOME_MATERIAL: TStringField;
    cdsConsulta_LoteID_TIPO_MATRIZ: TIntegerField;
    mLoteNome_TipoMatriz: TStringField;
    cdsConsulta_LoteNOME_TIPOMATRIZ: TStringField;
    mLoteSelecionado: TStringField;
    cdsProduto_ConsumoIMP_ROTULO: TStringField;
    cdsProduto_ConsumoIMP_TALAO: TStringField;
    cdsProduto_ConsumoIMP_TALAO_POS: TStringField;
    qParametrosALTURA_ETIQ_ROT: TIntegerField;
    qProduto_Consumo_Tam: TSQLQuery;
    qProduto_Consumo_TamID: TIntegerField;
    qProduto_Consumo_TamITEM: TIntegerField;
    qProduto_Consumo_TamTAMANHO: TStringField;
    qProduto_Consumo_TamQTD_CONSUMO: TFloatField;
    cdsProduto_ConsumoNOME_POSICAO: TStringField;
    cdsProduto_ConsumoIMP_MATERIAL: TStringField;
    cdsProduto_ConsumoIMP_AGRUPADO_MATERIAL: TStringField;
    cdsProduto_ConsumoNOME_COR: TStringField;
    qParametrosIMP_NOME_POSICAO: TStringField;
    cdsProduto_ConsumoID_COR: TIntegerField;
    cdsPendenteID_COR: TFMTBCDField;
    sdsLoteID_COMBINACAO: TIntegerField;
    cdsLoteID_COMBINACAO: TIntegerField;
    mLoteNome_Combinacao: TStringField;
    mLoteID_Combinacao: TIntegerField;
    qParametrosINFORMAR_COR_PROD: TStringField;
    qParametrosMOSTRAR_LINHA_PROD: TStringField;
    qParametrosMOSTRAR_EMBALAGEM: TStringField;
    qParametrosUSA_SETOR_CONSUMO: TStringField;
    qParametrosMOSTRAR_ATELIER_PROD: TStringField;
    cdsConsulta_LoteID_COMBINACAO: TIntegerField;
    cdsPendenteNOME_COMBINACAO: TStringField;
    qParametrosGERAR_TALAO_AUXILIAR: TStringField;
    qParametrosUSA_POSICAO_CONSUMO: TStringField;
    qMaterial: TSQLQuery;
    qMaterialID: TIntegerField;
    qMaterialID_GRADE: TIntegerField;
    qMaterialNOME: TStringField;
    qMaterialID_FORNECEDOR: TIntegerField;
    qMaterialNOME_FORNECEDOR: TStringField;
    qMaterialPRECO_CUSTO: TFloatField;
    qMaterialPERC_IPI: TFloatField;
    qMaterialREFERENCIA: TStringField;
    qMaterialID_NCM: TIntegerField;
    sdsLoteNOME: TStringField;
    cdsLoteNOME: TStringField;
    sdsLoteNUM_PEDIDO: TIntegerField;
    cdsLoteNUM_PEDIDO: TIntegerField;
    cdsConsulta_LoteNOME_COMBINACAO: TStringField;
    sdsLote_Mat: TSQLDataSet;
    dspLote_Mat: TDataSetProvider;
    cdsLote_Mat: TClientDataSet;
    dsLote_Mat: TDataSource;
    sdsLote_MatNUM_ORDEM: TIntegerField;
    sdsLote_MatITEM: TIntegerField;
    sdsLote_MatID_MATERIAL: TIntegerField;
    sdsLote_MatID_COR: TIntegerField;
    sdsLote_MatCARIMBO: TStringField;
    sdsLote_MatTAMANHO: TStringField;
    sdsLote_MatQTD_CONSUMO: TFloatField;
    sdsLote_MatQTD_PRODUTO: TFloatField;
    cdsLote_MatNUM_ORDEM: TIntegerField;
    cdsLote_MatITEM: TIntegerField;
    cdsLote_MatID_MATERIAL: TIntegerField;
    cdsLote_MatID_COR: TIntegerField;
    cdsLote_MatCARIMBO: TStringField;
    cdsLote_MatTAMANHO: TStringField;
    cdsLote_MatQTD_CONSUMO: TFloatField;
    cdsLote_MatQTD_PRODUTO: TFloatField;
    sdsLote_MatCARIMBOAUX: TStringField;
    cdsLote_MatCARIMBOAUX: TStringField;
    sdsConsumo: TSQLDataSet;
    dspConsumo: TDataSetProvider;
    cdsConsumo: TClientDataSet;
    sdsLote_MatID_OC: TIntegerField;
    sdsLote_MatITEM_OC: TIntegerField;
    sdsLote_MatNUM_OC: TIntegerField;
    sdsLote_MatID_FORNECEDOR: TIntegerField;
    cdsLote_MatID_OC: TIntegerField;
    cdsLote_MatITEM_OC: TIntegerField;
    cdsLote_MatNUM_OC: TIntegerField;
    cdsLote_MatID_FORNECEDOR: TIntegerField;
    qVerificaExclusao2: TSQLQuery;
    qVerificaExclusao2CONTADOR: TIntegerField;
    cdsPendenteQTD_RESTANTE: TFloatField;
    sdsLoteTALAO_AUX_GERADO: TStringField;
    cdsLoteTALAO_AUX_GERADO: TStringField;
    mLoteTalao_Aux_Gerado: TStringField;
    cdsConsulta_LoteTALAO_AUX_GERADO: TStringField;
    cdsPendenteITEM_ORIGINAL: TIntegerField;
    mLoteNome_Lote: TStringField;
    cdsConsulta_LoteNOME_LOTE: TStringField;
    qParametrosUSA_ROTULO2: TStringField;
    sdsLote_MatQTD_OC_FAT: TFloatField;
    cdsLote_MatQTD_OC_FAT: TFloatField;
    sdsLote_MatGERADO: TStringField;
    cdsLote_MatGERADO: TStringField;
    cdsPendenteSELECIONADO: TStringField;
    qParametrosOPCAO_DTENTREGAPEDIDO: TStringField;
    qParametrosUSA_GRADE: TStringField;
    mLoteID_Processo: TIntegerField;
    mLoteNome_Processo: TStringField;
    qParametros_Lote: TSQLQuery;
    qParametros_LoteLOTE_POR_PEDIDO: TStringField;
    sdsLoteID_PEDIDO: TIntegerField;
    cdsLoteID_PEDIDO: TIntegerField;
    sdsPendente_Ped: TSQLDataSet;
    dspPendente_Ped: TDataSetProvider;
    cdsPendente_Ped: TClientDataSet;
    dsPendente_Ped: TDataSource;
    sdsPendente_PedNUM_PEDIDO: TIntegerField;
    sdsPendente_PedPEDIDO_CLIENTE: TStringField;
    sdsPendente_PedID_CLIENTE: TIntegerField;
    sdsPendente_PedDTEMISSAO: TDateField;
    sdsPendente_PedID: TIntegerField;
    sdsPendente_PedFILIAL: TIntegerField;
    sdsPendente_PedNOME_CLIENTE: TStringField;
    sdsPendente_PedFANTASIA: TStringField;
    cdsPendente_PedNUM_PEDIDO: TIntegerField;
    cdsPendente_PedPEDIDO_CLIENTE: TStringField;
    cdsPendente_PedID_CLIENTE: TIntegerField;
    cdsPendente_PedDTEMISSAO: TDateField;
    cdsPendente_PedID: TIntegerField;
    cdsPendente_PedFILIAL: TIntegerField;
    cdsPendente_PedNOME_CLIENTE: TStringField;
    cdsPendente_PedFANTASIA: TStringField;
    sdsPendente_PedSELECIONADO: TStringField;
    cdsPendente_PedSELECIONADO: TStringField;
    qMaterialTIPO_REG: TStringField;
    mLoteTipo_Lote: TStringField;
    mLoteDescricao_Tipo: TStringField;
    cdsConsulta_LoteITEM_PEDIDO: TIntegerField;
    cdsConsulta_LoteID_PEDIDO: TIntegerField;
    cdsConsulta_LoteNUM_PEDIDO: TIntegerField;
    cdsConsulta_LotePEDIDO_CLIENTE: TStringField;
    cdsConsulta_LoteNOME_CLIENTE: TStringField;
    mLotePedido_Cliente: TStringField;
    mLoteNum_Pedido: TIntegerField;
    mLoteNome_Cliente: TStringField;
    sdsLoteTIPO_LOTE: TStringField;
    cdsLoteTIPO_LOTE: TStringField;
    cdsConsulta_LoteTIPO_LOTE: TStringField;
    mMaterial: TClientDataSet;
    mMaterialID_Material: TIntegerField;
    mMaterialNome_Material: TStringField;
    mMaterialQtd_Consumo: TFloatField;
    mMaterialReferencia_Mat: TStringField;
    dsmMaterial: TDataSource;
    mMaterial_Tam: TClientDataSet;
    mMaterial_TamID_Material: TIntegerField;
    mMaterial_TamTamanho: TStringField;
    mMaterial_TamQtd: TFloatField;
    dsmMaterial_Tam: TDataSource;
    mMaterialUnidade: TStringField;
    mMaterialID_Fornecedor: TIntegerField;
    mMaterialID_Cor: TIntegerField;
    sdsLoteREFERENCIA: TStringField;
    cdsLoteREFERENCIA: TStringField;
    cdsPendenteID_COR_PROD: TIntegerField;
    cdsPendenteNOME_COR_PROD: TStringField;
    cdsPendenteTIPO_MAT: TStringField;
    sdsLoteUNIDADE: TStringField;
    cdsLoteUNIDADE: TStringField;
    cdsConsulta_LoteUNIDADE_TALAO: TStringField;
    qParametros_LoteLOTE_TEXTIL: TStringField;
    cdsConsulta_LoteREFERENCIA: TStringField;
    cdsConsulta_LoteNOME_PROCESSO: TStringField;
    cdsConsulta_LoteID_PROCESSO: TIntegerField;
    sdsLoteDTENTRADA: TDateField;
    sdsLoteHRENTRADA: TTimeField;
    sdsLoteDTBAIXA: TDateField;
    sdsLoteHRBAIXA: TTimeField;
    sdsLoteQTD_PENDENTE: TFloatField;
    sdsLoteQTD_PRODUZIDO: TFloatField;
    cdsLoteDTENTRADA: TDateField;
    cdsLoteHRENTRADA: TTimeField;
    cdsLoteDTBAIXA: TDateField;
    cdsLoteHRBAIXA: TTimeField;
    cdsLoteQTD_PENDENTE: TFloatField;
    cdsLoteQTD_PRODUZIDO: TFloatField;
    sdsLoteITEM_ORDEM: TIntegerField;
    sdsLoteITEM_ORDEM_TOTAL: TIntegerField;
    cdsLoteITEM_ORDEM: TIntegerField;
    cdsLoteITEM_ORDEM_TOTAL: TIntegerField;
    sdsLoteOBS_PED: TStringField;
    cdsLoteOBS_PED: TStringField;
    sdsLoteID_CLIENTE: TIntegerField;
    cdsLoteID_CLIENTE: TIntegerField;
    sdsLoteIMPRESSO: TStringField;
    cdsLoteIMPRESSO: TStringField;
    sdsLoteQTD_ORIGINAL: TFloatField;
    sdsLoteQTD_PARES: TFloatField;
    cdsLoteQTD_ORIGINAL: TFloatField;
    cdsLoteQTD_PARES: TFloatField;
    cdsPendenteID_PROCESSO_GRUPO: TIntegerField;
    sdsLoteID_PROCESSO_GRUPO: TIntegerField;
    cdsLoteID_PROCESSO_GRUPO: TIntegerField;
    cdsProdutoID_PROCESSO_GRUPO: TIntegerField;
    cdsPendenteUNIDADE: TStringField;
    cdsPendenteTIPO_REG_PROD: TStringField;
    cdsConsumoID: TIntegerField;
    cdsConsumoID_MATERIAL: TIntegerField;
    cdsConsumoQTD_CONSUMO: TFloatField;
    cdsConsumoUNIDADE: TStringField;
    cdsConsumoNOME_PRODUTO: TStringField;
    cdsConsumoREFERENCIA: TStringField;
    cdsConsumoNOME_MATERIAL: TStringField;
    cdsConsumoREFERENCIA_MAT: TStringField;
    cdsConsumoTIPO_REG_MAT: TStringField;
    cdsConsumoID_FORNECEDOR: TIntegerField;
    qProdQtd: TSQLQuery;
    sdsLoteCOMPLETO: TStringField;
    cdsLoteCOMPLETO: TStringField;
    cdsConsumoIMP_TALAO: TStringField;
    sdsLoteID_MATERIAL: TIntegerField;
    cdsLoteID_MATERIAL: TIntegerField;
    sdsLoteCONSUMO_MAT: TFloatField;
    cdsLoteCONSUMO_MAT: TFloatField;
    qProdQtdQTD_TALAO: TIntegerField;
    sdsLoteID_MATERIAL2: TIntegerField;
    cdsLoteID_MATERIAL2: TIntegerField;
    sdsLoteCONSUMO_MAT2: TFloatField;
    cdsLoteCONSUMO_MAT2: TFloatField;
    cdsPendenteID_MATERIAL: TIntegerField;
    cdsPendenteQTD_CONSUMO_MAT: TFloatField;
    cdsPendenteUNIDADE_MAT: TStringField;
    cdsPendenteCONSUMO_CALC: TFloatField;
    mMaterialQtd_Produto: TFloatField;
    sdsLoteID_PRODUTO_PRI: TIntegerField;
    cdsLoteID_PRODUTO_PRI: TIntegerField;
    cdsConsumoTINGIMENTO: TStringField;
    cdsConsumoID_COR: TIntegerField;
    sdsLote_MatTINGIMENTO: TStringField;
    sdsLote_MatTINGIMENTO_GERADO: TStringField;
    cdsLote_MatTINGIMENTO: TStringField;
    cdsLote_MatTINGIMENTO_GERADO: TStringField;
    mMaterialTingimento: TStringField;
    sdsLoteID_COR_MAT: TIntegerField;
    sdsLoteID_COR_MAT2: TIntegerField;
    cdsLoteID_COR_MAT: TIntegerField;
    cdsLoteID_COR_MAT2: TIntegerField;
    qParametros_Ped: TSQLQuery;
    qParametros_PedUSA_NUM_TALAO: TStringField;
    qParametros_LoteID_COR_CRU: TIntegerField;
    cdsConsumoID_MATERIAL_CRU: TIntegerField;
    mMaterialID_Material_Cru: TIntegerField;
    qParametros_Geral: TSQLQuery;
    qParametros_GeralEMPRESA_CALCADOS: TStringField;
    sdsSetor: TSQLDataSet;
    dspSetor: TDataSetProvider;
    cdsSetor: TClientDataSet;
    cdsSetorID: TIntegerField;
    cdsSetorNOME: TStringField;
    dsSetor: TDataSource;
    sdsPedOriginal: TSQLDataSet;
    dspPedOriginal: TDataSetProvider;
    cdsPedOriginal: TClientDataSet;
    cdsPedOriginalID: TIntegerField;
    cdsPedOriginalITEM_ORIGINAL: TIntegerField;
    sdsLote_Ped_Calc: TSQLDataSet;
    cdsLote_Ped_Calc: TClientDataSet;
    dLote_Ped_Calc: TDataSource;
    sdsLote_Ped_CalcID: TIntegerField;
    sdsLote_Ped_CalcID_PEDIDO: TIntegerField;
    cdsLotesdsLote_Ped_Calc: TDataSetField;
    cdsLote_Ped_CalcID: TIntegerField;
    cdsLote_Ped_CalcID_PEDIDO: TIntegerField;
    cdsPedOriginalQTD_RESTANTE: TFloatField;
    sdsConsumoCalc: TSQLDataSet;
    dspConsumoCalc: TDataSetProvider;
    cdsConsumoCalc: TClientDataSet;
    cdsConsumoCalcID: TIntegerField;
    cdsConsumoCalcREFERENCIA: TStringField;
    cdsConsumoCalcNOME_PRODUTO: TStringField;
    cdsConsumoCalcID_COR_COMBINACAO: TIntegerField;
    cdsConsumoCalcTIPO_REG_MAT: TStringField;
    cdsConsumoCalcNOME_COMBINACAO: TStringField;
    cdsConsumoCalcID_MATERIAL: TIntegerField;
    cdsConsumoCalcQTD_CONSUMO: TFloatField;
    cdsConsumoCalcTIPO_CONSUMO: TStringField;
    cdsConsumoCalcITEM_CONSUMO: TIntegerField;
    cdsConsumoCalcNOME_MATERIAL: TStringField;
    cdsConsumoCalcTRANSFER: TStringField;
    cdsConsumoCalcID_GRADE_MAT: TIntegerField;
    cdsConsumoCalcID_FORNECEDOR: TIntegerField;
    cdsConsumoCalcUSA_CARIMBO_OC: TStringField;
    cdsConsumoCalcUNIDADE: TStringField;
    cdsConsumoCalcREFERENCIA_MAT: TStringField;
    cdsConsumoCalcID_COR_MAT: TIntegerField;
    cdsConsumoCalcNOME_COR: TStringField;
    qConsumo_Tam: TSQLQuery;
    qConsumo_TamQTD_CONSUMO: TFloatField;
    cdsPendenteID_FORMA: TIntegerField;
    mLoteID_Forma: TIntegerField;
    mLoteNome_Forma: TStringField;
    cdsConsulta_LoteID_FORMA: TIntegerField;
    cdsConsulta_LoteNOME_FORMA: TStringField;
    mLoteObs: TStringField;
    cdsConsulta_LoteOBS_PED: TStringField;
    cdsPendenteID_PROCESSO_SEMI: TIntegerField;
    mLoteImprimirPor: TStringField;
    cdsPendenteENCERADO: TStringField;
    sdsLoteENCERADO: TStringField;
    cdsLoteENCERADO: TStringField;
    sdsPedido_Calc: TSQLDataSet;
    dspPedido_Calc: TDataSetProvider;
    cdsPedido_Calc: TClientDataSet;
    dsPedido_Calc: TDataSource;
    cdsPedido_CalcNUM_ORDEM: TIntegerField;
    cdsPedido_CalcPEDIDO_CLIENTE: TStringField;
    cdsPedido_CalcDTEMISSAO_PED: TDateField;
    cdsPedido_CalcCANCELADO: TStringField;
    cdsPedido_CalcNUM_PEDIDO: TIntegerField;
    qProduto_Comb: TSQLQuery;
    qProduto_CombID: TIntegerField;
    qProduto_CombITEM: TIntegerField;
    qProduto_CombID_COR_COMBINACAO: TIntegerField;
    qProduto_CombFOTO: TStringField;
    mLoteFoto: TStringField;
    qProduto: TSQLQuery;
    qProdutoFOTO: TStringField;
    qParametros_LoteTIPO_LOTE: TStringField;
    mAcum: TClientDataSet;
    mAcumID_Produto: TIntegerField;
    mAcumID_Combinacao: TIntegerField;
    mAcumID_Pedido: TIntegerField;
    mAcumID_Cliente: TIntegerField;
    mAcumQtd: TIntegerField;
    mAcum_Ped: TClientDataSet;
    mAcum_PedID_Pedido: TIntegerField;
    mAcum_PedItem_Pedido: TIntegerField;
    mAcum_PedQtd: TIntegerField;
    mAcum_PedID: TIntegerField;
    mAcumID: TIntegerField;
    dsmAcum: TDataSource;
    mAcumDtEntrega: TDateField;
    mAcumItem_Original: TIntegerField;
    mAcumTamanho: TStringField;
    mAcumCarimbo: TStringField;
    mAcumReferencia: TStringField;
    sdsTalao: TSQLDataSet;
    sdsTalaoID: TIntegerField;
    sdsTalaoNUM_TALAO: TIntegerField;
    sdsTalaoID_PRODUTO: TIntegerField;
    sdsTalaoTAMANHO: TStringField;
    sdsTalaoQTD: TFloatField;
    sdsTalaoQTD_PRODUZIDO: TFloatField;
    sdsTalaoQTD_PENDENTE: TFloatField;
    sdsTalaoDTBAIXA: TDateField;
    sdsTalaoHRBAIXA: TTimeField;
    sdsTalaoID_COMBINACAO: TIntegerField;
    sdsTalaoID_PROCESSO: TIntegerField;
    sdsTalaoIMPRESSO: TStringField;
    sdsTalaoDTENTRADA: TDateField;
    sdsTalaoHRENTRADA: TTimeField;
    sdsTalaoITEM_PEDIDO: TIntegerField;
    sdsTalaoID_PEDIDO: TIntegerField;
    sdsTalaoREFERENCIA: TStringField;
    sdsTalaoUNIDADE: TStringField;
    cdsTalao: TClientDataSet;
    cdsTalaoID: TIntegerField;
    cdsTalaoNUM_TALAO: TIntegerField;
    cdsTalaoID_PRODUTO: TIntegerField;
    cdsTalaoTAMANHO: TStringField;
    cdsTalaoQTD: TFloatField;
    cdsTalaoQTD_PRODUZIDO: TFloatField;
    cdsTalaoQTD_PENDENTE: TFloatField;
    cdsTalaoDTBAIXA: TDateField;
    cdsTalaoHRBAIXA: TTimeField;
    cdsTalaoID_COMBINACAO: TIntegerField;
    cdsTalaosdsTalao_Ped: TDataSetField;
    cdsTalaoID_PROCESSO: TIntegerField;
    cdsTalaoIMPRESSO: TStringField;
    cdsTalaoDTENTRADA: TDateField;
    cdsTalaoHRENTRADA: TTimeField;
    cdsTalaoITEM_PEDIDO: TIntegerField;
    cdsTalaoID_PEDIDO: TIntegerField;
    cdsTalaoREFERENCIA: TStringField;
    cdsTalaoUNIDADE: TStringField;
    dsTalao: TDataSource;
    dsTalao_Mestre: TDataSource;
    sdsTalao_Ped: TSQLDataSet;
    sdsTalao_PedID: TIntegerField;
    sdsTalao_PedNUM_TALAO: TIntegerField;
    sdsTalao_PedID_PEDIDO: TIntegerField;
    sdsTalao_PedITEM_PEDIDO: TIntegerField;
    sdsTalao_PedQTD: TFloatField;
    sdsTalao_PedID_CLIENTE: TIntegerField;
    sdsTalao_PedNUM_LOTE: TIntegerField;
    sdsTalao_PedBAIXADO: TStringField;
    cdsTalao_Ped: TClientDataSet;
    cdsTalao_PedID: TIntegerField;
    cdsTalao_PedNUM_TALAO: TIntegerField;
    cdsTalao_PedID_PEDIDO: TIntegerField;
    cdsTalao_PedITEM_PEDIDO: TIntegerField;
    cdsTalao_PedQTD: TFloatField;
    cdsTalao_PedID_CLIENTE: TIntegerField;
    cdsTalao_PedBAIXADO: TStringField;
    dsTalao_Ped: TDataSource;
    dsmAcum_Ped: TDataSource;
    mAcum_Tam: TClientDataSet;
    dsmAcum_Tam: TDataSource;
    mAcum_TamID: TIntegerField;
    mAcum_TamTamanho: TStringField;
    mAcum_TamQtd: TIntegerField;
    mAcum_PedTamanho: TStringField;
    cdsProduto_ConsumoID_SETOR: TIntegerField;
    mProduto_Consumo: TClientDataSet;
    mProduto_ConsumoID: TIntegerField;
    mProduto_ConsumoITEM: TIntegerField;
    mProduto_ConsumoID_MATERIAL: TIntegerField;
    mProduto_ConsumoQTD_CONSUMO: TFloatField;
    mProduto_ConsumoQTD_UNIDADE: TFloatField;
    mProduto_ConsumoUNIDADE: TStringField;
    mProduto_ConsumoID_POSICAO: TIntegerField;
    mProduto_ConsumoTIPO_CONSUMO: TStringField;
    mProduto_ConsumoNOME_MATERIAL: TStringField;
    mProduto_ConsumoID_GRADE: TIntegerField;
    mProduto_ConsumoREF_MATERIAL: TStringField;
    mProduto_ConsumoIMP_ROTULO: TStringField;
    mProduto_ConsumoIMP_TALAO: TStringField;
    mProduto_ConsumoIMP_TALAO_POS: TStringField;
    mProduto_ConsumoNOME_POSICAO: TStringField;
    mProduto_ConsumoIMP_MATERIAL: TStringField;
    mProduto_ConsumoIMP_AGRUPADO_MATERIAL: TStringField;
    mProduto_ConsumoNOME_COR: TStringField;
    mProduto_ConsumoID_COR: TIntegerField;
    mProduto_ConsumoID_SETOR: TIntegerField;
    mProduto_ConsumoORDEM_RELATORIO: TStringField;
    mProduto_ConsumoIMP_SUBLINHADO: TStringField;
    mdsProduto_Consumo: TDataSource;
    sdsTalao_Setor: TSQLDataSet;
    cdsTalao_Setor: TClientDataSet;
    sdsTalao_SetorID: TIntegerField;
    sdsTalao_SetorNUM_TALAO: TIntegerField;
    sdsTalao_SetorITEM: TIntegerField;
    sdsTalao_SetorID_SETOR: TIntegerField;
    sdsTalao_SetorDTENTRADA: TDateField;
    sdsTalao_SetorHRENTRADA: TTimeField;
    sdsTalao_SetorDTSAIDA: TDateField;
    sdsTalao_SetorHRSAIDA: TTimeField;
    sdsTalao_SetorID_FUNCIONARIO: TIntegerField;
    sdsTalao_SetorQTD: TFloatField;
    cdsTalaosdsTalao_Setor: TDataSetField;
    cdsTalao_SetorID: TIntegerField;
    cdsTalao_SetorNUM_TALAO: TIntegerField;
    cdsTalao_SetorITEM: TIntegerField;
    cdsTalao_SetorID_SETOR: TIntegerField;
    cdsTalao_SetorDTENTRADA: TDateField;
    cdsTalao_SetorHRENTRADA: TTimeField;
    cdsTalao_SetorDTSAIDA: TDateField;
    cdsTalao_SetorHRSAIDA: TTimeField;
    cdsTalao_SetorID_FUNCIONARIO: TIntegerField;
    cdsTalao_SetorQTD: TFloatField;
    dsTalao_Setor: TDataSource;
    sdsSetor_Talao: TSQLDataSet;
    dspSetor_Talao: TDataSetProvider;
    cdsSetor_Talao: TClientDataSet;
    cdsSetor_TalaoID: TIntegerField;
    cdsSetor_TalaoNOME: TStringField;
    cdsSetor_TalaoGERAR_TALAO: TStringField;
    cdsSetor_TalaoORDEM_ORC: TIntegerField;
    sdsLote_MatID_SETOR: TIntegerField;
    cdsLote_MatID_SETOR: TIntegerField;
    qParametros_LoteGERAR_SETOR_MAT: TStringField;
    cdsConsumoCalcID_SETOR: TIntegerField;
    qParametros_LoteQTD_DIV_LOTE: TIntegerField;
    sdsLoteNUM_REMESSA: TStringField;
    cdsLoteNUM_REMESSA: TStringField;
    qParametros_LoteUSA_MAT_COMB: TStringField;
    qParametros_LoteUSA_REMESSA: TStringField;
    mLoteNum_Remessa: TStringField;
    qVerificaExclusao3: TSQLQuery;
    qVerificaExclusao3CONTADOR: TIntegerField;
    qUltRemessa: TSQLQuery;
    qUltRemessaNUM_REMESSA: TStringField;
    cdsConsulta_LoteNUM_REMESSA: TStringField;
    sdsBusca_Ped: TSQLDataSet;
    dspBusca_Ped: TDataSetProvider;
    cdsBusca_Ped: TClientDataSet;
    cdsBusca_PedID: TIntegerField;
    cdsBusca_PedID_PEDIDO: TIntegerField;
    cdsBusca_PedNUM_PEDIDO: TIntegerField;
    cdsBusca_PedPEDIDO_CLIENTE: TStringField;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    cdsPendenteNOME_GRUPO: TStringField;
    cdsPendenteTIPO_GRUPO: TStringField;
    cdsPendenteCOD_GRUPO: TStringField;
    qParametros_LoteUSA_LOTE_REM: TStringField;
    mTalaoNum_Remessa: TStringField;
    sdsLote_Bol: TSQLDataSet;
    dspLote_Bol: TDataSetProvider;
    cdsLote_Bol: TClientDataSet;
    cdsLote_BolNUM_REMESSA: TStringField;
    cdsLote_BolNUM_TALAO: TIntegerField;
    cdsLote_BolNUM_LOTE: TIntegerField;
    cdsLote_BolQTD: TFloatField;
    cdsLote_BolFOTO: TStringField;
    cdsLote_BolOBS: TMemoField;
    cdsLote_BolOBS_PED: TStringField;
    cdsLote_BolDTENTREGA: TDateField;
    cdsLote_BolREFERENCIA: TStringField;
    cdsLote_BolID_PEDIDO: TIntegerField;
    cdsLote_BolOBSMATERIAL: TStringField;
    cdsLote_BolPEDIDO_CLIENTE: TStringField;
    cdsLote_BolNOME_CLIENTE: TStringField;
    cdsLote_BolNUM_LOTE_MAX: TIntegerField;
    dsLote_Bol: TDataSource;
    cdsLote_BolID_PRODUTO: TIntegerField;
    cdsLote_BolNOME_COMBINACAO: TStringField;
    cdsLote_BolUNIDADE: TStringField;
    cdsLote_BolFILIAL: TIntegerField;
    cdsLote_BolDTEMISSAO: TDateField;
    cdsLote_BolNUM_ORDEM: TIntegerField;
    cdsLote_BolSELECIONADO: TStringField;
    frxLote_Bol: TfrxDBDataset;
    cdsLote_BolID_COMBINACAO: TIntegerField;
    sdsTalao_Setor_Bol: TSQLDataSet;
    dspTalao_Setor_Bol: TDataSetProvider;
    cdsTalao_Setor_Bol: TClientDataSet;
    dsTalao_Setor_Bol: TDataSource;
    cdsTalao_Setor_BolID: TIntegerField;
    cdsTalao_Setor_BolNUM_TALAO: TIntegerField;
    cdsTalao_Setor_BolITEM: TIntegerField;
    cdsTalao_Setor_BolID_SETOR: TIntegerField;
    cdsTalao_Setor_BolDTENTRADA: TDateField;
    cdsTalao_Setor_BolHRENTRADA: TTimeField;
    cdsTalao_Setor_BolDTSAIDA: TDateField;
    cdsTalao_Setor_BolHRSAIDA: TTimeField;
    cdsTalao_Setor_BolID_FUNCIONARIO: TIntegerField;
    cdsTalao_Setor_BolQTD: TFloatField;
    cdsTalao_Setor_BolTOTAL_HORAS: TFloatField;
    cdsTalao_Setor_BolNOME_SETOR: TStringField;
    cdsTalao_Setor_BolORDEM_ORC: TIntegerField;
    frxTalao_Setor_Bol: TfrxDBDataset;
    cdsLote_BolID_LOTE: TIntegerField;
    sdsProduto_Comb_Mat: TSQLDataSet;
    dspProduto_Comb_Mat: TDataSetProvider;
    cdsProduto_Comb_Mat: TClientDataSet;
    dsProduto_Comb_Mat: TDataSource;
    cdsProduto_Comb_MatIMP_TALAO_POS: TStringField;
    cdsProduto_Comb_MatNOME_MATERIAL: TStringField;
    cdsProduto_Comb_MatID_GRADE: TIntegerField;
    cdsProduto_Comb_MatREF_MATERIAL: TStringField;
    cdsProduto_Comb_MatNOME_POSICAO: TStringField;
    cdsProduto_Comb_MatIMP_MATERIAL: TStringField;
    cdsProduto_Comb_MatIMP_AGRUPADO_MATERIAL: TStringField;
    cdsProduto_Comb_MatNOME_COR: TStringField;
    cdsProduto_Comb_MatID_COR: TIntegerField;
    cdsProduto_Comb_MatQTD_CONSUMO: TFloatField;
    cdsProduto_Comb_MatID_SETOR: TIntegerField;
    cdsProduto_Comb_MatID_POSICAO: TIntegerField;
    cdsProduto_Comb_MatITEM_MAT: TIntegerField;
    frxProduto_Comb_Mat: TfrxDBDataset;
    cdsProduto_Comb_MatUNIDADE: TStringField;
    qParametrosUSA_APROVACAO_PED: TStringField;
    qParametros_LoteIMP_TALAO_POR: TStringField;
    qParametros_LoteLOTE_CALCADO_NOVO: TStringField;
    cdsPedOriginalID_PRODUTO: TIntegerField;
    cdsPedOriginalID_COR: TFMTBCDField;
    cdsPedOriginalDTENTREGA: TDateField;
    cdsPedOriginalCARIMBO: TStringField;
    cdsPedOriginalREFERENCIA: TStringField;
    sdsConsLote_Novo: TSQLDataSet;
    dspConsLote_Novo: TDataSetProvider;
    cdsConsLote_Novo: TClientDataSet;
    cdsConsLote_NovoID: TIntegerField;
    cdsConsLote_NovoDTEMISSAO: TDateField;
    cdsConsLote_NovoNUM_LOTE: TIntegerField;
    cdsConsLote_NovoFILIAL: TIntegerField;
    cdsConsLote_NovoHREMISSAO: TTimeField;
    cdsConsLote_NovoDTENTREGA: TDateField;
    cdsConsLote_NovoQTD_TALOES: TIntegerField;
    cdsConsLote_NovoNUM_ORDEM: TIntegerField;
    cdsConsLote_NovoCARIMBO: TStringField;
    cdsConsLote_NovoTALAO_AUX_GERADO: TStringField;
    cdsConsLote_NovoID_PRODUTO: TIntegerField;
    cdsConsLote_NovoQTD: TFloatField;
    cdsConsLote_NovoQTD_PENDENTE: TFloatField;
    cdsConsLote_NovoQTD_PRODUZIDO: TFloatField;
    cdsConsLote_NovoDTBAIXA: TDateField;
    cdsConsLote_NovoHRBAIXA: TTimeField;
    cdsConsLote_NovoIMPRESSO: TStringField;
    cdsConsLote_NovoID_COMBINACAO: TIntegerField;
    cdsConsLote_NovoID_PEDIDO: TIntegerField;
    cdsConsLote_NovoITEM_PEDIDO: TIntegerField;
    cdsConsLote_NovoREFERENCIA: TStringField;
    cdsConsLote_NovoNOME_PRODUTO: TStringField;
    cdsConsLote_NovoUNIDADE: TStringField;
    cdsConsLote_NovoNOME_FILIAL: TStringField;
    cdsConsLote_NovoID_GRADE: TIntegerField;
    cdsConsLote_NovoID_TIPO_MATRIZ: TIntegerField;
    cdsConsLote_NovoNOME_TIPOMATRIZ: TStringField;
    cdsConsLote_NovoNOME_COMBINACAO: TStringField;
    cdsConsLote_NovoNOME_LOTE: TStringField;
    cdsConsLote_NovoNUM_PEDIDO: TIntegerField;
    cdsConsLote_NovoPEDIDO_CLIENTE: TStringField;
    cdsConsLote_NovoNOME_CLIENTE: TStringField;
    cdsConsLote_NovoUNIDADE_LOTE: TStringField;
    cdsConsLote_NovoID_FORMA: TIntegerField;
    cdsConsLote_NovoNOME_FORMA: TStringField;
    cdsConsLote_NovoOBS_PED: TStringField;
    cdsConsLote_NovoNUM_REMESSA: TStringField;
    dsConsLote_Novo: TDataSource;
    sdsBaixa_Processo: TSQLDataSet;
    sdsBaixa_ProcessoID: TIntegerField;
    sdsBaixa_ProcessoITEM: TIntegerField;
    sdsBaixa_ProcessoID_PROCESSO: TIntegerField;
    sdsBaixa_ProcessoID_LOTE: TIntegerField;
    sdsBaixa_ProcessoID_PEDIDO: TIntegerField;
    sdsBaixa_ProcessoITEM_PEDIDO: TIntegerField;
    sdsBaixa_ProcessoDTENTRADA: TDateField;
    sdsBaixa_ProcessoHRENTRADA: TTimeField;
    sdsBaixa_ProcessoDTBAIXA: TDateField;
    sdsBaixa_ProcessoHRBAIXA: TTimeField;
    sdsBaixa_ProcessoQTD: TFloatField;
    sdsBaixa_ProcessoQTD_PRODUZIDO: TFloatField;
    sdsBaixa_ProcessoNUM_ORDEM: TIntegerField;
    sdsBaixa_ProcessoTIPO: TStringField;
    sdsBaixa_ProcessoQTD_PENDENTE: TFloatField;
    sdsBaixa_ProcessoPARCIAL: TStringField;
    sdsBaixa_ProcessoQTD_LIBERADA: TFloatField;
    sdsBaixa_ProcessoAJUSTE: TStringField;
    dspBaixa_Processo: TDataSetProvider;
    cdsBaixa_Processo: TClientDataSet;
    cdsBaixa_ProcessoID: TIntegerField;
    cdsBaixa_ProcessoITEM: TIntegerField;
    cdsBaixa_ProcessoID_PROCESSO: TIntegerField;
    cdsBaixa_ProcessoID_LOTE: TIntegerField;
    cdsBaixa_ProcessoID_PEDIDO: TIntegerField;
    cdsBaixa_ProcessoITEM_PEDIDO: TIntegerField;
    cdsBaixa_ProcessoDTENTRADA: TDateField;
    cdsBaixa_ProcessoHRENTRADA: TTimeField;
    cdsBaixa_ProcessoDTBAIXA: TDateField;
    cdsBaixa_ProcessoHRBAIXA: TTimeField;
    cdsBaixa_ProcessoQTD: TFloatField;
    cdsBaixa_ProcessoQTD_PRODUZIDO: TFloatField;
    cdsBaixa_ProcessoNUM_ORDEM: TIntegerField;
    cdsBaixa_ProcessoTIPO: TStringField;
    cdsBaixa_ProcessoQTD_PENDENTE: TFloatField;
    cdsBaixa_ProcessoPARCIAL: TStringField;
    cdsBaixa_ProcessoQTD_LIBERADA: TFloatField;
    cdsBaixa_ProcessoAJUSTE: TStringField;
    dsBaixa_Processo: TDataSource;
    qParametros_LoteTIPO_PROCESSO: TStringField;
    sdsProduto_Consumo_Proc: TSQLDataSet;
    dspProduto_Consumo_Proc: TDataSetProvider;
    cdsProduto_Consumo_Proc: TClientDataSet;
    cdsProduto_Consumo_ProcID: TIntegerField;
    cdsProduto_Consumo_ProcITEM: TIntegerField;
    cdsProduto_Consumo_ProcITEM_PROC: TIntegerField;
    cdsProduto_Consumo_ProcID_PROCESSO: TIntegerField;
    sdsConsBaixaProc: TSQLDataSet;
    dspConsBaixaProc: TDataSetProvider;
    cdsConsBaixaProc: TClientDataSet;
    cdsConsBaixaProcID: TIntegerField;
    cdsConsBaixaProcITEM: TIntegerField;
    cdsConsBaixaProcID_PROCESSO: TIntegerField;
    cdsConsBaixaProcID_LOTE: TIntegerField;
    cdsConsBaixaProcID_PEDIDO: TIntegerField;
    cdsConsBaixaProcITEM_PEDIDO: TIntegerField;
    cdsConsBaixaProcDTENTRADA: TDateField;
    cdsConsBaixaProcHRENTRADA: TTimeField;
    cdsConsBaixaProcDTBAIXA: TDateField;
    cdsConsBaixaProcHRBAIXA: TTimeField;
    cdsConsBaixaProcQTD: TFloatField;
    cdsConsBaixaProcQTD_PRODUZIDO: TFloatField;
    cdsConsBaixaProcNUM_ORDEM: TIntegerField;
    cdsConsBaixaProcTIPO: TStringField;
    cdsConsBaixaProcTOTAL_HORAS: TFloatField;
    cdsConsBaixaProcQTD_PENDENTE: TFloatField;
    cdsConsBaixaProcSELECIONADO: TStringField;
    cdsConsBaixaProcPARCIAL: TStringField;
    cdsConsBaixaProcITEM_ORIGINAL: TIntegerField;
    cdsConsBaixaProcQTD_LIBERADA: TFloatField;
    cdsConsBaixaProcAJUSTE: TStringField;
    cdsConsBaixaProcID_FUNCIONARIO_ENT: TIntegerField;
    cdsConsBaixaProcID_FUNCIONARIO_BAIXA: TIntegerField;
    cdsConsBaixaProcID_MOVESTOQUE: TIntegerField;
    cdsConsBaixaProcID_MOVESTOQUE_RES: TIntegerField;
    cdsConsBaixaProcID_SETOR: TIntegerField;
    cdsConsBaixaProcID_POSICAO: TIntegerField;
    cdsConsBaixaProcNUM_TALAO: TIntegerField;
    dsConsBaixaProc: TDataSource;
    cdsConsBaixaProcNOME_PROCESSO: TStringField;
    sdsBaixa_ProcessoID_SETOR: TIntegerField;
    sdsBaixa_ProcessoID_POSICAO: TIntegerField;
    sdsBaixa_ProcessoNUM_TALAO: TIntegerField;
    cdsBaixa_ProcessoID_SETOR: TIntegerField;
    cdsBaixa_ProcessoID_POSICAO: TIntegerField;
    cdsBaixa_ProcessoNUM_TALAO: TIntegerField;
    cdsProduto_Consumo_ProcID_SETOR: TIntegerField;
    cdsProduto_Consumo_ProcID_POSICAO: TIntegerField;
    cdsPedOriginalCAIXINHA: TStringField;
    mAcumCaixinha: TStringField;
    cdsPendenteCAIXINHA: TStringField;
    sdsLoteCAIXINHA: TStringField;
    cdsLoteCAIXINHA: TStringField;
    sdsTalao_SetorQTD_PRODUZIDO: TFloatField;
    sdsTalao_SetorQTD_PENDENTE: TFloatField;
    cdsTalao_SetorQTD_PRODUZIDO: TFloatField;
    cdsTalao_SetorQTD_PENDENTE: TFloatField;
    sdsBaixa_ProcessoID_MATERIAL: TIntegerField;
    cdsBaixa_ProcessoID_MATERIAL: TIntegerField;
    sdsConsProcesso: TSQLDataSet;
    dspConsProcesso: TDataSetProvider;
    cdsConsProcesso: TClientDataSet;
    cdsConsProcessoID: TIntegerField;
    cdsConsProcessoID_LOTE: TIntegerField;
    cdsConsProcessoID_PROCESSO: TIntegerField;
    cdsConsProcessoID_SETOR: TIntegerField;
    cdsConsProcessoID_POSICAO: TIntegerField;
    cdsConsProcessoNOME_PROCESSO: TStringField;
    cdsConsProcessoNOME_SETOR: TStringField;
    cdsConsProcessoNOME_POSICAO: TStringField;
    cdsConsProcessoQTD: TFloatField;
    cdsConsProcessoQTD_PENDENTE: TFloatField;
    cdsConsProcessoQTD_PRODUZIDO: TFloatField;
    cdsConsProcessoNOME_MATERIAL: TStringField;
    cdsConsProcessoclCodBarra: TStringField;
    cdsConsProcessoITEM: TIntegerField;
    dsConsProcesso: TDataSource;
    cdsConsProcessoNUM_LOTE: TIntegerField;
    cdsConsProcessoNUM_ORDEM: TIntegerField;
    cdsConsProcessoREFERENCIA: TStringField;
    cdsConsProcessoPEDIDO_CLIENTE: TStringField;
    cdsConsProcessoNUM_PEDIDO: TIntegerField;
    cdsProduto_Consumo_ProcID_MATERIAL: TIntegerField;
    sdsLotePROCESSO_BAIXADO: TStringField;
    cdsLotePROCESSO_BAIXADO: TStringField;
    cdsConsumoCalcID_GRADE_PROD: TIntegerField;
    qParametros_Prod: TSQLQuery;
    qParametros_ProdUSA_TAM_REFER_GRADE: TStringField;
    sdsBaixa_ProcessoID_COR_MAT: TIntegerField;
    cdsBaixa_ProcessoID_COR_MAT: TIntegerField;
    cdsProduto_Consumo_ProcID_COR_MAT: TIntegerField;
    qVerBaixaProc: TSQLQuery;
    qVerBaixaProcCONTADOR: TIntegerField;
    cdsConsProcessoID_COR_MAT: TIntegerField;
    cdsConsProcessoNOME_COR_MAT: TStringField;
    cdsConsProcessoNOME_MODELO: TStringField;
    cdsConsLote_NovoFOTO: TStringField;
    cdsConsProcessoID_PRODUTO: TIntegerField;
    cdsConsProcessoID_COMBINACAO: TIntegerField;
    frxConsLoteNovo: TfrxDBDataset;
    sdsTalao_Estoque: TSQLDataSet;
    sdsTalao_EstoqueID: TIntegerField;
    sdsTalao_EstoqueID_LOTE: TIntegerField;
    sdsTalao_EstoqueNUM_TALAO: TIntegerField;
    sdsTalao_EstoqueID_SETOR: TIntegerField;
    sdsTalao_EstoqueQTD: TFloatField;
    sdsTalao_EstoqueID_MOVESTOQUE: TIntegerField;
    sdsTalao_EstoqueDATA: TDateField;
    sdsTalao_EstoqueID_SETOR2: TIntegerField;
    dspTalao_Estoque: TDataSetProvider;
    cdsTalao_Estoque: TClientDataSet;
    cdsTalao_EstoqueID: TIntegerField;
    cdsTalao_EstoqueID_LOTE: TIntegerField;
    cdsTalao_EstoqueNUM_TALAO: TIntegerField;
    cdsTalao_EstoqueID_SETOR: TIntegerField;
    cdsTalao_EstoqueQTD: TFloatField;
    cdsTalao_EstoqueID_MOVESTOQUE: TIntegerField;
    cdsTalao_EstoqueDATA: TDateField;
    cdsTalao_EstoqueID_SETOR2: TIntegerField;
    sdsLote_MatDTEMISSAO: TDateField;
    cdsLote_MatDTEMISSAO: TDateField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dspLoteUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
    procedure cdsLoteNewRecord(DataSet: TDataSet);
    procedure cdsLote_MatNewRecord(DataSet: TDataSet);
    procedure mAcumNewRecord(DataSet: TDataSet);
    procedure frxLote_BolFirst(Sender: TObject);
    procedure frxLote_BolNext(Sender: TObject);
    procedure frxLote_BolOpen(Sender: TObject);
    procedure cdsTalao_SetorNewRecord(DataSet: TDataSet);
    procedure dspTalao_EstoqueGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
  private
    { Private declarations }
    procedure DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);

    procedure prc_Abrir_Produto_Consumo;
    procedure prc_Abrir_Talao_Setor_Bol;

  public
    { Public declarations }
    vMsgErro: String;
    ctCommand: String;
    ctOrdem_Prod: String;
    ctConsulta_Lote: String;
    ctConsLote_Novo: String;
    ctConsulta_Lote_SL: String;
    ctPedido_PorTalao: String;
    ctConsulta_Talao_Aux: String;
    ctProduto_Comb: String;
    ctPendente: String;
    ctPendente_Ped: String;
    ctPedido_Ord: String;
    ctTingimento: String;
    ctPedido_Calc: String;
    ctqProximo_Lote: String;
    ctConsProcesso: String;
    ctLote_Bol: String;
    vAltura_Etiq_Rot: Integer;
    vGerado: Boolean;
    vTalao_Loc :Integer;

    procedure prc_Localizar(ID: Integer);
    procedure prc_Inserir;
    procedure prc_Excluir;

    procedure prc_Gravar_mLote(Tipo: String ; ImprimirPor: String ; Qtd: Real); //ImprimirPor   L=Por Lote  T=Tamanho   A=Acumulado

    procedure prc_Inserir_Talao;
    function fnc_Buscar_NumPedido(NumLote: Integer): String;
    function fnc_Somar_Consumo: Real;
    function fnc_Somar_Consumo_Talao: Real;

    procedure prc_Abrir_Lote_Mat(Num_Ordem: Integer);
    procedure prc_Abrir_Baixa_Processo(ID: Integer);
    procedure prc_Gravar_Lote_Mat;   
  end;

var
  DMCadLote_Calc: TDMCadLote_Calc;

implementation

uses DmdDatabase, LogProvider, uUtilPadrao, Masks;

{$R *.dfm}

{ TDMCadLote}

procedure TDMCadLote_Calc.prc_Inserir;
var
  vAux: Integer;
begin
  if not cdsLote.Active then
    prc_Localizar(-1);
  vAux := dmDatabase.ProximaSequencia('LOTE',0);

  cdsLote.Insert;
  cdsLoteID.AsInteger := vAux;
end;

procedure TDMCadLote_Calc.prc_Excluir;
begin
  if not(cdsLote.Active) or (cdsLote.IsEmpty) then
    exit;
  cdsLote.Delete;
  cdsLote.ApplyUpdates(0);
end;

{procedure TDMCadLote.prc_Gravar;
begin
  vMsgErro := '';
  if cdsOrdem_ProdQTD_LOTE.AsInteger <= 0 then
    vMsgErro := vMsgErro + #13 + '*** Lote não informado!';
  if trim(vMsgErro) <> '' then
    exit;

  cdsLote.Post;
  cdsLote.ApplyUpdates(0);
end;
}

procedure TDMCadLote_Calc.prc_Localizar(ID: Integer); //-1 é para inclusão
begin
  cdsLote.Close;
  sdsLote.CommandText := ctCommand;
  if ID <> 0 then
    sdsLote.CommandText := sdsLote.CommandText
                         + ' WHERE ID = ' + IntToStr(ID);
  cdsLote.Open;
end;

procedure TDMCadLote_Calc.DataModuleCreate(Sender: TObject);
var
  i, x: Integer;
  vIndices: string;
  aIndices: array of string;
begin
  ctCommand            := sdsLote.CommandText;
  ctConsulta_Lote      := sdsConsulta_Lote.CommandText;
  ctConsLote_Novo      := sdsConsLote_Novo.CommandText;
  ctPendente           := sdsPendente.CommandText;
  ctPendente_Ped       := sdsPendente_Ped.CommandText;
  ctPedido_Calc        := sdsPedido_Calc.CommandText;
  ctqProximo_Lote      := qProximo_Lote.SQL.Text;
  ctLote_Bol           := sdsLote_Bol.CommandText;
  ctConsProcesso       := sdsConsProcesso.CommandText;

  cdsProduto.Close;
  cdsProduto.Open;
  qParametros.Open;
  qParametros_Lote.Open;
  qParametros_Ped.Open;
  qParametros_Prod.Open;

  LogProviderList.OnAdditionalValues := DoLogAdditionalValues;
  for i := 0 to (Self.ComponentCount - 1) do
  begin
    if (Self.Components[i] is TClientDataSet) then
    begin
      SetLength(aIndices, 0);
      vIndices := TClientDataSet(Components[i]).IndexFieldNames;
      while (vIndices <> EmptyStr) do
      begin
        SetLength(aIndices, Length(aIndices) + 1);
        x := Pos(';', vIndices);
        if (x = 0) then
        begin
          aIndices[Length(aIndices) - 1] := vIndices;
          vIndices := EmptyStr;
        end
        else
        begin
          aIndices[Length(aIndices) - 1] := Copy(vIndices, 1, x - 1);
          vIndices := Copy(vIndices, x + 1, MaxInt);
        end;
      end;
      LogProviderList.AddProvider(TClientDataSet(Self.Components[i]), TClientDataSet(Self.Components[i]).Name, aIndices);
    end;
  end;
  //***********************
end;

procedure TDMCadLote_Calc.prc_Inserir_Talao;
var
  vItemAux: Integer;
begin
  cdsTalao.First;
  cdsTalao.Last;
  vItemAux := cdsTalaoNUM_TALAO.AsInteger;
  cdsTalao.Insert;
  cdsTalaoID.AsInteger          := cdsLoteID.AsInteger;
  cdsTalaoNUM_TALAO.AsInteger   := vItemAux + 1;
  cdsTalaoQTD.AsFloat           := 0;
  cdsTalaoQTD_PRODUZIDO.AsFloat := 0;
  cdsTalaoQTD_PENDENTE.AsFloat  := 0;
  cdsTalaoDTBAIXA.Clear;
  cdsTalaoHRBAIXA.Clear;
end;

procedure TDMCadLote_Calc.dspLoteUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  dmDatabase.prc_UpdateError(DataSet.Name,UpdateKind,E);
end;

function TDMCadLote_Calc.fnc_Buscar_NumPedido(NumLote: Integer): String;
var
  vTexto: String;
begin
  cdsBusca_Ped.Close;
  sdsBusca_Ped.ParamByName('ID').AsInteger := NumLote;
  cdsBusca_Ped.Open;
  cdsBusca_Ped.IndexFieldNames := 'PEDIDO_CLIENTE';

  vTexto:= 'Pedido(s): ';
  cdsBusca_Ped.First;
  while not cdsBusca_Ped.Eof do
  begin
    vTexto := vTexto + '(' + cdsBusca_PedPEDIDO_CLIENTE.AsString + ')';
    cdsBusca_Ped.Next;
  end;
  Result := vTexto;
end;

procedure TDMCadLote_Calc.prc_Gravar_mLote(Tipo: String ; ImprimirPor: String ; Qtd: Real); //ImprimirPor   L=Por Lote  T=Tamanho   A=Acumulado
var
  vTalaoAux: Integer;
  vID_CorAux: Integer;
  vExiste: Boolean;
  vTamAux: String;
  vQtdAux: Real;
begin
  if Tipo = 'L' then
    vTalaoAux := 0
  else
    vTalaoAux := cdsConsulta_LoteNUM_TALAO.AsInteger;
  if ImprimirPor = 'T' then
  begin
    if qParametros_LoteTIPO_LOTE.AsString = 'T' then
      vTalao_Loc := cdsConsulta_LoteNUM_TALAO.AsInteger
    else
      vTalao_Loc := vTalao_Loc + 1;
  end;
  vTamAux := '';
  if trim(cdsConsulta_LoteTAMANHO.AsString) <> '' then
    vTamAux := cdsConsulta_LoteTAMANHO.AsString;
  vID_CorAux := 0;
  if cdsConsulta_LoteID_COMBINACAO.AsInteger > 0 then
    vID_CorAux := cdsConsulta_LoteID_COMBINACAO.AsInteger;
  //19/09/2017
  vExiste := False;
  if (ImprimirPor = 'T') then
    vExiste := False;

  if (ImprimirPor = 'A') and (mLote.Locate('Num_Ordem;Num_Pedido;ID_Produto;ID_Combinacao',VarArrayOf([cdsConsulta_LoteNUM_ORDEM.AsInteger,
                                    cdsConsulta_LoteNUM_PEDIDO.AsInteger,cdsConsulta_LoteID_PRODUTO.AsInteger,vID_CorAux]),[locaseinsensitive])) then
    vExiste := True;
  if (ImprimirPor <> 'T') and (ImprimirPor <> 'A') then
  begin
    if mLote.Locate('Num_Lote;Num_Talao;ID_Combinacao',VarArrayOf([cdsConsulta_LoteNUM_LOTE.AsInteger,vTalaoAux,vID_CorAux]),[locaseinsensitive]) then
      vExiste := True;
  end;
  //****
  //if mLote.Locate('Num_Lote;Num_Talao;ID_Combinacao',VarArrayOf([cdsConsulta_LoteNUM_LOTE.AsInteger,vTalaoAux,vID_CorAux]),[locaseinsensitive]) then
  if vExiste then
    mLote.Edit
  else
  begin
    mLote.Insert;
    if ImprimirPor <> 'L' then
    begin
      if (qParametros_LoteUSA_REMESSA.AsString = 'S') then
        mLoteID_Lote.AsInteger   := cdsConsulta_LoteID.AsInteger
      else
        mLoteID_Lote.AsInteger   := 0;
      mLoteNum_Lote.AsInteger  := cdsConsulta_LoteNUM_LOTE.AsInteger;
      mLoteNum_Talao.AsInteger := 0;
      if ImprimirPor = 'T' then
        mLoteNum_Talao.AsInteger := vTalao_Loc;
    end
    else
    begin
      mLoteID_Lote.AsInteger   := cdsConsulta_LoteID.AsInteger;
      mLoteNum_Lote.AsInteger  := cdsConsulta_LoteNUM_LOTE.AsInteger;
      mLoteNum_Talao.AsInteger := vTalaoAux;
    end;
    mLoteNum_Remessa.AsString     := cdsConsulta_LoteNUM_REMESSA.AsString;
    mLoteID_Combinacao.AsInteger  := vID_CorAux;
    mLoteNome_Combinacao.AsString := cdsConsulta_LoteNOME_COMBINACAO.AsString;
    mLoteID_Produto.AsInteger     := cdsConsulta_LoteID_PRODUTO.AsInteger;
    mLoteReferencia.AsString      := cdsConsulta_LoteREFERENCIA.AsString;
    mLoteNome_Produto.AsString    := cdsConsulta_LoteNOME_PRODUTO.AsString;
    mLoteDtEntrega.AsDateTime     := cdsConsulta_LoteDTENTREGA.AsDateTime;
    mLoteQtd_Taloes.AsInteger     := cdsConsulta_LoteQTD_TALOES.AsInteger;
    mLoteFilial.AsInteger         := cdsConsulta_LoteFILIAL.AsInteger;
    mLoteNome_Filial.AsString     := cdsConsulta_LoteNOME_FILIAL.AsString;
    mLoteDtEmissao.AsDateTime     := cdsConsulta_LoteDTEMISSAO.AsDateTime;
    mLoteID_Forma.AsInteger       := cdsConsulta_LoteID_FORMA.AsInteger;
    mLoteNome_Forma.AsString      := cdsConsulta_LoteNOME_FORMA.AsString;
    mLoteObs.AsString             := cdsConsulta_LoteOBS_PED.AsString;
    if trim(cdsConsulta_LoteUNIDADE_TALAO.AsString) <> '' then
      mLoteUnidade.AsString := cdsConsulta_LoteUNIDADE_TALAO.AsString
    else
      mLoteUnidade.AsString := cdsConsulta_LoteUNIDADE.AsString;
    mLoteTamanho.AsString        := cdsConsulta_LoteTAMANHO.AsString;
    mLoteCarimbo.AsString        := cdsConsulta_LoteCARIMBO.AsString;
    mLoteID_Grade.AsInteger      := cdsConsulta_LoteID_GRADE.AsInteger;
    mLoteNum_Ordem.AsInteger     := cdsConsulta_LoteNUM_ORDEM.AsInteger;
    mLoteNome_Lote.AsString      := cdsConsulta_LoteNOME_LOTE.AsString;
    mLoteID_Processo.AsInteger   := cdsConsulta_LoteID_PROCESSO.AsInteger;
    mLoteNome_Processo.AsString  := cdsConsulta_LoteNOME_PROCESSO.AsString;
    mLoteTipo_Lote.AsString      := cdsConsulta_LoteTIPO_LOTE.AsString;
    if mLoteTipo_Lote.AsString = 'S' then
      mLoteDescricao_Tipo.AsString := 'Semi Acabado'
    else
    if mLoteTipo_Lote.AsString = 'L' then
      mLoteDescricao_Tipo.AsString := 'Produto';
    if cdsConsulta_LoteACABAMENTO.AsString = 'P' then
      mLoteAcabamento.AsString := 'Pintado'
    else
    if cdsConsulta_LoteACABAMENTO.AsString = 'F' then
      mLoteAcabamento.AsString := 'Forrado'
    else
      mLoteAcabamento.AsString := '';
    mLoteCor_Acabamento.AsString := cdsConsulta_LoteCOR_ACABAMENTO.AsString;
    mLotePedido_Cliente.AsString := cdsConsulta_LotePEDIDO_CLIENTE.AsString;
    mLoteNum_Pedido.AsInteger    := cdsConsulta_LoteNUM_PEDIDO.AsInteger;
    mLoteImprimirPor.AsString    := ImprimirPor;
    if ImprimirPor = 'T' then
    begin
      vQtdAux := Qtd;
      if Qtd > 12 then
        vQtdAux := 12;
      mLoteQtd.AsFloat := vQtdAux;
      Qtd := StrToFloat(FormatFloat('0.0000',qtd - vQtdAux));
    end;
  end;
  mLoteNome_TipoMatriz.AsString := cdsConsulta_LoteNOME_TIPOMATRIZ.AsString;
  if (ImprimirPor <> 'T') then
  begin
    mLoteQtd.AsFloat := mLoteQtd.AsFloat + cdsConsulta_LoteQTD.AsFloat;
  end;
  mLoteNome_Cliente.AsString   := cdsConsulta_LoteNOME_CLIENTE.AsString;
  mLoteTalao_Aux_Gerado.AsString := cdsConsulta_LoteTALAO_AUX_GERADO.AsString;
  mLote.Post;
  if ((Tipo = 'L') and (trim(cdsConsulta_LoteTAMANHO.AsString) = '')) or (Tipo = 'T') then
    exit;
  if ImprimirPor = 'T' then
  begin
    mTalao.Insert;
    mTalaoNum_Lote.AsInteger  := mLoteNum_Lote.AsInteger;
    mTalaoNum_Talao.AsInteger := vTalao_Loc;
    mTalaoTamanho.AsString    := cdsConsulta_LoteTAMANHO.AsString;
    mTalaoQtd.AsFloat         := vQtdAux;
    mTalao.Post;

    if StrToFloat(FormatFloat('0.0000',Qtd)) > 0 then
      prc_Gravar_mLote(Tipo,ImprimirPor,Qtd);
  end;

  if ImprimirPor <> 'T' then
  begin
    if mTalao.Locate('Num_Lote;Tamanho',VarArrayOf([mLoteNum_Lote.AsInteger,cdsConsulta_LoteTAMANHO.AsString]),[locaseinsensitive]) then
      mTalao.Edit
    else
    begin
      mTalao.Insert;
      mTalaoNum_Lote.AsInteger  := mLoteNum_Lote.AsInteger;
      mTalaoNum_Talao.AsInteger := 0;
      mTalaoTamanho.AsString    := cdsConsulta_LoteTAMANHO.AsString;
    end;
    mTalaoQtd.AsFloat := mTalaoQtd.AsFloat + cdsConsulta_LoteQTD.AsFloat;
    mTalao.Post;
    if mTamanho.Locate('TAMANHO',cdsConsulta_LoteTAMANHO.AsString,[loCaseInsensitive]) then
      mTamanho.Edit
    else
    begin
      mTamanho.Insert;
      mTamanhoTamanho.AsString := cdsConsulta_LoteTAMANHO.AsString;
    end;
    mTamanhoQtd.AsFloat := mTamanhoQtd.AsFloat + cdsConsulta_LoteQTD.AsFloat;
    mTamanho.Post;
  end;
end;

function TDMCadLote_Calc.fnc_Somar_Consumo: Real;
var
  vConsumo_Aux: Real;
  vAux: Real;
begin
  vConsumo_Aux := 0;
  try
    mTalao.First;
    while not mTalao.Eof do
    begin
      qProduto_Consumo_Tam.Close;
      qProduto_Consumo_Tam.ParamByName('ID').AsInteger     := cdsProduto_ConsumoID.AsInteger;
      qProduto_Consumo_Tam.ParamByName('ITEM').AsInteger   := cdsProduto_ConsumoITEM.AsInteger;
      qProduto_Consumo_Tam.ParamByName('TAMANHO').AsString := mTalaoTamanho.AsString;
      qProduto_Consumo_Tam.Open;
      vAux := StrToFloat(FormatFloat('0.00000',qProduto_Consumo_TamQTD_CONSUMO.AsFloat * mTalaoQtd.AsFloat));
      vConsumo_Aux := vConsumo_Aux + vAux;
      mTalao.Next;
    end;
  finally
  end;
  Result := vConsumo_Aux;
end;

function TDMCadLote_Calc.fnc_Somar_Consumo_Talao: Real;
begin
  qProduto_Consumo_Tam.Close;
  qProduto_Consumo_Tam.ParamByName('ID').AsInteger     := cdsProduto_ConsumoID.AsInteger;
  qProduto_Consumo_Tam.ParamByName('ITEM').AsInteger   := cdsProduto_ConsumoITEM.AsInteger;
  qProduto_Consumo_Tam.ParamByName('TAMANHO').AsString := mLoteTamanho.AsString;
  qProduto_Consumo_Tam.Open;
  Result := StrToFloat(FormatFloat('0.00000',qProduto_Consumo_TamQTD_CONSUMO.AsFloat * mLoteQtd.AsFloat));
end;

procedure TDMCadLote_Calc.cdsLoteNewRecord(DataSet: TDataSet);
begin
  cdsLoteTALAO_AUX_GERADO.AsString := 'N';
  cdsLoteTIPO_LOTE.AsString        := 'N';
  cdsLoteIMPRESSO.AsString         := 'N';
  cdsLoteQTD.AsFloat               := 0;
  cdsLoteENCERADO.AsString         := 'N';
  cdsLoteQTD_PRODUZIDO.AsInteger   := 0;
  cdsLotePROCESSO_BAIXADO.AsString := 'N';
end;

procedure TDMCadLote_Calc.DoLogAdditionalValues(ATableName: string;
  var AValues: TArrayLogData; var UserName: string);
begin
  UserName := vUsuario;
end;

procedure TDMCadLote_Calc.prc_Abrir_Lote_Mat(Num_Ordem: Integer);
begin
  cdsLote_Mat.Close;
  sdsLote_Mat.ParamByName('NUM_ORDEM').AsInteger := Num_Ordem;
  cdsLote_Mat.Open;
end;

procedure TDMCadLote_Calc.prc_Gravar_Lote_Mat;
var
  vItem_Mat: Integer;
  vID_Cor: Integer;
  vExiste: Boolean;
begin
  vExiste := False;
  if mMaterialTingimento.AsString = 'S' then
  begin
    vID_Cor := 0;
    if cdsLote_Mat.Locate('ID_MATERIAL;ID_COR',VarArrayOf([mMaterialID_Material.AsInteger,vID_Cor]),[locaseinsensitive]) then
      vExiste := True;
  end
  else
    vID_Cor := mMaterialID_Cor.AsInteger;

  if vExiste then
  begin
    cdsLote_Mat.Edit;
  end
  else
  if not vExiste then
  begin
    cdsLote_Mat.Last;
    vItem_Mat := cdsLote_MatITEM.AsInteger;
    vItem_Mat := vItem_Mat + 1;
    cdsLote_Mat.Insert;
    cdsLote_MatNUM_ORDEM.AsInteger     := cdsLoteNUM_ORDEM.AsInteger;
    cdsLote_MatITEM.AsInteger          := vItem_Mat;
    cdsLote_MatID_MATERIAL.AsInteger   := mMaterialID_Material.AsInteger;
    cdsLote_MatID_COR.AsInteger        := mMaterialID_Cor.AsInteger;
    cdsLote_MatCARIMBOAUX.AsString     := '';
    cdsLote_MatCARIMBO.AsString        := '';
    cdsLote_MatTAMANHO.AsString        := '';
    cdsLote_MatQTD_PRODUTO.AsFloat     := mMaterialQtd_Produto.AsFloat;
    cdsLote_MatID_FORNECEDOR.AsInteger := mMaterialID_Fornecedor.AsInteger;
    cdsLote_MatQtd_OC_Fat.AsFloat      := 0;
    cdsLote_MatGerado.AsString         := 'N';
    cdsLote_MatTINGIMENTO.AsString     := mMaterialTingimento.AsString;
    cdsLote_MatQTD_CONSUMO.AsFloat     := 0;
    cdsLote_MatDTEMISSAO.AsDateTime    := cdsLoteDTEMISSAO.AsDateTime;

  end;
  cdsLote_MatQTD_CONSUMO.AsFloat := cdsLote_MatQTD_CONSUMO.AsFloat +  mMaterialQtd_Consumo.AsFloat;
  cdsLote_Mat.Post;

  if cdsLote_MatTINGIMENTO.AsString = 'S' then
  begin
    //if cdsLote_Mat.Locate('ID_MATERIAL;ID_COR',VarArrayOf([mMaterialID_Material.AsInteger,qParametros_LoteID_COR_CRU.AsInteger]),[locaseinsensitive]) then
    if cdsLote_Mat.Locate('ID_MATERIAL;ID_COR',VarArrayOf([mMaterialID_Material_Cru.AsInteger,0]),[locaseinsensitive]) then
      cdsLote_Mat.Edit
    else
    begin
      cdsLote_Mat.Last;
      vItem_Mat := cdsLote_MatITEM.AsInteger;
      vItem_Mat := vItem_Mat + 1;
      cdsLote_Mat.Insert;
      cdsLote_MatNUM_ORDEM.AsInteger     := cdsLoteNUM_ORDEM.AsInteger;
      cdsLote_MatITEM.AsInteger          := vItem_Mat;
      //10/08/2017
      //cdsLote_MatID_MATERIAL.AsInteger   := mMaterialID_Material.AsInteger;
      cdsLote_MatID_MATERIAL.AsInteger   := mMaterialID_Material_Cru.AsInteger;
      //cdsLote_MatID_COR.AsInteger        := qParametros_LoteID_COR_CRU.AsInteger;
      cdsLote_MatID_COR.AsInteger        := 0;
      cdsLote_MatCARIMBOAUX.AsString     := '';
      cdsLote_MatCARIMBO.AsString        := '';
      cdsLote_MatTAMANHO.AsString        := '';
      cdsLote_MatQTD_PRODUTO.AsFloat     := mMaterialQtd_Produto.AsFloat;
      cdsLote_MatID_FORNECEDOR.AsInteger := mMaterialID_Fornecedor.AsInteger;
      cdsLote_MatQtd_OC_Fat.AsFloat      := 0;
      cdsLote_MatGerado.AsString         := 'N';
      cdsLote_MatTINGIMENTO.AsString     := 'N';
      cdsLote_MatQTD_CONSUMO.AsFloat     := 0;
      cdsLote_MatDTEMISSAO.AsDateTime    := cdsLoteDTEMISSAO.AsDateTime;
    end;
    cdsLote_MatQTD_CONSUMO.AsFloat := cdsLote_MatQTD_CONSUMO.AsFloat +  mMaterialQtd_Consumo.AsFloat;
    cdsLote_Mat.Post;
  end;

end;

procedure TDMCadLote_Calc.cdsLote_MatNewRecord(DataSet: TDataSet);
begin
  cdsLote_MatTINGIMENTO.AsString        := 'N';
  cdsLote_MatTINGIMENTO_GERADO.AsString := 'N';
end;

procedure TDMCadLote_Calc.mAcumNewRecord(DataSet: TDataSet);
begin
  mAcumQtd.AsInteger    := 0;
  mAcumTamanho.AsString := '';
end;

procedure TDMCadLote_Calc.frxLote_BolFirst(Sender: TObject);
begin
  prc_Abrir_Produto_Consumo;
  prc_Abrir_Talao_Setor_Bol;
end;

procedure TDMCadLote_Calc.prc_Abrir_Produto_Consumo;
begin
  cdsProduto_Comb_Mat.Close;
  sdsProduto_Comb_Mat.ParamByName('ID').AsInteger                := cdsLote_BolID_PRODUTO.AsInteger;
  sdsProduto_Comb_Mat.ParamByName('ID_COR_COMBINACAO').AsInteger := cdsLote_BolID_COMBINACAO.AsInteger;
  cdsProduto_Comb_Mat.Open;
end;

procedure TDMCadLote_Calc.frxLote_BolNext(Sender: TObject);
begin
  prc_Abrir_Produto_Consumo;
  prc_Abrir_Talao_Setor_Bol;
end;

procedure TDMCadLote_Calc.frxLote_BolOpen(Sender: TObject);
begin
  prc_Abrir_Produto_Consumo;
  prc_Abrir_Talao_Setor_Bol;
end;

procedure TDMCadLote_Calc.prc_Abrir_Talao_Setor_Bol;
begin
  cdsTalao_Setor_Bol.Close;
  sdsTalao_Setor_Bol.ParamByName('ID').AsInteger := cdsLote_BolID_LOTE.AsInteger;
  cdsTalao_Setor_Bol.Open;
end;

procedure TDMCadLote_Calc.prc_Abrir_Baixa_Processo(ID: Integer);
begin
  cdsBaixa_Processo.Close;
  sdsBaixa_Processo.ParamByName('ID').AsInteger := ID;
  cdsBaixa_Processo.Open;
end;

procedure TDMCadLote_Calc.cdsTalao_SetorNewRecord(DataSet: TDataSet);
begin
  cdsTalao_SetorQTD.AsInteger           := 0;
  cdsTalao_SetorQTD_PENDENTE.AsInteger  := 0;
  cdsTalao_SetorQTD_PRODUZIDO.AsInteger := 0;
end;

procedure TDMCadLote_Calc.dspTalao_EstoqueGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  TableName := 'TALAO_ESTOQUE';
end;

end.
