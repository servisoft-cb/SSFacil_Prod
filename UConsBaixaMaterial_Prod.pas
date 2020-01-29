unit UConsBaixaMaterial_Prod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, NxCollection, NxPageControl, Mask, ToolEdit, CurrEdit,
  Grids, DBGrids, SMDBGrid, UDMBaixaMaterial_Prod, ExtCtrls, DB, NxEdit, SqlExpr, ComObj;

type
  TfrmConsBaixaMaterial_Prod = class(TForm)
    NxPanel1: TNxPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    CurrencyEdit3: TCurrencyEdit;
    Edit2: TEdit;
    btnConsultar: TNxButton;
    Label1: TLabel;
    edtRef: TEdit;
    Label8: TLabel;
    NxComboBox1: TNxComboBox;
    NxPageControl1: TNxPageControl;
    TS_Consulta: TNxTabSheet;
    SMDBGrid1: TSMDBGrid;
    TS_ConsPagRet: TNxTabSheet;
    Label9: TLabel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Label10: TLabel;
    Label11: TLabel;
    DateEdit3: TDateEdit;
    DateEdit4: TDateEdit;
    Label12: TLabel;
    SMDBGrid2: TSMDBGrid;
    Panel1: TPanel;
    Shape1: TShape;
    Label6: TLabel;
    Shape2: TShape;
    Label7: TLabel;
    Panel2: TPanel;
    Shape3: TShape;
    Label13: TLabel;
    Shape4: TShape;
    Label14: TLabel;
    TS_ConsPagRet_Acum: TNxTabSheet;
    SMDBGrid3: TSMDBGrid;
    Panel3: TPanel;
    Shape5: TShape;
    Label15: TLabel;
    Shape6: TShape;
    Label16: TLabel;
    TS_Ref: TNxTabSheet;
    SMDBGrid4: TSMDBGrid;
    Label17: TLabel;
    DateEdit5: TDateEdit;
    DateEdit6: TDateEdit;
    Label18: TLabel;
    TS_Ref_Geracao: TNxTabSheet;
    SMDBGrid5: TSMDBGrid;
    btnImprimir: TNxButton;
    btnExcel: TNxButton;
    Panel4: TPanel;
    Shape8: TShape;
    Label20: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnConsultarClick(Sender: TObject);
    procedure NxPageControl1Change(Sender: TObject);
    procedure SMDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure SMDBGrid3GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure SMDBGrid2TitleClick(Column: TColumn);
    procedure SMDBGrid3TitleClick(Column: TColumn);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure SMDBGrid5TitleClick(Column: TColumn);
    procedure SMDBGrid5GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }
    fDMBaixaMaterial_Prod : TDMBaixaMaterial_Prod;
    vOpcaoImp : String;

    procedure prc_ConsLoteMat_Prod;
    procedure prc_ConsPag_Ret;
    procedure prc_ConsPag_Ret_Acum;
    procedure prc_ConsPag_Ret_Ref;
    procedure prc_ConsPag_Ret_Ref_Geracao;
    procedure prc_Monta_Opcao;

    procedure prc_CriaExcel(vDados: TDataSource; Grid : TSMDBGrid);

    procedure prc_Imprimir_ConsPag_Ret_Ref_Geracao;

    function fnc_Monta_Condicao : String;

  public
    { Public declarations }
  end;

var
  frmConsBaixaMaterial_Prod: TfrmConsBaixaMaterial_Prod;

implementation

uses uUtilPadrao, rsDBUtils, DmdDatabase, StrUtils;

{$R *.dfm}

procedure TfrmConsBaixaMaterial_Prod.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(fDMBaixaMaterial_Prod);
  Action := Cafree;
end;

procedure TfrmConsBaixaMaterial_Prod.prc_ConsLoteMat_Prod;
var
  vComando : String;
begin
  vComando := fnc_Monta_Condicao;
  fDMBaixaMaterial_Prod.cdsConsLoteMat_Prod.Close;
  fDMBaixaMaterial_Prod.sdsConsLoteMat_Prod.CommandText := fDMBaixaMaterial_Prod.ctConsLoteMat_Prod + vComando;
  fDMBaixaMaterial_Prod.cdsConsLoteMat_Prod.Open;
end;

procedure TfrmConsBaixaMaterial_Prod.FormShow(Sender: TObject);
begin
  fDMBaixaMaterial_Prod:= TDMBaixaMaterial_Prod.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMBaixaMaterial_Prod);
  NxPageControl1.ActivePage := TS_Consulta;
