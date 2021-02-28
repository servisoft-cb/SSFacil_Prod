unit UMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ComCtrls, jpeg, Menus,
  ToolWin, Types, UCBase, UCDBXConn, ActnList, ImgList, ShellAPI, ExtCtrls, RLConsts, IniFiles, Midaslib, DBClient, SqlExpr;

type
  TfMenu = class(TForm)                    
    mmMenu: TMainMenu;
    Cadastro1: TMenuItem;
    Administrao1: TMenuItem;
    CadastrodeUsurios1: TMenuItem;
    PerfildeUsurios1: TMenuItem;
    LogdoSistema1: TMenuItem;
    N1: TMenuItem;
    rocarSenha1: TMenuItem;
    EfetuarLogoff1: TMenuItem;
    ActionList1: TActionList;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    alCliente: TAction;
    alNotaFiscal: TAction;
    alProduto: TAction;
    alMovimentos: TAction;
    alSaida: TAction;
    alTransportador: TAction;
    alFornecedor: TAction;
    Image2: TImage;
    alCompras: TAction;
    alPedido: TAction;
    N19: TMenuItem;
    N9: TMenuItem;
    lbDatabase: TLabel;
    Label3: TLabel;
    N4: TMenuItem;
    tbGerarLote: TToolButton;
    tbBaixarLote: TToolButton;
    tbConsultaLote: TToolButton;
    BaixarMaterialLote1: TMenuItem;
    tbMapa: TToolButton;
    Produo1: TMenuItem;
    GerarLote1: TMenuItem;
    BaixarLote1: TMenuItem;
    ConsultarLote1: TMenuItem;
    N2: TMenuItem;
    ConsultaMapa1: TMenuItem;
    UCDBXConn1: TUCDBXConn;
    UCControls1: TUCControls;
    UserControl1: TUserControl;
    UCSettings1: TUCSettings;
    BaixaGeral1: TMenuItem;
    tbBaixaGeral: TToolButton;
    EntradanoEstoqueCdBarra1: TMenuItem;
    SadadoEstoqueCdBarra1: TMenuItem;
    N3: TMenuItem;
    CancelarPedido1: TMenuItem;
    ConsultaPorProcesso1: TMenuItem;
    ConsultasRelatrios1: TMenuItem;
    ConsultaRemessaPorReferncia1: TMenuItem;
    N5: TMenuItem;
    GerarTaloLote1: TMenuItem;
    tbPreFat: TToolButton;
    ConsultaProgramaoPorDataEntrega1: TMenuItem;
    ConsultaPedidoPorProcessoMapa1: TMenuItem;
    N6: TMenuItem;
    PrFaturamento1: TMenuItem;
    ConsultaControlePorProcesso1: TMenuItem;
    ConsultaMateriaisPorLote1: TMenuItem;
    ConsultaProdutividade1: TMenuItem;
    N7: TMenuItem;
    Programao1: TMenuItem;
    IntervalorHorasdeparadas1: TMenuItem;
    ConsultaProgramao1: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ConsultaMaterialPorKG1: TMenuItem;
    ConsultaMateriaisTingimento1: TMenuItem;
    ConsultaCustoMaterialpModelo1: TMenuItem;
    N8: TMenuItem;
    BaixaMaterialAlmoxarifado1: TMenuItem;
    ConsultaPagamentoRetornoMateriaisAlmoxarifado1: TMenuItem;
    ConsultaMateriaisAcumuladosPorOrdemdeProduo1: TMenuItem;
    ConsultaMapadoProduto1: TMenuItem;
    EstornarBaixa1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EfetuarLogoff1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ToolButton5Click(Sender: TObject);
    procedure UserControl1AfterLogin(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tbGerarLoteClick(Sender: TObject);
    procedure tbBaixarLoteClick(Sender: TObject);
    procedure BaixarMaterialLote1Click(Sender: TObject);
    procedure tbMapaClick(Sender: TObject);
    procedure tbConsultaLoteClick(Sender: TObject);
    procedure tbBaixaGeralClick(Sender: TObject);
    procedure BaixaGeral1Click(Sender: TObject);
    procedure EntradanoEstoqueCdBarra1Click(Sender: TObject);
    procedure SadadoEstoqueCdBarra1Click(Sender: TObject);
    procedure CancelarPedido1Click(Sender: TObject);
    procedure ConsultaPorProcesso1Click(Sender: TObject);
    procedure ConsultaRemessaPorReferncia1Click(Sender: TObject);
    procedure GerarTaloLote1Click(Sender: TObject);
    procedure tbPreFatClick(Sender: TObject);
    procedure ConsultaProgramaoPorDataEntrega1Click(Sender: TObject);
    procedure ConsultaPedidoPorProcessoMapa1Click(Sender: TObject);
    procedure PrFaturamento1Click(Sender: TObject);
    procedure ConsultaControlePorProcesso1Click(Sender: TObject);
    procedure ConsultaMateriaisPorLote1Click(Sender: TObject);
    procedure ConsultaProdutividade1Click(Sender: TObject);
    procedure Programao1Click(Sender: TObject);
    procedure IntervalorHorasdeparadas1Click(Sender: TObject);
    procedure ConsultaProgramao1Click(Sender: TObject);
    procedure ConsultaMaterialPorKG1Click(Sender: TObject);
    procedure ConsultaMateriaisTingimento1Click(Sender: TObject);
    procedure ConsultaCustoMaterialpModelo1Click(Sender: TObject);
    procedure BaixaMaterialAlmoxarifado1Click(Sender: TObject);
    procedure ConsultaPagamentoRetornoMateriaisAlmoxarifado1Click(
      Sender: TObject);
    procedure ConsultaMateriaisAcumuladosPorOrdemdeProduo1Click(
      Sender: TObject);
    procedure ConsultaMapadoProduto1Click(Sender: TObject);
    procedure EstornarBaixa1Click(Sender: TObject);
  private
    { Private declarations }
    procedure prc_Habilita_Menu;

    //ffrmCadPais: TfrmCadPais;
  public
    { Public declarations }
    vTipoPessoa: String;
    vPath: String;
    vVersao: String;

    procedure OpenForm(FClass: TFormClass; vEstado: TWindowState; TipoPessoa: String = '');
    procedure GetBuildInfo(exeName: String; var V1, V2, V3, V4: word);
    function GetBuildInfoAsString: string;
  end;

var
  fMenu: TfMenu;

implementation

uses DmdDatabase, uUtilPadrao, UGerar_Lote_SL, UProcesso_ES, UConsLote2, UGerar_Lote_Calc, UBaixaMaterialOP, UConsMapaProd,
  UBaixaTalao_Calc, UConsLote_Calc, UBaixaLoteGeral_Calc, UBaixaLoteGeral, UCadDocEstoqueCB, ULiberacao_Fat2, UGerar_Lote_Bol,
  UCancelaLote, UGerar_Lote_Proc, UConsLoteProc, UConsRemessa_Prod, UGerar_Pedido_Talao, uCadPreFat, UConsRefDtEntr, UConsProc,
  UGerar_Lote_Ped, UConsPedidoProc, UBaixaLote_Ped, UBaixaTalao_Calc2, UConsMatLote2, UConsProdutividade, UGerar_Programacao,
  UCadIntervalo_Tempo, UConsProgramacao, UConsMatKG, UConsEstTing, UConsModelo_Custo,
  UBaixaMaterial_Prod, UConsBaixaMaterial_Prod, UConsLote_Mat_Acum,
  UConsProduto_Mapa, UEstornarBaixa_Talao;


{$R *.dfm}

procedure TfMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfMenu.OpenForm(FClass: TFormClass; vEstado: TWindowState; TipoPessoa: String = '');
var
  existe: TForm;
  j: Byte;
begin
  existe := nil;
  for j := 0 to Screen.FormCount - 1 do
  begin
    if Screen.Forms[j] is FClass then
      existe := Screen.Forms[j];
  end;

  if not (existe = nil) then
  begin
    existe.BringToFront;
    existe.SetFocus;
  end
  else
  begin
    Application.CreateForm(FClass,existe);
    existe.FormStyle := fsMDIChild;
    if existe.Name = 'frmCadPessoa' then
      vTipoPessoa := TipoPessoa;
    existe.Show;
  end;
  existe.WindowState := vEstado;
end;

procedure TfMenu.EfetuarLogoff1Click(Sender: TObject);
begin
  UserControl1.Logoff;
end;

procedure TfMenu.FormCreate(Sender: TObject);
var
  TaskBarH: THandle;
  TaskBarR: TRect;
  //vDia, vMes, vAno: Word;
//  i: Integer;
begin
  UserControl1.Execute;
  vPath := ExtractFilePath(Application.ExeName);
  lbDatabase.Caption := dmDatabase.scoDados.Params.Values['DATABASE'];

   // obtem o retangulo com o taskbar
  TaskBarH := FindWindow('Shell_TrayWnd', nil);
  GetWindowRect(TaskBarH, TaskBarR);
  // altura do taskbar = TaskBarR.
  Image2.Top  := Height - (Screen.Height - TaskBarR.Top) - Image2.Height - 32;
  Image2.Left := Screen.Width - Image2.Width - 16;

  vVersao := GetBuildInfoAsString;
  if vVersao <> '0.0.0.0' then
  begin
    Caption := Caption + ' - v' + vVersao;
  end;

end;

procedure TfMenu.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if MessageDlg('Encerrar o programa SSFácil Produção?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    CanClose := False
  else
    CanClose := True;
end;

procedure TfMenu.ToolButton5Click(Sender: TObject);
begin
  Close;
end;

procedure TfMenu.GetBuildInfo(exeName: String; var V1, V2, V3, V4: word);
var
  VerInfoSize, VerValueSize, Dummy: DWORD;
  VerInfo: Pointer;
  VerValue: PVSFixedFileInfo;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(exeName), Dummy);
  if VerInfoSize > 0 then
  begin
    GetMem(VerInfo,VerInfoSize);
    try
      if GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo) then
      begin
        VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
        with VerValue^ do
        begin
          V1 := dwFileVersionMS shr 16;
          V2 := dwFileVersionMS and $FFFF;
          V3 := dwFileVersionLS shr 16;
          V4 := dwFileVersionLS and $FFFF;
        end;
      end;
    finally
      FreeMem(VerInfo,VerInfoSize);
    end;
  end;
