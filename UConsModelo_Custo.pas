unit UConsModelo_Custo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, CurrEdit, ExtCtrls, NxCollection,
  FMTBcd, DB, DBClient, Provider, SqlExpr, Grids, DBGrids, SMDBGrid,
  DBCtrls, UDMConsLote, DBVGrids, URelMatLote2, RxLookup;

type
  TfrmConsModelo_Custo = class(TForm)
    Panel1: TPanel;
    btnConsultar: TNxButton;
    SMDBGrid1: TSMDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Label3: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    btnImprimir: TNxButton;
    procedure btnConsultarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure NxButton1Click(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    fDMConsLote: TDMConsLote;

    procedure prc_Consultar;
    procedure prc_Gerar_Excel;

  public
    { Public declarations }
  end;

var
  frmConsModelo_Custo: TfrmConsModelo_Custo;

implementation

uses DmdDatabase, StrUtils, uUtilPadrao, rsDBUtils;

{$R *.dfm}

procedure TfrmConsModelo_Custo.btnConsultarClick(Sender: TObject);
begin
  if (DateEdit1.Date <= 10) or (DateEdit2.Date <= 10) then
  begin
    MessageDlg('*** É obrigatório informar a data inicial e final!', mtError, [mbOk], 0);
    Exit;
  end;
  if (DateEdit1.Date > DateEdit2.Date) then
  begin
    MessageDlg('*** Data inicial não pode ser maior que a final!', mtError, [mbOk], 0);
    Exit;
  end;
  prc_Consultar;
end;

procedure TfrmConsModelo_Custo.prc_Consultar;
var
  vComando,
  vCommandoLoteProduto : String;
begin
  fDMConsLote.cdsModelo_Setor.Close;
  fDMConsLote.sdsModelo_Setor.ParamByName('Data1').AsDate := DateEdit1.Date;
  fDMConsLote.sdsModelo_Setor.ParamByName('Data2').AsDate := DateEdit2.Date;
  if RxDBLookupCombo1.Text <> '' then
    fDMConsLote.sdsModelo_Setor.ParamByName('id_setor').AsInteger := RxDBLookupCombo1.KeyValue
  else
    fDMConsLote.sdsModelo_Setor.ParamByName('id_setor').AsInteger := 0;
  fDMConsLote.cdsModelo_Setor.Open;
end;

procedure TfrmConsModelo_Custo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(fDMConsLote);
  Action := Cafree;
end;

procedure TfrmConsModelo_Custo.FormShow(Sender: TObject);
begin
  fDMConsLote := TDMConsLote.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsLote);
  fDMConsLote.cdsSetor.Open;
end;

procedure TfrmConsModelo_Custo.Prc_Gerar_Excel;
var
  linha, coluna: Integer;
  valorCampo: String;
  ColunaP: Integer;
  vTexto: String;
begin
//  linha   := 1;
//  ColunaP := 0;
//  if not titulo then
//  begin
//    for coluna := 1 to vDados.DataSet.FieldCount do
//    begin
//      ColunaP := ColunaP + 1;
//      valorcampo := vDados.DataSet.Fields[coluna - 1].DisplayLabel;
//      planilha.cells[Linha, colunaP] := valorCampo;
//      planilha.cells[Linha, colunaP].Font.bold := True; // Negrito
//    end;
//  end;
//
//  vDados.DataSet.First;
//  while not vDados.DataSet.Eof do
//  begin
//    linha := Linha + 1;
//    ColunaP := 0;
//    for coluna := 1 to vDados.DataSet.FieldCount do
//    begin
//      ColunaP := ColunaP + 1;
//      vTexto := vDados.DataSet.Fields[coluna - 1].AsString;
//      if trim(vTexto) <> '' then
//        valorcampo := vDados.DataSet.Fields[coluna - 1].Value
//
//      else
//        valorcampo := '';
//      if (FieldTypeNames[vDados.DataSet.Fields[coluna - 1].DataType] = 'Integer') then
//      begin
//        if trim(valorcampo) = '' then
//          valorcampo := '0';
//        planilha.Cells[linha, colunaP].NumberFormat := '#.##0_);(#.##0)';
//        planilha.cells[linha, colunaP] := StrToFloat(valorCampo);
//      end
//      else
//      if (FieldTypeNames[vDados.DataSet.Fields[coluna - 1].DataType] = 'Float') then
//      begin
//        if trim(valorcampo) = '' then
//          valorcampo := '0';
//        planilha.Cells[linha, colunaP].NumberFormat := '#.##0,00_);(#.##0,000##)';
//        planilha.cells[linha, colunaP] := StrToFloat(valorCampo);
//      end
//      else
//      if (FieldTypeNames[vDados.DataSet.Fields[coluna - 1].DataType] = 'Date') then
//      begin
//        if fnc_Verifica_Data(valorCampo) then //verfica se uma string é data
//        begin
//          try
//            valorCampo := FormatDateTime('mm/dd/yyyy',StrToDate(valorCampo));
//            planilha.Cells[linha, colunaP].NumberFormat := AnsiString('dd/mm/aaaa');
//            planilha.cells[linha, colunaP] := valorCampo;
//          except
////            vDados.DataSet.Next;
//          end;
//        end;
//      end
//      else
//      begin
//        planilha.Cells[linha, colunaP].NumberFormat := AnsiChar('@');;
//        planilha.cells[linha, colunaP] := valorCampo;
//      end;
//    end;
//    vDados.DataSet.Next;
//  end;



end;

procedure TfrmConsModelo_Custo.NxButton1Click(Sender: TObject);
begin
  if fDMConsLote.cdsModelo_Setor.IsEmpty then
    exit;





//  fDMConsLote.cdsModelo_Setor.First;
//  while not fDMConsLote.cdsModelo_Setor.Eof do
//  begin
//    fDMConsLote.cdsModelo_Mat.Close;
//    fDMConsLote.sdsModelo_Mat.ParamByName('id_produto').AsInteger := fDMConsLote.cdsModelo_SetorID_PRODUTO.AsInteger;
//    fDMConsLote.sdsModelo_Mat.ParamByName('id_setor').AsInteger   := fDMConsLote.cdsModelo_SetorID_SETOR.AsInteger;
//    fDMConsLote.cdsModelo_Mat.Open;
//    fDMConsLote.cdsModelo_Mat.First;
//    while not fDMConsLote.cdsModelo_Mat.Eof do
//    begin
//
//      fDMConsLote.cdsModelo_Mat.Next;
//    end;
//
//    fDMConsLote.cdsModelo_Setor.Next;
//  end;

end;

procedure TfrmConsModelo_Custo.btnImprimirClick(Sender: TObject);
var
  vArq : String;
begin
  if fDMConsLote.cdsModelo_Setor.IsEmpty then
    Exit;
  fDMConsLote.cdsModelo_Setor.DisableControls;
  try
    vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Modelo_Custo.fr3';
    if FileExists(vArq) then
      fDMConsLote.frxReport1.Report.LoadFromFile(vArq)
    else
    begin
      MessageDlg('*** Relatório ' + vArq + ', não encontrado!' , mtInformation, [mbOk], 0);
      exit;
    end;
    //  fDMConsLote.frxReport1.variables['ImpOpcao'] := QuotedStr(vOpcaoImp);
    fDMConsLote.frxReport1.ShowReport;
  finally
    fDMConsLote.cdsModelo_Setor.EnableControls;
  end;
end;

end.
