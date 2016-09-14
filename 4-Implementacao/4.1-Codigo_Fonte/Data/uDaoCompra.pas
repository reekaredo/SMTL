unit uDaoCompra;

interface
  uses Windows, Messages, SysUtils, DB, uDm, uDao, uCompra, DBAccess, MyAccess, MemDS, uItemCompra;

  type DaoCompra = class(Dao)

  private
    pItemCompra: ItemCompra;
  protected
  public
    constructor CrieObjeto;
    destructor destrua_se;

// ------------- MÉTODOS DE CONDIÇÕES DE PGTO ------------------
    function getDSCompra : TMyDataSource;
    procedure carregaCompra(pCompra : Compra);
    function SalvarCompra(pCompra : Compra) : string;
    function ExcluiCompra(pCompra : Compra) : string;
    function sqlCompra(pSQL: string) : Integer;
    function sqlDependencia(pSQL: string; tipo: Integer) : Integer;
end;

implementation

{ DaoCompra }

constructor DaoCompra.CrieObjeto;
begin
    pItemCompra := ItemCompra.crieobj;
    inherited;
end;

destructor DaoCompra.destrua_se;
begin
   pItemCompra.destrua_se;
   inherited;
end;

procedure DaoCompra.carregaCompra(pCompra: Compra);
var nome, cid, num, cod: string;
tam, k: integer;
begin
  if not umDM.SQL_compras.Active then
    begin
      umDM.SQL_compras.Open;
    end;

    pcompra.setCodCompra(umdm.SQL_comprascompra_codCompra.value);
    pCompra.setNumNota(umdm.SQL_comprascompra_numeroNota.value);
    pCompra.setSerieNota(umdm.SQL_comprascompra_serieNota.value);
    pcompra.setTipoNota(umdm.SQL_comprascompra_tipoNota.value);
    pcompra.setDataEmissao(umdm.SQL_comprascompra_dataEmissao.value);
    pcompra.setDataChegada(umdm.SQL_comprascompra_dataChegada.value);
    pcompra.setBaseICMS(umdm.SQL_comprascompra_baseCalculoICMS.value);
    pcompra.setValorICMS(umdm.SQL_comprascompra_valorICMS.value);
    pcompra.setBaseICMSSubst(umdm.SQL_comprascompra_baseCalculoICMSsubst.value);
    pcompra.setValorICMSSubst(umdm.SQL_comprascompra_valorICMSsubst.value);
    pcompra.setValorTotalProdutos(umdm.SQL_comprascompra_valorTotalProdutos.value);
    pcompra.setValorFrete(umdm.SQL_comprascompra_valorFrete.value);
    pcompra.setValorSeguro(umdm.SQL_comprascompra_valorSeguro.value);
    pcompra.setDesconto(umdm.SQL_comprascompra_desconto.value);
    pcompra.setOutrasDespesas(umdm.SQL_comprascompra_outrasDespAcessorias.value);
    pcompra.setValorTotalIPI(umdm.SQL_comprascompra_valorTotalIPI.value);
    pcompra.setValorTotal(umdm.SQL_comprascompra_valorTotal.value);
    pcompra.setQtde(umdm.SQL_comprascompra_qtde.value);
    pcompra.setPlacaVeiculo(umdm.SQL_comprascompra_placaVeiculo.value);
    pcompra.setUFveiculo(umdm.SQL_comprascompra_ufVeiculo.value);
    pcompra.setEspecie(umdm.SQL_comprascompra_especie.value);
    pcompra.setMarca(umdm.SQL_comprascompra_marca.value);
    pcompra.setNumeracao(umdm.SQL_comprascompra_numeracao.value);
    pcompra.setPesoBruto(umdm.SQL_comprascompra_pesoBruto.value);
    pcompra.setPesoLiquido(umdm.SQL_comprascompra_pesoLiquido.value);
    pcompra.setFretePorConta(umdm.SQL_comprascompra_fretePorconta.value);

    pcompra.getUmfornecedor.setCodigo(umdm.SQL_comprascompra_codFornecedor.value);
    //resgatar outros dados fornecedor
    nome := inttostr(umdm.SQL_comprascompra_codFornecedor.value);

    umDM.SQL_fornecedor.Active := False;
    umDM.SQL_fornecedor.SQL.Text := 'select * from fornecedores where for_id = ' + nome;
    if not umDM.SQL_fornecedor.Active then
      umDM.SQL_fornecedor.Open;

    pcompra.getUmfornecedor.setNome(umdm.strngfldSQL_fornecedorfor_nome.value);
    pcompra.getUmfornecedor.setCNPJ(umdm.strngfldSQL_fornecedorfor_cnpj.value);
    pcompra.getUmfornecedor.setInscEst(umdm.strngfldSQL_fornecedorfor_inscEst.value);

    umDM.SQL_fornecedor.Active := False;
    umDM.SQL_fornecedor.SQL.Text := 'select * from fornecedores';
    if not umDM.SQL_fornecedor.Active then
      umDM.SQL_fornecedor.Open;


    pcompra.getUmaTransportadora.setCodigo(umdm.SQL_comprascompra_codTransportadora.value);
    //resgatar outros dados transportadora
    nome:= inttostr(umdm.SQL_comprascompra_codTransportadora.value);

    umDM.SQL_transportadora.Active := False;
    umDM.SQL_transportadora.SQL.Text := 'select * from transportadoras where transp_id = ' + nome;
    if not umDM.SQL_transportadora.Active then
      umDM.SQL_transportadora.Open;

    pcompra.getUmaTransportadora.setNome(umdm.SQL_transportadoratransp_nome.value);
    pcompra.getUmaTransportadora.setAntt(umdm.SQL_transportadoratransp_antt.value);
    pcompra.getUmaTransportadora.setCNPJ(umdm.SQL_transportadoratransp_cnpj.value);
    pcompra.getUmaTransportadora.setPlaca(umdm.SQL_transportadoratransp_placa.value);
    pcompra.getUmaTransportadora.setUFveiculo(umdm.SQL_transportadoratransp_ufVeiculo.value);
    pcompra.getUmaTransportadora.setEndereco(umdm.SQL_transportadoratransp_endereco.value);
    pcompra.getUmaTransportadora.getUmaCidade.setCodigo(umdm.SQL_transportadoratransp_cidade.value);
     cid := inttostr(umdm.SQL_transportadoratransp_cidade.value);

                umDM.SQL_cidade.Active := False;
                umDM.SQL_cidade.SQL.Text := 'select * from cidades where cid_id = ' + cid;
                if not umDM.SQL_cidade.Active then
                  umDM.SQL_cidade.Open;

    pcompra.getUmaTransportadora.getUmaCidade.setCidade(umdm.strngfldSQL_cidadecid_nome.value);

                umDM.SQL_cidade.Active := False;
                umDM.SQL_cidade.SQL.Text := 'select * from cidades';
                if not umDM.SQL_cidade.Active then
                  umDM.SQL_cidade.Open;

    pcompra.getUmaTransportadora.setUF(umdm.SQL_transportadoratransp_uf.value);
    pcompra.getUmaTransportadora.setInscEst(umdm.SQL_transportadoratransp_insc.value); 

    umDM.SQL_transportadora.Active := False;
    umDM.SQL_transportadora.SQL.Text := 'select * from transportadoras';
    if not umDM.SQL_transportadora.Active then
      umDM.SQL_transportadora.Open;
      

    pcompra.getUmacondicao.setCodigo(umdm.SQL_comprascompra_condPgto.value);
    //resgatar outros dados condição pagamento 
    nome := inttostr(umdm.SQL_comprascompra_condPgto.value);

    umDM.SQL_condicoes.Active := False;
    umDM.SQL_condicoes.SQL.Text := 'select * from condicoes where cond_id = ' + nome;
    if not umDM.SQL_condicoes.Active then
      umDM.SQL_condicoes.Open;

    pcompra.getUmacondicao.setNome(umdm.strngfldSQL_condicoescond_nome.value);

    umDM.SQL_condicoes.Active := False;
    umDM.SQL_condicoes.SQL.Text := 'select * from condicoes';
    if not umDM.SQL_condicoes.Active then
      umDM.SQL_condicoes.Open;

