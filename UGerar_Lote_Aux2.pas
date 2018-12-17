unit UGerar_Lote_Aux2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, SMDBGrid, UDMCadLote, NxCollection,
  RzPanel, SqlExpr, dbXPress;

type
  TfrmGerar_Lote_Aux2 = class(TForm)
    SMDBGrid1: TSMDBGrid;
    Panel1: TPanel;
    NxSplitter1: TNxSplitter;
    RzGroupBox3: TRzGroupBox;
    SMDBGrid3: TSMDBGrid;
    NxSplitter2: TNxSplitter;
    btnConfirmar: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    vNumLote : Integer;
    vNumOrdem : Integer;
    vID_Material_Pri : Integer;
    vID_Cor_Mat_Pri : Integer;
    vID_Cor_Mat_Pri2 : Integer;
    vConsumo_Pri : Real;
    vID_Material_Pri2 : Integer;
    vConsumo_Pri2 : Real;
    vID_BaixaProcesso : Integer;

    procedure prc_Gravar_Lote;
    procedure prc_Le_Consumo(Tipo : String); //P= Produto Pedido   S= Semi Acabado
    procedure prc_Le_Processo_Grupo_Item(Tipo : String); //S= Semi Acabado   L=Lote     P=Pedido

  public
    { Public declarations }
    fDMCadLote: TDMCadLote;

  end;

var
  frmGerar_Lote_Aux2: TfrmGerar_Lote_Aux2;

implementation

uses rsDBUtils, DB, DmdDatabase;

{$R *.dfm}

procedure TfrmGerar_Lote_Aux2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmGerar_Lote_Aux2.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMCadLote);
end;

procedure TfrmGerar_Lote_Aux2.btnConfirmarClick(Sender: TObject);
var
  ID: TTransactionDesc;
  sds: TSQLDataSet;
begin
  vNumLote  := 0;
  vNumOrdem := 0;
  vID_BaixaProcesso := 0;

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

    fDMCadLote.mAuxLote.First;
    while not fDMCadLote.mAuxLote.Eof do
    begin
      prc_Gravar_Lote;
      fDMCadLote.mAuxLote.Next;
    end;

    fDMCadLote.prc_Abrir_Lote_Mat(vNumOrdem);
    fDMCadLote.mMaterial.First;
    while not fDMCadLote.mMaterial.Eof do
    begin
      fDMCadLote.prc_Gravar_Lote_Mat;
      fDMCadLote.mMaterial.Next;
    end;
  
    fDMCadLote.cdsLote_Mat.ApplyUpdates(0);

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

procedure TfrmGerar_Lote_Aux2.prc_Gravar_Lote;
var
  vData: TDateTime;
  vID_CombinacaoAux: Integer;
  vNumPedAux: Integer;
  vIDProdAux : Integer;
  vRefAux : String;
  vID_Cliente : Integer;

  vCompleto : String;
  vQtdAux : Real;
