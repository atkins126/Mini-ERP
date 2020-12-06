unit View.Usuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, View.BaseGrid, DB, ActnList, ImgList, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, JvExDBGrids, JvDBGrid, ExtCtrls, Mask, JvExMask,
  JvToolEdit, Model.Usuario.Entidade;

type
  TfrmView_Usuario = class(TfrmBaseGrid)
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtNOME: TEdit;
    edtEMAIL: TEdit;
    Label3: TLabel;
    edtSENHA: TEdit;
    Label4: TLabel;
    edtLOGIN: TEdit;
    rdgSTATUS: TRadioGroup;
    edtDATA_NASCIMENTO: TJvDateEdit;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure acSalvarExecute(Sender: TObject);
    procedure acAlterarExecute(Sender: TObject);
    procedure acVisualizarExecute(Sender: TObject);
    procedure acNovoExecute(Sender: TObject);
    procedure acExcluirExecute(Sender: TObject);
  private
  	FId: Integer;
    { Private declarations }
    procedure _BindObjetctToForm(AObject: TUSUARIO);
    procedure _BindFormToObjetct(AObject: TUSUARIO);
    procedure _ClearForm;
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

procedure TfrmView_Usuario.acSalvarExecute(Sender: TObject);
begin
  case Status of
    stEditar: begin
      _BindFormToObjetct(FParent.USUARIOS.DAO._This);
    	FParent.USUARIOS.DAO.Update();
    end;
    stNovo: begin
  		_BindFormToObjetct(FParent.USUARIOS.DAO._This);
      FParent.USUARIOS.DAO.Insert();
    end;
    stExcluir: begin
      _BindFormToObjetct(FParent.USUARIOS.DAO._NewThis);
    	FParent.USUARIOS.DAO.Delete(FId);
    end;
  else
  	raise Exception.Create('Não é necessário salvar os dados');
  end;

  FParent.USUARIOS.DAO.Find();
  inherited;
end;

procedure TfrmView_Usuario.acAlterarExecute(Sender: TObject);
begin
  _BindObjetctToForm(FParent.USUARIOS.DAO._This);
  inherited;
end;

procedure TfrmView_Usuario._BindObjetctToForm(AObject: TUSUARIO);
begin
	FId											:= AObject.CODIGO;
	edtNOME.Text 						:= AObject.NOME;
  edtLOGIN.Text 					:= AObject.LOGIN;
  edtSENHA.Text 					:= AObject.SENHA;
  rdgSTATUS.ItemIndex 		:= AObject.STATUS;
  edtEMAIL.Text 					:= AObject.EMAIL;
  edtDATA_NASCIMENTO.Date := AObject.DATA_NASCIMENTO;
end;

procedure TfrmView_Usuario.acVisualizarExecute(Sender: TObject);
begin
	_BindObjetctToForm(FParent.USUARIOS.DAO._This);
  inherited;
end;

procedure TfrmView_Usuario._BindFormToObjetct(AObject: TUSUARIO);
begin
	AObject.CODIGO 				  := FId;
  AObject.NOME 						:= edtNOME.Text;
  AObject.LOGIN 					:= edtLOGIN.Text;
  AObject.SENHA 				  := edtSENHA.Text;
  AObject.STATUS 					:= rdgSTATUS.ItemIndex;
  AObject.EMAIL 				  := edtEMAIL.Text;
  AObject.DATA_NASCIMENTO := edtDATA_NASCIMENTO.Date;
end;

procedure TfrmView_Usuario._ClearForm;
begin
  FId	:= -1;
	edtNOME.Clear;
  edtLOGIN.Clear;
  edtSENHA.Clear;
  rdgSTATUS.ItemIndex := 0;
  edtEMAIL.Clear;
  edtDATA_NASCIMENTO.Clear;
end;

procedure TfrmView_Usuario.acNovoExecute(Sender: TObject);
begin
  _ClearForm;
  inherited;
end;

procedure TfrmView_Usuario.acExcluirExecute(Sender: TObject);
begin
	_BindObjetctToForm(FParent.USUARIOS.DAO._This);
  inherited;
end;

end.
