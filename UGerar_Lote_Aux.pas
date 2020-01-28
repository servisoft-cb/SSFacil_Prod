unit UGerar_Lote_Aux;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, SMDBGrid, UDMCadLote, NxCollection,
  RzPanel, SqlExpr, dbXPress, StdCtrls, UDMEstoque_Res, UDMEstoque, DB;

type
  TfrmGerar_Lote_Aux = class(TForm)
    SMDBGrid1: TSMDBGrid;
    Panel1: TPanel;
    NxSplitter1: TNxSplitter;
    RzGroupBox3: TRzGroupBox;
    SMDBGrid3: TSMDBGrid;
    NxSplitter2: TNxSplitter;
    btnConfirmar: TNxButton;
    StaticText1: TStaticText;
    NxFlipPanel1: TNxFlipPanel;
    NxButton1: TNxButton;
    SMDBGrid2: TSMDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure NxButton1Click(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }
    vNumLote : Integer;
    vNumOrdem : Integer;
    vID_Lote_Mat_Prod, vItem_Lote_Mat_Prod : Integer;
    vID_Material_Pri : Integer;
    vID_Cor_Mat_Pri : Integer;
    vID_Cor_Mat_Pri2 : Integer;
    vConsumo_Pri : Real;
    vID_Material_Pri2 : Integer;
    vConsumo_Pri2 : Real;
    vID_BaixaProcesso : Integer;
    vTipo : String;
    vCont : Integer;

    fDMEstoque_Res: TDMEstoque_Res;
    fDMEstoque: TDMEstoque;

    procedure prc_Gravar_Lote(Tipo_Lote : String);
    procedure prc_Le_Consumo(Tipo : String); //P= Produto Pedido   S= Semi Acabado
    procedure prc_Le_Processo_Grupo_Item(Tipo : String); //S= Semi Acabado   L=Lote     P=Pedido
    procedure prc_Le_Consumo2;
    procedure prc_UsaEstoque;
    procedure prc_Gerar_Estoque_Res;
    procedure prc_Gerar_Estoque;
    procedure prc_Gravar_Lote_Mat_Prod;
    procedure prc_Grava_BaixaProcesso(ID_Processo : Integer);

  public
    { Public declarations }
    fDMCadLote: TDMCadLote;

  end;

var
  frmGerar_Lote_Aux: TfrmGerar_Lote_Aux;

implementation

uses rsDBUtils, DmdDatabase, UGerar_Lote_AuxEst;

{$R *.dfm}

procedure TfrmGerar_Lote_Aux.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if fDMCadLote.qParametros_LoteRESERVA_EST_LOTE.AsString = 'S' then
    FreeAndNil(fDMEstoque_Res)
  else
    FreeAndNil(fDMEstoque);
  Action := Cafree;
end;

procedure TfrmGerar_Lote_Aux.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMCadLote);
  NxFlipPanel1.Expanded := False;
  if fDMCadLote.qParametros_LoteRESERVA_EST_LOTE.AsString = 'S' then
    fDMEstoque_Res := TDMEstoque_Res.Create(Self)
  else
    fDMEstoque := TDMEstoque.Create(Self);
end;

procedure TfrmGerar_Lote_Aux.NxButton1Click(Sender: TObject);
begin
  fDMCadLote.cdsEstoque_Semi.Close;
  fDMCadLote.cdsEstoque_Semi.Open;
end;

procedure TfrmGerar_Lote_Aux.btnConfirmarClick(Sender: TObject);
var
  ID: TTransactionDesc;
  sds: TSQLDataSet;
begin
  vNumLote  := 0;
  vNumOrdem := 0;
  vID_BaixaProcesso := 0;
  fDMCadLote.cdsBaixa_Processo.Close;

  fDMCadLote.vGerado := False;

  sds := TSQLDataSet.Create(nil);
  ID.TransactionID  := 1;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText := ' UPDATE TABELALOC SET FLAG = 1 WHERE TABELA = ' + QuotedStr('LOTE');
    sds.ExecSQL();

    //21/11/2019
    vID_Lote_Mat_Prod   := 0;
    vItem_Lote_Mat_Prod := 0;
    fDMCadLote.prc_Abrir_Lote_Mat_Prod(vNumOrdem);
    //****************

    fDMCadLote.mAuxLote.First;
    while not fDMCadLote.mAuxLote.Eof do
    begin
      //30/09/2018  Foi incluido o Tipo do Lote nos Parâmetros e também gerar o Lote do Estoque
      prc_Gravar_Lote(fDMCadLote.mAuxLoteTipo_Lote.AsString);
      //if (StrToFloat(FormatFloat('0.0000',fDMCadLote.mAuxLoteQtd_Estoque_Usa.AsFloat)) > 0) and (fDMCadLote.mAuxLoteTipo_Lote.AsString <> 'S') then
      if (StrToFloat(FormatFloat('0.0000',fDMCadLote.mAuxLoteQtd_Estoque_Usa.AsFloat)) > 0) then
        prc_Gravar_Lote('E');
      fDMCadLote.mAuxLote.Next;
    end;

    fDMCadLote.mAuxPed.First;
    while not fDMCadLote.mAuxPed.eof do
    begin
      prc_Le_Processo_Grupo_Item('P');
      prc_Le_Consumo2;
      fDMCadLote.mAuxPed.Next;
    end;

    fDMCadLote.prc_Abrir_Lote_Mat(vNumOrdem);
    fDMCadLote.prc_Abrir_Lote_Ting(vNumOrdem);
    fDMCadLote.mMaterial.First;
    while not fDMCadLote.mMaterial.Eof do
    begin
      fDMCadLote.prc_Gravar_Lote_Mat;
      if fDMCadLote.mMaterialTingimento.AsString = 'S' then
        fDMCadLote.prc_Gravar_Lote_Ting;
      fDMCadLote.mMaterial.Next;
    end;
  
    fDMCadLote.cdsLote_Mat.ApplyUpdates(0);
    fDMCadLote.cdsLote_Mat_Prod.ApplyUpdates(0);
    fDMCadLote.cdsLote_Ting.ApplyUpdates(0);

    fDMCadLote.cdsLote.ApplyUpdates(0);

    fDMCadLote.cdsBaixa_Processo.ApplyUpdates(0);
    MessageDlg('*** Lotes/Talões Gerados!', mtInformation, [mbok], 0);
    dmDatabase.scoDados.Commit(ID);

    fDMCadLote.vGerado := True;
  except
    dmDatabase.scoDados.Rollback(ID);
    raise;
  end;
  FreeAndNil(sds);
  if fDMCadLote.vGerado then
    Close;
end;

procedure TfrmGerar_Lote_Aux.prc_Gravar_Lote(Tipo_Lote : String);
var
  vData: TDateTime;
  vID_CombinacaoAux: Integer;
  vNumPedAux: Integer;
  vIDProdAux : Integer;
  vRefAux : String;
  vID_Cliente : Integer;

  vCompleto : String;
  vQtdAux : Real;
  vTipoAux :String;
