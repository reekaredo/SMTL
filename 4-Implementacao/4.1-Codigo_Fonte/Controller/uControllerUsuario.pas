unit uControllerUsuario;

interface
  uses uDaoUsuario, DB, sysutils, DBAccess, MyAccess, MemDS, uUsuario;
  type controllerUsuario = class

  private

  protected
    umDao : DaoUsuario;

  public
      constructor CrieObj;
      destructor destrua_se;

// ------------- MÉTODOS DE USUÁRIO ------------------
    function getDsUsuario : TMyDataSource;
    procedure carregaUsuario(pUsuario : Usuario);
    function salvaUsuario(pUsuario : Usuario) : string;
    function excluiUsuario(pUsuario : Usuario) : string;
    function pesquisaUsuario(chave : string) : string;
end;

implementation

{ controllerPais }

procedure controllerUsuario.carregaUsuario(pUsuario: Usuario);
begin
  umDao.carregaUsuario(pUsuario);
end;

constructor controllerUsuario.CrieObj;
begin
   umDao := DaoUsuario.CrieObjeto;
end;

destructor controllerUsuario.destrua_se;
begin
  umDao.destrua_se;
end;

function controllerUsuario.excluiUsuario(pUsuario: Usuario): string;
begin
   Result := umDao.ExcluiUsuario(pUsuario);
end;

function controllerUsuario.getDsUsuario: TMyDataSource;
begin
  Result := umDao.getDSUsuario;
end;

function controllerUsuario.pesquisaUsuario(chave: string): string;
var mSQL : string;
aux : integer;
begin
  if chave = '' then
    mSQL := 'select * from usuarios order by user_nome'
  else
    begin
        mSQL := 'select * from usuarios where user_nome like '
        + quotedstr('%' + chave + '%')
        + ' or user_funcionario like ' + quotedstr('%' + chave + '%') + ' order by user_nome';
    end;
      aux := umDao.sqlUsuario(mSQL);
      if aux = 0 then
        begin
          Result := 'NADA';
        end;
end;

function controllerUsuario.salvaUsuario(pUsuario: Usuario): string;
begin
   Result := umDao.SalvarUsuario(pUsuario);
end;

end.
