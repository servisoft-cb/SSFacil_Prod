unit UDMCancelaLote;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider, LogTypes;

type
  TDMCancelaLote = class(TDataModule)
    sdsConsultaLote: TSQLDataSet;
    dspConsultaLote: TDataSetProvider;
    cdsConsultaLote: TClientDataSet;
    dsConsultaLote: TDataSource;
    cdsConsultaLoteREFERENCIA: TStringField;
    cdsConsultaLoteNOME_COMBINACAO: TStringField;
    cdsConsultaLoteNUM_ORDEM: TIntegerField;
    cdsConsultaLoteNUM_LOTE: TIntegerField;
    cdsConsultaLoteNOME_PROCESSO: TStringField;
    cdsConsultaLoteITEM_PROCESSO: TIntegerField;
    cdsConsultaLoteID_PROCESSO: TIntegerField;
    cdsConsultaLoteID_LOTE: TIntegerField;
    cdsConsultaLoteID_PEDIDO: TIntegerField;
    cdsConsultaLoteITEM_PEDIDO: TIntegerField;
    cdsConsultaLoteDTENTRADA: TDateField;
    cdsConsultaLoteDTBAIXA: TDateField;
    cdsConsultaLoteQTD: TFloatField;
    cdsConsultaLoteQTD_PRODUZIDO: TFloatField;
    cdsConsultaLoteQTD_CONSUMO: TFloatField;
    qPed: TSQLQuery;
    qPedQTD: TFloatField;
    cdsConsultaLotePEDIDO_CLIENTE: TStringField;
    qPedAnt: TSQLQuery;
    qPedAntQTD: TFloatField;
    mItens: TClientDataSet;
    mItensID_Pedido: TIntegerField;
    mItensItem_Pedido: TIntegerField;
    mItensID_Produto: TIntegerField;
    mItensId_Cor: TIntegerField;
    mItensQtd: TFloatField;
    mItensNome_Produto: TStringField;
    dsmItens: TDataSource;
    mItensReferencia: TStringField;
    mItensQtd_Ant: TFloatField;
    sdsPedido_Item: TSQLDataSet;
    dspPedido_Item: TDataSetProvider;
    cdsPedido_Item: TClientDataSet;
    cdsPedido_ItemID: TIntegerField;
    cdsPedido_ItemITEM: TIntegerField;
    cdsPedido_ItemID_PRODUTO: TIntegerField;
    cdsPedido_ItemID_COR: TFMTBCDField;
    cdsPedido_ItemQTD: TFloatField;
    cdsPedido_ItemNOME_PRODUTO: TStringField;
    cdsPedido_ItemREFERENCIA: TStringField;
    cdsPedido_ItemNOME_COR: TStringField;
    cdsConsultaLoteID_BAIXA: TIntegerField;
    cdsConsultaLoteITEM_BAIXA: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);
    
  public
    { Public declarations }
    ctConsultaLote : String;
    
  end;

var
  DMCancelaLote: TDMCancelaLote;

implementation

uses DmdDatabase, uUtilPadrao, LogProvider;

{$R *.dfm}

procedure TDMCancelaLote.DataModuleCreate(Sender: TObject);
var
  i, x: Integer;
  SR: TSearchRec;
  Origem, Destino: string;
  vIndices: string;
  aIndices: array of string;
begin
  ctConsultaLote := sdsConsultaLote.CommandText;
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

procedure TDMCancelaLote.DoLogAdditionalValues(ATableName: string;
  var AValues: TArrayLogData; var UserName: string);
begin
  UserName := vUsuario;
end;

end.
