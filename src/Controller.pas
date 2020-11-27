unit Controller;

interface

uses
	Controller.Interf,
  Controller.Login,
  Controller.Cadastros,
  Model.Interf,
  Model.Usuario;

type
  TController = class(TInterfacedObject, iController)
  private
    FUSUARIO : iUsuario_Model;
    FLOGIN : iLogin_Controller;
    FCadastros : iControllerCadastros;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iController;
    function USUARIOS : iUsuario_Model;
    function LOGIN : iLogin_Controller;
    function Cadastros: iControllerCadastros;
  end;


implementation

uses
  SysUtils;

{ TController }

function TController.Cadastros: iControllerCadastros;
begin
	if not (Assigned(FCadastros)) then
  	FCadastros := TControllerCadastros.New(Self);

	Result := FCadastros;
end;

constructor TController.Create;
begin
end;

destructor TController.Destroy;
begin

  inherited;
end;

function TController.LOGIN: iLogin_Controller;
begin
	if not Assigned(FLOGIN) then
    FLOGIN := TLogin_Controller.Create;

  Result := FLOGIN;
end;

class function TController.New: iController;
begin
	Result := Self.Create;
end;

function TController.USUARIOS: iUsuario_Model;
begin
	if not Assigned(FUSUARIO) then
    FUSUARIO := TUsuario_Model.New;

  Result := FUSUARIO;
end;

end.
