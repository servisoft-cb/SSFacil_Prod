unit UConsLoteProc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMLoteImp, DBVGrids, Grids, DBGrids, SMDBGrid, StdCtrls,
  NxCollection, RxLookup, NxEdit, CurrEdit, Mask, ToolEdit, ExtCtrls,
  RzTabs, DB, Menus;

type
  TfrmConsLoteProc = class(TForm)
    Panel1: TPanel;
    NxLabel2: TNxLabel;
    NxLabel4: TNxLabel;
    NxLabel5: TNxLabel;
    NxLabel6: TNxLabel;
    NxLabel9: TNxLabel;
    NxLabel10: TNxLabel;
    Shape6: TShape;
    Label6: TLabel;
    NxLabel11: TNxLabel;
    NxLabel12: TNxLabel;
    Label5: TLabel;
    btnConsTalao: TNxButton;
    CurrencyEdit3: TCurrencyEdit;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    cbxOpcao: TNxComboBox;
    Edit1: TEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    CurrencyEdit5: TCurrencyEdit;
    Edit2: TEdit;
    btnImprimir: TNxButton;
    RzPageControl1: TRzPageControl;
    TS_Talao: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    NxLabel13: TNxLabel;
    DateEdit5: TDateEdit;
    NxLabel14: TNxLabel;
    DateEdit6: TDateEdit;
    NxLabel1: TNxLabel;
    Edit3: TEdit;
    TS_Ref: TRzTabSheet;
    SMDBGrid2: TSMDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    ComboBox1: TComboBox;
    PopupMenu1: TPopupMenu;
    Imprimir1: TMenuItem;
    PorFuso1: TMenuItem;
    PorTipodeProduto1: TMenuItem;
    TS_Pedido: TRzTabSheet;
    SMDBGrid3: TSMDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsTalaoClick(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure CurrencyEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit5Exit(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3Enter(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure SMDBGrid2TitleClick(Column: TColumn);
    procedure Imprimir1Click(Sender: TObject);
    procedure PorFuso1Click(Sender: TObject);
    procedure PorTipodeProduto1Click(Sender: TObject);
  private
    { Private declarations }
    fDMLoteImp: TDMLoteImp;
    vOpcaoImp : String;
    vNomeAnt : String;

    function fnc_Busca_Cliente(ID : Integer) : String;

    procedure prc_Monta_Opcao;
    procedure prc_InformarDtProducao;
    procedure prc_Consulta_Talao;
    procedure prc_Consulta_Ref;
    procedure prc_Monta_mAuxProcesso_Ped;

    function  fnc_Condicao : WideString;

    procedure prc_Imprimir(Tipo : String); //S- Sem Classificação    F= Por Fuso    T= Tipo de Produto

  public
    { Public declarations }
  end;

var
  frmConsLoteProc: TfrmConsLoteProc;

implementation

uses rsDBUtils, USel_Pessoa, uUtilPadrao, UInfDtProd, USel_Produto, StrUtils;

{$R *.dfm}

procedure TfrmConsLoteProc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsLoteProc.FormShow(Sender: TObject);
begin
  fDMLoteImp:= TDMLoteImp.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMLoteImp);
  fDMLoteImp.cdsProcesso.Open;
end;

procedure TfrmConsLoteProc.btnConsTalaoClick(Sender: TObject);
begin
  if (RzPageControl1.ActivePage = TS_Talao) or (RzPageControl1.ActivePage = TS_Pedido) then
  begin
    prc_Consulta_Talao;
    if RzPageControl1.ActivePage = TS_Pedido then
      prc_Monta_mAuxProcesso_Ped;
  end
  else
  if RzPageControl1.ActivePage = TS_Ref then
    prc_Consulta_Ref;
end;

procedure TfrmConsLoteProc.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
  vCor : TColor;
begin
  ColunaOrdenada := Column.FieldName;
  if Column.FieldName = 'REFERENCIA' then
    fDMLoteImp.cdsConsulta_Lote.IndexFieldNames := Column.FieldName + ';NOME_COMBINACAO;DTENTREGA;PEDIDO_CLIENTE'
  else
  if Column.FieldName = 'PEDIDO_CLIENTE' then
    fDMLoteImp.cdsConsulta_Lote.IndexFieldNames := Column.FieldName + ';REFERENCIA;NOME_COMBINACAO;DTENTREGA'
  else
  if Column.FieldName = 'DTENTREGA' then
    fDMLoteImp.cdsConsulta_Lote.IndexFieldNames := Column.FieldName + ';REFERENCIA;NOME_COMBINACAO;PEDIDO_CLIENTE'
  else
  if Column.FieldName = 'NOME_COMBINACAO' then
    fDMLoteImp.cdsConsulta_Lote.IndexFieldNames := Column.FieldName + ';REFERENCIA;DTENTREGA;PEDIDO_CLIENTE'
  else
    fDMLoteImp.cdsConsulta_Lote.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I] = Column) then
      SMDBGrid1.Columns.Items[I].Title.Color := $00B7FFB7;
