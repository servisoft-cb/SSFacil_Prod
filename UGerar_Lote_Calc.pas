unit UGerar_Lote_Calc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, UDMCadLote_Calc, StdCtrls,DB, dbXPress,
  SqlExpr, RzTabs, CurrEdit, Mask, ToolEdit, RxLookup, Menus, UCBase, ExtCtrls, NxCollection, NxEdit, DBVGrids, RzPanel,
  Grids, DBGrids, SMDBGrid, ComCtrls, UDMLoteImp_Calc;

type
  TfrmGerar_Lote_Calc = class(TForm)
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
    CurrencyEdit3: TCurrencyEdit;
    btnImprimir: TNxButton;
    UCControls1: TUCControls;
    TS_Pedidos: TRzTabSheet;
    Panel5: TPanel;
    btnConsultar_Pedidos_Ord: TNxButton;
    NxLabel15: TNxLabel;
    CurrencyEdit7: TCurrencyEdit;
    SMDBGrid4: TSMDBGrid;
    TS_Atualizar: TRzTabSheet;
    NxLabel16: TNxLabel;
    CurrencyEdit8: TCurrencyEdit;
    btnAtualizar_Mat: TNxButton;
    Label8: TLabel;
    Label9: TLabel;
    Edit3: TEdit;
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
    Edit2: TEdit;
    ckDtEntrega: TCheckBox;
    ckAgrupar_Pedido: TCheckBox;
    ckAgrupar_Prod: TCheckBox;
    ckAgrupar_cli: TCheckBox;
    NxLabel17: TNxLabel;
    NxComboBox1: TNxComboBox;
    ckdiv12: TCheckBox;
    ProgressBar2: TProgressBar;
    ProgressBar3: TProgressBar;
    ProgressBar4: TProgressBar;
    ProgressBar5: TProgressBar;
    ProgressBar6: TProgressBar;
    Label1: TLabel;
    NxLabel1: TNxLabel;
    CurrencyEdit4: TCurrencyEdit;
    RzPageControl1: TRzPageControl;
    TS_ConsLote_Talao: TRzTabSheet;
    SMDBGrid2: TSMDBGrid;
    VDBGrid1: TVDBGrid;
    TS_ConsNovo: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    SMDBGrid3: TSMDBGrid;
    Splitter1: TSplitter;
    Processos1: TMenuItem;
    TS_Processo: TRzTabSheet;
    SMDBGrid6: TSMDBGrid;
    NxButton1: TNxButton;
    NxButton2: TNxButton;
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
    procedure btnAtualizar_MatClick(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure SMDBGrid5GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure NxComboBox1Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NxComboBox1Change(Sender: TObject);
    procedure SMDBGrid5DblClick(Sender: TObject);
    procedure SMDBGrid5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SMDBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure Processos1Click(Sender: TObject);
    procedure SMDBGrid6TitleClick(Column: TColumn);
    procedure NxButton1Click(Sender: TObject);
    procedure NxButton2Click(Sender: TObject);
  private
    { Private declarations }
    fDMCadLote_Calc: TDMCadLote_Calc;
    fDMLoteImp_Calc: TDMLoteImp_Calc;

    vNumLote: Integer;
    vNumOrdem: Integer;
    vNumPedido: Integer;
    vItem_Mat: Integer;
    vQtd_Produto: Real;
    vQtd_Selecionada: Real;
    vQtdT : Integer;
    vID_Acum : Integer;
    vID_BaixaProcesso : Integer;

    procedure prc_Consultar_Ped;
    procedure prc_Gerar_mAcum;
    procedure prc_Gravar_Lote;
    procedure prc_Gravar_Talao(Qtd : Integer);

    procedure prc_Consultar_Lote;
    procedure prc_Consultar_Novo;
    procedure prc_Consultar_Processo;
    procedure prc_Processos;
    procedure prc_Gravar_Talao_Setor;

    procedure prc_Le_mLote;

    procedure prc_Limpar_Auxiliar;
    procedure prc_Limpar_Var;

    procedure prc_Gerar_Materiais(Tipo : String); //L=Lote  T=Talão
    procedure prc_Abrir_Lote_Mat(Num_Ordem: Integer);
    procedure prc_Gravar_Lote_Mat(Num_Ordem, ID_Material, ID_Cor, ID_Fornecedor: Integer ; Carimbo, Tamanho: String ; Qtd_Consumo, Qtd_Produto: Real ; ID_Setor : Integer);
    procedure prc_Consultar_Pedido_Ord;
    function fnc_Ordem_Producao_OC: Boolean;
    procedure prc_Atualizar_Material;

    procedure prc_Marcar_Desmarcar_PED(Tipo : String); //P=Pedido   TM=Total marcar    TD=Total Desmarcar

    procedure prc_Le_cdsPendente(ID, ITEM_ORIGINAL : Integer);

    procedure prc_Le_Original(ID : Integer);

    procedure prc_Gravar_Processo(Regravar : Boolean = False);

    procedure prc_scroll(DataSet: TDataSet);
    procedure prc_Imprimir(Arq : String);

  public
    { Public declarations }
  end;

var
  frmGerar_Lote_Calc: TfrmGerar_Lote_Calc;

implementation

uses rsDBUtils, DmdDatabase, uUtilPadrao, USel_Produto, UMenu,
  URelLote2, UMostraItens_Ped, UConsPedLote;

{$R *.dfm}

procedure TfrmGerar_Lote_Calc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(fDMLoteImp_Calc);
  Action := Cafree;
end;

procedure TfrmGerar_Lote_Calc.FormShow(Sender: TObject);
var
  i: Integer;
begin
  fDMCadLote_Calc := TDMCadLote_Calc.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMCadLote_Calc);
  fDMLoteImp_Calc := TDMLoteImp_Calc.Create(Self);

  DateEdit3.Date := Date;
  fDMCadLote_Calc.qProxima_Ordem.Close;
  fDMCadLote_Calc.qProxima_Ordem.Open;
  CurrencyEdit3.AsInteger := fDMCadLote_Calc.qProxima_OrdemNUM_ORDEM.AsInteger;
  CurrencyEdit4.AsInteger := fDMCadLote_Calc.qProxima_OrdemNUM_ORDEM.AsInteger;
  VDBGrid1.Visible := (fDMCadLote_Calc.qParametrosUSA_GRADE.AsString = 'S');
  Label9.Visible := (fDMCadLote_Calc.qParametrosGERAR_TALAO_AUXILIAR.AsString <> 'P');
  Edit3.Visible  := (fDMCadLote_Calc.qParametrosGERAR_TALAO_AUXILIAR.AsString <> 'P');

  ckFaturado.Visible := (fDMCadLote_Calc.qParametros_LoteLOTE_POR_PEDIDO.AsString <> 'S');
  NxFlipPanel1.Expanded := False;
  NxFlipPanel2.Expanded := False;

  NxComboBox1Exit(Sender);

  ckdiv12.Visible := (fDMCadLote_Calc.qParametros_LoteQTD_DIV_LOTE.AsInteger > 0);
  ckdiv12.Checked := (fDMCadLote_Calc.qParametros_LoteQTD_DIV_LOTE.AsInteger > 0);
  ckdiv12.Caption := 'Dividir por ' + fDMCadLote_Calc.qParametros_LoteQTD_DIV_LOTE.AsString;

  if (fDMCadLote_Calc.qParametros_LoteIMP_TALAO_POR.AsString = 'L') or (fDMCadLote_Calc.qParametros_LoteLOTE_CALCADO_NOVO.AsString = 'S') then
    NxComboBox1.ItemIndex := 0;
  NxComboBox1.Visible := (trim(fDMCadLote_Calc.qParametros_LoteLOTE_CALCADO_NOVO.AsString) <> 'S');
  NxLabel17.Visible   := (trim(fDMCadLote_Calc.qParametros_LoteLOTE_CALCADO_NOVO.AsString) <> 'S');
  for i := 1 to SMDBGrid2.ColCount - 2 do
  begin
    if (SMDBGrid2.Columns[i].FieldName = 'Tamanho') then
      SMDBGrid2.Columns[i].Visible := (NxComboBox1.ItemIndex = 1);
    if (SMDBGrid2.Columns[i].FieldName = 'Num_Talao') then
      SMDBGrid2.Columns[i].Visible := (NxComboBox1.ItemIndex = 1);
  end;
  TS_ConsNovo.TabVisible       := (fDMCadLote_Calc.qParametros_LoteLOTE_CALCADO_NOVO.AsString = 'S');
  TS_ConsLote_Talao.TabVisible := (fDMCadLote_Calc.qParametros_LoteLOTE_CALCADO_NOVO.AsString <> 'S');
  if (fDMCadLote_Calc.qParametros_LoteLOTE_CALCADO_NOVO.AsString = 'S') then
    RzPageControl1.ActivePage := TS_ConsNovo
  else
    RzPageControl1.ActivePage := TS_ConsLote_Talao;
  fDMCadLote_Calc.cdsConsLote_Novo.AFTERSCROLL := prc_scroll;
end;

procedure TfrmGerar_Lote_Calc.btnConsultar_PedidosClick(Sender: TObject);
begin
  prc_Consultar_Ped;
