unit UConsProduto_Mapa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMConsLote, Grids, NxCollection, ExtCtrls, StdCtrls, Buttons,
  Mask, ToolEdit, CurrEdit;

type
  TfrmConsProduto_Mapa = class(TForm)
    Grid: TStringGrid;
    Panel1: TPanel;
    NxButton1: TNxButton;
    Shape6: TShape;
    Label6: TLabel;
    Shape4: TShape;
    Label4: TLabel;
    Label1: TLabel;
    edtReferencia: TEdit;
    Label2: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label3: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    Label5: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    Label7: TLabel;
    CurrencyEdit4: TCurrencyEdit;
    Shape1: TShape;
    Label8: TLabel;
    Shape2: TShape;
    Label9: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure NxButton1Click(Sender: TObject);
    procedure GridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure edtReferenciaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    fDMConsLote: TDMConsLote;
    bCorColunas: boolean;

    procedure prc_Consultar;
    procedure prc_Montar_Grid;    

  public
    { Public declarations }
  end;

var
  frmConsProduto_Mapa: TfrmConsProduto_Mapa;

implementation

uses rsDBUtils, strUtils, uUtilPadrao, USel_Produto;


{$R *.dfm}

procedure TfrmConsProduto_Mapa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsProduto_Mapa.FormShow(Sender: TObject);
begin
  fDMConsLote := TDMConsLote.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsLote);
end;

procedure TfrmConsProduto_Mapa.NxButton1Click(Sender: TObject);
begin
  prc_Consultar;
  prc_Montar_Grid;
end;

procedure TfrmConsProduto_Mapa.prc_Consultar;
var
  vComandoAux, vComandoAux2: String;
  i : Integer;
  vFlag : Boolean;
begin  
  fDMConsLote.cdsConsProduto_Mapa.Close;
  i := PosEx('GROUP',UpperCase(fDMConsLote.ctConsProduto_Mata),0);
  vComandoAux  := copy(fDMConsLote.ctConsProduto_Mata,i,Length(fDMConsLote.ctConsProduto_Mata) - i + 1);
  vComandoAux2 := copy(fDMConsLote.ctConsProduto_Mata,1,i-1);
  if trim(edtReferencia.Text) <> '' then
    vComandoAux2 := vComandoAux2 + ' AND P.REFERENCIA LIKE ' + QuotedStr('%'+edtReferencia.Text+'%');
  if CurrencyEdit1.AsInteger > 0 then
    vComandoAux2 := vComandoAux2 + ' AND L.NUM_LOTE >= ' + IntToStr(CurrencyEdit1.AsInteger);
  if CurrencyEdit2.AsInteger > 0 then
    vComandoAux2 := vComandoAux2 + ' AND L.NUM_LOTE <= ' + IntToStr(CurrencyEdit2.AsInteger);
  if CurrencyEdit3.AsInteger > 0 then
    vComandoAux2 := vComandoAux2 + ' AND L.NUM_ORDEM >= ' + IntToStr(CurrencyEdit3.AsInteger);
  if CurrencyEdit4.AsInteger > 0 then
    vComandoAux2 := vComandoAux2 + ' AND L.NUM_ORDEM <= ' + IntToStr(CurrencyEdit4.AsInteger);
  fDMConsLote.sdsConsProduto_Mapa.CommandText := vComandoAux2 + vComandoAux;
  fDMConsLote.cdsConsProduto_Mapa.Open;

  fDMConsLote.cdsConsProduto_Mapa.IndexFieldNames := 'REFERENCIA;NOME_COMBINACAO;NUM_LOTE;ID_SETOR;ID_SETOR_PROCESSO;ORDEM';
end;

procedure TfrmConsProduto_Mapa.prc_Montar_Grid;
var
  vLinha, vCol : Integer;
  vNumLote_Ant : Integer;
  vIDSetor_Ant : Integer;
  vRef_Ant : String;
