//SL Textil usa para imprimir as etiquetas e controlar por código de barras
unit UGerar_Pedido_Talao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMPedido_Talao, StdCtrls, Mask, ToolEdit, CurrEdit, ExtCtrls,
  NxCollection, RzTabs, Grids, DBGrids, SMDBGrid, DB;

type
  TfrmGerar_Pedido_Talao = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    btnConsultar: TNxButton;
    RzPageControl1: TRzPageControl;
    TS_Itens: TRzTabSheet;
    TS_Talao: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    Panel2: TPanel;
    Shape1: TShape;
    Label2: TLabel;
    btnGerar: TNxButton;
    Label3: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    Label4: TLabel;
    SMDBGrid2: TSMDBGrid;
    Panel3: TPanel;
    Label5: TLabel;
    btnReimprimir: TNxButton;
    Shape2: TShape;
    Shape3: TShape;
    Label6: TLabel;
    btnExcluir: TNxButton;
    Label7: TLabel;
    ckReimprimir_Baixado: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnGerarClick(Sender: TObject);
    procedure SMDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnReimprimirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    fDMPedido_Talao: TDMPedido_Talao;
    vItem_Talao : Integer;
    vQtdDiv: Integer;
    vQtdPed: Integer;
    vQtdPac: Integer;

    procedure prc_Consultar(Num_Pedido, Item : Integer);
    procedure prc_Gravar_Qtd;
    procedure prc_mEtiqueta;
    procedure prc_Grava_mEtiqueta;
    procedure prc_Gravar_Pedido_Talao;
    procedure prc_Abrir_Talao_Ped(ID, Item, Item_Talao : Integer);
    procedure prc_Grava_Gerou_Talao;
    procedure prc_Consultar_Talao;

    procedure prc_Imprimir;

  public
    { Public declarations }
  end;

var
  frmGerar_Pedido_Talao: TfrmGerar_Pedido_Talao;

implementation

uses rsDBUtils, uUtilPadrao, UConsPed;

{$R *.dfm}

procedure TfrmGerar_Pedido_Talao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmGerar_Pedido_Talao.btnConsultarClick(Sender: TObject);
begin
  if CurrencyEdit1.AsInteger <= 0 then
  begin
    MessageDlg('*** Nº do Pedido não informado!', mtError, [mbOk], 0);
    exit;
  end;
  if RzPageControl1.ActivePage = TS_Itens then
    prc_Consultar(CurrencyEdit1.AsInteger,0)
  else
    prc_Consultar_Talao;
end;

procedure TfrmGerar_Pedido_Talao.FormShow(Sender: TObject);
begin
  fDMPedido_Talao := TDMPedido_Talao.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMPedido_Talao);
  if fDMPedido_Talao.qParametros_LoteQTD_PADRAO_ETIQ.AsInteger > 0 then
    CurrencyEdit2.AsInteger := fDMPedido_Talao.qParametros_LoteQTD_PADRAO_ETIQ.AsInteger;
end;

procedure TfrmGerar_Pedido_Talao.prc_Consultar(Num_Pedido, Item : Integer);
begin
  fDMPedido_Talao.cdsPedidoImp_Itens.Close;
  fDMPedido_Talao.sdsPedidoImp_Itens.CommandText := fDMPedido_Talao.ctPedidoImp_Itens;
  if Item > 0 then
  begin
    fDMPedido_Talao.sdsPedidoImp_Itens.CommandText                   := fDMPedido_Talao.sdsPedidoImp_Itens.CommandText + ' AND PI.ITEM = :ITEM ';
    fDMPedido_Talao.sdsPedidoImp_Itens.ParamByName('ITEM').AsInteger := Item;
  end;
  fDMPedido_Talao.sdsPedidoImp_Itens.ParamByName('NUM_PEDIDO').AsInteger := Num_Pedido;
  fDMPedido_Talao.cdsPedidoImp_Itens.Open;
  fDMPedido_Talao.cdsPedidoImp_Itens.First;
  Label4.Caption := fDMPedido_Talao.cdsPedidoImp_ItensFANTASIA_CLI.AsString;
end;

