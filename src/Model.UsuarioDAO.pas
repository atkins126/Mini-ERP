unit Model.UsuarioDAO;

interface

uses
  DB,
  Model.Interf,
  Model.DAO.Interf,
  Model.DMConnZeos,
  Model.Usuario.Entidade,
  Classes;

type
  TUsuarioDAO_Model = class(TInterfacedObject, iUsuarioDAO_Model, iDAO_Model)
  private
    FThis: TUSUARIO;
    FNewThis: TUSUARIO;
    FConn: iModelQuery;
    FDataSource : TDataSource;
    FList : TList;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iDAO_Model;
    function _This : TUSUARIO;
    function _NewThis : TUSUARIO;
    function Insert(): iDAO_Model;
    function Update(): iDAO_Model;
    function Delete(AId : string): iDAO_Model; overload;
    function Delete(AId : integer): iDAO_Model; overload;
    function Find(): iDAO_Model; overload;
    function Find(AList : TList): iDAO_Model; overload;
    function Find(AId : string): iDAO_Model; overload;
    function DataSource(ADataSource : TDataSource): iDAO_Model;
  end;

implementation

uses
  SysUtils;

{ TUsuarioDAO_Model }

constructor TUsuarioDAO_Model.Create;
begin
  inherited;
  FThis := TUSUARIO.Create;
  FConn := DMConnZeos.ConnZeos;
end;

function TUsuarioDAO_Model.DataSource(ADataSource: TDataSource): iDAO_Model;
begin
	Result := Self;
	FDataSource := ADataSource;
  FDataSource.DataSet := FConn.DataSet;
  FDataSource.OnDataChange := DataSource1DataChange;
end;

function TUsuarioDAO_Model.Delete(AId: string): iDAO_Model;
begin
  Result := Self;
  if (Trim(AId) = '') then
  	raise	Exception.Create('Id da tabela não informado');

  FConn.SQL.Clear;
  FConn.SQL.Add('delete from USUARIO where CODIGO = :CODIGO');
  FConn.Params.ParamByName('CODIGO').Value := AId;
  FConn.ExecSQL;
end;

procedure TUsuarioDAO_Model.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  if (not FConn.DataSet.IsEmpty) then
  begin
    FThis.CODIGO := FConn.DataSet.FieldByName('CODIGO').Value;
    FThis.NOME := FConn.DataSet.FieldByName('NOME').Value;
    FThis.LOGIN := FConn.DataSet.FieldByName('LOGIN').Value;
    FThis.SENHA := FConn.DataSet.FieldByName('SENHA').Value;
    FThis.STATUS := FConn.DataSet.FieldByName('STATUS').Value;
    FThis.EMAIL := FConn.DataSet.FieldByName('EMAIL').Value;
    FThis.DATA_NASCIMENTO := FConn.DataSet.FieldByName('DATA_NASCIMENTO').Value;
  end;
end;

function TUsuarioDAO_Model.Delete(AId: integer): iDAO_Model;
begin
	Result := Self.Delete(IntToStr(AId));
end;

destructor TUsuarioDAO_Model.Destroy;
begin
  FreeAndNil(FThis);
  inherited;
end;

