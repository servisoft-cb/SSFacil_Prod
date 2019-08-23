unit UBaixaTalao_Calc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Grids,
  FMTBcd, DB, RxLookup, UCBase, Mask, ToolEdit, NxCollection, NxEdit, CurrEdit, ComCtrls, RzDTP, RzEdit,
  RzPanel, SqlExpr, dbXPress, UDMBaixaProd_Calc, DBGrids, SMDBGrid;

type
  TfrmBaixaTalao_Calc = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label5: TLabel;
    DateEdit1: TDateEdit;
    Label6: TLabel;
    RzDateTimeEdit1: TRzDateTimeEdit;
    Label7: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    SMDBGrid1: TSMDBGrid;
    Label3: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    CurrencyEdit1: TCurrencyEdit;
    Label4: TLabel;
    btnConfirmar: TNxButton;
    btnCancelar: TNxButton;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    lblFuncionario: TLabel;
    ckBaixaSetor: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Change(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure RxDBLookupCombo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit2Change(Sender: TObject);
  private
    { Private declarations }
    fDMBaixaProd_Calc: TDMBaixaProd_Calc;
    vMSGLocal : WideString;
    vDigitoIni : String;
    vNumPedido_Loc : Integer;
    vRef_Loc, vNome_Comb_Loc, vNome_Prod_Loc : String;
    vAtualizar : String;
    vHora: TTime;
    vData:TDate;

    vContador: Integer;

    function fnc_Talao_OK: Boolean;
    procedure prc_Gravar_ES;
    procedure prc_Gravar_Talao_Setor;

    procedure prc_Verifica_Talao;
    procedure prc_Verifica_Lote;
    procedure prc_Abrir_Baixa_Processo(ID_Lote, Num_Talao : Integer);

    procedure prc_Limpar;
    procedure prc_Abrir_Funcionario_Proc(ID : Integer);

  public
    { Public declarations }
  end;

var
  frmBaixaTalao_Calc: TfrmBaixaTalao_Calc;

implementation

uses DmdDatabase, uUtilPadrao, rsDBUtils, UMenu, UBaixaLote_Calc;

{$R *.dfm}

procedure TfrmBaixaTalao_Calc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmBaixaTalao_Calc.FormShow(Sender: TObject);
var
  vCampoAux: String;
  i: Integer;
begin
  fDMBaixaProd_Calc := TDMBaixaProd_Calc.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMBaixaProd_Calc);

  DateEdit1.Date       := Date;
  //RzDateTimeEdit1.Time := Now;
  Edit1.SetFocus;
end;

procedure TfrmBaixaTalao_Calc.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  ffrmBaixaLote_Calc: TfrmBaixaLote_Calc;
begin
  if Key = Vk_Return then
  begin
    if fnc_Talao_OK then
    begin
      ckBaixaSetor.Checked := False;
      if vDigitoIni = '9' then
      begin
        ffrmBaixaLote_Calc := TfrmBaixaLote_Calc.Create(self);
        ffrmBaixaLote_Calc.vNum_Lote_Loc     := fDMBaixaProd_Calc.cdsLoteNUM_LOTE.AsInteger;
        ffrmBaixaLote_Calc.fDMBaixaProd_Calc := fDMBaixaProd_Calc;
        ffrmBaixaLote_Calc.vHora_Loc := Now;
        if trim(RzDateTimeEdit1.Text) <> '' then
          ffrmBaixaLote_Calc.vHora_Loc := RzDateTimeEdit1.Time;
        if DateEdit1.Date > 10 then
          ffrmBaixaLote_Calc.vData_Loc := DateEdit1.Date
        else
          ffrmBaixaLote_Calc.vData_Loc := Date;
        ffrmBaixaLote_Calc.ShowModal;
        FreeAndNil(ffrmBaixaLote_Calc);
        Edit1.Clear;
      end
      else
      begin
        Panel2.Visible := True;
        RxDBLookupCombo1.SetFocus;
        Label8.Caption  := 'Ref: ' + vRef_Loc;
        Label9.Caption  := 'Combinação: ' + vNome_Comb_Loc;
        Label10.Caption := vNome_Prod_Loc;
      end;
    end;
  end;
