unit UCadDocEstoqueCB;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Buttons, Grids, SMDBGrid, UDMCadDocEstoque, 
  DBGrids, ExtCtrls, StdCtrls, FMTBcd, SqlExpr, RzTabs, Mask, DBCtrls, ToolEdit, CurrEdit, RxLookup, RxDBComb, RXDBCtrl,
  RzEdit, RzDBEdit, RzButton, UDMEstoque, UEscolhe_Filial, UCBase, RzPanel, dbXPress, NxCollection,
  DateUtils, DB, Menus, variants;

type
  TfrmCadDocEstoqueCB = class(TForm)
    RzPageControl1: TRzPageControl;
    TS_Consulta: TRzTabSheet;
    TS_Cadastro: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    pnlPesquisa: TPanel;
    Panel1: TPanel;
    lblCliente: TLabel;
    StaticText1: TStaticText;
    Label5: TLabel;
    DateEdit1: TDateEdit;
    Label6: TLabel;
    DateEdit2: TDateEdit;
    Label12: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Panel11: TPanel;
    UCControls1: TUCControls;
    RzPageControl2: TRzPageControl;
    TS_CodBarra: TRzTabSheet;
    SMDBGrid2: TSMDBGrid;
    pnlItem: TPanel;
    ComboBox1: TComboBox;
    btnInserir: TNxButton;
    btnExcluir: TNxButton;
    btnPesquisar: TNxButton;
    btnConsultar: TNxButton;
    btnAlterar: TNxButton;
    btnConfirmar: TNxButton;
    btnCancelar: TNxButton;
    btnExcluir_Itens: TNxButton;
    pnlTipo: TPanel;
    pnlNota: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    lblNome_Filial: TLabel;
    DBText1: TDBText;
    DBEdit8: TDBEdit;
    Label18: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label4: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label10: TLabel;
    RxDBLookupCombo5: TRxDBLookupCombo;
    SpeedButton3: TSpeedButton;
    Label1: TLabel;
    Edit1: TEdit;
    TS_Itens: TRzTabSheet;
    SMDBGrid3: TSMDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnExcluir_ItensClick(Sender: TObject);
    procedure RzPageControl1Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnPesquisarClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBLookupCombo3Exit(Sender: TObject);
  private
    { Private declarations }
    vTipo_Reg: String;
    vTipo_ES: String;

    fDMCadDocEstoque: TDMCadDocEstoque;
    fDMEstoque: TDMEstoque;

    ffrmEscolhe_Filial: TfrmEscolhe_Filial;

    procedure prc_Inserir_Registro;
    procedure prc_Excluir_Registro;
    procedure prc_Gravar_Registro;
    procedure prc_Consultar(ID: Integer);

    procedure prc_Posiciona_DocEstoque;

    procedure prc_Habilitar_CamposNota;

    procedure prc_Calcular_Total;
    function fnc_Gravar_Estoque(ID_Local_Estoque, ID_Mov_Estoque: Integer ; Tipo_ES: String): Integer;

    procedure prc_Gravar_mAuxCodBarra;
    procedure prc_Le_mAuxCodBarra;

  public
    { Public declarations }
  end;

var
  frmCadDocEstoqueCB: TfrmCadDocEstoqueCB;

implementation

uses DmdDatabase, rsDBUtils, UMenu, uUtilPadrao;

{$R *.dfm}

procedure TfrmCadDocEstoqueCB.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmCadDocEstoqueCB.btnExcluirClick(Sender: TObject);
begin
  prc_Posiciona_DocEstoque;

  if fDMCadDocEstoque.cdsDocEstoque.IsEmpty then
    exit;

  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  prc_Excluir_Registro;

  btnConsultarClick(Sender);
end;

procedure TfrmCadDocEstoqueCB.btnInserirClick(Sender: TObject);
begin
  prc_Inserir_Registro;
end;

procedure TfrmCadDocEstoqueCB.prc_Excluir_Registro;
begin
  fDMCadDocEstoque.prc_Excluir;
end;

procedure TfrmCadDocEstoqueCB.prc_Gravar_Registro;
var
  vIDAux: Integer;
  vID_Estoque: Integer;
  ID: TTransactionDesc;
  vID_LocalAux: Integer;
