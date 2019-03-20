unit UGerar_Lote_Ped;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, UDMCadLote, StdCtrls,DB, dbXPress,
  SqlExpr, RzTabs, CurrEdit, Mask, ToolEdit, RxLookup, Menus, UCBase, ExtCtrls, NxCollection, NxEdit, DBVGrids, RzPanel,
  Grids, DBGrids, SMDBGrid, ComCtrls, Buttons, strUtils, DBCtrls;

type
  TfrmGerar_Lote_Ped = class(TForm)
    RzPageControl2: TRzPageControl;
    TS_Gerar: TRzTabSheet;
    TS_Consulta: TRzTabSheet;
    PopupMenu1: TPopupMenu;
    Panel2: TPanel;
    btnExcluir: TNxButton;
    pnlPesquisa: TPanel;
    NxLabel3: TNxLabel;
    NxLabel6: TNxLabel;
    NxLabel7: TNxLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    cbxOpcao: TNxComboBox;
    btnConsultar: TNxButton;
    NxLabel2: TNxLabel;
    CurrencyEdit3: TCurrencyEdit;
    btnImprimir: TNxButton;
    PopupMenu2: TPopupMenu;
    MarcarDesmarcargerarOCIndividual1: TMenuItem;
    MarcarCampoGerarOC1: TMenuItem;
    MarcartodososcampoparagerarOC1: TMenuItem;
    Desmarcartodos1: TMenuItem;
    MarcarDesmarcarPedido1: TMenuItem;
    NxPanel1: TNxPanel;
    ImprimirOrdemProduo1: TMenuItem;
    SMDBGrid1: TSMDBGrid;
    NxSplitter1: TNxSplitter;
    Label1: TLabel;
    Edit1: TEdit;
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
    btnConsultar_Pedidos: TNxButton;
    Panel3: TPanel;
    btnGerarAuxiliar: TNxButton;
    Label8: TLabel;
    NxLabel1: TNxLabel;
    Edit2: TEdit;
    RzPageControl1: TRzPageControl;
    TS_Processo: TRzTabSheet;
    SMDBGrid2: TSMDBGrid;
    TS_Pedido: TRzTabSheet;
    SMDBGrid3: TSMDBGrid;
    StaticText3: TStaticText;
    NxLabel4: TNxLabel;
    CurrencyEdit1: TCurrencyEdit;
    NxLabel5: TNxLabel;
    CurrencyEdit2: TCurrencyEdit;
    NxLabel8: TNxLabel;
    DateEdit3: TDateEdit;
    NxLabel9: TNxLabel;
    DateEdit4: TDateEdit;
    NxLabel10: TNxLabel;
    Edit3: TEdit;
    DBMemo1: TDBMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsultar_PedidosClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure SMDBGrid2TitleClick(Column: TColumn);
    procedure btnExcluirClick(Sender: TObject);
    procedure RzPageControl2Change(Sender: TObject);
    procedure MarcarDesmarcargerarOCIndividual1Click(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure MarcarCampoGerarOC1Click(Sender: TObject);
    procedure MarcarDesmarcarPedido1Click(Sender: TObject);
    procedure MarcartodososcampoparagerarOC1Click(Sender: TObject);
    procedure Desmarcartodos1Click(Sender: TObject);
    procedure ImprimirOrdemProduo1Click(Sender: TObject);
    procedure SMDBGrid2DblClick(Sender: TObject);
    procedure CurrencyEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnGerarAuxiliarClick(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    fDMCadLote: TDMCadLote;
    vNumLote: Integer;
    vNumOrdem: Integer;
    vQtd_Selecionada: Real;
    vID_BaixaProcesso: Integer;
    vIDLoteAux: Integer;

    vItem_Ordem: Integer;

    procedure prc_Consultar;
    procedure prc_Gerar_Lote;
    procedure prc_Consultar_Lote;
    procedure prc_Consultar_Lote_Ped;
    procedure prc_Le_mLote;

    procedure prc_Limpar_Var;

    procedure prc_Marcar_Desmarcar(Tipo: String); //I=Item   R=Referência   P=Pedido   TM=Total    TD=Total
    procedure prc_Marcar_Desmarcar_PED(Tipo: String); //P=Pedido   TM=Total marcar    TD=Total Desmarcar

    procedure prc_Le_cdsPendenteAux;

    procedure prc_Grava_Baixa_Processo;

  public
    { Public declarations }
  end;

var
  frmGerar_Lote_Ped: TfrmGerar_Lote_Ped;

implementation

uses rsDBUtils, DmdDatabase, uUtilPadrao, UMenu, UDMLoteImp, UAltQtdLote,
  UGerar_Lote_Aux2;

{$R *.dfm}

procedure TfrmGerar_Lote_Ped.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmGerar_Lote_Ped.FormShow(Sender: TObject);
begin
  fDMCadLote := TDMCadLote.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMCadLote);
  
  fDMCadLote.qProxima_Ordem.Close;
  fDMCadLote.qProxima_Ordem.Open;
  CurrencyEdit3.AsInteger := fDMCadLote.qProxima_OrdemNUM_ORDEM.AsInteger;

  Label15.Visible      := (fDMCadLote.qParametros_LoteLOTE_POR_PEDIDO.AsString <> 'S');
  Label16.Visible      := (fDMCadLote.qParametros_LoteLOTE_POR_PEDIDO.AsString <> 'S');
  DateEdit8.Visible    := (fDMCadLote.qParametros_LoteLOTE_POR_PEDIDO.AsString <> 'S');
  DateEdit9.Visible    := (fDMCadLote.qParametros_LoteLOTE_POR_PEDIDO.AsString <> 'S');

  NxFlipPanel1.Expanded  := False;
  TS_Processo.TabVisible := trim(fDMCadLote.qParametros_LoteUSA_LOTE_PED_SPROC.AsString) <> 'S';
  TS_Pedido.TabVisible   := trim(fDMCadLote.qParametros_LoteUSA_LOTE_PED_SPROC.AsString) = 'S';
  if TS_Pedido.TabVisible then
    RzPageControl1.ActivePage := TS_Pedido
  else
    RzPageControl1.ActivePage := TS_Processo;
  if fDMCadLote.qParametros_LoteUSA_LOTE_PED_SPROC.AsString = 'S' then
    NxLabel4.Caption := 'Nº OP Ini:';
end;

procedure TfrmGerar_Lote_Ped.btnConsultar_PedidosClick(Sender: TObject);
begin
  prc_Consultar;
end;

procedure TfrmGerar_Lote_Ped.prc_Consultar;
var
  vTextoData: String;
begin
  if fDMCadLote.qParametrosOPCAO_DTENTREGAPEDIDO.AsString = 'P' then
    vTextoData := 'PED.DTENTREGA'
  else
    vTextoData := 'PI.DTENTREGA';
  vQtd_Selecionada := 0;
  fDMCadLote.cdsPendente.Close;
  fDMCadLote.sdsPendente.CommandText := fDMCadLote.ctPendente;
  fDMCadLote.sdsPendente.CommandText := fDMCadLote.sdsPendente.CommandText + ' AND PI.QTD_RESTANTE > 0';
  if DateEdit6.Date > 10 then
    fDMCadLote.sdsPendente.CommandText := fDMCadLote.sdsPendente.CommandText + ' AND PED.DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit6.date));
  if DateEdit7.Date > 10 then
    fDMCadLote.sdsPendente.CommandText := fDMCadLote.sdsPendente.CommandText + ' AND PED.DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit7.date));
  if DateEdit8.Date > 10 then
    fDMCadLote.sdsPendente.CommandText := fDMCadLote.sdsPendente.CommandText + ' AND ' + vTextoData + '  >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit8.date));
  if DateEdit9.Date > 10 then
    fDMCadLote.sdsPendente.CommandText := fDMCadLote.sdsPendente.CommandText + ' AND ' + vTextoData + '  <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit9.date));
  if trim(Edit5.Text) <> '' then
    fDMCadLote.sdsPendente.CommandText := fDMCadLote.sdsPendente.CommandText + ' AND  CLI.NOME LIKE ' + QuotedStr('%'+Edit5.Text+'%');
  fDMCadLote.cdsPendente.Open;
  fDMCadLote.cdsPendente.IndexFieldNames := 'NUM_PEDIDO;REFERENCIA;ID_PRODUTO;TAMANHO';
end;

procedure TfrmGerar_Lote_Ped.prc_Gerar_Lote;
var
  vData: TDateTime;
  vID_CombinacaoAux: Integer;
  vCompleto: String;
  vItemAux: Integer;
  vTipo: String;
begin
  vItem_Ordem := 1;
  vData := fDMCadLote.cdsPendenteDTENTREGA.AsDateTime;
  vID_CombinacaoAux := 0;
  if fDMCadLote.cdsPendenteID_COR.AsInteger > 0 then
    vID_CombinacaoAux := fDMCadLote.cdsPendenteID_COR.AsInteger;

  fDMCadLote.prc_Inserir;

  if fDMCadLote.cdsLote.State in [dsInsert] then
  begin
    fDMCadLote.cdsLoteQTD_TALOES.AsInteger     := 0;
    fDMCadLote.cdsLoteDTEMISSAO.AsDateTime     := Date;
    fDMCadLote.cdsLoteHREMISSAO.AsDateTime     := Now;
    fDMCadLote.cdsLoteID_PRODUTO.AsInteger     := fDMCadLote.cdsPendenteID_PRODUTO.AsInteger;
    fDMCadLote.cdsLoteID_PRODUTO_PRI.AsInteger := fDMCadLote.cdsPendenteID_PRODUTO.AsInteger;
    fDMCadLote.cdsLoteREFERENCIA.AsString      := fDMCadLote.cdsPendenteREFERENCIA.AsString;
    fDMCadLote.cdsLoteID_COMBINACAO.AsInteger  := vID_CombinacaoAux;
    fDMCadLote.cdsLoteCARIMBO.AsString         := '';
    fDMCadLote.cdsLoteNUM_PEDIDO.AsInteger     := fDMCadLote.cdsPendenteNUM_PEDIDO.AsInteger;
    fDMCadLote.cdsLoteID_CLIENTE.AsInteger     := fDMCadLote.cdsPendenteID_CLIENTE.AsInteger;
    if vData > 10 then
      fDMCadLote.cdsLoteDTENTREGA.AsDateTime   := vData;
    fDMCadLote.cdsLoteFILIAL.AsInteger         := fDMCadLote.cdsPendenteFILIAL.AsInteger;
    fDMCadLote.cdsLoteQTD.AsFloat              := 0;
    fDMCadLote.cdsLoteQTD_PRODUZIDO.AsFloat    := 0;
    fDMCadLote.cdsLoteQTD_TALOES.AsInteger     := 0;
    fDMCadLote.cdsLoteNOME.AsString            := '';
    if vNumLote <= 0 then
    begin
      fDMCadLote.qProximo_Lote.Close;
      fDMCadLote.qProximo_Lote.Open;
      vNumLote := fDMCadLote.qProximo_LoteNUM_LOTE.AsInteger;
    end;
    vNumLote := vNumLote + 1;
    if vNumOrdem <= 0 then
    begin
      fDMCadLote.qProxima_Ordem.Close;
      fDMCadLote.qProxima_Ordem.Open;
      vNumOrdem := fDMCadLote.qProxima_OrdemNUM_ORDEM.AsInteger + 1;
    end;
    fDMCadLote.cdsLoteNUM_LOTE.AsInteger   := vNumLote;
    fDMCadLote.cdsLoteNUM_ORDEM.AsInteger  := vNumOrdem;
    fDMCadLote.cdsLoteQTD_ORIGINAL.AsFloat := 0;
    fDMCadLote.cdsLoteQTD_PARES.AsFloat    := 0;
    fDMCadLote.cdsLoteITEM_ORDEM.AsInteger := vItem_Ordem;

    fDMCadLote.cdsLoteCOMPLETO.AsString := 'N';
  end;
  fDMCadLote.cdsLoteQTD.AsFloat           := StrToFloat(FormatFloat('0.0000',fDMCadLote.cdsPendenteQTD_RESTANTE.AsFloat));
  fDMCadLote.cdsLoteQTD_PENDENTE.AsFloat  := StrToFloat(FormatFloat('0.0000',fDMCadLote.cdsLoteQTD.AsFloat));
  fDMCadLote.cdsLoteTIPO_LOTE.AsString    := 'PED';
  fDMCadLote.cdsLoteUNIDADE.AsString      := fDMCadLote.cdsPendenteUNIDADE.AsString;
  fDMCadLote.cdsLoteQTD_ORIGINAL.AsFloat  := fDMCadLote.cdsLoteQTD.AsFloat;
  fDMCadLote.cdsLoteID_PEDIDO.AsInteger   := fDMCadLote.cdsPendenteID.AsInteger;
  fDMCadLote.cdsLoteITEM_PEDIDO.AsInteger := fDMCadLote.cdsPendenteITEM.AsInteger;
  fDMCadLote.cdsLoteOBS_PED.AsString      := fDMCadLote.cdsPendentePEDIDO_CLIENTE.AsString;
  fDMCadLote.cdsLoteOBS.AsString          := fDMCadLote.cdsPendenteOBS_LOTE.AsString;
  fDMCadLote.cdsLoteNOME_PRODUTO.AsString := fDMCadLote.cdsPendenteNOMEPRODUTO.AsString;
  fDMCadLote.cdsLote.Post;

  if trim(fDMCadLote.qParametros_LoteUSA_LOTE_PED_SPROC.AsString) = 'S' then
  begin
    fDMCadLote.cdsLote_Ped.Insert;
    fDMCadLote.cdsLote_PedID.AsInteger := fDMCadLote.cdsLoteID.AsInteger;
    fDMCadLote.cdsLote_PedID_PEDIDO.AsInteger := fDMCadLote.cdsLoteID_PEDIDO.AsInteger;
    fDMCadLote.cdsLote_PedITEM_PEDIDO.AsInteger := fDMCadLote.cdsLoteITEM_PEDIDO.AsInteger;
    fDMCadLote.cdsLote_PedID_CLIENTE.AsInteger := fDMCadLote.cdsLoteID_CLIENTE.AsInteger;
    fDMCadLote.cdsLote_PedQTD.AsFloat          := fDMCadLote.cdsLoteQTD.AsFloat;
    fDMCadLote.cdsLote_Ped.Post;
  end;

  //***************** Gravar Baixa Processo
  if trim(fDMCadLote.qParametros_LoteUSA_LOTE_PED_SPROC.AsString) <> 'S' then
  begin
    if not fDMCadLote.cdsBaixa_Processo.Active then
    begin
      fDMCadLote.cdsBaixa_Processo.Close;
      fDMCadLote.sdsBaixa_Processo.ParamByName('NUM_ORDEM').AsInteger := vNumOrdem;
      fDMCadLote.cdsBaixa_Processo.Open;
    end;
    fDMCadLote.qProcesso.Close;
    fDMCadLote.qProcesso.ParamByName('ID').AsInteger := fDMCadLote.cdsPendenteID_PRODUTO.AsInteger;
    fDMCadLote.qProcesso.Open;
    while not fDMCadLote.qProcesso.Eof do
    begin
      vTipo := 'S';
      if fDMCadLote.cdsBaixa_Processo.Locate('ID_PEDIDO;ITEM_PEDIDO;ID_PROCESSO',VarArrayOf([fDMCadLote.cdsLoteID_PEDIDO.AsInteger,fDMCadLote.cdsLoteITEM_PEDIDO.AsInteger,fDMCadLote.qProcessoID_PROCESSO.AsInteger]),[locaseinsensitive]) then
      begin
        fDMCadLote.cdsBaixa_Processo.Edit;
        fDMCadLote.cdsBaixa_ProcessoQTD.AsFloat := fDMCadLote.cdsLoteQTD.AsFloat;
        fDMCadLote.cdsBaixa_Processo.Post;
        vTipo := '';
      end;
      if trim(vTipo) <> '' then
      begin
        if vID_BaixaProcesso <= 0 then
          vID_BaixaProcesso := dmDatabase.ProximaSequencia('BAIXA_PROCESSO',0);
        fDMCadLote.cdsBaixa_Processo.Last;
        vItemAux := fDMCadLote.cdsBaixa_ProcessoITEM.AsInteger;
        fDMCadLote.cdsBaixa_Processo.Insert;
        fDMCadLote.cdsBaixa_ProcessoID.AsInteger   := vID_BaixaProcesso;
        fDMCadLote.cdsBaixa_ProcessoITEM.AsInteger := vItemAux + 1;
        fDMCadLote.cdsBaixa_ProcessoID_PROCESSO.AsInteger := fDMCadLote.qProcessoID_PROCESSO.AsInteger;
        fDMCadLote.cdsBaixa_ProcessoID_LOTE.AsInteger := fDMCadLote.cdsLoteID.AsInteger;
        fDMCadLote.cdsBaixa_ProcessoDTENTRADA.Clear;
        fDMCadLote.cdsBaixa_ProcessoHRENTRADA.Clear;
        fDMCadLote.cdsBaixa_ProcessoDTBAIXA.Clear;
        fDMCadLote.cdsBaixa_ProcessoHRBAIXA.Clear;
        fDMCadLote.cdsBaixa_ProcessoQTD.AsFloat           := fDMCadLote.cdsLoteQTD.AsFloat;
        fDMCadLote.cdsBaixa_ProcessoQTD_PRODUZIDO.AsFloat := 0;
        fDMCadLote.cdsBaixa_ProcessoQTD_PENDENTE.AsFloat  := fDMCadLote.cdsBaixa_ProcessoQTD.AsFloat;
        fDMCadLote.cdsBaixa_ProcessoNUM_ORDEM.AsInteger   := vNumOrdem;
        fDMCadLote.cdsBaixa_ProcessoTIPO.AsString         := 'PED';
        fDMCadLote.cdsBaixa_ProcessoID_PEDIDO.AsInteger   := fDMCadLote.cdsLoteID_PEDIDO.AsInteger;
        fDMCadLote.cdsBaixa_ProcessoITEM_PEDIDO.AsInteger := fDMCadLote.cdsLoteITEM_PEDIDO.AsInteger;
        fDMCadLote.cdsBaixa_Processo.Post;
      end;
      fDMCadLote.qProcesso.Next;
    end;
  end;
end;

procedure TfrmGerar_Lote_Ped.btnConsultarClick(Sender: TObject);
begin
  if fDMCadLote.qParametros_LoteUSA_LOTE_PED_SPROC.AsString = 'S' then
    prc_Consultar_Lote_Ped
  else
    prc_Consultar_Lote;
  fDMCadLote.qParametros.Close;
  fDMCadLote.qParametros.Open;
end;

procedure TfrmGerar_Lote_Ped.prc_Consultar_Lote;
var
  vComando: String;
  vDescData: String;
begin
  vDescData := 'L.DTENTREGA';
  fDMCadLote.cdsConsulta_Lote_Proc.Close;
  fDMCadLote.sdsConsulta_Lote_Proc.CommandText := fDMCadLote.ctConsulta_Lote_Proc + ' WHERE 0 = 0 ';
  vComando := '';
  if CurrencyEdit3.AsInteger > 0 then
    vComando :=  vComando + ' AND L.NUM_ORDEM = ' + CurrencyEdit3.Text;
  if DateEdit1.Date > 10 then
    vComando := vComando + ' AND ' + vDescData + ' >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    vComando := vComando + ' AND ' + vDescData + ' <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  case cbxOpcao.ItemIndex of
    1: vComando := vComando + ' AND L.QTD_PENDENTE > 0 AND IT.QTD_RESTANTE > 0 ';
    2: vComando := vComando + ' AND L.QTD_PENDENTE > 0 ';
    3: vComando := vComando + ' AND L.QTD_PRODUZIDO > 0';
  end;
  if trim(Edit1.Text) <> '' then
    vComando := vComando + ' AND PED.PEDIDO_CLIENTE LIKE ' + QuotedStr('%<'+Edit1.Text+'>%');
  if trim(Edit2.Text) <> '' then
    vComando := vComando + ' AND L.REFERENCIA LIKE ' + QuotedStr('%<'+Edit2.Text+'>%');
  fDMCadLote.sdsConsulta_Lote_Proc.CommandText := fDMCadLote.sdsConsulta_Lote_Proc.CommandText + vComando;
  fDMCadLote.cdsConsulta_Lote_Proc.Open;
end;

procedure TfrmGerar_Lote_Ped.SMDBGrid2TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin

  //ColunaOrdenada := Column.FieldName;
  //fDMCadLote.cdsConsulta_Lote_Proc.IndexFieldNames := Column.FieldName;
  //Column.Title.Color := clBtnShadow;
  //for i := 0 to SMDBGrid2.Columns.Count - 1 do
  //  if not (SMDBGrid2.Columns.Items[I] = Column) then
  //    SMDBGrid2.Columns.Items[I].Title.Color := clBtnFace;

end;

procedure TfrmGerar_Lote_Ped.prc_Limpar_Var;
begin
  CurrencyEdit3.Clear;
  DateEdit1.Clear;
  DateEdit2.Clear;
  cbxOpcao.ItemIndex := 0;
end;

procedure TfrmGerar_Lote_Ped.btnExcluirClick(Sender: TObject);
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

  fDMCadLote.qVerificaExclusao.Close;
  fDMCadLote.qVerificaExclusao.ParamByName('NUM_ORDEM').AsInteger := StrToInt(vNumOrdemAux);
  fDMCadLote.qVerificaExclusao.Open;
  if fDMCadLote.qVerificaExclusaoCOUNT.AsInteger > 0 then
  begin
    MessageDlg('*** Existe Lote/Talão baixado, exclusão cancelada!', mtError, [mbOk], 0);
    exit;
  end;
  fDMCadLote.qVerificaExclusao2.Close;
  fDMCadLote.qVerificaExclusao2.ParamByName('NUM_ORDEM').AsInteger := StrToInt(vNumOrdemAux);
  fDMCadLote.qVerificaExclusao2.Open;
  if fDMCadLote.qVerificaExclusao2Contador.AsInteger > 0 then
  begin
    MessageDlg('*** Existe Ordem de compra gerada para esta Ordem de Produção!', mtError, [mbOk], 0);
    exit;
  end;

  sds := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  sds.NoMetadata    := True;
  sds.GetMetadata   := False;
  try
    sds.CommandText   := ' DELETE FROM BAIXA_PROCESSO  '
                     + ' WHERE NUM_ORDEM = ' + vNumOrdemAux;
    sds.ExecSQL();

    sds.CommandText   := ' DELETE FROM LOTE  '
                     + ' WHERE NUM_ORDEM = ' + vNumOrdemAux;
    sds.ExecSQL();

    sds.CommandText   := ' DELETE FROM LOTE_MAT  '
                     + ' WHERE NUM_ORDEM = ' + vNumOrdemAux;
    sds.ExecSQL();

    sds.CommandText   := ' DELETE FROM LOTE_TING  '
                     + ' WHERE NUM_ORDEM = ' + vNumOrdemAux;
    sds.ExecSQL();

    MessageDlg('*** Nº Controle ' + vNumOrdemAux + ' excluído!', mtInformation, [mbok], 0);

  finally
    FreeAndNil(sds);
    btnConsultarClick(Sender);
  end;
end;

procedure TfrmGerar_Lote_Ped.RzPageControl2Change(Sender: TObject);
begin
  if RzPageControl2.ActivePage = TS_Gerar then
    btnConsultar_PedidosClick(Sender)
  else
  if RzPageControl2.ActivePage = TS_Consulta then
  begin
    if CurrencyEdit3.AsInteger <= 0 then
    begin
      fDMCadLote.qProxima_Ordem.Close;
      fDMCadLote.qProxima_Ordem.Open;
      CurrencyEdit3.AsInteger := fDMCadLote.qProxima_OrdemNUM_ORDEM.AsInteger;
    end;
  end;
end;

procedure TfrmGerar_Lote_Ped.prc_Le_mLote;
begin
  fDMCadLote.mLote.First;
  while not fDMCadLote.mLote.Eof do
  begin
    if SMDBGrid2.SelectedRows.CurrentRowSelected then
    begin
      fDMCadLote.mLote.Edit;
      fDMCadLote.mLoteSelecionado.AsString := 'S';
      fDMCadLote.mLote.Post;
    end
    else
    begin
      fDMCadLote.mLote.Edit;
      fDMCadLote.mLoteSelecionado.AsString := 'N';
      fDMCadLote.mLote.Post;
    end;
    fDMCadLote.mLote.Next;
  end;
  fDMCadLote.mLote.First;
end;

procedure TfrmGerar_Lote_Ped.MarcarDesmarcargerarOCIndividual1Click(
  Sender: TObject);
begin
  prc_Marcar_Desmarcar('I');
end;

procedure TfrmGerar_Lote_Ped.prc_Marcar_Desmarcar(Tipo: String); //I=Item   R=Referência   P=Pedido   TM=Total    TD=Total
var
  vIDProdAux: Integer;
  vMD: String;
  vIDPedAux: Integer;


  procedure prc_Somar_Qtd;
  begin
    if fDMCadLote.cdsPendenteSELECIONADO.AsString = 'S' then
      vQtd_Selecionada := vQtd_Selecionada + fDMCadLote.cdsPendenteQTD_RESTANTE.AsFloat
    else
      vQtd_Selecionada := vQtd_Selecionada - fDMCadLote.cdsPendenteQTD_RESTANTE.AsFloat;
  end;

  procedure prc_Selecionado;
  var
    vAux2: String;
  begin
    vAux2 := fDMCadLote.cdsPendenteSELECIONADO.AsString;
    if (trim(fDMCadLote.cdsPendenteSELECIONADO.AsString) = '') then
      vAux2 := 'N';
    if vAux2 <> vMD then
    begin
      fDMCadLote.cdsPendente.Edit;
      fDMCadLote.cdsPendenteSELECIONADO.AsString := vMD;
      fDMCadLote.cdsPendente.Post;
      prc_Somar_Qtd;
    end;
  end;


begin
  if not(fDMCadLote.cdsPendente.Active) or (fDMCadLote.cdsPendente.IsEmpty) then
    exit;
  SMDBGrid1.DisableScroll;
  if Tipo = 'TS' then
    vMD := 'S'
  else
  if Tipo = 'TD' then
    vMD := 'N'
  else
  if fDMCadLote.cdsPendenteSELECIONADO.AsString = 'S' then
    vMD := 'N'
  else
    vMD := 'S';
  if Tipo = 'I' then
  begin
    prc_Selecionado;
  end
  else
  if Tipo = 'R' then
  begin
    vIDProdAux := fDMCadLote.cdsPendenteID_PRODUTO.AsInteger;
    fDMCadLote.cdsPendente.First;
    while not fDMCadLote.cdsPendente.Eof do
    begin
      if fDMCadLote.cdsPendenteID_PRODUTO.AsInteger = vIDProdAux then
        prc_Selecionado;
      fDMCadLote.cdsPendente.Next;
    end;
    fDMCadLote.cdsPendente.Locate('ID_PRODUTO',vIDProdAux,[loCaseInsensitive]);
  end
  else
  if Tipo = 'P' then
  begin
    vIDPedAux := fDMCadLote.cdsPendenteID.AsInteger;
    fDMCadLote.cdsPendente.First;
    while not fDMCadLote.cdsPendente.Eof do
    begin
      if fDMCadLote.cdsPendenteID.AsInteger = vIDPedAux then
        prc_Selecionado;
      fDMCadLote.cdsPendente.Next;
    end;
    fDMCadLote.cdsPendente.Locate('ID',vIDPedAux,[loCaseInsensitive]);
  end
  else
  if copy(Tipo,1,1) = 'T' then
  begin
    fDMCadLote.cdsPendente.First;
    while not fDMCadLote.cdsPendente.Eof do
    begin
      prc_Selecionado;
      fDMCadLote.cdsPendente.Next;
    end;
  end;
  SMDBGrid1.EnableScroll;
end;

procedure TfrmGerar_Lote_Ped.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMCadLote.cdsTingimentoCRU.AsString = 'S' then
    AFont.Style := [fsBold];
end;

procedure TfrmGerar_Lote_Ped.MarcarCampoGerarOC1Click(Sender: TObject);
begin
  prc_Marcar_Desmarcar('R');
end;

procedure TfrmGerar_Lote_Ped.MarcarDesmarcarPedido1Click(Sender: TObject);
begin
  prc_Marcar_Desmarcar('P');
end;

procedure TfrmGerar_Lote_Ped.MarcartodososcampoparagerarOC1Click(
  Sender: TObject);
begin
  prc_Marcar_Desmarcar('TS');
end;

procedure TfrmGerar_Lote_Ped.Desmarcartodos1Click(Sender: TObject);
begin
  prc_Marcar_Desmarcar('TD');
end;

procedure TfrmGerar_Lote_Ped.ImprimirOrdemProduo1Click(Sender: TObject);
var
  vNumOrdemAux: String;
  fDMLoteImp: TDMLoteImp;
  vArq: String;
  sds: TSQLDataSet;
begin
  if fDMCadLote.qParametros_LoteUSA_LOTE_PED_SPROC.AsString = 'S' then
  begin
    fDMLoteImp := TDMLoteImp.Create(Self);
    fDMLoteImp.mImpAux.EmptyDataSet;
    fDMCadLote.cdsConsulta_Lote_Ped.First;
    while not fDMCadLote.cdsConsulta_Lote_Ped.Eof do
    begin
      if (SMDBGrid3.SelectedRows.CurrentRowSelected) then
      begin
        fDMLoteImp.mImpAux.Insert;
        fDMLoteImp.mImpAuxID.AsInteger := fDMCadLote.cdsConsulta_Lote_PedID.AsInteger;
        fDMLoteImp.mImpAux.Post;
      end;
      fDMCadLote.cdsConsulta_Lote_Ped.Next;
    end;
    vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Lote_Fepam2.fr3';
    if not (FileExists(vArq)) then
    begin
      MessageDlg('*** Relatório não localizado: ' + vArq , mtInformation, [mbOk], 0);
      FreeAndNil(fDMLoteImp);
      exit;
    end;
    fDMLoteImp.frxReport1.Report.LoadFromFile(vArq);
    fDMLoteImp.frxReport1.ShowReport;
  end
  else
  begin
    if fDMCadLote.mLoteNum_Ordem.AsInteger > 0 then
      vNumOrdemAux := fDMCadLote.mLoteNum_Ordem.AsString
    else
      vNumOrdemAux := '';
    vNumOrdemAux := InputBox('Imprimir Ordem de Produção','Informe o número da Ordem de Produção: ', vNumOrdemAux);
    vNumOrdemAux := Monta_Numero(vNumOrdemAux,0);
    if (trim(vNumOrdemAux) = '') or (vNumOrdemAux = '0') then
    begin
      MessageDlg('*** Ordem de Produção não informada!', mtError, [mbOk], 0);
      exit;
    end;

    vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Talao_Por_Processo.fr3';
    if not (FileExists(vArq)) then
    begin
      MessageDlg('*** Relatório não localizado: ' + vArq , mtInformation, [mbOk], 0);
      exit;
    end;
    fDMCadLote.qImpressao.Close;
    fDMCadLote.qImpressao.ParamByName('NUM_ORDEM').AsInteger := StrToInt(vNumOrdemAux);
    fDMCadLote.qImpressao.Open;
    if not (fDMCadLote.qImpressao.IsEmpty) then
    begin
      if MessageDlg('OP já impressa, deseja Reimprimir?',mtInformation,[mbYes,mbNo],0) = mrNo then
      Exit;
    end;

    sds := TSQLDataSet.Create(nil);
    try
      sds.SQLConnection := dmDatabase.scoDados;
      sds.NoMetadata    := True;
      sds.GetMetadata   := False;
      sds.CommandText   := ' UPDATE LOTE SET IMPRESSO = ' + QuotedStr('S') +
                           ' WHERE NUM_ORDEM = ' + vNumOrdemAux;
      sds.ExecSQL;
    finally
      FreeAndNil(sds);
    end;

    fDMLoteImp := TDMLoteImp.Create(Self);
    fDMLoteImp.cdsTalao_Proc.Close;
    fDMLoteImp.sdsTalao_Proc.ParamByName('NUM_ORDEM').AsInteger := StrToInt(vNumOrdemAux) ;
    fDMLoteImp.cdsTalao_Proc.Open;
    fDMLoteImp.cdsTalao_Proc.First;
    {fDMLoteImp.cdsLote_Processo.Close;
    fDMLoteImp.sdsLote_Processo.ParamByName('ID_LOTE').AsInteger := fDMLoteImp.cdsTalao_SLID.AsInteger;
    fDMLoteImp.cdsLote_Processo.Open;}
    fDMLoteImp.frxReport1.Report.LoadFromFile(vArq);
    fDMLoteImp.frxReport1.ShowReport;
  end;
  
  FreeAndNil(fDMLoteImp);
end;

procedure TfrmGerar_Lote_Ped.prc_Marcar_Desmarcar_PED(Tipo: String);//P=Pedido   TM=Total marcar    TD=Total Desmarcar
var
  ID: Integer;
begin
  ID := fDMCadLote.cdsPendente_PedID.AsInteger;
  if Tipo = 'P' then
  begin
    fDMCadLote.cdsPendente_Ped.Edit;
    if fDMCadLote.cdsPendente_PedSELECIONADO.AsString = 'S' then
      fDMCadLote.cdsPendente_PedSELECIONADO.AsString := 'N'
    else
      fDMCadLote.cdsPendente_PedSELECIONADO.AsString := 'S';
    fDMCadLote.cdsPendente_Ped.Post;
  end
  else
  begin
    fDMCadLote.cdsPendente_Ped.First;
    while not fDMCadLote.cdsPendente_Ped.Eof do
    begin
      fDMCadLote.cdsPendente_Ped.Edit;
      if Tipo = 'TM' then
        fDMCadLote.cdsPendente_PedSELECIONADO.AsString := 'S'
      else
        fDMCadLote.cdsPendente_PedSELECIONADO.AsString := 'N';
      fDMCadLote.cdsPendente_Ped.Post;
      fDMCadLote.cdsPendente_Ped.Next;
    end;
  end;
  fDMCadLote.cdsPendente_Ped.Locate('ID',ID,[loCaseInsensitive]);
end;

procedure TfrmGerar_Lote_Ped.SMDBGrid2DblClick(Sender: TObject);
var
  ffrmAltQtdLote: TfrmAltQtdLote;
begin
  if not(fDMCadLote.cdsConsulta_Lote_Proc.Active) or (fDMCadLote.cdsConsulta_Lote_ProcID.AsInteger <= 0) then
    exit;
  fDMCadLote.prc_Localizar(fDMCadLote.cdsConsulta_Lote_ProcID.AsInteger);
  if fDMCadLote.cdsLote.IsEmpty then
  begin
    MessageDlg('*** Lote não encontrado na base!', mtError, [mbOk], 0);
    exit;
  end;
  ffrmAltQtdLote := TfrmAltQtdLote.Create(self);
  ffrmAltQtdLote.fDMCadLote := fDMCadLote;
  ffrmAltQtdLote.btnExcluir.Enabled := False;
  ffrmAltQtdLote.ShowModal;
  FreeAndNil(ffrmAltQtdLote);
end;

procedure TfrmGerar_Lote_Ped.CurrencyEdit3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    btnConsultarClick(Sender);
end;

procedure TfrmGerar_Lote_Ped.btnGerarAuxiliarClick(Sender: TObject);
begin
  vIDLoteAux := 0;
  if MessageDlg('Gerar Lote/Talões?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;
  vNumLote := 0;

  SMDBGrid1.DisableScroll;
  fDMCadLote.vMsgErro := '';
  fDMCadLote.mMaterial.EmptyDataSet;
  vNumOrdem := 0;
  vID_BaixaProcesso := 0;
  fDMCadLote.cdsBaixa_Processo.Close;

  prc_Le_cdsPendenteAux;

  SMDBGrid1.EnableScroll;

  if fDMCadLote.vGerado then
  begin
    fDMCadLote.qProxima_Ordem.Close;
    fDMCadLote.qProxima_Ordem.Open;
    CurrencyEdit3.AsInteger := fDMCadLote.qProxima_OrdemNUM_ORDEM.AsInteger;
    RzPageControl2.ActivePage := TS_Consulta;
    btnConsultarClick(Sender);
  end;
end;

procedure TfrmGerar_Lote_Ped.prc_Le_cdsPendenteAux;
var
  ID: TTransactionDesc;
  sds: TSQLDataSet;
begin
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

    fDMCadLote.cdsPendente.First;
    while not fDMCadLote.cdsPendente.Eof do
    begin
      if (fDMCadLote.cdsPendenteSELECIONADO.AsString = 'S') then
      begin
        if fDMCadLote.cdsProdutoID.AsInteger <> fDMCadLote.cdsPendenteID_PRODUTO.AsInteger then
          fDMCadLote.cdsProduto.Locate('ID',fDMCadLote.cdsPendenteID_PRODUTO.AsInteger,[loCaseInsensitive]);
        prc_Gerar_Lote;
      end;
      fDMCadLote.cdsPendente.Next;
    end;
    fDMCadLote.cdsLote.ApplyUpdates(0);
    if trim(fDMCadLote.qParametros_LoteUSA_LOTE_PED_SPROC.AsString) <> 'S' then
      fDMCadLote.cdsBaixa_Processo.ApplyUpdates(0);

    dmDatabase.scoDados.Commit(ID);
    fDMCadLote.vGerado := True;

  except
    dmDatabase.scoDados.Rollback(ID);
    raise;
  end;
  FreeAndNil(sds);
end;

procedure TfrmGerar_Lote_Ped.SMDBGrid1DblClick(Sender: TObject);
begin
  if not(fDMCadLote.cdsPendente.Active) or (fDMCadLote.cdsPendenteID.AsInteger <= 0) then
    exit;

  fDMCadLote.cdsPendente.Edit;
  if fDMCadLote.cdsPendenteSELECIONADO.AsString = 'S' then
    fDMCadLote.cdsPendenteSELECIONADO.AsString := ''
  else
    fDMCadLote.cdsPendenteSELECIONADO.AsString := 'S';
  fDMCadLote.cdsPendente.Post;
end;

procedure TfrmGerar_Lote_Ped.prc_Grava_Baixa_Processo;
begin

end;

procedure TfrmGerar_Lote_Ped.prc_Consultar_Lote_Ped;
var
  vComando: String;
begin
  fDMCadLote.cdsConsulta_Lote_Ped.Close;
  fDMCadLote.sdsConsulta_Lote_Ped.CommandText := fDMCadLote.ctConsulta_Lote_Ped + ' WHERE 0 = 0 ';
  vComando := '';
  if CurrencyEdit3.AsInteger > 0 then
    vComando :=  vComando + ' AND L.NUM_ORDEM = ' + CurrencyEdit3.Text;
  if DateEdit1.Date > 10 then
    vComando := vComando + ' AND L.DTENTREGA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    vComando := vComando + ' AND L.DTENTREGA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  if DateEdit3.Date > 10 then
    vComando := vComando + ' AND L.DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit3.date));
  if DateEdit4.Date > 10 then
    vComando := vComando + ' AND L.DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit4.date));
  case cbxOpcao.ItemIndex of
    1: vComando := vComando + ' AND L.QTD_PENDENTE > 0 AND IT.QTD_RESTANTE > 0 ';
    2: vComando := vComando + ' AND L.QTD_PENDENTE > 0 ';
    3: vComando := vComando + ' AND L.QTD_PRODUZIDO > 0';
  end;
  if trim(Edit1.Text) <> '' then
    vComando := vComando + ' AND L.OBS_PED LIKE ' + QuotedStr('%<'+Edit1.Text+'>%');
  if trim(Edit2.Text) <> '' then
    vComando := vComando + ' AND CLI.NOME LIKE ' + QuotedStr('%<'+Edit3.Text+'>%');
  if CurrencyEdit1.AsInteger > 0 then
    vComando :=  vComando + ' AND L.NUM_LOTE >= ' + IntToStr(CurrencyEdit1.AsInteger);
  if CurrencyEdit2.AsInteger > 0 then
    vComando :=  vComando + ' AND L.NUM_LOTE <= ' + IntToStr(CurrencyEdit2.AsInteger);
  fDMCadLote.sdsConsulta_Lote_Ped.CommandText := fDMCadLote.sdsConsulta_Lote_Ped.CommandText + vComando;
  fDMCadLote.cdsConsulta_Lote_Ped.Open;
end;

end.
