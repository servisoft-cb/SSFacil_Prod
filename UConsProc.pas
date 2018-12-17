unit UConsProc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMConsProc, NxCollection, Grids, DBGrids, SMDBGrid, DBVGrids,
  RzTabs, ExtCtrls, DB, DBClient;

type
  TfrmConsProc = class(TForm)
    RzPageControl1: TRzPageControl;
    TS_Processo: TRzTabSheet;
    TS_Referencia: TRzTabSheet;
    SMDBGrid2: TSMDBGrid;
    SMDBGrid1: TSMDBGrid;
    SMDBGrid3: TSMDBGrid;
    Panel1: TPanel;
    btnConsultar: TNxButton;
    Splitter1: TSplitter;
    TS_Referencia_Nao: TRzTabSheet;
    SMDBGrid4: TSMDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure RzPageControl1Change(Sender: TObject);
  private
    { Private declarations }
    fDMConsProc: TDMConsProc;

    procedure prc_Consultar;
    procedure prc_Le_ConsProc;
    procedure prc_scroll(DataSet: TDataSet);
    procedure prc_Monta_Grid(Grid : TSMDBGrid);
    procedure prc_Monta_Auxiliar(Tabela: TClientDataSet ; IDMov : Integer ; Campo_QTD : String);

  public
    { Public declarations }
  end;

var
  frmConsProc: TfrmConsProc;

implementation

uses rsDBUtils;

{$R *.dfm}

procedure TfrmConsProc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(fDMConsProc);
  Action := Cafree;
end;

procedure TfrmConsProc.FormShow(Sender: TObject);
begin
  fDMConsProc:= TDMConsProc.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMConsProc);
end;

procedure TfrmConsProc.btnConsultarClick(Sender: TObject);
begin
  fDMConsProc.cdsProc_Ref.Filtered := False;
  fDMConsProc.cdsProc.AFTERSCROLL := nil;
  if not(fDMConsProc.cdsProc.Active) or (RzPageControl1.ActivePage = TS_Processo) or (RzPageControl1.ActivePage = TS_Referencia) then
    prc_Consultar;
  prc_Le_ConsProc;
  fDMConsProc.cdsProc.AFTERSCROLL := prc_scroll;
  fDMConsProc.cdsProc.First;
  fDMConsProc.cdsProc.Next;
end;

procedure TfrmConsProc.prc_Consultar;
begin
  fDMConsProc.cdsProc.Close;
  fDMConsProc.cdsProc.Open;
  fDMConsProc.cdsProc_Ref.Close;
  fDMConsProc.cdsProc_Ref.Open;
end;

procedure TfrmConsProc.prc_Le_ConsProc;
var
  vIDMov : Integer;
  i : Integer;
  i2 : Integer;