end;

function TfMenu.GetBuildInfoAsString: string;
var
  V1, V2, V3, V4: word;
begin
  GetBuildInfo(GetCurrentDir + '\SSFacil.EXE', V1, V2, V3, V4);
  Result := IntToStr(V1) + '.' + IntToStr(V2) + '.' +
    IntToStr(V3) + '.' + IntToStr(V4);
end;

procedure TfMenu.UserControl1AfterLogin(Sender: TObject);
begin
  prc_Habilita_Menu;
end;

procedure TfMenu.FormShow(Sender: TObject);
begin
  prc_Habilita_Menu;

  lbDatabase.Top  := Image2.Top - 15;
  lbDatabase.Left := Image2.Left - 269;

  tbGerarLote.Visible    := ((Produo1.Enabled) and (GerarLote1.Enabled));
  tbBaixarLote.Visible   := ((Produo1.Enabled) and (BaixarLote1.Enabled));
  tbConsultaLote.Visible := ((Produo1.Enabled) and (ConsultarLote1.Enabled));
  tbMapa.Visible         := ((Produo1.Enabled) and (ConsultaMapa1.Enabled));
  tbBaixaGeral.Visible   := ((Produo1.Enabled) and (BaixaGeral1.Enabled));
  tbPreFat.Visible       := ((Produo1.Enabled) and (PrFaturamento1.Enabled));
