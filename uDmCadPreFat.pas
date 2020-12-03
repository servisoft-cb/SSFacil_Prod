unit UDMCadPreFat;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, dbXPress, LogTypes, frxClass, frxDBSet, frxRich, frxExportMail,
  frxExportPDF, Dialogs, frxBarcode;

type
  TDMCadPreFat = class(TDataModule)
    sdsPreFat: TSQLDataSet;
    dspPreFat: TDataSetProvider;
    cdsPreFat: TClientDataSet;
    dsPreFat: TDataSource;
    dsPreFat_Mestre: TDataSource;
    sdsPreFat_Itens: TSQLDataSet;
    cdsPreFat_Itens: TClientDataSet;
    dsPedFat_Itens: TDataSource;
    qParametros_NFe: TSQLQuery;
    qParametros_NFeGRAVAR_TAB_TAMANHO: TStringField;
    qParametros_NFePERMITE_IMPORTAR_S_CLIENTE: TStringField;
    qParametros_Geral: TSQLQuery;
    qParametros_GeralEMPRESA_VAREJO: TStringField;
    sdsPreFatID: TIntegerField;
    sdsPreFatID_FUNCIONARIO: TIntegerField;
    sdsPreFatQTD_VOLUME: TIntegerField;
    sdsPreFatFATURADO: TStringField;
    cdsPreFatID: TIntegerField;
    cdsPreFatID_FUNCIONARIO: TIntegerField;
    cdsPreFatQTD_VOLUME: TIntegerField;
    cdsPreFatFATURADO: TStringField;
    sdsPreFat_ItensID: TIntegerField;
    sdsPreFat_ItensITEM: TIntegerField;
    sdsPreFat_ItensID_PEDIDO: TIntegerField;
    sdsPreFat_ItensITEM_PEDIDO: TIntegerField;
    sdsPreFat_ItensQTD: TFloatField;
    sdsPreFat_ItensID_CLIENTE: TIntegerField;
    cdsPreFatsdsPreFat_Itens: TDataSetField;
    cdsPreFat_ItensID: TIntegerField;
    cdsPreFat_ItensITEM: TIntegerField;
    cdsPreFat_ItensID_PEDIDO: TIntegerField;
    cdsPreFat_ItensITEM_PEDIDO: TIntegerField;
    cdsPreFat_ItensQTD: TFloatField;
    cdsPreFat_ItensID_CLIENTE: TIntegerField;
    dsPendente_Lib: TDataSource;
    cdsPendente_Lib: TClientDataSet;
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
    dspPendente_Lib: TDataSetProvider;
    sdsPendente_Lib: TSQLDataSet;
    sdsPreFatFILIAL: TIntegerField;
    cdsPreFatFILIAL: TIntegerField;
    dsConsulta: TDataSource;
    cdsConsulta: TClientDataSet;
    dspConsulta: TDataSetProvider;
    sdsConsulta: TSQLDataSet;
    cdsConsultaID: TIntegerField;
    cdsConsultaID_FUNCIONARIO: TIntegerField;
    cdsConsultaQTD_VOLUME: TIntegerField;
    cdsConsultaFATURADO: TStringField;
    cdsConsultaFILIAL: TIntegerField;
    dsFilial: TDataSource;
    cdsFilial: TClientDataSet;
    dspFilial: TDataSetProvider;
    sdsFilial: TSQLDataSet;
    cdsFilialID: TIntegerField;
    cdsFilialNOME: TStringField;
    cdsFilialNOME_INTERNO: TStringField;
    cdsFilialCNPJ_CPF: TStringField;
    dsClienteLib: TDataSource;
    cdsClienteLib: TClientDataSet;
    dspClienteLib: TDataSetProvider;
    sdsClienteLib: TSQLDataSet;
    cdsClienteLibNOME: TStringField;
    cdsClienteLibFANTASIA: TStringField;
    cdsClienteLibCODIGO: TIntegerField;
    cdsClienteLibCNPJ_CPF: TStringField;
    dsPedido_Item: TDataSource;
    cdsPedido_Item: TClientDataSet;
    dspPedido_Item: TDataSetProvider;
    sdsPedido_Item: TSQLDataSet;
    sdsPedido_ItemID: TIntegerField;
    sdsPedido_ItemITEM: TIntegerField;
    sdsPedido_ItemQTD: TFloatField;
    sdsPedido_ItemQTD_CONFERIDO: TFloatField;
    sdsPedido_ItemQTD_LIBERADA: TFloatField;
    cdsPedido_ItemID: TIntegerField;
    cdsPedido_ItemITEM: TIntegerField;
    cdsPedido_ItemQTD: TFloatField;
    cdsPedido_ItemQTD_CONFERIDO: TFloatField;
    cdsPedido_ItemQTD_LIBERADA: TFloatField;
    sdsPreFatID_CLIENTE: TIntegerField;
    cdsPreFatID_CLIENTE: TIntegerField;
    dsCliente: TDataSource;
    cdsCliente: TClientDataSet;
    dspCliente: TDataSetProvider;
    sdsCliente: TSQLDataSet;
    sdsClienteNOME: TStringField;
    sdsClienteFANTASIA: TStringField;
    sdsClienteCODIGO: TIntegerField;
    sdsClienteCNPJ_CPF: TStringField;
    cdsClienteNOME: TStringField;
    cdsClienteFANTASIA: TStringField;
    cdsClienteCODIGO: TIntegerField;
    cdsClienteCNPJ_CPF: TStringField;
    sdsPreFatDATA: TDateField;
    cdsPreFatDATA: TDateField;
    sdsPreFat_ItensREFERENCIA: TStringField;
    sdsPreFat_ItensNOMEPRODUTO: TStringField;
    cdsPreFat_ItensREFERENCIA: TStringField;
    cdsPreFat_ItensNOMEPRODUTO: TStringField;
    cdsConsultaID_CLIENTE: TIntegerField;
    cdsConsultaFANTASIA_CLI: TStringField;
    cdsConsultaNOME_CLIENTE: TStringField;
    cdsConsultaNOME_FILIAL: TStringField;
    cdsConsultaDATA: TDateField;
    sdsPreFat_ItensNUMOS: TStringField;
    cdsPreFat_ItensNUMOS: TStringField;
    qPedido: TSQLQuery;
    qPedidoNUM_PEDIDO: TIntegerField;
    qPedidoPEDIDO_CLIENTE: TStringField;
    cdsPreFat_ItensclPedido_Cliente: TStringField;
    cdsPreFat_ItensclNum_Pedido: TIntegerField;
    sdsPreFatID_NOTA: TIntegerField;
    cdsPreFatID_NOTA: TIntegerField;
    sdsPreFatID_TRANSPORTADORA: TIntegerField;
    cdsPreFatID_TRANSPORTADORA: TIntegerField;
    dsTransp: TDataSource;
    cdsTransp: TClientDataSet;
    dspTransp: TDataSetProvider;
    sdsTransp: TSQLDataSet;
    cdsTranspNOME: TStringField;
    cdsTranspFANTASIA: TStringField;
    cdsTranspCODIGO: TIntegerField;
    cdsTranspCNPJ_CPF: TStringField;
    cdsConsultaID_NOTA: TIntegerField;
    cdsConsultaID_TRANSPORTADORA: TIntegerField;
    cdsConsultaNOME_TRANSP: TStringField;
    sdsPreFat_Vol: TSQLDataSet;
    sdsPreFat_VolID: TIntegerField;
    sdsPreFat_VolNUM_VOLUME: TIntegerField;
    sdsPreFat_VolQTD_PROD: TFloatField;
    sdsPreFat_VolQTD_ETIQ: TIntegerField;
    sdsPreFat_VolFECHADA: TStringField;
    cdsPreFatsdsPreFat_Vol: TDataSetField;
    cdsPreFat_Vol: TClientDataSet;
    cdsPreFat_VolID: TIntegerField;
    cdsPreFat_VolNUM_VOLUME: TIntegerField;
    cdsPreFat_VolQTD_PROD: TFloatField;
    cdsPreFat_VolQTD_ETIQ: TIntegerField;
    cdsPreFat_VolFECHADA: TStringField;
    dsPreFat_Vol: TDataSource;
    dsPreFat_Vol_Mestre: TDataSource;
    sdsPreFat_Vol_Etiq: TSQLDataSet;
    sdsPreFat_Vol_EtiqID: TIntegerField;
    sdsPreFat_Vol_EtiqNUM_VOLUME: TIntegerField;
    sdsPreFat_Vol_EtiqITEM_ETIQ: TIntegerField;
    sdsPreFat_Vol_EtiqID_PEDIDO: TIntegerField;
    sdsPreFat_Vol_EtiqITEM_PEDIDO: TIntegerField;
    sdsPreFat_Vol_EtiqQTD: TFloatField;
    cdsPreFat_VolsdsPreFat_Vol_Etiq: TDataSetField;
    cdsPreFat_Vol_Etiq: TClientDataSet;
    cdsPreFat_Vol_EtiqID: TIntegerField;
    cdsPreFat_Vol_EtiqNUM_VOLUME: TIntegerField;
    cdsPreFat_Vol_EtiqITEM_ETIQ: TIntegerField;
    cdsPreFat_Vol_EtiqID_PEDIDO: TIntegerField;
    cdsPreFat_Vol_EtiqITEM_PEDIDO: TIntegerField;
    cdsPreFat_Vol_EtiqQTD: TFloatField;
    dsPreFat_Vol_Etiq: TDataSource;
    mAuxVolume: TClientDataSet;
    mAuxVolumeID_Pedido: TIntegerField;
    mAuxVolumeItem_Pedido: TIntegerField;
    mAuxVolumeID_Produto: TIntegerField;
    mAuxVolumeID_Cor: TIntegerField;
    mAuxVolumeReferencia: TStringField;
    mAuxVolumeQtd: TFloatField;
    dsmAuxVolume: TDataSource;
    mAuxVolumeItem_Talao: TIntegerField;
    mAuxVolumeID_Cliente: TIntegerField;
    sdsPreFat_Vol_EtiqITEM_TALAO: TIntegerField;
    cdsPreFat_Vol_EtiqITEM_TALAO: TIntegerField;
    frxReport1: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxMailExport1: TfrxMailExport;
    frxRichObject1: TfrxRichObject;
    dsVolume: TDataSource;
    cdsVolume: TClientDataSet;
    dspVolume: TDataSetProvider;
    sdsVolume: TSQLDataSet;
    sdsVolumeID: TIntegerField;
    sdsVolumeNUM_VOLUME: TIntegerField;
    sdsVolumeQTD_ETIQ: TIntegerField;
    sdsVolumeQTD_PROD: TFloatField;
    sdsVolumeID_PEDIDO: TIntegerField;
    sdsVolumeITEM_PEDIDO: TIntegerField;
    sdsVolumeID_PRODUTO: TIntegerField;
    sdsVolumeREFERENCIA: TStringField;
    sdsVolumeNOMEPRODUTO: TStringField;
    sdsVolumeNOME_COR: TStringField;
    sdsVolumeQTD: TFloatField;
    sdsVolumeUNIDADE: TStringField;
    sdsVolumePEDIDO_CLIENTE: TStringField;
    sdsVolumeNUMOS: TStringField;
    cdsVolumeID: TIntegerField;
    cdsVolumeNUM_VOLUME: TIntegerField;
    cdsVolumeQTD_ETIQ: TIntegerField;
    cdsVolumeQTD_PROD: TFloatField;
    cdsVolumeID_PEDIDO: TIntegerField;
    cdsVolumeITEM_PEDIDO: TIntegerField;
    cdsVolumeID_PRODUTO: TIntegerField;
    cdsVolumeREFERENCIA: TStringField;
    cdsVolumeNOMEPRODUTO: TStringField;
    cdsVolumeNOME_COR: TStringField;
    cdsVolumeQTD: TFloatField;
    cdsVolumeUNIDADE: TStringField;
    cdsVolumePEDIDO_CLIENTE: TStringField;
    cdsVolumeNUMOS: TStringField;
    cdsConsultaNOME_INTERNO_FIL: TStringField;
    cdsPreFat_Vol_EtiqclPedido_Cliente: TStringField;
    cdsPreFat_Vol_EtiqclNum_Pedido: TIntegerField;
    sdsPreFatLIBERADO_FAT: TStringField;
    cdsPreFatLIBERADO_FAT: TStringField;
    cdsConsultaLIBERADO_FAT: TStringField;
    sdsPreFat_ItensID_PRODUTO: TIntegerField;
    cdsPreFat_ItensID_PRODUTO: TIntegerField;
    sdsVolumeNUMNOTA: TIntegerField;
    sdsVolumeSERIE: TStringField;
    cdsVolumeNUMNOTA: TIntegerField;
    cdsVolumeSERIE: TStringField;
    frxVolume: TfrxDBDataset;
    sdsPreFat_ItensEXISTE_VOL_ETIQ: TStringField;
    cdsPreFat_ItensEXISTE_VOL_ETIQ: TStringField;
    qVerExcluir: TSQLQuery;
    qVerExcluirCONTADOR: TIntegerField;
    cdsConsultaNUMNOTA: TIntegerField;
    cdsConsultaDTEMISSAO_NOTA: TDateField;
    sdsPreFatEM_ESPERA: TStringField;
    cdsPreFatEM_ESPERA: TStringField;
    cdsConsultaEM_ESPERA: TStringField;
    cdsConsultaEM_ESPERA2: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dspPreFatUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
    procedure cdsPreFat_ItensCalcFields(DataSet: TDataSet);
    procedure cdsPreFatNewRecord(DataSet: TDataSet);
    procedure cdsPreFat_VolNewRecord(DataSet: TDataSet);
    procedure cdsPreFat_ItensNewRecord(DataSet: TDataSet);
    procedure mAuxVolumeNewRecord(DataSet: TDataSet);
    procedure cdsPreFat_Vol_EtiqCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);
  public
    { Public declarations }
    vMSGErro: String;
    ctPreFat, ctConsulta : String;
    ctPendente_Lib : String;
        
    procedure prc_Localizar(ID: Integer);
    procedure prc_Inserir;
    procedure prc_Gravar;
    procedure prc_Excluir;
    procedure prc_Excluir_Item;
    procedure prc_Inserir_Itens;

  end;

