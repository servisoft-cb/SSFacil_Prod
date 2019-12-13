unit UDMCadLote;

interface                          

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, Variants, LogTypes,
  frxClass, frxDBSet, frxRich, frxExportMail, frxExportPDF, frxBarcode;

type
  TDMCadLote = class(TDataModule)
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
    sdsTalao: TSQLDataSet;
    cdsTalao: TClientDataSet;
    dsTalao: TDataSource;
    sdsTalaoID: TIntegerField;
    sdsTalaoNUM_TALAO: TIntegerField;
    sdsTalaoID_PRODUTO: TIntegerField;
    sdsTalaoTAMANHO: TStringField;
    sdsTalaoQTD: TFloatField;
    sdsTalaoQTD_PRODUZIDO: TFloatField;
    sdsTalaoQTD_PENDENTE: TFloatField;
    sdsTalaoDTBAIXA: TDateField;
    sdsTalaoHRBAIXA: TTimeField;
    cdsLotesdsTalao: TDataSetField;
    cdsTalaoID: TIntegerField;
    cdsTalaoNUM_TALAO: TIntegerField;
    cdsTalaoID_PRODUTO: TIntegerField;
    cdsTalaoTAMANHO: TStringField;
    cdsTalaoQTD: TFloatField;
    cdsTalaoQTD_PRODUZIDO: TFloatField;
    cdsTalaoQTD_PENDENTE: TFloatField;
    cdsTalaoDTBAIXA: TDateField;
    cdsTalaoHRBAIXA: TTimeField;
    dsTalao_Mestre: TDataSource;
    sdsTalao_Ped: TSQLDataSet;
    cdsTalao_Ped: TClientDataSet;
    dsTalao_Ped: TDataSource;
    cdsTalaosdsTalao_Ped: TDataSetField;
    cdsTalao_PedID: TIntegerField;
    cdsTalao_PedNUM_TALAO: TIntegerField;
    cdsTalao_PedID_PEDIDO: TIntegerField;
    cdsTalao_PedITEM_PEDIDO: TIntegerField;
    cdsTalao_PedQTD: TFloatField;
    cdsTalao_PedID_CLIENTE: TIntegerField;
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
    cdsTalao_PedBAIXADO: TStringField;
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
    sdsTalaoID_COMBINACAO: TIntegerField;
    cdsTalaoID_COMBINACAO: TIntegerField;
    mLoteNome_Combinacao: TStringField;
    mLoteID_Combinacao: TIntegerField;
    qParametrosINFORMAR_COR_PROD: TStringField;
    qParametrosMOSTRAR_LINHA_PROD: TStringField;
    qParametrosMOSTRAR_EMBALAGEM: TStringField;
    qParametrosUSA_SETOR_CONSUMO: TStringField;
    qParametrosMOSTRAR_ATELIER_PROD: TStringField;
    cdsConsulta_LoteID_COMBINACAO: TIntegerField;
    cdsPendenteNOME_COMBINACAO: TStringField;
    sdsTalao_Aux: TSQLDataSet;
    sdsTalao_AuxID: TIntegerField;
    sdsTalao_AuxITEM: TIntegerField;
    sdsTalao_AuxID_ATELIER: TIntegerField;
    sdsTalao_AuxID_SETOR: TIntegerField;
    sdsTalao_AuxID_PRODUTO: TIntegerField;
    sdsTalao_AuxID_COMBINACAO: TIntegerField;
    sdsTalao_AuxQTD: TFloatField;
    sdsTalao_AuxDTSAIDA: TDateField;
    sdsTalao_AuxHRSAIDA: TTimeField;
    sdsTalao_AuxDTRETORNO: TDateField;
    sdsTalao_AuxHRRETORNO: TTimeField;
    cdsTalao_Aux: TClientDataSet;
    cdsLotesdsTalao_Aux: TDataSetField;
    dsTalao_Aux: TDataSource;
    dsTalao_Aux_Mestre: TDataSource;
    cdsTalao_AuxID: TIntegerField;
    cdsTalao_AuxITEM: TIntegerField;
    cdsTalao_AuxID_ATELIER: TIntegerField;
    cdsTalao_AuxID_SETOR: TIntegerField;
    cdsTalao_AuxID_PRODUTO: TIntegerField;
    cdsTalao_AuxID_COMBINACAO: TIntegerField;
    cdsTalao_AuxQTD: TFloatField;
    cdsTalao_AuxDTSAIDA: TDateField;
    cdsTalao_AuxHRSAIDA: TTimeField;
    cdsTalao_AuxDTRETORNO: TDateField;
    cdsTalao_AuxHRRETORNO: TTimeField;
    sdsTalao_Aux_Tam: TSQLDataSet;
    sdsTalao_Aux_TamID: TIntegerField;
    sdsTalao_Aux_TamITEM: TIntegerField;
    sdsTalao_Aux_TamITEM_TAM: TIntegerField;
    sdsTalao_Aux_TamTAMANHO: TStringField;
    sdsTalao_Aux_TamQTD: TFloatField;
    cdsTalao_AuxsdsTalao_Aux_Tam: TDataSetField;
    cdsTalao_Aux_Tam: TClientDataSet;
    cdsTalao_Aux_TamID: TIntegerField;
    cdsTalao_Aux_TamITEM: TIntegerField;
    cdsTalao_Aux_TamITEM_TAM: TIntegerField;
    cdsTalao_Aux_TamTAMANHO: TStringField;
    cdsTalao_Aux_TamQTD: TFloatField;
    dsTalao_Aux_Tam: TDataSource;
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
    sdsTalao_AuxID_ATELIER_ORIG: TIntegerField;
    cdsTalao_AuxID_ATELIER_ORIG: TIntegerField;
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
    sdsTalao_AuxDTSISTEMA: TDateField;
    sdsTalao_AuxHRSISTEMA: TTimeField;
    sdsTalao_AuxDTPAGAMENTO: TDateField;
    sdsTalao_AuxSELECIONADO: TStringField;
    cdsTalao_AuxDTSISTEMA: TDateField;
    cdsTalao_AuxHRSISTEMA: TTimeField;
    cdsTalao_AuxDTPAGAMENTO: TDateField;
    cdsTalao_AuxSELECIONADO: TStringField;
    cdsPendenteSELECIONADO: TStringField;
    qParametrosOPCAO_DTENTREGAPEDIDO: TStringField;
    sdsTalaoID_PROCESSO: TIntegerField;
    cdsTalaoID_PROCESSO: TIntegerField;
    sdsTalaoIMPRESSO: TStringField;
    cdsTalaoIMPRESSO: TStringField;
    sdsTalaoDTENTRADA: TDateField;
    sdsTalaoHRENTRADA: TTimeField;
    cdsTalaoDTENTRADA: TDateField;
    cdsTalaoHRENTRADA: TTimeField;
    qParametrosUSA_GRADE: TStringField;
    mLoteID_Processo: TIntegerField;
    mLoteNome_Processo: TStringField;
    sdsTalao_Processo: TSQLDataSet;
    cdsTalaosdsTalao_Processo: TDataSetField;
    cdsTalao_Processo: TClientDataSet;
    dsTalao_Processo: TDataSource;
    sdsTalao_PedID: TIntegerField;
    sdsTalao_PedNUM_TALAO: TIntegerField;
    sdsTalao_PedID_PEDIDO: TIntegerField;
    sdsTalao_PedITEM_PEDIDO: TIntegerField;
    sdsTalao_PedQTD: TFloatField;
    sdsTalao_PedID_CLIENTE: TIntegerField;
    sdsTalao_PedNUM_LOTE: TIntegerField;
    sdsTalao_PedBAIXADO: TStringField;
    sdsTalao_ProcessoID: TIntegerField;
    sdsTalao_ProcessoNUM_TALAO: TIntegerField;
    sdsTalao_ProcessoITEM: TIntegerField;
    sdsTalao_ProcessoID_PROCESSO: TIntegerField;
    sdsTalao_ProcessoDTENTRADA: TDateField;
    sdsTalao_ProcessoHRENTRADA: TTimeField;
    sdsTalao_ProcessoDTBAIXA: TDateField;
    sdsTalao_ProcessoHRBAIXA: TTimeField;
    sdsTalao_ProcessoQTD: TFloatField;
    sdsTalao_ProcessoQTD_PRODUZIDO: TFloatField;
    cdsTalao_ProcessoID: TIntegerField;
    cdsTalao_ProcessoNUM_TALAO: TIntegerField;
    cdsTalao_ProcessoITEM: TIntegerField;
    cdsTalao_ProcessoID_PROCESSO: TIntegerField;
    cdsTalao_ProcessoDTENTRADA: TDateField;
    cdsTalao_ProcessoHRENTRADA: TTimeField;
    cdsTalao_ProcessoDTBAIXA: TDateField;
    cdsTalao_ProcessoHRBAIXA: TTimeField;
    cdsTalao_ProcessoQTD: TFloatField;
    cdsTalao_ProcessoQTD_PRODUZIDO: TFloatField;
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
    sdsTalaoITEM_PEDIDO: TIntegerField;
    sdsTalaoID_PEDIDO: TIntegerField;
    cdsTalaoITEM_PEDIDO: TIntegerField;
    cdsTalaoID_PEDIDO: TIntegerField;
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
    sdsTalaoREFERENCIA: TStringField;
    cdsTalaoREFERENCIA: TStringField;
    qProcesso_Ope: TSQLQuery;
    qProcesso_OpeID_PROCESSO: TIntegerField;
    qProcesso_OpeTIPO_MAT: TStringField;
    qProcesso_OpeNOME: TStringField;
    qProcesso_OpeTIPO_PROCESSO: TStringField;
    cdsPendenteID_COR_PROD: TIntegerField;
    cdsPendenteNOME_COR_PROD: TStringField;
    cdsPendenteTIPO_MAT: TStringField;
    sdsLoteUNIDADE: TStringField;
    cdsLoteUNIDADE: TStringField;
    sdsTalaoUNIDADE: TStringField;
    cdsTalaoUNIDADE: TStringField;
    cdsConsulta_LoteUNIDADE_TALAO: TStringField;
    qParametros_LoteLOTE_TEXTIL: TStringField;
    cdsConsulta_LoteREFERENCIA: TStringField;
    cdsConsulta_LoteNOME_PROCESSO: TStringField;
    cdsConsulta_LoteID_PROCESSO: TIntegerField;
    cdsLote_Ped: TClientDataSet;
    sdsLote_Ped: TSQLDataSet;
    sdsLote_PedID: TIntegerField;
    sdsLote_PedID_PEDIDO: TIntegerField;
    sdsLote_PedITEM_PEDIDO: TIntegerField;
    sdsLote_PedQTD: TFloatField;
    sdsLote_PedID_CLIENTE: TIntegerField;
    sdsLote_PedNUM_LOTE: TIntegerField;
    sdsLote_PedBAIXADO: TStringField;
    dsLote_Ped: TDataSource;
    cdsLotesdsLote_Ped: TDataSetField;
    cdsLote_PedID: TIntegerField;
    cdsLote_PedID_PEDIDO: TIntegerField;
    cdsLote_PedITEM_PEDIDO: TIntegerField;
    cdsLote_PedQTD: TFloatField;
    cdsLote_PedID_CLIENTE: TIntegerField;
    cdsLote_PedNUM_LOTE: TIntegerField;
    cdsLote_PedBAIXADO: TStringField;
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
    sdsLote_PedNUM_PEDIDO: TIntegerField;
    sdsLote_PedPEDIDO_CLIENTE: TStringField;
    cdsLote_PedNUM_PEDIDO: TIntegerField;
    cdsLote_PedPEDIDO_CLIENTE: TStringField;
    sdsLoteID_CLIENTE: TIntegerField;
    cdsLoteID_CLIENTE: TIntegerField;
    sdsLoteIMPRESSO: TStringField;
    cdsLoteIMPRESSO: TStringField;
    sdsConsulta_Lote_SL: TSQLDataSet;
    dspConsulta_Lote_SL: TDataSetProvider;
    cdsConsulta_Lote_SL: TClientDataSet;
    cdsConsulta_Lote_SLDTEMISSAO: TDateField;
    cdsConsulta_Lote_SLNUM_LOTE: TIntegerField;
    cdsConsulta_Lote_SLFILIAL: TIntegerField;
    cdsConsulta_Lote_SLHREMISSAO: TTimeField;
    cdsConsulta_Lote_SLDTENTREGA: TDateField;
    cdsConsulta_Lote_SLQTD_TALOES: TIntegerField;
    cdsConsulta_Lote_SLNUM_ORDEM: TIntegerField;
    cdsConsulta_Lote_SLCARIMBO: TStringField;
    cdsConsulta_Lote_SLTALAO_AUX_GERADO: TStringField;
    cdsConsulta_Lote_SLID: TIntegerField;
    cdsConsulta_Lote_SLID_PRODUTO: TIntegerField;
    cdsConsulta_Lote_SLQTD: TFloatField;
    cdsConsulta_Lote_SLQTD_PENDENTE: TFloatField;
    cdsConsulta_Lote_SLQTD_PRODUZIDO: TFloatField;
    cdsConsulta_Lote_SLDTBAIXA: TDateField;
    cdsConsulta_Lote_SLHRBAIXA: TTimeField;
    cdsConsulta_Lote_SLIMPRESSO: TStringField;
    cdsConsulta_Lote_SLID_COMBINACAO: TIntegerField;
    cdsConsulta_Lote_SLDTENTRADA: TDateField;
    cdsConsulta_Lote_SLHRENTRADA: TTimeField;
    cdsConsulta_Lote_SLREFERENCIA: TStringField;
    cdsConsulta_Lote_SLNOME_PRODUTO: TStringField;
    cdsConsulta_Lote_SLUNIDADE: TStringField;
    cdsConsulta_Lote_SLNOME_FILIAL: TStringField;
    cdsConsulta_Lote_SLNOME_COMBINACAO: TStringField;
    cdsConsulta_Lote_SLNOME_LOTE: TStringField;
    cdsConsulta_Lote_SLTIPO_LOTE: TStringField;
    cdsConsulta_Lote_SLOBS_PED: TStringField;
    cdsConsulta_Lote_SLNOME_CLIENTE: TStringField;
    cdsConsulta_Lote_SLID_COR_PROD: TIntegerField;
    cdsConsulta_Lote_SLUNIDADE_TALAO: TStringField;
    cdsConsulta_Lote_SLDESCRICAO_TIPO: TStringField;
    dsConsulta_Lote_SL: TDataSource;
    sdsLoteQTD_ORIGINAL: TFloatField;
    sdsLoteQTD_PARES: TFloatField;
    cdsLoteQTD_ORIGINAL: TFloatField;
    cdsLoteQTD_PARES: TFloatField;
    qProcesso_Grupo_Item: TSQLQuery;
    qProcesso_Grupo_ItemID: TIntegerField;
    qProcesso_Grupo_ItemITEM: TIntegerField;
    qProcesso_Grupo_ItemID_PROCESSO: TIntegerField;
    cdsPendenteID_PROCESSO_GRUPO: TIntegerField;
    sdsLoteID_PROCESSO_GRUPO: TIntegerField;
    cdsLoteID_PROCESSO_GRUPO: TIntegerField;
    cdsProdutoID_PROCESSO_GRUPO: TIntegerField;
    qProcesso_Grupo_ItemTIPO: TStringField;
    cdsConsulta_Lote_SLQTD_ORIGINAL: TFloatField;
    sdsConsulta_Processo_SL: TSQLDataSet;
    dspConsulta_Processo_SL: TDataSetProvider;
    cdsConsulta_Processo_SL: TClientDataSet;
    dsConsulta_Processo_SL: TDataSource;
    cdsConsulta_Processo_SLID: TIntegerField;
    cdsConsulta_Processo_SLITEM: TIntegerField;
    cdsConsulta_Processo_SLID_PROCESSO: TIntegerField;
    cdsConsulta_Processo_SLDTENTRADA: TDateField;
    cdsConsulta_Processo_SLHRENTRADA: TTimeField;
    cdsConsulta_Processo_SLDTBAIXA: TDateField;
    cdsConsulta_Processo_SLHRBAIXA: TTimeField;
    cdsConsulta_Processo_SLQTD: TFloatField;
    cdsConsulta_Processo_SLQTD_PRODUZIDO: TFloatField;
    cdsConsulta_Processo_SLNOME_PROCESSO: TStringField;
    sdsBaixa_Processo: TSQLDataSet;
    dspBaixa_Processo: TDataSetProvider;
    cdsBaixa_Processo: TClientDataSet;
    dsBaixa_Processo: TDataSource;
    sdsBaixa_ProcessoID: TIntegerField;
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
    sdsBaixa_ProcessoITEM: TIntegerField;
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
    sdsLote_PedQTD_PARES: TFloatField;
    cdsLote_PedQTD_PARES: TFloatField;
    sdsBaixa_ProcessoNUM_ORDEM: TIntegerField;
    cdsBaixa_ProcessoNUM_ORDEM: TIntegerField;
    sdsBaixa_ProcessoTIPO: TStringField;
    cdsBaixa_ProcessoTIPO: TStringField;
    cdsPendenteUNIDADE: TStringField;
    cdsPendenteTIPO_REG_PROD: TStringField;
    qVerificaGrupo_Proc: TSQLQuery;
    qVerificaGrupo_ProcID: TIntegerField;
    qVerificaGrupo_ProcTIPO: TStringField;
    qVerificaGrupo_ProcNOME: TStringField;
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
    sdsEstoque_Semi: TSQLDataSet;
    cdsEstoque_Semi: TClientDataSet;
    dsEstoque_Semi: TDataSource;
    dspEstoque_Semi: TDataSetProvider;
    cdsEstoque_SemiID_MATERIAL: TIntegerField;
    cdsEstoque_SemiID_COR: TFMTBCDField;
    cdsEstoque_SemiNOME_COMBINACAO: TStringField;
    cdsEstoque_SemiTOT_CONSUMO: TFloatField;
    cdsEstoque_SemiUNIDADE: TStringField;
    cdsEstoque_SemiREFERENCIA: TStringField;
    cdsEstoque_SemiESTOQUE_ATUAL: TFMTBCDField;
    cdsPendenteID_MATERIAL: TIntegerField;
    cdsPendenteQTD_CONSUMO_MAT: TFloatField;
    cdsPendenteUNIDADE_MAT: TStringField;
    cdsPendenteCONSUMO_CALC: TFloatField;
    mAuxLote: TClientDataSet;
    mAuxLoteID_Produto: TIntegerField;
    mAuxLoteReferencia: TStringField;
    mAuxLoteDtEntrega: TDateField;
    mAuxLoteQtd: TFloatField;
    mAuxLoteID_Combinacao: TIntegerField;
    mAuxLoteTipo_Lote: TStringField;
    mAuxLoteUnidade: TStringField;
    mAuxLoteObs_Pedido: TStringField;
    mAuxLoteQtd_Original: TFloatField;
    mAuxLoteQtd_Pares: TFloatField;
    mAuxLoteID_Processo_Grupo: TIntegerField;
    dsmAuxLote: TDataSource;
    mAuxLoteNum_Pedido: TIntegerField;
    mAuxLoteID_Cliente: TIntegerField;
    cdsEstoque_SemiNOME: TStringField;
    mAuxLote_Ped: TClientDataSet;
    mAuxLote_PedID: TIntegerField;
    mAuxLote_PedID_Pedido: TIntegerField;
    mAuxLote_PedQtd: TFloatField;
    mAuxLote_PedID_Cliente: TIntegerField;
    mAuxLote_PedNum_Pedido: TIntegerField;
    mAuxLote_PedPedido_Cliente: TStringField;
    mAuxLote_PedQtd_Pares: TFloatField;
    mAuxLoteID: TIntegerField;
    dsmAuxLote_Ped: TDataSource;
    mAuxLoteNome_Cliente: TStringField;
    mAuxLoteNome_Combinacao: TStringField;
    mAuxLote_PedItem_Pedido: TIntegerField;
    mAuxLote_Talao: TClientDataSet;
    dsmAuxLote_Talao: TDataSource;
    mAuxLote_TalaoID: TIntegerField;
    mAuxLote_TalaoItem: TIntegerField;
    mAuxLote_TalaoQtd: TFloatField;
    mAuxLoteTotal_Talao: TIntegerField;
    mAuxLote_PedID_Produto: TIntegerField;
    mAuxLoteQtd_Por_Talao: TFloatField;
    mMaterialQtd_Produto: TFloatField;
    sdsLoteID_PRODUTO_PRI: TIntegerField;
    cdsLoteID_PRODUTO_PRI: TIntegerField;
    mAuxLoteID_PRODUTO_PRI: TIntegerField;
    mAuxLoteTipo_Reg_Prod: TStringField;
    mAuxPed: TClientDataSet;
    mAuxPedID_Pedido: TIntegerField;
    mAuxPedItem_Pedido: TIntegerField;
    mAuxPedID_Processo_Grupo: TIntegerField;
    mAuxPedID_Cliente: TIntegerField;
    mAuxPedNum_Pedido: TIntegerField;
    mAuxPedPedido_Cliente: TStringField;
    mAuxPedQtd_Pares: TFloatField;
    mAuxPedQtd: TFloatField;
    mAuxPedID_Produto: TIntegerField;
    mAuxPedTipo_Mat: TStringField;
    mAuxPedTipo_Produto_Reg: TStringField;
    mAuxLoteTipo_Mat: TStringField;
    mAuxPedID_Cor: TIntegerField;
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
    sdsLote_Ting: TSQLDataSet;
    dspLote_Ting: TDataSetProvider;
    cdsLote_Ting: TClientDataSet;
    dsLote_Ting: TDataSource;
    sdsLote_TingNUM_ORDEM: TIntegerField;
    sdsLote_TingITEM: TIntegerField;
    sdsLote_TingID_MATERIAL: TIntegerField;
    sdsLote_TingID_COR: TIntegerField;
    sdsLote_TingQTD: TFloatField;
    cdsLote_TingNUM_ORDEM: TIntegerField;
    cdsLote_TingITEM: TIntegerField;
    cdsLote_TingID_MATERIAL: TIntegerField;
    cdsLote_TingID_COR: TIntegerField;
    cdsLote_TingQTD: TFloatField;
    sdsLote_TingUNIDADE: TStringField;
    cdsLote_TingUNIDADE: TStringField;
    qParametros_Ped: TSQLQuery;
    qParametros_PedUSA_NUM_TALAO: TStringField;
    qParametros_LoteID_COR_CRU: TIntegerField;
    sdsLote_TingQTD_ORIGINAL: TFloatField;
    cdsLote_TingQTD_ORIGINAL: TFloatField;
    sdsTingimento: TSQLDataSet;
    dspTingimento: TDataSetProvider;
    cdsTingimento: TClientDataSet;
    cdsTingimentoNUM_ORDEM: TIntegerField;
    cdsTingimentoITEM: TIntegerField;
    cdsTingimentoID_MATERIAL: TIntegerField;
    cdsTingimentoID_COR: TIntegerField;
    cdsTingimentoQTD: TFloatField;
    cdsTingimentoNOME_MATERIAL: TStringField;
    cdsTingimentoNOME_COR: TStringField;
    cdsTingimentoUNIDADE: TStringField;
    cdsTingimentoQTD_ESTOQUE: TFMTBCDField;
    dsTingimento: TDataSource;
    frxReport1: TfrxReport;
    frxBarCodeObject1: TfrxBarCodeObject;
    frxPDFExport1: TfrxPDFExport;
    frxMailExport1: TfrxMailExport;
    frxRichObject1: TfrxRichObject;
    frxTingimento: TfrxDBDataset;
    cdsConsumoID_MATERIAL_CRU: TIntegerField;
    mMaterialID_Material_Cru: TIntegerField;
    sdsLote_TingCRU: TStringField;
    cdsLote_TingCRU: TStringField;
    cdsTingimentoCRU: TStringField;
    cdsEstoque_SemiNOME_MATERIAL: TStringField;
    cdsEstoque_SemiREF_MATERIAL: TStringField;
    qParametros_Geral: TSQLQuery;
    qParametros_GeralEMPRESA_CALCADOS: TStringField;
    sdsAtelier: TSQLDataSet;
    dspAtelier: TDataSetProvider;
    cdsAtelier: TClientDataSet;
    cdsAtelierCODIGO: TIntegerField;
    cdsAtelierNOME: TStringField;
    cdsAtelierCNPJ_CPF: TStringField;
    dsAtelier: TDataSource;
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
    mAuxLoteEncerado: TStringField;
    qProcesso_Grupo_ItemENCERADO: TStringField;
    mAuxLote_PedEncerado: TStringField;
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
    qImpressao: TSQLQuery;
    qImpressaoNUM_ORDEM: TIntegerField;
    qImpressaoCOUNT: TIntegerField;
    mAuxLoteTipo_Geracao: TStringField;
    sdsLoteNUM_REMESSA: TStringField;
    cdsLoteNUM_REMESSA: TStringField;
    cdsConsulta_LoteNUM_REMESSA: TStringField;
    mLoteNum_Remessa: TStringField;
    qProcesso: TSQLQuery;
    qProcessoID: TIntegerField;
    qProcessoITEM: TIntegerField;
    qProcessoID_PROCESSO: TIntegerField;
    qProcessoID_SETOR: TIntegerField;
    qProcessoQTD: TFloatField;
    qProcessoUN: TStringField;
    qProcessoVLR_UNIT: TFloatField;
    qProcessoVLR_TOTAL: TFloatField;
    qProcessoOBS: TStringField;
    sdsConsulta_Lote_Proc: TSQLDataSet;
    dspConsulta_Lote_Proc: TDataSetProvider;
    cdsConsulta_Lote_Proc: TClientDataSet;
    dsConsulta_Lote_Proc: TDataSource;
    cdsConsulta_Lote_ProcDTEMISSAO: TDateField;
    cdsConsulta_Lote_ProcNUM_LOTE: TIntegerField;
    cdsConsulta_Lote_ProcFILIAL: TIntegerField;
    cdsConsulta_Lote_ProcHREMISSAO: TTimeField;
    cdsConsulta_Lote_ProcDTENTREGA: TDateField;
    cdsConsulta_Lote_ProcNUM_ORDEM: TIntegerField;
    cdsConsulta_Lote_ProcID: TIntegerField;
    cdsConsulta_Lote_ProcID_PRODUTO: TIntegerField;
    cdsConsulta_Lote_ProcID_COMBINACAO: TIntegerField;
    cdsConsulta_Lote_ProcREFERENCIA: TStringField;
    cdsConsulta_Lote_ProcNOME_PRODUTO: TStringField;
    cdsConsulta_Lote_ProcUNIDADE: TStringField;
    cdsConsulta_Lote_ProcNOME_FILIAL: TStringField;
    cdsConsulta_Lote_ProcNOME_COMBINACAO: TStringField;
    cdsConsulta_Lote_ProcOBS_PED: TStringField;
    cdsConsulta_Lote_ProcNOME_CLIENTE: TStringField;
    cdsConsulta_Lote_ProcID_COR_PROD: TIntegerField;
    cdsConsulta_Lote_ProcUNIDADE_TALAO: TStringField;
    cdsConsulta_Lote_ProcID_PROCESSO: TIntegerField;
    cdsConsulta_Lote_ProcDTENTRADA: TDateField;
    cdsConsulta_Lote_ProcHRENTRADA: TTimeField;
    cdsConsulta_Lote_ProcDTBAIXA: TDateField;
    cdsConsulta_Lote_ProcHRBAIXA: TTimeField;
    cdsConsulta_Lote_ProcQTD: TFloatField;
    cdsConsulta_Lote_ProcQTD_PRODUZIDO: TFloatField;
    cdsConsulta_Lote_ProcNOME_PROCESSO: TStringField;
    sdsExc_Baixa_Processo: TSQLDataSet;
    dspExc_Baixa_Processo: TDataSetProvider;
    cdsExc_Baixa_Processo: TClientDataSet;
    dsExc_Baixa_Processo: TDataSource;
    sdsExc_Baixa_ProcessoID: TIntegerField;
    sdsExc_Baixa_ProcessoITEM: TIntegerField;
    sdsExc_Baixa_ProcessoID_PROCESSO: TIntegerField;
    sdsExc_Baixa_ProcessoID_LOTE: TIntegerField;
    sdsExc_Baixa_ProcessoID_PEDIDO: TIntegerField;
    sdsExc_Baixa_ProcessoITEM_PEDIDO: TIntegerField;
    sdsExc_Baixa_ProcessoDTENTRADA: TDateField;
    sdsExc_Baixa_ProcessoHRENTRADA: TTimeField;
    sdsExc_Baixa_ProcessoDTBAIXA: TDateField;
    sdsExc_Baixa_ProcessoHRBAIXA: TTimeField;
    sdsExc_Baixa_ProcessoQTD: TFloatField;
    sdsExc_Baixa_ProcessoQTD_PRODUZIDO: TFloatField;
    sdsExc_Baixa_ProcessoNUM_ORDEM: TIntegerField;
    sdsExc_Baixa_ProcessoTIPO: TStringField;
    cdsExc_Baixa_ProcessoID: TIntegerField;
    cdsExc_Baixa_ProcessoITEM: TIntegerField;
    cdsExc_Baixa_ProcessoID_PROCESSO: TIntegerField;
    cdsExc_Baixa_ProcessoID_LOTE: TIntegerField;
    cdsExc_Baixa_ProcessoID_PEDIDO: TIntegerField;
    cdsExc_Baixa_ProcessoITEM_PEDIDO: TIntegerField;
    cdsExc_Baixa_ProcessoDTENTRADA: TDateField;
    cdsExc_Baixa_ProcessoHRENTRADA: TTimeField;
    cdsExc_Baixa_ProcessoDTBAIXA: TDateField;
    cdsExc_Baixa_ProcessoHRBAIXA: TTimeField;
    cdsExc_Baixa_ProcessoQTD: TFloatField;
    cdsExc_Baixa_ProcessoQTD_PRODUZIDO: TFloatField;
    cdsExc_Baixa_ProcessoNUM_ORDEM: TIntegerField;
    cdsExc_Baixa_ProcessoTIPO: TStringField;
    sdsLoteITEM_PEDIDO: TIntegerField;
    cdsLoteITEM_PEDIDO: TIntegerField;
    sdsLoteBAIXADO: TStringField;
    cdsLoteBAIXADO: TStringField;
    qParametros_LoteUSA_LOTE_PEDIDO: TStringField;
    sdsBaixa_ProcessoQTD_PENDENTE: TFloatField;
    cdsBaixa_ProcessoQTD_PENDENTE: TFloatField;
    cdsConsulta_Lote_ProcSELECIONADO: TStringField;
    cdsConsulta_Lote_ProcNUM_PEDIDO: TIntegerField;
    cdsConsulta_Lote_ProcPEDIDO_CLIENTE: TStringField;
    cdsConsulta_Lote_ProcFANTASIA_CLIENTE: TStringField;
    cdsConsulta_Lote_ProcQTD_NAOFATURADO: TFloatField;
    sdsBaixa_ProcessoPARCIAL: TStringField;
    cdsBaixa_ProcessoPARCIAL: TStringField;
    sdsBaixa_ProcessoQTD_LIBERADA: TFloatField;
    cdsBaixa_ProcessoQTD_LIBERADA: TFloatField;
    sdsBaixa_ProcessoAJUSTE: TStringField;
    cdsBaixa_ProcessoAJUSTE: TStringField;
    qBaixaProcesso: TSQLQuery;
    qBaixaProcessoID: TIntegerField;
    qBaixaProcessoITEM: TIntegerField;
    qBaixaProcessoID_PROCESSO: TIntegerField;
    qBaixaProcessoID_LOTE: TIntegerField;
    qBaixaProcessoID_PEDIDO: TIntegerField;
    qBaixaProcessoITEM_PEDIDO: TIntegerField;
    qBaixaProcessoDTENTRADA: TDateField;
    qBaixaProcessoHRENTRADA: TTimeField;
    qBaixaProcessoDTBAIXA: TDateField;
    qBaixaProcessoHRBAIXA: TTimeField;
    qBaixaProcessoQTD: TFloatField;
    qBaixaProcessoQTD_PRODUZIDO: TFloatField;
    qBaixaProcessoNUM_ORDEM: TIntegerField;
    qBaixaProcessoTIPO: TStringField;
    qBaixaProcessoTOTAL_HORAS: TFloatField;
    qBaixaProcessoQTD_PENDENTE: TFloatField;
    qBaixaProcessoSELECIONADO: TStringField;
    qBaixaProcessoPARCIAL: TStringField;
    qBaixaProcessoITEM_ORIGINAL: TIntegerField;
    qBaixaProcessoQTD_LIBERADA: TFloatField;
    qBaixaProcessoAJUSTE: TStringField;
    sdsProcesso: TSQLDataSet;
    dspProcesso: TDataSetProvider;
    cdsProcesso: TClientDataSet;
    dsProcesso: TDataSource;
    cdsProcessoID: TIntegerField;
    cdsProcessoNOME: TStringField;
    qLoteVer: TSQLQuery;
    qLoteVerID: TIntegerField;
    qLoteVerNUM_LOTE: TIntegerField;
    qLoteVerQTD_TALOES: TIntegerField;
    qLoteVerDTEMISSAO: TDateField;
    qLoteVerHREMISSAO: TTimeField;
    qLoteVerFILIAL: TIntegerField;
    qLoteVerOBS: TMemoField;
    qLoteVerID_PRODUTO: TIntegerField;
    qLoteVerDTENTREGA: TDateField;
    qLoteVerQTD: TFloatField;
    qLoteVerNUM_ORDEM: TIntegerField;
    qLoteVerCARIMBO: TStringField;
    qLoteVerID_COMBINACAO: TIntegerField;
    qLoteVerNOME: TStringField;
    qLoteVerNUM_PEDIDO: TIntegerField;
    qLoteVerTALAO_AUX_GERADO: TStringField;
    qLoteVerDTENTRADA: TDateField;
    qLoteVerHRENTRADA: TTimeField;
    qLoteVerDTBAIXA: TDateField;
    qLoteVerHRBAIXA: TTimeField;
    qLoteVerID_PEDIDO: TIntegerField;
    qLoteVerTIPO_LOTE: TStringField;
    qLoteVerREFERENCIA: TStringField;
    qLoteVerUNIDADE: TStringField;
    qLoteVerQTD_PENDENTE: TFloatField;
    qLoteVerQTD_PRODUZIDO: TFloatField;
    qLoteVerITEM_ORDEM: TIntegerField;
    qLoteVerITEM_ORDEM_TOTAL: TIntegerField;
    qLoteVerOBS_PED: TStringField;
    qLoteVerID_CLIENTE: TIntegerField;
    qLoteVerIMPRESSO: TStringField;
    qLoteVerQTD_ORIGINAL: TFloatField;
    qLoteVerQTD_PARES: TFloatField;
    qLoteVerID_PROCESSO_GRUPO: TIntegerField;
    qLoteVerBAIXADO: TStringField;
    qLoteVerCOMPLETO: TStringField;
    qLoteVerID_MATERIAL: TIntegerField;
    qLoteVerCONSUMO_MAT: TFloatField;
    qLoteVerID_MATERIAL2: TIntegerField;
    qLoteVerCONSUMO_MAT2: TFloatField;
    qLoteVerID_PRODUTO_PRI: TIntegerField;
    qLoteVerID_COR_MAT: TIntegerField;
    qLoteVerID_COR_MAT2: TIntegerField;
    qLoteVerENCERADO: TStringField;
    qLoteVerNUM_REMESSA: TStringField;
    qLoteVerSELECIONADO: TStringField;
    qLoteVerITEM_PEDIDO: TIntegerField;
    cdsProcessoTIPO: TStringField;
    mAuxLoteQtd_Estoque: TFloatField;
    mAuxLoteUsa_Estoque: TStringField;
    mAuxLoteQtd_Estoque_Usa: TFloatField;
    mAuxLoteNum_Lote_Controle: TStringField;
    mAuxLotePossui_Lote_Controle: TStringField;
    sdsSaldoEst: TSQLDataSet;
    dspSaldoEst: TDataSetProvider;
    cdsSaldoEst: TClientDataSet;
    dsSaldoEst: TDataSource;
    cdsSaldoEstQTD: TFloatField;
    cdsSaldoEstTIPO: TStringField;
    cdsSaldoEstNUM_LOTE_CONTROLE: TStringField;
    sdsLoteID_MOVESTOQUE_RES: TIntegerField;
    sdsLoteQTD_ESTOQUE_USADA: TFloatField;
    cdsLoteID_MOVESTOQUE_RES: TIntegerField;
    cdsLoteQTD_ESTOQUE_USADA: TFloatField;
    qParametros_Est: TSQLQuery;
    qParametros_EstUSA_RESERVA_PROD: TStringField;
    qParametros_LoteID_PROCESSO_EST: TIntegerField;
    sdsLoteNUM_LOTE_CONTROLE: TStringField;
    cdsLoteNUM_LOTE_CONTROLE: TStringField;
    cdsSaldoEstQTD_LOTE: TFloatField;
    cdsSaldoEstQTD2: TFloatField;
    qParametros_LoteUSA_LOTE_PED_SPROC: TStringField;
    cdsPendenteOBS_LOTE: TMemoField;
    sdsConsulta_Lote_Ped: TSQLDataSet;
    dspConsulta_Lote_Ped: TDataSetProvider;
    cdsConsulta_Lote_Ped: TClientDataSet;
    cdsConsulta_Lote_PedDTEMISSAO: TDateField;
    cdsConsulta_Lote_PedNUM_LOTE: TIntegerField;
    cdsConsulta_Lote_PedFILIAL: TIntegerField;
    cdsConsulta_Lote_PedHREMISSAO: TTimeField;
    cdsConsulta_Lote_PedDTENTREGA: TDateField;
    cdsConsulta_Lote_PedNUM_ORDEM: TIntegerField;
    cdsConsulta_Lote_PedID: TIntegerField;
    cdsConsulta_Lote_PedID_PRODUTO: TIntegerField;
    cdsConsulta_Lote_PedID_COMBINACAO: TIntegerField;
    cdsConsulta_Lote_PedREFERENCIA: TStringField;
    cdsConsulta_Lote_PedUNIDADE: TStringField;
    cdsConsulta_Lote_PedNOME_FILIAL: TStringField;
    cdsConsulta_Lote_PedNOME_PRODUTO: TStringField;
    cdsConsulta_Lote_PedNOME_COMBINACAO: TStringField;
    cdsConsulta_Lote_PedOBS_PED: TStringField;
    cdsConsulta_Lote_PedOBS: TMemoField;
    cdsConsulta_Lote_PedNOME_CLIENTE: TStringField;
    cdsConsulta_Lote_PedUNIDADE_TALAO: TStringField;
    cdsConsulta_Lote_PedFANTASIA_CLIENTE: TStringField;
    cdsConsulta_Lote_PedQTD_NAOFATURADO: TFloatField;
    cdsConsulta_Lote_PedQTD: TFloatField;
    cdsConsulta_Lote_PedDTENTRADA: TDateField;
    cdsConsulta_Lote_PedDTBAIXA: TDateField;
    cdsConsulta_Lote_PedHRENTRADA: TTimeField;
    cdsConsulta_Lote_PedHRBAIXA: TTimeField;
    dsConsulta_Lote_Ped: TDataSource;
    sdsLoteNOME_PRODUTO: TStringField;
    cdsLoteNOME_PRODUTO: TStringField;
    qParametros_LoteID_PROCESSO_SEMI_EST: TIntegerField;
    sdsLoteTIPO_LOTE_ESTOQUE: TStringField;
    cdsLoteTIPO_LOTE_ESTOQUE: TStringField;
    mAuxLoteQtd_Minimo: TFloatField;
    qProdQtdQTD_ESTOQUE_MIN: TFloatField;
    qEstSemi: TSQLQuery;
    qUltBaixaParcial: TSQLQuery;
    qUltBaixaParcialQTD: TFloatField;
    sdsBaixa_ProcessoRETRABALHO: TStringField;
    cdsBaixa_ProcessoRETRABALHO: TStringField;
    cdsProdutoMETROS_CARGA: TFloatField;
    mAuxLoteMetros_Carga: TFloatField;
    mAuxLoteCarga: TFloatField;
    cdsProdutoTIPO_PRODUCAO: TStringField;
    sdsLoteCARGA: TFloatField;
    cdsLoteCARGA: TFloatField;
    cdsConsumoTIPO_PRODUCAO: TStringField;
    mMaterialTipo_Producao: TStringField;
    sdsLote_MatTIPO_PRODUCAO: TStringField;
    cdsLote_MatTIPO_PRODUCAO: TStringField;
    qEstSemiQTD: TFloatField;
    qEstSemiQTD_RESERVA: TFloatField;
    cdsPendenteTIPO_ALGODAO: TStringField;
    qParametros_LoteRESERVA_EST_LOTE: TStringField;
    sdsLoteID_MOVESTOQUE: TIntegerField;
    cdsLoteID_MOVESTOQUE: TIntegerField;
    cdsPendenteTIPO_ALGODAO_PROD: TStringField;
    cdsConsulta_Lote_PedNUM_PEDIDO: TIntegerField;
    qParametros_LoteGERAR_MAT_POR_LOTE: TStringField;
    sdsLote_MatNUM_LOTE: TIntegerField;
    sdsLote_MatID_LOTE: TIntegerField;
    cdsLote_MatNUM_LOTE: TIntegerField;
    cdsLote_MatID_LOTE: TIntegerField;
    sdsConsLote_Mat_Prod: TSQLDataSet;
    dspConsLote_Mat_Prod: TDataSetProvider;
    cdsConsLote_Mat_Prod: TClientDataSet;
    dsConsLote_Mat_Prod: TDataSource;
    frxConsLote_Mat_SL: TfrxDBDataset;
    sdsLote_Mat_Prod: TSQLDataSet;
    dspLote_Mat_Prod: TDataSetProvider;
    cdsLote_Mat_Prod: TClientDataSet;
    dsLote_Mat_Prod: TDataSource;
    sdsLote_Mat_ProdID: TIntegerField;
    sdsLote_Mat_ProdITEM: TIntegerField;
    sdsLote_Mat_ProdNUM_ORDEM: TIntegerField;
    sdsLote_Mat_ProdID_COR_PRODUTO: TIntegerField;
    sdsLote_Mat_ProdID_MATERIAL: TIntegerField;
    sdsLote_Mat_ProdID_COR_MATERIAL: TIntegerField;
    sdsLote_Mat_ProdQTD_CONSUMO: TFloatField;
    sdsLote_Mat_ProdQTD_PRODUTO: TFloatField;
    sdsLote_Mat_ProdQTD_PAGO: TFloatField;
    sdsLote_Mat_ProdQTD_RETORNO: TFloatField;
    sdsLote_Mat_ProdQTD_DIFERENCA: TFloatField;
    sdsLote_Mat_ProdQTD_CONES: TIntegerField;
    sdsLote_Mat_ProdDTRETORNO: TDateField;
    sdsLote_Mat_ProdDTPAGO: TDateField;
    cdsLote_Mat_ProdID: TIntegerField;
    cdsLote_Mat_ProdITEM: TIntegerField;
    cdsLote_Mat_ProdNUM_ORDEM: TIntegerField;
    cdsLote_Mat_ProdID_COR_PRODUTO: TIntegerField;
    cdsLote_Mat_ProdID_MATERIAL: TIntegerField;
    cdsLote_Mat_ProdID_COR_MATERIAL: TIntegerField;
    cdsLote_Mat_ProdQTD_CONSUMO: TFloatField;
    cdsLote_Mat_ProdQTD_PRODUTO: TFloatField;
    cdsLote_Mat_ProdQTD_PAGO: TFloatField;
    cdsLote_Mat_ProdQTD_RETORNO: TFloatField;
    cdsLote_Mat_ProdQTD_DIFERENCA: TFloatField;
    cdsLote_Mat_ProdQTD_CONES: TIntegerField;
    cdsLote_Mat_ProdDTRETORNO: TDateField;
    cdsLote_Mat_ProdDTPAGO: TDateField;
    sdsLote_Mat_ProdNUM_LOTE_AUX: TIntegerField;
    cdsLote_Mat_ProdNUM_LOTE_AUX: TIntegerField;
    sdsLote_Mat_ProdREFERENCIA: TStringField;
    cdsLote_Mat_ProdREFERENCIA: TStringField;
    cdsConsLote_Mat_ProdREFERENCIA: TStringField;
    cdsConsLote_Mat_ProdNOME_MATERIAL: TStringField;
    cdsConsLote_Mat_ProdNOME_COR_MAT: TStringField;
    cdsConsLote_Mat_ProdQTD_CONSUMO: TFloatField;
    cdsConsLote_Mat_ProdQTD_PRODUTO: TFloatField;
    cdsConsLote_Mat_ProdNUM_ORDEM: TIntegerField;
    cdsConsLote_Mat_ProdITEM: TIntegerField;
    cdsConsLote_Mat_ProdID_MATERIAL: TIntegerField;
    cdsConsLote_Mat_ProdID_COR_PRODUTO: TIntegerField;
    cdsConsLote_Mat_ProdID_COR_MATERIAL: TIntegerField;
    cdsConsLote_Mat_ProdNOME_COMBINACAO: TStringField;
    cdsConsLote_Mat_ProdCODBARRAS: TStringField;
    cdsConsLote_Mat_ProdDTRETORNO: TDateField;
    cdsConsLote_Mat_ProdDTPAGO: TDateField;
    cdsConsLote_Mat_ProdQTD_PAGO: TFloatField;
    cdsConsLote_Mat_ProdQTD_RETORNO: TFloatField;
    cdsConsLote_Mat_ProdQTD_DIFERENCA: TFloatField;
    cdsConsLote_Mat_ProdQTD_CONES: TIntegerField;
    mAuxEst: TClientDataSet;
    mAuxEstID_Produto: TIntegerField;
    mAuxEstID_Cor: TIntegerField;
    mAuxEstNum_Lote_Controle: TStringField;
    mAuxEstQtd: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dspLoteUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
    procedure cdsTalao_AuxBeforePost(DataSet: TDataSet);
    procedure cdsLoteNewRecord(DataSet: TDataSet);
    procedure cdsLote_MatNewRecord(DataSet: TDataSet);
    procedure mMaterialBeforePost(DataSet: TDataSet);
    procedure cdsLote_TingNewRecord(DataSet: TDataSet);
    procedure cdsBaixa_ProcessoNewRecord(DataSet: TDataSet);
    procedure mAuxLoteNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    procedure DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);

  public
    { Public declarations }
    vMsgErro: String;
    ctCommand: String;
    ctOrdem_Prod: String;
    ctConsulta_Lote: String;
    ctConsulta_Lote_SL : String;
    ctConsulta_Lote_Proc : String;
    ctConsulta_Lote_Ped : String;
    ctPedido_PorTalao: String;
    ctConsulta_Talao_Aux: String;
    ctProduto_Comb: String;
    ctPendente: String;
    ctPendente_Ped: String;
    ctPedido_Ord: String;
    ctTingimento : String;
    ctPedido_Calc : String;
    ctBaixa_Processo : String;
    ctExcBaixa_Processo : String;
    ctConsLote_Mat_Prod : String;
    vAltura_Etiq_Rot: Integer;
    vGerado : Boolean;
    vTalao_Loc :Integer;
    ctVerificaGrupo_Proc : String;
    ctSaldoEst : String;

    procedure prc_Localizar(ID: Integer);
    procedure prc_Inserir;
    procedure prc_Excluir;
    procedure prc_Excluir_Baixa_Lote(ID_Lote : Integer);

    procedure prc_Gravar_mLote(Tipo: String ; ImprimirPor : String ; Qtd : Real); //ImprimirPor   L=Por Lote  T=Tamanho   A=Acumulado

    procedure prc_Inserir_Talao;
    function fnc_Buscar_NumPedido(NumLote: Integer): String;
    function fnc_Somar_Consumo: Real;
    function fnc_Somar_Consumo_Talao: Real;

    procedure prc_Abrir_Lote_Mat(Num_Ordem: Integer);
    procedure prc_Gravar_Lote_Mat;

    procedure prc_Abrir_Lote_Mat_Prod(Num_Ordem: Integer);

    procedure prc_Abrir_Lote_Ting(Num_Ordem: Integer);
    procedure prc_Gravar_Lote_Ting(Primeira :Integer = 1);

    procedure prc_Abrir_Baixa_Processo(Num_Ordem, ID_Lote, ID_Baixa, Item_Baixa : Integer);

    procedure prc_SaldoEst(Filial, ID_Produto, ID_Cor : Integer ; Num_Lote_Controle, Tipo : String);

    procedure prc_Calcula_Carga;

  end;

