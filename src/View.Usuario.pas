unit View.Usuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, DB, ComCtrls, ExtCtrls,

  Controller.Interf,
  Controller;

type
  TfrmView_Usuario = class(TForm)
    btnFind: TBitBtn;
    btnINSERIR: TBitBtn;
    btnALTERAR: TBitBtn;
    btnDELETAR: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    edtFind: TEdit;
    Bevel1: TBevel;
    edtCODIGO: TEdit;
    edtNOME: TEdit;
    edtDATA_NASCIMENTO: TEdit;
    edtSENHA: TEdit;
    edtLOGIN: TEdit;
    edtSTATUS: TEdit;
    edtEMAIL: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    StatusBar1: TStatusBar;
    procedure btnFindClick(Sender: TObject);
    procedure btnINSERIRClick(Sender: TObject);
    procedure btnALTERARClick(Sender: TObject);
    procedure btnDELETARClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FController : iController;
  protected
    procedure Controller(const AController: iController);
  public
    { Public declarations }
    class function New(AController: iController): TfrmView_Usuario;
  end;

var
  frmView_Usuario: TfrmView_Usuario;

implementation

{$R *.dfm}

procedure TfrmView_Usuario.btnINSERIRClick(Sender: TObject);
begin
  // Inserir
  with FController.USUARIOS.DAO._NewThis do
  begin
  	CODIGO := edtCODIGO.Text;
	  NOME := edtNOME.Text;
  	LOGIN := edtLOGIN.Text;
  	SENHA := edtSENHA.Text;
  	STATUS := edtSTATUS.Text;
  	EMAIL := edtEMAIL.Text;
  	DATA_NASCIMENTO := StrToDate(edtDATA_NASCIMENTO.Text);
  end;
  FController.USUARIOS.DAO.Insert.Find;
end;

procedure TfrmView_Usuario.btnFindClick(Sender: TObject);
begin
  FController.USUARIOS.DAO.Find(edtFind.Text);
end;

procedure TfrmView_Usuario.btnALTERARClick(Sender: TObject);
begin
  // Alterar
  FController.USUARIOS.DAO._This.CODIGO := edtCODIGO.Text;
  FController.USUARIOS.DAO._This.NOME := edtNOME.Text;
  FController.USUARIOS.DAO._This.LOGIN := edtLOGIN.Text;
  FController.USUARIOS.DAO._This.SENHA := edtSENHA.Text;
  FController.USUARIOS.DAO._This.STATUS := edtSTATUS.Text;
  FController.USUARIOS.DAO._This.EMAIL := edtEMAIL.Text;
  FController.USUARIOS.DAO._This.DATA_NASCIMENTO := StrToDate(edtDATA_NASCIMENTO.Text);
  FController.USUARIOS.DAO.Update.Find;
end;

procedure TfrmView_Usuario.btnDELETARClick(Sender: TObject);
begin
  // Deletar
  FController.USUARIOS.DAO.Delete(edtCODIGO.Text).Find;
end;

class function TfrmView_Usuario.New(
  AController: iController): TfrmView_Usuario;
begin
  Result := Self.Create(nil);
  Result.Controller(AController);
end;

procedure TfrmView_Usuario.FormShow(Sender: TObject);
begin
  //  ReportMemoryLeaksOnShutdown := True;
  FController.USUARIOS.DAO.DataSource(DataSource1);
  FController.USUARIOS.DAO.Find;
end;

procedure TfrmView_Usuario.Controller(const AController: iController);
begin
	FController := AController;
end;

end.
