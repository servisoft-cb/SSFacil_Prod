unit UProcesso_ES;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Grids,
  FMTBcd, DB, RxLookup, UCBase, Mask, ToolEdit, NxCollection, NxEdit, CurrEdit, ComCtrls, RzDTP, RzEdit,
  RzPanel, SqlExpr, dbXPress, UDMBaixaProd, DBGrids, SMDBGrid, UDMEstoque, UDMEstoque_Res;

type
  TfrmProcesso_ES = class(TForm)
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
    UCControls1: TUCControls;
    btnTalaoEtiqueta: TNxButton;
    CurrencyEdit3: TCurrencyEdit;
    Panel3: TPanel;
    SMDBGrid2: TSMDBGrid;
    NxButton1: TNxButton;
    Panel4: TPanel;
    Label12: TLabel;
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
    procedure CurrencyEdit1Enter(Sender: TObject);
    procedure CurrencyEdit1Exit(Sender: TObject);
    procedure btnTalaoEtiquetaClick(Sender: TObject);
    procedure CurrencyEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NxButton1Click(Sender: TObject);
  private
    { Private declarations }
    fDMBaixaProd: TDMBaixaProd;
    vMSGLocal : WideString;
    vDigitoIni : String;
    vNumPedido_Loc : Integer;
    vLote : Integer;
    vRef_Loc, vNome_Comb_Loc, vNome_Prod_Loc : String;
    vQtdAnt : String;
    vParcial : Boolean;
    vID_BaixaProcesso : Integer;
    vItem_BaixaProcesso : Integer;
    vFilial_Loc : Integer;

    vItemPrimeiro : Integer;
    vIDProcesso : Integer;
    vIDPosiciona : Integer;

    vContador: Integer;

    function fnc_Talao_OK: Boolean;
    procedure prc_Gravar_ES;

    procedure prc_Verifica_Lote;
    procedure prc_Verifica_Pedido;
    procedure prc_Abrir_Baixa_Processo(ID_Lote, ID_Pedido, Item_Pedido, ID_Baixa : Integer);

    procedure prc_Limpar;
    procedure prc_Abrir_Funcionario_Proc(ID : Integer);

    procedure prc_Pedido_Talao;
    procedure prc_Inserir_Processo(Qtd : Real);
    procedure prc_Gravar_Baixa_Parcial(Tipo : String ; Data : TDate ; Hora : TTime);

    procedure prc_Monta_Processo;
    procedure prc_Consulta_ConsBaixaEtiq;
    procedure prc_Baixa_Estoque(Tipo : String); //P= Produto   S=Semi Acabado 

  public
    { Public declarations }
    
  end;

var
  frmProcesso_ES: TfrmProcesso_ES;

implementation

uses DmdDatabase, uUtilPadrao, rsDBUtils, UMenu, UConfParcial,
  UConsTalao_Etiq, USel_PedItem;

{$R *.dfm}

procedure TfrmProcesso_ES.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmProcesso_ES.FormShow(Sender: TObject);
var
  vCampoAux: String;
  i: Integer;
begin
  fDMBaixaProd := TDMBaixaProd.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMBaixaProd);

  DateEdit1.Date       := Date;
  //RzDateTimeEdit1.Time := Now;

  CurrencyEdit2.SetFocus;

  Panel3.Visible := (fDMBaixaProd.qParametros_UsuarioMOSTRAR_CONS_ETIQ.AsString = 'S');
end;

procedure TfrmProcesso_ES.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_F2 then
  begin
    vNum_Pedido_Pos := 0;
    vItem_Ped_Pos   := 0;
    vCodBarra_Pos   := '';
    frmSel_PedItem := TfrmSel_PedItem.Create(Self);
    frmSel_PedItem.ShowModal;
    FreeAndNil(frmSel_PedItem);
    if Trim(vCodBarra_Pos) <> '' then
      Edit1.Text := vCodBarra_Pos;
  end
  else
  if Key = Vk_Return then
  begin
    vFilial_Loc := 0;
    if copy(Edit1.Text,1,2) = '21' then
      prc_Pedido_Talao
    else
    begin
      if fnc_Talao_OK then
      begin
        Panel2.Visible := True;
        if CurrencyEdit3.AsInteger > 0 then
          CurrencyEdit1.SetFocus
        else
          CurrencyEdit3.SetFocus;
        Label8.Caption  := 'Ref: ' + vRef_Loc;
        Label9.Caption  := 'Combinação: ' + vNome_Comb_Loc;
        Label10.Caption := vNome_Prod_Loc;
      end;
    end;
    Edit1.SelectAll;
  end;
end;

function TfrmProcesso_ES.fnc_Talao_OK: Boolean;
begin
  Result := False;

  Edit1.Text := Monta_Numero(Edit1.Text,0);
  if Length(Edit1.Text) < 12 then
  begin
    MessageDlg('*** Código informado incorreto!', mtError, [mbOk], 0);
    exit;
  end;
  if Length(Edit1.Text) > 12 then
  begin
    MessageDlg('*** Código informado incorreto!', mtError, [mbOk], 0);
    exit;
  end;
  vMSGLocal := '';
  vDigitoIni := copy(Edit1.Text,1,1);
  if vDigitoIni = '5' then
    prc_Verifica_Pedido
  else
  if vDigitoIni = '2' then
    prc_Verifica_Lote
  else
    vMSGLocal := vMSGLocal + #13 + '*** Código de barras inválido!';

  if trim(vMSGLocal) <> '' then
    MessageDlg(vMSGLocal, mtError, [mbOk], 0)
  else
    Result := True;
end;

