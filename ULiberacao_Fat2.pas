unit ULiberacao_Fat2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Grids,
  DBGrids, SMDBGrid, FMTBcd, DB, Provider, DBClient, SqlExpr, UDMConferencia, RxLookup, UCBase, Mask, RzPanel, ToolEdit,
  UDMEstoque, dbXPress, NxPageControl, RzTabs, NxCollection, NxEdit,
  DBCtrls;

type
  TfrmLiberacao_Fat2 = class(TForm)
    Panel3: TPanel;
    Label5: TLabel;
    edtCBarra: TEdit;
    gbxVendedor: TRzGroupBox;
    btnConfBaixa: TNxButton;
    SMDBGrid2: TSMDBGrid;
    Panel2: TPanel;
    NxButton1: TNxButton;
    Label13: TLabel;
    Label14: TLabel;
    RzGroupBox1: TRzGroupBox;
    SMDBGrid3: TSMDBGrid;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edtCBarraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnConfBaixaClick(Sender: TObject);
    procedure NxButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SMDBGrid2Enter(Sender: TObject);
    procedure Panel3Exit(Sender: TObject);
    procedure SMDBGrid2DblClick(Sender: TObject);
    procedure SMDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure SMDBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    fDMConferencia: TDMConferencia;
    fDMEstoque: TDMEstoque;
    ColunaOrdenada: String;
    vItem_Ant : Integer;
    vItem_Ped_Sel : Integer;

    procedure prc_Gravar_Conf;
    procedure prc_Chamar_Form_Ped;
    procedure prc_Posiciona_Item;
    procedure prc_Verifica_Pedido_Conf;

  public
    { Public declarations }
  end;

var
  frmLiberacao_Fat2: TfrmLiberacao_Fat2;

implementation

uses DmdDatabase, uUtilPadrao, rsDBUtils, UMenu, ULiberacao_Fat_Ped;

{$R *.dfm}

procedure TfrmLiberacao_Fat2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(fDMEstoque);
  Action := Cafree;
end;

procedure TfrmLiberacao_Fat2.FormShow(Sender: TObject);
begin
  fDMConferencia := TDMConferencia.Create(Self);
  fDMEstoque     := TDMEstoque.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConferencia);
  vItem_Ant := 0;

  fDMConferencia.cdsPedido.Close;
  fDMConferencia.cdsPedido_Item.Close;
end;

procedure TfrmLiberacao_Fat2.edtCBarraKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    prc_Gravar_Conf;
end;

procedure TfrmLiberacao_Fat2.prc_Gravar_Conf;
var
  vQtdAux : Integer;
  ID: TTransactionDesc;
  sds: TSQLDataSet;
  vItem_Ped : Integer;