var
  DMCadLote: TDMCadLote;

implementation

uses DmdDatabase, LogProvider, uUtilPadrao, Math, StrUtils;

{$R *.dfm}

{ TDMCadLote}

procedure TDMCadLote.prc_Inserir;
var
  vAux: Integer;
begin
  if not cdsLote.Active then
    prc_Localizar(-1);
  vAux := dmDatabase.ProximaSequencia('LOTE',0);

  cdsLote.Insert;
  cdsLoteID.AsInteger := vAux;
end;

procedure TDMCadLote.prc_Excluir;
begin
  if not(cdsLote.Active) or (cdsLote.IsEmpty) then
    exit;
  cdsLote_Ped.First;
  while not cdsLote_Ped.Eof do
    cdsLote_Ped.Delete;
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

procedure TDMCadLote.prc_Localizar(ID: Integer); //-1 é para inclusão
begin
  cdsLote.Close;
  sdsLote.CommandText := ctCommand;
  if ID <> 0 then
    sdsLote.CommandText := sdsLote.CommandText
                         + ' WHERE ID = ' + IntToStr(ID);
  cdsLote.Open;

end;

procedure TDMCadLote.DataModuleCreate(Sender: TObject);
var
  i, x: Integer;
  vIndices: string;
  aIndices: array of string;
