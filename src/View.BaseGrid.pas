unit View.BaseGrid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ActnList, ImgList, ExtCtrls, ComCtrls, Grids, DBGrids,
  DB, JvExDBGrids, JvDBGrid, JvToolEdit, StdCtrls,

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
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DataSource1StateChange(Sender: TObject);
  private
    { Private declarations }
    FStatus: TState;
    procedure _DisabledComponentsForm(AOption: Boolean);
    procedure _DataSetIsEmpty();
  protected
  	FParent: iController;
  public
    { Public declarations }
    class function New(AParent: iController) : TfrmBaseGrid;
    procedure Controller(AController: iController);
    property Status: TState read FStatus write FStatus;
  end;

var
  frmBaseGrid: TfrmBaseGrid;

implementation


{$R *.dfm}

procedure TfrmBaseGrid.acVisualizarExecute(Sender: TObject);
begin
  // visualizar
  _DataSetIsEmpty;
  Status := stVisualizar;
end;

procedure TfrmBaseGrid.acNovoExecute(Sender: TObject);
begin
  // inserir
  Status := stNovo;
end;

procedure TfrmBaseGrid.acAlterarExecute(Sender: TObject);
begin
  // alterar
  _DataSetIsEmpty;
  Status := stEditar;
end;

procedure TfrmBaseGrid.acExcluirExecute(Sender: TObject);
begin
  // excluir
  _DataSetIsEmpty;
  Status := stExcluir;
end;

procedure TfrmBaseGrid.acImprimirExecute(Sender: TObject);
begin
  _DataSetIsEmpty;
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
	Status := stGrid;
end;

procedure TfrmBaseGrid.FormShow(Sender: TObject);
begin
	PageControl1.ActivePage := TabSheet1;
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

  _DisabledComponentsForm(Status in [stEditar, stNovo]);

  acVisualizar.Enabled := Status in [stGrid];
  acNovo.Enabled := Status in [stGrid];
  acAlterar.Enabled := Status in [stGrid];
  acExcluir.Enabled := Status in [stGrid];
  acImprimir.Enabled := Status in [stGrid];
  acSalvar.Enabled := (Status in [stEditar, stNovo, stExcluir]);
  acCancelar.Enabled := (Status in [stEditar, stNovo, stExcluir, stVisualizar]);
end;

procedure TfrmBaseGrid.JvDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (gdSelected in State) then
  begin
    (Sender as TDBGrid).Canvas.Brush.Color := clBlue;
    (Sender as TDBGrid).Canvas.FillRect(Rect);
    (Sender as TDBGrid).Canvas.Font.Color := clWhite;
    (Sender as TDBGrid).DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TfrmBaseGrid._DisabledComponentsForm(AOption: Boolean);
var
	I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
  begin
		if (Components[I] is TEdit) then
    	if TEdit(Components[I]).Name <> 'edtPesquisar' then
    		TEdit(Components[I]).Enabled := AOption;

    if (Components[I] is TRadioGroup) then
    	TRadioGroup(Components[I]).Enabled := AOption;

    if (Components[I] is TJvDateEdit) then
    	TJvDateEdit(Components[I]).Enabled := AOption;
  end;
end;

procedure TfrmBaseGrid.DataSource1StateChange(Sender: TObject);
begin
  case DataSource1.State of
    dsBrowse: StatusBar1.Panels[0].Text := ' Nº de registros encontrado(s): '+ IntToStr(DataSource1.DataSet.RecordCount);
    dsInactive: StatusBar1.Panels[0].Text := ' Nenhum registro encontrado.';
  else ;
  end;
end;

procedure TfrmBaseGrid._DataSetIsEmpty;
begin
	if (DataSource1.DataSet.IsEmpty) then
    raise Exception.Create('Não há registros cadastrados.');
end;

end.
