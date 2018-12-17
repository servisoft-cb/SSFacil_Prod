unit UConsBaixa_Proc2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, Grids, DBGrids, SMDBGrid, FMTBcd, DB,
  DBClient, Provider, SqlExpr, NxCollection, StdCtrls, UDMBaixaProd;

type
  TfrmConsBaixa_Proc2 = class(TForm)
    gbxProcessos: TRzGroupBox;
    RzGroupBox1: TRzGroupBox;
    SMDBGrid1: TSMDBGrid;
    sdsConsProcesso: TSQLDataSet;
    dspConsProcesso: TDataSetProvider;
    cdsConsProcesso: TClientDataSet;
    cdsConsProcessoID: TIntegerField;
    cdsConsProcessoITEM: TIntegerField;
    cdsConsProcessoQTD: TFloatField;
    cdsConsProcessoQTD_CONFERIDO: TFloatField;
    cdsConsProcessoDTBAIXA: TDateField;
    cdsConsProcessoREFERENCIA: TStringField;
    cdsConsProcessoNOME_PROCESSO: TStringField;
    cdsConsProcessoDTENTRADA: TDateField;
    cdsConsProcessoHRENTRADA: TTimeField;
    cdsConsProcessoHRBAIXA: TTimeField;
    cdsConsProcessoNOMEPRODUTO: TStringField;
    cdsConsProcessoNOME_COMBINACAO: TStringField;
    dsConsProcesso: TDataSource;
    sdsConsEtiquetas: TSQLDataSet;
    dspConsEtiquetas: TDataSetProvider;
    cdsConsEtiquetas: TClientDataSet;
    dsConsEtiquetas: TDataSource;
    cdsConsEtiquetasQTD: TFloatField;
    cdsConsEtiquetasITEM_TALAO: TIntegerField;
    cdsConsEtiquetasITEM: TIntegerField;
    cdsConsEtiquetasDTBAIXA: TDateField;
    SMDBGrid2: TSMDBGrid;
    Panel1: TPanel;
    NxButton1: TNxButton;
    Shape2: TShape;
    Label14: TLabel;
    cdsConsEtiquetasID: TIntegerField;
    qVerVolume: TSQLQuery;
    qVerVolumeID: TIntegerField;
    cdsConsEtiquetasclCodBarra: TStringField;
    cdsConsEtiquetasNUM_PEDIDO: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure NxButton1Click(Sender: TObject);
    procedure cdsConsEtiquetasCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    fDMBaixaProd: TDMBaixaProd;
    
    vIDPed_Loc, vItem_Loc : Integer;
  end;

var
  frmConsBaixa_Proc2: TfrmConsBaixa_Proc2;

implementation

uses DmdDatabase;

{$R *.dfm}

procedure TfrmConsBaixa_Proc2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsBaixa_Proc2.FormShow(Sender: TObject);
begin
  cdsConsProcesso.Close;
  sdsConsProcesso.ParamByName('ID').AsInteger   := vIDPed_Loc;
  sdsConsProcesso.ParamByName('ITEM').AsInteger := vItem_Loc;
  cdsConsProcesso.Open;

  cdsConsEtiquetas.Close;
  sdsConsEtiquetas.ParamByName('ID').AsInteger   := vIDPed_Loc;
  sdsConsEtiquetas.ParamByName('ITEM').AsInteger := vItem_Loc;
  cdsConsEtiquetas.Open;
end;

procedure TfrmConsBaixa_Proc2.SMDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not(cdsConsEtiquetasDTBAIXA.IsNull) then
    Background := $0080FF80;
end;

procedure TfrmConsBaixa_Proc2.NxButton1Click(Sender: TObject);
var
  vItem : Integer;
begin
  if cdsConsEtiquetasDTBAIXA.IsNull then
    exit;

  qVerVolume.Close;
  qVerVolume.ParamByName('ID_PEDIDO').AsInteger   := cdsConsEtiquetasID.AsInteger;
  qVerVolume.ParamByName('ITEM_PEDIDO').AsInteger := cdsConsEtiquetasITEM.AsInteger;
  qVerVolume.ParamByName('ITEM_TALAO').AsInteger  := cdsConsEtiquetasITEM_TALAO.AsInteger;
  qVerVolume.Open;
  if qVerVolumeID.AsInteger > 0 then
  begin
    MessageDlg('*** Pacote esta no Pré Faturamento Nº: ' + qVerVolumeID.AsString , mtInformation, [mbOk], 0);
    exit;
  end;

  if MessageDlg('Deseja excluir a baixa do Talão/Etiqueta Selecionada?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;
  vItem := cdsConsEtiquetasITEM_TALAO.AsInteger;
  fDMBaixaProd.cdsPedido_Talao.Close;
  fDMBaixaProd.sdsPedido_Talao.ParamByName('ID').AsInteger         := cdsConsEtiquetasID.AsInteger;
  fDMBaixaProd.sdsPedido_Talao.ParamByName('ITEM').AsInteger       := cdsConsEtiquetasITEM.AsInteger;
  fDMBaixaProd.sdsPedido_Talao.ParamByName('ITEM_TALAO').AsInteger := cdsConsEtiquetasITEM_TALAO.AsInteger;
  fDMBaixaProd.cdsPedido_Talao.Open;
  if not fDMBaixaProd.cdsPedido_Talao.IsEmpty then
  begin
    fDMBaixaProd.cdsPedido_Talao.Edit;
    fDMBaixaProd.cdsPedido_TalaoDTBAIXA.Clear;
    fDMBaixaProd.cdsPedido_TalaoHRBAIXA.Clear;
    fDMBaixaProd.cdsPedido_Talao.Post;
    fDMBaixaProd.cdsPedido_Talao.ApplyUpdates(0);

    fDMBaixaProd.cdsPedido_Item.Close;
    fDMBaixaProd.sdsPedido_Item.ParamByName('ID').AsInteger   := cdsConsEtiquetasID.AsInteger;
    fDMBaixaProd.sdsPedido_Item.ParamByName('ITEM').AsInteger := cdsConsEtiquetasITEM.AsInteger;
    fDMBaixaProd.cdsPedido_Item.Open;
    if not fDMBaixaProd.cdsPedido_Item.IsEmpty then
    begin
      fDMBaixaProd.cdsPedido_Item.Edit;
      fDMBaixaProd.cdsPedido_ItemQTD_CONFERIDO.AsFloat := StrToFloat(FormatFloat('0.000',fDMBaixaProd.cdsPedido_ItemQTD_CONFERIDO.AsFloat - cdsConsEtiquetasQTD.AsFloat));
      fDMBaixaProd.cdsPedido_Item.Post;
      fDMBaixaProd.cdsPedido_Item.ApplyUpdates(0);
    end;
  end;

  cdsConsEtiquetas.Close;
  sdsConsEtiquetas.ParamByName('ID').AsInteger   := vIDPed_Loc;
  sdsConsEtiquetas.ParamByName('ITEM').AsInteger := vItem_Loc;
  cdsConsEtiquetas.Open;

  cdsConsEtiquetas.Locate('ITEM_TALAO',vItem,[loCaseInsensitive]);
end;

procedure TfrmConsBaixa_Proc2.cdsConsEtiquetasCalcFields(
  DataSet: TDataSet);
begin
  cdsConsEtiquetasclCodBarra.AsString := '21' + FormatFloat('000000',cdsConsEtiquetasNUM_PEDIDO.AsInteger)
                                       + FormatFloat('000',cdsConsEtiquetasITEM.AsInteger)
                                       + FormatFloat('000',cdsConsEtiquetasITEM_TALAO.AsInteger);
end;

end.
