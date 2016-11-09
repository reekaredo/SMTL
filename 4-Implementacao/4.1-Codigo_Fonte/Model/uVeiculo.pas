unit uVeiculo;

interface
  uses uPai, uEstado;

  type Veiculo = class(Pai)

  private

  protected
    placa : string[20];
    umEstado: Estado;
    descricao: string[50];
  public
    constructor crieobj;
    destructor destrua_se;
    procedure setPlaca (pPlaca  : string);
    function getPlaca  : string;

    procedure setDescricao (pDescricao  : string);
    function getDescricao  : string;

    procedure setumEstado (pEstado  : estado);
    function getumEstado  : estado;

end;

implementation

{ Veiculo }

constructor Veiculo.crieobj;
begin
    inherited;
    self.umEstado := Estado.crieobj;
    self.placa := '';
    self.descricao := '';
end;

destructor Veiculo.destrua_se;
begin
   self.umEstado.destrua_se;
end;

function Veiculo.getDescricao: string;
begin
   result := self.descricao;
end;

function Veiculo.getPlaca: string;
begin
   result := self.placa;
end;

function Veiculo.getumEstado: estado;
begin
   result := self.umEstado;
end;

procedure Veiculo.setDescricao(pDescricao: string);
begin
 self.descricao := pDescricao;
end;

procedure Veiculo.setPlaca(pPlaca: string);
begin
  self.placa := pPlaca;
end;

procedure Veiculo.setumEstado(pEstado: estado);
begin
   self.umEstado := pEstado;
end;

end.
 