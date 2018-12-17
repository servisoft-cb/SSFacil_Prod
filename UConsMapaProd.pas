unit UConsMapaProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMMapaProd, ComCtrls, StdCtrls, Mask, ToolEdit, CurrEdit,
  NxCollection, ExtCtrls, DB, Grids, DBGrids, SMDBGrid, RzTabs;

type
  TfrmConsMapaProd = class(TForm)
    pnlPesquisa: TPanel;
    NxLabel5: TNxLabel;
    NxLabel2: TNxLabel;
    btnConsultar: TNxButton;
    CurrencyEdit1: TCurrencyEdit;
    ProgressBar1: TProgressBar;
    CurrencyEdit2: TCurrencyEdit;
    btnImprimir: TNxButton;
    RzPageControl1: TRzPageControl;
    TS_Grade: TRzTabSheet;
    TS_Talao: TRzTabSheet;
    SMDBGrid1: TSMDBGrid;
    SMDBGrid2: TSMDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    ComboBox2: TComboBox;
    TS_Acumulado: TRzTabSheet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    fDMMapaProd: TDMMapaProd;

    procedure prc_Consultar;
    procedure prc_Consultar_Talao;
    procedure prc_Le_Consulta_Lote; //Vai gravar os tamanhos tudo em uma linha
    procedure prc_Le_Consulta_Talao; //Cada linha é um tamanho

    procedure prc_scroll(DataSet: TDataSet);

  public
    { Public declarations }
  end;

var
  frmConsMapaProd: TfrmConsMapaProd;

implementation

uses rsDBUtils, DateUtils;

{$R *.dfm}

procedure TfrmConsMapaProd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsMapaProd.FormShow(Sender: TObject);
begin
  fDMMapaProd := TDMMapaProd.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMMapaProd);
end;

procedure TfrmConsMapaProd.btnConsultarClick(Sender: TObject);
begin
  if (CurrencyEdit1.AsInteger <= 0) and (CurrencyEdit2.AsInteger <= 0) then
  begin
    MessageDlg('*** Não foi informada um Nº de Ordem Inicial e Final!', mtError, [mbOk], 0);
    exit;
  end;
  if (CurrencyEdit1.AsInteger > CurrencyEdit2.AsInteger) then
  begin
    MessageDlg('*** Nº de Ordem Inicial não pode ser maior que a Final!', mtError, [mbOk], 0);
    exit;
  end;
  fDMMapaProd.mMapa.EmptyDataSet;
  fDMMapaProd.mSetorLote.EmptyDataSet;
  fDMMapaProd.mMapa.AfterScroll := nil;
  if RzPageControl1.ActivePage = TS_Grade then
  begin
    prc_Consultar;
    prc_Le_Consulta_Lote;
  end
  else
  begin
    prc_Consultar_Talao;
    prc_Le_Consulta_Talao;
  end;
end;

procedure TfrmConsMapaProd.prc_Consultar;
begin
  fDMMapaProd.cdsConsulta_Lote.Close;
  fDMMapaProd.sdsConsulta_Lote.ParamByName('NUM_INI').AsInteger := CurrencyEdit1.AsInteger;
  fDMMapaProd.sdsConsulta_Lote.ParamByName('NUM_FIN').AsInteger := CurrencyEdit2.AsInteger;
  fDMMapaProd.cdsConsulta_Lote.Open;
  fDMMapaProd.cdsConsulta_Lote.IndexFieldNames := 'NUM_ORDEM;NUM_LOTE;TAMANHO';

end;

procedure TfrmConsMapaProd.prc_Le_Consulta_Lote;
var
  vItem : Integer;
  vIDProd : Integer;
  vNumOP : Integer;
