unit Model.DMConnZeos;

interface

uses
  SysUtils,
  Classes,
  DB,
  // zeos
  ZConnection,
  ZAbstractConnection,
  ZDataset,
  ZAbstractDataset,
  ZAbstractRODataset,
  ZSqlMonitor,
  // myclasse
  Model.Interf;

type
  TDMConnZeos = class(TDataModule, iModelConn)
    ZConnection1: TZConnection;
    ZSQLMonitor1: TZSQLMonitor;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ConnZeos: iModelQuery;
  end;


  TModelConnZeosQuery = class(TInterfacedObject, iModelQuery)
  private
  	ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    FParams : TParams;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iModelQuery;
  	procedure ExecSQL;
    procedure Open(aSQL : String); overload;
    procedure Open; overload;
    function SQL : TStrings;
    function Params : TParams;
    function DataSet : TDataSet;
  end;

var
  DMConnZeos: TDMConnZeos;

implementation


{$R *.dfm}

{ TModelConexaoZeos }

function TDMConnZeos.ConnZeos: iModelQuery;
begin
	Result := TModelConnZeosQuery.New;
end;


{ TModelQueryZeos }

constructor TModelConnZeosQuery.Create;
begin
	// sqlite
	ZConnection1 := DMConnZeos.ZConnection1;
  ZQuery1 := TZQuery.Create(nil);
  ZQuery1.Connection := ZConnection1;

  // SQL Server
  //ZConnection1.Protocol := 'ado';
  //ZConnection1.Database := 'Provider=SQLNCLI.1;Password=rkc;Persist Security Info=True;User ID=sa;Initial Catalog=NFE;Data Source=localhost';
end;

function TModelConnZeosQuery.DataSet: TDataSet;
begin
	Result := ZQuery1;
end;

destructor TModelConnZeosQuery.Destroy;
begin
	FreeAndNil(ZQuery1);
  if Assigned(FParams) then
    FreeAndNil(FParams);
  inherited;
end;

procedure TModelConnZeosQuery.ExecSQL;
begin
//	ZQuery1.Close;
  ZQuery1.Params.Assign(FParams);
  ZQuery1.Prepare;
  ZQuery1.ExecSQL;

  if Assigned(FParams) then
    FreeAndNil(FParams);
end;

procedure TModelConnZeosQuery.Open(aSQL: String);
begin
	ZQuery1.DisableControls;
  try
    ZQuery1.Close;
    ZQuery1.SQL.Clear;
    ZQuery1.SQL.Add(aSQL);
    ZQuery1.Open;
  finally
    ZQuery1.EnableControls;
  end;
end;

class function TModelConnZeosQuery.New: iModelQuery;
begin
	Result := Self.Create;
end;

procedure TModelConnZeosQuery.Open;
begin
  ZQuery1.Close;

  if Assigned(FParams) then
    ZQuery1.Params.Assign(FParams);

  ZQuery1.Prepare;
  ZQuery1.Open;

  if Assigned(FParams) then
    FreeAndNil(FParams);
end;

function TModelConnZeosQuery.Params: TParams;
begin
	if not Assigned(FParams) then
  begin
    FParams := TParams.Create(nil);
    FParams.Assign(ZQuery1.Params);
  end;
  Result := FParams;
end;

function TModelConnZeosQuery.SQL: TStrings;
begin
	Result := ZQuery1.SQL;
end;

procedure TDMConnZeos.DataModuleCreate(Sender: TObject);
begin
  ZConnection1.Protocol := 'sqlite';
  ZConnection1.LibraryLocation := 'sqlite3.dll';
  ZConnection1.Database := '..\DB\database.sdb3';
end;

end.
