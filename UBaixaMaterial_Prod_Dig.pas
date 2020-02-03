unit UBaixaMaterial_Prod_Dig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMBaixaMaterial_Prod, StdCtrls, Mask, DBCtrls, ExtCtrls, Grids,
  DBGrids, SMDBGrid, NxEdit, ToolEdit, CurrEdit, NxCollection, Buttons;

type
  TfrmBaixaMaterial_Prod_Dig = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label7: TLabel;
    DBEdit8: TDBEdit;
    Panel1: TPanel;
    Label8: TLabel;
    DBEdit9: TDBEdit;
    Label9: TLabel;
    NxComboBox1: TNxComboBox;
    Label10: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    btnConfirmar: TNxButton;
    btnCancelar: TNxButton;
    NxPanel1: TNxPanel;
    SMDBGrid1: TSMDBGrid;
    NxPanel2: TNxPanel;
    btnExcluir: TNxButton;
    Label11: TLabel;
    CurrencyEdit2: TCurrencyEdit;
    lblFuncionario: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure CurrencyEdit2Enter(Sender: TObject);
    procedure CurrencyEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CurrencyEdit2Change(Sender: TObject);
    procedure CurrencyEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure prc_Campos(Flag : Boolean);

  public
    { Public declarations }
    fDMBaixaMaterial_Prod : TDMBaixaMaterial_Prod;

  end;

var
  frmBaixaMaterial_Prod_Dig: TfrmBaixaMaterial_Prod_Dig;

implementation

uses rsDBUtils, DB, UDMEstoque, USenhaAux, uUtilPadrao;

{$R *.dfm}

procedure TfrmBaixaMaterial_Prod_Dig.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmBaixaMaterial_Prod_Dig.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMBaixaMaterial_Prod);
  fDMBaixaMaterial_Prod.prc_Abrir_Lote_Mat_Prod(fDMBaixaMaterial_Prod.cdsConsLoteMat_ProdNUM_ORDEM.AsInteger,fDMBaixaMaterial_Prod.cdsConsLoteMat_ProdITEM.AsInteger);
end;

procedure TfrmBaixaMaterial_Prod_Dig.btnExcluirClick(Sender: TObject);
var
  vNumOrdem, vItem : Integer;
  vFinalizado : String;
begin
  if fDMBaixaMaterial_Prod.cdsLote_Mat_Prod_Est.IsEmpty then
    exit;
  fDMBaixaMaterial_Prod.cdsLote_Mat_Prod_Est.Last;
  if MessageDlg('Deseja excluir o movimento o último movimento (' + fDMBaixaMaterial_Prod.cdsLote_Mat_Prod_EstDESC_TIPO_ES.AsString + ') ?' ,mtConfirmation,[mbYes,mbNo],0) <> mrYes then
    exit;
  vNumOrdem := fDMBaixaMaterial_Prod.cdsConsLoteMat_ProdNUM_ORDEM.AsInteger;
  vItem     := fDMBaixaMaterial_Prod.cdsConsLoteMat_ProdITEM.AsInteger;

  try
    fDMBaixaMaterial_Prod.cdsLote_Mat_Prod_Est.Delete;
    fDMBaixaMaterial_Prod.cdsLote_Mat_Prod_Est.ApplyUpdates(0);

  finally
    fDMBaixaMaterial_Prod.cdsConsLoteMat_Prod.Close;
    fDMBaixaMaterial_Prod.cdsConsLoteMat_Prod.Open;
    fDMBaixaMaterial_Prod.cdsConsLoteMat_Prod.Locate('NUM_ORDEM;ITEM',VarArrayOf([vNumOrdem,vItem]),[locaseinsensitive]);
    fDMBaixaMaterial_Prod.prc_Abrir_Lote_Mat_Prod(fDMBaixaMaterial_Prod.cdsConsLoteMat_ProdNUM_ORDEM.AsInteger,fDMBaixaMaterial_Prod.cdsConsLoteMat_ProdITEM.AsInteger);
  end;

  fDMBaixaMaterial_Prod.sdsPRC_Atualiza_Lote_Mat_Prod.Close;
  fDMBaixaMaterial_Prod.sdsPRC_Atualiza_Lote_Mat_Prod.ParamByName('P_ID').AsInteger   := fDMBaixaMaterial_Prod.cdsConsLoteMat_ProdID.AsInteger;
  fDMBaixaMaterial_Prod.sdsPRC_Atualiza_Lote_Mat_Prod.ParamByName('P_ITEM').AsInteger := fDMBaixaMaterial_Prod.cdsConsLoteMat_ProdITEM.AsInteger;
  fDMBaixaMaterial_Prod.sdsPRC_Atualiza_Lote_Mat_Prod.ExecSQL;
end;

procedure TfrmBaixaMaterial_Prod_Dig.btnConfirmarClick(Sender: TObject);
var
  vQtdAux : Real;
  vItemAux : Integer;
  fDMEstoque : TDMEstoque;
  vES : String;
  vGeraCusto : String;
