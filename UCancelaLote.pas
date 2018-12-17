unit UCancelaLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMCancelaLote, DBVGrids, Grids, DBGrids, SMDBGrid, StdCtrls,
  NxCollection, RxLookup, NxEdit, CurrEdit, Mask, ToolEdit, ExtCtrls,
  RzTabs, DB, UDMCadLote, dbXPress;

type
  TfrmCancelaLote = class(TForm)
    Panel1: TPanel;
    NxLabel10: TNxLabel;
    btnConsTalao: TNxButton;
    CurrencyEdit1: TCurrencyEdit;
    NxLabel1: TNxLabel;
    Shape4: TShape;
    Label4: TLabel;
    Shape6: TShape;
    Label6: TLabel;
    SMDBGrid1: TSMDBGrid;
    CurrencyEdit2: TCurrencyEdit;
    Panel3: TPanel;
    SMDBGrid2: TSMDBGrid;
    NxButton1: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsTalaoClick(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure NxButton1Click(Sender: TObject);
  private
    { Private declarations }
    fDMCancelaLote: TDMCancelaLote;
    fDMCadLote: TDMCadLote;

    vOpcaoImp : String;
    vQtd : Real;
    vQtd_Ant : Real;

    procedure prc_Consultar;

  public
    { Public declarations }
  end;

var
  frmCancelaLote: TfrmCancelaLote;

implementation

uses rsDBUtils, USel_Pessoa, uUtilPadrao, UAltQtdLote, DmdDatabase;

{$R *.dfm}

procedure TfrmCancelaLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(fDMCancelaLote);
  FreeAndNil(fDMCadLote);
  Action := Cafree;
end;

procedure TfrmCancelaLote.FormShow(Sender: TObject);
begin
  fDMCancelaLote:= TDMCancelaLote.Create(Self);
  fDMCadLote:= TDMCadLote.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMCancelaLote);
end;

procedure TfrmCancelaLote.btnConsTalaoClick(Sender: TObject);
var
  vComando : String;
begin
  if CurrencyEdit2.AsInteger <= 0 then
  begin
    MessageDlg('*** Nº do Pedido não informado!', mtError, [mbOk], 0);
    exit;
  end;
  prc_Consultar;

  fDMCancelaLote.mItens.EmptyDataSet;
  fDMCancelaLote.cdsPedido_Item.Close;
  fDMCancelaLote.sdsPedido_Item.ParamByName('NUM_PEDIDO').AsInteger := CurrencyEdit2.AsInteger;
  fDMCancelaLote.cdsPedido_Item.Open;
  fDMCancelaLote.cdsPedido_Item.First;
  while not fDMCancelaLote.cdsPedido_Item.Eof do
  begin
    fDMCancelaLote.mItens.Insert;
    fDMCancelaLote.mItensID_Pedido.AsInteger   := fDMCancelaLote.cdsPedido_ItemID.AsInteger;
    fDMCancelaLote.mItensItem_Pedido.AsInteger := fDMCancelaLote.cdsPedido_ItemITEM.AsInteger;
    fDMCancelaLote.mItensID_Produto.AsInteger  := fDMCancelaLote.cdsPedido_ItemID_PRODUTO.AsInteger;
    fDMCancelaLote.mItensId_Cor.AsInteger      := fDMCancelaLote.cdsPedido_ItemID_COR.AsInteger;
    fDMCancelaLote.mItensQtd.AsFloat           := StrToFloat(FormatFloat('0.0000',fDMCancelaLote.cdsPedido_ItemQTD.AsFloat));
    fDMCancelaLote.mItensNome_Produto.AsString := fDMCancelaLote.cdsPedido_ItemNOME_PRODUTO.AsString;
    fDMCancelaLote.mItensReferencia.AsString   := fDMCancelaLote.cdsPedido_ItemREFERENCIA.AsString;
    fDMCancelaLote.mItensQtd_Ant.AsFloat       := StrToFloat(FormatFloat('0.0000',fDMCancelaLote.cdsPedido_ItemQTD.AsFloat));
    fDMCancelaLote.mItens.Post;
    fDMCancelaLote.cdsPedido_Item.Next;
  end;
