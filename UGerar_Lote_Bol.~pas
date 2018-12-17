unit UGerar_Lote_Bol;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, UDMCadLote_Calc, StdCtrls,DB, dbXPress,
  SqlExpr, RzTabs, CurrEdit, Mask, ToolEdit, RxLookup, Menus, UCBase, ExtCtrls, NxCollection, NxEdit, DBVGrids, RzPanel, Grids,
  DBGrids, SMDBGrid, ComCtrls;

type
  TfrmGerar_Lote_Bol = class(TForm)
    RzPageControl2: TRzPageControl;
    TS_Gerar: TRzTabSheet;
    TS_Consulta: TRzTabSheet;
    PopupMenu1: TPopupMenu;
    Lote1: TMenuItem;
    Panel2: TPanel;
    btnExcluir: TNxButton;
    pnlPesquisa: TPanel;
    NxLabel3: TNxLabel;
    NxLabel4: TNxLabel;
    NxLabel5: TNxLabel;
    NxLabel6: TNxLabel;
    NxLabel7: TNxLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    cbxOpcao: TNxComboBox;
    RxDBLookupCombo1: TRxDBLookupCombo;
    cbxOpcaoData: TNxComboBox;
    btnConsultar: TNxButton;
    NxLabel2: TNxLabel;
    btnImprimir: TNxButton;
    SMDBGrid2: TSMDBGrid;
    UCControls1: TUCControls;
    TS_Pedidos: TRzTabSheet;
    Panel5: TPanel;
    btnConsultar_Pedidos_Ord: TNxButton;
    NxLabel15: TNxLabel;
    CurrencyEdit7: TCurrencyEdit;
    SMDBGrid4: TSMDBGrid;
    NxPanel1: TNxPanel;
    PopupMenu3: TPopupMenu;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    ProgressBar1: TProgressBar;
    GroupBox2: TGroupBox;
    SMDBGrid5: TSMDBGrid;
    StaticText2: TStaticText;
    Panel1: TPanel;
    btnConfirmar: TNxButton;
    NxFlipPanel1: TNxFlipPanel;
    Label6: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label7: TLabel;
    DateEdit6: TDateEdit;
    DateEdit8: TDateEdit;
    Edit5: TEdit;
    DateEdit9: TDateEdit;
    DateEdit7: TDateEdit;
    ckFaturado: TNxCheckBox;
    btnConsultar_Pedidos: TNxButton;
    NxFlipPanel2: TNxFlipPanel;
    Label17: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    Shape4: TShape;
    Label13: TLabel;
    gbxCarimbo: TRzGroupBox;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    edtObs: TEdit;
    DateEdit3: TDateEdit;
    edtRemessa: TEdit;
    ckDtEntrega: TCheckBox;
    ckAgrupar_Pedido: TCheckBox;
    ckAgrupar_Prod: TCheckBox;
    ckAgrupar_cli: TCheckBox;
    ProgressBar2: TProgressBar;
    ProgressBar3: TProgressBar;
    ProgressBar4: TProgressBar;
    ProgressBar5: TProgressBar;
    ProgressBar6: TProgressBar;
    Label1: TLabel;
    ckdiv12: TCheckBox;
    edtRemessaCons: TEdit;
    Label3: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    NxCheckBox1: TNxCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsultar_PedidosClick(Sender: TObject);
    procedure ckDtEntregaClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure RxDBLookupCombo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Lote1Click(Sender: TObject);
    procedure SMDBGrid2TitleClick(Column: TColumn);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure RzPageControl2Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure btnConsultar_Pedidos_OrdClick(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure SMDBGrid5GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NxComboBox1Change(Sender: TObject);
    procedure SMDBGrid5DblClick(Sender: TObject);
    procedure SMDBGrid5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SMDBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    fDMCadLote_Calc: TDMCadLote_Calc;
    vNumLote: Integer;
    vNumOrdem: Integer;
    vNumRemessa: String;
    vNumPedido: Integer;
    vQtd_Produto: Real;
    vQtd_Selecionada: Real;
    vQtdT: Integer;
    vID_Acum: Integer;
    vContBolsa : Integer;

    procedure prc_Consultar_Ped;
    procedure prc_Gerar_mAcum;
    procedure prc_Gravar_Lote;
    procedure prc_Gravar_Talao(Qtd: Integer);

    procedure prc_Consultar_Lote;
    procedure prc_Le_mLote;

    function fnc_Existe_Remessa: Boolean;

    procedure prc_Limpar_Auxiliar;
    procedure prc_Limpar_Var;

    procedure prc_Consultar_Pedido_Ord;

    procedure prc_Marcar_Desmarcar_PED(Tipo: String); //P=Pedido   TM=Total marcar    TD=Total Desmarcar

    procedure prc_Le_cdsPendente(ID, ITEM_ORIGINAL: Integer);

    procedure prc_Le_Original(ID: Integer);

  public
    { Public declarations }
  end;

var
  frmGerar_Lote_Bol: TfrmGerar_Lote_Bol;

implementation

uses rsDBUtils, DmdDatabase, uUtilPadrao, USel_Produto, UMenu,
  UDMLoteImp, URelLote2, URelLote_Res, UMostraItens_Ped, UConsPedLote;

{$R *.dfm}

procedure TfrmGerar_Lote_Bol.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  fDMCadLote_Calc.mAcum_Ped.MasterSource := fDMCadLote_Calc.dsmAcum_Tam;
  Action := Cafree;
end;

procedure TfrmGerar_Lote_Bol.FormShow(Sender: TObject);
var
  i: Integer;
begin
  fDMCadLote_Calc := TDMCadLote_Calc.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMCadLote_Calc);
  DateEdit3.Date := Date;
  fDMCadLote_Calc.qUltRemessa.Close;
  fDMCadLote_Calc.qUltRemessa.Open;
  edtRemessaCons.Text := fDMCadLote_Calc.qUltRemessaNUM_REMESSA.AsString;

  fDMCadLote_Calc.mAcum_Ped.MasterSource := fDMCadLote_Calc.dsmAcum;

  ckFaturado.Visible := (fDMCadLote_Calc.qParametros_LoteLOTE_POR_PEDIDO.AsString <> 'S');
  NxFlipPanel1.Expanded := False;
  NxFlipPanel2.Expanded := True;

  if fDMCadLote_Calc.qParametros_LoteQTD_DIV_LOTE.AsInteger > 0 then
    ckdiv12.Caption := 'Dividir por ' + fDMCadLote_Calc.qParametros_LoteQTD_DIV_LOTE.AsString
  else
  begin
    ckdiv12.Visible := False;
    ckdiv12.Checked := False;
  end;