begin
  vIDProd := 0;
  vNumOP  := 0;
  fDMMapaProd.cdsConsulta_Lote.First;
  while not fDMMapaProd.cdsConsulta_Lote.Eof do
  begin
    if vNumOP <> fDMMapaProd.cdsConsulta_LoteNUM_ORDEM.AsInteger then
      vIDProd := 0;
    if vIDProd <> fDMMapaProd.cdsConsulta_LoteID_PRODUTO.AsInteger then
    begin
      fDMMapaProd.cdsTam.Close;
      fDMMapaProd.sdsTam.ParamByName('ID_PRODUTO').AsInteger := fDMMapaProd.cdsConsulta_LoteID_PRODUTO.AsInteger;
      fDMMapaProd.sdsTam.ParamByName('NUM_ORDEM').AsInteger  := fDMMapaProd.cdsConsulta_LoteNUM_ORDEM.AsInteger;
      fDMMapaProd.cdsTam.Open;

      fDMMapaProd.mMapa.Insert;
      fDMMapaProd.mMapaNum_Ordem.AsInteger  := fDMMapaProd.cdsConsulta_LoteNUM_ORDEM.AsInteger;
      fDMMapaProd.mMapaNum_Lote.AsInteger   := fDMMapaProd.cdsConsulta_LoteNUM_LOTE.AsInteger;
      fDMMapaProd.mMapaID_Produto.AsInteger := fDMMapaProd.cdsConsulta_LoteID_PRODUTO.AsInteger;
      fDMMapaProd.mMapaAgrupar.AsString     := fDMMapaProd.cdsConsulta_LoteNUM_ORDEM.AsString + '.' + fDMMapaProd.cdsConsulta_LoteID_PRODUTO.AsString;
      fDMMapaProd.mMapaTipo.AsString        := 'C';
      vItem := 0;
      fDMMapaProd.cdsTam.First;
      while not fDMMapaProd.cdsTam.Eof do
      begin
        vItem := vItem + 1;
        fDMMapaProd.mMapa.FieldByName('QTam'+IntToStr(vItem)).AsString := fDMMapaProd.cdsTamTAMANHO.AsString;
        fDMMapaProd.cdsTam.Next;
      end;
      fDMMapaProd.mMapa.Post;
    end;
    if fDMMapaProd.mMapa.Locate('Num_Ordem;Num_Lote;Tipo',VarArrayOf([fDMMapaProd.cdsConsulta_LoteNUM_ORDEM.AsInteger,fDMMapaProd.cdsConsulta_LoteNUM_LOTE.AsInteger,'D']),[locaseinsensitive]) then
      fDMMapaProd.mMapa.Edit
    else
    begin
      fDMMapaProd.mMapa.Insert;
      fDMMapaProd.mMapaNum_Ordem.AsInteger      := fDMMapaProd.cdsConsulta_LoteNUM_ORDEM.AsInteger;
      fDMMapaProd.mMapaNum_Lote.AsInteger       := fDMMapaProd.cdsConsulta_LoteNUM_LOTE.AsInteger;
      fDMMapaProd.mMapaAgrupar.AsString         := fDMMapaProd.cdsConsulta_LoteNUM_ORDEM.AsString + '.' + fDMMapaProd.cdsConsulta_LoteID_PRODUTO.AsString;
      fDMMapaProd.mMapaTipo.AsString            := 'D';
      fDMMapaProd.mMapaID_Produto.AsInteger     := fDMMapaProd.cdsConsulta_LoteID_PRODUTO.AsInteger;
      fDMMapaProd.mMapaID_Combinacao.AsInteger  := fDMMapaProd.cdsConsulta_LoteID_COMBINACAO.AsInteger;
      fDMMapaProd.mMapaReferencia.AsString      := fDMMapaProd.cdsConsulta_LoteREFERENCIA.AsString;
      fDMMapaProd.mMapaNome_Produto.AsString    := fDMMapaProd.cdsConsulta_LoteNOME_PRODUTO.AsString;
      fDMMapaProd.mMapaNome_Combinacao.AsString := fDMMapaProd.cdsConsulta_LoteNOME_COMBINACAO.AsString;
    end;
    fDMMapaProd.mMapaQtd.AsInteger := fDMMapaProd.mMapaQtd.AsInteger + fDMMapaProd.cdsConsulta_LoteQTD.AsInteger;
    vItem := 1;
    if fDMMapaProd.cdsTam.Locate('TAMANHO',fDMMapaProd.cdsConsulta_LoteTAMANHO.AsString,[loCaseInsensitive]) then
      vItem := fDMMapaProd.cdsTam.RecNo;
    fDMMapaProd.mMapa.FieldByName('QTam'+IntToStr(vItem)).AsString := fDMMapaProd.cdsConsulta_LoteQTD.AsString;
    fDMMapaProd.mMapa.Post;

    vIDProd := fDMMapaProd.cdsConsulta_LoteID_PRODUTO.AsInteger;
    vNumOP  := fDMMapaProd.cdsConsulta_LoteNUM_ORDEM.AsInteger;
    fDMMapaProd.cdsConsulta_Lote.Next;
  end;
  fDMMapaProd.mMapa.IndexFieldNames := 'Num_Ordem;Num_Lote;Tipo';