begin
  fDMCadLote.prc_Inserir;

  fDMCadLote.cdsLoteQTD_TALOES.AsInteger     := 1;
  fDMCadLote.cdsLoteDTEMISSAO.AsDateTime     := Date;
  fDMCadLote.cdsLoteHREMISSAO.AsDateTime     := Now;
  fDMCadLote.cdsLoteID_PRODUTO.AsInteger     := fDMCadLote.mAuxLoteID_Produto.AsInteger;
  //fDMCadLote.cdsLoteID_PRODUTO_PRI.AsInteger := fDMCadLote.mAuxLoteID_Produto_Pri.AsInteger;
  fDMCadLote.cdsLoteREFERENCIA.AsString      := fDMCadLote.mAuxLoteReferencia.AsString;
  fDMCadLote.cdsLoteID_COMBINACAO.AsInteger := fDMCadLote.mAuxLoteID_Combinacao.AsInteger;
  fDMCadLote.cdsLoteCARIMBO.AsString        := '';
  fDMCadLote.cdsLoteNUM_PEDIDO.AsInteger    := fDMCadLote.mAuxLoteNum_Pedido.AsInteger;
  fDMCadLote.cdsLoteID_CLIENTE.AsInteger    := fDMCadLote.mAuxLoteID_Cliente.AsInteger;
  fDMCadLote.cdsLoteDTENTREGA.AsDateTime    := fDMCadLote.mAuxLoteDtEntrega.AsDateTime;
  fDMCadLote.cdsLoteFILIAL.AsInteger        := fDMCadLote.cdsPendenteFILIAL.AsInteger;
  if Tipo_Lote = 'E' then
  begin
    fDMCadLote.cdsLoteQTD.AsFloat := fDMCadLote.mAuxLoteQtd_Estoque_Usa.AsFloat;
    fDMCadLote.cdsLoteTIPO_LOTE_ESTOQUE.AsString := fDMCadLote.mAuxLoteTipo_Lote.AsString;
  end
  else
    fDMCadLote.cdsLoteQTD.AsFloat := fDMCadLote.mAuxLoteQtd.AsFloat;
  fDMCadLote.cdsLoteQTD_PRODUZIDO.AsFloat := 0;
  fDMCadLote.cdsLoteNOME.AsString         := '';
  if vNumLote <= 0 then
  begin
    fDMCadLote.qProximo_Lote.Close;
    fDMCadLote.qProximo_Lote.Open;
    vNumLote := fDMCadLote.qProximo_LoteNUM_LOTE.AsInteger;
  end;
  vNumLote := vNumLote + 1;
  if vNumOrdem <= 0 then
  begin
    fDMCadLote.qProxima_Ordem.Close;
    fDMCadLote.qProxima_Ordem.Open;
    vNumOrdem := fDMCadLote.qProxima_OrdemNUM_ORDEM.AsInteger + 1;
  end;
  fDMCadLote.cdsLoteNUM_LOTE.AsInteger  := vNumLote;
  fDMCadLote.cdsLoteNUM_ORDEM.AsInteger := vNumOrdem;
  //fDMCadLote.cdsLoteQTD_ORIGINAL.AsFloat := fDMCadLote.mAuxLoteQtd.AsFloat;
  if Tipo_Lote <> 'E' then
  begin
    fDMCadLote.cdsLoteQTD_ORIGINAL.AsFloat := fDMCadLote.mAuxLoteQtd_Original.AsFloat;
    fDMCadLote.cdsLoteQTD_PARES.AsFloat    := fDMCadLote.mAuxLoteQtd_Pares.AsFloat;
    fDMCadLote.cdsLoteID_PROCESSO_GRUPO.AsInteger := fDMCadLote.mAuxLoteID_Processo_Grupo.AsInteger;
  end;
  fDMCadLote.cdsLoteOBS_PED.AsString := fDMCadLote.mAuxLoteObs_Pedido.AsString;

  {if fDMCadLote.mAuxLoteTipo_Reg_Prod.AsString <> 'S' then
  begin
    fDMCadLote.mAuxLote_Ped.First;
    while not fDMCadLote.mAuxLote_Ped.Eof do
    begin
      fDMCadLote.cdsConsumo.Close;
      fDMCadLote.sdsConsumo.ParamByName('ID_PRODUTO').AsInteger := fDMCadLote.mAuxLote_PedID_Produto.AsInteger;
      fDMCadLote.cdsConsumo.Open;
      prc_Le_Consumo('P');
      fDMCadLote.mAuxLote_Ped.Next;
    end;
  end;}

  if Tipo_Lote <> 'E' then
  begin
    //20/11/2018
    vTipoAux := 'A';
    if (fDMCadLote.mAuxLoteTipo_Mat.AsString = 'P') or (fDMCadLote.mAuxLoteTipo_Mat.AsString = 'R') or
       (fDMCadLote.mAuxLoteTipo_Mat.AsString = 'O') or (fDMCadLote.mAuxLoteTipo_Mat.AsString = 'C') then
      vTipoAux := 'P';
    //if ((fDMCadLote.mAuxLoteTipo_Mat.AsString = 'A') and (fDMCadLote.mAuxLoteID_Combinacao.AsInteger <= 0))
    //  or (fDMCadLote.mAuxLoteTipo_Mat.AsString = 'P') then
    if ((vTipoAux = 'A') and (fDMCadLote.mAuxLoteID_Combinacao.AsInteger <= 0)) or (vTipoAux = 'P') then
    begin
      fDMCadLote.cdsConsumo.Close;
      fDMCadLote.sdsConsumo.ParamByName('ID_PRODUTO').AsInteger    := fDMCadLote.mAuxLoteID_Produto.AsInteger;
      //20/11/2018
      //if (fDMCadLote.mAuxLoteTipo_Mat.AsString = 'A') and (fDMCadLote.mAuxLoteID_Combinacao.AsInteger <= 0) then
      if (vTipoAux = 'A') and (fDMCadLote.mAuxLoteID_Combinacao.AsInteger <= 0) then
        fDMCadLote.sdsConsumo.ParamByName('ID_COMBINACAO').AsInteger := fDMCadLote.qParametros_LoteID_COR_CRU.AsInteger
      else
        fDMCadLote.sdsConsumo.ParamByName('ID_COMBINACAO').AsInteger := fDMCadLote.mAuxLoteID_Combinacao.AsInteger;
      fDMCadLote.cdsConsumo.Open;
      prc_Le_Consumo('S');
    end;
    if (fDMCadLote.mAuxLoteTipo_Lote.AsString = 'S') and (vID_Material_Pri > 0) then
    begin
      fDMCadLote.cdsLoteID_MATERIAL.AsInteger := vID_Material_Pri;
      fDMCadLote.cdsLoteID_COR_MAT.AsInteger  := vID_Cor_Mat_Pri;
      fDMCadLote.cdsLoteCONSUMO_MAT.AsFloat   := StrToFloat(FormatFloat('0.00000',vConsumo_Pri));
      fDMCadLote.cdsLoteCONSUMO_MAT.AsFloat   := StrToFloat(FormatFloat('0.0000',fDMCadLote.cdsLoteCONSUMO_MAT.AsFloat * fDMCadLote.cdsLoteQTD.AsFloat));
    end;
    if (fDMCadLote.mAuxLoteTipo_Lote.AsString = 'S') and (vID_Material_Pri2 > 0) then
    begin
      fDMCadLote.cdsLoteID_MATERIAL2.AsInteger := vID_Material_Pri2;
      fDMCadLote.cdsLoteID_COR_MAT2.AsInteger  := vID_Cor_Mat_Pri2;
      fDMCadLote.cdsLoteCONSUMO_MAT2.AsFloat   := StrToFloat(FormatFloat('0.00000',vConsumo_Pri2));
      fDMCadLote.cdsLoteCONSUMO_MAT2.AsFloat   := StrToFloat(FormatFloat('0.0000',fDMCadLote.cdsLoteCONSUMO_MAT2.AsFloat * fDMCadLote.cdsLoteQTD.AsFloat));
    end;
  end;

  fDMCadLote.cdsLoteITEM_ORDEM.AsInteger := 1;
  fDMCadLote.cdsLoteCOMPLETO.AsString    := 'S';

  //fDMCadLote.cdsLoteQTD.AsFloat := fDMCadLote.mAuxLoteQtd.AsFloat;
  fDMCadLote.cdsLoteQTD_PENDENTE.AsFloat := StrToFloat(FormatFloat('0.0000',fDMCadLote.cdsLoteQTD.AsFloat));
  if Tipo_Lote = 'E' then
    fDMCadLote.cdsLoteTIPO_LOTE.AsString := 'E'
  else
    fDMCadLote.cdsLoteTIPO_LOTE.AsString   := fDMCadLote.mAuxLoteTipo_Lote.AsString;
  fDMCadLote.cdsLoteUNIDADE.AsString     := fDMCadLote.mAuxLoteUnidade.AsString;
  //fDMCadLote.cdsLoteQTD_ORIGINAL.AsFloat := fDMCadLote.cdsLoteQTD.AsFloat;
  //fDMCadLote.cdsLoteQTD_PARES.AsFloat    := fDMCadLote.mAuxLoteQtd_Pares.AsFloat;
  fDMCadLote.cdsLoteITEM_ORDEM_TOTAL.AsInteger := 1;
  fDMCadLote.cdsLoteENCERADO.AsString          := fDMCadLote.mAuxLoteEncerado.AsString;
  fDMCadLote.cdsLoteNUM_LOTE_CONTROLE.AsString := '';
  if fDMCadLote.cdsLoteTIPO_LOTE.AsString <> 'E' then
    fDMCadLote.cdsLoteQTD_ESTOQUE_USADA.AsFloat := StrToFloat(FormatFloat('0.0000',fDMCadLote.mAuxLoteQtd_Estoque_Usa.AsFloat))
  else
  begin
    fDMCadLote.cdsLoteQTD_ESTOQUE_USADA.AsFloat  := StrToFloat(FormatFloat('0.0000',0));
    fDMCadLote.cdsLoteNUM_LOTE_CONTROLE.AsString := fDMCadLote.mAuxLoteNum_Lote_Controle.AsString;
  end;
  fDMCadLote.cdsLoteCARGA.AsFloat := StrToFloat(FormatFloat('0.00',fDMCadLote.mAuxLoteCarga.AsFloat));
  fDMCadLote.cdsLote.Post;

  if Tipo_Lote = 'E' then
    vQtdAux := StrToFloat(FormatFloat('0.0000',fDMCadLote.mAuxLoteQtd_Estoque_Usa.AsFloat));
  fDMCadLote.mAuxLote_Ped.First;
  while not fDMCadLote.mAuxLote_Ped.Eof do
  begin
    fDMCadLote.cdsLote_Ped.Insert;
    fDMCadLote.cdsLote_PedID_PEDIDO.AsInteger     := fDMCadLote.mAuxLote_PedID_Pedido.AsInteger;
    fDMCadLote.cdsLote_PedITEM_PEDIDO.AsInteger   := fDMCadLote.mAuxLote_PedItem_Pedido.AsInteger;
    if Tipo_Lote = 'E' then
    begin
      if StrToFloat(FormatFloat('0.0000',fDMCadLote.mAuxLote_PedQtd.AsFloat)) >= StrToFloat(FormatFloat('0.0000',vQtdAux)) then
        fDMCadLote.cdsLote_PedQTD.AsFloat := StrToFloat(FormatFloat('0.0000',vQtdAux))
      else
        fDMCadLote.cdsLote_PedQTD.AsFloat := fDMCadLote.mAuxPedQtd.AsFloat;
      vQtdAux := StrToFloat(FormatFloat('0.0000',vQtdAux - fDMCadLote.cdsLote_PedQTD.AsFloat));
      if StrToFloat(FormatFloat('0.0000',vQtdAux)) < 0 then
        vQtdAux := StrToFloat(FormatFloat('0.0000',0));
      //fDMCadLote.cdsLote_PedQTD.AsFloat := fDMCadLote.mAuxLoteQtd_Estoque_Usa.AsFloat;
      fDMCadLote.cdsLote_PedQTD_PARES.AsFloat := fDMCadLote.mAuxLote_PedQtd_Pares.AsFloat;
    end
    else
    begin
      //02/10/2018 alterado para pegar o consumo do pedido
      //fDMCadLote.cdsLote_PedQTD.AsFloat       := fDMCadLote.mAuxLoteQtd.AsFloat;
      fDMCadLote.cdsLote_PedQTD.AsFloat       := fDMCadLote.mAuxPedQtd.AsFloat;
      fDMCadLote.cdsLote_PedQTD_PARES.AsFloat := fDMCadLote.mAuxLote_PedQtd_Pares.AsFloat;
    end;
    fDMCadLote.cdsLote_PedID_CLIENTE.AsInteger    := fDMCadLote.mAuxLoteID_Cliente.AsInteger;
    fDMCadLote.cdsLote_PedNUM_LOTE.AsInteger      := fDMCadLote.cdsLoteNUM_LOTE.AsInteger;
    fDMCadLote.cdsLote_PedBAIXADO.AsString        := 'N';
    fDMCadLote.cdsLote_PedPEDIDO_CLIENTE.AsString := fDMCadLote.mAuxLote_PedPedido_Cliente.AsString;
    fDMCadLote.cdsLote_PedNUM_PEDIDO.AsInteger    := fDMCadLote.mAuxLote_PedNum_Pedido.AsInteger;
    fDMCadLote.cdsLote_Ped.Post;
    fDMCadLote.mAuxLote_Ped.Next;
  end;

  //21/11/2019
  if fDMCadLote.cdsLoteTIPO_LOTE.AsString = 'S' then
    prc_Gravar_Lote_Mat_Prod;
  //**********************

  //30/09/2018  Foi incluido o IF do tipo do Lote
  if fDMCadLote.cdsLoteTIPO_LOTE.AsString <> 'E' then
    prc_Le_Processo_Grupo_Item(fDMCadLote.cdsLoteTIPO_LOTE.AsString)
  else
  begin
    prc_Grava_BaixaProcesso(fDMCadLote.qParametros_LoteID_PROCESSO_EST.AsInteger);
    if fDMCadLote.qParametros_LoteRESERVA_EST_LOTE.AsString = 'S' then
      prc_Gerar_Estoque_Res
    else
      prc_Gerar_Estoque;
  end;
