unit UDMBaixaProd;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider, Controls, LogTypes;

type
  TDMBaixaProd = class(TDataModule)
    sdsLote: TSQLDataSet;
    sdsLoteID: TIntegerField;
    sdsLoteNUM_LOTE: TIntegerField;
    sdsLoteQTD_TALOES: TIntegerField;
    sdsLoteDTEMISSAO: TDateField;
    sdsLoteHREMISSAO: TTimeField;
    sdsLoteFILIAL: TIntegerField;
    sdsLoteOBS: TMemoField;
    sdsLoteID_PRODUTO: TIntegerField;
    sdsLoteDTENTREGA: TDateField;
    sdsLoteQTD: TFloatField;
    sdsLoteNUM_ORDEM: TIntegerField;
    sdsLoteCARIMBO: TStringField;
    sdsLoteID_COMBINACAO: TIntegerField;
    sdsLoteNOME: TStringField;
    sdsLoteNUM_PEDIDO: TIntegerField;
    sdsLoteTALAO_AUX_GERADO: TStringField;
    sdsLoteDTENTRADA: TDateField;
    sdsLoteHRENTRADA: TTimeField;
    sdsLoteDTBAIXA: TDateField;
    sdsLoteHRBAIXA: TTimeField;
    sdsLoteID_PEDIDO: TIntegerField;
    sdsLoteTIPO_LOTE: TStringField;
    sdsLoteREFERENCIA: TStringField;
    sdsLoteUNIDADE: TStringField;
    sdsLoteQTD_PENDENTE: TFloatField;
    sdsLoteQTD_PRODUZIDO: TFloatField;
    sdsLoteITEM_ORDEM: TIntegerField;
    sdsLoteITEM_ORDEM_TOTAL: TIntegerField;
    sdsLoteOBS_PED: TStringField;
    sdsLoteID_CLIENTE: TIntegerField;
    sdsLoteIMPRESSO: TStringField;
    sdsLoteQTD_ORIGINAL: TFloatField;
    sdsLoteQTD_PARES: TFloatField;
    sdsLoteID_PROCESSO_GRUPO: TIntegerField;
    sdsLoteBAIXADO: TStringField;
    dspLote: TDataSetProvider;
    cdsLote: TClientDataSet;
    sdsPedido_Item: TSQLDataSet;
    dspPedido_Item: TDataSetProvider;
    cdsPedido_Item: TClientDataSet;
    cdsLoteID: TIntegerField;
    cdsLoteNUM_LOTE: TIntegerField;
    cdsLoteQTD_TALOES: TIntegerField;
    cdsLoteDTEMISSAO: TDateField;
    cdsLoteHREMISSAO: TTimeField;
    cdsLoteFILIAL: TIntegerField;
    cdsLoteOBS: TMemoField;
    cdsLoteID_PRODUTO: TIntegerField;
    cdsLoteDTENTREGA: TDateField;
    cdsLoteQTD: TFloatField;
    cdsLoteNUM_ORDEM: TIntegerField;
    cdsLoteCARIMBO: TStringField;
    cdsLoteID_COMBINACAO: TIntegerField;
    cdsLoteNOME: TStringField;
    cdsLoteNUM_PEDIDO: TIntegerField;
    cdsLoteTALAO_AUX_GERADO: TStringField;
    cdsLoteDTENTRADA: TDateField;
    cdsLoteHRENTRADA: TTimeField;
    cdsLoteDTBAIXA: TDateField;
    cdsLoteHRBAIXA: TTimeField;
    cdsLoteID_PEDIDO: TIntegerField;
    cdsLoteTIPO_LOTE: TStringField;
    cdsLoteREFERENCIA: TStringField;
    cdsLoteUNIDADE: TStringField;
    cdsLoteQTD_PENDENTE: TFloatField;
    cdsLoteQTD_PRODUZIDO: TFloatField;
    cdsLoteITEM_ORDEM: TIntegerField;
    cdsLoteITEM_ORDEM_TOTAL: TIntegerField;
    cdsLoteOBS_PED: TStringField;
    cdsLoteID_CLIENTE: TIntegerField;
    cdsLoteIMPRESSO: TStringField;
    cdsLoteQTD_ORIGINAL: TFloatField;
    cdsLoteQTD_PARES: TFloatField;
    cdsLoteID_PROCESSO_GRUPO: TIntegerField;
    cdsLoteBAIXADO: TStringField;
    cdsPedido_ItemID: TIntegerField;
    cdsPedido_ItemITEM: TIntegerField;
    cdsPedido_ItemID_PRODUTO: TIntegerField;
    cdsPedido_ItemID_COR: TFMTBCDField;
    cdsPedido_ItemQTD: TFloatField;
    cdsPedido_ItemQTD_FATURADO: TFloatField;
    cdsPedido_ItemQTD_RESTANTE: TFloatField;
    cdsPedido_ItemQTD_CANCELADO: TFloatField;
    cdsPedido_ItemQTD_PRODUZIDA: TFloatField;
    cdsPedido_ItemCANCELADO: TStringField;
    cdsPedido_ItemREFERENCIA: TStringField;
    cdsPedido_ItemNOMEPRODUTO: TStringField;
    sdsPedido_ItemID: TIntegerField;
    sdsPedido_ItemITEM: TIntegerField;
    sdsPedido_ItemID_PRODUTO: TIntegerField;
    sdsPedido_ItemID_COR: TFMTBCDField;
    sdsPedido_ItemQTD: TFloatField;
    sdsPedido_ItemQTD_FATURADO: TFloatField;
    sdsPedido_ItemQTD_RESTANTE: TFloatField;
    sdsPedido_ItemQTD_CANCELADO: TFloatField;
    sdsPedido_ItemQTD_PRODUZIDA: TFloatField;
    sdsPedido_ItemCANCELADO: TStringField;
    sdsPedido_ItemREFERENCIA: TStringField;
    sdsPedido_ItemNOMEPRODUTO: TStringField;
    qPed: TSQLQuery;
    qPedID: TIntegerField;
    qProcesso: TSQLQuery;
    qProcessoID: TIntegerField;
    qProcessoNOME: TStringField;
    qProcessoLIMITE_POR_TALAO: TStringField;
    qProcessoQTD_LIMITE_POR_TALAO: TIntegerField;
    qProcessoAGRUPAR_PEDIDOS: TStringField;
    qProcessoTIPO: TStringField;
    sdsBaixa_Processo: TSQLDataSet;
    dspBaixa_Processo: TDataSetProvider;
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
    dsBaixa_Processo: TDataSource;
    cdsBaixa_ProcessoclNome_Processo: TStringField;
    sdsPedido_ItemNOME_COMBINACAO: TStringField;
    cdsPedido_ItemNOME_COMBINACAO: TStringField;
    sdsLoteNOME_COMBINACAO: TStringField;
    cdsLoteNOME_COMBINACAO: TStringField;
    sdsBaixa_ProcessoTOTAL_HORAS: TFloatField;
    cdsBaixa_ProcessoTOTAL_HORAS: TFloatField;
    qFuncionario: TSQLQuery;
    qFuncionarioCODIGO: TIntegerField;
    qFuncionarioNOME: TStringField;
    qFuncionarioNUM_CARTAO: TIntegerField;
    qFuncionario_Processo: TSQLQuery;
    qFuncionario_ProcessoCODIGO: TIntegerField;
    qFuncionario_ProcessoID_PROCESSO: TIntegerField;
    qProcessoENTRADA_AUTO: TStringField;
    qParametros_Lote: TSQLQuery;
    qParametros_LoteLOTE_PROCESSO: TStringField;
    qParametros_LoteLOTE_TEXTIL: TStringField;
    sdsPedido_Talao: TSQLDataSet;
    sdsPedido_TalaoID: TIntegerField;
    sdsPedido_TalaoITEM: TIntegerField;
    sdsPedido_TalaoITEM_TALAO: TIntegerField;
    sdsPedido_TalaoQTD: TFloatField;
    sdsPedido_TalaoCODBARRA: TStringField;
    sdsPedido_TalaoDTBAIXA: TDateField;
    sdsPedido_TalaoHRBAIXA: TTimeField;
    sdsPedido_TalaoDTEMISSAO: TDateField;
    sdsPedido_TalaoHREMISSAO: TTimeField;
    dspPedido_Talao: TDataSetProvider;
    cdsPedido_Talao: TClientDataSet;
    cdsPedido_TalaoID: TIntegerField;
    cdsPedido_TalaoITEM: TIntegerField;
    cdsPedido_TalaoITEM_TALAO: TIntegerField;
    cdsPedido_TalaoQTD: TFloatField;
    cdsPedido_TalaoCODBARRA: TStringField;
    cdsPedido_TalaoDTBAIXA: TDateField;
    cdsPedido_TalaoHRBAIXA: TTimeField;
    cdsPedido_TalaoDTEMISSAO: TDateField;
    cdsPedido_TalaoHREMISSAO: TTimeField;
    dsPedido_Talao: TDataSource;
    sdsPedido_ItemQTD_LIBERADA: TFloatField;
    sdsPedido_ItemQTD_CONFERIDO: TFloatField;
    cdsPedido_ItemQTD_LIBERADA: TFloatField;
    cdsPedido_ItemQTD_CONFERIDO: TFloatField;
    dsPendente_Lib: TDataSource;
    cdsPendente_Lib: TClientDataSet;
    dspPendente_Lib: TDataSetProvider;
    sdsPendente_Lib: TSQLDataSet;
    cdsPendente_LibID: TIntegerField;
    cdsPendente_LibITEM: TIntegerField;
    cdsPendente_LibID_PRODUTO: TIntegerField;
    cdsPendente_LibREFERENCIA: TStringField;
    cdsPendente_LibTAMANHO: TStringField;
    cdsPendente_LibID_COR: TFMTBCDField;
    cdsPendente_LibNOMEPRODUTO: TStringField;
    cdsPendente_LibCOD_PRODUTO_CLIENTE: TStringField;
    cdsPendente_LibCOD_COR_CLIENTE: TStringField;
    cdsPendente_LibUNIDADE: TStringField;
    cdsPendente_LibQTD: TFloatField;
    cdsPendente_LibQTD_RESTANTE: TFloatField;
    cdsPendente_LibNUMOS: TStringField;
    cdsPendente_LibENCERADO: TStringField;
    cdsPendente_LibTAMANHO_CLIENTE: TStringField;
    cdsPendente_LibIMP_COR_CLIENTE: TStringField;
    cdsPendente_LibNOME_COR_CLIENTE: TStringField;
    cdsPendente_LibGEROU_PED_TALAO: TStringField;
    cdsPendente_LibNOME_COR_COMBINACAO: TStringField;
    cdsPendente_LibDTEMISSAO: TDateField;
    cdsPendente_LibID_CLIENTE: TIntegerField;
    cdsPendente_LibFILIAL: TIntegerField;
    cdsPendente_LibPEDIDO_CLIENTE: TStringField;
    cdsPendente_LibNUM_PEDIDO: TIntegerField;
    cdsPendente_LibNOME_CLI: TStringField;
    cdsPendente_LibFANTASIA_CLI: TStringField;
    cdsPendente_LibNOME_INTERNO_FIL: TStringField;
    cdsPendente_LibQTD_POR_ROTULO: TIntegerField;
    cdsPendente_LibQTD_CONFERIDO: TFloatField;
    cdsPendente_LibQTD_LIBERADA: TFloatField;
    cdsPendente_LibQTD_FATURADO: TFloatField;
    qFuncionarioLIBERA_PED: TStringField;
    qConf_Proc: TSQLQuery;
    qConf_ProcCONTADOR: TIntegerField;
    qParametros_LoteNOME_PROCESSO_CONF: TStringField;
    dsRapido: TDataSource;
    cdsRapido: TClientDataSet;
    dspRapido: TDataSetProvider;
    sdsRapido: TSQLDataSet;
    cdsRapidoID: TIntegerField;
    cdsRapidoITEM: TIntegerField;
    cdsRapidoQTD: TFloatField;
    cdsRapidoQTD_CONFERIDO: TFloatField;
    cdsRapidoDTBAIXA: TDateField;
    cdsRapidoREFERENCIA: TStringField;
    cdsRapidoQTD_LIBERADA: TFloatField;
    cdsRapidoQTD_FATURADO: TFloatField;
    cdsRapidoQTD_REST_CONF: TFloatField;
    qConfLoteBaixado: TSQLQuery;
    qConfLoteBaixadoCONTADOR: TIntegerField;
    qParametros_LoteUSA_LOTE_PEDIDO: TStringField;
    sdsLoteITEM_PEDIDO: TIntegerField;
    cdsLoteITEM_PEDIDO: TIntegerField;
    sdsBaixa_ProcessoQTD_PENDENTE: TFloatField;
    cdsBaixa_ProcessoQTD_PENDENTE: TFloatField;
    sdsBaixa_ProcessoPARCIAL: TStringField;
    cdsBaixa_ProcessoPARCIAL: TStringField;
    qVerBaixa: TSQLQuery;
    qVerBaixaID: TIntegerField;
    qVerBaixaITEM: TIntegerField;
    qVerBaixaID_PROCESSO: TIntegerField;
    qVerBaixaID_LOTE: TIntegerField;
    qVerBaixaID_PEDIDO: TIntegerField;
    qVerBaixaITEM_PEDIDO: TIntegerField;
    qVerBaixaDTENTRADA: TDateField;
    qVerBaixaHRENTRADA: TTimeField;
    qVerBaixaDTBAIXA: TDateField;
    qVerBaixaHRBAIXA: TTimeField;
    qVerBaixaQTD: TFloatField;
    qVerBaixaQTD_PRODUZIDO: TFloatField;
    qVerBaixaNUM_ORDEM: TIntegerField;
    qVerBaixaTIPO: TStringField;
    qVerBaixaTOTAL_HORAS: TFloatField;
    qVerBaixaQTD_PENDENTE: TFloatField;
    qVerBaixaSELECIONADO: TStringField;
    qVerBaixaPARCIAL: TStringField;
    sdsBaixa_ProcessoITEM_ORIGINAL: TIntegerField;
    cdsBaixa_ProcessoITEM_ORIGINAL: TIntegerField;
    qPedID_CLIENTE: TIntegerField;
    sdsBaixa_ProcessoQTD_LIBERADA: TFloatField;
    cdsBaixa_ProcessoQTD_LIBERADA: TFloatField;
    sdsBaixa_Parcial: TSQLDataSet;
    dspBaixa_Parcial: TDataSetProvider;
    cdsBaixa_Parcial: TClientDataSet;
    dsBaixa_Parcial: TDataSource;
    sdsBaixa_ParcialID: TIntegerField;
    sdsBaixa_ParcialITEM: TIntegerField;
    sdsBaixa_ParcialITEM_PARCIAL: TIntegerField;
    sdsBaixa_ParcialID_PROCESSO: TIntegerField;
    sdsBaixa_ParcialDTENTRADA: TDateField;
    sdsBaixa_ParcialHRENTRADA: TTimeField;
    sdsBaixa_ParcialDTSAIDA: TDateField;
    sdsBaixa_ParcialHRSAIDA: TTimeField;
    sdsBaixa_ParcialQTD: TFloatField;
    cdsBaixa_ParcialID: TIntegerField;
    cdsBaixa_ParcialITEM: TIntegerField;
    cdsBaixa_ParcialITEM_PARCIAL: TIntegerField;
    cdsBaixa_ParcialID_PROCESSO: TIntegerField;
    cdsBaixa_ParcialDTENTRADA: TDateField;
    cdsBaixa_ParcialHRENTRADA: TTimeField;
    cdsBaixa_ParcialDTSAIDA: TDateField;
    cdsBaixa_ParcialHRSAIDA: TTimeField;
    cdsBaixa_ParcialQTD: TFloatField;
    qProximoItemParcial: TSQLQuery;
    qProximoItemParcialITEM_PARCIAL: TIntegerField;
    qVerProcesso: TSQLQuery;
    qVerProcessoID_PROCESSO: TIntegerField;
    qVerProcessoITEM: TIntegerField;
    qVerProcessoQTD: TFloatField;
    sdsBaixa_ProcessoAJUSTE: TStringField;
    cdsBaixa_ProcessoAJUSTE: TStringField;
    sdsBaixa_ProcessoID_FUNCIONARIO_ENT: TIntegerField;
    sdsBaixa_ProcessoID_FUNCIONARIO_BAIXA: TIntegerField;
    cdsBaixa_ProcessoID_FUNCIONARIO_ENT: TIntegerField;
    cdsBaixa_ProcessoID_FUNCIONARIO_BAIXA: TIntegerField;
    sdsBaixa_ParcialID_FUNCIONARIO_ENT: TIntegerField;
    sdsBaixa_ParcialID_FUNCIONARIO_BAIXA: TIntegerField;
    cdsBaixa_ParcialID_FUNCIONARIO_ENT: TIntegerField;
    cdsBaixa_ParcialID_FUNCIONARIO_BAIXA: TIntegerField;
    qPedBAIXAR_ETIQ_PREFAT: TStringField;
    qPedNOME: TStringField;
    qFuncionarioBAIXA_ETIQ_PREFAT: TStringField;
    qParametros_Usuario: TSQLQuery;
    qParametros_UsuarioMOSTRAR_CONS_ETIQ: TStringField;
    dsConsBaixaEtiq: TDataSource;
    cdsConsBaixaEtiq: TClientDataSet;
    dspConsBaixaEtiq: TDataSetProvider;
    sdsConsBaixaEtiq: TSQLDataSet;
    cdsConsBaixaEtiqCODBARRA: TStringField;
    cdsConsBaixaEtiqDTBAIXA: TDateField;
    cdsConsBaixaEtiqHRBAIXA: TTimeField;
    sdsPedido_TalaoUSUARIO: TStringField;
    cdsPedido_TalaoUSUARIO: TStringField;
    cdsConsBaixaEtiqUSUARIO: TStringField;
    qParametros_LoteID_PROCESSO_EST: TIntegerField;
    sdsLoteNUM_LOTE_CONTROLE: TStringField;
    cdsLoteNUM_LOTE_CONTROLE: TStringField;
    sdsBaixa_ProcessoID_MOVESTOQUE: TIntegerField;
    sdsBaixa_ProcessoID_MOVESTOQUE_RES: TIntegerField;
    cdsBaixa_ProcessoID_MOVESTOQUE: TIntegerField;
    cdsBaixa_ProcessoID_MOVESTOQUE_RES: TIntegerField;
    qParametros_LoteID_PROCESSO_SEMI_EST: TIntegerField;
    sdsBaixa_ParcialID_ESTOQUE: TIntegerField;
    sdsBaixa_ParcialQTD_FATURADA: TFloatField;
    sdsBaixa_ParcialQTD_RESTANTE_FAT: TFloatField;
    cdsBaixa_ParcialID_ESTOQUE: TIntegerField;
    cdsBaixa_ParcialQTD_FATURADA: TFloatField;
    cdsBaixa_ParcialQTD_RESTANTE_FAT: TFloatField;
    qParametros_LoteID_COR_CRU: TIntegerField;
    qProd: TSQLQuery;
    qProdID: TIntegerField;
    qProdNOME: TStringField;
    qProdPRECO_CUSTO: TFloatField;
    sdsLoteTIPO_LOTE_ESTOQUE: TStringField;
    cdsLoteTIPO_LOTE_ESTOQUE: TStringField;
    sdsBaixa_ProcessoRETRABALHO: TStringField;
    cdsBaixa_ProcessoRETRABALHO: TStringField;
    qProcessoESTOQUE: TStringField;
    qProcessoESTOQUE_CRU: TStringField;
    qProcessoESTOQUE_DT_ES: TStringField;
    qTingimento: TSQLQuery;
    qVerAnt: TSQLQuery;
    qVerAntCONTADOR: TIntegerField;
    qParametros_LoteCONT_LOTE_ANT: TStringField;
    qPedFILIAL: TIntegerField;
    qParametros_UsuarioLIBERA_TALAO_ANT: TStringField;
    qFuncionarioSENHA: TStringField;
    sdsFuncionario: TSQLDataSet;
    dspFuncionario: TDataSetProvider;
    cdsFuncionario: TClientDataSet;
    sdsFuncionarioCODIGO: TIntegerField;
    sdsFuncionarioNOME: TStringField;
    sdsFuncionarioSENHA: TStringField;
    sdsFuncionarioNUM_CARTAO: TIntegerField;
    cdsFuncionarioCODIGO: TIntegerField;
    cdsFuncionarioNOME: TStringField;
    cdsFuncionarioSENHA: TStringField;
    cdsFuncionarioNUM_CARTAO: TIntegerField;
    qParametros_LoteRESERVA_EST_LOTE: TStringField;
    sdsLoteID_MOVESTOQUE_RES: TIntegerField;
    sdsLoteQTD_ESTOQUE_USADA: TFloatField;
    cdsLoteID_MOVESTOQUE_RES: TIntegerField;
    cdsLoteQTD_ESTOQUE_USADA: TFloatField;
    sdsLoteID_MOVESTOQUE: TIntegerField;
    cdsLoteID_MOVESTOQUE: TIntegerField;
    qProdPRECO_VENDA: TFloatField;
    qParametros_Ped: TSQLQuery;
    qParametros_PedUSA_RESERVA_EST: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsBaixa_ProcessoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);

  public
    { Public declarations }
    ctBaixa_Processo : String;
    ctPendente_Lib : String;
    ctRapido : String;
    ctqPed : String;

    vDataBaixa : TDate;
    vHoraBaixa : TTime;
    procedure prc_Abrir_Baixa_Processo(ID, Item, ID_Lote : Integer);
    procedure prc_Abrir_qPedido(NumPedido : Integer ; PedidoCliente : String);

  end;

