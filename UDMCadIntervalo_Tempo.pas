unit UDMCadIntervalo_Tempo;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, LogTypes;

type
  TDMCadIntervalo_Tempo = class(TDataModule)
    sdsIntervalo_Tempo: TSQLDataSet;
    dspIntervalo_Tempo: TDataSetProvider;
    cdsIntervalo_Tempo: TClientDataSet;
    dsIntervalo_Tempo: TDataSource;
    sdsIntervalo_TempoID: TIntegerField;
    sdsIntervalo_TempoHRINICIAL: TTimeField;
    sdsIntervalo_TempoHRFINAL: TTimeField;
    sdsIntervalo_TempoTEMPO: TFloatField;
    sdsIntervalo_TempoDESCRICAO: TStringField;
    cdsIntervalo_TempoID: TIntegerField;
    cdsIntervalo_TempoHRINICIAL: TTimeField;
    cdsIntervalo_TempoHRFINAL: TTimeField;
    cdsIntervalo_TempoTEMPO: TFloatField;
    cdsIntervalo_TempoDESCRICAO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dspIntervalo_TempoUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
  private
    { Private declarations }
    procedure DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);
  public
    { Public declarations }
    vMsgErro: String;
    ctCommand: String;

    procedure prc_Localizar(ID: Integer); //-1 = Inclusão
    procedure prc_Inserir;
    procedure prc_Gravar;
    procedure prc_Excluir;
  end;

var
  DMCadIntervalo_Tempo: TDMCadIntervalo_Tempo;

implementation

uses DmdDatabase, LogProvider, uUtilPadrao, DateUtils;

{$R *.dfm}

{ TDMCadPais }

procedure TDMCadIntervalo_Tempo.prc_Inserir;
var
  vAux: Integer;
begin
  if not cdsIntervalo_Tempo.Active then
    prc_Localizar(-1);
  vAux := dmDatabase.ProximaSequencia('INTERVALO_TEMPO',0);

  cdsIntervalo_Tempo.Insert;
  cdsIntervalo_TempoID.AsInteger := vAux;
end;

procedure TDMCadIntervalo_Tempo.prc_Excluir;
begin
  if not(cdsIntervalo_Tempo.Active) or (cdsIntervalo_Tempo.IsEmpty) then
    exit;
  cdsIntervalo_Tempo.Delete;
  cdsIntervalo_Tempo.ApplyUpdates(0);
end;

procedure TDMCadIntervalo_Tempo.prc_Gravar;
var
  vAux : Real;
begin
  vMsgErro := '';
  if (cdsIntervalo_TempoHRFINAL.AsDateTime = 0) and (cdsIntervalo_TempoHRINICIAL.AsDateTime = 0) then
    vMsgErro := 'Hora não informada!';
  if vMsgErro <> '' then
    exit;

  vAux := HoursBetween(cdsIntervalo_TempoHRINICIAL.AsDateTime,cdsIntervalo_TempoHRFINAL.AsDateTime);
  vAux :=  HoursBetween(cdsIntervalo_TempoHRINICIAL.AsDateTime,cdsIntervalo_TempoHRFINAL.AsDateTime);

  cdsIntervalo_TempoTEMPO.AsFloat := vAux;

  cdsIntervalo_Tempo.Post;
  cdsIntervalo_Tempo.ApplyUpdates(0);
end;

procedure TDMCadIntervalo_Tempo.prc_Localizar(ID: Integer);
begin
  cdsIntervalo_Tempo.Close;
  sdsIntervalo_Tempo.CommandText := ctCommand;
  if ID <> 0 then
    sdsIntervalo_Tempo.CommandText := sdsIntervalo_Tempo.CommandText + ' WHERE ID = ' + IntToStr(ID);
  cdsIntervalo_Tempo.Open;
end;

procedure TDMCadIntervalo_Tempo.DataModuleCreate(Sender: TObject);
var
  i, x: Integer;
  vIndices: string;
  aIndices: array of string;
begin
  ctCommand := sdsIntervalo_Tempo.CommandText;
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

procedure TDMCadIntervalo_Tempo.dspIntervalo_TempoUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  dmDatabase.prc_UpdateError(DataSet.Name,UpdateKind,E);
end;

procedure TDMCadIntervalo_Tempo.DoLogAdditionalValues(ATableName: string;
  var AValues: TArrayLogData; var UserName: string);
begin
  UserName := vUsuario;
end;

end.
