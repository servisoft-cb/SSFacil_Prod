unit UDMLoteImp_Calc;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, Variants,
  frxClass, frxDBSet, frxRich, frxExportMail, frxExportPDF, frxBarcode, dialogs;

type
  TDMLoteImp_Calc = class(TDataModule)
    frxReport1: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxMailExport1: TfrxMailExport;
    frxRichObject1: TfrxRichObject;
    frxBarCodeObject1: TfrxBarCodeObject;
    sdsConsulta_Lote: TSQLDataSet;
    dspConsulta_Lote: TDataSetProvider;
    cdsConsulta_Lote: TClientDataSet;
    dsConsulta_Lote: TDataSource;
    sdsSetor: TSQLDataSet;
    dspSetor: TDataSetProvider;
    cdsSetor: TClientDataSet;
    dsSetor: TDataSource;
    frxConsulta_Lote: TfrxDBDataset;
    cdsSetorID: TIntegerField;
    cdsSetorNOME: TStringField;
    cdsSetorDESPESA_RATEIO: TFloatField;
    cdsSetorGERAR_TALAO: TStringField;
    cdsSetorLIMITE_POR_TALAO: TStringField;
    cdsSetorQTD_LIMITE_POR_TALAO: TIntegerField;
    cdsSetorMOSTRAR_ORC: TStringField;
    cdsSetorORDEM_ORC: TIntegerField;
    cdsSetorENTRADA_AUT: TStringField;
    cdsSetorIMP_MAPA: TStringField;
    cdsSetorENCERRA_PROD: TStringField;
    cdsSetorLER_CBARRA1: TStringField;
    cdsConsulta_LoteID: TIntegerField;
    cdsConsulta_LoteNUM_TALAO: TIntegerField;
    cdsConsulta_LoteITEM: TIntegerField;
    cdsConsulta_LoteID_SETOR: TIntegerField;
    cdsConsulta_LoteDTENTRADA: TDateField;
    cdsConsulta_LoteHRENTRADA: TTimeField;
    cdsConsulta_LoteDTSAIDA: TDateField;
    cdsConsulta_LoteHRSAIDA: TTimeField;
    cdsConsulta_LoteQTD: TFloatField;
    cdsConsulta_LoteTOTAL_HORAS: TFloatField;
    cdsConsulta_LoteID_PRODUTO: TIntegerField;
    cdsConsulta_LoteTAMANHO: TStringField;
    cdsConsulta_LoteREFERENCIA: TStringField;
    cdsConsulta_LoteNUM_LOTE: TIntegerField;
    cdsConsulta_LoteNUM_ORDEM: TIntegerField;
    cdsConsulta_LoteNOME_SETOR: TStringField;
    cdsConsulta_LoteID_COMBINACAO: TIntegerField;
    cdsConsulta_LoteNOME_COMBINACAO: TStringField;
    cdsConsulta_LoteDTENTREGA: TDateField;
    cdsConsulta_LoteNUM_REMESSA: TStringField;
    qParametros_Lote: TSQLQuery;
    qParametros_LoteUSA_REMESSA: TStringField;
    sdsConsLote_Novo: TSQLDataSet;
    dspConsLote_Novo: TDataSetProvider;
    cdsConsLote_Novo: TClientDataSet;
    dsConsLote_Novo: TDataSource;
    cdsConsLote_NovoID_PRODUTO: TIntegerField;
    cdsConsLote_NovoID_COMBINACAO: TIntegerField;
    cdsConsLote_NovoNOME_COMBINACAO: TStringField;
    cdsConsLote_NovoNUM_LOTE: TIntegerField;
    cdsConsLote_NovoNUM_ORDEM: TIntegerField;
    cdsConsLote_NovoDTENTREGA: TDateField;
    cdsConsLote_NovoDTEMISSAO: TDateField;
    cdsConsLote_NovoQTD_TALOES: TIntegerField;
    cdsConsLote_NovoQTD: TFloatField;
    cdsConsLote_NovoNOME_PRODUTO: TStringField;
    cdsConsLote_NovoREFERENCIA: TStringField;
    frxConsLote_Novo: TfrxDBDataset;
    sdsConsTalao_Novo: TSQLDataSet;
    dspConsTalao_Novo: TDataSetProvider;
    cdsConsTalao_Novo: TClientDataSet;
    cdsConsTalao_NovoID: TIntegerField;
    cdsConsTalao_NovoQTD: TFloatField;
    cdsConsTalao_NovoNUM_TALAO: TIntegerField;
    cdsConsTalao_NovoID_COMBINACAO: TIntegerField;
    cdsConsTalao_NovoID_PRODUTO: TIntegerField;
    cdsConsTalao_NovoTAMANHO: TStringField;
    dsConsTalao_Novo: TDataSource;
    frxConsTalao_Novo: TfrxDBDataset;
    cdsConsLote_NovoID: TIntegerField;
    sdsProdMat: TSQLDataSet;
    dspProdMat: TDataSetProvider;
    cdsProdMat: TClientDataSet;
    dsProdMat: TDataSource;
    frxProdMat: TfrxDBDataset;
    cdsProdMatID: TIntegerField;
    cdsProdMatITEM: TIntegerField;
    cdsProdMatITEM_MAT: TIntegerField;
    cdsProdMatID_POSICAO: TIntegerField;
    cdsProdMatID_MATERIAL: TIntegerField;
    cdsProdMatID_COR: TIntegerField;
    cdsProdMatQTD_CONSUMO: TFloatField;
    cdsProdMatQTD_UNIDADE: TFloatField;
    cdsProdMatUNIDADE: TStringField;
    cdsProdMatTINGIMENTO: TStringField;
    cdsProdMatIMP_TALAO: TStringField;
    cdsProdMatID_SETOR: TIntegerField;
    cdsProdMatNOME_MATERIAL: TStringField;
    cdsProdMatNOME_POSICAO: TStringField;
    cdsProdMatID_COR_COMBINACAO: TIntegerField;
    cdsProdMatNOME_SETOR: TStringField;
    cdsProdMatORDEM_ORC: TIntegerField;
    cdsProdMatNOME_COR_MAT: TStringField;
    cdsConsTalao_NovoclCodBarra: TStringField;
    cdsConsTalao_NovoNUM_LOTE: TIntegerField;
    cdsConsLote_NovoNOME_CLIENTE: TStringField;
    cdsConsLote_NovoNUM_PEDIDO: TIntegerField;
    cdsConsLote_NovoPEDIDO_CLIENTE: TStringField;
    cdsConsLote_NovoclCodBarra: TStringField;
    cdsConsLote_NovoID_FORMA: TIntegerField;
    cdsConsLote_NovoNOME_FORMA: TStringField;
    cdsConsLote_NovoCARIMBO: TStringField;
    cdsConsLote_NovoCAIXINHA: TStringField;
    cdsConsLote_NovoID_LINHA: TIntegerField;
    cdsConsLote_NovoNOME_CONSTRUCAO: TStringField;
    sdsConsTalao_Tam: TSQLDataSet;
    dspConsTalao_Tam: TDataSetProvider;
    cdsConsTalao_Tam: TClientDataSet;
    cdsConsTalao_TamQTD: TFloatField;
    cdsConsTalao_TamTAMANHO: TStringField;
    dsConsTalao_Tam: TDataSource;
    frxConsTalao_Tam: TfrxDBDataset;
    mImpAux: TClientDataSet;
    dsmImpAux: TDataSource;
    mImpAuxID: TIntegerField;
    frxmImpAux: TfrxDBDataset;
    sdsConsLote_Processo: TSQLDataSet;
    dspConsLote_Processo: TDataSetProvider;
    cdsConsLote_Processo: TClientDataSet;
    cdsConsLote_ProcessoID: TIntegerField;
    cdsConsLote_ProcessoID_LOTE: TIntegerField;
    cdsConsLote_ProcessoID_PROCESSO: TIntegerField;
    cdsConsLote_ProcessoID_SETOR: TIntegerField;
    cdsConsLote_ProcessoID_POSICAO: TIntegerField;
    cdsConsLote_ProcessoNOME_PROCESSO: TStringField;
    cdsConsLote_ProcessoNOME_SETOR: TStringField;
    cdsConsLote_ProcessoNOME_POSICAO: TStringField;
    dsConsLote_Processo: TDataSource;
    frxConsLote_Processo: TfrxDBDataset;
    cdsConsulta_LoteQTD_PRODUZIDO: TFloatField;
    cdsConsulta_LoteQTD_PENDENTE: TFloatField;
    cdsConsLote_ProcessoQTD: TFloatField;
    cdsConsLote_ProcessoQTD_PENDENTE: TFloatField;
    cdsConsLote_ProcessoQTD_PRODUZIDO: TFloatField;
    cdsConsLote_ProcessoITEM: TIntegerField;
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
    cdsConsProcessoNUM_LOTE: TIntegerField;
    cdsConsProcessoNUM_ORDEM: TIntegerField;
    cdsConsProcessoREFERENCIA: TStringField;
    cdsConsProcessoPEDIDO_CLIENTE: TStringField;
    cdsConsProcessoNUM_PEDIDO: TIntegerField;
    dsConsProcesso: TDataSource;
    frxConsProcesso: TfrxDBDataset;
    mImpAuxItem: TIntegerField;
    cdsConsProcessoNOME_PRODUTO: TStringField;
    cdsConsProcessoNOME_COMBINACAO: TStringField;
    sdsProcesso: TSQLDataSet;
    dspProcesso: TDataSetProvider;
    cdsProcesso: TClientDataSet;
    dsProcesso: TDataSource;
    cdsConsProcessoDTENTRADA: TDateField;
    cdsConsProcessoDTBAIXA: TDateField;
    qParametros_LoteLOTE_CALCADO_NOVO: TStringField;
    cdsConsLote_NovoNOME_MODELO: TStringField;
    cdsConsProcessoID_COR_MAT: TIntegerField;
    cdsConsProcessoNOME_COR_MAT: TStringField;
    cdsConsProcessoNOME_MODELO: TStringField;
    cdsConsLote_NovoFOTO: TStringField;
    mImpAuxNum_Lote: TIntegerField;
    mMaterial: TClientDataSet;
    mMaterialItem: TIntegerField;
    mMaterialNome_Setor1: TStringField;
    mMaterialNome_Material1: TStringField;
    mMaterialNome_Cor1: TStringField;
    mMaterialNome_Posicao1: TStringField;
    mMaterialQtd_Consumo1: TFloatField;
    mMaterialNome_Setor2: TStringField;
    mMaterialNome_Material2: TStringField;
    mMaterialNome_Cor2: TStringField;
    mMaterialNome_Posicao2: TStringField;
    mMaterialQtd_Consumo2: TFloatField;
    dsmMaterial: TDataSource;
    frxmMaterial: TfrxDBDataset;
    sdsMatProc: TSQLDataSet;
    dspMatProc: TDataSetProvider;
    cdsMatProc: TClientDataSet;
    dsMatProc: TDataSource;
    cdsMatProcNOME: TStringField;
    cdsMatProcNOME_POSICAO: TStringField;
    frxMatProc: TfrxDBDataset;
    cdsConsProcessoID_PRODUTO: TIntegerField;
    cdsConsProcessoID_COMBINACAO: TIntegerField;
    cdsConsProcessoID_POSICAO_IMP: TIntegerField;
    cdsConsProcessoID_POSICAO_IMP2: TIntegerField;
    procedure dspLoteUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);
    procedure DataModuleCreate(Sender: TObject);
    procedure frxConsLote_NovoFirst(Sender: TObject);
    procedure cdsConsTalao_NovoCalcFields(DataSet: TDataSet);
    procedure cdsConsLote_NovoCalcFields(DataSet: TDataSet);
    procedure frxmImpAuxFirst(Sender: TObject);
    procedure cdsConsProcessoCalcFields(DataSet: TDataSet);
    procedure frxConsProcessoNext(Sender: TObject);
  private
    { Private declarations }
    procedure prc_Montra_SQL_ConsProcesso;

  public
    { Public declarations }
    ctConsulta_Lote : String;
    ctConsProcesso  : String;
    vObsPedido : String;
    vTipo_Imp : String;

  end;

