unit UCadProgramacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDmCadProgramacao, Grids, DBGrids, SMDBGrid, StdCtrls, Mask,
  ToolEdit, CurrEdit, NxCollection, ExtCtrls, SqlExpr, DB, DBXpress;

type
  TfrmCadProgramacao = class(TForm)
    SMDBGrid3: TSMDBGrid;
    NxPanel1: TNxPanel;
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    NxButton2: TNxButton;
    Label2: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    NxButton1: TNxButton;
    NxButton3: TNxButton;
    btnGravar_Prog: TNxButton;
    Panel1: TPanel;
    SMDBGrid1: TSMDBGrid;
    SMDBGrid2: TSMDBGrid;
    Label3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure NxButton1Click(Sender: TObject);
    procedure SMDBGrid3DblClick(Sender: TObject);
    procedure NxButton3Click(Sender: TObject);
    procedure NxButton2Click(Sender: TObject);
    procedure btnGravar_ProgClick(Sender: TObject);
    procedure SMDBGrid3GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }

    procedure prc_Verifica_HrInicial;
    procedure prc_Gravar_mProd;

  public
    { Public declarations }
    fDMCadProgramacao: TDMCadProgramacao;
    
  end;

var
  frmCadProgramacao: TfrmCadProgramacao;

implementation

uses
  rsDBUtils, UCadProgramacao_Maq, DateUtils, uUtilPadrao, DmdDatabase;

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
  CurrencyEdit2.Value := 0;
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
  fDMCadProgramacao.qParametros_Lote.Close;
  fDMCadProgramacao.qParametros_Lote.Open;
  fDMCadProgramacao.mProg.EmptyDataSet;
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

          prc_Verifica_HrInicial;            

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

          //vTexto := fnc_Soma_Data_Hora(fDMCadProgramacao.mMaq_BocaDtInicial.AsDateTime,fDMCadProgramacao.mMaq_BocaHrInicial.AsDateTime,
          //          fDMCadProgramacao.mMaq_BocaTempo.AsFloat,StrToFloat(FormatFloat('0.00',fDMCadProgramacao.qParametros_LoteTOTAL_HORAS_PROD.AsFloat)));
          //fDMCadProgramacao.mMaq_BocaDtPrevista.AsDateTime := StrToDate(Copy(vTexto,1,10));

          prc_Soma_Data_Hora_Res(fDMCadProgramacao.mMaq_BocaDtInicial.AsDateTime,fDMCadProgramacao.mMaq_BocaHrInicial.AsDateTime,
                    fDMCadProgramacao.mMaq_BocaTempo.AsFloat,StrToFloat(FormatFloat('0.00',fDMCadProgramacao.qParametros_LoteTOTAL_HORAS_PROD.AsFloat)));
          fDMCadProgramacao.mMaq_BocaDtPrevista.AsDateTime := StrToDate(Copy(vDtHora_Res,1,10));
          Delete(vDtHora_Res,1,11);
          vDtHora_Res := Replace(vDtHora_Res,',',':');
          fDMCadProgramacao.mMaq_BocaHrPrevista.AsDateTime := StrToTime(vDtHora_Res);

          fDMCadProgramacao.mMaq_BocaPrimeira_Hora.AsDateTime := vPrimeira_Hora;
          fDMCadProgramacao.mMaq_BocaPrimeira_Data.AsDateTime := vPrimeira_Data;

          fDMCadProgramacao.mMaq_Boca.Post;

          prc_Gravar_mProd;

        end
        else
        if (fDMCadProgramacao.mMaq_BocaDtInicial.AsDateTime > 10) or (fDMCadProgramacao.mMaq_BocaDtPrevista.AsDateTime > 10) then
        begin
          fDMCadProgramacao.mMaq_Boca.Edit;
          fDMCadProgramacao.mMaq_BocaDtPrevista.Clear;
          fDMCadProgramacao.mMaq_BocaHrPrevista.Clear;
          fDMCadProgramacao.mMaq_BocaDtInicial.Clear;
          fDMCadProgramacao.mMaq_BocaHrInicial.Clear;
          fDMCadProgramacao.mMaq_BocaPrimeira_Hora.Clear;
          fDMCadProgramacao.mMaq_BocaQtd_Gerar.AsFloat := 0;
          fDMCadProgramacao.mMaq_BocaTempo.AsFloat     := 0;
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
  if fDMCadProgramacao.mMaq_BocaSelecionado.AsString = 'S' then
  begin
    if fDMCadProgramacao.mMaq_BocaDtFinal.AsDateTime > 10 then
    begin
      fDMCadProgramacao.mMaq_BocaDtInicial.AsDateTime := fDMCadProgramacao.mMaq_BocaDtFinal.AsDateTime;
      fDMCadProgramacao.mMaq_BocaHrInicial.AsDateTime := fDMCadProgramacao.mMaq_BocaHrFinal.AsDateTime;
    end;
  end
  else
  begin
    fDMCadProgramacao.mMaq_BocaDtInicial.Clear;
    fDMCadProgramacao.mMaq_BocaHrInicial.Clear;
  end;

  fDMCadProgramacao.mMaq_Boca.Post;