begin
  ctCommand            := sdsLote.CommandText;
  ctConsulta_Lote      := sdsConsulta_Lote.CommandText;
  ctConsulta_Lote_SL   := sdsConsulta_Lote_SL.CommandText;
  ctConsulta_Lote_Proc := sdsConsulta_Lote_Proc.CommandText;
  ctConsulta_Lote_Ped  := sdsConsulta_Lote_Ped.CommandText;
  ctPendente           := sdsPendente.CommandText;
  ctPendente_Ped       := sdsPendente_Ped.CommandText;
  ctTingimento         := sdsTingimento.CommandText;
  ctPedido_Calc        := sdsPedido_Calc.CommandText;
  ctVerificaGrupo_Proc := qVerificaGrupo_Proc.SQL.Text;
  ctBaixa_Processo     := sdsBaixa_Processo.CommandText;
  ctExcBaixa_Processo  := sdsExc_Baixa_Processo.CommandText;
  ctSaldoEst           := sdsSaldoEst.CommandText;
  ctConsLote_Mat_Prod  := sdsConsLote_Mat_Prod.CommandText;
  cdsProduto.Close;
  cdsProduto.Open;
  qParametros.Open;
  qParametros_Lote.Open;
  qParametros_Ped.Open;
  qParametros_Est.Open;
  cdsProcesso.Open;

  if qParametros_LoteUSA_LOTE_PEDIDO.AsString <> 'S' then
    ctPendente := ctPendente + '   AND NOT EXISTS( SELECT 1 FROM LOTE_PED WHERE LOTE_PED.ID_PEDIDO =  PI.ID  AND LOTE_PED.ITEM_PEDIDO = PI.ITEM) '
  else
    ctPendente := ctPendente + '   AND NOT EXISTS( SELECT 1 FROM LOTE WHERE LOTE.ID_PEDIDO =  PI.ID  AND LOTE.ITEM_PEDIDO = PI.ITEM) ';

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

