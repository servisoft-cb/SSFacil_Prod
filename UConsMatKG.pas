unit UConsMatKG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMLoteImp, DBVGrids, Grids, DBGrids, SMDBGrid, StdCtrls,
  NxCollection, RxLookup, NxEdit, CurrEdit, Mask, ToolEdit, ExtCtrls,
  RzTabs, DB, Menus, StrUtils;

type
  TfrmConsMatKG = class(TForm)
    RzPageControl1: TRzPageControl;
    TS_Material: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    StaticText1: TStaticText;
    Panel1: TPanel;
    NxLabel2: TNxLabel;
    NxLabel4: TNxLabel;
    NxLabel3: TNxLabel;
    NxLabel5: TNxLabel;
    NxLabel1: TNxLabel;
    NxLabel7: TNxLabel;
    NxLabel8: TNxLabel;
    NxLabel9: TNxLabel;
    lblNomeCliente: TNxLabel;
    NxLabel16: TNxLabel;
    NxLabel17: TNxLabel;
    btnConsTalao: TNxButton;
    CurrencyEdit3: TCurrencyEdit;
    CurrencyEdit1: TCurrencyEdit;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    CurrencyEdit2: TCurrencyEdit;
    DateEdit3: TDateEdit;
    DateEdit4: TDateEdit;
    Edit1: TEdit;
    btnImprimir: TNxButton;
    DateEdit7: TDateEdit;
    DateEdit8: TDateEdit;
    TS_Ref: TRzTabSheet;
    SMDBGrid2: TSMDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsTalaoClick(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure SMDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnImprimirClick(Sender: TObject);
    procedure SMDBGrid2TitleClick(Column: TColumn);
  private
    { Private declarations }
    fDMLoteImp: TDMLoteImp;
    vOpcaoImp : String;

    procedure prc_Monta_Opcao;
    procedure prc_Consulta_MatKG;
    procedure prc_Consulta_MatKG_Ref;

    function fnc_Condicao : string;
    
  public
    { Public declarations }
  end;

var
  frmConsMatKG: TfrmConsMatKG;

implementation

uses rsDBUtils, uUtilPadrao;

{$R *.dfm}

procedure TfrmConsMatKG.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsMatKG.FormShow(Sender: TObject);
begin
  fDMLoteImp:= TDMLoteImp.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMLoteImp);
end;

procedure TfrmConsMatKG.btnConsTalaoClick(Sender: TObject);
begin
  if RzPageControl1.ActivePage = TS_Material then
    prc_Consulta_MatKG
  else
    prc_Consulta_MatKG_Ref;
end;

procedure TfrmConsMatKG.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  fDMLoteImp.cdsConsulta_Lote.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I] = Column) then
      SMDBGrid1.Columns.Items[I].Title.Color := $008BFF17;
end;

procedure TfrmConsMatKG.prc_Monta_Opcao;
begin
  vOpcaoImp := '';
  if CurrencyEdit3.AsInteger > 0 then
    vOpcaoImp := vOpcaoImp + '(Nº O.P.: ' + CurrencyEdit3.Text + ')';
  if (CurrencyEdit1.AsInteger > 0) and (CurrencyEdit2.AsInteger > 0) then
    vOpcaoImp := vOpcaoImp + '(Lote: ' + CurrencyEdit1.Text + ' a ' + CurrencyEdit2.Text + ')'
  else
  if (CurrencyEdit1.AsInteger > 0) then
    vOpcaoImp := vOpcaoImp + '(Lote Inicial: ' + CurrencyEdit1.Text + ')'
  else
  if (CurrencyEdit2.AsInteger > 0) then
    vOpcaoImp := vOpcaoImp + '(Lote Final: ' + CurrencyEdit2.Text + ')';
  if (DateEdit1.Date > 10) and (DateEdit2.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt Entrada Proc.: ' + DateEdit1.Text + ' a ' + DateEdit2.Text + ')'
  else
  if (DateEdit1.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt Entrada Proc.(Ini): ' + DateEdit1.Text + ')'
  else
  if (DateEdit2.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt Entrada Proc.(Fin): ' + DateEdit2.Text + ')';

  if (DateEdit3.Date > 10) and (DateEdit4.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt Baixa Proc.: ' + DateEdit3.Text + ' a ' + DateEdit4.Text + ')'
  else
  if (DateEdit3.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt Baixa Proc.(Ini): ' + DateEdit3.Text + ')'
  else
  if (DateEdit4.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt Baixa Proc.(Fin): ' + DateEdit4.Text + ')';
  if trim(Edit1.Text) <> '' then
    vOpcaoImp := vOpcaoImp + '(Referência: ' + Edit1.Text + ')';
end;

procedure TfrmConsMatKG.prc_Consulta_MatKG;
var
  vComandoAux, vComandoAux2: String;
  i : Integer;
