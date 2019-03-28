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
    NxButton3: TNxButton;
    Panel3: TPanel;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure NxButton1Click(Sender: TObject);
    procedure SMDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SMDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure NxButton2Click(Sender: TObject);
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
    AFont.Color := clRed
  else
  if fDMCadProgramacao.cdsMaqPendQTD_BOCA.AsInteger > fDMCadProgramacao.cdsMaqPendBOCA_DISPONIVEL.AsInteger then
    AFont.Color := clAqua;

end;

procedure TfrmGerar_Programacao.NxButton2Click(Sender: TObject);
var
  vQtd : Real;
  vQtdDiv : Real;
  vContador : Real;
begin
  fDMCadProgramacao.mMaq.EmptyDataSet;
  fDMCadProgramacao.mMaq_Boca.EmptyDataSet;
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

  vContador := StrToFloat(FormatFloat('0',fDMCadProgramacao.mMaq.RecordCount));

  vQtdDiv := StrToFloat(FormatFloat('0.00',fDMCadProgramacao.cdsPendQTD.AsFloat / vContador));
  vQtd    := fDMCadProgramacao.cdsPendQTD.AsFloat;
  fDMCadProgramacao.mMaq.First;
  while not fDMCadProgramacao.mMaq.Eof do
  begin
    fDMCadProgramacao.mMaq.Edit;
    if fDMCadProgramacao.mMaq.RecordCount = fDMCadProgramacao.mMaq.RecNo then
      fDMCadProgramacao.mMaqQtd_Prog.AsFloat := vQtd
    else
      fDMCadProgramacao.mMaqQtd_Prog.AsFloat := vQtdDiv;
    vQtd := StrToFloat(FormatFloat('0.00',vQtd - fDMCadProgramacao.mMaqQtd_Prog.AsFloat));
    fDMCadProgramacao.mMaq.Post;

    fDMCadProgramacao.prc_Consultar_MaqUsada(fDMCadProgramacao.mMaqID.AsInteger);
    fDMCadProgramacao.prc_Gerar_MaqBoca;

    fDMCadProgramacao.mMaq.Next;
  end;

  frmCadProgramacao  := TfrmCadProgramacao.Create(Self);
  frmCadProgramacao.fDMCadProgramacao := fDMCadProgramacao;
  frmCadProgramacao.ShowModal;
  FreeAndNil(frmCadProgramacao);
end;

end.
