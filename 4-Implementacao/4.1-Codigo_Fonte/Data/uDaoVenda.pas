unit uDaoVenda;

interface
  uses Windows, Messages, SysUtils, DB, uDm, uDao, uVenda, DBAccess, MyAccess, MemDS, uItemVenda;

  type DaoVenda = class(Dao)

  private
    pItemVenda: ItemVenda;
  protected
  public
    constructor CrieObjeto;
    destructor destrua_se;

// ------------- MÉTODOS DE VENDA ------------------
    function getDSVenda : TMyDataSource;
    procedure carregaVenda(pVenda : Venda);
    function SalvarVenda(pVenda : Venda) : string;
    function ExcluiVenda(pVenda : Venda) : string;
    function sqlVenda(pSQL: string) : Integer;
    function sqlDependencia(pSQL: string; tipo: Integer) : Integer;
    function sqlSalvar(pSQL: string; tipo: Integer) : Integer;
    procedure carregaVendaPorCodigo(pCod: integer; pVenda: Venda);     
end;

implementation

{ DaoVenda }

constructor DaoVenda.CrieObjeto;
begin
    pItemVenda := ItemVenda.crieobj;
    inherited;
end;

destructor DaoVenda.destrua_se;
begin
  pItemVenda.destrua_se;
end;

