unit Controller.Interf;

interface

uses
	DB,
  Model.Interf,
  Model.DAO.Interf;

type
	iUsuario_Controller = interface;
  iLogin_Controller = interface;
  iControllerCadastros = interface;
  iControllerRelatorios = interface;


	iController = interface
  	['{BE60EB4F-89DA-4829-A3D7-8D6BDF9BD241}']
    //function USUARIOS : iUsuario_Controller;
    function USUARIOS : iUsuario_Model;
    function LOGIN : iLogin_Controller;
    function Cadastros: iControllerCadastros;
    function Relatorios: iControllerRelatorios;
  end;

  iUsuario_Controller = interface
  	['{41464EBA-01D6-47C3-AC1C-C77E3F125FF8}']
    function DAO : iUsuarioDAO_Model;
    function DataSource(ADataSource: TDataSource) : iUsuario_Controller;
  end;

  iLogin_Controller = interface
  	['{D3F9FF8A-78CB-4AB3-AF22-F360210EA023}']
    function InformaAcesso: iLogin_Controller;
  end;

  iControllerCadastros = interface
  	['{96E76CD8-FBD5-4823-A77E-C1EC6B404667}']
    function USUARIO : iControllerCadastros;
  end;

  iControllerRelatorios = interface
  	['{0EEA9EB4-7FBB-4676-9812-DDFCBAD72828}']
    function USUARIOS : iControllerRelatorios;
  end;

implementation

end.