procedure TDMCadLote.prc_Inserir_Talao;
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

procedure TDMCadLote.dspLoteUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  dmDatabase.prc_UpdateError(DataSet.Name,UpdateKind,E);
end;

function TDMCadLote.fnc_Buscar_NumPedido(NumLote: Integer): String;
var
  vTexto: String;
begin
  {cdsBusca_Ped.Close;
  sdsBusca_Ped.ParamByName('ID').AsInteger := NumLote;
  cdsBusca_Ped.Open;
  //cdsBusca_Ped.IndexFieldNames := 'NUM_PEDIDO';
  cdsBusca_Ped.IndexFieldNames := 'PEDIDO_CLIENTE';

  vTexto:= 'Pedido(s): ';
  cdsBusca_Ped.First;
  while not cdsBusca_Ped.Eof do
  begin
    //07/01/2014 foi trocado para imprimir o número do pedido do cliente (OC)
    //vTexto := vTexto + '(' + cdsBusca_PedNUM_PEDIDO.AsString + ')';
    vTexto := vTexto + '(' + cdsBusca_PedPEDIDO_CLIENTE.AsString + ')';
    cdsBusca_Ped.Next;
  end;
  Result := vTexto;}
end;

procedure TDMCadLote.prc_Gravar_mLote(Tipo: String ; ImprimirPor : String ; Qtd : Real); //ImprimirPor   L=Por Lote  T=Tamanho   A=Acumulado
var
  vTalaoAux: Integer;
  vID_CorAux: Integer;
  vExiste : Boolean;
  vTamAux : String;
  vQtdAux : Real;
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
      mLoteUnidade.AsString        := cdsConsulta_LoteUNIDADE_TALAO.AsString
    else
      mLoteUnidade.AsString        := cdsConsulta_LoteUNIDADE.AsString;
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
    mLoteNome_Cliente.AsString   := cdsConsulta_LoteNOME_CLIENTE.AsString;
  end;
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
    begin
      prc_Gravar_mLote(Tipo,ImprimirPor,Qtd);
    end;
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

