unit UGerar_Programacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDmCadProgramacao, NxCollection, Grids, DBGrids, SMDBGrid,
  ExtCtrls, DB, StdCtrls;

type
  TfrmGerar_Programacao = class(TForm)
    Splitter1: TSplitter;
    Panel1: TPanel;
    SMDBGrid1: TSMDBGrid;
    NxPanel2: TNxPanel;
    Panel2: TPanel;
    SMDBGrid2: TSMDBGrid;
    NxPanel3: TNxPanel;
    btnProgramar: TNxButton;
    NxButton3: TNxButton;
    Panel3: TPanel;
    Label2: TLabel;
    btnConsultar: TNxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SMDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnProgramarClick(Sender: TObject);
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
  rsDBUtils, UCadProgramacao;

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

procedure TfrmGerar_Programacao.btnConsultarClick(Sender: TObject);
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

procedure TfrmGerar_Programacao.SMDBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F3) or (Key = Vk_F4) then
  begin
    fDMCadProgramacao.cdsPend.Edit;
    if (Key = Vk_F3) then
    begin
      if fDMCadProgramacao.cdsPendSOMA_SETUP_INI.AsString = 'S' then
        fDMCadProgramacao.cdsPendSOMA_SETUP_INI.AsString := 'N'
      else
        fDMCadProgramacao.cdsPendSOMA_SETUP_INI.AsString := 'S';
    end;
    if (Key = Vk_F4) then
    begin
      if fDMCadProgramacao.cdsPendSOMA_SETUP_TRO.AsString = 'S' then
        fDMCadProgramacao.cdsPendSOMA_SETUP_TRO.AsString := 'N'
      else
        fDMCadProgramacao.cdsPendSOMA_SETUP_TRO.AsString := 'S';
    end;
    fDMCadProgramacao.cdsPend.Post;
    fDMCadProgramacao.cdsMaqPend.Refresh;
    //fDMCadProgramacao.cdsMaqPendCalcFields(fDMCadProgramacao.cdsMaqPend);
 
  end;

end;

procedure TfrmGerar_Programacao.SMDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMCadProgramacao.cdsMaqPendBOCA_DISPONIVEL.AsInteger <= 0 then
  begin
    Background  := clRed;
    AFont.Color := clwhite;
  end
  else
  if fDMCadProgramacao.cdsMaqPendQTD_BOCA.AsInteger > fDMCadProgramacao.cdsMaqPendBOCA_DISPONIVEL.AsInteger then
  begin
    Background  := clAqua;
    AFont.Color := clBlack;
  end;
end;

procedure TfrmGerar_Programacao.btnProgramarClick(Sender: TObject);
var
  vContador : Integer;
begin
  if StrToFloat(FormatFloat('0.00',fDMCadProgramacao.cdsPendQTD_POR_MIN.AsFloat)) <= 0 then
  begin
    MessageDlg('*** Qtde. por minuto não informado!'#13 +
               '    Programação não vai ser gerada.', mtInformation, [mbok], 0);
    exit;
  end;

  fDMCadProgramacao.mMaq.EmptyDataSet;
  fDMCadProgramacao.mMaq_Boca.EmptyDataSet;
  fDMCadProgramacao.mProg.EmptyDataSet;
  fDMCadProgramacao.cdsMaqPend.First;

  while not fDMCadProgramacao.cdsMaqPend.Eof do
  begin
    if (SMDBGrid2.SelectedRows.CurrentRowSelected) then
    begin
      fDMCadProgramacao.mMaq.Insert;
      fDMCadProgramacao.mMaqID.AsInteger             := fDMCadProgramacao.cdsMaqPendID_MAQUINA.AsInteger;
      fDMCadProgramacao.mMaqNome.AsString            := fDMCadProgramacao.cdsMaqPendNOME_MAQUINA.AsString;
      fDMCadProgramacao.mMaqQtd_Bocas.AsInteger      := fDMCadProgramacao.cdsMaqPendQTD_BOCA.AsInteger;
      fDMCadProgramacao.mMaqQtd_Disponivel.AsInteger := fDMCadProgramacao.cdsMaqPendBOCA_DISPONIVEL.AsInteger;
      fDMCadProgramacao.mMaqQtd_Prog.AsInteger       := 0;
      fDMCadProgramacao.mMaq.Post;
    end;
    fDMCadProgramacao.cdsMaqPend.Next;
  end;

  if fDMCadProgramacao.mMaq.RecordCount <= 0 then
  begin
    MessageDlg('*** Nenhuma foi escolhida Máquina!', mtInformation, [mbok], 0);
    exit;
  end;

  fDMCadProgramacao.prc_Monta_Qtd_Maq(fDMCadProgramacao.cdsPendQTD.AsFloat);

  frmCadProgramacao  := TfrmCadProgramacao.Create(Self);
  frmCadProgramacao.fDMCadProgramacao := fDMCadProgramacao;
  frmCadProgramacao.ShowModal;
  FreeAndNil(frmCadProgramacao);

  btnConsultarClick(Sender);
end;

end.