end;

procedure TfrmConsBaixaMaterial_Prod.SMDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if StrToFloat(FormatFloat('0.0000',fDMBaixaMaterial_Prod.cdsConsLoteMat_ProdQTD_PAGO.AsFloat)) <= 0 then
  begin
    Background  := clYellow;
    AFont.Color := clBlack;
  end
  else
  if (StrToFloat(FormatFloat('0.0000',fDMBaixaMaterial_Prod.cdsConsLoteMat_ProdQTD_RETORNO.AsFloat)) <= 0) and (fDMBaixaMaterial_Prod.cdsLote_Mat_ProdFINALIZADO.AsString <> 'S')  then
  begin
    Background  := $004080FF;
    AFont.Color := clBlack;
  end;
end;

procedure TfrmConsBaixaMaterial_Prod.btnConsultarClick(Sender: TObject);
begin
  if NxPageControl1.ActivePage = TS_Consulta then
    prc_ConsLoteMat_Prod
  else
  if NxPageControl1.ActivePage = TS_ConsPagRet then
    prc_ConsPag_Ret
  else
  if NxPageControl1.ActivePage = TS_ConsPagRet_Acum then
    prc_ConsPag_Ret_Acum
  else
  if NxPageControl1.ActivePage = TS_Ref then
    prc_ConsPag_Ret_Ref
  else
  if NxPageControl1.ActivePage = TS_Ref_Geracao then
    prc_ConsPag_Ret_Ref_Geracao;
end;

procedure TfrmConsBaixaMaterial_Prod.NxPageControl1Change(Sender: TObject);
begin
  Label9.Visible    := (NxPageControl1.ActivePage = TS_ConsPagRet) or (NxPageControl1.ActivePage = TS_ConsPagRet_Acum) or (NxPageControl1.ActivePage = TS_Ref);
  Label10.Visible   := (NxPageControl1.ActivePage = TS_ConsPagRet) or (NxPageControl1.ActivePage = TS_ConsPagRet_Acum) or (NxPageControl1.ActivePage = TS_Ref);
  Label11.Visible   := (NxPageControl1.ActivePage = TS_ConsPagRet) or (NxPageControl1.ActivePage = TS_ConsPagRet_Acum) or (NxPageControl1.ActivePage = TS_Ref);
  Label12.Visible   := (NxPageControl1.ActivePage = TS_ConsPagRet) or (NxPageControl1.ActivePage = TS_ConsPagRet_Acum) or (NxPageControl1.ActivePage = TS_Ref);
  DateEdit1.Visible := (NxPageControl1.ActivePage = TS_ConsPagRet) or (NxPageControl1.ActivePage = TS_ConsPagRet_Acum) or (NxPageControl1.ActivePage = TS_Ref);
  DateEdit2.Visible := (NxPageControl1.ActivePage = TS_ConsPagRet) or (NxPageControl1.ActivePage = TS_ConsPagRet_Acum) or (NxPageControl1.ActivePage = TS_Ref);
  DateEdit3.Visible := (NxPageControl1.ActivePage = TS_ConsPagRet) or (NxPageControl1.ActivePage = TS_ConsPagRet_Acum) or (NxPageControl1.ActivePage = TS_Ref);
  DateEdit4.Visible := (NxPageControl1.ActivePage = TS_ConsPagRet) or (NxPageControl1.ActivePage = TS_ConsPagRet_Acum) or (NxPageControl1.ActivePage = TS_Ref);
end;

procedure TfrmConsBaixaMaterial_Prod.prc_ConsPag_Ret;
var
  vComando : String;
  vTexto : String;
