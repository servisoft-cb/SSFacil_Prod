unit ULeVolume;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, CurrEdit, NxCollection, UDMBaixaProd,
  ExtCtrls, Grids, DBGrids, SMDBGrid, UDMCadPreFat, RzTabs, DBXpress;

type
  TfrmLeVolume = class(TForm)
    Panel2: TPanel;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    Panel1: TPanel;
    Label5: TLabel;
    NxPanel1: TNxPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Edit1: TEdit;
    btnFecharVolume: TNxButton;
    CurrencyEdit2: TCurrencyEdit;
    Panel4: TPanel;
    SMDBGrid2: TSMDBGrid;
    Panel5: TPanel;
    SMDBGrid1: TSMDBGrid;
    Panel3: TPanel;
    btnExcluirVolume: TNxButton;
    btnExcluirPacote: TNxButton;
    Label4: TLabel;
    Label6: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnFecharVolumeClick(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Change(Sender: TObject);
    procedure btnExcluirVolumeClick(Sender: TObject);
    procedure btnExcluirPacoteClick(Sender: TObject);
  private
    { Private declarations }
    fDMBaixaProd: TDMBaixaProd;

    procedure prc_Pedido_Talao;
    procedure prc_Proximo_Volume;
    procedure prc_Abrir_qPedido(NumPedido : Integer ; PedidoCliente : String);
    procedure prc_Excluir_Pacote;

  public
    { Public declarations }
    fDMCadPreFat: TDMCadPreFat;

  end;

var
  frmLeVolume: TfrmLeVolume;

implementation

uses rsDBUtils, DmdDatabase, DB, uUtilPadrao;

{$R *.dfm}

procedure TfrmLeVolume.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(fDMBaixaProd);
  action := Cafree;
end;

procedure TfrmLeVolume.FormShow(Sender: TObject);
begin
  fDMBaixaProd := TDMBaixaProd.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMCadPreFat);
  prc_Proximo_Volume;
  Edit1.SetFocus;
  NxPanel1.Visible         := (fDMCadPreFat.cdsPreFat.State in [dsEdit, dsInsert]);
  btnExcluirVolume.Visible := (fDMCadPreFat.cdsPreFat.State in [dsEdit, dsInsert]);
  btnExcluirPacote.Visible := (fDMCadPreFat.cdsPreFat.State in [dsEdit, dsInsert]);
end;

