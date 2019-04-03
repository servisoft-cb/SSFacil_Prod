unit UCadIntervalo_tempo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Buttons, Grids, SMDBGrid, UDMCadIntervalo_Tempo, Mask,
  UCBase, StdCtrls, RxDBComb, DBCtrls, ExtCtrls, DBGrids, RzTabs, DB, NxCollection, SqlExpr,
  RzEdit, RzDBEdit;

type
  TfrmCadIntervalo_tempo = class(TForm)
    RzPageControl1: TRzPageControl;
    TS_Consulta: TRzTabSheet;
    TS_Cadastro: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    Panel2: TPanel;
    Panel1: TPanel;
    pnlCadastro: TPanel;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    StaticText1: TStaticText;
    pnlPesquisa: TPanel;
    Label6: TLabel;
    Edit4: TEdit;
    btnInserir: TNxButton;
    btnExcluir: TNxButton;
    btnPesquisar: TNxButton;
    btnConsultar: TNxButton;
    btnAlterar: TNxButton;
    btnConfirmar: TNxButton;
    btnCancelar: TNxButton;
    UCControls1: TUCControls;
    RzDBDateTimeEdit1: TRzDBDateTimeEdit;
    Label2: TLabel;
    Label3: TLabel;
    RzDBDateTimeEdit2: TRzDBDateTimeEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    fDMCadIntervalo_Tempo: TDMCadIntervalo_Tempo;
    procedure prc_Inserir_Registro;
    procedure prc_Excluir_Registro;
    procedure prc_Gravar_Registro;
    procedure prc_Consultar;
    procedure prc_Limpar_Edit_Consulta;

  public
    { Public declarations }
  end;

var
  frmCadIntervalo_tempo: TfrmCadIntervalo_tempo;

implementation

uses DmdDatabase, rsDBUtils, UMenu, uUtilPadrao;

{$R *.dfm}

procedure TfrmCadIntervalo_tempo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmCadIntervalo_tempo.btnExcluirClick(Sender: TObject);
begin
  if fDMCadIntervalo_Tempo.cdsIntervalo_Tempo.IsEmpty then
    exit;

  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  prc_Excluir_Registro;
end;

procedure TfrmCadIntervalo_tempo.prc_Excluir_Registro;
begin
  fDMCadIntervalo_Tempo.prc_Excluir;
end;

procedure TfrmCadIntervalo_tempo.prc_Gravar_Registro;
begin
  fDMCadIntervalo_Tempo.prc_Gravar;
  if fDMCadIntervalo_Tempo.cdsIntervalo_Tempo.State in [dsEdit,dsInsert] then
  begin
    MessageDlg(fDMCadIntervalo_Tempo.vMsgErro, mtError, [mbOk], 0);
    exit;
  end;
  TS_Consulta.TabEnabled    := not(TS_Consulta.TabEnabled);
  RzPageControl1.ActivePage := TS_Consulta;
  pnlCadastro.Enabled       := not(pnlCadastro.Enabled);
  btnConfirmar.Enabled      := not(btnConfirmar.Enabled);
  btnAlterar.Enabled        := not(btnAlterar.Enabled);
end;

procedure TfrmCadIntervalo_tempo.prc_Inserir_Registro;
begin
  fDMCadIntervalo_Tempo.prc_Inserir;

  if fDMCadIntervalo_Tempo.cdsIntervalo_Tempo.State in [dsBrowse] then
    exit;
  DBEdit2.ReadOnly := False;

  RzPageControl1.ActivePage := TS_Cadastro;

  TS_Consulta.TabEnabled := False;
  btnAlterar.Enabled     := False;
  btnConfirmar.Enabled   := True;
  pnlCadastro.Enabled    := True;
  DBEdit2.SetFocus;
end;

procedure TfrmCadIntervalo_tempo.FormShow(Sender: TObject);
begin
  fDMCadIntervalo_Tempo := TDMCadIntervalo_Tempo.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMCadIntervalo_Tempo);