begin
  fDMCadLote.prc_Inserir;

  fDMCadLote.cdsLoteQTD_TALOES.AsInteger     := 1;
  fDMCadLote.cdsLoteDTEMISSAO.AsDateTime     := Date;
  fDMCadLote.cdsLoteHREMISSAO.AsDateTime     := Now;
  fDMCadLote.cdsLoteID_PRODUTO.AsInteger     := fDMCadLote.mAuxLoteID_Produto.AsInteger;
  fDMCadLote.cdsLoteREFERENCIA.AsString      := fDMCadLote.mAuxLoteReferencia.AsString;
  fDMCadLote.cdsLoteID_COMBINACAO.AsInteger := fDMCadLote.mAuxLoteID_Combinacao.AsInteger;
  fDMCadLote.cdsLoteCARIMBO.AsString        := '';
  fDMCadLote.cdsLoteNUM_PEDIDO.AsInteger    := fDMCadLote.mAuxLoteNum_Pedido.AsInteger;
  fDMCadLote.cdsLoteID_CLIENTE.AsInteger    := fDMCadLote.mAuxLoteID_Cliente.AsInteger;
  fDMCadLote.cdsLoteDTENTREGA.AsDateTime    := fDMCadLote.mAuxLoteDtEntrega.AsDateTime;
  fDMCadLote.cdsLoteFILIAL.AsInteger        := fDMCadLote.cdsPendenteFILIAL.AsInteger;
  fDMCadLote.cdsLoteQTD.AsFloat             := fDMCadLote.mAuxLoteQtd.AsFloat;
  fDMCadLote.cdsLoteQTD_PRODUZIDO.AsFloat   := 0;
  fDMCadLote.cdsLoteNOME.AsString           := '';
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
  fDMCadLote.cdsLoteQTD_ORIGINAL.AsFloat := fDMCadLote.mAuxLoteQtd_Original.AsFloat;
  fDMCadLote.cdsLoteQTD_PARES.AsFloat    := fDMCadLote.mAuxLoteQtd_Pares.AsFloat;
  //fDMCadLote.cdsLoteID_PROCESSO_GRUPO.AsInteger := fDMCadLote.mAuxLoteID_Processo_Grupo.AsInteger;
  fDMCadLote.cdsLoteOBS_PED.AsString := fDMCadLote.mAuxLoteObs_Pedido.AsString;

  fDMCadLote.cdsLoteITEM_ORDEM.AsInteger := 1;
  fDMCadLote.cdsLoteCOMPLETO.AsString    := 'S';

  fDMCadLote.cdsLoteQTD.AsFloat := fDMCadLote.mAuxLoteQtd.AsFloat;
  fDMCadLote.cdsLoteQTD_PENDENTE.AsFloat := StrToFloat(FormatFloat('0.0000',fDMCadLote.cdsLoteQTD.AsFloat));
  fDMCadLote.cdsLoteTIPO_LOTE.AsString   := fDMCadLote.mAuxLoteTipo_Lote.AsString;
  fDMCadLote.cdsLoteUNIDADE.AsString     := fDMCadLote.mAuxLoteUnidade.AsString;
  fDMCadLote.cdsLoteQTD_PARES.AsFloat    := fDMCadLote.mAuxLoteQtd_Pares.AsFloat;
  fDMCadLote.cdsLoteITEM_ORDEM_TOTAL.AsInteger := 1;
  fDMCadLote.cdsLoteENCERADO.AsString          := fDMCadLote.mAuxLoteEncerado.AsString;
  fDMCadLote.cdsLote.Post;

  fDMCadLote.mAuxLote_Ped.First;
  while not fDMCadLote.mAuxLote_Ped.Eof do
  begin
    fDMCadLote.cdsLote_Ped.Insert;
    fDMCadLote.cdsLote_PedID_PEDIDO.AsInteger     := fDMCadLote.mAuxLote_PedID_Pedido.AsInteger;
    fDMCadLote.cdsLote_PedITEM_PEDIDO.AsInteger   := fDMCadLote.mAuxLote_PedItem_Pedido.AsInteger;
    fDMCadLote.cdsLote_PedQTD.AsFloat             := fDMCadLote.mAuxLoteQtd.AsFloat;
    fDMCadLote.cdsLote_PedID_CLIENTE.AsInteger    := fDMCadLote.mAuxLoteID_Cliente.AsInteger;
    fDMCadLote.cdsLote_PedNUM_LOTE.AsInteger      := fDMCadLote.cdsLoteNUM_LOTE.AsInteger;
    fDMCadLote.cdsLote_PedBAIXADO.AsString        := 'N';
    fDMCadLote.cdsLote_PedPEDIDO_CLIENTE.AsString := fDMCadLote.mAuxLote_PedPedido_Cliente.AsString;
    fDMCadLote.cdsLote_PedNUM_PEDIDO.AsInteger    := fDMCadLote.mAuxLote_PedNum_Pedido.AsInteger;
    fDMCadLote.cdsLote_PedQTD_PARES.AsFloat       := fDMCadLote.mAuxLote_PedQtd_Pares.AsFloat;
    fDMCadLote.cdsLote_Ped.Post;
    fDMCadLote.mAuxLote_Ped.Next;
  end;
  prc_Le_Processo_Grupo_Item(fDMCadLote.cdsLoteTIPO_LOTE.AsString);
end;

