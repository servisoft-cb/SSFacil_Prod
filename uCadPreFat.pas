unit UCadPreFat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Buttons, Grids, SMDBGrid, UDmCadPreFat, DB, 
  DBGrids, ExtCtrls, StdCtrls, FMTBcd, SqlExpr, RzTabs, Mask, DBCtrls, ToolEdit, DateUtils, UCBase,
  UEscolhe_Filial, NxCollection,  RXDBCtrl, RxLookup, RxDBComb, DBXpress, Menus,
  CurrEdit;

type
  TfrmCadPreFat = class(TForm)
    RzPageControl1: TRzPageControl;
    TS_Consulta: TRzTabSheet;
    TS_Cadastro: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    pnlPesquisa: TPanel;
    Panel1: TPanel;
    pnlCadastro: TPanel;
    StaticText1: TStaticText;
    Label5: TLabel;
    DateEdit1: TDateEdit;
    Label6: TLabel;
    DateEdit2: TDateEdit;
    Label12: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    pnlNota: TPanel;
    Label16: TLabel;
    pnlCliente: TPanel;
    Panel11: TPanel;
    lblNome_Filial: TLabel;
    DBText1: TDBText;
    Label18: TLabel;
    DBDateEdit1: TDBDateEdit;
    RzPageControl2: TRzPageControl;
    RzTabSheet1: TRzTabSheet;
    SMDBGrid2: TSMDBGrid;
    pnlItem: TPanel;
    btnInserir: TNxButton;
    btnExcluir: TNxButton;
    btnPesquisar: TNxButton;
    btnImprimir: TNxButton;
    btnConsultar: TNxButton;
    btnAlterar: TNxButton;
    btnConfirmar: TNxButton;
    btnCancelar: TNxButton;
    btnExcluir_Itens: TNxButton;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    btnCopiarPedido2: TNxButton;
    UCControls1: TUCControls;
    Panel4: TPanel;
    Shape6: TShape;
    Label31: TLabel;
    ComboBox1: TComboBox;
    Label9: TLabel;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label4: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    btnVolumes: TNxButton;
    PopupMenu1: TPopupMenu;
    PrFaturamento1: TMenuItem;
    RomaneioPorVOlume1: TMenuItem;
    DBCheckBox1: TDBCheckBox;
    Shape1: TShape;
    Label7: TLabel;
    Label8: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label10: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    ckEm_Espera: TCheckBox;
    Shape2: TShape;
    Label11: TLabel;
    DBCheckBox2: TDBCheckBox;
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
    procedure RxDBLookupCombo2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCopiarPedido2Click(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnVolumesClick(Sender: TObject);
    procedure RomaneioPorVOlume1Click(Sender: TObject);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    fDmCadPreFat: TDmCadPreFat;
    ffrmEscolhe_Filial: TfrmEscolhe_Filial;

    procedure prc_Inserir_Registro;
    procedure prc_Excluir_Registro;
    procedure prc_Gravar_Registro;
    procedure prc_Consultar(ID: Integer);

    procedure prc_Posiciona_Reg(ID : Integer);
    procedure prc_Habilitar_CamposNota;

  public
    { Public declarations }
  end;

var
  frmCadPreFat: TfrmCadPreFat;

implementation

uses DmdDatabase, rsDBUtils, uUtilPadrao, USel_Pessoa, ULiberacao_Ped,
  ULeVolume;

{$R *.dfm}

procedure TfrmCadPreFat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmCadPreFat.btnExcluirClick(Sender: TObject);
begin
  if not(fDmCadPreFat.cdsConsulta.Active) and (fDmCadPreFat.cdsConsultaID.AsInteger <= 0) then
    exit;

  prc_Posiciona_Reg(fDmCadPreFat.cdsConsultaID.AsInteger);
  if fDmCadPreFat.cdsPreFat.IsEmpty then
    exit;

  if fDmCadPreFat.cdsPreFatFATURADO.AsString = 'S' then
  begin
    MessageDlg('*** Registro já foi emitido nota!', mtError, [mbOk], 0);
    exit;
  end;

  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  prc_Excluir_Registro;

  btnConsultarClick(Sender);
end;

procedure TfrmCadPreFat.btnInserirClick(Sender: TObject);
begin
  prc_Inserir_Registro;
end;

procedure TfrmCadPreFat.prc_Excluir_Registro;
begin
  fDmCadPreFat.prc_Excluir;
end;

procedure TfrmCadPreFat.prc_Gravar_Registro;
var
  vIDAux: Integer;
  vID_Estoque: Integer;
  ID: TTransactionDesc;
  vQtdAux, vVlrAux: Real;
  vUnidade: String;
begin
  fDmCadPreFat.prc_Gravar;
  vIDAux := fDmCadPreFat.cdsPreFatID.AsInteger;
  if fDmCadPreFat.cdsPreFat.State in [dsEdit,dsInsert] then
  begin
    MessageDlg(fDmCadPreFat.vMSGErro, mtError, [mbOk], 0);
    exit;
  end;

  ID.TransactionID  := 1;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    fDmCadPreFat.cdsPreFat.ApplyUpdates(0);

    dmDatabase.scoDados.Commit(ID);

  except
    on e: Exception do
    begin
      dmDatabase.scoDados.Rollback(ID);
      raise Exception.Create('Erro ao gravar o estoque: ' + #13 + e.Message);
    end;
  end;

  prc_Habilitar_CamposNota;

  prc_Consultar(vIDAux);
  prc_Posiciona_Reg(vIDAux);
  TS_Consulta.TabEnabled    := True;
  RzPageControl1.ActivePage := TS_Consulta;
end;

procedure TfrmCadPreFat.prc_Inserir_Registro;
var
  vNumPreFatAux: Integer;
  vID_LocalAux: Integer;
begin
  if fDmCadPreFat.cdsFilial.RecordCount > 1 then
  begin
    ffrmEscolhe_Filial := TfrmEscolhe_Filial.Create(self);
    ffrmEscolhe_Filial.ShowModal;
    FreeAndNil(ffrmEscolhe_Filial);
  end
  else
  begin
    fDmCadPreFat.cdsFilial.Last;
    vFilial      := fDmCadPreFat.cdsFilialID.AsInteger;
    vFilial_Nome := fDmCadPreFat.cdsFilialNOME.AsString;
  end;
  if vFilial <= 0 then
  begin
    ShowMessage('Filial não informada!');
    exit;
  end;

  fDmCadPreFat.cdsFilial.Locate('ID',vFilial,[loCaseInsensitive]);
  fDmCadPreFat.prc_Inserir;
  lblNome_Filial.Caption := vFilial_Nome;
  if fDmCadPreFat.cdsPreFat.State in [dsBrowse] then
    exit;
  fDmCadPreFat.cdsPreFatFILIAL.AsInteger  := vFilial;
  prc_Habilitar_CamposNota;
  RzPageControl1.ActivePage := TS_Cadastro;
  DBDateEdit1.SetFocus;
end;

procedure TfrmCadPreFat.FormShow(Sender: TObject);
begin
  fDmCadPreFat := TDMCadPreFat.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDmCadPreFat);
end;

procedure TfrmCadPreFat.prc_Consultar(ID: Integer);
begin
  fDmCadPreFat.cdsConsulta.Close;
  fDmCadPreFat.sdsConsulta.CommandText := fDmCadPreFat.ctConsulta;
  if ID > 0 then
    fDmCadPreFat.sdsConsulta.CommandText := fDmCadPreFat.sdsConsulta.CommandText +
                                          ' WHERE PRE.ID = ' + IntToStr(ID)
  else
  begin
    fDmCadPreFat.sdsConsulta.CommandText := fDmCadPreFat.sdsConsulta.CommandText + ' WHERE 0 = 0 ';
    if CurrencyEdit2.AsInteger > 0 then
      fDmCadPreFat.sdsConsulta.CommandText := fDmCadPreFat.sdsConsulta.CommandText +
                                            ' AND N.NUMNOTA = ' + IntToStr(CurrencyEdit2.AsInteger);
    if not(RxDBLookupCombo1.Text = '') then
      fDmCadPreFat.sdsConsulta.CommandText := fDmCadPreFat.sdsConsulta.CommandText +
                                            ' AND PRE.FILIAL = ' + IntToStr(RxDBLookupCombo1.KeyValue);
    if DateEdit1.Date > 10 then
      fDmCadPreFat.sdsConsulta.CommandText := fDmCadPreFat.sdsConsulta.CommandText +
                                            ' AND PRE.DATA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
    if DateEdit2.Date > 10 then
      fDmCadPreFat.sdsConsulta.CommandText := fDmCadPreFat.sdsConsulta.CommandText +
                                            ' AND PRE.DATA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
    case ComboBox1.ItemIndex of
      0 : fDmCadPreFat.sdsConsulta.CommandText := fDmCadPreFat.sdsConsulta.CommandText + ' AND PRE.FATURADO = ' + QuotedStr('N');
      1 : fDmCadPreFat.sdsConsulta.CommandText := fDmCadPreFat.sdsConsulta.CommandText + ' AND PRE.FATURADO = ' + QuotedStr('S');
    end;

    if ckEm_Espera.Checked then
      fDmCadPreFat.sdsConsulta.CommandText := fDmCadPreFat.sdsConsulta.CommandText + ' AND PRE.EM_ESPERA = ' + QuotedStr('S');

  end;
  fDmCadPreFat.cdsConsulta.Open;
end;

procedure TfrmCadPreFat.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar(CurrencyEdit1.AsInteger);
end;

procedure TfrmCadPreFat.btnCancelarClick(Sender: TObject);
begin
  if (fDmCadPreFat.cdsPreFat.State in [dsBrowse]) or not(fDmCadPreFat.cdsPreFat.Active) then
  begin
    RzPageControl1.ActivePage := TS_Consulta;
    exit;
  end;

  if MessageDlg('Deseja cancelar alteração/inclusão do registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fDmCadPreFat.cdsPreFat.CancelUpdates;

  prc_Habilitar_CamposNota;

  TS_Consulta.TabEnabled    := True;
  RzPageControl1.ActivePage := TS_Consulta;
end;

procedure TfrmCadPreFat.SMDBGrid1DblClick(Sender: TObject);
begin
  RzPageControl1.ActivePage := TS_Cadastro;
end;

procedure TfrmCadPreFat.btnAlterarClick(Sender: TObject);
begin
  if (fDmCadPreFat.cdsPreFat.IsEmpty) or not(fDmCadPreFat.cdsPreFat.Active) or (fDmCadPreFat.cdsPreFatID.AsInteger < 1) then
    exit;
  prc_Posiciona_Reg(fDmCadPreFat.cdsPreFatID.AsInteger);
  if (fDmCadPreFat.cdsPreFat.IsEmpty) or not(fDmCadPreFat.cdsPreFat.Active) or (fDmCadPreFat.cdsPreFatID.AsInteger < 1) then
    exit;
  if fDmCadPreFat.cdsPreFatID_NOTA.AsInteger > 0 then
  begin
    MessageDlg('*** Registro já foi emitido nota!', mtError, [mbOk], 0);
    exit;
  end;
  fDmCadPreFat.cdsPreFat.Edit;
  prc_Habilitar_CamposNota;
end;

procedure TfrmCadPreFat.btnConfirmarClick(Sender: TObject);
begin
  prc_Gravar_Registro;
end;

procedure TfrmCadPreFat.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fDmCadPreFat);
end;

procedure TfrmCadPreFat.prc_Posiciona_Reg(ID : Integer);
begin
  fDmCadPreFat.prc_Localizar(ID);
  fDmCadPreFat.cdsPreFat_Itens.Close;
  fDmCadPreFat.cdsPreFat_Itens.Open;
  vFilial      := fDmCadPreFat.cdsPreFatFILIAL.AsInteger;
  vFilial_Nome := '';
  if fDmCadPreFat.cdsFilial.Locate('ID',vFilial,[loCaseInsensitive]) then
    vFilial_Nome := fDmCadPreFat.cdsFilialNOME_INTERNO.AsString;
  lblNome_Filial.Caption := vFilial_Nome;
end;

procedure TfrmCadPreFat.btnExcluir_ItensClick(Sender: TObject);
begin
  if not(fDmCadPreFat.cdsPreFat_Itens.Active) and (fDmCadPreFat.cdsPreFat_Itens.IsEmpty) or (fDmCadPreFat.cdsPreFat_ItensITEM.AsInteger < 1) then
    exit;

  //if fDmCadPreFat.cdsPreFat_ItensEXISTE_VOL_ETIQ.AsString = 'S' then
  //begin
    fDmCadPreFat.qVerExcluir.Close;
    fDmCadPreFat.qVerExcluir.ParamByName('ID_PEDIDO').AsInteger   := fDmCadPreFat.cdsPreFat_ItensID_PEDIDO.AsInteger;
    fDmCadPreFat.qVerExcluir.ParamByName('ITEM_PEDIDO').AsInteger := fDmCadPreFat.cdsPreFat_ItensITEM_PEDIDO.AsInteger;
    fDmCadPreFat.qVerExcluir.Open;
    if fDmCadPreFat.qVerExcluirCONTADOR.AsInteger > 0 then
    begin
      MessageDlg('*** Este item possui Volume, para excluir , use a opção Excluir Volume!', mtInformation, [mbOk], 0);
      exit;
    end;
  //end;

  if MessageDlg('Deseja excluir o item selecionado?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fDmCadPreFat.prc_Excluir_Item;
end;

procedure TfrmCadPreFat.RzPageControl1Change(Sender: TObject);
begin
  if not(fDmCadPreFat.cdsPreFat.State in [dsEdit, dsInsert]) then
  begin
    if RzPageControl1.ActivePage = TS_Cadastro then
    begin
      if not(fDmCadPreFat.cdsConsulta.Active) or (fDmCadPreFat.cdsConsulta.IsEmpty) or
        (fDmCadPreFat.cdsConsultaID.AsInteger <= 0) then
        Exit;
      prc_Posiciona_Reg(fDmCadPreFat.cdsConsultaID.AsInteger);
    end;
  end;
end;

procedure TfrmCadPreFat.prc_Habilitar_CamposNota;
begin
  TS_Consulta.TabEnabled := not(TS_Consulta.TabEnabled);

  btnCopiarPedido2.Enabled := not(btnCopiarPedido2.Enabled);
  btnExcluir_Itens.Enabled := not(btnExcluir_Itens.Enabled); 
  btnConfirmar.Enabled := not(btnConfirmar.Enabled);
  btnAlterar.Enabled   := not(btnAlterar.Enabled);
  pnlCadastro.Enabled  := not(pnlCadastro.Enabled);
end;

procedure TfrmCadPreFat.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := fnc_Encerrar_Tela(fDmCadPreFat.cdsPreFat);
end;

procedure TfrmCadPreFat.btnPesquisarClick(Sender: TObject);
begin
  pnlPesquisa.Visible := not(pnlPesquisa.Visible);
  if pnlPesquisa.Visible then
     DateEdit1.SetFocus;
end;

procedure TfrmCadPreFat.RxDBLookupCombo2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    if trim(RxDBLookupCombo2.Text) <> '' then
      vCodPessoa_Pos := RxDBLookupCombo2.KeyValue;
    frmSel_Pessoa := TfrmSel_Pessoa.Create(Self);
    frmSel_Pessoa.vTipo_Pessoa := 'C';
    frmSel_Pessoa.ShowModal;
    if vCodPessoa_Pos > 0 then
      RxDBLookupCombo2.KeyValue := vCodPessoa_Pos;
    DBDateEdit1.SetFocus;
  end;
end;

procedure TfrmCadPreFat.btnCopiarPedido2Click(Sender: TObject);
var
  ffrmLiberacao_Ped: TfrmLiberacao_Ped;
begin
  ffrmLiberacao_Ped := TfrmLiberacao_Ped.Create(Self);
  ffrmLiberacao_Ped.fDMCadPreFat := fDmCadPreFat;
  ffrmLiberacao_Ped.Label3.Caption := 'Pedido(s) da Filial: ' + #13 + lblNome_Filial.Caption;
  if fDmCadPreFat.cdsPreFatID_CLIENTE.AsInteger > 0 then
    ffrmLiberacao_Ped.vID_Cliente_Loc := fDmCadPreFat.cdsPreFatID_CLIENTE.AsInteger
  else
    ffrmLiberacao_Ped.vID_Cliente_Loc := 0;
  ffrmLiberacao_Ped.ShowModal;
  FreeAndNil(ffrmLiberacao_Ped);
end;

procedure TfrmCadPreFat.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDmCadPreFat.cdsConsultaFATURADO.AsString = 'S' then
  begin
    Background  := clGreen;
    AFont.Color := clWhite;
  end
  else
  if fDmCadPreFat.cdsConsultaEM_ESPERA.AsString = 'S' then
  begin
    Background  := $004080FF;
    AFont.Color := clWhite;
  end
  else
  if trim(fDmCadPreFat.cdsConsultaLIBERADO_FAT.AsString) <> 'S' then
  begin
    Background  := clYellow;
    AFont.Color := clBlack;
  end;
end;

procedure TfrmCadPreFat.btnVolumesClick(Sender: TObject);
var
  vEdit : Boolean;
begin
  vEdit := True;
  if not(fDmCadPreFat.cdsPreFat.State in [dsEdit,dsInsert]) then
  begin
    vEdit := False;
    prc_Posiciona_Reg(fDmCadPreFat.cdsPreFatID.AsInteger);
    if (fDmCadPreFat.cdsPreFat.IsEmpty) or not(fDmCadPreFat.cdsPreFat.Active) or (fDmCadPreFat.cdsPreFatID.AsInteger < 1) then
      exit;
    if fDmCadPreFat.cdsPreFatID_NOTA.AsInteger > 0 then
    begin
      MessageDlg('*** Registro já foi emitido nota!', mtError, [mbOk], 0);
      exit;
    end;
  end;
  frmLeVolume := TfrmLeVolume.Create(self);
  frmLeVolume.fDMCadPreFat := fDmCadPreFat;
  frmLeVolume.ShowModal;
  FreeAndNil(frmLeVolume);
  if vEdit then
    fDmCadPreFat.cdsPreFat.Edit;
end;

procedure TfrmCadPreFat.RomaneioPorVOlume1Click(Sender: TObject);
var
  vArq : String;
begin
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Romaneio_Vol.fr3';
  if not (FileExists(vArq)) then
  begin
    MessageDlg('*** Relatório não localizado: ' + vArq , mtInformation, [mbOk], 0);
    exit;
  end;
  fDmCadPreFat.cdsVolume.Close;
  fDmCadPreFat.sdsVolume.ParamByName('ID').AsInteger := fDmCadPreFat.cdsConsultaID.AsInteger;
  fDmCadPreFat.cdsVolume.Open;
  if (fDmCadPreFat.cdsVolume.IsEmpty) then
  begin
    MessageDlg('*** Não existe volumes nesta Pré Nota!', mtInformation, [mbOk], 0);
    Exit;
  end;
  fDmCadPreFat.frxReport1.Report.LoadFromFile(vArq);
  fDmCadPreFat.frxReport1.variables['NomeEmpresa']  := QuotedStr(fDmCadPreFat.cdsConsultaNOME_INTERNO_FIL.AsString);
  fDmCadPreFat.frxReport1.variables['IDPreFat'] := QuotedStr(fDmCadPreFat.cdsConsultaID.AsString);
  fDmCadPreFat.frxReport1.ShowReport;
end;

procedure TfrmCadPreFat.CurrencyEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) and (CurrencyEdit1.AsInteger > 0) then
    btnConsultarClick(Sender);
end;

procedure TfrmCadPreFat.CurrencyEdit2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) and (CurrencyEdit2.AsInteger > 0) then
    btnConsultarClick(Sender);
end;

end.
