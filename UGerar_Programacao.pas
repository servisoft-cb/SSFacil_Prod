unit UGerar_Programacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDmCadProgramacao, NxCollection, Grids, DBGrids, SMDBGrid;

type
  TfrmGerar_Programacao = class(TForm)
    NxPanel1: TNxPanel;
    NxButton1: TNxButton;
    SMDBGrid1: TSMDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    fDMCadProgramacao: TDMCadProgramacao;

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

end.