procedure TfrmGerar_Pedido_Talao.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMPedido_Talao.cdsPedidoImp_ItensGEROU_PED_TALAO.AsString = 'S' then
  begin
    AFont.Color := clBlack;
    if (StrToFloat(FormatFloat('0.0000',fDMPedido_Talao.cdsPedidoImp_ItensQTD_PENDENTE_TAL.AsFloat)) > 0) then
      Background := $00FFFF9F
    else
      Background  := $009FFF9F;
  end;
end;

procedure TfrmGerar_Pedido_Talao.CurrencyEdit2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) and (CurrencyEdit2.AsInteger > 0) then
    prc_Gravar_Qtd;
end;

procedure TfrmGerar_Pedido_Talao.prc_Gravar_Qtd;
begin
  if not(fDMPedido_Talao.cdsPedidoImp_Itens.Active) or (fDMPedido_Talao.cdsPedidoImp_Itens.IsEmpty) then
    exit;
  SMDBGrid1.DisableScroll;
  fDMPedido_Talao.cdsPedidoImp_Itens.First;
  while not fDMPedido_Talao.cdsPedidoImp_Itens.Eof do
  begin
    fDMPedido_Talao.cdsPedidoImp_Itens.Edit;
    fDMPedido_Talao.cdsPedidoImp_ItensQTD_POR_ROTULO.AsInteger := CurrencyEdit2.AsInteger;
    fDMPedido_Talao.cdsPedidoImp_Itens.Post;
    fDMPedido_Talao.cdsPedidoImp_Itens.Next;
  end;
  SMDBGrid1.EnableScroll;
end;

procedure TfrmGerar_Pedido_Talao.CurrencyEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) and (CurrencyEdit1.AsInteger > 0) then
    btnConsultarClick(Sender)
  else
  if (Key = Vk_F2) then
  begin
    frmConsPed := TfrmConsPed.Create(Self);
    frmConsPed.ShowModal;
    if vNum_Pedido_Pos > 0 then
    begin
      CurrencyEdit1.AsInteger := vNum_Pedido_Pos;
      btnConsultarClick(Sender);
    end;
  end;
end;

procedure TfrmGerar_Pedido_Talao.btnGerarClick(Sender: TObject);
var
  vItem : Integer;
begin
  if not(fDMPedido_Talao.cdsPedidoImp_Itens.Active) or (fDMPedido_Talao.cdsPedidoImp_Itens.IsEmpty) then
    exit;
  fDMPedido_Talao.mEtiqueta_Nav.EmptyDataSet;
  fDMPedido_Talao.cdsPedidoImp_Itens.First;
  while not fDMPedido_Talao.cdsPedidoImp_Itens.Eof do
  begin
    if (SMDBGrid1.SelectedRows.CurrentRowSelected) and (StrToFloat(FormatFloat('0.0000',fDMPedido_Talao.cdsPedidoImp_ItensQTD_PENDENTE_TAL.AsFloat)) > 0) then
    begin
      prc_Abrir_Talao_Ped(fDMPedido_Talao.cdsPedidoImp_ItensID.AsInteger,fDMPedido_Talao.cdsPedidoImp_ItensITEM.AsInteger,0);
      fDMPedido_Talao.cdsPedido_Talao.Last;
      vItem_Talao := fDMPedido_Talao.cdsPedido_TalaoITEM_TALAO.AsInteger;
      prc_mEtiqueta;
    end;
    fDMPedido_Talao.cdsPedidoImp_Itens.Next;
  end;
  if fDMPedido_Talao.mEtiqueta_Nav.IsEmpty then
   exit;

  prc_Imprimir;

  vItem := 0;
  fDMPedido_Talao.cdsPedidoImp_Itens.First; 
  fDMPedido_Talao.mEtiqueta_Nav.IndexFieldNames := 'Item_Ped;Item_Talao';
  fDMPedido_Talao.mEtiqueta_Nav.First;
  while not fDMPedido_Talao.mEtiqueta_Nav.Eof do
  begin
    if vItem <> fDMPedido_Talao.mEtiqueta_NavItem_Ped.AsInteger  then
      prc_Abrir_Talao_Ped(fDMPedido_Talao.cdsPedidoImp_ItensID.AsInteger,fDMPedido_Talao.mEtiqueta_NavItem_Ped.AsInteger,0);
    prc_Gravar_Pedido_Talao;
    vItem := fDMPedido_Talao.mEtiqueta_NavItem_Ped.AsInteger;
    fDMPedido_Talao.mEtiqueta_Nav.Next;
    if (fDMPedido_Talao.mEtiqueta_NavItem_Ped.AsInteger <> vItem) or (fDMPedido_Talao.mEtiqueta_Nav.Eof) then
      prc_Grava_Gerou_Talao;
  end;
  prc_Consultar(CurrencyEdit1.AsInteger,0);