procedure TfrmProcesso_ES.prc_Gravar_ES;
var
  vHora: TTime;
  ID: TTransactionDesc;
  vData:TDate;
  vAtualizar : String;
  vNumLoteAux : Integer;
  sds: TSQLDataSet;
  Flag : Boolean;
  vEntSai : String;
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

  //17/07/2018
  if fDMBaixaProd.cdsBaixa_ProcessoID_PROCESSO.AsInteger <> RxDBLookupCombo1.KeyValue then
    //fDMBaixaProd.cdsBaixa_Processo.Locate('ID_PROCESSO',RxDBLookupCombo1.KeyValue,[loCaseInsensitive]);
    fDMBaixaProd.cdsBaixa_Processo.Locate('ITEM',vItem_BaixaProcesso,[loCaseInsensitive]);

  vID_BaixaProcesso   := fDMBaixaProd.cdsBaixa_ProcessoID.AsInteger;
  vItem_BaixaProcesso := fDMBaixaProd.cdsBaixa_ProcessoITEM.AsInteger;
  sds := TSQLDataSet.Create(nil);

  vMSGLocal := '';
  ID.TransactionID  := 1;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    try
      sds.SQLConnection := dmDatabase.scoDados;
      sds.NoMetadata    := True;
      sds.GetMetadata   := False;
      sds.CommandText   := 'UPDATE TABELALOC SET FLAG = 1 WHERE TABELA = ' + QuotedStr('BAIXA_PROCESSO');
      Flag := False;
      while not Flag do
      begin
        try
          sds.Close;
          sds.ExecSQL;
          Flag := True;
        except
          on E: Exception do
          begin
            Flag := False;
          end;
        end;
      end;
    except
      raise
    end;

    if vDigitoIni = '5' then
    begin
      vMSGLocal := vMSGLocal + '  Pedido: ' + IntToStr(vNumPedido_Loc) + '  Item ' + fDMBaixaProd.cdsPedido_ItemITEM.AsString;
      vMSGLocal := vMSGLocal + #13 +  '  Referência: ' + fDMBaixaProd.cdsPedido_ItemREFERENCIA.AsString;
    end
    else
    begin
      vMSGLocal := vMSGLocal + '  Lote: ' + fDMBaixaProd.cdsLoteNUM_LOTE.AsString;
      vMSGLocal := vMSGLocal + #13 + '  Referência: ' + fDMBaixaProd.cdsLoteREFERENCIA.AsString;
    end;

    vAtualizar := 'N';
    vEntSai    := 'E';
    fDMBaixaProd.cdsBaixa_Processo.Edit;
    if not fDMBaixaProd.cdsBaixa_ProcessoDTENTRADA.IsNull then
      vEntSai := 'S';
    if fDMBaixaProd.cdsBaixa_ProcessoDTENTRADA.IsNull then
    begin
      fDMBaixaProd.cdsBaixa_ProcessoDTENTRADA.AsDateTime := vData;
      fDMBaixaProd.cdsBaixa_ProcessoHRENTRADA.AsDateTime := vHora;
      if StrToFloat(FormatFloat('0.0000',fDMBaixaProd.cdsBaixa_ProcessoQTD_LIBERADA.AsFloat)) = 0 then
        fDMBaixaProd.cdsBaixa_ProcessoQTD_LIBERADA.AsFloat := StrToFloat(FormatFloat('0.0000',CurrencyEdit1.Value));
      vMSGLocal := vMSGLocal + #13 + #13 + '  Início do Processo';
      //if CurrencyEdit1.Value > 0 then
        //fDMBaixaProd.cdsBaixa_ProcessoQTD.AsFloat := CurrencyEdit1.Value;
      fDMBaixaProd.cdsBaixa_ProcessoID_FUNCIONARIO_ENT.AsInteger := fDMBaixaProd.qFuncionarioCODIGO.AsInteger;
      prc_Gravar_Baixa_Parcial('E',vData,vHora);

      if fDMBaixaProd.cdsBaixa_ProcessoID_PROCESSO.AsInteger = fDMBaixaProd.qParametros_LoteID_PROCESSO_EST.AsInteger then
        vEntSai := 'S';
    end;

    if vEntSai = 'S' then
    begin
      fDMBaixaProd.cdsBaixa_ProcessoQTD_PENDENTE.AsFloat := StrToFloat(FormatFloat('0.0000',fDMBaixaProd.cdsBaixa_ProcessoQTD_PENDENTE.AsFloat - CurrencyEdit1.Value));
      if StrToFloat(FormatFloat('0.0000',fDMBaixaProd.cdsBaixa_ProcessoQTD_PENDENTE.AsFloat)) <= 0 then
      begin
        fDMBaixaProd.cdsBaixa_ProcessoDTBAIXA.AsDateTime    := vData;
        fDMBaixaProd.cdsBaixa_ProcessoHRBAIXA.AsDateTime    := vHora;
      end;
      //fDMBaixaProd.cdsBaixa_ProcessoQTD.AsFloat           := CurrencyEdit1.Value;
      fDMBaixaProd.cdsBaixa_ProcessoQTD_PRODUZIDO.AsFloat := StrToFloat(FormatFloat('0.0000',fDMBaixaProd.cdsBaixa_ProcessoQTD_PRODUZIDO.AsFloat + CurrencyEdit1.Value));
      fDMBaixaProd.cdsBaixa_ProcessoQTD_LIBERADA.AsFloat  := StrToFloat(FormatFloat('0.0000',fDMBaixaProd.cdsBaixa_ProcessoQTD_LIBERADA.AsFloat - CurrencyEdit1.Value));
      if vParcial then
      begin
        fDMBaixaProd.cdsBaixa_ProcessoPARCIAL.AsString := 'G';
        vMSGLocal := vMSGLocal + #13 + #13 + '  Encerrado o Processo Parcial'
      end
      else
        vMSGLocal := vMSGLocal + #13 + #13 + '  Encerrado o Processo';
      if fDMBaixaProd.cdsBaixa_ProcessoDTBAIXA.AsDateTime > 10 then
        fDMBaixaProd.cdsBaixa_ProcessoTOTAL_HORAS.AsFloat := fnc_Calcular_Hora2(fDMBaixaProd.cdsBaixa_ProcessoHRENTRADA.AsDateTime,
                                                                                fDMBaixaProd.cdsBaixa_ProcessoHRBAIXA.AsDateTime,
                                                                                fDMBaixaProd.cdsBaixa_ProcessoDTENTRADA.AsDateTime,
                                                                                fDMBaixaProd.cdsBaixa_ProcessoDTBAIXA.AsDateTime);
      vAtualizar := 'S';
      fDMBaixaProd.cdsBaixa_ProcessoID_FUNCIONARIO_BAIXA.AsInteger := fDMBaixaProd.qFuncionarioCODIGO.AsInteger;
      prc_Gravar_Baixa_Parcial('S',vData,vHora);
    end;

    //03/10/2018 Grava o estoque do produto acabado
    if fDMBaixaProd.cdsBaixa_ProcessoID_PROCESSO.AsInteger = fDMBaixaProd.qParametros_LoteID_PROCESSO_EST.AsInteger then
      prc_Baixa_Estoque('P');
    //******************
    if fDMBaixaProd.cdsBaixa_Processo.State in [dsEdit] then
      fDMBaixaProd.cdsBaixa_Processo.Post;
    if (fDMBaixaProd.cdsBaixa_ProcessoAJUSTE.AsString = 'S') or (fDMBaixaProd.cdsBaixa_ProcessoRETRABALHO.AsString = 'S') or (fDMBaixaProd.cdsBaixa_ProcessoID_PROCESSO.AsInteger = fDMBaixaProd.qParametros_LoteID_PROCESSO_EST.AsInteger) then
      vAtualizar := 'N';

    //*******************
    if vAtualizar = 'S' then
    begin
      fDMBaixaProd.cdsBaixa_Processo.Next;
      while not fDMBaixaProd.cdsBaixa_Processo.Eof do
      begin
        if (fDMBaixaProd.cdsBaixa_ProcessoDTBAIXA.AsDateTime <= 10) and (trim(fDMBaixaProd.cdsBaixa_ProcessoAJUSTE.AsString) <> 'S')and (trim(fDMBaixaProd.cdsBaixa_ProcessoRETRABALHO.AsString) <> 'S') then
        begin
          if vAtualizar = 'S' then
          begin
            fDMBaixaProd.qProcesso.Close;
            fDMBaixaProd.qProcesso.ParamByName('ID').AsInteger := fDMBaixaProd.cdsBaixa_ProcessoID_PROCESSO.AsInteger;
            fDMBaixaProd.qProcesso.Open;
            fDMBaixaProd.cdsBaixa_Processo.Edit;
            if fDMBaixaProd.qProcessoENTRADA_AUTO.AsString = 'S' then
            begin
              fDMBaixaProd.cdsBaixa_ProcessoDTENTRADA.AsDateTime := vData;
              fDMBaixaProd.cdsBaixa_ProcessoHRENTRADA.AsDateTime := vHora;
              fDMBaixaProd.cdsBaixa_ProcessoID_FUNCIONARIO_ENT.AsInteger := fDMBaixaProd.qFuncionarioCODIGO.AsInteger;
              prc_Gravar_Baixa_Parcial('E',vData,vHora);
            end;
            fDMBaixaProd.cdsBaixa_ProcessoQTD_LIBERADA.AsFloat := StrToFloat(FormatFloat('0.0000',fDMBaixaProd.cdsBaixa_ProcessoQTD_LIBERADA.AsFloat + CurrencyEdit1.Value));
            fDMBaixaProd.cdsBaixa_Processo.Post;
          end;
          vAtualizar := 'N';
          //fDMBaixaProd.cdsBaixa_Processo.Edit;
          //fDMBaixaProd.cdsBaixa_ProcessoQTD.AsFloat := CurrencyEdit1.Value;
          //fDMBaixaProd.cdsBaixa_Processo.Post;
        end;
        fDMBaixaProd.cdsBaixa_Processo.Next;
      end;
    end;

    fDMBaixaProd.cdsBaixa_Processo.ApplyUpdates(0);

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

  FreeAndNil(sds);

  //AC Jóias 02/07/2018
  if fDMBaixaProd.qParametros_LoteUSA_LOTE_PEDIDO.AsString = 'S' then
  begin
    fDMBaixaProd.qConfLoteBaixado.Close;
    fDMBaixaProd.qConfLoteBaixado.ParamByName('ID_PEDIDO').AsInteger   := fDMBaixaProd.cdsLoteID_PEDIDO.AsInteger;
    fDMBaixaProd.qConfLoteBaixado.ParamByName('ITEM_PEDIDO').AsInteger := fDMBaixaProd.cdsLoteITEM_PEDIDO.AsInteger;
    fDMBaixaProd.qConfLoteBaixado.Open;
    if fDMBaixaProd.qConfLoteBaixadoCONTADOR.AsInteger <= 0 then
    begin
      fDMBaixaProd.cdsLote.Edit;
      fDMBaixaProd.cdsLoteBAIXADO.AsString   := 'S';
      fDMBaixaProd.cdsLoteDTBAIXA.AsDateTime := vData;
      fDMBaixaProd.cdsLoteHRBAIXA.AsDateTime := vHora;
      fDMBaixaProd.cdsLote.Post;
      fDMBaixaProd.cdsLote.ApplyUpdates(0);
    end;
  end;
  Panel2.Visible := False;
  Edit1.SetFocus;
