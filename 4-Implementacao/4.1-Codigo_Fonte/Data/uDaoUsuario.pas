unit uDaoUsuario;

interface
  uses Windows, Messages, SysUtils, DB, uDm, uDao,
  uUsuario, uFuncionario, DBAccess, MyAccess, MemDS;
  
  type DaoUsuario = class(Dao)

  private
  protected
  public
    constructor CrieObjeto;
    destructor destrua_se;

// ------------- MÉTODOS DE USUÁRIO ------------------
    function getDSUsuario : TMyDataSource;
    procedure carregaUsuario(pUsuario : Usuario);
    function SalvarUsuario(pUsuario : Usuario) : string;
    function ExcluiUsuario(pUsuario : Usuario) : string;
    function sqlUsuario(pSQL: string) : Integer;
end;

implementation

{ DaoUsuario }

procedure DaoUsuario.carregaUsuario(pUsuario: Usuario);
var inteiro : string;
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
  pUsuario.getFuncionario.setCodigo(umDM.intgrfldSQL_usuariouser_funcionario.Value);

  inteiro := IntToStr(umDM.intgrfldSQL_usuariouser_funcionario.Value);

    umDM.SQL_funcionario.Active := False;
    umDM.SQL_funcionario.SQL.Text := 'select * from funcionarios where func_id = ' + inteiro ;
    if not umDM.SQL_funcionario.Active then
      umDM.SQL_funcionario.Open;

  pUsuario.getFuncionario.setNome(umDM.strngfldSQL_funcionariofunc_nome.Value);

    umDM.SQL_funcionario.Active := False;
    umDM.SQL_funcionario.SQL.Text := 'select * from funcionarios';
    if not umDM.SQL_funcionario.Active then
      umDM.SQL_funcionario.Open;    
end;

constructor DaoUsuario.CrieObjeto;
begin
  inherited;
end;

destructor DaoUsuario.destrua_se;
begin
  inherited;
end;

function DaoUsuario.ExcluiUsuario(pUsuario: Usuario): string;
begin
  if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

      if not umDM.SQL_usuario.Active then
        begin
          umDM.SQL_usuario.Open;
        end;

      umDM.SQL_usuario.Edit;
      umDM.intgrfldSQL_usuariouser_id.Value := pUsuario.getCodigo;
        try
            umDM.SQL_usuario.Delete;
            Result := 'OK';
        except
            Result := 'NO';
        end;
end;

function DaoUsuario.getDSUsuario: TMyDataSource;
begin
   Result := umDM.ds_usuarios;
end;

function DaoUsuario.SalvarUsuario(pUsuario: Usuario): string;
begin
  if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

      if not umDM.SQL_usuario.Active then
        begin
          umDM.SQL_usuario.Open;
        end;

      if pUsuario.getCodigo = 0 then
        umDM.SQL_usuario.Insert
      else
         umDM.SQL_usuario.Edit;

      umDM.strngfldSQL_usuariouser_nome.Value := pUsuario.getNome;
      umDM.strngfldSQL_usuariouser_login.Value:= pUsuario.getLogin;
      umDM.strngfldSQL_usuariouser_senha.Value:= pUsuario.getSenha;
      umDM.intgrfldSQL_usuariouser_tipo.Value := pUsuario.getTipo;
      umDM.intgrfldSQL_usuariouser_funcionario.Value := pUsuario.getFuncionario.getCodigo;
      umDM.SQL_usuario.Post;

      Result := 'OK';
end;

function DaoUsuario.sqlUsuario(pSQL: string): Integer;
begin
  umDM.SQL_usuario.Active := False;
  umDM.SQL_usuario.SQL.Text := pSQL;
    if not umDM.SQL_usuario.Active then
      umDM.SQL_usuario.Open;

  if umDM.SQL_usuario.RecordCount = 0 then
    result :=  0
  else
    result := 1;
end;

end.
