unit uControllerVenda;

interface
  uses uDaoVendA, DB, sysutils, DBAccess, MyAccess, MemDS, uVenda;
  type controllerVenda = class

  private

  protected
    umDao : DaoVenda;

  public
    constructor CrieObj;
    destructor destrua_se;


    function getDsVenda : TMyDataSource;
    procedure carregaVenda(pVenda : Venda);
    function salvaVenda(pVenda : Venda) : string;
    function excluiVenda(pVenda : Venda): string;
    function pesquisaVenda(chave : string) : string;
    function pesquisaDependencia(chave : integer) : string;
    function pesquisaSalvar(chave : string) : string;
    procedure carregaVendaPorCodigo(pCod: integer; pVenda: Venda);

end;

implementation

{ controllerVenda }

procedure controllerVenda.carregaVenda(pVenda: Venda);
begin
  umdao.carregaVenda(pVenda);
end;

procedure controllerVenda.carregaVendaPorCodigo(pCod: integer;
  pVenda: Venda);
begin
   umdao.carregaVendaPorCodigo(pCod,pVenda);
end;

constructor controllerVenda.CrieObj;
begin
    umdao := DaoVenda.CrieObjeto;
end;

destructor controllerVenda.destrua_se;
begin
   umdao.destrua_se;
end;

function controllerVenda.excluiVenda(pVenda: Venda): string;
begin
    result := umdao.ExcluiVenda(pVenda);
end;

function controllerVenda.getDsVenda: TMyDataSource;
begin
   result := umdao.getDSVenda;
end;

function controllerVenda.pesquisaDependencia(chave: integer): string;
begin

end;

function controllerVenda.pesquisaSalvar(chave: string): string;
var mSQL : string;
aux : integer;
begin
  // pesquisa na tabela vendas - tipo 1 de pesquisa  - número da venda
      mSQL := 'select * from vendas where venda_numeroNota = ' + chave;
        aux := umDao.sqlSalvar(mSQL,1);
        if aux = 0 then
            Result := 'OK'
        else
          begin
            Result := 'EXISTE';
           end;  
end;

function controllerVenda.pesquisaVenda(chave: string): string;
var mSQL : string;
aux : integer;
begin
  if chave = '' then
    mSQL := 'select * from vendas order by venda_numeroNota'
  else
    begin
        mSQL := 'select * from vendas where venda_numeroNota like '
        + quotedstr('%' + chave + '%')
        + ' or venda_dataEmissao like ' + quotedstr('%' + chave + '%')
        + ' or venda_dataChegada like ' + quotedstr('%' + chave + '%')
        + ' order by venda_numeroNota';
    end;
      aux := umDao.sqlVenda(mSQL);
      if aux = 0 then
        begin
          Result := 'NADA';
        end;
end;

function controllerVenda.salvaVenda(pVenda: Venda): string;
begin
   result := umdao.SalvarVenda(pVenda);
end;

end.
