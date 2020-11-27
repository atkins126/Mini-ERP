unit Controller.Cadastros;

interface

uses
	Controller.Interf;

type
  TControllerCadastros = class(TInterfacedObject, iControllerCadastros)
  private
  	FController: iController;
  public
    constructor Create(AController: iController);
    destructor Destroy; override;
    class function New(AController: iController) : iControllerCadastros;
    function USUARIO : iControllerCadastros;
  end;

implementation

uses
	SysUtils,
  View.Usuario;

{ TControllerCadastros }

constructor TControllerCadastros.Create(AController: iController);
begin
	FController := AController;
end;

destructor TControllerCadastros.Destroy;
begin

  inherited;
end;

class function TControllerCadastros.New(AController: iController): iControllerCadastros;
begin
  Result := Self.Create(AController);
end;

function TControllerCadastros.USUARIO: iControllerCadastros;
begin
	Result := Self;
  frmView_Usuario := TfrmView_Usuario.New(FController);
  frmView_Usuario.ShowModal;
  FreeAndNil(frmView_Usuario);
end;

end.
