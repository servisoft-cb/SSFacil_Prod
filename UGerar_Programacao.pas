unit UGerar_Programacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDmCadProgramacao, NxCollection, Grids, DBGrids, SMDBGrid,
  ExtCtrls, DB, StdCtrls;

type
  TfrmGerar_Programacao = class(TForm)
    NxPanel1: TNxPanel;
    NxButton1: TNxButton;
    Splitter1: TSplitter;
    Panel1: TPanel;
    SMDBGrid1: TSMDBGrid;
    NxPanel2: TNxPanel;
    Panel2: TPanel;
    SMDBGrid2: TSMDBGrid;
    NxPanel3: TNxPanel;
    NxButton2: TNxButton;
    Label1: TLabel;
    NxButton3: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure NxButton1Click(Sender: TObject);
  private
    { Private declarations }
    fDMCadProgramacao: TDMCadProgramacao;

    procedure prc_scroll(DataSet: TDataSet);
    procedure prc_Consultar_Pend;
    procedure prc_Consultar_MaqPend;

  public
    { Public declarations }
  end;

var
  frmGerar_Programacao: TfrmGerar_Programacao;

implementation

uses
  rsDBUtils;

{$R *.dfm}

procedure TfrmGerar_Programacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(fDMCadProgramacao);
  Action := Cafree;
end;

procedure TfrmGerar_Programacao.FormShow(Sender: TObject);
begin
  fDMCadProgramacao := TDMCadProgramacao.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMCadProgramacao);

end;

procedure TfrmGerar_Programacao.NxButton1Click(Sender: TObject);
begin
  fDMCadProgramacao.cdsPend.AfterScroll := nil;
  prc_Consultar_Pend;
  fDMCadProgramacao.cdsPend.AfterScroll := prc_scroll;
  fDMCadProgramacao.cdsPend.First;
  prc_Consultar_MaqPend;
end;

procedure TfrmGerar_Programacao.prc_Consultar_MaqPend;
begin
  fDMCadProgramacao.cdsMaqPend.Close;
  fDMCadProgramacao.sdsMaqPend.ParamByName('ID').AsInteger := fDMCadProgramacao.cdsPendID_PRODUTO.AsInteger;
  fDMCadProgramacao.cdsMaqPend.Open;
end;

procedure TfrmGerar_Programacao.prc_Consultar_Pend;
begin
  fDMCadProgramacao.cdsPend.Close;
  fDMCadProgramacao.cdsPend.Open;
end;

procedure TfrmGerar_Programacao.prc_scroll(DataSet: TDataSet);
begin
  prc_Consultar_MaqPend;
end;

end.
