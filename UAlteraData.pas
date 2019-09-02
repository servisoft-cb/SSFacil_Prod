unit UAlteraData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMCadLote_Calc, ExtCtrls, RzPanel, StdCtrls, Mask, ToolEdit,
  RzEdit, NxCollection, SqlExpr, DBXpress, DB, DBClient;

type
  TfrmAlteraData = class(TForm)
    RzGroupBox3: TRzGroupBox;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    RzDateTimeEdit1: TRzDateTimeEdit;
    Label2: TLabel;
    RzGroupBox1: TRzGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    DateEdit2: TDateEdit;
    RzDateTimeEdit2: TRzDateTimeEdit;
    NxButton1: TNxButton;
    NxButton2: TNxButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure NxButton1Click(Sender: TObject);
    procedure NxButton2Click(Sender: TObject);
  private
    { Private declarations }
    fDMCadLote_Calc: TDMCadLote_Calc;

    vDtEntradaAnt, vDtSaidaAnt : TDate;
    vHrEntradaAnt, vHrSaidaAnt : TTime;

    procedure prc_Alt_DtEstoque(ID : Integer);

  public
    { Public declarations }
    vID_Lote_Loc, vNum_Lote_Loc, vNum_Talao_Loc, vItem_Loc, vID_Setor_Loc : Integer;

  end;

var
  frmAlteraData: TfrmAlteraData;

implementation

uses rsDBUtils, DmdDatabase;

{$R *.dfm}

procedure TfrmAlteraData.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(fDMCadLote_Calc);
  Action := Cafree;
end;

procedure TfrmAlteraData.FormShow(Sender: TObject);
begin
  fDMCadLote_Calc := TDMCadLote_Calc.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMCadLote_Calc);

  Label7.Caption := IntToStr(vNum_Lote_Loc) + '/' + IntToStr(vNum_Talao_Loc);

  vDtEntradaAnt := DateEdit1.Date;
  vDtSaidaAnt   := DateEdit2.Date;
  vHrEntradaAnt := RzDateTimeEdit1.Time;
  vHrSaidaAnt   := RzDateTimeEdit2.Time;
end;

procedure TfrmAlteraData.NxButton1Click(Sender: TObject);
var
  vAltEstoque : Boolean;
  ID: TTransactionDesc;
begin
  if (DateEdit1.Date = vDtEntradaAnt) and (DateEdit2.Date = vDtSaidaAnt)
     and (vHrEntradaAnt = RzDateTimeEdit1.Time) and (vHrSaidaAnt = RzDateTimeEdit2.Time) then
    exit;

  if (vDtSaidaAnt > 10) and (DateEdit2.Date <= 10) then
  begin
    MessageDlg('*** Data de saída não pode deixar em branco!' , mtInformation, [mbOk], 0);
    exit;
  end;

  if (vDtSaidaAnt <= 10) and (DateEdit2.Date > 10) then
  begin
    MessageDlg('*** Data de saída não pode ser preechida!' , mtInformation, [mbOk], 0);
    exit;
  end;

  fDMCadLote_Calc.prc_Localizar(vID_Lote_Loc);

  ID.TransactionID  := 200;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try

    fDMCadLote_Calc.cdsTalao.Locate('NUM_TALAO',vNum_Talao_Loc,[loCaseInsensitive]);

    fDMCadLote_Calc.cdsTalao_Setor.Locate('ITEM',vItem_Loc,[loCaseInsensitive]);

    vAltEstoque := False;
    if (DateEdit1.Date <> vDtEntradaAnt) or (DateEdit2.Date <> vDtSaidaAnt) then
    begin
      if DateEdit2.Date > 10 then
        vAltEstoque := True;
      fDMCadLote_Calc.cdsTalao_Setor.Edit;
      fDMCadLote_Calc.cdsTalao_SetorDTENTRADA.AsDateTime := DateEdit1.Date;
      fDMCadLote_Calc.cdsTalao_SetorDTSAIDA.AsDateTime   := DateEdit2.Date;
    end;

    if (RzDateTimeEdit1.Date <> vHrEntradaAnt) or (RzDateTimeEdit2.Date <> vHrSaidaAnt) then
    begin
      if not (fDMCadLote_Calc.cdsTalao_Setor.State in [dsEdit]) then
        fDMCadLote_Calc.cdsTalao_Setor.Edit;
      fDMCadLote_Calc.cdsTalao_SetorHRENTRADA.AsDateTime := RzDateTimeEdit1.Time;
      fDMCadLote_Calc.cdsTalao_SetorHRSAIDA.AsDateTime   := RzDateTimeEdit2.Time;
    end;

    if (vAltEstoque) then
    begin
      fDMCadLote_Calc.cdsTalao_Estoque.Close;
      fDMCadLote_Calc.sdsTalao_Estoque.ParamByName('id_lote').AsInteger   := vID_Lote_Loc;
      fDMCadLote_Calc.sdsTalao_Estoque.ParamByName('num_talao').AsInteger := vNum_Talao_Loc;
      fDMCadLote_Calc.sdsTalao_Estoque.ParamByName('id_setor').AsInteger  := vID_Setor_Loc;
      fDMCadLote_Calc.sdsTalao_Estoque.ParamByName('data').AsDate         := vDtSaidaAnt;
      fDMCadLote_Calc.cdsTalao_Estoque.Open;

      fDMCadLote_Calc.cdsTalao_Estoque.First;
      while not fDMCadLote_Calc.cdsTalao_Estoque.Eof do
      begin
        fDMCadLote_Calc.cdsTalao_Estoque.Edit;
        fDMCadLote_Calc.cdsTalao_EstoqueDATA.AsDateTime := DateEdit2.Date;
        fDMCadLote_Calc.cdsTalao_Estoque.Post;

        prc_Alt_DtEstoque(fDMCadLote_Calc.cdsTalao_EstoqueID_MOVESTOQUE.AsInteger);

        fDMCadLote_Calc.cdsTalao_Estoque.Next;
      end;
    end;
    fDMCadLote_Calc.cdsTalao_Setor.Post;
    fDMCadLote_Calc.cdsTalao_Setor.ApplyUpdates(0);
    
    fDMCadLote_Calc.cdsTalao_Estoque.ApplyUpdates(0);

    dmDatabase.scoDados.Commit(ID);
  except
  on E: exception do
    begin
      dmDatabase.scoDados.Rollback(ID);
      raise Exception.Create('Erro ao gravar nova data!' + e.message);
    end;
  end;

  Close;
end;

procedure TfrmAlteraData.prc_Alt_DtEstoque(ID: Integer);
var
  sds: TSQLDataSet;
begin
  sds      := TSQLDataSet.Create(nil);
  sds.SQLConnection := dmDatabase.scoDados;
  sds.NoMetadata    := True;
  sds.GetMetadata   := False;
  sds.Close;
  sds.CommandText   := 'update estoque_mov e set e.DTMOVIMENTO = :DTMOVIMENTO WHERE ID = :ID ';

  sds.ParamByName('DTMOVIMENTO').AsDate := DateEdit2.Date;
  sds.ParamByName('ID').AsInteger       := ID;
  sds.ExecSQL;
end;

procedure TfrmAlteraData.NxButton2Click(Sender: TObject);
begin
  Close;
end;

end.
