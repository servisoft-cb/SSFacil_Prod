unit UConsRemessa_Prod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, NxCollection, UDMConsRemessa_Prod, Grids,
  DBGrids, SMDBGrid;

type
  TfrmConsRemessa_Prod = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    btnConsultar: TNxButton;
    btnImprimir: TNxButton;
    Label3: TLabel;
    Label4: TLabel;
    SMDBGrid1: TSMDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnImprimirClick(Sender: TObject);
  private
    { Private declarations }
    fDMConsRemessa_Prod: TDMConsRemessa_Prod;

    procedure prc_Consultar_Remessa_Ref;
  public
    { Public declarations }
  end;

var
  frmConsRemessa_Prod: TfrmConsRemessa_Prod;

implementation

uses rsDBUtils, StrUtils, uUtilPadrao, USel_OrdemProd, USel_Produto;


{$R *.dfm}

procedure TfrmConsRemessa_Prod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(fDMConsRemessa_Prod);
  Action := Cafree;
end;

procedure TfrmConsRemessa_Prod.btnConsultarClick(Sender: TObject);
begin
  prc_Consultar_Remessa_Ref;
end;

procedure TfrmConsRemessa_Prod.prc_Consultar_Remessa_Ref;
var
  vComandoAux : String;
  i: Integer;
  vAux : String;
  vAux2 : String;
begin
  fDMConsRemessa_Prod.cdsRemessa_Ref.Close;
  vComandoAux := fDMConsRemessa_Prod.ctRemessa_Ref + ' WHERE 0 = 0 ';
  if trim(Edit1.Text) <> '' then
  begin
    vAux := '';
    vRegistro_CSV := Edit1.Text;
    while Trim(vRegistro_CSV) <> '' do
    begin
      if vAux = '' then
        vAux := QuotedStr(fnc_Montar_Campo(',',''))
      else
        vAux := vAux + ',' + QuotedStr(fnc_Montar_Campo(',',''));
    end;
    vComandoAux := vComandoAux + ' AND L.NUM_REMESSA IN (' + vAux + ')';
  end;
  if trim(Edit2.Text) <> '' then
    vComandoAux := vComandoAux + ' AND L.REFERENCIA = ' + QuotedStr(Edit2.Text);
  fDMConsRemessa_Prod.sdsRemessa_Ref.CommandText := vComandoAux;
  fDMConsRemessa_Prod.cdsRemessa_Ref.Open;
  fDMConsRemessa_Prod.cdsRemessa_Ref.IndexFieldNames := 'REF_ORDENADA;OBSMATERIAL';

{  fDMConsRemessa_Prod.cdsRemessa_Ref.Close;
  i := PosEx('GROUP',fDMConsRemessa_Prod.ctRemessa_Ref,0);
  vComandoAux  := copy(fDMConsRemessa_Prod.ctRemessa_Ref,i,Length(fDMConsRemessa_Prod.ctRemessa_Ref) - i + 1);
  vComandoAux2 := copy(fDMConsRemessa_Prod.ctRemessa_Ref,1,i-1);
  vComandoAux2 := vComandoAux2 + ' WHERE 0 = 0 ';
  if trim(Edit1.Text) <> '' then
  begin
    vAux := '';
    vRegistro_CSV := Edit1.Text;
    while Trim(vRegistro_CSV) <> '' do
    begin
      if vAux = '' then
        vAux := QuotedStr(fnc_Montar_Campo(',',''))
      else
        vAux := vAux + ',' + QuotedStr(fnc_Montar_Campo(',',''));
    end;
    vComandoAux2 := vComandoAux2 + ' AND L.NUM_REMESSA IN (' + vAux + ')';
  end;
  if trim(Edit2.Text) <> '' then
    vComandoAux2 := vComandoAux2 + ' AND L.REFERENCIA = ' + QuotedStr(Edit2.Text);
  fDMConsRemessa_Prod.sdsRemessa_Ref.CommandText := vComandoAux2 + ' ' + vComandoAux;
  fDMConsRemessa_Prod.cdsRemessa_Ref.Open;
//where L.num_remessa IN('45/18','40/18')}

end;

procedure TfrmConsRemessa_Prod.FormShow(Sender: TObject);
begin
  fDMConsRemessa_Prod := TDMConsRemessa_Prod.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsRemessa_Prod);
end;

procedure TfrmConsRemessa_Prod.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    vNUM_Ordem_Sel := Edit1.Text;
    frmSel_OrdemProd := TfrmSel_OrdemProd.Create(Self);
    frmSel_OrdemProd.ShowModal;
    Edit1.Text := vNUM_Ordem_Sel;
  end;
end;

procedure TfrmConsRemessa_Prod.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    vReferencia_Pos := Edit2.Text;
    frmSel_Produto  := TfrmSel_Produto.Create(Self);
    frmSel_Produto.vTipo_Prod := 'P';
    frmSel_Produto.ShowModal;
    FreeAndNil(frmSel_Produto);
    if trim(vReferencia_Pos) <> '' then
      Edit2.Text := vReferencia_Pos;
  end;
end;

procedure TfrmConsRemessa_Prod.btnImprimirClick(Sender: TObject);
var
  vOpcaoImp : String;
  vArq : String;
begin
  if fDMConsRemessa_Prod.cdsRemessa_Ref.IsEmpty then
  begin
    MessageDlg('*** Não existe registros para a impressão! ', mtInformation, [mbOk], 0);
    exit;
  end;
  vOpcaoImp := '';
  if trim(Edit1.Text) <> '' then
     vOpcaoImp := vOpcaoImp + ' (Remessas: ' + Edit1.Text + ')';
  if trim(Edit2.Text) <> '' then
     vOpcaoImp := vOpcaoImp + ' (Modelo: ' + Edit2.Text + ')';
  fDMConsRemessa_Prod.cdsRemessa_Ref.IndexFieldNames := 'REF_ORDENADA;OBSMATERIAL';
  vArq := ExtractFilePath(Application.ExeName) + 'Relatorios\Remessa_Ref.fr3';
  if FileExists(vArq) then
    fDMConsRemessa_Prod.frxReport1.Report.LoadFromFile(vArq)
  else
  begin
    MessageDlg('*** Relatório ' + vArq + ', não encontrado!' , mtInformation, [mbOk], 0);
    exit;
  end;
  fDMConsRemessa_Prod.frxReport1.variables['ImpOpcao']    := QuotedStr(vOpcaoImp);
  fDMConsRemessa_Prod.frxReport1.ShowReport;
end;

end.
