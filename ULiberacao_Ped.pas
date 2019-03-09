unit ULiberacao_Ped;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzTabs, ExtCtrls, Grids, DBGrids, SMDBGrid, UDMCadPreFat,
  StdCtrls, Mask, ToolEdit, CurrEdit, NxCollection, RxLookup, Buttons;

type
  TfrmLiberacao_Ped = class(TForm)
    RzPageControl1: TRzPageControl;
    Panel1: TPanel;
    TS_Conferido: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    btnConsultar: TNxButton;
    btnLiberar: TNxButton;
    Label2: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    SpeedButton3: TSpeedButton;
    Label3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnLiberarClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
    procedure prc_Consultar;
  public
    { Public declarations }
    fDMCadPreFat: TDMCadPreFat;
    vID_Cliente_Loc : Integer;

  end;

var
  frmLiberacao_Ped: TfrmLiberacao_Ped;

implementation

uses rsDBUtils, DB;

{$R *.dfm}

procedure TfrmLiberacao_Ped.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmLiberacao_Ped.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMCadPreFat);
  fDMCadPreFat.cdsClienteLib.Close;
  fDMCadPreFat.cdsClienteLib.Open;
  fDMCadPreFat.cdsPendente_Lib.Close;
  if vID_Cliente_Loc > 0 then
  begin
    if fDmCadPreFat.cdsClienteLib.Locate('CODIGO',vID_Cliente_Loc,[loCaseInsensitive]) then
    begin
      RxDBLookupCombo1.KeyValue := fDMCadPreFat.cdsClienteLibCODIGO.AsInteger;
      RxDBLookupCombo1.ReadOnly := True;
    end
    else
      MessageDlg('*** Cliente que esta no Pré Faturamento não possui Pedido Liberado!', mtInformation, [mbOk], 0);
  end;
end;

procedure TfrmLiberacao_Ped.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar;
end;

procedure TfrmLiberacao_Ped.prc_Consultar;
begin
  fDMCadPreFat.cdsPendente_Lib.Close;
  fDMCadPreFat.sdsPendente_Lib.CommandText := fDMCadPreFat.ctPendente_Lib;
  if CurrencyEdit1.AsInteger > 0 then
    fDMCadPreFat.sdsPendente_Lib.CommandText := fDMCadPreFat.sdsPendente_Lib.CommandText
                                              + ' AND PED.NUM_PEDIDO = ' + IntToStr(CurrencyEdit1.AsInteger);
  if trim(RxDBLookupCombo1.Text) <> '' then
    fDMCadPreFat.sdsPendente_Lib.CommandText := fDMCadPreFat.sdsPendente_Lib.CommandText
                                              + ' AND PED.ID_CLIENTE = ' + IntToStr(RxDBLookupCombo1.KeyValue);
  //09/03/2019
  if fDMCadPreFat.cdsPreFatFILIAL.AsInteger > 0 then
    fDMCadPreFat.sdsPendente_Lib.CommandText := fDMCadPreFat.sdsPendente_Lib.CommandText
                                              + ' AND PED.FILIAL = ' + IntToStr(fDMCadPreFat.cdsPreFatFILIAL.AsInteger);
  //*********************

  fDMCadPreFat.cdsPendente_Lib.Open
end;

procedure TfrmLiberacao_Ped.btnLiberarClick(Sender: TObject);
var
  vItemAux : Integer;
  vMSGAux : String;