end;

procedure TfrmConsLoteProc.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMLoteImp.cdsConsulta_LoteDTBAIXA.AsDateTime > 10 then
    Background := $0077FF77
  else
  if fDMLoteImp.cdsConsulta_LoteDTENTRADA.AsDateTime > 10 then
    Background := $00FFFFB9;
end;

procedure TfrmConsLoteProc.CurrencyEdit5KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    if CurrencyEdit5.AsInteger > 0 then
      vCodPessoa_Pos := CurrencyEdit5.AsInteger;
    frmSel_Pessoa := TfrmSel_Pessoa.Create(Self);
    frmSel_Pessoa.vTipo_Pessoa := 'C';
    frmSel_Pessoa.ShowModal;
    if vCodPessoa_Pos > 0 then
    begin
      CurrencyEdit5.AsInteger := vCodPessoa_Pos;
      CurrencyEdit5.SetFocus;
      Edit3.Text := '';
      if CurrencyEdit5.AsInteger > 0 then
        Edit3.Text := fnc_Busca_Cliente(CurrencyEdit5.AsInteger);
    end;
  end;
end;

function TfrmConsLoteProc.fnc_Busca_Cliente(ID: Integer): String;
begin
  Result := '';
  fDMLoteImp.qCliente.Close;
  fDMLoteImp.qCliente.ParamByName('CODIGO').AsInteger := ID;
  fDMLoteImp.qCliente.Open;
  Result := fDMLoteImp.qClienteNOME.AsString;
end;

procedure TfrmConsLoteProc.CurrencyEdit5Exit(Sender: TObject);
begin
  if CurrencyEdit5.AsInteger > 0 then
    Edit3.Text := fnc_Busca_Cliente(CurrencyEdit5.AsInteger);
end;

procedure TfrmConsLoteProc.prc_Monta_Opcao;
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
  if trim(RxDBLookupCombo1.Text) <> '' then
    vOpcaoImp := vOpcaoImp + '(Processo: ' + RxDBLookupCombo1.Text + ')';
  if CurrencyEdit5.AsInteger > 0 then
    vOpcaoImp := vOpcaoImp + '(Processo: ' + Edit3.Text + ')';
  if trim(Edit2.Text) <> '' then
    vOpcaoImp := vOpcaoImp + '(Nº Pedido: ' + Edit2.Text + ')';
  if trim(Edit1.Text) <> '' then
    vOpcaoImp := vOpcaoImp + '(Referência: ' + Edit1.Text + ')';
  case cbxOpcao.ItemIndex of
    1 : vOpcaoImp := vOpcaoImp + '(Aguardando entrada em Produção) ';
    2 : vOpcaoImp := vOpcaoImp + '(Pendente (Em Produção/E Aguardando)';
    3 : vOpcaoImp := vOpcaoImp + '(Pendente (Em Produção)';
  end;
end;

procedure TfrmConsLoteProc.prc_InformarDtProducao;
var
  ffrmInfDtProd: TfrmInfDtProd;
