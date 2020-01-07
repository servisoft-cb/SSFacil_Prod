unit UDMPedido_Talao;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider, frxRich,
  frxExportMail, frxClass, frxExportPDF, frxDBSet, LogTypes;

type
  TDMPedido_Talao = class(TDataModule)
    sdsPedido_Talao: TSQLDataSet;
    dspPedido_Talao: TDataSetProvider;
    cdsPedido_Talao: TClientDataSet;
    dsPedido_Talao: TDataSource;
    sdsPedido_TalaoID: TIntegerField;
    sdsPedido_TalaoITEM: TIntegerField;
    sdsPedido_TalaoITEM_TALAO: TIntegerField;
    sdsPedido_TalaoQTD: TFloatField;
    sdsPedido_TalaoCODBARRA: TStringField;
    sdsPedido_TalaoDTBAIXA: TDateField;
    sdsPedido_TalaoHRBAIXA: TTimeField;
    sdsPedido_TalaoDTEMISSAO: TDateField;
    sdsPedido_TalaoHREMISSAO: TTimeField;
    cdsPedido_TalaoID: TIntegerField;
    cdsPedido_TalaoITEM: TIntegerField;
    cdsPedido_TalaoITEM_TALAO: TIntegerField;
    cdsPedido_TalaoQTD: TFloatField;
    cdsPedido_TalaoCODBARRA: TStringField;
    cdsPedido_TalaoDTBAIXA: TDateField;
    cdsPedido_TalaoHRBAIXA: TTimeField;
    cdsPedido_TalaoDTEMISSAO: TDateField;
    cdsPedido_TalaoHREMISSAO: TTimeField;
    dsPedidoImp_Itens: TDataSource;
    cdsPedidoImp_Itens: TClientDataSet;
    dspPedidoImp_Itens: TDataSetProvider;
    sdsPedidoImp_Itens: TSQLDataSet;
    cdsPedidoImp_ItensID: TIntegerField;
    cdsPedidoImp_ItensITEM: TIntegerField;
    cdsPedidoImp_ItensID_PRODUTO: TIntegerField;
    cdsPedidoImp_ItensREFERENCIA: TStringField;
    cdsPedidoImp_ItensTAMANHO: TStringField;
    cdsPedidoImp_ItensID_COR: TFMTBCDField;
    cdsPedidoImp_ItensNOMEPRODUTO: TStringField;
    cdsPedidoImp_ItensCOD_PRODUTO_CLIENTE: TStringField;
    cdsPedidoImp_ItensCOD_COR_CLIENTE: TStringField;
    cdsPedidoImp_ItensUNIDADE: TStringField;
    cdsPedidoImp_ItensQTD: TFloatField;
    cdsPedidoImp_ItensQTD_RESTANTE: TFloatField;
    cdsPedidoImp_ItensNUMOS: TStringField;
    cdsPedidoImp_ItensENCERADO: TStringField;
    cdsPedidoImp_ItensQTD_POR_ROTULO: TIntegerField;
    cdsPedidoImp_ItensTAMANHO_CLIENTE: TStringField;
    cdsPedidoImp_ItensNOME_COR_COMBINACAO: TStringField;
    cdsPedidoImp_ItensDTEMISSAO: TDateField;
    cdsPedidoImp_ItensID_CLIENTE: TIntegerField;
    cdsPedidoImp_ItensFILIAL: TIntegerField;
    cdsPedidoImp_ItensPEDIDO_CLIENTE: TStringField;
    cdsPedidoImp_ItensNUM_PEDIDO: TIntegerField;
    cdsPedidoImp_ItensNOME_CLI: TStringField;
    cdsPedidoImp_ItensFANTASIA_CLI: TStringField;
    cdsPedidoImp_ItensNOME_INTERNO_FIL: TStringField;
    mEtiqueta_Nav: TClientDataSet;
    mEtiqueta_NavNome_Empresa: TStringField;
    mEtiqueta_NavFone: TStringField;
    mEtiqueta_NavNome_Etiqueta: TStringField;
    mEtiqueta_NavTamanho: TStringField;
    mEtiqueta_NavReferencia: TStringField;
    mEtiqueta_NavNome_Produto: TStringField;
    mEtiqueta_NavNome_Cliente: TStringField;
    mEtiqueta_NavPedido_Cliente: TStringField;
    mEtiqueta_NavFantasia_Cli: TStringField;
    mEtiqueta_NavDtEmissao: TDateField;
    mEtiqueta_NavProd_Cliente: TStringField;
    mEtiqueta_NavNumOS: TStringField;
    mEtiqueta_NavEncerado: TStringField;
    mEtiqueta_NavItem_Ped: TIntegerField;
    mEtiqueta_NavUnidade: TStringField;
    dsmEtiqueta_Nav: TDataSource;
    cdsPedidoImp_ItensIMP_COR_CLIENTE: TStringField;
    cdsPedidoImp_ItensNOME_COR_CLIENTE: TStringField;
    frxReport1: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxMailExport1: TfrxMailExport;
    frxRichObject1: TfrxRichObject;
    frxmEtiqueta_Nav: TfrxDBDataset;
    mEtiqueta_NavCodBarra: TStringField;
    mEtiqueta_NavItem_Talao: TIntegerField;
    mEtiqueta_NavNum_Pedido: TIntegerField;
    dsPedido_Itens: TDataSource;
    cdsPedido_Itens: TClientDataSet;
    dspPedido_Itens: TDataSetProvider;
    sdsPedido_Itens: TSQLDataSet;
    sdsPedido_ItensGEROU_PED_TALAO: TStringField;
    sdsPedido_ItensQTD_POR_ROTULO: TIntegerField;
    sdsPedido_ItensID: TIntegerField;
    sdsPedido_ItensITEM: TIntegerField;
    cdsPedido_ItensID: TIntegerField;
    cdsPedido_ItensITEM: TIntegerField;
    cdsPedido_ItensGEROU_PED_TALAO: TStringField;
    cdsPedido_ItensQTD_POR_ROTULO: TIntegerField;
    cdsPedidoImp_ItensGEROU_PED_TALAO: TStringField;
    cdsPedidoImp_ItensQTD_PENDENTE_TAL: TFloatField;
    dsConsulta_Talao: TDataSource;
    cdsConsulta_Talao: TClientDataSet;
    dspConsulta_Talao: TDataSetProvider;
    sdsConsulta_Talao: TSQLDataSet;
    cdsConsulta_TalaoID: TIntegerField;
    cdsConsulta_TalaoITEM: TIntegerField;
    cdsConsulta_TalaoITEM_TALAO: TIntegerField;
    cdsConsulta_TalaoQTD: TFloatField;
    cdsConsulta_TalaoCODBARRA: TStringField;
    cdsConsulta_TalaoDTBAIXA: TDateField;
    cdsConsulta_TalaoHRBAIXA: TTimeField;
    cdsConsulta_TalaoDTEMISSAO: TDateField;
    cdsConsulta_TalaoHREMISSAO: TTimeField;
    cdsConsulta_TalaoNUM_PEDIDO: TIntegerField;
    cdsConsulta_TalaoREFERENCIA: TStringField;
    cdsConsulta_TalaoNOMEPRODUTO: TStringField;
    cdsConsulta_TalaoNOME_COR: TStringField;
    qParametros_Lote: TSQLQuery;
    qParametros_LoteQTD_PADRAO_ETIQ: TIntegerField;
    mEtiqueta_NavQtd: TFloatField;
    cdsConsulta_TalaoQTD_POR_ROTULO: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);

  public
    { Public declarations }
    ctPedidoImp_Itens : String;
    ctPedido_Talao : String;

  end;