end;

procedure TfrmGerar_Lote_Bol.btnConsultar_PedidosClick(Sender: TObject);
begin
  prc_Consultar_Ped;
end;

procedure TfrmGerar_Lote_Bol.ckDtEntregaClick(Sender: TObject);
begin
  Label2.Visible    := not(ckDtEntrega.Checked);
  DateEdit3.Visible := not(ckDtEntrega.Checked);
end;

procedure TfrmGerar_Lote_Bol.btnConsultarClick(Sender: TObject);
begin
  SMDBGrid2.DisableScroll;
  ProgressBar1.Visible := True;
  fDMCadLote_Calc.mLote.IndexFieldNames := 'Num_Remessa;Num_Lote;Num_Talao';
  prc_Consultar_Lote;
  fDMCadLote_Calc.qParametros.Close;
  fDMCadLote_Calc.qParametros.Open;
  ProgressBar1.Max := fDMCadLote_Calc.cdsLote_Bol.RecordCount;
  SMDBGrid2.EnableScroll;
  ProgressBar1.Visible := False;
end;

procedure TfrmGerar_Lote_Bol.prc_Consultar_Lote;
var
  vComando: String;
  vDescData: String;
begin
  case cbxOpcaoData.ItemIndex of
    0: vDescData := 'L.DTEMISSAO';
    1: vDescData := 'L.DTENTREGA';
  end;
  fDMCadLote_Calc.cdsLote_Bol.Close;

  vComando := 'SELECT AUX.*, P.PEDIDO_CLIENTE, CLI.NOME NOME_CLIENTE '
            + 'FROM ( '
            + 'select l.num_remessa, t.num_talao, l.num_lote, t.qtd, PC.FOTO, L.obs, L.obs_ped, '
            + 'l.dtentrega, T.referencia, L.id_produto, PC.nome NOME_COMBINACAO, '
            + '(select first 1 TP.ID_PEDIDO  from talao_ped tp where t.id = tp.id and t.num_talao = tp.num_talao ) ID_PEDIDO, '
            + 'PC.obsmaterial, (SELECT MAX(NUM_LOTE) NUM_LOTE_MAX FROM LOTE L2 WHERE L2.NUM_REMESSA = L.NUM_REMESSA), '
            + 'PROD.UNIDADE, L.filial, L.dtemissao, L.NUM_ORDEM, L.SELECIONADO, L.ID_COMBINACAO, L.ID ID_LOTE '
            + 'from lote l '
            + 'inner join talao t '
            + 'on l.id = t.id '
            + 'inner JOIN PRODUTO_COMB PC '
            + 'ON T.id_produto = PC.id '
            + 'AND T.id_combinacao = PC.id_cor_combinacao '
            + 'INNER JOIN PRODUTO PROD '
            + 'ON L.ID_PRODUTO = PROD.ID '
            + ' WHERE 0 = 0 ';

  //fDMCadLote_Calc.sdsLote_Bol.CommandText := fDMCadLote_Calc.ctLote_Bol + ' WHERE 0 = 0 ';
  //vComando := '';
  if CurrencyEdit1.AsInteger > 0 then
    vComando :=  vComando + ' AND L.NUM_LOTE >= ' + CurrencyEdit1.Text;
  if CurrencyEdit2.AsInteger > 0 then
    vComando :=  vComando + ' AND L.NUM_LOTE <= ' + CurrencyEdit2.Text;
  if trim(edtRemessaCons.Text) <> '' then
  begin
    if NxCheckBox1.Checked then
      vComando :=  vComando + ' AND ((L.NUM_REMESSA = ' + QuotedStr(edtRemessaCons.Text) + ') OR (L.NUM_REMESSA = ' + QuotedStr(edtRemessaCons.Text + '.CART') + '))'
    else
      vComando :=  vComando + ' AND L.NUM_REMESSA = ' + QuotedStr(edtRemessaCons.Text);
  end;
  if DateEdit1.Date > 10 then
    vComando := vComando + ' AND ' + vDescData + ' >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    vComando := vComando + ' AND ' + vDescData + ' <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  {case cbxOpcao.ItemIndex of
    0: vComando := vComando + ' AND T.QTD_PENDENTE > 0';
    1: vComando := vComando + ' AND T.QTD_PRODUZIDO > 0';
  end;}
  if RxDBLookupCombo1.Text <> '' then
    vComando := vComando + ' AND T.ID_PRODUTO = ' + IntToStr(RxDBLookupCombo1.KeyValue);
  vComando := vComando + ') AUX '
            + 'inner join  pedido p '
            + 'on p.id = AUX.id_pedido '
            + 'INNER JOIN PESSOA CLI '
            + 'ON P.ID_CLIENTE = CLI.CODIGO ';
  fDMCadLote_Calc.sdsLote_Bol.CommandText := vComando;
  fDMCadLote_Calc.cdsLote_Bol.Open;
  fDMCadLote_Calc.cdsLote_Bol.IndexFieldNames := 'NUM_REMESSA;NUM_LOTE;NUM_TALAO;ID_PRODUTO';
end;

procedure TfrmGerar_Lote_Bol.RxDBLookupCombo1Enter(Sender: TObject);
begin
  fDMCadLote_Calc.cdsProduto.IndexFieldNames := 'REFERENCIA';
end;

procedure TfrmGerar_Lote_Bol.RxDBLookupCombo1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    if RxDBLookupCombo1.Text <> '' then
      vCodProduto_Pos := RxDBLookupCombo1.KeyValue;
    frmSel_Produto  := TfrmSel_Produto.Create(Self);
    frmSel_Produto.ShowModal;
    if vCodProduto_Pos > 0 then
      RxDBLookupCombo1.KeyValue := vCodProduto_Pos;
  end;
end;

procedure TfrmGerar_Lote_Bol.Lote1Click(Sender: TObject);
var
  vArq : String;