function TDMCadLote.fnc_Somar_Consumo: Real;
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

function TDMCadLote.fnc_Somar_Consumo_Talao: Real;
begin
  qProduto_Consumo_Tam.Close;
  qProduto_Consumo_Tam.ParamByName('ID').AsInteger     := cdsProduto_ConsumoID.AsInteger;
  qProduto_Consumo_Tam.ParamByName('ITEM').AsInteger   := cdsProduto_ConsumoITEM.AsInteger;
  qProduto_Consumo_Tam.ParamByName('TAMANHO').AsString := mLoteTamanho.AsString;
  qProduto_Consumo_Tam.Open;
  Result := StrToFloat(FormatFloat('0.00000',qProduto_Consumo_TamQTD_CONSUMO.AsFloat * mLoteQtd.AsFloat));
end;

procedure TDMCadLote.cdsTalao_AuxBeforePost(DataSet: TDataSet);
begin
  if cdsTalao_AuxDTRETORNO.AsDateTime <= 10 then
  begin
    cdsTalao_AuxDTRETORNO.Clear;
    cdsTalao_AuxHRRETORNO.Clear;
  end;
  if cdsTalao_AuxDTSAIDA.AsDateTime <= 10 then
  begin
    cdsTalao_AuxDTSAIDA.Clear;
    cdsTalao_AuxHRSAIDA.Clear;
  end;
