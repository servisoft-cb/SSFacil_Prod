unit UBaixaLote_Ped;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMBaixaProd, StdCtrls, RzEdit, Mask, ToolEdit;

type
  TfrmBaixaLote_Ped = class(TForm)
    Label6: TLabel;
    DateEdit1: TDateEdit;
    Label7: TLabel;
    RzDateTimeEdit1: TRzDateTimeEdit;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Memo1: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
    fDMBaixaProd : TDMBaixaProd;

    procedure prc_Baixa_Lote;
    
    function fnc_Lote_OK : Boolean;
    
  public
    { Public declarations }
  end;

var
  frmBaixaLote_Ped: TfrmBaixaLote_Ped;

implementation

uses rsDBUtils, uUtilPadrao;

{$R *.dfm}

procedure TfrmBaixaLote_Ped.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(fDMBaixaProd);
  Action := Cafree;
end;

procedure TfrmBaixaLote_Ped.FormShow(Sender: TObject);
begin
  fDMBaixaProd:= TDMBaixaProd.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMBaixaProd);
  DateEdit1.Date := Date;
  Edit1.SetFocus;
end;

procedure TfrmBaixaLote_Ped.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
  begin
    if fnc_Lote_OK then
    begin
      prc_Baixa_Lote;
    end;
    Edit1.SelectAll;
  end;
end;

function TfrmBaixaLote_Ped.fnc_Lote_OK: Boolean;
var
  vLote : Integer;
  vTalao : Integer;
  vIDAux : Integer;
begin
  Result := False;

  Edit1.Text := Monta_Numero(Edit1.Text,0);

  if (Length(Edit1.Text) <> 7) then
  begin
    MessageDlg('*** Código informado incorreto!', mtError, [mbOk], 0);
    exit;
  end;
  if (copy(Edit1.Text,1,1) <> '9') then
  begin
    MessageDlg('*** Código informado incorreto!', mtError, [mbOk], 0);
    exit;
  end;

  vLote     := StrToInt(copy(Edit1.Text,2,6));

  fDMBaixaProd.cdsLote.Close;
  fDMBaixaProd.sdsLote.ParamByName('NUM_LOTE').AsInteger := vLote;
  fDMBaixaProd.cdsLote.Open;

  if fDMBaixaProd.cdsLote.IsEmpty then
  begin
    MessageDlg('*** Lote ' + IntToStr(vLote) + '  não encontrado!', mtError, [mbOk], 0);
    exit;
  end;

  if fDMBaixaProd.cdsLoteDTBAIXA.AsDateTime > 10 then
  begin
    MessageDlg('*** Lote ' + IntToStr(vLote) + '  já baixado!', mtError, [mbOk], 0);
    exit;
  end;

  Result := True;
end;

procedure TfrmBaixaLote_Ped.prc_Baixa_Lote;
var
  vData : TDateTime;
  vHora : TTime;
  vMSGAux : String;
begin
  Memo1.Lines.Clear;
  vMSGAux := '';
  if DateEdit1.Date > 10 then
    vData := DateEdit1.Date
  else
    vData := Date;
  if trim(RzDateTimeEdit1.Text) <> '' then
    vHora := RzDateTimeEdit1.Time
  else
    vHora := Now;
  fDMBaixaProd.cdsLote.Edit;
  if fDMBaixaProd.cdsLoteDTENTRADA.IsNull then
  begin
    fDMBaixaProd.cdsLoteDTENTRADA.AsDateTime := vData;
    fDMBaixaProd.cdsLoteHRENTRADA.AsDateTime := vHora;
    vMSGAux                                  := 'Entrada em Produção';
  end
  else
  if fDMBaixaProd.cdsLoteDTBAIXA.IsNull then
  begin
    fDMBaixaProd.cdsLoteDTBAIXA.AsDateTime    := vData;
    fDMBaixaProd.cdsLoteHRBAIXA.AsDateTime    := vHora;
    fDMBaixaProd.cdsLoteQTD_PRODUZIDO.AsFloat := fDMBaixaProd.cdsLoteQTD.AsFloat;
    fDMBaixaProd.cdsLoteQTD_PENDENTE.AsFloat  := 0;
    vMSGAux                                   := 'Encerrada a Produção';
  end;
  fDMBaixaProd.cdsLote.Post;

  Memo1.Lines.Add('OP: ' + fDMBaixaProd.cdsLoteNUM_LOTE.AsString);
  Memo1.Lines.Add('');
  Memo1.Lines.Add('Pedido OC: ' + fDMBaixaProd.cdsLoteOBS_PED.AsString);
  Memo1.Lines.Add('');
  Memo1.Lines.Add(vMSGAux);
  fDMBaixaProd.cdsLote.ApplyUpdates(0);

end;

procedure TfrmBaixaLote_Ped.Edit1Change(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;

end.