end;

procedure TfrmCancelaLote.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  //fDMCancelaLote.cdsConsTalao.IndexFieldNames := Column.FieldName;
  //Column.Title.Color := clBtnShadow;
  //for i := 0 to SMDBGrid1.Columns.Count - 1 do
  //  if not (SMDBGrid1.Columns.Items[I] = Column) then
  //    SMDBGrid1.Columns.Items[I].Title.Color := clBtnFace;
end;

procedure TfrmCancelaLote.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMCancelaLote.cdsConsultaLoteDTBAIXA.AsDateTime > 10 then
    Background := $0077FF77
  else
  if fDMCancelaLote.cdsConsultaLoteDTENTRADA.AsDateTime > 10 then
    Background := $00FFFFB9;
end;

procedure TfrmCancelaLote.SMDBGrid1DblClick(Sender: TObject);
var
  ffrmAltQtdLote: TfrmAltQtdLote;
begin
  if not(fDMCancelaLote.cdsConsultaLote.Active) or (fDMCancelaLote.cdsConsultaLoteID_LOTE.AsInteger <= 0) then
    exit;
  fDMCadLote.prc_Localizar(fDMCancelaLote.cdsConsultaLoteID_LOTE.AsInteger);
  if fDMCadLote.cdsLote.IsEmpty then
  begin
    MessageDlg('*** Lote não encontrado na base!', mtError, [mbOk], 0);
    exit;
  end;
  ffrmAltQtdLote := TfrmAltQtdLote.Create(self);
  ffrmAltQtdLote.fDMCadLote := fDMCadLote;
  ffrmAltQtdLote.ShowModal;
  FreeAndNil(ffrmAltQtdLote);
  btnConsTalaoClick(Sender);
end;

procedure TfrmCancelaLote.NxButton1Click(Sender: TObject);
var
  vIDAnt : Integer;
  vQtdAux : Real;
  ID: TTransactionDesc;
  i : Integer;