end;

procedure TfrmProcesso_ES.Edit1Change(Sender: TObject);
begin
  Label5.Caption := '';
  Panel2.Visible := False;
end;

procedure TfrmProcesso_ES.prc_Verifica_Lote;
begin
  vMSGLocal := '';
  if fDMBaixaProd.qParametros_LoteLOTE_PROCESSO.AsString = 'S' then
    vLote := StrToInt(copy(Edit1.Text,2,8))
  else
    vLote := StrToInt(copy(Edit1.Text,2,11));
  vRef_Loc  := '';
  vNome_Comb_Loc := '';
  vNome_Prod_Loc := '';

  fDMBaixaProd.cdsLote.Close;
  fDMBaixaProd.sdsLote.ParamByName('NUM_LOTE').AsInteger := vLote;
  fDMBaixaProd.cdsLote.Open;

  if fDMBaixaProd.cdsLote.IsEmpty then
  begin
    vMSGLocal := vMSGLocal + #13 + '*** Lote ' + IntToStr(vLote) + '  não encontrado!';
    exit;
  end;

  vFilial_Loc := fDMBaixaProd.cdsLoteFILIAL.AsInteger;
  prc_Abrir_Baixa_Processo(fDMBaixaProd.cdsLoteID.AsInteger,0,0,0);
  if fDMBaixaProd.cdsBaixa_Processo.IsEmpty then
  begin
    vMSGLocal := vMSGLocal + #13 + '*** Lote ' + IntToStr(vLote) + ', não encontrado Processo' ;
    exit;
  end;
  vNumPedido_Loc := 0;
  prc_Monta_Processo;
end;

procedure TfrmProcesso_ES.prc_Verifica_Pedido;
var
  vItemPedido, vID_Pedido : Integer;
  vItemAux : Integer;
begin
  vRef_Loc       := '';
  vNome_Comb_Loc := '';
  vNome_Prod_Loc := '';
  vMSGLocal      := '';
  vNumPedido_Loc := StrToInt(copy(Edit1.Text,2,7));
  vItemPedido    := StrToInt(copy(Edit1.Text,9,4));

  fDMBaixaProd.prc_Abrir_qPedido(vNumPedido_Loc,'');
  vID_Pedido := fDMBaixaProd.qPedID.AsInteger;

  if vID_Pedido <= 0 then
  begin
    vMSGLocal := vMSGLocal + #13 + '*** Pedido ' + IntToStr(vNumPedido_Loc) + '  não encontrado!';
    exit;
  end;

  fDMBaixaProd.cdsPedido_Item.Close;
  fDMBaixaProd.sdsPedido_Item.ParamByName('ID').AsInteger   := vID_Pedido;
  fDMBaixaProd.sdsPedido_Item.ParamByName('ITEM').AsInteger := vItemPedido;
  fDMBaixaProd.cdsPedido_Item.Open;

  vRef_Loc := fDMBaixaProd.cdsPedido_ItemREFERENCIA.AsString;
  vNome_Comb_Loc := fDMBaixaProd.cdsPedido_ItemNOME_COMBINACAO.AsString;
  vNome_Prod_Loc := fDMBaixaProd.cdsPedido_ItemNOMEPRODUTO.AsString;

  if fDMBaixaProd.cdsPedido_ItemCANCELADO.AsString = 'S' then
  begin
    vMSGLocal := vMSGLocal + #13 + '*** Pedido ' + IntToStr(vNumPedido_Loc) + '  Item ' + IntToStr(vItemPedido) + ' CANCELADO!' ;
    exit;
  end;

  if StrToFloat(FormatFloat('0.0000',fDMBaixaProd.cdsPedido_ItemQTD_RESTANTE.AsFloat)) <= 0 then
  begin
    vMSGLocal := vMSGLocal + #13 + '***  Pedido ' + IntToStr(vNumPedido_Loc) + '  Item ' + IntToStr(vItemPedido) + ' Já faturado!' ;
    exit;
  end;

  //prc_Abrir_Baixa_Processo(0,vNumPedido_Loc,vItemPedido);
  prc_Abrir_Baixa_Processo(0,vID_Pedido,vItemPedido,0);
  if fDMBaixaProd.cdsBaixa_Processo.IsEmpty then
  begin
    vMSGLocal := vMSGLocal + #13 + '*** Pedido ' + IntToStr(vNumPedido_Loc) + ' Não gerada a produção' ;
    exit;
  end;
  vLote := 0;
  prc_Monta_Processo;
end;

procedure TfrmProcesso_ES.prc_Abrir_Baixa_Processo(ID_Lote, ID_Pedido, Item_Pedido, ID_Baixa: Integer);
var
  vComando : String;
begin
  fDMBaixaProd.cdsBaixa_Processo.Close;
  vComando := '';
  if ID_Lote > 0 then
    vComando := ' WHERE ID_LOTE = ' + IntToStr(ID_Lote)
  else
  if ID_Pedido > 0 then
    vComando := ' WHERE ID_PEDIDO = ' + IntToStr(ID_Pedido) + ' AND ITEM_PEDIDO = ' + IntToStr(Item_Pedido)
  else
  if ID_Baixa > 0 then
    vComando := ' WHERE ID = ' + IntToStr(ID_Baixa);
  fDMBaixaProd.sdsBaixa_Processo.CommandText := fDMBaixaProd.ctBaixa_Processo + vComando;
  fDMBaixaProd.cdsBaixa_Processo.Open;
end;

procedure TfrmProcesso_ES.prc_Limpar;
begin
  Edit1.Clear;
  RxDBLookupCombo1.ClearValue;
  CurrencyEdit1.Clear;
  fDMBaixaProd.cdsBaixa_Processo.Close;
  Panel2.Visible := False;
  lblFuncionario.Caption := '';
end;

procedure TfrmProcesso_ES.btnCancelarClick(Sender: TObject);
begin
  prc_Limpar;
  Edit1.SetFocus;
end;

