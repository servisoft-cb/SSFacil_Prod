unit UConsLote2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMLoteImp, DBVGrids, Grids, DBGrids, SMDBGrid, StdCtrls,
  NxCollection, RxLookup, NxEdit, CurrEdit, Mask, ToolEdit, ExtCtrls,
  RzTabs, DB, Menus;

type
  TfrmConsLote2 = class(TForm)
    Panel1: TPanel;
    NxLabel2: TNxLabel;
    NxLabel4: TNxLabel;
    NxLabel3: TNxLabel;
    NxLabel5: TNxLabel;
    NxLabel6: TNxLabel;
    NxLabel1: TNxLabel;
    NxLabel7: TNxLabel;
    NxLabel8: TNxLabel;
    NxLabel9: TNxLabel;
    NxLabel10: TNxLabel;
    Shape4: TShape;
    Label4: TLabel;
    Shape6: TShape;
    Label6: TLabel;
    NxLabel11: TNxLabel;
    NxLabel12: TNxLabel;
    lblNomeCliente: TNxLabel;
    Label5: TLabel;
    btnConsTalao: TNxButton;
    CurrencyEdit3: TCurrencyEdit;
    CurrencyEdit1: TCurrencyEdit;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    CurrencyEdit2: TCurrencyEdit;
    cbxOpcao: TNxComboBox;
    DateEdit3: TDateEdit;
    DateEdit4: TDateEdit;
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
    PopupMenu1: TPopupMenu;
    Detalhado1: TMenuItem;
    PorReferncia1: TMenuItem;
    StaticText1: TStaticText;
    alodeAjuste1: TMenuItem;
    NxLabel15: TNxLabel;
    CurrencyEdit4: TCurrencyEdit;
    TS_Pedido: TRzTabSheet;
    SMDBGrid2: TSMDBGrid;
    NxLabel16: TNxLabel;
    NxLabel17: TNxLabel;
    DateEdit7: TDateEdit;
    DateEdit8: TDateEdit;
    aloRetrabalho1: TMenuItem;
    NxLabel18: TNxLabel;
    cbxTipo: TNxComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsTalaoClick(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure CurrencyEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit5Exit(Sender: TObject);
    procedure Detalhado1Click(Sender: TObject);
    procedure PorReferncia1Click(Sender: TObject);
    procedure RxDBLookupCombo1Change(Sender: TObject);
    procedure SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure alodeAjuste1Click(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SMDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure aloRetrabalho1Click(Sender: TObject);
  private
    { Private declarations }
    fDMLoteImp: TDMLoteImp;
    vOpcaoImp : String;

    function fnc_Busca_Cliente(ID : Integer) : String;

    procedure prc_Monta_Opcao;
    procedure prc_InformarDtProducao;
    procedure prc_Consula_Lote;
    procedure prc_Consula_Lote_Ped;

    procedure prc_Imprime_Ajuste;

  public
    { Public declarations }
  end;

var
  frmConsLote2: TfrmConsLote2;

implementation

uses rsDBUtils, USel_Pessoa, uUtilPadrao, UInfDtProd, UGerar_Talao_Ajuste;

{$R *.dfm}

procedure TfrmConsLote2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsLote2.FormShow(Sender: TObject);
begin
  fDMLoteImp:= TDMLoteImp.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMLoteImp);
  fDMLoteImp.cdsProcesso.Open;
  TS_Talao.TabVisible  := trim(fDMLoteImp.qParametros_LoteUSA_LOTE_PED_SPROC.AsString) <> 'S';
  TS_Pedido.TabVisible := trim(fDMLoteImp.qParametros_LoteUSA_LOTE_PED_SPROC.AsString) = 'S';
  if fDMLoteImp.qParametros_LoteUSA_LOTE_PED_SPROC.AsString = 'S' then
  begin
    NxLabel2.Caption  := 'Nº Controle:';
    NxLabel4.Caption  := 'Nº OP:';
    NxLabel11.Visible := False;
    RxDBLookupCombo1.Visible := False;
    RzPageControl1.ActivePage := TS_Pedido;
    btnImprimir.Visible := False;
  end;
end;

procedure TfrmConsLote2.btnConsTalaoClick(Sender: TObject);
begin
  if fDMLoteImp.qParametros_LoteUSA_LOTE_PED_SPROC.AsString = 'S' then
    prc_Consula_Lote_Ped
  else
    prc_Consula_Lote;
end;

procedure TfrmConsLote2.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
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
      SMDBGrid1.Columns.Items[I].Title.Color := clBtnFace;
end;

procedure TfrmConsLote2.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMLoteImp.cdsConsulta_LoteDTBAIXA.AsDateTime > 10 then
    Background := $0077FF77
  else
  if fDMLoteImp.cdsConsulta_LoteDTENTRADA.AsDateTime > 10 then
    Background := $00FFFFB9;
end;

procedure TfrmConsLote2.CurrencyEdit5KeyDown(Sender: TObject;
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
      CurrencyEdit5.AsInteger := vCodPessoa_Pos;
    CurrencyEdit5.SetFocus;
    lblNomeCliente.Caption := '';
    if CurrencyEdit5.AsInteger > 0 then
      lblNomeCliente.Caption := fnc_Busca_Cliente(CurrencyEdit5.AsInteger);
  end
  else
  if (Key = Vk_Return) and (CurrencyEdit5.AsInteger > 0) then
    btnConsTalaoClick(Sender);
end;

function TfrmConsLote2.fnc_Busca_Cliente(ID: Integer): String;
begin
  Result := '';
  fDMLoteImp.qCliente.Close;
  fDMLoteImp.qCliente.ParamByName('CODIGO').AsInteger := ID;
  fDMLoteImp.qCliente.Open;
  Result := fDMLoteImp.qClienteNOME.AsString;
end;

procedure TfrmConsLote2.CurrencyEdit5Exit(Sender: TObject);
begin
  if CurrencyEdit5.AsInteger <= 0 then
    lblNomeCliente.Caption := ''
  else
    lblNomeCliente.Caption := fnc_Busca_Cliente(CurrencyEdit5.AsInteger);
end;

procedure TfrmConsLote2.prc_Monta_Opcao;
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
  if (DateEdit1.Date > 10) and (DateEdit2.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt Entrada Proc.: ' + DateEdit1.Text + ' a ' + DateEdit2.Text + ')'
  else
  if (DateEdit1.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt Entrada Proc.(Ini): ' + DateEdit1.Text + ')'
  else
  if (DateEdit2.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt Entrada Proc.(Fin): ' + DateEdit2.Text + ')';

  if (DateEdit3.Date > 10) and (DateEdit4.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt Baixa Proc.: ' + DateEdit3.Text + ' a ' + DateEdit4.Text + ')'
  else
  if (DateEdit3.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt Baixa Proc.(Ini): ' + DateEdit3.Text + ')'
  else
  if (DateEdit4.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt Baixa Proc.(Fin): ' + DateEdit4.Text + ')';
  if trim(RxDBLookupCombo1.Text) <> '' then
    vOpcaoImp := vOpcaoImp + '(Processo: ' + RxDBLookupCombo1.Text + ')';
  if CurrencyEdit5.AsInteger > 0 then
    vOpcaoImp := vOpcaoImp + '(Processo: ' + lblNomeCliente.Caption + ')';
  if trim(Edit2.Text) <> '' then
    vOpcaoImp := vOpcaoImp + '(Nº Pedido: ' + Edit2.Text + ')';
  if trim(Edit1.Text) <> '' then
    vOpcaoImp := vOpcaoImp + '(Referência: ' + Edit1.Text + ')';
  case cbxOpcao.ItemIndex of
    1 : vOpcaoImp := vOpcaoImp + '(Pendente)';
    2 : vOpcaoImp := vOpcaoImp + '(Encerrados)';
    3 : vOpcaoImp := vOpcaoImp + '(Talões Aguardando)';
  end;
end;

procedure TfrmConsLote2.Detalhado1Click(Sender: TObject);
var
  vArq : String;
begin
  prc_Monta_Opcao;
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Lote_Det.fr3';
  if FileExists(vArq) then
    fDMLoteImp.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    MessageDlg('*** Relatório ' + vArq + ', não encontrado!' , mtInformation, [mbOk], 0);
    exit;
  end;
  fDMLoteImp.frxReport1.variables['ImpOpcao'] := QuotedStr(vOpcaoImp);
  fDMLoteImp.frxReport1.ShowReport;
end;

procedure TfrmConsLote2.PorReferncia1Click(Sender: TObject);
var
  vArq : String;
begin
  if trim(RxDBLookupCombo1.Text) = '' then
  begin
    MessageDlg('*** Processo não informado!' , mtInformation, [mbOk], 0);
    RxDBLookupCombo1.SetFocus;
    exit;
  end;
  prc_InformarDtProducao;
  fDMLoteImp.cdsConsulta_Lote.IndexFieldNames := 'REFERENCIA;NOME_COMBINACAO;DTENTREGA;PEDIDO_CLIENTE';
  prc_Monta_Opcao;
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Lote_Ref.fr3';
  if FileExists(vArq) then
    fDMLoteImp.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    MessageDlg('*** Relatório ' + vArq + ', não encontrado!' , mtInformation, [mbOk], 0);
    exit;
  end;
  fDMLoteImp.frxReport1.variables['ImpOpcao']    := QuotedStr(vOpcaoImp);
  fDMLoteImp.frxReport1.variables['OpcaoTitulo'] := QuotedStr('Produção - ' + DateToStr(fDMLoteImp.vDtProducaoIni) + ' a ' + DateToStr(fDMLoteImp.vDtProducaoFin));
  fDMLoteImp.frxReport1.variables['Processo']    := QuotedStr(RxDBLookupCombo1.Text);
  fDMLoteImp.frxReport1.ShowReport;
end;

procedure TfrmConsLote2.prc_InformarDtProducao;
var
  ffrmInfDtProd: TfrmInfDtProd;
begin
  ffrmInfDtProd := TfrmInfDtProd.Create(self);
  ffrmInfDtProd.fDMLoteImp := fDMLoteImp;
  ffrmInfDtProd.ShowModal;
  FreeAndNil(ffrmInfDtProd);
end;

procedure TfrmConsLote2.RxDBLookupCombo1Change(Sender: TObject);
begin
  fDMLoteImp.cdsConsulta_Lote.Close;
end;

procedure TfrmConsLote2.SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((Key = Vk_F7) or (Key = Vk_F8)) and (fDMLoteImp.cdsConsulta_Lote.Active) and (fDMLoteImp.cdsConsulta_LoteID_BAIXA.AsInteger > 0) then
  begin
    if (Key = Vk_F7) and (StrToFloat(FormatFloat('0.0000',fDMLoteImp.cdsConsulta_LoteQTD_PENDENTE.AsFloat)) > 0) then
      MessageDlg('*** Este Processo esta com quantidade pendente!', mtInformation, [mbok], 0)
    else
    if (Key = Vk_F8) and (strToFloat(FormatFloat('0.0000',fDMLoteImp.cdsConsulta_LoteQTD_PRODUZIDO.AsFloat)) <= 0) then
      MessageDlg('*** Este Processo não possui quantidade produzida para gerar talão de retrabalho!', mtInformation, [mbok], 0)
    else
    begin
      if (Key = Vk_F8) then
      begin
        fDMLoteImp.cdsProcesso.Close;
        fDMLoteImp.cdsProcesso.Open;
        fDMLoteImp.cdsProcesso.Locate('ID',fDMLoteImp.cdsConsulta_LoteID_PROCESSO.AsInteger,[loCaseInsensitive]);
        if trim(fDMLoteImp.cdsProcessoRETRABALHO.AsString) <> 'S' then
        begin
          MessageDlg('*** Este Processo não esta marcado para gerar Retrabalho!', mtInformation, [mbok], 0);
          exit;
        end;
      end;

      frmGerar_Talao_Ajuste := TfrmGerar_Talao_Ajuste.Create(Self);
      if (Key = Vk_F7) then
        frmGerar_Talao_Ajuste.vTipo := 'A'
      else
        frmGerar_Talao_Ajuste.vTipo := 'R';
      frmGerar_Talao_Ajuste.vID_Baixa   := fDMLoteImp.cdsConsulta_LoteID_BAIXA.AsInteger;
      frmGerar_Talao_Ajuste.vItem_Baixa := fDMLoteImp.cdsConsulta_LoteITEM_BAIXA.AsInteger;
      frmGerar_Talao_Ajuste.CurrencyEdit6.AsInteger   := fDMLoteImp.cdsConsulta_LoteID_BAIXA.AsInteger;
      frmGerar_Talao_Ajuste.CurrencyEdit7.AsInteger   := fDMLoteImp.cdsConsulta_LoteITEM_BAIXA.AsInteger;

      frmGerar_Talao_Ajuste.vIDProcesso_Loc           := fDMLoteImp.cdsConsulta_LoteID_PROCESSO.AsInteger;
      frmGerar_Talao_Ajuste.CurrencyEdit2.AsInteger   := fDMLoteImp.cdsConsulta_LoteNUM_ORDEM.AsInteger;

      frmGerar_Talao_Ajuste.ShowModal;
      FreeAndNil(frmGerar_Talao_Ajuste);
      if fDMLoteImp.cdsConsulta_LoteNUM_LOTE.AsInteger > 0 then
      begin
        CurrencyEdit1.AsInteger := fDMLoteImp.cdsConsulta_LoteNUM_LOTE.AsInteger;
        CurrencyEdit2.AsInteger := fDMLoteImp.cdsConsulta_LoteNUM_LOTE.AsInteger;
      end
      else
        CurrencyEdit4.AsInteger := fDMLoteImp.cdsConsulta_LoteNUM_PEDIDO.AsInteger;
      btnConsTalaoClick(Sender);
    end;
  end;
end;

procedure TfrmConsLote2.alodeAjuste1Click(Sender: TObject);
begin
  if not(fDMLoteImp.cdsConsulta_Lote.Active) then
    exit;
  if trim(fDMLoteImp.cdsConsulta_LoteAJUSTE.AsString) <> 'S' then
  begin
    MessageDlg('*** Talão não é de Ajuste!' , mtInformation, [mbOk], 0);
    exit;
  end;
  prc_Imprime_Ajuste;
end;

procedure TfrmConsLote2.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) and (trim(Edit2.Text) <> '') then
    btnConsTalaoClick(Sender);
end;

procedure TfrmConsLote2.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) and (trim(Edit1.Text) <> '') then
    btnConsTalaoClick(Sender);
