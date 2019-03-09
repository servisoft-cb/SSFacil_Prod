unit UAltSenhaFunc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, CurrEdit, UDMBaixaProd, NxCollection;

type
  TfrmAltSenhaFunc = class(TForm)
    CurrencyEdit2: TCurrencyEdit;
    Label11: TLabel;
    Label1: TLabel;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    btnConfirmar: TNxButton;
    NxButton2: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Enter(Sender: TObject);
    procedure CurrencyEdit2Exit(Sender: TObject);
    procedure GroupBox1Enter(Sender: TObject);
    procedure NxButton2Click(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit2Enter(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    fDMBaixaProd: TDMBaixaProd;

  end;

var
  frmAltSenhaFunc: TfrmAltSenhaFunc;

implementation

uses
  rsDBUtils;

{$R *.dfm}

procedure TfrmAltSenhaFunc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmAltSenhaFunc.Edit1Enter(Sender: TObject);
begin
  Edit1.Text := '';
end;

procedure TfrmAltSenhaFunc.CurrencyEdit2Exit(Sender: TObject);
begin
  Label4.Caption := '';
  fDMBaixaProd.cdsFuncionario.Close;
  fDMBaixaProd.sdsFuncionario.ParamByName('NUM_CARTAO').AsInteger := CurrencyEdit2.AsInteger;
  fDMBaixaProd.cdsFuncionario.Open;
  if CurrencyEdit2.AsInteger <= 0 then
    exit;
  if fDMBaixaProd.cdsFuncionario.IsEmpty then
  begin
    MessageDlg('*** Funcionário não encontrado!', mtError, [mbOk], 0);
    CurrencyEdit2.AsInteger := 0;
    CurrencyEdit2.SetFocus;
    exit;
  end;
  Label4.Caption := fDMBaixaProd.cdsFuncionarioNOME.AsString;
  Edit1.Clear;
  Edit1.SetFocus;
end;

procedure TfrmAltSenhaFunc.GroupBox1Enter(Sender: TObject);
begin
  if CurrencyEdit2.AsInteger <= 0 then
  begin
    CurrencyEdit2.SetFocus;
    exit;
  end;

  if fDMBaixaProd.cdsFuncionarioSENHA.AsString <> Edit1.Text then
  begin
    MessageDlg('*** Senha não confere!', mtError, [mbOk], 0);
    Edit1.SetFocus;
    Edit1.Clear;
    exit;
  end;
end;

procedure TfrmAltSenhaFunc.NxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmAltSenhaFunc.btnConfirmarClick(Sender: TObject);
begin
  if Trim(Edit2.Text) = '' then
  begin
    MessageDlg('*** Nova senha não informada!', mtError, [mbOk], 0);
    Edit2.SetFocus;
    exit;
  end;

  if Edit2.Text <> Edit3.Text then
  begin
    MessageDlg('*** Confirmação da nova senha não confere!', mtError, [mbOk], 0);
    Edit3.SetFocus;
    exit;
  end;

  fDMBaixaProd.cdsFuncionario.Edit;
  fDMBaixaProd.cdsFuncionarioSENHA.AsString := Edit2.Text;
  fDMBaixaProd.cdsFuncionario.Post;
  fDMBaixaProd.cdsFuncionario.ApplyUpdates(0);

  MessageDlg('*** Senha Atualizada!', mtConfirmation, [mbOk], 0);

  Close;

end;

procedure TfrmAltSenhaFunc.FormShow(Sender: TObject);
begin
  CurrencyEdit2.SetFocus;
end;

procedure TfrmAltSenhaFunc.CurrencyEdit2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) and (CurrencyEdit2.AsInteger > 0) then
    Edit1.SetFocus;
end;

procedure TfrmAltSenhaFunc.CurrencyEdit2Enter(Sender: TObject);
begin
  Label4.Caption := '';
end;

procedure TfrmAltSenhaFunc.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) then
    Edit2.SetFocus;
end;

procedure TfrmAltSenhaFunc.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) then
    Edit3.SetFocus;
end;

procedure TfrmAltSenhaFunc.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_Return) then
    btnConfirmarClick(Sender);
end;

end.