end;

procedure TfrmGerar_Pedido_Talao.prc_mEtiqueta;
var
  i: Integer;
  //vQtdDiv: Integer;
  vTexto: String;
  //vQtdPed: Integer;
  //vQtdPac: Integer;
begin
  if (fDMPedido_Talao.cdsPedidoImp_ItensGEROU_PED_TALAO.AsString = 'S') and (StrToFloat(FormatFloat('0.0000',fDMPedido_Talao.cdsPedidoImp_ItensQTD_PENDENTE_TAL.AsFloat)) <= 0) then
  begin
    prc_Abrir_Talao_Ped(fDMPedido_Talao.cdsPedidoImp_ItensID.AsInteger,fDMPedido_Talao.cdsPedidoImp_ItensITEM.AsInteger,0);
    fDMPedido_Talao.cdsPedido_Talao.First;
    while not fDMPedido_Talao.cdsPedido_Talao.Eof do
    begin
      vQtdPed     := fDMPedido_Talao.cdsPedido_TalaoQTD.AsInteger;
      vQtdPac     := fDMPedido_Talao.cdsPedido_TalaoQTD.AsInteger;
      vItem_Talao := fDMPedido_Talao.cdsPedido_TalaoITEM_TALAO.AsInteger;

      prc_Grava_mEtiqueta;
      fDMPedido_Talao.cdsPedido_Talao.Next;
    end;
  end
  else
  begin
    //16/07/2018
    //vQtdPed := fDMPedido_Talao.cdsPedidoImp_ItensQTD.AsInteger;
    //vQtdPac := fDMPedido_Talao.cdsPedidoImp_ItensQTD_POR_ROTULO.AsInteger;
    //vQtdDiv := fDMPedido_Talao.cdsPedidoImp_ItensQTD.AsInteger div fDMPedido_Talao.cdsPedidoImp_ItensQTD_POR_ROTULO.AsInteger;
    //if fDMPedido_Talao.cdsPedidoImp_ItensQTD.AsInteger mod fDMPedido_Talao.cdsPedidoImp_ItensQTD_POR_ROTULO.AsInteger > 0 then
    //  vQtdDiv := vQtdDiv + 1;
    vQtdPed := fDMPedido_Talao.cdsPedidoImp_ItensQTD_PENDENTE_TAL.AsInteger;
    vQtdPac := fDMPedido_Talao.cdsPedidoImp_ItensQTD_POR_ROTULO.AsInteger;
    vQtdDiv := fDMPedido_Talao.cdsPedidoImp_ItensQTD_PENDENTE_TAL.AsInteger div fDMPedido_Talao.cdsPedidoImp_ItensQTD_POR_ROTULO.AsInteger;
    if fDMPedido_Talao.cdsPedidoImp_ItensQTD_PENDENTE_TAL.AsInteger mod fDMPedido_Talao.cdsPedidoImp_ItensQTD_POR_ROTULO.AsInteger > 0 then
      vQtdDiv := vQtdDiv + 1;
    for i := 1 to vQtdDiv do
    begin
      vItem_Talao := vItem_Talao + 1;
      prc_Grava_mEtiqueta;
      if vQtdPed <= 0 then
        vQtdDiv := i;
    end;
  end;
end;