end;

procedure TDMCadLote.cdsLoteNewRecord(DataSet: TDataSet);
begin
  cdsLoteTALAO_AUX_GERADO.AsString := 'N';
  cdsLoteTIPO_LOTE.AsString        := 'N';
  cdsLoteIMPRESSO.AsString         := 'N';
  cdsLoteQTD.AsFloat               := 0;
  cdsLoteENCERADO.AsString         := 'N';
  cdsLoteBAIXADO.AsString          := 'N';
end;

procedure TDMCadLote.DoLogAdditionalValues(ATableName: string;
  var AValues: TArrayLogData; var UserName: string);
begin
  UserName := vUsuario;
end;

procedure TDMCadLote.prc_Abrir_Lote_Mat(Num_Ordem: Integer);
begin
  cdsLote_Mat.Close;
  sdsLote_Mat.ParamByName('NUM_ORDEM').AsInteger := Num_Ordem;
  cdsLote_Mat.Open;
end;

procedure TDMCadLote.prc_Gravar_Lote_Mat;
var
  vItem_Mat : Integer;
  vID_Cor : Integer;
  vExiste : Boolean;
begin
  vExiste := False;
  if mMaterialTingimento.AsString = 'S' then
  begin
    vID_Cor := 0;
    if cdsLote_Mat.Locate('ID_MATERIAL;ID_COR;TIPO_PRODUCAO',VarArrayOf([mMaterialID_Material.AsInteger,
                          vID_Cor,mMaterialTipo_Producao.AsString]),[locaseinsensitive]) then
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
    cdsLote_MatTIPO_PRODUCAO.AsString  := mMaterialTipo_Producao.AsString;
    cdsLote_MatCARIMBOAUX.AsString     := '';
    cdsLote_MatCARIMBO.AsString        := '';
    cdsLote_MatTAMANHO.AsString        := '';
    cdsLote_MatQTD_PRODUTO.AsFloat     := mMaterialQtd_Produto.AsFloat;
    cdsLote_MatID_FORNECEDOR.AsInteger := mMaterialID_Fornecedor.AsInteger;
    cdsLote_MatQtd_OC_Fat.AsFloat      := 0;
    cdsLote_MatGerado.AsString         := 'N';
    cdsLote_MatTINGIMENTO.AsString     := mMaterialTingimento.AsString;
    cdsLote_MatQTD_CONSUMO.AsFloat     := 0;

  end;
  cdsLote_MatQTD_CONSUMO.AsFloat := cdsLote_MatQTD_CONSUMO.AsFloat +  mMaterialQtd_Consumo.AsFloat;
  cdsLote_Mat.Post;

  if (cdsLote_MatTINGIMENTO.AsString = 'S') then
  begin
    //if cdsLote_Mat.Locate('ID_MATERIAL;ID_COR',VarArrayOf([mMaterialID_Material.AsInteger,qParametros_LoteID_COR_CRU.AsInteger]),[locaseinsensitive]) then
    if cdsLote_Mat.Locate('ID_MATERIAL;ID_COR;TIPO_PRODUCAO',VarArrayOf([mMaterialID_Material_Cru.AsInteger,
                          0,mMaterialTipo_Producao.AsString]),[locaseinsensitive]) then
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
      cdsLote_MatTIPO_PRODUCAO.AsString  := mMaterialTipo_Producao.AsString;
      cdsLote_MatCARIMBOAUX.AsString     := '';
      cdsLote_MatCARIMBO.AsString        := '';
      cdsLote_MatTAMANHO.AsString        := '';
      cdsLote_MatQTD_PRODUTO.AsFloat     := mMaterialQtd_Produto.AsFloat;
      cdsLote_MatID_FORNECEDOR.AsInteger := mMaterialID_Fornecedor.AsInteger;
      cdsLote_MatQtd_OC_Fat.AsFloat      := 0;
      cdsLote_MatGerado.AsString         := 'N';
      cdsLote_MatTINGIMENTO.AsString     := 'N';
      cdsLote_MatQTD_CONSUMO.AsFloat     := 0;
    end;
    cdsLote_MatQTD_CONSUMO.AsFloat := cdsLote_MatQTD_CONSUMO.AsFloat +  mMaterialQtd_Consumo.AsFloat;
    cdsLote_Mat.Post;
  end;

