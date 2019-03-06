unit UBaixaTalao_Calc2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Grids,
  FMTBcd, DB, RxLookup, UCBase, Mask, ToolEdit, NxCollection, NxEdit, CurrEdit, ComCtrls, RzDTP, RzEdit,
  RzPanel, SqlExpr, dbXPress, UDMBaixaProd_Calc, DBGrids, SMDBGrid, UDMEstoque;

type
  TfrmBaixaTalao_Calc2 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label5: TLabel;
    DateEdit1: TDateEdit;
    Label6: TLabel;
    RzDateTimeEdit1: TRzDateTimeEdit;
    Label7: TLabel;
    Label2: TLabel;
    Label11: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    lblFuncionario: TLabel;
    btnConfirmar: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Change(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit2Change(Sender: TObject);
  private
    { Private declarations }
    fDMBaixaProd_Calc: TDMBaixaProd_Calc;
    fDMEstoque: TDMEstoque;

    vMSGLocal : WideString;
    vDigitoIni : String;
    vNumPedido_Loc : Integer;
    vAtualizar : String;
    vHora: TTime;
    vData:TDate;

    vContador: Integer;

    function fnc_Talao_OK: Boolean;
    procedure prc_Gravar_ES;
    procedure prc_Gravar_Talao_Setor(ID_Setor : Integer ; ID_Esteira : Integer);
    procedure prc_Baixar_Processo;

    procedure prc_Verifica_Talao;
    procedure prc_Abrir_Talao_Setor(ID_Lote, Num_Talao : Integer);
    procedure prc_Verifica_Processo;

    procedure prc_Limpar;
    procedure prc_Abrir_Funcionario_Setor(Talao, ID_SETOR : Integer);
    procedure prc_Abrir_FuncLote_Setor;

    procedure prc_Abrir_Talao(Talao : Integer);
    procedure prc_Gravar_mLote_Setor;
    procedure prc_Gravar_Talao_Estoque(Qtd : Real);
    procedure prc_Verificar_Esteira;

  public
    { Public declarations }
  end;

var
  frmBaixaTalao_Calc2: TfrmBaixaTalao_Calc2;

implementation

uses DmdDatabase, uUtilPadrao, rsDBUtils, UMenu, UBaixaLote_Calc2, USel_Esteira;

{$R *.dfm}

procedure TfrmBaixaTalao_Calc2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmBaixaTalao_Calc2.FormShow(Sender: TObject);
var
  vCampoAux: String;
  i: Integer;
begin
  fDMBaixaProd_Calc := TDMBaixaProd_Calc.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMBaixaProd_Calc);

  DateEdit1.Date       := Date;
  //RzDateTimeEdit1.Time := Now;
  CurrencyEdit2.SetFocus;
end;

procedure TfrmBaixaTalao_Calc2.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  ffrmBaixaLote_Calc2: TfrmBaixaLote_Calc2;
begin
  if Key = Vk_Return then
  begin
    fDMBaixaProd_Calc.vID_Esteira_Tal := 0;
    if fnc_Talao_OK then
    begin
      if vDigitoIni = '2' then  //Talão
        prc_Abrir_Funcionario_Setor(fDMBaixaProd_Calc.cdsTalaoNUM_TALAO.AsInteger,0)
      else
      if vDigitoIni = '9' then //Lote
        prc_Abrir_FuncLote_Setor
      else
      if vDigitoIni = '3' then //Processos
      begin
        prc_Baixar_Processo;
        exit;
      end;

      if ((vDigitoIni = '2') and (fDMBaixaProd_Calc.cdsFuncionario_Setor.RecordCount <= 0)) or
         ((vDigitoIni = '9') and (fDMBaixaProd_Calc.cdsFuncLote_Setor.RecordCount <= 0)) then
      begin
        Label5.Caption := 'Talão já encerrados para os Setores desse Funcionário!';
        exit;
      end;
      fDMBaixaProd_Calc.vID_Setor_Tal := 0;
      if ((vDigitoIni = '2') and (fDMBaixaProd_Calc.cdsFuncionario_Setor.RecordCount > 1)) or
         ((vDigitoIni = '9') and (fDMBaixaProd_Calc.cdsFuncLote_Setor.RecordCount > 1)) then
      begin
        ffrmBaixaLote_Calc2                   := TfrmBaixaLote_Calc2.Create(self);
        ffrmBaixaLote_Calc2.vDig              := vDigitoIni;
        ffrmBaixaLote_Calc2.vNum_Lote_Loc     := fDMBaixaProd_Calc.cdsLoteNUM_LOTE.AsInteger;
        ffrmBaixaLote_Calc2.fDMBaixaProd_Calc := fDMBaixaProd_Calc;
        ffrmBaixaLote_Calc2.ShowModal;
        FreeAndNil(ffrmBaixaLote_Calc2);
      end
      else
      begin
        if vDigitoIni = '2' then
        begin
          fDMBaixaProd_Calc.vID_Setor_Tal := fDMBaixaProd_Calc.cdsFuncionario_SetorID_SETOR.AsInteger;
          if (fDMBaixaProd_Calc.cdsTalao_Setor.Locate('ID_SETOR',fDMBaixaProd_Calc.vID_Setor_Tal,[loCaseInsensitive])) and
            (fDMBaixaProd_Calc.cdsTalao_SetorID_SETOR2.AsInteger > 0) then
            fDMBaixaProd_Calc.vID_Esteira_Tal := fDMBaixaProd_Calc.cdsTalao_SetorID_SETOR2.AsInteger
          else
            fDMBaixaProd_Calc.vID_Esteira_Tal := fDMBaixaProd_Calc.cdsFuncionario_SetorID_ESTEIRA.AsInteger;
        end
        else
        begin
          fDMBaixaProd_Calc.vID_Esteira_Tal := fDMBaixaProd_Calc.cdsFuncLote_SetorID_ESTEIRA.AsInteger;
          prc_Gravar_mLote_Setor;
        end;
      end;
      if (vDigitoIni = '2') and (fDMBaixaProd_Calc.vID_Setor_Tal <= 0) then
        Label5.Caption := 'Talão não Selecionado!'
      else
      begin
        //05/03/2019
        prc_Verificar_Esteira;
        //*******************
        prc_Gravar_ES;
      end
    end;
  end;