begin
  if (DateEdit1.Date <= 10) and (DateEdit2.Date <= 10) and (DateEdit3.Date <= 10) and (DateEdit4.Date <= 10) then
  begin
    MessageDlg('*** É obrigatório informar uma data de Pagamento ou Retorno!',mtInformation,[mbOk],0);
    Exit;
  end;
  vComando := fnc_Monta_Condicao;
  vTexto := '';
  if (DateEdit1.Date > 10) or (DateEdit2.Date > 10) then
  begin
    vTexto := ' (LP.TIPO_ES = ' + QuotedStr('S');
    if (DateEdit1.Date > 10) then
      vTexto := vTexto + ' AND LP.DATA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
    if (DateEdit2.Date > 10) then
      vTexto := vTexto + ' AND LP.DATA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
    vTexto := vTexto + ') ';
    //vComando := vComando + ' AND ' + vTexto;
  end;
  if (DateEdit3.Date > 10) or (DateEdit4.Date > 10) then
  begin
    if vTexto <> '' then
      vTexto := ' (' + vTexto + ' OR ('
    else
      vTexto := vTexto + ' (';
    vTexto := vTexto + ' LP.TIPO_ES = ' + QuotedStr('E');
    if (DateEdit3.Date > 10) then
      vTexto := vTexto + ' AND LP.DATA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit3.date));
    if (DateEdit4.Date > 10) then
      vTexto := vTexto + ' AND LP.DATA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit4.date));
    vTexto := vTexto + ')';
    if (DateEdit1.Date > 10) or (DateEdit2.Date > 10) then
      vTexto := vTexto + ')';
    //vComando := vComando + vTexto;
  end;
  if vTexto <> '' then
    vComando := vComando + ' AND ' + vTexto;

  fDMBaixaMaterial_Prod.cdsConsPagRet.Close;
  fDMBaixaMaterial_Prod.sdsConsPagRet.CommandText := fDMBaixaMaterial_Prod.ctConsPagRet + vComando;
  fDMBaixaMaterial_Prod.cdsConsPagRet.Open;
end;

procedure TfrmConsBaixaMaterial_Prod.SMDBGrid2GetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  if fDMBaixaMaterial_Prod.cdsConsPagRetTIPO_ES.AsString = 'S' then
  begin
    Background  := $00FFFFBB;
    AFont.Color := clBlack;
  end
  else
  if fDMBaixaMaterial_Prod.cdsConsPagRetTIPO_ES.AsString = 'E' then
  begin
    Background  := $0086FF0D;
    AFont.Color := clBlack;
  end;
end;

procedure TfrmConsBaixaMaterial_Prod.prc_ConsPag_Ret_Acum;
var
  vComando: String;
  vTexto: String;
begin
  if (DateEdit1.Date <= 10) and (DateEdit2.Date <= 10) and (DateEdit3.Date <= 10) and (DateEdit4.Date <= 10) then
  begin
    MessageDlg('*** É obrigatório informar uma data de Pagamento ou Retorno!',mtInformation,[mbOk],0);
    Exit;
  end;
  vComando := 'select L.ID_MATERIAL, L.ID_COR_MATERIAL, M.NOME NOME_MATERIAL, CMAT.NOME NOME_COR_MAT, M.UNIDADE UNIDADE_MATERIAL, LP.TIPO_ES, SUM(LP.QTD) QTD, '
            + ' case '
            + '   when LP.TIPO_ES = ' + QuotedStr('S') + ' then ' + QuotedStr('Pagamento')
            + '   when LP.TIPO_ES = ' + QuotedStr('E') + ' then ' + QuotedStr('Retorno')
            + ' else ' + QuotedStr ('')
            + ' end DESC_TIPO '
            + 'from LOTE_MAT_PROD L '
            + 'inner join LOTE_MAT_PROD_EST LP on L.ID = LP.ID and L.ITEM = LP.ITEM '
            + 'inner join PRODUTO M on L.ID_MATERIAL = M.ID '
            + 'left join COMBINACAO CMAT on L.ID_COR_MATERIAL = CMAT.ID ';
  vComando := vComando + fnc_Monta_Condicao;

  vTexto := '';
  if (DateEdit1.Date > 10) or (DateEdit2.Date > 10) then
  begin
    vTexto := ' (LP.TIPO_ES = ' + QuotedStr('S');
    if (DateEdit1.Date > 10) then
      vTexto := vTexto + ' AND LP.DATA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
    if (DateEdit2.Date > 10) then
      vTexto := vTexto + ' AND LP.DATA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
    vTexto := vTexto + ') ';
  end;
  if (DateEdit3.Date > 10) or (DateEdit4.Date > 10) then
  begin
    if vTexto <> '' then
      vTexto := ' (' + vTexto + ' OR ('
    else
      vTexto := vTexto + ' (';
    vTexto := vTexto + ' LP.TIPO_ES = ' + QuotedStr('E');
    if (DateEdit3.Date > 10) then
      vTexto := vTexto + ' AND LP.DATA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit3.date));
    if (DateEdit4.Date > 10) then
      vTexto := vTexto + ' AND LP.DATA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit4.date));
    vTexto := vTexto + ')';
    if (DateEdit1.Date > 10) or (DateEdit2.Date > 10) then
      vTexto := vTexto + ')';
    //vComando := vComando + vTexto;
  end;
  if vTexto <> '' then
    vComando := vComando + ' AND ' + vTexto
              + ' GROUP BY L.ID_MATERIAL, L.ID_COR_MATERIAL, M.NOME, CMAT.NOME, M.UNIDADE, LP.TIPO_ES ';
  fDMBaixaMaterial_Prod.cdsConsPagRet_Acum.Close;
  fDMBaixaMaterial_Prod.sdsConsPagRet_Acum.CommandText := vComando;
  fDMBaixaMaterial_Prod.cdsConsPagRet_Acum.Open;