begin
  if MessageDlg('Deseja liberar os pedidos selecionados para Faturamento?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;
  vMSGAux  := '';
  vItemAux := 0;
  fDMCadPreFat.cdsPendente_Lib.First;
  while not fDMCadPreFat.cdsPendente_Lib.Eof do
  begin
    if (SMDBGrid1.SelectedRows.CurrentRowSelected) and
      (StrToFloat(FormatFloat('0.000',fDMCadPreFat.cdsPendente_LibQTD_CONFERIDO.AsFloat)) > 0) and
     not(fDMCadPreFat.cdsPreFat_Itens.Locate('ID_PEDIDO;ITEM_PEDIDO',VarArrayOf([fDMCadPreFat.cdsPendente_LibID.AsInteger,fDMCadPreFat.cdsPendente_LibITEM.AsInteger]),[locaseinsensitive])) then
    begin
      if (fDMCadPreFat.cdsPreFatID_CLIENTE.AsInteger > 0) and (fDMCadPreFat.cdsPreFatID_CLIENTE.AsInteger <> fDMCadPreFat.cdsPendente_LibID_CLIENTE.AsInteger) then
        vMSGAux := 'Pedido: ' + fDMCadPreFat.cdsPendente_LibPEDIDO_CLIENTE.AsString + ' com cliente diferente do Pré Faturamento'
      else
      if fDMCadPreFat.cdsPreFatFILIAL.AsInteger <> fDMCadPreFat.cdsPendente_LibFILIAL.AsInteger then
        vMSGAux := 'Pedido: ' + fDMCadPreFat.cdsPendente_LibPEDIDO_CLIENTE.AsString + ' com Filial diferente do Pré Faturamento'
      else
      begin
        //if fDMCadPreFat.cdsPreFatID_CLIENTE.AsInteger <= 0 then
        fDMCadPreFat.cdsPreFatID_CLIENTE.AsInteger := fDMCadPreFat.cdsPendente_LibID_CLIENTE.AsInteger;

        fDMCadPreFat.cdsPreFat_Itens.Last;
        vItemAux := fDMCadPreFat.cdsPreFat_ItensITEM.AsInteger + 1;
        fDMCadPreFat.cdsPreFat_Itens.Insert;
        fDMCadPreFat.cdsPreFat_ItensID.AsInteger := fDMCadPreFat.cdsPreFatID.AsInteger;
        fDMCadPreFat.cdsPreFat_ItensITEM.AsInteger := vItemAux;
        fDMCadPreFat.cdsPreFat_ItensID_PEDIDO.AsInteger := fDMCadPreFat.cdsPendente_LibID.AsInteger;
        fDMCadPreFat.cdsPreFat_ItensITEM_PEDIDO.AsInteger := fDMCadPreFat.cdsPendente_LibITEM.AsInteger;
        fDMCadPreFat.cdsPreFat_ItensQTD.AsFloat           := fDMCadPreFat.cdsPendente_LibQTD_CONFERIDO.AsFloat;
        fDMCadPreFat.cdsPreFat_ItensID_CLIENTE.AsInteger  := fDMCadPreFat.cdsPendente_LibID_CLIENTE.AsInteger;
        fDMCadPreFat.cdsPreFat_ItensREFERENCIA.AsString   := fDMCadPreFat.cdsPendente_LibREFERENCIA.AsString;
        fDMCadPreFat.cdsPreFat_ItensNOMEPRODUTO.AsString  := fDMCadPreFat.cdsPendente_LibNOMEPRODUTO.AsString;
        fDMCadPreFat.cdsPreFat_Itens.Post;

        fDMCadPreFat.cdsPendente_Lib.Edit;
        fDMCadPreFat.cdsPendente_Lib.Edit;
        fDMCadPreFat.cdsPendente_LibQTD_LIBERADA.AsFloat  := StrToFloat(FormatFloat('0.000',fDMCadPreFat.cdsPendente_LibQTD_LIBERADA.AsFloat + fDMCadPreFat.cdsPendente_LibQTD_CONFERIDO.AsFloat));
        fDMCadPreFat.cdsPendente_LibQTD_CONFERIDO.AsFloat := StrToFloat(FormatFloat('0.000',0));
        fDMCadPreFat.cdsPendente_Lib.Post;
      end;
    end;
    fDMCadPreFat.cdsPendente_Lib.Next;
  end;
  if Trim(vMSGAux) <> '' then
    MessageDlg('*** Existe Pedido com cliente/Filial diferente ... ' + vMSGAux, mtError, [mbOk], 0);

  Close;
end;

procedure TfrmLiberacao_Ped.SpeedButton3Click(Sender: TObject);
begin
  fDMCadPreFat.cdsClienteLib.Close;
  fDMCadPreFat.cdsClienteLib.Open;
end;

end.