var
  DMCadPreFat: TDMCadPreFat;

implementation

uses DmdDatabase, uUtilPadrao, LogProvider, Math;

{$R *.dfm}

{ TDMCadCFOP}

procedure TDMCadPreFat.prc_Inserir;
var
  vAux: Integer;
  sds: TSQLDataSet;
  vNumAux: Integer;
begin
  if not cdsPreFat.Active then
    prc_Localizar(-1);
  vAux := dmDatabase.ProximaSequencia('PREFAT',0);

  cdsPreFat.Insert;
  cdsPreFatID.AsInteger    := vAux;
  cdsPreFatDATA.AsDateTime := Date;
end;

procedure TDMCadPreFat.prc_Excluir;
begin
  if not(cdsPreFat.Active) or (cdsPreFat.IsEmpty) then
    Exit;
  //mPedidoAux.EmptyDataSet;
  cdsPreFat_Itens.First;
  while not cdsPreFat_Itens.Eof do
    cdsPreFat_Itens.Delete;
  cdsPreFat_Vol.First;
  while not cdsPreFat_Vol.Eof do
  begin
    cdsPreFat_Vol_Etiq.First;
    while not cdsPreFat_Vol_Etiq.Eof do
      cdsPreFat_Vol_Etiq.Delete;
    cdsPreFat_Vol.Delete;
  end;
  cdsPreFat.Delete;
  cdsPreFat.ApplyUpdates(0);

  //Atualiza Status do pedido
  {mPedidoAux.First;
  while not mPedidoAux.Eof do
  begin
    sdsPrc_Atualiza_Status_Ped.Close;
    sdsPrc_Atualiza_Status_Ped.ParamByName('P_ID').AsInteger := mPedidoAuxID_Pedido.AsInteger;
    sdsPrc_Atualiza_Status_Ped.ExecSQL;
    mPedidoAux.Next;
  end;}
