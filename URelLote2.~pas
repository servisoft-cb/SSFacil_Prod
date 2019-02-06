unit URelLote2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, UDMCadLote_Calc, RLBarcode, jpeg, UDMRel;

type
  TfRelLote2 = class(TForm)
    RLReport1: TRLReport;
    RLSubDetail1: TRLSubDetail;
    RLBand1: TRLBand;
    RLDBText1: TRLDBText;
    RLDraw1: TRLDraw;
    RLImage1: TRLImage;
    RLDraw2: TRLDraw;
    RLLabel1: TRLLabel;
    RLDBText2: TRLDBText;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLDBText4: TRLDBText;
    RLDraw5: TRLDraw;
    RLBarcode1: TRLBarcode;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLDBText6: TRLDBText;
    RLLabel7: TRLLabel;
    RLDBText7: TRLDBText;
    RLLabel9: TRLLabel;
    RLDBText8: TRLDBText;
    RLDraw4: TRLDraw;
    RLSubDetail2: TRLSubDetail;
    RLDetailGrid1: TRLDetailGrid;
    RLLabel14: TRLLabel;
    RLLabel16: TRLLabel;
    RLDraw6: TRLDraw;
    RLDBText16: TRLDBText;
    RLDraw7: TRLDraw;
    RLDBText18: TRLDBText;
    RLBand2: TRLBand;
    RLDraw8: TRLDraw;
    RLMemo1: TRLMemo;
    RLDraw9: TRLDraw;
    RLImage2: TRLImage;
    RLSubDetail3: TRLSubDetail;
    RLLabel15: TRLLabel;
    RLDBText10: TRLDBText;
    RLDetailGrid2: TRLDetailGrid;
    RLDBText12: TRLDBText;
    RLLabel17: TRLLabel;
    RLDBText14: TRLDBText;
    RLBand3: TRLBand;
    RLDraw10: TRLDraw;
    RLBand4: TRLBand;
    RLDraw11: TRLDraw;
    RLDraw12: TRLDraw;
    RLLabel11: TRLLabel;
    RLDBText9: TRLDBText;
    RLDBText11: TRLDBText;
    RLLabel8: TRLLabel;
    RLDBText15: TRLDBText;
    RLLabel4: TRLLabel;
    RLDBText5: TRLDBText;
    RLLabel10: TRLLabel;
    RLLabel12: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText13: TRLDBText;
    RLLabel13: TRLLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLDetailGrid1AfterPrint(Sender: TObject);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RLSubDetail2BeforePrint(Sender: TObject;
      var PrintIt: Boolean);
    procedure RLDetailGrid2BeforePrint(Sender: TObject;
      var PrintIt: Boolean);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
    function fnc_Localiza_Produto_Comb(ID : Integer; ID_Cor_Combinacao : Integer):Boolean;
    function fnc_Localiza_Produto(ID: Integer):Boolean;
    procedure RLDBText12BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure RLSubDetail3AfterPrint(Sender: TObject);
  private
    { Private declarations }
    SetorAnterior : Integer;
    SetorPosterior : Integer;
    ControlaImpressao : Integer;
    fDMRel: TDMRel;
  public
    { Public declarations }
    fDMCadLote_Calc: TDMCadLote_Calc;
    vTipo_Rel: String; //L= Lote   T= Talão

  end;

var
  fRelLote2: TfRelLote2;

implementation

uses rsDBUtils, DB;

{$R *.dfm}

procedure TfRelLote2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Tag    := 0;
  Action := Cafree;
end;

procedure TfRelLote2.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMCadLote_Calc);
end;

procedure TfRelLote2.RLDetailGrid1AfterPrint(Sender: TObject);
begin
  RLLabel14.Visible := False;
  RLLabel16.Visible := False;
end;

