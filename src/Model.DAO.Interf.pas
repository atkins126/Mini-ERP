unit Model.DAO.Interf;

interface

uses
	Classes,
	DB,
  Model.Usuario.Entidade;

type
	iDAO_Model = interface
  	['{362FFD2D-4D11-4078-83B0-1C3E2E0D7556}']
		function Insert(): iDAO_Model;
    function Update(): iDAO_Model;
    function Delete(AId : string): iDAO_Model; overload;
    function Delete(AId : integer): iDAO_Model; overload;
    function Find(): iDAO_Model; overload;
    function Find(AList : TList): iDAO_Model; overload;
    function Find(AId : string): iDAO_Model; overload;
    function DataSource(ADataSource : TDataSource): iDAO_Model;
  end;

  iUsuarioDAO_Model = interface(iDAO_Model)
  	['{EA01B96F-C696-45CC-89D3-DB81AF3EAB6B}']
    function _This : TUSUARIO;
    function _NewThis : TUSUARIO;
  end;

implementation

end.