begin
  vLinha := 0;
  vCol   := 0;
  vNumLote_Ant := 0;
  vIDSetor_Ant := 0;
  vRef_Ant     := '';

  Grid.Cells[0,vLinha] := 'Lote';
  Grid.Cells[1,vLinha] := 'Referência';
  Grid.Cells[2,vLinha] := 'Modelo';
  Grid.Cells[3,vLinha] := 'Cor';
  Grid.Cells[4,vLinha] := 'Qtde';
  Grid.ColWidths[1]    := 135;
  Grid.ColWidths[2]    := 250;
  Grid.ColWidths[3]    := 200;
  Grid.ColWidths[4]    := 50;
  Grid.ColWidths[0]    := 50;

  fDMConsLote.cdsConsProduto_Mapa.First;
  while not fDMConsLote.cdsConsProduto_Mapa.Eof do
  begin
    if (vRef_Ant <> '') and (vRef_Ant <> fDMConsLote.cdsConsProduto_MapaREFERENCIA.AsString) then
      vLinha := vLinha + 1;
    if vNumLote_Ant <> fDMConsLote.cdsConsProduto_MapaNUM_LOTE.AsInteger then
    begin
      vLinha := vLinha + 1;
      Grid.Cells[0,vLinha] := fDMConsLote.cdsConsProduto_MapaNUM_LOTE.AsString;
      Grid.Cells[1,vLinha] := fDMConsLote.cdsConsProduto_MapaREFERENCIA.AsString;
      Grid.Cells[2,vLinha] := fDMConsLote.cdsConsProduto_MapaNOME_MODELO.AsString;
      Grid.Cells[3,vLinha] := fDMConsLote.cdsConsProduto_MapaNOME_COMBINACAO.AsString;
      Grid.Cells[4,vLinha] := fDMConsLote.cdsConsProduto_MapaQTD.AsString;


      vCol := 4;
      vCol := vCol + 1;
    end;
    if Grid.ColCount < vCol then
      Grid.ColCount := vCol;
    //if vIDSetor_Ant <> fDMConsLote.cdsConsProduto_MapaID_SETOR_PROCESSO.AsInteger then
    if vIDSetor_Ant <> fDMConsLote.cdsConsProduto_MapaID_SETOR.AsInteger then
    begin
      if trim(fDMConsLote.cdsConsProduto_MapaNOME_SETOR_PROCESSO.AsString) <> '' then
        Grid.Cells[vCol,vLinha] := fDMConsLote.cdsConsProduto_MapaNOME_SETOR_PROCESSO.AsString
      else
        Grid.Cells[vCol,vLinha] := fDMConsLote.cdsConsProduto_MapaNOME_SETOR.AsString;
      {if fDMConsLote.cdsConsProduto_MapaDTSAIDA.AsDateTime > 10 then
        Grid.Cells[vCol,vLinha] := '(E)' + Grid.Cells[vCol,vLinha]
      else
      if fDMConsLote.cdsConsProduto_MapaDTENTRADA.AsDateTime > 10 then
        Grid.Cells[vCol,vLinha] := '(S)' + Grid.Cells[vCol,vLinha];}
      if fDMConsLote.cdsConsProduto_MapaCONTADOR_EMPRODUCAO.AsInteger > 0 then
        Grid.Cells[vCol,vLinha] := '(S)' + Grid.Cells[vCol,vLinha]
      else
      if (fDMConsLote.cdsConsProduto_MapaCONTADOR_EMPRODUCAO.AsInteger <= 0) and (fDMConsLote.cdsConsProduto_MapaCONTADOR_PENDENTE.AsInteger <= 0) and
         (fDMConsLote.cdsConsProduto_MapaCONTADOR_ENCERRADO.AsInteger > 0) then
        Grid.Cells[vCol,vLinha] := '(E)' + Grid.Cells[vCol,vLinha];
      vCol := vCol + 1;
      if Grid.ColCount < vCol then
        Grid.ColCount := vCol;
    end;
    if trim(fDMConsLote.cdsConsProduto_MapaNOME_PROCESSO.AsString) <> '' then
    begin
      if (fDMConsLote.cdsConsProduto_MapaDTSAIDA_PROCESSO.AsDateTime > 10) and (fDMConsLote.cdsConsProduto_MapaSTATUS_LEITURA.AsString <> 'P') then
        Grid.Cells[vCol,vLinha] := '**' +'(S) ' + LowerCase(fDMConsLote.cdsConsProduto_MapaNOME_PROCESSO.AsString)
      else
      if fDMConsLote.cdsConsProduto_MapaDTENTRADA_PROCESSO.AsDateTime > 10 then
        Grid.Cells[vCol,vLinha] := '**' +'(E) ' + LowerCase(fDMConsLote.cdsConsProduto_MapaNOME_PROCESSO.AsString)
      else
        Grid.Cells[vCol,vLinha] := '**' + LowerCase(fDMConsLote.cdsConsProduto_MapaNOME_PROCESSO.AsString);
      vCol := vCol + 1;
    end;
    vNumLote_Ant := fDMConsLote.cdsConsProduto_MapaNUM_LOTE.AsInteger;
    //vIDSetor_Ant := fDMConsLote.cdsConsProduto_MapaID_SETOR_PROCESSO.AsInteger;
    vIDSetor_Ant := fDMConsLote.cdsConsProduto_MapaID_SETOR.AsInteger;
    vRef_Ant     := fDMConsLote.cdsConsProduto_MapaREFERENCIA.AsString;
    fDMConsLote.cdsConsProduto_Mapa.Next;
  end;

  Grid.RowCount := vLinha + 1;

  for vCol := 0 to Grid.ColCount - 1 do
  begin
    if vcol > 5 then
      Grid.ColWidths[vCol] := 140;
  end;


