unit UGerar_Talao_Ajuste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMCadLote, StdCtrls, Mask, ToolEdit, CurrEdit, NxCollection,
  RxLookup, DB;

type
  TfrmGerar_Talao_Ajuste = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    NxButton1: TNxButton;
    NxButton2: TNxButton;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    Label5: TLabel;
    CurrencyEdit3: TCurrencyEdit;
    Label6: TLabel;
    CurrencyEdit4: TCurrencyEdit;
    Label8: TLabel;
    Label9: TLabel;
    CurrencyEdit6: TCurrencyEdit;
    CurrencyEdit7: TCurrencyEdit;
    NxPanel1: TNxPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure NxButton2Click(Sender: TObject);
    procedure NxButton1Click(Sender: TObject);
  private
    { Private declarations }
    fDMCadLote: TDMCadLote;

    procedure prc_UltBaixaParcial;

  public
    { Public declarations }
    vID_Baixa, vItem_Baixa : Integer;
    vIDProcesso_Loc : Integer;
    vTipo : String; //A= Ajuste   R= Retrabalho
  end;

var
  frmGerar_Talao_Ajuste: TfrmGerar_Talao_Ajuste;

implementation

uses rsDBUtils;

{$R *.dfm}

procedure TfrmGerar_Talao_Ajuste.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(fDMCadLote);
  Action := Cafree;
end;

procedure TfrmGerar_Talao_Ajuste.FormShow(Sender: TObject);
begin
  fDMCadLote := TDMCadLote.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMCadLote);
  CurrencyEdit1.SetFocus;
  RxDBLookupCombo1.KeyValue := vIDProcesso_Loc;
  if vTipo = 'R' then
  begin
    NxPanel1.Caption := 'Geração de Talão de Retrabalho';
    prc_UltBaixaParcial;
    CurrencyEdit1.Value := fDMCadLote.qUltBaixaParcialQTD.AsFloat;
  end;
end;

procedure TfrmGerar_Talao_Ajuste.NxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmGerar_Talao_Ajuste.NxButton1Click(Sender: TObject);
var
  vMSGAux : String;
  vItemAux : Integer;
  vIDBaixaAux : Integer;
