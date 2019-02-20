unit URelMatLote2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMConsLote, UDMRel, RLReport;

type
  TfRelMatLote2 = class(TForm)
    RLReport1: TRLReport;
    RLGroup1: TRLGroup;
    RLSubDetail1: TRLSubDetail;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLSubDetail2: TRLSubDetail;
    RLGroup2: TRLGroup;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDraw3: TRLDraw;
    RLSubDetail3: TRLSubDetail;
    RLDetailGrid1: TRLDetailGrid;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLBand4: TRLBand;
    RLLabel9: TRLLabel;
    RLDBText7: TRLDBText;
    RLBand5: TRLBand;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel13: TRLLabel;
    RLDraw1: TRLDraw;
    RLBand6: TRLBand;
    RLLabel1: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel4: TRLLabel;
    RLBand7: TRLBand;
    RLDBResult1: TRLDBResult;
    RLLabel12: TRLLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
    fDMRel: TDMRel;
    
  public
    { Public declarations }
    fDMConsLote: TDMConsLote;
    
  end;

var
  fRelMatLote2: TfRelMatLote2;

implementation

uses rsDBUtils;

{$R *.dfm}

procedure TfRelMatLote2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfRelMatLote2.FormCreate(Sender: TObject);
begin
  fDMRel := TDMRel.Create(Self);
end;

procedure TfRelMatLote2.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMConsLote);
end;

end.