end;

procedure TfrmConsBaixaMaterial_Prod.SMDBGrid3GetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  if fDMBaixaMaterial_Prod.cdsConsPagRet_AcumTIPO_ES.AsString = 'S' then
  begin
    Background  := $00FFFFBB;
    AFont.Color := clBlack;
  end
  else
  if fDMBaixaMaterial_Prod.cdsConsPagRet_AcumTIPO_ES.AsString = 'E' then
  begin
    Background  := $0086FF0D;
    AFont.Color := clBlack;
  end;
end;

procedure TfrmConsBaixaMaterial_Prod.SMDBGrid2TitleClick(Column: TColumn);
begin
  fDMBaixaMaterial_Prod.cdsConsPagRet.IndexFieldNames := Column.FieldName;
end;

procedure TfrmConsBaixaMaterial_Prod.SMDBGrid3TitleClick(Column: TColumn);
begin
  fDMBaixaMaterial_Prod.cdsConsPagRet_Acum.IndexFieldNames := Column.FieldName;
end;

procedure TfrmConsBaixaMaterial_Prod.SMDBGrid1TitleClick(Column: TColumn);
begin
  fDMBaixaMaterial_Prod.cdsConsLoteMat_Prod.IndexFieldNames := Column.FieldName;
end;

procedure TfrmConsBaixaMaterial_Prod.prc_ConsPag_Ret_Ref;
var
  sds: TSQLDataSet;
  vComando, vTexto : String;
