unit UConsMatLote2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, CurrEdit, ExtCtrls, NxCollection,
  FMTBcd, DB, DBClient, Provider, SqlExpr, Grids, DBGrids, SMDBGrid,
  DBCtrls, UDMConsLote, DBVGrids, URelMatLote2;

type
  TfrmConsMatLote2 = class(TForm)
    Panel1: TPanel;
    btnConsultar: TNxButton;
    SMDBGrid1: TSMDBGrid;
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    Label2: TLabel;
    Label8: TLabel;
    Edit3: TEdit;
    VDBGrid1: TVDBGrid;
    btnImprimir: TNxButton;
    procedure btnConsultarClick(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    fDMConsLote: TDMConsLote;

    procedure prc_Consultar;
    procedure prc_Le_Mat_Lote;
    procedure prc_Gravar_mMat(Tamanho : String ; Qtd_Consumo : Real);

  public
    { Public declarations }
  end;

var
  frmConsMatLote2: TfrmConsMatLote2;

implementation

uses DmdDatabase, StrUtils, uUtilPadrao, rsDBUtils;


{$R *.dfm}

procedure TfrmConsMatLote2.btnConsultarClick(Sender: TObject);
begin
  if (CurrencyEdit1.AsInteger > 0) and (CurrencyEdit2.AsInteger <= 0) then
    CurrencyEdit2.AsInteger := CurrencyEdit1.AsInteger;
  if CurrencyEdit1.AsInteger > CurrencyEdit2.AsInteger then
  begin
    MessageDlg('*** Lote Inicial não pode ser maior que o Final!', mtError, [mbOk], 0);
    Exit;
  end;
  if (CurrencyEdit1.AsInteger <= 0) and (CurrencyEdit2.AsInteger <= 0) and (trim(Edit3.Text) = '') then
  begin
    MessageDlg('*** É obrigatório informar um Lote!', mtError, [mbOk], 0);
    Exit;
  end;

  prc_Consultar;
  prc_Le_Mat_Lote;

  fDMConsLote.mMat.IndexFieldNames := 'ID_Setor;Nome_Material;Nome_Cor';
end;

procedure TfrmConsMatLote2.prc_Consultar;
var
  vComando : String;
begin
  fDMConsLote.cdsMatLote.Close;
  if CurrencyEdit1.AsInteger > 0 then
    vComando := ' WHERE L.NUM_LOTE >= ' + IntToStr(CurrencyEdit1.AsInteger) + ' AND L.NUM_LOTE <= ' + IntToStr(CurrencyEdit2.AsInteger)
  else
    vComando := ' WHERE L.NUM_LOTE in (' + Edit3.Text + ')';
  vComando := fDMConsLote.ctMatLote + vComando;
  fDMConsLote.cdsMatLote.Close;
  fDMConsLote.sdsMatLote.CommandText := vComando;
  fDMConsLote.cdsMatLote.Open;
end;

procedure TfrmConsMatLote2.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: string;
begin
  ColunaOrdenada := Column.FieldName;
  fDMConsLote.mMat.IndexFieldNames := Column.FieldName;
  if Column.FieldName = 'NOME_POSICAO' then
    fDMConsLote.mMat.IndexFieldNames := Column.FieldName + ';NOME_MATERIAL';
end;

procedure TfrmConsMatLote2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(fDMConsLote);
  Action := Cafree;
end;

procedure TfrmConsMatLote2.FormShow(Sender: TObject);
begin
  fDMConsLote := TDMConsLote.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsLote);
end;

procedure TfrmConsMatLote2.CurrencyEdit2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_Return) and (CurrencyEdit2.AsInteger > 0) then
    prc_Consultar;
end;

procedure TfrmConsMatLote2.prc_Le_Mat_Lote;
var
  vTamanho : String;
  vQtdAux : Real;
  vAbrirTalao : Boolean;
  vTamAux : String;