end;

procedure TfMenu.prc_Habilita_Menu;
begin
  vUsuario := UserControl1.CurrentUser.LoginName;
end;

procedure TfMenu.tbGerarLoteClick(Sender: TObject);
var
  vTipoAux: String;
begin
  vTipoAux := fnc_Verifica_Tipo_Lote; 
  if (vTipoAux = 'PED') or (vTipoAux = 'PED2') then
    OpenForm(TfrmGerar_Lote_Ped,wsMaximized,'')
  else
  if vTipoAux = 'P' then
    OpenForm(TfrmGerar_Lote_Proc,wsMaximized,'')
  else
  if vTipoAux = 'R' then
    OpenForm(TfrmGerar_Lote_Bol,wsMaximized,'')
  else
  if (vTipoAux = 'C') or (vTipoAux = 'C2') then
    OpenForm(TfrmGerar_Lote_Calc,wsMaximized,'')
  else
    OpenForm(TfrmGerar_Lote_SL,wsMaximized,'');
end;

procedure TfMenu.tbBaixarLoteClick(Sender: TObject);
var
  vAux: String;
begin
  vAux := fnc_Verifica_Tipo_Lote;
  if vAux = 'PED2' then
    OpenForm(TfrmBaixaLote_Ped,wsMaximized,'')
  else
  if (vAux = 'C2') then
    OpenForm(TfrmBaixaTalao_Calc2,wsMaximized,'')
  else
  if (vAux = 'C') or (vAux = 'R') then
    OpenForm(TfrmBaixaTalao_Calc,wsMaximized,'')
  else
    OpenForm(TfrmProcesso_ES,wsMaximized,'');
end;

procedure TfMenu.BaixarMaterialLote1Click(Sender: TObject);
begin
  OpenForm(TfrmBaixa_Material_OP,wsMaximized,'');
end;

procedure TfMenu.tbMapaClick(Sender: TObject);
begin
  OpenForm(TfrmConsMapaProd,wsMaximized,'');
end;

procedure TfMenu.tbConsultaLoteClick(Sender: TObject);
var
  vAux: String;
begin
  vAux := fnc_Verifica_Tipo_Lote;
  if (vAux = 'C') or (vAux = 'C2') or (vAux = 'R') then
    OpenForm(TfrmConsLote_Calc,wsMaximized,'')
  else
    OpenForm(TfrmConsLote2,wsMaximized,'');
end;

procedure TfMenu.tbBaixaGeralClick(Sender: TObject);
begin
  OpenForm(TfrmBaixaLoteGeral_Calc, wsMaximized);