end;

procedure TfrmCadProgramacao.prc_Verifica_HrInicial;
var
  sds: TSQLDataSet;
begin
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := ' SELECT I.id, i.hrinicial, i.hrfinal FROM intervalo_tempo I '
                       + ' WHERE (I.HRINICIAL >= :HRINICIAL1 and I.HRINICIAL < :HRINICIAL2) '
                       + ' or (I.HRFINAL > :HRINICIAL1  and I.HRFINAL < :HRINICIAL2) '
                       + ' or (I.HRINICIAL < :HRINICIAL1 and I.HRFINAL > :HRINICIAL1) '
                       + ' ORDER BY I.HRINICIAL ';
    sds.ParamByName('HRINICIAL1').AsTime := fDMCadProgramacao.mMaq_BocaHrInicial.AsDateTime;
    sds.ParamByName('HRINICIAL2').AsTime := fDMCadProgramacao.mMaq_BocaHrInicial.AsDateTime;
    sds.Open;
    sds.First;
    while not sds.Eof do
    begin
      if (fDMCadProgramacao.mMaq_BocaHrInicial.AsDateTime  > sds.FieldByName('HRINICIAL').AsDateTime)
        and (fDMCadProgramacao.mMaq_BocaHrInicial.AsDateTime < sds.FieldByName('HRFINAL').AsDateTime) then
      begin
        fDMCadProgramacao.mMaq_BocaHrInicial.AsDateTime := sds.FieldByName('HRFINAL').AsDateTime;
      end;
      sds.Next;
    end;
  finally
    FreeAndNil(sds);
  end;
end;