end;

function TfrmBaixaTalao_Calc.fnc_Talao_OK: Boolean;
begin
  Result := False;

  Edit1.Text := Monta_Numero(Edit1.Text,0);

  if (Length(Edit1.Text) < 1) then
  begin
    MessageDlg('*** Código informado incorreto!', mtError, [mbOk], 0);
    exit;
  end;
  if (copy(Edit1.Text,1,1) = '9') and (Length(Edit1.Text) <> 7) then
  begin
    MessageDlg('*** Código informado incorreto!', mtError, [mbOk], 0);
    exit;
  end;
  if (Length(Edit1.Text) < 11) and (copy(Edit1.Text,1,1) <> '9')  then
  begin
    MessageDlg('*** Código informado incorreto!', mtError, [mbOk], 0);
    exit;
  end;
  if Length(Edit1.Text) > 11 then
  begin
    MessageDlg('*** Código informado incorreto!', mtError, [mbOk], 0);
    exit;
  end;
  
  vMSGLocal := '';
  vDigitoIni := copy(Edit1.Text,1,1);
  if vDigitoIni = '2' then
    prc_Verifica_Talao
  else
  if vDigitoIni = '9' then
    prc_Verifica_Lote
  else
    vMSGLocal := vMSGLocal + #13 + '*** Código de barras inválido!';

  if trim(vMSGLocal) <> '' then
    MessageDlg(vMSGLocal, mtError, [mbOk], 0)
  else
    Result := True;
end;

procedure TfrmBaixaTalao_Calc.prc_Gravar_ES;
var
  ID: TTransactionDesc;
  vItemAux : Integer;
