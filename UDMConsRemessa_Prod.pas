unit UDMConsRemessa_Prod;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider, frxClass,
  frxDBSet, frxRich, frxExportMail, frxExportPDF;

type
  TDMConsRemessa_Prod = class(TDataModule)
    sdsRemessa_Ref: TSQLDataSet;
    dspRemessa_Ref: TDataSetProvider;
    cdsRemessa_Ref: TClientDataSet;
    cdsRemessa_RefREFERENCIA: TStringField;
    cdsRemessa_RefOBSMATERIAL: TStringField;
    dsRemessa_Ref: TDataSource;
    cdsRemessa_RefQTD: TFloatField;
    frxReport1: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxMailExport1: TfrxMailExport;
    frxRichObject1: TfrxRichObject;
    frxRemessa_Ref: TfrxDBDataset;
    SQLDataSet1: TSQLDataSet;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    IntegerField1: TIntegerField;
    DataSource1: TDataSource;
    cdsRemessa_RefNUM_LOTE: TIntegerField;
    cdsRemessa_RefREF_ORD: TStringField;
    cdsRemessa_RefREF_ORDENADA: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ctRemessa_Ref : String;
  end;

var
  DMConsRemessa_Prod: TDMConsRemessa_Prod;

implementation

uses DmdDatabase;

{$R *.dfm}

procedure TDMConsRemessa_Prod.DataModuleCreate(Sender: TObject);
begin
  ctRemessa_Ref := sdsRemessa_Ref.CommandText;
end;

end.
