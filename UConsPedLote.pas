unit UConsPedLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, SMDBGrid, RzTabs, StdCtrls, Mask,
  ToolEdit, CurrEdit, NxCollection, UDMConsPedLote;

type
  TfrmConsPedLote = class(TForm)
    RzPageControl1: TRzPageControl;
    TS_Lote: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    Panel1: TPanel;
    TS_Ordem: TRzTabSheet;
    TS_Talao: TRzTabSheet;
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label2: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    Label3: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    Label4: TLabel;
    CurrencyEdit4: TCurrencyEdit;
    btnConsultar: TNxButton;
    Panel2: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    CurrencyEdit5: TCurrencyEdit;
    CurrencyEdit6: TCurrencyEdit;
    btnCons_Ordem: TNxButton;
    SMDBGrid2: TSMDBGrid;
    Panel3: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    CurrencyEdit7: TCurrencyEdit;
    CurrencyEdit8: TCurrencyEdit;
    CurrencyEdit9: TCurrencyEdit;
    CurrencyEdit10: TCurrencyEdit;
    btnCons_Talao: TNxButton;
    SMDBGrid3: TSMDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnCons_OrdemClick(Sender: TObject);
    procedure btnCons_TalaoClick(Sender: TObject);
  private
    { Private declarations }
    fDMConsPedLote: TDMConsPedLote;

    procedure prc_Consultar_Lote;
    procedure prc_Consultar_Ordem;
    procedure prc_Consultar_Talao;

  public
    { Public declarations }
    vNum_Ordem_Loc : Integer;

  end;

var
  frmConsPedLote: TfrmConsPedLote;

implementation

uses rsDBUtils;

{$R *.dfm}

procedure TfrmConsPedLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsPedLote.FormShow(Sender: TObject);
begin
  fDMConsPedLote := TDMConsPedLote.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsPedLote);
  CurrencyEdit1.AsInteger := vNum_Ordem_Loc;
  CurrencyEdit2.AsInteger := vNum_Ordem_Loc;
  CurrencyEdit5.AsInteger := vNum_Ordem_Loc;
  CurrencyEdit6.AsInteger := vNum_Ordem_Loc;
  CurrencyEdit7.AsInteger := vNum_Ordem_Loc;
  CurrencyEdit8.AsInteger := vNum_Ordem_Loc;
end;

procedure TfrmConsPedLote.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar_Lote;
end;

procedure TfrmConsPedLote.prc_Consultar_Lote;
begin
  fDMConsPedLote.cdsLote.Close;
  fDMConsPedLote.sdsLote.CommandText := fDMConsPedLote.ctLote + ' WHERE 0 = 0 ';
  if CurrencyEdit1.AsInteger > 0 then
    fDMConsPedLote.sdsLote.CommandText := fDMConsPedLote.sdsLote.CommandText + ' AND L.NUM_ORDEM >= ' + IntToStr(CurrencyEdit1.AsInteger);
  if CurrencyEdit2.AsInteger > 0 then
    fDMConsPedLote.sdsLote.CommandText := fDMConsPedLote.sdsLote.CommandText + ' AND L.NUM_ORDEM <= ' + IntToStr(CurrencyEdit2.AsInteger);
  if CurrencyEdit3.AsInteger > 0 then
    fDMConsPedLote.sdsLote.CommandText := fDMConsPedLote.sdsLote.CommandText + ' AND L.NUM_LOTE >= ' + IntToStr(CurrencyEdit3.AsInteger);
  if CurrencyEdit4.AsInteger > 0 then
    fDMConsPedLote.sdsLote.CommandText := fDMConsPedLote.sdsLote.CommandText + ' AND L.NUM_LOTE <= ' + IntToStr(CurrencyEdit4.AsInteger);
  fDMConsPedLote.cdsLote.Open;
  fDMConsPedLote.cdsLote.IndexFieldNames := 'NUM_ORDEM;NUM_LOTE';
end;

procedure TfrmConsPedLote.btnCons_OrdemClick(Sender: TObject);
begin
  prc_Consultar_Ordem;
end;

procedure TfrmConsPedLote.prc_Consultar_Ordem;
begin
  fDMConsPedLote.cdsOrdem.Close;
  fDMConsPedLote.sdsOrdem.CommandText := fDMConsPedLote.ctOrdem + ' WHERE 0 = 0 ';
  if CurrencyEdit5.AsInteger > 0 then
    fDMConsPedLote.sdsOrdem.CommandText := fDMConsPedLote.sdsOrdem.CommandText + ' AND L.NUM_ORDEM >= ' + IntToStr(CurrencyEdit5.AsInteger);
  if CurrencyEdit6.AsInteger > 0 then
    fDMConsPedLote.sdsOrdem.CommandText := fDMConsPedLote.sdsOrdem.CommandText + ' AND L.NUM_ORDEM <= ' + IntToStr(CurrencyEdit6.AsInteger);
  fDMConsPedLote.cdsOrdem.Open;
  fDMConsPedLote.cdsOrdem.IndexFieldNames := 'NUM_ORDEM;NUM_PEDIDO';
end;

procedure TfrmConsPedLote.btnCons_TalaoClick(Sender: TObject);
begin
  prc_Consultar_Talao;
end;

procedure TfrmConsPedLote.prc_Consultar_Talao;
begin
  fDMConsPedLote.cdsTalao.Close;
  fDMConsPedLote.sdsTalao.CommandText := fDMConsPedLote.ctTalao + ' WHERE 0 = 0 ';
  if CurrencyEdit7.AsInteger > 0 then
    fDMConsPedLote.sdsTalao.CommandText := fDMConsPedLote.sdsTalao.CommandText + ' AND L.NUM_ORDEM >= ' + IntToStr(CurrencyEdit7.AsInteger);
  if CurrencyEdit8.AsInteger > 0 then
    fDMConsPedLote.sdsTalao.CommandText := fDMConsPedLote.sdsTalao.CommandText + ' AND L.NUM_ORDEM <= ' + IntToStr(CurrencyEdit8.AsInteger);
  if CurrencyEdit9.AsInteger > 0 then
    fDMConsPedLote.sdsTalao.CommandText := fDMConsPedLote.sdsTalao.CommandText + ' AND L.NUM_LOTE >= ' + IntToStr(CurrencyEdit9.AsInteger);
  if CurrencyEdit10.AsInteger > 0 then
    fDMConsPedLote.sdsTalao.CommandText := fDMConsPedLote.sdsTalao.CommandText + ' AND L.NUM_LOTE <= ' + IntToStr(CurrencyEdit10.AsInteger);
  fDMConsPedLote.cdsTalao.Open;
  fDMConsPedLote.cdsTalao.IndexFieldNames := 'NUM_ORDEM;NUM_LOTE';
end;

end.
