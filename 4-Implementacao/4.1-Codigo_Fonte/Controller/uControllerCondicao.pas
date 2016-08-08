unit uControllerCondicao;

interface
  uses uDaoCondicao, DB, sysutils, DBAccess, MyAccess, MemDS, uCondicao;
  type controllerCondicao = class

  private

  protected
    umDao : DaoCondicao;

  public
    constructor CrieObj;
    destructor destrua_se;

// ------------- MÉTODOS DE CONDIÇÃO DE PGTO ------------------
    function getDsCondicao : TMyDataSource;
    procedure carregaCondicao(pCondicao : Condicao);
    function salvaCondicao(pCondicao : Condicao) : string;
    function excluiCondicao(pCondicao : Condicao): string;
    function pesquisaCondicao(chave : string) : string;
    function pesquisaDependencia(chave : integer) : string;  

end;

implementation

{ controllerCondicao }

procedure controllerCondicao.carregaCondicao(pCondicao: Condicao);
begin
    umDao.carregaCondicao(pCondicao);
end;

constructor controllerCondicao.CrieObj;
begin
    umDao := DaoCondicao.CrieObjeto;
end;

destructor controllerCondicao.destrua_se;
begin
    umDao.destrua_se;
end;

function controllerCondicao.excluiCondicao(pCondicao: Condicao): string;
begin
   Result := umDao.ExcluiCondicao(pCondicao);
end;

function controllerCondicao.getDsCondicao: TMyDataSource;
begin
   Result := umDao.getDSCondicao;
end;

function controllerCondicao.pesquisaCondicao(chave: string): string;
var mSQL : string;
aux : integer;
begin
  if chave = '' then
    mSQL := 'select * from condicoes order by cond_nome'
  else
    begin
        mSQL := 'select * from condicoes where cond_nome like ' + quotedstr('%' + chave + '%') + ' order by cond_nome';
    end;
      aux := umDao.sqlCondicao(mSQL);
      if aux = 0 then
        begin
          Result := 'NADA';
        end;
end;

function controllerCondicao.pesquisaDependencia(chave: integer): string;
var mSQL, id : string;
aux : integer;
label Encerra;
begin
  id := IntToStr(chave);

  // pesquisa na tabela clientes - tipo 1 de pesquisa
      mSQL := 'select * from clientes where cli_condicao like ' + id;
        aux := umDao.sqlDependencia(mSQL,1);
        if aux = 0 then
            Result := 'OK'
        else
          begin
            Result := 'CLIENTE';
            goto Encerra;
          end;

   // pesquisa na tabela fornecedores
      mSQL := 'select * from fornecedores where for_condicao like ' + id;
        aux := umDao.sqlDependencia(mSQL,2);
        if aux = 0 then
            Result := 'OK'
        else
          begin
            Result := 'FORNECEDOR';
            goto Encerra;
          end;

  Encerra:
end;

function controllerCondicao.salvaCondicao(pCondicao: Condicao): string;
begin
   Result := umDao.SalvarCondicao(pCondicao);
end;

end.