end;

procedure TfrmConsLote2.CurrencyEdit4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) and (CurrencyEdit4.AsInteger > 0) then
    btnConsTalaoClick(Sender);
end;

procedure TfrmConsLote2.CurrencyEdit3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) and (CurrencyEdit3.AsInteger > 0) then
    btnConsTalaoClick(Sender);
end;

procedure TfrmConsLote2.CurrencyEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) and (CurrencyEdit1.AsInteger > 0) then
    btnConsTalaoClick(Sender);
end;

procedure TfrmConsLote2.CurrencyEdit2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) and (CurrencyEdit2.AsInteger > 0) then
    btnConsTalaoClick(Sender);
end;

procedure TfrmConsLote2.prc_Consula_Lote;
var
  vComando : String;
begin
  vComando := ' WHERE 0 = 0';
  if CurrencyEdit3.AsInteger > 0 then
    vComando := vComando + '  AND NUM_ORDEM = ' + IntToStr(CurrencyEdit3.AsInteger);
  if CurrencyEdit1.AsInteger > 0 then
    vComando := vComando + '  AND NUM_LOTE >= ' + IntToStr(CurrencyEdit1.AsInteger);
  if CurrencyEdit2.AsInteger > 0 then
    vComando := vComando + '  AND NUM_LOTE <= ' + IntToStr(CurrencyEdit2.AsInteger);
  if DateEdit1.Date > 10 then
    vComando := vComando + ' AND DTENTRADA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    vComando := vComando + ' AND DTENTRADA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  if DateEdit3.Date > 10 then
    vComando := vComando + ' AND DTBAIXA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit3.date));
  if DateEdit4.Date > 10 then
    vComando := vComando + ' AND DTBAIXA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit4.date));
  if DateEdit5.Date > 10 then
    vComando := vComando + ' AND DTENTREGA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit5.date));
  if DateEdit6.Date > 10 then
    vComando := vComando + ' AND DTENTREGA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit6.date));
  if CurrencyEdit4.Value > 0 then
    vComando := vComando + ' AND NUM_PEDIDO = ' + IntToStr(CurrencyEdit4.AsInteger);

  if DateEdit7.Date > 10 then
    vComando := vComando + ' AND DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit7.date));
  if DateEdit8.Date > 10 then
    vComando := vComando + ' AND DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit8.date));

  case cbxOpcao.ItemIndex of
    1 : vComando := vComando + ' AND DTBAIXA is null ';
    2 : vComando := vComando + ' AND DTBAIXA is not null ';
    3 : vComando := vComando + ' AND DTENTRADA is null ';
  end;

  case cbxTipo.ItemIndex of
    1 : vComando := vComando + ' AND AJUSTE = ' + QuotedStr('S');
    2 : vComando := vComando + ' AND RETRABALHO = ' + QuotedStr('S');
  end;

  if trim(Edit1.Text) <> '' then
    vComando := vComando + ' AND REFERENCIA = ' + QuotedStr(Edit1.Text);
  if trim(RxDBLookupCombo1.Text) <> '' then
    vComando := vComando + ' AND ID_PROCESSO = ' + IntToStr(RxDBLookupCombo1.KeyValue);
  if trim(Edit2.Text) <> '' then
    vComando := vComando + ' AND PEDIDO_CLIENTE LIKE ' + QuotedStr('%<'+Edit2.Text+'>%');
  if CurrencyEdit5.AsInteger > 0 then
    vComando := vComando + ' AND ID_CLIENTE = ' + IntToStr(CurrencyEdit5.AsInteger);
  fDMLoteImp.cdsConsulta_Lote.Close;
  fDMLoteImp.sdsConsulta_Lote.CommandText := fDMLoteImp.ctConsulta_Lote + vComando;
  fDMLoteImp.cdsConsulta_Lote.Open;
  fDMLoteImp.cdsConsulta_Lote.IndexFieldNames := 'ID_BAIXA;ITEM_BAIXA';
