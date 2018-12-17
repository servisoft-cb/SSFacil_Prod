unit UConsRefDtEntr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMLoteImp, DBVGrids, Grids, DBGrids, SMDBGrid, StdCtrls,
  NxCollection, RxLookup, NxEdit, CurrEdit, Mask, ToolEdit, ExtCtrls,
  RzTabs, DB, Menus;

type
  TfrmConsRefDtEntr = class(TForm)
    Panel1: TPanel;
    lblNomeCliente: TNxLabel;
    btnConsTalao: TNxButton;
    btnImprimir: TNxButton;
    NxLabel13: TNxLabel;
    DateEdit5: TDateEdit;
    NxLabel14: TNxLabel;
    DateEdit6: TDateEdit;
    SMDBGrid1: TSMDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsTalaoClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    fDMLoteImp: TDMLoteImp;
    vOpcaoImp : String;

    procedure prc_Monta_Opcao;

  public
    { Public declarations }
  end;

var
  frmConsRefDtEntr: TfrmConsRefDtEntr;

implementation

uses rsDBUtils, uUtilPadrao;

{$R *.dfm}

procedure TfrmConsRefDtEntr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmConsRefDtEntr.FormShow(Sender: TObject);
begin
  fDMLoteImp:= TDMLoteImp.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMLoteImp);
end;

procedure TfrmConsRefDtEntr.btnConsTalaoClick(Sender: TObject);
begin
  fDMLoteImp.cdsDtEntrega.Close;
  fDMLoteImp.sdsDtEntrega.ParamByName('DATA1').AsDate := DateEdit5.Date;
  fDMLoteImp.sdsDtEntrega.ParamByName('DATA2').AsDate := DateEdit6.Date;
  fDMLoteImp.cdsDtEntrega.Open;
  fDMLoteImp.cdsDtEntrega.IndexFieldNames := 'DTENTREGA;REFERENCIA';
end;

procedure TfrmConsRefDtEntr.prc_Monta_Opcao;
begin
  vOpcaoImp := '';
  if (DateEdit5.Date > 10) and (DateEdit6.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt Entrega.: ' + DateEdit5.Text + ' a ' + DateEdit6.Text + ')'
  else
  if (DateEdit5.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt Entrega Ini: ' + DateEdit5.Text + ')'
  else
  if (DateEdit6.Date > 10) then
    vOpcaoImp := vOpcaoImp + '(Dt Entrega Fin: ' + DateEdit6.Text + ')';
end;

procedure TfrmConsRefDtEntr.btnImprimirClick(Sender: TObject);
var
  vArq : String;
begin
  prc_Monta_Opcao;
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Lote_DtEntrega.fr3';
  if FileExists(vArq) then
    fDMLoteImp.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    MessageDlg('*** Relatório ' + vArq + ', não encontrado!' , mtInformation, [mbOk], 0);
    exit;
  end;
  //fDMLoteImp.frxReport1.variables['ImpOpcao'] := QuotedStr(vOpcaoImp);
  fDMLoteImp.frxReport1.ShowReport;

end;

end.