end;

procedure TfrmConsMapaProd.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMMapaProd.mMapaTipo.AsString = 'C' then
  begin
    Background := clSilver;
    if Field.FieldName = 'ID_Produto' then
      AFont.Color := clSilver;
    if Field.FieldName = 'Num_Ordem' then
      AFont.Color := clSilver;
    if Field.FieldName = 'Num_Lote' then
      AFont.Color := clSilver;
    if Field.FieldName = 'Qtd' then
      AFont.Color := clSilver;
  end;
end;

procedure TfrmConsMapaProd.btnImprimirClick(Sender: TObject);
var
  vArq : String;
begin
  if RzPageControl1.ActivePage = TS_Grade then
    vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\MapaProd.fr3'
  else
    vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\MapaProd_Tal.fr3';
  if not (FileExists(vArq)) then
  begin
    MessageDlg('*** Relatório não localizado: ' + vArq , mtInformation, [mbOk], 0);
    exit;
  end;
  if RzPageControl1.ActivePage = TS_Grade then
  begin
    fDMMapaProd.mMapa.Filtered := False;
    fDMMapaProd.mMapa.Filter   := 'Tipo = ' + QuotedStr('D');
    fDMMapaProd.mMapa.Filtered := True;
    prc_scroll(fDMMapaProd.mMapa);
    fDMMapaProd.mMapa.First;
  end
  else
    fDMMapaProd.mMapa_Talao.First;
  fDMMapaProd.frxReport1.Report.LoadFromFile(vArq);
  fDMMapaProd.frxReport1.ShowReport;
  fDMMapaProd.mMapa.Filtered := False;
end;

procedure TfrmConsMapaProd.prc_scroll(DataSet: TDataSet);
begin
end;

procedure TfrmConsMapaProd.prc_Le_Consulta_Talao;
var
  vIDProd : Integer;
  vNumOP : Integer;
  i : Integer;
  vItemAux : Integer;