begin
  fDMBaixaMaterial_Prod.mPagRet_Ref.EmptyDataSet;
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := '';
    vComando := 'select L.ID_MATERIAL, L.ID_COR_MATERIAL, L.referencia,M.NOME NOME_MATERIAL, CMAT.NOME NOME_COR_MATERIAL, '
              + 'M.UNIDADE UNIDADE_MATERIAL, LP.TIPO_ES, SUM(LP.QTD) QTD, CPROD.NOME NOME_COR_PRODUTO, L.id_cor_produto, '
              + ' case '
              + '   when LP.TIPO_ES = ' + QuotedStr('S') + ' then ' + QuotedStr('Pagamento')
              + '   when LP.TIPO_ES = ' + QuotedStr('E') + ' then ' + QuotedStr('Retorno')
              + ' else ' + QuotedStr ('')
              + ' end DESC_TIPO '
              + 'from LOTE_MAT_PROD L '
              + 'inner join LOTE_MAT_PROD_EST LP on L.ID = LP.ID and L.ITEM = LP.ITEM '
              + 'inner join PRODUTO M on L.ID_MATERIAL = M.ID '
              + 'left join COMBINACAO CMAT on L.ID_COR_MATERIAL = CMAT.ID '
              + 'left join COMBINACAO CPROD on L.ID_COR_PRODUTO = CPROD.ID ';
    vComando := vComando + fnc_Monta_Condicao;
    vTexto := '';
    if (DateEdit1.Date > 10) or (DateEdit2.Date > 10) then
    begin
      vTexto := ' (LP.TIPO_ES = ' + QuotedStr('S');
      if (DateEdit1.Date > 10) then
        vTexto := vTexto + ' AND LP.DATA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
      if (DateEdit2.Date > 10) then
        vTexto := vTexto + ' AND LP.DATA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
      vTexto := vTexto + ') ';
    end;
    if (DateEdit3.Date > 10) or (DateEdit4.Date > 10) then
    begin
      if vTexto <> '' then
        vTexto := ' (' + vTexto + ' OR ('
      else
        vTexto := vTexto + ' (';
      vTexto := vTexto + ' LP.TIPO_ES = ' + QuotedStr('E');
      if (DateEdit3.Date > 10) then
        vTexto := vTexto + ' AND LP.DATA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit3.date));
      if (DateEdit4.Date > 10) then
        vTexto := vTexto + ' AND LP.DATA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit4.date));
      vTexto := vTexto + ')';
      if (DateEdit1.Date > 10) or (DateEdit2.Date > 10) then
        vTexto := vTexto + ')';
      //vComando := vComando + vTexto;
    end;
    if vTexto <> '' then
      vComando := vComando + ' AND ' + vTexto
                + ' GROUP BY L.ID_MATERIAL, L.ID_COR_MATERIAL, M.NOME, CMAT.NOME, M.UNIDADE, LP.TIPO_ES, CPROD.NOME, L.id_cor_produto, L.REFERENCIA ';
    sds.CommandText   := vComando;
    sds.Open;
    while not sds.Eof do
    begin
      if (fDMBaixaMaterial_Prod.mPagRet_Ref.Locate('Referencia;ID_Cor_Produto;ID_Material;ID_Cor_Material',VarArrayOf([sds.FieldByName('Referencia').AsString,
                                    sds.FieldByName('ID_Cor_Produto').AsInteger,sds.FieldByName('ID_Material').AsInteger,
                                    sds.FieldByName('ID_Cor_Material').AsInteger]),[locaseinsensitive])) then
        fDMBaixaMaterial_Prod.mPagRet_Ref.Edit
      else
      begin
        fDMBaixaMaterial_Prod.mPagRet_Ref.Insert;
        fDMBaixaMaterial_Prod.mPagRet_RefReferencia.AsString        := sds.FieldByName('Referencia').AsString;
        fDMBaixaMaterial_Prod.mPagRet_RefID_Cor_Produto.AsInteger   := sds.FieldByName('ID_Cor_Produto').AsInteger;
        fDMBaixaMaterial_Prod.mPagRet_RefID_Material.AsInteger      := sds.FieldByName('ID_Material').AsInteger;
        fDMBaixaMaterial_Prod.mPagRet_RefID_Cor_Material.AsInteger  := sds.FieldByName('ID_Cor_Material').AsInteger;
        fDMBaixaMaterial_Prod.mPagRet_RefNome_Cor_Produto.AsString  := sds.FieldByName('Nome_Cor_Produto').AsString;
        fDMBaixaMaterial_Prod.mPagRet_RefNome_Cor_Material.AsString := sds.FieldByName('Nome_Cor_Material').AsString;
        fDMBaixaMaterial_Prod.mPagRet_RefNome_Material.AsString     := sds.FieldByName('Nome_Material').AsString;
      end;
      if sds.FieldByName('Tipo_ES').AsString = 'E' then
        fDMBaixaMaterial_Prod.mPagRet_RefQtd_Retorno.AsFloat := fDMBaixaMaterial_Prod.mPagRet_RefQtd_Retorno.AsFloat + sds.FieldByName('QTD').AsFloat
      else
        fDMBaixaMaterial_Prod.mPagRet_RefQtd_Pagto.AsFloat := fDMBaixaMaterial_Prod.mPagRet_RefQtd_Pagto.AsFloat + sds.FieldByName('QTD').AsFloat;
      fDMBaixaMaterial_Prod.mPagRet_Ref.Post;
      sds.Next;
    end;
  finally
    FreeAndNil(sds);
  end;

end;

procedure TfrmConsBaixaMaterial_Prod.prc_ConsPag_Ret_Ref_Geracao;
var
  vComandoAux, vComandoAux2: String;
  i : Integer;
begin
  fDMBaixaMaterial_Prod.cdsConsPagRet_Ref_Geracao.Close;
  i := PosEx('GROUP',UpperCase(fDMBaixaMaterial_Prod.ctConsPagRet_Ref_Geracao),0);
  vComandoAux  := copy(fDMBaixaMaterial_Prod.ctConsPagRet_Ref_Geracao,i,Length(fDMBaixaMaterial_Prod.ctConsPagRet_Ref_Geracao) - i + 1);
  vComandoAux2 := copy(fDMBaixaMaterial_Prod.ctConsPagRet_Ref_Geracao,1,i-1);
  vComandoAux2 := vComandoAux2 + fnc_Monta_Condicao;

  fDMBaixaMaterial_Prod.sdsConsPagRet_Ref_Geracao.CommandText := vComandoAux2 + vComandoAux;
  fDMBaixaMaterial_Prod.cdsConsPagRet_Ref_Geracao.Open;