end;

procedure TDMCadLote.cdsLote_MatNewRecord(DataSet: TDataSet);
begin
  cdsLote_MatTINGIMENTO.AsString        := 'N';
  cdsLote_MatTINGIMENTO_GERADO.AsString := 'N';
end;

procedure TDMCadLote.mMaterialBeforePost(DataSet: TDataSet);
begin
  if trim(mMaterialTingimento.AsString) = '' then
    mMaterialTingimento.AsString := 'N';
end;

procedure TDMCadLote.prc_Abrir_Lote_Ting(Num_Ordem: Integer);
begin
  cdsLote_Ting.Close;
  sdsLote_Ting.ParamByName('NUM_ORDEM').AsInteger := Num_Ordem;
  cdsLote_Ting.Open;
end;

procedure TDMCadLote.prc_Gravar_Lote_Ting(Primeira :Integer = 1);
var
  vItemAux : Integer;
  vIDMat, vIDCor : Integer;
  vQtdConsumo : Real;
  vInserir : Boolean;
begin
  vInserir := True;

  if Primeira > 1 then
  begin
    if cdsLote_Ting.Locate('Num_Ordem;ID_Material;ID_COR;Cru',VarArrayOf([cdsLoteNUM_ORDEM.AsInteger,mMaterialID_Material_Cru.AsInteger,0,'S']),[locaseinsensitive]) then
      vInserir := False;
  end;

  if vInserir then
  begin
    cdsLote_Ting.Last;
    vItemAux := cdsLote_TingITEM.AsInteger;
    cdsLote_Ting.Insert;
    cdsLote_TingNUM_ORDEM.AsInteger   := cdsLoteNUM_ORDEM.AsInteger;
    cdsLote_TingITEM.AsInteger        := vItemAux + 1;
    if Primeira > 1 then
    begin
      cdsLote_TingID_MATERIAL.AsInteger := mMaterialID_Material_Cru.AsInteger;
      cdsLote_TingID_COR.AsInteger      := 0;
      cdsLote_TingCRU.AsString          := 'S';
    end
    else
    begin
      cdsLote_TingID_MATERIAL.AsInteger := mMaterialID_Material.AsInteger;
      cdsLote_TingID_COR.AsInteger      := mMaterialID_Cor.AsInteger;
      cdsLote_TingCRU.AsString          := 'N';
    end;
    cdsLote_TingQTD.AsInteger := 0;
    cdsLote_TingUNIDADE.AsString      := mMaterialUnidade.AsString;
  end
  else
    cdsLote_Ting.Edit;
  cdsLote_TingQTD.AsFloat           := cdsLote_TingQTD.AsFloat + mMaterialQtd_Consumo.AsFloat;
  cdsLote_TingQTD_ORIGINAL.AsFloat  := cdsLote_TingQTD_ORIGINAL.AsFloat + mMaterialQtd_Consumo.AsFloat;
  cdsLote_Ting.Post;

  if (Primeira = 1) and (mMaterialID_Material_Cru.AsInteger > 0) then
  begin
    Primeira := Primeira + 1;
    prc_Gravar_Lote_Ting(Primeira);
  end;
