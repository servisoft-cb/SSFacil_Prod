unit UDMBaixaMaterialOP;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, Dialogs, UDMEstoque, LogTypes;

type
  TDMBaixaMaterial = class(TDataModule)
    sdsLoteMat: TSQLDataSet;
    dspLoteMat: TDataSetProvider;
    dsLoteMat: TDataSource;
    sdsLoteMatNUM_ORDEM: TIntegerField;
    sdsLoteMatITEM: TIntegerField;
    sdsLoteMatID_MATERIAL: TIntegerField;
    sdsLoteMatQTD_CONSUMO: TFloatField;
    sdsLoteMatQTD_EST_BAIXADO: TFloatField;
    sdsLoteMatNOME: TStringField;
    cdsLoteMat: TClientDataSet;
    cdsLoteMatNUM_ORDEM: TIntegerField;
    cdsLoteMatITEM: TIntegerField;
    cdsLoteMatID_MATERIAL: TIntegerField;
    cdsLoteMatQTD_CONSUMO: TFloatField;
    cdsLoteMatQTD_EST_BAIXADO: TFloatField;
    cdsLoteMatNOME: TStringField;
    sdsLoteMatEst: TSQLDataSet;
    sdsLoteMatEstID: TIntegerField;
    sdsLoteMatEstNUM_ORDEM: TIntegerField;
    sdsLoteMatEstITEM: TIntegerField;
    sdsLoteMatEstQTD: TFloatField;
    sdsLoteMatEstDTMOVIMENTO: TDateField;
    sdsLoteMatEstID_MOVESTOQUE: TIntegerField;
    sdsLoteMatEstFILIAL: TIntegerField;
    dspLoteMatEst: TDataSetProvider;
    cdsLoteMatEst: TClientDataSet;
    cdsLoteMatEstID: TIntegerField;
    cdsLoteMatEstNUM_ORDEM: TIntegerField;
    cdsLoteMatEstITEM: TIntegerField;
    cdsLoteMatEstQTD: TFloatField;
    cdsLoteMatEstDTMOVIMENTO: TDateField;
    cdsLoteMatEstID_MOVESTOQUE: TIntegerField;
    cdsLoteMatEstFILIAL: TIntegerField;
    dsLotMatEst: TDataSource;
    cdsLoteMatSaldo: TFloatField;
    sdsFilial: TSQLDataSet;
    dspFilial: TDataSetProvider;
    cdsFilial: TClientDataSet;
    dsFilial: TDataSource;
    sdsFilialID: TIntegerField;
    sdsFilialNOME: TStringField;
    cdsFilialID: TIntegerField;
    cdsFilialNOME: TStringField;
    sdsLoteMatUNIDADE: TStringField;
    cdsLoteMatUNIDADE: TStringField;
    sdsLoteMatPRECO_VENDA: TFloatField;
    cdsLoteMatPRECO_VENDA: TFloatField;
    sdsMaterial_Nec: TSQLDataSet;
    dspMaterial_Nec: TDataSetProvider;
    cdsMaterial_Nec: TClientDataSet;
    cdsMaterial_NecQPED: TFloatField;
    cdsMaterial_NecQREM: TFloatField;
    cdsMaterial_NecID_MATERIAL: TIntegerField;
    cdsMaterial_NecID_COR_MAT: TFMTBCDField;
    cdsMaterial_NecQTD_PED: TFloatField;
    cdsMaterial_NecMATERIAL: TStringField;
    cdsMaterial_NecNOME_COR: TStringField;
    cdsMaterial_NecUNIDADE: TStringField;
    cdsMaterial_NecQTD_REM: TFloatField;
    cdsMaterial_NecQTD_ESTOQUE: TFMTBCDField;
    cdsMaterial_NecQTD_OC: TFloatField;
    cdsMaterial_NecQTD_ESTOQUE_MIN: TFloatField;
    cdsMaterial_NecQTD_SALDO: TFloatField;
    dsMaterial_Nec: TDataSource;
    sdsTalao_Est: TSQLDataSet;
    dspTalao_Est: TDataSetProvider;
    cdsTalao_Est: TClientDataSet;
    dsTalao_Est: TDataSource;
    sdsTalao_EstID: TIntegerField;
    sdsTalao_EstID_LOTE: TIntegerField;
    sdsTalao_EstNUM_TALAO: TIntegerField;
    sdsTalao_EstID_SETOR: TIntegerField;
    sdsTalao_EstID_MATERIAL: TIntegerField;
    sdsTalao_EstQTD: TFloatField;
    sdsTalao_EstFILIAL: TIntegerField;
    sdsTalao_EstID_MOVESTOQUE: TIntegerField;
    cdsTalao_EstID: TIntegerField;
    cdsTalao_EstID_LOTE: TIntegerField;
    cdsTalao_EstNUM_TALAO: TIntegerField;
    cdsTalao_EstID_SETOR: TIntegerField;
    cdsTalao_EstID_MATERIAL: TIntegerField;
    cdsTalao_EstQTD: TFloatField;
    cdsTalao_EstFILIAL: TIntegerField;
    cdsTalao_EstID_MOVESTOQUE: TIntegerField;
    procedure cdsLoteMatCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);

  public
    vMsg: string;
    vNum_Ord, vItem: Integer;
    fDMEstoque : TDMEstoque;
    procedure prc_Abrir_Lote(NUM_OP: Integer);
    procedure prc_Abrir_Filial;
    procedure prc_Abrir_Material_Estoque(NUM_ORDEM: Integer; ITEM: Integer);
    procedure prc_Inserir_LoteMatEst;
    procedure prc_Grava_LotMatEst;
    procedure prc_Exclui_LotMatEst;
    { Public declarations }
  end;

