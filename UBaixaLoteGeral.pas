unit UBaixaLoteGeral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMLoteImp, DBVGrids, Grids, DBGrids, SMDBGrid, StdCtrls,
  NxCollection, RzTabs, RzEdit, RxLookup, NxEdit, ToolEdit, Mask,
  CurrEdit, ExtCtrls,
  DB, UDMBaixaProd;

type
  TfrmBaixaLoteGeral = class(TForm)
    Panel1: TPanel;
    NxLabel2: TNxLabel;
    NxLabel4: TNxLabel;
    NxLabel3: TNxLabel;
    NxLabel5: TNxLabel;
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
    CurrencyEdit1: TCurrencyEdit;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    CurrencyEdit2: TCurrencyEdit;
    DateEdit3: TDateEdit;
    DateEdit4: TDateEdit;
    Edit1: TEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    CurrencyEdit5: TCurrencyEdit;
    Edit2: TEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    RzPageControl1: TRzPageControl;
    TS_Talao: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    Label1: TLabel;
    DateEdit5: TDateEdit;
    Label7: TLabel;
    RzDateTimeEdit1: TRzDateTimeEdit;
    NxButton1: TNxButton;
    Label11: TLabel;
    CurrencyEdit4: TCurrencyEdit;
    lblFuncionario: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsTalaoClick(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure CurrencyEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit5Exit(Sender: TObject);
    procedure NxButton1Click(Sender: TObject);
    procedure CurrencyEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    fDMLoteImp: TDMLoteImp;
    vOpcaoImp : String;
    fDMBaixaProd : TDMBaixaProd;
    procedure prc_Abrir_Funcionario(ID : Integer) ;
    function fnc_Busca_Cliente(ID : Integer) : String;
    procedure prc_Gravar_Baixa_Parcial(Qtd : Real);

  public
    { Public declarations }
  end;

var
  frmBaixaLoteGeral: TfrmBaixaLoteGeral;

implementation

uses rsDBUtils, USel_Pessoa, uUtilPadrao;

{$R *.dfm}

procedure TfrmBaixaLoteGeral.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmBaixaLoteGeral.FormShow(Sender: TObject);
begin
  fDMLoteImp:= TDMLoteImp.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMLoteImp);
  fDMLoteImp.cdsProcesso.Open;
  fDMBaixaProd := TDMBaixaProd.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMBaixaProd);
end;

procedure TfrmBaixaLoteGeral.btnConsTalaoClick(Sender: TObject);
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
  vComando := vComando + ' AND DTBAIXA is null ';   //somente os pendentes
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

procedure TfrmBaixaLoteGeral.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  //fDMLoteImp.cdsConsTalao.IndexFieldNames := Column.FieldName;
  //Column.Title.Color := clBtnShadow;
  //for i := 0 to SMDBGrid1.Columns.Count - 1 do
  //  if not (SMDBGrid1.Columns.Items[I] = Column) then
  //    SMDBGrid1.Columns.Items[I].Title.Color := clBtnFace;
end;

procedure TfrmBaixaLoteGeral.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMLoteImp.cdsConsulta_LoteDTBAIXA.AsDateTime > 10 then
    Background := $0077FF77
  else
  if fDMLoteImp.cdsConsulta_LoteDTENTRADA.AsDateTime > 10 then
    Background := $00FFFFB9;
end;

