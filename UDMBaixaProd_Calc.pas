unit UDMBaixaProd_Calc;

interface

uses
  SysUtils, Controls, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider, LogTypes;

type
  TDMBaixaProd_Calc = class(TDataModule)
    sdsLote: TSQLDataSet;
    sdsLoteID: TIntegerField;
    sdsLoteNUM_LOTE: TIntegerField;
    sdsLoteQTD_TALOES: TIntegerField;
    sdsLoteDTEMISSAO: TDateField;
    sdsLoteHREMISSAO: TTimeField;
    sdsLoteFILIAL: TIntegerField;
    sdsLoteOBS: TMemoField;
    sdsLoteID_PRODUTO: TIntegerField;
    sdsLoteDTENTREGA: TDateField;
    sdsLoteQTD: TFloatField;
    sdsLoteNUM_ORDEM: TIntegerField;
    sdsLoteCARIMBO: TStringField;
    sdsLoteID_COMBINACAO: TIntegerField;
    sdsLoteNOME: TStringField;
    sdsLoteNUM_PEDIDO: TIntegerField;
    sdsLoteTALAO_AUX_GERADO: TStringField;
    sdsLoteDTENTRADA: TDateField;
    sdsLoteHRENTRADA: TTimeField;
    sdsLoteDTBAIXA: TDateField;
    sdsLoteHRBAIXA: TTimeField;
    sdsLoteID_PEDIDO: TIntegerField;
    sdsLoteTIPO_LOTE: TStringField;
    sdsLoteREFERENCIA: TStringField;
    sdsLoteUNIDADE: TStringField;
    sdsLoteQTD_PENDENTE: TFloatField;
    sdsLoteQTD_PRODUZIDO: TFloatField;
    sdsLoteITEM_ORDEM: TIntegerField;
    sdsLoteITEM_ORDEM_TOTAL: TIntegerField;
    sdsLoteOBS_PED: TStringField;
    sdsLoteID_CLIENTE: TIntegerField;
    sdsLoteIMPRESSO: TStringField;
    sdsLoteQTD_ORIGINAL: TFloatField;
    sdsLoteQTD_PARES: TFloatField;
    sdsLoteID_PROCESSO_GRUPO: TIntegerField;
    sdsLoteBAIXADO: TStringField;
    dspLote: TDataSetProvider;
    cdsLote: TClientDataSet;
    cdsLoteID: TIntegerField;
    cdsLoteNUM_LOTE: TIntegerField;
    cdsLoteQTD_TALOES: TIntegerField;
    cdsLoteDTEMISSAO: TDateField;
    cdsLoteHREMISSAO: TTimeField;
    cdsLoteFILIAL: TIntegerField;
    cdsLoteOBS: TMemoField;
    cdsLoteID_PRODUTO: TIntegerField;
    cdsLoteDTENTREGA: TDateField;
    cdsLoteQTD: TFloatField;
    cdsLoteNUM_ORDEM: TIntegerField;
    cdsLoteCARIMBO: TStringField;
    cdsLoteID_COMBINACAO: TIntegerField;
    cdsLoteNOME: TStringField;
    cdsLoteNUM_PEDIDO: TIntegerField;
    cdsLoteTALAO_AUX_GERADO: TStringField;
    cdsLoteDTENTRADA: TDateField;
    cdsLoteHRENTRADA: TTimeField;
    cdsLoteDTBAIXA: TDateField;
    cdsLoteHRBAIXA: TTimeField;
    cdsLoteID_PEDIDO: TIntegerField;
    cdsLoteTIPO_LOTE: TStringField;
    cdsLoteREFERENCIA: TStringField;
    cdsLoteUNIDADE: TStringField;
    cdsLoteQTD_PENDENTE: TFloatField;
    cdsLoteQTD_PRODUZIDO: TFloatField;
    cdsLoteITEM_ORDEM: TIntegerField;
    cdsLoteITEM_ORDEM_TOTAL: TIntegerField;
    cdsLoteOBS_PED: TStringField;
    cdsLoteID_CLIENTE: TIntegerField;
    cdsLoteIMPRESSO: TStringField;
    cdsLoteQTD_ORIGINAL: TFloatField;
    cdsLoteQTD_PARES: TFloatField;
    cdsLoteID_PROCESSO_GRUPO: TIntegerField;
    cdsLoteBAIXADO: TStringField;
    qPed: TSQLQuery;
    qPedID: TIntegerField;
    qSetor: TSQLQuery;
    sdsLoteNOME_COMBINACAO: TStringField;
    cdsLoteNOME_COMBINACAO: TStringField;
    qFuncionario: TSQLQuery;
    qFuncionarioCODIGO: TIntegerField;
    qFuncionarioNOME: TStringField;
    qFuncionarioNUM_CARTAO: TIntegerField;
    qSetorID: TIntegerField;
    qSetorNOME: TStringField;
    qSetorDESPESA_RATEIO: TFloatField;
    qSetorGERAR_TALAO: TStringField;
    qSetorLIMITE_POR_TALAO: TStringField;
    qSetorQTD_LIMITE_POR_TALAO: TIntegerField;
    qSetorMOSTRAR_ORC: TStringField;
    qSetorORDEM_ORC: TIntegerField;
    qSetorENTRADA_AUT: TStringField;
    qSetorIMP_MAPA: TStringField;
    qSetorENCERRA_PROD: TStringField;
    sdsTalao: TSQLDataSet;
    dspTalao: TDataSetProvider;
    cdsTalao: TClientDataSet;
    sdsTalaoID: TIntegerField;
    sdsTalaoNUM_TALAO: TIntegerField;
    sdsTalaoID_PRODUTO: TIntegerField;
    sdsTalaoTAMANHO: TStringField;
    sdsTalaoQTD: TFloatField;
    sdsTalaoQTD_PRODUZIDO: TFloatField;
    sdsTalaoQTD_PENDENTE: TFloatField;
    sdsTalaoDTBAIXA: TDateField;
    sdsTalaoHRBAIXA: TTimeField;
    sdsTalaoIMPRESSO: TStringField;
    sdsTalaoID_COMBINACAO: TIntegerField;
    sdsTalaoID_PROCESSO: TIntegerField;
    sdsTalaoDTENTRADA: TDateField;
    sdsTalaoHRENTRADA: TTimeField;
    sdsTalaoITEM_PEDIDO: TIntegerField;
    sdsTalaoID_PEDIDO: TIntegerField;
    sdsTalaoREFERENCIA: TStringField;
    sdsTalaoUNIDADE: TStringField;
    cdsTalaoID: TIntegerField;
    cdsTalaoNUM_TALAO: TIntegerField;
    cdsTalaoID_PRODUTO: TIntegerField;
    cdsTalaoTAMANHO: TStringField;
    cdsTalaoQTD: TFloatField;
    cdsTalaoQTD_PRODUZIDO: TFloatField;
    cdsTalaoQTD_PENDENTE: TFloatField;
    cdsTalaoDTBAIXA: TDateField;
    cdsTalaoHRBAIXA: TTimeField;
    cdsTalaoIMPRESSO: TStringField;
    cdsTalaoID_COMBINACAO: TIntegerField;
    cdsTalaoID_PROCESSO: TIntegerField;
    cdsTalaoDTENTRADA: TDateField;
    cdsTalaoHRENTRADA: TTimeField;
    cdsTalaoITEM_PEDIDO: TIntegerField;
    cdsTalaoID_PEDIDO: TIntegerField;
    cdsTalaoREFERENCIA: TStringField;
    cdsTalaoUNIDADE: TStringField;
    qSetorLER_CBARRA1: TStringField;
    sdsTalao_Setor: TSQLDataSet;
    sdsTalao_SetorID: TIntegerField;
    sdsTalao_SetorNUM_TALAO: TIntegerField;
    sdsTalao_SetorITEM: TIntegerField;
    sdsTalao_SetorID_SETOR: TIntegerField;
    sdsTalao_SetorDTENTRADA: TDateField;
    sdsTalao_SetorHRENTRADA: TTimeField;
    sdsTalao_SetorDTSAIDA: TDateField;
    sdsTalao_SetorHRSAIDA: TTimeField;
    sdsTalao_SetorID_FUNCIONARIO: TIntegerField;
    sdsTalao_SetorQTD: TFloatField;
    sdsTalao_SetorTOTAL_HORAS: TFloatField;
    dspTalao_Setor: TDataSetProvider;
    cdsTalao_Setor: TClientDataSet;
    cdsTalao_SetorID: TIntegerField;
    cdsTalao_SetorNUM_TALAO: TIntegerField;
    cdsTalao_SetorITEM: TIntegerField;
    cdsTalao_SetorID_SETOR: TIntegerField;
    cdsTalao_SetorDTENTRADA: TDateField;
    cdsTalao_SetorHRENTRADA: TTimeField;
    cdsTalao_SetorDTSAIDA: TDateField;
    cdsTalao_SetorHRSAIDA: TTimeField;
    cdsTalao_SetorID_FUNCIONARIO: TIntegerField;
    cdsTalao_SetorQTD: TFloatField;
    cdsTalao_SetorTOTAL_HORAS: TFloatField;
    dsTalao_Setor: TDataSource;
    cdsTalao_SetorclNome_Setor: TStringField;
    cdsTalao_SetorclLER_CBARRA1: TStringField;
    cdsTalao_SetorclEntrada_Aut: TStringField;
    sdsLote_Setor: TSQLDataSet;
    dspLote_Setor: TDataSetProvider;
    cdsLote_Setor: TClientDataSet;
    cdsLote_SetorID_SETOR: TIntegerField;
    cdsLote_SetorQTD: TFloatField;
    cdsLote_SetorNOME_SETOR: TStringField;
    cdsLote_SetorNUM_LOTE: TIntegerField;
    cdsLote_SetorITEM: TIntegerField;
    qVerBaixaLote: TSQLQuery;
    qVerBaixaLoteCONTADOR: TIntegerField;
    mLote_Setor: TClientDataSet;
    dsmLote_Setor: TDataSource;
    mLote_SetorID_Setor: TIntegerField;
    mLote_SetorQtd: TIntegerField;
    mLote_SetorNome_Setor: TStringField;
    mLote_SetorNum_Lote: TIntegerField;
    mLote_SetorItem: TIntegerField;
    mLote_SetorBaixado: TBooleanField;
    mLote_SetorSelecionado: TBooleanField;
    qVerBaixaLoteSetor: TSQLQuery;
    qVerBaixaLoteSetorCONTADOR: TIntegerField;
    cdsLote_SetorID: TIntegerField;
    mLote_SetorID: TIntegerField;
    qFuncionarioBAIXA_LOTE_COMPLETO: TStringField;
    sdsFuncionario_Setor: TSQLDataSet;
    dspFuncionario_Setor: TDataSetProvider;
    cdsFuncionario_Setor: TClientDataSet;
    dsFuncionario_Setor: TDataSource;
    qSetorTIPO_LEITURA: TStringField;
    sdsTalao_SetorQTD_PRODUZIDO: TFloatField;
    sdsTalao_SetorQTD_PENDENTE: TFloatField;
    cdsTalao_SetorQTD_PRODUZIDO: TFloatField;
    cdsTalao_SetorQTD_PENDENTE: TFloatField;
    cdsTalao_SetorclTipo_Leitura: TStringField;
    cdsFuncionario_SetorCODIGO: TIntegerField;
    cdsFuncionario_SetorITEM: TIntegerField;
    cdsFuncionario_SetorID_SETOR: TIntegerField;
    cdsFuncionario_SetorID_LOTE: TIntegerField;
    cdsFuncionario_SetorNUM_TALAO: TIntegerField;
    cdsFuncionario_SetorDTENTRADA: TDateField;
    cdsFuncionario_SetorDTSAIDA: TDateField;
    cdsFuncionario_SetorITEM_TALAO: TIntegerField;
    cdsFuncionario_SetorQTD: TFloatField;
    cdsFuncionario_SetorTIPO_LEITURA: TStringField;
    cdsFuncionario_SetorNOME_SETOR: TStringField;
    mLote_SetorQtd_Pendente: TFloatField;
    cdsFuncionario_SetorQTD_PENDENTE: TFloatField;
    cdsFuncionario_SetorQTD_PRODUZIDO: TFloatField;
    mLote_SetorDtEntrada: TDateField;
    mLote_SetorDtSaida: TDateField;
    sdsFuncLote_Setor: TSQLDataSet;
    dspFuncLote_Setor: TDataSetProvider;
    cdsFuncLote_Setor: TClientDataSet;
    dsFuncLote_Setor: TDataSource;
    cdsFuncLote_SetorCODIGO: TIntegerField;
    cdsFuncLote_SetorID_SETOR: TIntegerField;
    cdsFuncLote_SetorNOME_SETOR: TStringField;
    qFuncionarioBAIXA_PROCESSO: TStringField;
    sdsBaixa_Processo: TSQLDataSet;
    dspBaixa_Processo: TDataSetProvider;
    cdsBaixa_Processo: TClientDataSet;
    cdsBaixa_ProcessoID: TIntegerField;
    cdsBaixa_ProcessoITEM: TIntegerField;
    cdsBaixa_ProcessoID_PROCESSO: TIntegerField;
    cdsBaixa_ProcessoID_LOTE: TIntegerField;
    cdsBaixa_ProcessoID_PEDIDO: TIntegerField;
    cdsBaixa_ProcessoITEM_PEDIDO: TIntegerField;
    cdsBaixa_ProcessoDTENTRADA: TDateField;
    cdsBaixa_ProcessoHRENTRADA: TTimeField;
    cdsBaixa_ProcessoDTBAIXA: TDateField;
    cdsBaixa_ProcessoHRBAIXA: TTimeField;
    cdsBaixa_ProcessoQTD: TFloatField;
    cdsBaixa_ProcessoQTD_PRODUZIDO: TFloatField;
    cdsBaixa_ProcessoNUM_ORDEM: TIntegerField;
    cdsBaixa_ProcessoTIPO: TStringField;
    cdsBaixa_ProcessoTOTAL_HORAS: TFloatField;
    cdsBaixa_ProcessoQTD_PENDENTE: TFloatField;
    cdsBaixa_ProcessoSELECIONADO: TStringField;
    cdsBaixa_ProcessoPARCIAL: TStringField;
    cdsBaixa_ProcessoITEM_ORIGINAL: TIntegerField;
    cdsBaixa_ProcessoQTD_LIBERADA: TFloatField;
    cdsBaixa_ProcessoAJUSTE: TStringField;
    cdsBaixa_ProcessoID_FUNCIONARIO_ENT: TIntegerField;
    cdsBaixa_ProcessoID_FUNCIONARIO_BAIXA: TIntegerField;
    cdsBaixa_ProcessoID_MOVESTOQUE: TIntegerField;
    cdsBaixa_ProcessoID_MOVESTOQUE_RES: TIntegerField;
    cdsBaixa_ProcessoID_SETOR: TIntegerField;
    cdsBaixa_ProcessoID_POSICAO: TIntegerField;
    cdsBaixa_ProcessoNUM_TALAO: TIntegerField;
    cdsBaixa_ProcessoID_MATERIAL: TIntegerField;
    sdsBaixa_ProcessoID: TIntegerField;
    sdsBaixa_ProcessoITEM: TIntegerField;
    sdsBaixa_ProcessoID_PROCESSO: TIntegerField;
    sdsBaixa_ProcessoID_LOTE: TIntegerField;
    sdsBaixa_ProcessoID_PEDIDO: TIntegerField;
    sdsBaixa_ProcessoITEM_PEDIDO: TIntegerField;
    sdsBaixa_ProcessoDTENTRADA: TDateField;
    sdsBaixa_ProcessoHRENTRADA: TTimeField;
    sdsBaixa_ProcessoDTBAIXA: TDateField;
    sdsBaixa_ProcessoHRBAIXA: TTimeField;
    sdsBaixa_ProcessoQTD: TFloatField;
    sdsBaixa_ProcessoQTD_PRODUZIDO: TFloatField;
    sdsBaixa_ProcessoNUM_ORDEM: TIntegerField;
    sdsBaixa_ProcessoTIPO: TStringField;
    sdsBaixa_ProcessoTOTAL_HORAS: TFloatField;
    sdsBaixa_ProcessoQTD_PENDENTE: TFloatField;
    sdsBaixa_ProcessoSELECIONADO: TStringField;
    sdsBaixa_ProcessoPARCIAL: TStringField;
    sdsBaixa_ProcessoITEM_ORIGINAL: TIntegerField;
    sdsBaixa_ProcessoQTD_LIBERADA: TFloatField;
    sdsBaixa_ProcessoAJUSTE: TStringField;
    sdsBaixa_ProcessoID_FUNCIONARIO_ENT: TIntegerField;
    sdsBaixa_ProcessoID_FUNCIONARIO_BAIXA: TIntegerField;
    sdsBaixa_ProcessoID_MOVESTOQUE: TIntegerField;
    sdsBaixa_ProcessoID_MOVESTOQUE_RES: TIntegerField;
    sdsBaixa_ProcessoID_SETOR: TIntegerField;
    sdsBaixa_ProcessoID_POSICAO: TIntegerField;
    sdsBaixa_ProcessoNUM_TALAO: TIntegerField;
    sdsBaixa_ProcessoID_MATERIAL: TIntegerField;
    qBaixaProc: TSQLQuery;
    qBaixaProcID: TIntegerField;
    qBaixaProcITEM: TIntegerField;
    qBaixaProcID_LOTE: TIntegerField;
    qBaixaProcID_PROCESSO: TIntegerField;
    qBaixaProcNOME_PROCESSO: TStringField;
    qBaixaProcNUM_LOTE: TIntegerField;
    qBaixaProcDTENTRADA: TDateField;
    qBaixaProcDTBAIXA: TDateField;
    sdsLotePROCESSO_BAIXADO: TStringField;
    cdsLotePROCESSO_BAIXADO: TStringField;
    qProcLote: TSQLQuery;
    qProcLoteCONTADOR: TIntegerField;
    qParametros_Lote: TSQLQuery;
    qParametros_LoteID_SETOR_EST: TIntegerField;
    sdsTalao_Estoque: TSQLDataSet;
    dspTalao_Estoque: TDataSetProvider;
    cdsTalao_Estoque: TClientDataSet;
    sdsTalao_EstoqueID: TIntegerField;
    sdsTalao_EstoqueID_LOTE: TIntegerField;
    sdsTalao_EstoqueNUM_TALAO: TIntegerField;
    sdsTalao_EstoqueID_SETOR: TIntegerField;
    sdsTalao_EstoqueQTD: TFloatField;
    sdsTalao_EstoqueID_MOVESTOQUE: TIntegerField;
    sdsTalao_EstoqueDATA: TDateField;
    cdsTalao_EstoqueID: TIntegerField;
    cdsTalao_EstoqueID_LOTE: TIntegerField;
    cdsTalao_EstoqueNUM_TALAO: TIntegerField;
    cdsTalao_EstoqueID_SETOR: TIntegerField;
    cdsTalao_EstoqueQTD: TFloatField;
    cdsTalao_EstoqueID_MOVESTOQUE: TIntegerField;
    cdsTalao_EstoqueDATA: TDateField;
    sdsEsteira: TSQLDataSet;
    dspEsteira: TDataSetProvider;
    cdsEsteira: TClientDataSet;
    dsEsteira: TDataSource;
    cdsEsteiraID: TIntegerField;
    cdsEsteiraNOME: TStringField;
    sdsTalao_SetorID_SETOR2: TIntegerField;
    cdsTalao_SetorID_SETOR2: TIntegerField;
    sdsTalao_EstoqueID_SETOR2: TIntegerField;
    cdsTalao_EstoqueID_SETOR2: TIntegerField;
    mLote_SetorID_Esteira: TIntegerField;
    mLote_SetorNome_Esteira: TStringField;
    cdsFuncionario_SetorID_ESTEIRA: TIntegerField;
    cdsFuncLote_SetorID_ESTEIRA: TIntegerField;
    cdsFuncionario_SetorID_ESTEIRA_TAL: TIntegerField;
    cdsFuncionario_SetorNOME_ESTEIRA_TAL: TStringField;
    cdsFuncLote_SetorID_ESTEIRA_TAL: TIntegerField;
    cdsFuncLote_SetorNOME_ESTEIRA_TAL: TStringField;
    qBaixaProcQTD_LEITURA: TIntegerField;
    sdsBaixa_Processo_Itens: TSQLDataSet;
    dspBaixa_Processo_Itens: TDataSetProvider;
    cdsBaixa_Processo_Itens: TClientDataSet;
    cdsBaixa_Processo_ItensID: TIntegerField;
    cdsBaixa_Processo_ItensITEM: TIntegerField;
    cdsBaixa_Processo_ItensITEM2: TIntegerField;
    cdsBaixa_Processo_ItensDESCRICAO: TStringField;
    cdsBaixa_Processo_ItensDTENTRADA: TDateField;
    cdsBaixa_Processo_ItensHRENTRADA: TTimeField;
    cdsBaixa_Processo_ItensDTBAIXA: TDateField;
    cdsBaixa_Processo_ItensHRBAIXA: TTimeField;
    cdsBaixa_Processo_ItensID_FUNCIONARIO_ENT: TIntegerField;
    cdsBaixa_Processo_ItensID_FUNCIONARIO_BAI: TIntegerField;
    sdsBaixa_Processo_ItensID: TIntegerField;
    sdsBaixa_Processo_ItensITEM: TIntegerField;
    sdsBaixa_Processo_ItensITEM2: TIntegerField;
    sdsBaixa_Processo_ItensDESCRICAO: TStringField;
    sdsBaixa_Processo_ItensDTENTRADA: TDateField;
    sdsBaixa_Processo_ItensHRENTRADA: TTimeField;
    sdsBaixa_Processo_ItensDTBAIXA: TDateField;
    sdsBaixa_Processo_ItensHRBAIXA: TTimeField;
    sdsBaixa_Processo_ItensID_FUNCIONARIO_ENT: TIntegerField;
    sdsBaixa_Processo_ItensID_FUNCIONARIO_BAI: TIntegerField;
    qBaixaProcSTATUS_LEITURA: TStringField;
    sdsBaixa_ProcessoQTD_LEITURA: TIntegerField;
    cdsBaixa_ProcessoQTD_LEITURA: TIntegerField;
    sdsPRC_STATUS_PROCESSO: TSQLDataSet;
    sdsEstornoTalao: TSQLDataSet;
    dspEstornoTalao: TDataSetProvider;
    cdsEstornoTalao: TClientDataSet;
    dsEstornoTalao: TDataSource;
    cdsEstornoTalaoNUM_LOTE: TIntegerField;
    cdsEstornoTalaoNUM_ORDEM: TIntegerField;
    cdsEstornoTalaoNUM_TALAO: TIntegerField;
    cdsEstornoTalaoID_SETOR: TIntegerField;
    cdsEstornoTalaoDTENTRADA: TDateField;
    cdsEstornoTalaoDTSAIDA: TDateField;
    cdsEstornoTalaoQTD: TFloatField;
    cdsEstornoTalaoQTD_PRODUZIDO: TFloatField;
    cdsEstornoTalaoQTD_PENDENTE: TFloatField;
    cdsEstornoTalaoNOME_SETOR: TStringField;
    cdsEstornoTalaoITEM: TIntegerField;
    cdsEstornoTalaoID: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsTalao_SetorCalcFields(DataSet: TDataSet);
    procedure mLote_SetorNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    procedure DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);
    
  public
    { Public declarations }
    ctBaixa_Processo : String;
    ctTalao_Setor : String;
    ctFuncionario_Setor : String;
    ctEstornoTalao : String;
    vHoraBaixa : TTime;
    vDataBaixa : TDate;
    vID_Setor_Tal : Integer;
    vID_Esteira_Tal : Integer;

    procedure prc_Abrir_Baixa_Processo(ID_Lote, Num_Talao, ID_Setor : Integer);
    procedure prc_Gravar_Talao_Setor;
    procedure prc_Gravar_Lote_BaixaProcesso(Baixado : String ; ID_Lote : Integer);
    procedure prc_Abrir_Talao_Estoque(ID : Integer);

  end;