procedure DaoVenda.carregaVenda(pVenda: Venda);
var nome, cid, num, cod: string;
tam, k: integer;
begin
  if not umDM.SQL_vendas.Active then
    begin
      umDM.SQL_vendas.Open;
    end;

    pVenda.setNumNota(umdm.SQL_vendasvenda_numeroNota.value);
    pVenda.setSerieNota(umdm.SQL_vendasvenda_serieNota.Value);
    pVenda.setTipoNota(umdm.SQL_vendasvenda_tipoNota.value);
    pVenda.setDataEmissao(umdm.SQL_vendasvenda_dataEmissao.value);
    pVenda.setDatasaida(umdm.SQL_vendasvenda_dataChegada.value);
    pVenda.setBaseICMS(umdm.SQL_vendasvenda_baseCalculoICMS.value);
    pVenda.setValorICMS(umdm.SQL_vendasvenda_valorICMS.value);
    pVenda.setBaseICMSSubst(umdm.SQL_vendasvenda_baseCalculoICMSsubst.value);
    pVenda.setValorICMSSubst(umdm.SQL_vendasvenda_valorICMSsubst.value);
    pVenda.setValorTotalProdutos(umdm.SQL_vendasvenda_valorTotalProdutos.value);
    pVenda.setValorFrete(umdm.SQL_vendasvenda_valorFrete.value);
    pVenda.setValorSeguro(umdm.SQL_vendasvenda_valorSeguro.value);
    pVenda.setDesconto(umdm.SQL_vendasvenda_desconto.value);
    pVenda.setOutrasDespesas(umdm.SQL_vendasvenda_outrasDespAcessorias.value);
    pVenda.setValorTotalIPI(umdm.SQL_vendasvenda_valorTotalIPI.value);
    pVenda.setValorTotal(umdm.SQL_vendasvenda_valorTotal.value);
    pVenda.setQtde(umdm.SQL_vendasvenda_qtde.value);
    pVenda.setPlacaVeiculo(umdm.SQL_vendasvenda_placaVeiculo.value);
    pVenda.setUFveiculo(umdm.SQL_vendasvenda_ufVeiculo.value);
    pVenda.setEspecie(umdm.SQL_vendasvenda_especie.value);
    pVenda.setMarca(umdm.SQL_vendasvenda_marca.value);
    pVenda.setNumeracao(umdm.SQL_vendasvenda_numeracao.value);
    pVenda.setPesoBruto(umdm.SQL_vendasvenda_pesoBruto.value);
    pVenda.setPesoLiquido(umdm.SQL_vendasvenda_pesoLiquido.value);
    pVenda.setFretePorConta(umdm.SQL_vendasvenda_fretePorconta.value);
    pVenda.setCategoria(umdm.SQL_vendasvenda_categoria.value[1]);

    pVenda.getumcliente.setCodigo(umdm.SQL_vendasvenda_codCliente.Value);
    //resgatar outros dados cliente
    nome := inttostr(umdm.SQL_vendasvenda_codCliente.Value);

    umDM.SQL_cliente.Active := False;
    umDM.SQL_cliente.SQL.Text := 'select * from clientes where cli_id = ' + nome;
    if not umDM.SQL_cliente.Active then
      umDM.SQL_cliente.Open;

    pVenda.getumcliente.setNome(umdm.strngfldSQL_clientecli_nome.Value);
    pVenda.getumcliente.setCPF(umdm.strngfldSQL_clientecli_cpf.Value);

    umDM.SQL_cliente.Active := False;
    umDM.SQL_cliente.SQL.Text := 'select * from clientes';
    if not umDM.SQL_cliente.Active then
      umDM.SQL_cliente.Open;


      // ------------------------------

    pVenda.getUmaTransportadora.setCodigo(umdm.SQL_vendasvenda_codTransportadora.value);
    //resgatar outros dados transportadora
    nome:= inttostr(umdm.SQL_vendasvenda_codTransportadora.value);

    umDM.SQL_transportadora.Active := False;
    umDM.SQL_transportadora.SQL.Text := 'select * from transportadoras where transp_id = ' + nome;
    if not umDM.SQL_transportadora.Active then
      umDM.SQL_transportadora.Open;

    pVenda.getUmaTransportadora.setNome(umdm.SQL_transportadoratransp_nome.value);
    pVenda.getUmaTransportadora.setAntt(umdm.SQL_transportadoratransp_antt.value);
    pVenda.getUmaTransportadora.setCNPJ(umdm.SQL_transportadoratransp_cnpj.value);
    pVenda.getUmaTransportadora.setPlaca(umdm.SQL_transportadoratransp_placa.value);
    pVenda.getUmaTransportadora.setUFveiculo(umdm.SQL_transportadoratransp_ufVeiculo.value);
    pVenda.getUmaTransportadora.setEndereco(umdm.SQL_transportadoratransp_endereco.value);
    pVenda.getUmaTransportadora.getUmaCidade.setCodigo(umdm.SQL_transportadoratransp_cidade.value);
    cid := inttostr(umdm.SQL_transportadoratransp_cidade.value);

                umDM.SQL_cidade.Active := False;
                umDM.SQL_cidade.SQL.Text := 'select * from cidades where cid_id = ' + cid;
                if not umDM.SQL_cidade.Active then
                  umDM.SQL_cidade.Open;

    pVenda.getUmaTransportadora.getUmaCidade.setCidade(umdm.strngfldSQL_cidadecid_nome.value);

                umDM.SQL_cidade.Active := False;
                umDM.SQL_cidade.SQL.Text := 'select * from cidades';
                if not umDM.SQL_cidade.Active then
                  umDM.SQL_cidade.Open;

    pVenda.getUmaTransportadora.setUF(umdm.SQL_transportadoratransp_uf.value);
    pVenda.getUmaTransportadora.setInscEst(umdm.SQL_transportadoratransp_insc.value);

    umDM.SQL_transportadora.Active := False;
    umDM.SQL_transportadora.SQL.Text := 'select * from transportadoras';
    if not umDM.SQL_transportadora.Active then
      umDM.SQL_transportadora.Open;

      //-----------------------

    pVenda.getUmacondicao.setCodigo(umdm.SQL_vendasvenda_condPgto.value);
    //resgatar outros dados condição pagamento
    nome := inttostr(umdm.SQL_vendasvenda_condPgto.value);

    umDM.SQL_condicoes.Active := False;
    umDM.SQL_condicoes.SQL.Text := 'select * from condicoes where cond_id = ' + nome;
    if not umDM.SQL_condicoes.Active then
      umDM.SQL_condicoes.Open;

    pVenda.getUmacondicao.setNome(umdm.strngfldSQL_condicoescond_nome.value);

    umDM.SQL_condicoes.Active := False;
    umDM.SQL_condicoes.SQL.Text := 'select * from condicoes';
    if not umDM.SQL_condicoes.Active then
      umDM.SQL_condicoes.Open;

      //------------------------