function TUsuarioDAO_Model.Find(AId: string): iDAO_Model;
begin
	Result := Self;
  FConn.SQL.Clear;
  //FDB.Get(['CODIGO', 'NOME', 'LOGIN', 'SENHA', 'STATUS', 'EMAIL', 'DATA_NASCIMENTO']);


  FConn.SQL.Add('select CODIGO'+
                 ', NOME'+
                 ', LOGIN'+
                 ', SENHA'+
                 ', STATUS'+
                 ', EMAIL'+
                 ', DATA_NASCIMENTO '+
               ' from USUARIO where :CODIGO in (cast(CODIGO as varchar), '''')');
  FConn.Params.ParamByName('CODIGO').Value := AId;
  FConn.Open;
end;

function TUsuarioDAO_Model.Find: iDAO_Model;
begin
	Result := Self;
  Find('');
end;

function TUsuarioDAO_Model.Find(AList: TList): iDAO_Model;
var
  LUSUARIO : TUSUARIO;
begin
	Result := Self;
  Self.Find;
  if FConn.DataSet.IsEmpty then Exit;

  AList.Clear;
  FConn.DataSet.First;
  while (not FConn.DataSet.Eof) do
  begin
    LUSUARIO := TUSUARIO.Create;
    LUSUARIO.CODIGO := FConn.DataSet.FieldByName('CODIGO').Value;
    LUSUARIO.NOME := FConn.DataSet.FieldByName('NOME').Value;
    LUSUARIO.LOGIN := FConn.DataSet.FieldByName('LOGIN').Value;
    LUSUARIO.SENHA := FConn.DataSet.FieldByName('SENHA').Value;
    LUSUARIO.STATUS := FConn.DataSet.FieldByName('STATUS').Value;
    LUSUARIO.EMAIL := FConn.DataSet.FieldByName('EMAIL').Value;
    LUSUARIO.DATA_NASCIMENTO := FConn.DataSet.FieldByName('DATA_NASCIMENTO').Value;
		AList.Add(LUSUARIO);
  	FConn.DataSet.Next;
  end;
end;

function TUsuarioDAO_Model.Insert: iDAO_Model;
begin
	Result := Self;

  if (FNewThis.DATA_NASCIMENTO <= StrToDate('01/01/1128')) then
  	raise Exception.Create('Data informada inválida');

  FConn.SQL.Clear;
  FConn.SQL.Add('insert into USUARIO '+
    '(CODIGO, NOME, LOGIN, SENHA, STATUS, EMAIL, DATA_NASCIMENTO) values ('+
    'NULL, :NOME, :LOGIN, :SENHA, :STATUS, :EMAIL, :DATA_NASCIMENTO)');
  //FConn.Params.ParamByName('CODIGO').Value          := FNewThis.CODIGO;
  FConn.Params.ParamByName('NOME').Value            := FNewThis.NOME;
  FConn.Params.ParamByName('LOGIN').Value           := FNewThis.LOGIN;
  FConn.Params.ParamByName('SENHA').Value           := FNewThis.SENHA;
  FConn.Params.ParamByName('STATUS').Value          := FNewThis.STATUS;
  FConn.Params.ParamByName('EMAIL').Value           := FNewThis.EMAIL;
  FConn.Params.ParamByName('DATA_NASCIMENTO').Value := FNewThis.DATA_NASCIMENTO;
  FConn.ExecSQL;
end;

class function TUsuarioDAO_Model.New: iDAO_Model;
begin
	Result := Self.Create;
end;

function TUsuarioDAO_Model.Update: iDAO_Model;
begin
	Result := Self;
  FConn.SQL.Clear;
  FConn.SQL.Text := 'update USUARIO set '+
    'NOME = :NOME, '+
    'LOGIN = :LOGIN, '+
    'SENHA = :SENHA, '+
    'STATUS = :STATUS, '+
    'EMAIL = :EMAIL, '+
    'DATA_NASCIMENTO = :DATA_NASCIMENTO '+
    'where CODIGO = :CODIGO';

  FConn.Params.ParamByName('CODIGO').Value          := FThis.CODIGO;
  FConn.Params.ParamByName('NOME').Value            := FThis.NOME;
  FConn.Params.ParamByName('LOGIN').Value           := FThis.LOGIN;
  FConn.Params.ParamByName('SENHA').Value           := FThis.SENHA;
  FConn.Params.ParamByName('STATUS').Value          := FThis.STATUS;
  FConn.Params.ParamByName('EMAIL').Value           := FThis.EMAIL;
  FConn.Params.ParamByName('DATA_NASCIMENTO').Value := FThis.DATA_NASCIMENTO;
  FConn.ExecSQL;
end;

function TUsuarioDAO_Model._NewThis: TUSUARIO;
begin
	if not Assigned(FNewThis) then
  	FNewThis := TUSUARIO.Create;

  Result := FNewThis;
end;

function TUsuarioDAO_Model._This: TUSUARIO;
begin
  Result := FThis;
end;

end.
