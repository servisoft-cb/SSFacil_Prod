unit UConsProdutividade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMLoteImp_Calc, DBVGrids, Grids, DBGrids, SMDBGrid, StdCtrls,
  NxCollection, RxLookup, NxEdit, CurrEdit, Mask, ToolEdit, ExtCtrls,
  RzTabs, DB;

type
  TfrmConsProdutividade = class(TForm)
    Panel1: TPanel;
    NxLabel2: TNxLabel;
    NxLabel4: TNxLabel;
    NxLabel3: TNxLabel;
    NxLabel5: TNxLabel;
    NxLabel6: TNxLabel;
    NxLabel1: TNxLabel;
    NxLabel7: TNxLabel;
    NxLabel8: TNxLabel;
    NxLabel9: TNxLabel;
    NxLabel11: TNxLabel;
    btnConsTalao: TNxButton;
    CurrencyEdit1: TCurrencyEdit;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    CurrencyEdit2: TCurrencyEdit;
    cbxOpcao: TNxComboBox;
    DateEdit3: TDateEdit;
    DateEdit4: TDateEdit;
    Edit1: TEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    btnImprimir: TNxButton;
    RzPageControl1: TRzPageControl;
    TS_Talao: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    Edit2: TEdit;
    NxLabel10: TNxLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsTalaoClick(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnImprimirClick(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SMDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    fDMLoteImp_Calc: TDMLoteImp_Calc;
    vOpcaoImp : String;

    procedure prc_Monta_Opcao;
    procedure prc_Consulta_Lote;

  public
    { Public declarations }
  end;

var
  frmConsProdutividade: TfrmConsProdutividade;

implementation

uses rsDBUtils, USel_Pessoa, uUtilPadrao, Math, USel_Produto;

{$R *.dfm}

procedure TfrmConsProdutividade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsProdutividade.FormShow(Sender: TObject);
var
  i : Integer;
begin
  fDMLoteImp_Calc:= TDMLoteImp_Calc.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMLoteImp_Calc);
  fDMLoteImp_Calc.cdsProcesso.Open;
  if fDMLoteImp_Calc.qParametros_LoteUSA_REMESSA.AsString = 'S' then
    NxLabel2.Caption := 'Nº Remessa:'
  else
    NxLabel2.Caption := 'Nº Ordem Produção:';

  for i := 0 to SMDBGrid1.ColCount - 2 do
  begin
    if SMDBGrid1.Columns[i].FieldName = 'NUM_ORDEM' then
      SMDBGrid1.Columns[i].Visible := (fDMLoteImp_Calc.qParametros_LoteUSA_REMESSA.AsString <> 'S');
    if SMDBGrid1.Columns[i].FieldName = 'NUM_REMESSA' then
      SMDBGrid1.Columns[i].Visible := (fDMLoteImp_Calc.qParametros_LoteUSA_REMESSA.AsString = 'S');
  end;

end;

procedure TfrmConsProdutividade.btnConsTalaoClick(Sender: TObject);
begin
  prc_Consulta_Lote;
end;

procedure TfrmConsProdutividade.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  //fDMLoteImp_Calc.cdsConsTalao.IndexFieldNames := Column.FieldName;
  //Column.Title.Color := clBtnShadow;
  //for i := 0 to SMDBGrid1.Columns.Count - 1 do
  //  if not (SMDBGrid1.Columns.Items[I] = Column) then
  //    SMDBGrid1.Columns.Items[I].Title.Color := clBtnFace;
end;

procedure TfrmConsProdutividade.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMLoteImp_Calc.cdsConsulta_LoteDTSAIDA.AsDateTime > 10 then
    Background := $0077FF77
  else
  if fDMLoteImp_Calc.cdsConsulta_LoteDTENTRADA.AsDateTime > 10 then
    Background := $00FFFFB9;
end;

procedure TfrmConsProdutividade.btnImprimirClick(Sender: TObject);
var
  vArq : String;
begin
  prc_Monta_Opcao;
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Lote_Det_Calc.fr3';
  if FileExists(vArq) then
    fDMLoteImp_Calc.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    MessageDlg('*** Relatório ' + vArq + ', não encontrado!' , mtInformation, [mbOk], 0);
    exit;
  end;
  fDMLoteImp_Calc.frxReport1.variables['ImpOpcao'] := QuotedStr(vOpcaoImp);
  fDMLoteImp_Calc.frxReport1.ShowReport;
end;

procedure TfrmConsProdutividade.prc_Monta_Opcao;
begin
  vOpcaoImp := '';
  if trim(Edit2.Text) = '' then
  begin
    if fDMLoteImp_Calc.qParametros_LoteUSA_REMESSA.AsString = 'S' then
      vOpcaoImp := vOpcaoImp + '(Nº Remessa: ' + Edit2.Text + ')'
    else
      vOpcaoImp := vOpcaoImp + '(Nº O.P.: ' + Edit2.Text + ')';
  end;

  if (CurrencyEdit1.AsInteger > 0) and (CurrencyEdit2.AsInteger > 0) then
    vOpcaoImp := vOpcaoImp + '(Lote: ' + CurrencyEdit1.Text + ' a ' + CurrencyEdit2.Text + ')'
  else
  if (CurrencyEdit1.AsInteger > 0) then
    vOpcaoImp := vOpcaoImp + '(Lote Inicial: ' + CurrencyEdit1.Text + ')'
  else
  if (CurrencyEdit2.AsInteger > 0) then
    vOpcaoImp := vOpcaoImp + '(Lote Final: ' + CurrencyEdit2.Text + ')';
  if (DateEdit1.Date > 10) and (DateEdit2.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt Entrada: ' + DateEdit1.Text + ' a ' + DateEdit2.Text + ')'
  else
  if (DateEdit1.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt Entrada (Ini): ' + DateEdit1.Text + ')'
  else
  if (DateEdit2.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt Entrada (Fin): ' + DateEdit2.Text + ')';

  if (DateEdit3.Date > 10) and (DateEdit4.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt Saída: ' + DateEdit3.Text + ' a ' + DateEdit4.Text + ')'
  else
  if (DateEdit3.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt Saída(Ini): ' + DateEdit3.Text + ')'
  else
  if (DateEdit4.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt Saída (Fin): ' + DateEdit4.Text + ')';
  if trim(RxDBLookupCombo1.Text) <> '' then
    vOpcaoImp := vOpcaoImp + '(Setor: ' + RxDBLookupCombo1.Text + ')';
  if trim(Edit1.Text) <> '' then
    vOpcaoImp := vOpcaoImp + '(Referência: ' + Edit1.Text + ')';
  case cbxOpcao.ItemIndex of
    1 : vOpcaoImp := vOpcaoImp + '(Pendente)';
    2 : vOpcaoImp := vOpcaoImp + '(Encerrados)';
    3 : vOpcaoImp := vOpcaoImp + '(Talões Aguardando)';
  end;
end;

procedure TfrmConsProdutividade.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    btnConsTalaoClick(Sender);
end;

procedure TfrmConsProdutividade.prc_Consulta_Lote;
var
  vComando : String;
  vNumAux : String;
begin
  vComando := ' WHERE 0 = 0';
  vNumAux := Edit2.Text;
  if fDMLoteImp_Calc.qParametros_LoteUSA_REMESSA.AsString <> 'S' then
    vNumAux := Monta_Numero(Edit2.Text,0);
  if trim(vNumAux) <> '' then
  begin
    if fDMLoteImp_Calc.qParametros_LoteUSA_REMESSA.AsString = 'S' then
      vComando := vComando + '  AND L.NUM_REMESSA = ' + QuotedStr(vNumAux)
    else
      vComando := vComando + '  AND L.NUM_ORDEM = ' + vNumAux ;
  end;
  if CurrencyEdit1.AsInteger > 0 then
    vComando := vComando + '  AND L.NUM_LOTE >= ' + IntToStr(CurrencyEdit1.AsInteger);
  if CurrencyEdit2.AsInteger > 0 then
    vComando := vComando + '  AND L.NUM_LOTE <= ' + IntToStr(CurrencyEdit2.AsInteger);
  if DateEdit1.Date > 10 then
    vComando := vComando + ' AND TS.DTENTRADA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    vComando := vComando + ' AND TS.DTENTRADA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  if DateEdit3.Date > 10 then
    vComando := vComando + ' AND TS.DTSAIDA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit3.date));
  if DateEdit4.Date > 10 then
    vComando := vComando + ' AND TS.DTSAIDA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit4.date));
  case cbxOpcao.ItemIndex of
    1 : vComando := vComando + ' AND TS.DTSAIDA is null ';
    2 : vComando := vComando + ' AND TS.DTSAIDA is not null ';
    3 : vComando := vComando + ' AND TS.DTENTRADA is null ';
  end;
  if trim(Edit1.Text) <> '' then
    vComando := vComando + ' AND T.REFERENCIA LIKE ' + QuotedStr(Edit1.Text+'%');
  if trim(RxDBLookupCombo1.Text) <> '' then
    vComando := vComando + ' AND TS.ID_SETOR = ' + IntToStr(RxDBLookupCombo1.KeyValue);
  fDMLoteImp_Calc.cdsConsulta_Lote.Close;
  fDMLoteImp_Calc.sdsConsulta_Lote.CommandText := fDMLoteImp_Calc.ctConsulta_Lote + vComando;
  fDMLoteImp_Calc.cdsConsulta_Lote.Open;
  fDMLoteImp_Calc.cdsConsulta_Lote.IndexFieldNames := 'ID;NUM_TALAO;ITEM';
end;

procedure TfrmConsProdutividade.SMDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMLoteImp_Calc.cdsConsProcessoDTBAIXA.AsDateTime > 10 then
    Background := $0077FF77
  else
  if fDMLoteImp_Calc.cdsConsProcessoDTENTRADA.AsDateTime > 10 then
    Background := $00FFFFB9;
end;

procedure TfrmConsProdutividade.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    vReferencia_Pos := '';
    frmSel_Produto  := TfrmSel_Produto.Create(Self);
    frmSel_Produto.vTipo_Prod := 'P';
    frmSel_Produto.ShowModal;
    FreeAndNil(frmSel_Produto);
    if trim(vReferencia_Pos) <> '' then
      Edit1.Text := vReferencia_Pos;
  end;
end;

end.