procedure TfRelLote2.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  vObsAux : String;  
begin
  if (Tag = 1) and (fDMCadLote_Calc.mLoteSelecionado.AsString <> 'S') then
    PrintIt := False
  else
    PrintIt := True;
  if not PrintIt then
    exit;
  RLMemo1.Lines.Clear;
  vObsAux := fDMCadLote_Calc.fnc_Buscar_NumPedido(fDMCadLote_Calc.mLoteID_Lote.AsInteger);
  //RLMemo1.Lines.Text := RLMemo1.Lines.Text + ' ' + fDMCadLote_Calc.mLoteObs.AsString;
  vObsAux := fDMCadLote_Calc.mLoteObs.AsString  + ' ' + vObsAux;
  RLMemo1.Lines.Text := vObsAux;
end;

procedure TfRelLote2.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
  var
    i, vResto, vOrdem : Integer;
    vQtde : Real;
    flag : String;
begin
  if fDMCadLote_Calc.qParametros_LoteUSA_REMESSA.AsString = 'S' then
  begin
    RLLabel2.Caption     := 'REMESSA:';
    RLDBText11.DataField := 'NUM_REMESSA';
  end
  else
  begin
    RLLabel2.Caption     := 'OP:';
    RLDBText11.DataField := 'NUM_ORDEM';
  end;
  SetorAnterior := 0;
  SetorPosterior := 0;
  flag := '';
  if (Tag = 1) and (fDMCadLote_Calc.mLoteSelecionado.AsString <> 'S') then
    PrintIt := False
  else
    PrintIt := True;
  if not PrintIt then
    exit;
  RLBarcode1.Visible := ((fDMCadLote_Calc.mLoteImprimirPor.AsString = 'L') or ((fDMCadLote_Calc.mLoteImprimirPor.AsString = 'T') and (fDMCadLote_Calc.qParametros_LoteTIPO_LOTE.AsString = 'T')));
  if fDMCadLote_Calc.mLoteImprimirPor.AsString = 'A' then
    RLLabel5.Caption := '** Acumulado **'
  else
  //if fDMCadLote_Calc.mLoteImprimirPor.AsString = 'T' then
  //  RLLabel5.Caption := '** Por Tamanho **'
  //else
  begin
    if vTipo_Rel = 'T' then
    begin
      RLLabel5.Caption := '2' + FormatFloat('000000',fDMCadLote_Calc.mLoteNum_Lote.AsInteger) + FormatFloat('0000',fDMCadLote_Calc.mLoteNum_Talao.AsInteger);
    end
    else
    begin
      RLLabel5.Caption   := '9' + FormatFloat('000000',fDMCadLote_Calc.mLoteNum_Lote.AsInteger);
    end;
    RLBarcode1.Caption := RLLabel5.Caption;
    RLBarcode1.Refresh;
  end;

  if fDMCadLote_Calc.qParametrosMOSTRAR_MAT_LOTE.AsString = 'S' then
  begin
    fDMCadLote_Calc.cdsProduto_Consumo.Close;
    fDMCadLote_Calc.sdsProduto_Consumo.ParamByName('ID').AsInteger := fDMCadLote_Calc.mLoteID_Produto.AsInteger;
    fDMCadLote_Calc.sdsProduto_Consumo.ParamByName('ID_COR_COMBINACAO').AsInteger := fDMCadLote_Calc.mLoteID_Combinacao.AsInteger;
    fDMCadLote_Calc.cdsProduto_Consumo.Open;
    vOrdem := 0;
    vResto := fDMCadLote_Calc.cdsProduto_Consumo.RecordCount mod 2;
    vQtde := fDMCadLote_Calc.cdsProduto_Consumo.RecordCount;
    vQtde := vQtde / 2;
    fDMCadLote_Calc.cdsProduto_Consumo.IndexFieldNames := 'ID_SETOR;ITEM';
    fDMCadLote_Calc.mProduto_Consumo.EmptyDataSet;
    while not fDMCadLote_Calc.cdsProduto_Consumo.Eof do
    begin
      fDMCadLote_Calc.mProduto_Consumo.Insert;
      fDMCadLote_Calc.mProduto_ConsumoID.AsInteger := fDMCadLote_Calc.cdsProduto_ConsumoID.AsInteger;
      fDMCadLote_Calc.mProduto_ConsumoITEM.AsInteger := fDMCadLote_Calc.cdsProduto_ConsumoITEM.AsInteger;
      fDMCadLote_Calc.mProduto_ConsumoID_MATERIAL.AsInteger := fDMCadLote_Calc.cdsProduto_ConsumoID_MATERIAL.AsInteger;
      fDMCadLote_Calc.mProduto_ConsumoQTD_CONSUMO.AsFloat := fDMCadLote_Calc.cdsProduto_ConsumoQTD_CONSUMO.AsFloat;
      fDMCadLote_Calc.mProduto_ConsumoQTD_UNIDADE.AsFloat := fDMCadLote_Calc.cdsProduto_ConsumoQTD_UNIDADE.AsFloat;
      fDMCadLote_Calc.mProduto_ConsumoUNIDADE.AsString := fDMCadLote_Calc.cdsProduto_ConsumoUNIDADE.AsString;
      fDMCadLote_Calc.mProduto_ConsumoID_POSICAO.AsInteger := fDMCadLote_Calc.cdsProduto_ConsumoID_POSICAO.AsInteger;
      fDMCadLote_Calc.mProduto_ConsumoTIPO_CONSUMO.AsString := fDMCadLote_Calc.cdsProduto_ConsumoTIPO_CONSUMO.AsString;
      fDMCadLote_Calc.mProduto_ConsumoNOME_MATERIAL.AsString := fDMCadLote_Calc.cdsProduto_ConsumoNOME_MATERIAL.AsString;
      fDMCadLote_Calc.mProduto_ConsumoID_GRADE.AsInteger := fDMCadLote_Calc.cdsProduto_ConsumoID_GRADE.AsInteger;
      fDMCadLote_Calc.mProduto_ConsumoREF_MATERIAL.AsString := fDMCadLote_Calc.cdsProduto_ConsumoREF_MATERIAL.AsString;
      fDMCadLote_Calc.mProduto_ConsumoIMP_ROTULO.AsString := fDMCadLote_Calc.cdsProduto_ConsumoIMP_ROTULO.AsString;
      fDMCadLote_Calc.mProduto_ConsumoIMP_TALAO.AsString := fDMCadLote_Calc.cdsProduto_ConsumoIMP_TALAO.AsString;
      fDMCadLote_Calc.mProduto_ConsumoIMP_TALAO_POS.AsString := fDMCadLote_Calc.cdsProduto_ConsumoIMP_TALAO_POS.AsString;
      fDMCadLote_Calc.mProduto_ConsumoNOME_POSICAO.AsString := fDMCadLote_Calc.cdsProduto_ConsumoNOME_POSICAO.AsString;
      fDMCadLote_Calc.mProduto_ConsumoIMP_MATERIAL.AsString := fDMCadLote_Calc.cdsProduto_ConsumoIMP_MATERIAL.AsString;
      fDMCadLote_Calc.mProduto_ConsumoIMP_AGRUPADO_MATERIAL.AsString := fDMCadLote_Calc.cdsProduto_ConsumoIMP_AGRUPADO_MATERIAL.AsString;
      fDMCadLote_Calc.mProduto_ConsumoNOME_COR.AsString := fDMCadLote_Calc.cdsProduto_ConsumoNOME_COR.AsString;
      fDMCadLote_Calc.mProduto_ConsumoID_COR.AsInteger := fDMCadLote_Calc.cdsProduto_ConsumoID_COR.AsInteger;
      fDMCadLote_Calc.mProduto_ConsumoID_SETOR.AsInteger := fDMCadLote_Calc.cdsProduto_ConsumoID_SETOR.AsInteger;
      fDMCadLote_Calc.mProduto_ConsumoIMP_SUBLINHADO.AsString := 'N';
      SetorAnterior := fDMCadLote_Calc.cdsProduto_ConsumoID_SETOR.AsInteger;
      if SetorPosterior = 0 then
        SetorPosterior := SetorAnterior;
      if SetorPosterior <> SetorAnterior then
      begin
        fDMCadLote_Calc.mProduto_ConsumoIMP_SUBLINHADO.AsString := 'S';
        SetorPosterior := SetorAnterior;
      end;
      if vOrdem > vQtde then
         begin
           vOrdem := 0;
           flag := 'S';
          end;
      vOrdem := vOrdem + 1;
      if  flag = 'S' then
        fDMCadLote_Calc.mProduto_ConsumoORDEM_RELATORIO.AsString := FormatFloat('00',vOrdem) + '.1'
      else
        fDMCadLote_Calc.mProduto_ConsumoORDEM_RELATORIO.AsString := FormatFloat('00',vOrdem);
      fDMCadLote_Calc.cdsProduto_Consumo.Next;
    end;
  end;
  fDMCadLote_Calc.mProduto_Consumo.First;
  fDMCadLote_Calc.mProduto_Consumo.IndexFieldNames := 'ID;ORDEM_RELATORIO';

  RLDBText2.Visible := ((fDMCadLote_Calc.mLoteImprimirPor.AsString = 'L') or ((fDMCadLote_Calc.mLoteImprimirPor.AsString = 'T') and (fDMCadLote_Calc.qParametros_LoteTIPO_LOTE.AsString = 'T')));
  if fnc_Localiza_Produto_Comb(fDMCadLote_Calc.mLoteID_Produto.AsInteger,fDMCadLote_Calc.mLoteID_Combinacao.AsInteger) then
    begin
    if FileExists(fDMCadLote_Calc.qProduto_CombFOTO.AsString) then
       RLImage1.Picture.LoadFromFile(fDMCadLote_Calc.qProduto_CombFOTO.AsString)
    else
       RLImage1.Picture := nil;
    end
   else begin
    if fnc_Localiza_Produto(fDMCadLote_Calc.mLoteID_Produto.AsInteger) then
    begin
    if FileExists(fDMCadLote_Calc.qProduto_CombFOTO.AsString) then
       RLImage1.Picture.LoadFromFile(fDMCadLote_Calc.qProduto_CombFOTO.AsString)
    else
       RLImage1.Picture := nil;
    end;
  end;

  if ControlaImpressao = 2 then
  begin
    ControlaImpressao := 0;
    RLBand1.PageBreaking := pbBeforePrint;
  end
  else
    RLBand1.PageBreaking := pbNone;
