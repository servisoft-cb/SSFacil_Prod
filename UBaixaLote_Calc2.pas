unit UBaixaLote_Calc2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Grids,
  FMTBcd, DB, RxLookup, UCBase, Mask, ToolEdit, NxCollection, NxEdit, CurrEdit, ComCtrls, RzDTP, RzEdit,
  RzPanel, SqlExpr, dbXPress, UDMBaixaProd_Calc, DBGrids, SMDBGrid;

type
  TfrmBaixaLote_Calc2 = class(TForm)
    Panel1: TPanel;
    Label5: TLabel;
    Panel2: TPanel;
    SMDBGrid1: TSMDBGrid;
    btnConfirmar: TNxButton;
    btnCancelar: TNxButton;
    Label3: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label11: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnCancelarClick(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    vMSGLocal : WideString;
    vNumPedido_Loc : Integer;
    vRef_Loc, vNome_Comb_Loc, vNome_Prod_Loc : String;

    vContador: Integer;

    procedure prc_Gravar_ES;

    procedure prc_Abrir_Baixa_Processo(ID_Lote, Num_Talao, ID_Setor : Integer);
    procedure prc_Le_Talao_Setor;
    procedure prc_Le_Talao_Setor_Atu;

    procedure prc_Montar_mLote_Setor2;

  public
    { Public declarations }
    fDMBaixaProd_Calc: TDMBaixaProd_Calc;
    vNum_Lote_Loc : Integer;
    vHora_Loc: TTime;
    vData_Loc:TDate;
    vDig : String;

  end;

var
  frmBaixaLote_Calc2: TfrmBaixaLote_Calc2;

implementation

uses DmdDatabase, uUtilPadrao, rsDBUtils, UMenu, Math, USel_Esteira;

{$R *.dfm}

procedure TfrmBaixaLote_Calc2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmBaixaLote_Calc2.FormShow(Sender: TObject);
var
  i : Integer;
begin
  oDBUtils.SetDataSourceProperties(Self, fDMBaixaProd_Calc);

  if vDig = '9' then
  begin
    for i := 1 to SMDBGrid1.ColCount - 2 do
    begin
      if (SMDBGrid1.Columns[i].FieldName = 'Item') or (SMDBGrid1.Columns[i].FieldName = 'DtEntrada')
        or (SMDBGrid1.Columns[i].FieldName = 'Qtd') or (SMDBGrid1.Columns[i].FieldName = 'Qtd_Pendente') then
        SMDBGrid1.Columns[i].Visible := False;
    end;
  end;
  Label3.Visible        := (vDig = '2');
  CurrencyEdit1.Visible := (vDig = '2');
  Label11.Visible       := (vDig = '2');
  btnConfirmar.Visible  := (vDig = '9');

  prc_Montar_mLote_Setor2;
end;

procedure TfrmBaixaLote_Calc2.prc_Gravar_ES;
var
  ID: TTransactionDesc;
begin
  vMSGLocal := '';
  ID.TransactionID  := 1;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    vMSGLocal := vMSGLocal + '  Lote: ' + fDMBaixaProd_Calc.cdsLoteNUM_LOTE.AsString + '/' + fDMBaixaProd_Calc.cdsTalaoNUM_TALAO.AsString;
    vMSGLocal := vMSGLocal + #13 + '  Referência: ' + fDMBaixaProd_Calc.cdsLoteREFERENCIA.AsString;

    fDMBaixaProd_Calc.mLote_Setor.First;
    while not fDMBaixaProd_Calc.mLote_Setor.Eof do
    begin
      if fDMBaixaProd_Calc.mLote_SetorSelecionado.AsBoolean then
      begin
        prc_Abrir_Baixa_Processo(fDMBaixaProd_Calc.mLote_SetorID.AsInteger,0,fDMBaixaProd_Calc.mLote_SetorID_Setor.AsInteger);
        prc_Le_Talao_Setor;
      end;

      fDMBaixaProd_Calc.mLote_Setor.Next;
    end;

    prc_Abrir_Baixa_Processo(fDMBaixaProd_Calc.mLote_SetorID.AsInteger,0,0);
    prc_Le_Talao_Setor_Atu;

    dmDatabase.scoDados.Commit(ID);
    
    Label5.Caption := 'LOTE ' + IntToStr(vNum_Lote_Loc) +  #13 + #13 + '  Processo Concluído';

    MessageDlg('*** Processo Concluído!', mtError, [mbOk], 0);

  except
      on e: Exception do
      begin
        dmDatabase.scoDados.Rollback(ID);
        raise Exception.Create('Erro ao gravar Baixa Processo: ' + #13+#13 + e.Message);
      end;
  end;
  Panel2.Visible := False;

  Close;
end;

procedure TfrmBaixaLote_Calc2.Edit1Change(Sender: TObject);
begin
  Label5.Caption := '';
  Panel2.Visible := False;
end;

procedure TfrmBaixaLote_Calc2.prc_Abrir_Baixa_Processo(ID_Lote, Num_Talao, ID_Setor : Integer);
var
  vComando : String;
begin
  fDMBaixaProd_Calc.cdsTalao_Setor.Close;
  fDMBaixaProd_Calc.sdsTalao_Setor.CommandText := fDMBaixaProd_Calc.ctTalao_Setor;
  if ID_SETOR > 0 then
  begin
    fDMBaixaProd_Calc.sdsTalao_Setor.CommandText := fDMBaixaProd_Calc.sdsTalao_Setor.CommandText
                                                  + ' AND ID_SETOR = :ID_SETOR ';
    fDMBaixaProd_Calc.sdsTalao_Setor.ParamByName('ID_SETOR').AsInteger := ID_Setor;
  end;
  fDMBaixaProd_Calc.sdsTalao_Setor.ParamByName('ID').AsInteger       := ID_Lote;
  fDMBaixaProd_Calc.cdsTalao_Setor.Open;
end;

procedure TfrmBaixaLote_Calc2.btnConfirmarClick(Sender: TObject);
begin
  if MessageDlg('Confirmar a baixa dos setores selecionados?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  Close;

  //prc_Gravar_ES;
end;

procedure TfrmBaixaLote_Calc2.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMBaixaProd_Calc.mLote_SetorBaixado.AsBoolean then
    Background := $0077FF77;
end;

procedure TfrmBaixaLote_Calc2.prc_Le_Talao_Setor;
var
  vAtualizar : String;
  vSaida : Boolean;
begin
  fDMBaixaProd_Calc.cdsTalao_Setor.First;
  while not fDMBaixaProd_Calc.cdsTalao_Setor.Eof do
  begin
    vSaida     := True;
    fDMBaixaProd_Calc.cdsTalao_Setor.Edit;
    if fDMBaixaProd_Calc.cdsTalao_SetorDTENTRADA.IsNull then
    begin
      fDMBaixaProd_Calc.cdsTalao_SetorDTENTRADA.AsDateTime := vData_Loc;
      fDMBaixaProd_Calc.cdsTalao_SetorHRENTRADA.AsDateTime := vHora_Loc;
      //fDMBaixaProd_Calc.cdsTalao_SetorQTD.AsInteger := fDMBaixaProd_Calc.mLote_SetorQtd.AsInteger;
    end;
    if fDMBaixaProd_Calc.cdsTalao_SetorDTSAIDA.IsNull then
    begin
      fDMBaixaProd_Calc.cdsTalao_SetorDTSAIDA.AsDateTime := vData_Loc;
      fDMBaixaProd_Calc.cdsTalao_SetorHRSAIDA.AsDateTime := vHora_Loc;
      fDMBaixaProd_Calc.cdsTalao_SetorTOTAL_HORAS.AsFloat := fnc_Calcular_Hora2(fDMBaixaProd_Calc.cdsTalao_SetorHRENTRADA.AsDateTime,
                                                                              fDMBaixaProd_Calc.cdsTalao_SetorHRSAIDA.AsDateTime,
                                                                              fDMBaixaProd_Calc.cdsTalao_SetorDTENTRADA.AsDateTime,
                                                                              fDMBaixaProd_Calc.cdsTalao_SetorDTSAIDA.AsDateTime);
    end;
    fDMBaixaProd_Calc.cdsTalao_Setor.Post;
    fDMBaixaProd_Calc.cdsTalao_Setor.Next;
  end;
  fDMBaixaProd_Calc.cdsTalao_Setor.ApplyUpdates(0);
end;

procedure TfrmBaixaLote_Calc2.prc_Le_Talao_Setor_Atu;
var
  vAtualizar : String;
  vGravar : Boolean;
begin
  vGravar := False;
  vAtualizar := 'N';
  fDMBaixaProd_Calc.cdsTalao_Setor.First;
  while not fDMBaixaProd_Calc.cdsTalao_Setor.Eof do
  begin
    if (vAtualizar = 'S') and (fDMBaixaProd_Calc.cdsTalao_SetorclEntrada_Aut.AsString = 'S') and (fDMBaixaProd_Calc.cdsTalao_SetorDTENTRADA.IsNull) then
    begin
      fDMBaixaProd_Calc.cdsTalao_Setor.Edit;
      fDMBaixaProd_Calc.cdsTalao_SetorDTENTRADA.AsDateTime := vData_Loc;
      fDMBaixaProd_Calc.cdsTalao_SetorHRENTRADA.AsDateTime := vHora_Loc;
      fDMBaixaProd_Calc.cdsTalao_Setor.Post;
      vGravar := True;
    end;
    vAtualizar := 'N';
    if fDMBaixaProd_Calc.cdsTalao_SetorDTSAIDA.AsDateTime > 10 then
      vAtualizar := 'S';
    fDMBaixaProd_Calc.cdsTalao_Setor.Next;
  end;
  if vGravar  then
    fDMBaixaProd_Calc.cdsTalao_Setor.ApplyUpdates(0);
end;

procedure TfrmBaixaLote_Calc2.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBaixaLote_Calc2.SMDBGrid1DblClick(Sender: TObject);
begin
  if fDMBaixaProd_Calc.mLote_SetorBaixado.AsBoolean then
    exit;
  fDMBaixaProd_Calc.mLote_Setor.Edit;
  fDMBaixaProd_Calc.mLote_SetorSelecionado.AsBoolean := not(fDMBaixaProd_Calc.mLote_SetorSelecionado.AsBoolean);
  if fDMBaixaProd_Calc.mLote_SetorID_Esteira.AsInteger <= 0 then
  begin
    fDMBaixaProd_Calc.cdsEsteira.Close;
    fDMBaixaProd_Calc.sdsEsteira.ParamByName('ID_SETOR_PRINCIPAL').AsInteger := fDMBaixaProd_Calc.mLote_SetorID_Setor.AsInteger;
    fDMBaixaProd_Calc.cdsEsteira.Open;
    if fDMBaixaProd_Calc.cdsEsteira.RecordCount > 1 then
    begin
      frmSel_Esteira := TfrmSel_Esteira.Create(self);
      frmSel_Esteira.fDMBaixaProd_Calc := fDMBaixaProd_Calc;
      frmSel_Esteira.ShowModal;
      FreeAndNil(frmSel_Esteira);
    end
    else
    if fDMBaixaProd_Calc.cdsEsteiraID.AsInteger > 0 then
      fDMBaixaProd_Calc.vID_Esteira_Tal := fDMBaixaProd_Calc.cdsEsteiraID.AsInteger
    else
      fDMBaixaProd_Calc.vID_Esteira_Tal := fDMBaixaProd_Calc.mLote_SetorID_Setor.AsInteger;
    if fDMBaixaProd_Calc.vID_Esteira_Tal > 0 then
      fDMBaixaProd_Calc.mLote_SetorID_Esteira.AsInteger := fDMBaixaProd_Calc.vID_Esteira_Tal
    else
      fDMBaixaProd_Calc.mLote_SetorID_Esteira.AsInteger := fDMBaixaProd_Calc.mLote_SetorID_Setor.AsInteger;

  end;

  fDMBaixaProd_Calc.mLote_Setor.Post;

  if (vDig = '2') and (fDMBaixaProd_Calc.mLote_SetorSelecionado.AsBoolean) then
  begin
    fDMBaixaProd_Calc.vID_Setor_Tal   := fDMBaixaProd_Calc.mLote_SetorID_Setor.AsInteger;
    fDMBaixaProd_Calc.vID_Esteira_Tal := fDMBaixaProd_Calc.mLote_SetorID_Esteira.AsInteger;
    Close;
  end;
end;

procedure TfrmBaixaLote_Calc2.prc_Montar_mLote_Setor2;
begin
  fDMBaixaProd_Calc.mLote_Setor.EmptyDataSet;
  if vDig = '9' then
  begin
    fDMBaixaProd_Calc.cdsFuncLote_Setor.First;
    while not fDMBaixaProd_Calc.cdsFuncLote_Setor.Eof do
    begin
      fDMBaixaProd_Calc.mLote_Setor.Insert;
      fDMBaixaProd_Calc.mLote_SetorID_Setor.AsInteger     := fDMBaixaProd_Calc.cdsFuncLote_SetorID_SETOR.AsInteger;
      fDMBaixaProd_Calc.mLote_SetorQtd.AsInteger          := 0;
      fDMBaixaProd_Calc.mLote_SetorNome_Setor.AsString    := fDMBaixaProd_Calc.cdsFuncLote_SetorNOME_SETOR.AsString;
      fDMBaixaProd_Calc.mLote_SetorNum_Lote.AsInteger     := vNum_Lote_Loc;
      fDMBaixaProd_Calc.mLote_SetorItem.AsInteger         := 0;
      fDMBaixaProd_Calc.mLote_SetorID.AsInteger           := 0;
      fDMBaixaProd_Calc.mLote_SetorQtd_Pendente.AsInteger := 0;
      fDMBaixaProd_Calc.mLote_SetorBaixado.AsBoolean      := False;
      fDMBaixaProd_Calc.mLote_SetorID_Esteira.AsInteger   := fDMBaixaProd_Calc.cdsFuncLote_SetorID_ESTEIRA_TAL.AsInteger;
      fDMBaixaProd_Calc.mLote_SetorNome_Esteira.AsString  := fDMBaixaProd_Calc.cdsFuncLote_SetorNOME_ESTEIRA_TAL.AsString;
      fDMBaixaProd_Calc.mLote_Setor.Post;

      fDMBaixaProd_Calc.cdsFuncLote_Setor.Next;
    end;

  end
  else
  begin
    fDMBaixaProd_Calc.cdsFuncionario_Setor.First;
    while not fDMBaixaProd_Calc.cdsFuncionario_Setor.Eof do
    begin
      fDMBaixaProd_Calc.mLote_Setor.Insert;
      fDMBaixaProd_Calc.mLote_SetorID_Setor.AsInteger     := fDMBaixaProd_Calc.cdsFuncionario_SetorID_SETOR.AsInteger;
      fDMBaixaProd_Calc.mLote_SetorQtd.AsInteger          := fDMBaixaProd_Calc.cdsFuncionario_SetorQTD.AsInteger;
      fDMBaixaProd_Calc.mLote_SetorNome_Setor.AsString    := fDMBaixaProd_Calc.cdsFuncionario_SetorNOME_SETOR.AsString;
      fDMBaixaProd_Calc.mLote_SetorNum_Lote.AsInteger     := vNum_Lote_Loc;
      fDMBaixaProd_Calc.mLote_SetorItem.AsInteger         := fDMBaixaProd_Calc.cdsFuncionario_SetorITEM_TALAO.AsInteger;
      fDMBaixaProd_Calc.mLote_SetorID.AsInteger           := fDMBaixaProd_Calc.cdsFuncionario_SetorID_LOTE.AsInteger;
      fDMBaixaProd_Calc.mLote_SetorQtd_Pendente.AsInteger := fDMBaixaProd_Calc.cdsFuncionario_SetorQTD_PENDENTE.AsInteger;
      if fDMBaixaProd_Calc.cdsFuncionario_SetorDTENTRADA.AsDateTime > 10 then
        fDMBaixaProd_Calc.mLote_SetorDtEntrada.AsDateTime   := fDMBaixaProd_Calc.cdsFuncionario_SetorDTENTRADA.AsDateTime;
      if fDMBaixaProd_Calc.cdsFuncionario_SetorDTSAIDA.AsDateTime > 10 then
      fDMBaixaProd_Calc.mLote_SetorDtSaida.AsDateTime     := fDMBaixaProd_Calc.cdsFuncionario_SetorDTSAIDA.AsDateTime;
      if fDMBaixaProd_Calc.cdsFuncionario_SetorDTSAIDA.IsNull then
        fDMBaixaProd_Calc.mLote_SetorBaixado.AsBoolean := False
      else
        fDMBaixaProd_Calc.mLote_SetorBaixado.AsBoolean := True;
      fDMBaixaProd_Calc.mLote_SetorID_Esteira.AsInteger   := fDMBaixaProd_Calc.cdsFuncionario_SetorID_ESTEIRA_TAL.AsInteger;
      fDMBaixaProd_Calc.mLote_SetorNome_Esteira.AsString  := fDMBaixaProd_Calc.cdsFuncionario_SetorNOME_ESTEIRA_TAL.AsString;
      fDMBaixaProd_Calc.mLote_Setor.Post;

      fDMBaixaProd_Calc.cdsFuncionario_Setor.Next;
    end;
  end;
end;

procedure TfrmBaixaLote_Calc2.CurrencyEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
  begin
    if not fDMBaixaProd_Calc.mLote_Setor.Locate('ID_SETOR',CurrencyEdit1.AsInteger,[loCaseInsensitive]) then
    begin
      MessageDlg('*** ID do Setor não encontrado na tela abaixo!', mtError, [mbOk], 0);
      CurrencyEdit1.Clear;
    end
    else
    begin
      fDMBaixaProd_Calc.vID_Setor_Tal   := CurrencyEdit1.AsInteger;
      fDMBaixaProd_Calc.vID_Esteira_Tal := fDMBaixaProd_Calc.mLote_SetorID_Esteira.AsInteger;
      Close;
    end;
  end;
end;

procedure TfrmBaixaLote_Calc2.SMDBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    SMDBGrid1DblClick(Sender);
end;

end.