// ------------------------------ carregar itens da compra
  cod := inttostr(umdm.SQL_comprascompra_codCompra.value);

  umDM.SQL_itenscompra.Active := False;
  umDM.SQL_itenscompra.SQL.Text := 'select * from itenscompra where itemC_codCompra like ' + cod;
    if not umDM.SQL_itenscompra.Active then
      umDM.SQL_itenscompra.Open;

  tam := umDM.SQL_itenscompra.RecordCount;
  For k:= 1 to tam  do
      begin
       pItemCompra := ItemCompra.crieobj;
          pItemCompra.setCodProduto(umdm.SQL_itenscompraitemC_codProduto.value);
          pItemCompra.setCodCompra(umdm.SQL_itenscompraitemC_codCompra.value);
          pItemCompra.setNumero(umdm.SQL_itenscompraitemC_numero.value);
          pItemCompra.setNome(umdm.SQL_itenscompraitemC_nome.Value);
          pItemCompra.setValorUnitario(umdm.SQL_itenscompraitemC_valorUnitario.value);
          pItemCompra.setCST(umdm.SQL_itenscompraitemC_ncm.value);
          pItemCompra.setNCM(umdm.SQL_itenscompraitemC_ncm.value);
          pItemCompra.setUnidade(umdm.SQL_itenscompraitemC_unidade.value);
          pItemCompra.setCFOP(umdm.SQL_itenscompraitemC_cfop.value);
          pItemCompra.setQtde(umdm.SQL_itenscompraitemC_qtde.value);
          pItemCompra.setVTotal(umdm.SQL_itenscompraitemC_vTotal.value);
          pItemCompra.setBaseICMS(umdm.SQL_itenscompraitemC_baseICMS.value);
          pItemCompra.setValorICMS(umdm.SQL_itenscompraitemC_valorICMS.value);
          pItemCompra.setValorIPI(umdm.SQL_itenscompraitemC_valorIPI.value);
          pItemCompra.setAliqICMS(umdm.SQL_itenscompraitemC_aliqICMS.value);
          pItemCompra.setAliqIPI(umdm.SQL_itenscompraitemC_aliqIPI.value);

          pCompra.getListaProdutos.inserefim(pItemCompra);
          umdm.SQL_itenscompra.Next;
      end;
