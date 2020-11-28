unit View.Usuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, View.BaseGrid, DB, ActnList, ImgList, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, JvExDBGrids, JvDBGrid, ExtCtrls;

type
  TfrmView_Usuario = class(TfrmBaseGrid)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmView_Usuario: TfrmBaseGrid;

implementation

{$R *.dfm}

procedure TfrmView_Usuario.FormShow(Sender: TObject);
begin
  inherited;
	FParent.USUARIOS.DAO.DataSource(DataSource1);
  FParent.USUARIOS.DAO.Find;
end;

end.