procedure TfrmBaixaLoteGeral.CurrencyEdit5KeyDown(Sender: TObject;
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
  end;
end;

function TfrmBaixaLoteGeral.fnc_Busca_Cliente(ID: Integer): String;
begin
  Result := '';
  fDMLoteImp.qCliente.Close;
  fDMLoteImp.qCliente.ParamByName('CODIGO').AsInteger := ID;
  fDMLoteImp.qCliente.Open;
  Result := fDMLoteImp.qClienteNOME.AsString;
end;

procedure TfrmBaixaLoteGeral.CurrencyEdit5Exit(Sender: TObject);
begin
  if CurrencyEdit5.AsInteger <= 0 then
    lblNomeCliente.Caption := ''
  else
    lblNomeCliente.Caption := fnc_Busca_Cliente(CurrencyEdit5.AsInteger);
end;

procedure TfrmBaixaLoteGeral.NxButton1Click(Sender: TObject);
var
  vGerar : Boolean;
  vQtd : Real;
begin
  if CurrencyEdit4.Value <= 0 then
    begin
      MessageDlg('*** Informar o funcionário!',mtError,[mbOk],0);
      CurrencyEdit4.SetFocus;
      exit;
    end;
  prc_Abrir_Funcionario(fDMBaixaProd.qFuncionarioCODIGO.AsInteger);
  if fDMBaixaProd.qFuncionario_Processo.IsEmpty then
  begin
    MessageDlg('*** Funcionário sem cadastro de Processo!', mtError, [mbOk], 0);
    exit;
  end;
  if DateEdit1.Date > 10 then
    fDMBaixaProd.vDataBaixa := DateEdit1.Date
  else
    fDMBaixaProd.vDataBaixa := Date;
  if trim(RzDateTimeEdit1.Text) <> '' then
    fDMBaixaProd.vHoraBaixa := RzDateTimeEdit1.Time
  else
    fDMBaixaProd.vHoraBaixa := Now;
  vGerar := False;
  fDMLoteImp.cdsConsulta_Lote.First;
  while not fDMLoteImp.cdsConsulta_Lote.Eof do
  begin
    if (SMDBGrid1.SelectedRows.CurrentRowSelected) then
    begin
      vGerar := True;
      fDMBaixaProd.prc_Abrir_Baixa_Processo(fDMLoteImp.cdsConsulta_LoteID_BAIXA.AsInteger,fDMLoteImp.cdsConsulta_LoteITEM_BAIXA.AsInteger,0);
      if not fDMBaixaProd.cdsBaixa_Processo.IsEmpty then
      begin
        fDMBaixaProd.cdsBaixa_Processo.Edit;
        if fDMBaixaProd.cdsBaixa_ProcessoDTENTRADA.IsNull then
        begin
          fDMBaixaProd.cdsBaixa_ProcessoDTENTRADA.AsDateTime := fDMBaixaProd.vDataBaixa;
          fDMBaixaProd.cdsBaixa_ProcessoHRENTRADA.AsDateTime := fDMBaixaProd.vHoraBaixa;
        end;
        vQtd := StrToFloat(FormatFloat('0.0000',fDMBaixaProd.cdsBaixa_ProcessoQTD_PENDENTE.AsFloat));
        fDMBaixaProd.cdsBaixa_ProcessoDTBAIXA.AsDateTime    := fDMBaixaProd.vDataBaixa;
        fDMBaixaProd.cdsBaixa_ProcessoHRBAIXA.AsDateTime    := fDMBaixaProd.vHoraBaixa;
        fDMBaixaProd.cdsBaixa_ProcessoQTD_PRODUZIDO.AsFloat := fDMBaixaProd.cdsBaixa_ProcessoQTD.AsFloat;
        fDMBaixaProd.cdsBaixa_ProcessoQTD_PENDENTE.AsFloat  := 0;
        fDMBaixaProd.cdsBaixa_ProcessoQTD_LIBERADA.AsFloat  := 0;
        fDMBaixaProd.cdsBaixa_ProcessoTOTAL_HORAS.AsFloat := fnc_Calcular_Hora2(fDMBaixaProd.cdsBaixa_ProcessoHRENTRADA.AsDateTime,
                                                                                fDMBaixaProd.cdsBaixa_ProcessoHRBAIXA.AsDateTime,
                                                                                fDMBaixaProd.cdsBaixa_ProcessoDTENTRADA.AsDateTime,
                                                                                fDMBaixaProd.cdsBaixa_ProcessoDTBAIXA.AsDateTime);
        fDMBaixaProd.cdsBaixa_Processo.Post;

        prc_Gravar_Baixa_Parcial(vQtd);

        fDMBaixaProd.cdsBaixa_Processo.ApplyUpdates(0);
      end;
    end;
    fDMLoteImp.cdsConsulta_Lote.Next;
  end;
  if not vGerar then
    MessageDlg('Nenhum registro selecionado!', mtError,[mbOK],0)
  else
    ShowMessage('Setor(es) encerrado(s)!');
  fDMLoteImp.cdsConsulta_Lote.First;
  btnConsTalaoClick(Sender);
end;

procedure TfrmBaixaLoteGeral.CurrencyEdit4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if CurrencyEdit4.AsInteger > 0 then
    begin
      fDMBaixaProd.qFuncionario.Close;
      fDMBaixaProd.qFuncionario.ParamByName('NUM_CARTAO').AsInteger := CurrencyEdit4.AsInteger;
      fDMBaixaProd.qFuncionario.Open;
      lblFuncionario.Caption := '';
      if fDMBaixaProd.qFuncionarioCODIGO.AsInteger <= 0 then
      begin
        Label5.Caption := '*** FUNCIONÁRIO NÃO ENCONTRADO ***';
        CurrencyEdit4.SelectAll;
        CurrencyEdit4.SetFocus;
        CurrencyEdit4.Clear;
      end
      else
      begin
        Label5.Caption := '';
        lblFuncionario.Caption := fDMBaixaProd.qFuncionarioNOME.AsString;
      end;
    end;
  end;

end;

procedure TfrmBaixaLoteGeral.prc_Abrir_Funcionario(ID: Integer);
begin
  fDMBaixaProd.qFuncionario_Processo.Close;
  fDMBaixaProd.qFuncionario_Processo.ParamByName('CODIGO').AsInteger := ID;
  fDMBaixaProd.qFuncionario_Processo.Open;
end;

procedure TfrmBaixaLoteGeral.prc_Gravar_Baixa_Parcial(Qtd : Real);
var
  vItemAux : Integer;
  vDataAux : TDate;
  vHoraAux : TTime;
begin
  vDataAux := 0;
  vHoraAux := 0;

  fDMBaixaProd.cdsBaixa_Parcial.Close;
  fDMBaixaProd.sdsBaixa_Parcial.ParamByName('ID').AsInteger   := fDMBaixaProd.cdsBaixa_ProcessoID.AsInteger;
  fDMBaixaProd.sdsBaixa_Parcial.ParamByName('ITEM').AsInteger := fDMBaixaProd.cdsBaixa_ProcessoITEM.AsInteger;
  fDMBaixaProd.cdsBaixa_Parcial.Open;
  fDMBaixaProd.cdsBaixa_Parcial.Last;
  vItemAux := fDMBaixaProd.cdsBaixa_ParcialITEM_PARCIAL.AsInteger;
  if (fDMBaixaProd.cdsBaixa_ParcialDTENTRADA.AsDateTime > 10) and (fDMBaixaProd.cdsBaixa_ParcialDTSAIDA.AsDateTime < 10) then
  begin
    fDMBaixaProd.cdsBaixa_Parcial.Edit;
    fDMBaixaProd.cdsBaixa_ParcialDTSAIDA.AsDateTime := fDMBaixaProd.cdsBaixa_ProcessoDTBAIXA.AsDateTime;
    fDMBaixaProd.cdsBaixa_ParcialHRSAIDA.AsDateTime := fDMBaixaProd.cdsBaixa_ProcessoHRBAIXA.AsDateTime;
    fDMBaixaProd.cdsBaixa_Parcial.Post;
  end
  else
  begin
    fDMBaixaProd.cdsBaixa_Parcial.Insert;
    fDMBaixaProd.cdsBaixa_ParcialID.AsInteger           := fDMBaixaProd.cdsBaixa_ProcessoID.AsInteger;
    fDMBaixaProd.cdsBaixa_ParcialITEM.AsInteger         := fDMBaixaProd.cdsBaixa_ProcessoITEM.AsInteger;
    fDMBaixaProd.cdsBaixa_ParcialITEM_PARCIAL.AsInteger := vItemAux + 1;
    fDMBaixaProd.cdsBaixa_ParcialID_PROCESSO.AsInteger  := fDMBaixaProd.cdsBaixa_ProcessoID_PROCESSO.AsInteger;
    fDMBaixaProd.cdsBaixa_ParcialDTENTRADA.AsDateTime   := fDMBaixaProd.cdsBaixa_ProcessoDTENTRADA.AsDateTime;
    fDMBaixaProd.cdsBaixa_ParcialHRENTRADA.AsDateTime   := fDMBaixaProd.cdsBaixa_ProcessoHRENTRADA.AsDateTime;
    fDMBaixaProd.cdsBaixa_ParcialDTSAIDA.AsDateTime     := fDMBaixaProd.cdsBaixa_ProcessoDTBAIXA.AsDateTime;
    fDMBaixaProd.cdsBaixa_ParcialHRSAIDA.AsDateTime     := fDMBaixaProd.cdsBaixa_ProcessoHRBAIXA.AsDateTime;
    fDMBaixaProd.cdsBaixa_ParcialQTD.AsFloat            := Qtd;
    fDMBaixaProd.cdsBaixa_Parcial.Post;
  end;
  fDMBaixaProd.cdsBaixa_Parcial.ApplyUpdates(0);
end;

end.