begin
  if fDMCancelaLote.mItens.State in [dsEdit] then
    fDMCancelaLote.mItens.Post;
  if MessageDlg('Altear a ordem de produção com a nova qtde?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  ID.TransactionID  := 1;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try

    fDMCancelaLote.mItens.First;
    while not fDMCancelaLote.mItens.Eof do
    begin
      if (StrToFloat(FormatFloat('0.0000',fDMCancelaLote.mItensQtd.AsFloat)) <> StrToFloat(FormatFloat('0.0000',fDMCancelaLote.mItensQtd_Ant.AsFloat)))
        and (SMDBGrid2.SelectedRows.CurrentRowSelected) then
      begin
        fDMCancelaLote.cdsConsultaLote.Filtered := False;
        fDMCancelaLote.cdsConsultaLote.Filter   := 'ID_PEDIDO = ' + QuotedStr(fDMCancelaLote.mItensID_Pedido.AsString)
                                                 + ' and ITEM_PEDIDO = ' + QuotedStr(fDMCancelaLote.mItensItem_Pedido.AsString);
        fDMCancelaLote.cdsConsultaLote.Filtered := True;
        vIDAnt := 0;
        fDMCancelaLote.cdsConsultaLote.First;
        while not fDMCancelaLote.cdsConsultaLote.Eof do
        begin
          if fDMCancelaLote.cdsConsultaLoteID_LOTE.AsInteger > 0 then
          begin
            vQtd_Ant := StrToFloat(FormatFloat('0.0000',fDMCancelaLote.mItensQtd_Ant.AsFloat * fDMCancelaLote.cdsConsultaLoteQTD_CONSUMO.AsFloat));
            vQtd     := StrToFloat(FormatFloat('0.0000',fDMCancelaLote.mItensQtd.AsFloat * fDMCancelaLote.cdsConsultaLoteQTD_CONSUMO.AsFloat));
          end
          else
          begin
            vQtd_Ant := StrToFloat(FormatFloat('0.0000',fDMCancelaLote.mItensQtd_Ant.AsFloat));
            vQtd     := StrToFloat(FormatFloat('0.0000',fDMCancelaLote.mItensQtd.AsFloat));
          end;
          if (fDMCancelaLote.cdsConsultaLoteID_LOTE.AsInteger <> vIDAnt) and (fDMCancelaLote.cdsConsultaLoteID_LOTE.AsInteger > 0) then
          begin
            fDMCadLote.prc_Localizar(fDMCancelaLote.cdsConsultaLoteID_LOTE.AsInteger);
            vQtdAux := StrToFloat(FormatFloat('0.0000',((fDMCadLote.cdsLoteQTD.AsFloat - vQtd_Ant) + vQtd)));
            if StrToFloat(FormatFloat('0.0000',vQtdAux)) <= 0 then
            begin
              fDMCadLote.cdsLote_Ped.First;
              while not fDMCadLote.cdsLote_Ped.Eof do
              begin
                fDMCadLote.cdsLote_Ped.Delete;
                fDMCadLote.cdsLote_Ped.Next;
              end;
              fDMCadLote.prc_Excluir_Baixa_Lote(fDMCadLote.cdsLoteID.AsInteger);
              fDMCadLote.cdsExc_Baixa_Processo.First;
              begin
                while not fDMCadLote.cdsExc_Baixa_Processo.Eof do
                begin
                  fDMCadLote.cdsExc_Baixa_Processo.Delete;
                end;
                fDMCadLote.cdsExc_Baixa_Processo.ApplyUpdates(0);
              end;

              fDMCadLote.cdsLote.Delete;
              fDMCadLote.cdsLote.ApplyUpdates(0);
            end
            else
            begin
              fDMCadLote.cdsLote.Edit;
              fDMCadLote.cdsLoteQTD.AsFloat          := StrToFloat(FormatFloat('0.0000',vQtdAux));
              fDMCadLote.cdsLoteQTD_PENDENTE.AsFloat := StrToFloat(FormatFloat('0.0000',fDMCadLote.cdsLoteQTD.AsFloat));
              fDMCadLote.cdsLoteQTD_PARES.AsFloat    := StrToFloat(FormatFloat('0.0000',(fDMCadLote.cdsLoteQTD_PARES.AsFloat - fDMCancelaLote.mItensQtd_Ant.AsFloat) + fDMCancelaLote.mItensQtd.AsFloat));
              fDMCadLote.cdsLote.Post;
              if StrToFloat(FormatFloat('0.0000',vQtd)) <= 0 then
              begin
                if (fDMCadLote.cdsLote_Ped.Locate('ID_PEDIDO;ITEM_PEDIDO',VarArrayOf([fDMCancelaLote.cdsConsultaLoteID_PEDIDO.AsInteger,
                                                                          fDMCancelaLote.cdsConsultaLoteITEM_PEDIDO.AsInteger]),[locaseinsensitive])) then
                begin
                  fDMCadLote.cdsLote_Ped.Delete;
                  fDMCadLote.cdsLote.First;
                  fDMCadLote.cdsLote.Edit;
                  fDMCadLote.cdsLoteOBS_PED.AsString := '';
                  fDMCadLote.cdsLote_Ped.First;
                  while not fDMCadLote.cdsLote_Ped.Eof do
                  begin
                    fDMCadLote.cdsLoteOBS_PED.AsString := fDMCadLote.cdsLoteOBS_PED.AsString + '<' + fDMCadLote.cdsLote_PedPEDIDO_CLIENTE.AsString + '>';
                    fDMCadLote.cdsLote_Ped.Next;
                  end;
                  fDMCadLote.cdsLote.Post;
                end;
              end;
              fDMCadLote.cdsLote.ApplyUpdates(0);
            end;
          end;
          vIDAnt := fDMCancelaLote.cdsConsultaLoteID_LOTE.AsInteger;

          //if fDMCancelaLote.cdsConsultaLoteID_LOTE.AsInteger >= 0 then
          //begin
              fDMCadLote.prc_Abrir_Baixa_Processo(fDMCancelaLote.cdsConsultaLoteNUM_ORDEM.AsInteger,fDMCancelaLote.cdsConsultaLoteID_LOTE.AsInteger,
                                                  fDMCancelaLote.cdsConsultaLoteID_BAIXA.AsInteger,fDMCancelaLote.cdsConsultaLoteITEM_BAIXA.AsInteger);
              //Exclui os talões por processo (parte da revisão/faturamento)
              fDMCadLote.cdsBaixa_Processo.First;
              while not fDMCadLote.cdsBaixa_Processo.Eof do
              begin
                if (fDMCadLote.cdsBaixa_ProcessoDTBAIXA.AsDateTime <= 10) and (fDMCancelaLote.cdsConsultaLoteID_LOTE.AsInteger <= 0) and (StrToFloat(FormatFloat('0.0000',fDMCancelaLote.mItensQtd.AsFloat)) <= 0) then
                  fDMCadLote.cdsBaixa_Processo.Delete
                else
                begin
                  vQtdAux := StrToFloat(FormatFloat('0.0000',(fDMCadLote.cdsBaixa_ProcessoQTD.AsFloat - vQtd_Ant) + vQtd));
                  if StrToFloat(FormatFloat('0.0000',vQtdAux)) <= 0 then
                    fDMCadLote.cdsBaixa_Processo.Delete
                  else
                  begin
                    fDMCadLote.cdsBaixa_Processo.Edit;
                    fDMCadLote.cdsBaixa_ProcessoQTD.AsFloat := StrToFloat(FormatFloat('0.0000',vQtdAux));
                    fDMCadLote.cdsBaixa_Processo.Post;
                    fDMCadLote.cdsBaixa_Processo.Next;
                  end;
                end;
              end;


          fDMCadLote.cdsBaixa_Processo.ApplyUpdates(0);
          fDMCancelaLote.cdsConsultaLote.Next;
        end;
      end;
      fDMCancelaLote.mItens.Next;
    end;

    dmDatabase.scoDados.Commit(ID);
  except
      on e: Exception do
      begin
        raise Exception.Create('Erro ao gravar alteração da quantidade Lote/Baixa Processo: ' + #13+#13 + e.Message);
        dmDatabase.scoDados.Rollback(ID);
      end;
  end;

  fDMCancelaLote.cdsConsultaLote.Filtered := False;
  prc_Consultar;
end;

procedure TfrmCancelaLote.prc_Consultar;
var
  vComando : String;
begin
  vComando := fDMCancelaLote.ctConsultaLote;
  if CurrencyEdit1.AsInteger > 0 then
    vComando := vComando + '   AND ITEM_PEDIDO = :ITEM_PEDIDO ';
  fDMCancelaLote.cdsConsultaLote.Close;
  fDMCancelaLote.sdsConsultaLote.CommandText := vComando;
  fDMCancelaLote.sdsConsultaLote.ParamByName('NUM_PEDIDO').AsInteger := CurrencyEdit2.AsInteger;
  if CurrencyEdit1.AsInteger > 0 then
    fDMCancelaLote.sdsConsultaLote.ParamByName('ITEM_PEDIDO').AsInteger := CurrencyEdit1.AsInteger;
  fDMCancelaLote.cdsConsultaLote.Open;
  fDMCancelaLote.cdsConsultaLote.IndexFieldNames := 'PEDIDO_CLIENTE;ITEM_PEDIDO;ITEM_PROCESSO';

end;

end.
