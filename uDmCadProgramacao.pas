unit UDMCadProgramacao;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, dbXPress, LogTypes, Dialogs;

type
  TDMCadProgramacao = class(TDataModule)
    dspProgramacao: TDataSetProvider;
    sdsProgramacao: TSQLDataSet;
    sdsProgramacaoID: TIntegerField;
    sdsProgramacaoID_BAIXA: TIntegerField;
    sdsProgramacaoITEM_BAIXA: TIntegerField;
    sdsProgramacaoID_PROCESSO: TIntegerField;
    sdsProgramacaoID_LOTE: TIntegerField;
    sdsProgramacaoNUM_ORDEM: TIntegerField;
    sdsProgramacaoNUM_LOTE: TIntegerField;
    sdsProgramacaoDTINICIAL: TDateField;
    sdsProgramacaoHRINICIAL: TTimeField;
    sdsProgramacaoDTFINAL: TDateField;
    sdsProgramacaoHRFINAL: TTimeField;
    sdsProgramacaoID_MAQUINA: TIntegerField;
    cdsProgramacao: TClientDataSet;
    cdsProgramacaoID: TIntegerField;
    cdsProgramacaoID_BAIXA: TIntegerField;
    cdsProgramacaoITEM_BAIXA: TIntegerField;
    cdsProgramacaoID_PROCESSO: TIntegerField;
    cdsProgramacaoID_LOTE: TIntegerField;
    cdsProgramacaoNUM_ORDEM: TIntegerField;
    cdsProgramacaoNUM_LOTE: TIntegerField;
    cdsProgramacaoDTINICIAL: TDateField;
    cdsProgramacaoHRINICIAL: TTimeField;
    cdsProgramacaoDTFINAL: TDateField;
    cdsProgramacaoHRFINAL: TTimeField;
    cdsProgramacaoID_MAQUINA: TIntegerField;
    dsProgramacao: TDataSource;
    sdsPend: TSQLDataSet;
    dspPend: TDataSetProvider;
    cdsPend: TClientDataSet;
    dsPend: TDataSource;
    cdsPendNOME_PROCESSO: TStringField;
    cdsPendID_MAQUINA: TIntegerField;
    cdsPendNUM_ORDEM: TIntegerField;
    cdsPendNUM_LOTE: TIntegerField;
    cdsPendNOME_PRODUTO: TStringField;
    cdsPendREFERENCIA: TStringField;
    cdsPendID_BAIXA: TIntegerField;
    cdsPendITEM_BAIXA: TIntegerField;
    cdsPendQTD: TFloatField;
    sdsMaqPend: TSQLDataSet;
    dspMaqPend: TDataSetProvider;
    cdsMaqPend: TClientDataSet;
    dsMaqPend: TDataSource;
    cdsMaqPendID: TIntegerField;
    cdsMaqPendNOME_MAQUINA: TStringField;
    cdsMaqPendQTD_BOCA: TIntegerField;
    cdsMaqPendQTD_FUSO: TIntegerField;
    cdsMaqPendESPESSURA: TFloatField;
    cdsMaqPendID_MAQUINA: TIntegerField;
    cdsMaqPendBOCA_DISPONIVEL: TFMTBCDField;
    cdsPendID_PRODUTO: TIntegerField;
    cdsPendTOTAL_BATIDAS: TFloatField;
    cdsPendQTD_POR_MIN: TFloatField;
    cdsPendTEMPO_PROD: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dspProgramacaoUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
  private
    { Private declarations }
    procedure DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);
  public
    { Public declarations }
    vMSGErro: String;
        
    procedure prc_Localizar(ID: Integer);
    procedure prc_Inserir;
    procedure prc_Gravar;
    procedure prc_Excluir;

  end;

var
  DMCadProgramacao: TDMCadProgramacao;

implementation

uses DmdDatabase, uUtilPadrao, LogProvider, Math;

{$R *.dfm}

{ TDMCadCFOP}

procedure TDMCadProgramacao.prc_Inserir;
var
  vAux: Integer;
  sds: TSQLDataSet;
  vNumAux: Integer;
begin
  if not cdsProgramacao.Active then
    prc_Localizar(-1);
  vAux := dmDatabase.ProximaSequencia('PROGRAMACAO',0);

  cdsProgramacao.Insert;
  cdsProgramacaoID.AsInteger    := vAux;
end;

procedure TDMCadProgramacao.prc_Excluir;
begin
  if not(cdsProgramacao.Active) or (cdsProgramacao.IsEmpty) then
    Exit;
  cdsProgramacao.Delete;
  cdsProgramacao.ApplyUpdates(0);
end;

procedure TDMCadProgramacao.prc_Gravar;
var
  sds: TSQLDataSet;
  ID: TTransactionDesc;
  vNumVale: Integer;
begin
  vMsgErro := '';
  //if cdsProgramacaoDATA.AsDateTime < 10 then
  //  vMsgErro := vMsgErro + #13 + '*** Data não informada!';
  if trim(vMSGErro) <> '' then
  begin
    MessageDlg(vMSGErro, mtError, [mbOk], 0);
    exit;
  end;
  sds := TSQLDataSet.Create(nil);
  ID.TransactionID  := 1;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);

  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := ' UPDATE TABELALOC SET FLAG = 1 WHERE TABELA = ' + QuotedStr('PROGRAMACAO');
    sds.ExecSQL();

    cdsProgramacao.Post;
    cdsProgramacao.ApplyUpdates(0);

    dmDatabase.scoDados.Commit(ID);
  except
    dmDatabase.scoDados.Rollback(ID);
    raise;
  end;
  FreeAndNil(sds);
end;

procedure TDMCadProgramacao.prc_Localizar(ID: Integer); //-1 é para inclusão
begin
  cdsProgramacao.Close;
  sdsProgramacao.ParamByName('ID').AsInteger := ID;
  cdsProgramacao.Open;
end;

procedure TDMCadProgramacao.DataModuleCreate(Sender: TObject);
var
  i, x: Integer;
  SR: TSearchRec;
  Origem, Destino: string;
  vIndices: string;
  aIndices: array of string;
begin
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

procedure TDMCadProgramacao.dspProgramacaoUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  dmDatabase.prc_UpdateError(DataSet.Name,UpdateKind,E);
end;

procedure TDMCadProgramacao.DoLogAdditionalValues(ATableName: string;
  var AValues: TArrayLogData; var UserName: string);
begin
  UserName := vUsuario;
end;

end.
