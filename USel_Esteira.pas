unit USel_Esteira;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons, Grids,
  FMTBcd, DB, RxLookup, UCBase, Mask, ToolEdit, NxCollection, NxEdit, CurrEdit, ComCtrls, RzDTP, 
  UDMBaixaProd_Calc, DBGrids, SMDBGrid;

type
  TfrmSel_Esteira = class(TForm)
    SMDBGrid1: TSMDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }

  public
    { Public declarations }
    fDMBaixaProd_Calc: TDMBaixaProd_Calc;

  end;

var
  frmSel_Esteira: TfrmSel_Esteira;

implementation

uses DmdDatabase, rsDBUtils, UMenu, Math;

{$R *.dfm}

procedure TfrmSel_Esteira.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if fDMBaixaProd_Calc.vID_Esteira_Tal <= 0 then
    fDMBaixaProd_Calc.vID_Esteira_Tal := fDMBaixaProd_Calc.cdsEsteiraID.AsInteger;
  Action := Cafree;
end;

procedure TfrmSel_Esteira.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMBaixaProd_Calc);
  fDMBaixaProd_Calc.vID_Esteira_Tal := 0;
  SMDBGrid1.SetFocus;
end;

procedure TfrmSel_Esteira.SMDBGrid1DblClick(Sender: TObject);
begin
  fDMBaixaProd_Calc.vID_Esteira_Tal := fDMBaixaProd_Calc.cdsEsteiraID.AsInteger;
  Close;
end;

procedure TfrmSel_Esteira.SMDBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
    SMDBGrid1DblClick(Sender);
end;

end.
