unit UEstornarBaixa_Talao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UDMBaixaProd_Calc, ExtCtrls, Grids, DBGrids, SMDBGrid,
  NxCollection;

type
  TfrmEstornarBaixa_Talao = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    SMDBGrid1: TSMDBGrid;
    Panel2: TPanel;
    NxButton1: TNxButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NxButton1Click(Sender: TObject);
  private
    { Private declarations }
    fDMBaixaProd_Calc: TDMBaixaProd_Calc;
    vDigInicial : String;
    vLote, vTalao : Integer;
    function fnc_Verifica_CodBarra : Boolean;
    procedure prc_Consultar;
    
  public
    { Public declarations }


  end;

var
  frmEstornarBaixa_Talao: TfrmEstornarBaixa_Talao;

implementation

uses uUtilPadrao, rsDBUtils;

{$R *.dfm}

procedure TfrmEstornarBaixa_Talao.FormShow(Sender: TObject);
begin
  fDMBaixaProd_Calc := TDMBaixaProd_Calc.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMBaixaProd_Calc);
end;

procedure TfrmEstornarBaixa_Talao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(fDMBaixaProd_Calc);
  Action := Cafree;
end;

procedure TfrmEstornarBaixa_Talao.Edit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
  begin
    if not fnc_Verifica_CodBarra then
      exit;

    vDigInicial := copy(Edit1.Text,1,1);
    vLote       := StrToInt(copy(Edit1.Text,2,6));
    vTalao      := 0;
    if vDigInicial = '2' then
      vTalao := StrToInt(copy(Edit1.Text,8,2));
    prc_Consultar;
  end;

end;

function TfrmEstornarBaixa_Talao.fnc_Verifica_CodBarra: Boolean;
begin
  Result := false;
  Edit1.Text := Monta_Numero(Edit1.Text,0);
  if (Length(Edit1.Text) < 1) then
  begin
    MessageDlg('*** Código informado incorreto!', mtError, [mbOk], 0);
    exit;
  end;
  if (copy(Edit1.Text,1,1) = '9') and (Length(Edit1.Text) <> 7) then
  begin
    MessageDlg('*** Código informado incorreto!', mtError, [mbOk], 0);
    exit;
  end;
  if (Length(Edit1.Text) <> 7) and (copy(Edit1.Text,1,1) = '9')  then
  begin
    MessageDlg('*** Código informado incorreto!', mtError, [mbOk], 0);
    exit;
  end;
  if (Length(Edit1.Text) <> 9) and (copy(Edit1.Text,1,1) = '2')  then
  begin
    MessageDlg('*** Código informado incorreto!', mtError, [mbOk], 0);
    exit;
  end;
  if (Length(Edit1.Text) <> 11) and (copy(Edit1.Text,1,1) = '3')  then
  begin
    MessageDlg('*** Código informado incorreto!', mtError, [mbOk], 0);
    exit;
  end;
  Result := True;
end;

procedure TfrmEstornarBaixa_Talao.prc_Consultar;
begin
  fDMBaixaProd_Calc.cdsEstornoTalao.Close;
  fDMBaixaProd_Calc.sdsEstornoTalao.CommandText := fDMBaixaProd_Calc.ctEstornoTalao;
  fDMBaixaProd_Calc.sdsEstornoTalao.ParamByName('NUM_LOTE').AsInteger  := vLote;
  fDMBaixaProd_Calc.sdsEstornoTalao.ParamByName('NUM_TALAO').AsInteger := vTalao;
  fDMBaixaProd_Calc.cdsEstornoTalao.Open;
  fDMBaixaProd_Calc.cdsEstornoTalao.IndexFieldNames := 'NUM_LOTE;NUM_TALAO;ITEM';
end;

procedure TfrmEstornarBaixa_Talao.NxButton1Click(Sender: TObject);
begin
  if MessageDlg('Confirmar o Estorno dos Setores selecionados? ',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
    exit;
  fDMBaixaProd_Calc.cdsEstornoTalao.First;
  while not fDMBaixaProd_Calc.cdsEstornoTalao.Eof do
  begin
    if (SMDBGrid1.SelectedRows.CurrentRowSelected) then
    begin
      fDMBaixaProd_Calc.prc_Abrir_Baixa_Processo(fDMBaixaProd_Calc.cdsEstornoTalaoID.AsInteger,fDMBaixaProd_Calc.cdsEstornoTalaoNUM_TALAO.AsInteger,fDMBaixaProd_Calc.cdsEstornoTalaoID_SETOR.AsInteger);
      if not fDMBaixaProd_Calc.cdsTalao_Setor.IsEmpty then
      begin
        fDMBaixaProd_Calc.cdsTalao_Setor.Edit;
        fDMBaixaProd_Calc.cdsTalao_SetorDTENTRADA.Clear;
        fDMBaixaProd_Calc.cdsTalao_SetorHRENTRADA.Clear;
        fDMBaixaProd_Calc.cdsTalao_SetorDTSAIDA.Clear;
        fDMBaixaProd_Calc.cdsTalao_SetorHRSAIDA.Clear;
        fDMBaixaProd_Calc.cdsTalao_SetorTOTAL_HORAS.Clear;
        fDMBaixaProd_Calc.cdsTalao_SetorID_SETOR2.Clear;
        fDMBaixaProd_Calc.cdsTalao_SetorQTD_PENDENTE.AsFloat  := StrToFloat(FormatFloat('0.000',fDMBaixaProd_Calc.cdsTalao_SetorQTD.AsFloat));
        fDMBaixaProd_Calc.cdsTalao_SetorQTD_PRODUZIDO.AsFloat := 0;
        fDMBaixaProd_Calc.cdsTalao_Setor.Post;
        fDMBaixaProd_Calc.cdsTalao_Setor.ApplyUpdates(0);
      end;
    end;
    fDMBaixaProd_Calc.cdsEstornoTalao.Next;
  end;
  MessageDlg('*** Estorno concluído!', mtError, [mbOk], 0);
  prc_Consultar;
end;

end.