begin
  SMDBGrid2.DisableScroll;

  fDMCadLote_Calc.cdsLote_Bol.First;
  while not fDMCadLote_Calc.cdsLote_Bol.Eof do
  begin
    fDMCadLote_Calc.cdsLote_Bol.Edit;
    if SMDBGrid2.SelectedRows.CurrentRowSelected then
      fDMCadLote_Calc.cdsLote_BolSELECIONADO.AsString := 'S'
    else
      fDMCadLote_Calc.cdsLote_BolSELECIONADO.AsString := 'N';
    fDMCadLote_Calc.cdsLote_Bol.Next;
  end;

  fDMCadLote_Calc.cdsLote_Bol.Filtered := False;
  fDMCadLote_Calc.cdsLote_Bol.Filter   := 'SELECIONADO = ' + QuotedStr('S');
  fDMCadLote_Calc.cdsLote_Bol.Filtered := True;

  if fDMCadLote_Calc.cdsLote_Bol.IsEmpty then
    exit;

  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Talao_Sagga.fr3';
  if not (FileExists(vArq)) then
  begin
    MessageDlg('*** Relatório não localizado: ' + vArq , mtInformation, [mbOk], 0);
    exit;
  end;

  fDMCadLote_Calc.frxReport1.Report.LoadFromFile(vArq);
  fDMCadLote_Calc.frxReport1.ShowReport;
  
  SMDBGrid2.EnableScroll;

  fDMCadLote_Calc.cdsLote_Bol.Filtered := False;
end;

procedure TfrmGerar_Lote_Bol.prc_Limpar_Auxiliar;
begin
  fDMCadLote_Calc.mLote.First;
  while not fDMCadLote_Calc.mLote.eof do
  begin
    fDMCadLote_Calc.mTalao.First;
    while not fDMCadLote_Calc.mTalao.Eof do
      fDMCadLote_Calc.mTalao.Delete;
    fDMCadLote_Calc.mLote.Delete;
  end;
end;

procedure TfrmGerar_Lote_Bol.SMDBGrid2TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  if Column.FieldName = 'Num_Remessa' then
    fDMCadLote_Calc.mLote.IndexFieldNames := Column.FieldName + ';Num_Lote;Num_Talao'
  else
  if Column.FieldName = 'Num_Lote' then
    fDMCadLote_Calc.mLote.IndexFieldNames := Column.FieldName + ';Num_Talao'
  else
    fDMCadLote_Calc.mLote.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid2.Columns.Count - 1 do
    if not (SMDBGrid2.Columns.Items[I] = Column) then
      SMDBGrid2.Columns.Items[I].Title.Color := clBtnFace;
end;

procedure TfrmGerar_Lote_Bol.btnConfirmarClick(Sender: TObject);
var
  ID: TTransactionDesc;
  sds: TSQLDataSet;
  vID_Ant: Integer;
  vFlag: Boolean;
  vQtdAux: Integer;
  vQtdTotal: Integer;
  vRemPrim : String;
