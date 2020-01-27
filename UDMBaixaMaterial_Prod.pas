unit UDMBaixaMaterial_Prod;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, Provider, DBClient;

type
  TDMBaixaMaterial_Prod = class(TDataModule)
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
    sdsLote_Mat_ProdDTPAGO: TDateField;
    sdsLote_Mat_ProdDTRETORNO: TDateField;
    sdsLote_Mat_ProdNUM_LOTE_AUX: TIntegerField;
    sdsLote_Mat_ProdREFERENCIA: TStringField;
    sdsLote_Mat_ProdIMPRESSO: TStringField;
    dspLote_Mat_Prod: TDataSetProvider;
    sdsLote_Mat_Prod: TSQLDataSet;
    cdsLote_Mat_Prod: TClientDataSet;
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
    cdsLote_Mat_ProdDTPAGO: TDateField;
    cdsLote_Mat_ProdDTRETORNO: TDateField;
    cdsLote_Mat_ProdNUM_LOTE_AUX: TIntegerField;
    cdsLote_Mat_ProdREFERENCIA: TStringField;
    cdsLote_Mat_ProdIMPRESSO: TStringField;
    dsLote_Mat_Prod: TDataSource;
    sdsConsLoteMat_Prod: TSQLDataSet;
    dspConsLoteMat_Prod: TDataSetProvider;
    cdsConsLoteMat_Prod: TClientDataSet;
    dsConsLoteMat_Prod: TDataSource;
    cdsConsLoteMat_ProdID: TIntegerField;
    cdsConsLoteMat_ProdITEM: TIntegerField;
    cdsConsLoteMat_ProdNUM_ORDEM: TIntegerField;
    cdsConsLoteMat_ProdID_COR_PRODUTO: TIntegerField;
    cdsConsLoteMat_ProdID_MATERIAL: TIntegerField;
    cdsConsLoteMat_ProdID_COR_MATERIAL: TIntegerField;
    cdsConsLoteMat_ProdQTD_CONSUMO: TFloatField;
    cdsConsLoteMat_ProdQTD_PRODUTO: TFloatField;
    cdsConsLoteMat_ProdQTD_PAGO: TFloatField;
    cdsConsLoteMat_ProdQTD_RETORNO: TFloatField;
    cdsConsLoteMat_ProdQTD_DIFERENCA: TFloatField;
    cdsConsLoteMat_ProdQTD_CONES: TIntegerField;
    cdsConsLoteMat_ProdDTPAGO: TDateField;
    cdsConsLoteMat_ProdDTRETORNO: TDateField;
    cdsConsLoteMat_ProdNUM_LOTE_AUX: TIntegerField;
    cdsConsLoteMat_ProdREFERENCIA: TStringField;
    cdsConsLoteMat_ProdIMPRESSO: TStringField;
    cdsConsLoteMat_ProdNOME_MATERIAL: TStringField;
    cdsConsLoteMat_ProdREFERENCIA_MAT: TStringField;
    cdsConsLoteMat_ProdNOME_COR_MAT: TStringField;
    cdsConsLoteMat_ProdNOME_COR_PROD: TStringField;
    sdsLote_Mat_Prod_Est: TSQLDataSet;
    dspLote_Mat_Prod_Est: TDataSetProvider;
    cdsLote_Mat_Prod_Est: TClientDataSet;
    dsLote_Mat_Prod_Est: TDataSource;
    sdsLote_Mat_Prod_EstID: TIntegerField;
    sdsLote_Mat_Prod_EstITEM: TIntegerField;
    sdsLote_Mat_Prod_EstITEM_EST: TIntegerField;
    sdsLote_Mat_Prod_EstDATA: TDateField;
    sdsLote_Mat_Prod_EstHORA: TTimeField;
    sdsLote_Mat_Prod_EstQTD: TFloatField;
    sdsLote_Mat_Prod_EstID_MOVESTOQUE: TIntegerField;
    sdsLote_Mat_Prod_EstTIPO_ES: TStringField;
    cdsLote_Mat_Prod_EstID: TIntegerField;
    cdsLote_Mat_Prod_EstITEM: TIntegerField;
    cdsLote_Mat_Prod_EstITEM_EST: TIntegerField;
    cdsLote_Mat_Prod_EstDATA: TDateField;
    cdsLote_Mat_Prod_EstHORA: TTimeField;
    cdsLote_Mat_Prod_EstQTD: TFloatField;
    cdsLote_Mat_Prod_EstID_MOVESTOQUE: TIntegerField;
    cdsLote_Mat_Prod_EstTIPO_ES: TStringField;
    sdsLote_Mat_Prod_EstDESC_TIPO_ES: TStringField;
    cdsLote_Mat_Prod_EstDESC_TIPO_ES: TStringField;
    cdsConsLoteMat_ProdPRECO_CUSTO: TFloatField;
    qParametros_Est: TSQLQuery;
    qParametros_EstID_FILIAL_LOTE_MAT_EST: TIntegerField;
    cdsConsLoteMat_ProdUNIDADE_MATERIAL: TStringField;
    sdsLote_Mat_Prod_EstFILIAL: TIntegerField;
    sdsLote_Mat_Prod_EstUSUARIO: TStringField;
    cdsLote_Mat_Prod_EstFILIAL: TIntegerField;
    cdsLote_Mat_Prod_EstUSUARIO: TStringField;
    sdsLote_Mat_ProdFINALIZADO: TStringField;
    cdsLote_Mat_ProdFINALIZADO: TStringField;
    cdsConsLoteMat_ProdFINALIZADO: TStringField;
    SQLQuery1: TSQLQuery;
    sdsPRC_Atualiza_Lote_Mat_Prod: TSQLDataSet;
    sdsConsPagRet: TSQLDataSet;
    dspConsPagRet: TDataSetProvider;
    cdsConsPagRet: TClientDataSet;
    dsConsPagRet: TDataSource;
    cdsConsPagRetID: TIntegerField;
    cdsConsPagRetID_MATERIAL: TIntegerField;
    cdsConsPagRetNUM_ORDEM: TIntegerField;
    cdsConsPagRetITEM: TIntegerField;
    cdsConsPagRetID_COR_PRODUTO: TIntegerField;
    cdsConsPagRetID_COR_MATERIAL: TIntegerField;
    cdsConsPagRetQTD_CONSUMO: TFloatField;
    cdsConsPagRetQTD_PRODUTO: TFloatField;
    cdsConsPagRetQTD_PAGO: TFloatField;
    cdsConsPagRetQTD_RETORNO: TFloatField;
    cdsConsPagRetQTD_DIFERENCA: TFloatField;
    cdsConsPagRetQTD_CONES: TIntegerField;
    cdsConsPagRetNOME_MATERIAL: TStringField;
    cdsConsPagRetREFERENCIA_MAT: TStringField;
    cdsConsPagRetNOME_COR_MAT: TStringField;
    cdsConsPagRetNOME_COR_PROD: TStringField;
    cdsConsPagRetPRECO_CUSTO: TFloatField;
    cdsConsPagRetUNIDADE_MATERIAL: TStringField;
    cdsConsPagRetDATA: TDateField;
    cdsConsPagRetITEM_EST: TIntegerField;
    cdsConsPagRetTIPO_ES: TStringField;
    cdsConsPagRetQTD: TFloatField;
    cdsConsPagRetFINALIZADO: TStringField;
    cdsConsPagRetDESC_TIPO: TStringField;
    cdsConsPagRetREFERENCIA: TStringField;
    sdsConsPagRet_Acum: TSQLDataSet;
    dspConsPagRet_Acum: TDataSetProvider;
    cdsConsPagRet_Acum: TClientDataSet;
    dsConsPagRet_Acum: TDataSource;
    cdsConsPagRet_AcumID_MATERIAL: TIntegerField;
    cdsConsPagRet_AcumID_COR_MATERIAL: TIntegerField;
    cdsConsPagRet_AcumNOME_MATERIAL: TStringField;
    cdsConsPagRet_AcumNOME_COR_MAT: TStringField;
    cdsConsPagRet_AcumUNIDADE_MATERIAL: TStringField;
    cdsConsPagRet_AcumTIPO_ES: TStringField;
    cdsConsPagRet_AcumQTD: TFloatField;
    cdsConsPagRet_AcumDESC_TIPO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dspLote_Mat_Prod_EstGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
  private
    { Private declarations }
  public
    { Public declarations }
     ctConsLoteMat_Prod : String;
     ctConsPagRet : String;

     procedure prc_Abrir_Lote_Mat_Prod(Num_Ordem, Item : Integer);
     function fnc_Finalizado(ID,Item : Integer) : String;

  end;

