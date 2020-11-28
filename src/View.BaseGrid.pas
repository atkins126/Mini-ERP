unit View.BaseGrid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ActnList, ImgList, ExtCtrls, ComCtrls, Grids, DBGrids,
  DB, JvExDBGrids, JvDBGrid, StdCtrls,

  Controller.Interf;

type
	TState = (stGrid, stVisualizar, stEditar, stNovo, stExcluir);

  TfrmBaseGrid = class(TForm)
    ImageList1: TImageList;
    ActionList1: TActionList;
    acVisualizar: TAction;
    acNovo: TAction;
    acAlterar: TAction;
    acExcluir: TAction;
    acImprimir: TAction;
    acCancelar: TAction;
    acSalvar: TAction;
    Panel1: TPanel;
    SpeedButton7: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DataSource1: TDataSource;
    JvDBGrid1: TJvDBGrid;
    StatusBar1: TStatusBar;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    edtPesquisar: TEdit;
    BitBtn1: TBitBtn;
    procedure acVisualizarExecute(Sender: TObject);
    procedure acNovoExecute(Sender: TObject);
    procedure acAlterarExecute(Sender: TObject);
    procedure acExcluirExecute(Sender: TObject);
    procedure acImprimirExecute(Sender: TObject);
    procedure acCancelarExecute(Sender: TObject);
    procedure acSalvarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction;
      var Handled: Boolean);
  private
    FStatus: TState;
  protected
  	FParent: iController;
    { Private declarations }
    procedure Controller(AController: iController);
  public
    { Public declarations }
    class function New(AParent: iController) : TfrmBaseGrid;
    property Status: TState read FStatus write FStatus;
  end;

var
  frmBaseGrid: TfrmBaseGrid;

implementation


{$R *.dfm}

procedure TfrmBaseGrid.acVisualizarExecute(Sender: TObject);
begin
  // visualizar
  PageControl1.ActivePage := TabSheet2;
  Status := stVisualizar;
end;

procedure TfrmBaseGrid.acNovoExecute(Sender: TObject);
begin
  // inserir
  PageControl1.ActivePage := TabSheet2;
  Status := stNovo;
end;

procedure TfrmBaseGrid.acAlterarExecute(Sender: TObject);
begin
  // alterar
  Status := stEditar;
end;

procedure TfrmBaseGrid.acExcluirExecute(Sender: TObject);
begin
  // excluir
  Status := stVisualizar;
end;

procedure TfrmBaseGrid.acImprimirExecute(Sender: TObject);
begin
  // imprimir
end;

procedure TfrmBaseGrid.acCancelarExecute(Sender: TObject);
begin
  // cancelar
  Status := stGrid;
end;

procedure TfrmBaseGrid.acSalvarExecute(Sender: TObject);
begin
  // salvar
//  FParent.DAO.Insert;
	Status := stGrid;
end;

procedure TfrmBaseGrid.FormShow(Sender: TObject);
begin
	PageControl1.ActivePage := TabSheet1;
//  FParent.DataSet(DataSource1);
//  FParent.DAO.Find;
end;

class function TfrmBaseGrid.New(AParent: iController): TfrmBaseGrid;
begin
	Result := Self.Create(nil);
  Result.Controller(AParent)
end;

procedure TfrmBaseGrid.Controller(AController: iController);
begin
	FParent := AController;
end;

procedure TfrmBaseGrid.BitBtn1Click(Sender: TObject);
begin
  FParent.USUARIOS.DAO.Find(edtPesquisar.Text);
end;

procedure TfrmBaseGrid.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
begin
  case Status of
    stGrid: begin
    	Caption := 'Listagem de Dados';
    	PageControl1.ActivePage := TabSheet1;
    end;
    stVisualizar,
    stEditar,
    stNovo,
    stExcluir: begin

      case Status of
      	stVisualizar: Caption := 'Visualisando Dados';
        stEditar: Caption := 'Editando Dados';
        stNovo: Caption := 'Criando Dados';
        stExcluir: Caption := 'Excluindo dados';
      end;
      PageControl1.ActivePage := TabSheet2;
    end;
  else ;
  end;
end;

end.
