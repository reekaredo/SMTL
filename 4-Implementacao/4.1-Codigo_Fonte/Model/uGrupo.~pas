unit uGrupo;

interface
uses uPai;
  type Grupo = class(pai)

  private

  protected
    Nome  : string[80];
    
  public
    constructor crieobj;
    destructor destrua_se;

    function getNome: string;
    procedure setNome (pNome: string);
end;

implementation

{ Grupo }

constructor Grupo.crieobj;
begin
  Self.Nome := '';
  inherited;
end;

destructor Grupo.destrua_se;
begin
  inherited;
end;

function Grupo.getNome: string;
begin
  Result := self.Nome;
end;

procedure Grupo.setNome(pNome: string);
begin
  self.Nome := pNome;
end;

end.