begin
  fDMConsLote.mMat.First;
  while not fDMConsLote.mMat.Eof do
  begin
    fDMConsLote.mMatGrade.First;
    while not fDMConsLote.mMatGrade.Eof do
      fDMConsLote.mMatGrade.Delete;
    fDMConsLote.mMat.Delete;
  end;
  fDMConsLote.cdsMatLote.IndexFieldNames := 'ID_LOTE;ID_MATERIAL;ID_COR_MAT';
  fDMConsLote.cdsMatLote.First;                                            
  while not fDMConsLote.cdsMatLote.Eof do
  begin
    vTamanho := '';
    vQtdAux  := StrToFloat(FormatFloat('0.00000',fDMConsLote.cdsMatLoteQTD_CONSUMO.AsFloat));
    //if (fDMCadLote_Calc.cdsConsumoCalcID_GRADE_MAT.AsInteger > 0) or (fDMCadLote_Calc.cdsConsumoCalcTIPO_CONSUMO.AsString = 'T') then
    if (fDMConsLote.cdsMatLoteID_GRADE_MAT.AsInteger > 0) then
    begin
      vAbrirTalao := True;
      if (fDMConsLote.cdsTalao.Active) then
      begin
        fDMConsLote.cdsTalao.First;
        if fDMConsLote.cdsTalaoID.AsInteger = fDMConsLote.cdsMatLoteID_LOTE.AsInteger then
          vAbrirTalao := False;
      end;
      if vAbrirTalao then
      begin
        fDMConsLote.cdsTalao.Close;
        fDMConsLote.sdsTalao.ParamByName('ID').AsInteger := fDMConsLote.cdsMatLoteID_LOTE.AsInteger;
        fDMConsLote.cdsTalao.Open;
      end;
      fDMConsLote.cdsTalao.First;
      while not fDMConsLote.cdsTalao.Eof do
      begin
        {if (fDMConsLote.cdsConsumoCalcTIPO_CONSUMO.AsString = 'T') then
        begin
          fDMCadLote_Calc.qConsumo_Tam.Close;
          fDMCadLote_Calc.qConsumo_Tam.ParamByName('ID').AsInteger     := fDMCadLote_Calc.cdsConsumoCalcID.AsInteger;
          fDMCadLote_Calc.qConsumo_Tam.ParamByName('ITEM').AsInteger   := fDMCadLote_Calc.cdsConsumoCalcITEM_CONSUMO.AsInteger;
          fDMCadLote_Calc.qConsumo_Tam.ParamByName('TAMANHO').AsString := vTamanho;
          fDMCadLote_Calc.qConsumo_Tam.Open;
          vQtdAux := StrToFloat(FormatFloat('0.00000',fDMCadLote_Calc.qConsumo_TamQTD_CONSUMO.AsFloat));
        end;}
        if fDMConsLote.cdsMatLoteID_GRADE_MAT.AsInteger > 0 then
        begin
          vTamanho := fDMConsLote.cdsTalaoTAMANHO.AsString;
          vTamAux  := '';
          if fDMConsLote.qParametros_ProdUSA_TAM_REFER_GRADE.AsString = 'S' then
            vTamAux := fnc_Busca_Tam_Material2(fDMConsLote.cdsMatLoteID_MATERIAL.AsInteger,fDMConsLote.cdsMatLoteID_GRADE_PROD.AsInteger,vTamanho)
          else
            vTamAux := fnc_Busca_Tam_Material(fDMConsLote.cdsMatLoteID_MATERIAL.AsInteger,vTamanho);
          if trim(vTamAux) <> '' then
            vTamanho := vTamAux;
        end;
        //*************
        vQtdAux := StrToFloat(FormatFloat('0.0000',fDMConsLote.cdsTalaoQTD.AsFloat * fDMConsLote.cdsMatLoteQTD_CONSUMO.AsFloat));
        prc_Gravar_mMat(vTamanho,vQtdAux);

        fDMConsLote.cdsTalao.Next;
      end;
    end
    else
      prc_Gravar_mMat('',StrToFloat(FormatFloat('0.0000',vQtdAux * fDMConsLote.cdsMatLoteQTD.AsFloat)));

    fDMConsLote.cdsMatLote.Next;
  end;

end;

