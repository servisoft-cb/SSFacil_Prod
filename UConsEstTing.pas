unit UConsEstTing;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMConsProc, ExtCtrls, StdCtrls, NxCollection, Grids, DBGrids,
  SMDBGrid;

type
  TfrmConsEstTing = class(TForm)
    Panel1: TPanel;
    ComboBox1: TComboBox;
    Label1: TLabel;
    btnConsTalao: TNxButton;
    SMDBGrid1: TSMDBGrid;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConsTalaoClick(Sender: TObject);
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

procedure TfrmConsEstTing.btnConsTalaoClick(Sender: TObject);
begin
  SMDBGrid1.DisableScroll;
  fDMConsProc.mEstTing.EmptyDataSet;
  prc_Consultar;
  prc_Le_cdsEstTing;
  SMDBGrid1.EnableScroll;
end;

procedure TfrmConsEstTing.prc_Consultar;
var
  vComando : String;
begin
  vComando := fDMConsProc.ctEstTing;
  case ComboBox1.ItemIndex of
    1 : vComando := ' AND VCOMB.TIPO_PRODUCAO = ' + QuotedStr('T');
    2 : vComando := ' AND VCOMB.TIPO_PRODUCAO = ' + QuotedStr('E');
  end;
  fDMConsProc.cdsEstTing.Close;
  fDMConsProc.sdsEstTing.CommandText := vComando;
  fDMConsProc.cdsEstTing.Open;
end;

procedure TfrmConsEstTing.prc_Le_cdsEstTing;
begin
  fDMConsProc.cdsEstTing.First;
  while not fDMConsProc.cdsEstTing.Eof do
  begin
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
    fDMConsProc.cdsEstTing.Next;
  end;
end;

end.
