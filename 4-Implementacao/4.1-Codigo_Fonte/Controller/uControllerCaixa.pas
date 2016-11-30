unit uControllerCaixa;

interface
  uses uDaoCaixa, DB, sysutils, DBAccess, MyAccess, MemDS;

  type controllerCaixa = class

  private

  protected
    umDao : DaoCaixa;

  public
      constructor CrieObj;
      destructor destrua_se;

// ------------- MÉTODOS DE CAIXA ------------------
    function getDSCaixa : TMyDataSource;
    function SalvarCaixa(pValor : real; tipo: integer) : string;
    function FecharCaixa : string;
    function carregarCaixa: real;
    function PesquisaCaixaAberto: boolean;
    procedure movimentarCaixa(pValor: real; pTipo: integer);
end;

implementation

{ controllerCaixa }

function controllerCaixa.carregarCaixa: real;
begin
    Result := umdao.carregarCaixa;
end;

constructor controllerCaixa.CrieObj;
begin
   umdao := DaoCaixa.CrieObjeto;
end;

destructor controllerCaixa.destrua_se;
begin
  umdao.destrua_se;
end;

function controllerCaixa.FecharCaixa: string;
begin
   result := umDao.FecharCaixa;
end;

function controllerCaixa.getDSCaixa: TMyDataSource;
begin
  result := umdao.getDSCaixa;
end;

procedure controllerCaixa.movimentarCaixa(pValor: real; pTipo: integer);
begin
   umdao.movimentarCaixa(pValor,pTipo);
end;

function controllerCaixa.PesquisaCaixaAberto: boolean;
begin
    result := umDao.pesquisaCaixaAberto;
end;

function controllerCaixa.SalvarCaixa(pValor: real; tipo: integer): string;
begin
   result := umdao.SalvarCaixa(pValor,tipo);
end;

end.