procedure TfrmGerar_Pedido_Talao.prc_Gravar_Pedido_Talao;
begin
  if fDMPedido_Talao.cdsPedido_Talao.Locate('ITEM_TALAO',fDMPedido_Talao.mEtiqueta_NavItem_Talao.AsInteger,[loCaseInsensitive]) then
    exit;
  fDMPedido_Talao.cdsPedido_Talao.Insert;
  fDMPedido_Talao.cdsPedido_TalaoID.AsInteger := fDMPedido_Talao.cdsPedidoImp_ItensID.AsInteger;
  fDMPedido_Talao.cdsPedido_TalaoITEM.AsInteger := fDMPedido_Talao.mEtiqueta_NavItem_Ped.AsInteger;
  fDMPedido_Talao.cdsPedido_TalaoITEM_TALAO.AsInteger := fDMPedido_Talao.mEtiqueta_NavItem_Talao.AsInteger;
  fDMPedido_Talao.cdsPedido_TalaoQTD.AsInteger        := fDMPedido_Talao.mEtiqueta_NavQtd.AsInteger;
  fDMPedido_Talao.cdsPedido_TalaoCODBARRA.AsString    := fDMPedido_Talao.mEtiqueta_NavCodBarra.AsString;
  fDMPedido_Talao.cdsPedido_TalaoDTBAIXA.Clear;
  fDMPedido_Talao.cdsPedido_TalaoHRBAIXA.Clear;
  fDMPedido_Talao.cdsPedido_TalaoDTEMISSAO.AsDateTime := Date;
  fDMPedido_Talao.cdsPedido_TalaoHREMISSAO.AsDateTime := Now;
  fDMPedido_Talao.cdsPedido_Talao.Post;
end;

procedure TfrmGerar_Pedido_Talao.prc_Abrir_Talao_Ped(ID, Item, Item_Talao : Integer);
begin
  fDMPedido_Talao.cdsPedido_Talao.Close;
  fDMPedido_Talao.sdsPedido_Talao.CommandText := fDMPedido_Talao.ctPedido_Talao;
  if Item_Talao > 0 then
  begin
    fDMPedido_Talao.sdsPedido_Talao.CommandText := fDMPedido_Talao.sdsPedido_Talao.CommandText + ' AND ITEM_TALAO = :ITEM_TALAO ';
    fDMPedido_Talao.sdsPedido_Talao.ParamByName('ITEM_TALAO').AsInteger := Item_Talao;
  end;
  fDMPedido_Talao.sdsPedido_Talao.ParamByName('ID').AsInteger   := ID;
  fDMPedido_Talao.sdsPedido_Talao.ParamByName('ITEM').AsInteger := Item;
  fDMPedido_Talao.cdsPedido_Talao.Open;
end;

procedure TfrmGerar_Pedido_Talao.prc_Grava_Gerou_Talao;
begin
  fDMPedido_Talao.cdsPedidoImp_Itens.Locate('ITEM',fDMPedido_Talao.cdsPedido_TalaoITEM.AsInteger,[loCaseInsensitive]);

  fDMPedido_Talao.cdsPedido_Itens.Close;
  fDMPedido_Talao.sdsPedido_Itens.ParamByName('ID').AsInteger   := fDMPedido_Talao.cdsPedido_TalaoID.AsInteger;
  fDMPedido_Talao.sdsPedido_Itens.ParamByName('ITEM').AsInteger := fDMPedido_Talao.cdsPedido_TalaoITEM.AsInteger;
  fDMPedido_Talao.cdsPedido_Itens.Open;
  if fDMPedido_Talao.cdsPedido_Itens.IsEmpty then
    exit;
  fDMPedido_Talao.cdsPedido_Itens.Edit;
  fDMPedido_Talao.cdsPedido_ItensGEROU_PED_TALAO.AsString := 'S';
  fDMPedido_Talao.cdsPedido_ItensQTD_POR_ROTULO.AsInteger := fDMPedido_Talao.cdsPedidoImp_ItensQTD_POR_ROTULO.AsInteger;
  fDMPedido_Talao.cdsPedido_Itens.Post;
  fDMPedido_Talao.cdsPedido_Itens.ApplyUpdates(0);

  fDMPedido_Talao.cdsPedido_Talao.ApplyUpdates(0);