procedure TfrmCadProgramacao.NxButton3Click(Sender: TObject);
begin
  if MessageDlg('Deseja excluir este registro?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  CurrencyEdit2.Value := CurrencyEdit2.Value + fDMCadProgramacao.mMaqQtd_Prog.AsFloat;
  fDMCadProgramacao.mMaq_Boca.First;
  while not fDMCadProgramacao.mMaq_Boca.Eof do
  begin
    fDMCadProgramacao.mMaq_Boca.Delete;
  end;
  fDMCadProgramacao.mMaq.Delete;
end;

procedure TfrmCadProgramacao.NxButton2Click(Sender: TObject);
begin
  fDMCadProgramacao.prc_Monta_Qtd_Maq(CurrencyEdit1.Value);
  CurrencyEdit2.Value := 0;
end;

procedure TfrmCadProgramacao.btnGravar_ProgClick(Sender: TObject);
var
  ID: TTransactionDesc;
begin
  if CurrencyEdit2.Value > 0 then
  begin
    MessageDlg('*** Quantidade não Programada não pode conter valor!', mtInformation, [mbOk], 0);
    exit;
  end;

  ID.TransactionID  := 11;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    fDMCadProgramacao.mProg.First;
    while not fDMCadProgramacao.mProg.Eof do
    begin
      fDMCadProgramacao.cdsBaixa_Processo.Close;
      fDMCadProgramacao.sdsBaixa_Processo.ParamByName('ID').AsInteger   := fDMCadProgramacao.mProgID_Baixa.AsInteger;
      fDMCadProgramacao.sdsBaixa_Processo.ParamByName('ITEM').AsInteger := fDMCadProgramacao.mProgItem_Baixa.AsInteger;
      fDMCadProgramacao.cdsBaixa_Processo.Open;
      if not fDMCadProgramacao.cdsBaixa_Processo.IsEmpty then
      begin
        fDMCadProgramacao.cdsBaixa_Processo.Edit;
        fDMCadProgramacao.cdsBaixa_ProcessoPROGRAMADO.AsString := 'S';
        fDMCadProgramacao.cdsBaixa_Processo.Post;
        fDMCadProgramacao.cdsBaixa_Processo.ApplyUpdates(0);

        fDMCadProgramacao.prc_Inserir;
        fDMCadProgramacao.cdsProgramacaoID_BAIXA.AsInteger       := fDMCadProgramacao.mProgID_Baixa.AsInteger;
        fDMCadProgramacao.cdsProgramacaoITEM_BAIXA.AsInteger     := fDMCadProgramacao.mProgItem_Baixa.AsInteger;
        fDMCadProgramacao.cdsProgramacaoID_PROCESSO.AsInteger    := fDMCadProgramacao.cdsPendID_PROCESSO.AsInteger;
        fDMCadProgramacao.cdsProgramacaoID_LOTE.AsInteger        := fDMCadProgramacao.cdsPendID_LOTE.AsInteger;
        fDMCadProgramacao.cdsProgramacaoNUM_ORDEM.AsInteger      := fDMCadProgramacao.cdsPendNUM_ORDEM.AsInteger;
        fDMCadProgramacao.cdsProgramacaoNUM_LOTE.AsInteger       := fDMCadProgramacao.cdsPendNUM_LOTE.AsInteger;
        fDMCadProgramacao.cdsProgramacaoDTINICIAL.AsDateTime     := fDMCadProgramacao.mProgDtInicial.AsDateTime;
        fDMCadProgramacao.cdsProgramacaoHRINICIAL.AsDateTime     := fDMCadProgramacao.mProgHrInicial.AsDateTime;
        fDMCadProgramacao.cdsProgramacaoDTFINAL.AsDateTime       := fDMCadProgramacao.mProgDtFinal.AsDateTime;
        fDMCadProgramacao.cdsProgramacaoHRFINAL.AsDateTime       := fDMCadProgramacao.mProgHrFinal.AsDateTime;
        fDMCadProgramacao.cdsProgramacaoID_MAQUINA.AsInteger     := fDMCadProgramacao.mProgID_Maquina.AsInteger;
        fDMCadProgramacao.cdsProgramacaoNUM_BOCA.AsInteger       := fDMCadProgramacao.mProgNum_Boca.AsInteger;
        fDMCadProgramacao.cdsProgramacaoDTPROGRAMACAO.AsDateTime := Date;
        fDMCadProgramacao.cdsProgramacaoTEMPO.AsFloat            := fDMCadProgramacao.mProgTempo.AsFloat;
        fDMCadProgramacao.cdsProgramacaoQTD.AsFloat              := fDMCadProgramacao.mProgQtd.AsFloat;
        fDMCadProgramacao.cdsProgramacaoSTATUS.AsString          := 'N';
        fDMCadProgramacao.prc_Gravar;
      end;

      fDMCadProgramacao.mProg.Next;
    end;

    dmDatabase.scoDados.Commit(ID);
  except
    on E: exception do
    begin
      dmDatabase.scoDados.Rollback(ID);
      raise Exception.Create('Erro ao gravar a programação ' + #13 + 'Mensagem: ' + E.Message);
    end;
  end;
  Close;
end;

procedure TfrmCadProgramacao.SMDBGrid3GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMCadProgramacao.mMaq_BocaSelecionado.AsString = 'S' then
    AFont.Color := clBlue
  else
  if fDMCadProgramacao.mMaq_BocaDtFinal.AsDateTime > 10 then
  begin
    Background  := clYellow;
    AFont.Color := clBlack;
  end;
end;

procedure TfrmCadProgramacao.prc_Gravar_mProd;
begin

  fDMCadProgramacao.mProg.Insert;
  fDMCadProgramacao.mProgID_Maquina.AsInteger  := fDMCadProgramacao.mMaqID.AsInteger;
  fDMCadProgramacao.mProgNome_Maquina.AsString := fDMCadProgramacao.mMaqNome.AsString;
  fDMCadProgramacao.mProgNum_Boca.AsInteger    := fDMCadProgramacao.mMaq_BocaNum_Boca.AsInteger;
  fDMCadProgramacao.mProgQtd.AsFloat           := fDMCadProgramacao.mMaq_BocaQtd_Gerar.AsFloat;
  fDMCadProgramacao.mProgDtFinal.AsDateTime    := fDMCadProgramacao.mMaq_BocaDtPrevista.AsDateTime;
  fDMCadProgramacao.mProgHrFinal.AsDateTime    := fDMCadProgramacao.mMaq_BocaHrPrevista.AsDateTime;
  fDMCadProgramacao.mProgTempo.AsFloat         := fDMCadProgramacao.mMaq_BocaTempo.AsFloat;
  fDMCadProgramacao.mProgDtInicial.AsDateTime  := fDMCadProgramacao.mMaq_BocaDtInicial.AsDateTime;
  fDMCadProgramacao.mProgHrInicial.AsDateTime  := fDMCadProgramacao.mMaq_BocaHrInicial.AsDateTime;
  fDMCadProgramacao.mProgID_Baixa.AsInteger    := fDMCadProgramacao.cdsPendID_BAIXA.AsInteger;
  fDMCadProgramacao.mProgItem_Baixa.AsInteger  := fDMCadProgramacao.cdsPendITEM_BAIXA.AsInteger;
  fDMCadProgramacao.mProg.Post;

end;

end.