begin
  vIDMov := 0;
  if (RzPageControl1.ActivePage = TS_Processo) or (RzPageControl1.ActivePage = TS_Referencia) then
  begin
    fDMConsProc.mConsProc.EmptyDataSet;
    fDMConsProc.mProc.EmptyDataSet;
  end
  else
  if RzPageControl1.ActivePage = TS_Referencia_Nao then
    fDMConsProc.mConsProc_Nao.EmptyDataSet;
  fDMConsProc.mAuxProc.EmptyDataSet;
  fDMConsProc.cdsProc.First;
  while not fDMConsProc.cdsProc.Eof do
  begin
    if not fDMConsProc.mAuxProc.Locate('ID_Processo',fDMConsProc.cdsProcID_PROCESSO.AsInteger,[loCaseInsensitive]) then
    begin
      vIDMov := vIDMov + 1;
      fDMConsProc.mAuxProc.Insert;
      fDMConsProc.mAuxProcItem.AsInteger         := vIDMov;
      fDMConsProc.mAuxProcID_Processo.AsInteger  := fDMConsProc.cdsProcID_PROCESSO.AsInteger;
      fDMConsProc.mAuxProcNome_Processo.AsString := fDMConsProc.cdsProcNOME_PROCESSO.AsString;
      fDMConsProc.mAuxProc.Post;
    end;
    fDMConsProc.cdsProc.Next;
  end;

  if RzPageControl1.ActivePage = TS_Referencia_Nao then
    prc_Monta_Grid(SMDBGrid4)
  else
    prc_Monta_Grid(SMDBGrid3);

  fDMConsProc.cdsProc_Ref.First;
  while not fDMConsProc.cdsProc_Ref.Eof do
  begin
    if RzPageControl1.ActivePage = TS_Referencia_Nao then
      prc_Monta_Auxiliar(fDMConsProc.mConsProc_Nao,vIDMov,'QTD_NAO_ENVIADO')
    else
      prc_Monta_Auxiliar(fDMConsProc.mConsProc,vIDMov,'QTD_NO_PROCESSO');
    {if fDMConsProc.mConsProc.Locate('ID_Produto;ID_Combinacao',
       VarArrayOf([fDMConsProc.cdsProc_RefID_PRODUTO.AsInteger,fDMConsProc.cdsProc_RefID_COMBINACAO.AsInteger]),[locaseinsensitive]) then
      fDMConsProc.mConsProc.Edit
    else
    begin
      fDMConsProc.mConsProc.Insert;
      fDMConsProc.mConsProcID_Mov.AsInteger         := vIDMov;
      fDMConsProc.mConsProcID_Produto.AsInteger     := fDMConsProc.cdsProc_RefID_PRODUTO.AsInteger;
      fDMConsProc.mConsProcID_Combinacao.AsInteger  := fDMConsProc.cdsProc_RefID_COMBINACAO.AsInteger;
      fDMConsProc.mConsProcReferencia.AsString      := fDMConsProc.cdsProc_RefREFERENCIA.AsString;
      fDMConsProc.mConsProcNome_Combinacao.AsString := fDMConsProc.cdsProc_RefNOME_COMBINACAO.AsString;
      fDMConsProc.mConsProcQTotal.AsInteger            := 0;
    end;
    fDMConsProc.mConsProcQTotal.AsInteger := fDMConsProc.mConsProcQTotal.AsInteger + fDMConsProc.cdsProc_RefQTD_NO_PROCESSO.AsInteger;
    if fDMConsProc.mAuxProc.Locate('ID_Processo',fDMConsProc.cdsProc_RefID_PROCESSO.AsInteger,[loCaseInsensitive]) then
    begin
      fDMConsProc.mConsProc.FieldByName('Qtd'+fDMConsProc.mAuxProcItem.AsString).AsInteger :=
                                        fDMConsProc.mConsProc.FieldByName('Qtd'+fDMConsProc.mAuxProcItem.AsString).AsInteger
                                        + fDMConsProc.cdsProc_RefQTD.AsInteger;
    end;
    fDMConsProc.mConsProc.Post;

    if fDMConsProc.mProc.Locate('ID_MOV;ID_Processo',VarArrayOf([fDMConsProc.mConsProcID_Mov.AsInteger,fDMConsProc.cdsProc_RefID_PROCESSO.AsInteger]),[locaseinsensitive]) then
    begin
      fDMConsProc.mProc.Edit;
      fDMConsProc.mProcQtd_Processo.AsInteger := fDMConsProc.mProcQtd_Processo.AsInteger + fDMConsProc.cdsProc_RefQTD_NO_PROCESSO.AsInteger;
      fDMConsProc.mProc.Post;
    end;}
    fDMConsProc.cdsProc_Ref.Next;
  end;
end;

procedure TfrmConsProc.prc_scroll(DataSet: TDataSet);
begin
  fDMConsProc.cdsProc_Ref.Filtered := False;
  fDMConsProc.cdsProc_Ref.Filter   := 'ID_PROCESSO = ' +QuotedStr(fDMConsProc.cdsProcID_PROCESSO.AsString);
  fDMConsProc.cdsProc_Ref.Filtered := True;
end;

procedure TfrmConsProc.RzPageControl1Change(Sender: TObject);
begin
  if (RzPageControl1.ActivePage = TS_Processo)and (fDMConsProc.cdsProc.Active) then
  begin
    fDMConsProc.cdsProc.First;
    fDMConsProc.cdsProc.Last;
  end;