// resgatar dados de veículo

    pVenda.getUmVeiculo.setCodigo(umdm.SQL_vendasvenda_veiculo.Value);
//resgatar outros dados veículo pelo código
    nome := inttostr(umdm.SQL_vendasvenda_veiculo.Value);

    umDM.SQL_veiculo.Active := False;
    umDM.SQL_veiculo.SQL.Text := 'select * from veiculos where veiculo_id = ' + nome;
    if not umDM.SQL_veiculo.Active then
      umDM.SQL_veiculo.Open;

    pVenda.getUmVeiculo.setPlaca(umdm.SQL_veiculoveiculo_placa.Value);
    pVenda.getUmVeiculo.setDescricao(umdm.SQL_veiculoveiculo_descricao.Value);
    pVenda.getUmaTransportadora.getUmVeiculo.setCodigo(umdm.SQL_comprascompra_veiculo.Value);
    pVenda.getUmaTransportadora.getUmVeiculo.setPlaca(umdm.SQL_veiculoveiculo_placa.Value);
    pVenda.getUmaTransportadora.getUmVeiculo.setDescricao(umdm.SQL_veiculoveiculo_descricao.Value);

    pVenda.getUmVeiculo.getumEstado.setCodigo(umdm.SQL_veiculoveiculo_uf.Value);

    umDM.SQL_veiculo.Active := False;
    umDM.SQL_veiculo.SQL.Text := 'select * from veiculos';
    if not umDM.SQL_veiculo.Active then
      umDM.SQL_veiculo.Open;

//pegar uf do estado do veículo
    nome := inttostr(pvenda.getumVeiculo.getumEstado.getCodigo);

    umDM.SQL_estado.Active := False;
    umDM.SQL_estado.SQL.Text := 'select * from estados where est_id = ' + nome;
    if not umDM.SQL_estado.Active then
      umDM.SQL_estado.Open;

    pVenda.getUmVeiculo.getumEstado.setUF(umdm.strngfldSQL_estadoest_uf.Value);
    pVenda.getUmaTransportadora.getUmVeiculo.getumEstado.setUF(umdm.strngfldSQL_estadoest_uf.Value);

    umDM.SQL_estado.Active := False;
    umDM.SQL_estado.SQL.Text := 'select * from estados';
    if not umDM.SQL_estado.Active then
      umDM.SQL_estado.Open;