end;

procedure TfrmGerar_Lote_Aux.prc_Le_Consumo(Tipo : String); //P= Produto Pedido   S= Semi Acabado
var
  vID_Cor : Integer;
  vQtdAux : Real;
begin
  vID_Material_Pri  := 0;
  vID_Cor_Mat_Pri   := 0;
  vID_Cor_Mat_Pri2  := 0;
  vConsumo_Pri      := 0;
  vID_Material_Pri2 := 0;
  vConsumo_Pri2     := 0;
  fDMCadLote.cdsConsumo.First;
  while not fDMCadLote.cdsConsumo.Eof do
  begin
    if fDMCadLote.cdsConsumoTIPO_REG_MAT.AsString <> 'S' then
    begin
      if (fDMCadLote.cdsConsumoIMP_TALAO.AsString = 'S') and (Tipo <> 'P')  then
      begin
        if vID_Material_Pri <= 0 then
        begin
          vID_Material_Pri := fDMCadLote.cdsConsumoID_MATERIAL.AsInteger;
          vConsumo_Pri     := StrToFloat(FormatFloat('0.00000',fDMCadLote.cdsConsumoQTD_CONSUMO.AsFloat));
          vID_Cor_Mat_Pri  := fDMCadLote.cdsConsumoID_COR.AsInteger;
        end
        else
        if vID_Material_Pri2 <= 0 then
        begin
          vID_Material_Pri2 := fDMCadLote.cdsConsumoID_MATERIAL.AsInteger;
          vConsumo_Pri2     := StrToFloat(FormatFloat('0.00000',fDMCadLote.cdsConsumoQTD_CONSUMO.AsFloat));
          vID_Cor_Mat_Pri2  := fDMCadLote.cdsConsumoID_COR.AsInteger;
        end;
      end;
      //*************************
      //if (fDMCadLote.cdsConsumoCONT_COR_MAT.AsInteger <= 0) or (fDMCadLote.mAuxLoteID_Combinacao.AsInteger <= 0) then
      //  vID_Cor := 0
      //else
        //vID_Cor := fDMCadLote.mAuxLoteID_Combinacao.AsInteger;
      vID_Cor := fDMCadLote.cdsConsumoID_COR.AsInteger;
      if fDMCadLote.cdsConsumoTIPO_REG_MAT.AsString <> 'S' then
      begin
        if fDMCadLote.mMaterial.Locate('ID_Material;ID_Cor;Tipo_Producao',VarArrayOf([fDMCadLote.cdsConsumoID_MATERIAL.AsInteger,
                                       vID_Cor,fDMCadLote.cdsConsumoTIPO_PRODUCAO.AsString]),[locaseinsensitive]) then
          fDMCadLote.mMaterial.Edit
        else
        begin
          fDMCadLote.mMaterial.Insert;
          fDMCadLote.mMaterialID_Material.AsInteger   := fDMCadLote.cdsConsumoID_MATERIAL.AsInteger;
          fDMCadLote.mMaterialID_Cor.AsInteger        := vID_Cor;
          fDMCadLote.mMaterialTipo_Producao.AsString  := fDMCadLote.cdsConsumoTIPO_PRODUCAO.AsString;
          fDMCadLote.mMaterialNome_Material.AsString  := fDMCadLote.cdsConsumoNOME_MATERIAL.AsString;
          fDMCadLote.mMaterialReferencia_Mat.AsString := fDMCadLote.cdsConsumoREFERENCIA_MAT.AsString;
          fDMCadLote.mMaterialUnidade.AsString        := fDMCadLote.cdsConsumoUNIDADE.AsString;
          fDMCadLote.mMaterialID_Fornecedor.AsInteger := fDMCadLote.cdsConsumoID_FORNECEDOR.AsInteger;
          fDMCadLote.mMaterialTingimento.AsString     := fDMCadLote.cdsConsumoTINGIMENTO.AsString;
          if fDMCadLote.cdsConsumoTINGIMENTO.AsString = 'S' then
            fDMCadLote.mMaterialID_Material_Cru.AsInteger := fDMCadLote.cdsConsumoID_MATERIAL_CRU.AsInteger
          else
            fDMCadLote.mMaterialID_Material_Cru.AsInteger := 0;
        end;
        if Tipo = 'P' then
          vQtdAux := StrToFloat(FormatFloat('0.00000',fDMCadLote.mAuxLote_PedQtd_Pares.AsFloat))
        else
          vQtdAux := StrToFloat(FormatFloat('0.00000',fDMCadLote.mAuxLoteQtd.AsFloat));
        fDMCadLote.mMaterialQtd_Consumo.AsFloat := fDMCadLote.mMaterialQtd_Consumo.AsFloat
                                                 + StrToFloat(FormatFloat('0.0000',(fDMCadLote.cdsConsumoQTD_CONSUMO.AsFloat * vQtdAux)));
        if Tipo = 'P' then
          fDMCadLote.mMaterialQtd_Produto.AsFloat := fDMCadLote.mMaterialQtd_Produto.AsFloat + fDMCadLote.mAuxLoteQtd_Pares.AsFloat
        else
          fDMCadLote.mMaterialQtd_Produto.AsFloat := fDMCadLote.mMaterialQtd_Produto.AsFloat + fDMCadLote.mAuxLoteQtd.AsFloat;

        fDMCadLote.mMaterial.Post;
      end;
    end;
    fDMCadLote.cdsConsumo.Next;
  end;