begin
  if (fDMCadDocEstoque.cdsDocEstoqueID_LOCAL_ESTOQUE.AsInteger <= 0) and (fDMCadDocEstoque.qParametrosUSA_LOCAL_ESTOQUE.AsString <> 'S') then
  begin
    vID_LocalAux := fnc_Verificar_Local(fDMCadDocEstoque.qParametrosUSA_LOCAL_ESTOQUE.AsString);
    if vID_LocalAux <= 0 then
      vID_LocalAux := 1;
    fDMCadDocEstoque.cdsDocEstoqueID_LOCAL_ESTOQUE.AsInteger := vID_LocalAux;
  end;

  prc_Le_mAuxCodBarra;

  prc_Calcular_Total;

  if (fDMCadDocEstoque.cdsDocEstoqueTIPO_REG.AsString = 'T') then
    fDMCadDocEstoque.cdsDocEstoqueTIPO_ES.AsString := 'S';

  fDMCadDocEstoque.prc_Gravar;
  vIDAux := fDMCadDocEstoque.cdsDocEstoqueID.AsInteger;
  if fDMCadDocEstoque.cdsDocEstoque.State in [dsEdit,dsInsert] then
  begin
    MessageDlg(fDMCadDocEstoque.vMSGErro, mtError, [mbOk], 0);
    exit;
  end;

  ID.TransactionID  := 1;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    fDMCadDocEstoque.cdsDocEstoque_Itens.First;
    while not fDMCadDocEstoque.cdsDocEstoque_Itens.Eof do
    begin
      fDMCadDocEstoque.cdsDocEstoque_Itens.Edit;
      vID_Estoque := fnc_Gravar_Estoque(fDMCadDocEstoque.cdsDocEstoqueID_LOCAL_ESTOQUE.AsInteger,fDMCadDocEstoque.cdsDocEstoque_ItensID_MOVESTOQUE.AsInteger,fDMCadDocEstoque.cdsDocEstoqueTIPO_ES.AsString);
      fDMCadDocEstoque.cdsDocEstoque_ItensID_MOVESTOQUE.AsInteger := vID_Estoque;
      if fDMCadDocEstoque.cdsDocEstoqueTIPO_REG.AsString = 'T' then
      begin
        vID_Estoque := fnc_Gravar_Estoque(fDMCadDocEstoque.cdsDocEstoqueID_LOCAL_DESTINO.AsInteger,fDMCadDocEstoque.cdsDocEstoque_ItensID_MOVESTOQUE_DESTINO.AsInteger,'E');
        fDMCadDocEstoque.cdsDocEstoque_ItensID_MOVESTOQUE_DESTINO.AsInteger := vID_Estoque;
      end;
      fDMCadDocEstoque.cdsDocEstoque_Itens.Post;

      fDMCadDocEstoque.cdsDocEstoque_Itens.Next;
    end;

    fDMCadDocEstoque.cdsDocEstoque.ApplyUpdates(0);

    dmDatabase.scoDados.Commit(ID);

  except
    on e: Exception do
    begin
      dmDatabase.scoDados.Rollback(ID);
      raise Exception.Create('Erro ao gravar o estoque: ' + #13 + e.Message);
    end;
  end;

  //TS_Consulta.TabEnabled := True;
  prc_Habilitar_CamposNota;
  pnlTipo.Enabled := False;

  prc_Consultar(vIDAux);
  prc_Posiciona_DocEstoque;
  RzPageControl1.ActivePage := TS_Consulta;
end;

procedure TfrmCadDocEstoqueCB.prc_Inserir_Registro;
begin
  if fDMCadDocEstoque.cdsFilial.RecordCount > 1 then
  begin
    ffrmEscolhe_Filial := TfrmEscolhe_Filial.Create(self);
    ffrmEscolhe_Filial.ShowModal;
    FreeAndNil(ffrmEscolhe_Filial);
  end
  else
  begin
    fDMCadDocEstoque.cdsFilial.Last;
    vFilial      := fDMCadDocEstoque.cdsFilialID.AsInteger;
    vFilial_Nome := fDMCadDocEstoque.cdsFilialNOME.AsString;
  end;
  if vFilial <= 0 then
  begin
    ShowMessage('Filial não informada!');
    exit;
  end;

  fDMCadDocEstoque.cdsFilial.Locate('ID',vFilial,[loCaseInsensitive]);

  fDMCadDocEstoque.prc_Inserir;
  lblNome_Filial.Caption := vFilial_Nome;

  if fDMCadDocEstoque.cdsDocEstoque.State in [dsBrowse] then
    exit;

  fDMCadDocEstoque.cdsDocEstoqueFILIAL.AsInteger  := vFilial;
  if fDMCadDocEstoque.qParametrosUSA_LOCAL_ESTOQUE.AsString = 'S' then
  begin
    vTipo_Reg := '';
    vTipo_ES  := 'S';
  end
  else
  begin
    vTipo_Reg := 'D';
    vTipo_ES  := '';
    fDMCadDocEstoque.cdsDocEstoqueTIPO_REG.AsString := vTipo_Reg;
  end;
  fDMCadDocEstoque.cdsDocEstoqueINF_CODBARRA.AsString := 'S';
  fDMCadDocEstoque.cdsDocEstoqueTIPO_REG.AsString     := 'D';
  fDMCadDocEstoque.cdsDocEstoqueTIPO_ES.AsString      := 'E';

  fDMCadDocEstoque.mAuxCodBarra.EmptyDataSet;
  
  prc_Habilitar_CamposNota;
  pnlTipo.Enabled := True;

  RzPageControl1.ActivePage := TS_Cadastro;

  DBDateEdit1.SetFocus;
end;

procedure TfrmCadDocEstoqueCB.FormShow(Sender: TObject);
var
  vData: TDateTime;
  i: Integer;
begin
  fDMCadDocEstoque := TDMCadDocEstoque.Create(Self);
  fDMEstoque       := TDMEstoque.Create(Self);

  oDBUtils.SetDataSourceProperties(Self, fDMCadDocEstoque);

  vData          := EncodeDate(YearOf(Date),MonthOf(Date),01);
  DateEdit1.Date := vData;

  for i := 1 to SMDBGrid2.ColCount - 2 do
  begin
    if (SMDBGrid2.Columns[i].FieldName = 'TAMANHO') then
      SMDBGrid2.Columns[i].Visible := (fDMCadDocEstoque.qParametrosUSA_GRADE.AsString = 'S');
    if (SMDBGrid2.Columns[i].FieldName = 'NOME_COR_COMBINACAO') then
      SMDBGrid2.Columns[i].Visible := ((fDMCadDocEstoque.qParametrosINFORMAR_COR_MATERIAL.AsString = 'S') or (fDMCadDocEstoque.qParametrosINFORMAR_COR_PROD.AsString = 'C'));
    if (fDMCadDocEstoque.qParametrosUSA_LOTE_CONTROLE.AsString <> 'S') and (SMDBGrid2.Columns[i].FieldName = 'NUM_LOTE_CONTROLE') then
      SMDBGrid2.Columns[i].Visible := False;
  end;

  Label10.Visible := (fDMCadDocEstoque.qParametrosUSA_LOCAL_ESTOQUE.AsString = 'S');
  RxDBLookupCombo5.Visible := (fDMCadDocEstoque.qParametrosUSA_LOCAL_ESTOQUE.AsString = 'S');
  SpeedButton3.Visible     := (fDMCadDocEstoque.qParametrosUSA_LOCAL_ESTOQUE.AsString = 'S');
end;

procedure TfrmCadDocEstoqueCB.prc_Consultar(ID: Integer);
begin
  fDMCadDocEstoque.cdsDocEstoque_Consulta.Close;

  fDMCadDocEstoque.sdsDocEstoque_Consulta.CommandText := fDMCadDocEstoque.ctConsulta;
  fDMCadDocEstoque.sdsDocEstoque_Consulta.CommandText := fDMCadDocEstoque.sdsDocEstoque_Consulta.CommandText
                                                       + ' WHERE (TIPO_REG = ' + QuotedStr('D') + ' OR TIPO_REG = ' + QuotedStr('T') + ' OR TIPO_REG = ' + QuotedStr('P') + ')'
                                                       + ' AND (DC.INF_CODBARRA = ' + QuotedStr('S') + ')';
  if ID > 0 then
    fDMCadDocEstoque.sdsDocEstoque_Consulta.CommandText := fDMCadDocEstoque.sdsDocEstoque_Consulta.CommandText +
                                                           ' AND DC.ID = ' + IntToStr(ID);
  if not(RxDBLookupCombo1.Text = '') then
    fDMCadDocEstoque.sdsDocEstoque_Consulta.CommandText := fDMCadDocEstoque.sdsDocEstoque_Consulta.CommandText +
                                                           ' AND DC.FILIAL = ' + IntToStr(RxDBLookupCombo1.KeyValue);
  case ComboBox1.ItemIndex of
    0: fDMCadDocEstoque.sdsDocEstoque_Consulta.CommandText := fDMCadDocEstoque.sdsDocEstoque_Consulta.CommandText + ' AND DC.TIPO_ES = ' + QuotedStr('E');
    1: fDMCadDocEstoque.sdsDocEstoque_Consulta.CommandText := fDMCadDocEstoque.sdsDocEstoque_Consulta.CommandText + ' AND DC.TIPO_ES = ' + QuotedStr('S');
  end;

  if DateEdit1.Date > 10 then
    fDMCadDocEstoque.sdsDocEstoque_Consulta.CommandText := fDMCadDocEstoque.sdsDocEstoque_Consulta.CommandText
                        + ' AND DC.DTMOVIMENTO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    fDMCadDocEstoque.sdsDocEstoque_Consulta.CommandText := fDMCadDocEstoque.sdsDocEstoque_Consulta.CommandText
                        + ' AND DC.DTMOVIMENTO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  fDMCadDocEstoque.cdsDocEstoque_Consulta.Open;
end;

procedure TfrmCadDocEstoqueCB.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar(0);
end;

procedure TfrmCadDocEstoqueCB.btnCancelarClick(Sender: TObject);
begin
  if (fDMCadDocEstoque.cdsDocEstoque.State in [dsBrowse]) or not(fDMCadDocEstoque.cdsDocEstoque.Active) then
  begin
    RzPageControl1.ActivePage := TS_Consulta;
    exit;
  end;

  if MessageDlg('Deseja cancelar alteração/inclusão do registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fDMCadDocEstoque.cdsDocEstoque.CancelUpdates;

  prc_Habilitar_CamposNota;
  pnlTipo.Enabled := False;

  TS_Consulta.TabEnabled    := True;
  RzPageControl1.ActivePage := TS_Consulta;
end;

procedure TfrmCadDocEstoqueCB.SMDBGrid1DblClick(Sender: TObject);
begin
  RzPageControl1.ActivePage := TS_Cadastro;
end;

procedure TfrmCadDocEstoqueCB.btnAlterarClick(Sender: TObject);
begin
  if (fDMCadDocEstoque.cdsDocEstoque.IsEmpty) or not(fDMCadDocEstoque.cdsDocEstoque.Active) or (fDMCadDocEstoque.cdsDocEstoqueID.AsInteger < 1) then
    exit;

  fDMCadDocEstoque.cdsDocEstoque.Edit;
  //TS_Consulta.TabEnabled := False;
  prc_Habilitar_CamposNota;
  pnlTipo.Enabled := False;
end;

procedure TfrmCadDocEstoqueCB.btnConfirmarClick(Sender: TObject);
begin
  prc_Gravar_Registro;
end;

procedure TfrmCadDocEstoqueCB.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fDMCadDocEstoque);
end;

procedure TfrmCadDocEstoqueCB.prc_Posiciona_DocEstoque;
begin
  fDMCadDocEstoque.prc_Localizar(fDMCadDocEstoque.cdsDocEstoque_ConsultaID.AsInteger);
  fDMCadDocEstoque.cdsDocEstoque_Itens.Close;
  fDMCadDocEstoque.cdsDocEstoque_Itens.Open;
  vFilial      := fDMCadDocEstoque.cdsDocEstoqueFILIAL.AsInteger;
  vFilial_Nome := '';
  if fDMCadDocEstoque.cdsFilial.Locate('ID',vFilial,[loCaseInsensitive]) then
    vFilial_Nome := fDMCadDocEstoque.cdsFilialNOME_INTERNO.AsString;
  lblNome_Filial.Caption := vFilial_Nome;
end;

procedure TfrmCadDocEstoqueCB.btnExcluir_ItensClick(Sender: TObject);
begin
  if not(fDMCadDocEstoque.cdsDocEstoque_Itens.Active) and (fDMCadDocEstoque.cdsDocEstoque_Itens.IsEmpty) or (fDMCadDocEstoque.cdsDocEstoque_ItensITEM.AsInteger < 1) then
    exit;

  if MessageDlg('Deseja excluir o item selecionado?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fDMCadDocEstoque.prc_Excluir_Item;
end;

procedure TfrmCadDocEstoqueCB.RzPageControl1Change(Sender: TObject);
begin
  if not(fDMCadDocEstoque.cdsDocEstoque.State in [dsEdit, dsInsert]) then
  begin
    if RzPageControl1.ActivePage = TS_Cadastro then
    begin
      if not(fDMCadDocEstoque.cdsDocEstoque_Consulta.Active) or (fDMCadDocEstoque.cdsDocEstoque_Consulta.IsEmpty) or (fDMCadDocEstoque.cdsDocEstoque_ConsultaID.AsInteger <= 0) then
        exit;
      prc_Posiciona_DocEstoque;
    end;
  end;
end;

procedure TfrmCadDocEstoqueCB.prc_Habilitar_CamposNota;
begin
  TS_Consulta.TabEnabled := not(TS_Consulta.TabEnabled);

  pnlItem.Enabled            := not(pnlItem.Enabled);

  btnConfirmar.Enabled        := not(btnConfirmar.Enabled);
  btnAlterar.Enabled          := not(btnAlterar.Enabled);

  pnlNota.Enabled          := not(pnlNota.Enabled);
end;

procedure TfrmCadDocEstoqueCB.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := fnc_Encerrar_Tela(fDMCadDocEstoque.cdsDocEstoque);
end;

procedure TfrmCadDocEstoqueCB.prc_Calcular_Total;
var
  vVlrTotal: Real;
begin
  vVlrTotal := 0;
  fDMCadDocEstoque.cdsDocEstoque_Itens.First;
  while not fDMCadDocEstoque.cdsDocEstoque_Itens.Eof do
  begin
    vVlrTotal := vVlrTotal + fDMCadDocEstoque.cdsDocEstoque_ItensVLR_TOTAL.AsFloat;
    fDMCadDocEstoque.cdsDocEstoque_Itens.Next;
  end;

  fDMCadDocEstoque.cdsDocEstoqueVLR_TOTAL.AsFloat := StrToFloat(FormatFloat('0.00',vVlrTotal));
end;

procedure TfrmCadDocEstoqueCB.btnPesquisarClick(Sender: TObject);
begin
  pnlPesquisa.Visible := not(pnlPesquisa.Visible);
  if pnlPesquisa.Visible then
     DateEdit1.SetFocus;
end;

procedure TfrmCadDocEstoqueCB.SpeedButton2Click(Sender: TObject);
begin
  fDMCadDocEstoque.cdsLocal_Estoque.Close;
  fDMCadDocEstoque.cdsLocal_Estoque.Open;
end;

function TfrmCadDocEstoqueCB.fnc_Gravar_Estoque(ID_Local_Estoque, ID_Mov_Estoque: Integer ; Tipo_ES: String): Integer;
var
  vTipoAux: String;
begin
  vTipoAux := 'DOC';
  Result := fDMEstoque.fnc_Gravar_Estoque(ID_Mov_Estoque,
                                          fDMCadDocEstoque.cdsDocEstoqueFILIAL.AsInteger,
                                          ID_Local_Estoque,
                                          fDMCadDocEstoque.cdsDocEstoque_ItensID_PRODUTO.AsInteger,
                                          fDMCadDocEstoque.cdsDocEstoqueID.AsInteger,fDMCadDocEstoque.cdsDocEstoqueID_PESSOA.AsInteger,0,
                                          fDMCadDocEstoque.cdsDocEstoqueID.AsInteger,fDMCadDocEstoque.cdsDocEstoque_ItensID_CENTROCUSTO.AsInteger,
                                          Tipo_ES,vTipoAux,
                                          fDMCadDocEstoque.cdsDocEstoque_ItensUNIDADE.AsString,
                                          fDMCadDocEstoque.cdsDocEstoque_ItensUNIDADE.AsString,'',
                                          fDMCadDocEstoque.cdsDocEstoque_ItensTAMANHO.AsString,
                                          fDMCadDocEstoque.cdsDocEstoqueDTMOVIMENTO.AsDateTime,
                                          fDMCadDocEstoque.cdsDocEstoque_ItensVLR_UNITARIO.AsFloat,
                                          fDMCadDocEstoque.cdsDocEstoque_ItensQTD.AsFloat,0,0,0,0,0,
                                          fDMCadDocEstoque.cdsDocEstoque_ItensQTD.AsFloat,
                                          fDMCadDocEstoque.cdsDocEstoque_ItensVLR_UNITARIO.AsFloat,0,0,'',
                                          fDMCadDocEstoque.cdsDocEstoque_ItensID_COR.AsInteger,
                                          fDMCadDocEstoque.cdsDocEstoque_ItensNUM_LOTE_CONTROLE.AsString,
                                          fDMCadDocEstoque.cdsDocEstoque_ItensGERAR_CUSTO.AsString,0); //ver aqui sobre Lote Controle  04/11/2015
end;

procedure TfrmCadDocEstoqueCB.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    prc_Gravar_mAuxCodBarra;
end;

procedure TfrmCadDocEstoqueCB.prc_Gravar_mAuxCodBarra;
var
  vItem : Integer;
begin
  if trim(Edit1.Text) = '' then
    exit;

  fDMCadDocEstoque.qCBarra.Close;
  fDMCadDocEstoque.qCBarra.ParamByName('COD_BARRA').AsString := trim(Edit1.Text);
  fDMCadDocEstoque.qCBarra.Open;
  if fDMCadDocEstoque.qCBarra.IsEmpty then
  begin
    MessageDlg('*** Cód. de Barras não encontrado!', mtError, [mbOk], 0);
    Edit1.Clear;
    exit;
  end;

  fDMCadDocEstoque.mAuxCodBarra.Last;
  vItem := fDMCadDocEstoque.mAuxCodBarraItem.AsInteger;

  fDMCadDocEstoque.mAuxCodBarra.Insert;
  fDMCadDocEstoque.mAuxCodBarraItem.AsInteger        := vItem + 1;
  fDMCadDocEstoque.mAuxCodBarraCodBarra.AsString     := trim(Edit1.Text);
  fDMCadDocEstoque.mAuxCodBarraID_Produto.AsInteger  := fDMCadDocEstoque.qCBarraID_PRODUTO.AsInteger;
  fDMCadDocEstoque.mAuxCodBarraID_Cor.AsInteger      := fDMCadDocEstoque.qCBarraID_COR.AsInteger;
  fDMCadDocEstoque.mAuxCodBarraTamanho.AsString      := fDMCadDocEstoque.qCBarraTAMANHO.AsString;
  fDMCadDocEstoque.mAuxCodBarraReferencia.AsString   := fDMCadDocEstoque.qCBarraREFERENCIA.AsString;
  fDMCadDocEstoque.mAuxCodBarraNome_Produto.AsString := fDMCadDocEstoque.qCBarraNOME_PRODUTO.AsString;
  fDMCadDocEstoque.mAuxCodBarraNome_Cor.AsString     := fDMCadDocEstoque.qCBarraNOME_COR.AsString;
  fDMCadDocEstoque.mAuxCodBarraUnidade.AsString      := fDMCadDocEstoque.qCBarraUNIDADE.AsString;
  fDMCadDocEstoque.mAuxCodBarraPreco_Custo.AsFloat   := StrToFloat(FormatFloat('0.0000',fDMCadDocEstoque.qCBarraPRECO_CUSTO.AsFloat));
  fDMCadDocEstoque.mAuxCodBarraPreco_Venda.AsFloat   := StrToFloat(FormatFloat('0.0000',fDMCadDocEstoque.qCBarraPRECO_VENDA.AsFloat));
  fDMCadDocEstoque.mAuxCodBarra.Post;

  Edit1.Clear;
  Edit1.SetFocus;
end;

procedure TfrmCadDocEstoqueCB.prc_Le_mAuxCodBarra;
var
  vIDCor : Integer;
  vTam : String;
begin
  fDMCadDocEstoque.mAuxCodBarra.First;
  while not fDMCadDocEstoque.mAuxCodBarra.Eof do
  begin
    vIDCor := fDMCadDocEstoque.mAuxCodBarraID_Cor.AsInteger;
    if fDMCadDocEstoque.mAuxCodBarraID_Cor.AsInteger <= 0 then
      vIDCor := 0;
    vTam := fDMCadDocEstoque.mAuxCodBarraTamanho.AsString;
    if (trim(fDMCadDocEstoque.mAuxCodBarraTamanho.AsString) = '') or (fDMCadDocEstoque.mAuxCodBarraTamanho.IsNull) then
      vTam := '';
    if fDMCadDocEstoque.cdsDocEstoque_Itens.Locate('ID_PRODUTO;ID_COR;TAMANHO',VarArrayOf([fDMCadDocEstoque.mAuxCodBarraID_Produto.AsInteger,vIDCor,vTam]),[locaseinsensitive]) then
      fDMCadDocEstoque.cdsDocEstoque_Itens.Edit
    else
    begin
      fDMCadDocEstoque.prc_Inserir_Itens;
      fDMCadDocEstoque.cdsDocEstoque_ItensID_PRODUTO.AsInteger := fDMCadDocEstoque.mAuxCodBarraID_Produto.AsInteger;
      if fDMCadDocEstoque.mAuxCodBarraID_Cor.AsInteger <= 0 then
        fDMCadDocEstoque.cdsDocEstoque_ItensID_COR.AsInteger := 0
      else
        fDMCadDocEstoque.cdsDocEstoque_ItensID_COR.AsInteger := fDMCadDocEstoque.mAuxCodBarraID_Cor.AsInteger;
      if trim(fDMCadDocEstoque.mAuxCodBarraTamanho.AsString) <> '' then
        fDMCadDocEstoque.cdsDocEstoque_ItensTAMANHO.AsString := fDMCadDocEstoque.mAuxCodBarraTamanho.AsString
      else
        fDMCadDocEstoque.cdsDocEstoque_ItensTAMANHO.AsString := '';
      fDMCadDocEstoque.cdsDocEstoque_ItensQTD.AsInteger := 0;
    end;
    fDMCadDocEstoque.cdsDocEstoque_ItensVLR_UNITARIO.AsFloat    := StrToFloat(FormatFloat('0.0000',fDMCadDocEstoque.mAuxCodBarraPreco_Venda.AsFloat));
    fDMCadDocEstoque.cdsDocEstoque_ItensUNIDADE.AsString        := fDMCadDocEstoque.qCBarraUNIDADE.AsString;
    fDMCadDocEstoque.cdsDocEstoque_ItensQTD.AsInteger           := fDMCadDocEstoque.cdsDocEstoque_ItensQTD.AsInteger + 1;
    fDMCadDocEstoque.cdsDocEstoque_ItensVLR_TOTAL.AsFloat       := StrToFloat(FormatFloat('0.00',fDMCadDocEstoque.cdsDocEstoque_ItensVLR_UNITARIO.AsFloat * fDMCadDocEstoque.cdsDocEstoque_ItensQTD.AsInteger));
    fDMCadDocEstoque.cdsDocEstoque_ItensPERC_IPI.AsFloat        := 0;
    fDMCadDocEstoque.cdsDocEstoque_ItensID_MOVESTOQUE.AsInteger := 0;
    fDMCadDocEstoque.cdsDocEstoque_ItensID_CENTROCUSTO.Clear;
    fDMCadDocEstoque.cdsDocEstoque_ItensNUM_LOTE_CONTROLE.Clear;
    if StrToFloat(FormatFloat('0.0000',fDMCadDocEstoque.cdsDocEstoque_ItensVLR_UNITARIO.AsFloat)) > 0 then
      fDMCadDocEstoque.cdsDocEstoque_ItensGERAR_CUSTO.AsString    := 'N'
    else
      fDMCadDocEstoque.cdsDocEstoque_ItensGERAR_CUSTO.AsString    := 'S';
    fDMCadDocEstoque.cdsDocEstoque_Itens.Post;
    fDMCadDocEstoque.mAuxCodBarra.Delete;
  end;
end;

procedure TfrmCadDocEstoqueCB.RxDBLookupCombo3Exit(Sender: TObject);
begin
  Edit1.SetFocus;
end;

end.
