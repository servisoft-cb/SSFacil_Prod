unit UConfParcial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NxCollection, StdCtrls, UCBase;

type
  TfrmConfParcial = class(TForm)
    btnEncerrar: TNxButton;
    btnGerar: TNxButton;
    btnCancelar: TNxButton;
    Memo1: TMemo;
    UCControls1: TUCControls;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEncerrarClick(Sender: TObject);
    procedure btnGerarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfParcial: TfrmConfParcial;

implementation

uses uUtilPadrao, UMenu;

{$R *.dfm}

procedure TfrmConfParcial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConfParcial.btnEncerrarClick(Sender: TObject);
begin
  if MessageDlg('Confirma o Encerramento do Processo com a quantidade a menos?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;
  vProcesso_Parcial := 'E';
  Close;
end;

procedure TfrmConfParcial.btnGerarClick(Sender: TObject);
begin
  if MessageDlg('Confirma geração de um novo processo com a quantidade restante?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;
  vProcesso_Parcial := 'G';
  Close;
end;

procedure TfrmConfParcial.btnCancelarClick(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar o Processo?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;
  vProcesso_Parcial := 'C';
  Close;
end;

procedure TfrmConfParcial.FormShow(Sender: TObject);
begin
  vProcesso_Parcial := 'C';
  Memo1.SetFocus;
end;

end.
