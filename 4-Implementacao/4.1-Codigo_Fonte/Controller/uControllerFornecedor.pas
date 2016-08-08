unit uControllerFornecedor;

interface
  uses uDaoFornecedor, DB, sysutils, DBAccess, MyAccess, MemDS, uFornecedor;
  type controllerFornecedor = class

  private

  protected
    umDao : DaoFornecedor;

  public
      constructor CrieObj;
      destructor destrua_se;

// ------------- MÉTODOS DE FORNECEDOR ----------------
    function getDsFornecedor : TMyDataSource;
    procedure carregaFornecedor (pFornecedor : fornecedor);
    function salvaFornecedor (pFornecedor : fornecedor) : string;
    function excluiFornecedor(pFornecedor : fornecedor) : string;
    function pesquisaFornecedor(chave: string): string;
    function pesquisaDependencia(chave : integer) : string;    

end;    

implementation

{ controllerFornecedor }

constructor controllerFornecedor.CrieObj;
begin
   umDao := DaoFornecedor.CrieObjeto;
end;

destructor controllerFornecedor.destrua_se;
begin
   umDao.destrua_se;
end;

procedure controllerFornecedor.carregaFornecedor(pFornecedor: fornecedor);
begin
   umDao.carregaFornecedor(pFornecedor);
end;

function controllerFornecedor.excluiFornecedor(
  pFornecedor: fornecedor): string;
begin
    Result := umDao.ExcluiFornecedor(pFornecedor);
end;

function controllerFornecedor.getDsFornecedor: TMyDataSource;
begin
    Result := umDao.getDSFornecedor;
end;

function controllerFornecedor.pesquisaFornecedor(chave: string): string;
var mSQL : string;
aux : integer;
begin
  if (chave = 'ORDENAR CODIGO CONTRARIO') then
    begin
      mSQL := 'select * from fornecedores order by for_id desc'
    end
  else if (chave = 'ORDENAR CODIGO') then
    begin
      mSQL := 'select * from fornecedores order by for_id'
    end
  else if (chave = 'ORDENAR REPRESENTANTE CONTRARIO') then
    begin
      mSQL := 'select * from fornecedores order by for_representante desc'
    end
  else if (chave = 'ORDENAR REPRESENTANTE') then
    begin
      mSQL := 'select * from fornecedores order by for_representante'
    end
  else if (chave = 'ORDENAR NOME CONTRARIO') then
    begin
      mSQL := 'select * from fornecedores order by FOR_nome desc'
    end
  else if chave = '' then
    mSQL := 'select * from fornecedores order by for_nome'
  else
    begin
        mSQL := 'select * from fornecedores where for_nome like '
        + quotedstr('%' + chave + '%')
        + ' or for_representante like ' + quotedstr('%' + chave + '%')
        + ' or for_telefone like ' + quotedstr('%' + chave + '%')
        + ' or for_nomeFantasia like ' + quotedstr('%' + chave + '%')
        + ' or for_cnpj like ' + quotedstr('%' + chave + '%')
        + ' order by for_nome';
    end;
      aux := umDao.sqlFornecedor(mSQL);
      if aux = 0 then
        begin
          Result := 'NADA';
        end;
end;

function controllerFornecedor.salvaFornecedor(
  pFornecedor: fornecedor): string;
begin
   Result := umDao.SalvarFornecedor(pFornecedor);
end;

function controllerFornecedor.pesquisaDependencia(chave: integer): string;
var mSQL, id : string;
aux : integer;
begin
  id := IntToStr(chave);
  mSQL := 'select * from produtos where pro_fornecedor like ' + id;
    aux := umDao.sqlDependencia(mSQL);
    if aux = 0 then
        Result := 'OK'
    else
        Result := 'NO';
end;

end.
