unit UConsLote_Mat_Acum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMConsLote, NxCollection, StdCtrls, Mask, ToolEdit, ExtCtrls,
  CurrEdit, Grids, DBGrids, SMDBGrid;

type
  TfrmConsLote_Mat_Acum = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    Label2: TLabel;
    DateEdit2: TDateEdit;
    Label3: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    Label4: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    NxButton1: TNxButton;
    NxButton2: TNxButton;
    SMDBGrid1: TSMDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure NxButton1Click(Sender: TObject);
    procedure NxButton2Click(Sender: TObject);
  private
    { Private declarations }
    fDMConsLote: TDMConsLote;
    vOpcaoImp : String;

    procedure prc_Monta_Opcao;

  public
    { Public declarations }
  end;

var
  frmConsLote_Mat_Acum: TfrmConsLote_Mat_Acum;

implementation

uses rsDBUtils, StrUtils;

{$R *.dfm}

procedure TfrmConsLote_Mat_Acum.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(fDMConsLote);
  Action := Cafree;
end;

procedure TfrmConsLote_Mat_Acum.FormShow(Sender: TObject);
begin
  fDMConsLote := TDMConsLote.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsLote);
end;

procedure TfrmConsLote_Mat_Acum.NxButton1Click(Sender: TObject);
var
  vComandoAux, vComandoAux2: String;
  i : Integer;
begin
  if (DateEdit1.Date <= 10) and (DateEdit2.Date <= 10) then
  begin
    MessageDlg('*** Data não informada!', mtInformation, [mbok], 0);
    exit;
  end;

  i := PosEx('GROUP',UpperCase(fDMConsLote.ctConsLote_Mat_Acum),0);
  vComandoAux  := copy(fDMConsLote.ctConsLote_Mat_Acum,i,Length(fDMConsLote.ctConsLote_Mat_Acum) - i + 1);
  vComandoAux2 := copy(fDMConsLote.ctConsLote_Mat_Acum,1,i-1);

  vComandoAux2 := vComandoAux2 + ' WHERE 0 = 0';
  if DateEdit1.Date > 10 then
    vComandoAux2 := vComandoAux2 + ' AND LM.DTEMISSAO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit1.date));
  if DateEdit2.Date > 10 then
    vComandoAux2 := vComandoAux2 + ' AND LM.DTEMISSAO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  if CurrencyEdit1.AsInteger > 0 then
    vComandoAux2 := vComandoAux2 + ' AND LM.NUM_ORDEM >= ' + IntToStr(CurrencyEdit1.AsInteger);
  if CurrencyEdit2.AsInteger > 0 then
    vComandoAux2 := vComandoAux2 + ' AND LM.NUM_ORDEM <= ' + IntToStr(CurrencyEdit2.AsInteger);

  fDMConsLote.cdsConsLote_Mat_Acum.Close;
  fDMConsLote.sdsConsLote_Mat_Acum.CommandText := vComandoAux2 + ' ' + vComandoAux;
  fDMConsLote.cdsConsLote_Mat_Acum.Open;  
  fDMConsLote.cdsConsLote_Mat_Acum.IndexFieldNames := 'NOME';  
end;

procedure TfrmConsLote_Mat_Acum.NxButton2Click(Sender: TObject);
var
  vArq : String;
begin
  prc_Monta_Opcao;
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Lote_Mat_Acum.fr3';
  if FileExists(vArq) then
    fDMConsLote.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    MessageDlg('*** Relatório ' + vArq + ', não encontrado!' , mtInformation, [mbOk], 0);
    exit;
  end;
  fDMConsLote.frxReport1.variables['ImpOpcao'] := QuotedStr(vOpcaoImp);
  fDMConsLote.frxReport1.ShowReport;
end;

procedure TfrmConsLote_Mat_Acum.prc_Monta_Opcao;
begin
  vOpcaoImp := '';
  if (CurrencyEdit1.AsInteger > 0) and (CurrencyEdit2.AsInteger > 0) then
    vOpcaoImp := vOpcaoImp + '(Nº OP: ' + CurrencyEdit1.Text + ' a ' + CurrencyEdit2.Text + ')'
  else
  if (CurrencyEdit1.AsInteger > 0) then
    vOpcaoImp := vOpcaoImp + '(Nº OP Inicial: ' + CurrencyEdit1.Text + ')'
  else
  if (CurrencyEdit2.AsInteger > 0) then
    vOpcaoImp := vOpcaoImp + '(Nº OP Final: ' + CurrencyEdit2.Text + ')';
  if (DateEdit1.Date > 10) and (DateEdit2.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt Geração: ' + DateEdit1.Text + ' a ' + DateEdit2.Text + ')'
  else
  if (DateEdit1.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt Geração Ini: ' + DateEdit1.Text + ')'
  else
  if (DateEdit2.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt Geração Fin: ' + DateEdit2.Text + ')';
end;

end.
