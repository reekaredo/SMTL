unit uMarca;

interface
  uses uPai;

  type Marca = class(Pai)

  private

  protected
     nome : string[40];
  public
    constructor crieobj;
    destructor destrua_se;
    procedure setNome (pNome  : string);
    function getNome  : string;

end;

implementation

{ Marca }

constructor Marca.crieobj;
begin
    self.nome := '';
    inherited;
end;

destructor Marca.destrua_se;
begin
   inherited;
end;

function Marca.getNome: string;
begin
   Result := self.nome;
end;

procedure Marca.setNome(pNome: string);
begin
   self.nome := pNome;
end;

end.
