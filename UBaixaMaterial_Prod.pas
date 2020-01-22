unit UBaixaMaterial_Prod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, NxCollection, NxPageControl, Mask, ToolEdit, CurrEdit,
  Grids, DBGrids, SMDBGrid, UDMBaixaMaterial_Prod, ExtCtrls, DB;

type
  TfrmBaixaMaterial_Prod = class(TForm)
    NxPanel1: TNxPanel;
    Edit1: TEdit;
    Label1: TLabel;
    NxPanel2: TNxPanel;
    Label2: TLabel;
    Label3: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    Label4: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    Label5: TLabel;
    Edit2: TEdit;
    NxButton1: TNxButton;
    SMDBGrid1: TSMDBGrid;
    Panel1: TPanel;
    Shape1: TShape;
    Label6: TLabel;
    Shape2: TShape;
    Label7: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }
    fDMBaixaMaterial_Prod : TDMBaixaMaterial_Prod;

    procedure prc_ConsLoteMat_Prod;
    function fnc_LoteMat_Prod_OK : Boolean;

  public
    { Public declarations }
  end;

var
  frmBaixaMaterial_Prod: TfrmBaixaMaterial_Prod;

implementation

uses uUtilPadrao, rsDBUtils, UBaixaMaterial_Prod_Dig;

{$R *.dfm}

procedure TfrmBaixaMaterial_Prod.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(fDMBaixaMaterial_Prod);
  Action := Cafree;
end;

procedure TfrmBaixaMaterial_Prod.NxButton1Click(Sender: TObject);
begin
  Edit1.Clear;
  prc_ConsLoteMat_Prod;
end;

procedure TfrmBaixaMaterial_Prod.prc_ConsLoteMat_Prod;
var
  vComando : String;
  vNumOrdem: Integer;
  vItem: Integer;
begin
  vNumOrdem := 0;
  vItem     := 0;
  if trim(Edit1.Text) <> '' then
  begin
    vNumOrdem := StrToInt(copy(Edit1.Text,2,8));
    vItem     := StrToInt(copy(Edit1.Text,10,3));
  end
  else
  begin
    vNumOrdem := CurrencyEdit1.AsInteger;
    vItem     := CurrencyEdit2.AsInteger;
  end;
  vComando := ' WHERE 0 = 0 ';
  if vNumOrdem > 0 then
    vComando := vComando + ' AND L.NUM_ORDEM = ' + IntToStr(vNumOrdem);
  if vItem > 0 then
    vComando := vComando + ' AND L.ITEM = ' + IntToStr(vItem);
  if CurrencyEdit3.AsInteger > 0 then
    vComando := vComando + ' AND L.ID_MATERIAL = ' + IntToStr(CurrencyEdit3.AsInteger);
  if trim(Edit2.Text) <> '' then
    vComando := vComando + ' AND M.NOME LIKE ' + QuotedStr('%'+Edit2.Text+'%');
  fDMBaixaMaterial_Prod.cdsConsLoteMat_Prod.Close;
  fDMBaixaMaterial_Prod.sdsConsLoteMat_Prod.CommandText := fDMBaixaMaterial_Prod.ctConsLoteMat_Prod + vComando;
  fDMBaixaMaterial_Prod.cdsConsLoteMat_Prod.Open;
end;

procedure TfrmBaixaMaterial_Prod.FormShow(Sender: TObject);
begin
  fDMBaixaMaterial_Prod:= TDMBaixaMaterial_Prod.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMBaixaMaterial_Prod);
end;

procedure TfrmBaixaMaterial_Prod.Edit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
  begin
    if Length(trim(Edit1.Text)) <> 12 then
      MessageDlg('*** Cód. Barra inválido!', mtWarning, [mbok], 0)
    else
    begin
      CurrencyEdit1.Clear;
      CurrencyEdit2.Clear;
      CurrencyEdit3.Clear;
      Edit2.Clear;
      if fnc_LoteMat_Prod_OK then
      begin
        SMDBGrid1DblClick(Sender);
        Edit1.Clear;
        Edit1.SetFocus;
      end;
    end;
  end;
end;

function TfrmBaixaMaterial_Prod.fnc_LoteMat_Prod_OK: Boolean;
begin
  Result := False;
  prc_ConsLoteMat_Prod;
  if fDMBaixaMaterial_Prod.cdsConsLoteMat_Prod.IsEmpty then
    exit;
  fDMBaixaMaterial_Prod.prc_Abrir_Lote_Mat_Prod(fDMBaixaMaterial_Prod.cdsConsLoteMat_ProdNUM_ORDEM.AsInteger,fDMBaixaMaterial_Prod.cdsConsLoteMat_ProdITEM.AsInteger);
  if fDMBaixaMaterial_Prod.cdsLote_Mat_Prod.IsEmpty then
    exit;
  Result := True;
end;

procedure TfrmBaixaMaterial_Prod.SMDBGrid1DblClick(Sender: TObject);
var
  vNumOrd , vItem : Integer;
begin
  vNumOrd := fDMBaixaMaterial_Prod.cdsConsLoteMat_ProdNUM_ORDEM.AsInteger;
  vItem   := fDMBaixaMaterial_Prod.cdsConsLoteMat_ProdITEM.AsInteger;
  frmBaixaMaterial_Prod_Dig := TfrmBaixaMaterial_Prod_Dig.Create(self);
  frmBaixaMaterial_Prod_Dig.fDMBaixaMaterial_Prod := fDMBaixaMaterial_Prod;
  frmBaixaMaterial_Prod_Dig.ShowModal;
  FreeAndNil(frmBaixaMaterial_Prod_Dig);
  CurrencyEdit1.AsInteger := vNumOrd;
  CurrencyEdit2.AsInteger := vItem;
  fDMBaixaMaterial_Prod.cdsConsLoteMat_Prod.Close;
  fDMBaixaMaterial_Prod.cdsConsLoteMat_Prod.Open;
  fDMBaixaMaterial_Prod.cdsConsLoteMat_Prod.Locate('NUM_ORDEM;ITEM',VarArrayOf([vNumOrd,vItem]),[locaseinsensitive]);
end;

procedure TfrmBaixaMaterial_Prod.SMDBGrid1GetCellParams(Sender: TObject;
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

end.
