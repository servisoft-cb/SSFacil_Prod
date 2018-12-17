unit UConsPed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ToolEdit, Mask, CurrEdit, StdCtrls, NxEdit,
  NxCollection, Grids, DBGrids, SMDBGrid, FMTBcd, DB, SqlExpr, DBClient,
  Provider;

type
  TfrmConsPed = class(TForm)
    Panel1: TPanel;
    NxLabel10: TNxLabel;
    NxLabel13: TNxLabel;
    NxLabel14: TNxLabel;
    NxLabel1: TNxLabel;
    btnConsTalao: TNxButton;
    CurrencyEdit5: TCurrencyEdit;
    Edit2: TEdit;
    DateEdit5: TDateEdit;
    DateEdit6: TDateEdit;
    Edit3: TEdit;
    SMDBGrid1: TSMDBGrid;
    sdsPedido: TSQLDataSet;
    dspPedido: TDataSetProvider;
    cdsPedido: TClientDataSet;
    cdsPedidoID: TIntegerField;
    cdsPedidoNUM_PEDIDO: TIntegerField;
    cdsPedidoDTEMISSAO: TDateField;
    cdsPedidoID_CLIENTE: TIntegerField;
    cdsPedidoNOME_CLIENTE: TStringField;
    cdsPedidoPEDIDO_CLIENTE: TStringField;
    dsPedido: TDataSource;
    cdsPedidoCNPJ_CPF: TStringField;
    cdsPedidoCIDADE: TStringField;
    StaticText1: TStaticText;
    qCliente: TSQLQuery;
    qClienteCODIGO: TIntegerField;
    qClienteNOME: TStringField;
    qClienteCNPJ_CPF: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConsTalaoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit3Enter(Sender: TObject);
    procedure CurrencyEdit5Exit(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
    ctPedido : String;
    vNomeAnt : String;

    procedure prc_Consultar;
    function fnc_Busca_Cliente(ID : Integer) : String;

  public
    { Public declarations }

  end;

var
  frmConsPed: TfrmConsPed;

implementation

uses uUtilPadrao, DmdDatabase;

{$R *.dfm}

procedure TfrmConsPed.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsPed.btnConsTalaoClick(Sender: TObject);
begin
  prc_Consultar;
end;

procedure TfrmConsPed.prc_Consultar;
var
  vComando : String;
begin
  cdsPedido.Close;
  vComando := '';
  if trim(Edit2.Text) <> '' then
    vComando := vComando + ' AND P.PEDIDO_CLIENTE LIKE ' + QuotedStr('%'+Edit2.Text+'%');
  if CurrencyEdit5.AsInteger > 0 then
    vComando := vComando + ' AND P.ID_CLIENTE = ' + IntToStr(CurrencyEdit5.AsInteger)
  else
  if trim(Edit3.Text) <> '' then
    vComando := vComando + ' AND CLI.NOME ' + QuotedStr('%'+Edit3.Text+'%');
  if DateEdit5.Date > 10 then
    vComando := vComando + ' AND P.DTEMISSAO  >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit5.date));
  if DateEdit6.Date > 10 then
    vComando := vComando + ' AND P.DTEMISSAO  <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit6.date));
  sdsPedido.CommandText := ctPedido + vComando;
  cdsPedido.Open;
  cdsPedido.IndexFieldNames := 'NOME_CLIENTE;PEDIDO_CLIENTE';
end;

procedure TfrmConsPed.FormShow(Sender: TObject);
begin
  ctPedido := sdsPedido.CommandText;
end;

function TfrmConsPed.fnc_Busca_Cliente(ID: Integer): String;
begin
  Result := '';
  qCliente.Close;
  qCliente.ParamByName('CODIGO').AsInteger := ID;
  qCliente.Open;
  Result := qClienteNOME.AsString;
end;

procedure TfrmConsPed.Edit3Enter(Sender: TObject);
begin
  vNomeAnt := Edit3.Text;
end;

procedure TfrmConsPed.CurrencyEdit5Exit(Sender: TObject);
begin
  if CurrencyEdit5.AsInteger > 0 then
    Edit3.Text := fnc_Busca_Cliente(CurrencyEdit5.AsInteger);
end;

procedure TfrmConsPed.SMDBGrid1DblClick(Sender: TObject);
begin
  if not cdsPedido.Active then
    exit;
  vNum_Pedido_Pos := cdsPedidoNUM_PEDIDO.AsInteger;
  Close;
end;

procedure TfrmConsPed.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  cdsPedido.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I] = Column) then
      SMDBGrid1.Columns.Items[I].Title.Color := clBtnFace;
end;

end.
