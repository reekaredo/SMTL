unit uControllerCidade;

interface
  uses uDaoCidade, DB, sysutils, DBAccess, MyAccess, MemDS, uCidade;
  type controllerCidade = class

  private

  protected
    umDao : DaoCidade;

  public
      constructor CrieObj;
      destructor destrua_se;

// ------------- MÉTODOS DE CIDADE ------------------
    function getDsCidade : TMyDataSource;
    procedure carregaCidade (pCidade : Cidade);
    function salvaCidade (pCidade : Cidade) : string;
    function excluiCidade(pCidade : Cidade) : string;
    function pesquisaCidade(chave: string): string;
    function pesquisaDependencia(chave : integer) : string;        

end;
implementation

{ controllerCidade }

constructor controllerCidade.CrieObj;
begin
    umDao := DaoCidade.CrieObjeto;
end;

destructor controllerCidade.destrua_se;
begin
    umDao.destrua_se;
end;

procedure controllerCidade.carregaCidade(pCidade: Cidade);
begin
  umDao.carregaCidade (pCidade);
end;

function controllerCidade.excluiCidade(pCidade: Cidade): string;
begin
  Result := umDao.ExcluiCidade (pCidade);
end;

function controllerCidade.getDsCidade: TMyDataSource;
begin
   Result := umDao.getDSCidade;
end;

function controllerCidade.pesquisaCidade(chave: string): string;
var mSQL : string;
aux : integer;
begin
  if (chave = 'ORDENAR CODIGO CONTRARIO') then
    begin
      mSQL := 'select * from cidades order by cid_id desc'
    end
  else if (chave = 'ORDENAR CODIGO') then
    begin
      mSQL := 'select * from cidades order by cid_id'
    end
  else if (chave = 'ORDENAR NOME CONTRARIO') then
    begin
      mSQL := 'select * from cidades order by cid_nome desc'
    end
  else if chave = '' then
        mSQL := 'select * from cidades order by cid_nome'
  else
    begin
        mSQL := 'select * from cidades where cid_nome like ' + quotedstr('%' + chave + '%') + ' order by cid_nome';
    end;
      aux := umDao.sqlCidade(mSQL);
      if aux = 0 then
        begin
          Result := 'NADA';
        end;
end;

function controllerCidade.salvaCidade(pCidade: Cidade): string;
begin
   Result := umDao.salvarCidade(pCidade);
end;

function controllerCidade.pesquisaDependencia(chave: integer): string;
var mSQL, id : string;
aux : integer;
label Encerra;
begin
  id := IntToStr(chave);

  // pesquisa na tabela clientes - tipo 1 de pesquisa
      mSQL := 'select * from clientes where cli_cidade like ' + id;
        aux := umDao.sqlDependencia(mSQL,1);
        if aux = 0 then
            Result := 'OK'
        else
          begin
            Result := 'CLIENTE';
            goto Encerra;
          end;

   // pesquisa na tabela fornecedores
      mSQL := 'select * from fornecedores where for_cidade like ' + id;
        aux := umDao.sqlDependencia(mSQL,2);
        if aux = 0 then
            Result := 'OK'
        else
          begin
            Result := 'FORNECEDOR';
            goto Encerra;
          end;

  // pesquisa na tabela funcionários
      mSQL := 'select * from funcionarios where func_cidade like ' + id;
        aux := umDao.sqlDependencia(mSQL,3);
        if aux = 0 then
            Result := 'OK'
        else
          begin
            Result := 'FUNCIONARIO';
            goto Encerra;
          end;

  // pesquisa na tabela transportadoras
      mSQL := 'select * from transportadoras where transp_cidade like ' + id;
        aux := umDao.sqlDependencia(mSQL,4);
        if aux = 0 then
            Result := 'OK'
        else
          begin
            Result := 'TRANSP';
            goto Encerra;
          end;              

  Encerra:
end;

end.
