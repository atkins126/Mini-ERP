unit Model.Usuario;

interface

uses
  Model.DAO.Interf,
  Model.Interf,
  Model.UsuarioDAO;

type
  TUsuario_Model = class(TInterfacedObject, iUsuario_Model)
  private
  	FUsuarioDAO_Model : iUsuarioDAO_Model;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iUsuario_Model;
    function DAO : iUsuarioDAO_Model;
  end;

implementation

{ TUsuario_Model }

constructor TUsuario_Model.Create;
begin

end;

function TUsuario_Model.DAO: iUsuarioDAO_Model;
begin
	if not Assigned(FUsuarioDAO_Model) then
  	FUsuarioDAO_Model := TUsuarioDAO_Model.Create;

  Result := FUsuarioDAO_Model;
end;

destructor TUsuario_Model.Destroy;
begin

  inherited;
end;

class function TUsuario_Model.New: iUsuario_Model;
begin
  Result := Self.Create;
end;

end.
