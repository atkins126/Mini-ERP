unit View.Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Buttons, ExtCtrls, jpeg,

  Controller.Interf,
  Controller;

type
  TfrmView_Principal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Usurios1: TMenuItem;
    Image1: TImage;
    procedure Usurios1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    FController: iController;
  public
    { Public declarations }
  end;

var
  frmView_Principal: TfrmView_Principal;

implementation

{$R *.dfm}

procedure TfrmView_Principal.Usurios1Click(Sender: TObject);
begin
	FController.Cadastros.USUARIO;
end;

procedure TfrmView_Principal.FormCreate(Sender: TObject);
begin
  FController := TController.New;
  FController.LOGIN.InformaAcesso;
end;

procedure TfrmView_Principal.SpeedButton1Click(Sender: TObject);
begin
  ShowMessage('usuario');
end;

end.