begin
  ffrmInfDtProd := TfrmInfDtProd.Create(self);
  ffrmInfDtProd.fDMLoteImp := fDMLoteImp;
  if fDMLoteImp.vDtProducaoIni > 10 then
    ffrmInfDtProd.DateEdit1.Date := fDMLoteImp.vDtProducaoIni;
  if fDMLoteImp.vDtProducaoFin > 10 then
    ffrmInfDtProd.DateEdit2.Date := fDMLoteImp.vDtProducaoFin;
  ffrmInfDtProd.ShowModal;
  FreeAndNil(ffrmInfDtProd);
end;

procedure TfrmConsLoteProc.RxDBLookupCombo1Change(Sender: TObject);
begin
  fDMLoteImp.cdsConsulta_Lote.Close;
end;

procedure TfrmConsLoteProc.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    if trim(Edit1.Text) <> '' then
      vReferencia_Pos := Edit1.Text;
    frmSel_Produto := TfrmSel_Produto.Create(Self);
    frmSel_Produto.ShowModal;
    if vCodProduto_Pos > 0 then
      Edit1.Text := vReferencia_Pos;
  end;
end;

procedure TfrmConsLoteProc.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    if CurrencyEdit5.AsInteger > 0 then
      vCodPessoa_Pos := CurrencyEdit5.AsInteger;
    frmSel_Pessoa := TfrmSel_Pessoa.Create(Self);
    frmSel_Pessoa.vTipo_Pessoa := 'C';
    frmSel_Pessoa.ShowModal;
    if vCodPessoa_Pos > 0 then
    begin
      CurrencyEdit5.AsInteger := vCodPessoa_Pos;
      CurrencyEdit5.SetFocus;
      Edit3.Text := '';
      if CurrencyEdit5.AsInteger > 0 then
        Edit3.Text := fnc_Busca_Cliente(CurrencyEdit5.AsInteger);
    end;
  end;
end;

procedure TfrmConsLoteProc.Edit3Enter(Sender: TObject);
begin
  vNomeAnt := Edit3.Text;
end;

procedure TfrmConsLoteProc.Edit3Exit(Sender: TObject);
begin
  if (vNomeAnt <> Edit3.Text) and (trim(Edit3.Text) <> '') then
    CurrencyEdit5.Clear;
end;

procedure TfrmConsLoteProc.prc_Consulta_Talao;
var
  vComando : String;
begin
  vComando := fnc_Condicao;
  fDMLoteImp.cdsConsulta_Lote.Close;
  fDMLoteImp.sdsConsulta_Lote.CommandText := fDMLoteImp.ctConsulta_Lote + vComando;
  fDMLoteImp.cdsConsulta_Lote.Open;
  fDMLoteImp.cdsConsulta_Lote.IndexFieldNames := 'ID_BAIXA;ITEM_BAIXA';
end;

procedure TfrmConsLoteProc.prc_Consulta_Ref;
var
  vComando  : String;
  vComando2 : String;
  i : Integer;
begin
  i := posex('GROUP',fDMLoteImp.ctConsLoteRef);
  vComando  := copy(fDMLoteImp.ctConsLoteRef,1,i-1);
  vComando2 := copy(fDMLoteImp.ctConsLoteRef,i,Length(fDMLoteImp.ctConsLoteRef)-i+1);
  vComando  := vComando + fnc_Condicao + ' ' + vComando2;
  fDMLoteImp.cdsConsLoteRef.Close;
  fDMLoteImp.sdsConsLoteRef.CommandText := vComando;
  fDMLoteImp.cdsConsLoteRef.Open;
  fDMLoteImp.cdsConsLoteRef.IndexFieldNames := 'REFERENCIA;NOME_COMBINACAO';
end;

function TfrmConsLoteProc.fnc_Condicao: WideString;
var
  vComando : String;
  vAux : String;
