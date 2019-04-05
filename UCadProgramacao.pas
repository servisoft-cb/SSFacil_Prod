unit UCadProgramacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDmCadProgramacao, Grids, DBGrids, SMDBGrid, StdCtrls, Mask,
  ToolEdit, CurrEdit, NxCollection, ExtCtrls;

type
  TfrmCadProgramacao = class(TForm)
    SMDBGrid1: TSMDBGrid;
    SMDBGrid2: TSMDBGrid;
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    NxButton1: TNxButton;
    Label2: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    SMDBGrid3: TSMDBGrid;
    Panel1: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure NxButton1Click(Sender: TObject);
    procedure SMDBGrid3DblClick(Sender: TObject);
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
  rsDBUtils, UCadProgramacao_Maq, DateUtils, DB, uUtilPadrao;

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
  vTempo : Real;
  vQtdMin : Real;
  vAux : Real;
  vTexto : String;
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
          if Trim(fDMCadProgramacao.mMaq_BocaHrInicial.AsString) = '' then
            fDMCadProgramacao.mMaq_BocaHrInicial.AsDateTime := Now;
          if fDMCadProgramacao.mMaq_BocaDtInicial.AsDateTime <= 10 then
            fDMCadProgramacao.mMaq_BocaDtInicial.AsDateTime := Date;

          vContador := vContador - 1;
          if vContador = 0 then
            fDMCadProgramacao.mMaq_BocaQtd_Gerar.AsFloat := vQtd
          else
            fDMCadProgramacao.mMaq_BocaQtd_Gerar.AsFloat := vQtdDiv;
          vQtd := StrToFloat(FormatFloat('0.00',vQtd - fDMCadProgramacao.mMaq_BocaQtd_Gerar.AsFloat));
          vQtdMin :=StrToFloat(FormatFloat('0',fDMCadProgramacao.cdsPendQTD_POR_MIN.AsFloat));
          //vTempo  := StrToFloat(FormatFloat('0.00',((fDMCadProgramacao.mMaq_BocaQtd_Gerar.AsFloat * 100) / vQtdMin / 60)));
          vTempo  := StrToFloat(FormatFloat('0.00',((fDMCadProgramacao.mMaq_BocaQtd_Gerar.AsFloat * 100) / vQtdMin)));

          if fDMCadProgramacao.cdsPendSOMA_SETUP_INI.AsString = 'S' then
            vTempo := vTempo + fDMCadProgramacao.cdsPendSETUP_INICIO.AsFloat;
          if fDMCadProgramacao.cdsPendSOMA_SETUP_TRO.AsString = 'S' then
            vTempo := vTempo + fDMCadProgramacao.cdsPendSETUP_TROCA.AsFloat;
          vTempo  := StrToFloat(FormatFloat('0.00',vTempo / 60));

          fDMCadProgramacao.mMaq_BocaTempo.AsFloat := fnc_Converte_Min_Dec(vTempo);

          vTexto := fnc_Soma_Data_Hora(fDMCadProgramacao.mMaq_BocaDtInicial.AsDateTime,fDMCadProgramacao.mMaq_BocaHrInicial.AsDateTime,fDMCadProgramacao.mMaq_BocaTempo.AsFloat);
          fDMCadProgramacao.mMaq_BocaDtPrevista.AsDateTime := StrToDate(Copy(vTexto,1,10));
          Delete(vTexto,1,11);
          vTexto := Replace(vTexto,',',':');
          fDMCadProgramacao.mMaq_BocaHrPrevista.AsDateTime := StrToTime(vTexto);



          fDMCadProgramacao.mMaq_Boca.Post;
        end;
        fDMCadProgramacao.mMaq_Boca.Next;
      end;
    end;
    fDMCadProgramacao.mMaq.Next;
  end;

end;

procedure TfrmCadProgramacao.SMDBGrid3DblClick(Sender: TObject);
begin
  if fDMCadProgramacao.mMaq_BocaID_Maquina.AsInteger <= 0 then
    exit;

  fDMCadProgramacao.mMaq_Boca.Edit;
  if fDMCadProgramacao.mMaq_BocaSelecionado.AsString = 'S' then
    fDMCadProgramacao.mMaq_BocaSelecionado.AsString := 'N'
  else
    fDMCadProgramacao.mMaq_BocaSelecionado.AsString := 'S';
  fDMCadProgramacao.mMaq_Boca.Post;
end;

end.
