unit UConsProgramacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDmConsProgramacao, NxCollection, Grids, DBGrids, SMDBGrid,
  ExtCtrls, DB, StdCtrls;

type
  TfrmConsProgramacao = class(TForm)
    Panel1: TPanel;
    SMDBGrid1: TSMDBGrid;
    NxPanel2: TNxPanel;
    btnConsultar: TNxButton;
    btnImprimir: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure SMDBGrid1TitleClick(Column: TColumn);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    fDmConsProgramacao: TDmConsProgramacao;

  public
    { Public declarations }
  end;

var
  frmConsProgramacao: TfrmConsProgramacao;

implementation

uses
  rsDBUtils;

{$R *.dfm}

procedure TfrmConsProgramacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(fDmConsProgramacao);
  Action := Cafree;
end;

procedure TfrmConsProgramacao.FormShow(Sender: TObject);
begin
  fDmConsProgramacao := TDmConsProgramacao.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDmConsProgramacao);
end;

procedure TfrmConsProgramacao.btnConsultarClick(Sender: TObject);
begin
  fDmConsProgramacao.cdsConsProg.Close;
  fDmConsProgramacao.cdsConsProg.Open;
  fDmConsProgramacao.cdsConsProg.IndexFieldNames := 'NOME_MAQUINA;DTINICIAL;HRINICIAL';
end;

procedure TfrmConsProgramacao.SMDBGrid1TitleClick(Column: TColumn);
var
  i: Integer;
  ColunaOrdenada: String;
begin
  ColunaOrdenada := Column.FieldName;
  if (Column.FieldName = 'DTINICIAL') then
    fDmConsProgramacao.cdsConsProg.IndexFieldNames := Column.FieldName + ';NOME_MAQUINA;NUM_BOCA'
  else
  if (Column.FieldName = 'HRINICIAL') then
    fDmConsProgramacao.cdsConsProg.IndexFieldNames := 'DTINICIAL;' + Column.FieldName + '; NOME_MAQUINA;NUM_BOCA'
  else
  if Column.FieldName <> 'DTFINAL' then
    fDmConsProgramacao.cdsConsProg.IndexFieldNames := Column.FieldName + ';DTFINAL;HRFINAL'
  else
    fDmConsProgramacao.cdsConsProg.IndexFieldNames := Column.FieldName + ';NOME_MAQUINA;NUM_BOCA';
  Column.Title.Color := clBtnShadow;
  for i := 0 to SMDBGrid1.Columns.Count - 1 do
    if not (SMDBGrid1.Columns.Items[I] = Column) then
      SMDBGrid1.Columns.Items[I].Title.Color := $00C6FFC6;
end;

procedure TfrmConsProgramacao.btnImprimirClick(Sender: TObject);
var
  vArq : String;
begin
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Programacao_Textil.fr3';

  if not (FileExists(vArq)) then
  begin
    MessageDlg('*** Relatório não localizado: ' + vArq , mtInformation, [mbOk], 0);
    exit;
  end;
  fDmConsProgramacao.frxReport1.Report.LoadFromFile(vArq);
  fDmConsProgramacao.frxReport1.ShowReport;
end;

end.
