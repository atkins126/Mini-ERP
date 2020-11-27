unit View.Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Model.Usuario.Entidade, Controller.Interf;

type
  TfrmLogin_View = class(TForm)
    Image1: TImage;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FUsuarios: TList;
    FController : iController;
    { Private declarations }
  public
    { Public declarations }
    function Controller(AValue: iController): TfrmLogin_View;
    property Usuarios : TList read FUsuarios write FUsuarios;
  end;

var
  frmLogin_View: TfrmLogin_View;

implementation

{$R *.dfm}

procedure TfrmLogin_View.Button1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmLogin_View.Button2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

function TfrmLogin_View.Controller(AValue: iController): TfrmLogin_View;
begin
	FController := AValue;
end;

procedure TfrmLogin_View.FormShow(Sender: TObject);
var
	I : Integer;
begin
	for I := 0 to FUsuarios.Count -1 do
  	ComboBox1.AddItem(
    	TUSUARIO(FUsuarios.Items[I]).LOGIN,
      TUSUARIO(FUsuarios.Items[I]));
end;

end.