end;

procedure TfrmGerar_Pedido_Talao.prc_Grava_mEtiqueta;
begin
  fDMPedido_Talao.mEtiqueta_Nav.Insert;
  fDMPedido_Talao.mEtiqueta_NavReferencia.AsString   := fDMPedido_Talao.cdsPedidoImp_ItensREFERENCIA.AsString;
  fDMPedido_Talao.mEtiqueta_NavNome_Produto.AsString := fDMPedido_Talao.cdsPedidoImp_ItensNOMEPRODUTO.AsString;
  fDMPedido_Talao.mEtiqueta_NavNum_Pedido.AsInteger  := fDMPedido_Talao.cdsPedidoImp_ItensNUM_PEDIDO.AsInteger;
  fDMPedido_Talao.mEtiqueta_NavItem_Ped.AsInteger    := fDMPedido_Talao.cdsPedidoImp_ItensITEM.AsInteger;
  fDMPedido_Talao.mEtiqueta_NavItem_Talao.AsInteger  := vItem_Talao;
  if (fDMPedido_Talao.cdsPedidoImp_ItensIMP_COR_CLIENTE.AsString = 'S') and (fDMPedido_Talao.cdsPedidoImp_ItensID_COR.AsInteger > 0) and
     (fDMPedido_Talao.cdsPedidoImp_ItensCOD_COR_CLIENTE.AsString <> '') then
  begin
    fDMPedido_Talao.mEtiqueta_NavNome_Produto.AsString := fDMPedido_Talao.cdsPedidoImp_ItensNOMEPRODUTO.AsString + ' ' + fDMPedido_Talao.cdsPedidoImp_ItensCOD_COR_CLIENTE.AsString
                      + ' ' + fDMPedido_Talao.cdsPedidoImp_ItensNOME_COR_CLIENTE.AsString;
    if (trim(fDMPedido_Talao.cdsPedidoImp_ItensTAMANHO_CLIENTE.AsString) <> '') and (trim(fDMPedido_Talao.cdsPedidoImp_ItensTAMANHO_CLIENTE.AsString) <> '0') then
      fDMPedido_Talao.mEtiqueta_NavNome_Produto.AsString := fDMPedido_Talao.mEtiqueta_NavNome_Produto.AsString + ' TAM. ' + fDMPedido_Talao.cdsPedidoImp_ItensTAMANHO_CLIENTE.AsString;
  end
  else
  if fDMPedido_Talao.cdsPedidoImp_ItensID_COR.AsInteger > 0 then
    fDMPedido_Talao.mEtiqueta_NavNome_Produto.AsString := fDMPedido_Talao.mEtiqueta_NavNome_Produto.AsString + ' ' + fDMPedido_Talao.cdsPedidoImp_ItensNOME_COR_COMBINACAO.AsString;
  fDMPedido_Talao.mEtiqueta_NavTamanho.AsString      := fDMPedido_Talao.cdsPedidoImp_ItensTAMANHO.AsString;
  fDMPedido_Talao.mEtiqueta_NavNumOS.AsString        := fDMPedido_Talao.cdsPedidoImp_ItensNUMOS.AsString;
  fDMPedido_Talao.mEtiqueta_NavUnidade.AsString      := fDMPedido_Talao.cdsPedidoImp_ItensUNIDADE.AsString;
  if fDMPedido_Talao.cdsPedidoImp_ItensENCERADO.AsString = 'S' then
  begin
    fDMPedido_Talao.mEtiqueta_NavEncerado.AsString   := 'encerado';
    fDMPedido_Talao.mEtiqueta_NavReferencia.AsString := fDMPedido_Talao.mEtiqueta_NavReferencia.AsString + '-E';
  end
  else
    fDMPedido_Talao.mEtiqueta_NavEncerado.AsString     := '';
  if trim(fDMPedido_Talao.cdsPedidoImp_ItensCOD_PRODUTO_CLIENTE.AsString) <> '' then
    fDMPedido_Talao.mEtiqueta_NavProd_Cliente.AsString := fDMPedido_Talao.cdsPedidoImp_ItensCOD_PRODUTO_CLIENTE.AsString
  else
  begin
    fDMPedido_Talao.mEtiqueta_NavProd_Cliente.AsString := fnc_Busca_CodProduto_Cliente(fDMPedido_Talao.cdsPedidoImp_ItensID_PRODUTO.AsInteger,
                                                                                    fDMPedido_Talao.cdsPedidoImp_ItensID_CLIENTE.AsInteger,
                                                                                    fDMPedido_Talao.cdsPedidoImp_ItensID_COR.AsInteger,'',
                                                                                    fDMPedido_Talao.cdsPedidoImp_ItensTAMANHO_CLIENTE.AsString);
  end;
  fDMPedido_Talao.mEtiqueta_NavDtEmissao.AsDateTime    := fDMPedido_Talao.cdsPedidoImp_ItensDTEMISSAO.AsDateTime;
  fDMPedido_Talao.mEtiqueta_NavNome_Empresa.AsString   := fDMPedido_Talao.cdsPedidoImp_ItensNOME_INTERNO_FIL.AsString;
  fDMPedido_Talao.mEtiqueta_NavNome_Cliente.AsString   := fDMPedido_Talao.cdsPedidoImp_ItensNOME_CLI.AsString;
  fDMPedido_Talao.mEtiqueta_NavFantasia_Cli.AsString   := fDMPedido_Talao.cdsPedidoImp_ItensFANTASIA_CLI.AsString;
  fDMPedido_Talao.mEtiqueta_NavPedido_Cliente.AsString := fDMPedido_Talao.cdsPedidoImp_ItensPEDIDO_CLIENTE.AsString;
  fDMPedido_Talao.mEtiqueta_NavCodBarra.AsString       := '21' + FormatFloat('000000',fDMPedido_Talao.cdsPedidoImp_ItensNUM_PEDIDO.AsInteger) 
                                                        + FormatFloat('000',fDMPedido_Talao.cdsPedidoImp_ItensITEM.AsInteger)
                                                        + FormatFloat('000',fDMPedido_Talao.mEtiqueta_NavItem_Talao.AsInteger);
  if vQtdPed > vQtdPac then
    fDMPedido_Talao.mEtiqueta_NavQtd.AsInteger := vQtdPac
  else
    fDMPedido_Talao.mEtiqueta_NavQtd.AsInteger := vQtdPed;
  //fDMPedido_Talao.mEtiqueta_Nav.Post;
  vQtdPed := vQtdPed - vQtdPac;
  //if vQtdPed <= 0 then
  //  vQtdDiv := i;
  if fDMPedido_Talao.mEtiqueta_Nav.State in [dsEdit,dsInsert] then
    fDMPedido_Talao.mEtiqueta_Nav.Post;