end;

function DaoCompra.ExcluiCompra(pCompra: Compra): string;
var inteiro1, inteiro2: string;
begin
  if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

      if not umDM.SQL_compras.Active then
        begin
          umDM.SQL_compras.Open;
        end;

      inteiro1 := inttostr(pCompra.getNumNota);
      inteiro2 := inttostr(pCompra.getumFornecedor.getCodigo);

      umdm.SQL_compras.Active := false;
      umdm.SQL_compras.SQL.Text := 'select * from compras where compra_numeroNota like ' + inteiro1 + ' and compra_codFornecedor like ' + inteiro2;
      if not umDM.SQL_compras.Active then
          umDM.SQL_compras.Open;

      umDM.SQL_compras.Edit;

        try
            umDM.SQL_compras.Delete;
            Result := 'OK';
        except
            Result := 'NO';
        end;

      umDM.SQL_compras.Active := False;
      umDM.SQL_compras.SQL.Text := 'select * from compras';
        if not umDM.SQL_compras.Active then
            umDM.SQL_compras.Open;
end;

function DaoCompra.getDSCompra: TMyDataSource;
begin
   result := umdm.ds_compras;
end;

function DaoCompra.SalvarCompra(pCompra: Compra): string;
var code1: string;
begin
  if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

      if not umDM.SQL_compras.Active then
        begin
          umDM.SQL_compras.Open;
        end;

      if pCompra.getCodCompra = 0 then
        umDM.SQL_compras.Insert
      else
         umDM.SQL_compras.Edit;

      umdm.SQL_comprascompra_numeroNota.Value := pCompra.getNumNota;
      umdm.SQL_comprascompra_codFornecedor.value := pcompra.getumfornecedor.getCodigo;
      umdm.SQL_comprascompra_serieNota.value := pcompra.getSerieNota;
      umdm.SQL_comprascompra_tipoNota.value := pCompra.getTipoNota;
      umdm.SQL_comprascompra_codTransportadora.value := pcompra.getUmaTransportadora.getCodigo;
      umdm.SQL_comprascompra_condPgto.value := pcompra.getUmaCondicao.getCodigo;
      umdm.SQL_comprascompra_dataEmissao.value := pcompra.getdataEmissao;
      umdm.SQL_comprascompra_dataChegada.value := pcompra.getDataChegada;
      umdm.SQL_comprascompra_baseCalculoICMS.value:= pcompra.getBaseICMS;
      umdm.SQL_comprascompra_valorICMS.value := pcompra.getValorICMS;
      umdm.SQL_comprascompra_baseCalculoICMSsubst.value := pcompra.getBaseICMSsubst;
      umdm.SQL_comprascompra_valorICMSsubst.value:= pcompra.getValorICMSSubst;
      umdm.SQL_comprascompra_valorTotalProdutos.value := pcompra.getValorTotalProduos;
      umdm.SQL_comprascompra_valorFrete.value := pcompra.getValorFrete;
      umdm.SQL_comprascompra_valorSeguro.value := pcompra.getValorSeguro;
      umdm.SQL_comprascompra_desconto.value := pcompra.getDesconto;
      umdm.SQL_comprascompra_outrasDespAcessorias.value := pcompra.getOutrasDespesas;
      umdm.SQL_comprascompra_valorTotalIPI.Value := pcompra.getValorTotalIPI;
      umdm.SQL_comprascompra_valorTotal.value := pcompra.getValorTotal;
      umdm.SQL_comprascompra_qtde.value := pcompra.getQtde;
      umdm.SQL_comprascompra_placaVeiculo.value := pcompra.getPlacaVeiculo;
      umdm.SQL_comprascompra_ufVeiculo.value := pcompra.getUFveiculo;
      umdm.SQL_comprascompra_especie.value := pcompra.getEspecie;
      umdm.SQL_comprascompra_marca.value := pcompra.getMarca;
      umdm.SQL_comprascompra_numeracao.value := pcompra.getNumeracao;
      umdm.SQL_comprascompra_pesoBruto.value := pcompra.getPesoBruto;
      umdm.SQL_comprascompra_pesoLiquido.value := pcompra.getPesoLiquido;
      umdm.SQL_comprascompra_fretePorconta.value := pcompra.getFretePorConta;

      code1 := inttostr(pcompra.getNumNota) + inttostr(pcompra.getumFornecedor.getCodigo);
      umdm.SQL_comprascompra_codCompra.Value := strtoint(code1);
      umDM.SQL_compras.Post;
      Result := 'OK';
end;

function DaoCompra.sqlCompra(pSQL: string): Integer;
begin
  umDM.SQL_compras.Active := False;
  umDM.SQL_compras.SQL.Text := pSQL;
    if not umDM.SQL_compras.Active then
      umDM.SQL_compras.Open;

  if umDM.SQL_compras.RecordCount = 0 then
    result :=  0
  else
    result := umDM.SQL_compras.RecordCount;
end;

function DaoCompra.sqlDependencia(pSQL: string; tipo: Integer): Integer;
begin

end;



end.
