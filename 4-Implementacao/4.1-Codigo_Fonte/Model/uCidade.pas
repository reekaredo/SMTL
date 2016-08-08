unit uCidade;
//classe cidade
interface
uses uPai, uEstado;
  type Cidade = class(pai)

  private

  protected
    NomeCidade   : string[50];
    DDD      : string[3];
    umEstado : Estado;
  public
    constructor crieobj;
    destructor destrua_se;
    procedure setCidade  (pCidade   : string);
    procedure setDDD     (pDDD      : string);
    procedure setumEstado(pUmEstado : estado);
    function getCidade   : string;
    function getDDD      : string;
    function getUmEstado : estado;
    function fornecaClone : cidade;
end;

implementation

{ cidade }

constructor Cidade.crieobj;
begin
  NomeCidade := ' ';
  DDD := '';
  umEstado := Estado.crieobj;
  inherited;
end;

destructor Cidade.destrua_se;
begin
  umEstado.destrua_se;
  inherited;
end;

function Cidade.fornecaClone: Cidade;
begin
  Result := Cidade.crieobj;
  Result.codigo := codigo;
  Result.NomeCidade := NomeCidade;
  Result.DDD := DDD;
  Result.umEstado := umEstado;
end;

function Cidade.getCidade: string;
begin
  Result := NomeCidade;
end;

function Cidade.getDDD: string;
begin
  Result := DDD;
end;

function Cidade.getUmEstado: Estado;
begin
  Result := umEstado;
end;

procedure Cidade.setCidade(pCidade: string);
begin
  NomeCidade := pCidade;
end;

procedure Cidade.setDDD(pDDD: string);
begin
  DDD := pDDD;
end;

procedure Cidade.setumEstado(pUmEstado: Estado);
begin
  umEstado := pUmEstado;
end;

end.


