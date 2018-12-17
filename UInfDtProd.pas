unit UInfDtProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, NxCollection, UDMLoteImp;

type
  TfrmInfDtProd = class(TForm)
    NxLabel8: TNxLabel;
    DateEdit1: TDateEdit;
    NxLabel7: TNxLabel;
    DateEdit2: TDateEdit;
    NxLabel1: TNxLabel;
    btnConsTalao: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConsTalaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fDMLoteImp: TDMLoteImp;
    
  end;

var
  frmInfDtProd: TfrmInfDtProd;

implementation

{$R *.dfm}

procedure TfrmInfDtProd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmInfDtProd.btnConsTalaoClick(Sender: TObject);
begin
  fDMLoteImp.vDtProducaoIni := DateEdit1.Date;
  fDMLoteImp.vDtProducaoFin := DateEdit2.Date;
  Close;
end;

end.
