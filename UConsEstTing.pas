unit UConsEstTing;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMConsProc, ExtCtrls, StdCtrls, NxCollection, Grids, DBGrids,
  SMDBGrid, ComCtrls, RzPanel;

type
  TfrmConsEstTing = class(TForm)
    Panel1: TPanel;
    ComboBox1: TComboBox;
    Label1: TLabel;
    btnConsultar: TNxButton;
    SMDBGrid1: TSMDBGrid;
    ProgressBar1: TProgressBar;
    gbxVendedor: TRzGroupBox;
    SMDBGrid2: TSMDBGrid;
    btnImprimir: TNxButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConsultarClick(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    procedure prc_Consultar;
    procedure prc_Le_cdsEstTing;

  public
    { Public declarations }
    fDMConsProc: TDMConsProc;

  end;

var
  frmConsEstTing: TfrmConsEstTing;

implementation

uses rsDBUtils, DB;

{$R *.dfm}

procedure TfrmConsEstTing.FormShow(Sender: TObject);
begin
  fDMConsProc:= TDMConsProc.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsProc);
end;

procedure TfrmConsEstTing.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsEstTing.btnConsultarClick(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  SMDBGrid1.DisableScroll;
  fDMConsProc.mEstTing.EmptyDataSet;
  fDMConsProc.mEstTing_Cru.EmptyDataSet;
  try
    prc_Consultar;
    prc_Le_cdsEstTing;
  finally
    SMDBGrid1.EnableScroll;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmConsEstTing.prc_Consultar;
var
  vComando : String;
begin
  vComando := fDMConsProc.ctEstTing;
  case ComboBox1.ItemIndex of
    1 : vComando := vComando + ' AND VCOMB.TIPO_PRODUCAO = ' + QuotedStr('T');
    2 : vComando := vComando + ' AND VCOMB.TIPO_PRODUCAO = ' + QuotedStr('E');
  end;
  fDMConsProc.cdsEstTing.Close;
  fDMConsProc.sdsEstTing.CommandText := vComando;
  fDMConsProc.cdsEstTing.Open;
end;

procedure TfrmConsEstTing.prc_Le_cdsEstTing;
begin
  ProgressBar1.Visible  := True;
  ProgressBar1.Max      := fDMConsProc.cdsEstTing.RecordCount;
  ProgressBar1.Position := 0;
  Refresh;
  fDMConsProc.cdsEstTing.First;
  while not fDMConsProc.cdsEstTing.Eof do
  begin
    ProgressBar1.Position := ProgressBar1.Position + 1;
    if fDMConsProc.mEstTing.Locate('ID_Material;ID_Cor;DtEntrega;Tipo_Producao',VarArrayOf([fDMConsProc.cdsEstTingID_MATERIAL.AsInteger,
                                                                              fDMConsProc.cdsEstTingID_COR_MAT.AsInteger,
                                                                              fDMConsProc.cdsEstTingDTENTREGA.AsDateTime,
                                                                              fDMConsProc.cdsEstTingTIPO_PRODUCAO.AsString]),[locaseinsensitive]) then
      fDMConsProc.mEstTing.Edit
    else
    begin
      fDMConsProc.mEstTing.Insert;
      fDMConsProc.mEstTingID_Material.AsInteger      := fDMConsProc.cdsEstTingID_MATERIAL.AsInteger;
      fDMConsProc.mEstTingID_Cor.AsInteger           := fDMConsProc.cdsEstTingID_COR_MAT.AsInteger;
      fDMConsProc.mEstTingDtEntrega.AsDateTime       := fDMConsProc.cdsEstTingDTENTREGA.AsDateTime;
      fDMConsProc.mEstTingID_Material_Cru.AsInteger  := fDMConsProc.cdsEstTingID_MATERIAL_CRU.AsInteger;
      fDMConsProc.mEstTingNome_Material.AsString     := fDMConsProc.cdsEstTingMATERIAL.AsString;
      fDMConsProc.mEstTingNome_Cor.AsString          := fDMConsProc.cdsEstTingNOME_COR.AsString;
      fDMConsProc.mEstTingNome_Material_Cru.AsString := fDMConsProc.cdsEstTingNOME_MATERIAL_CRU.AsString;
      fDMConsProc.mEstTingTipo_Producao.AsString     := fDMConsProc.cdsEstTingTIPO_PRODUCAO.AsString;
      if fDMConsProc.cdsEstTingTIPO_PRODUCAO.AsString = 'T' then
        fDMConsProc.mEstTingDesc_Tipo_Producao.AsString := 'Trançadeira'
      else
        fDMConsProc.mEstTingDesc_Tipo_Producao.AsString := 'Tear';
    end;
    if fDMConsProc.mEstTingID_Material_Cru.AsInteger > 0 then
      fDMConsProc.mEstTingConsumo_Cru.AsFloat := StrToFloat(FormatFloat('0.0000',fDMConsProc.mEstTingConsumo_Cru.AsFloat + (fDMConsProc.cdsEstTingQTD_CONSUMO.AsFloat * fDMConsProc.cdsEstTingQTD.AsFloat)));
    fDMConsProc.mEstTingConsumo.AsFloat := StrToFloat(FormatFloat('0.0000',fDMConsProc.mEstTingConsumo.AsFloat + (fDMConsProc.cdsEstTingQTD_CONSUMO.AsFloat * fDMConsProc.cdsEstTingQTD.AsFloat)));
    fDMConsProc.mEstTing.Post;

    //Cru
    if fDMConsProc.mEstTingID_Material_Cru.AsInteger > 0 then
    begin
      if fDMConsProc.mEstTing_Cru.Locate('ID_Material',fDMConsProc.cdsEstTingID_MATERIAL_CRU.AsInteger,[loCaseInsensitive]) then
        fDMConsProc.mEstTing_Cru.Edit
      else
      begin
        fDMConsProc.mEstTing_Cru.Insert;
        fDMConsProc.mEstTing_CruID_Material.AsInteger  := fDMConsProc.cdsEstTingID_MATERIAL_CRU.AsInteger;
        fDMConsProc.mEstTing_CruNome_Material.AsString := fDMConsProc.cdsEstTingNOME_MATERIAL_CRU.AsString;
      end;
      fDMConsProc.mEstTing_CruConsumo.AsFloat := fDMConsProc.mEstTing_CruConsumo.AsFloat + (fDMConsProc.cdsEstTingQTD_CONSUMO.AsFloat * fDMConsProc.cdsEstTingQTD.AsFloat);
      fDMConsProc.mEstTing_Cru.Post;
    end;
    //*************

    fDMConsProc.cdsEstTing.Next;
  end;
  ProgressBar1.Visible := False;
end;

procedure TfrmConsEstTing.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  fDMConsProc.mEstTing.IndexFieldNames := Column.FieldName;
  if Column.FieldName = 'Desc_Tipo_Producao' then
    fDMConsProc.mEstTing.IndexFieldNames := Column.FieldName + ';DtEntrega';
  if Column.FieldName = 'Nome_Cor' then
    fDMConsProc.mEstTing.IndexFieldNames := Column.FieldName + ';DtEntrega;ID_Material';
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I] = Column) then
      SMDBGrid1.Columns.Items[I].Title.Color := $00BBFFBB;
end;

procedure TfrmConsEstTing.btnImprimirClick(Sender: TObject);
var
  vArq: String;
begin
  if copy(fDMConsProc.mEstTing.IndexFieldNames,1,8) = 'Nome_Cor' then
    vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\EstTingimento_Cor.fr3'
  else
  begin
    fDMConsProc.mEstTing.IndexFieldNames := 'DtEntrega;Nome_Material;Nome_Cor';
    vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\EstTingimento.fr3';
  end;
  if FileExists(vArq) then
    fDMConsProc.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    MessageDlg('*** Relatório ' + vArq + ', não encontrado!' , mtInformation, [mbOk], 0);
    exit;
  end;
  //fDMLoteImp.frxReport1.variables['ImpOpcao'] := QuotedStr(vOpcaoImp);
  fDMConsProc.frxReport1.ShowReport;
end;

end.