end;

procedure TfrmGerar_Lote_Aux.prc_Le_Processo_Grupo_Item(Tipo: String);
begin
  fDMCadLote.qProcesso_Grupo_Item.Close;

  if not fDMCadLote.cdsBaixa_Processo.Active then
  begin
    fDMCadLote.cdsBaixa_Processo.Close;
    fDMCadLote.sdsBaixa_Processo.ParamByName('NUM_ORDEM').AsInteger := vNumOrdem;
    fDMCadLote.cdsBaixa_Processo.Open;
  end;

  if (Tipo = 'S') then
  begin
    if fDMCadLote.cdsProduto.Locate('ID',fDMCadLote.cdsLoteID_PRODUTO.AsInteger,[loCaseInsensitive]) then
      fDMCadLote.qProcesso_Grupo_Item.ParamByName('ID').AsInteger := fDMCadLote.cdsProdutoID_PROCESSO_GRUPO.AsInteger
    else
      fDMCadLote.qProcesso_Grupo_Item.ParamByName('ID').AsInteger := 0;
  end
  else
  //22/09/2017
  //if (Tipo = 'P') or (Tipo = 'L') then
  if (Tipo = 'L') then
    fDMCadLote.qProcesso_Grupo_Item.ParamByName('ID').AsInteger := fDMCadLote.cdsLoteID_PROCESSO_GRUPO.AsInteger
  else
  if (Tipo = 'P') then
    fDMCadLote.qProcesso_Grupo_Item.ParamByName('ID').AsInteger := fDMCadLote.mAuxPedID_Processo_Grupo.AsInteger;

  vCont := 0;
  fDMCadLote.qProcesso_Grupo_Item.Open;
  while not fDMCadLote.qProcesso_Grupo_Item.Eof do
  begin
    vCont := vCont + 1;
    vTipo := '';
    if (Tipo = 'S') and (fDMCadLote.qProcesso_Grupo_ItemTIPO.AsString = 'S') then
      vTipo := '1'
    else
    if (Tipo = 'L') and (fDMCadLote.qProcesso_Grupo_ItemTIPO.AsString = 'T') then
      vTipo := '2'
    else
    if (Tipo = 'P') and (fDMCadLote.qProcesso_Grupo_ItemTIPO.AsString = 'P') then
      vTipo := '5';
    if (Tipo = 'L') and (fDMCadLote.qProcesso_Grupo_ItemENCERADO.AsString = 'S') and (fDMCadLote.cdsLoteENCERADO.AsString <> 'S') then
      vTipo := ''
    else
    if (Tipo = 'L') and (fDMCadLote.qProcesso_Grupo_ItemENCERADO.AsString = 'G') and (fDMCadLote.cdsLoteENCERADO.AsString <> 'G') then
      vTipo := '';
    if trim(vTipo) <> '' then
    begin
      if (Tipo = 'S') or (Tipo = 'L') then
      begin
        if fDMCadLote.cdsBaixa_Processo.Locate('ID_LOTE;ID_PROCESSO',VarArrayOf([fDMCadLote.cdsLoteID.AsInteger,fDMCadLote.qProcesso_Grupo_ItemID_PROCESSO.AsInteger]),[locaseinsensitive]) then
        begin
          fDMCadLote.cdsBaixa_Processo.Edit;
          fDMCadLote.cdsBaixa_ProcessoQTD.AsFloat := fDMCadLote.cdsLoteQTD.AsFloat;
          if (vCont = 1) or (StrToFloat(FormatFloat('0.0000',fDMCadLote.cdsBaixa_ProcessoQTD_LIBERADA.AsFloat)) > 0) then
            fDMCadLote.cdsBaixa_ProcessoQTD_LIBERADA.AsFloat := StrToFloat(FormatFloat('0.0000',fDMCadLote.cdsBaixa_ProcessoQTD.AsFloat));
          fDMCadLote.cdsBaixa_ProcessoQTD_PENDENTE.AsFloat := StrToFloat(FormatFloat('0.0000',fDMCadLote.cdsBaixa_ProcessoQTD.AsFloat));
          fDMCadLote.cdsBaixa_Processo.Post;
          vTipo := '';
        end;
      end;

      if trim(vTipo) <> '' then
        prc_Grava_BaixaProcesso(fDMCadLote.qProcesso_Grupo_ItemID_PROCESSO.AsInteger);
    end;
    fDMCadLote.qProcesso_Grupo_Item.Next;
  end;