end;

procedure TDMCadPreFat.prc_Gravar;
var
  sds: TSQLDataSet;
  ID: TTransactionDesc;
  vNumVale: Integer;
begin
  vMsgErro := '';
  if cdsPreFatDATA.AsDateTime < 10 then
    vMsgErro := vMsgErro + #13 + '*** Data não informada!';
  if cdsPreFatID_CLIENTE.AsInteger <= 0 then
    vMsgErro := vMsgErro + #13 + '*** Cliente não informado!';
  if (cdsPreFatLIBERADO_FAT.AsString = 'S') and (cdsPreFatEM_ESPERA.AsString = 'S') then
    vMsgErro := vMsgErro + #13 + '*** Não pode liberar para faturamento se o registro esta Em Espera!';
  if trim(vMSGErro) <> '' then
    exit;
  sds := TSQLDataSet.Create(nil);
  ID.TransactionID  := 1;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);

  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := ' UPDATE TABELALOC SET FLAG = 1 WHERE TABELA = ' + QuotedStr('PREFAT');
    sds.ExecSQL();

    cdsPreFat.Post;
    cdsPreFat.ApplyUpdates(0);

    dmDatabase.scoDados.Commit(ID);
  except
    dmDatabase.scoDados.Rollback(ID);
    raise;
  end;
  FreeAndNil(sds);