end;

function TfrmBaixaTalao_Calc2.fnc_Talao_OK: Boolean;
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
  if (Length(Edit1.Text) <> 7) and (copy(Edit1.Text,1,1) = '9')  then
  begin
    MessageDlg('*** Código informado incorreto!', mtError, [mbOk], 0);
    exit;
  end;
  if (Length(Edit1.Text) <> 9) and (copy(Edit1.Text,1,1) = '2')  then
  begin
    MessageDlg('*** Código informado incorreto!', mtError, [mbOk], 0);
    exit;
  end;
  if (Length(Edit1.Text) <> 11) and (copy(Edit1.Text,1,1) = '3')  then
  begin
    MessageDlg('*** Código informado incorreto!', mtError, [mbOk], 0);
    exit;
  end;
  if (copy(Edit1.Text,1,1) = '3') and (fDMBaixaProd_Calc.qFuncionarioBAIXA_PROCESSO.AsString <> 'S')   then
  begin
    MessageDlg('*** Funcionário não permitido a lançar Entrada/Finalizar Processos!', mtError, [mbOk], 0);
    exit;
  end;

  vMSGLocal  := '';
  vDigitoIni := copy(Edit1.Text,1,1);
  if (vDigitoIni = '2') or (vDigitoIni = '9') then
    prc_Verifica_Talao
  else
  if (vDigitoIni = '3') then
    prc_Verifica_Processo
  else
    vMSGLocal := vMSGLocal + #13 + '*** Código de barras inválido!';

  if trim(vMSGLocal) <> '' then
    MessageDlg(vMSGLocal, mtError, [mbOk], 0)
  else
    Result := True;
end;

procedure TfrmBaixaTalao_Calc2.prc_Gravar_ES;
var
  ID: TTransactionDesc;
  vMSGAux : String;
