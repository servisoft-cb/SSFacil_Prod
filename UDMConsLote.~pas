unit UDMConsLote;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider, frxClass,
  frxDBSet, frxRich, frxExportMail, frxExportPDF;

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
    procedure DataModuleCreate(Sender: TObject);
    procedure mMatNewRecord(DataSet: TDataSet);
    procedure mMatGradeNewRecord(DataSet: TDataSet);
    procedure frxmMatFirst(Sender: TObject);
    procedure frxmMatNext(Sender: TObject);
    procedure frxmMatOpen(Sender: TObject);
  private
    { Private declarations }
    procedure prc_Filtrar_MatGrade;
  public
    { Public declarations }
    ctMatLote : String;
    
  end;

var
  DMConsLote: TDMConsLote;

implementation

uses DmdDatabase;

{$R *.dfm}

procedure TDMConsLote.DataModuleCreate(Sender: TObject);
begin
  ctMatLote := sdsMatLote.CommandText;
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

end.