var
  DMBaixaProd: TDMBaixaProd;

implementation

uses DmdDatabase, uUtilPadrao, LogProvider;

{$R *.dfm}

procedure TDMBaixaProd.DataModuleCreate(Sender: TObject);
var
  i, x: Integer;
  SR: TSearchRec;
  Origem, Destino: string;
  vIndices: string;
  aIndices: array of string;
begin
  ctBaixa_Processo := sdsBaixa_Processo.CommandText;
  ctPendente_Lib   := sdsPendente_Lib.CommandText;
  ctRapido         := sdsRapido.CommandText;
  ctqPed           := qPed.SQL.Text;
  qParametros_Lote.Open;
  qParametros_Usuario.Close;
  qParametros_Usuario.ParamByName('USUARIO').AsString := vUsuario;
  qParametros_Usuario.Open;
  qParametros_Ped.Open;
  //*** Logs Implantado na versão .353
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

procedure TDMBaixaProd.cdsBaixa_ProcessoCalcFields(DataSet: TDataSet);
begin
  qProcesso.Close;
  qProcesso.ParamByName('ID').AsInteger := cdsBaixa_ProcessoID_PROCESSO.AsInteger;
  qProcesso.Open;
  cdsBaixa_ProcessoclNome_Processo.AsString := qProcessoNOME.AsString;
