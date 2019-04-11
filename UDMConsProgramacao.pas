unit UDMConsProgramacao;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, Provider, DBClient, frxClass,
  frxDBSet, frxRich, frxExportMail, frxExportPDF;

type
  TDMConsProgramacao = class(TDataModule)
    sdsConsProg: TSQLDataSet;
    dspConsProg: TDataSetProvider;
    cdsConsProg: TClientDataSet;
    cdsConsProgID_PROGRAMACAO: TIntegerField;
    cdsConsProgID_BAIXA: TIntegerField;
    cdsConsProgITEM_BAIXA: TIntegerField;
    cdsConsProgID_PROCESSO: TIntegerField;
    cdsConsProgNUM_ORDEM: TIntegerField;
    cdsConsProgID_LOTE: TIntegerField;
    cdsConsProgNUM_LOTE: TIntegerField;
    cdsConsProgDTINICIAL: TDateField;
    cdsConsProgHRINICIAL: TTimeField;
    cdsConsProgDTFINAL: TDateField;
    cdsConsProgHRFINAL: TTimeField;
    cdsConsProgID_MAQUINA: TIntegerField;
    cdsConsProgNUM_BOCA: TIntegerField;
    cdsConsProgDTPROGRAMACAO: TDateField;
    cdsConsProgQTD_PROGRAMADO: TFloatField;
    cdsConsProgSTATUS: TStringField;
    cdsConsProgNOME_MAQUINA: TStringField;
    cdsConsProgID_PRODUTO: TIntegerField;
    cdsConsProgREFERENCIA: TStringField;
    cdsConsProgQTD_LOTE: TFloatField;
    cdsConsProgNOME_PRODUTO: TStringField;
    dsConsProg: TDataSource;
    cdsConsProgNOME_PROCESSO: TStringField;
    frxReport1: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxMailExport1: TfrxMailExport;
    frxRichObject1: TfrxRichObject;
    frxConsProg: TfrxDBDataset;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMConsProgramacao: TDMConsProgramacao;

implementation

uses
  rsDBUtils, DmdDatabase;

{$R *.dfm}

end.
