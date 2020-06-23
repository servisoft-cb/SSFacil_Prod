unit ULote_Cancela;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, UDMCadLote, Grids, DBGrids, SMDBGrid, StdCtrls, Mask,
  DBCtrls, ToolEdit, CurrEdit, NxCollection;

type
  TfrmLote_Cancela = class(TForm)
    Panel1: TPanel;
    SMDBGrid1: TSMDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    ceQtdCancelar: TCurrencyEdit;
    btnConfirmar: TNxButton;
    Label3: TLabel;
    Memo1: TMemo;
    btnExcluir: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fDMCadLote: TDMCadLote;
    
  end;

var
  frmLote_Cancela: TfrmLote_Cancela;

implementation

uses rsDBUtils;

{$R *.dfm}

procedure TfrmLote_Cancela.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmLote_Cancela.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMCadLote);
  fDMCadLote.cdsLote_Canc.Close;
  fDMCadLote.sdsLote_Canc.ParamByName('ID').AsInteger := fDMCadLote.cdsLoteID.AsInteger;
  fDMCadLote.cdsLote_Canc.Open;
end;

procedure TfrmLote_Cancela.btnConfirmarClick(Sender: TObject);
var
  vID : Integer;
  vItem : Integer;
  vQtdAux : Real;
begin
  if ceQtdCancelar.Value <= 0 then
  begin
    MessageDlg('*** Não foi informada a quantidade para cancelar!', mtError, [mbOk], 0);
    exit;
  end;
  if ceQtdCancelar.Value >= StrToFloat(FormatFloat('0.0000',fDMCadLote.cdsLoteQTD.AsFloat)) then
  begin
    MessageDlg('*** Qtd. não pode ser maior ou igual a qtde do Lote!', mtError, [mbOk], 0);
    exit;
  end;
  vQtdAux := fDMCadLote.fnc_Pedido_Qtd_Restante(fDMCadLote.cdsLoteID_PEDIDO.AsInteger,fDMCadLote.cdsLoteITEM_PEDIDO.AsInteger);
  if StrToFloat(FormatFloat('0.0000',ceQtdCancelar.Value)) > StrToFloat(FormatFloat('0.0000',vQtdAux)) then
  begin
    MessageDlg('*** Qtd. para cancelar maior que a quantidade pendente no Pedido!', mtError, [mbOk], 0);
    exit;
  end;
  fDMCadLote.prc_Inserir_Lote_Canc(fDMCadLote.cdsLoteID.AsInteger);
  fDMCadLote.cdsLote_CancQTD.AsFloat     := ceQtdCancelar.Value;
  fDMCadLote.cdsLote_CancMOTIVO.AsString := Memo1.Lines.Text;
  fDMCadLote.cdsLote_Canc.Post;
  fDMCadLote.cdsLote_Canc.ApplyUpdates(0);

  Close;
end;

procedure TfrmLote_Cancela.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key = #13) or (Key = #10)) then
    Key := ' ';
end;

procedure TfrmLote_Cancela.btnExcluirClick(Sender: TObject);
begin
  if fDMCadLote.cdsLote_Canc.IsEmpty then
    exit;

  if MessageDlg('Deseja excluir a qtde cancelada?' ,mtConfirmation,[mbYes,mbNo],0) <> mrYes then
    exit;

  fDMCadLote.cdsLote_Canc.Delete;
  fDMCadLote.cdsLote_Canc.ApplyUpdates(0);
end;

end.