end;

procedure TfrmGerar_Pedido_Talao.prc_Consultar_Talao;
begin
  fDMPedido_Talao.cdsConsulta_Talao.Close;
  fDMPedido_Talao.sdsConsulta_Talao.ParamByName('NUM_PEDIDO').AsInteger := CurrencyEdit1.AsInteger;
  fDMPedido_Talao.cdsConsulta_Talao.Open;
end;

procedure TfrmGerar_Pedido_Talao.SMDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if not(fDMPedido_Talao.cdsConsulta_TalaoDTBAIXA.IsNull) then
  begin
    Background  := $009FFF9F;
    AFont.Color := clBlack;
  end;
end;

procedure TfrmGerar_Pedido_Talao.btnReimprimirClick(Sender: TObject);
begin
  if not(fDMPedido_Talao.cdsConsulta_TalaoDTBAIXA.IsNull) and
     not(ckReimprimir_Baixado.Checked) then
  begin
    MessageDlg('*** Talão já foi baixado, não pode ser reimpresso!', mtError, [mbOk], 0);
    exit;
  end;

  fDMPedido_Talao.mEtiqueta_Nav.EmptyDataSet;
  SMDBGrid2.DisableScroll;
  fDMPedido_Talao.cdsConsulta_Talao.First;
  while not fDMPedido_Talao.cdsConsulta_Talao.Eof do
  begin
    if (SMDBGrid2.SelectedRows.CurrentRowSelected) then
    begin
      vQtdPed     := fDMPedido_Talao.cdsConsulta_TalaoQTD.AsInteger;
      vQtdPac     := fDMPedido_Talao.cdsConsulta_TalaoQTD.AsInteger;
      vItem_Talao := fDMPedido_Talao.cdsConsulta_TalaoITEM_TALAO.AsInteger;

      prc_Consultar(fDMPedido_Talao.cdsConsulta_TalaoNUM_PEDIDO.AsInteger,fDMPedido_Talao.cdsConsulta_TalaoITEM.AsInteger);

      prc_Grava_mEtiqueta;
    end;
    fDMPedido_Talao.cdsConsulta_Talao.Next;
  end;
  SMDBGrid2.EnableScroll;

  if fDMPedido_Talao.mEtiqueta_Nav.IsEmpty then
   exit;

  prc_Imprimir;

  ckReimprimir_Baixado.Checked := False;
