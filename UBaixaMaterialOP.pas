unit UBaixaMaterialOP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, UDMBaixaMaterialOP,
  StdCtrls, ExtCtrls, Grids, DBGrids, ComCtrls, Buttons, RxLookup;

type
  TfrmBaixa_Material_OP = class(TForm)
    Panel1: TPanel;
    lblOrdemProducao: TLabel;
    edtOrdemProducao: TEdit;
    btnPesquisa: TBitBtn;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPesquisaClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edtOrdemProducaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    fDMBaixaMaterial: TDMBaixaMaterial;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaixa_Material_OP: TfrmBaixa_Material_OP;

implementation

uses
  uUtilPadrao, rsDBUtils, UDMBaixaProd, UBaixaLoteMatEst;

{$R *.dfm}

procedure TfrmBaixa_Material_OP.FormShow(Sender: TObject);
begin
  fDMBaixaMaterial := TDMBaixaMaterial.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMBaixaMaterial);
  fDMBaixaMaterial.prc_Abrir_Filial;
  uUtilPadrao.fnc_Busca_Nome_Filial;
  StatusBar1.Panels[0].Text := vUsuario;
  StatusBar1.Panels[1].Text := vFilial_Nome;
end;

procedure TfrmBaixa_Material_OP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmBaixa_Material_OP.btnPesquisaClick(Sender: TObject);
begin
  if edtOrdemProducao.Text = '' then
  begin
    MessageDlg('Informe o nº da Ordem de Produção!',mtError,[mbOK],0);
    edtOrdemProducao.SetFocus;
    fDMBaixaMaterial.cdsLoteMat.Close;
    Exit;
  end;
 fDMBaixaMaterial.prc_Abrir_Lote(StrToInt(edtOrdemProducao.Text));
end;

procedure TfrmBaixa_Material_OP.DBGrid1DblClick(Sender: TObject);
begin
  fDMBaixaMaterial.vNum_Ord := fDMBaixaMaterial.cdsLoteMatNUM_ORDEM.AsInteger;
  fDMBaixaMaterial.vItem := fDMBaixaMaterial.cdsLoteMatITEM.AsInteger;
  frmLoteMaterialEstoque := TfrmLoteMaterialEstoque.Create(Self);
  frmLoteMaterialEstoque.fDMBaixaMaterial := fDMBaixaMaterial;
  frmLoteMaterialEstoque.ShowModal;
  FreeAndNil(frmLoteMaterialEstoque);
  btnPesquisaClick(Sender);

end;

procedure TfrmBaixa_Material_OP.edtOrdemProducaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    btnPesquisaClick(Sender);
end;

end.

