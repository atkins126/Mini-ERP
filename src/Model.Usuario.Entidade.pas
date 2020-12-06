unit Model.Usuario.Entidade;

interface

type
	TUSUARIO = class
  private
    FNOME: string;
    FCODIGO: Integer;
    FSENHA: string;
    FLOGIN: string;
    FEMAIL: string;
    FSTATUS: Integer;
    FDATA_NASCIMENTO: TDateTime;
  public
    property CODIGO : Integer read FCODIGO write FCODIGO;
    property NOME : string read FNOME write FNOME;
    property LOGIN : string read FLOGIN write FLOGIN;
    property SENHA : string read FSENHA write FSENHA;
    property STATUS : Integer read FSTATUS write FSTATUS;
    property EMAIL : string read FEMAIL write FEMAIL;
    property DATA_NASCIMENTO : TDateTime read FDATA_NASCIMENTO write FDATA_NASCIMENTO;
  end;

implementation

end.
