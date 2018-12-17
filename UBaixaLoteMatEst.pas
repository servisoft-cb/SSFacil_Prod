unit UBaixaLoteMatEst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Mask,
  DBCtrls, ComCtrls, ExtCtrls, RxLookup, ToolEdit, RXDBCtrl, Grids, DBGrids, Buttons,
  UDMBaixaMaterialOP, UDMEstoque;

type
  TfrmLoteMaterialEstoque = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    dbedtQuantidade: TDBEdit;
    Label4: TLabel;
    dbedtDataMov: TDBDateEdit;
    lblFilial: TLabel;
    rxdblkpcmbFilial: TRxDBLookupCombo;
    DBGrid1: TDBGrid;
    btnInserir: TBitBtn;
    btnCancelar: TBitBtn;
    btnExcluir: TBitBtn;
    btnConfirmar: TBitBtn;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
   { Private declarations }
    procedure prc_Habilita_Campos;
    procedure prc_Habilita_Botoes;
  public
    fDMBaixaMaterial: TDMBaixaMaterial;
    { Public declarations }
  end;

var
  frmLoteMaterialEstoque: TfrmLoteMaterialEstoque;

implementation

uses
  DB;


{$R *.dfm}

procedure TfrmLoteMaterialEstoque.btnCancelarClick(Sender: TObject);
begin
  fDMBaixaMaterial.cdsLoteMatEst.CancelUpdates;
  prc_Habilita_Botoes;
  prc_Habilita_Campos;
end;

procedure TfrmLoteMaterialEstoque.FormShow(Sender: TObject);
begin
  fDMBaixaMaterial.prc_Abrir_Filial;
  fDMBaixaMaterial.cdsLoteMatEst.Close;
  fDMBaixaMaterial.sdsLoteMatEst.ParamByName('NUM_ORD').AsInteger := fDMBaixaMaterial.vNum_Ord;
  fDMBaixaMaterial.sdsLoteMatEst.ParamByName('ITEM').AsInteger := fDMBaixaMaterial.vItem;
  fDMBaixaMaterial.cdsLoteMatEst.Open;

end;

procedure TfrmLoteMaterialEstoque.btnInserirClick(Sender: TObject);
begin
  prc_habilita_campos;
  prc_Habilita_Botoes;
  fDMBaixaMaterial.prc_Inserir_LoteMatEst;
  rxdblkpcmbFilial.SetFocus;

end;

procedure TfrmLoteMaterialEstoque.prc_habilita_campos;
begin
  rxdblkpcmbFilial.Enabled := not rxdblkpcmbFilial.Enabled;
  dbedtQuantidade.Enabled := not dbedtQuantidade.Enabled;
  dbedtDataMov.Enabled := not dbedtDataMov.Enabled;
end;

procedure TfrmLoteMaterialEstoque.prc_Habilita_Botoes;
begin
  btnInserir.Enabled := not btnInserir.Enabled;
  btnExcluir.Enabled := not btnExcluir.Enabled;
  btnConfirmar.Enabled := not btnConfirmar.Enabled;
  btnCancelar.Enabled := not btnCancelar.Enabled;
end;

procedure TfrmLoteMaterialEstoque.btnConfirmarClick(Sender: TObject);
begin
  if rxdblkpcmbFilial.Value <> '' then
    fDMBaixaMaterial.cdsLoteMatEstFILIAL.AsInteger := rxdblkpcmbFilial.KeyValue;
  fDMBaixaMaterial.prc_Grava_LotMatEst;
  if fDMBaixaMaterial.vMsg <> '' then
  begin
    MessageDlg(fDMBaixaMaterial.vMsg, mtError, [mbOK], 0);
    dbedtQuantidade.SetFocus;
    Exit;
  end;
  prc_Habilita_Botoes;
  prc_Habilita_Campos;
end;

procedure TfrmLoteMaterialEstoque.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja excluir este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    exit;

  fDMBaixaMaterial.prc_Exclui_LotMatEst;
  if fDMBaixaMaterial.vMsg <> '' then
    MessageDlg(fDMBaixaMaterial.vMsg, mtError, [mbOK], 0);
end;

end.