end;

procedure TfRelLote2.FormCreate(Sender: TObject);
begin
  fDMRel := TDMRel.Create(Self);
  ControlaImpressao := 0;
end;

procedure TfRelLote2.FormDestroy(Sender: TObject);
begin
  FreeAndNil(fDMRel);
end;

procedure TfRelLote2.RLSubDetail2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if (Tag = 1) and (fDMCadLote_Calc.mLoteSelecionado.AsString <> 'S') then
    PrintIt := False
  else
    PrintIt := True;
end;

procedure TfRelLote2.RLDetailGrid2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  vAux: Real;
  i : Integer;
begin
  if (Tag = 1) and (fDMCadLote_Calc.mLoteSelecionado.AsString <> 'S') then
    PrintIt := False
  else
    PrintIt := True;
  if not PrintIt then
    exit;
  PrintIt := ((fDMCadLote_Calc.qParametrosMOSTRAR_MAT_LOTE.AsString = 'S') and (fDMCadLote_Calc.mProduto_ConsumoIMP_TALAO.AsString = 'S'));
  if not PrintIt then
    exit;

  if RLDetailGrid2.RowIndex = 16 then
    RLDetailGrid2.AutoTrunc := True;

  if fDMCadLote_Calc.mProduto_ConsumoTIPO_CONSUMO.AsString = 'T' then
  begin
    if vTipo_Rel = 'L' then
      vAux := fDMCadLote_Calc.fnc_Somar_Consumo
    else
      vAux := fDMCadLote_Calc.fnc_Somar_Consumo_Talao;
  end
  else
    vAux := StrToFloat(FormatFloat('0.00000',fDMCadLote_Calc.mProduto_ConsumoQTD_CONSUMO.AsFloat * fDMCadLote_Calc.mLoteQtd.AsFloat));
  RLLabel17.Caption := FormatFloat('0.0000',vAux);
  //RLLabel10.Caption := fDMCadLote_Calc.cdsProduto_ConsumoNOME_MATERIAL.AsString;
  RLLabel10.Caption := fDMCadLote_Calc.mProduto_ConsumoNOME_MATERIAL.AsString;

  if fDMCadLote_Calc.mProduto_ConsumoID_COR.AsInteger > 0 then
    RLLabel10.Caption := RLLabel10.Caption + ' ' + fDMCadLote_Calc.mProduto_ConsumoNOME_COR.AsString;