begin
  vMSGLocal  := '';
  vAtualizar := '';
  ID.TransactionID  := 1;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    if (fDMBaixaProd_Calc.vID_Setor_Tal > 0) and (vDigitoIni = '2') then
      prc_Gravar_Talao_Setor(fDMBaixaProd_Calc.vID_Setor_Tal,fDMBaixaProd_Calc.vID_Esteira_Tal)
    else
    if (vDigitoIni = '2') and (fDMBaixaProd_Calc.vID_Setor_Tal <= 0) then
      vMSGLocal := 'Não foi selecionado um SETOR!'
    else
    if vDigitoIni = '9' then
    begin
      vMSGAux := '';
      vMSGLocal := vMSGLocal + #13 + 'Lote: ' + fDMBaixaProd_Calc.cdsLoteNUM_LOTE.AsString;
      fDMBaixaProd_Calc.mLote_Setor.First;
      while not fDMBaixaProd_Calc.mLote_Setor.Eof do
      begin
        if fDMBaixaProd_Calc.mLote_SetorSelecionado.AsBoolean then
        begin
          if trim(vMSGAux) = '' then
            vMSGAux := 'Setores: ' + fDMBaixaProd_Calc.mLote_SetorNome_Setor.AsString
          else
            vMSGAux := vMSGAux + #13 +  fDMBaixaProd_Calc.mLote_SetorNome_Setor.AsString;
          prc_Abrir_Funcionario_Setor(0,fDMBaixaProd_Calc.mLote_SetorID_Setor.AsInteger);
          fDMBaixaProd_Calc.cdsFuncionario_Setor.First;
          while not fDMBaixaProd_Calc.cdsFuncionario_Setor.Eof do
          begin
            prc_Abrir_Talao(fDMBaixaProd_Calc.cdsFuncionario_SetorNUM_TALAO.AsInteger);

            prc_Gravar_Talao_Setor(fDMBaixaProd_Calc.mLote_SetorID_Setor.AsInteger,fDMBaixaProd_Calc.mLote_SetorID_Esteira.AsInteger);
            fDMBaixaProd_Calc.cdsTalao_Setor.ApplyUpdates(0);

            fDMBaixaProd_Calc.vID_Setor_Tal := fDMBaixaProd_Calc.mLote_SetorID_Setor.AsInteger;
            fDMBaixaProd_Calc.cdsFuncionario_Setor.Next;
          end;
        end;
        fDMBaixaProd_Calc.mLote_Setor.Next;
      end;
      if trim(vMSGAux) <> '' then
        vMSGLocal := vMSGLocal + #13 + vMSGAux;
    end;
    if fDMBaixaProd_Calc.vID_Setor_Tal > 0 then
    begin
      fDMBaixaProd_Calc.cdsTalao_Setor.ApplyUpdates(0);
      dmDatabase.scoDados.Commit(ID);
    end;
    prc_Limpar;
    Label5.Caption := vMSGLocal;
    vMSGLocal      := '';
  except
      on e: Exception do
      begin
        dmDatabase.scoDados.Rollback(ID);
        raise Exception.Create('Erro ao gravar Baixa Processo: ' + #13+#13 + e.Message);
      end;
  end;

  fDMBaixaProd_Calc.qVerBaixaLote.Close;
  fDMBaixaProd_Calc.qVerBaixaLote.ParamByName('NUM_LOTE').AsInteger := fDMBaixaProd_Calc.cdsLoteNUM_LOTE.AsInteger;
  fDMBaixaProd_Calc.qVerBaixaLote.Open;
  if fDMBaixaProd_Calc.qVerBaixaLoteCONTADOR.AsInteger > 0 then
  begin
    fDMBaixaProd_Calc.cdsLote.Edit;
    fDMBaixaProd_Calc.cdsLoteDTBAIXA.AsDateTime := Date;
    fDMBaixaProd_Calc.cdsLote.Post;
    fDMBaixaProd_Calc.cdsLote.ApplyUpdates(0);
  end;

  Edit1.SetFocus;
end;

procedure TfrmBaixaTalao_Calc2.Edit1Change(Sender: TObject);
begin
  Label5.Caption := '';
end;

procedure TfrmBaixaTalao_Calc2.prc_Verifica_Talao;
var
  vLote : Integer;
  vTalao : Integer;
  vIDAux : Integer;
begin
  vMSGLocal := '';
  vTalao    := 0;
  vLote     := StrToInt(copy(Edit1.Text,2,6));
  if vDigitoIni = '2' then
    vTalao    := StrToInt(copy(Edit1.Text,8,2));

  fDMBaixaProd_Calc.cdsLote.Close;
  fDMBaixaProd_Calc.sdsLote.ParamByName('NUM_LOTE').AsInteger := vLote;
  fDMBaixaProd_Calc.cdsLote.Open;

  if fDMBaixaProd_Calc.cdsLote.IsEmpty then
  begin
    vMSGLocal := vMSGLocal + #13 + '*** Lote ' + IntToStr(vLote) + '  não encontrado!';
    exit;
  end;

  if vDigitoIni = '2' then
    prc_Abrir_Talao(vTalao)
  else
  begin
    fDMBaixaProd_Calc.qVerBaixaLote.Close;
    fDMBaixaProd_Calc.qVerBaixaLote.ParamByName('NUM_LOTE').AsInteger := vLote;
    fDMBaixaProd_Calc.qVerBaixaLote.Open;
    if fDMBaixaProd_Calc.qVerBaixaLoteCONTADOR.AsInteger <= 0 then
      vMSGLocal := vMSGLocal + #13 + '*** Lote ' + IntToStr(vLote) + '  com os talões todos baixados!';
  end;
end;

procedure TfrmBaixaTalao_Calc2.prc_Abrir_Talao_Setor(ID_Lote, Num_Talao : Integer);
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

procedure TfrmBaixaTalao_Calc2.prc_Limpar;
begin
  Edit1.Clear;
  fDMBaixaProd_Calc.cdsTalao_Setor.Close;
  lblFuncionario.Caption := '';
end;

procedure TfrmBaixaTalao_Calc2.btnCancelarClick(Sender: TObject);
begin
  prc_Limpar;
  Edit1.SetFocus;
end;

procedure TfrmBaixaTalao_Calc2.btnConfirmarClick(Sender: TObject);
begin
  if trim(Edit1.Text) = '' then
  begin
    MessageDlg('*** Código de barras do talão não informado!', mtError, [mbOk], 0);
    exit;
  end;
  if MessageDlg('Confirmar a baixa de todos os SETORES do Talão?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;
  if fDMBaixaProd_Calc.cdsTalao_SetorDTSAIDA.AsDateTime > 0 then
  begin
    MessageDlg('*** Setor já baixado!', mtError, [mbOk], 0);
    exit;
  end;
  prc_Gravar_ES;
end;

procedure TfrmBaixaTalao_Calc2.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMBaixaProd_Calc.cdsTalao_SetorDTSAIDA.AsDateTime > 10 then
    Background := $0077FF77
  else
  if fDMBaixaProd_Calc.cdsTalao_SetorDTENTRADA.AsDateTime > 10 then
    Background := $00FFFFB9;
end;

procedure TfrmBaixaTalao_Calc2.CurrencyEdit2KeyDown(Sender: TObject;
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

procedure TfrmBaixaTalao_Calc2.CurrencyEdit2Change(Sender: TObject);
begin
  Label5.Caption := '';
  Edit1.Clear;
  Label1.Visible := False;
  Edit1.Visible  := False;
  lblFuncionario.Caption := '';
end;

procedure TfrmBaixaTalao_Calc2.prc_Gravar_Talao_Setor(ID_Setor : Integer ; ID_Esteira : Integer);
var
  ID: TTransactionDesc;
  vSaida : Boolean;
  vQtd : Integer;
begin
  if vDigitoIni = '2' then
  begin
    vMSGLocal := vMSGLocal + '  Lote/Talão: ' + fDMBaixaProd_Calc.cdsLoteNUM_LOTE.AsString + '/' + fDMBaixaProd_Calc.cdsTalaoNUM_TALAO.AsString
               + #13 + '  Referência: ' + fDMBaixaProd_Calc.cdsLoteREFERENCIA.AsString + '     Tamanho: ' + fDMBaixaProd_Calc.cdsTalaoTAMANHO.AsString;
  end;

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

  if ID_Setor <> fDMBaixaProd_Calc.cdsTalao_SetorID_SETOR.AsInteger then
    fDMBaixaProd_Calc.cdsTalao_Setor.Locate('ID_SETOR',ID_Setor,[loCaseInsensitive]);

  fDMBaixaProd_Calc.cdsTalao_Setor.Edit;
  if fDMBaixaProd_Calc.cdsTalao_SetorDTENTRADA.IsNull then
  begin
    fDMBaixaProd_Calc.cdsTalao_SetorDTENTRADA.AsDateTime := vData;
    fDMBaixaProd_Calc.cdsTalao_SetorHRENTRADA.AsDateTime := vHora;
    if vDigitoIni = '2' then
      vMSGLocal := vMSGLocal + #13 + #13 + '  Início ' + fDMBaixaProd_Calc.cdsTalao_SetorclNome_Setor.AsString;
    //if (trim(fDMBaixaProd_Calc.cdsTalao_SetorclLER_CBARRA1.AsString) <> 'S')  then
    if (vDigitoIni = '2') and (trim(fDMBaixaProd_Calc.cdsTalao_SetorclTipo_Leitura.AsString) <> 'T')  then
      vSaida := False;
  end;
  if (vSaida) and (fDMBaixaProd_Calc.cdsTalao_SetorDTSAIDA.IsNull) then
  begin
    vQtd := 1;
    if (vDigitoIni = '9') or (trim(fDMBaixaProd_Calc.cdsTalao_SetorclTipo_Leitura.AsString) <> 'T')  then
      vQtd := fDMBaixaProd_Calc.cdsTalao_SetorQTD_PENDENTE.AsInteger;

    fDMBaixaProd_Calc.cdsTalao_SetorQTD_PENDENTE.AsInteger  := StrToInt(FormatFloat('0',fDMBaixaProd_Calc.cdsTalao_SetorQTD_PENDENTE.AsInteger - vQtd));
    fDMBaixaProd_Calc.cdsTalao_SetorQTD_PRODUZIDO.AsInteger := StrToInt(FormatFloat('0',fDMBaixaProd_Calc.cdsTalao_SetorQTD_PRODUZIDO.AsInteger + vQtd));
    if StrToInt(FormatFloat('0',fDMBaixaProd_Calc.cdsTalao_SetorQTD_PENDENTE.AsInteger)) <= 0 then
    begin
      fDMBaixaProd_Calc.cdsTalao_SetorDTSAIDA.AsDateTime := vData;
      fDMBaixaProd_Calc.cdsTalao_SetorHRSAIDA.AsDateTime := vHora;
      if vDigitoIni = '2' then
        vMSGLocal := vMSGLocal + #13 + #13 + ' Encerrado Setor: ' + fDMBaixaProd_Calc.cdsTalao_SetorclNome_Setor.AsString;
      fDMBaixaProd_Calc.cdsTalao_SetorTOTAL_HORAS.AsFloat := fnc_Calcular_Hora2(fDMBaixaProd_Calc.cdsTalao_SetorHRENTRADA.AsDateTime,
                                                                              fDMBaixaProd_Calc.cdsTalao_SetorHRSAIDA.AsDateTime,
                                                                              fDMBaixaProd_Calc.cdsTalao_SetorDTENTRADA.AsDateTime,
                                                                              fDMBaixaProd_Calc.cdsTalao_SetorDTSAIDA.AsDateTime);
    end
    else
    if vDigitoIni = '2' then
      vMSGLocal := vMSGLocal + #13 + #13 + ' Setor: ' + fDMBaixaProd_Calc.cdsTalao_SetorclNome_Setor.AsString + ' Baixado 1 Par'
  end;

  if fDMBaixaProd_Calc.vID_Esteira_Tal <= 0 then
    fDMBaixaProd_Calc.cdsTalao_SetorID_SETOR2.AsInteger := fDMBaixaProd_Calc.cdsTalao_SetorID_SETOR.AsInteger
  else
    fDMBaixaProd_Calc.cdsTalao_SetorID_SETOR2.AsInteger := fDMBaixaProd_Calc.vID_Esteira_Tal;

  fDMBaixaProd_Calc.cdsTalao_Setor.Post;

  if fDMBaixaProd_Calc.qParametros_LoteID_SETOR_EST.AsInteger = fDMBaixaProd_Calc.cdsTalao_SetorID_SETOR.AsInteger then
    prc_Gravar_Talao_Estoque(vQtd);
end;

procedure TfrmBaixaTalao_Calc2.prc_Abrir_Funcionario_Setor(Talao, ID_SETOR : Integer);
begin
  fDMBaixaProd_Calc.cdsFuncionario_Setor.Close;
  fDMBaixaProd_Calc.sdsFuncionario_Setor.CommandText := fDMBaixaProd_Calc.ctFuncionario_Setor;
  if Talao > 0 then
  begin
    fDMBaixaProd_Calc.sdsFuncionario_Setor.CommandText := fDMBaixaProd_Calc.sdsFuncionario_Setor.CommandText
                                                        + ' AND TS.NUM_TALAO = :NUM_TALAO ';
    fDMBaixaProd_Calc.sdsFuncionario_Setor.ParamByName('NUM_TALAO').AsInteger := Talao;
  end;
  if ID_SETOR > 0 then
  begin
    fDMBaixaProd_Calc.sdsFuncionario_Setor.CommandText := fDMBaixaProd_Calc.sdsFuncionario_Setor.CommandText
                                                        + ' AND TS.ID_SETOR = :ID_SETOR ';
    fDMBaixaProd_Calc.sdsFuncionario_Setor.ParamByName('ID_SETOR').AsInteger := ID_SETOR;
  end;

  fDMBaixaProd_Calc.sdsFuncionario_Setor.ParamByName('CODIGO').AsInteger    := fDMBaixaProd_Calc.qFuncionarioCODIGO.AsInteger;
  fDMBaixaProd_Calc.sdsFuncionario_Setor.ParamByName('ID').AsInteger        := fDMBaixaProd_Calc.cdsLoteID.AsInteger;
  //fDMBaixaProd_Calc.sdsFuncionario_Setor.ParamByName('NUM_TALAO').AsInteger := Talao;
  fDMBaixaProd_Calc.cdsFuncionario_Setor.Open;
end;

procedure TfrmBaixaTalao_Calc2.prc_Abrir_FuncLote_Setor;
begin
  fDMBaixaProd_Calc.cdsFuncLote_Setor.Close;
  fDMBaixaProd_Calc.sdsFuncLote_Setor.ParamByName('CODIGO').AsInteger := fDMBaixaProd_Calc.qFuncionarioCODIGO.AsInteger;
  fDMBaixaProd_Calc.sdsFuncLote_Setor.ParamByName('ID').AsInteger     := fDMBaixaProd_Calc.cdsLoteID.AsInteger;
  fDMBaixaProd_Calc.cdsFuncLote_Setor.Open;
end;

procedure TfrmBaixaTalao_Calc2.prc_Abrir_Talao(Talao: Integer);
begin
  fDMBaixaProd_Calc.cdsTalao.Close;
  fDMBaixaProd_Calc.sdsTalao.ParamByName('ID').AsInteger        := fDMBaixaProd_Calc.cdsLoteID.AsInteger;

  fDMBaixaProd_Calc.sdsTalao.ParamByName('NUM_TALAO').AsInteger := Talao;
  fDMBaixaProd_Calc.cdsTalao.Open;

  if fDMBaixaProd_Calc.cdsTalao.IsEmpty then
    vMSGLocal := vMSGLocal + #13 + '*** Talão ' + IntToStr(Talao) + '  não encontrado!'
  else
  begin
    prc_Abrir_Talao_Setor(fDMBaixaProd_Calc.cdsLoteID.AsInteger,fDMBaixaProd_Calc.cdsTalaoNUM_TALAO.AsInteger);
    //fDMBaixaProd_Calc.cdsTalao_Setor.Locate('ID_SETOR',ID_Setor,[loCaseInsensitive]);
    if fDMBaixaProd_Calc.cdsTalao_SetorID_SETOR2.AsInteger > 0 then
      fDMBaixaProd_Calc.vID_Esteira_Tal := fDMBaixaProd_Calc.cdsTalao_SetorID_SETOR2.AsInteger;
    if fDMBaixaProd_Calc.cdsTalao_Setor.IsEmpty then
      vMSGLocal := vMSGLocal + #13 + '*** Lote/Talão ' + fDMBaixaProd_Calc.cdsLoteNUM_LOTE.AsString + '/' + IntToStr(Talao) + ', não encontrado os setores';
  end;
end;

procedure TfrmBaixaTalao_Calc2.prc_Gravar_mLote_Setor;
begin
  fDMBaixaProd_Calc.mLote_Setor.EmptyDataSet;
  fDMBaixaProd_Calc.cdsFuncLote_Setor.First;
  while not fDMBaixaProd_Calc.cdsFuncLote_Setor.Eof do
  begin
    fDMBaixaProd_Calc.mLote_Setor.Insert;
    fDMBaixaProd_Calc.mLote_SetorID_Setor.AsInteger     := fDMBaixaProd_Calc.cdsFuncLote_SetorID_SETOR.AsInteger;
    fDMBaixaProd_Calc.mLote_SetorQtd.AsInteger          := 0;
    fDMBaixaProd_Calc.mLote_SetorNome_Setor.AsString    := fDMBaixaProd_Calc.cdsFuncLote_SetorNOME_SETOR.AsString;
    fDMBaixaProd_Calc.mLote_SetorNum_Lote.AsInteger     := fDMBaixaProd_Calc.cdsLoteNUM_LOTE.AsInteger;
    fDMBaixaProd_Calc.mLote_SetorItem.AsInteger         := 0;
    fDMBaixaProd_Calc.mLote_SetorID.AsInteger           := 0;
    fDMBaixaProd_Calc.mLote_SetorQtd_Pendente.AsInteger := 0;
    fDMBaixaProd_Calc.mLote_SetorBaixado.AsBoolean      := False;
    fDMBaixaProd_Calc.mLote_SetorSelecionado.AsBoolean  := True;
    fDMBaixaProd_Calc.mLote_SetorID_Esteira.AsInteger   := fDMBaixaProd_Calc.cdsFuncLote_SetorID_ESTEIRA_TAL.AsInteger;
    fDMBaixaProd_Calc.mLote_SetorNome_Esteira.AsString  := fDMBaixaProd_Calc.cdsFuncLote_SetorNOME_ESTEIRA_TAL.AsString;
    fDMBaixaProd_Calc.mLote_Setor.Post;

    fDMBaixaProd_Calc.cdsFuncLote_Setor.Next;
  end;
end;

procedure TfrmBaixaTalao_Calc2.prc_Verifica_Processo;
var
  vID_Baixa   : Integer;
  vItem_Baixa : Integer;
begin
  vMSGLocal   := '';
  vID_Baixa   := StrToInt(copy(Edit1.Text,2,7));
  vItem_Baixa := StrToInt(copy(Edit1.Text,9,3));

  fDMBaixaProd_Calc.qBaixaProc.Close;
  fDMBaixaProd_Calc.qBaixaProc.ParamByName('ID').AsInteger   := vID_Baixa;
  fDMBaixaProd_Calc.qBaixaProc.ParamByName('ITEM').AsInteger := vItem_Baixa;
  fDMBaixaProd_Calc.qBaixaProc.Open;

  if fDMBaixaProd_Calc.qBaixaProc.IsEmpty then
  begin
    vMSGLocal := vMSGLocal + #13 + '*** Processo não encontrado!';
    exit;
  end;

  if fDMBaixaProd_Calc.qBaixaProcDTBAIXA.AsDateTime > 10 then
  begin
    vMSGLocal := vMSGLocal + #13 + '*** Processo ' + fDMBaixaProd_Calc.qBaixaProcNOME_PROCESSO.AsString + ' no Lote: ' + fDMBaixaProd_Calc.qBaixaProcNUM_LOTE.AsString
               + ' esta baixado!';
  end
  else
  begin
    fDMBaixaProd_Calc.cdsBaixa_Processo.Close;
    fDMBaixaProd_Calc.sdsBaixa_Processo.ParamByName('ID').AsInteger   := fDMBaixaProd_Calc.qBaixaProcID.AsInteger;
    fDMBaixaProd_Calc.sdsBaixa_Processo.ParamByName('ITEM').AsInteger := fDMBaixaProd_Calc.qBaixaProcITEM.AsInteger;
    fDMBaixaProd_Calc.cdsBaixa_Processo.Open;
  end;
end;

procedure TfrmBaixaTalao_Calc2.prc_Baixar_Processo;
begin
  vMSGLocal := '';
  vHora := Now;
  if trim(RzDateTimeEdit1.Text) <> '' then
    vHora := RzDateTimeEdit1.Time
  else
    vHora := Now;
  if DateEdit1.Date > 10 then
    vData := DateEdit1.Date
  else
    vData := Date;
  fDMBaixaProd_Calc.cdsBaixa_Processo.Edit;
  if fDMBaixaProd_Calc.cdsBaixa_ProcessoDTENTRADA.IsNull then
  begin
    fDMBaixaProd_Calc.cdsBaixa_ProcessoDTENTRADA.AsDateTime := vData;
    fDMBaixaProd_Calc.cdsBaixa_ProcessoHRENTRADA.AsDateTime := vHora;
    fDMBaixaProd_Calc.cdsBaixa_ProcessoID_FUNCIONARIO_ENT.AsInteger := fDMBaixaProd_Calc.qFuncionarioCODIGO.AsInteger;
    vMSGLocal := 'Entrada no Processo: ' + fDMBaixaProd_Calc.qBaixaProcNOME_PROCESSO.AsString;
    vMSGLocal := vMSGLocal + #13 + #13 + 'Nº Lote: ' +  fDMBaixaProd_Calc.qBaixaProcNUM_LOTE.AsString;
  end
  else
  begin
    fDMBaixaProd_Calc.cdsBaixa_ProcessoDTBAIXA.AsDateTime := vData;
    fDMBaixaProd_Calc.cdsBaixa_ProcessoHRBAIXA.AsDateTime := vHora;
    fDMBaixaProd_Calc.cdsBaixa_ProcessoQTD_PRODUZIDO.AsInteger := fDMBaixaProd_Calc.cdsBaixa_ProcessoQTD_PRODUZIDO.AsInteger + fDMBaixaProd_Calc.cdsBaixa_ProcessoQTD_PENDENTE.AsInteger;
    fDMBaixaProd_Calc.cdsBaixa_ProcessoQTD_PENDENTE.AsInteger  := 0;
    fDMBaixaProd_Calc.cdsBaixa_ProcessoID_FUNCIONARIO_BAIXA.AsInteger := fDMBaixaProd_Calc.qFuncionarioCODIGO.AsInteger;
    vMSGLocal := 'Finalizado o Processo: ' + fDMBaixaProd_Calc.qBaixaProcNOME_PROCESSO.AsString;
    vMSGLocal := vMSGLocal + #13 + #13 + 'Nº Lote: ' +  fDMBaixaProd_Calc.qBaixaProcNUM_LOTE.AsString;
  end;
  fDMBaixaProd_Calc.cdsBaixa_Processo.Post;
  fDMBaixaProd_Calc.cdsBaixa_Processo.ApplyUpdates(0);

  fDMBaixaProd_Calc.qProcLote.Close;
  fDMBaixaProd_Calc.qProcLote.ParamByName('ID_LOTE').AsInteger := fDMBaixaProd_Calc.qBaixaProcID_LOTE.AsInteger;
  fDMBaixaProd_Calc.qProcLote.Open;
  if fDMBaixaProd_Calc.qProcLoteCONTADOR.AsInteger <= 0 then
    fDMBaixaProd_Calc.prc_Gravar_Lote_BaixaProcesso('S',fDMBaixaProd_Calc.qBaixaProcID_LOTE.AsInteger);
  Label5.Caption := vMSGLocal;
  Edit1.SetFocus;
  Edit1.SelectAll;
end;

procedure TfrmBaixaTalao_Calc2.prc_Gravar_Talao_Estoque(Qtd: Real);
var
  vAux : Integer;
begin
  fDMEstoque := TDMEstoque.Create(Self);

  if not fDMBaixaProd_Calc.cdsTalao_Estoque.Active then
    fDMBaixaProd_Calc.prc_Abrir_Talao_Estoque(-1);
  vAux := dmDatabase.ProximaSequencia('TALAO_ESTOQUE',0);

  fDMBaixaProd_Calc.cdsTalao_Estoque.Insert;
  fDMBaixaProd_Calc.cdsTalao_EstoqueID.AsInteger        := vAux;
  fDMBaixaProd_Calc.cdsTalao_EstoqueID_LOTE.AsInteger   := fDMBaixaProd_Calc.cdsTalao_SetorID.AsInteger;
  fDMBaixaProd_Calc.cdsTalao_EstoqueNUM_TALAO.AsInteger := fDMBaixaProd_Calc.cdsTalao_SetorNUM_TALAO.AsInteger;
  fDMBaixaProd_Calc.cdsTalao_EstoqueID_SETOR.AsInteger  := fDMBaixaProd_Calc.cdsTalao_SetorID_SETOR.AsInteger;
  fDMBaixaProd_Calc.cdsTalao_EstoqueQTD.AsFloat         := StrToFloat(FormatFloat('0.0000',Qtd));
  fDMBaixaProd_Calc.cdsTalao_EstoqueDATA.AsDateTime     := DateEdit1.Date;
  fDMBaixaProd_Calc.cdsTalao_EstoqueID_SETOR2.AsInteger := fDMBaixaProd_Calc.cdsTalao_SetorID_SETOR2.AsInteger;
                                          
  fDMBaixaProd_Calc.cdsTalao_EstoqueID_MOVESTOQUE.AsInteger := fDMEstoque.fnc_Gravar_Estoque(0,
                                          fDMBaixaProd_Calc.cdsLoteFILIAL.AsInteger,
                                          1,
                                          fDMBaixaProd_Calc.cdsLoteID_PRODUTO.AsInteger,
                                          fDMBaixaProd_Calc.cdsLoteNUM_LOTE.AsInteger,
                                          0,0,fDMBaixaProd_Calc.cdsLoteID.AsInteger,
                                          0,
                                          'E','LOT',
                                          fDMBaixaProd_Calc.cdsLoteUNIDADE.AsString,
                                          fDMBaixaProd_Calc.cdsLoteUNIDADE.AsString ,'',
                                          fDMBaixaProd_Calc.cdsTalaoTAMANHO.AsString,
                                          fDMBaixaProd_Calc.cdsTalao_EstoqueDATA.AsDateTime,
                                          0,
                                          fDMBaixaProd_Calc.cdsTalao_EstoqueQTD.AsFloat,0,0,0,0,0,
                                          fDMBaixaProd_Calc.cdsTalao_EstoqueQTD.AsFloat,
                                          0,0,0,
                                          fDMBaixaProd_Calc.cdsLoteUNIDADE.AsString,
                                          fDMBaixaProd_Calc.cdsLoteID_COMBINACAO.AsInteger,
                                          '','N',0,0);
  fDMBaixaProd_Calc.cdsTalao_Estoque.Post;
  fDMBaixaProd_Calc.cdsTalao_Estoque.ApplyUpdates(0);

  FreeAndNil(fDMEstoque);
end;

procedure TfrmBaixaTalao_Calc2.prc_Verificar_Esteira;
begin
  if fDMBaixaProd_Calc.vID_Esteira_Tal > 0 then
    exit;

  fDMBaixaProd_Calc.cdsEsteira.Close;
  fDMBaixaProd_Calc.sdsEsteira.ParamByName('ID_SETOR_PRINCIPAL').AsInteger := fDMBaixaProd_Calc.vID_Setor_Tal;
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
    fDMBaixaProd_Calc.vID_Esteira_Tal := fDMBaixaProd_Calc.vID_Setor_Tal;
end;

end.
