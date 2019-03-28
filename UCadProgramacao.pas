unit UCadProgramacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDmCadProgramacao, Grids, DBGrids, SMDBGrid, StdCtrls, Mask,
  ToolEdit, CurrEdit, NxCollection;

type
  TfrmCadProgramacao = class(TForm)
    SMDBGrid1: TSMDBGrid;
    SMDBGrid2: TSMDBGrid;
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    NxButton1: TNxButton;
    StaticText1: TStaticText;
    Label2: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    SMDBGrid3: TSMDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure NxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fDMCadProgramacao: TDMCadProgramacao;
    
  end;

var
  frmCadProgramacao: TfrmCadProgramacao;

implementation

uses
  rsDBUtils, UCadProgramacao_Maq;

{$R *.dfm}

procedure TfrmCadProgramacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmCadProgramacao.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMCadProgramacao);
  CurrencyEdit1.Value := fDMCadProgramacao.cdsPendQTD.AsFloat;
  CurrencyEdit2.Value := fDMCadProgramacao.cdsPendQTD.AsFloat;
end;

procedure TfrmCadProgramacao.SMDBGrid1DblClick(Sender: TObject);
begin
  if fDMCadProgramacao.mMaq_BocaID_Maquina.AsInteger <= 0 then
    exit;

  fDMCadProgramacao.mMaq_Boca.Edit;
  if fDMCadProgramacao.mMaq_BocaSelecionado.AsString = 'S' then
    fDMCadProgramacao.mMaq_BocaSelecionado.AsString := 'N'
  else
    fDMCadProgramacao.mMaq_BocaSelecionado.AsString := 'S';
  fDMCadProgramacao.mMaq_Boca.Post;

  {frmCadProgramacao_Maq  := TfrmCadProgramacao_Maq.Create(Self);
  frmCadProgramacao_Maq.fDMCadProgramacao := fDMCadProgramacao;
  frmCadProgramacao_Maq.vID_Maq_Local     := fDMCadProgramacao.mMaqID.AsInteger;
  frmCadProgramacao_Maq.ShowModal;
  FreeAndNil(frmCadProgramacao_Maq);}

end;

procedure TfrmCadProgramacao.NxButton1Click(Sender: TObject);
var
  vContador : Integer;
  vQtd : Real;
  vQtdDiv : Real;
begin
  fDMCadProgramacao.mMaq.First;
  while not fDMCadProgramacao.mMaq.Eof do
  begin
    vContador := 0;
    fDMCadProgramacao.mMaq_Boca.First;
    while not fDMCadProgramacao.mMaq_Boca.Eof do
    begin
      if fDMCadProgramacao.mMaq_BocaSelecionado.AsString = 'S' then
        vContador := vContador + 1;
      fDMCadProgramacao.mMaq_Boca.Next;
    end;
    if vContador > 0 then
    begin
      vQtd    := fDMCadProgramacao.mMaqQtd_Prog.AsFloat;
      vQtdDiv := StrToFloat(FormatFloat('0.00',fDMCadProgramacao.mMaqQtd_Prog.AsFloat / vContador));
      fDMCadProgramacao.mMaq_Boca.First;
      while not fDMCadProgramacao.mMaq_Boca.Eof do
      begin
        if fDMCadProgramacao.mMaq_BocaSelecionado.AsString = 'S' then
        begin
          fDMCadProgramacao.mMaq_Boca.Edit;
          vContador := vContador - 1;
          if vContador = 0 then
            fDMCadProgramacao.mMaq_BocaQtd_Gerar.AsFloat := vQtd
          else
            fDMCadProgramacao.mMaq_BocaQtd_Gerar.AsFloat := vQtdDiv;
          vQtd := StrToFloat(FormatFloat('0.00',vQtd - fDMCadProgramacao.mMaq_BocaQtd_Gerar.AsFloat));
          fDMCadProgramacao.mMaq_Boca.Post;
        end;
        fDMCadProgramacao.mMaq_Boca.Next;
      end;
    end;
    fDMCadProgramacao.mMaq.Next;
  end;

end;

end.