end;

procedure TfrmConsProduto_Mapa.GridDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  texto:string;
begin
  texto := Grid.Cells[ACol, ARow];


  if (acol <= 4) and (arow > 0) then
  begin
    grid.Canvas.Brush.Color := clBtnFace;
    grid.Canvas.FillRect(Rect);
    grid.Canvas.Font.Color  := clBlack;
    grid.Canvas.TextRect(Rect, Rect.Left+3, Rect.Top + 3, grid.Cells[ACol, ARow]);
    //grid.Canvas.TextOut(Rect.Left+2, Rect.Top+2, grid.Cells[1,2]);
  end
  else
  if (acol <= 4) and (arow <= 0) then
  begin
    grid.Canvas.Font.Color  := clBlack;
    grid.Canvas.Font.Name   := 'Verdana';
    grid.Canvas.Font.Size   := 9;
    grid.Canvas.Font.Style  := grid.Canvas.Font.Style + [fsBold];
    grid.Canvas.TextRect(Rect, Rect.Left+3, Rect.Top + 3, grid.Cells[ACol, ARow]);
  end
  else
  if (acol > 4) and (copy(texto,1,2) <> '**') and  (copy(trim(texto),1,2) <> '') then
  begin
    grid.Canvas.Font.Color  := clNavy;
    grid.Canvas.Font.Name   := 'Courier New';
    grid.Canvas.Font.Size   := 9;
    grid.Canvas.Font.Style  := grid.Canvas.Font.Style + [fsBold];
    if (copy(texto,1,3) = '(E)') then
      grid.Canvas.Brush.Color  := $0077FF77
    else
    if (copy(texto,1,3) = '(S)') then
      grid.Canvas.Brush.Color  := $00FFFFB9;
    {if fDMConsLote.cdsConsProduto_MapaDTENTRADA.AsDateTime > 10 then
      grid.Canvas.Brush.Color  := clGreen
    else
      grid.Canvas.Brush.Color  := clYellow;}
    grid.Canvas.TextRect(Rect, Rect.Left+3, Rect.Top + 3, grid.Cells[ACol, ARow]);
  end
  else
  if (acol > 4) and (copy(texto,1,2) = '**') then
  begin
    grid.Canvas.Font.Color  := clBlack;
    grid.Canvas.Font.Name   := 'MS Sans Serif';
    grid.Canvas.Font.Size   := 8;
    //grid.Canvas.Font.Style  := grid.Canvas.Font.Style + [fsBold];
    if (copy(texto,3,3) = '(E)') then
      grid.Canvas.Brush.Color  := $00A8FFFF
    else
    if (copy(texto,3,3) = '(S)') then
      grid.Canvas.Brush.Color  := $004080FF;
    {if fDMConsLote.cdsConsProduto_MapaDTENTRADA.AsDateTime > 10 then
      grid.Canvas.Brush.Color  := clGreen
    else
      grid.Canvas.Brush.Color  := clYellow;}
    grid.Canvas.TextRect(Rect, Rect.Left+3, Rect.Top + 3, grid.Cells[ACol, ARow]);
  end;

end;

procedure TfrmConsProduto_Mapa.edtReferenciaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    vReferencia_Pos := edtReferencia.Text;
    frmSel_Produto  := TfrmSel_Produto.Create(Self);
    frmSel_Produto.ShowModal;
    if trim(vReferencia_Pos) <> '' then
      edtReferencia.Text := vReferencia_Pos;
    FreeAndNil(frmSel_Produto);
  end;
end;

end.
