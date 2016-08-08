unit uDaoFornecedor;

interface
  uses Windows, Messages, SysUtils, DB, uDm,uDao, uFornecedor, DBAccess, MyAccess, MemDS;

  type DaoFornecedor = class(Dao)

  private
  protected
  public
    constructor CrieObjeto;
    destructor destrua_se;

// ------------- MÉTODOS DE FORNECEDOR ----------------
    function getDSFornecedor :  TMyDataSource;
    procedure carregaFornecedor (pFornecedor : fornecedor);
    function SalvarFornecedor (pFornecedor : fornecedor) : string;
    function ExcluiFornecedor(pFornecedor : fornecedor) : string;
    function sqlFornecedor(pSQL: string) : Integer;
    function sqlDependencia(pSQL: string) : Integer;      

end;

implementation

{ DaoFornecedor }

constructor DaoFornecedor.CrieObjeto;
begin
   inherited;
end;

destructor DaoFornecedor.destrua_se;
begin
   inherited;
end;

//--------------- MÉTODOS DE FORNECEDOR--------------------
procedure DaoFornecedor.carregaFornecedor(pFornecedor: fornecedor);
var inteiro : string;
begin
    if not umDM.SQL_fornecedor.Active then
        umDM.SQL_fornecedor.Open;

    pFornecedor.setCodigo(umDM.intgrfldSQL_fornecedorfor_id.Value);
    pFornecedor.setNome(umDM.strngfldSQL_fornecedorfor_nome.Value);
    pFornecedor.setFone1(umDM.strngfldSQL_fornecedorfor_fone1.Value);
    pFornecedor.setFone2(umDM.strngfldSQL_fornecedorfor_fone2.Value);
    pFornecedor.setEmail(umDM.strngfldSQL_fornecedorfor_email.Value);
    pFornecedor.setRepresentante(umDM.strngfldSQL_fornecedorfor_representante.Value);
    pFornecedor.setFoneRepresentante(umDM.strngfldSQL_fornecedorfor_telefone.Value);
    pFornecedor.getUmaCidade.setCodigo(umDM.intgrfldSQL_fornecedorfor_cidade.Value);

    inteiro :=  InttoStr(umDM.intgrfldSQL_fornecedorfor_cidade.Value);

    umDM.SQL_cidade.Active := False;
    umDM.SQL_cidade.SQL.Text := 'select * from cidades where cid_id = ' + inteiro ;
      if not umDM.SQL_cidade.Active then
        umDM.SQL_cidade.Open;

    pFornecedor.getUmaCidade.setCidade(umDM.strngfldSQL_cidadecid_nome.Value);

    umDM.SQL_cidade.Active := False;
    umDM.SQL_cidade.SQL.Text := 'select * from cidades';
      if not umDM.SQL_cidade.Active then
        umDM.SQL_cidade.Open;

    pFornecedor.setnomeFantasia(umDM.strngfldSQL_fornecedorfor_nomeFantasia.Value);
    pFornecedor.setlogradouro(umDM.strngfldSQL_fornecedorfor_logradouro.Value);
    pFornecedor.setnumero(umDM.strngfldSQL_fornecedorfor_numero.Value);
    pFornecedor.setcomplemento(umDM.strngfldSQL_fornecedorfor_complemento.Value);
    pFornecedor.setbairro(umDM.strngfldSQL_fornecedorfor_bairro.Value);
    pFornecedor.setCEP(umDM.strngfldSQL_fornecedorfor_cep.Value);
    pFornecedor.setCNPJ(umDM.strngfldSQL_fornecedorfor_cnpj.Value);
    pFornecedor.setInscEst(umDM.strngfldSQL_fornecedorfor_inscEst.Value);
    pFornecedor.getCondicao.setCodigo(umDM.intgrfldSQL_fornecedorfor_condicao.Value);
    pFornecedor.setDataInclusao(umDM.dateSQL_fornecedorfor_dataCadastro.Value);
    pFornecedor.setDataAlteracao(umDM.dateSQL_fornecedorfor_dataAlteracao.Value);

    inteiro :=  InttoStr(umDM.intgrfldSQL_fornecedorfor_condicao.Value);

    umDM.SQL_condicoes.Active := False;
    umDM.SQL_condicoes.SQL.Text := 'select * from condicoes where cond_id = ' + inteiro ;
      if not umDM.SQL_condicoes.Active then
        umDM.SQL_condicoes.Open;

    pFornecedor.getCondicao.setNome(umDM.strngfldSQL_condicoescond_nome.Value);

    umDM.SQL_condicoes.Active := False;
    umDM.SQL_condicoes.SQL.Text := 'select * from condicoes';
      if not umDM.SQL_condicoes.Active then
        umDM.SQL_condicoes.Open;