end;

procedure TfrmGerar_Lote_Aux.prc_Le_Consumo2;
var
  vID_Cor : Integer;
  vQtdAux : Real;
begin
  if fDMCadLote.mAuxPedTipo_Produto_Reg.AsString = 'S' then
    exit;

  fDMCadLote.cdsConsumo.Close;
  fDMCadLote.sdsConsumo.ParamByName('ID_PRODUTO').AsInteger := fDMCadLote.mAuxPedID_Produto.AsInteger;
  fDMCadLote.sdsConsumo.ParamByName('ID_COMBINACAO').AsInteger := fDMCadLote.mAuxPedID_Cor.AsInteger;
  fDMCadLote.cdsConsumo.Open;

  fDMCadLote.cdsConsumo.First;
  while not fDMCadLote.cdsConsumo.Eof do
  begin
    if fDMCadLote.cdsConsumoTIPO_REG_MAT.AsString <> 'S' then
    begin
      //if (fDMCadLote.cdsConsumoCONT_COR_MAT.AsInteger <= 0) or (fDMCadLote.mAuxPedID_Cor.AsInteger <= 0) then
      //  vID_Cor := 0
      //else
      //  vID_Cor := fDMCadLote.mAuxPedID_Cor.AsInteger;
        vID_Cor := fDMCadLote.cdsConsumoID_COR.AsInteger;
      if fDMCadLote.cdsConsumoTIPO_REG_MAT.AsString <> 'S' then
      begin
        if fDMCadLote.mMaterial.Locate('ID_Material;ID_Cor;Tipo_Producao',VarArrayOf([fDMCadLote.cdsConsumoID_MATERIAL.AsInteger,
                                       vID_Cor,fDMCadLote.cdsConsumoTIPO_PRODUCAO.AsString ]),[locaseinsensitive]) then
          fDMCadLote.mMaterial.Edit
        else
        begin
          fDMCadLote.mMaterial.Insert;
          fDMCadLote.mMaterialID_Material.AsInteger   := fDMCadLote.cdsConsumoID_MATERIAL.AsInteger;
          fDMCadLote.mMaterialID_Cor.AsInteger        := vID_Cor;
          fDMCadLote.mMaterialTipo_Producao.AsString  := fDMCadLote.cdsConsumoTIPO_PRODUCAO.AsString;
          fDMCadLote.mMaterialNome_Material.AsString  := fDMCadLote.cdsConsumoNOME_MATERIAL.AsString;
          fDMCadLote.mMaterialReferencia_Mat.AsString := fDMCadLote.cdsConsumoREFERENCIA_MAT.AsString;
          fDMCadLote.mMaterialUnidade.AsString        := fDMCadLote.cdsConsumoUNIDADE.AsString;
          fDMCadLote.mMaterialID_Fornecedor.AsInteger := fDMCadLote.cdsConsumoID_FORNECEDOR.AsInteger;
          fDMCadLote.mMaterialTingimento.AsString     := fDMCadLote.cdsConsumoTINGIMENTO.AsString;
        end;
        vQtdAux := StrToFloat(FormatFloat('0.00000',fDMCadLote.mAuxPedQtd_Pares.AsFloat));
        fDMCadLote.mMaterialQtd_Consumo.AsFloat := fDMCadLote.mMaterialQtd_Consumo.AsFloat
                                                 + StrToFloat(FormatFloat('0.0000',(fDMCadLote.cdsConsumoQTD_CONSUMO.AsFloat * vQtdAux)));
        fDMCadLote.mMaterialQtd_Produto.AsFloat := fDMCadLote.mMaterialQtd_Produto.AsFloat + fDMCadLote.mAuxPedQtd_Pares.AsFloat;
        fDMCadLote.mMaterial.Post;
      end;
    end;
    fDMCadLote.cdsConsumo.Next;
  end;