begin
  if MessageDlg('Gerar Lote/Talões?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  if not(ckDtEntrega.Checked) and (DateEdit3.Date < 10) then
  begin
    MessageDlg('*** Data de entrega do Lote/Talão não informada!', mtError, [mbOk], 0);
    exit;
  end;

  if trim(edtRemessa.Text) = '' then
  begin
    MessageDlg('*** Remessa não informada!', mtError, [mbOk], 0);
    exit;
  end;

  if (ComboBox1.ItemIndex = 1) and (trim(Edit1.Text) = '') then
  begin
    if MessageDlg('Confirma a geração do Lote sem Carimbo?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      exit;
  end;
  if fDMCadLote_Calc.qParametros_LoteLOTE_TEXTIL.AsString = 'S' then
  begin
    MessageDlg('*** Quando o campo LOTE_TEXTIL estiver marcado, não pode ser usado esse form!', mtInformation, [mbOk], 0);
    exit;
  end;

  if fnc_Existe_Remessa then
    exit;

  vRemPrim := edtRemessa.Text;  

  ProgressBar2.Visible := True;
  ProgressBar3.Visible := True;
  ProgressBar4.Visible := True;
  ProgressBar5.Visible := True;
  ProgressBar6.Visible := True;

  fDMCadLote_Calc.cdsSetor_Talao.Close;
  fDMCadLote_Calc.cdsSetor_Talao.Open;

  vNumLote    := 0;
  vNumOrdem   := 0;
  vID_Acum    := 0;
  vNumRemessa := '';
  vContBolsa  := 0;
  sds := TSQLDataSet.Create(nil);
  ID.TransactionID  := 1;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText := ' UPDATE TABELALOC SET FLAG = 1 WHERE TABELA = ' + QuotedStr('LOTE');
    sds.ExecSQL();
    fDMCadLote_Calc.prc_Localizar(-1);

    vNumRemessa := edtRemessa.Text;
    while vContBolsa <= 1 do
    begin
      vContBolsa := vContBolsa + 1;
      if vContBolsa = 2 then
      begin
        vNumRemessa := edtRemessa.Text + '.CART';
        vNumLote    := 0;
        vNumOrdem   := 0;
        vID_Acum    := 0;
      end;
      fDMCadLote_Calc.mAcum.First;
      while not fDMCadLote_Calc.mAcum.Eof do
      begin
        fDMCadLote_Calc.mAcum_Tam.First;
        while not fDMCadLote_Calc.mAcum_Tam.Eof do
        begin
          fDMCadLote_Calc.mAcum_Ped.First;
          while not fDMCadLote_Calc.mAcum_Ped.Eof do
            fDMCadLote_Calc.mAcum_Ped.Delete;
          fDMCadLote_Calc.mAcum_Tam.Delete;
        end;
        fDMCadLote_Calc.mAcum_Ped.First;
        while not fDMCadLote_Calc.mAcum_Ped.Eof do
          fDMCadLote_Calc.mAcum_Ped.Delete;
        fDMCadLote_Calc.mAcum.Delete;
      end;
      vNumPedido := 0;
      ProgressBar2.Max      := fDMCadLote_Calc.cdsPendente_Ped.RecordCount;
      ProgressBar2.Position := 0;
      fDMCadLote_Calc.cdsPendente_Ped.First;
      while not fDMCadLote_Calc.cdsPendente_Ped.Eof do
      begin
        ProgressBar2.Position := ProgressBar2.Position + 1;
        if fDMCadLote_Calc.cdsPendente_PedSELECIONADO.AsString = 'S' then
          prc_Le_Original(fDMCadLote_Calc.cdsPendente_PedID.AsInteger);
        fDMCadLote_Calc.cdsPendente_Ped.Next;
      end;
      ProgressBar6.Max      := fDMCadLote_Calc.mAcum.RecordCount;
      ProgressBar6.Position := 0;
      vID_Ant := 0;
      fDMCadLote_Calc.mAcum.First;
      while not fDMCadLote_Calc.mAcum.Eof do
      begin
        ProgressBar6.Position := ProgressBar6.Position + 1;
        if vID_Ant <> fDMCadLote_Calc.mAcumID.AsInteger then
          prc_Gravar_Lote;
          vQtdTotal := fDMCadLote_Calc.mAcumQtd.AsInteger;
          vFlag := False;
          while not vFlag do
          begin
            vQtdAux := vQtdTotal;
            if (fDMCadLote_Calc.qParametros_LoteQTD_DIV_LOTE.AsInteger > 0) and (ckdiv12.Checked) then
            begin
              if vQtdTotal > fDMCadLote_Calc.qParametros_LoteQTD_DIV_LOTE.AsInteger then
                vQtdAux := fDMCadLote_Calc.qParametros_LoteQTD_DIV_LOTE.AsInteger;
            end;
            vQtdTotal := vQtdTotal - vQtdAux;
            prc_Gravar_Talao(vQtdAux);
            if vQtdTotal <= 0 then
              vFlag := True;
          end;
        vID_Ant := fDMCadLote_Calc.mAcumID.AsInteger;
        fDMCadLote_Calc.mAcum.Next;
      end;
      if not fDMCadLote_Calc.cdsLote.IsEmpty then
      begin
        ProgressBar3.Max      := fDMCadLote_Calc.cdsLote.RecordCount;
        ProgressBar3.Position := 0;
        fDMCadLote_Calc.cdsLote.First;
        while not fDMCadLote_Calc.cdsLote.Eof do
        begin
          ProgressBar3.Position := ProgressBar3.Position + 1;
          fDMCadLote_Calc.cdsLote.Next;
        end;
        fDMCadLote_Calc.cdsLote.ApplyUpdates(0);
        if vContBolsa = 2 then
        begin
          MessageDlg('*** Lotes/Talões Gerados!', mtInformation, [mbok], 0);
          dmDatabase.scoDados.Commit(ID);
        end;
        prc_Limpar_Var;
        //edtRemessaCons.Text := vNumRemessa;
        //edtRemessaCons.Text := edtRemessa.Text;
        edtRemessaCons.Text := vRemPrim;
        if vContBolsa = 2 then
        begin
          RzPageControl2.ActivePage := TS_Consulta;
          btnConsultarClick(Sender);
        end;
      end
      else
      begin
        MessageDlg('*** Nenhum pedido selecionado!' +  fDMCadLote_Calc.cdsLoteNUM_LOTE.AsString, mtInformation, [mbok], 0);
        vContBolsa := 10;
        dmDatabase.scoDados.Rollback(ID);
      end;
    end;

  except
    dmDatabase.scoDados.Rollback(ID);
    raise;
  end;
  FreeAndNil(sds);
  ProgressBar2.Visible := False;
  ProgressBar3.Visible := False;
  ProgressBar4.Visible := False;
  ProgressBar5.Visible := False;
  ProgressBar6.Visible := False;
end;

procedure TfrmGerar_Lote_Bol.prc_Limpar_Var;
begin
  CurrencyEdit1.Clear;
  CurrencyEdit2.Clear;
  edtRemessaCons.Clear;
  DateEdit1.Clear;
  DateEdit2.Clear;
  cbxOpcao.ItemIndex := 0;
  RxDBLookupCombo1.ClearValue;
end;

procedure TfrmGerar_Lote_Bol.btnExcluirClick(Sender: TObject);
var
  vNumRemessaAux: String;
  sds: TSQLDataSet;
begin
  if MessageDlg('Deseja excluir os Lotes/Talões selecionados?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  vNumRemessaAux := InputBox('Exclusão dos Lotes/Talões','Informe o número do controle: ', '');
  //vNumOrdemAux := Monta_Numero(vNumOrdemAux,0);
  if (trim(vNumRemessaAux) = '') then
    exit;

  fDMCadLote_Calc.qVerificaExclusao3.Close;
  fDMCadLote_Calc.qVerificaExclusao3.ParamByName('NUM_REMESSA').AsString := vNumRemessaAux;
  fDMCadLote_Calc.qVerificaExclusao3.Open;
  if fDMCadLote_Calc.qVerificaExclusao3CONTADOR.AsInteger > 0 then
  begin
    MessageDlg('*** Existe Lote/Talão baixado, exclusão cancelada!', mtError, [mbOk], 0);
    exit;
  end;
  fDMCadLote_Calc.qVerificaExclusao3.Close;
  fDMCadLote_Calc.qVerificaExclusao3.ParamByName('NUM_REMESSA').AsString := vNumRemessaAux + '.CART';
  fDMCadLote_Calc.qVerificaExclusao3.Open;
  if fDMCadLote_Calc.qVerificaExclusao3CONTADOR.AsInteger > 0 then
  begin
    MessageDlg('*** Existe Lote/Talão baixado (CARTEIRA), exclusão cancelada!', mtError, [mbOk], 0);
    exit;
  end;

  sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  sds.NoMetadata    := True;
  sds.GetMetadata   := False;
  try
    sds.CommandText   := ' DELETE FROM LOTE  '
                     + ' WHERE ((NUM_REMESSA = ' + QuotedStr(vNumRemessaAux) + ') OR (NUM_REMESSA = ' + QuotedStr(vNumRemessaAux + '.CART') + '))';
    sds.ExecSQL();

    MessageDlg('*** Nº REMESSA  ' + vNumRemessaAux + ' excluído!', mtInformation, [mbok], 0);

  finally
    FreeAndNil(sds);
    btnConsultarClick(Sender);
  end;
end;

procedure TfrmGerar_Lote_Bol.RzPageControl2Change(Sender: TObject);
begin
  if RzPageControl2.ActivePage = TS_Gerar then
    btnConsultar_PedidosClick(Sender)
  else
  if RzPageControl2.ActivePage = TS_Consulta then
  begin
    fDMCadLote_Calc.qUltRemessa.Close;
    fDMCadLote_Calc.qUltRemessa.Open;
    if trim(edtRemessaCons.Text) = '' then
      edtRemessaCons.Text := fDMCadLote_Calc.qUltRemessaNUM_REMESSA.AsString;
  end;
end;

procedure TfrmGerar_Lote_Bol.prc_Le_mLote;
begin
  fDMCadLote_Calc.mLote.First;
  while not fDMCadLote_Calc.mLote.Eof do
  begin
    if SMDBGrid2.SelectedRows.CurrentRowSelected then
    begin
      fDMCadLote_Calc.mLote.Edit;
      fDMCadLote_Calc.mLoteSelecionado.AsString := 'S';
      fDMCadLote_Calc.mLote.Post;
    end
    else
    begin
      fDMCadLote_Calc.mLote.Edit;
      fDMCadLote_Calc.mLoteSelecionado.AsString := 'N';
      fDMCadLote_Calc.mLote.Post;
    end;
    fDMCadLote_Calc.mLote.Next;
  end;
  fDMCadLote_Calc.mLote.First;
end;

procedure TfrmGerar_Lote_Bol.ComboBox1Change(Sender: TObject);
begin
  Edit1.Visible := (ComboBox1.ItemIndex = 1);
end;

procedure TfrmGerar_Lote_Bol.btnConsultar_Pedidos_OrdClick(
  Sender: TObject);
begin
  prc_Consultar_Pedido_Ord;
end;

procedure TfrmGerar_Lote_Bol.prc_Consultar_Pedido_Ord;
begin
  fDMCadLote_Calc.cdsPedido_Calc.Close;
  fDMCadLote_Calc.sdsPedido_Calc.CommandText := fDMCadLote_Calc.ctPedido_Calc;
  if CurrencyEdit7.AsInteger > 0 then
  begin
    fDMCadLote_Calc.sdsPedido_Calc.CommandText := fDMCadLote_Calc.sdsPedido_Calc.CommandText + ' WHERE PED.num_pedido = :Num_Pedido';
    fDMCadLote_Calc.sdsPedido_Calc.ParamByName('Num_Pedido').AsInteger := CurrencyEdit7.AsInteger;
  end;
  fDMCadLote_Calc.cdsPedido_Calc.Open;
end;

procedure TfrmGerar_Lote_Bol.MenuItem3Click(Sender: TObject);
begin
  prc_Marcar_Desmarcar_Ped('P');
end;

procedure TfrmGerar_Lote_Bol.prc_Marcar_Desmarcar_PED(Tipo: String);//P=Pedido   TM=Total marcar    TD=Total Desmarcar
var
  vMarcar: String;
  ID: Integer;
begin
  ID := fDMCadLote_Calc.cdsPendente_PedID.AsInteger;
  if Tipo = 'P' then
  begin
    fDMCadLote_Calc.cdsPendente_Ped.Edit;
    if fDMCadLote_Calc.cdsPendente_PedSELECIONADO.AsString = 'S' then
      fDMCadLote_Calc.cdsPendente_PedSELECIONADO.AsString := 'N'
    else
      fDMCadLote_Calc.cdsPendente_PedSELECIONADO.AsString := 'S';
    fDMCadLote_Calc.cdsPendente_Ped.Post;
  end
  else
  begin
    fDMCadLote_Calc.cdsPendente_Ped.First;
    while not fDMCadLote_Calc.cdsPendente_Ped.Eof do
    begin
      fDMCadLote_Calc.cdsPendente_Ped.Edit;
      if Tipo = 'TM' then
        fDMCadLote_Calc.cdsPendente_PedSELECIONADO.AsString := 'S'
      else
        fDMCadLote_Calc.cdsPendente_PedSELECIONADO.AsString := 'N';
      fDMCadLote_Calc.cdsPendente_Ped.Post;
      fDMCadLote_Calc.cdsPendente_Ped.Next;
    end;
  end;
  fDMCadLote_Calc.cdsPendente_Ped.Locate('ID',ID,[loCaseInsensitive]);
end;

procedure TfrmGerar_Lote_Bol.MenuItem4Click(Sender: TObject);
begin
  prc_Marcar_Desmarcar_Ped('TM');
end;

procedure TfrmGerar_Lote_Bol.MenuItem5Click(Sender: TObject);
begin
  prc_Marcar_Desmarcar_Ped('TD');
end;

procedure TfrmGerar_Lote_Bol.SMDBGrid5GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMCadLote_Calc.cdsPendente_PedSELECIONADO.AsString = 'S' then
  begin
    Background  := $00FFFFBB;
    aFont.Color := clBlack;
  end;
end;

procedure TfrmGerar_Lote_Bol.prc_Consultar_Ped;
var
  vTextoData: String;
begin
  Label12.Caption  := '0';
  vQtd_Selecionada := 0;
  fDMCadLote_Calc.cdsPendente_Ped.Close;
  fDMCadLote_Calc.sdsPendente_Ped.CommandText := fDMCadLote_Calc.ctPendente_Ped;
  if DateEdit6.Date > 10 then
    fDMCadLote_Calc.sdsPendente_Ped.CommandText := fDMCadLote_Calc.sdsPendente_Ped.CommandText + ' AND PED.DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit6.date));
  if DateEdit7.Date > 10 then
    fDMCadLote_Calc.sdsPendente_Ped.CommandText := fDMCadLote_Calc.sdsPendente_Ped.CommandText + ' AND PED.DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit7.date));
  if trim(Edit5.Text) <> '' then
    fDMCadLote_Calc.sdsPendente_Ped.CommandText := fDMCadLote_Calc.sdsPendente_Ped.CommandText + ' AND  CLI.NOME LIKE ' + QuotedStr('%'+Edit5.Text+'%');
  if fDMCadLote_Calc.qParametrosUSA_APROVACAO_PED.AsString = 'S' then
    fDMCadLote_Calc.sdsPendente_Ped.CommandText := fDMCadLote_Calc.sdsPendente_Ped.CommandText + ' AND  PED.APROVADO_PED = ' + QuotedStr('A');
  fDMCadLote_Calc.cdsPendente_Ped.Open;
  fDMCadLote_Calc.cdsPendente_Ped.IndexFieldNames := 'NUM_PEDIDO';
end;

procedure TfrmGerar_Lote_Bol.prc_Le_cdsPendente(ID, ITEM_ORIGINAL: Integer);
begin
  vNumPedido  := 0;
  fDMCadLote_Calc.cdsPendente.First;
  while not fDMCadLote_Calc.cdsPendente.Eof do
  begin
    if (((fDMCadLote_Calc.cdsPendenteTIPO_GRUPO.AsString = 'O') or (fDMCadLote_Calc.cdsPendenteTIPO_GRUPO.IsNull) or (trim(fDMCadLote_Calc.cdsPendenteTIPO_GRUPO.AsString) = '')
      or (fDMCadLote_Calc.cdsPendenteTIPO_GRUPO.AsString = '1')) and (vContBolsa = 1)) or ((fDMCadLote_Calc.cdsPendenteTIPO_GRUPO.AsString = '2') and (vContBolsa = 2)) then
    begin
      if fDMCadLote_Calc.cdsPendenteQTD_RESTANTE.AsInteger > 0 then
        prc_Gerar_mAcum;
    end;
    fDMCadLote_Calc.cdsPendente.Next;
  end;
end;

procedure TfrmGerar_Lote_Bol.prc_Le_Original(ID: Integer);
begin
  fDMCadLote_Calc.cdsPedOriginal.Close;
  fDMCadLote_Calc.sdsPedOriginal.ParamByName('ID').AsInteger := ID;
  fDMCadLote_Calc.cdsPedOriginal.Open;
  ProgressBar5.Max      := fDMCadLote_Calc.cdsPedOriginal.RecordCount;
  ProgressBar5.Position := 0;
  fDMCadLote_Calc.cdsPedOriginal.First;
  while not fDMCadLote_Calc.cdsPedOriginal.Eof do
  begin
    ProgressBar5.Position := ProgressBar5.Position + 1;
    fDMCadLote_Calc.cdsPendente.Close;
    fDMCadLote_Calc.sdsPendente.CommandText := fDMCadLote_Calc.ctPendente + ' AND PED.ID = ' + IntToStr(ID)
                                        + ' AND ITEM_ORIGINAL = ' + IntToStr(fDMCadLote_Calc.cdsPedOriginalITEM_ORIGINAL.AsInteger);
    fDMCadLote_Calc.cdsPendente.Open;
    fDMCadLote_Calc.cdsPendente.IndexFieldNames := 'ITEM_ORIGINAL;TAMANHO';

    prc_Le_cdsPendente(ID,fDMCadLote_Calc.cdsPedOriginalITEM_ORIGINAL.AsInteger);

    fDMCadLote_Calc.cdsPedOriginal.Next;
  end;
end;

procedure TfrmGerar_Lote_Bol.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 87) then //CTRL W
    ckdiv12.Visible := not(ckdiv12.Visible);
end;

procedure TfrmGerar_Lote_Bol.NxComboBox1Change(Sender: TObject);
begin
  prc_Limpar_Auxiliar;
end;

procedure TfrmGerar_Lote_Bol.SMDBGrid5DblClick(Sender: TObject);
begin
  if not(fDMCadLote_Calc.cdsPendente_Ped.Active) and (fDMCadLote_Calc.cdsPendenteID.AsInteger <= 0) then
    exit;
  fDMCadLote_Calc.cdsPendente_Ped.Edit;
  if fDMCadLote_Calc.cdsPendente_PedSELECIONADO.AsString = 'S' then
    fDMCadLote_Calc.cdsPendente_PedSELECIONADO.AsString := 'N'
  else
    fDMCadLote_Calc.cdsPendente_PedSELECIONADO.AsString := 'S';
  fDMCadLote_Calc.cdsPendente_Ped.Post;
end;

procedure TfrmGerar_Lote_Bol.prc_Gerar_mAcum;
var
  vData: TDateTime;
  vCarimboAux: String;
  vID_CombinacaoAux: Integer;
  vNumPedAux: Integer;
  vID_Cliente: Integer;
  vID_Pedido: Integer;
  vItem_Orig: Integer;
  vTamanho: String;
begin
  if ckDtEntrega.Checked then
    vData := fDMCadLote_Calc.cdsPendenteDTENTREGA.AsDateTime
  else
    vData := DateEdit3.Date;
  vCarimboAux       := '';
  vID_CombinacaoAux := 0;
  if (ComboBox1.ItemIndex = 1) and (trim(Edit1.Text) <> '') then
    vCarimboAux := Edit1.Text
  else
  if fDMCadLote_Calc.cdsPendenteCARIMBO.AsString <> '' then
    vCarimboAux := fDMCadLote_Calc.cdsPendenteCARIMBO.AsString;
  vID_Cliente := 0;
  if not ckAgrupar_cli.Checked then
    vID_Cliente := fDMCadLote_Calc.cdsPendenteID_CLIENTE.AsInteger;
  if fDMCadLote_Calc.cdsPendenteID_COR.AsInteger > 0 then
    vID_CombinacaoAux := fDMCadLote_Calc.cdsPendenteID_COR.AsInteger;
  if not ckAgrupar_Pedido.Checked then
    vID_Pedido := fDMCadLote_Calc.cdsPendenteID.AsInteger
  else
    vID_Pedido := 0;
  if ckAgrupar_Prod.Checked then
    vItem_Orig := 0
  else
    vItem_Orig := fDMCadLote_Calc.cdsPendenteITEM_ORIGINAL.AsInteger;
  vTamanho := '';
  if trim(fDMCadLote_Calc.cdsPendenteTAMANHO.AsString) <> '' then
    vTamanho := fDMCadLote_Calc.cdsPendenteTAMANHO.AsString;

  if (fDMCadLote_Calc.mAcum.Locate('ID_PRODUTO;ID_COMBINACAO;DTENTREGA;CARIMBO;ID_PEDIDO;ITEM_ORIGINAL;ID_CLIENTE',
                                      VarArrayOf([fDMCadLote_Calc.cdsPendenteID_PRODUTO.AsInteger,vID_CombinacaoAux,vData,vCarimboAux,
                                                  vID_Pedido,vItem_Orig,vID_Cliente]),[locaseinsensitive])) then
    fDMCadLote_Calc.mAcum.Edit
  else
  begin
    vID_Acum := vID_Acum + 1;
    fDMCadLote_Calc.mAcum.Insert;
    fDMCadLote_Calc.mAcumID.AsInteger            := vID_Acum;
    fDMCadLote_Calc.mAcumID_Produto.AsInteger    := fDMCadLote_Calc.cdsPendenteID_PRODUTO.AsInteger;
    fDMCadLote_Calc.mAcumID_Combinacao.AsInteger := vID_CombinacaoAux;
    fDMCadLote_Calc.mAcumID_Pedido.AsInteger     := vID_Pedido;
    fDMCadLote_Calc.mAcumID_Cliente.AsInteger    := vID_Cliente;
    fDMCadLote_Calc.mAcumDtEntrega.AsDateTime    := vData;
    fDMCadLote_Calc.mAcumItem_Original.AsInteger := vItem_Orig;
    fDMCadLote_Calc.mAcumCarimbo.AsString        := vCarimboAux;
    fDMCadLote_Calc.mAcumReferencia.AsString     := fDMCadLote_Calc.cdsPendenteREFERENCIA.AsString;
  end;

  fDMCadLote_Calc.mAcumQtd.AsInteger := fDMCadLote_Calc.mAcumQtd.AsInteger + fDMCadLote_Calc.cdsPendenteQTD_RESTANTE.AsInteger;
  fDMCadLote_Calc.mAcum.Post;

  //Bolsa não vai usar o mAcum_Tam  02/02/2018
  {if (fDMCadLote_Calc.mAcum_Tam.Locate('ID;Tamanho',VarArrayOf([fDMCadLote_Calc.mAcumID.AsInteger,vTamanho]),[locaseinsensitive])) then
    fDMCadLote_Calc.mAcum_Tam.Edit
  else
  begin
    fDMCadLote_Calc.mAcum_Tam.Insert;
    fDMCadLote_Calc.mAcum_TamID.AsInteger     := fDMCadLote_Calc.mAcumID.AsInteger;
    fDMCadLote_Calc.mAcum_TamTamanho.AsString := vTamanho;
    fDMCadLote_Calc.mAcum_TamQtd.AsInteger    := 0;
  end;
  fDMCadLote_Calc.mAcum_TamQtd.AsInteger := fDMCadLote_Calc.mAcum_TamQtd.AsInteger + fDMCadLote_Calc.cdsPendenteQTD_RESTANTE.AsInteger;
  fDMCadLote_Calc.mAcum_Tam.Post;}

  fDMCadLote_Calc.mAcum_Ped.Insert;
  fDMCadLote_Calc.mAcum_PedID.AsInteger          := fDMCadLote_Calc.mAcumID.AsInteger;
  fDMCadLote_Calc.mAcum_PedTamanho.AsString      := vTamanho;
  fDMCadLote_Calc.mAcum_PedID_Pedido.AsInteger   := fDMCadLote_Calc.cdsPendenteID.AsInteger;
  fDMCadLote_Calc.mAcum_PedItem_Pedido.AsInteger := fDMCadLote_Calc.cdsPendenteITEM.AsInteger;
  fDMCadLote_Calc.mAcum_PedQtd.AsInteger         := fDMCadLote_Calc.cdsPendenteQTD_RESTANTE.AsInteger;
  fDMCadLote_Calc.mAcum_Ped.Post;

  fDMCadLote_Calc.cdsPendente.Edit;
  fDMCadLote_Calc.cdsPendenteQTD_RESTANTE.AsInteger := StrToInt(FormatFloat('0',0));
  fDMCadLote_Calc.cdsPendente.Post;
end;

procedure TfrmGerar_Lote_Bol.prc_Gravar_Lote;
begin
  fDMCadLote_Calc.prc_Inserir;
  fDMCadLote_Calc.cdsLoteQTD_TALOES.AsInteger    := 0;
  fDMCadLote_Calc.cdsLoteDTEMISSAO.AsDateTime    := Date;
  //fDMCadLote_Calc.cdsLoteNUM_REMESSA.AsString    := edtRemessa.Text;
  fDMCadLote_Calc.cdsLoteNUM_REMESSA.AsString    := vNumRemessa;
  fDMCadLote_Calc.cdsLoteHREMISSAO.AsDateTime    := Now;
  fDMCadLote_Calc.cdsLoteID_PEDIDO.AsInteger     := fDMCadLote_Calc.mAcumID_Pedido.AsInteger;
  //fDMCadLote_Calc.cdsLoteNUM_PEDIDO.AsInteger    := 0;
  fDMCadLote_Calc.cdsLoteID_CLIENTE.AsInteger    := fDMCadLote_Calc.mAcumID_Cliente.AsInteger;
  fDMCadLote_Calc.cdsLoteID_PRODUTO.AsInteger    := fDMCadLote_Calc.mAcumID_Produto.AsInteger;
  fDMCadLote_Calc.cdsLoteREFERENCIA.AsString     := fDMCadLote_Calc.mAcumReferencia.AsString;
  fDMCadLote_Calc.cdsLoteID_COMBINACAO.AsInteger := fDMCadLote_Calc.mAcumID_Combinacao.AsInteger;
  fDMCadLote_Calc.cdsLoteCARIMBO.AsString        := fDMCadLote_Calc.mAcumCarimbo.AsString;
  fDMCadLote_Calc.cdsLoteDTENTREGA.AsDateTime    := fDMCadLote_Calc.mAcumDtEntrega.AsDateTime;
  fDMCadLote_Calc.cdsLoteFILIAL.AsInteger        := fDMCadLote_Calc.cdsPendenteFILIAL.AsInteger;
  fDMCadLote_Calc.cdsLoteQTD.AsFloat             := 0;
  fDMCadLote_Calc.cdsLoteNOME.AsString           := '';
  fDMCadLote_Calc.cdsLoteOBS_PED.AsString        := edtObs.Text;
  //27/05/2018  Próximo lote
  fDMCadLote_Calc.qProximo_Lote.Close;
  if (fDMCadLote_Calc.qParametros_LoteUSA_LOTE_REM.AsString = 'S') and (fDMCadLote_Calc.qParametros_LoteUSA_REMESSA.AsString = 'S') then
    fDMCadLote_Calc.qProximo_Lote.SQL.Text := fDMCadLote_Calc.ctqProximo_Lote + ' WHERE NUM_REMESSA = ' + QuotedStr(vNumRemessa);
  fDMCadLote_Calc.qProximo_Lote.Open; 
  //********************
  if vNumLote <= 0 then
    vNumLote := fDMCadLote_Calc.qProximo_LoteNUM_LOTE.AsInteger;
  vNumLote := vNumLote + 1;
  if vNumOrdem <= 0 then
  begin
    fDMCadLote_Calc.qProxima_Ordem.Close;
    fDMCadLote_Calc.qProxima_Ordem.Open;
    vNumOrdem := fDMCadLote_Calc.qProxima_OrdemNUM_ORDEM.AsInteger + 1;
  end;
  fDMCadLote_Calc.cdsLoteNUM_LOTE.AsInteger  := vNumLote;
  fDMCadLote_Calc.cdsLoteNUM_ORDEM.AsInteger := vNumOrdem;
  fDMCadLote_Calc.cdsLote.Post;
end;

procedure TfrmGerar_Lote_Bol.prc_Gravar_Talao(Qtd: Integer);
begin
  fDMCadLote_Calc.mAcum_Ped.First;
  fDMCadLote_Calc.prc_Inserir_Talao;
  fDMCadLote_Calc.cdsTalaoID_PRODUTO.AsInteger    := fDMCadLote_Calc.mAcumID_Produto.AsInteger;
  fDMCadLote_Calc.cdsTalaoID_COMBINACAO.AsInteger := fDMCadLote_Calc.mAcumID_Combinacao.AsInteger;
  //fDMCadLote_Calc.cdsTalaoTAMANHO.AsString        := fDMCadLote_Calc.mAcum_TamTamanho.AsString;
  fDMCadLote_Calc.cdsTalaoTAMANHO.AsString        := '';
  fDMCadLote_Calc.cdsTalaoQTD.AsInteger           := Qtd;
  fDMCadLote_Calc.cdsTalaoQTD_PENDENTE.AsInteger  := fDMCadLote_Calc.cdsTalaoQTD.AsInteger;
  fDMCadLote_Calc.cdsTalaoQTD_PRODUZIDO.AsInteger := 0;
  fDMCadLote_Calc.cdsTalaoIMPRESSO.AsString       := 'N';
  fDMCadLote_Calc.cdsTalaoID_PEDIDO.AsInteger     := fDMCadLote_Calc.mAcumID_Pedido.AsInteger;
  if fDMCadLote_Calc.mAcum_Ped.RecordCount > 1 then
    fDMCadLote_Calc.cdsTalaoITEM_PEDIDO.Clear
  else
    fDMCadLote_Calc.cdsTalaoITEM_PEDIDO.AsInteger := fDMCadLote_Calc.mAcum_PedItem_Pedido.AsInteger; 
  fDMCadLote_Calc.cdsTalaoREFERENCIA.AsString     := fDMCadLote_Calc.mAcumReferencia.AsString;
  fDMCadLote_Calc.cdsTalao.Post;

  fDMCadLote_Calc.mAcum_Ped.First;
  while not fDMCadLote_Calc.mAcum_Ped.Eof do
  begin
    fDMCadLote_Calc.cdsTalao_Ped.Insert;
    fDMCadLote_Calc.cdsTalao_PedID.AsInteger          := fDMCadLote_Calc.cdsTalaoID.AsInteger;
    fDMCadLote_Calc.cdsTalao_PedNUM_TALAO.AsInteger   := fDMCadLote_Calc.cdsTalaoNUM_TALAO.AsInteger;
    fDMCadLote_Calc.cdsTalao_PedID_PEDIDO.AsInteger   := fDMCadLote_Calc.mAcum_PedID_Pedido.AsInteger;
    fDMCadLote_Calc.cdsTalao_PedITEM_PEDIDO.AsInteger := fDMCadLote_Calc.mAcum_PedItem_Pedido.AsInteger;
    fDMCadLote_Calc.cdsTalao_PedQTD.AsInteger         := fDMCadLote_Calc.mAcum_PedQtd.AsInteger;
    fDMCadLote_Calc.cdsTalao_PedID_CLIENTE.AsInteger  := fDMCadLote_Calc.mAcumID_Cliente.AsInteger;
    fDMCadLote_Calc.cdsTalao_PedBAIXADO.AsString      := 'N';
    fDMCadLote_Calc.cdsTalao_Ped.Post;
    fDMCadLote_Calc.mAcum_Ped.Next;
  end;

  fDMCadLote_Calc.cdsSetor_Talao.First;
  while not fDMCadLote_Calc.cdsSetor_Talao.Eof do
  begin
    fDMCadLote_Calc.cdsTalao_Setor.Insert;
    fDMCadLote_Calc.cdsTalao_SetorID.AsInteger        := fDMCadLote_Calc.cdsTalaoID.AsInteger;
    fDMCadLote_Calc.cdsTalao_SetorNUM_TALAO.AsInteger := fDMCadLote_Calc.cdsTalaoNUM_TALAO.AsInteger;
    fDMCadLote_Calc.cdsTalao_SetorITEM.AsInteger      := fDMCadLote_Calc.cdsSetor_TalaoORDEM_ORC.AsInteger;
    fDMCadLote_Calc.cdsTalao_SetorID_SETOR.AsInteger  := fDMCadLote_Calc.cdsSetor_TalaoID.AsInteger;
    fDMCadLote_Calc.cdsTalao_SetorQTD.AsInteger       := fDMCadLote_Calc.cdsTalaoQTD.AsInteger;
    fDMCadLote_Calc.cdsTalao_Setor.Post;
    fDMCadLote_Calc.cdsSetor_Talao.Next;
  end;

  fDMCadLote_Calc.cdsLote.Edit;
  fDMCadLote_Calc.cdsLoteQTD.AsInteger        := fDMCadLote_Calc.cdsLoteQTD.AsInteger + Qtd;
  fDMCadLote_Calc.cdsLoteQTD_TALOES.AsInteger := fDMCadLote_Calc.cdsLoteQTD_TALOES.AsInteger + 1;
  fDMCadLote_Calc.cdsLote.Post;
end;

procedure TfrmGerar_Lote_Bol.SMDBGrid5KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F5) then
  begin
    fDMCadLote_Calc.cdsPendente.Close;
    fDMCadLote_Calc.sdsPendente.CommandText := fDMCadLote_Calc.ctPendente + ' AND PED.ID = ' + IntToStr(fDMCadLote_Calc.cdsPendente_PedID.AsInteger);
    fDMCadLote_Calc.cdsPendente.Open;
    fDMCadLote_Calc.cdsPendente.IndexFieldNames := 'ITEM';
    frmMostraItens_Ped := TfrmMostraItens_Ped.Create(Self);
    frmMostraItens_Ped.fDMCadLote_Calc := fDMCadLote_Calc;
    frmMostraItens_Ped.ShowModal;
    FreeAndNil(frmMostraItens_Ped);
  end;
end;

procedure TfrmGerar_Lote_Bol.SMDBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = vk_F5 then
  begin
    frmConsPedLote := TfrmConsPedLote.Create(Self);
    frmConsPedLote.vNum_Ordem_Loc := fDMCadLote_Calc.mLoteNum_Ordem.AsInteger;
    frmConsPedLote.ShowModal;
    FreeAndNil(frmConsPedLote);
  end;
end;

function TfrmGerar_Lote_Bol.fnc_Existe_Remessa: Boolean;
var
  sds: TSQLDataSet;
begin
  Result := False;
  sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  sds.NoMetadata    := True;
  sds.GetMetadata   := False;
  sds.CommandText   := 'SELECT COUNT(1) CONTADOR FROM LOTE WHERE NUM_REMESSA = :NUM_REMESSA ';
  sds.ParamByName('NUM_REMESSA').AsString := edtRemessa.Text;
  sds.Open;
  if sds.FieldByName('CONTADOR').AsInteger > 0 then
  begin
    MessageDlg('*** Remessa já gerada!', mtInformation, [mbOk], 0);
    Result := True;
  end;
  FreeAndNil(sds);
end;

end.
