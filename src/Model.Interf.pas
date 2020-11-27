unit Model.Interf;

interface

uses
	Classes,
  DB,
	Model.DAO.Interf;

type
  iUsuario_Model = interface
    ['{6F0F5EFA-7F7D-400D-B76F-4C3FDE2FE61D}']
    function DAO : iUsuarioDAO_Model;
  end;

  iLogin_Model = interface
  	['{47BFD7FD-4A60-4D46-B854-227E0E3F5630}']
    function AbrirForm : iLogin_Model;
  end;

	iModel = interface
  	['{729B6C94-CB4C-4C50-96B6-D60A6D88B5BE}']
    function USUARIO : iUsuario_Model;
    function LOGIN : iLogin_Model;
  end;

  iModelQuery = interface
  	['{DE91E080-F27A-40CB-A571-3F7384E5E50B}']
    procedure ExecSQL;
    procedure Open(aSQL : String); overload;
    procedure Open; overload;
    function SQL : TStrings;
    function Params : TParams;
    function DataSet : TDataSet;
  end;

  iModelConn = interface
  	['{6BDF1288-8C1D-47A4-B10D-B3B6EC286734}']
    function ConnZeos: iModelQuery;
//    function ConnFireDAC: TComponent;
//    function DBExpress: TComponent;
  end;

implementation

end.