end;

procedure TDMCadLote.cdsLote_TingNewRecord(DataSet: TDataSet);
begin
  cdsLote_TingCRU.AsString := 'N';
end;

procedure TDMCadLote.prc_Abrir_Baixa_Processo(Num_Ordem, ID_Lote, ID_Baixa, Item_Baixa : Integer);
begin
  cdsBaixa_Processo.Close;
  sdsBaixa_Processo.CommandText := ctBaixa_Processo;
  if ID_LOTE > 0 then
    sdsBaixa_Processo.CommandText := sdsBaixa_Processo.CommandText + ' AND ID_LOTE = ' + IntToStr(ID_Lote);
  if ID_Baixa > 0 then
  begin
    sdsBaixa_Processo.CommandText := sdsBaixa_Processo.CommandText + ' AND ID = :ID  AND ITEM = :ITEM';
    sdsBaixa_Processo.ParamByName('ID').AsInteger   := ID_Baixa;
    sdsBaixa_Processo.ParamByName('ITEM').AsInteger := Item_Baixa;
  end;
  sdsBaixa_Processo.ParamByName('NUM_ORDEM').AsInteger := Num_Ordem;
  cdsBaixa_Processo.Open;
end;

procedure TDMCadLote.prc_Excluir_Baixa_Lote(ID_Lote: Integer);
begin
  cdsExc_Baixa_Processo.Close;
  sdsExc_Baixa_Processo.ParamByName('ID_LOTE').AsInteger := ID_Lote;
  cdsExc_Baixa_Processo.Open;
end;

procedure TDMCadLote.cdsBaixa_ProcessoNewRecord(DataSet: TDataSet);
begin
  cdsBaixa_ProcessoPARCIAL.AsString      := 'N';
  cdsBaixa_ProcessoQTD_LIBERADA.AsFloat  := 0;
  cdsBaixa_ProcessoQTD.AsFloat           := 0;
  cdsBaixa_ProcessoQTD_PENDENTE.AsFloat  := 0;
  cdsBaixa_ProcessoQTD_PRODUZIDO.AsFloat := 0;
  cdsBaixa_ProcessoAJUSTE.AsString       := 'N';
  cdsBaixa_ProcessoRETRABALHO.AsString   := 'N';
end;

procedure TDMCadLote.mAuxLoteNewRecord(DataSet: TDataSet);
begin
  mAuxLoteUsa_Estoque.AsString          := 'N';
  mAuxLoteQtd_Estoque.AsFloat           := 0;
  mAuxLoteQtd_Estoque_Usa.AsFloat       := 0;
  mAuxLotePossui_Lote_Controle.AsString := 'N';
  mAuxLoteNum_Lote_Controle.AsString    := '';
  mAuxLoteMetros_Carga.AsFloat          := StrToFloat(FormatFloat('0.00',0));
  mAuxLoteCarga.AsFloat                 := StrToFloat(FormatFloat('0.00',0));
end;

procedure TDMCadLote.prc_SaldoEst(Filial, ID_Produto, ID_Cor: Integer;
  Num_Lote_Controle, Tipo: String);
var
  vComandoAux, vComandoAux2: String;
  i : Integer;
begin
  cdsSaldoEst.Close;
  i := PosEx('GROUP',UpperCase(ctSaldoEst),0);
  vComandoAux  := copy(ctSaldoEst,i,Length(ctSaldoEst) - i + 1);
  vComandoAux2 := copy(ctSaldoEst,1,i-1);
  if Filial > 0 then
    vComandoAux2 := vComandoAux2 + ' AND v.FILIAL = ' + IntToStr(Filial);
  if Tipo <> '' then
    vComandoAux2 := vComandoAux2 + ' AND v.TIPO = ' + QuotedStr(Tipo);

  sdsSaldoEst.CommandText := vComandoAux2 + vComandoAux;
  sdsSaldoEst.ParamByName('ID_PRODUTO').AsInteger := ID_Produto;
  sdsSaldoEst.ParamByName('ID_COR').AsInteger     := ID_COR;
  {if id_cor = qParametros_LoteID_COR_CRU.AsInteger then
    sdsSaldoEst.ParamByName('ID_COR2').AsInteger := 0
  else
    sdsSaldoEst.ParamByName('ID_COR2').AsInteger := -1;}
  cdsSaldoEst.Open;
end;

procedure TDMCadLote.prc_Calcula_Carga;
begin
  if cdsProdutoID.AsInteger <> mAuxLoteID_Produto.AsInteger then
    cdsProduto.Locate('ID',mAuxLoteID_Produto.AsInteger,[loCaseInsensitive]);
    
  if (cdsProdutoTIPO_PRODUCAO.AsString = 'T') and (mAuxLoteTipo_Lote.AsString = 'S') then
  begin
    if StrToFloat(FormatFloat('0.000',cdsProdutoMETROS_CARGA.AsFloat)) > 0 then
    begin
      mAuxLoteMetros_Carga.AsFloat := StrToFloat(FormatFloat('0.000',cdsProdutoMETROS_CARGA.AsFloat));
      mAuxLoteCarga.AsFloat        := StrToFloat(FormatFloat('0.00',mAuxLoteQtd.AsFloat / cdsProdutoMETROS_CARGA.AsFloat));
    end;
  end;
end;

procedure TDMCadLote.prc_Abrir_Lote_Mat_Prod(Num_Ordem: Integer);
begin
  cdsLote_Mat_Prod.Close;
  sdsLote_Mat_Prod.ParamByName('NUM_ORDEM').AsInteger := Num_Ordem;
  cdsLote_Mat_Prod.Open;
end;

end.
