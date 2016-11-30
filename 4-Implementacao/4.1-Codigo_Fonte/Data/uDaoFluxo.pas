unit uDaoFluxo;

interface
  uses Windows, Messages, SysUtils, DB, uDm, uDao, DBAccess, MyAccess, MemDS;

  type DaoFluxo = class(Dao)

  private
  protected
  public
    constructor CrieObjeto;
    destructor destrua_se;

// ------------- MÉTODOS DE FLUXO ------------------
    function getDSFluxo : TMyDataSource;
    function SalvarFluxo(tipo: string; pValor : real) : string;
    function sqlFluxo(pSQL: string) : Integer;
    function sqlDependencia(pSQL: string; tipo: Integer) : Integer;
    function sqlSalvar(pSQL: string; tipo: Integer) : Integer;
end;

implementation

{ DaoFluxo }

constructor DaoFluxo.CrieObjeto;
begin
    inherited;
end;

destructor DaoFluxo.destrua_se;
begin
   inherited;
end;

function DaoFluxo.getDSFluxo: TMyDataSource;
begin
  Result := umdm.ds_fluxo;
end;

function DaoFluxo.SalvarFluxo(tipo: string; pValor: real): string;
begin
    if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

      if not umDM.SQL_fluxo.Active then
        begin
          umDM.SQL_fluxo.Open;
        end;

    umdm.SQL_fluxo.Insert;
    umdm.SQL_fluxofluxo_data.Value := Date;
    umdm.SQL_fluxofluxo_tipo.Value := tipo;
    umdm.SQL_fluxofluxo_valor.Value := pValor;
    umdm.SQL_fluxo.Post;
    Result := 'OK';
end;

function DaoFluxo.sqlDependencia(pSQL: string; tipo: Integer): Integer;
begin

end;

function DaoFluxo.sqlFluxo(pSQL: string): Integer;
begin

end;

function DaoFluxo.sqlSalvar(pSQL: string; tipo: Integer): Integer;
begin

end;

end.