begin
  fDMLoteImp.cdsConsMatKG.Close;
  i := PosEx('GROUP',UpperCase(fDMLoteImp.ctConsMatKG),0);
  vComandoAux  := copy(fDMLoteImp.ctConsMatKG,i,Length(fDMLoteImp.ctConsMatKG) - i + 1);
  vComandoAux2 := copy(fDMLoteImp.ctConsMatKG,1,i-1);

  fDMLoteImp.sdsConsMatKG.CommandText := vComandoAux2 + fnc_Condicao + vComandoAux;
  fDMLoteImp.cdsConsMatKG.Open;
  fDMLoteImp.cdsConsMatKG.IndexFieldNames := 'NOME_PROCESSO;NOME_MATERIAL;NOME_COR_MAT';
end;

procedure TfrmConsMatKG.SMDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMLoteImp.cdsLote_PedDTBAIXA.AsDateTime > 10 then
    Background := $0077FF77
  else
  if fDMLoteImp.cdsLote_PedDTENTRADA.AsDateTime > 10 then
    Background := $00FFFFB9;
end;

procedure TfrmConsMatKG.prc_Consulta_MatKG_Ref;
var
  vComandoAux, vComandoAux2: String;
  i : Integer;
begin
  fDMLoteImp.cdsConsMatKG_Ref.Close;
  i := PosEx('GROUP',UpperCase(fDMLoteImp.ctConsMatKG_Ref),0);
  vComandoAux  := copy(fDMLoteImp.ctConsMatKG_Ref,i,Length(fDMLoteImp.ctConsMatKG_Ref) - i + 1);
  vComandoAux2 := copy(fDMLoteImp.ctConsMatKG_Ref,1,i-1);

  fDMLoteImp.sdsConsMatKG_Ref.CommandText := vComandoAux2 + fnc_Condicao + vComandoAux;
  fDMLoteImp.cdsConsMatKG_Ref.Open;
  fDMLoteImp.cdsConsMatKG_Ref.IndexFieldNames := 'NOME_PROCESSO;REFERENCIA;NOME_MATERIAL;NOME_COR_MAT';
end;

function TfrmConsMatKG.fnc_Condicao: string;
var
  vComando : String;
begin
  if CurrencyEdit3.AsInteger > 0 then
    vComando := vComando + '  AND L.NUM_ORDEM = ' + IntToStr(CurrencyEdit3.AsInteger);
  if CurrencyEdit1.AsInteger > 0 then
    vComando := vComando + '  AND L.NUM_LOTE >= ' + IntToStr(CurrencyEdit1.AsInteger);
  if CurrencyEdit2.AsInteger > 0 then
    vComando := vComando + '  AND L.NUM_LOTE <= ' + IntToStr(CurrencyEdit2.AsInteger);
  if DateEdit1.Date > 10 then
    vComando := vComando + ' AND B.DTENTRADA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    vComando := vComando + ' AND B.DTENTRADA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  if DateEdit3.Date > 10 then
    vComando := vComando + ' AND B.DTBAIXA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit3.date));
  if DateEdit4.Date > 10 then
    vComando := vComando + ' AND B.DTBAIXA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit4.date));

  if DateEdit7.Date > 10 then
    vComando := vComando + ' AND L.DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit7.date));
  if DateEdit8.Date > 10 then
    vComando := vComando + ' AND L.DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit8.date));

  if trim(Edit1.Text) <> '' then
    vComando := vComando + ' AND PROD.REFERENCIA = ' + QuotedStr(Edit1.Text);

  Result := vComando;

end;

procedure TfrmConsMatKG.btnImprimirClick(Sender: TObject);
var
  vArq : String;
begin
  prc_Monta_Opcao;
  if RzPageControl1.ActivePage = TS_Material then
  begin
    vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\MatKG.fr3';
    fDMLoteImp.cdsConsMatKG.IndexFieldNames := 'NOME_PROCESSO;NOME_MATERIAL;NOME_COR_MAT';
  end
  else
  begin
    vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\MatKG_Ref.fr3';
    fDMLoteImp.cdsConsMatKG_Ref.IndexFieldNames := 'NOME_PROCESSO;REFERENCIA;NOME_MATERIAL;NOME_COR_MAT';
  end;
  if FileExists(vArq) then
    fDMLoteImp.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    MessageDlg('*** Relatório ' + vArq + ', não encontrado!' , mtInformation, [mbOk], 0);
    exit;
  end;
  fDMLoteImp.frxReport1.variables['ImpOpcao'] := QuotedStr(vOpcaoImp);
  fDMLoteImp.frxReport1.ShowReport;
end;

procedure TfrmConsMatKG.SMDBGrid2TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  fDMLoteImp.cdsConsulta_Lote.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid2.Columns.Count - 1 do
    if not (SMDBGrid2.Columns.Items[I] = Column) then
      SMDBGrid2.Columns.Items[I].Title.Color := $00FFFF9B;
end;

end.
