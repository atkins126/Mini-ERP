unit Model.Usuario.Entidade;

interface

type
	TUSUARIO = class
  private
    FNOME: string;
    FCODIGO: string;
    FSENHA: string;
    FLOGIN: string;
    FEMAIL: string;
    FSTATUS: string;
    FDATA_NASCIMENTO: TDateTime;
  public
    property CODIGO : string read FCODIGO write FCODIGO;
    property NOME : string read FNOME write FNOME;
    property LOGIN : string read FLOGIN write FLOGIN;
    property SENHA : string read FSENHA write FSENHA;
    property STATUS : string read FSTATUS write FSTATUS;
    property EMAIL : string read FEMAIL write FEMAIL;
    property DATA_NASCIMENTO : TDateTime read FDATA_NASCIMENTO write FDATA_NASCIMENTO;
  end;

implementation

end.
