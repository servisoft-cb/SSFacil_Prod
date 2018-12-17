unit UMostraItens_Ped;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMCadLote_Calc, Grids, DBGrids, SMDBGrid;

type
  TfrmMostraItens_Ped = class(TForm)
    SMDBGrid1: TSMDBGrid;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    fDMCadLote_Calc: TDMCadLote_Calc;

  end;

var
  frmMostraItens_Ped: TfrmMostraItens_Ped;

implementation

uses rsDBUtils;


{$R *.dfm}

procedure TfrmMostraItens_Ped.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMCadLote_Calc);
end;

procedure TfrmMostraItens_Ped.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

end.
