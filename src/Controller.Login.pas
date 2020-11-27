unit Controller.Login;

interface

uses
	Controls,
	Controller.Interf,
  Model.Usuario,
  View.Login,
  SysUtils,
  Classes;

type
  TLogin_Controller = class(TInterfacedObject, iLogin_Controller)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iLogin_Controller;
    function InformaAcesso: iLogin_Controller;
  end;

implementation

uses Forms;

{ TLogin_Controller }

constructor TLogin_Controller.Create;
begin

end;

destructor TLogin_Controller.Destroy;
begin

  inherited;
end;

function TLogin_Controller.InformaAcesso: iLogin_Controller;
var
  FListUSUARIOS : TList;
begin
	FListUSUARIOS := TList.Create;
	TUsuario_Model.New.DAO.Find(FListUSUARIOS);
	frmLogin_View := TfrmLogin_View.Create(nil);
  frmLogin_View.Usuarios := FListUSUARIOS;
  if frmLogin_View.ShowModal <> mrOk then
  	Application.Terminate;
  frmLogin_View.Free;
end;

class function TLogin_Controller.New: iLogin_Controller;
begin
  Result := Self.Create;
end;

end.
