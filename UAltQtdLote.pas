unit UAltQtdLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, SMDBGrid, Mask, DBCtrls, UDMCadLote,
  NxCollection, ExtCtrls, DB;

type
  TfrmAltQtdLote = class(TForm)
    SMDBGrid1: TSMDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    btnConfirmar: TNxButton;
    btnExcluir: TNxButton;
    btnCancelar: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    vQtdLote : Real;
  public
    { Public declarations }
    fDMCadLote: TDMCadLote;
    
  end;

var
  frmAltQtdLote: TfrmAltQtdLote;

implementation

uses rsDBUtils;

{$R *.dfm}

procedure TfrmAltQtdLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if fDMCadLote.cdsLote.State in [dsEdit,dsInsert] then
    fDMCadLote.cdsLote.Cancel;
  Action := Cafree;
end;

procedure TfrmAltQtdLote.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMCadLote);
  vQtdLote := StrToFloat(FormatFloat('0.0000',fDMCadLote.cdsLoteQTD.AsFloat));
end;

procedure TfrmAltQtdLote.btnConfirmarClick(Sender: TObject);
begin
  if not (fDMCadLote.cdsLote.State in [dsEdit]) then
    exit;

  if StrToFloat(FormatFloat('0.0000',fDMCadLote.cdsLoteQTD.AsFloat)) <= 0 then
  begin
    MessageDlg('*** Quantidade não pode ser zero!', mtError, [mbOk], 0);
    exit;
  end;

  if StrToFloat(FormatFloat('0.0000',fDMCadLote.cdsLoteQTD.AsFloat)) = StrToFloat(FormatFloat('0.0000',vQtdLote)) then
    Close
  else
  begin
    fDMCadLote.cdsConsulta_Lote_SL.Edit;
    fDMCadLote.cdsConsulta_Lote_SLQTD.AsFloat := StrToFloat(FormatFloat('0.0000',fDMCadLote.cdsLoteQTD.AsFloat));
    fDMCadLote.cdsConsulta_Lote_SL.Post;

    fDMCadLote.cdsLote.Post;
    fDMCadLote.cdsLote.ApplyUpdates(0);
  end;
end;

procedure TfrmAltQtdLote.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Confirma exclusão do Lote/Talão?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fDMCadLote.prc_Abrir_Baixa_Processo(fDMCadLote.cdsLoteNUM_ORDEM.AsInteger,fDMCadLote.cdsLoteID.AsInteger,0,0);

  fDMCadLote.cdsLote.Delete;

  fDMCadLote.cdsBaixa_Processo.First;
  while not fDMCadLote.cdsBaixa_Processo.Eof do
    fDMCadLote.cdsBaixa_Processo.Delete;
  
  fDMCadLote.cdsBaixa_Processo.Close;
  fDMCadLote.sdsBaixa_Processo.CommandText := fDMCadLote.ctBaixa_Processo;
  Close;
end;

end.