begin
  if trim(edtCBarra.Text) = '' then
    exit;
  fDMConferencia.qCBarraCor.Close;
  fDMConferencia.qCBarraCor.ParamByName('COD_BARRA').AsString := trim(edtCBarra.Text);
  fDMConferencia.qCBarraCor.Open;
  if fDMConferencia.qCBarraCor.IsEmpty then
  begin
    MessageDlg('Código de Barras não encontrado!', mtInformation, [mbOk], 0);
    edtCBarra.SelectAll;
    exit;
  end;
  if (fDMConferencia.qCBarraCorID_PRODUTO.AsInteger <> fDMConferencia.cdsPedido_ItemID_PRODUTO.AsInteger)
    or (fDMConferencia.qCBarraCorID_COR.AsInteger <> fDMConferencia.cdsPedido_ItemID_COR.AsInteger)
    or (fDMConferencia.qCBarraCorTAMANHO.AsString <> fDMConferencia.cdsPedido_ItemTAMANHO.AsString) then
  begin
    MessageDlg('Código de Barras não pertece ao produto: ' + fDMConferencia.cdsPedido_ItemID_PRODUTO.AsString + #13
             + 'Ref: ' + fDMConferencia.cdsPedido_ItemREFERENCIA.AsString + #13
             + 'Cor: ' + fDMConferencia.cdsPedido_ItemclNome_Cor.AsString + #13
             + 'Tamanho: ' + fDMConferencia.cdsPedido_ItemTAMANHO.AsString , mtInformation, [mbOk], 0);
    exit;
  end;
  vQtdAux := StrToInt(FormatFloat('0',fDMConferencia.cdsPedido_ItemQTD_RESTANTE.AsInteger - fDMConferencia.cdsPedido_ItemQTD_CONFERIDO.AsInteger));
  if StrtoFloat(FormatFloat('0',vQtdAux)) <= 0 then
  begin
    MessageDlg('Item  ' + fDMConferencia.cdsPedido_ItemITEM.AsString + ' do Pedido ' + fDMConferencia.cdsPedidoNUM_PEDIDO.AsString + ' Sem qtde. para gravar!' , mtInformation, [mbOk], 0);
    exit;
  end;

  vItem_Ped := fDMConferencia.cdsPedido_ItemITEM.AsInteger;

  try
    fDMConferencia.cdsPedido_Item.Edit;
    fDMConferencia.cdsPedido_ItemQTD_CONFERIDO.AsFloat := fDMConferencia.cdsPedido_ItemQTD_CONFERIDO.AsFloat + 1;
    fDMConferencia.cdsPedido_Item.Post;

    if fDMConferencia.mAuxConf.Locate('ID_PEDIDO;ITEM',VarArrayOf([fDMConferencia.cdsPedido_ItemID.AsInteger,fDMConferencia.cdsPedido_ItemITEM.AsInteger]),[locaseinsensitive]) then
      fDMConferencia.mAuxConf.Edit
    else
    begin
      fDMConferencia.mAuxConf.Insert;
      fDMConferencia.mAuxConfID_Pedido.AsInteger  := fDMConferencia.cdsPedido_ItemID.AsInteger;
      fDMConferencia.mAuxConfItem.AsInteger       := fDMConferencia.cdsPedido_ItemITEM.AsInteger;
      fDMConferencia.mAuxConfID_Produto.AsInteger := fDMConferencia.cdsPedido_ItemID_PRODUTO.AsInteger;
      fDMConferencia.mAuxConfID_Cor.AsInteger     := fDMConferencia.cdsPedido_ItemID_COR.AsInteger;
      fDMConferencia.mAuxConfNome_Produto.AsString := fDMConferencia.cdsPedido_ItemNOMEPRODUTO.AsString;
      fDMConferencia.mAuxConfReferencia.AsString   := fDMConferencia.cdsPedido_ItemREFERENCIA.AsString;
      fDMConferencia.mAuxConfTamanho.AsString      := fDMConferencia.cdsPedido_ItemTAMANHO.AsString;
      fDMConferencia.qCombinacao.Close;
      fDMConferencia.qCombinacao.ParamByName('ID').AsInteger := fDMConferencia.cdsPedido_ItemID_COR.AsInteger;
      fDMConferencia.qCombinacao.Open;
      fDMConferencia.mAuxConfNome_Cor.AsString := fDMConferencia.qCombinacaoNOME.AsString;
      fDMConferencia.mAuxConfQtd.AsInteger     := 0;
    end;
    fDMConferencia.mAuxConfQtd.AsInteger := fDMConferencia.mAuxConfQtd.AsInteger + 1;
    fDMConferencia.mAuxConf.Post;

    Label1.Caption := 'Total de Pares:  ' + fDMConferencia.mAuxConfQtd.AsString;

  finally
    edtCBarra.Clear;
    edtCBarra.SetFocus;
  end;
end;

procedure TfrmLiberacao_Fat2.btnConfBaixaClick(Sender: TObject);
var
  ID: TTransactionDesc;
  sds: TSQLDataSet;
  vItem : Integer;
  vTam : String;
  vIDCor : Integer;