end;

procedure TfrmGerar_Lote_Aux.SMDBGrid1DblClick(Sender: TObject);
var
  ffrmGerar_Lote_AuxEst: TfrmGerar_Lote_AuxEst;
  vIDAux : Integer;
  vIDProd : Integer;
  vQtdAux : Real;
begin
  //if (StrToFloat(FormatFloat('0.0000',fDMCadLote.mAuxLoteQtd_Estoque.AsFloat)) <= 0) and (fDMCadLote.mAuxLoteTipo_Lote.AsString = 'L') then
  //begin
  //  MessageDlg('*** Não existe estoque para ser aproveitado nesta Referência / Cor !', mtInformation, [mbok], 0);
  //  exit;
  //end;
  if fDMCadLote.mAuxLoteUsa_Estoque.AsString = 'S' then
  begin
    if MessageDlg('Desmarcar que Usa o Estoque' ,mtConfirmation,[mbYes,mbNo],0) = mrYes then
      prc_UsaEstoque;
    exit;
  end;

  //fDMCadLote.prc_SaldoEst(0,fDMCadLote.mAuxLoteID_Produto.AsInteger,fDMCadLote.mAuxLoteID_Combinacao.AsInteger,'','L');
  if (fDMCadLote.mAuxLoteTipo_Lote.AsString = 'S') and (fDMCadLote.mAuxLoteID_Combinacao.AsInteger <= 0) then
    fDMCadLote.prc_SaldoEst(0,fDMCadLote.mAuxLoteID_Produto.AsInteger,StrToInt(FormatFloat('0',fDMCadLote.qParametros_LoteID_COR_CRU.AsInteger)),'','')
  else
    fDMCadLote.prc_SaldoEst(0,fDMCadLote.mAuxLoteID_Produto.AsInteger,fDMCadLote.mAuxLoteID_Combinacao.AsInteger,'','');
  if (fDMCadLote.cdsSaldoEst.IsEmpty) or not(fDMCadLote.vPossui_Saldo) then
  begin
    prc_UsaEstoque;
    exit;
  end;

  if fDMCadLote.mAuxLoteTipo_Lote.AsString = 'S' then
  begin
    SMDBGrid1.DisableScroll;
    vIDAux  := fDMCadLote.mAuxLoteID.AsInteger;
    vIDProd := fDMCadLote.mAuxLoteID_Produto.AsInteger;
    vQtdAux := 0;
    fDMCadLote.mAuxLote.First;
    while not fDMCadLote.mAuxLote.Eof do
    begin
      if (vIDProd = fDMCadLote.mAuxLoteID_Produto.AsInteger) and (fDMCadLote.mAuxLoteTipo_Lote.AsString = 'S') and
        ((fDMCadLote.mAuxLoteID_Combinacao.AsInteger = 0) or (fDMCadLote.mAuxLoteID_Combinacao.AsInteger = fDMCadLote.qParametros_LoteID_COR_CRU.AsInteger)) then
        vQtdAux := StrToFloat(FormatFloat('0.0000',vQtdAux + fDMCadLote.mAuxLoteQtd_Estoque_Usa.AsFloat));
      fDMCadLote.mAuxLote.Next;
    end;
    fDMCadLote.mAuxLote.Locate('ID',vIDAux,[loCaseInsensitive]);
    SMDBGrid1.EnableScroll;
  end;
  ffrmGerar_Lote_AuxEst := TfrmGerar_Lote_AuxEst.Create(self);
  ffrmGerar_Lote_AuxEst.fDMCadLote := fDMCadLote;
  ffrmGerar_Lote_AuxEst.vQtdUsada  := StrToFloat(FormatFloat('0.0000',vQtdAux));
  ffrmGerar_Lote_AuxEst.ShowModal;
  FreeAndNil(ffrmGerar_Lote_AuxEst);
end;

procedure TfrmGerar_Lote_Aux.prc_UsaEstoque;
var
  vQtd : Real;
begin
  if fDMCadLote.cdsProdutoID.AsInteger <> fDMCadLote.mAuxLoteID_Produto.AsInteger then
    fDMCadLote.cdsProduto.Locate('ID',fDMCadLote.mAuxLoteID_Produto.AsInteger,[loCaseInsensitive]);

  fDMCadLote.mAuxLote.Edit;
  if fDMCadLote.mAuxLoteUsa_Estoque.AsString = 'S' then
  begin
    //14/12/2019
    if fDMCadLote.mAuxEst.Locate('ID_Produto;ID_Cor;Num_Lote_Controle',VarArrayOf([fDMCadLote.mAuxLoteID_Produto.AsInteger,
                                  fDMCadLote.mAuxLoteID_Combinacao.AsInteger,fDMCadLote.mAuxLoteNum_Lote_Controle.AsString]),[locaseinsensitive]) then
    begin
      fDMCadLote.mAuxEst.Edit;
      fDMCadLote.mAuxEstQtd.AsFloat := StrToFloat(FormatFloat('0.00000',fDMCadLote.mAuxEstQtd.AsFloat - fDMCadLote.mAuxLoteQtd_Estoque_Usa.AsFloat));
      fDMCadLote.mAuxEst.Post;
      if StrToFloat(FormatFloat('0.00000',fDMCadLote.mAuxEstQtd.AsFloat)) <= 0 then
        fDMCadLote.mAuxEst.Delete;
    end;
    //***********************

    fDMCadLote.mAuxLoteQtd.AsFloat             := StrToFloat(FormatFloat('0.0000',fDMCadLote.mAuxLoteQtd_Original.AsFloat));
    fDMCadLote.mAuxLoteUsa_Estoque.AsString    := 'N';
    fDMCadLote.mAuxLoteQtd_Estoque_Usa.AsFloat := StrToFloat(FormatFloat('0.0000',0));

  end
  else
  begin
    vQtd := 0;
    if StrToFloat(FormatFloat('0.0000',fDMCadLote.mAuxLoteQtd_Estoque.AsFloat)) >= StrToFloat(FormatFloat('0.0000',fDMCadLote.mAuxLoteQtd_Original.AsFloat)) then
      vQtd := StrToFloat(FormatFloat('0.0000',fDMCadLote.mAuxLoteQtd_Original.AsFloat))
    else
      vQtd := StrToFloat(FormatFloat('0.0000',fDMCadLote.mAuxLoteQtd_Estoque.AsFloat));
    fDMCadLote.mAuxLoteQtd.AsFloat             := StrToFloat(FormatFloat('0.0000',fDMCadLote.mAuxLoteQtd_Original.AsFloat - vQtd));
    fDMCadLote.mAuxLoteQtd_Estoque_Usa.AsFloat := StrToFloat(FormatFloat('0.0000',vQtd));
    if StrToFloat(FormatFloat('0.0000',fDMCadLote.mAuxLoteQtd_Estoque_Usa.AsFloat)) > 0 then
      fDMCadLote.mAuxLoteUsa_Estoque.AsString    := 'S';
  end;

  fDMCadLote.prc_Calcula_Carga;

  fDMCadLote.mAuxLote.Post;
