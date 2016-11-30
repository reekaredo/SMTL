unit uControllerFluxo;

interface
  uses uDaoFluxo, DB, sysutils, DBAccess, MyAccess, MemDS;

  type controllerFluxo = class

  private

  protected
    umDao : DaoFluxo;

  public
      constructor CrieObj;
      destructor destrua_se;

    function getDSFluxo : TMyDataSource;
    function SalvarFluxo(tipo: string; pValor : real) : string;
end;

implementation

{ controllerFluxo }

constructor controllerFluxo.CrieObj;
begin
   umdao := DaoFluxo.CrieObjeto;
end;

destructor controllerFluxo.destrua_se;
begin
   umdao.destrua_se;
end;

function controllerFluxo.getDSFluxo: TMyDataSource;
begin
    result := umdao.getDSFluxo;
end;

function controllerFluxo.SalvarFluxo(tipo: string; pValor: real): string;
begin
   Result := umdao.SalvarFluxo(tipo, pvalor);
end;

end.