var
  DMBaixaMaterial_Prod: TDMBaixaMaterial_Prod;

implementation

uses DmdDatabase;

{$R *.dfm}

procedure TDMBaixaMaterial_Prod.DataModuleCreate(Sender: TObject);
begin
  ctConsLoteMat_Prod := sdsConsLoteMat_Prod.CommandText;
  ctConsPagRet       := sdsConsPagRet.CommandText;
  qParametros_Est.Open;
end;

procedure TDMBaixaMaterial_Prod.prc_Abrir_Lote_Mat_Prod(Num_Ordem,
  Item: Integer);
begin
  cdsLote_Mat_Prod.Close;
  cdsLote_Mat_Prod_Est.Close;
  sdsLote_Mat_Prod.ParamByName('NUM_ORDEM').AsInteger := Num_Ordem;
  sdsLote_Mat_Prod.ParamByName('ITEM').AsInteger      := Item;
  cdsLote_Mat_Prod.Open;

  if cdsLote_Mat_Prod.IsEmpty then
    exit;

  cdsLote_Mat_Prod_Est.Close;
  sdsLote_Mat_Prod_Est.ParamByName('ID').AsInteger   := cdsLote_Mat_ProdID.AsInteger;
  sdsLote_Mat_Prod_Est.ParamByName('ITEM').AsInteger := cdsLote_Mat_ProdITEM.AsInteger;
  cdsLote_Mat_Prod_Est.Open;
end;

procedure TDMBaixaMaterial_Prod.dspLote_Mat_Prod_EstGetTableName(
  Sender: TObject; DataSet: TDataSet; var TableName: String);
begin
  TableName := 'LOTE_MAT_PROD_EST';
end;

function TDMBaixaMaterial_Prod.fnc_Finalizado(ID,Item: Integer): String;
var
  sds: TSQLDataSet;
begin
  Result := 'N';
  sds               := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.Close;
    sds.CommandText   := 'select count(1) CONTADOR from LOTE_MAT_PROD_EST L '
                       + 'where L.ID = :ID and L.ITEM = :ITEM and L.TIPO_ES = ' + QuotedStr('E');
    sds.ParamByName('ID').AsInteger   := ID;
    sds.ParamByName('ITEM').AsInteger := Item;
    sds.Open;
    if sds.FieldByName('CONTADOR').AsInteger > 0 then
      Result := 'S';
  finally
    FreeAndNil(sds);
  end;
end;

end.