var
  DMBaixaProd_Calc: TDMBaixaProd_Calc;

implementation

uses DmdDatabase, uUtilPadrao, LogProvider;

{$R *.dfm}

procedure TDMBaixaProd_Calc.DataModuleCreate(Sender: TObject);
var
  i, x: Integer;
  SR: TSearchRec;
  Origem, Destino: string;
  vIndices: string;
  aIndices: array of string;
begin
  //ctBaixa_Processo := sdsBaixa_Processo.CommandText;
  ctTalao_Setor       := sdsTalao_Setor.CommandText;
  ctFuncionario_Setor := sdsFuncionario_Setor.CommandText;
  ctEstornoTalao      := sdsEstornoTalao.CommandText;
  qParametros_Lote.Open;

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
end;

procedure TDMBaixaProd_Calc.cdsTalao_SetorCalcFields(DataSet: TDataSet);
begin
  qSetor.Close;
  qSetor.ParamByName('ID').AsInteger := cdsTalao_SetorID_SETOR.AsInteger;
  qSetor.Open;
  cdsTalao_SetorclNome_Setor.AsString   := qSetorNOME.AsString;
  cdsTalao_SetorclLER_CBARRA1.AsString  := qSetorLER_CBARRA1.AsString;
  cdsTalao_SetorclEntrada_Aut.AsString  := qSetorENTRADA_AUT.AsString;
  cdsTalao_SetorclTipo_Leitura.AsString := qSetorTIPO_LEITURA.AsString;