var
  DMLoteImp_Calc: TDMLoteImp_Calc;

implementation

uses DmdDatabase, uUtilPadrao;

{$R *.dfm}

{ TDMCadLote}

procedure TDMLoteImp_Calc.dspLoteUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  dmDatabase.prc_UpdateError(DataSet.Name,UpdateKind,E);
end;

procedure TDMLoteImp_Calc.DataModuleCreate(Sender: TObject);
begin
  ctConsulta_Lote := sdsConsulta_Lote.CommandText;
  ctConsProcesso  := sdsConsProcesso.CommandText;
  cdsSetor.Open;
  qParametros_Lote.Open;
end;

procedure TDMLoteImp_Calc.frxConsLote_NovoFirst(Sender: TObject);
var
  vItem : Integer;
  i : Integer;
begin
  cdsConsTalao_Novo.Close;
  sdsConsTalao_Novo.ParamByName('ID').AsInteger := cdsConsLote_NovoID.AsInteger;
  cdsConsTalao_Novo.Open;

  cdsProdMat.Close;
  sdsProdMat.ParamByName('ID').AsInteger                := cdsConsLote_NovoID_PRODUTO.AsInteger;
  sdsProdMat.ParamByName('ID_COR_COMBINACAO').AsInteger := cdsConsLote_NovoID_COMBINACAO.AsInteger;
  cdsProdMat.Open;

  vItem := 0;
  mMaterial.EmptyDataSet;
  cdsProdMat.First;
  while not cdsProdMat.Eof do
  begin
    vItem := vItem + 1;
    i := 1;
    if vItem > 14 then
    begin
      i := 2;
      mMaterial.Locate('Item',(vItem - 14),[loCaseInsensitive]);
      mMaterial.Edit;
    end
    else
    begin
      mMaterial.Insert;
      mMaterialItem.AsInteger := vItem;
    end;

    mMaterial.FieldByName('Nome_Setor'+IntToStr(i)).AsString := cdsProdMatNOME_SETOR.AsString;
    mMaterial.FieldByName('Nome_Material'+IntToStr(i)).AsString := cdsProdMatNOME_MATERIAL.AsString;
    mMaterial.FieldByName('Nome_Cor'+IntToStr(i)).AsString := cdsProdMatNOME_COR_MAT.AsString;
    mMaterial.FieldByName('Nome_Posicao'+IntToStr(i)).AsString := cdsProdMatNOME_POSICAO.AsString;
    mMaterial.FieldByName('Qtd_Consumo'+IntToStr(i)).AsFloat := cdsProdMatQTD_CONSUMO.AsFloat;
    mMaterial.Post;

    cdsProdMat.Next;
  end;

  cdsConsTalao_Tam.Close;
  sdsConsTalao_Tam.ParamByName('ID').AsInteger := cdsConsLote_NovoID.AsInteger;
  cdsConsTalao_Tam.Open;

  cdsConsLote_Processo.Close;
  sdsConsLote_Processo.ParamByName('ID_LOTE').AsInteger := cdsConsLote_NovoID.AsInteger;
  cdsConsLote_Processo.Open;

  if FileExists(cdsConsLote_NovoFOTO.AsString) then
  begin
    if frxReport1.FindComponent('Picture1')<> nil then
      TfrxPictureView(frxReport1.FindComponent('Picture1')).Picture.LoadFromFile(cdsConsLote_NovoFOTO.AsString);
  end;
