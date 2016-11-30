unit uForma;

interface
uses uPai;
  type Forma = class(pai)

  private

  protected
    Nome  : string[80];
    saldo: real;

  public
    constructor crieobj;
    destructor destrua_se;
  
    procedure setNome(pNome : string);
    function getNome  : string;

    procedure setSaldo (pSaldo: real);
    function getSaldo: real;

end;

implementation

{ Forma }

constructor Forma.crieobj;
begin
    self.Nome := '';
    inherited;
end;

destructor Forma.destrua_se;
begin
    inherited;
end;

function Forma.getNome: string;
begin
    Result := self.Nome;
end;

function Forma.getSaldo: real;
begin
   result := self.saldo;
end;

procedure Forma.setNome(pNome: string);
begin
   self.Nome := pNome;
end;

procedure Forma.setSaldo(pSaldo: real);
begin
   self.saldo := pSaldo;
end;

end.
