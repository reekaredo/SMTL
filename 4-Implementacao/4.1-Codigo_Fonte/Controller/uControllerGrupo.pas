unit uControllerGrupo;

interface
  uses uDaoGrupo, DB, sysutils, DBAccess, MyAccess, MemDS, uDm, uGrupo;
  type controllerGrupo = class

  private

  protected
    umDao : DaoGrupo;

  public
      constructor CrieObj;
      destructor destrua_se;

// ------------- MÉTODOS DE GRUPO ------------------
    function getDsGrupo : TMyDataSource;
    procedure carregaGrupo(pGrupo : grupo);
    function salvaGrupo(pGrupo : grupo) : string;
    function excluiGrupo(pGrupo : grupo) : string;
    function pesquisaGrupo(chave : string) : string;
    function trazSQLGrupo : TMyQuery;
    function getDmGrupo :  TDataModule1;
    function pesquisaDependencia(chave : integer) : string;    
end;

implementation

{ controllerGrupo }

procedure controllerGrupo.carregaGrupo(pGrupo: grupo);
begin
  umDao.carregaGrupo(pGrupo);
end;

constructor controllerGrupo.CrieObj;
begin
  umDao := DaoGrupo.CrieObjeto;
end;

destructor controllerGrupo.destrua_se;
begin
  umDao.destrua_se;
end;

function controllerGrupo.excluiGrupo(pGrupo: grupo): string;
begin
 Result := umDao.ExcluiGrupo(pGrupo);
end;



function controllerGrupo.getDmGrupo: TDataModule1;
begin
    Result := umdao.getDmGrupo;
end;

function controllerGrupo.getDsGrupo: TMyDataSource;
begin
  Result := umDao.getDSGrupo;
end;

function controllerGrupo.pesquisaDependencia(chave: integer): string;
var mSQL, id : string;
aux : integer;
begin
  id := IntToStr(chave);
  mSQL := 'select * from produtos where pro_grupo like ' + id;
    aux := umDao.sqlDependencia(mSQL);
    if aux = 0 then
        Result := 'OK'
    else
        Result := 'NO';
end;

function controllerGrupo.pesquisaGrupo(chave: string): string;
var mSQL : string;
aux : integer;
begin
  if chave = '' then
    mSQL := 'select * from grupos order by grupo_nome'
  else
    begin
        mSQL := 'select * from grupos where grupo_nome like ' + quotedstr('%' + chave + '%') + ' order by grupo_nome';
    end;
      aux := umDao.sqlGrupo(mSQL);
      if aux = 0 then
        begin
          Result := 'NADA';
        end;
end;

function controllerGrupo.salvaGrupo(pGrupo: grupo): string;
begin
  Result := umDao.SalvarGrupo(pGrupo);
end;

function controllerGrupo.trazSQLGrupo: TMyQuery;
begin
    Result := umDao.trazSQLGrupo;
end;

end.