begin
  if fDMConferencia.mAuxConf.IsEmpty then
    exit;

  sds := TSQLDataSet.Create(nil);
  ID.TransactionID  := 9;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'UPDATE TABELALOC SET FLAG = 1 ' +
                         'WHERE TABELA = ' + QuotedStr('PEDIDO_CONF');
    sds.ExecSQL();
    
    fDMConferencia.cdsPedido_Conf.Close;
    fDMConferencia.sdsPedido_Conf.ParamByName('ID').AsInteger   := 0;
    fDMConferencia.sdsPedido_Conf.ParamByName('ITEM').AsInteger := 0;
    fDMConferencia.cdsPedido_Conf.Open;

    fDMConferencia.mAuxConf.First;
    while not fDMConferencia.mAuxConf.Eof do
    begin
      fDMConferencia.cdsPedido_Item.Locate('ID;ITEM',VarArrayOf([fDMConferencia.mAuxConfID_Pedido.AsInteger,fDMConferencia.mAuxConfItem.AsInteger]),[locaseinsensitive]);

      fDMConferencia.qPedidoConf.Close;
      fDMConferencia.qPedidoConf.ParamByName('ID').AsInteger   := fDMConferencia.mAuxConfID_Pedido.AsInteger;
      fDMConferencia.qPedidoConf.ParamByName('ITEM').AsInteger := fDMConferencia.mAuxConfItem.AsInteger;
      fDMConferencia.qPedidoConf.Open;
      vItem := fDMConferencia.qPedidoConfITEM_CONF.AsInteger;

      fDMConferencia.cdsPedido_Conf.Insert;
      fDMConferencia.cdsPedido_ConfID.AsInteger   := fDMConferencia.mAuxConfID_Pedido.AsInteger;
      fDMConferencia.cdsPedido_ConfITEM.AsInteger := fDMConferencia.mAuxConfItem.AsInteger;
      fDMConferencia.cdsPedido_ConfITEM_CONF.AsInteger := vItem + 1;
      fDMConferencia.cdsPedido_ConfQTD.AsInteger       := fDMConferencia.mAuxConfQtd.AsInteger;
      fDMConferencia.cdsPedido_ConfDATA.AsDateTime     := Date;

      fDMConferencia.cdsPedido_ConfID_MOVESTOQUE.AsInteger := fDMEstoque.fnc_Gravar_Estoque(0,
                                          fDMConferencia.cdsPedidoFILIAL.AsInteger,
                                          1,
                                          fDMConferencia.cdsPedido_ItemID_PRODUTO.AsInteger,
                                          fDMConferencia.cdsPedidoNUM_PEDIDO.AsInteger,
                                          0,0,fDMConferencia.cdsPedidoID.AsInteger,
                                          0,
                                          'S','PCF',
                                          fDMConferencia.cdsPedido_ItemUNIDADE.AsString ,
                                          fDMConferencia.cdsPedido_ItemUNIDADE.AsString,'',
                                          fDMConferencia.cdsPedido_ItemTAMANHO.AsString,
                                          fDMConferencia.cdsPedido_ConfDATA.AsDateTime,
                                          fDMConferencia.cdsPedido_ItemVLR_UNITARIO.AsFloat,
                                          fDMConferencia.cdsPedido_ConfQTD.AsFloat,0,0,0,0,0,
                                          fDMConferencia.cdsPedido_ConfQTD.AsFloat,
                                          fDMConferencia.cdsPedido_ItemVLR_UNITARIO.AsFloat,0,0,
                                          fDMConferencia.cdsPedido_ItemUNIDADE.AsString,
                                          fDMConferencia.cdsPedido_ItemID_COR.AsInteger,
                                          '','N',0);
      fDMConferencia.cdsPedido_Conf.Post;
      fDMConferencia.cdsPedido_Conf.ApplyUpdates(0);

      fDMConferencia.mAuxConf.Next;
    end;
    fDMConferencia.cdsPedido_Item.ApplyUpdates(0);

    prc_Verifica_Pedido_Conf;

    dmDatabase.scoDados.Commit(ID);

    fDMConferencia.mAuxConf.EmptyDataSet;

  except
    dmDatabase.scoDados.Rollback(ID);
    raise;
  end;
  FreeAndNil(sds);
end;

procedure TfrmLiberacao_Fat2.NxButton1Click(Sender: TObject);
begin
  prc_Chamar_Form_Ped;
end;

procedure TfrmLiberacao_Fat2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F4) then
    prc_Chamar_Form_Ped;
end;

procedure TfrmLiberacao_Fat2.prc_Chamar_Form_Ped;
var
  ffrmLiberacao_Fat_Ped: TfrmLiberacao_Fat_Ped;
begin
  fDMConferencia.vID_Pedido_Fat  := 0;
  if (fDMConferencia.cdsPedido_Item.Active) and (fDMConferencia.cdsPedido_ItemID.AsInteger > 0) then
    fDMConferencia.vID_Pedido_Fat := fDMConferencia.cdsPedido_ItemID.AsInteger
  else
    fDMConferencia.vNum_Pedido_Fat := 0;

  ffrmLiberacao_Fat_Ped := TfrmLiberacao_Fat_Ped.Create(self);
  ffrmLiberacao_Fat_Ped.fDMConferencia := fDMConferencia;
  ffrmLiberacao_Fat_Ped.ShowModal;
  FreeAndNil(ffrmLiberacao_Fat_Ped);

  if fDMConferencia.vID_Pedido_Fat <= 0 then
    fDMConferencia.cdsPedido_Item.Close
  else
  //if fDMConferencia.vID_Pedido_Fat <> fDMConferencia.cdsPedido_ItemID.AsInteger then
  begin
    if fDMConferencia.vID_Pedido_Fat <> fDMConferencia.cdsPedidoID.AsInteger then
      fDMConferencia.cdsPedido.Locate('ID',fDMConferencia.vID_Pedido_Fat,[loCaseInsensitive]);
    fDMConferencia.cdsPedido_Item.Close;
    fDMConferencia.sdsPedido_Item.ParamByName('ID').AsInteger := fDMConferencia.vID_Pedido_Fat;
    fDMConferencia.cdsPedido_Item.Open;
  end;
  if fDMConferencia.vID_Pedido_Fat > 0 then
  begin
    Label14.Caption := IntToStr(fDMConferencia.vNum_Pedido_Fat);
    SMDBGrid2.SetFocus;
  end
  else
    Label14.Caption := '0';
