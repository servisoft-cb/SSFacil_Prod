unit UDMConsLote;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider, frxClass, frxDBSet, frxRich, frxExportMail, frxExportPDF;

type
  TDMConsLote = class(TDataModule)
    qParametros: TSQLQuery;
    qParametrosGERAR_TALAO_AUXILIAR: TStringField;
    qParametrosUSA_LOTE: TStringField;
    qParametros_Lote: TSQLQuery;
    qParametros_LoteLOTE_TEXTIL: TStringField;
    sdsMatLote: TSQLDataSet;
    dspMatLote: TDataSetProvider;
    cdsMatLote: TClientDataSet;
    dsMatLote: TDataSource;
    cdsMatLoteID_MATERIAL: TIntegerField;
    cdsMatLoteID_COR_MAT: TIntegerField;
    cdsMatLoteNOME_COR_MAT: TStringField;
    cdsMatLoteNOME_MATERIAL: TStringField;
    cdsMatLoteQTD_CONSUMO: TFloatField;
    cdsMatLoteNOME_SETOR: TStringField;
    mMat: TClientDataSet;
    mMatID_Material: TIntegerField;
    mMatID_Cor: TIntegerField;
    mMatNome_Material: TStringField;
    mMatNome_Cor: TStringField;
    mMatQtd_Consumo: TFloatField;
    mMatNome_Setor: TStringField;
    mMatID_Setor: TIntegerField;
    dsmMat: TDataSource;
    mMatGrade: TClientDataSet;
    mMatGradeID_Material: TIntegerField;
    mMatGradeID_Cor: TIntegerField;
    mMatGradeID_Setor: TIntegerField;
    mMatGradeTamanho: TStringField;
    mMatGradeQtd_Consumo: TFloatField;
    dsmMatGrade: TDataSource;
    cdsMatLoteID_SETOR: TIntegerField;
    cdsMatLoteID_LOTE: TIntegerField;
    cdsMatLoteID_GRADE_MAT: TIntegerField;
    cdsMatLoteID_GRADE_PROD: TIntegerField;
    sdsTalao: TSQLDataSet;
    dspTalao: TDataSetProvider;
    cdsTalao: TClientDataSet;
    cdsTalaoID: TIntegerField;
    cdsTalaoNUM_TALAO: TIntegerField;
    cdsTalaoTAMANHO: TStringField;
    cdsTalaoQTD: TFloatField;
    qParametros_Prod: TSQLQuery;
    qParametros_ProdUSA_TAM_REFER_GRADE: TStringField;
    cdsMatLoteQTD: TFloatField;
    frxReport1: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxMailExport1: TfrxMailExport;
    frxRichObject1: TfrxRichObject;
    frxmMat: TfrxDBDataset;
    frxmMatGrade: TfrxDBDataset;
    sdsLoteProduto: TSQLDataSet;
    cdsLoteProduto: TClientDataSet;
    dspLoteProduto: TDataSetProvider;
    dsLoteProduto: TDataSource;
    cdsLoteProdutoQTD: TFloatField;
    cdsLoteProdutoREFERENCIA: TStringField;
    cdsLoteProdutoMODELO_COMBINACAO: TStringField;
    sdsModelo_Setor: TSQLDataSet;
    dspModelo_Setor: TDataSetProvider;
    cdsModelo_Setor: TClientDataSet;
    cdsModelo_SetorID_PRODUTO: TIntegerField;
    cdsModelo_SetorNOME_MODELO: TStringField;
    cdsModelo_SetorREFERENCIA: TStringField;
    cdsModelo_SetorNOME_PRODUTO: TStringField;
    cdsModelo_SetorID_COMBINACAO: TFMTBCDField;
    cdsModelo_SetorNOME_COMBINACAO: TStringField;
    cdsModelo_SetorID_SETOR: TIntegerField;
    cdsModelo_SetorNOME_SETOR: TStringField;
    cdsModelo_SetorQTD_PARES: TFloatField;
    cdsModelo_SetorID_CLIENTE: TIntegerField;
    cdsModelo_SetorNOME_CLIENTE: TStringField;
    dsModelo_Setor: TDataSource;
    sdsSetor: TSQLDataSet;
    dspSetor: TDataSetProvider;
    cdsSetor: TClientDataSet;
    dsSetor: TDataSource;
    cdsSetorID: TIntegerField;
    cdsSetorNOME: TStringField;
    sdsModelo_Mat: TSQLDataSet;
    dspModelo_Mat: TDataSetProvider;
    cdsModelo_Mat: TClientDataSet;
    dsModelo_Mat: TDataSource;
    cdsModelo_MatORDEM_IMP: TIntegerField;
    cdsModelo_MatID_PRODUTO: TIntegerField;
    cdsModelo_MatID_MATERIAL: TIntegerField;
    cdsModelo_MatNOME_MATERIAL: TStringField;
    cdsModelo_MatID_SETOR: TIntegerField;
    cdsModelo_MatID_POSICAO: TIntegerField;
    cdsModelo_MatNOME_POSICAO: TStringField;
    cdsModelo_MatNOME_COR_MAT: TStringField;
    cdsModelo_MatPRECO_CUSTO: TFloatField;
    cdsModelo_MatQTD_CONSUMO: TFloatField;
    cdsModelo_Setorcl_Vlr_Total: TFloatField;
    cdsModelo_SetorTEMPO: TFloatField;
    cdsModelo_SetorVLR_HORA: TFloatField;
    frxModeloSetor: TfrxDBDataset;
    frxModelo_Mat: TfrxDBDataset;
    cdsModelo_Matcl_Vlr_Total: TFloatField;
    cdsModelo_MatNOME_SETOR: TStringField;
    cdsModelo_MatORDEM_ORC: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure mMatNewRecord(DataSet: TDataSet);
    procedure mMatGradeNewRecord(DataSet: TDataSet);
    procedure frxmMatFirst(Sender: TObject);
    procedure frxmMatNext(Sender: TObject);
    procedure frxmMatOpen(Sender: TObject);
    procedure cdsModelo_SetorCalcFields(DataSet: TDataSet);
    procedure frxModeloSetorFirst(Sender: TObject);
    procedure frxModeloSetorNext(Sender: TObject);
    procedure cdsModelo_MatCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure prc_Filtrar_MatGrade;
  public
    { Public declarations }
    ctMatLote: String;
    ctLoteProduto: String;
    ctModelo_Setor : String;
  end;