var
  DMPedido_Talao: TDMPedido_Talao;

implementation

uses DmdDatabase, uUtilPadrao, LogProvider;

{$R *.dfm}

{ TDMCadPedido_Talao }

procedure TDMPedido_Talao.DataModuleCreate(Sender: TObject);
var
  i, x: Integer;
  SR: TSearchRec;
  Origem, Destino: string;
  vIndices: string;
  aIndices: array of string;
begin
  ctPedidoImp_Itens := sdsPedidoImp_Itens.CommandText;
  ctPedido_Talao    := sdsPedido_Talao.CommandText;
  qParametros_Lote.Open;
  //*** Logs Implantado na versão .353
  LogProviderList.OnAdditionalValues := DoLogAdditionalValues;
  for i := 0 to (Self.ComponentCount - 1) do
  begin
    if (Self.Components[i] is TClientDataSet) then
    begin
      SetLength(aIndices, 0);
      vIndices := TClientDataSet(Components[i]).IndexFieldNames;
      while (vIndices <> EmptyStr) do
      begin
        SetLength(aIndices, Length(aIndices) + 1);
        x := Pos(';', vIndices);
        if (x = 0) then
        begin
          aIndices[Length(aIndices) - 1] := vIndices;
          vIndices := EmptyStr;
        end
        else
        begin
          aIndices[Length(aIndices) - 1] := Copy(vIndices, 1, x - 1);
          vIndices := Copy(vIndices, x + 1, MaxInt);
        end;
      end;
      LogProviderList.AddProvider(TClientDataSet(Self.Components[i]), TClientDataSet(Self.Components[i]).Name, aIndices);
    end;
  end;
  //***********************
end;

procedure TDMPedido_Talao.DoLogAdditionalValues(ATableName: string;
  var AValues: TArrayLogData; var UserName: string);
begin
  UserName := vUsuario;
end;

end.