end;

procedure TDMLoteImp_Calc.cdsConsTalao_NovoCalcFields(DataSet: TDataSet);
begin
  if cdsConsTalao_NovoNUM_TALAO.AsInteger > 0 then
    cdsConsTalao_NovoclCodBarra.AsString := '2' + FormatFloat('000000',cdsConsTalao_NovoNUM_LOTE.AsInteger) + FormatFloat('00',cdsConsTalao_NovoNUM_TALAO.AsInteger);
end;

procedure TDMLoteImp_Calc.cdsConsLote_NovoCalcFields(DataSet: TDataSet);
begin
  cdsConsLote_NovoclCodBarra.AsString := '9' + FormatFloat('000000',cdsConsLote_NovoNUM_LOTE.AsInteger);
end;

procedure TDMLoteImp_Calc.frxmImpAuxFirst(Sender: TObject);
begin
  if vTipo_Imp = 'L' then
  begin
    cdsConsLote_Novo.Close;
    sdsConsLote_Novo.ParamByName('ID').AsInteger := mImpAuxID.AsInteger;
    cdsConsLote_Novo.Open;
    cdsConsLote_Novo.First;
  end
  else
  begin
    prc_Montra_SQL_ConsProcesso;
    cdsConsProcesso.Close;
    sdsConsProcesso.ParamByName('ID').AsInteger   := mImpAuxID.AsInteger;
    sdsConsProcesso.ParamByName('ITEM').AsInteger := mImpAuxItem.AsInteger;
    cdsConsProcesso.Open;
    cdsConsProcesso.First;

    cdsConsTalao_Tam.Close;
    sdsConsTalao_Tam.ParamByName('ID').AsInteger := cdsConsProcessoID_LOTE.AsInteger;
    cdsConsTalao_Tam.Open;
    cdsConsTalao_Tam.First;
    
  end;
