program SimpleERP;

uses
  Forms,
  Model.UsuarioDAO in 'src\Model.UsuarioDAO.pas',
  Model.Usuario in 'src\Model.Usuario.pas',
  Model.DAO.Interf in 'src\Model.DAO.Interf.pas',
  Model.Usuario.Entidade in 'src\Model.Usuario.Entidade.pas',
  Model.Interf in 'src\Model.Interf.pas',
  Controller.Interf in 'src\Controller.Interf.pas',
  Controller in 'src\Controller.pas',
  Controller.Login in 'src\Controller.Login.pas',
  View.Principal in 'src\View.Principal.pas' {frmView_Principal},
  View.Usuario in 'src\View.Usuario.pas' {frmView_Usuario},
  View.Login in 'src\View.Login.pas' {frmLogin_View},
  Controller.Cadastros in 'src\Controller.Cadastros.pas',
  Model.DMConnZeos in 'src\Model.DMConnZeos.pas' {DMConnZeos: TDataModule},
  View.BaseGrid in 'src\View.BaseGrid.pas' {frmBaseGrid};

{$R *.res}

begin
  Application.Initialize;
//  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMConnZeos, DMConnZeos);
  Application.CreateForm(TfrmView_Principal, frmView_Principal);
  Application.Run;
end.