end;

function TfrmConsBaixaMaterial_Prod.fnc_Monta_Condicao: String;
begin
  Result := 'WHERE 0 = 0 ';
  if CurrencyEdit1.AsInteger > 0 then
    Result := Result + ' AND L.NUM_ORDEM = ' + IntToStr(CurrencyEdit1.AsInteger);
  if CurrencyEdit2.AsInteger > 0 then
    Result := Result + ' AND L.ITEM = ' + IntToStr(CurrencyEdit2.AsInteger);
  if CurrencyEdit3.AsInteger > 0 then
    Result := Result + ' AND L.ID_MATERIAL = ' + IntToStr(CurrencyEdit3.AsInteger);
  if trim(Edit2.Text) <> '' then
    Result := Result + ' AND M.NOME LIKE ' + QuotedStr('%'+Edit2.Text+'%');
  if trim(edtRef.Text) <> '' then
    Result := Result + ' AND L.REFERENCIA LIKE ' + QuotedStr('%'+edtRef.Text+'%');
  case NxComboBox1.ItemIndex of
    1 : Result := Result + ' AND COALESCE(L.QTD_PAGO,0) > 0 ';
    2 : Result := Result + ' AND COALESCE(L.QTD_RETORNO,0) > 0 ';
    3 : Result := Result + ' AND COALESCE(L.QTD_PAGO,0) <= 0 ';
    4 : Result := Result + ' AND COALESCE(L.QTD_RETORNO,0) <= 0 ';
  end;
  if DateEdit5.Date > 10 then
    Result := Result + ' AND L.DTGERACAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit5.date));
  if DateEdit6.Date > 10 then
    Result := Result + ' AND L.DTGERACAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit6.date));
end;

procedure TfrmConsBaixaMaterial_Prod.btnImprimirClick(Sender: TObject);
begin
  {if NxPageControl1.ActivePage = TS_Consulta then
    prc_Imprimir_ConsLoteMat_Prod
  else
  if NxPageControl1.ActivePage = TS_ConsPagRet then
    prc_Imprimir_ConsPag_Ret
  else
  if NxPageControl1.ActivePage = TS_ConsPagRet_Acum then
    prc_Imprimir_ConsPag_Ret_Acum
  else
  if NxPageControl1.ActivePage = TS_Ref then
    prc_Imprimir_ConsPag_Ret_Ref
  else}
  if NxPageControl1.ActivePage = TS_Ref_Geracao then
    prc_Imprimir_ConsPag_Ret_Ref_Geracao;
end;

procedure TfrmConsBaixaMaterial_Prod.prc_Imprimir_ConsPag_Ret_Ref_Geracao;
var
  vArq: String;
begin
  prc_Monta_Opcao;
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Material_PagRet_Ref_Geracao.fr3';
  if FileExists(vArq) then
    fDMBaixaMaterial_Prod.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    MessageDlg('*** Relatório ' + vArq + ', não encontrado!' , mtInformation, [mbOk], 0);
    exit;
  end;
  fDMBaixaMaterial_Prod.frxReport1.variables['ImpOpcao'] := QuotedStr(vOpcaoImp);
  fDMBaixaMaterial_Prod.frxReport1.ShowReport;
end;

