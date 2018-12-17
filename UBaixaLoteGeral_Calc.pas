unit UBaixaLoteGeral_Calc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMLoteImp_Calc, DBVGrids, Grids, DBGrids, SMDBGrid, StdCtrls,
  NxCollection, RxLookup, NxEdit, CurrEdit, Mask, ToolEdit, ExtCtrls,
  RzTabs, DB, UDMBaixaProd_Calc, RzEdit, Menus, UCBase;

type
  TfrmBaixaLoteGeral_Calc = class(TForm)
    Panel1: TPanel;
    NxLabel2: TNxLabel;
    NxLabel4: TNxLabel;
    NxLabel3: TNxLabel;
    NxLabel5: TNxLabel;
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
    DateEdit3: TDateEdit;
    DateEdit4: TDateEdit;
    Edit1: TEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    RzPageControl1: TRzPageControl;
    TS_Talao: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    Panel2: TPanel;
    NxButton1: TNxButton;
    Label1: TLabel;
    DateEdit5: TDateEdit;
    Label7: TLabel;
    RzDateTimeEdit1: TRzDateTimeEdit;
    UCControls1: TUCControls;
    Edit2: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsTalaoClick(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure NxButton1Click(Sender: TObject);
  private
    { Private declarations }
    fDMLoteImp_Calc: TDMLoteImp_Calc;
    fDMBaixaProd_Calc : TDMBaixaProd_Calc;
    vOpcaoImp : String;

  public
    { Public declarations }
  end;

var
  frmBaixaLoteGeral_Calc: TfrmBaixaLoteGeral_Calc;

implementation

uses rsDBUtils, USel_Pessoa, uUtilPadrao;

{$R *.dfm}

procedure TfrmBaixaLoteGeral_Calc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmBaixaLoteGeral_Calc.FormShow(Sender: TObject);
var
  i : Integer;
begin
  fDMLoteImp_Calc:= TDMLoteImp_Calc.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMLoteImp_Calc);
  fDMBaixaProd_Calc := TDMBaixaProd_Calc.Create(self);
  oDBUtils.SetDataSourceProperties(Self, fDMBaixaProd_Calc);

  for i := 0 to SMDBGrid1.ColCount - 2 do
  begin
    if SMDBGrid1.Columns[i].FieldName = 'NUM_ORDEM' then
      SMDBGrid1.Columns[i].Visible := (fDMLoteImp_Calc.qParametros_LoteUSA_REMESSA.AsString <> 'S');
    if SMDBGrid1.Columns[i].FieldName = 'NUM_REMESSA' then
      SMDBGrid1.Columns[i].Visible := (fDMLoteImp_Calc.qParametros_LoteUSA_REMESSA.AsString = 'S');
  end;

  if fDMLoteImp_Calc.qParametros_LoteUSA_REMESSA.AsString = 'S' then
    NxLabel2.Caption := 'Nº Remessa';
end;

procedure TfrmBaixaLoteGeral_Calc.btnConsTalaoClick(Sender: TObject);
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
      vComando := vComando + '  AND L.NUM_ORDEM = ' + vNumAux;
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
  vComando := vComando + ' AND TS.DTSAIDA is null';
  if trim(Edit1.Text) <> '' then
    vComando := vComando + ' AND T.REFERENCIA = ' + QuotedStr(Edit1.Text);
  if trim(RxDBLookupCombo1.Text) <> '' then
    vComando := vComando + ' AND TS.ID_SETOR = ' + IntToStr(RxDBLookupCombo1.KeyValue);
  fDMLoteImp_Calc.cdsConsulta_Lote.Close;
  fDMLoteImp_Calc.sdsConsulta_Lote.CommandText := fDMLoteImp_Calc.ctConsulta_Lote + vComando;
  fDMLoteImp_Calc.cdsConsulta_Lote.Open;
  fDMLoteImp_Calc.cdsConsulta_Lote.IndexFieldNames := 'ID;NUM_TALAO;ITEM';
end;

procedure TfrmBaixaLoteGeral_Calc.SMDBGrid1TitleClick(Column: TColumn);
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

procedure TfrmBaixaLoteGeral_Calc.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMLoteImp_Calc.cdsConsulta_LoteDTSAIDA.AsDateTime > 10 then
    Background := $0077FF77
  else
  if fDMLoteImp_Calc.cdsConsulta_LoteDTENTRADA.AsDateTime > 10 then
    Background := $00FFFFB9;
end;

procedure TfrmBaixaLoteGeral_Calc.NxButton1Click(Sender: TObject);
var
  vGerar : Boolean;
begin
  vGerar := False;
  fDMLoteImp_Calc.cdsConsulta_Lote.First;
  while not fDMLoteImp_Calc.cdsConsulta_Lote.Eof do
  begin
    if (SMDBGrid1.SelectedRows.CurrentRowSelected)  then
    begin
      vGerar := True;
      if DateEdit5.Date > 10 then
        fDMBaixaProd_Calc.vDataBaixa := DateEdit5.Date
      else
        fDMBaixaProd_Calc.vDataBaixa := Date;
      if trim(RzDateTimeEdit1.Text) <> '' then
        fDMBaixaProd_Calc.vHoraBaixa := RzDateTimeEdit1.Time
      else
        fDMBaixaProd_Calc.vHoraBaixa := Now;
      fDMBaixaProd_Calc.prc_Abrir_Baixa_Processo(fDMLoteImp_Calc.cdsConsulta_LoteID.AsInteger,fDMLoteImp_Calc.cdsConsulta_LoteNUM_TALAO.AsInteger,fDMLoteImp_Calc.cdsConsulta_LoteID_SETOR.AsInteger);
      if not fDMBaixaProd_Calc.cdsTalao_Setor.IsEmpty then
        fDMBaixaProd_Calc.prc_Gravar_Talao_Setor;
    end;
    fDMLoteImp_Calc.cdsConsulta_Lote.Next;
  end;
  if not vGerar then
    MessageDlg('Nenhum registro selecionado!', mtError,[mbOK],0)
  else
    ShowMessage('Setor(es) encerrado(s)!');
  fDMLoteImp_Calc.cdsConsulta_Lote.First;
  btnConsTalaoClick(Sender);
end;

end.