end;

procedure TDMBaixaProd.prc_Abrir_Baixa_Processo(ID, Item, ID_Lote : Integer);
begin
  cdsBaixa_Processo.Close;
  if ID_Lote > 0 then
  begin
    sdsBaixa_Processo.CommandText     := ctBaixa_Processo + ' WHERE ID_LOTE = ' + IntToStr(ID_Lote);
    cdsBaixa_Processo.IndexFieldNames := 'ID_LOTE;ITEM';
  end
  else
  begin
    sdsBaixa_Processo.CommandText := ctBaixa_Processo + ' WHERE 0=0 ' + ' AND ID = :ID ' + ' AND ITEM = :ITEM ';
    sdsBaixa_Processo.ParamByName('ID').AsInteger   := ID;
    sdsBaixa_Processo.ParamByName('ITEM').AsInteger := Item;
  end;
  cdsBaixa_Processo.Open;
end;

procedure TDMBaixaProd.DoLogAdditionalValues(ATableName: string;
  var AValues: TArrayLogData; var UserName: string);
begin
  UserName := vUsuario;
end;

procedure TDMBaixaProd.prc_Abrir_qPedido(NumPedido: Integer;
  PedidoCliente: String);
begin
  qPed.Close;
  if NumPedido > 0 then
  begin
    qPed.SQL.Text := ctqPed + ' WHERE P.NUM_PEDIDO = :NUM_PEDIDO ';
    qPed.ParamByName('NUM_PEDIDO').AsInteger := NumPedido;
  end
  else
  begin
    qPed.SQL.Text := ctqPed + ' WHERE P.PEDIDO_CLIENTE = :PEDIDO_CLIENTE ';
    qPed.ParamByName('PEDIDO_CLIENTE').AsString := PedidoCliente;
  end;
  qPed.Open;
end;

end.