end;

procedure TfrmCadIntervalo_tempo.prc_Consultar;
begin
  fDMCadIntervalo_Tempo.cdsIntervalo_Tempo.Close;
  fDMCadIntervalo_Tempo.sdsIntervalo_Tempo.CommandText := fDMCadIntervalo_Tempo.ctCommand + ' WHERE 0 = 0 ';
  if Trim(Edit4.Text) <> '' then
    fDMCadIntervalo_Tempo.sdsIntervalo_Tempo.CommandText := fDMCadIntervalo_Tempo.sdsIntervalo_Tempo.CommandText + ' AND NOME LIKE ' + QuotedStr('%'+Edit4.Text+'%');
  fDMCadIntervalo_Tempo.cdsIntervalo_Tempo.Open;
end;

procedure TfrmCadIntervalo_tempo.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar;
end;

procedure TfrmCadIntervalo_tempo.btnCancelarClick(Sender: TObject);
begin
  if (fDMCadIntervalo_Tempo.cdsIntervalo_Tempo.State in [dsBrowse]) or not(fDMCadIntervalo_Tempo.cdsIntervalo_Tempo.Active) then
  begin
    RzPageControl1.ActivePage := TS_Consulta;
    exit;
  end;

  if MessageDlg('Deseja cancelar alteração/inclusão do registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fDMCadIntervalo_Tempo.cdsIntervalo_Tempo.CancelUpdates;
  TS_Consulta.TabEnabled    := True;
  RzPageControl1.ActivePage := TS_Consulta;
  pnlCadastro.Enabled       := not(pnlCadastro.Enabled);
  btnConfirmar.Enabled      := not(btnConfirmar.Enabled);
  btnAlterar.Enabled        := not(btnAlterar.Enabled);
end;

procedure TfrmCadIntervalo_tempo.SMDBGrid1DblClick(Sender: TObject);
begin
  RzPageControl1.ActivePage := TS_Cadastro;
end;

procedure TfrmCadIntervalo_tempo.btnAlterarClick(Sender: TObject);
begin
  if (fDMCadIntervalo_Tempo.cdsIntervalo_Tempo.IsEmpty) or not(fDMCadIntervalo_Tempo.cdsIntervalo_Tempo.Active) or (fDMCadIntervalo_Tempo.cdsIntervalo_TempoID.AsInteger < 1) then
    exit;

  DBEdit2.ReadOnly := True;
  fDMCadIntervalo_Tempo.cdsIntervalo_Tempo.Edit;

  TS_Consulta.TabEnabled := False;
  btnAlterar.Enabled     := False;
  btnConfirmar.Enabled   := True;
  pnlCadastro.Enabled    := True;
end;

procedure TfrmCadIntervalo_tempo.btnConfirmarClick(Sender: TObject);
begin
  prc_Gravar_Registro;
end;

procedure TfrmCadIntervalo_tempo.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fDMCadIntervalo_Tempo);
end;

procedure TfrmCadIntervalo_tempo.btnInserirClick(Sender: TObject);
begin
  prc_Inserir_Registro;
end;

procedure TfrmCadIntervalo_tempo.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    btnConsultarClick(Sender);
end;

procedure TfrmCadIntervalo_tempo.btnPesquisarClick(Sender: TObject);
begin
  pnlPesquisa.Visible := not(pnlPesquisa.Visible);
  if pnlPesquisa.Visible then
    Edit4.SetFocus
  else
    prc_Limpar_Edit_Consulta;
end;

procedure TfrmCadIntervalo_tempo.prc_Limpar_Edit_Consulta;
begin
  Edit4.Clear;
end;

procedure TfrmCadIntervalo_tempo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := fnc_Encerrar_Tela(fDMCadIntervalo_Tempo.cdsIntervalo_Tempo);
end;

end.