end;

procedure TfMenu.BaixaGeral1Click(Sender: TObject);
var
  vAux: String;
begin
  vAux := fnc_Verifica_Tipo_Lote;
  if (vAux = 'C') or (vAux = 'R') then
    OpenForm(TfrmBaixaLoteGeral_Calc,wsMaximized)
  else
    OpenForm(TfrmBaixaLoteGeral, wsMaximized);
end;

procedure TfMenu.EntradanoEstoqueCdBarra1Click(Sender: TObject);
begin
  OpenForm(TfrmCadDocEstoqueCB, wsMaximized);
end;

procedure TfMenu.SadadoEstoqueCdBarra1Click(Sender: TObject);
begin
  OpenForm(TfrmLiberacao_Fat2, wsMaximized);
end;

procedure TfMenu.CancelarPedido1Click(Sender: TObject);
begin
  OpenForm(TfrmCancelaLote, wsMaximized);
end;

procedure TfMenu.ConsultaPorProcesso1Click(Sender: TObject);
begin
  OpenForm(TfrmConsLoteProc, wsMaximized);
end;

procedure TfMenu.ConsultaRemessaPorReferncia1Click(Sender: TObject);
begin
  OpenForm(TfrmConsRemessa_Prod, wsMaximized);
end;

procedure TfMenu.GerarTaloLote1Click(Sender: TObject);
begin
  OpenForm(TfrmGerar_Pedido_Talao, wsMaximized);
end;

procedure TfMenu.tbPreFatClick(Sender: TObject);
begin
  OpenForm(TfrmCadPreFat, wsMaximized);
end;

procedure TfMenu.ConsultaProgramaoPorDataEntrega1Click(Sender: TObject);
begin
  OpenForm(TfrmConsRefDtEntr, wsMaximized);
end;

procedure TfMenu.ConsultaPedidoPorProcessoMapa1Click(Sender: TObject);
begin
  OpenForm(TfrmConsPedidoProc, wsMaximized);
end;

procedure TfMenu.PrFaturamento1Click(Sender: TObject);
begin
  OpenForm(TfrmCadPreFat, wsMaximized);
end;

procedure TfMenu.ConsultaControlePorProcesso1Click(Sender: TObject);
begin
  OpenForm(TfrmConsProc, wsMaximized);
end;

procedure TfMenu.ConsultaMateriaisPorLote1Click(Sender: TObject);
begin
  OpenForm(TfrmConsMatLote2, wsMaximized);
end;

procedure TfMenu.ConsultaProdutividade1Click(Sender: TObject);
begin
  OpenForm(TfrmConsProdutividade, wsMaximized);
end;

procedure TfMenu.Programao1Click(Sender: TObject);
begin
  OpenForm(TfrmGerar_Programacao, wsMaximized);
end;

procedure TfMenu.IntervalorHorasdeparadas1Click(Sender: TObject);
begin
  OpenForm(TfrmCadIntervalo_Tempo, wsMaximized);
end;

procedure TfMenu.ConsultaProgramao1Click(Sender: TObject);
begin
  OpenForm(TfrmConsProgramacao, wsMaximized);
end;

procedure TfMenu.ConsultaMaterialPorKG1Click(Sender: TObject);
begin
  OpenForm(TfrmConsMatKG, wsMaximized);
end;

procedure TfMenu.ConsultaMateriaisTingimento1Click(Sender: TObject);
begin
  OpenForm(TfrmConsEstTing, wsMaximized);
end;

procedure TfMenu.ConsultaCustoMaterialpModelo1Click(Sender: TObject);
begin
  OpenForm(TfrmConsModelo_Custo, wsMaximized);
end;

procedure TfMenu.BaixaMaterialAlmoxarifado1Click(Sender: TObject);
begin
  OpenForm(TfrmBaixaMaterial_Prod, wsMaximized);
end;

procedure TfMenu.ConsultaPagamentoRetornoMateriaisAlmoxarifado1Click(
  Sender: TObject);
begin
  OpenForm(TfrmConsBaixaMaterial_Prod, wsMaximized);
end;

procedure TfMenu.ConsultaMateriaisAcumuladosPorOrdemdeProduo1Click(
  Sender: TObject);
begin
  OpenForm(TfrmConsLote_Mat_Acum, wsMaximized);
end;

procedure TfMenu.ConsultaMapadoProduto1Click(Sender: TObject);
begin
  OpenForm(TfrmConsProduto_Mapa, wsMaximized);
end;

procedure TfMenu.EstornarBaixa1Click(Sender: TObject);
begin
  OpenForm(TfrmEstornarBaixa_Talao, wsMaximized);
end;

initialization
//  RLConsts.SetVersion(3,72,'B');

end.
