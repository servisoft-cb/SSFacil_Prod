unit UCadProgramacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDmCadProgramacao, Grids, DBGrids, SMDBGrid, StdCtrls, Mask,
  ToolEdit, CurrEdit, NxCollection;

type
  TfrmCadProgramacao = class(TForm)
    SMDBGrid1: TSMDBGrid;
    SMDBGrid2: TSMDBGrid;
    Label1: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    NxButton1: TNxButton;
    StaticText1: TStaticText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fDMCadProgramacao: TDMCadProgramacao;
    
  end;

var
  frmCadProgramacao: TfrmCadProgramacao;

implementation

uses
  rsDBUtils, UCadProgramacao_Maq;

{$R *.dfm}

procedure TfrmCadProgramacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmCadProgramacao.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMCadProgramacao);
end;

procedure TfrmCadProgramacao.SMDBGrid1DblClick(Sender: TObject);
begin
  frmCadProgramacao_Maq  := TfrmCadProgramacao_Maq.Create(Self);
  frmCadProgramacao_Maq.fDMCadProgramacao := fDMCadProgramacao;
  frmCadProgramacao_Maq.vID_Maq_Local     := fDMCadProgramacao.mMaqID.AsInteger;
  frmCadProgramacao_Maq.ShowModal;
  FreeAndNil(frmCadProgramacao_Maq);

end;

end.
