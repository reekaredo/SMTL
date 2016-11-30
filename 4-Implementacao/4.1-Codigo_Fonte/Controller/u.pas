unit u;

interface
  uses uDaoContaReceber, DB, sysutils, DBAccess, MyAccess, MemDS, uContaReceber;
  type controllerContaReceber = class

  private

  protected
    umDao : DaoContaReceber;

  public
      constructor CrieObj;
      destructor destrua_se;

// ------------- M�TODOS DE CONTA A RECEBERC ------------------
    function getDsContaReceber : TMyDataSource;
    procedure carregaContaReceber (pContaReceber : ContaReceber);
    function salvaContaReceber (pContaReceber : ContaReceber) : string;
    function excluiContaReceber(pContaReceber : ContaReceber) : string;
    function excluirByIdVenda(id: integer): string;
    function pesquisaContaReceber(chave: string): string;
    function pesquisaDependencia(chave : integer) : string;
    function pesquisaSalvar(chave1: string; chave2: string) : string;

end;

implementation

{ controllerContaReceber }

constructor controllerContaReceber.CrieObj;
begin
   umdao := DaoContaReceber.CrieObjeto;
end;

destructor controllerContaReceber.destrua_se;
begin
  umdao.destrua_se;
end;

procedure controllerContaReceber.carregaContaReceber(pContaReceber: ContaReceber);
begin
   umdao.carregaContaReceber(pContaReceber);
end;

function controllerContaReceber.excluiContaReceber(
  pContaReceber: ContaReceber): string;
begin
    result := umdao.ExcluiContaReceber(pContaReceber);
end;

function controllerContaReceber.getDsContaReceber: TMyDataSource;
begin
  result := umdao.getDSContaReceber;
end;

function controllerContaReceber.pesquisaContaReceber(chave: string): string;
var mSQL : string;
aux : integer;
begin
  if (chave = 'ORDENAR CODIGO CONTRARIO') then
    begin
      mSQL := 'select * from contasreceber order by contaP_id desc'
    end
  else if (chave = 'ORDENAR CODIGO') then
    begin
      mSQL := 'select * from contasreceber order by contaP_id'
    end
  else if (chave = 'ORDENAR NOME CONTRARIO') then
    begin
      mSQL := 'select * from contasreceber order by contaP_Vencimento desc'
    end
  else if chave = '' then
        mSQL := 'select * from contasreceber order by contaP_Vencimento'
  else
    begin
        mSQL := 'select * from contasreceber where contaP_codFornecedor like '
        + quotedstr('%' + chave + '%')
        + ' or contaP_documento like ' + quotedstr('%' + chave + '%')
        + ' or contaP_vencimento like ' + quotedstr('%' + chave + '%')
        + ' order by contaP_id';
    end;
      aux := umDao.sqlContaReceber(mSQL);
      if aux = 0 then
        begin
          Result := 'NADA';
        end;
end;

function controllerContaReceber.pesquisaDependencia(chave: integer): string;
begin
  Result := 'OK';
end;

function controllerContaReceber.pesquisaSalvar(chave1: string; chave2: string): string;
var mSQL : string;  
aux : integer;
begin
  // pesquisa na tabela contas a receber se h� a conta cadastrada

      mSQL := 'select * from contasreceber where contaP_documento = '
      + quotedstr(chave1)
      + 'and contaP_vencimento = '
      + quotedstr(chave2);
        aux := umDao.sqlSalvar(mSQL,1);
        if aux = 0 then
            Result := 'OK'
        else
          begin
            Result := 'EXISTE';
           end;  
end;

function controllerContaReceber.salvaContaReceber(
  pContaReceber: ContaReceber): string;
begin
    result := umdao.SalvarContaReceber(pContaReceber);
end;

function controllerContaReceber.excluirByIdVenda(id: integer): string;
begin
   result := umdao.excluirByIdVenda(id);
end;

end.