end;

procedure TfrmGerar_Lote_Calc.ckDtEntregaClick(Sender: TObject);
begin
  Label2.Visible    := not(ckDtEntrega.Checked);
  DateEdit3.Visible := not(ckDtEntrega.Checked);
end;

procedure TfrmGerar_Lote_Calc.btnConsultarClick(Sender: TObject);
begin
  if fDMCadLote_Calc.qParametros_LoteLOTE_CALCADO_NOVO.AsString = 'S' then
  begin
    if RzPageControl1.ActivePage = TS_Processo then
      prc_Consultar_Processo
    else
      prc_Consultar_Novo;
    exit;
  end;
  
  SMDBGrid2.DisableScroll;
  VDBGrid1.DataSource := nil;
  ProgressBar1.Visible := True;
  prc_Consultar_Lote;
  prc_Limpar_Auxiliar;
  fDMCadLote_Calc.qParametros.Close;
  fDMCadLote_Calc.qParametros.Open;
  if NxComboBox1.ItemIndex = 1 then
  begin
    fDMCadLote_Calc.mTalao.IndexFieldNames := 'Num_Lote;Num_Talao';
    fDMCadLote_Calc.mTalao.MasterFields    := 'Num_Lote;Num_Talao';
  end
  else
  begin
    fDMCadLote_Calc.mTalao.MasterFields    := 'Num_Lote';
    fDMCadLote_Calc.mTalao.IndexFieldNames := 'Num_Lote;Tamanho';
  end;
  ProgressBar1.Max := fDMCadLote_Calc.cdsConsulta_Lote.RecordCount;
  fDMCadLote_Calc.cdsConsulta_Lote.First;
  while not fDMCadLote_Calc.cdsConsulta_Lote.Eof do
  begin
    ProgressBar1.Position := ProgressBar1.Position + 1;
    fDMCadLote_Calc.vTalao_Loc := 0;
    if fDMCadLote_Calc.qParametrosGERAR_TALAO_AUXILIAR.AsString = 'P' then
      fDMCadLote_Calc.prc_Gravar_mLote('T','L',fDMCadLote_Calc.cdsConsulta_LoteQTD.AsFloat)
    else
    begin
      if NxComboBox1.ItemIndex = 1 then
        fDMCadLote_Calc.prc_Gravar_mLote('L','T',fDMCadLote_Calc.cdsConsulta_LoteQTD.AsFloat)
      else
      if NxComboBox1.ItemIndex = 2 then
        fDMCadLote_Calc.prc_Gravar_mLote('L','A',fDMCadLote_Calc.cdsConsulta_LoteQTD.AsFloat)
      else
        fDMCadLote_Calc.prc_Gravar_mLote('L','L',fDMCadLote_Calc.cdsConsulta_LoteQTD.AsFloat);
    end;
    fDMCadLote_Calc.cdsConsulta_Lote.Next;
  end;
  VDBGrid1.DataSource := fDMCadLote_Calc.dsmTalao;
  SMDBGrid2.EnableScroll;
  ProgressBar1.Visible := False;
end;

procedure TfrmGerar_Lote_Calc.prc_Consultar_Lote;
var
  vComando: String;
  vDescData: String;
begin
  case cbxOpcaoData.ItemIndex of
    0: vDescData := 'L.DTEMISSAO';
    1: vDescData := 'L.DTENTREGA';
  end;
  fDMCadLote_Calc.cdsConsulta_Lote.Close;
  fDMCadLote_Calc.sdsConsulta_Lote.CommandText := fDMCadLote_Calc.ctConsulta_Lote + ' WHERE 0 = 0 ';
  vComando := '';
  if CurrencyEdit1.AsInteger > 0 then
    vComando :=  vComando + ' AND L.NUM_LOTE >= ' + CurrencyEdit1.Text;
  if CurrencyEdit2.AsInteger > 0 then
    vComando :=  vComando + ' AND L.NUM_LOTE <= ' + CurrencyEdit2.Text;
  if CurrencyEdit3.AsInteger > 0 then
    vComando :=  vComando + ' AND L.NUM_ORDEM >= ' + CurrencyEdit3.Text;
  if CurrencyEdit4.AsInteger > 0 then
    vComando :=  vComando + ' AND L.NUM_ORDEM <= ' + CurrencyEdit4.Text;

  if DateEdit1.Date > 10 then
    vComando := vComando + ' AND ' + vDescData + ' >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    vComando := vComando + ' AND ' + vDescData + ' <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  case cbxOpcao.ItemIndex of
    0: vComando := vComando + ' AND T.QTD_PENDENTE > 0';
    1: vComando := vComando + ' AND T.QTD_PRODUZIDO > 0';
  end;
  if RxDBLookupCombo1.Text <> '' then
    vComando := vComando + ' AND T.ID_PRODUTO = ' + IntToStr(RxDBLookupCombo1.KeyValue);
  if trim(Edit3.Text) <> '' then
    vComando := vComando + ' AND L.NOME LIKE ' + QuotedStr('%'+Edit3.Text+'%');
  fDMCadLote_Calc.sdsConsulta_Lote.CommandText := fDMCadLote_Calc.sdsConsulta_Lote.CommandText + vComando;
  fDMCadLote_Calc.cdsConsulta_Lote.Open;
  fDMCadLote_Calc.cdsConsulta_Lote.IndexFieldNames := 'NUM_ORDEM;ID_PRODUTO;ID_COMBINACAO;TAMANHO';
end;

procedure TfrmGerar_Lote_Calc.RxDBLookupCombo1Enter(Sender: TObject);
begin
  fDMCadLote_Calc.cdsProduto.IndexFieldNames := 'REFERENCIA';
end;

