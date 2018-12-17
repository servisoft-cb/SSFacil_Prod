unit UConsPedidoProc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMConsPedido, DBVGrids, Grids, DBGrids, SMDBGrid, StdCtrls,
  NxCollection, RxLookup, NxEdit, CurrEdit, Mask, ToolEdit, ExtCtrls,
  RzTabs, DB, Menus;

type
  TfrmConsPedidoProc = class(TForm)
    Panel1: TPanel;
    NxLabel6: TNxLabel;
    NxLabel9: TNxLabel;
    NxLabel10: TNxLabel;
    btnConsTalao: TNxButton;
    cbxOpcao: TNxComboBox;
    Edit1: TEdit;
    CurrencyEdit5: TCurrencyEdit;
    Edit2: TEdit;
    btnImprimir: TNxButton;
    NxLabel13: TNxLabel;
    DateEdit5: TDateEdit;
    NxLabel14: TNxLabel;
    DateEdit6: TDateEdit;
    NxLabel1: TNxLabel;
    Edit3: TEdit;
    NxLabel2: TNxLabel;
    NxLabel3: TNxLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    SMDBGrid1: TSMDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsTalaoClick(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure CurrencyEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit5Exit(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3Enter(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
  private
    { Private declarations }
    fDMConsPedido: TDMConsPedido;
    vOpcaoImp : String;
    vNomeAnt : String;

    function fnc_Busca_Cliente(ID : Integer) : String;

    procedure prc_Monta_Opcao;
    procedure prc_Consulta_PedidoItens;

  public
    { Public declarations }
  end;

var
  frmConsPedidoProc: TfrmConsPedidoProc;

implementation

uses rsDBUtils, USel_Pessoa, uUtilPadrao, UInfDtProd, USel_Produto, StrUtils;

{$R *.dfm}

procedure TfrmConsPedidoProc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsPedidoProc.FormShow(Sender: TObject);
begin
  fDMConsPedido:= TDMConsPedido.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsPedido);
  fDMConsPedido.cdsProcesso.Open;
end;

procedure TfrmConsPedidoProc.btnConsTalaoClick(Sender: TObject);
begin
  prc_Consulta_PedidoItens;
end;

procedure TfrmConsPedidoProc.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
  vCor : TColor;
begin
  ColunaOrdenada := Column.FieldName;
  fDMConsPedido.cdsPedido_Itens.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I] = Column) then
      SMDBGrid1.Columns.Items[I].Title.Color := $00B7FFB7;
end;

procedure TfrmConsPedidoProc.CurrencyEdit5KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    if CurrencyEdit5.AsInteger > 0 then
      vCodPessoa_Pos := CurrencyEdit5.AsInteger;
    frmSel_Pessoa := TfrmSel_Pessoa.Create(Self);
    frmSel_Pessoa.vTipo_Pessoa := 'C';
    frmSel_Pessoa.ShowModal;
    if vCodPessoa_Pos > 0 then
    begin
      CurrencyEdit5.AsInteger := vCodPessoa_Pos;
      CurrencyEdit5.SetFocus;
      Edit3.Text := '';
      if CurrencyEdit5.AsInteger > 0 then
        Edit3.Text := fnc_Busca_Cliente(CurrencyEdit5.AsInteger);
    end;
  end;
end;

function TfrmConsPedidoProc.fnc_Busca_Cliente(ID: Integer): String;
begin
  Result := '';
  fDMConsPedido.qCliente.Close;
  fDMConsPedido.qCliente.ParamByName('CODIGO').AsInteger := ID;
  fDMConsPedido.qCliente.Open;
  Result := fDMConsPedido.qClienteNOME.AsString;
end;

procedure TfrmConsPedidoProc.CurrencyEdit5Exit(Sender: TObject);
begin
  if CurrencyEdit5.AsInteger > 0 then
    Edit3.Text := fnc_Busca_Cliente(CurrencyEdit5.AsInteger);
end;

procedure TfrmConsPedidoProc.prc_Monta_Opcao;
begin
  vOpcaoImp := '';
  {if CurrencyEdit3.AsInteger > 0 then
    vOpcaoImp := vOpcaoImp + '(Nº O.P.: ' + CurrencyEdit3.Text + ')';
  if (CurrencyEdit1.AsInteger > 0) and (CurrencyEdit2.AsInteger > 0) then
    vOpcaoImp := vOpcaoImp + '(Lote: ' + CurrencyEdit1.Text + ' a ' + CurrencyEdit2.Text + ')'
  else
  if (CurrencyEdit1.AsInteger > 0) then
    vOpcaoImp := vOpcaoImp + '(Lote Inicial: ' + CurrencyEdit1.Text + ')'
  else
  if (CurrencyEdit2.AsInteger > 0) then
    vOpcaoImp := vOpcaoImp + '(Lote Final: ' + CurrencyEdit2.Text + ')';
  if trim(RxDBLookupCombo1.Text) <> '' then
    vOpcaoImp := vOpcaoImp + '(Processo: ' + RxDBLookupCombo1.Text + ')';
  if CurrencyEdit5.AsInteger > 0 then
    vOpcaoImp := vOpcaoImp + '(Processo: ' + Edit3.Text + ')';
  if trim(Edit2.Text) <> '' then
    vOpcaoImp := vOpcaoImp + '(Nº Pedido: ' + Edit2.Text + ')';
  if trim(Edit1.Text) <> '' then
    vOpcaoImp := vOpcaoImp + '(Referência: ' + Edit1.Text + ')';
  case cbxOpcao.ItemIndex of
    1 : vOpcaoImp := vOpcaoImp + '(Pendente de encerramento) ';
    3 : vOpcaoImp := vOpcaoImp + '(Não entrou em produção)';
  end;}