procedure TfrmConsBaixaMaterial_Prod.prc_Monta_Opcao;
begin
  vOpcaoImp := '';
  if CurrencyEdit1.AsInteger > 0 then
    vOpcaoImp := vOpcaoImp + '(Nº OP: ' + CurrencyEdit1.Text + ')';
  if CurrencyEdit2.AsInteger > 0 then
    vOpcaoImp := vOpcaoImp + '(Item: ' + CurrencyEdit2.Text + ')';
  if CurrencyEdit3.AsInteger > 0 then
    vOpcaoImp := vOpcaoImp + '(ID Mat: ' + CurrencyEdit3.Text + ')';
  if trim(Edit2.Text) <> '' then
    vOpcaoImp := vOpcaoImp + '(Nome Mat: ' + Edit2.Text + ')';
  if trim(edtRef.Text) <> '' then
    vOpcaoImp := vOpcaoImp + '(Ref: ' + edtRef.Text + ')';
  case NxComboBox1.ItemIndex of
    1 : vOpcaoImp := vOpcaoImp + '(Com Pagamentos)';
    2 : vOpcaoImp := vOpcaoImp + '(Com Retornos)';
    3 : vOpcaoImp := vOpcaoImp + '(Sem Pagamento)';
    4 : vOpcaoImp := vOpcaoImp + '(Sem Retorno)';
  end;
  if (DateEdit5.Date > 10) and (DateEdit6.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt.Geração: ' + DateEdit5.Text + ' a ' + DateEdit6.Text + ')'
  else
  if (DateEdit5.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt.Geração Ini: ' + DateEdit5.Text + ')'
  else
  if (DateEdit6.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt.Geração Fin: ' + DateEdit6.Text + ')';

  if DateEdit1.Visible then
  begin
    if (DateEdit1.Date > 10) and (DateEdit2.Date > 10) then
      vOpcaoImp := vOpcaoImp + '(Dt.Pagto: ' + DateEdit1.Text + ' a ' + DateEdit2.Text + ')'
    else
    if (DateEdit1.Date > 10) then
      vOpcaoImp := vOpcaoImp + '(Dt.Pagto Ini: ' + DateEdit1.Text + ')'
    else
    if (DateEdit2.Date > 10) then
      vOpcaoImp := vOpcaoImp + '(Dt.Pagto Fin: ' + DateEdit2.Text + ')';

    if (DateEdit3.Date > 10) and (DateEdit4.Date > 10) then
      vOpcaoImp := vOpcaoImp + '(Dt.Retorno: ' + DateEdit3.Text + ' a ' + DateEdit4.Text + ')'
    else
    if (DateEdit3.Date > 10) then
      vOpcaoImp := vOpcaoImp + '(Dt.Retorno Ini: ' + DateEdit3.Text + ')'
    else
    if (DateEdit4.Date > 10) then
      vOpcaoImp := vOpcaoImp + '(Dt.Retorno Fin: ' + DateEdit4.Text + ')';
  end;
end;

procedure TfrmConsBaixaMaterial_Prod.btnExcelClick(Sender: TObject);
begin
  if NxPageControl1.ActivePage = TS_Consulta then
    prc_CriaExcel(SMDBGrid1.DataSource, SMDBGrid1)
  else
  if NxPageControl1.ActivePage = TS_ConsPagRet then
    prc_CriaExcel(SMDBGrid2.DataSource, SMDBGrid2)
  else
  if NxPageControl1.ActivePage = TS_ConsPagRet_Acum then
    prc_CriaExcel(SMDBGrid3.DataSource, SMDBGrid3)
  else
  if NxPageControl1.ActivePage = TS_Ref then
    prc_CriaExcel(SMDBGrid4.DataSource, SMDBGrid4)
  else
  if NxPageControl1.ActivePage = TS_Ref_Geracao then
    prc_CriaExcel(SMDBGrid4.DataSource, SMDBGrid5);
end;

procedure TfrmConsBaixaMaterial_Prod.prc_CriaExcel(vDados: TDataSource; Grid : TSMDBGrid);
var
  planilha: variant;
  vTexto: string;
begin
  grid.DisableScroll;
  Screen.Cursor := crHourGlass;
  vDados.DataSet.First;

  planilha := CreateOleObject('Excel.Application');
  planilha.WorkBooks.add(1);
  planilha.caption := 'Exportando dados do tela para o Excel';
  planilha.visible := true;

  prc_Preencher_Excel2(planilha, vDados, Grid);

  planilha.columns.Autofit;
  vTexto := ExtractFilePath(Application.ExeName);

  vTexto := vTexto + Name + '_ProdutoNCM_' + Grid.Name + '_' +  Monta_Numero(DateToStr(Date), 0);
  try
    planilha.ActiveWorkBook.SaveAs(vTexto);
  finally
    Screen.Cursor := crDefault;
  end;
  grid.EnableScroll;
end;

procedure TfrmConsBaixaMaterial_Prod.SMDBGrid5TitleClick(Column: TColumn);
begin
  fDMBaixaMaterial_Prod.cdsConsPagRet_Ref_Geracao.IndexFieldNames := Column.FieldName;
end;

procedure TfrmConsBaixaMaterial_Prod.SMDBGrid5GetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  if fDMBaixaMaterial_Prod.cdsConsPagRet_Ref_GeracaoFINALIZADO.AsString <> 'S' then
  begin
    Background  := $004080FF;
    AFont.Color := clBlack;
  end;
end;

end.
