unit uDaoLogin;

interface
  uses Windows, Messages, SysUtils, DB, uDm, uDao, uUsuario, DBAccess, MyAccess, MemDS;
  
  type DaoLogin = class(Dao)

  private
  protected
  public
    umUsuario : Usuario;
    constructor CrieObjeto;
    destructor destrua_se; 
    function sqlUsuario(pSQL: string) : Integer;
    procedure carregaUsuario(pUsuario : Usuario);    

end;
implementation

{ DaoLogin }

procedure DaoLogin.carregaUsuario(pUsuario: Usuario);
begin
  if not umDM.SQL_usuario.Active then
    begin
      umDM.SQL_usuario.Open;
    end;

  pUsuario.setCodigo(umDM.intgrfldSQL_usuariouser_id.Value);
  pUsuario.setNome(umDM.strngfldSQL_usuariouser_nome.Value);
  pUsuario.setLogin(umDM.strngfldSQL_usuariouser_login.Value);
  pUsuario.setSenha(umDM.strngfldSQL_usuariouser_senha.Value);
  pUsuario.setTipo(umDM.intgrfldSQL_usuariouser_tipo.Value);
end;

constructor DaoLogin.CrieObjeto;
begin
    umUsuario := Usuario.crieobj;
   inherited;
end;

destructor DaoLogin.destrua_se;
begin
    umUsuario.destrua_se;
   inherited;
end;

function DaoLogin.sqlUsuario(pSQL: string): Integer;
begin
  umDM.SQL_usuario.Active := False;
  umDM.SQL_usuario.SQL.Text := pSQL;
    if not umDM.SQL_usuario.Active then
      umDM.SQL_usuario.Open;


  if umDM.SQL_usuario.RecordCount = 0 then
    result :=  0
  else
    begin
        result := 1;
        umUsuario.setTipo(umDM.intgrfldSQL_usuariouser_tipo.Value);
    end;
end;

end.