end;

procedure TDMCadPreFat.prc_Localizar(ID: Integer); //-1 é para inclusão
begin
  cdsPreFat.Close;
  sdsPreFat.CommandText                 := ctPreFat;
  sdsPreFat.ParamByName('ID').AsInteger := ID;
  cdsPreFat.Open;
  cdsPreFat_Itens.Close;
  cdsPreFat_Itens.Open;
  cdsPreFat_Vol.Close;
  cdsPreFat_Vol.Open;
  cdsPreFat_Vol_Etiq.Close;
  cdsPreFat_Vol_Etiq.Open;
end;

procedure TDMCadPreFat.DataModuleCreate(Sender: TObject);
var
  i, x: Integer;
  SR: TSearchRec;
  Origem, Destino: string;
  vIndices: string;
  aIndices: array of string;
begin
  ctPreFat       := sdsPreFat.CommandText;
  ctConsulta     := sdsConsulta.CommandText;
  ctPendente_Lib := sdsPendente_Lib.CommandText;

  cdsFilial.Open;
  cdsCliente.Open;
  cdsTransp.Open;
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

procedure TDMCadPreFat.prc_Excluir_Item;
begin
  cdsPreFat_Itens.Delete;
end;

procedure TDMCadPreFat.prc_Inserir_Itens;
var
  vItemAux: Integer;