procedure TfrmGerar_Lote_Calc.RxDBLookupCombo1KeyDown(Sender: TObject;
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

procedure TfrmGerar_Lote_Calc.Lote1Click(Sender: TObject);
var
  vArq : String;
begin
  if (RzPageControl1.ActivePage <> TS_ConsLote_Talao) and (RzPageControl1.ActivePage <> TS_ConsNovo) then
  begin
    MessageDlg('*** Para imprimir os Talões/Lote é preciso estar na Aba "Lote/Talão"!', mtInformation, [mbOk], 0);
    exit;
  end;

  fDMLoteImp_Calc.vTipo_Imp := 'L';
  if fDMCadLote_Calc.qParametros_LoteTIPO_PROCESSO.AsString = 'L' then
  begin
    vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Lote_Lotus.fr3';
    prc_Imprimir(vArq);
    exit;
  end;

  SMDBGrid2.DisableScroll;
  prc_Le_mLote;
  fDMCadLote_Calc.mMaterial.First;
  while not fDMCadLote_Calc.mMaterial.Eof do
  begin
    fDMCadLote_Calc.mMaterial_Tam.First;
    while not fDMCadLote_Calc.mMaterial_Tam.Eof do
      fDMCadLote_Calc.mMaterial_Tam.Delete;
    fDMCadLote_Calc.mMaterial.Delete;
  end;

  fRelLote2            := TfRelLote2.Create(Self);
  fRelLote2.Tag        := 1;
  fRelLote2.fDMCadLote_Calc := fDMCadLote_Calc;
  if NxComboBox1.ItemIndex = 1 then
    fRelLote2.vTipo_Rel  := 'T'
  else
    fRelLote2.vTipo_Rel  := 'L';
  fRelLote2.RLReport1.PreviewModal;
  fRelLote2.RLReport1.Free;
  FreeAndNil(fRelLote2);
  SMDBGrid2.EnableScroll;
end;

procedure TfrmGerar_Lote_Calc.prc_Limpar_Auxiliar;
begin
  fDMCadLote_Calc.mLote.First;
  while not fDMCadLote_Calc.mLote.eof do
  begin
    fDMCadLote_Calc.mTalao.First;
    while not fDMCadLote_Calc.mTalao.Eof do
      fDMCadLote_Calc.mTalao.Delete;
    fDMCadLote_Calc.mLote.Delete;
  end;
  fDMCadLote_Calc.mMaterial.First;
  while not fDMCadLote_Calc.mMaterial.Eof do
  begin
    fDMCadLote_Calc.mMaterial_Tam.First;
    while not fDMCadLote_Calc.mMaterial_Tam.Eof do
      fDMCadLote_Calc.mMaterial_Tam.Delete;
    fDMCadLote_Calc.mMaterial.Delete;
  end;
  fDMCadLote_Calc.mTamanho.First;
  while not fDMCadLote_Calc.mTamanho.Eof do
    fDMCadLote_Calc.mTamanho.Delete;
end;

procedure TfrmGerar_Lote_Calc.SMDBGrid2TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  if Column.FieldName = 'Num_Lote' then
    fDMCadLote_Calc.mLote.IndexFieldNames := Column.FieldName + ';Num_Talao'
  else
    fDMCadLote_Calc.mLote.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid2.Columns.Count - 1 do
    if not (SMDBGrid2.Columns.Items[I] = Column) then
      SMDBGrid2.Columns.Items[I].Title.Color := clBtnFace;
end;

procedure TfrmGerar_Lote_Calc.btnConfirmarClick(Sender: TObject);
var
  ID: TTransactionDesc;
  sds: TSQLDataSet;
  vID_Ant : Integer;
  vFlag : Boolean;
  vQtdAux : Integer;
  vQtdTotal : Integer;
begin
  if MessageDlg('Gerar Lote/Talões?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  if not(ckDtEntrega.Checked) and (DateEdit3.Date < 10) then
  begin
    MessageDlg('*** Data de entrega do Lote/Talão não informada!', mtError, [mbOk], 0);
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

  vID_BaixaProcesso := 0;

  ProgressBar2.Visible := True;
  ProgressBar3.Visible := True;
  ProgressBar4.Visible := True;
  ProgressBar5.Visible := True;
  ProgressBar6.Visible := True;

  fDMCadLote_Calc.cdsSetor_Talao.Close;
  fDMCadLote_Calc.cdsSetor_Talao.Open;

  vNumLote  := 0;
  vNumOrdem := 0;
  vID_Acum  := 0;
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
      fDMCadLote_Calc.mAcum.Delete;
    end;

    fDMCadLote_Calc.prc_Localizar(-1);

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
      begin
        prc_Gravar_Lote;
        //if fDMCadLote_Calc.qParametros_LoteTIPO_PROCESSO.AsString = 'L' then
        //  prc_Gravar_Processo;
      end;
      fDMCadLote_Calc.mAcum_Tam.First;
      while not fDMCadLote_Calc.mAcum_Tam.Eof do
      begin
        vQtdTotal := fDMCadLote_Calc.mAcum_TamQtd.AsInteger;
        vFlag := False;
        while not vFlag do
        begin
          vQtdAux := vQtdTotal;
          if (ckdiv12.Checked) and (fDMCadLote_Calc.qParametros_LoteQTD_DIV_LOTE.AsInteger > 0) then //Quem usa essa parte é a RGB
          begin
            if vQtdTotal > 12 then
              vQtdAux := 12;
          end;
          vQtdTotal := vQtdTotal - vQtdAux;
          prc_Gravar_Talao(vQtdAux);
          if vQtdTotal <= 0 then
            vFlag := True;
        end;
        fDMCadLote_Calc.mAcum_Tam.Next;
      end;

      if (vID_Ant <> fDMCadLote_Calc.mAcumID.AsInteger) and (fDMCadLote_Calc.qParametros_LoteTIPO_PROCESSO.AsString = 'L') then
        prc_Gravar_Processo;

      vID_Ant := fDMCadLote_Calc.mAcumID.AsInteger;
      fDMCadLote_Calc.mAcum.Next;
    end;

    if not fDMCadLote_Calc.cdsLote.IsEmpty then
    begin
      ProgressBar3.Max      := fDMCadLote_Calc.cdsLote.RecordCount;
      ProgressBar3.Position := 0;

      fDMCadLote_Calc.cdsLote.First;
      prc_Abrir_Lote_Mat(fDMCadLote_Calc.cdsLoteNUM_ORDEM.AsInteger);
      fDMCadLote_Calc.cdsLote_Mat.Last;
      vItem_Mat := fDMCadLote_Calc.cdsLote_MatITEM.AsInteger;
      while not fDMCadLote_Calc.cdsLote.Eof do
      begin
        ProgressBar3.Position := ProgressBar3.Position + 1;
        prc_Gerar_Materiais('L');

        fDMCadLote_Calc.cdsLote.Next;
      end;

      fDMCadLote_Calc.cdsLote.ApplyUpdates(0);
      if (fDMCadLote_Calc.qParametros_LoteTIPO_PROCESSO.AsString = 'L') and (vID_BaixaProcesso > 0) then
        fDMCadLote_Calc.cdsBaixa_Processo.ApplyUpdates(0);

      MessageDlg('*** Lotes/Talões Gerados!', mtInformation, [mbok], 0);
      dmDatabase.scoDados.Commit(ID);
      prc_Limpar_Var;
      CurrencyEdit3.AsInteger := vNumOrdem;
      CurrencyEdit4.AsInteger := vNumOrdem;
      //btnConsultar_PedidosClick(Sender);
      RzPageControl2.ActivePage := TS_Consulta;
      btnConsultarClick(Sender);
    end
    else
    begin
      MessageDlg('*** Nenhum pedido selecionado!' +  fDMCadLote_Calc.cdsLoteNUM_LOTE.AsString, mtInformation, [mbok], 0);
      dmDatabase.scoDados.Rollback(ID);
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

procedure TfrmGerar_Lote_Calc.prc_Limpar_Var;
begin
  CurrencyEdit1.Clear;
  CurrencyEdit2.Clear;
  CurrencyEdit3.Clear;
  DateEdit1.Clear;
  DateEdit2.Clear;
  cbxOpcao.ItemIndex := 0;
  RxDBLookupCombo1.ClearValue;
end;

procedure TfrmGerar_Lote_Calc.btnExcluirClick(Sender: TObject);
var
  vNumOrdemAux: String;
  sds: TSQLDataSet;
begin
  if MessageDlg('Deseja excluir os Lotes/Talões selecionados?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  vNumOrdemAux := InputBox('Exclusão dos Lotes/Talões','Informe o número do controle: ', '');
  vNumOrdemAux := Monta_Numero(vNumOrdemAux,0);
  if (trim(vNumOrdemAux) = '') or (vNumOrdemAux = '0') then
    exit;

  fDMCadLote_Calc.qVerificaExclusao.Close;
  fDMCadLote_Calc.qVerificaExclusao.ParamByName('NUM_ORDEM').AsInteger := StrToInt(vNumOrdemAux);
  fDMCadLote_Calc.qVerificaExclusao.Open;
  if fDMCadLote_Calc.qVerificaExclusaoCOUNT.AsInteger > 0 then
  begin
    MessageDlg('*** Existe Lote/Talão baixado, exclusão cancelada!', mtError, [mbOk], 0);
    exit;
  end;
  fDMCadLote_Calc.qVerificaExclusao2.Close;
  fDMCadLote_Calc.qVerificaExclusao2.ParamByName('NUM_ORDEM').AsInteger := StrToInt(vNumOrdemAux);
  fDMCadLote_Calc.qVerificaExclusao2.Open;
  if fDMCadLote_Calc.qVerificaExclusao2Contador.AsInteger > 0 then
  begin
    MessageDlg('*** Existe Ordem de compra gerada para esta Ordem de Produção!', mtError, [mbOk], 0);
    exit;
  end;

  fDMCadLote_Calc.cdsConsLote_Novo.AFTERSCROLL := nil;
  sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  sds.NoMetadata    := True;
  sds.GetMetadata   := False;
  try
    if fDMCadLote_Calc.qParametros_LoteTIPO_PROCESSO.AsString = 'L' then
    begin
      sds.CommandText   := ' DELETE FROM BAIXA_PROCESSO  '
                       + ' WHERE NUM_ORDEM = ' + vNumOrdemAux;
      sds.ExecSQL();
    end;

    sds.CommandText   := ' DELETE FROM LOTE  '
                     + ' WHERE NUM_ORDEM = ' + vNumOrdemAux;
    sds.ExecSQL();

    sds.CommandText   := ' DELETE FROM LOTE_MAT  '
                     + ' WHERE NUM_ORDEM = ' + vNumOrdemAux;
    sds.ExecSQL();


    MessageDlg('*** Nº Controle ' + vNumOrdemAux + ' excluído!', mtInformation, [mbok], 0);

  finally
    FreeAndNil(sds);
    btnConsultarClick(Sender);
  end;
  fDMCadLote_Calc.cdsConsBaixaProc.Close;
  fDMCadLote_Calc.cdsConsLote_Novo.AFTERSCROLL := prc_scroll;
end;

procedure TfrmGerar_Lote_Calc.RzPageControl2Change(Sender: TObject);
begin
  if RzPageControl2.ActivePage = TS_Gerar then
    btnConsultar_PedidosClick(Sender)
  else
  if RzPageControl2.ActivePage = TS_Consulta then
  begin
    if CurrencyEdit3.AsInteger <= 0 then
    begin
      fDMCadLote_Calc.qProxima_Ordem.Close;
      fDMCadLote_Calc.qProxima_Ordem.Open;
      CurrencyEdit3.AsInteger := fDMCadLote_Calc.qProxima_OrdemNUM_ORDEM.AsInteger;
    end;
  end;
end;

procedure TfrmGerar_Lote_Calc.prc_Le_mLote;
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

procedure TfrmGerar_Lote_Calc.ComboBox1Change(Sender: TObject);
begin
  Edit1.Visible := (ComboBox1.ItemIndex = 1);
end;

procedure TfrmGerar_Lote_Calc.prc_Gerar_Materiais(Tipo : String); //L=Lote  T=Talão
var
  vCarimbo: String;
  vTamanho: String;
  vID_Cor: Integer;
  vQtdAux: Real;
  vID_CorAnt, vID_MaterialAnt: Integer;
  vTamAux : String;
begin
  fDMCadLote_Calc.cdsConsumoCalc.Close;
  fDMCadLote_Calc.sdsConsumoCalc.ParamByName('ID_COMBINACAO').AsInteger := fDMCadLote_Calc.cdsLoteID_COMBINACAO.AsInteger;
  fDMCadLote_Calc.sdsConsumoCalc.ParamByName('ID_PRODUTO').AsInteger    := fDMCadLote_Calc.cdsLoteID_PRODUTO.AsInteger;
  fDMCadLote_Calc.cdsConsumoCalc.Open;
  if fDMCadLote_Calc.cdsConsumoCalc.IsEmpty then
    exit;

  ProgressBar4.Max      := fDMCadLote_Calc.cdsConsumoCalc.RecordCount;
  ProgressBar4.Position := 0;

  vID_CorAnt      := 0;
  vID_MaterialAnt := 0;
  fDMCadLote_Calc.cdsConsumoCalc.First;
  while not fDMCadLote_Calc.cdsConsumoCalc.Eof do
  begin
    ProgressBar4.Position := ProgressBar4.Position + 1;
    //if fDMCadLote_Calc.cdsConsumoCalcID_MATERIAL.AsInteger = 11190 then
      //showmessage('material 11190');

    vCarimbo := fDMCadLote_Calc.cdsLoteCARIMBO.AsString;
    if (fDMCadLote_Calc.cdsConsumoCalcTRANSFER.AsString <> 'S') and (fDMCadLote_Calc.cdsConsumoCalcUSA_CARIMBO_OC.AsString <> 'S') then
      vCarimbo := '';
    if fDMCadLote_Calc.cdsConsumoCalcID_COR_MAT.AsInteger <= 0 then
      vID_Cor := 0
    else
      vID_Cor := fDMCadLote_Calc.cdsConsumoCalcID_COR_MAT.AsInteger;
    if (vID_MaterialAnt <> fDMCadLote_Calc.cdsConsumoCalcID_MATERIAL.AsInteger) or (vID_CorAnt <> fDMCadLote_Calc.cdsConsumoCalcID_COR_MAT.AsInteger) then
      vQtd_Produto := fDMCadLote_Calc.cdsLoteQTD.AsFloat
    else
      vQtd_Produto := 0;
    vTamanho := '';
    vQtdAux  := StrToFloat(FormatFloat('0.00000',fDMCadLote_Calc.cdsConsumoCalcQTD_CONSUMO.AsFloat));
    if (fDMCadLote_Calc.cdsConsumoCalcID_GRADE_MAT.AsInteger > 0) or (fDMCadLote_Calc.cdsConsumoCalcTIPO_CONSUMO.AsString = 'T') then
    begin
      fDMCadLote_Calc.cdsTalao.First;
      while not fDMCadLote_Calc.cdsTalao.Eof do
      begin
        if (fDMCadLote_Calc.cdsConsumoCalcTIPO_CONSUMO.AsString = 'T') then
        begin
          fDMCadLote_Calc.qConsumo_Tam.Close;
          fDMCadLote_Calc.qConsumo_Tam.ParamByName('ID').AsInteger     := fDMCadLote_Calc.cdsConsumoCalcID.AsInteger;
          fDMCadLote_Calc.qConsumo_Tam.ParamByName('ITEM').AsInteger   := fDMCadLote_Calc.cdsConsumoCalcITEM_CONSUMO.AsInteger;
          fDMCadLote_Calc.qConsumo_Tam.ParamByName('TAMANHO').AsString := vTamanho;
          fDMCadLote_Calc.qConsumo_Tam.Open;
          vQtdAux := StrToFloat(FormatFloat('0.00000',fDMCadLote_Calc.qConsumo_TamQTD_CONSUMO.AsFloat));
        end;
        if fDMCadLote_Calc.cdsConsumoCalcID_GRADE_MAT.AsInteger > 0 then
          vTamanho := fDMCadLote_Calc.cdsTalaoTAMANHO.AsString;
        //17/09/2017  
        if fDMCadLote_Calc.cdsConsumoCalcID_GRADE_MAT.AsInteger > 0 then
        begin
          if fDMCadLote_Calc.qParametros_ProdUSA_TAM_REFER_GRADE.AsString = 'S' then
            vTamAux := fnc_Busca_Tam_Material2(fDMCadLote_Calc.cdsConsumoCalcID_MATERIAL.AsInteger,fDMCadLote_Calc.cdsConsumoCalcID_GRADE_PROD.AsInteger,vTamanho)
          else
            vTamAux := fnc_Busca_Tam_Material(fDMCadLote_Calc.cdsConsumoCalcID_MATERIAL.AsInteger,vTamanho);
          if trim(vTamAux) <> '' then
            vTamanho := vTamAux;
        end;
        //*************

        if StrToFloat(FormatFloat('0.000',vQtd_Produto)) > 0 then
          vQtd_Produto := fDMCadLote_Calc.cdsTalaoQTD.AsFloat;

        prc_Gravar_Lote_Mat(fDMCadLote_Calc.cdsLoteNUM_ORDEM.AsInteger,fDMCadLote_Calc.cdsConsumoCalcID_MATERIAL.AsInteger,vID_Cor,fDMCadLote_Calc.cdsConsumoCalcID_FORNECEDOR.AsInteger,vCarimbo,vTamanho,
                            vQtdAux,fDMCadLote_Calc.cdsTalaoQTD.AsFloat,fDMCadLote_Calc.cdsConsumoCalcID_SETOR.AsInteger);
        fDMCadLote_Calc.cdsTalao.Next;
      end;
    end
    else
      prc_Gravar_Lote_Mat(fDMCadLote_Calc.cdsLoteNUM_ORDEM.AsInteger,fDMCadLote_Calc.cdsConsumoCalcID_MATERIAL.AsInteger,vID_Cor,fDMCadLote_Calc.cdsConsumoCalcID_FORNECEDOR.AsInteger,vCarimbo,vTamanho,
                          vQtdAux,fDMCadLote_Calc.cdsLoteQTD.AsFloat,fDMCadLote_Calc.cdsConsumoCalcID_SETOR.AsInteger);

    vID_CorAnt      := fDMCadLote_Calc.cdsConsumoCalcID_COR_MAT.AsInteger;
    vID_MaterialAnt := fDMCadLote_Calc.cdsConsumoCalcID_MATERIAL.AsInteger;
    fDMCadLote_Calc.cdsConsumoCalc.Next;
  end;
  fDMCadLote_Calc.cdsLote_Mat.ApplyUpdates(0);
end;

procedure TfrmGerar_Lote_Calc.prc_Abrir_Lote_Mat(Num_Ordem: Integer);
begin
  fDMCadLote_Calc.cdsLote_Mat.Close;
  fDMCadLote_Calc.sdsLote_Mat.ParamByName('NUM_ORDEM').AsInteger := Num_Ordem;
  fDMCadLote_Calc.cdsLote_Mat.Open;
end;

procedure TfrmGerar_Lote_Calc.prc_Gravar_Lote_Mat(Num_Ordem, ID_Material,
  ID_Cor, ID_Fornecedor: Integer; Carimbo, Tamanho: String; Qtd_Consumo,
  Qtd_Produto: Real ; ID_Setor : Integer);
var
  vCarimboAux: String;  
begin
  vCarimboAux := '';
  if trim(Carimbo) <> '' then
    vCarimboAux := trim(TirarAcento(Carimbo));
  if fDMCadLote_Calc.qParametros_LoteGERAR_SETOR_MAT.AsString <> 'S' then
    ID_Setor := 0;

  if fDMCadLote_Calc.cdsLote_Mat.Locate('NUM_ORDEM;ID_MATERIAL;ID_COR;CARIMBOAUX;TAMANHO;ID_SETOR',VarArrayOf([Num_Ordem,ID_Material,ID_Cor,vCarimboAux,Tamanho,ID_Setor]),[locaseinsensitive]) then
    fDMCadLote_Calc.cdsLote_Mat.Edit
  else
  begin
    vItem_Mat := vItem_Mat + 1;
    fDMCadLote_Calc.cdsLote_Mat.Insert;
    fDMCadLote_Calc.cdsLote_MatNUM_ORDEM.AsInteger     := Num_Ordem;
    fDMCadLote_Calc.cdsLote_MatITEM.AsInteger          := vItem_Mat;
    fDMCadLote_Calc.cdsLote_MatID_MATERIAL.AsInteger   := ID_Material;
    fDMCadLote_Calc.cdsLote_MatID_COR.AsInteger        := ID_Cor;
    fDMCadLote_Calc.cdsLote_MatCARIMBOAUX.AsString     := vCarimboAux;
    fDMCadLote_Calc.cdsLote_MatCARIMBO.AsString        := Carimbo;
    fDMCadLote_Calc.cdsLote_MatTAMANHO.AsString        := Tamanho;
    fDMCadLote_Calc.cdsLote_MatID_SETOR.AsInteger      := ID_Setor;
    fDMCadLote_Calc.cdsLote_MatQTD_CONSUMO.AsFloat     := 0;
    fDMCadLote_Calc.cdsLote_MatQTD_PRODUTO.AsFloat     := 0;
    fDMCadLote_Calc.cdsLote_MatID_FORNECEDOR.AsInteger := ID_Fornecedor;
    fDMCadLote_Calc.cdsLote_MatQtd_OC_Fat.AsFloat      := 0;
    fDMCadLote_Calc.cdsLote_MatGerado.AsString         := 'N';
  end;
  Qtd_Consumo := StrToFloat(FormatFloat('0.0000',Qtd_Consumo * Qtd_Produto));
  fDMCadLote_Calc.cdsLote_MatQTD_CONSUMO.AsFloat := StrToFloat(FormatFloat('0.0000',fDMCadLote_Calc.cdsLote_MatQTD_CONSUMO.AsFloat + Qtd_Consumo));
  fDMCadLote_Calc.cdsLote_MatQTD_PRODUTO.AsFloat := fDMCadLote_Calc.cdsLote_MatQTD_PRODUTO.AsFloat + vQtd_Produto;
  fDMCadLote_Calc.cdsLote_Mat.Post;
end;

procedure TfrmGerar_Lote_Calc.btnConsultar_Pedidos_OrdClick(
  Sender: TObject);
begin
  prc_Consultar_Pedido_Ord;
end;

procedure TfrmGerar_Lote_Calc.prc_Consultar_Pedido_Ord;
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

procedure TfrmGerar_Lote_Calc.btnAtualizar_MatClick(Sender: TObject);
begin
  if CurrencyEdit8.AsInteger <= 0 then
  begin
    MessageDlg('*** Nº Ordem de Produção não informada!', mtInformation, [mbOk], 0);
    exit;
  end;
  if fnc_Ordem_Producao_OC then
    exit;

  prc_Atualizar_Material;
  CurrencyEdit8.AsInteger := 0;
end;

function TfrmGerar_Lote_Calc.fnc_Ordem_Producao_OC: Boolean;
var
  sds: TSQLDataSet;
begin
  Result := False;
  sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  sds.NoMetadata    := True;
  sds.GetMetadata   := False;
  sds.CommandText := ' SELECT COUNT(1) CONTADOR FROM lote_mat M  WHERE M.num_ordem = :NUM_ORDEM  AND M.id_oc > 0 ';
  sds.ParamByName('NUM_ORDEM').AsInteger := CurrencyEdit8.AsInteger;
  sds.Open;
  if sds.FieldByName('CONTADOR').AsInteger > 0 then
  begin
    MessageDlg('*** Ordem de produção já gerada Ordem de Compra para Fornecedor!', mtInformation, [mbOk], 0);
    Result := True;
  end;
  FreeAndNil(sds);
end;

procedure TfrmGerar_Lote_Calc.prc_Atualizar_Material;
var
  sds: TSQLDataSet;
begin
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText := ' DELETE from LOTE_MAT WHERE NUM_ORDEM = :NUM_ORDEM ';
    sds.ParamByName('NUM_ORDEM').AsInteger := CurrencyEdit8.AsInteger;
    sds.ExecSQL();

    prc_Abrir_Lote_Mat(CurrencyEdit8.AsInteger);

    Label8.Caption := '..... Aguarde Gerando MATERIAIS .....';
    Label8.Visible := True;
    Label8.Refresh;

    sds.Close;
    sds.CommandText := 'SELECT ID FROM LOTE WHERE NUM_ORDEM = :NUM_ORDEM';
    sds.ParamByName('NUM_ORDEM').AsInteger := CurrencyEdit8.AsInteger;
    sds.Open;
    sds.First;
    while not sds.Eof do
    begin
      fDMCadLote_Calc.prc_Localizar(sds.FieldByName('ID').AsInteger);
      if not fDMCadLote_Calc.cdsLote.IsEmpty then
        prc_Gerar_Materiais('L');
      sds.Next;
    end;
  finally
    FreeAndNil(sds);
  end;
  MessageDlg('*** Materiais atualizados!', mtConfirmation, [mbOk], 0);

  Label8.Visible := False;

end;

procedure TfrmGerar_Lote_Calc.MenuItem3Click(Sender: TObject);
begin
  prc_Marcar_Desmarcar_Ped('P');
end;

procedure TfrmGerar_Lote_Calc.prc_Marcar_Desmarcar_PED(Tipo: String);//P=Pedido   TM=Total marcar    TD=Total Desmarcar
var
  vMarcar : String;
  ID : Integer;
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

procedure TfrmGerar_Lote_Calc.MenuItem4Click(Sender: TObject);
begin
  prc_Marcar_Desmarcar_Ped('TM');
end;

procedure TfrmGerar_Lote_Calc.MenuItem5Click(Sender: TObject);
begin
  prc_Marcar_Desmarcar_Ped('TD');
end;

procedure TfrmGerar_Lote_Calc.SMDBGrid5GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMCadLote_Calc.cdsPendente_PedSELECIONADO.AsString = 'S' then
  begin
    Background  := $00FFFFBB;
    aFont.Color := clBlack;
  end;
end;

procedure TfrmGerar_Lote_Calc.prc_Consultar_Ped;
var
  vTextoData : String;
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
  fDMCadLote_Calc.cdsPendente_Ped.Open;
  fDMCadLote_Calc.cdsPendente_Ped.IndexFieldNames := 'NUM_PEDIDO';
end;

procedure TfrmGerar_Lote_Calc.prc_Le_cdsPendente(ID, ITEM_ORIGINAL : Integer);
begin
  vNumPedido  := 0;
  fDMCadLote_Calc.cdsPendente.First;
  while not fDMCadLote_Calc.cdsPendente.Eof do
  begin
    if fDMCadLote_Calc.cdsPendenteQTD_RESTANTE.AsInteger > 0 then
      prc_Gerar_mAcum;
    fDMCadLote_Calc.cdsPendente.Next;
  end;
end;

procedure TfrmGerar_Lote_Calc.prc_Le_Original(ID: Integer);
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

    prc_Gerar_mAcum;

    //prc_Le_cdsPendente(ID,fDMCadLote_Calc.cdsPedOriginalITEM_ORIGINAL.AsInteger);

    fDMCadLote_Calc.cdsPedOriginal.Next;
  end;
end;

procedure TfrmGerar_Lote_Calc.NxComboBox1Exit(Sender: TObject);
var
  i : Integer;
begin
  for i := 1 to SMDBGrid2.ColCount - 2 do
  begin
    if (SMDBGrid2.Columns[i].FieldName = 'Tamanho') then
      SMDBGrid2.Columns[i].Visible := (NxComboBox1.ItemIndex = 1);
  end;
end;

procedure TfrmGerar_Lote_Calc.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 87) then //CTRL W
    ckdiv12.Visible := not(ckdiv12.Visible);
end;

procedure TfrmGerar_Lote_Calc.NxComboBox1Change(Sender: TObject);
begin
  prc_Limpar_Auxiliar;
end;

procedure TfrmGerar_Lote_Calc.SMDBGrid5DblClick(Sender: TObject);
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

procedure TfrmGerar_Lote_Calc.prc_Gerar_mAcum;
var
  vData: TDateTime;
  vCarimboAux: String;
  vID_CombinacaoAux: Integer;
  vNumPedAux: Integer;
  vID_Cliente : Integer;
  vID_Pedido : Integer;
  vItem_Orig : Integer;
  vTamanho : String;
  vCaixinha : String;
begin
  fDMCadLote_Calc.cdsPendente.First;
  if (ckDtEntrega.Checked) and (fDMCadLote_Calc.cdsPedOriginalDTENTREGA.AsDateTime > 10) then
    vData := fDMCadLote_Calc.cdsPedOriginalDTENTREGA.AsDateTime
  else
    vData := DateEdit3.Date;
  vCarimboAux       := '';
  vID_CombinacaoAux := 0;
  if (ComboBox1.ItemIndex = 1) and (trim(Edit1.Text) <> '') then
    vCarimboAux := Edit1.Text
  else
  if fDMCadLote_Calc.cdsPedOriginalCARIMBO.AsString <> '' then
    vCarimboAux := fDMCadLote_Calc.cdsPedOriginalCARIMBO.AsString;
  vID_Cliente := 0;
  if not ckAgrupar_cli.Checked then //aqui busca do pendente para pegar o cliente   24/10/2018
    vID_Cliente := fDMCadLote_Calc.cdsPendenteID_CLIENTE.AsInteger;
  if fDMCadLote_Calc.cdsPedOriginalID_COR.AsInteger > 0 then
    vID_CombinacaoAux := fDMCadLote_Calc.cdsPedOriginalID_COR.AsInteger;
  if not ckAgrupar_Pedido.Checked then
    vID_Pedido := fDMCadLote_Calc.cdsPedOriginalID.AsInteger
  else
    vID_Pedido := 0;
  if ckAgrupar_Prod.Checked then
    vItem_Orig := 0
  else
    vItem_Orig := fDMCadLote_Calc.cdsPedOriginalITEM_ORIGINAL.AsInteger;
  vCaixinha := '';
  if trim(fDMCadLote_Calc.cdsPedOriginalCAIXINHA.AsString) <> '' then
    vCaixinha := fDMCadLote_Calc.cdsPedOriginalCAIXINHA.AsString;
  if (fDMCadLote_Calc.mAcum.Locate('ID_PRODUTO;ID_COMBINACAO;DTENTREGA;CARIMBO;ID_PEDIDO;ITEM_ORIGINAL;CAIXINHA',
                                      VarArrayOf([fDMCadLote_Calc.cdsPedOriginalID_PRODUTO.AsInteger,vID_CombinacaoAux,vData,vCarimboAux,
                                                  vID_Pedido,vItem_Orig,vCaixinha]),[locaseinsensitive])) then
    fDMCadLote_Calc.mAcum.Edit
  else
  begin
    vID_Acum := vID_Acum + 1;
    fDMCadLote_Calc.mAcum.Insert;
    fDMCadLote_Calc.mAcumID.AsInteger            := vID_Acum;
    fDMCadLote_Calc.mAcumID_Produto.AsInteger    := fDMCadLote_Calc.cdsPedOriginalID_PRODUTO.AsInteger;
    fDMCadLote_Calc.mAcumID_Combinacao.AsInteger := vID_CombinacaoAux;
    fDMCadLote_Calc.mAcumID_Pedido.AsInteger     := vID_Pedido;
    fDMCadLote_Calc.mAcumID_Cliente.AsInteger    := vID_Cliente;
    fDMCadLote_Calc.mAcumDtEntrega.AsDateTime    := vData;
    fDMCadLote_Calc.mAcumItem_Original.AsInteger := vItem_Orig;
    fDMCadLote_Calc.mAcumCarimbo.AsString        := vCarimboAux;
    fDMCadLote_Calc.mAcumReferencia.AsString     := fDMCadLote_Calc.cdsPedOriginalREFERENCIA.AsString;
    fDMCadLote_Calc.mAcumCaixinha.AsString       := vCaixinha;
  end;

  fDMCadLote_Calc.mAcumQtd.AsInteger := fDMCadLote_Calc.mAcumQtd.AsInteger + fDMCadLote_Calc.cdsPedOriginalQTD_RESTANTE.AsInteger;
  fDMCadLote_Calc.mAcum.Post;

  //24/10/2018 Foi transferido a leitura do pendente para cá, pois ele vai servir para gravar somente os tamanhos
  fDMCadLote_Calc.cdsPendente.First;
  while not fDMCadLote_Calc.cdsPendente.Eof do
  begin
    vTamanho := '';
    if trim(fDMCadLote_Calc.cdsPendenteTAMANHO.AsString) <> '' then
      vTamanho := fDMCadLote_Calc.cdsPendenteTAMANHO.AsString;
    if (fDMCadLote_Calc.mAcum_Tam.Locate('ID;Tamanho',VarArrayOf([fDMCadLote_Calc.mAcumID.AsInteger,vTamanho]),[locaseinsensitive])) then
      fDMCadLote_Calc.mAcum_Tam.Edit
    else
    begin
      fDMCadLote_Calc.mAcum_Tam.Insert;
      fDMCadLote_Calc.mAcum_TamID.AsInteger     := fDMCadLote_Calc.mAcumID.AsInteger;
      fDMCadLote_Calc.mAcum_TamTamanho.AsString := vTamanho;
      fDMCadLote_Calc.mAcum_TamQtd.AsInteger    := 0;
    end;
    fDMCadLote_Calc.mAcum_TamQtd.AsInteger := fDMCadLote_Calc.mAcum_TamQtd.AsInteger + fDMCadLote_Calc.cdsPendenteQTD_RESTANTE.AsInteger;
    fDMCadLote_Calc.mAcum_Tam.Post;

    fDMCadLote_Calc.mAcum_Ped.Insert;
    fDMCadLote_Calc.mAcum_PedID.AsInteger          := fDMCadLote_Calc.mAcumID.AsInteger;
    fDMCadLote_Calc.mAcum_PedTamanho.AsString      := vTamanho;
    fDMCadLote_Calc.mAcum_PedID_Pedido.AsInteger   := fDMCadLote_Calc.cdsPendenteID.AsInteger;
    fDMCadLote_Calc.mAcum_PedItem_Pedido.AsInteger := fDMCadLote_Calc.cdsPendenteITEM.AsInteger;
    fDMCadLote_Calc.mAcum_PedQtd.AsInteger         := fDMCadLote_Calc.cdsPendenteQTD_RESTANTE.AsInteger;
    fDMCadLote_Calc.mAcum_Ped.Post;

    //fDMCadLote_Calc.cdsPendente.Edit;
    //fDMCadLote_Calc.cdsPendenteQTD_RESTANTE.AsInteger := StrToInt(FormatFloat('0',0));
    //fDMCadLote_Calc.cdsPendente.Post;
    
    fDMCadLote_Calc.cdsPendente.Next;
  end;
end;

procedure TfrmGerar_Lote_Calc.prc_Gravar_Lote;
begin
  fDMCadLote_Calc.prc_Inserir;
  fDMCadLote_Calc.cdsLoteQTD_TALOES.AsInteger    := 0;
  fDMCadLote_Calc.cdsLoteDTEMISSAO.AsDateTime    := Date;
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
  fDMCadLote_Calc.cdsLoteNOME.AsString           := Edit2.Text;
  fDMCadLote_Calc.cdsLoteOBS_PED.AsString        := edtObs.Text;
  fDMCadLote_Calc.cdsLoteCAIXINHA.AsString       := fDMCadLote_Calc.mAcumCaixinha.AsString;
  fDMCadLote_Calc.qProximo_Lote.Close;
  fDMCadLote_Calc.qProximo_Lote.Open;
  if vNumLote <= 0 then
    vNumLote := fDMCadLote_Calc.qProximo_LoteNUM_LOTE.AsInteger;
  vNumLote := vNumLote + 1;
  if vNumOrdem <= 0 then
  begin
    fDMCadLote_Calc.qProxima_Ordem.Close;
    fDMCadLote_Calc.qProxima_Ordem.Open;
    vNumOrdem := fDMCadLote_Calc.qProxima_OrdemNUM_ORDEM.AsInteger + 1;
  end;
  fDMCadLote_Calc.cdsLoteNUM_LOTE.AsInteger   := vNumLote;
  fDMCadLote_Calc.cdsLoteNUM_ORDEM.AsInteger  := vNumOrdem;

  fDMCadLote_Calc.cdsLote.Post;
end;

procedure TfrmGerar_Lote_Calc.prc_Gravar_Talao(Qtd: Integer);
begin
  fDMCadLote_Calc.mAcum_Ped.First;
  fDMCadLote_Calc.prc_Inserir_Talao;
  fDMCadLote_Calc.cdsTalaoID_PRODUTO.AsInteger    := fDMCadLote_Calc.mAcumID_Produto.AsInteger;
  fDMCadLote_Calc.cdsTalaoID_COMBINACAO.AsInteger := fDMCadLote_Calc.mAcumID_Combinacao.AsInteger;
  fDMCadLote_Calc.cdsTalaoTAMANHO.AsString        := fDMCadLote_Calc.mAcum_TamTamanho.AsString;
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

  prc_Gravar_Talao_Setor;

  fDMCadLote_Calc.cdsLote.Edit;
  fDMCadLote_Calc.cdsLoteQTD.AsInteger          := fDMCadLote_Calc.cdsLoteQTD.AsInteger + Qtd;
  fDMCadLote_Calc.cdsLoteQTD_TALOES.AsInteger   := fDMCadLote_Calc.cdsLoteQTD_TALOES.AsInteger + 1;
  fDMCadLote_Calc.cdsLoteQTD_PENDENTE.AsInteger := fDMCadLote_Calc.cdsLoteQTD.AsInteger;
  fDMCadLote_Calc.cdsLote.Post;
end;

procedure TfrmGerar_Lote_Calc.SMDBGrid5KeyDown(Sender: TObject;
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

procedure TfrmGerar_Lote_Calc.SMDBGrid2KeyDown(Sender: TObject;
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

procedure TfrmGerar_Lote_Calc.prc_Consultar_Novo;
var
  vComando: String;
  vDescData: String;
begin
  case cbxOpcaoData.ItemIndex of
    0: vDescData := 'L.DTEMISSAO';
    1: vDescData := 'L.DTENTREGA';
  end;
  fDMCadLote_Calc.cdsConsLote_Novo.Close;
  fDMCadLote_Calc.sdsConsLote_Novo.CommandText := fDMCadLote_Calc.ctConsLote_Novo + ' WHERE 0 = 0 ';
  vComando := '';
  if CurrencyEdit1.AsInteger > 0 then
    vComando :=  vComando + ' AND L.NUM_LOTE >= ' + CurrencyEdit1.Text;
  if CurrencyEdit2.AsInteger > 0 then
    vComando :=  vComando + ' AND L.NUM_LOTE <= ' + CurrencyEdit2.Text;
  if CurrencyEdit3.AsInteger > 0 then
    vComando :=  vComando + ' AND L.NUM_ORDEM >= ' + CurrencyEdit3.Text;
  if CurrencyEdit4.AsInteger > 0 then
    vComando :=  vComando + ' AND L.NUM_ORDEM <= ' + CurrencyEdit4.Text;

  if DateEdit1.Date > 10 then
    vComando := vComando + ' AND ' + vDescData + ' >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    vComando := vComando + ' AND ' + vDescData + ' <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  case cbxOpcao.ItemIndex of
    0: vComando := vComando + ' AND L.QTD_PENDENTE > 0';
    1: vComando := vComando + ' AND L.QTD_PRODUZIDO > 0';
  end;
  if RxDBLookupCombo1.Text <> '' then
    vComando := vComando + ' AND L.ID_PRODUTO = ' + IntToStr(RxDBLookupCombo1.KeyValue);
  if trim(Edit3.Text) <> '' then
    vComando := vComando + ' AND L.NOME LIKE ' + QuotedStr('%'+Edit3.Text+'%');
  fDMCadLote_Calc.sdsConsLote_Novo.CommandText := fDMCadLote_Calc.sdsConsLote_Novo.CommandText + vComando;
  fDMCadLote_Calc.cdsConsLote_Novo.Open;
  fDMCadLote_Calc.cdsConsLote_Novo.IndexFieldNames := 'NUM_ORDEM;ID_PRODUTO;ID_COMBINACAO';
end;

procedure TfrmGerar_Lote_Calc.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  if Column.FieldName = 'ID_PRODUTO' then
    fDMCadLote_Calc.cdsConsLote_Novo.IndexFieldNames := Column.FieldName + ';NOME_COMBINACAO'
  else
    fDMCadLote_Calc.cdsConsLote_Novo.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I] = Column) then
      SMDBGrid1.Columns.Items[I].Title.Color := $00C6FFC6;
end;

procedure TfrmGerar_Lote_Calc.prc_Gravar_Processo(Regravar : Boolean = False);
var
  vItemAux : Integer;
  vIDCor : Integer;
begin
  fDMCadLote_Calc.cdsProduto_Consumo_Proc.Close;
  fDMCadLote_Calc.sdsProduto_Consumo_Proc.ParamByName('ID').AsInteger     := fDMCadLote_Calc.cdsLoteID_PRODUTO.AsInteger;
  fDMCadLote_Calc.sdsProduto_Consumo_Proc.ParamByName('ID_COR').AsInteger := fDMCadLote_Calc.cdsLoteID_COMBINACAO.AsInteger;
  fDMCadLote_Calc.cdsProduto_Consumo_Proc.Open;

  fDMCadLote_Calc.cdsProduto_Consumo_Proc.First;
  while not fDMCadLote_Calc.cdsProduto_Consumo_Proc.Eof do
  begin
    //24/01/2019
    if Regravar then
    begin
      vIDCor := 0;
      if fDMCadLote_Calc.cdsProduto_Consumo_ProcID_COR_MAT.AsInteger > 0 then
        vIDCor := fDMCadLote_Calc.cdsProduto_Consumo_ProcID_COR_MAT.AsInteger;

      fDMCadLote_Calc.qVerBaixaProc.Close;
      fDMCadLote_Calc.qVerBaixaProc.ParamByName('ID_PROCESSO').AsInteger := fDMCadLote_Calc.cdsProduto_Consumo_ProcID_PROCESSO.AsInteger;
      fDMCadLote_Calc.qVerBaixaProc.ParamByName('ID_LOTE').AsInteger     := fDMCadLote_Calc.cdsLoteID.AsInteger;
      fDMCadLote_Calc.qVerBaixaProc.ParamByName('ID_MATERIAL').AsInteger := fDMCadLote_Calc.cdsProduto_Consumo_ProcID_MATERIAL.AsInteger;
      fDMCadLote_Calc.qVerBaixaProc.ParamByName('ID_COR_MAT').AsInteger  := vIDCor;
      fDMCadLote_Calc.qVerBaixaProc.Open;
      if fDMCadLote_Calc.qVerBaixaProcCONTADOR.AsInteger > 0 then
      begin
        fDMCadLote_Calc.cdsProduto_Consumo_Proc.Next;
        Continue;
      end;
    end;
    //**************************

    if vID_BaixaProcesso <= 0 then
    begin
      vID_BaixaProcesso := dmDatabase.ProximaSequencia('BAIXA_PROCESSO',0);
      vItemAux          := 0;
    end;
    if not fDMCadLote_Calc.cdsBaixa_Processo.Active then
    begin
      fDMCadLote_Calc.prc_Abrir_Baixa_Processo(-1)
    end;

    fDMCadLote_Calc.cdsBaixa_Processo.Last;
    vItemAux := fDMCadLote_Calc.cdsBaixa_ProcessoITEM.AsInteger;

    fDMCadLote_Calc.cdsBaixa_Processo.Insert;
    fDMCadLote_Calc.cdsBaixa_ProcessoID.AsInteger          := vID_BaixaProcesso;
    fDMCadLote_Calc.cdsBaixa_ProcessoITEM.AsInteger        := vItemAux + 1;
    fDMCadLote_Calc.cdsBaixa_ProcessoID_PROCESSO.AsInteger := fDMCadLote_Calc.cdsProduto_Consumo_ProcID_PROCESSO.AsInteger;
    fDMCadLote_Calc.cdsBaixa_ProcessoID_LOTE.AsInteger     := fDMCadLote_Calc.cdsLoteID.AsInteger;
    fDMCadLote_Calc.cdsBaixa_ProcessoQTD.AsFloat           := fDMCadLote_Calc.cdsLoteQTD.AsFloat;
    fDMCadLote_Calc.cdsBaixa_ProcessoQTD_PRODUZIDO.AsFloat := 0;
    fDMCadLote_Calc.cdsBaixa_ProcessoNUM_ORDEM.AsFloat     := fDMCadLote_Calc.cdsLoteNUM_ORDEM.AsInteger;
    fDMCadLote_Calc.cdsBaixa_ProcessoTIPO.AsString         := '2';
    fDMCadLote_Calc.cdsBaixa_ProcessoQTD_PENDENTE.AsFloat  := fDMCadLote_Calc.cdsBaixa_ProcessoQTD.AsFloat;
    fDMCadLote_Calc.cdsBaixa_ProcessoPARCIAL.AsString      := 'N';
    fDMCadLote_Calc.cdsBaixa_ProcessoQTD_LIBERADA.AsFloat  := 0;
    fDMCadLote_Calc.cdsBaixa_ProcessoAJUSTE.AsString       := 'N';
    fDMCadLote_Calc.cdsBaixa_ProcessoID_SETOR.AsInteger    := fDMCadLote_Calc.cdsProduto_Consumo_ProcID_SETOR.AsInteger;
    fDMCadLote_Calc.cdsBaixa_ProcessoID_POSICAO.AsInteger  := fDMCadLote_Calc.cdsProduto_Consumo_ProcID_POSICAO.AsInteger;
    if fDMCadLote_Calc.cdsProduto_Consumo_ProcID_MATERIAL.AsInteger > 0 then
      fDMCadLote_Calc.cdsBaixa_ProcessoID_MATERIAL.AsInteger := fDMCadLote_Calc.cdsProduto_Consumo_ProcID_MATERIAL.AsInteger;
    if fDMCadLote_Calc.cdsProduto_Consumo_ProcID_COR_MAT.AsInteger > 0 then
      fDMCadLote_Calc.cdsBaixa_ProcessoID_COR_MAT.AsInteger := fDMCadLote_Calc.cdsProduto_Consumo_ProcID_COR_MAT.AsInteger
    else
      fDMCadLote_Calc.cdsBaixa_ProcessoID_COR_MAT.AsInteger := 0;
    fDMCadLote_Calc.cdsBaixa_Processo.Post;

    fDMCadLote_Calc.cdsProduto_Consumo_Proc.Next;
  end;
end;

procedure TfrmGerar_Lote_Calc.prc_scroll(DataSet: TDataSet);
begin
  fDMCadLote_Calc.cdsConsBaixaProc.Close;
  fDMCadLote_Calc.sdsConsBaixaProc.ParamByName('ID_LOTE').AsInteger := fDMCadLote_Calc.cdsConsLote_NovoID.AsInteger;
  fDMCadLote_Calc.cdsConsBaixaProc.Open;
end;

procedure TfrmGerar_Lote_Calc.prc_Imprimir(Arq : String);
begin
  if not (FileExists(Arq)) then
  begin
    MessageDlg('*** Relatório não localizado: ' + Arq , mtInformation, [mbOk], 0);
    exit;
  end;
  fDMLoteImp_Calc.mImpAux.EmptyDataSet;
  if RzPageControl1.ActivePage = TS_ConsNovo then
  begin
    fDMCadLote_Calc.cdsConsLote_Novo.First;
    while not fDMCadLote_Calc.cdsConsLote_Novo.Eof do
    begin
      if SMDBGrid1.SelectedRows.CurrentRowSelected then
      begin
        fDMLoteImp_Calc.mImpAux.Insert;
        fDMLoteImp_Calc.mImpAuxID.AsInteger := fDMCadLote_Calc.cdsConsLote_NovoID.AsInteger;
        fDMLoteImp_Calc.mImpAuxNum_Lote.AsInteger := fDMCadLote_Calc.cdsConsLote_NovoNUM_LOTE.AsInteger;
        fDMLoteImp_Calc.mImpAux.Post;
      end;
      fDMCadLote_Calc.cdsConsLote_Novo.Next;
    end;
  end
  else
  begin
    fDMCadLote_Calc.cdsConsProcesso.First;
    while not fDMCadLote_Calc.cdsConsProcesso.Eof do
    begin
      if SMDBGrid6.SelectedRows.CurrentRowSelected then
      begin
        fDMLoteImp_Calc.mImpAux.Insert;
        fDMLoteImp_Calc.mImpAuxID.AsInteger   := fDMCadLote_Calc.cdsConsProcessoID.AsInteger;
        fDMLoteImp_Calc.mImpAuxItem.AsInteger := fDMCadLote_Calc.cdsConsProcessoITEM.AsInteger;
        fDMLoteImp_Calc.mImpAuxNum_Lote.AsInteger := fDMCadLote_Calc.cdsConsProcessoNUM_LOTE.AsInteger;
        fDMLoteImp_Calc.mImpAux.Post;
      end;
      fDMCadLote_Calc.cdsConsProcesso.Next;
    end;
  end;
  fDMLoteImp_Calc.mImpAux.First;
  fDMLoteImp_Calc.frxReport1.Report.LoadFromFile(Arq);
  fDMLoteImp_Calc.frxReport1.ShowReport;
end;

procedure TfrmGerar_Lote_Calc.Processos1Click(Sender: TObject);
var
  vArq : String;
begin
  if not(fDMCadLote_Calc.cdsConsProcesso.Active) then
  begin
    MessageDlg('*** Pesquisa dos Processos não efetuada!', mtInformation, [mbOk], 0);
    exit;
  end;
  if RzPageControl1.ActivePage <> TS_Processo then
  begin
    MessageDlg('*** Para imprimir os Processos, é preciso posicionar na Aba "Processos"!', mtInformation, [mbOk], 0);
    exit;
  end;
  fDMLoteImp_Calc.vTipo_Imp := 'P';
  SMDBGrid2.DisableScroll;
  if fDMCadLote_Calc.qParametros_LoteTIPO_PROCESSO.AsString = 'L' then
  begin
    vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Processo_Lotus.fr3';
    prc_Imprimir(vArq);
    exit;
  end;
end;

procedure TfrmGerar_Lote_Calc.prc_Consultar_Processo;
var
  vComando: String;
  vDescData: String;
begin
  case cbxOpcaoData.ItemIndex of
    0: vDescData := 'L.DTEMISSAO';
    1: vDescData := 'L.DTENTREGA';
  end;
  fDMCadLote_Calc.cdsConsProcesso.Close;
  vComando := fDMCadLote_Calc.ctConsProcesso + ' WHERE 0 = 0 ';
  if CurrencyEdit1.AsInteger > 0 then
    vComando :=  vComando + ' AND L.NUM_LOTE >= ' + CurrencyEdit1.Text;
  if CurrencyEdit2.AsInteger > 0 then
    vComando :=  vComando + ' AND L.NUM_LOTE <= ' + CurrencyEdit2.Text;
  if CurrencyEdit3.AsInteger > 0 then
    vComando :=  vComando + ' AND L.NUM_ORDEM >= ' + CurrencyEdit3.Text;
  if CurrencyEdit4.AsInteger > 0 then
    vComando :=  vComando + ' AND L.NUM_ORDEM <= ' + CurrencyEdit4.Text;

  if DateEdit1.Date > 10 then
    vComando := vComando + ' AND ' + vDescData + ' >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    vComando := vComando + ' AND ' + vDescData + ' <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  case cbxOpcao.ItemIndex of
    0: vComando := vComando + ' AND B.QTD_PENDENTE > 0';
    1: vComando := vComando + ' AND B.QTD_PRODUZIDO > 0';
  end;
  if RxDBLookupCombo1.Text <> '' then
    vComando := vComando + ' AND L.ID_PRODUTO = ' + IntToStr(RxDBLookupCombo1.KeyValue);
  if trim(Edit3.Text) <> '' then
    vComando := vComando + ' AND L.NOME LIKE ' + QuotedStr('%'+Edit3.Text+'%');
  fDMCadLote_Calc.sdsConsProcesso.CommandText := vComando;
  fDMCadLote_Calc.cdsConsProcesso.Open;
  fDMCadLote_Calc.cdsConsProcesso.IndexFieldNames := 'NOME_PROCESSO;NOME_SETOR;NUM_LOTE';
end;

procedure TfrmGerar_Lote_Calc.SMDBGrid6TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  fDMCadLote_Calc.cdsConsProcesso.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid6.Columns.Count - 1 do
    if not (SMDBGrid6.Columns.Items[I] = Column) then
      SMDBGrid6.Columns.Items[I].Title.Color := $0080FFFF;
end;

procedure TfrmGerar_Lote_Calc.NxButton1Click(Sender: TObject);
begin
  if MessageDlg('Gerar Processos?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  Label8.Caption := '..... Aguarde Gerando PROCESSOS .....';

  vID_BaixaProcesso := 0;

  prc_Processos;

  CurrencyEdit8.SetFocus;
end;

procedure TfrmGerar_Lote_Calc.prc_Processos;
var
  sds: TSQLDataSet;
begin
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.Close;
    sds.CommandText := 'SELECT ID FROM LOTE WHERE NUM_ORDEM = :NUM_ORDEM';
    sds.ParamByName('NUM_ORDEM').AsInteger := CurrencyEdit8.AsInteger;
    sds.Open;
    sds.First;
    while not sds.Eof do
    begin
      fDMCadLote_Calc.prc_Localizar(sds.FieldByName('ID').AsInteger);
      if not fDMCadLote_Calc.cdsLote.IsEmpty then
        prc_Gravar_Processo;
      sds.Next;
    end;

    if (fDMCadLote_Calc.qParametros_LoteTIPO_PROCESSO.AsString = 'L') and (vID_BaixaProcesso > 0) then
      fDMCadLote_Calc.cdsBaixa_Processo.ApplyUpdates(0);

  finally
    FreeAndNil(sds);
  end;
  MessageDlg('*** Processos Gerados!', mtConfirmation, [mbOk], 0);

  Label8.Visible := False;
end;

procedure TfrmGerar_Lote_Calc.prc_Gravar_Talao_Setor;
begin
  fDMCadLote_Calc.cdsSetor_Talao.First;
  while not fDMCadLote_Calc.cdsSetor_Talao.Eof do
  begin
    fDMCadLote_Calc.cdsTalao_Setor.Insert;
    fDMCadLote_Calc.cdsTalao_SetorID.AsInteger            := fDMCadLote_Calc.cdsTalaoID.AsInteger;
    fDMCadLote_Calc.cdsTalao_SetorNUM_TALAO.AsInteger     := fDMCadLote_Calc.cdsTalaoNUM_TALAO.AsInteger;
    fDMCadLote_Calc.cdsTalao_SetorITEM.AsInteger          := fDMCadLote_Calc.cdsSetor_TalaoORDEM_ORC.AsInteger;
    fDMCadLote_Calc.cdsTalao_SetorID_SETOR.AsInteger      := fDMCadLote_Calc.cdsSetor_TalaoID.AsInteger;
    fDMCadLote_Calc.cdsTalao_SetorQTD.AsInteger           := fDMCadLote_Calc.cdsTalaoQTD.AsInteger;
    fDMCadLote_Calc.cdsTalao_SetorQTD_PENDENTE.AsInteger  := fDMCadLote_Calc.cdsTalao_SetorQTD.AsInteger;
    fDMCadLote_Calc.cdsTalao_SetorQTD_PRODUZIDO.AsInteger := 0;
    fDMCadLote_Calc.cdsTalao_Setor.Post;
    fDMCadLote_Calc.cdsSetor_Talao.Next;
  end;
end;

procedure TfrmGerar_Lote_Calc.NxButton2Click(Sender: TObject);
var
  sds: TSQLDataSet;
begin
  if MessageDlg('Gerar Setores?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  Label8.Caption := '..... Aguarde Gerando SETORES .....';
  Refresh;

  fDMCadLote_Calc.cdsSetor_Talao.Close;
  fDMCadLote_Calc.cdsSetor_Talao.Open;
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.Close;
    sds.CommandText := 'SELECT ID FROM LOTE WHERE NUM_ORDEM = :NUM_ORDEM';
    sds.ParamByName('NUM_ORDEM').AsInteger := CurrencyEdit8.AsInteger;
    sds.Open;
    sds.First;
    while not sds.Eof do
    begin
      fDMCadLote_Calc.prc_Localizar(sds.FieldByName('ID').AsInteger);
      if not fDMCadLote_Calc.cdsLote.IsEmpty then
      begin
        fDMCadLote_Calc.cdsTalao.First;
        while not fDMCadLote_Calc.cdsTalao.Eof do
        begin
          prc_Gravar_Talao_Setor;
          fDMCadLote_Calc.cdsTalao.Next;
        end;
      end;
      fDMCadLote_Calc.cdsTalao_Setor.ApplyUpdates(0);
      sds.Next;
    end;

  finally
    FreeAndNil(sds);
  end;
  MessageDlg('*** Setores Gerados!', mtConfirmation, [mbOk], 0);

  Label8.Visible := False;

end;

end.
