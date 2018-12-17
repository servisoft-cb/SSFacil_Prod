unit UConsTalao_Etiq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMBaixaProd, NxCollection, StdCtrls, Mask, ToolEdit, CurrEdit,
  ExtCtrls, Grids, DBGrids, SMDBGrid, DB;

type
  TfrmConsTalao_Etiq = class(TForm)
    PnlConsRapida: TPanel;
    SMDBGrid2: TSMDBGrid;
    Panel4: TPanel;
    Label12: TLabel;
    Shape1: TShape;
    Label13: TLabel;
    Shape2: TShape;
    Label14: TLabel;
    Label15: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    Edit2: TEdit;
    NxPanel1: TNxPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CurrencyEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SMDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure SMDBGrid2DblClick(Sender: TObject);
  private
    { Private declarations }

    procedure prc_ConsRapido(Num_Pedido : Integer ; Pedido_Cliente : String);

  public
    { Public declarations }
    fDMBaixaProd: TDMBaixaProd;
    
  end;

var
  frmConsTalao_Etiq: TfrmConsTalao_Etiq;

implementation

uses rsDBUtils, UConsBaixa_Proc2;

{$R *.dfm}

procedure TfrmConsTalao_Etiq.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsTalao_Etiq.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMBaixaProd);
end;

procedure TfrmConsTalao_Etiq.CurrencyEdit3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) and (CurrencyEdit3.AsInteger > 0) then
    prc_ConsRapido(CurrencyEdit3.AsInteger,'');
end;

procedure TfrmConsTalao_Etiq.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) and (trim(Edit2.Text) <> '') then
    prc_ConsRapido(0,Edit2.Text);
end;

procedure TfrmConsTalao_Etiq.prc_ConsRapido(Num_Pedido: Integer;
  Pedido_Cliente: String);
begin
  fDMBaixaProd.cdsRapido.Close;
  if Num_Pedido > 0 then
    fDMBaixaProd.prc_Abrir_qPedido(Num_Pedido,'')
  else
    fDMBaixaProd.prc_Abrir_qPedido(0,Pedido_Cliente);
  fDMBaixaProd.sdsRapido.CommandText := fDMBaixaProd.ctRapido + ' AND I.ID = :ID ';
  fDMBaixaProd.sdsRapido.ParamByName('ID').AsInteger := fDMBaixaProd.qPedID.AsInteger;
  fDMBaixaProd.cdsRapido.Open;
end;

procedure TfrmConsTalao_Etiq.SMDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMBaixaProd.cdsRapidoDTBAIXA.IsNull then
  begin
    Background  := clYellow;
    AFont.Color := clBlack;
  end
  else
  if StrToFloat(FormatFloat('0.000',fDMBaixaProd.cdsRapidoQTD_REST_CONF.AsFloat)) <= 0 then
  begin
    Background  := $0080FF80;
    AFont.Color := clBlack;
  end;
end;

procedure TfrmConsTalao_Etiq.SMDBGrid2DblClick(Sender: TObject);
begin
  if (fDMBaixaProd.cdsRapido.Active) and (fDMBaixaProd.cdsRapidoID.AsInteger > 0) then
  begin
    frmConsBaixa_Proc2  := TfrmConsBaixa_Proc2.Create(Self);
    frmConsBaixa_Proc2.vIDPed_Loc   := fDMBaixaProd.cdsRapidoID.AsInteger;
    frmConsBaixa_Proc2.vItem_Loc    := fDMBaixaProd.cdsRapidoITEM.AsInteger;
    frmConsBaixa_Proc2.fDMBaixaProd := fDMBaixaProd;
    frmConsBaixa_Proc2.ShowModal;
    FreeAndNil(frmConsBaixa_Proc2);
  end;
end;

end.