procedure TfrmGerar_Lote_Aux2.prc_Le_Consumo(Tipo : String); //P= Produto Pedido   S= Semi Acabado
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
        if fDMCadLote.mMaterial.Locate('ID_Material;ID_Cor',VarArrayOf([fDMCadLote.cdsConsumoID_MATERIAL.AsInteger,vID_Cor]),[locaseinsensitive]) then
          fDMCadLote.mMaterial.Edit
        else
        begin
          fDMCadLote.mMaterial.Insert;
          fDMCadLote.mMaterialID_Material.AsInteger   := fDMCadLote.cdsConsumoID_MATERIAL.AsInteger;
          fDMCadLote.mMaterialID_Cor.AsInteger        := vID_Cor;
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

procedure TfrmGerar_Lote_Aux2.prc_Le_Processo_Grupo_Item(Tipo: String);
var
  vTipo : String;
  vItemAux : Integer;
begin
  fDMCadLote.qProcesso.Close;
  fDMCadLote.qProcesso.ParamByName('ID').AsInteger := fDMCadLote.cdsLoteID_PRODUTO.AsInteger;
  fDMCadLote.qProcesso.Open;

  if not fDMCadLote.cdsBaixa_Processo.Active then
  begin
    fDMCadLote.cdsBaixa_Processo.Close;
    fDMCadLote.sdsBaixa_Processo.ParamByName('NUM_ORDEM').AsInteger := vNumOrdem;
    fDMCadLote.cdsBaixa_Processo.Open;
  end;

  while not fDMCadLote.qProcesso.Eof do
  begin
    vTipo := '1';
    if trim(vTipo) <> '' then
    begin
      if fDMCadLote.cdsBaixa_Processo.Locate('ID_LOTE;ID_PROCESSO',VarArrayOf([fDMCadLote.cdsLoteID.AsInteger,fDMCadLote.qProcessoID_PROCESSO.AsInteger]),[locaseinsensitive]) then
      begin
        fDMCadLote.cdsBaixa_Processo.Edit;
        fDMCadLote.cdsBaixa_ProcessoQTD.AsFloat := fDMCadLote.cdsLoteQTD.AsFloat;
        fDMCadLote.cdsBaixa_Processo.Post;
        vTipo := '';
      end;

      if trim(vTipo) <> '' then
      begin
        if vID_BaixaProcesso <= 0 then
          vID_BaixaProcesso := dmDatabase.ProximaSequencia('BAIXA_PROCESSO',0);
        fDMCadLote.cdsBaixa_Processo.Last;
        vItemAux := fDMCadLote.cdsBaixa_ProcessoITEM.AsInteger;
        fDMCadLote.cdsBaixa_Processo.Insert;
        fDMCadLote.cdsBaixa_ProcessoID.AsInteger   := vID_BaixaProcesso;
        fDMCadLote.cdsBaixa_ProcessoITEM.AsInteger := vItemAux + 1;
        fDMCadLote.cdsBaixa_ProcessoID_PROCESSO.AsInteger := fDMCadLote.qProcessoID_PROCESSO.AsInteger;
        fDMCadLote.cdsBaixa_ProcessoID_LOTE.AsInteger := fDMCadLote.cdsLoteID.AsInteger;
        fDMCadLote.cdsBaixa_ProcessoDTENTRADA.Clear;
        fDMCadLote.cdsBaixa_ProcessoHRENTRADA.Clear;
        fDMCadLote.cdsBaixa_ProcessoDTBAIXA.Clear;
        fDMCadLote.cdsBaixa_ProcessoHRBAIXA.Clear;
        fDMCadLote.cdsBaixa_ProcessoQTD.AsFloat := fDMCadLote.cdsLoteQTD.AsFloat;
        fDMCadLote.cdsBaixa_ProcessoQTD_PRODUZIDO.AsFloat := 0;
        fDMCadLote.cdsBaixa_ProcessoNUM_ORDEM.AsInteger   := vNumOrdem;
        fDMCadLote.cdsBaixa_ProcessoTIPO.AsString         := vTipo;
        fDMCadLote.cdsBaixa_Processo.Post;
      end;
    end;
    fDMCadLote.qProcesso.Next;
  end;
end;

end.