begin
  fDMBaixaProd_Calc.cdsTalao_Setor.Last;
  vItemAux := fDMBaixaProd_Calc.cdsTalao_SetorITEM.AsInteger;
  if fDMBaixaProd_Calc.cdsTalao_SetorID_SETOR.AsInteger <> RxDBLookupCombo1.KeyValue then
    fDMBaixaProd_Calc.cdsTalao_Setor.Locate('ID_SETOR',RxDBLookupCombo1.KeyValue,[loCaseInsensitive]);
  vMSGLocal  := '';
  vAtualizar := '';
  ID.TransactionID  := 1;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    vMSGLocal := vMSGLocal + '  Lote/Talão: ' + fDMBaixaProd_Calc.cdsLoteNUM_LOTE.AsString + '/' + fDMBaixaProd_Calc.cdsTalaoNUM_TALAO.AsString;
    vMSGLocal := vMSGLocal + #13 + '  Referência: ' + fDMBaixaProd_Calc.cdsLoteREFERENCIA.AsString;

    if not ckBaixaSetor.Checked then
      prc_Gravar_Talao_Setor
    else
    begin
      fDMBaixaProd_Calc.cdsTalao_Setor.First;
      while not fDMBaixaProd_Calc.cdsTalao_Setor.Eof do
      begin
        vAtualizar := 'N';
        prc_Gravar_Talao_Setor;
        fDMBaixaProd_Calc.cdsTalao_Setor.Next;
        if not fDMBaixaProd_Calc.cdsTalao_Setor.Eof then
        begin
          if (vAtualizar = 'S') and (fDMBaixaProd_Calc.cdsTalao_SetorclEntrada_Aut.AsString = 'S') and (fDMBaixaProd_Calc.cdsTalao_SetorDTENTRADA.IsNull) then
          begin
            fDMBaixaProd_Calc.cdsTalao_Setor.Edit;
            fDMBaixaProd_Calc.cdsTalao_SetorDTENTRADA.AsDateTime := vData;
            fDMBaixaProd_Calc.cdsTalao_SetorHRENTRADA.AsDateTime := vHora;
            fDMBaixaProd_Calc.cdsTalao_Setor.Post;
          end;
        end;
      end;
      vMSGLocal := vMSGLocal + #13 + #13 + 'Setores encerrados';
    end;

    fDMBaixaProd_Calc.cdsTalao_Setor.ApplyUpdates(0);

    dmDatabase.scoDados.Commit(ID);
    prc_Limpar;
    Label5.Caption := vMSGLocal;

  except
      on e: Exception do
      begin
        dmDatabase.scoDados.Rollback(ID);
        raise Exception.Create('Erro ao gravar Baixa Processo: ' + #13+#13 + e.Message);
      end;
  end;
  Panel2.Visible := False;
  Edit1.SetFocus;
  ckBaixaSetor.Checked := False;
end;

procedure TfrmBaixaTalao_Calc.Edit1Change(Sender: TObject);
begin
  Label5.Caption := '';
  Panel2.Visible := False;
end;

procedure TfrmBaixaTalao_Calc.prc_Verifica_Talao;
var
  vLote : Integer;
  vTalao : Integer;
  vIDAux : Integer;
begin
  vMSGLocal := '';
  vLote     := StrToInt(copy(Edit1.Text,2,6));
  vTalao    := StrToInt(copy(Edit1.Text,8,4));

  vRef_Loc  := '';
  vNome_Comb_Loc := '';
  vNome_Prod_Loc := '';

  fDMBaixaProd_Calc.cdsLote.Close;
  fDMBaixaProd_Calc.sdsLote.ParamByName('NUM_LOTE').AsInteger := vLote;
  fDMBaixaProd_Calc.cdsLote.Open;

  if fDMBaixaProd_Calc.cdsLote.IsEmpty then
  begin
    vMSGLocal := vMSGLocal + #13 + '*** Lote ' + IntToStr(vLote) + '  não encontrado!';
    exit;
  end;

  fDMBaixaProd_Calc.cdsTalao.Close;
  fDMBaixaProd_Calc.sdsTalao.ParamByName('ID').AsInteger        := fDMBaixaProd_Calc.cdsLoteID.AsInteger;
  fDMBaixaProd_Calc.sdsTalao.ParamByName('NUM_TALAO').AsInteger := vTalao;
  fDMBaixaProd_Calc.cdsTalao.Open;

  if fDMBaixaProd_Calc.cdsLote.IsEmpty then
  begin
    vMSGLocal := vMSGLocal + #13 + '*** Talão ' + IntToStr(vTalao) + '  não encontrado!';
    exit;
  end;

  prc_Abrir_Baixa_Processo(fDMBaixaProd_Calc.cdsLoteID.AsInteger,fDMBaixaProd_Calc.cdsTalaoNUM_TALAO.AsInteger);
  if fDMBaixaProd_Calc.cdsTalao_Setor.IsEmpty then
  begin
    vMSGLocal := vMSGLocal + #13 + '*** Lote/Talão ' + IntToStr(vLote) + '/' + IntToStr(vTalao) + ', não encontrado os setores' ;
    exit;
  end;

  vIDAux := 0;
  fDMBaixaProd_Calc.cdsTalao_Setor.First;
  while not fDMBaixaProd_Calc.cdsTalao_Setor.Eof do
  begin
    if (fDMBaixaProd_Calc.cdsTalao_SetorDTENTRADA.IsNull) and (vIDAux <= 0) then
      vIDAux := fDMBaixaProd_Calc.cdsTalao_SetorID_SETOR.AsInteger
    else
    if (fDMBaixaProd_Calc.cdsTalao_SetorDTENTRADA.AsDateTime > 10) and (fDMBaixaProd_Calc.cdsTalao_SetorDTSAIDA.IsNull) and (vIDAux <= 0) then
      vIDAux := fDMBaixaProd_Calc.cdsTalao_SetorID_SETOR.AsInteger;
    fDMBaixaProd_Calc.cdsTalao_Setor.Next;
  end;
  if vIDAux <= 0 then
  begin
    vMSGLocal := vMSGLocal + #13 + '*** Lote ' + IntToStr(vLote) + ' Esta com os talões baixados!' ;
    exit;
  end;
  fDMBaixaProd_Calc.cdsTalao_Setor.Locate('ID_SETOR',vIDAux,[loCaseInsensitive]);
  if vIDAux > 0 then
  begin
    RxDBLookupCombo1.KeyValue := vIDAux;
    CurrencyEdit1.Value       := fDMBaixaProd_Calc.cdsTalao_SetorQTD.AsFloat;
  end;
  vRef_Loc       := fDMBaixaProd_Calc.cdsLoteREFERENCIA.AsString;
  vNome_Comb_Loc := fDMBaixaProd_Calc.cdsLoteNOME_COMBINACAO.AsString;
  vNome_Prod_Loc := fDMBaixaProd_Calc.cdsLoteNOME.AsString;
end;

procedure TfrmBaixaTalao_Calc.prc_Abrir_Baixa_Processo(ID_Lote, Num_Talao : Integer);
var
  vComando : String;
begin
  fDMBaixaProd_Calc.cdsTalao_Setor.Close;
  fDMBaixaProd_Calc.sdsTalao_Setor.CommandText := fDMBaixaProd_Calc.ctTalao_Setor
                                                + ' AND NUM_TALAO = :NUM_TALAO ';
  fDMBaixaProd_Calc.sdsTalao_Setor.ParamByName('ID').AsInteger        := ID_Lote;
  fDMBaixaProd_Calc.sdsTalao_Setor.ParamByName('NUM_TALAO').AsInteger := Num_Talao;
  fDMBaixaProd_Calc.cdsTalao_Setor.Open;
end;

procedure TfrmBaixaTalao_Calc.prc_Limpar;
begin
  Edit1.Clear;
  RxDBLookupCombo1.ClearValue;
  CurrencyEdit1.Clear;
  fDMBaixaProd_Calc.cdsTalao_Setor.Close;
  Panel2.Visible := False;
  lblFuncionario.Caption := '';
end;

procedure TfrmBaixaTalao_Calc.btnCancelarClick(Sender: TObject);
begin
  prc_Limpar;
  Edit1.SetFocus;
end;

procedure TfrmBaixaTalao_Calc.btnConfirmarClick(Sender: TObject);
begin
  if trim(Edit1.Text) = '' then
  begin
    MessageDlg('*** Código de barras do talão não informado!', mtError, [mbOk], 0);
    exit;
  end;
  if trim(RxDBLookupCombo1.Text) = '' then
  begin
    MessageDlg('*** Processo não informado!', mtError, [mbOk], 0);
    exit;
  end;
  if CurrencyEdit1.Value <= 0 then
  begin
    MessageDlg('*** Quantidade não informada!', mtError, [mbOk], 0);
    exit;
  end;
  if MessageDlg('Confirmar a baixa de todos os SETORES do Talão?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;
  if fDMBaixaProd_Calc.cdsTalao_SetorDTSAIDA.AsDateTime > 0 then
  begin
    MessageDlg('*** Setor já baixado!', mtError, [mbOk], 0);
    exit;
  end;
  if fDMBaixaProd_Calc.cdsTalao_SetorQTD.AsFloat > CurrencyEdit1.Value then
  begin
    MessageDlg('*** Quantidade produzida não pode ser menor que quantidade do Setor!', mtError, [mbOk], 0);
    CurrencyEdit1.SetFocus;
    exit;
  end;
  prc_Gravar_ES;
end;

procedure TfrmBaixaTalao_Calc.RxDBLookupCombo1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
  begin
    RxDBLookupCombo1.CloseUp(True);
    if RxDBLookupCombo1.Text <> '' then
      //CurrencyEdit1.SetFocus;
      btnConfirmar.SetFocus;
  end;
end;

procedure TfrmBaixaTalao_Calc.RxDBLookupCombo1Exit(Sender: TObject);
begin
 if RxDBLookupCombo1.Text <> '' then
 begin
   if fDMBaixaProd_Calc.cdsTalao_SetorID_SETOR.AsInteger <> RxDBLookupCombo1.KeyValue then
    fDMBaixaProd_Calc.cdsTalao_Setor.Locate('ID_SETOR',RxDBLookupCombo1.KeyValue,[loCaseInsensitive]);
   CurrencyEdit1.Value := fDMBaixaProd_Calc.cdsTalao_SetorQTD.AsFloat;
 end;
end;

procedure TfrmBaixaTalao_Calc.CurrencyEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
  begin
    if CurrencyEdit1.Value > 0 then
      btnConfirmar.SetFocus;
  end;
end;

procedure TfrmBaixaTalao_Calc.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMBaixaProd_Calc.cdsTalao_SetorDTSAIDA.AsDateTime > 10 then
    Background := $0077FF77
  else
  if fDMBaixaProd_Calc.cdsTalao_SetorDTENTRADA.AsDateTime > 10 then
    Background := $00FFFFB9;
end;

procedure TfrmBaixaTalao_Calc.CurrencyEdit2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
  begin
    if CurrencyEdit2.AsInteger > 0 then
    begin
      fDMBaixaProd_Calc.qFuncionario.Close;
      fDMBaixaProd_Calc.qFuncionario.ParamByName('NUM_CARTAO').AsInteger := CurrencyEdit2.AsInteger;
      fDMBaixaProd_Calc.qFuncionario.Open;
      lblFuncionario.Caption := '';
      if fDMBaixaProd_Calc.qFuncionarioCODIGO.AsInteger <= 0 then
      begin
        Label5.Caption := '*** FUNCIONÁRIO NÃO ENCONTRADO ***';
        CurrencyEdit2.SelectAll;
        CurrencyEdit2.SetFocus;
      end
      else
      begin
        lblFuncionario.Caption := fDMBaixaProd_Calc.qFuncionarioNOME.AsString;
        Label1.Visible         := True;
        Edit1.Visible          := True;
        Edit1.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmBaixaTalao_Calc.CurrencyEdit2Change(Sender: TObject);
begin
  Label5.Caption := '';
  Edit1.Clear;
  Label1.Visible := False;
  Edit1.Visible  := False;
  lblFuncionario.Caption := '';
end;

procedure TfrmBaixaTalao_Calc.prc_Abrir_Funcionario_Proc(ID: Integer);
begin
  {fDMBaixaProd_Calc.qFuncionario_Processo.Close;
  fDMBaixaProd_Calc.qFuncionario_Processo.ParamByName('CODIGO').AsInteger := ID;
  fDMBaixaProd_Calc.qFuncionario_Processo.Open;}
end;

procedure TfrmBaixaTalao_Calc.prc_Verifica_Lote;
var
  vLote : Integer;
  vTalao : Integer;
  vIDAux : Integer;
begin
  vMSGLocal := '';
  vLote     := StrToInt(copy(Edit1.Text,2,6));

  vRef_Loc  := '';
  vNome_Comb_Loc := '';
  vNome_Prod_Loc := '';

  fDMBaixaProd_Calc.cdsLote.Close;
  fDMBaixaProd_Calc.sdsLote.ParamByName('NUM_LOTE').AsInteger := vLote;
  fDMBaixaProd_Calc.cdsLote.Open;

  if fDMBaixaProd_Calc.cdsLote.IsEmpty then
  begin
    vMSGLocal := vMSGLocal + #13 + '*** Lote ' + IntToStr(vLote) + '  não encontrado!';
    exit;
  end;

  fDMBaixaProd_Calc.qVerBaixaLote.Close;
  fDMBaixaProd_Calc.qVerBaixaLote.ParamByName('NUM_LOTE').AsInteger := vLote;
  fDMBaixaProd_Calc.qVerBaixaLote.Open;
  if fDMBaixaProd_Calc.qVerBaixaLoteCONTADOR.AsInteger <= 0 then
  begin
    vMSGLocal := vMSGLocal + #13 + '*** Lote ' + IntToStr(vLote) + '  com os talões todos baixados!';
    exit;
  end;
end;

procedure TfrmBaixaTalao_Calc.prc_Gravar_Talao_Setor;
var
  ID: TTransactionDesc;
  vSaida : Boolean;
begin
  vHora := Now;
  if trim(RzDateTimeEdit1.Text) <> '' then
    vHora := RzDateTimeEdit1.Time
  else
    vHora := Now;
  if DateEdit1.Date > 10 then
    vData := DateEdit1.Date
  else
    vData := Date;

  vAtualizar := 'N';
  vSaida     := True;
  fDMBaixaProd_Calc.cdsTalao_Setor.Edit;
  if fDMBaixaProd_Calc.cdsTalao_SetorDTENTRADA.IsNull then
  begin
    fDMBaixaProd_Calc.cdsTalao_SetorDTENTRADA.AsDateTime := vData;
    fDMBaixaProd_Calc.cdsTalao_SetorHRENTRADA.AsDateTime := vHora;
    if not ckBaixaSetor.Checked then
      vMSGLocal := vMSGLocal + #13 + #13 + '  Início ' + fDMBaixaProd_Calc.cdsTalao_SetorclNome_Setor.AsString;
    if CurrencyEdit1.Value > 0 then
      fDMBaixaProd_Calc.cdsTalao_SetorQTD.AsFloat := CurrencyEdit1.Value;
    if not ckBaixaSetor.Checked then
    begin
      if (fDMBaixaProd_Calc.cdsTalao_SetorclLER_CBARRA1.AsString <> 'S') then
        vSaida := False;
    end;
  end;
  if (vSaida) and (fDMBaixaProd_Calc.cdsTalao_SetorDTSAIDA.IsNull) then
  begin
    fDMBaixaProd_Calc.cdsTalao_SetorDTSAIDA.AsDateTime := vData;
    fDMBaixaProd_Calc.cdsTalao_SetorHRSAIDA.AsDateTime := vHora;
    if not ckBaixaSetor.Checked then
      vMSGLocal := vMSGLocal + #13 + #13 + '  Encerrado ' + fDMBaixaProd_Calc.cdsTalao_SetorclNome_Setor.AsString;

    fDMBaixaProd_Calc.cdsTalao_SetorTOTAL_HORAS.AsFloat := fnc_Calcular_Hora2(fDMBaixaProd_Calc.cdsTalao_SetorHRENTRADA.AsDateTime,
                                                                            fDMBaixaProd_Calc.cdsTalao_SetorHRSAIDA.AsDateTime,
                                                                            fDMBaixaProd_Calc.cdsTalao_SetorDTENTRADA.AsDateTime,
                                                                            fDMBaixaProd_Calc.cdsTalao_SetorDTSAIDA.AsDateTime);
    vAtualizar := 'S';
  end;
  fDMBaixaProd_Calc.cdsTalao_Setor.Post;
  if not ckBaixaSetor.Checked then
  begin
    fDMBaixaProd_Calc.cdsTalao_Setor.Next;
    if (vAtualizar = 'S') and (fDMBaixaProd_Calc.cdsTalao_SetorclEntrada_Aut.AsString = 'S') and (fDMBaixaProd_Calc.cdsTalao_SetorDTENTRADA.IsNull) then
    begin
      fDMBaixaProd_Calc.cdsTalao_Setor.Edit;
      fDMBaixaProd_Calc.cdsTalao_SetorDTENTRADA.AsDateTime := vData;
      fDMBaixaProd_Calc.cdsTalao_SetorHRENTRADA.AsDateTime := vHora;
      fDMBaixaProd_Calc.cdsTalao_Setor.Post;
    end;
  end;
end;

end.
