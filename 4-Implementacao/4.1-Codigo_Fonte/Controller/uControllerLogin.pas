unit uControllerLogin;

interface
  uses uDaoLogin, DB, sysutils, DBAccess, MyAccess, MemDS, uUsuario;
  type controllerLogin = class

  private

  protected
    umDao : DaoLogin;

  public
      constructor CrieObj;
      destructor destrua_se;

    function pesquisaUsuario(chave : string; senha: string) : string;
    procedure carregaUsuario(pUsuario : Usuario);    

end;      

implementation

{ controllerLogin }

procedure controllerLogin.carregaUsuario(pUsuario: Usuario);
begin
  umDao.carregaUsuario(pUsuario);
end;

constructor controllerLogin.CrieObj;
begin
   umDao := DaoLogin.CrieObjeto;
end;

destructor controllerLogin.destrua_se;
begin
   umDao.destrua_se;
end;

function controllerLogin.pesquisaUsuario(chave: string; senha: string): string;
var mSQL : string;
aux : integer;
begin
  if chave = '' then
    mSQL := 'select * from usuarios order by user_nome'
  else
    begin
        mSQL := 'select * from usuarios where user_login like ' + quotedstr(chave) + ' AND user_senha like ' + QuotedStr(senha);
    end;
      aux := umDao.sqlUsuario(mSQL);
      if aux = 0 then
        begin
          Result := 'NO'
        end;
      if aux = 1 then
        begin
            if umDao.umUsuario.getTipo = 1 then
              Result := 'ADMIN'
            else
              Result := 'NORMAL';
        end;
end;

end.