begin
  vAux := '';
  vComando := ' WHERE 0 = 0';
  if CurrencyEdit3.AsInteger > 0 then
    vComando := vComando + '  AND NUM_ORDEM = ' + IntToStr(CurrencyEdit3.AsInteger);
  if CurrencyEdit1.AsInteger > 0 then
    vComando := vComando + '  AND NUM_LOTE >= ' + IntToStr(CurrencyEdit1.AsInteger);
  if CurrencyEdit2.AsInteger > 0 then
    vComando := vComando + '  AND NUM_LOTE <= ' + IntToStr(CurrencyEdit2.AsInteger);
  if DateEdit5.Date > 10 then
    vComando := vComando + ' AND ' + vAux + 'DTENTREGA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit5.date));
  if DateEdit6.Date > 10 then
    vComando := vComando + ' AND ' + vAux + 'DTENTREGA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit6.date));

  case cbxOpcao.ItemIndex of
    1 : vComando := vComando + ' AND DTBAIXA is null and DTENTRADA IS NULL';
    2 : vComando := vComando + ' AND DTBAIXA is null ';
    3 : vComando := vComando + ' AND DTBAIXA is null AND DTENTRADA IS NOT NULL ';
  end;

  if trim(Edit1.Text) <> '' then
    vComando := vComando + ' AND REFERENCIA = ' + QuotedStr(Edit1.Text);
  if trim(RxDBLookupCombo1.Text) <> '' then
    vComando := vComando + ' AND ID_PROCESSO = ' + IntToStr(RxDBLookupCombo1.KeyValue);
  if trim(Edit2.Text) <> '' then
    vComando := vComando + ' AND PEDIDO_CLIENTE LIKE ' + QuotedStr('%<'+Edit2.Text+'>%');
  if CurrencyEdit5.AsInteger > 0 then
    vComando := vComando + ' AND ID_CLIENTE = ' + IntToStr(CurrencyEdit5.AsInteger)
  else
  if trim(Edit3.Text) <> '' then
    vComando := vComando + ' AND NOME_CLIENTE LIKE ' + QuotedStr('%'+Edit3.Text+'%');
  Result := vComando;
end;

procedure TfrmConsLoteProc.SMDBGrid2TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  if Column.FieldName = 'REFERENCIA' then
    fDMLoteImp.cdsConsLoteRef.IndexFieldNames := Column.FieldName + ';NOME_COMBINACAO'
  else
  if Column.FieldName = 'NOME_COMBINACAO' then
    fDMLoteImp.cdsConsLoteRef.IndexFieldNames := Column.FieldName + ';REFERENCIA'
  else
    fDMLoteImp.cdsConsLoteRef.IndexFieldNames := Column.FieldName;
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid2.Columns.Count - 1 do
    if not (SMDBGrid2.Columns.Items[I] = Column) then
      SMDBGrid2.Columns.Items[I].Title.Color := $00FFFFBB;
end;

procedure TfrmConsLoteProc.Imprimir1Click(Sender: TObject);
begin
  prc_Imprimir('S');
end;

procedure TfrmConsLoteProc.prc_Imprimir(Tipo: String); //S- Sem Classificação    F= Por Fuso    T= Tipo de Produto
var
  vArq : String;
  vDetalhada : String;
  vOrdemAux : String;