end;

function DaoFornecedor.ExcluiFornecedor(pFornecedor: fornecedor): string;
begin
   if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

      if not umDM.SQL_fornecedor.Active then
        begin
          umDM.SQL_fornecedor.Open;
        end;

      umDM.SQL_fornecedor.Edit;
      umDM.intgrfldSQL_fornecedorfor_id.Value := pFornecedor.getCodigo;
       Try
          umDM.SQL_fornecedor.Delete;
          Result := 'OK';
       except
          Result := 'NO';
       end;
end;

function DaoFornecedor.getDSFornecedor: TMyDataSource;
begin
    Result := umDM.ds_fornecedores;
end;

function DaoFornecedor.SalvarFornecedor(pFornecedor: fornecedor): string;
begin
     if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

     if not umDM.SQL_fornecedor.Active then
        begin
          umDM.SQL_fornecedor.Open;
        end;

      if pFornecedor.getCodigo = 0 then
        umDM.SQL_fornecedor.Insert
      else
         umDM.SQL_fornecedor.Edit;

    umDM.strngfldSQL_fornecedorfor_nome.Value  := pFornecedor.getNome;
    umDM.strngfldSQL_fornecedorfor_fone1.Value := pFornecedor.getFone1;
    umDM.strngfldSQL_fornecedorfor_fone2.Value := pFornecedor.getFone2;
    umDM.strngfldSQL_fornecedorfor_email.Value := pFornecedor.getEmail;
    umDM.strngfldSQL_fornecedorfor_representante.Value := pFornecedor.getRepresentante;
    umDM.strngfldSQL_fornecedorfor_telefone.Value := pFornecedor.getFoneRepresentante;
    umDM.intgrfldSQL_fornecedorfor_cidade.Value:= pFornecedor.getUmaCidade.getCodigo;

    umDM.strngfldSQL_fornecedorfor_nomeFantasia.Value := pFornecedor.getnomeFantasia;
    umDM.strngfldSQL_fornecedorfor_logradouro.Value  := pFornecedor.getlogradouro;
    umDM.strngfldSQL_fornecedorfor_numero.Value := pFornecedor.getnumero;
    umDM.strngfldSQL_fornecedorfor_complemento.Value := pFornecedor.getcomplemento;
    umDM.strngfldSQL_fornecedorfor_bairro.Value := pFornecedor.getbairro;
    umDM.strngfldSQL_fornecedorfor_cep.Value := pFornecedor.getCEP;
    umDM.strngfldSQL_fornecedorfor_cnpj.Value := pFornecedor.getCNPJ;
    umDM.strngfldSQL_fornecedorfor_inscEst.Value  := pFornecedor.getInscEst;
    umDM.intgrfldSQL_fornecedorfor_condicao.Value := pFornecedor.getCondicao.getCodigo;
    umDM.dateSQL_fornecedorfor_dataCadastro.Value  := pFornecedor.getDataInclusao;
    umDM.dateSQL_fornecedorfor_dataAlteracao.Value := pFornecedor.getDataAlteracao;

    umDM.SQL_fornecedor.Post;
    Result := 'OK';
end;

function DaoFornecedor.sqlFornecedor(pSQL: string): Integer;
begin
   umDM.SQL_fornecedor.Active := False;
   umDM.SQL_fornecedor.SQL.Text := pSQL;
    if not umDM.SQL_fornecedor.Active then
      umDM.SQL_fornecedor.Open;

  if umDM.SQL_fornecedor.RecordCount = 0 then
    result :=  0
  else
    result := 1;
end;

function DaoFornecedor.sqlDependencia(pSQL: string): Integer;
begin
  umDM.SQL_produto.Active := False;
  umDM.SQL_produto.SQL.Text := pSQL;
    if not umDM.SQL_produto.Active then
      umDM.SQL_produto.Open;

  if umDM.SQL_produto.RecordCount = 0 then
    result :=  0
  else
    result := 1;
end;

end.