end;

procedure TfrmGerar_Lote_Aux.prc_Gerar_Estoque_Res;
var
  vID_MovEstoque_Res : Integer;
  vID_Cor : Integer;
begin
  vID_Cor := fDMCadLote.cdsLoteID_COMBINACAO.AsInteger;
  if (fDMCadLote.cdsLoteTIPO_LOTE.AsString = 'E') and (fDMCadLote.cdsLoteTIPO_LOTE_ESTOQUE.AsString = 'S')
    and (fDMCadLote.cdsLoteID_COMBINACAO.AsInteger <= 0) then
    vID_Cor := fDMCadLote.qParametros_LoteID_COR_CRU.AsInteger;

  vID_MovEstoque_Res := fDMEstoque_Res.fnc_Gravar_Estoque_Res(0,
                                                              fDMCadLote.cdsLoteFILIAL.AsInteger,
                                                              fDMCadLote.cdsLoteID_PRODUTO.AsInteger,
                                                              vID_Cor,
                                                              fDMCadLote.cdsLoteNUM_LOTE.AsInteger,
                                                              '',
                                                              'E',
                                                              'LOT',
                                                              fDMCadLote.cdsLoteQTD.AsFloat,
                                                              Date,
                                                              fDMCadLote.cdsLoteNUM_LOTE_CONTROLE.AsString);
  fDMCadLote.cdsLote.Edit;
  fDMCadLote.cdsLoteID_MOVESTOQUE_RES.AsInteger := vID_MovEstoque_Res;
  fDMCadLote.cdsLote.Post;
end;

procedure TfrmGerar_Lote_Aux.prc_Grava_BaixaProcesso(ID_Processo : Integer);
var
  vItemAux : Integer;
begin
  if vID_BaixaProcesso <= 0 then
    vID_BaixaProcesso := dmDatabase.ProximaSequencia('BAIXA_PROCESSO',0);
  fDMCadLote.cdsBaixa_Processo.Last;
  vItemAux := fDMCadLote.cdsBaixa_ProcessoITEM.AsInteger;
  fDMCadLote.cdsBaixa_Processo.Insert;
  fDMCadLote.cdsBaixa_ProcessoID.AsInteger   := vID_BaixaProcesso;
  fDMCadLote.cdsBaixa_ProcessoITEM.AsInteger := vItemAux + 1;
  fDMCadLote.cdsBaixa_ProcessoID_PROCESSO.AsInteger := ID_Processo;
  if vTipo <> '5' then
    fDMCadLote.cdsBaixa_ProcessoID_LOTE.AsInteger := fDMCadLote.cdsLoteID.AsInteger
  else
  begin
    fDMCadLote.cdsBaixa_ProcessoID_PEDIDO.AsInteger   := fDMCadLote.mAuxPedID_Pedido.AsInteger;
    fDMCadLote.cdsBaixa_ProcessoITEM_PEDIDO.AsInteger := fDMCadLote.mAuxPedItem_Pedido.AsInteger;
  end;
  fDMCadLote.cdsBaixa_ProcessoDTENTRADA.Clear;
  fDMCadLote.cdsBaixa_ProcessoHRENTRADA.Clear;
  fDMCadLote.cdsBaixa_ProcessoDTBAIXA.Clear;
  fDMCadLote.cdsBaixa_ProcessoHRBAIXA.Clear;
  if vTipo <> '5' then
    fDMCadLote.cdsBaixa_ProcessoQTD.AsFloat := fDMCadLote.cdsLoteQTD.AsFloat
  else
    fDMCadLote.cdsBaixa_ProcessoQTD.AsFloat := fDMCadLote.mAuxPedQtd_Pares.AsFloat;

  //17/07/2018
  if StrToFloat(FormatFloat('0.0000',fDMCadLote.cdsBaixa_ProcessoQTD.AsFloat)) <= 0 then
  begin
    fDMCadLote.cdsBaixa_ProcessoDTENTRADA.AsDateTime := Date;
    fDMCadLote.cdsBaixa_ProcessoHRENTRADA.AsDateTime := Now;
    fDMCadLote.cdsBaixa_ProcessoDTBAIXA.AsDateTime   := Date;
    fDMCadLote.cdsBaixa_ProcessoHRBAIXA.AsDateTime   := Now;
  end;
  //**********

  fDMCadLote.cdsBaixa_ProcessoQTD_PRODUZIDO.AsFloat := 0;
  fDMCadLote.cdsBaixa_ProcessoNUM_ORDEM.AsInteger   := vNumOrdem;
  fDMCadLote.cdsBaixa_ProcessoTIPO.AsString         := vTipo;

  //08/08/2018
  fDMCadLote.cdsBaixa_ProcessoQTD_PENDENTE.AsFloat  := StrToFloat(FormatFloat('0.0000',fDMCadLote.cdsBaixa_ProcessoQTD.AsFloat));
  if vCont = 1 then
    fDMCadLote.cdsBaixa_ProcessoQTD_LIBERADA.AsFloat := StrToFloat(FormatFloat('0.0000',fDMCadLote.cdsBaixa_ProcessoQTD.AsFloat));
  //**************
  fDMCadLote.cdsBaixa_Processo.Post;
end;

procedure TfrmGerar_Lote_Aux.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMCadLote.mAuxLoteUsa_Estoque.AsString = 'S' then
  begin
    if Field.FieldName = 'Usa_Estoque' then
    begin
      AFont.Color := clBlue;
      AFont.Style := [fsBold]
    end;
  end;
end;

procedure TfrmGerar_Lote_Aux.prc_Gerar_Estoque;
var
  vID_MovEstoque : Integer;
  vID_Cor : Integer;