begin
  if CurrencyEdit2.AsInteger <= 0 then
  begin
    MessageDlg('*** Funcionário não informado!', mtWarning, [mbok], 0);
    CurrencyEdit1.SetFocus;
    exit;
  end;
  //fDMBaixaMaterial_Prod.prc_Abrir_Lote_Mat_Prod(fDMBaixaMaterial_Prod.cdsConsLoteMat_ProdNUM_ORDEM.AsInteger,fDMBaixaMaterial_Prod.cdsConsLoteMat_ProdITEM.AsInteger);
  vQtdAux := StrToFloat(FormatFloat('0.0000',fDMBaixaMaterial_Prod.cdsLote_Mat_ProdQTD_PAGO.AsFloat - fDMBaixaMaterial_Prod.cdsLote_Mat_ProdQTD_RETORNO.AsFloat));
  if (NxComboBox1.ItemIndex = 2) and (CurrencyEdit1.Value > vQtdAux) then
  begin
    MessageDlg('*** Qtd. de Retorno maior que a Paga!', mtWarning, [mbok], 0);
    CurrencyEdit1.SetFocus;
    exit;
  end;
  vFilial := fDMBaixaMaterial_Prod.qParametros_EstID_FILIAL_LOTE_MAT_EST.AsInteger;
  if fDMBaixaMaterial_Prod.qParametros_EstID_FILIAL_LOTE_MAT_EST.AsInteger <= 0 then
  begin
    vFilial := 0;
    prc_Escolhe_Filial;
    if vFilial <= 0 then
    begin
      MessageDlg('*** Filial não informada!', mtWarning, [mbok], 0);
      CurrencyEdit1.SetFocus;
      exit;
    end;
  end;

  fDMBaixaMaterial_Prod.qParametros_Est.Close;
  fDMBaixaMaterial_Prod.qParametros_Est.Open;

  fDMEstoque:= TDMEstoque.Create(Self);

  fDMBaixaMaterial_Prod.cdsLote_Mat_Prod_Est.Last;
  vItemAux := fDMBaixaMaterial_Prod.cdsLote_Mat_Prod_EstITEM_EST.AsInteger + 1;

  try
    fDMBaixaMaterial_Prod.cdsLote_Mat_Prod_Est.Insert;
    fDMBaixaMaterial_Prod.cdsLote_Mat_Prod_EstID.AsInteger := fDMBaixaMaterial_Prod.cdsLote_Mat_ProdID.AsInteger;
    fDMBaixaMaterial_Prod.cdsLote_Mat_Prod_EstITEM.AsInteger := fDMBaixaMaterial_Prod.cdsLote_Mat_ProdITEM.AsInteger;
    fDMBaixaMaterial_Prod.cdsLote_Mat_Prod_EstITEM_EST.AsInteger := vItemAux;
    fDMBaixaMaterial_Prod.cdsLote_Mat_Prod_EstDATA.AsDateTime    := Date;
    fDMBaixaMaterial_Prod.cdsLote_Mat_Prod_EstHORA.AsDateTime    := Now;
    fDMBaixaMaterial_Prod.cdsLote_Mat_Prod_EstQTD.AsFloat        := CurrencyEdit1.Value;
    fDMBaixaMaterial_Prod.cdsLote_Mat_Prod_EstFILIAL.AsInteger   := vFilial;
    fDMBaixaMaterial_Prod.cdsLote_Mat_Prod_EstUSUARIO.AsString   := uUtilPadrao.vUsuario;
    fDMBaixaMaterial_Prod.cdsLote_Mat_Prod_EstID_FUNCIONARIO.AsInteger := fDMBaixaMaterial_Prod.qFuncionarioCODIGO.AsInteger;
    case NxComboBox1.ItemIndex of
      1 : fDMBaixaMaterial_Prod.cdsLote_Mat_Prod_EstTIPO_ES.AsString := 'S';
      2 : fDMBaixaMaterial_Prod.cdsLote_Mat_Prod_EstTIPO_ES.AsString := 'E';
    end;
    case NxComboBox1.ItemIndex of
      1 : fDMBaixaMaterial_Prod.cdsLote_Mat_Prod_EstDESC_TIPO_ES.AsString := 'Pago';
      2 : fDMBaixaMaterial_Prod.cdsLote_Mat_Prod_EstDESC_TIPO_ES.AsString := 'Retorno';
    end;
    case NxComboBox1.ItemIndex of
      1 : vES := 'S';
      2 : vES := 'E';
    end;
    case NxComboBox1.ItemIndex of
      1 : vGeraCusto := 'N';
      2 : vGeraCusto := 'S';
    end;

    fDMBaixaMaterial_Prod.cdsLote_Mat_Prod_EstID_MOVESTOQUE.AsInteger := 0;

    //Tirado por no dia 31/01/2020, ....Marcelo vai avisar quando liberar novamente
    {fDMBaixaMaterial_Prod.cdsLote_Mat_Prod_EstID_MOVESTOQUE.AsInteger := fDMEstoque.fnc_Gravar_Estoque(0,
                                                    fDMBaixaMaterial_Prod.cdsLote_Mat_Prod_EstFILIAL.AsInteger,
                                                    1,
                                                    fDMBaixaMaterial_Prod.cdsLote_Mat_ProdID_MATERIAL.AsInteger,
                                                    fDMBaixaMaterial_Prod.cdsLote_Mat_ProdNUM_ORDEM.AsInteger, // Numero nota
                                                    0, // Cliente
                                                    0, // CFOP
                                                    0, // ID nota fiscal
                                                    0,
                                                    vES, //Tipo Nota
                                                    'BXMAT',
                                                    fDMBaixaMaterial_Prod.cdsConsLoteMat_ProdUNIDADE_MATERIAL.AsString,
                                                    fDMBaixaMaterial_Prod.cdsConsLoteMat_ProdUNIDADE_MATERIAL.AsString,
                                                    '', //serie
                                                    '', //Tamanho
                                                    Date,
                                                    fDMBaixaMaterial_Prod.cdsConsLoteMat_ProdPRECO_CUSTO.AsFloat,
                                                    CurrencyEdit1.Value,
                                                    0, //%ICMS
                                                    0, //%IPI
                                                    0, //Desconto
                                                    0, //% Trib ICMS
                                                    0, //Valor Frete
                                                    CurrencyEdit1.Value,
                                                    fDMBaixaMaterial_Prod.cdsConsLoteMat_ProdPRECO_CUSTO.AsFloat,
                                                    0, //Desconto
                                                    0,
                                                    fDMBaixaMaterial_Prod.cdsConsLoteMat_ProdUNIDADE_MATERIAL.AsString,
                                                    fDMBaixaMaterial_Prod.cdsConsLoteMat_ProdID_COR_MATERIAL.AsInteger, // Cor
                                                    '',
                                                    vGeraCusto,
                                                    fDMBaixaMaterial_Prod.cdsConsLoteMat_ProdPRECO_CUSTO.AsFloat,
                                                    0,
                                                    0,
                                                    0,
                                                    0);}
  finally
    FreeAndNil(fDMEstoque);
  end;

  fDMBaixaMaterial_Prod.cdsLote_Mat_Prod_Est.Post;
  fDMBaixaMaterial_Prod.cdsLote_Mat_Prod_Est.ApplyUpdates(0);

  fDMBaixaMaterial_Prod.sdsPRC_Atualiza_Lote_Mat_Prod.Close;
  fDMBaixaMaterial_Prod.sdsPRC_Atualiza_Lote_Mat_Prod.ParamByName('P_ID').AsInteger   := fDMBaixaMaterial_Prod.cdsConsLoteMat_ProdID.AsInteger;
  fDMBaixaMaterial_Prod.sdsPRC_Atualiza_Lote_Mat_Prod.ParamByName('P_ITEM').AsInteger := fDMBaixaMaterial_Prod.cdsConsLoteMat_ProdITEM.AsInteger;
  fDMBaixaMaterial_Prod.sdsPRC_Atualiza_Lote_Mat_Prod.ExecSQL;

  Close;