begin
  fDMMapaProd.mMapaAux.EmptyDataSet;
  vIDProd := 0;
  vNumOP  := 0;
  fDMMapaProd.mMapa_Talao.EmptyDataSet;
  fDMMapaProd.cdsConsulta_Talao.First;
  while not fDMMapaProd.cdsConsulta_Talao.Eof do
  begin
    fDMMapaProd.mMapa_Talao.Insert;
    fDMMapaProd.mMapa_TalaoNum_Ordem.AsInteger      := fDMMapaProd.cdsConsulta_TalaoNUM_ORDEM.AsInteger;
    fDMMapaProd.mMapa_TalaoNum_Lote.AsInteger       := fDMMapaProd.cdsConsulta_TalaoNUM_LOTE.AsInteger;
    fDMMapaProd.mMapa_TalaoNum_Talao.AsInteger      := fDMMapaProd.cdsConsulta_TalaoNUM_TALAO.AsInteger;

    fDMMapaProd.mMapa_TalaoAgrupar.AsString         := fDMMapaProd.cdsConsulta_TalaoNUM_ORDEM.AsString + '.' + fDMMapaProd.cdsConsulta_TalaoID_PRODUTO.AsString + '.' + fDMMapaProd.cdsConsulta_TalaoID_COMBINACAO.AsString;
    fDMMapaProd.mMapa_TalaoTipo.AsString            := 'D';
    fDMMapaProd.mMapa_TalaoTamanho.AsString         := fDMMapaProd.cdsConsulta_TalaoTAMANHO.AsString;
    fDMMapaProd.mMapa_TalaoTalao.AsInteger          := fDMMapaProd.cdsConsulta_TalaoNUM_TALAO.AsInteger;
    fDMMapaProd.mMapa_TalaoID_Produto.AsInteger     := fDMMapaProd.cdsConsulta_TalaoID_PRODUTO.AsInteger;
    fDMMapaProd.mMapa_TalaoID_Combinacao.AsInteger  := fDMMapaProd.cdsConsulta_TalaoID_COMBINACAO.AsInteger;
    fDMMapaProd.mMapa_TalaoReferencia.AsString      := fDMMapaProd.cdsConsulta_TalaoREFERENCIA.AsString;
    fDMMapaProd.mMapa_TalaoNome_Produto.AsString    := fDMMapaProd.cdsConsulta_TalaoNOME_PRODUTO.AsString;
    fDMMapaProd.mMapa_TalaoNome_Combinacao.AsString := fDMMapaProd.cdsConsulta_TalaoNOME_COMBINACAO.AsString;
    fDMMapaProd.mMapa_TalaoQtd.AsInteger            := fDMMapaProd.cdsConsulta_TalaoQTD.AsInteger;

    vItemAux := 1;
    fDMMapaProd.cdsSetD.Close;
    fDMMapaProd.sdsSetD.ParamByName('NUM_LOTE').AsInteger  := fDMMapaProd.cdsConsulta_TalaoNUM_LOTE.AsInteger;
    fDMMapaProd.sdsSetD.ParamByName('NUM_TALAO').AsInteger := fDMMapaProd.cdsConsulta_TalaoNUM_TALAO.AsInteger;
    fDMMapaProd.cdsSetD.Open;
    fDMMapaProd.cdsSetD.First;
    while not fDMMapaProd.cdsSetD.Eof do
    begin
      if fDMMapaProd.cdsSetDDTSAIDA.AsDateTime > 10 then
        fDMMapaProd.mMapa_Talao.FieldByName('Data'+IntToStr(vItemAux)).AsString := IntToStr(DayOf(fDMMapaProd.cdsSetDDTSAIDA.AsDateTime)) + '/' + IntToStr(MonthOf(fDMMapaProd.cdsSetDDTSAIDA.AsDateTime));
      if fDMMapaProd.mSetorLote.Locate('NUM_LOTE;ID_SETOR',VarArrayOf([fDMMapaProd.cdsConsulta_TalaoNUM_LOTE.AsInteger,fDMMapaProd.cdsSetDID_SETOR.AsInteger]),[locaseinsensitive]) then
      begin
        fDMMapaProd.mSetorLote.Edit;
        if fDMMapaProd.cdsSetDDTSAIDA.AsDateTime > 10 then
          fDMMapaProd.mSetorLoteQUANTIDADE_ENCERRADO.AsFloat := fDMMapaProd.mSetorLoteQUANTIDADE_ENCERRADO.AsFloat + fDMMapaProd.cdsSetDQTD.AsFloat
        else
          fDMMapaProd.mSetorLoteQUANTIDADE.AsFloat := fDMMapaProd.mSetorLoteQUANTIDADE.AsFloat + fDMMapaProd.cdsSetDQTD.AsFloat;
        fDMMapaProd.mSetorLote.Post;
      end
      else
      begin
        fDMMapaProd.mSetorLote.Insert;
        fDMMapaProd.mSetorLoteNUM_LOTE.AsInteger := fDMMapaProd.cdsConsulta_TalaoNUM_LOTE.AsInteger;
        fDMMapaProd.mSetorLoteID_SETOR.AsInteger := fDMMapaProd.cdsSetDID_SETOR.AsInteger;
        fDMMapaProd.mSetorLoteNOME_SETOR.AsString := fDMMapaProd.cdsSetDNOME.AsString;
        fDMMapaProd.mSetorLoteAGRUPAR.AsString    := fDMMapaProd.cdsConsulta_TalaoNUM_ORDEM.AsString + '.' + fDMMapaProd.cdsConsulta_TalaoID_PRODUTO.AsString + '.' + fDMMapaProd.cdsConsulta_TalaoID_COMBINACAO.AsString;
        if fDMMapaProd.cdsSetDDTSAIDA.AsDateTime > 10 then
          fDMMapaProd.mSetorLoteQUANTIDADE_ENCERRADO.AsFloat := fDMMapaProd.mSetorLoteQUANTIDADE_ENCERRADO.AsFloat + fDMMapaProd.cdsSetDQTD.AsFloat
        else
          fDMMapaProd.mSetorLoteQUANTIDADE.AsFloat := fDMMapaProd.mSetorLoteQUANTIDADE.AsFloat + fDMMapaProd.cdsSetDQTD.AsFloat;
        fDMMapaProd.mSetorLote.Post;
      end;

      fDMMapaProd.cdsSetD.Next;
      inc(vItemAux);
    end;
    fDMMapaProd.mMapa_Talao.Post;

    vIDProd := fDMMapaProd.cdsConsulta_TalaoID_PRODUTO.AsInteger;
    vNumOP  := fDMMapaProd.cdsConsulta_TalaoNUM_ORDEM.AsInteger;
    fDMMapaProd.cdsConsulta_Talao.Next;
  end;
  fDMMapaProd.mMapa_Talao.IndexFieldNames := 'Num_Ordem;Num_Lote;NUM_TALAO;Tipo';
  fDMMapaProd.mSetorLote.IndexFieldNames := 'NUM_LOTE;ID_SETOR';
  fDMMapaProd.cdsSetorM.Close;
  fDMMapaProd.cdsSetorM.Open;

  vItemAux := 0;
  fDMMapaProd.cdsSetorM.First;
  while not fDMMapaProd.cdsSetorM.Eof do
  begin
    vItemAux := vItemAux + 1;

    for i := 1 to SMDBGrid2.ColCount - 2 do
    begin
      if (SMDBGrid2.Columns[i].FieldName = 'Data'+IntToStr(vItemAux)) then
        SMDBGrid2.Columns[i].Title.Caption := fDMMapaProd.cdsSetorMNOME.AsString;
    end;

    fDMMapaProd.cdsSetorM.Next;
  end;

  while vItemAux < 9 do
  begin
    vItemAux := vItemAux + 1;
    for i := 1 to SMDBGrid2.ColCount - 2 do
    begin
      if (SMDBGrid2.Columns[i].FieldName = 'Data'+IntToStr(vItemAux)) then
        SMDBGrid2.Columns[i].Visible := False;
    end;
  end;