end;

procedure TfrmConsLote2.prc_Consula_Lote_Ped;
var
  vComando : String;
begin
  vComando := ' WHERE 0 = 0';
  if CurrencyEdit3.AsInteger > 0 then
    vComando := vComando + '  AND L.NUM_ORDEM = ' + IntToStr(CurrencyEdit3.AsInteger);
  if CurrencyEdit1.AsInteger > 0 then
    vComando := vComando + '  AND L.NUM_LOTE >= ' + IntToStr(CurrencyEdit1.AsInteger);
  if CurrencyEdit2.AsInteger > 0 then
    vComando := vComando + '  AND L.NUM_LOTE <= ' + IntToStr(CurrencyEdit2.AsInteger);
  if DateEdit1.Date > 10 then
    vComando := vComando + ' AND L.DTENTRADA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    vComando := vComando + ' AND L.DTENTRADA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  if DateEdit3.Date > 10 then
    vComando := vComando + ' AND L.DTBAIXA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit3.date));
  if DateEdit4.Date > 10 then
    vComando := vComando + ' AND L.DTBAIXA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit4.date));
  if DateEdit5.Date > 10 then
    vComando := vComando + ' AND L.DTENTREGA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit5.date));
  if DateEdit6.Date > 10 then
    vComando := vComando + ' AND L.DTENTREGA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit6.date));

  if DateEdit7.Date > 10 then
    vComando := vComando + ' AND L.DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit7.date));
  if DateEdit8.Date > 10 then
    vComando := vComando + ' AND L.DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit8.date));

  if CurrencyEdit4.Value > 0 then
    vComando := vComando + ' AND P.NUM_PEDIDO = ' + IntToStr(CurrencyEdit4.AsInteger);
  case cbxOpcao.ItemIndex of
    1 : vComando := vComando + ' AND L.DTBAIXA is null ';
    2 : vComando := vComando + ' AND L.DTBAIXA is not null ';
    3 : vComando := vComando + ' AND L.DTENTRADA is null ';
  end;
  if trim(Edit1.Text) <> '' then
    vComando := vComando + ' AND L.REFERENCIA = ' + QuotedStr(Edit1.Text);
  if trim(Edit2.Text) <> '' then
    vComando := vComando + ' AND L.OBS_PED LIKE ' + QuotedStr('%<'+Edit2.Text+'>%');
  if CurrencyEdit5.AsInteger > 0 then
    vComando := vComando + ' AND L.ID_CLIENTE = ' + IntToStr(CurrencyEdit5.AsInteger);
  fDMLoteImp.cdsLote_Ped.Close;
  fDMLoteImp.sdsLote_Ped.CommandText := fDMLoteImp.ctLote_Ped + vComando;
  fDMLoteImp.cdsLote_Ped.Open;