end;

procedure TfrmBaixaMaterial_Prod_Dig.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBaixaMaterial_Prod_Dig.CurrencyEdit2Enter(Sender: TObject);
begin
  fDMBaixaMaterial_Prod.qFuncionario.Close;
end;

procedure TfrmBaixaMaterial_Prod_Dig.CurrencyEdit2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) then
  begin
    if CurrencyEdit2.AsInteger > 0 then
    begin
      fDMBaixaMaterial_Prod.qFuncionario.Close;
      fDMBaixaMaterial_Prod.qFuncionario.ParamByName('NUM_CARTAO').AsInteger := CurrencyEdit2.AsInteger;
      fDMBaixaMaterial_Prod.qFuncionario.Open;
      if fDMBaixaMaterial_Prod.qFuncionario.IsEmpty then
      begin
        lblFuncionario.Caption := '*** Funcionário não encontrado';
        CurrencyEdit2.SetFocus;
        CurrencyEdit2.SelectAll;
      end
      else
      begin
        lblFuncionario.Caption := fDMBaixaMaterial_Prod.qFuncionarioNOME.AsString;
        prc_Campos(True);
        NxComboBox1.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmBaixaMaterial_Prod_Dig.CurrencyEdit2Change(Sender: TObject);
begin
  prc_Campos(False);
end;

procedure TfrmBaixaMaterial_Prod_Dig.prc_Campos(Flag : Boolean);
begin
  Label9.Visible        := Flag;
  Label10.Visible       := Flag;
  NxComboBox1.Visible   := Flag;
  CurrencyEdit1.Visible := Flag;
  btnConfirmar.Visible  := Flag;
end;

procedure TfrmBaixaMaterial_Prod_Dig.CurrencyEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) then
    btnConfirmar.SetFocus;
end;

end.