end;

procedure TfrmLiberacao_Fat2.SMDBGrid2Enter(Sender: TObject);
begin
  vItem_Ped_Sel := 0;
  {if fDMConferencia.cdsPedido_ItemCONFERIDO.AsString = 'D' then
  begin
    vItem_Ant := fDMConferencia.cdsPedido_ItemITEM.AsInteger;
    if fDMConferencia.cdsPedido_ItemCONFERIDO.AsString = 'D' then
    begin
      fDMConferencia.cdsPedido_Item.Edit;
      fDMConferencia.cdsPedido_ItemCONFERIDO.AsString := '';
      fDMConferencia.cdsPedido_Item.Post;
    end;
  end
  else
    vItem_Ant := 0;}
end;

procedure TfrmLiberacao_Fat2.Panel3Exit(Sender: TObject);
begin
  edtCBarra.Enabled := False;
  Label5.Enabled    := False;
end;

procedure TfrmLiberacao_Fat2.SMDBGrid2DblClick(Sender: TObject);
begin
  prc_Posiciona_Item;
end;

procedure TfrmLiberacao_Fat2.prc_Posiciona_Item;
begin
  if (fDMConferencia.cdsPedido_Item.Active) and (fDMConferencia.cdsPedido_ItemITEM.AsInteger > 0) then
  begin
    vItem_Ped_Sel := fDMConferencia.cdsPedido_ItemITEM.AsInteger;                                           
    {fDMConferencia.cdsPedido_Item.Edit;
    fDMConferencia.cdsPedido_ItemCONFERIDO.AsString := 'D';
    fDMConferencia.cdsPedido_Item.Post;}
    edtCBarra.Enabled := True;
    Label5.Enabled    := True;
    edtCBarra.SetFocus;
  end;
end;

procedure TfrmLiberacao_Fat2.SMDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (fDMConferencia.cdsPedido_ItemITEM.AsInteger = vItem_Ped_Sel) and (vItem_Ped_Sel > 0) then
    AFont.Style := [fsBold]
  else
  if (fDMConferencia.cdsPedido_ItemQTD_RESTANTE.AsInteger - fDMConferencia.cdsPedido_ItemQTD_CONFERIDO.AsInteger - fDMConferencia.cdsPedido_ItemQTD_LIBERADA.AsInteger) <= 0 then
  begin
    Background  := $00A6FFFF;
    aFont.Color := clBlack;
  end;
end;

procedure TfrmLiberacao_Fat2.SMDBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    prc_Posiciona_Item;
end;

procedure TfrmLiberacao_Fat2.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := True;
  if fDMConferencia.mAuxConf.RecordCount > 0 then
  begin
    if MessageDlg('Existe leitura de código de barras sem a gravação do Estoque, confirma a saída sem gravar no estoque?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      CanClose := False;
  end;
end;

procedure TfrmLiberacao_Fat2.prc_Verifica_Pedido_Conf;
var
  vConfAux : String;
  vAux : Integer;
begin
  vConfAux := '';
  fDMConferencia.cdsPedido_Item.First;
  while not fDMConferencia.cdsPedido_Item.Eof do
  begin
    vAux := StrToInt(FormatFloat('0',fDMConferencia.cdsPedido_ItemQTD.AsInteger - fDMConferencia.cdsPedido_ItemQTD_CONFERIDO.AsInteger));
    if StrToInt(FormatFloat('0',vAux)) > 0 then
    begin
      vConfAux := 'N';
      fDMConferencia.cdsPedido_Item.Last;
    end
    else
    if StrToInt(FormatFloat('0',vAux)) <= 0 then
      vConfAux := 'S';
    fDMConferencia.cdsPedido_Item.Next;
  end;
  fDMConferencia.cdsPedido.Edit;
  fDMConferencia.cdsPedidoCONFERIDO.AsString := vConfAux;
  fDMConferencia.cdsPedido.Post;
  fDMConferencia.cdsPedido.ApplyUpdates(0);
end;

end.
