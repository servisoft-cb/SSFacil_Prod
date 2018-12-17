unit UDMConsProc;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider;

type
  TDMConsProc = class(TDataModule)
    sdsProc_Ref: TSQLDataSet;
    dspProc_Ref: TDataSetProvider;
    cdsProc_Ref: TClientDataSet;
    cdsProc_RefQTD: TFloatField;
    cdsProc_RefQTD_NAO_ENVIADO: TFloatField;
    cdsProc_RefQTD_NO_PROCESSO: TFloatField;
    cdsProc_RefQTD_BAIXADO: TFloatField;
    cdsProc_RefID_PRODUTO: TIntegerField;
    cdsProc_RefREFERENCIA: TStringField;
    cdsProc_RefNOME_COMBINACAO: TStringField;
    cdsProc_RefNOME_PROCESSO: TStringField;
    cdsProc_RefID_PROCESSO: TIntegerField;
    cdsProc_RefID_COMBINACAO: TIntegerField;
    sdsProc: TSQLDataSet;
    dspProc: TDataSetProvider;
    cdsProc: TClientDataSet;
    mConsProc: TClientDataSet;
    mConsProcID_Produto: TIntegerField;
    mConsProcReferencia: TStringField;
    mConsProcID_Combinacao: TIntegerField;
    mConsProcNome_Combinacao: TStringField;
    dsmConsProc: TDataSource;
    mProc: TClientDataSet;
    mConsProcID_Mov: TIntegerField;
    mProcID_Mov: TIntegerField;
    mProcID_Processo: TIntegerField;
    mProcNome_Processo: TStringField;
    mProcQtd_Processo: TFloatField;
    mProcEnviado: TBooleanField;
    dsmProc: TDataSource;
    mAuxProc: TClientDataSet;
    dsmAuxProc: TDataSource;
    mAuxProcItem: TIntegerField;
    mAuxProcID_Processo: TIntegerField;
    mAuxProcNome_Processo: TStringField;
    mProcItem: TIntegerField;
    cdsProcNOME_PROCESSO: TStringField;
    cdsProcID_PROCESSO: TIntegerField;
    cdsProcQTD_NO_PROCESSO: TFloatField;
    cdsProcQTD_NAO_ENVIADO: TFloatField;
    dsProc: TDataSource;
    dsProc_Ref: TDataSource;
    mConsProcQtd1: TFloatField;
    mConsProcQtd2: TFloatField;
    mConsProcQtd3: TFloatField;
    mConsProcQtd4: TFloatField;
    mConsProcQtd5: TFloatField;
    mConsProcQtd6: TFloatField;
    mConsProcQtd7: TFloatField;
    mConsProcQtd8: TFloatField;
    mConsProcQtd9: TFloatField;
    mConsProcQtd10: TFloatField;
    mConsProcQtd11: TFloatField;
    mConsProcQtd12: TFloatField;
    mConsProcQtd13: TFloatField;
    mConsProcQtd14: TFloatField;
    mConsProcQtd15: TFloatField;
    mConsProcQtd16: TFloatField;
    mConsProcQtd17: TFloatField;
    mConsProcQtd18: TFloatField;
    mConsProcQtd19: TFloatField;
    mConsProcQtd20: TFloatField;
    mConsProcQTotal: TFloatField;
    mConsProc_Nao: TClientDataSet;
    dsmConsProc_Nao: TDataSource;
    mConsProc_NaoID_Mov: TIntegerField;
    mConsProc_NaoID_Produto: TIntegerField;
    mConsProc_NaoReferencia: TStringField;
    mConsProc_NaoID_Combinacao: TIntegerField;
    mConsProc_NaoNome_Combinacao: TStringField;
    mConsProc_NaoQtd1: TFloatField;
    mConsProc_NaoQtd2: TFloatField;
    mConsProc_NaoQtd3: TFloatField;
    mConsProc_NaoQtd4: TFloatField;
    mConsProc_NaoQtd5: TFloatField;
    mConsProc_NaoQtd6: TFloatField;
    mConsProc_NaoQtd7: TFloatField;
    mConsProc_NaoQtd8: TFloatField;
    mConsProc_NaoQtd9: TFloatField;
    mConsProc_NaoQtd10: TFloatField;
    mConsProc_NaoQtd11: TFloatField;
    mConsProc_NaoQtd12: TFloatField;
    mConsProc_NaoQtd13: TFloatField;
    mConsProc_NaoQtd14: TFloatField;
    mConsProc_NaoQtd15: TFloatField;
    mConsProc_NaoQtd16: TFloatField;
    mConsProc_NaoQtd17: TFloatField;
    mConsProc_NaoQtd18: TFloatField;
    mConsProc_NaoQtd19: TFloatField;
    mConsProc_NaoQtd20: TFloatField;
    mConsProc_NaoQTotal: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMConsProc: TDMConsProc;

implementation

uses DmdDatabase;

{$R *.dfm}

end.