end;

procedure TfrmConsMapaProd.prc_Consultar_Talao;
var
  vComando : String;
begin
  vComando := '';
  case ComboBox2.ItemIndex of
    1 : vComando := ' AND T.DTBAIXA IS NULL ';
    2 : vComando := ' AND T.DTBAIXA IS NOT NULL ';
  end;
  fDMMapaProd.cdsConsulta_Talao.Close;
  fDMMapaProd.sdsConsulta_Talao.CommandText := fDMMapaProd.ctConsulta_Talao + vComando;
  fDMMapaProd.sdsConsulta_Talao.ParamByName('NUM_INI').AsInteger := CurrencyEdit1.AsInteger;
  fDMMapaProd.sdsConsulta_Talao.ParamByName('NUM_FIN').AsInteger := CurrencyEdit2.AsInteger;
  fDMMapaProd.cdsConsulta_Talao.Open;
  fDMMapaProd.cdsConsulta_Talao.IndexFieldNames := 'NUM_ORDEM;NUM_LOTE;NUM_TALAO';

  fDMMapaProd.cdsTotalGeral.Close;
  fDMMapaProd.sdsTotalGeral.ParamByName('ORDEM_INICIAL').AsInteger := CurrencyEdit1.AsInteger;
  fDMMapaProd.sdsTotalGeral.ParamByName('ORDEM_FINAL').AsInteger   := CurrencyEdit2.AsInteger;
  fDMMapaProd.cdsTotalGeral.Open;
  fDMMapaProd.cdsTotalGeral.IndexFieldNames := 'TAMANHO';
end;

end.