begin
  vMSGAux := '';
  if trim(RxDBLookupCombo1.Text) = '' then
    vMSGAux := vMSGAux + #13 + '*** Processo não informado!';
  if CurrencyEdit6.AsInteger <= 0 then
    vMSGAux := vMSGAux + #13 + '*** ID da Baixa não informado!';
  if CurrencyEdit7.AsInteger <= 0 then
    vMSGAux := vMSGAux + #13 + '*** Item da Baixa não informado!';
  if trim(vMSGAux) <> '' then
  begin
    MessageDlg(vMSGAux, mtInformation, [mbok], 0);
    exit;
  end;

  fDMCadLote.qBaixaProcesso.Close;
  fDMCadLote.qBaixaProcesso.ParamByName('ID').AsInteger   := CurrencyEdit6.AsInteger;
  fDMCadLote.qBaixaProcesso.ParamByName('ITEM').AsInteger := CurrencyEdit7.AsInteger;
  fDMCadLote.qBaixaProcesso.Open;
  if (vTipo = 'A') and (StrToFloat(FormatFloat('0.0000',fDMCadLote.qBaixaProcessoQTD_PENDENTE.AsFloat)) > 0) then
  begin
    MessageDlg('*** Este Processo esta com quantidade pendente!', mtInformation, [mbok], 0);
    exit;
  end
  else
  if (vTipo = 'R') and (StrToFloat(FormatFloat('0.0000',fDMCadLote.qBaixaProcessoQTD_PRODUZIDO.AsFloat)) <= 0) then
  begin
    MessageDlg('*** Este Processo não possui quantidade produzida!', mtInformation, [mbok], 0);
    exit;
  end;

  fDMCadLote.cdsProcesso.Locate('ID',RxDBLookupCombo1.KeyValue,[loCaseInsensitive]);

  fDMCadLote.prc_Abrir_Baixa_Processo(CurrencyEdit2.AsInteger,0,0,0);
  fDMCadLote.cdsBaixa_Processo.Last;
  vItemAux    := fDMCadLote.cdsBaixa_ProcessoITEM.AsInteger;
  vIDBaixaAux := fDMCadLote.cdsBaixa_ProcessoID.AsInteger;
  
  fDMCadLote.cdsBaixa_Processo.Insert;
  fDMCadLote.cdsBaixa_ProcessoID.AsInteger   := vIDBaixaAux;
  fDMCadLote.cdsBaixa_ProcessoITEM.AsInteger := vItemAux + 1;
  fDMCadLote.cdsBaixa_ProcessoID_PROCESSO.AsInteger := RxDBLookupCombo1.KeyValue;
  if fDMCadLote.qBaixaProcessoID_LOTE.AsInteger > 0 then
    fDMCadLote.cdsBaixa_ProcessoID_LOTE.AsInteger := fDMCadLote.qBaixaProcessoID_LOTE.AsInteger
  else
  begin
    fDMCadLote.cdsBaixa_ProcessoID_PEDIDO.AsInteger   := fDMCadLote.qBaixaProcessoID_PEDIDO.AsInteger;
    fDMCadLote.cdsBaixa_ProcessoITEM_PEDIDO.AsInteger := fDMCadLote.qBaixaProcessoITEM_PEDIDO.AsInteger;
  end;
  fDMCadLote.cdsBaixa_ProcessoDTENTRADA.Clear;
  fDMCadLote.cdsBaixa_ProcessoHRENTRADA.Clear;
  fDMCadLote.cdsBaixa_ProcessoDTBAIXA.Clear;
  fDMCadLote.cdsBaixa_ProcessoHRBAIXA.Clear;
  fDMCadLote.cdsBaixa_ProcessoQTD.AsFloat := CurrencyEdit1.Value;
  fDMCadLote.cdsBaixa_ProcessoQTD_PRODUZIDO.AsFloat := 0;
  fDMCadLote.cdsBaixa_ProcessoNUM_ORDEM.AsInteger   := fDMCadLote.qBaixaProcessoNUM_ORDEM.AsInteger;
  fDMCadLote.cdsBaixa_ProcessoTIPO.AsString         := fDMCadLote.qBaixaProcessoTIPO.AsString; 
  fDMCadLote.cdsBaixa_ProcessoQTD_PENDENTE.AsFloat  := StrToFloat(FormatFloat('0.0000',fDMCadLote.cdsBaixa_ProcessoQTD.AsFloat));
  //fDMCadLote.cdsBaixa_ProcessoQTD_LIBERADA.AsFloat  := StrToFloat(FormatFloat('0.0000',fDMCadLote.cdsBaixa_ProcessoQTD.AsFloat));
  fDMCadLote.cdsBaixa_ProcessoQTD_LIBERADA.AsFloat  := StrToFloat(FormatFloat('0.00',0));
  if vTipo = 'A' then
    fDMCadLote.cdsBaixa_ProcessoAJUSTE.AsString     := 'S'
  else
    fDMCadLote.cdsBaixa_ProcessoRETRABALHO.AsString := 'S';
  fDMCadLote.cdsBaixa_Processo.Post;
  fDMCadLote.cdsBaixa_Processo.ApplyUpdates(0);
  Close;
end;

procedure TfrmGerar_Talao_Ajuste.prc_UltBaixaParcial;
begin
  fDMCadLote.qUltBaixaParcial.Close;
  fDMCadLote.qUltBaixaParcial.ParamByName('ID').AsInteger          := vID_Baixa;
  fDMCadLote.qUltBaixaParcial.ParamByName('ID_PROCESSO').AsInteger := vIDProcesso_Loc;
  fDMCadLote.qUltBaixaParcial.ParamByName('ITEM').AsInteger        := vItem_Baixa;
  fDMCadLote.qUltBaixaParcial.Open;
end;

end.
