unit URelMatLote2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMConsLote, UDMRel, RLReport;

type
  TfRelMatLote2 = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLDraw1: TRLDraw;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDraw3: TRLDraw;
    RLSubDetail1: TRLSubDetail;
    RLDetailGrid1: TRLDetailGrid;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLBand3: TRLBand;
    RLLabel9: TRLLabel;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
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