end;

procedure TfrmConsPedidoProc.btnImprimirClick(Sender: TObject);
var
  vArq : String;
  vDetalhada : String;
begin
  fDMConsPedido.cdsProcesso.Close;
  fDMConsPedido.cdsProcesso.Open;
  vDetalhada := '';
  prc_Monta_Opcao;
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\MapaPedido_Proc.fr3';
  if FileExists(vArq) then
    fDMConsPedido.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    MessageDlg('*** Relatório ' + vArq + ', não encontrado!' , mtInformation, [mbOk], 0);
    exit;
  end;
 { fDMConsPedido.frxReport1.variables['ImpOpcao']    := QuotedStr(vOpcaoImp);
  fDMConsPedido.frxReport1.variables['OpcaoTitulo'] := QuotedStr('Produção ' + vDetalhada + ' - ' + DateToStr(fDMConsPedido.vDtProducaoIni) + ' a ' + DateToStr(fDMConsPedido.vDtProducaoFin));
  fDMConsPedido.frxReport1.variables['Processo']    := QuotedStr(RxDBLookupCombo1.Text);}
  fDMConsPedido.frxReport1.ShowReport;
end;

procedure TfrmConsPedidoProc.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    if trim(Edit1.Text) <> '' then
      vReferencia_Pos := Edit1.Text;
    frmSel_Produto := TfrmSel_Produto.Create(Self);
    frmSel_Produto.ShowModal;
    if vCodProduto_Pos > 0 then
      Edit1.Text := vReferencia_Pos;
  end;
end;

procedure TfrmConsPedidoProc.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    if CurrencyEdit5.AsInteger > 0 then
      vCodPessoa_Pos := CurrencyEdit5.AsInteger;
    frmSel_Pessoa := TfrmSel_Pessoa.Create(Self);
    frmSel_Pessoa.vTipo_Pessoa := 'C';
    frmSel_Pessoa.ShowModal;
    if vCodPessoa_Pos > 0 then
    begin
      CurrencyEdit5.AsInteger := vCodPessoa_Pos;
      CurrencyEdit5.SetFocus;
      Edit3.Text := '';
      if CurrencyEdit5.AsInteger > 0 then
        Edit3.Text := fnc_Busca_Cliente(CurrencyEdit5.AsInteger);
    end;
  end;
end;

procedure TfrmConsPedidoProc.Edit3Enter(Sender: TObject);
begin
  vNomeAnt := Edit3.Text;
end;

procedure TfrmConsPedidoProc.Edit3Exit(Sender: TObject);
begin
  if (vNomeAnt <> Edit3.Text) and (trim(Edit3.Text) <> '') then
    CurrencyEdit5.Clear;
end;

procedure TfrmConsPedidoProc.prc_Consulta_PedidoItens;
var
  vComando : String;
begin
  fDMConsPedido.cdsPedido_Itens.Close;
  fDMConsPedido.sdsPedido_Itens.CommandText := fDMConsPedido.ctPedido_Itens + ' WHERE 0 = 0 ';
  vComando := '';
  if CurrencyEdit5.AsInteger > 0 then
    vComando := vComando + ' AND P.ID_CLIENTE = ' + IntToStr(CurrencyEdit5.AsInteger);
  if trim(Edit3.Text) <> '' then
    vComando := vComando + ' AND CLI.NOME LIKE ' + QuotedStr('%'+Edit3.Text+'%');
  if DateEdit1.Date > 10 then
    vComando := vComando + ' AND I.DTENTREGA  >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    vComando := vComando + ' AND I.DTENTREGA  <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  if DateEdit5.Date > 10 then
    vComando := vComando + ' AND P.DTEMISSAO  >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit5.date));
  if DateEdit6.Date > 10 then
    vComando := vComando + ' AND P.DTEMISSAO  <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit6.date));
  if trim(Edit2.Text) <> '' then
    vComando := vComando + ' AND P.PEDIDO_CLIENTE = ' + QuotedStr(Edit2.Text);
  if trim(Edit1.Text) <> '' then
    vComando := vComando + ' AND I.REFERENCIA = ' + QuotedStr(Edit1.Text);
  if cbxOpcao.ItemIndex = 1 then
    vComando := vComando + ' AND L.BAIXADO <> ' + QuotedStr('S');
  fDMConsPedido.sdsPedido_Itens.CommandText := fDMConsPedido.sdsPedido_Itens.CommandText + vComando;
  fDMConsPedido.cdsPedido_Itens.Open;
  fDMConsPedido.cdsPedido_Itens.IndexFieldNames := 'PEDIDO_CLIENTE;REFERENCIA';
end;

end.