begin
  vID_Cor := fDMCadLote.cdsLoteID_COMBINACAO.AsInteger;
  if (fDMCadLote.cdsLoteTIPO_LOTE.AsString = 'E') and (fDMCadLote.cdsLoteTIPO_LOTE_ESTOQUE.AsString = 'S')
    and (fDMCadLote.cdsLoteID_COMBINACAO.AsInteger <= 0) then
    vID_Cor := fDMCadLote.qParametros_LoteID_COR_CRU.AsInteger;


  vID_MovEstoque := fDMEstoque.fnc_Gravar_Estoque(0,
                                                  fDMCadLote.cdsLoteFILIAL.AsInteger,
                                                  1,
                                                  fDMCadLote.cdsLoteID_PRODUTO.AsInteger,
                                                  fDMCadLote.cdsLoteNUM_LOTE.AsInteger, // Numero nota
                                                  0, // Cliente
                                                  0, // CFOP
                                                  0, // ID nota fiscal
                                                  0,
                                                  'S', //Entrada / Saida
                                                  'LOT',
                                                  fDMCadLote.mAuxLoteUnidade.AsString,
                                                  fDMCadLote.mAuxLoteUnidade.AsString,
                                                  '', //serie
                                                  '', //Tamanho
                                                  Date,
                                                  0,
                                                  fDMCadLote.cdsLoteQTD.AsFloat,
                                                  0, //%ICMS
                                                  0, //%IPI
                                                  0, //Desconto
                                                  0, //% Trib ICMS
                                                  0, //Valor Frete
                                                  fDMCadLote.cdsLoteQTD.AsFloat,
                                                  0,
                                                  0, //Desconto
                                                  0,
                                                  fDMCadLote.mAuxLoteUnidade.AsString,
                                                  vID_Cor, // Cor
                                                  fDMCadLote.cdsLoteNUM_LOTE_CONTROLE.AsString,
                                                  'N',
                                                  0,
                                                  0,0,0,0);
                                                   
  fDMCadLote.cdsLote.Edit;
  fDMCadLote.cdsLoteID_MOVESTOQUE.AsInteger := vID_MovEstoque;
  fDMCadLote.cdsLote.Post;
end;

procedure TfrmGerar_Lote_Aux.prc_Gravar_Lote_Mat_Prod;
begin
  fDMCadLote.cdsConsumo.Close;
  fDMCadLote.sdsConsumo.ParamByName('ID_PRODUTO').AsInteger    := fDMCadLote.cdsLoteID_PRODUTO.AsInteger;
  fDMCadLote.sdsConsumo.ParamByName('ID_COMBINACAO').AsInteger := fDMCadLote.cdsLoteID_COMBINACAO.AsInteger;
  fDMCadLote.cdsConsumo.Open;

  fDMCadLote.cdsConsumo.First;
  while not fDMCadLote.cdsConsumo.Eof do
  begin
    if fDMCadLote.cdsLote_Mat_Prod.Locate('REFERENCIA;ID_COR_PRODUTO;ID_MATERIAL;ID_COR_MATERIAL',VarArrayOf([fDMCadLote.cdsLoteREFERENCIA.AsString
                                          ,fDMCadLote.cdsLoteID_COMBINACAO.AsInteger
                                          ,fDMCadLote.cdsConsumoID_MATERIAL.AsInteger
                                          ,fDMCadLote.cdsConsumoID_COR.AsInteger]),[locaseinsensitive]) then
      fDMCadLote.cdsLote_Mat_Prod.Edit
    else
    begin
      if vID_Lote_Mat_Prod <= 0 then
        vID_Lote_Mat_Prod := dmDatabase.ProximaSequencia('LOTE_MAT_PROD',0);
      fDMCadLote.cdsLote_Mat_Prod.Insert;
      fDMCadLote.cdsLote_Mat_ProdID.AsInteger              := vID_Lote_Mat_Prod;
      vItem_Lote_Mat_Prod                                  := vItem_Lote_Mat_Prod + 1;
      fDMCadLote.cdsLote_Mat_ProdITEM.AsInteger            := vItem_Lote_Mat_Prod;
      fDMCadLote.cdsLote_Mat_ProdNUM_ORDEM.AsInteger       := vNumOrdem;
      fDMCadLote.cdsLote_Mat_ProdREFERENCIA.AsString       := fDMCadLote.cdsLoteREFERENCIA.AsString;
      fDMCadLote.cdsLote_Mat_ProdID_COR_PRODUTO.AsInteger  := fDMCadLote.cdsLoteID_COMBINACAO.AsInteger;
      fDMCadLote.cdsLote_Mat_ProdID_MATERIAL.AsInteger     := fDMCadLote.cdsConsumoID_MATERIAL.AsInteger;
      fDMCadLote.cdsLote_Mat_ProdID_COR_MATERIAL.AsInteger := fDMCadLote.cdsConsumoID_COR.AsInteger;
      fDMCadLote.cdsLote_Mat_ProdQTD_CONSUMO.AsFloat       := 0;
    end;
    if fDMCadLote.cdsLote_Mat_ProdNUM_LOTE_AUX.AsInteger <> fDMCadLote.cdsLoteNUM_LOTE.AsInteger then
      fDMCadLote.cdsLote_Mat_ProdQTD_PRODUTO.AsFloat := fDMCadLote.cdsLote_Mat_ProdQTD_PRODUTO.AsFloat + fDMCadLote.cdsLoteQTD.AsFloat;
    fDMCadLote.cdsLote_Mat_ProdQTD_CONSUMO.AsFloat := StrToFloat(FormatFloat('0.0000',fDMCadLote.cdsLote_Mat_ProdQTD_CONSUMO.AsFloat
                                                     + (fDMCadLote.cdsLoteQTD.AsFloat * fDMCadLote.cdsConsumoQTD_CONSUMO.AsFloat)));
    fDMCadLote.cdsLote_Mat_ProdQTD_PAGO.AsFloat      := 0;
    fDMCadLote.cdsLote_Mat_ProdQTD_RETORNO.AsFloat   := 0;
    fDMCadLote.cdsLote_Mat_ProdQTD_DIFERENCA.AsFloat := 0;
    fDMCadLote.cdsLote_Mat_ProdQTD_CONES.AsInteger   := 0;
    fDMCadLote.cdsLote_Mat_ProdDTRETORNO.Clear;
    fDMCadLote.cdsLote_Mat_ProdDTPAGO.Clear;
    fDMCadLote.cdsLote_Mat_ProdNUM_LOTE_AUX.AsInteger := fDMCadLote.cdsLoteNUM_LOTE.AsInteger;
    fDMCadLote.cdsLote_Mat_ProdDTGERACAO.AsDateTime   := fDMCadLote.cdsLoteDTEMISSAO.AsDateTime;
    fDMCadLote.cdsLote_Mat_Prod.Post;
    fDMCadLote.cdsConsumo.Next;
  end;
end;

end.