end;

procedure TDMLoteImp_Calc.cdsConsProcessoCalcFields(DataSet: TDataSet);
begin
  cdsConsProcessoclCodBarra.AsString := '3' + FormatFloat('0000000',cdsConsProcessoID.AsInteger) + FormatFloat('000',cdsConsProcessoITEM.AsInteger);
end;

procedure TDMLoteImp_Calc.prc_Montra_SQL_ConsProcesso;
var
  vComando : String;
begin
  vComando := ctConsProcesso
            + ' WHERE B.ID = :ID  AND B.ITEM = :ITEM ';
  cdsConsProcesso.Close;
  sdsConsProcesso.CommandText := vComando;
end;

procedure TDMLoteImp_Calc.frxConsProcessoNext(Sender: TObject);
var
  vObsAux : String;
begin
  cdsMatProc.Close;
  sdsMatProc.ParamByName('ID_POSICAO').AsInteger        := cdsConsProcessoID_POSICAO_IMP.AsInteger;
  sdsMatProc.ParamByName('ID_POSICAO2').AsInteger       := cdsConsProcessoID_POSICAO_IMP2.AsInteger;
  sdsMatProc.ParamByName('ID_COR_COMBINACAO').AsInteger := cdsConsProcessoID_COMBINACAO.AsInteger;
  sdsMatProc.ParamByName('ID').AsInteger                := cdsConsProcessoID_PRODUTO.AsInteger;
  cdsMatProc.Open;
  vObsAux := '';
  cdsMatProc.First;
  while not cdsMatProc.Eof do
  begin
    if trim(vObsAux) <> '' then
      vObsAux := vObsAux + ' /  ';
    vObsAux := vObsAux + cdsMatProcNOME_POSICAO.AsString + ': ' + cdsMatProcNOME.AsString;
    cdsMatProc.Next;
  end;
  frxReport1.variables['PosicaoMaterial'] := QuotedStr(vObsAux);
end;

end.

