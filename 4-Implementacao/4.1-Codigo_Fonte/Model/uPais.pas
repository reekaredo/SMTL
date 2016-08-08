unit uPais;
//classe pais

interface
uses uPai;
  type pais = class(pai)

  private

  protected
    Nomepais  : string[80];
    DDI   : string[5];
    Sigla : string[3];
  public
    constructor crieobj;
    destructor destrua_se;
    procedure setPais (pPais  : string);
    procedure setDDI  (pDDI   : string);
    procedure setSigla(pSigla : string);
    function getPais  : string;
    function getDDI   : string;
    function getSigla : string;
    function fornecaClone : pais;
end;

implementation

{ pais }

constructor Pais.crieobj;
begin
  Nomepais := '';
  DDI := '';
  Sigla := '';
  inherited;
end;

destructor Pais.destrua_se;
begin
  inherited;
end;

function Pais.fornecaClone: Pais;
begin
  Result := Pais.crieObj;
  Result.codigo := codigo;
  Result.Nomepais  := NomePais;
  Result.DDI   := DDI;
  Result.Sigla := Sigla;
end;

function Pais.getDDI: string;
begin
  Result := DDI;
end;

function Pais.getPais: string;
begin
  Result := NomePais;
end;

function Pais.getSigla: string;
begin
  Result := Sigla;
end;

procedure Pais.setDDI(pDDI: string);
begin
  DDI := pDDI;
end;

procedure Pais.setPais(pPais: string);
begin
  NomePais := pPais;
end;

procedure Pais.setSigla(pSigla: string);
begin
  Sigla := pSigla;
end;


end.


