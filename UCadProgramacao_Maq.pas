unit UCadProgramacao_Maq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, SMDBGrid, uDmCadProgramacao, DB, NxCollection;

type
  TfrmCadProgramacao_Maq = class(TForm)
    SMDBGrid1: TSMDBGrid;
    NxButton1: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure NxButton1Click(Sender: TObject);
  private
    { Private declarations }

    procedure prc_Consultar;
    procedure prc_Gerar_MaqBoca;
    procedure prc_Gravar_mMaq_Boca(Qtd_Processo : Real ; DTFinal, HRFinal : TDateTime ; Num_Boca : Integer);

  public
    { Public declarations }
    fDMCadProgramacao: TDMCadProgramacao;
    vID_Maq_Local :  Integer;

  end;

var
  frmCadProgramacao_Maq: TfrmCadProgramacao_Maq;

implementation

{$R *.dfm}

procedure TfrmCadProgramacao_Maq.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmCadProgramacao_Maq.FormShow(Sender: TObject);
begin
  prc_Consultar;
  prc_Gerar_MaqBoca;

end;

procedure TfrmCadProgramacao_Maq.prc_Consultar;
begin
  fDMCadProgramacao.cdsMaqUsada.Close;
  fDMCadProgramacao.sdsMaqUsada.ParamByName('ID_MAQUINA').AsInteger := vID_Maq_Local;
  fDMCadProgramacao.cdsMaqUsada.Open;
end;

procedure TfrmCadProgramacao_Maq.prc_Gerar_MaqBoca;
var
  i : Integer;
begin
  fDMCadProgramacao.mMaq_Boca.EmptyDataSet;

  i := 1;
  while i <= fDMCadProgramacao.mMaqQtd_Bocas.AsInteger do
  begin
    if fDMCadProgramacao.cdsMaqUsada.Locate('NUM_BOCA',i,[loCaseInsensitive]) then
      prc_Gravar_mMaq_Boca(fDMCadProgramacao.cdsMaqUsadaQTD_PROCESSO.AsFloat,fDMCadProgramacao.cdsMaqUsadaDTFINAL.AsDateTime,fDMCadProgramacao.cdsMaqUsadaHRFINAL.AsDateTime,i)
    else
      prc_Gravar_mMaq_Boca(0,0,0,i);

    i := i + 1;
  end;
end;

procedure TfrmCadProgramacao_Maq.prc_Gravar_mMaq_Boca(Qtd_Processo: Real;
  DTFinal, HRFinal: TDateTime; Num_Boca: Integer);
begin
  fDMCadProgramacao.mMaq_Boca.Insert;
  fDMCadProgramacao.mMaq_BocaQtd_Programada.AsFloat := Qtd_Processo;
  if DTFinal > 10 then
    fDMCadProgramacao.mMaq_BocaDtFinal.AsDateTime := DTFinal;
  if HRFinal <> 0 then
    fDMCadProgramacao.mMaq_BocaHrFinal.AsDateTime;
  fDMCadProgramacao.mMaq_BocaQtd_Gerar.AsFloat := 0;
  fDMCadProgramacao.mMaq_BocaTempo.AsFloat := 0;
  fDMCadProgramacao.mMaq_BocaID_Maquina.AsInteger := vID_Maq_Local;
  fDMCadProgramacao.mMaq_BocaNum_Boca.AsInteger := Num_Boca;
  fDMCadProgramacao.mMaq_Boca.Post;
end;

procedure TfrmCadProgramacao_Maq.NxButton1Click(Sender: TObject);
var
  vQtd : Real;
  vQtdDiv : Real;
  vContador : Integer;
begin
  vContador := 0;
  fDMCadProgramacao.mMaq_Boca.First;
  while not fDMCadProgramacao.mMaq_Boca.Eof do
  begin
    if (SMDBGrid1.SelectedRows.CurrentRowSelected) then
      vContador := vContador + 1;
    fDMCadProgramacao.mMaq_Boca.Next;
  end;

  vQtd    := fDMCadProgramacao.mMaqQtd_Prog.AsFloat;
  vQtdDiv := fDMCadProgramacao.mMaqQtd_Prog.AsFloat / vContador;
  fDMCadProgramacao.mMaq_Boca.First;
  while not fDMCadProgramacao.mMaq_Boca.Eof do
  begin
    if (SMDBGrid1.SelectedRows.CurrentRowSelected) then
    begin
      vContador := vContador - 1;
      fDMCadProgramacao.mMaq_Boca.Edit;
      if vContador = 0 then
        fDMCadProgramacao.mMaq_BocaQtd_Gerar.AsFloat := vQtd
      else
        fDMCadProgramacao.mMaq_BocaQtd_Gerar.AsFloat := vQtdDiv;
      vQtd := StrToFloat(FormatFloat('0.0000',vQtd - fDMCadProgramacao.mMaq_BocaQtd_Gerar.AsFloat));
      fDMCadProgramacao.mMaq_Boca.Post;
    end;
    fDMCadProgramacao.mMaq_Boca.Next;
  end;
end;

end.
