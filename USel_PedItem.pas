unit USel_PedItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Grids,
  DBGrids, SMDBGrid, FMTBcd, DB, Provider, DBClient, SqlExpr, Mask,
  ToolEdit, CurrEdit;

type
  TfrmSel_PedItem = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    SMDBGrid1: TSMDBGrid;
    sdsConsulta: TSQLDataSet;
    cdsConsulta: TClientDataSet;
    dspConsulta: TDataSetProvider;
    dsConsulta: TDataSource;
    StaticText1: TStaticText;
    cdsConsultaNUM_PEDIDO: TIntegerField;
    cdsConsultaPEDIDO_CLIENTE: TStringField;
    cdsConsultaID_PRODUTO: TIntegerField;
    cdsConsultaREFERENCIA: TStringField;
    cdsConsultaNOMEPRODUTO: TStringField;
    cdsConsultaQTD: TFloatField;
    cdsConsultaQTD_FATURADO: TFloatField;
    cdsConsultaQTD_RESTANTE: TFloatField;
    cdsConsultaUNIDADE: TStringField;
    cdsConsultaNOME_COMBINACAO: TStringField;
    Label3: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    cdsConsultaCodBarra: TStringField;
    cdsConsultaITEM: TIntegerField;
    procedure BitBtn1Click(Sender: TObject);
    procedure SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure cdsConsultaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    ctConsulta : String;
    procedure prc_Consultar;

  public
    { Public declarations }
    vTipo_Pessoa : String;

  end;

var
  frmSel_PedItem: TfrmSel_PedItem;

implementation

uses DmdDatabase, uUtilPadrao;

{$R *.dfm}

procedure TfrmSel_PedItem.BitBtn1Click(Sender: TObject);
begin
  if (trim(Edit1.Text) = '') and (CurrencyEdit1.AsInteger <= 0) then
  begin
    MessageDlg('*** É obrigatório informar uma opção de consulta!', mtInformation, [mbOk], 0);
    exit;
  end;
  prc_Consultar;
end;

procedure TfrmSel_PedItem.prc_Consultar;
begin
  cdsConsulta.Close;
  sdsConsulta.CommandText := ctConsulta;
  if trim(Edit1.Text) <> '' then
    sdsConsulta.CommandText := sdsConsulta.CommandText + ' AND P.PEDIDO_CLIENTE = ' + QuotedStr(Edit1.Text)
  else
  if CurrencyEdit1.AsInteger > 0 then
    sdsConsulta.CommandText := sdsConsulta.CommandText + ' AND P.NUM_PEDIDO = ' + IntToStr(CurrencyEdit1.AsInteger);
  cdsConsulta.Open;
end;

procedure TfrmSel_PedItem.SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
  begin
    vNum_Pedido_Pos := cdsConsultaNUM_PEDIDO.AsInteger;
    vItem_Ped_Pos   := cdsConsultaITEM.AsInteger;
    vCodBarra_Pos   := cdsConsultaCodBarra.AsString;
    Close;
  end;
end;

procedure TfrmSel_PedItem.SMDBGrid1DblClick(Sender: TObject);
begin
  vNum_Pedido_Pos := cdsConsultaNUM_PEDIDO.AsInteger;
  vItem_Ped_Pos   := cdsConsultaITEM.AsInteger;
  vCodBarra_Pos   := cdsConsultaCodBarra.AsString;
  Close;
end;

procedure TfrmSel_PedItem.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
  begin
    BitBtn1Click(Sender);
    if not cdsConsulta.IsEmpty then
      SMDBGrid1.SetFocus;
  end;
end;

procedure TfrmSel_PedItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmSel_PedItem.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then
    Close;
end;

procedure TfrmSel_PedItem.FormShow(Sender: TObject);
var
  i : Integer;
begin
  if vTipo_Pessoa = 'C' then
    Label1.Caption := 'Nome Cliente:'
  else
  if vTipo_Pessoa = 'F' then
    Label1.Caption := 'Nome Fornecedor:'
  else
  if vTipo_Pessoa = 'T' then
    Label1.Caption := 'Nome Transportadora:'
  else
  if vTipo_Pessoa = 'V' then
    Label1.Caption := 'Nome Vendedor:';

  ctConsulta := sdsConsulta.CommandText;
end;

procedure TfrmSel_PedItem.SMDBGrid1TitleClick(Column: TColumn);
var
  i : Integer;
  ColunaOrdenada : String;
begin
  ColunaOrdenada := Column.FieldName;
  cdsConsulta.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I] = Column) then
      SMDBGrid1.Columns.Items[I].Title.Color := clBtnFace;
end;

procedure TfrmSel_PedItem.cdsConsultaCalcFields(DataSet: TDataSet);
begin
  cdsConsultaCodBarra.AsString := '5' + FormatFloat('0000000',cdsConsultaNUM_PEDIDO.AsInteger) +
                                                           FormatFloat('0000',cdsConsultaITEM.AsInteger);
end;

end.