// ------------------------------ carregar itens da venda
  cod := inttostr(umdm.SQL_vendasvenda_numeroNota.value);

  umDM.SQL_itensvenda.Active := False;
  umDM.SQL_itensvenda.SQL.Text := 'select * from itensvenda where itemV_codVenda like ' + cod;
    if not umDM.SQL_itensvenda.Active then
      umDM.SQL_itensvenda.Open;

  tam := umDM.SQL_itensvenda.RecordCount;
  For k:= 1 to tam  do
      begin
       pItemVenda := ItemVenda.crieobj;
          pItemVenda.setCodProduto(umdm.SQL_itensvendaitemV_codProduto.Value);
          pItemVenda.setCodVenda(umdm.SQL_itensvendaitemV_codVenda.value);
          pItemVenda.setNumero(umdm.SQL_itensvendaitemV_numero.value);
          pItemVenda.setNome(umdm.SQL_itensvendaitemV_nome.Value);
          pItemVenda.setValorUnitario(umdm.SQL_itensvendaitemV_valorUnitario.value);
          pItemVenda.setCST(umdm.SQL_itensvendaitemV_ncm.value);
          pItemVenda.setNCM(umdm.SQL_itensvendaitemV_ncm.value);
          pItemVenda.setUnidade(umdm.SQL_itensvendaitemV_unidade.value);
          pItemVenda.setCFOP(umdm.SQL_itensvendaitemV_cfop.value);
          pItemVenda.setQtde(umdm.SQL_itensvendaitemV_qtde.value);
          pItemVenda.setVTotal(umdm.SQL_itensvendaitemV_vTotal.value);
          pItemVenda.setBaseICMS(umdm.SQL_itensvendaitemV_baseICMS.value);
          pItemVenda.setValorICMS(umdm.SQL_itensvendaitemV_valorICMS.value);
          pItemVenda.setValorIPI(umdm.SQL_itensvendaitemV_valorIPI.value);
          pItemVenda.setAliqICMS(umdm.SQL_itensvendaitemV_aliqICMS.value);
          pItemVenda.setAliqIPI(umdm.SQL_itensvendaitemV_aliqIPI.value);

          pvenda.getListaProdutos.inserefim(pItemVenda);
          umdm.SQL_itensvenda.Next;
      end;     
end;

function DaoVenda.ExcluiVenda(pVenda: Venda): string;
var inteiro1: string;
begin
  if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

      if not umDM.SQL_vendas.Active then
        begin
          umDM.SQL_vendas.Open;
        end;

      inteiro1 := inttostr(pvenda.getNumNota);

      umdm.SQL_vendas.Active := false;
      umdm.SQL_vendas.SQL.Text := 'select * from vendas where venda_numeroNota like ' + inteiro1;
      if not umDM.SQL_vendas.Active then
          umDM.SQL_vendas.Open;

      umDM.SQL_vendas.Edit;

        try
            umDM.SQL_vendas.Delete;
            Result := 'OK';
        except
            Result := 'NO';
        end;

      umDM.SQL_vendas.Active := False;
      umDM.SQL_vendas.SQL.Text := 'select * from vendas';
        if not umDM.SQL_vendas.Active then
            umDM.SQL_vendas.Open;
end;

function DaoVenda.getDSVenda: TMyDataSource;
begin
    result := umdm.ds_vendas;
end;