end;

procedure TfRelLote2.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if (Tag = 1) and (fDMCadLote_Calc.mLoteSelecionado.AsString <> 'S') then
    PrintIt := False
  else
    PrintIt := True;
  if not PrintIt then
    exit;
  PrintIt := (fDMCadLote_Calc.qParametrosMOSTRAR_MAT_LOTE.AsString = 'S');
end;

procedure TfRelLote2.RLBand4BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if (Tag = 1) and (fDMCadLote_Calc.mLoteSelecionado.AsString <> 'S') then
    PrintIt := False
  else
    PrintIt := True;
  if not PrintIt then
    exit;
  PrintIt := (fDMCadLote_Calc.qParametrosMOSTRAR_MAT_LOTE.AsString = 'S');
end;


function TfRelLote2.fnc_Localiza_Produto_Comb(ID,
  ID_Cor_Combinacao: Integer): Boolean;
begin
  Result := False;
  fDMCadLote_Calc.qProduto_Comb.Close;
  fDMCadLote_Calc.qProduto_Comb.ParamByName('ID').AsInteger := ID;
  fDMCadLote_Calc.qProduto_Comb.ParamByName('ID_Cor_Combinacao').AsInteger := ID_Cor_Combinacao;
  fDMCadLote_Calc.qProduto_Comb.Open;
  if not fDMCadLote_Calc.qProduto_Comb.IsEmpty then
    Result := True;
end;

function TfRelLote2.fnc_Localiza_Produto(ID: Integer): Boolean;
begin
  Result := False;
  fDMCadLote_Calc.qProduto.Close;
  fDMCadLote_Calc.qProduto.ParamByName('ID').AsInteger := ID;
  fDMCadLote_Calc.qProduto.Open;
  if not fDMCadLote_Calc.qProduto.IsEmpty then
    Result := True;
end;



procedure TfRelLote2.RLDBText12BeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
begin
  if fDMCadLote_Calc.mProduto_ConsumoIMP_SUBLINHADO.AsString = 'S' then
  begin
    RLDBText12.Borders.DrawTop := True;
    RLDBText14.Borders.DrawTop := True;
    RLLabel10.Borders.DrawTop := True;
    RLLabel17.Borders.DrawTop := True;
  end
  else
  begin
    RLDBText12.Borders.DrawTop := False;
    RLDBText14.Borders.DrawTop := False;
    RLLabel10.Borders.DrawTop := False;
    RLLabel17.Borders.DrawTop := False;
  end;
end;  

procedure TfRelLote2.RLSubDetail3AfterPrint(Sender: TObject);
begin
  ControlaImpressao := ControlaImpressao + 1;
end;

end.