end;

procedure TfrmGerar_Pedido_Talao.prc_Imprimir;
var
  vArq : String;
begin
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Talao_Pedido.fr3';
  if FileExists(vArq) then
    fDMPedido_Talao.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    ShowMessage('Relatorio não localizado! ' + vArq);
    Exit;
  end;
  fDMPedido_Talao.frxReport1.ShowReport;

end;

procedure TfrmGerar_Pedido_Talao.btnExcluirClick(Sender: TObject);
var
  vMSGAux : widestring;
  vContador : Integer;
begin
  if not(fDMPedido_Talao.cdsConsulta_TalaoDTBAIXA.IsNull) then
  begin
    MessageDlg('*** Talão já foi baixado, não pode ser excluído!', mtError, [mbOk], 0);
    exit;
  end;

  if MessageDlg('Deseja excluir as Etiquetas selecionadas?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  vMSGAux   := '';
  vContador := 0;
  fDMPedido_Talao.mEtiqueta_Nav.EmptyDataSet;
  SMDBGrid2.DisableScroll;
  fDMPedido_Talao.cdsConsulta_Talao.First;
  while not fDMPedido_Talao.cdsConsulta_Talao.Eof do
  begin
    if (SMDBGrid2.SelectedRows.CurrentRowSelected) then
    begin
      prc_Abrir_Talao_Ped(fDMPedido_Talao.cdsConsulta_TalaoID.AsInteger,fDMPedido_Talao.cdsConsulta_TalaoITEM.AsInteger,fDMPedido_Talao.cdsConsulta_TalaoITEM_TALAO.AsInteger);
      if not(fDMPedido_Talao.cdsPedido_Talao.IsEmpty) and not(fDMPedido_Talao.cdsPedido_TalaoDTBAIXA.IsNull) then
        vMSGAux := vMSGAux + #13 + 'Item: ' + fDMPedido_Talao.cdsConsulta_TalaoITEM.AsString + '  Talão: ' + fDMPedido_Talao.cdsConsulta_TalaoITEM_TALAO.AsString
      else
      begin
        fDMPedido_Talao.cdsPedido_Talao.Delete;
        fDMPedido_Talao.cdsPedido_Talao.ApplyUpdates(0);
        vContador := vContador + 1;
      end;
    end;
    fDMPedido_Talao.cdsConsulta_Talao.Next;
  end;
  prc_Consultar_Talao;
  if vContador > 0 then
    prc_Consultar(CurrencyEdit1.AsInteger,0);
  SMDBGrid2.EnableScroll;
  if trim(vMSGAux) <> '' then
    vMSGAux := '*** Etiquetas Não Excluídas ' + vMSGAux;
  vMSGAux := vMSGAux + #13 + #13 + ' Etiquetas Excluídas: ' + IntToStr(vContador);
  MessageDlg(vMSGAux, mtInformation, [mbOk], 0);
end;

procedure TfrmGerar_Pedido_Talao.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Key = 87) then //W
    ckReimprimir_Baixado.Visible := not(ckReimprimir_Baixado.Visible);
end;

end.