end;

procedure TfrmConsProc.prc_Monta_Grid(Grid: TSMDBGrid);
var
  i,i2 : Integer;
begin
  i2 := 0;
  for i := 1 to Grid.ColCount - 2 do
  begin
    if (copy(Grid.Columns[i].FieldName,1,3) = 'Qtd') then
    begin
      i2 := i2 + 1;
      Grid.Columns[i].Visible := (i2 <= fDMConsProc.mAuxProc.RecordCount);
      if (i2 <= fDMConsProc.mAuxProc.RecordCount) then
      begin
        if fDMConsProc.mAuxProc.Locate('Item',i2,[loCaseInsensitive]) then
          Grid.Columns[i].Title.Caption := fDMConsProc.mAuxProcNome_Processo.AsString;
      end;
    end;
  end;
end;

procedure TfrmConsProc.prc_Monta_Auxiliar(Tabela: TClientDataSet ; IDMov : Integer ; Campo_QTD : String);
begin
  if Tabela.Locate('ID_Produto;ID_Combinacao',
     VarArrayOf([fDMConsProc.cdsProc_RefID_PRODUTO.AsInteger,fDMConsProc.cdsProc_RefID_COMBINACAO.AsInteger]),[locaseinsensitive]) then
    Tabela.Edit
  else
  begin
    Tabela.Insert;
    Tabela.FieldByName('ID_Mov').AsInteger         := IDMov;
    Tabela.FieldByName('ID_Produto').AsInteger     := fDMConsProc.cdsProc_RefID_PRODUTO.AsInteger;
    Tabela.FieldByName('ID_Combinacao').AsInteger  := fDMConsProc.cdsProc_RefID_COMBINACAO.AsInteger;
    Tabela.FieldByName('Referencia').AsString      := fDMConsProc.cdsProc_RefREFERENCIA.AsString;
    Tabela.FieldByName('Nome_Combinacao').AsString := fDMConsProc.cdsProc_RefNOME_COMBINACAO.AsString;
    Tabela.FieldByName('QTotal').AsInteger         := 0;
  end;
  //Tabela.FieldByName('QTotal').AsInteger := Tabela.FieldByName('QTotal').AsInteger + fDMConsProc.cdsProc_RefQTD_NO_PROCESSO.AsInteger;
  Tabela.FieldByName('QTotal').AsInteger := Tabela.FieldByName('QTotal').AsInteger + fDMConsProc.cdsProc_Ref.FieldByName(Campo_QTD).AsInteger;
  if fDMConsProc.mAuxProc.Locate('ID_Processo',fDMConsProc.cdsProc_RefID_PROCESSO.AsInteger,[loCaseInsensitive]) then
  begin
    Tabela.FieldByName('Qtd'+fDMConsProc.mAuxProcItem.AsString).AsInteger :=
                                      Tabela.FieldByName('Qtd'+fDMConsProc.mAuxProcItem.AsString).AsInteger
                                      //+ fDMConsProc.cdsProc_RefQTD.AsInteger;
                                      + fDMConsProc.cdsProc_Ref.FieldByName(Campo_QTD).AsInteger;
  end;
  Tabela.Post;

  if (RzPageControl1.ActivePage = TS_Processo) or (RzPageControl1.ActivePage = TS_Referencia) then
  begin
    if fDMConsProc.mProc.Locate('ID_MOV;ID_Processo',VarArrayOf([fDMConsProc.mConsProcID_Mov.AsInteger,fDMConsProc.cdsProc_RefID_PROCESSO.AsInteger]),[locaseinsensitive]) then
    begin
      fDMConsProc.mProc.Edit;
      fDMConsProc.mProcQtd_Processo.AsInteger := fDMConsProc.mProcQtd_Processo.AsInteger + fDMConsProc.cdsProc_RefQTD_NO_PROCESSO.AsInteger;
      fDMConsProc.mProc.Post;
    end;
  end;

end;

end.

