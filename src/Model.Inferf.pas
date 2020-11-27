unit Model.Inferf;

interface

uses
	Usuario_Model.Interf;

type
	iLogin_Model = interface;
	iModel = interface
  	['{729B6C94-CB4C-4C50-96B6-D60A6D88B5BE}']
    function USUARIO : iUsuario_Model;
    function LOGIN : iLogin_Model;
  end;

  iLogin_Model = interface
  	['{47BFD7FD-4A60-4D46-B854-227E0E3F5630}']
    function AbrirForm : iLogin_Model;
  end;

implementation

end.