begin
  fDMLoteImp.vUsaKG := False;
  vDetalhada := '';
  prc_InformarDtProducao;
  prc_Monta_Opcao;
  vOrdemAux := '';
  if Tipo = 'F' then
    vOrdemAux := 'FUSO;'
  else
  if Tipo = 'T' then
    vOrdemAux := 'DESC_TIPO_PRODUTO;';
  if RzPageControl1.ActivePage = TS_Talao then
  begin
    if ComboBox1.ItemIndex = 0 then
    begin
      fDMLoteImp.cdsConsulta_Lote.IndexFieldNames := vOrdemAux + 'REFERENCIA;NOME_COMBINACAO;DTENTREGA;PEDIDO_CLIENTE';
      vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Lote_Ref.fr3';
    end
    else
    begin
      fDMLoteImp.vUsaKG := True;
      fDMLoteImp.cdsConsulta_Lote.IndexFieldNames := vOrdemAux + 'DTENTREGA;REFERENCIA;NOME_COMBINACAO;PEDIDO_CLIENTE';
      vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Lote_RefDTEntrega.fr3';
    end;
    vDetalhada := 'Detalhada';
  end
  else
  if RzPageControl1.ActivePage = TS_Pedido then
  begin                                   
    if ComboBox1.ItemIndex = 0 then
    begin                        
      fDMLoteImp.mAuxProcesso_Ped.IndexFieldNames := vOrdemAux + 'REFERENCIA;NOME_COR;DTENTREGA;PEDIDO_CLIENTE';
      vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Lote_Ref_Ped.fr3';
    end
    else
    begin
      fDMLoteImp.vUsaKG := True;
      fDMLoteImp.mAuxProcesso_Ped.IndexFieldNames := vOrdemAux + 'DTENTREGA;REFERENCIA;NOME_COR;PEDIDO_CLIENTE';
      vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Lote_RefDTEntrega_Ped.fr3';
    end;
    vDetalhada := 'Detalhada';
  end
  else
  begin
    fDMLoteImp.cdsConsLoteRef.IndexFieldNames := 'REFERENCIA;NOME_COMBINACAO';
    vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Lote_RefAcum.fr3';
  end;
  if FileExists(vArq) then
    fDMLoteImp.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    MessageDlg('*** Relatório ' + vArq + ', não encontrado!' , mtInformation, [mbOk], 0);
    exit;
  end;
  if ((RzPageControl1.ActivePage = TS_Talao) or (RzPageControl1.ActivePage = TS_Pedido)) and (ComboBox1.ItemIndex = 1) then
  begin
    fDMLoteImp.frxReport1.variables['UsaCarga'] := QuotedStr('N');
    if Trim(RxDBLookupCombo1.Text) <> '' then
    begin
      if (fDMLoteImp.cdsProcesso.Locate('ID',RxDBLookupCombo1.KeyValue,[loCaseInsensitive])) and (fDMLoteImp.cdsProcessoUSA_CARGA.AsString = 'S') then
        fDMLoteImp.frxReport1.variables['UsaCarga'] := QuotedStr('S');
    end;
  end;
  fDMLoteImp.frxReport1.variables['ImpOpcao']    := QuotedStr(vOpcaoImp);
  fDMLoteImp.frxReport1.variables['OpcaoTitulo'] := QuotedStr('Programação ' + vDetalhada + ' - ' + DateToStr(fDMLoteImp.vDtProducaoIni) + ' a ' + DateToStr(fDMLoteImp.vDtProducaoFin));
  fDMLoteImp.frxReport1.variables['Processo']    := QuotedStr(RxDBLookupCombo1.Text);
  fDMLoteImp.frxReport1.variables['Tipo']        := QuotedStr(Tipo);
  fDMLoteImp.frxReport1.ShowReport;
end;

procedure TfrmConsLoteProc.PorFuso1Click(Sender: TObject);
begin
  prc_Imprimir('F');
end;

procedure TfrmConsLoteProc.PorTipodeProduto1Click(Sender: TObject);
begin
  prc_Imprimir('T');
end;

procedure TfrmConsLoteProc.prc_Monta_mAuxProcesso_Ped;
var
  vCont: Integer;
  vQtdAux: Real;
  Form: TForm;