function DaoVenda.SalvarVenda(pVenda: Venda): string;
var code1: string;
begin
  if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

      if not umDM.SQL_vendas.Active then
        begin
          umDM.SQL_vendas.Open;
        end;

      if pvenda.getNumNota = 0 then
        umDM.SQL_vendas.Insert
      else
       begin
         umDM.SQL_vendas.Active := false;
         umDM.SQL_vendas.sql.Text := 'select * from vendas where venda_numeroNota = '
         + inttostr(pvenda.getNumNota);
         umDM.SQL_vendas.Active := True;
         umDM.SQL_vendas.Edit;
       end;

      //umdm.SQL_vendasvenda_numeroNota.Value := pvenda.getNumNota;
      umdm.SQL_vendasvenda_codcliente.value := pvenda.getumCliente.getCodigo;
      umdm.SQL_vendasvenda_serieNota.value := pvenda.getSerieNota;
      umdm.SQL_vendasvenda_tipoNota.value := pvenda.getTipoNota;
      umdm.SQL_vendasvenda_codTransportadora.value := pvenda.getUmaTransportadora.getCodigo;
      umdm.SQL_vendasvenda_condPgto.value := pvenda.getUmaCondicao.getCodigo;
      umdm.SQL_vendasvenda_dataEmissao.value := pvenda.getdataEmissao;
      umdm.SQL_vendasvenda_dataChegada.value := pvenda.getDatasaida;
      umdm.SQL_vendasvenda_baseCalculoICMS.value:= pvenda.getBaseICMS;
      umdm.SQL_vendasvenda_valorICMS.value := pvenda.getValorICMS;
      umdm.SQL_vendasvenda_baseCalculoICMSsubst.value := pvenda.getBaseICMSsubst;
      umdm.SQL_vendasvenda_valorICMSsubst.value:= pvenda.getValorICMSSubst;
      umdm.SQL_vendasvenda_valorTotalProdutos.value := pvenda.getValorTotalProduos;
      umdm.SQL_vendasvenda_valorFrete.value := pvenda.getValorFrete;
      umdm.SQL_vendasvenda_valorSeguro.value := pvenda.getValorSeguro;
      umdm.SQL_vendasvenda_desconto.value := pvenda.getDesconto;
      umdm.SQL_vendasvenda_outrasDespAcessorias.value := pvenda.getOutrasDespesas;
      umdm.SQL_vendasvenda_valorTotalIPI.Value := pvenda.getValorTotalIPI;
      umdm.SQL_vendasvenda_valorTotal.value := pvenda.getValorTotal;
      umdm.SQL_vendasvenda_qtde.value := pvenda.getQtde;
      umdm.SQL_vendasvenda_placaVeiculo.value := '';
      umdm.SQL_vendasvenda_ufVeiculo.value := '';
      umdm.SQL_vendasvenda_especie.value := pvenda.getEspecie;
      umdm.SQL_vendasvenda_marca.value := pvenda.getMarca;
      umdm.SQL_vendasvenda_numeracao.value := pvenda.getNumeracao;
      umdm.SQL_vendasvenda_pesoBruto.value := pvenda.getPesoBruto;
      umdm.SQL_vendasvenda_pesoLiquido.value := pvenda.getPesoLiquido;
      umdm.SQL_vendasvenda_fretePorconta.value := pvenda.getFretePorConta;
      umdm.SQL_vendasvenda_categoria.Value := pVenda.getCategoria;
      umdm.SQL_vendasvenda_veiculo.Value := pvenda.getumaTransportadora.getumVeiculo.getCodigo;

      umDM.SQL_vendas.Post;
      Result := 'OK';
end;

function DaoVenda.sqlDependencia(pSQL: string; tipo: Integer): Integer;
begin

end;

function DaoVenda.sqlSalvar(pSQL: string; tipo: Integer): Integer;
begin
    //buscar nas vendas se há o código cadastrado
       begin
          umDM.SQL_vendas.Active := False;
          umDM.SQL_vendas.SQL.Text := pSQL;
            if not umDM.SQL_vendas.Active then
              umDM.SQL_vendas.Open;

          if umDM.SQL_vendas.RecordCount = 0 then
            result :=  0
          else
            result := 1;

          umdm.SQL_vendas.Active := false;
          umDM.SQL_vendas.SQL.Text := 'select * from vendas';
            if not umDM.SQL_vendas.Active then
              umDM.SQL_vendas.Open;
       end;
end;

function DaoVenda.sqlVenda(pSQL: string): Integer;
begin
  umDM.SQL_vendas.Active := False;
  umDM.SQL_vendas.SQL.Text := pSQL;
    if not umDM.SQL_vendas.Active then
      umDM.SQL_vendas.Open;

  if umDM.SQL_vendas.RecordCount = 0 then
    result :=  0
  else
    result := umDM.SQL_vendas.RecordCount;
end;

procedure DaoVenda.carregaVendaPorCodigo(pCod: integer; pVenda: Venda);
begin
  umdm.SQL_vendas.Active := false;
  umdm.SQL_vendas.SQL.Text := 'select * from vendas where venda_numeroNota = ' + inttostr(pCod);

  self.carregaVenda(pVenda);

          umdm.SQL_vendas.Active := false;
          umDM.SQL_vendas.SQL.Text := 'select * from vendas';
            if not umDM.SQL_vendas.Active then
              umDM.SQL_vendas.Open;
end;

end.
