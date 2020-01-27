unit UConsBaixaMaterial_Prod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, NxCollection, NxPageControl, Mask, ToolEdit, CurrEdit,
  Grids, DBGrids, SMDBGrid, UDMBaixaMaterial_Prod, ExtCtrls, DB, NxEdit;

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
  private
    { Private declarations }
    fDMBaixaMaterial_Prod : TDMBaixaMaterial_Prod;

    procedure prc_ConsLoteMat_Prod;
    procedure prc_ConsPag_Ret; 
    procedure prc_ConsPag_Ret_Acum; 

  public
    { Public declarations }
  end;

var
  frmConsBaixaMaterial_Prod: TfrmConsBaixaMaterial_Prod;

implementation

uses uUtilPadrao, rsDBUtils;

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
  vComando := ' WHERE 0 = 0 ';
  if CurrencyEdit1.AsInteger > 0 then
    vComando := vComando + ' AND L.NUM_ORDEM = ' + IntToStr(CurrencyEdit1.AsInteger);
  if CurrencyEdit2.AsInteger > 0 then
    vComando := vComando + ' AND L.ITEM = ' + IntToStr(CurrencyEdit2.AsInteger);
  if CurrencyEdit3.AsInteger > 0 then
    vComando := vComando + ' AND L.ID_MATERIAL = ' + IntToStr(CurrencyEdit3.AsInteger);
  if trim(Edit2.Text) <> '' then
    vComando := vComando + ' AND M.NOME LIKE ' + QuotedStr('%'+Edit2.Text+'%');
  if trim(edtRef.Text) <> '' then
    vComando := vComando + ' AND L.REFERENCIA LIKE ' + QuotedStr('%'+edtRef.Text+'%');
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
  if StrToFloat(FormatFloat('0.0000',fDMBaixaMaterial_Prod.cdsConsLoteMat_ProdQTD_RETORNO.AsFloat)) <= 0 then
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
    prc_ConsPag_Ret_Acum;
end;

procedure TfrmConsBaixaMaterial_Prod.NxPageControl1Change(Sender: TObject);
begin
  Label9.Visible    := (NxPageControl1.ActivePage = TS_ConsPagRet) or (NxPageControl1.ActivePage = TS_ConsPagRet_Acum);
  Label10.Visible   := (NxPageControl1.ActivePage = TS_ConsPagRet) or (NxPageControl1.ActivePage = TS_ConsPagRet_Acum);
  Label11.Visible   := (NxPageControl1.ActivePage = TS_ConsPagRet) or (NxPageControl1.ActivePage = TS_ConsPagRet_Acum);
  Label12.Visible   := (NxPageControl1.ActivePage = TS_ConsPagRet) or (NxPageControl1.ActivePage = TS_ConsPagRet_Acum);
  DateEdit1.Visible := (NxPageControl1.ActivePage = TS_ConsPagRet) or (NxPageControl1.ActivePage = TS_ConsPagRet_Acum);
  DateEdit2.Visible := (NxPageControl1.ActivePage = TS_ConsPagRet) or (NxPageControl1.ActivePage = TS_ConsPagRet_Acum);
  DateEdit3.Visible := (NxPageControl1.ActivePage = TS_ConsPagRet) or (NxPageControl1.ActivePage = TS_ConsPagRet_Acum);
  DateEdit4.Visible := (NxPageControl1.ActivePage = TS_ConsPagRet) or (NxPageControl1.ActivePage = TS_ConsPagRet_Acum);
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
  vComando := ' WHERE 0 = 0 ';
  if CurrencyEdit1.AsInteger > 0 then
    vComando := vComando + ' AND L.NUM_ORDEM = ' + IntToStr(CurrencyEdit1.AsInteger);
  if CurrencyEdit2.AsInteger > 0 then
    vComando := vComando + ' AND L.ITEM = ' + IntToStr(CurrencyEdit2.AsInteger);
  if CurrencyEdit3.AsInteger > 0 then
    vComando := vComando + ' AND L.ID_MATERIAL = ' + IntToStr(CurrencyEdit3.AsInteger);
  if trim(Edit2.Text) <> '' then
    vComando := vComando + ' AND M.NOME LIKE ' + QuotedStr('%'+Edit2.Text+'%');
  if trim(edtRef.Text) <> '' then
    vComando := vComando + ' AND L.REFERENCIA LIKE ' + QuotedStr('%'+edtRef.Text+'%');
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
            + 'left join COMBINACAO CMAT on L.ID_COR_MATERIAL = CMAT.ID '
            + 'WHERE 0 = 0 ';
  if CurrencyEdit1.AsInteger > 0 then
    vComando := vComando + ' AND L.NUM_ORDEM = ' + IntToStr(CurrencyEdit1.AsInteger);
  if CurrencyEdit2.AsInteger > 0 then
    vComando := vComando + ' AND L.ITEM = ' + IntToStr(CurrencyEdit2.AsInteger);
  if CurrencyEdit3.AsInteger > 0 then
    vComando := vComando + ' AND L.ID_MATERIAL = ' + IntToStr(CurrencyEdit3.AsInteger);
  if trim(Edit2.Text) <> '' then
    vComando := vComando + ' AND M.NOME LIKE ' + QuotedStr('%'+Edit2.Text+'%');
  if trim(edtRef.Text) <> '' then
    vComando := vComando + ' AND L.REFERENCIA LIKE ' + QuotedStr('%'+edtRef.Text+'%');
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

end.