end;

procedure TfrmConsLote2.SMDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMLoteImp.cdsLote_PedDTBAIXA.AsDateTime > 10 then
    Background := $0077FF77
  else
  if fDMLoteImp.cdsLote_PedDTENTRADA.AsDateTime > 10 then
    Background := $00FFFFB9;
end;

procedure TfrmConsLote2.prc_Imprime_Ajuste;
var
  vArq : String;
begin
  fDMLoteImp.cdsTalao_Ajuste.Close;
  fDMLoteImp.sdsTalao_Ajuste.ParamByName('ID').AsInteger          := fDMLoteImp.cdsConsulta_LoteID_BAIXA.AsInteger;
  fDMLoteImp.sdsTalao_Ajuste.ParamByName('ITEM').AsInteger        := fDMLoteImp.cdsConsulta_LoteITEM_BAIXA.AsInteger;
  fDMLoteImp.sdsTalao_Ajuste.ParamByName('ID_PROCESSO').AsInteger := fDMLoteImp.cdsConsulta_LoteID_PROCESSO.AsInteger;
  fDMLoteImp.cdsTalao_Ajuste.Open;
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Talao_SLTextil_Ajuste.fr3';
  if FileExists(vArq) then
    fDMLoteImp.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    MessageDlg('*** Relatório ' + vArq + ', não encontrado!' , mtInformation, [mbOk], 0);
    exit;
  end;
  fDMLoteImp.frxReport1.ShowReport;
end;

procedure TfrmConsLote2.aloRetrabalho1Click(Sender: TObject);
begin
  if not(fDMLoteImp.cdsConsulta_Lote.Active) then
    exit;
  if trim(fDMLoteImp.cdsConsulta_LoteRETRABALHO.AsString) <> 'S' then
  begin
    MessageDlg('*** Talão não é de Retrabalho!' , mtInformation, [mbOk], 0);
    exit;
  end;
  prc_Imprime_Ajuste;
end;

end.
