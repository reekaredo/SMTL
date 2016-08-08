unit uControllerPais;

interface
  uses uDaoPais, DB, sysutils, DBAccess, MyAccess, MemDS, uPais;
  type controllerPais = class

  private

  protected
    umDao : DaoPais;

  public
      constructor CrieObj;
      destructor destrua_se;

// ------------- MÉTODOS DE PAÍS ------------------
    function getDsPais : TMyDataSource;
    procedure carregaPais(pPais : Pais);
    function salvaPais(pPais : Pais) : string;
    function excluiPais(pPais : Pais) : string;
    function pesquisaPais(chave : string) : string;
    function pesquisaDependencia(chave : integer) : string;

end;

implementation

{ controllerPais }

constructor controllerPais.CrieObj;
begin
   umDao := DaoPais.CrieObjeto;
end;

destructor controllerPais.destrua_se;
begin
  umDao.destrua_se;
end;

function controllerPais.getDsPais: TMyDataSource;
begin
  Result := umDao.getDSPais;
end;

procedure controllerPais.carregaPais(pPais : Pais);
begin
  umDao.carregaPais(pPais);
end;

function controllerPais.excluiPais(pPais: Pais): string;
begin
  result := umDao.ExcluiPais(pPais);
end;

function controllerPais.pesquisaPais(chave: string) : string;
var mSQL : string;
aux : integer;
begin
  if chave = '' then
    mSQL := 'select * from paises order by pais_nome'
  else
    begin
        mSQL := 'select * from paises where pais_nome like ' + quotedstr('%' + chave + '%') + ' order by pais_nome';
    end;
      aux := umDao.sqlPais(mSQL);
      if aux = 0 then
        begin
          Result := 'NADA';
        end;
end;

function controllerPais.salvaPais(pPais : Pais) : string;
begin
  Result := umDao.SalvarPais(pPais);
end;

function controllerPais.pesquisaDependencia(chave: integer): string;
var mSQL, id : string;
aux : integer;
begin
  id := IntToStr(chave);
  mSQL := 'select * from estados where est_pais like ' + id;
    aux := umDao.sqlDependencia(mSQL);
    if aux = 0 then
        Result := 'OK'
    else
        Result := 'NO';
end;

end.