procedure TfrmConsMatLote2.prc_Gravar_mMat(Tamanho : String ; Qtd_Consumo : Real);
begin
  if fDMConsLote.mMat.Locate('ID_SETOR;ID_MATERIAL;ID_COR', VarArrayOf([fDMConsLote.cdsMatLoteID_SETOR.AsInteger,
                           fDMConsLote.cdsMatLoteID_MATERIAL.AsInteger,fDMConsLote.cdsMatLoteID_COR_MAT.AsInteger]), [locaseinsensitive]) then
    fDMConsLote.mMat.Edit
  else
  begin
    fDMConsLote.mMat.Insert;
    fDMConsLote.mMatID_Setor.AsInteger     := fDMConsLote.cdsMatLoteID_SETOR.AsInteger;
    fDMConsLote.mMatID_Material.AsInteger  := fDMConsLote.cdsMatLoteID_MATERIAL.AsInteger;
    fDMConsLote.mMatID_Cor.AsInteger       := fDMConsLote.cdsMatLoteID_COR_MAT.AsInteger;
    fDMConsLote.mMatNome_Material.AsString := fDMConsLote.cdsMatLoteNOME_MATERIAL.AsString;
    fDMConsLote.mMatNome_Cor.AsString      := fDMConsLote.cdsMatLoteNOME_COR_MAT.AsString;
    fDMConsLote.mMatNome_Setor.AsString    := fDMConsLote.cdsMatLoteNOME_SETOR.AsString;
  end;
  fDMConsLote.mMatQtd_Consumo.AsFloat := StrToFloat(FormatFloat('0.0000',fDMConsLote.mMatQtd_Consumo.AsFloat + Qtd_Consumo));
  fDMConsLote.mMat.Post;

  if trim(Tamanho) <> '' then
  begin
    if fDMConsLote.mMatGrade.Locate('ID_SETOR;ID_MATERIAL;ID_COR;TAMANHO', VarArrayOf([fDMConsLote.cdsMatLoteID_SETOR.AsInteger,
                           fDMConsLote.cdsMatLoteID_MATERIAL.AsInteger,fDMConsLote.cdsMatLoteID_COR_MAT.AsInteger,Tamanho]), [locaseinsensitive]) then
      fDMConsLote.mMatGrade.Edit
    else
    begin
      fDMConsLote.mMatGrade.Insert;
      fDMConsLote.mMatGradeID_Setor.AsInteger    := fDMConsLote.mMatID_Setor.AsInteger;
      fDMConsLote.mMatGradeID_Material.AsInteger := fDMConsLote.mMatID_Material.AsInteger;
      fDMConsLote.mMatGradeID_Cor.AsInteger      := fDMConsLote.mMatID_Cor.AsInteger;
      fDMConsLote.mMatGradeTamanho.AsString      := Tamanho;
    end;
    fDMConsLote.mMatGradeQtd_Consumo.AsFloat := StrToFloat(FormatFloat('0.0000',fDMConsLote.mMatGradeQtd_Consumo.AsFloat + Qtd_Consumo));
    fDMConsLote.mMatGrade.Post;
  end;
end;

procedure TfrmConsMatLote2.btnImprimirClick(Sender: TObject);
var
  vArq: string;
  vOpcaoImp: string;
  vObsPedido: string;
  vIndice_mMaterial: string;
  vComando : String;
begin
  if fDMConsLote.mMat.IsEmpty then
    exit;

  {vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\ConsLoteMat2.fr3';
  if FileExists(vArq) then
    fDMConsLote.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    ShowMessage('Relatorio não localizado! ' + vArq);
    Exit;
  end;
  vIndice_mMaterial := fDMConsLote.mMat.IndexFieldNames;
  fDMConsLote.mMat.IndexFieldNames := 'Nome_Setor;Nome_Material;Nome_Cor';
  fDMConsLote.mMat.First;
  if trim(Edit3.Text) <> '' then
    vOpcaoImp := vOpcaoImp + '(Lotes.: ' + Edit3.Text + ')';
  if (CurrencyEdit2.AsInteger > 0) and (CurrencyEdit1.AsInteger > 0) then
    vOpcaoImp := vOpcaoImp + '(Orden Ini: ' + CurrencyEdit1.Text + '  Fin: ' + CurrencyEdit2.Text + ')';
  fDMConsLote.frxReport1.variables['Opcao_Imp'] := QuotedStr(vOpcaoImp);
  fDMConsLote.frxReport1.ShowReport;
  fDMConsLote.mMat.IndexFieldNames := vIndice_mMaterial;}

  fDMConsLote.mMat.IndexFieldNames := 'Nome_Setor;Nome_Material;Nome_Cor';
  fDMConsLote.mMat.First;
  if trim(Edit3.Text) <> '' then
    vOpcaoImp := vOpcaoImp + '(Lotes.: ' + Edit3.Text + ')';
  if (CurrencyEdit2.AsInteger > 0) and (CurrencyEdit1.AsInteger > 0) then
    vOpcaoImp := vOpcaoImp + '(Lote Ini: ' + CurrencyEdit1.Text + '  Fin: ' + CurrencyEdit2.Text + ')';
  fRelMatLote2            := TfRelMatLote2.Create(Self);
  fRelMatLote2.RLLabel4.Caption := vOpcaoImp;
  fRelMatLote2.fDMConsLote := fDMConsLote;
  fRelMatLote2.RLReport1.PreviewModal;
  fRelMatLote2.RLReport1.Free;
  FreeAndNil(fRelMatLote2);
end;

end.
