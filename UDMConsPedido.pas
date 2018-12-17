unit UDMConsPedido;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider, frxClass,
  frxDBSet, frxRich, frxExportMail, frxExportPDF;

type
  TDMConsPedido = class(TDataModule)
    sdsPedido_Itens: TSQLDataSet;
    dspPedido_Itens: TDataSetProvider;
    cdsPedido_Itens: TClientDataSet;
    cdsPedido_ItensID_PEDIDO: TIntegerField;
    cdsPedido_ItensNUM_PEDIDO: TIntegerField;
    cdsPedido_ItensPEDIDO_CLIENTE: TStringField;
    cdsPedido_ItensID_CLIENTE: TIntegerField;
    cdsPedido_ItensREFERENCIA: TStringField;
    cdsPedido_ItensQTD: TFloatField;
    cdsPedido_ItensNOME_COR: TStringField;
    cdsPedido_ItensDTENTREGA: TDateField;
    cdsPedido_ItensDTEMISSAO: TDateField;
    cdsPedido_ItensBAIXADO: TStringField;
    dsPedido_Itens: TDataSource;
    frxReport1: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxMailExport1: TfrxMailExport;
    frxRichObject1: TfrxRichObject;
    frxPedido_Itens: TfrxDBDataset;
    sdsBaixaPed: TSQLDataSet;
    dspBaixaPed: TDataSetProvider;
    cdsBaixaPed: TClientDataSet;
    dsBaixaPed: TDataSource;
    frxBaixaPed: TfrxDBDataset;
    cdsPedido_ItensNOME_CLIENTE: TStringField;
    cdsPedido_ItensITEM_PEDIDO: TIntegerField;
    cdsPedido_ItensFANTASIA_CLIENTE: TStringField;
    sdsProcesso: TSQLDataSet;
    dspProcesso: TDataSetProvider;
    cdsProcesso: TClientDataSet;
    dsProcesso: TDataSource;
    cdsProcessoNOME: TStringField;
    cdsProcessoORDEM_MAPA: TIntegerField;
    frxProcesso: TfrxDBDataset;
    qCliente: TSQLQuery;
    qClienteCODIGO: TIntegerField;
    qClienteNOME: TStringField;
    qClienteCNPJ_CPF: TStringField;
    cdsBaixaPedID_PROCESSO: TIntegerField;
    cdsBaixaPedNOME_PROCESSO: TStringField;
    cdsBaixaPedORDEM_MAPA: TIntegerField;
    cdsBaixaPedID_PEDIDO: TIntegerField;
    cdsBaixaPedQTD: TFloatField;
    cdsBaixaPedQTD_PRODUZIDO: TFloatField;
    cdsBaixaPedQTD_PENDENTE: TFloatField;
    cdsBaixaPedQTD_PEND_IMPRIMIR: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure frxPedido_ItensFirst(Sender: TObject);
    procedure frxPedido_ItensNext(Sender: TObject);
    procedure frxPedido_ItensOpen(Sender: TObject);
    procedure frxPedido_ItensPrior(Sender: TObject);
  private
    { Private declarations }
    procedure prc_Abrir_BaixaPed;
  public
    { Public declarations }
    ctPedido_Itens : String;
  end;

var
  DMConsPedido: TDMConsPedido;

implementation

uses DmdDatabase;

{$R *.dfm}

procedure TDMConsPedido.DataModuleCreate(Sender: TObject);
begin
  ctPedido_Itens := sdsPedido_Itens.CommandText;
end;

procedure TDMConsPedido.frxPedido_ItensFirst(Sender: TObject);
begin
  prc_Abrir_BaixaPed;
end;

procedure TDMConsPedido.prc_Abrir_BaixaPed;
begin
  cdsBaixaPed.Close;
  sdsBaixaPed.ParamByName('ID_PEDIDO').AsInteger   := cdsPedido_ItensID_PEDIDO.AsInteger;
  sdsBaixaPed.ParamByName('ITEM_PEDIDO').AsInteger := cdsPedido_ItensITEM_PEDIDO.AsInteger;
  cdsBaixaPed.Open;
end;

procedure TDMConsPedido.frxPedido_ItensNext(Sender: TObject);
begin
  prc_Abrir_BaixaPed;
end;

procedure TDMConsPedido.frxPedido_ItensOpen(Sender: TObject);
begin
  prc_Abrir_BaixaPed;
end;

procedure TDMConsPedido.frxPedido_ItensPrior(Sender: TObject);
begin
  prc_Abrir_BaixaPed;
end;

end.