begin
  cdsPreFat_Itens.Last;
  vItemAux := cdsPreFat_ItensITEM.AsInteger;

  cdsPreFat_Itens.Insert;
  cdsPreFat_ItensID.AsInteger   := cdsPreFatID.AsInteger;
  cdsPreFat_ItensITEM.AsInteger := vItemAux + 1;
end;

procedure TDMCadPreFat.dspPreFatUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  dmDatabase.prc_UpdateError(DataSet.Name,UpdateKind,E);
end;

procedure TDMCadPreFat.DoLogAdditionalValues(ATableName: string;
  var AValues: TArrayLogData; var UserName: string);
begin
  UserName := vUsuario;
end;

procedure TDMCadPreFat.cdsPreFat_ItensCalcFields(DataSet: TDataSet);
begin
  if cdsPreFat_ItensID_PEDIDO.AsInteger > 0 then
  begin
    qPedido.Close;
    qPedido.ParamByName('ID').AsInteger := cdsPreFat_ItensID_PEDIDO.AsInteger;
    qPedido.Open;
    cdsPreFat_ItensclNum_Pedido.AsInteger    := qPedidoNUM_PEDIDO.AsInteger;
    cdsPreFat_ItensclPedido_Cliente.AsString := qPedidoPEDIDO_CLIENTE.AsString;
  end;
end;

procedure TDMCadPreFat.cdsPreFatNewRecord(DataSet: TDataSet);
begin
  cdsPreFatFATURADO.AsString     := 'N';
  cdsPreFatLIBERADO_FAT.AsString := 'N';
  cdsPreFatEM_ESPERA.AsString    := 'N';
end;

procedure TDMCadPreFat.cdsPreFat_VolNewRecord(DataSet: TDataSet);
begin
  cdsPreFat_VolFECHADA.AsString  := 'N';
  cdsPreFat_VolQTD_ETIQ.AsInteger := 0;
  cdsPreFat_VolQTD_PROD.AsInteger := 0;
end;

procedure TDMCadPreFat.cdsPreFat_ItensNewRecord(DataSet: TDataSet);
begin
  cdsPreFat_ItensQTD.AsInteger            := 0;
  cdsPreFat_ItensEXISTE_VOL_ETIQ.AsString := 'N';
end;

procedure TDMCadPreFat.mAuxVolumeNewRecord(DataSet: TDataSet);
begin
  mAuxVolumeQtd.AsInteger := 0;
end;

procedure TDMCadPreFat.cdsPreFat_Vol_EtiqCalcFields(DataSet: TDataSet);
begin
  if cdsPreFat_Vol_EtiqID_PEDIDO.AsInteger > 0 then
  begin
    qPedido.Close;
    qPedido.ParamByName('ID').AsInteger := cdsPreFat_Vol_EtiqID_PEDIDO.AsInteger;
    qPedido.Open;
    cdsPreFat_Vol_EtiqclNum_Pedido.AsInteger    := qPedidoNUM_PEDIDO.AsInteger;
    cdsPreFat_Vol_EtiqclPedido_Cliente.AsString := qPedidoPEDIDO_CLIENTE.AsString;
  end;


end;

end.