procedure TfrmLeVolume.btnFecharVolumeClick(Sender: TObject);
begin
  fDMCadPreFat.cdsPreFat_Vol.Last;
  if (fDMCadPreFat.cdsPreFat_Vol.IsEmpty) or (fDMCadPreFat.cdsPreFat_VolFECHADA.AsString = 'S') then
  begin
    MessageDlg('*** Volume já fechado ou vázio!', mtError, [mbOk], 0);
    exit;
  end;
  if MessageDlg('Deseja Fechar o Volume?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fDMCadPreFat.cdsPreFat_Vol.Edit;
  fDMCadPreFat.cdsPreFat_VolFECHADA.AsString := 'S';
  fDMCadPreFat.cdsPreFat_Vol.Post;

  fDMCadPreFat.cdsPreFat.Edit;
  fDMCadPreFat.cdsPreFatQTD_VOLUME.AsInteger := fDMCadPreFat.cdsPreFat_Vol.RecordCount;
  fDMCadPreFat.cdsPreFat.Post;

  fDMCadPreFat.cdsPreFat.ApplyUpdates(0);
  
  prc_Proximo_Volume;
  Edit1.SetFocus;
  CurrencyEdit2.Clear;
end;

procedure TfrmLeVolume.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
  begin
    if copy(Edit1.Text,1,2) = '21' then
      prc_Pedido_Talao;
    Edit1.SelectAll;
  end;
end;

procedure TfrmLeVolume.prc_Pedido_Talao;
var
  vPed, vItem, vItemTal : Integer;
  vQtdAux : Real;
  vMSGAux : String;
  vItemAux : Integer;
  ID: TTransactionDesc;
begin
  if Length(Edit1.Text) <> 14 then
    exit;
  vPed     := StrToInt(copy(Edit1.Text,3,6));
  vItem    := StrToInt(copy(Edit1.Text,9,3));
  vItemTal := StrToInt(copy(Edit1.Text,12,3));

  prc_Abrir_qPedido(vPed,'');
  if fDMBaixaProd.qPed.IsEmpty then
  begin
    Label5.Caption := 'Nº Pedido: ' + IntToStr(vPed) + ' , não Encontrado';
    exit;
  end;

  if (fDMCadPreFat.cdsPreFatID_CLIENTE.AsInteger > 0) and (fDMBaixaProd.qPedID_CLIENTE.AsInteger <> fDMCadPreFat.cdsPreFatID_CLIENTE.AsInteger) then
  begin
    Label5.Caption := 'Talão com cliente diferente da Pré Nota';
    exit;
  end;
  //09/03/2019
  if (fDMCadPreFat.cdsPreFatFILIAL.AsInteger <> fDMBaixaProd.qPedFILIAL.AsInteger) and (fDMCadPreFat.cdsPreFatFILIAL.AsInteger > 0)  then
  begin
    Label5.Caption := 'Filial Diferente da informada!';
    exit;
  end;
  //*************

  fDMBaixaProd.cdsPedido_Item.Close;
  fDMBaixaProd.sdsPedido_Item.ParamByName('ID').AsInteger   := fDMBaixaProd.qPedID.AsInteger;
  fDMBaixaProd.sdsPedido_Item.ParamByName('ITEM').AsInteger := vItem;
  fDMBaixaProd.cdsPedido_Item.Open;
  if StrToFloat(FormatFloat('0.000',fDMBaixaProd.cdsPedido_ItemQTD_RESTANTE.AsFloat)) <= 0 then
  begin
    Label5.Caption := 'Pedido: ' + IntToStr(vPed) + ' Item: ' + IntToStr(vItem) + ' já faturados';
    exit;
  end;
           
  //precisa estar com o processo lido (Talão dos itens do pedido)
  fDMBaixaProd.qConf_Proc.Close;
  fDMBaixaProd.qConf_Proc.ParamByName('ID_PEDIDO').AsInteger   := fDMBaixaProd.qPedID.AsInteger;
  fDMBaixaProd.qConf_Proc.ParamByName('ITEM_PEDIDO').AsInteger := vItem;
  fDMBaixaProd.qConf_Proc.Open;
  if fDMBaixaProd.qConf_ProcCONTADOR.AsInteger <= 0 then
  begin
    Label5.Caption := 'Pedido: ' + IntToStr(vPed) + ' Item: ' + IntToStr(vItem) + ' não liberado no Processo ' + #13
                   + '        ' + fDMBaixaProd.qParametros_LoteNOME_PROCESSO_CONF.AsString;
    exit;
  end;
  //************

  vMSGAux := '';
  fDMBaixaProd.cdsPedido_Talao.Close;
  fDMBaixaProd.sdsPedido_Talao.ParamByName('ID').AsInteger         := fDMBaixaProd.qPedID.AsInteger;
  fDMBaixaProd.sdsPedido_Talao.ParamByName('ITEM').AsInteger       := vItem;
  fDMBaixaProd.sdsPedido_Talao.ParamByName('ITEM_TALAO').AsInteger := vItemTal;
  fDMBaixaProd.cdsPedido_Talao.Open;
  if fDMBaixaProd.cdsPedido_Talao.IsEmpty then
    vMSGAux := vMSGAux + #13 + '*** Talão Pedido não encontrado!';

  if fDMBaixaProd.cdsPedido_TalaoDTBAIXA.AsDateTime > 10 then
    vMSGAux := vMSGAux + #13 + '*** Talão ja baixado no dia ' + fDMBaixaProd.cdsPedido_TalaoDTBAIXA.AsString;
  if StrToFloat(FormatFloat('0.000',fDMBaixaProd.cdsPedido_TalaoQTD.AsFloat)) > StrToFloat(FormatFloat('0.000',fDMBaixaProd.cdsPedido_ItemQTD_RESTANTE.AsFloat)) then
    vMSGAux := vMSGAux + #13 + '*** Qtd. No Pedido ' + fDMBaixaProd.cdsPedido_ItemQTD_RESTANTE.AsString + ', Qtd No Talão: ' + fDMBaixaProd.cdsPedido_TalaoQTD.AsString;
  if (StrToFloat(FormatFloat('0.00',fDMBaixaProd.cdsPedido_TalaoQTD.AsFloat)) > StrToFloat(FormatFloat('0.000',fDMBaixaProd.cdsPedido_ItemQTD_RESTANTE.AsFloat - fDMBaixaProd.cdsPedido_ItemQTD_LIBERADA.AsFloat))) then
    vMSGAux := vMSGAux + #13 + '*** Qtd. disponível para liberação é ' + FormatFloat('0.000',fDMBaixaProd.cdsPedido_ItemQTD_RESTANTE.AsFloat - fDMBaixaProd.cdsPedido_ItemQTD_LIBERADA.AsFloat);

  if (StrToFloat(FormatFloat('0.00',fDMBaixaProd.cdsPedido_TalaoQTD.AsFloat)) >
     StrToFloat(FormatFloat('0.00',fDMBaixaProd.cdsPedido_ItemQTD_RESTANTE.AsFloat - fDMBaixaProd.cdsPedido_ItemQTD_LIBERADA.AsFloat - fDMBaixaProd.cdsPedido_ItemQTD_CONFERIDO.AsFloat))) then
    vMSGAux := vMSGAux + #13 + '*** Qtd. disponível para liberação é '
            + FormatFloat('0.000',fDMBaixaProd.cdsPedido_ItemQTD_RESTANTE.AsFloat - fDMBaixaProd.cdsPedido_ItemQTD_LIBERADA.AsFloat - fDMBaixaProd.cdsPedido_ItemQTD_CONFERIDO.AsFloat);
  if trim(vMSGAux) <> '' then
  begin
    Label5.Caption := vMSGAux;
    MessageDlg('*** Código informado incorreto!', mtError, [mbOk], 0);
    exit;
  end;

  vMSGAux := '';
  ID.TransactionID  := 1;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    if fDMCadPreFat.cdsPreFatID_CLIENTE.AsInteger <= 0 then
      fDMCadPreFat.cdsPreFatID_CLIENTE.AsInteger := fDMBaixaProd.qPedID_CLIENTE.AsInteger;

    fDMBaixaProd.cdsPedido_Talao.Edit;
    fDMBaixaProd.cdsPedido_TalaoDTBAIXA.AsDateTime := Date;
    fDMBaixaProd.cdsPedido_TalaoHRBAIXA.AsDateTime := Now;
    fDMBaixaProd.cdsPedido_TalaoUSUARIO.AsString   := vUsuario;
    fDMBaixaProd.cdsPedido_Talao.Post;
    vQtdAux := StrToFloat(FormatFloat('0.000',fDMBaixaProd.cdsPedido_TalaoQTD.AsFloat));

    {fDMBaixaProd.cdsPedido_Item.Edit;
    fDMBaixaProd.cdsPedido_ItemQTD_CONFERIDO.AsFloat := StrToFloat(FormatFloat('0.000',fDMBaixaProd.cdsPedido_ItemQTD_CONFERIDO.AsFloat + fDMBaixaProd.cdsPedido_TalaoQTD.AsFloat));
    fDMBaixaProd.cdsPedido_Item.Post;}

    //Gravando Itens da Pré Nota
    if fDMCadPreFat.cdsPreFat_Itens.Locate('ID_PEDIDO;ITEM_PEDIDO',VarArrayOf([fDMBaixaProd.cdsPedido_ItemID.AsInteger,fDMBaixaProd.cdsPedido_ItemITEM.AsInteger]),[locaseinsensitive]) then
      fDMCadPreFat.cdsPreFat_Itens.Edit
    else
    begin
      fDMCadPreFat.prc_Inserir_Itens;
      fDMCadPreFat.cdsPreFat_ItensID_PEDIDO.AsInteger   := fDMBaixaProd.cdsPedido_ItemID.AsInteger;
      fDMCadPreFat.cdsPreFat_ItensITEM_PEDIDO.AsInteger := fDMBaixaProd.cdsPedido_ItemITEM.AsInteger;
      fDMCadPreFat.cdsPreFat_ItensID_CLIENTE.AsInteger  := fDMCadPreFat.cdsPreFatID_CLIENTE.AsInteger;
      fDMCadPreFat.cdsPreFat_ItensNOMEPRODUTO.AsString  := fDMBaixaProd.cdsPedido_ItemNOMEPRODUTO.AsString;
    end;
    fDMCadPreFat.cdsPreFat_ItensQTD.AsFloat := fDMCadPreFat.cdsPreFat_ItensQTD.AsFloat + StrToFloat(FormatFloat('0.000',fDMBaixaProd.cdsPedido_TalaoQTD.AsFloat));
    fDMCadPreFat.cdsPreFat_ItensEXISTE_VOL_ETIQ.AsString := 'S';
    fDMCadPreFat.cdsPreFat_Itens.Post;
    //************************

    //Gravando Volumes
    fDMCadPreFat.cdsPreFat_Vol.Last;
    if (fDMCadPreFat.cdsPreFat_Vol.IsEmpty) or (fDMCadPreFat.cdsPreFat_VolFECHADA.AsString = 'S') then
    begin
      fDMCadPreFat.cdsPreFat_Vol.Insert;
      fDMCadPreFat.cdsPreFat_VolID.AsInteger := fDMCadPreFat.cdsPreFatID.AsInteger;
      fDMCadPreFat.cdsPreFat_VolNUM_VOLUME.AsInteger := CurrencyEdit1.AsInteger;
    end
    else
      fDMCadPreFat.cdsPreFat_Vol.Edit;
    fDMCadPreFat.cdsPreFat_VolQTD_ETIQ.AsInteger := fDMCadPreFat.cdsPreFat_VolQTD_ETIQ.AsInteger + 1;
    fDMCadPreFat.cdsPreFat_VolQTD_PROD.AsFloat   := fDMCadPreFat.cdsPreFat_VolQTD_PROD.AsFloat + fDMBaixaProd.cdsPedido_TalaoQTD.AsFloat;
    fDMCadPreFat.cdsPreFat_Vol.Post;

    fDMCadPreFat.cdsPreFat_Vol_Etiq.Last;
    vItemAux := fDMCadPreFat.cdsPreFat_Vol_EtiqITEM_ETIQ.AsInteger;
    fDMCadPreFat.cdsPreFat_Vol_Etiq.Insert;
    fDMCadPreFat.cdsPreFat_Vol_EtiqID.AsInteger          := fDMCadPreFat.cdsPreFat_VolID.AsInteger;
    fDMCadPreFat.cdsPreFat_Vol_EtiqNUM_VOLUME.AsInteger  := CurrencyEdit1.AsInteger;
    fDMCadPreFat.cdsPreFat_Vol_EtiqITEM_ETIQ.AsInteger   := vItemAux + 1;
    fDMCadPreFat.cdsPreFat_Vol_EtiqID_PEDIDO.AsInteger   := fDMBaixaProd.cdsPedido_ItemID.AsInteger;
    fDMCadPreFat.cdsPreFat_Vol_EtiqITEM_PEDIDO.AsInteger := fDMBaixaProd.cdsPedido_ItemITEM.AsInteger;
    fDMCadPreFat.cdsPreFat_Vol_EtiqQTD.AsFloat           := fDMBaixaProd.cdsPedido_TalaoQTD.AsFloat;
    fDMCadPreFat.cdsPreFat_Vol_EtiqITEM_TALAO.AsInteger  := fDMBaixaProd.cdsPedido_TalaoITEM_TALAO.AsInteger;
    fDMCadPreFat.cdsPreFat_Vol_Etiq.Post;
    //***********************

    fDMBaixaProd.cdsPedido_Talao.ApplyUpdates(0);
    fDMBaixaProd.cdsPedido_Item.ApplyUpdates(0);

    fDMCadPreFat.cdsPreFat.ApplyUpdates(0);

    dmDatabase.scoDados.Commit(ID);

    Label5.Caption := 'Pedido: ' + IntToStr(vPed);
    Label5.Caption := Label5.Caption + #13 + #13 + 'Item: ' + IntToStr(vItem);
    Label5.Caption := Label5.Caption + #13 + #13 + 'Qtd. Conferida: ' + FormatFloat('0.###',vQtdAux);

    Edit1.Clear;

  except
      on e: Exception do
      begin
        dmDatabase.scoDados.Rollback(ID);
        raise Exception.Create('Erro ao gravar Baixa Processo: ' + #13+#13 + e.Message);
      end;
  end;
  CurrencyEdit2.AsInteger := fDMCadPreFat.cdsPreFat_Vol_Etiq.RecordCount;
end;

procedure TfrmLeVolume.Edit1Change(Sender: TObject);
begin
  Label5.Caption := '';
end;

procedure TfrmLeVolume.prc_Proximo_Volume;
var
  vNumAux : Integer;
begin
  fDMCadPreFat.cdsPreFat_Vol.Last;
  vNumAux := fDMCadPreFat.cdsPreFat_VolNUM_VOLUME.AsInteger;
  CurrencyEdit2.AsInteger := fDMCadPreFat.cdsPreFat_Vol_Etiq.RecordCount;
  if (fDMCadPreFat.cdsPreFat_Vol.IsEmpty) or (fDMCadPreFat.cdsPreFat_VolFECHADA.AsString = 'S') then
  begin
    vNumAux := vNumAux + 1;
    CurrencyEdit2.AsInteger := 0;
  end;
  CurrencyEdit1.AsInteger := vNumAux;
end;

procedure TfrmLeVolume.prc_Abrir_qPedido(NumPedido: Integer; PedidoCliente: String);
begin
  fDMBaixaProd.qPed.Close;
  if NumPedido > 0 then
  begin
    fDMBaixaProd.qPed.SQL.Text := fDMBaixaProd.ctqPed + ' WHERE P.NUM_PEDIDO = :NUM_PEDIDO ';
    fDMBaixaProd.qPed.ParamByName('NUM_PEDIDO').AsInteger := NumPedido;
  end
  else
  begin
    fDMBaixaProd.qPed.SQL.Text := fDMBaixaProd.ctqPed + ' WHERE P.PEDIDO_CLIENTE = :PEDIDO_CLIENTE ';
    fDMBaixaProd.qPed.ParamByName('PEDIDO_CLIENTE').AsString := PedidoCliente;
  end;
  fDMBaixaProd.qPed.Open;
end;

procedure TfrmLeVolume.btnExcluirVolumeClick(Sender: TObject);
var
  vAux : Integer;
  ID: TTransactionDesc;
begin
  vaux := fDMCadPreFat.cdsPreFat_VolNUM_VOLUME.AsInteger;
  fDMCadPreFat.cdsPreFat_Vol.Last;
  if vAux <> fDMCadPreFat.cdsPreFat_VolNUM_VOLUME.AsInteger then
  begin
    MessageDlg('*** Volume não é o último.' +#13 + 'Só pode ser excluído o último volume!', mtError, [mbOk], 0);
    exit;
  end;

  if MessageDlg('Deseja Excluir o Volume ' + fDMCadPreFat.cdsPreFat_VolNUM_VOLUME.AsString + ' ?' ,mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  ID.TransactionID  := 101;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    fDMCadPreFat.cdsPreFat_Vol_Etiq.First;
    while not fDMCadPreFat.cdsPreFat_Vol_Etiq.Eof do
    begin
      prc_Excluir_Pacote;
      fDMCadPreFat.cdsPreFat_Vol_Etiq.Delete;
    end;
    fDMCadPreFat.cdsPreFat_Vol.Delete;
    if not(fDMCadPreFat.cdsPreFat.State in [dsEdit, dsInsert]) then
      fDMCadPreFat.cdsPreFat.Edit;
    fDMCadPreFat.cdsPreFatQTD_VOLUME.AsInteger := fDMCadPreFat.cdsPreFatQTD_VOLUME.AsInteger - 1;
    fDMCadPreFat.cdsPreFat.Post;

    fDMBaixaProd.cdsPedido_Talao.ApplyUpdates(0);
    //fDMBaixaProd.cdsPedido_Item.ApplyUpdates(0);
    fDMCadPreFat.cdsPreFat.ApplyUpdates(0);

    dmDatabase.scoDados.Commit(ID);

  except
      on e: Exception do
      begin
        dmDatabase.scoDados.Rollback(ID);
        raise Exception.Create('Erro ao excluir o Volume: ' + #13+#13 + e.Message);
      end;
  end;
  
  fDMCadPreFat.cdsPreFat.Edit;

  prc_Proximo_Volume;
  Edit1.SetFocus;
  CurrencyEdit2.Clear;
end;

procedure TfrmLeVolume.prc_Excluir_Pacote;
begin
  fDMBaixaProd.cdsPedido_Talao.Close;
  fDMBaixaProd.sdsPedido_Talao.ParamByName('ID').AsInteger         := fDMCadPreFat.cdsPreFat_Vol_EtiqID_PEDIDO.AsInteger;
  fDMBaixaProd.sdsPedido_Talao.ParamByName('ITEM').AsInteger       := fDMCadPreFat.cdsPreFat_Vol_EtiqITEM_PEDIDO.AsInteger;
  fDMBaixaProd.sdsPedido_Talao.ParamByName('ITEM_TALAO').AsInteger := fDMCadPreFat.cdsPreFat_Vol_EtiqITEM_TALAO.AsInteger;
  fDMBaixaProd.cdsPedido_Talao.Open;

  if fDMCadPreFat.cdsPreFat_Itens.Locate('ID_PEDIDO;ITEM_PEDIDO',VarArrayOf([fDMCadPreFat.cdsPreFat_Vol_EtiqID_PEDIDO.AsInteger,fDMCadPreFat.cdsPreFat_Vol_EtiqITEM_PEDIDO.AsInteger]),[locaseinsensitive]) then
  begin
    if StrToFloat(FormatFloat('0.000',fDMBaixaProd.cdsPedido_TalaoQTD.AsFloat)) = StrToFloat(FormatFloat('0.000',fDMCadPreFat.cdsPreFat_ItensQTD.AsFloat)) then
      fDMCadPreFat.cdsPreFat_Itens.Delete
    else
    begin
      fDMCadPreFat.cdsPreFat_Itens.Edit;
      fDMCadPreFat.cdsPreFat_ItensQTD.AsFloat := fDMCadPreFat.cdsPreFat_ItensQTD.AsFloat - StrToFloat(FormatFloat('0.000',fDMBaixaProd.cdsPedido_TalaoQTD.AsFloat));
      fDMCadPreFat.cdsPreFat_Itens.Post;
    end;
  end;
end;

procedure TfrmLeVolume.btnExcluirPacoteClick(Sender: TObject);
var
  ID: TTransactionDesc;
  vVol, vEtiq : Integer;
begin
  if MessageDlg('Deseja Excluir o Pacote selecionado do Volume ' + fDMCadPreFat.cdsPreFat_VolNUM_VOLUME.AsString + ' ?' ,mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  ID.TransactionID  := 101;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try

    vVol  := fDMCadPreFat.cdsPreFat_Vol_EtiqNUM_VOLUME.AsInteger;

    prc_Excluir_Pacote;
    fDMCadPreFat.cdsPreFat_Vol_Etiq.Delete;
    vEtiq := fDMCadPreFat.cdsPreFat_Vol_EtiqITEM_ETIQ.AsInteger;
    
    fDMCadPreFat.cdsPreFat_Vol.Edit;
    fDMCadPreFat.cdsPreFat_VolQTD_ETIQ.AsInteger := fDMCadPreFat.cdsPreFat_VolQTD_ETIQ.AsInteger - 1;
    fDMCadPreFat.cdsPreFat_VolQTD_PROD.AsFloat   := fDMCadPreFat.cdsPreFat_VolQTD_PROD.AsFloat - fDMBaixaProd.cdsPedido_TalaoQTD.AsFloat;
    fDMCadPreFat.cdsPreFat_Vol.Post;


    fDMBaixaProd.cdsPedido_Talao.ApplyUpdates(0);
    fDMCadPreFat.cdsPreFat.ApplyUpdates(0);

    dmDatabase.scoDados.Commit(ID);

  except
      on e: Exception do
      begin
        dmDatabase.scoDados.Rollback(ID);
        raise Exception.Create('Erro ao excluir o Volume: ' + #13+#13 + e.Message);
      end;
  end;

  fDMCadPreFat.cdsPreFat_Vol_Etiq.Locate('NUM_VOLUME;ITEM_ETIQ',VarArrayOf([vVol,vEtiq]),[locaseinsensitive]);

  fDMCadPreFat.cdsPreFat.Edit;
end;

end.