var
  DMConsLote: TDMConsLote;

implementation

uses DmdDatabase;

{$R *.dfm}

procedure TDMConsLote.DataModuleCreate(Sender: TObject);
begin
  ctMatLote      := sdsMatLote.CommandText;
  ctLoteProduto  := sdsLoteProduto.CommandText;
  ctModelo_Setor := sdsModelo_Setor.CommandText;
  qParametros.Open;
  qParametros_Lote.Open;
  qParametros_Prod.Open;
end;

procedure TDMConsLote.mMatNewRecord(DataSet: TDataSet);
begin
  mMatQtd_Consumo.AsFloat := 0;
end;

procedure TDMConsLote.mMatGradeNewRecord(DataSet: TDataSet);
begin
  mMatGradeQtd_Consumo.AsFloat := 0;
end;

procedure TDMConsLote.frxmMatFirst(Sender: TObject);
begin
  prc_Filtrar_MatGrade;
end;

procedure TDMConsLote.prc_Filtrar_MatGrade;
begin
 // mMatGrade.Filtered := False;
//  mMatGrade.Filter   := 'ID_Setor = ' + IntToStr(mMatID_Setor.AsInteger) + ' and ID_Material = ' + IntToStr(mMatID_Material.AsInteger)
  //                    + ' and ID_Cor = ' + IntToStr(mMatID_Cor.AsInteger);
//  mMatGrade.Filtered := True;
end;

procedure TDMConsLote.frxmMatNext(Sender: TObject);
begin
  prc_Filtrar_MatGrade;
end;

procedure TDMConsLote.frxmMatOpen(Sender: TObject);
begin
  prc_Filtrar_MatGrade;
end;

procedure TDMConsLote.cdsModelo_SetorCalcFields(DataSet: TDataSet);
begin
  if (cdsModelo_SetorTempo.AsFloat > 0) and (cdsModelo_SetorVlr_Hora.AsFloat > 0) then
    cdsModelo_Setorcl_Vlr_Total.AsFloat := cdsModelo_SetorTempo.AsFloat * cdsModelo_SetorVlr_Hora.AsFloat;
end;

procedure TDMConsLote.frxModeloSetorFirst(Sender: TObject);
begin
  cdsModelo_Mat.Close;
  sdsModelo_Mat.ParamByName('id_produto').AsInteger := cdsModelo_SetorID_PRODUTO.AsInteger;
  sdsModelo_Mat.ParamByName('id_setor').AsInteger   := cdsModelo_SetorID_SETOR.AsInteger;
  cdsModelo_Mat.Open;
end;

procedure TDMConsLote.frxModeloSetorNext(Sender: TObject);
begin
  cdsModelo_Mat.Close;
  sdsModelo_Mat.ParamByName('id_produto').AsInteger := cdsModelo_SetorID_PRODUTO.AsInteger;
  sdsModelo_Mat.ParamByName('id_setor').AsInteger   := cdsModelo_SetorID_SETOR.AsInteger;
  cdsModelo_Mat.Open;
end;

procedure TDMConsLote.cdsModelo_MatCalcFields(DataSet: TDataSet);
begin
  if (cdsModelo_MatPRECO_CUSTO.AsFloat > 0) and (cdsModelo_MatQTD_CONSUMO.AsFloat > 0) then
    cdsModelo_Matcl_Vlr_Total.AsFloat := cdsModelo_MatPRECO_CUSTO.AsFloat * cdsModelo_MatQTD_CONSUMO.AsFloat;
end;

end.