begin

  Form := TForm.Create(Application);
  uUtilPadrao.prc_Form_Aguarde(Form);

  try
    fDMLoteImp.cdsConsulta_Lote.First;
    while not fDMLoteImp.cdsConsulta_Lote.Eof do
    begin
      vCont   := 0;
      vQtdAux := fDMLoteImp.cdsConsulta_LoteQTD_PENDENTE.AsFloat;
      fDMLoteImp.cdsProcesso_Ped.Close;
      fDMLoteImp.sdsProcesso_Ped.ParamByName('ID').AsInteger := fDMLoteImp.cdsConsulta_LoteID_LOTE.AsInteger;
      fDMLoteImp.cdsProcesso_Ped.Open;
      fDMLoteImp.cdsProcesso_Ped.IndexFieldNames := 'DTENTREGA;NUM_PEDIDO';
      fDMLoteImp.cdsProcesso_Ped.First;
      while not fDMLoteImp.cdsProcesso_Ped.Eof do
      begin
        vCont := vCont + 1;
        if StrToFloat(FormatFloat('0.0000',vQtdAux)) > 0 then
        begin
          fDMLoteImp.mAuxProcesso_Ped.Insert;
          fDMLoteImp.mAuxProcesso_PedReferencia.AsString   := fDMLoteImp.cdsConsulta_LoteREFERENCIA.AsString;
          fDMLoteImp.mAuxProcesso_PedNome_Produto.AsString := fDMLoteImp.cdsConsulta_LoteNOME_PRODUTO.AsString;
          fDMLoteImp.mAuxProcesso_PedNome_Cor.AsString     := fDMLoteImp.cdsConsulta_LoteNOME_COMBINACAO.AsString;
          fDMLoteImp.mAuxProcesso_PedDtEntrega.AsDateTime  := fDMLoteImp.cdsProcesso_PedDTENTREGA.AsDateTime;
          if vCont = fDMLoteImp.cdsConsulta_Lote.RecordCount then
            fDMLoteImp.mAuxProcesso_PedQtd.AsFloat := StrToFloat(FormatFloat('0.0000',vQtdAux))
          else
          if StrToFloat(FormatFloat('0.0000',vQtdAux)) > StrToFloat(FormatFloat('0.0000',fDMLoteImp.cdsProcesso_PedQTD_PRODUCAO_PEDIDO.AsFloat)) then
            fDMLoteImp.mAuxProcesso_PedQtd.AsFloat := StrToFloat(FormatFloat('0.0000',fDMLoteImp.cdsProcesso_PedQTD_PRODUCAO_PEDIDO.AsFloat))
          else
            fDMLoteImp.mAuxProcesso_PedQtd.AsFloat := StrToFloat(FormatFloat('0.0000',vQtdAux));
          vQtdAux := StrToFloat(FormatFloat('0.0000',vQtdAux - fDMLoteImp.mAuxProcesso_PedQtd.AsFloat));
          fDMLoteImp.mAuxProcesso_PedUnidade.AsString := fDMLoteImp.cdsConsulta_LoteUNIDADE.AsString;
          fDMLoteImp.mAuxProcesso_PedNum_Ordem.AsInteger := fDMLoteImp.cdsConsulta_LoteNUM_ORDEM.AsInteger;
          fDMLoteImp.mAuxProcesso_PedNum_Lote.AsInteger  := fDMLoteImp.cdsConsulta_LoteNUM_LOTE.AsInteger;
          fDMLoteImp.mAuxProcesso_PedNum_Pedido.AsInteger := fDMLoteImp.cdsProcesso_PedNUM_PEDIDO.AsInteger;
          fDMLoteImp.mAuxProcesso_PedPedido_Cliente.AsString := fDMLoteImp.cdsProcesso_PedPEDIDO_CLIENTE.AsString;
          fDMLoteImp.mAuxProcesso_PedNome_Cliente.AsString := fDMLoteImp.cdsConsulta_LoteNOME_CLIENTE.AsString;
          fDMLoteImp.mAuxProcesso_PedID_Processo.AsInteger := fDMLoteImp.cdsConsulta_LoteID_PROCESSO.AsInteger;
          fDMLoteImp.mAuxProcesso_PedNome_Processo.AsString :=fDMLoteImp.cdsConsulta_LoteNOME_PROCESSO.AsString;
          fDMLoteImp.mAuxProcesso_PedFuso.AsFloat           := fDMLoteImp.cdsConsulta_LoteFUSO.AsFloat;
          fDMLoteImp.mAuxProcesso_PedDesc_Tipo_Produto.AsString := fDMLoteImp.cdsConsulta_LoteDESC_TIPO_PRODUTO.AsString;
          fDMLoteImp.mAuxProcesso_PedCarga.AsFloat              := fDMLoteImp.cdsConsulta_LoteCARGA.AsFloat;
          fDMLoteImp.mAuxProcesso_Ped.Post;
        end;
        if StrToFloat(FormatFloat('0.0000',vQtdAux)) <= 0 then
          fDMLoteImp.cdsProcesso_Ped.Last;
        fDMLoteImp.cdsProcesso_Ped.Next;
      end;
      fDMLoteImp.cdsConsulta_Lote.Next;
    end;
  finally
    FreeAndNil(Form);
  end;
end;

end.