var
  DMBaixaMaterial: TDMBaixaMaterial;

implementation

uses
  DmdDatabase, LogProvider, uUtilPadrao;

{$R *.dfm}

{ TDMBaixaMaterial }

procedure TDMBaixaMaterial.prc_Abrir_Filial;
begin
  cdsFilial.Close;
  cdsFilial.Open;
end;

procedure TDMBaixaMaterial.prc_Abrir_Lote(NUM_OP: Integer);
begin
  cdsLoteMat.Close;
  sdsLoteMat.ParamByName('NUM_ORDEM').AsInteger := NUM_OP;
  cdsLoteMat.Open;
  if cdsLoteMat.IsEmpty then
  begin
    MessageDlg('Ordem de Produção não localizada!',mtError,[mbOK],0);
    cdsLoteMat.Close;
  end;
end;

procedure TDMBaixaMaterial.cdsLoteMatCalcFields(DataSet: TDataSet);
begin
  cdsLoteMatSaldo.AsFloat := cdsLoteMatQTD_CONSUMO.AsFloat - cdsLoteMatQTD_EST_BAIXADO.AsFloat;
end;

procedure TDMBaixaMaterial.prc_Abrir_Material_Estoque(NUM_ORDEM, ITEM: Integer);
begin
{  cdsLoteMatEst.Close;
  sdsLoteMatEst.ParamByName('Num_Ordem').AsInteger := NUM_ORDEM;
  sdsLoteMatEst.ParamByName('Item').AsInteger := ITEM;
  cdsLoteMatEst.Open;}
end;

procedure TDMBaixaMaterial.prc_Inserir_LoteMatEst;
var
  vItemAux: Integer;
begin
  //Estava faltando o indice
  //E se pega pela sequencial, só se faz dessa maneira em casos que é o item
  cdsLoteMatEst.Last;
  vItemAux := cdsLoteMatEstID.AsInteger;
  cdsLoteMatEst.Insert;
  cdsLoteMatEstNUM_ORDEM.AsInteger := cdsLoteMatNUM_ORDEM.AsInteger;
  cdsLoteMatEstITEM.AsInteger := cdsLoteMatITEM.AsInteger;
end;

procedure TDMBaixaMaterial.prc_Grava_LotMatEst;
var
  vAux, vID_Estoque: Integer;
begin
  vMsg := '';
  if cdsLoteMatEstQTD.AsFloat <= 0 then
    vMsg := '**Quantidade deve ser informada!';
  if cdsLoteMatEstDTMOVIMENTO.AsFloat <= 0 then
    vMsg := vMsg + ' **Data do Movimento deve ser Informada!';
  if cdsLoteMatEstFILIAL.AsInteger <= 0 then
    vMsg := vMsg + '**Filial deve ser Informada!';

  if vMsg <> '' then
  begin
    exit;
  end;
  vAux := dmDatabase.ProximaSequencia('LOTE_MAT_EST', 0);
  cdsLoteMatEstID.AsInteger := vAux;
  fDMEstoque := TDMEstoque.Create(Self);
  vID_Estoque := fDMEstoque.fnc_Gravar_Estoque(0, cdsLoteMatEstFILIAL.AsInteger, 1, //aqui verificar o local do estoque
      cdsLoteMatID_MATERIAL.AsInteger, cdsLoteMatNUM_ORDEM.AsInteger, // Numero nota
      0, // Cliente
      0, // CFOP
      0, // ID nota fiscal
      0, 'S', //Tipo Nota
      'MOP', cdsLoteMatUNIDADE.AsString, cdsLoteMatUNIDADE.AsString, '', //serie
      '', //Tamanho
      cdsLoteMatEstDTMOVIMENTO.AsDateTime, cdsLoteMatPRECO_VENDA.AsFloat, cdsLoteMatEstQTD.AsFloat, 0, //%ICMS
      0, //%IPI
      0, //Desconto
      0, //% Trib ICMS
      0, //Valor Frete
      cdsLoteMatEstQTD.AsFloat, cdsLoteMatPRECO_VENDA.AsFloat, 0, //Desconto
      0, '', 0, // Cor
      '', 'N',0,0,0,0,0); //ver aqui sobre Lote Controle  04/11/2015
  cdsLoteMatEstID_MOVESTOQUE.AsInteger := vID_Estoque; 
  cdsLoteMatEst.Post;
  cdsLoteMatEst.ApplyUpdates(0);
  FreeAndNil(fDMEstoque);
end;

procedure TDMBaixaMaterial.prc_Exclui_LotMatEst;
begin
  if cdsLoteMatEst.IsEmpty then
  begin
    vMsg := 'Selecione um Registro!';
    Exit;
  end;
  cdsLoteMatEst.Delete;
  cdsLoteMatEst.ApplyUpdates(0);
end;

procedure TDMBaixaMaterial.DoLogAdditionalValues(ATableName: string;
  var AValues: TArrayLogData; var UserName: string);
begin
  UserName := vUsuario;
end;

procedure TDMBaixaMaterial.DataModuleCreate(Sender: TObject);
var
  i, x: Integer;
  vIndices: string;
  aIndices: array of string;
begin
  cdsFilial.Close;
  cdsFilial.Open;

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

end.

