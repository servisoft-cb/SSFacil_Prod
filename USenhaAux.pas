unit USenhaAux;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmSenhaAux = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    Panel1: TPanel;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vSenha_Local: String;
  end;

var
  frmSenhaAux: TfrmSenhaAux;

implementation

uses uUtilPadrao;

{$R *.dfm}

procedure TfrmSenhaAux.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmSenhaAux.btnConfirmarClick(Sender: TObject);
begin
  vSenha := Edit1.Text;
  if (vSenha <> vSenha_Local) then
  begin
    MessageDlg('*** Senha incorreta!', mtInformation, [mbOk], 0);
    vSenha := '';
    Edit1.SetFocus;
  end
  else
    Close;
end;

procedure TfrmSenhaAux.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F10) or (Key = 27) then
    btnCancelarClick(Sender);
end;

procedure TfrmSenhaAux.btnCancelarClick(Sender: TObject);
begin
  vSenha := '';
  Close;
end;

procedure TfrmSenhaAux.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) then
    btnConfirmarClick(Sender);
end;

procedure TfrmSenhaAux.FormShow(Sender: TObject);
begin
  vSenha := '';
end;

end.