procedure TfrmProcesso_ES.btnConfirmarClick(Sender: TObject);
var
  vQtdAux : Real;
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
  if fDMBaixaProd.qParametros_LoteLOTE_TEXTIL.AsString = 'S' then
  begin
    prc_Abrir_Funcionario_Proc(fDMBaixaProd.qFuncionarioCODIGO.AsInteger);
    if fDMBaixaProd.qFuncionario_Processo.IsEmpty then
    begin
      MessageDlg('*** Funcionário sem cadastro de Processo!', mtError, [mbOk], 0);
      exit;
    end;
    if not (fDMBaixaProd.qFuncionario_Processo.Locate('CODIGO;ID_PROCESSO',VarArrayOf([fDMBaixaProd.qFuncionarioCODIGO.AsInteger,RxDBLookupCombo1.KeyValue]),[locaseinsensitive])) then
    begin
      MessageDlg('*** Funcionário não tem permissão para baixar esse processo!', mtError, [mbOk], 0);
      exit;
    end;

    //07/03/2019
    if (fDMBaixaProd.qParametros_LoteCONT_LOTE_ANT.AsString = 'S') and (trim(fDMBaixaProd.qParametros_UsuarioLIBERA_TALAO_ANT.AsString) <> 'S') then
    begin
      fDMBaixaProd.qVerAnt.Close;
      fDMBaixaProd.qVerAnt.ParamByName('NUM_ORDEM').AsInteger := fDMBaixaProd.cdsBaixa_ProcessoNUM_ORDEM.AsInteger;
      fDMBaixaProd.qVerAnt.ParamByName('ITEM').AsInteger      := vItem_BaixaProcesso;
      fDMBaixaProd.qVerAnt.Open;
      if fDMBaixaProd.qVerAntCONTADOR.AsInteger > 0 then
      begin
        MessageDlg('*** Existe Talão anterior NÃO Encerrado !' + #13 + '  Na  OP: ' + fDMBaixaProd.cdsBaixa_ProcessoNUM_ORDEM.AsString, mtError, [mbOk], 0);
        exit;
      end;
    end;
    //*******************

  end;
  if fDMBaixaProd.cdsBaixa_ProcessoDTBAIXA.AsDateTime > 0 then
  begin
    MessageDlg('*** Processo já baixado!', mtInformation, [mbOk], 0);
    exit;
  end;
  vParcial := False;
  //if (fDMBaixaProd.cdsBaixa_ProcessoQTD.AsFloat > CurrencyEdit1.Value) and (fDMBaixaProd.cdsBaixa_ProcessoDTENTRADA.AsDateTime > 10) then
  {if (StrToFloat(FormatFloat('0.0000',fDMBaixaProd.cdsBaixa_ProcessoQTD.AsFloat)) > StrToFloat(FormatFloat('0.0000',CurrencyEdit1.Value))) then
  begin
    if fDMBaixaProd.cdsBaixa_ProcessoDTENTRADA.IsNull then
    begin
      MessageDlg('*** Quantidade de entrada não pode ser menor que quantidade do Processo!', mtError, [mbOk], 0);
      CurrencyEdit1.SetFocus;
      exit;
    end;


    vQtdAux := StrToFloat(FormatFloat('0.0000',fDMBaixaProd.cdsBaixa_ProcessoQTD_LIBERADA.AsFloat - CurrencyEdit1.Value));



    //17/07/2018
    frmConfParcial              := TfrmConfParcial.Create(Self);
    frmConfParcial.Memo1.Lines.Add('Qtde Total: ' + fDMBaixaProd.cdsBaixa_ProcessoQTD.AsString);
    frmConfParcial.Memo1.Lines.Add('');
    frmConfParcial.Memo1.Lines.Add('Qtde Informada para Baixar: ' + CurrencyEdit1.Text);
    frmConfParcial.Memo1.Lines.Add('');
    frmConfParcial.Memo1.Lines.Add('Pressione o botão com a opção desejada!');
    frmConfParcial.ShowModal;
    FreeAndNil(frmConfParcial);
    if (vProcesso_Parcial = 'C') or (trim(vProcesso_Parcial) = '') then
    begin
      MessageDlg('*** Quantidade produzida não pode ser menor que quantidade do Processo!', mtError, [mbOk], 0);
      CurrencyEdit1.SetFocus;
      exit;
    end;
    if vProcesso_Parcial = 'G' then
      vParcial := True;
  end;}
  prc_Gravar_ES;
  //17/07/2018
  //if vParcial then
  //  prc_Inserir_Processo(vQtdAux);
end;

procedure TfrmProcesso_ES.RxDBLookupCombo1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
  begin
    RxDBLookupCombo1.CloseUp(True);
    if RxDBLookupCombo1.Text <> '' then
      CurrencyEdit1.SetFocus;
  end;
end;

procedure TfrmProcesso_ES.RxDBLookupCombo1Exit(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
  begin
    if fDMBaixaProd.cdsBaixa_ProcessoID_PROCESSO.AsInteger <> RxDBLookupCombo1.KeyValue then
     fDMBaixaProd.cdsBaixa_Processo.Locate('ID_PROCESSO',RxDBLookupCombo1.KeyValue,[loCaseInsensitive]);
    //CurrencyEdit1.Value := fDMBaixaProd.cdsBaixa_ProcessoQTD.AsFloat;
  end;
end;

procedure TfrmProcesso_ES.CurrencyEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
  begin
    if CurrencyEdit1.Value > 0 then
      btnConfirmar.SetFocus;
  end;
end;

procedure TfrmProcesso_ES.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMBaixaProd.cdsBaixa_ProcessoDTBAIXA.AsDateTime > 10 then
    Background := $0077FF77
  else
  if fDMBaixaProd.cdsBaixa_ProcessoDTENTRADA.AsDateTime > 10 then
    Background := $00FFFFB9;
end;

procedure TfrmProcesso_ES.CurrencyEdit2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
  begin
    if CurrencyEdit2.AsInteger > 0 then
    begin
      fDMBaixaProd.qFuncionario.Close;
      fDMBaixaProd.qFuncionario.ParamByName('NUM_CARTAO').AsInteger := CurrencyEdit2.AsInteger;
      fDMBaixaProd.qFuncionario.Open;
      lblFuncionario.Caption := '';
      if fDMBaixaProd.qFuncionarioCODIGO.AsInteger <= 0 then
      begin
        Label5.Caption := '*** FUNCIONÁRIO NÃO ENCONTRADO ***';
        CurrencyEdit2.SelectAll;
        CurrencyEdit2.SetFocus;
      end
      else
      begin
        lblFuncionario.Caption := fDMBaixaProd.qFuncionarioNOME.AsString;
        Label1.Visible         := True;
        Edit1.Visible          := True;
        Edit1.SetFocus;
      end;
    end
    else
    if CurrencyEdit2.Text <> '' then
    begin
      Label5.Caption := '*** FUNCIONÁRIO NÃO ENCONTRADO ***';
      CurrencyEdit2.SelectAll;
      CurrencyEdit2.SetFocus;
    end
  end;
end;

procedure TfrmProcesso_ES.CurrencyEdit2Change(Sender: TObject);
begin
  Label5.Caption := '';
  Edit1.Clear;
  Label1.Visible := False;
  Edit1.Visible  := False;
  lblFuncionario.Caption := '';
end;

procedure TfrmProcesso_ES.prc_Abrir_Funcionario_Proc(ID: Integer);
begin
  fDMBaixaProd.qFuncionario_Processo.Close;
  fDMBaixaProd.qFuncionario_Processo.ParamByName('CODIGO').AsInteger := ID;
  fDMBaixaProd.qFuncionario_Processo.Open;
end;

procedure TfrmProcesso_ES.CurrencyEdit1Enter(Sender: TObject);
begin
  vQtdAnt := CurrencyEdit1.Text;
  fDMBaixaProd.qProcesso.Close;
  fDMBaixaProd.qProcesso.ParamByName('ID').AsInteger := fDMBaixaProd.cdsBaixa_ProcessoID_PROCESSO.AsInteger;
  fDMBaixaProd.qProcesso.Open;
  if (fDMBaixaProd.qProcessoESTOQUE_DT_ES.AsString = 'E') and (fDMBaixaProd.cdsBaixa_ProcessoDTENTRADA.IsNull) then
    CurrencyEdit1.ReadOnly := False
  else
    CurrencyEdit1.ReadOnly := (fDMBaixaProd.cdsBaixa_ProcessoDTENTRADA.IsNull);
  if (trim(RxDBLookupCombo1.Text) <> '') and (fDMBaixaProd.qParametros_LoteID_PROCESSO_EST.AsInteger = RxDBLookupCombo1.KeyValue) then
    CurrencyEdit1.ReadOnly := True;
end;

procedure TfrmProcesso_ES.CurrencyEdit1Exit(Sender: TObject);
begin
  if CurrencyEdit1.Text = Edit1.Text then
  begin
    MessageDlg('*** Quantidade informada igual ao código de barras, favor verificar!', mtError, [mbOk], 0);
    CurrencyEdit1.Text := vQtdAnt;
    CurrencyEdit1.SetFocus;
    exit;
  end;
end;

procedure TfrmProcesso_ES.prc_Pedido_Talao;
var
  vPed, vItem, vItemTal : Integer;
  vQtdAux : Real;
  vMSGAux : String;
  ID: TTransactionDesc;
begin
  if Length(Edit1.Text) <> 14 then
    exit;
  vPed     := StrToInt(copy(Edit1.Text,3,6));
  vItem    := StrToInt(copy(Edit1.Text,9,3));
  vItemTal := StrToInt(copy(Edit1.Text,12,3));

  fDMBaixaProd.prc_Abrir_qPedido(vPed,'');
  if fDMBaixaProd.qPed.IsEmpty then
  begin
    Label5.Caption := 'Nº Pedido: ' + IntToStr(vPed) + ' , não Encontrado';
    exit;
  end;
  if fDMBaixaProd.qPedBAIXAR_ETIQ_PREFAT.AsString = 'S' then
  begin
    Label5.Caption := 'Cliente: ' + fDMBaixaProd.qPedNOME.AsString;
    Label5.Caption := Label5.Caption + #13 +  'Baixar Pedido no Pré Faturamento';
    exit;
  end;
  if trim(fDMBaixaProd.qFuncionarioBAIXA_ETIQ_PREFAT.AsString) <> 'S' then
  begin
    Label5.Caption := 'Funcionário não liberado para ler Etiqueta ';
    exit;
  end;
  fDMBaixaProd.cdsPedido_Item.Close;
  fDMBaixaProd.sdsPedido_Item.ParamByName('ID').AsInteger   := fDMBaixaProd.qPedID.AsInteger;
  fDMBaixaProd.sdsPedido_Item.ParamByName('ITEM').AsInteger := vItem;
  fDMBaixaProd.cdsPedido_Item.Open;
  if StrToFloat(FormatFloat('0.000',fDMBaixaProd.cdsPedido_ItemQTD_RESTANTE.AsFloat)) <= 0 then
  begin
    Label5.Caption := 'Pedido: ' + IntToStr(vPed) + ' Item: ' + IntToStr(vItem) + ' já faturados';
    exit;
  end;
  //precisa estar com o processo lido (Talão dos itens do pedido)
  fDMBaixaProd.qConf_Proc.Close;
  fDMBaixaProd.qConf_Proc.ParamByName('ID_PEDIDO').AsInteger   := fDMBaixaProd.qPedID.AsInteger;
  fDMBaixaProd.qConf_Proc.ParamByName('ITEM_PEDIDO').AsInteger := vItem;
  fDMBaixaProd.qConf_Proc.Open;
  if fDMBaixaProd.qConf_ProcCONTADOR.AsInteger <= 0 then
  begin
    Label5.Caption := 'Pedido: ' + IntToStr(vPed) + ' Item: ' + IntToStr(vItem) + ' não liberado no Processo ' + #13 + #13
                   + '        ' + fDMBaixaProd.qParametros_LoteNOME_PROCESSO_CONF.AsString;
    exit;
  end;
  //************

  vMSGAux := '';
  fDMBaixaProd.cdsPedido_Talao.Close;
  fDMBaixaProd.sdsPedido_Talao.ParamByName('ID').AsInteger         := fDMBaixaProd.qPedID.AsInteger;
  fDMBaixaProd.sdsPedido_Talao.ParamByName('ITEM').AsInteger       := vItem;
  fDMBaixaProd.sdsPedido_Talao.ParamByName('ITEM_TALAO').AsInteger := vItemTal;
  fDMBaixaProd.cdsPedido_Talao.Open;
  if fDMBaixaProd.cdsPedido_Talao.IsEmpty then
    vMSGAux := vMSGAux + #13 + '*** Talão Pedido não encontrado!';
  if fDMBaixaProd.cdsPedido_TalaoDTBAIXA.AsDateTime > 10 then
    vMSGAux := vMSGAux + #13 + '*** Talão ja baixado no dia ' + fDMBaixaProd.cdsPedido_TalaoDTBAIXA.AsString;
  if StrToFloat(FormatFloat('0.000',fDMBaixaProd.cdsPedido_TalaoQTD.AsFloat)) > StrToFloat(FormatFloat('0.000',fDMBaixaProd.cdsPedido_ItemQTD_RESTANTE.AsFloat)) then
    vMSGAux := vMSGAux + #13 + '*** Qtd. No Pedido ' + fDMBaixaProd.cdsPedido_ItemQTD_RESTANTE.AsString + ', Qtd No Talão: ' + fDMBaixaProd.cdsPedido_TalaoQTD.AsString;
  if (StrToFloat(FormatFloat('0.00',fDMBaixaProd.cdsPedido_TalaoQTD.AsFloat)) > StrToFloat(FormatFloat('0.000',fDMBaixaProd.cdsPedido_ItemQTD_RESTANTE.AsFloat - fDMBaixaProd.cdsPedido_ItemQTD_LIBERADA.AsFloat))) then
    vMSGAux := vMSGAux + #13 + '*** Qtd. disponível para liberação é ' + FormatFloat('0.000',fDMBaixaProd.cdsPedido_ItemQTD_RESTANTE.AsFloat - fDMBaixaProd.cdsPedido_ItemQTD_LIBERADA.AsFloat);

  if (StrToFloat(FormatFloat('0.00',fDMBaixaProd.cdsPedido_TalaoQTD.AsFloat)) >
     StrToFloat(FormatFloat('0.00',fDMBaixaProd.cdsPedido_ItemQTD_RESTANTE.AsFloat - fDMBaixaProd.cdsPedido_ItemQTD_LIBERADA.AsFloat - fDMBaixaProd.cdsPedido_ItemQTD_CONFERIDO.AsFloat))) then
    vMSGAux := vMSGAux + #13 + '*** Qtd. disponível para liberação é '
            + FormatFloat('0.000',fDMBaixaProd.cdsPedido_ItemQTD_RESTANTE.AsFloat - fDMBaixaProd.cdsPedido_ItemQTD_LIBERADA.AsFloat - fDMBaixaProd.cdsPedido_ItemQTD_CONFERIDO.AsFloat);
  if trim(vMSGAux) <> '' then
  begin
    Label5.Caption := vMSGAux;
    MessageDlg('*** Código informado incorreto!', mtError, [mbOk], 0);
    exit;
  end;

  vMSGLocal := '';
  ID.TransactionID  := 1;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    fDMBaixaProd.cdsPedido_Talao.Edit;
    if DateEdit1.Date > 10 then
      fDMBaixaProd.cdsPedido_TalaoDTBAIXA.AsDateTime := DateEdit1.Date
    else
      fDMBaixaProd.cdsPedido_TalaoDTBAIXA.AsDateTime := Date;
    fDMBaixaProd.cdsPedido_TalaoHRBAIXA.AsDateTime := Now;
    fDMBaixaProd.cdsPedido_TalaoUSUARIO.AsString   := vUsuario;
    fDMBaixaProd.cdsPedido_Talao.Post;
    vQtdAux := StrToFloat(FormatFloat('0.000',fDMBaixaProd.cdsPedido_TalaoQTD.AsFloat));

    fDMBaixaProd.cdsPedido_Item.Edit;
    fDMBaixaProd.cdsPedido_ItemQTD_CONFERIDO.AsFloat := StrToFloat(FormatFloat('0.000',fDMBaixaProd.cdsPedido_ItemQTD_CONFERIDO.AsFloat + fDMBaixaProd.cdsPedido_TalaoQTD.AsFloat));
    fDMBaixaProd.cdsPedido_Item.Post;
    
    fDMBaixaProd.cdsPedido_Talao.ApplyUpdates(0);
    fDMBaixaProd.cdsPedido_Item.ApplyUpdates(0);

    dmDatabase.scoDados.Commit(ID);

    Label5.Caption := 'Pedido: ' + IntToStr(vPed);
    Label5.Caption := Label5.Caption + #13 + #13 + 'Item: ' + IntToStr(vItem);
    Label5.Caption := Label5.Caption + #13 + #13 + 'Qtd. Conferida: ' + FormatFloat('0.###',vQtdAux);

  except
      on e: Exception do
      begin
        dmDatabase.scoDados.Rollback(ID);
        raise Exception.Create('Erro ao gravar Baixa Processo: ' + #13+#13 + e.Message);
      end;
  end;

  if Panel3.Visible then
    prc_Consulta_ConsBaixaEtiq;

  //if PnlConsRapida.Visible then
  //begin
  //  CurrencyEdit3.AsInteger := vPed;
  //  prc_ConsRapido(vPed);
  //end;
end;

procedure TfrmProcesso_ES.prc_Inserir_Processo(Qtd : Real);
var
  vItemAux : Integer;
  ID: TTransactionDesc;
  sds: TSQLDataSet;
  Flag : Boolean;
begin
  fDMBaixaProd.qVerBaixa.Close;
  fDMBaixaProd.qVerBaixa.ParamByName('ID').AsInteger   := vID_BaixaProcesso;
  fDMBaixaProd.qVerBaixa.ParamByName('ITEM').AsInteger := vItem_BaixaProcesso;
  fDMBaixaProd.qVerBaixa.Open;

  prc_Abrir_Baixa_Processo(0,0,0,vID_BaixaProcesso);
  sds := TSQLDataSet.Create(nil);

  ID.TransactionID  := 11;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    try
      sds.SQLConnection := dmDatabase.scoDados;
      sds.NoMetadata    := True;
      sds.GetMetadata   := False;
      sds.CommandText   := 'UPDATE TABELALOC SET FLAG = 1 WHERE TABELA = ' + QuotedStr('BAIXA_PROCESSO');
      Flag := False;
      while not Flag do
      begin
        try
          sds.Close;
          sds.ExecSQL;
          Flag := True;
        except
          on E: Exception do
          begin
            Flag := False;
          end;
        end;
      end;
    except
      raise
    end;

    fDMBaixaProd.cdsBaixa_Processo.Last;
    vItemAux := fDMBaixaProd.cdsBaixa_ProcessoITEM.AsInteger;
    fDMBaixaProd.cdsBaixa_Processo.Insert;
    fDMBaixaProd.cdsBaixa_ProcessoID.AsInteger          := vID_BaixaProcesso;
    fDMBaixaProd.cdsBaixa_ProcessoITEM.AsInteger        := vItemAux + 1;
    fDMBaixaProd.cdsBaixa_ProcessoID_PROCESSO.AsInteger := fDMBaixaProd.qVerBaixaID_PROCESSO.AsInteger;
    fDMBaixaProd.cdsBaixa_ProcessoTIPO.AsString         := fDMBaixaProd.qVerBaixaTIPO.AsString;
    if fDMBaixaProd.cdsBaixa_ProcessoTIPO.AsString <> '5' then
      fDMBaixaProd.cdsBaixa_ProcessoID_LOTE.AsInteger := fDMBaixaProd.qVerBaixaID_LOTE.AsInteger

    else
    begin
      fDMBaixaProd.cdsBaixa_ProcessoID_PEDIDO.AsInteger   := fDMBaixaProd.qVerBaixaID_PEDIDO.AsInteger;
      fDMBaixaProd.cdsBaixa_ProcessoITEM_PEDIDO.AsInteger := fDMBaixaProd.qVerBaixaITEM_PEDIDO.AsInteger;
    end;
    fDMBaixaProd.cdsBaixa_ProcessoDTENTRADA.Clear;
    fDMBaixaProd.cdsBaixa_ProcessoHRENTRADA.Clear;
    fDMBaixaProd.cdsBaixa_ProcessoDTBAIXA.Clear;
    fDMBaixaProd.cdsBaixa_ProcessoHRBAIXA.Clear;
    fDMBaixaProd.cdsBaixa_ProcessoQTD.AsFloat          := Qtd;
    fDMBaixaProd.cdsBaixa_ProcessoQTD_PENDENTE.AsFloat := fDMBaixaProd.cdsBaixa_ProcessoQTD.AsFloat;
    fDMBaixaProd.cdsBaixa_ProcessoQTD_PRODUZIDO.AsFloat := 0;
    fDMBaixaProd.cdsBaixa_ProcessoNUM_ORDEM.AsInteger   := fDMBaixaProd.qVerBaixaNUM_ORDEM.AsInteger;
    fDMBaixaProd.cdsBaixa_ProcessoPARCIAL.AsString      := 'P';
    fDMBaixaProd.cdsBaixa_ProcessoITEM_ORIGINAL.AsInteger := fDMBaixaProd.qVerBaixaITEM.AsInteger;
    fDMBaixaProd.cdsBaixa_Processo.Post;
    fDMBaixaProd.cdsBaixa_Processo.ApplyUpdates(0);

    dmDatabase.scoDados.Commit(ID);

  except
      on e: Exception do
      begin
        dmDatabase.scoDados.Rollback(ID);
        raise Exception.Create('Erro ao inserir um Processo novo (Baixa): ' + #13+#13 + e.Message);
      end;
  end;
  FreeAndNil(sds);
end;

procedure TfrmProcesso_ES.btnTalaoEtiquetaClick(Sender: TObject);
begin
  frmConsTalao_Etiq := TfrmConsTalao_Etiq.Create(Self);
  frmConsTalao_Etiq.fDMBaixaProd := fDMBaixaProd;
  frmConsTalao_Etiq.ShowModal;
  FreeAndNil(frmConsTalao_Etiq);
  prc_Consulta_ConsBaixaEtiq;
end;

procedure TfrmProcesso_ES.prc_Gravar_Baixa_Parcial(Tipo : String ; Data : TDate ; Hora : TTime);
var
  vItemAux : Integer;
  vDataAux : TDate;
  vHoraAux : TTime;
begin
  {fDMBaixaProd.qProximoItemParcial.Close;
  fDMBaixaProd.qProximoItemParcial.ParamByName('ID').AsInteger   := fDMBaixaProd.cdsBaixa_ProcessoID.AsInteger;
  fDMBaixaProd.qProximoItemParcial.ParamByName('ITEM').AsInteger := fDMBaixaProd.cdsBaixa_ProcessoITEM.AsInteger;
  fDMBaixaProd.qProximoItemParcial.Open;}

  vDataAux := 0;
  vHoraAux := 0;

  fDMBaixaProd.cdsBaixa_Parcial.Close;
  fDMBaixaProd.sdsBaixa_Parcial.ParamByName('ID').AsInteger   := fDMBaixaProd.cdsBaixa_ProcessoID.AsInteger;
  fDMBaixaProd.sdsBaixa_Parcial.ParamByName('ITEM').AsInteger := fDMBaixaProd.cdsBaixa_ProcessoITEM.AsInteger;
  fDMBaixaProd.cdsBaixa_Parcial.Open;
  fDMBaixaProd.cdsBaixa_Parcial.Last;
  vItemAux := fDMBaixaProd.cdsBaixa_ParcialITEM_PARCIAL.AsInteger;
  if fDMBaixaProd.cdsBaixa_ParcialDTSAIDA.AsDateTime > 10 then
  begin
    vDataAux := fDMBaixaProd.cdsBaixa_ParcialDTSAIDA.AsDateTime;
    vHoraAux := fDMBaixaProd.cdsBaixa_ParcialHRSAIDA.AsDateTime;
  end;

  //if (fDMBaixaProd.cdsBaixa_ProcessoDTBAIXA.IsNull) or (fDMBaixaProd.cdsBaixa_Parcial.IsEmpty) or (Tipo = 'E') then
  if (fDMBaixaProd.cdsBaixa_Parcial.IsEmpty) or (Tipo = 'E') or (fDMBaixaProd.cdsBaixa_ParcialDTSAIDA.AsDateTime > 10) then
  begin
    fDMBaixaProd.cdsBaixa_Parcial.Insert;
    fDMBaixaProd.cdsBaixa_ParcialID.AsInteger           := fDMBaixaProd.cdsBaixa_ProcessoID.AsInteger;
    fDMBaixaProd.cdsBaixa_ParcialITEM.AsInteger         := fDMBaixaProd.cdsBaixa_ProcessoITEM.AsInteger;
    fDMBaixaProd.cdsBaixa_ParcialITEM_PARCIAL.AsInteger := vItemAux + 1;
    fDMBaixaProd.cdsBaixa_ParcialID_PROCESSO.AsInteger  := fDMBaixaProd.cdsBaixa_ProcessoID_PROCESSO.AsInteger;
    if fDMBaixaProd.cdsBaixa_ProcessoDTBAIXA.AsDateTime > 10 then
    begin
      //fDMBaixaProd.cdsBaixa_ParcialDTENTRADA.AsDateTime   := fDMBaixaProd.cdsBaixa_ProcessoDTBAIXA.AsDateTime;
      //fDMBaixaProd.cdsBaixa_ParcialHRENTRADA.AsDateTime   := fDMBaixaProd.cdsBaixa_ProcessoHRBAIXA.AsDateTime;
      fDMBaixaProd.cdsBaixa_ParcialDTENTRADA.AsDateTime   := vDataAux;
      fDMBaixaProd.cdsBaixa_ParcialHRENTRADA.AsDateTime   := vHoraAux;
    end
    else
    begin
      fDMBaixaProd.cdsBaixa_ParcialDTENTRADA.AsDateTime   := fDMBaixaProd.cdsBaixa_ProcessoDTENTRADA.AsDateTime;
      fDMBaixaProd.cdsBaixa_ParcialHRENTRADA.AsDateTime   := fDMBaixaProd.cdsBaixa_ProcessoHRENTRADA.AsDateTime;
    end;
    fDMBaixaProd.cdsBaixa_ParcialDTSAIDA.Clear;
    fDMBaixaProd.cdsBaixa_ParcialHRSAIDA.Clear;
    if Tipo = 'S' then
    begin
      fDMBaixaProd.cdsBaixa_ParcialDTSAIDA.AsDateTime := Data;
      fDMBaixaProd.cdsBaixa_ParcialHRSAIDA.AsDateTime := Hora;
    end;
    fDMBaixaProd.cdsBaixa_ParcialQTD.AsFloat            := CurrencyEdit1.Value;
  end
  else
  begin
    fDMBaixaProd.cdsBaixa_Parcial.Edit;
    fDMBaixaProd.cdsBaixa_ParcialDTSAIDA.AsDateTime   := Data;
    fDMBaixaProd.cdsBaixa_ParcialHRSAIDA.AsDateTime   := Hora;
    fDMBaixaProd.cdsBaixa_ParcialQTD.AsFloat          := CurrencyEdit1.Value;
  end;
  if fDMBaixaProd.cdsBaixa_ParcialDTSAIDA.AsDateTime <= 10 then
    fDMBaixaProd.cdsBaixa_ParcialID_FUNCIONARIO_ENT.AsInteger := fDMBaixaProd.qFuncionarioCODIGO.AsInteger
  else
    fDMBaixaProd.cdsBaixa_ParcialID_FUNCIONARIO_BAIXA.AsInteger := fDMBaixaProd.qFuncionarioCODIGO.AsInteger;

  //Baixa estoque do processo do produto semi acabado   28/11/2018
  if ((fDMBaixaProd.cdsBaixa_ParcialID_PROCESSO.AsInteger = fDMBaixaProd.qParametros_LoteID_PROCESSO_SEMI_EST.AsInteger) or
     (fDMBaixaProd.qProcessoESTOQUE.AsString = 'E')or (fDMBaixaProd.qProcessoESTOQUE.AsString = 'S')) then
  begin
    if (fDMBaixaProd.qProcessoESTOQUE_DT_ES.AsString = 'E') and (fDMBaixaProd.cdsBaixa_ParcialDTSAIDA.AsDateTime < 10) then
      prc_Baixa_Estoque('S')
    else
    if (Trim(fDMBaixaProd.qProcessoESTOQUE_DT_ES.AsString) <> 'E') and (fDMBaixaProd.cdsBaixa_ParcialDTSAIDA.AsDateTime > 10) then
      prc_Baixa_Estoque('S');
  end;
  //**********************

  fDMBaixaProd.cdsBaixa_Parcial.Post;

  fDMBaixaProd.cdsBaixa_Parcial.ApplyUpdates(0);
end;

procedure TfrmProcesso_ES.CurrencyEdit3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) and (CurrencyEdit3.AsInteger > 0) then
  begin
    fDMBaixaProd.qVerProcesso.Close;
    fDMBaixaProd.qVerProcesso.ParamByName('NUM_ORDEM').AsInteger   := fDMBaixaProd.cdsBaixa_ProcessoNUM_ORDEM.AsInteger;
    if fDMBaixaProd.cdsBaixa_ProcessoID_LOTE.AsInteger > 0 then
      fDMBaixaProd.qVerProcesso.ParamByName('ID_LOTE').AsInteger     := fDMBaixaProd.cdsBaixa_ProcessoID_LOTE.AsInteger
    else
    begin
      fDMBaixaProd.qVerProcesso.ParamByName('ID_PEDIDO').AsInteger   := fDMBaixaProd.cdsBaixa_ProcessoID_PEDIDO.AsInteger;
      fDMBaixaProd.qVerProcesso.ParamByName('ITEM_PEDIDO').AsInteger := fDMBaixaProd.cdsBaixa_ProcessoITEM_PEDIDO.AsInteger;
    end;
    fDMBaixaProd.qVerProcesso.ParamByName('ID_PROCESSO').AsInteger := CurrencyEdit3.AsInteger;
    fDMBaixaProd.qVerProcesso.Open;
    if fDMBaixaProd.qVerProcesso.IsEmpty then
      MessageDlg('*** Registro não encontrado!', mtError, [mbOk], 0)
    else
    begin
      //if (fDMBaixaProd.cdsBaixa_Processo.Locate('ID_PROCESSO',CurrencyEdit3.AsInteger,[loCaseInsensitive])) then
      if (fDMBaixaProd.cdsBaixa_Processo.Locate('ITEM',fDMBaixaProd.qVerProcessoITEM.AsInteger,[loCaseInsensitive])) then
      begin
        RxDBLookupCombo1.ClearValue;
        CurrencyEdit1.Clear;
        if (StrToFloat(FormatFloat('0.0000',fDMBaixaProd.cdsBaixa_ProcessoQTD_LIBERADA.AsFloat)) <= 0) and (trim(fDMBaixaProd.cdsBaixa_ProcessoAJUSTE.AsString) <> 'S')
         and (trim(fDMBaixaProd.cdsBaixa_ProcessoRETRABALHO.AsString) <> 'S') then
          MessageDlg('*** Não existe quantidade liberada!', mtError, [mbOk], 0)
        else
        begin
          RxDBLookupCombo1.KeyValue := fDMBaixaProd.cdsBaixa_ProcessoID_PROCESSO.AsInteger;
          if ((fDMBaixaProd.cdsBaixa_ProcessoAJUSTE.AsString = 'S') OR (fDMBaixaProd.cdsBaixa_ProcessoRETRABALHO.AsString = 'S')) and (StrToFloat(FormatFloat('0.0000',fDMBaixaProd.cdsBaixa_ProcessoQTD_LIBERADA.AsFloat)) <= 0) then
            CurrencyEdit1.Value := fDMBaixaProd.cdsBaixa_ProcessoQTD.AsFloat
          else
            CurrencyEdit1.Value := fDMBaixaProd.cdsBaixa_ProcessoQTD_LIBERADA.AsFloat;
          CurrencyEdit1.SetFocus;
        end;
      end;
    end;
  end;
end;

procedure TfrmProcesso_ES.prc_Monta_Processo;
var
  vBaixaAnt : Boolean;
begin
  vBaixaAnt := False;
  vIDPosiciona := 0;
  vIDProcesso  := 0;
  vItem_BaixaProcesso := 0;
  fDMBaixaProd.cdsBaixa_Processo.First;
  vItemPrimeiro       := fDMBaixaProd.cdsBaixa_ProcessoITEM.AsInteger;
  while not fDMBaixaProd.cdsBaixa_Processo.Eof do
  begin
    if (fDMBaixaProd.cdsBaixa_ProcessoDTENTRADA.IsNull) and (vIDPosiciona <= 0) then
    begin
      vIDPosiciona        := fDMBaixaProd.cdsBaixa_ProcessoID_PROCESSO.AsInteger;
      vItem_BaixaProcesso := fDMBaixaProd.cdsBaixa_ProcessoITEM.AsInteger;
      vIDProcesso         := fDMBaixaProd.cdsBaixa_ProcessoID_PROCESSO.AsInteger;
    end
    else
    if (fDMBaixaProd.cdsBaixa_ProcessoDTENTRADA.AsDateTime > 10) and (fDMBaixaProd.cdsBaixa_ProcessoDTBAIXA.IsNull) and (vIDPosiciona <= 0) then
    begin
      vIDPosiciona        := fDMBaixaProd.cdsBaixa_ProcessoID_PROCESSO.AsInteger;
      vItem_BaixaProcesso := fDMBaixaProd.cdsBaixa_ProcessoITEM.AsInteger;
      vIDProcesso         := fDMBaixaProd.cdsBaixa_ProcessoID_PROCESSO.AsInteger;
    end
    else
    if (vIDPosiciona > 0) and (StrToFloat(FormatFloat('0.0000',fDMBaixaProd.cdsBaixa_ProcessoQTD_LIBERADA.AsFloat)) > 0) then
      vIDProcesso := 0;
    if (fDMBaixaProd.cdsBaixa_ProcessoDTBAIXA.AsDateTime > 10) and (vIDPosiciona <= 0) then
      vBaixaAnt := True
    else
    if (vBaixaAnt) and (vIDPosiciona <= 0) then
      vBaixaAnt := False;
    fDMBaixaProd.cdsBaixa_Processo.Next;
  end;
  if vIDPosiciona <= 0 then
  begin
    if vLote > 0 then
      vMSGLocal := vMSGLocal + #13 + '*** Lote ' + IntToStr(vLote) + ' Esta com os talões baixados!'
    else
      vMSGLocal := vMSGLocal + #13 + '*** Pedido ' + IntToStr(vNumPedido_Loc) + ' Esta com os talões baixados!' ;
    exit;
  end;
  //fDMBaixaProd.cdsBaixa_Processo.Locate('ID_PROCESSO',vIDPosiciona,[loCaseInsensitive]);
  fDMBaixaProd.cdsBaixa_Processo.Locate('ITEM',vItem_BaixaProcesso,[loCaseInsensitive]);
  if vIDPosiciona > 0 then
  begin
    if vIDProcesso <= 0 then
    begin
      RxDBLookupCombo1.ClearValue;
      CurrencyEdit3.Clear;
    end
    else
    begin
      RxDBLookupCombo1.KeyValue := vIDPosiciona;
      CurrencyEdit3.AsInteger   := vIDPosiciona;
      //08/08/2018  Foi incluida a quantidade liberada
      //CurrencyEdit1.Value       := fDMBaixaProd.cdsBaixa_ProcessoQTD.AsFloat;
      if (vItemPrimeiro = vItem_BaixaProcesso) and (StrToFloat(FormatFloat('0.0000',fDMBaixaProd.cdsBaixa_ProcessoQTD_LIBERADA.AsFloat)) <= 0) then
        CurrencyEdit1.Value := fDMBaixaProd.cdsBaixa_ProcessoQTD_PENDENTE.AsFloat
      else
      if ((fDMBaixaProd.cdsBaixa_ProcessoAJUSTE.AsString = 'S') or (fDMBaixaProd.cdsBaixa_ProcessoRETRABALHO.AsString = 'S')) and (StrToFloat(FormatFloat('0.0000',fDMBaixaProd.cdsBaixa_ProcessoQTD_LIBERADA.AsFloat)) <= 0) then
        CurrencyEdit1.Value := fDMBaixaProd.cdsBaixa_ProcessoQTD_PENDENTE.AsFloat
      else
      if (vBaixaAnt) and (StrToFloat(FormatFloat('0.0000',fDMBaixaProd.cdsBaixa_ProcessoQTD_LIBERADA.AsFloat)) <= 0) then
        CurrencyEdit1.Value := fDMBaixaProd.cdsBaixa_ProcessoQTD_PENDENTE.AsFloat
      else
        CurrencyEdit1.Value := fDMBaixaProd.cdsBaixa_ProcessoQTD_LIBERADA.AsFloat;
    end;
  end;
  vRef_Loc       := fDMBaixaProd.cdsLoteREFERENCIA.AsString;
  vNome_Comb_Loc := fDMBaixaProd.cdsLoteNOME_COMBINACAO.AsString;
  vNome_Prod_Loc := fDMBaixaProd.cdsLoteNOME.AsString;
end;

procedure TfrmProcesso_ES.prc_Consulta_ConsBaixaEtiq;
begin
  fDMBaixaProd.cdsConsBaixaEtiq.Close;
  if DateEdit1.Date > 10 then
    fDMBaixaProd.sdsConsBaixaEtiq.ParamByName('DATA').AsDate := DateEdit1.Date
  else
    fDMBaixaProd.sdsConsBaixaEtiq.ParamByName('DATA').AsDate := Date;
  fDMBaixaProd.cdsConsBaixaEtiq.Open;
  Label12.Caption := 'Total Lidas: ' + IntToStr(fDMBaixaProd.cdsConsBaixaEtiq.RecordCount);
end;

procedure TfrmProcesso_ES.NxButton1Click(Sender: TObject);
begin
  prc_Consulta_ConsBaixaEtiq;
end;

procedure TfrmProcesso_ES.prc_Baixa_Estoque(Tipo : String); //P= Produto   S=Semi Acabado
var
  fDMEstoque_Res: TDMEstoque_Res;
  fDMEstoque: TDMEstoque;
  vID_MovEstoque_Res: Integer;
  vID_MovEstoque: Integer;
  vID_Cor : Integer;
  vQtd : Real;
  vES : String;
  vLote_Controle : String;
  vPreco : Real;
  vGeraCusto : String;
begin
  vES             := 'S';
  vID_MovEstoque  := 0;
  vLote_Controle  := fDMBaixaProd.cdsLoteNUM_LOTE_CONTROLE.AsString;
  vPreco          := 0;
  vGeraCusto      := 'N';
  fDMEstoque_Res  := TDMEstoque_Res.Create(Self);
  fDMEstoque      := TDMEstoque.Create(Self);
  vID_Cor         := fDMBaixaProd.cdsLoteID_COMBINACAO.AsInteger;
  vQtd            := StrToFloat(FormatFloat('0.0000',fDMBaixaProd.cdsBaixa_ProcessoQTD.AsFloat));
  if (Tipo = 'S') or (fDMBaixaProd.cdsLoteTIPO_LOTE_ESTOQUE.AsString = 'S') then
  begin
    if (Tipo = 'S') then
    begin
      vES := 'E';
      if fDMBaixaProd.qProcessoESTOQUE.AsString = 'S' then
        vES := 'S';

      vQtd := StrToFloat(FormatFloat('0.0000',fDMBaixaProd.cdsBaixa_ParcialQTD.AsFloat));
      fDMBaixaProd.qProd.Close;
      fDMBaixaProd.qProd.ParamByName('ID').AsInteger := fDMBaixaProd.cdsLoteID_PRODUTO.AsInteger;
      fDMBaixaProd.qProd.Open;
      if (StrToFloat(FormatFloat('0.00000',vPreco)) > 0) then
        vPreco := StrToFloat(FormatFloat('0.00000',fDMBaixaProd.qProdPRECO_CUSTO.AsFloat));
      vGeraCusto := 'N';
      if vES = 'E' then
        vGeraCusto := 'S';
    end;
    vLote_Controle := '';
    if (fDMBaixaProd.cdsLoteID_COMBINACAO.AsInteger <= 0) or (fDMBaixaProd.qProcessoESTOQUE_CRU.AsString = 'S') then
      vID_Cor := StrToInt(FormatFloat('0',fDMBaixaProd.qParametros_LoteID_COR_CRU.AsInteger));
  end;
  //else
  //if fDMBaixaProd.cdsLoteID_COMBINACAO.AsInteger > 0 then

  vID_MovEstoque_Res := 0;
  if Tipo = 'P' then
  begin
    vID_MovEstoque_Res := fDMEstoque_Res.fnc_Gravar_Estoque_Res(0,
                                                                fDMBaixaProd.cdsLoteFILIAL.AsInteger,
                                                                fDMBaixaProd.cdsLoteID_PRODUTO.AsInteger,
                                                                vID_Cor,
                                                                fDMBaixaProd.cdsLoteNUM_LOTE.AsInteger,
                                                                '',
                                                                vES,
                                                                'LOT',
                                                                vQtd,
                                                                Date,
                                                                vLote_Controle);
  end;

  if (fDMBaixaProd.cdsLoteTIPO_LOTE_ESTOQUE.IsNull) or (trim(fDMBaixaProd.cdsLoteTIPO_LOTE_ESTOQUE.AsString) <> 'S') then
  begin
    vID_MovEstoque := fDMEstoque.fnc_Gravar_Estoque(0,
                                                    fDMBaixaProd.cdsLoteFILIAL.AsInteger,
                                                    1,
                                                    fDMBaixaProd.cdsLoteID_PRODUTO.AsInteger,
                                                    fDMBaixaProd.cdsLoteNUM_LOTE.AsInteger, // Numero nota
                                                    0, // Cliente
                                                    0, // CFOP
                                                    0, // ID nota fiscal
                                                    0,
                                                    vES, //Tipo Nota
                                                    'LOT',
                                                    fDMBaixaProd.cdsLoteUNIDADE.AsString,
                                                    fDMBaixaProd.cdsLoteUNIDADE.AsString,
                                                    '', //serie
                                                    '', //Tamanho
                                                    Date,
                                                    vPreco,
                                                    vQtd,
                                                    0, //%ICMS
                                                    0, //%IPI
                                                    0, //Desconto
                                                    0, //% Trib ICMS
                                                    0, //Valor Frete
                                                    vQtd,
                                                    0,
                                                    0, //Desconto
                                                    0,
                                                    fDMBaixaProd.cdsLoteUNIDADE.AsString,
                                                    vID_Cor, // Cor
                                                    vLote_Controle,
                                                    vGeraCusto,
                                                    vPreco,0); //ver aqui sobre Lote Controle  04/11/2015
  end;

  if Tipo = 'P' then
  begin
    fDMBaixaProd.cdsBaixa_ProcessoID_MOVESTOQUE_RES.AsInteger := vID_MovEstoque_Res;
    fDMBaixaProd.cdsBaixa_ProcessoID_MOVESTOQUE.AsInteger     := vID_MovEstoque;
  end
  else
    fDMBaixaProd.cdsBaixa_ParcialID_ESTOQUE.AsInteger := vID_MovEstoque; 
end;

end.