end;

procedure TDMBaixaProd_Calc.mLote_SetorNewRecord(DataSet: TDataSet);
begin
  mLote_SetorSelecionado.AsBoolean := False;
  mLote_SetorBaixado.AsBoolean     := False;
end;

procedure TDMBaixaProd_Calc.prc_Abrir_Baixa_Processo(ID_Lote, Num_Talao, ID_Setor : Integer);
begin
  cdsTalao_Setor.Close;
  sdsTalao_Setor.CommandText := ctTalao_Setor;
  sdsTalao_Setor.CommandText := ctTalao_Setor + ' AND NUM_TALAO = :NUM_TALAO '
                                              + ' AND ID_SETOR = :ID_SETOR ' ;
  sdsTalao_Setor.ParamByName('ID').AsInteger        := ID_Lote;
  sdsTalao_Setor.ParamByName('NUM_TALAO').AsInteger := Num_Talao;
  sdsTalao_Setor.ParamByName('ID_Setor').AsInteger   := ID_Setor;
  cdsTalao_Setor.Open;
end;

procedure TDMBaixaProd_Calc.prc_Gravar_Talao_Setor;
begin
  if vHoraBaixa <= 0 then
    vHoraBaixa := Now;
  if vDataBaixa <= 10 then
    vDataBaixa := Date;

  cdsTalao_Setor.Edit;
  if cdsTalao_SetorDTENTRADA.IsNull then
  begin
    cdsTalao_SetorDTENTRADA.AsDateTime := vDataBaixa;
    cdsTalao_SetorHRENTRADA.AsDateTime := vHoraBaixa;
  end;
  if (cdsTalao_SetorDTSAIDA.IsNull) then
  begin
    cdsTalao_SetorDTSAIDA.AsDateTime := vDataBaixa;
    cdsTalao_SetorHRSAIDA.AsDateTime := vHoraBaixa;
    cdsTalao_SetorTOTAL_HORAS.AsFloat := fnc_Calcular_Hora2(cdsTalao_SetorHRENTRADA.AsDateTime,
                                                            cdsTalao_SetorHRSAIDA.AsDateTime,
                                                            cdsTalao_SetorDTENTRADA.AsDateTime,
                                                            cdsTalao_SetorDTSAIDA.AsDateTime);
  end;
  cdsTalao_Setor.Post;
  cdsTalao_Setor.ApplyUpdates(0);
end;

procedure TDMBaixaProd_Calc.DoLogAdditionalValues(ATableName: string;
  var AValues: TArrayLogData; var UserName: string);
begin
  UserName := vUsuario;
end;

procedure TDMBaixaProd_Calc.prc_Gravar_Lote_BaixaProcesso(Baixado : String ; ID_Lote : Integer);
var
  sds: TSQLDataSet;
begin
  sds := TSQLDataSet.Create(nil);
  try
    sds.SQLConnection := dmDatabase.scoDados;
    sds.NoMetadata    := True;
    sds.GetMetadata   := False;
    sds.CommandText   := 'UPDATE LOTE SET PROCESSO_BAIXADO = ' + QuotedStr(Baixado)
                       + ' WHERE ID = ' + IntToStr(ID_Lote);
    sds.ExecSQL;
  finally
    FreeAndNil(sds);
  end;

end;

procedure TDMBaixaProd_Calc.prc_Abrir_Talao_Estoque(ID: Integer);
begin
  cdsTalao_Estoque.Close;
  sdsTalao_Estoque.ParamByName('ID').AsInteger := ID;
  cdsTalao_Estoque.Open;
end;

end.
