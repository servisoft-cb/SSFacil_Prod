unit UDMLoteImp;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, Variants,
  frxClass, frxDBSet, frxRich, frxExportMail, frxExportPDF, frxBarcode, Dialogs;

type
  TDMLoteImp = class(TDataModule)
    frxReport1: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxMailExport1: TfrxMailExport;
    frxRichObject1: TfrxRichObject;
    sdsTalao_SL: TSQLDataSet;
    dspTalao_SL: TDataSetProvider;
    cdsTalao_SL: TClientDataSet;
    dsTalao_SL: TDataSource;
    frxTalao_SL: TfrxDBDataset;
    cdsTalao_SLID: TIntegerField;
    cdsTalao_SLNUM_LOTE: TIntegerField;
    cdsTalao_SLNUM_ORDEM: TIntegerField;
    cdsTalao_SLQTD_LOTE: TFloatField;
    cdsTalao_SLID_PRODUTO: TIntegerField;
    cdsTalao_SLREFERENCIA: TStringField;
    cdsTalao_SLNOME_PRODUTO: TStringField;
    cdsTalao_SLNUM_PEDIDO: TIntegerField;
    cdsTalao_SLUNIDADE: TStringField;
    cdsTalao_SLTIPO_LOTE: TStringField;
    cdsTalao_SLNOME_COMBINACAO: TStringField;
    cdsTalao_SLDTENTREGA: TDateField;
    cdsTalao_SLOBS_PED: TStringField;
    cdsTalao_SLDESCRICAO_TIPO_LOTE: TStringField;
    cdsTalao_SLclCodBarra_Lote: TStringField;
    frxBarCodeObject1: TfrxBarCodeObject;
    cdsTalao_SLITEM_ORDEM: TIntegerField;
    cdsTalao_SLITEM_ORDEM_TOTAL: TIntegerField;
    sdsLote_Processo: TSQLDataSet;
    dspLote_Processo: TDataSetProvider;
    cdsLote_Processo: TClientDataSet;
    dsLote_Processo: TDataSource;
    frxLote_Processo: TfrxDBDataset;
    cdsTalao_SLQTD_PARES: TFloatField;
    cdsLote_ProcessoID: TIntegerField;
    cdsLote_ProcessoITEM: TIntegerField;
    cdsLote_ProcessoID_PROCESSO: TIntegerField;
    cdsLote_ProcessoID_LOTE: TIntegerField;
    cdsLote_ProcessoID_PEDIDO: TIntegerField;
    cdsLote_ProcessoITEM_PEDIDO: TIntegerField;
    cdsLote_ProcessoDTENTRADA: TDateField;
    cdsLote_ProcessoHRENTRADA: TTimeField;
    cdsLote_ProcessoDTBAIXA: TDateField;
    cdsLote_ProcessoHRBAIXA: TTimeField;
    cdsLote_ProcessoQTD: TFloatField;
    cdsLote_ProcessoQTD_PRODUZIDO: TFloatField;
    cdsLote_ProcessoNUM_ORDEM: TIntegerField;
    cdsLote_ProcessoTIPO: TStringField;
    cdsLote_ProcessoNOME_PROCESSO: TStringField;
    mLoteEmProc: TClientDataSet;
    mLoteEmProcID_Processo: TIntegerField;
    mLoteEmProcNome_Processo: TStringField;
    mLoteEmProcDtEntrada: TDateField;
    mLoteEmProcHrEntrada: TTimeField;
    mLoteEmProcNumOrdem_Em_Proc: TIntegerField;
    mLoteEmProcQtd_Em_Proc: TFloatField;
    mLoteEmProcNumLote_Em_Proc: TIntegerField;
    mLoteEmProcQtd_Aguardando: TFloatField;
    mLoteEmProcQtd_Em_Pedido: TFloatField;
    mLoteEmProcReferencia: TStringField;
    mLoteEmProcNome_Produto: TStringField;
    mLoteEmProcNum_Talao: TIntegerField;
    mLoteEmProcTotal_Talao_Aberto: TIntegerField;
    dsmLoteEmProc: TDataSource;
    qLoteEmProc: TSQLQuery;
    qLoteEmProcID: TIntegerField;
    qLoteEmProcNUM_LOTE: TIntegerField;
    qLoteEmProcNUM_ORDEM: TIntegerField;
    qLoteEmProcID_PRODUTO: TIntegerField;
    qLoteEmProcQTD_EM_PROCESSO: TFloatField;
    qLoteEmProcID_PROCESSO: TIntegerField;
    qLoteEmProcREFERENCIA: TStringField;
    qLoteEmProcNOME_PRODUTO: TStringField;
    qLoteEmProcDTENTRADA: TDateField;
    qLoteEmProcHRENTRADA: TTimeField;
    qLoteEmProcNUM_TALAO: TIntegerField;
    sdsConsulta_Lote: TSQLDataSet;
    dspConsulta_Lote: TDataSetProvider;
    cdsConsulta_Lote: TClientDataSet;
    dsConsulta_Lote: TDataSource;
    cdsConsulta_LoteID_BAIXA: TIntegerField;
    cdsConsulta_LoteITEM_BAIXA: TIntegerField;
    cdsConsulta_LoteID_PROCESSO: TIntegerField;
    cdsConsulta_LoteID_LOTE: TIntegerField;
    cdsConsulta_LoteID_PEDIDO: TIntegerField;
    cdsConsulta_LoteITEM_PEDIDO: TIntegerField;
    cdsConsulta_LoteDTENTRADA: TDateField;
    cdsConsulta_LoteHRENTRADA: TTimeField;
    cdsConsulta_LoteDTBAIXA: TDateField;
    cdsConsulta_LoteHRBAIXA: TTimeField;
    cdsConsulta_LoteQTD: TFloatField;
    cdsConsulta_LoteQTD_PRODUZIDO: TFloatField;
    cdsConsulta_LoteNUM_ORDEM: TIntegerField;
    cdsConsulta_LoteTIPO: TStringField;
    cdsConsulta_LoteNOME_PROCESSO: TStringField;
    cdsConsulta_LoteNUM_LOTE: TIntegerField;
    cdsConsulta_LoteNOME_COMBINACAO: TStringField;
    cdsConsulta_LoteDESC_TIPO_BAIXA: TStringField;
    cdsConsulta_LoteREFERENCIA: TStringField;
    cdsConsulta_LoteDTENTREGA: TDateField;
    cdsConsulta_LoteNOME_CLIENTE: TStringField;
    cdsConsulta_LotePEDIDO_CLIENTE: TStringField;
    cdsConsulta_LoteID_CLIENTE: TIntegerField;
    sdsProcesso: TSQLDataSet;
    dspProcesso: TDataSetProvider;
    cdsProcesso: TClientDataSet;
    dsProcesso: TDataSource;
    cdsProcessoID: TIntegerField;
    cdsProcessoNOME: TStringField;
    cdsProcessoLIMITE_POR_TALAO: TStringField;
    cdsProcessoQTD_LIMITE_POR_TALAO: TIntegerField;
    cdsProcessoAGRUPAR_PEDIDOS: TStringField;
    cdsProcessoTIPO: TStringField;
    qCliente: TSQLQuery;
    qClienteCODIGO: TIntegerField;
    qClienteNOME: TStringField;
    qClienteCNPJ_CPF: TStringField;
    cdsConsulta_LoteUNIDADE: TStringField;
    frxConsulta_Lote: TfrxDBDataset;
    cdsTalao_SLID_MATERIAL: TIntegerField;
    cdsTalao_SLNOME_MATERIAL: TStringField;
    cdsTalao_SLREF_MATERIAL: TStringField;
    cdsTalao_SLCONSUMO_MAT: TFloatField;
    cdsTalao_SLID_MATERIAL2: TIntegerField;
    cdsTalao_SLNOME_MATERIAL2: TStringField;
    cdsTalao_SLREF_MATERIAL2: TStringField;
    cdsTalao_SLCONSUMO_MAT2: TFloatField;
    cdsTalao_SLID_COR_MAT: TIntegerField;
    cdsTalao_SLID_COR_MAT2: TIntegerField;
    cdsTalao_SLNOME_COR_MAT: TStringField;
    cdsTalao_SLNOME_COR_MAT2: TStringField;
    cdsTalao_SLID_CLIENTE: TIntegerField;
    cdsTalao_SLNOME_CLIENTE: TStringField;
    cdsConsulta_LoteTOTAL_HORAS: TFloatField;
    sdsTalao_Proc: TSQLDataSet;
    dspTalao_Proc: TDataSetProvider;
    cdsTalao_Proc: TClientDataSet;
    dsTalao_Proc: TDataSource;
    cdsTalao_ProcID: TIntegerField;
    cdsTalao_ProcNUM_LOTE: TIntegerField;
    cdsTalao_ProcNUM_ORDEM: TIntegerField;
    cdsTalao_ProcQTD_LOTE: TFloatField;
    cdsTalao_ProcID_PRODUTO: TIntegerField;
    cdsTalao_ProcREFERENCIA: TStringField;
    cdsTalao_ProcNOME_PRODUTO: TStringField;
    cdsTalao_ProcNUM_PEDIDO: TIntegerField;
    cdsTalao_ProcUNIDADE: TStringField;
    cdsTalao_ProcTIPO_LOTE: TStringField;
    cdsTalao_ProcNOME_COMBINACAO: TStringField;
    cdsTalao_ProcDTENTREGA: TDateField;
    cdsTalao_ProcOBS_PED: TStringField;
    cdsTalao_ProcITEM_ORDEM: TIntegerField;
    cdsTalao_ProcITEM_ORDEM_TOTAL: TIntegerField;
    cdsTalao_ProcQTD_PARES: TFloatField;
    cdsTalao_ProcID_CLIENTE: TIntegerField;
    cdsTalao_ProcNOME_CLIENTE: TStringField;
    cdsTalao_ProcNOME_PROCESSO: TStringField;
    cdsTalao_ProcQTD: TFloatField;
    frxTalao_Proc: TfrxDBDataset;
    cdsTalao_ProcclCodBarra: TStringField;
    cdsTalao_ProcID_PROCESSO: TIntegerField;
    cdsConsulta_LoteORDEM_REF: TStringField;
    cdsConsulta_LoteORDEM_PED: TStringField;
    sdsConsLoteRef: TSQLDataSet;
    dspConsLoteRef: TDataSetProvider;
    cdsConsLoteRef: TClientDataSet;
    dsConsLoteRef: TDataSource;
    cdsConsLoteRefQTD: TFloatField;
    cdsConsLoteRefQTD_PRODUZIDO: TFloatField;
    cdsConsLoteRefID_PROCESSO: TIntegerField;
    cdsConsLoteRefNOME_PROCESSO: TStringField;
    cdsConsLoteRefNOME_COMBINACAO: TStringField;
    cdsConsLoteRefREFERENCIA: TStringField;
    cdsConsLoteRefUNIDADE: TStringField;
    frxConsLoteRef: TfrxDBDataset;
    sdsDtEntrega: TSQLDataSet;
    dspDtEntrega: TDataSetProvider;
    cdsDtEntrega: TClientDataSet;
    dsDtEntrega: TDataSource;
    cdsDtEntregaDTENTREGA: TDateField;
    cdsDtEntregaREFERENCIA: TStringField;
    cdsDtEntregaQTD: TFloatField;
    cdsDtEntregaNOME_CLIENTE: TStringField;
    cdsDtEntregaNOME_COMBINACAO: TStringField;
    frxDtEntrega: TfrxDBDataset;
    mImpLote_SL: TClientDataSet;
    mImpLote_SLNum_Ordem: TIntegerField;
    mImpLote_SLNum_Lote: TIntegerField;
    dsmImpLote_SL: TDataSource;
    frxmImpLote_SL: TfrxDBDataset;
    mImpLote_SLReimpresso: TStringField;
    cdsConsulta_LoteQTD_LIBERADA: TFloatField;
    cdsConsulta_LoteQTD_PENDENTE: TFloatField;
    cdsConsulta_LoteAJUSTE: TStringField;
    cdsConsulta_LoteDESCRICAO_AJUSTE: TStringField;
    sdsTalao_Ajuste: TSQLDataSet;
    dspTalao_Ajuste: TDataSetProvider;
    cdsTalao_Ajuste: TClientDataSet;
    dsTalao_Ajuste: TDataSource;
    frxTalao_Ajuste: TfrxDBDataset;
    cdsTalao_AjusteID: TIntegerField;
    cdsTalao_AjusteITEM: TIntegerField;
    cdsTalao_AjusteID_PROCESSO: TIntegerField;
    cdsTalao_AjusteID_LOTE: TIntegerField;
    cdsTalao_AjusteID_PEDIDO: TIntegerField;
    cdsTalao_AjusteITEM_PEDIDO: TIntegerField;
    cdsTalao_AjusteDTENTRADA: TDateField;
    cdsTalao_AjusteHRENTRADA: TTimeField;
    cdsTalao_AjusteDTBAIXA: TDateField;
    cdsTalao_AjusteHRBAIXA: TTimeField;
    cdsTalao_AjusteQTD: TFloatField;
    cdsTalao_AjusteQTD_PRODUZIDO: TFloatField;
    cdsTalao_AjusteNUM_ORDEM: TIntegerField;
    cdsTalao_AjusteTIPO: TStringField;
    cdsTalao_AjusteTOTAL_HORAS: TFloatField;
    cdsTalao_AjusteQTD_PENDENTE: TFloatField;
    cdsTalao_AjusteSELECIONADO: TStringField;
    cdsTalao_AjustePARCIAL: TStringField;
    cdsTalao_AjusteITEM_ORIGINAL: TIntegerField;
    cdsTalao_AjusteQTD_LIBERADA: TFloatField;
    cdsTalao_AjusteAJUSTE: TStringField;
    cdsTalao_AjusteNOME_PROCESSO: TStringField;
    cdsTalao_AjusteNUM_LOTE: TIntegerField;
    cdsTalao_AjusteclCodBarra_Lote: TStringField;
    cdsTalao_AjusteOBS_PED: TStringField;
    cdsTalao_AjusteNOME_CLIENTE: TStringField;
    cdsTalao_AjusteREFERENCIA: TStringField;
    cdsTalao_AjusteNOME_PRODUTO: TStringField;
    cdsTalao_AjusteNOME_COMBINACAO: TStringField;
    cdsTalao_AjusteUNIDADE: TStringField;
    cdsTalao_AjusteDTENTREGA: TDateField;
    cdsConsulta_LoteNUM_PEDIDO: TIntegerField;
    cdsConsulta_LoteCodBarra_Ped: TStringField;
    cdsTalao_SLDTEMISSAO: TDateField;
    cdsTalao_SLQTD_ESTOQUE_USADA: TFloatField;
    sdsLote_Ped: TSQLDataSet;
    dspLote_Ped: TDataSetProvider;
    cdsLote_Ped: TClientDataSet;
    cdsLote_PedDTEMISSAO: TDateField;
    cdsLote_PedNUM_LOTE: TIntegerField;
    cdsLote_PedFILIAL: TIntegerField;
    cdsLote_PedHREMISSAO: TTimeField;
    cdsLote_PedDTENTREGA: TDateField;
    cdsLote_PedNUM_ORDEM: TIntegerField;
    cdsLote_PedID: TIntegerField;
    cdsLote_PedID_PRODUTO: TIntegerField;
    cdsLote_PedID_COMBINACAO: TIntegerField;
    cdsLote_PedREFERENCIA: TStringField;
    cdsLote_PedUNIDADE: TStringField;
    cdsLote_PedNOME_FILIAL: TStringField;
    cdsLote_PedNOME_PRODUTO: TStringField;
    cdsLote_PedNOME_COMBINACAO: TStringField;
    cdsLote_PedOBS_PED: TStringField;
    cdsLote_PedOBS: TMemoField;
    cdsLote_PedNOME_CLIENTE: TStringField;
    cdsLote_PedUNIDADE_TALAO: TStringField;
    cdsLote_PedFANTASIA_CLIENTE: TStringField;
    cdsLote_PedQTD_NAOFATURADO: TFloatField;
    cdsLote_PedQTD: TFloatField;
    cdsLote_PedDTENTRADA: TDateField;
    cdsLote_PedDTBAIXA: TDateField;
    cdsLote_PedHRENTRADA: TTimeField;
    cdsLote_PedHRBAIXA: TTimeField;
    dsLote_Ped: TDataSource;
    frxLote_Ped: TfrxDBDataset;
    mImpAux: TClientDataSet;
    mImpAuxID: TIntegerField;
    dsmImpAux: TDataSource;
    frxmImpAux: TfrxDBDataset;
    cdsLote_PedclCodBarra: TStringField;
    cdsLote_PedCIDADE_CLI: TStringField;
    cdsLote_PedUF_CLI: TStringField;
    qParametros_Lote: TSQLQuery;
    qParametros_LoteUSA_LOTE_PED_SPROC: TStringField;
    cdsLote_PedNUM_PEDIDO: TIntegerField;
    cdsConsulta_LoteDTEMISSAO: TDateField;
    cdsConsulta_LoteQTD_ESTOQUE_USADA: TFloatField;
    cdsConsulta_LoteRETRABALHO: TStringField;
    cdsConsulta_LoteDESCRICAO_RETRABALHO: TStringField;
    cdsTalao_AjusteRETRABALHO: TStringField;
    cdsProcessoRETRABALHO: TStringField;
    cdsConsulta_LoteNOME_PRODUTO: TStringField;
    cdsConsulta_LoteID_PRODUTO: TIntegerField;
    cdsTalao_SLCARGA: TFloatField;
    sdsConsMatKG: TSQLDataSet;
    dspConsMatKG: TDataSetProvider;
    cdsConsMatKG: TClientDataSet;
    dsConsMatKG: TDataSource;
    sdsConsMatKG_Com_Pendentes_Juntos_Nao_apagar: TSQLDataSet;
    cdsConsMatKGID_PROCESSO: TIntegerField;
    cdsConsMatKGNOME_PROCESSO: TStringField;
    cdsConsMatKGID_MATERIAL: TIntegerField;
    cdsConsMatKGNOME_MATERIAL: TStringField;
    cdsConsMatKGID_COR_MAT: TFMTBCDField;
    cdsConsMatKGNOME_COR_MAT: TStringField;
    cdsConsMatKGUNIDADE: TStringField;
    cdsConsMatKGQTD_CONSUMO: TFloatField;
    cdsConsMatKGQTD_CONSUMO_PROD: TFloatField;
    cdsConsMatKGQTD_PRODUZIDO: TFloatField;
    sdsConsMatKG_Ref: TSQLDataSet;
    dspConsMatKG_Ref: TDataSetProvider;
    cdsConsMatKG_Ref: TClientDataSet;
    dsConsMatKG_Ref: TDataSource;
    cdsConsMatKG_RefID_PROCESSO: TIntegerField;
    cdsConsMatKG_RefNOME_PROCESSO: TStringField;
    cdsConsMatKG_RefID_MATERIAL: TIntegerField;
    cdsConsMatKG_RefNOME_MATERIAL: TStringField;
    cdsConsMatKG_RefID_COR_MAT: TFMTBCDField;
    cdsConsMatKG_RefNOME_COR_MAT: TStringField;
    cdsConsMatKG_RefUNIDADE: TStringField;
    cdsConsMatKG_RefQTD_CONSUMO: TFloatField;
    cdsConsMatKG_RefQTD_CONSUMO_PROD: TFloatField;
    cdsConsMatKG_RefQTD_PRODUZIDO: TFloatField;
    cdsConsMatKG_RefREFERENCIA: TStringField;
    frxConsMatKG: TfrxDBDataset;
    frxConsMatKG_Ref: TfrxDBDataset;
    qConsumo: TSQLQuery;
    qConsumoQTD_CONSUMO: TFloatField;
    cdsConsulta_LoteID_COMBINACAO: TFMTBCDField;
    cdsConsulta_LoteCARGA: TFloatField;
    cdsProcessoUSA_CARGA: TStringField;
    cdsLote_PedUSUARIO: TStringField;
    cdsProcessoENTRADA_AUTO: TStringField;
    cdsConsulta_LoteID_FUNCIONARIO_ENT: TIntegerField;
    cdsConsulta_LoteID_FUNCIONARIO_BAIXA: TIntegerField;
    cdsConsulta_LoteNOME_FUNCIONARIO_ENTRADA: TStringField;
    cdsConsulta_LoteNOME_FUNCIONARIO_BAIXA: TStringField;
    cdsLote_PedNOME_VENDEDOR_INT: TStringField;
    sdsConsLote_Mat_Prod2: TSQLDataSet;
    dspConsLote_Mat_Prod2: TDataSetProvider;
    cdsConsLote_Mat_Prod2: TClientDataSet;
    cdsConsLote_Mat_Prod2REFERENCIA: TStringField;
    cdsConsLote_Mat_Prod2NOME_MATERIAL: TStringField;
    cdsConsLote_Mat_Prod2NOME_COR_MAT: TStringField;
    cdsConsLote_Mat_Prod2QTD_CONSUMO: TFloatField;
    cdsConsLote_Mat_Prod2QTD_PRODUTO: TFloatField;
    cdsConsLote_Mat_Prod2NUM_ORDEM: TIntegerField;
    cdsConsLote_Mat_Prod2ITEM: TIntegerField;
    cdsConsLote_Mat_Prod2ID_MATERIAL: TIntegerField;
    cdsConsLote_Mat_Prod2ID_COR_PRODUTO: TIntegerField;
    cdsConsLote_Mat_Prod2ID_COR_MATERIAL: TIntegerField;
    cdsConsLote_Mat_Prod2NOME_COMBINACAO: TStringField;
    cdsConsLote_Mat_Prod2CODBARRAS: TStringField;
    cdsConsLote_Mat_Prod2DTRETORNO: TDateField;
    cdsConsLote_Mat_Prod2DTPAGO: TDateField;
    cdsConsLote_Mat_Prod2QTD_PAGO: TFloatField;
    cdsConsLote_Mat_Prod2QTD_RETORNO: TFloatField;
    cdsConsLote_Mat_Prod2QTD_DIFERENCA: TFloatField;
    cdsConsLote_Mat_Prod2QTD_CONES: TIntegerField;
    cdsConsLote_Mat_Prod2IMPRESSO: TStringField;
    dsConsLote_Mat_Prod2: TDataSource;
    cdsTalao_SLID_COMBINACAO: TIntegerField;
    frxConsLote_Mat_SL: TfrxDBDataset;
    cdsConsLote_Mat_Prod2NUM_LOTE: TIntegerField;
    procedure dspLoteUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
    procedure cdsTalao_SLCalcFields(DataSet: TDataSet);
    procedure frxTalao_SLNext(Sender: TObject);
    procedure frxTalao_SLFirst(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsTalao_ProcCalcFields(DataSet: TDataSet);
    procedure frxmImpLote_SLFirst(Sender: TObject);
    procedure frxmImpLote_SLNext(Sender: TObject);
    procedure cdsTalao_AjusteCalcFields(DataSet: TDataSet);
    procedure cdsConsulta_LoteCalcFields(DataSet: TDataSet);
    procedure frxmImpAuxFirst(Sender: TObject);
    procedure cdsLote_PedCalcFields(DataSet: TDataSet);
    procedure frxConsulta_LoteFirst(Sender: TObject);
    procedure frxConsulta_LoteNext(Sender: TObject);
    procedure frxConsulta_LoteOpen(Sender: TObject);
  private
    { Private declarations }
    procedure prc_Imprimir_Processos;
    procedure prc_Abrir_Talao_SL;
    procedure prc_Soma_KG;

  public
    { Public declarations }
    ctConsulta_Lote : String;
    ctConsLoteRef   : String;
    ctLote_Ped      : String;
    ctConsMatKG     : String;
    ctConsMatKG_Ref : String;
    ctConsLote_Mat_Prod : String;

    vObsPedido : String;
    vDtProducaoIni, vDtProducaoFin : TDateTime;
    vUsaKG : Boolean;

  end;

var
  DMLoteImp: TDMLoteImp;

implementation

uses DmdDatabase, uUtilPadrao;

{$R *.dfm}

{ TDMCadLote}

procedure TDMLoteImp.dspLoteUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  dmDatabase.prc_UpdateError(DataSet.Name,UpdateKind,E);
end;

procedure TDMLoteImp.cdsTalao_SLCalcFields(DataSet: TDataSet);
begin
  cdsTalao_SLclCodBarra_Lote.AsString := '2' + FormatFloat('00000000000',cdsTalao_SLNUM_LOTE.AsInteger);
end;

procedure TDMLoteImp.frxTalao_SLNext(Sender: TObject);
begin
  prc_Imprimir_Processos;
end;

procedure TDMLoteImp.frxTalao_SLFirst(Sender: TObject);
begin
  prc_Imprimir_Processos;
end;

procedure TDMLoteImp.prc_Imprimir_Processos;
var
  sds: TSQLDataSet;
  vTexto: WideString;
begin
  cdsLote_Processo.Close;
  sdsLote_Processo.ParamByName('ID_LOTE').AsInteger := cdsTalao_SLID.AsInteger;
  cdsLote_Processo.Open;
  vTexto := '';
  cdsLote_Processo.First;
  while not cdsLote_Processo.Eof do
  begin
    if trim(vTexto) = '' then
      vTexto := vTexto + 'Processos: (' + cdsLote_ProcessoNOME_PROCESSO.AsString + ')'
    else
      vTexto := vTexto + ' (' + cdsLote_ProcessoNOME_PROCESSO.AsString + ')';
    cdsLote_Processo.Next;
  end;
  TfrxMemoView(frxReport1.FindComponent('memProcessos')).Text := vTexto;
end;

procedure TDMLoteImp.DataModuleCreate(Sender: TObject);
begin
  ctConsulta_Lote := sdsConsulta_Lote.CommandText;
  ctConsLoteRef   := sdsConsLoteRef.CommandText;
  ctLote_Ped      := sdsLote_Ped.CommandText;
  ctConsMatKG     := sdsConsMatKG.CommandText;
  ctConsMatKG_Ref := sdsConsMatKG_Ref.CommandText;
  ctConsLote_Mat_Prod := sdsConsLote_Mat_Prod2.CommandText;

  qParametros_Lote.Open;
end;

procedure TDMLoteImp.cdsTalao_ProcCalcFields(DataSet: TDataSet);
begin
  cdsTalao_ProcclCodBarra.AsString := '2' + FormatFloat('00000000',cdsTalao_ProcNUM_LOTE.AsInteger) +  FormatFloat('000',cdsTalao_ProcID_PROCESSO.AsInteger);
end;

procedure TDMLoteImp.frxmImpLote_SLFirst(Sender: TObject);
begin
  prc_Abrir_Talao_SL;
  prc_Imprimir_Processos;
end;

procedure TDMLoteImp.prc_Abrir_Talao_SL;
begin
  cdsTalao_SL.Close;
  sdsTalao_SL.ParamByName('NUM_ORDEM').AsInteger := mImpLote_SLNum_Ordem.AsInteger;
  sdsTalao_SL.ParamByName('NUM_LOTE').AsInteger  := mImpLote_SLNum_Lote.AsInteger;
  cdsTalao_SL.Open;

  cdsTalao_SL.First;
end;

procedure TDMLoteImp.frxmImpLote_SLNext(Sender: TObject);
begin
  prc_Abrir_Talao_SL;
  prc_Imprimir_Processos;
end;

procedure TDMLoteImp.cdsTalao_AjusteCalcFields(DataSet: TDataSet);
begin
  cdsTalao_AjusteclCodBarra_Lote.AsString := '2' + FormatFloat('00000000000',cdsTalao_AjusteNUM_LOTE.AsInteger);
end;

procedure TDMLoteImp.cdsConsulta_LoteCalcFields(DataSet: TDataSet);
begin
 if cdsConsulta_LoteITEM_PEDIDO.AsInteger > 0 then
   cdsConsulta_LoteCodBarra_Ped.AsString := '5' + FormatFloat('0000000',cdsConsulta_LoteNUM_PEDIDO.AsInteger) +
                                                           FormatFloat('0000',cdsConsulta_LoteITEM_PEDIDO.AsInteger);

end;

procedure TDMLoteImp.frxmImpAuxFirst(Sender: TObject);
begin
  cdsLote_Ped.Close;
  sdsLote_Ped.CommandText := ctLote_Ped + ' WHERE L.ID = :ID ';
  sdsLote_Ped.ParamByName('ID').AsInteger := mImpAuxID.AsInteger;
  cdsLote_Ped.Open;
end;

procedure TDMLoteImp.cdsLote_PedCalcFields(DataSet: TDataSet);
begin
  cdsLote_PedclCodBarra.AsString := '9' + FormatFloat('000000',cdsLote_PedNUM_LOTE.AsInteger);
end;

procedure TDMLoteImp.frxConsulta_LoteFirst(Sender: TObject);
begin
  prc_Soma_KG;
end;

procedure TDMLoteImp.prc_Soma_KG;
var
  vConsumo : Real;
begin
  //Foi tirado conforme pedido do Marcelo    02/05/2019
  {if not vUsaKG then
    exit;
  qConsumo.Close;
  qConsumo.ParamByName('ID').AsInteger := cdsConsulta_LoteID_PRODUTO.AsInteger;
  qConsumo.ParamByName('ID_COMBINACAO').AsInteger := cdsConsulta_LoteID_COMBINACAO.AsInteger;
  qConsumo.Open;

  vConsumo := StrToFloat(FormatFloat('0.000',cdsConsulta_LoteQTD.AsFloat * qConsumoQTD_CONSUMO.AsFloat));

  frxReport1.variables['QtdKG'] := QuotedStr(FormatFloat('0.000',vConsumo));}
end;

procedure TDMLoteImp.frxConsulta_LoteNext(Sender: TObject);
begin
  prc_Soma_KG;
end;

procedure TDMLoteImp.frxConsulta_LoteOpen(Sender: TObject);
begin
  prc_Soma_KG;
end;

end.
