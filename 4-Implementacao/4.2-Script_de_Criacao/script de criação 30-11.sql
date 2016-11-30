CREATE DATABASE vendas;


CREATE TABLE caixa (
  caixa_data DATE NOT NULL,
  caixa_valorInicial DOUBLE(15, 2) DEFAULT NULL,
  caixa_valorFinal DOUBLE(15, 2) DEFAULT NULL,
  caixa_saldo DOUBLE(15, 2) DEFAULT NULL,
  PRIMARY KEY (caixa_data)
)


CREATE TABLE condicoes (
  cond_id INT(11) NOT NULL AUTO_INCREMENT,
  cond_nome VARCHAR(60) DEFAULT NULL,
  PRIMARY KEY (cond_id)
)

CREATE TABLE fluxo (
  fluxo_id INT(11) NOT NULL AUTO_INCREMENT,
  fluxo_data DATE DEFAULT NULL,
  fluxo_tipo VARCHAR(255) DEFAULT NULL,
  fluxo_valor DOUBLE(15, 2) DEFAULT NULL,
  PRIMARY KEY (fluxo_id)
)

CREATE TABLE forma (
  forma_id INT(11) NOT NULL AUTO_INCREMENT,
  forma_nome VARCHAR(30) DEFAULT NULL,
  forma_saldo DOUBLE(15, 2) DEFAULT NULL,
  PRIMARY KEY (forma_id)
)

CREATE TABLE grupos (
  grupo_id INT(11) NOT NULL AUTO_INCREMENT,
  grupo_nome VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (grupo_id)
)

CREATE TABLE marcas (
  marca_id INT(11) NOT NULL AUTO_INCREMENT,
  marca_nome VARCHAR(40) DEFAULT NULL,
  PRIMARY KEY (marca_id),
  UNIQUE INDEX marca_nome (marca_nome)
)

CREATE TABLE paises (
  pais_id INT(11) NOT NULL AUTO_INCREMENT,
  pais_nome VARCHAR(80) DEFAULT NULL,
  pais_ddi VARCHAR(5) DEFAULT NULL,
  pais_sigla VARCHAR(5) DEFAULT NULL,
  PRIMARY KEY (pais_id),
  INDEX pais_ddi (pais_ddi),
  UNIQUE INDEX pais_nome (pais_nome),
  INDEX pais_sigla (pais_sigla)
)

CREATE TABLE contaspagar (
  contaP_id INT(11) NOT NULL AUTO_INCREMENT,
  contaP_dataCadastro DATETIME DEFAULT NULL,
  contaP_codFornecedor INT(11) DEFAULT NULL,
  contaP_documento VARCHAR(100) DEFAULT NULL,
  contaP_vencimento DATETIME DEFAULT NULL,
  contaP_valor DOUBLE(15, 2) DEFAULT NULL,
  contaP_numeroParcela INT(11) DEFAULT NULL,
  contaP_juros DOUBLE(15, 2) DEFAULT NULL,
  contaP_observacao VARCHAR(255) DEFAULT NULL,
  contaP_status INT(11) DEFAULT NULL,
  contaP_dataPagamento DATETIME DEFAULT NULL,
  contaP_formaPagamento INT(11) DEFAULT NULL,
  contaP_codCompra INT(11) DEFAULT NULL,
  PRIMARY KEY (contaP_id),
  CONSTRAINT FK_contaspagar_forma_forma_id FOREIGN KEY (contaP_formaPagamento)
    REFERENCES forma(forma_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)

CREATE TABLE estados (
  est_id INT(11) NOT NULL AUTO_INCREMENT,
  est_nome VARCHAR(40) DEFAULT NULL,
  est_pais INT(11) DEFAULT NULL,
  est_uf VARCHAR(3) DEFAULT NULL,
  PRIMARY KEY (est_id),
  UNIQUE INDEX est_nome (est_nome),
  CONSTRAINT FK_estados_paises_pais_id FOREIGN KEY (est_pais)
    REFERENCES paises(pais_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)

CREATE TABLE parcelas (
  parc_condicao INT(11) NOT NULL,
  parc_numero INT(11) NOT NULL,
  parc_dias INT(11) NOT NULL,
  parc_percentual DOUBLE DEFAULT NULL,
  parc_forma INT(11) NOT NULL,
  parc_codigo VARCHAR(10) NOT NULL DEFAULT '',
  PRIMARY KEY (parc_condicao, parc_numero),
  CONSTRAINT FK_parcelas_forma_forma_id FOREIGN KEY (parc_forma)
    REFERENCES forma(forma_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)

CREATE TABLE cidades (
  cid_id INT(11) NOT NULL AUTO_INCREMENT,
  cid_nome VARCHAR(60) DEFAULT NULL,
  cid_estado INT(11) DEFAULT NULL,
  cid_ddd VARCHAR(5) DEFAULT NULL,
  PRIMARY KEY (cid_id),
  CONSTRAINT FK_cidades_estados_est_id FOREIGN KEY (cid_estado)
    REFERENCES estados(est_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)

CREATE TABLE veiculos (
  veiculo_id INT(11) NOT NULL AUTO_INCREMENT,
  veiculo_placa VARCHAR(20) DEFAULT NULL,
  veiculo_uf INT(11) NOT NULL,
  veiculo_descricao VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (veiculo_id),
  CONSTRAINT FK_veiculos_estados_est_id FOREIGN KEY (veiculo_uf)
    REFERENCES estados(est_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)

CREATE TABLE clientes (
  cli_id INT(11) NOT NULL AUTO_INCREMENT,
  cli_nome VARCHAR(70) NOT NULL,
  cli_telfixo VARCHAR(20) DEFAULT NULL,
  cli_cpf VARCHAR(15) DEFAULT NULL,
  cli_logradouro VARCHAR(80) DEFAULT NULL,
  cli_numero VARCHAR(15) DEFAULT NULL,
  cli_celular VARCHAR(20) DEFAULT NULL,
  cli_bairro VARCHAR(50) DEFAULT NULL,
  cli_cidade INT(11) DEFAULT NULL,
  cli_sexo VARCHAR(2) DEFAULT NULL,
  cli_dataI DATETIME DEFAULT NULL,
  cli_apelido VARCHAR(50) DEFAULT NULL,
  cli_tipo VARCHAR(10) DEFAULT NULL,
  cli_TelRecado VARCHAR(20) DEFAULT NULL,
  cli_complemento VARCHAR(50) DEFAULT NULL,
  cli_cep VARCHAR(15) DEFAULT NULL,
  cli_rg VARCHAR(20) DEFAULT NULL,
  cli_condicao INT(11) DEFAULT NULL,
  cli_DataAlteracao DATETIME DEFAULT NULL,
  PRIMARY KEY (cli_id),
  CONSTRAINT FK_clientes_cidades_cid_id FOREIGN KEY (cli_cidade)
    REFERENCES cidades(cid_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_clientes_condicoes_cond_id FOREIGN KEY (cli_condicao)
    REFERENCES condicoes(cond_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)

CREATE TABLE fornecedores (
  for_id INT(11) NOT NULL AUTO_INCREMENT,
  for_nome VARCHAR(40) DEFAULT NULL,
  for_fone1 VARCHAR(20) DEFAULT NULL,
  for_fone2 VARCHAR(20) DEFAULT NULL,
  for_email VARCHAR(100) DEFAULT NULL,
  for_cidade INT(11) DEFAULT NULL,
  for_representante VARCHAR(100) DEFAULT NULL,
  for_telefone VARCHAR(20) DEFAULT NULL,
  for_nomeFantasia VARCHAR(80) DEFAULT NULL,
  for_logradouro VARCHAR(80) DEFAULT NULL,
  for_numero VARCHAR(10) DEFAULT NULL,
  for_complemento VARCHAR(10) DEFAULT NULL,
  for_bairro VARCHAR(100) DEFAULT NULL,
  for_cep VARCHAR(20) DEFAULT NULL,
  for_cnpj VARCHAR(30) DEFAULT NULL,
  for_inscEst VARCHAR(50) DEFAULT NULL,
  for_condicao INT(11) DEFAULT NULL,
  for_dataCadastro DATETIME DEFAULT NULL,
  for_dataAlteracao DATETIME DEFAULT NULL,
  PRIMARY KEY (for_id),
  UNIQUE INDEX for_nome (for_nome),
  CONSTRAINT FK_fornecedores_cidades_cid_id FOREIGN KEY (for_cidade)
    REFERENCES cidades(cid_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_fornecedores_condicoes_cond_id FOREIGN KEY (for_condicao)
    REFERENCES condicoes(cond_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)

CREATE TABLE funcionarios (
  func_id INT(11) NOT NULL AUTO_INCREMENT,
  func_nome VARCHAR(60) DEFAULT NULL,
  func_cpf VARCHAR(20) DEFAULT NULL,
  func_sexo VARCHAR(1) DEFAULT NULL,
  func_telFixo VARCHAR(20) DEFAULT NULL,
  func_celular VARCHAR(20) DEFAULT NULL,
  func_logradouro VARCHAR(60) DEFAULT NULL,
  func_numero VARCHAR(5) DEFAULT NULL,
  func_bairro VARCHAR(60) DEFAULT NULL,
  func_cidade INT(11) DEFAULT NULL,
  func_cargo VARCHAR(20) DEFAULT NULL,
  func_salario DOUBLE(15, 2) DEFAULT 0.00,
  func_dataI DATETIME DEFAULT NULL,
  PRIMARY KEY (func_id),
  CONSTRAINT FK_funcionarios_cidades_cid_id FOREIGN KEY (func_cidade)
    REFERENCES cidades(cid_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)

CREATE TABLE transportadoras (
  transp_id INT(11) NOT NULL AUTO_INCREMENT,
  transp_nome VARCHAR(255) DEFAULT NULL,
  transp_antt VARCHAR(20) DEFAULT NULL,
  transp_cnpj VARCHAR(25) DEFAULT NULL,
  transp_endereco VARCHAR(100) DEFAULT NULL,
  transp_cidade INT(11) DEFAULT NULL,
  transp_insc VARCHAR(25) DEFAULT NULL,
  transp_placa VARCHAR(30) DEFAULT NULL,
  transp_ufVeiculo VARCHAR(5) DEFAULT NULL,
  transp_uf VARCHAR(5) DEFAULT NULL,
  transp_fone VARCHAR(55) DEFAULT NULL,
  transp_numero VARCHAR(5) DEFAULT NULL,
  transp_bairro VARCHAR(30) DEFAULT NULL,
  transp_veiculo INT(11) NOT NULL,
  PRIMARY KEY (transp_id),
  CONSTRAINT FK_transportadoras_cidades_cid_id FOREIGN KEY (transp_cidade)
    REFERENCES cidades(cid_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_transportadoras_veiculos_veiculo_id FOREIGN KEY (transp_veiculo)
    REFERENCES veiculos(veiculo_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)

CREATE TABLE compras (
  compra_numeroNota INT(11) NOT NULL,
  compra_codFornecedor INT(11) NOT NULL,
  compra_serieNota INT(11) NOT NULL,
  compra_tipoNota INT(11) DEFAULT 0,
  compra_condPgto INT(11) NOT NULL,
  compra_codTransportadora INT(11) NOT NULL,
  compra_dataEmissao DATETIME DEFAULT NULL,
  compra_dataChegada DATETIME DEFAULT NULL,
  compra_baseCalculoICMS DOUBLE(15, 2) DEFAULT NULL,
  compra_valorICMS DOUBLE(15, 2) DEFAULT NULL,
  compra_baseCalculoICMSsubst DOUBLE(15, 2) DEFAULT NULL,
  compra_valorICMSsubst DOUBLE(15, 2) DEFAULT NULL,
  compra_valorTotalProdutos DOUBLE(15, 2) DEFAULT NULL,
  compra_valorFrete DOUBLE(15, 2) DEFAULT NULL,
  compra_valorSeguro DOUBLE(15, 2) DEFAULT NULL,
  compra_desconto DOUBLE(15, 2) DEFAULT NULL,
  compra_outrasDespAcessorias DOUBLE(15, 2) DEFAULT NULL,
  compra_valorTotalIPI DOUBLE(15, 2) DEFAULT NULL,
  compra_valorTotal DOUBLE(15, 2) DEFAULT NULL,
  compra_qtde INT(11) DEFAULT NULL,
  compra_placaVeiculo VARCHAR(25) DEFAULT NULL,
  compra_ufVeiculo VARCHAR(5) DEFAULT NULL,
  compra_especie VARCHAR(100) DEFAULT NULL,
  compra_marca VARCHAR(25) DEFAULT NULL,
  compra_numeracao VARCHAR(25) DEFAULT NULL,
  compra_pesoBruto DOUBLE(15, 2) DEFAULT NULL,
  compra_pesoLiquido DOUBLE(15, 2) DEFAULT NULL,
  compra_fretePorconta VARCHAR(25) DEFAULT NULL,
  compra_codCompra INT(11) DEFAULT NULL,
  compra_veiculo INT(11) NOT NULL,
  PRIMARY KEY (compra_numeroNota, compra_codFornecedor),
  INDEX compra_codCompra (compra_codCompra),
  CONSTRAINT FK_compras_condicoes_cond_id FOREIGN KEY (compra_condPgto)
    REFERENCES condicoes(cond_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_compras_fornecedores_for_id FOREIGN KEY (compra_codFornecedor)
    REFERENCES fornecedores(for_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_compras_transportadoras_transp_id FOREIGN KEY (compra_codTransportadora)
    REFERENCES transportadoras(transp_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_compras_veiculos_veiculo_id FOREIGN KEY (compra_veiculo)
    REFERENCES veiculos(veiculo_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)

CREATE TABLE contasreceber (
  contaR_id INT(11) NOT NULL AUTO_INCREMENT,
  contaR_dataCadastro DATETIME DEFAULT NULL,
  contaR_codCliente INT(11) DEFAULT NULL,
  contaR_documento VARCHAR(100) DEFAULT NULL,
  contaR_vencimento DATETIME DEFAULT NULL,
  contaR_valor DOUBLE(15, 2) DEFAULT NULL,
  contaR_numeroParcela INT(11) DEFAULT NULL,
  contaR_juros DOUBLE(15, 2) DEFAULT NULL,
  contaR_observacao VARCHAR(255) DEFAULT NULL,
  contaR_status INT(11) DEFAULT NULL,
  contaR_dataPagamento DATETIME DEFAULT NULL,
  contaR_formaPagamento INT(11) DEFAULT NULL,
  contaR_codVenda INT(11) DEFAULT NULL,
  PRIMARY KEY (contaR_id),
  CONSTRAINT FK_contasreceber_clientes_for_id FOREIGN KEY (contaR_codCliente)
    REFERENCES clientes(cli_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_contasreceber_forma_forma_id FOREIGN KEY (contaR_formaPagamento)
    REFERENCES forma(forma_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)

CREATE TABLE produtos (
  pro_id INT(11) NOT NULL AUTO_INCREMENT,
  pro_nome VARCHAR(70) NOT NULL,
  pro_barra VARCHAR(13) DEFAULT NULL,
  pro_custo DOUBLE(15, 2) NOT NULL DEFAULT 0.00,
  pro_preco DOUBLE(15, 2) NOT NULL DEFAULT 0.00,
  pro_estoque INT(11) NOT NULL DEFAULT 0,
  pro_marca INT(11) DEFAULT NULL,
  pro_obs VARCHAR(255) DEFAULT NULL,
  pro_fornecedor INT(11) DEFAULT NULL,
  pro_grupo INT(11) DEFAULT NULL,
  pro_unidade INT(11) DEFAULT NULL,
  pro_referencia VARCHAR(50) DEFAULT NULL,
  pro_dataCadastro DATETIME DEFAULT NULL,
  pro_dataAlteracao DATETIME DEFAULT NULL,
  pro_dataUltimaCompra DATETIME DEFAULT NULL,
  pro_dataUltimaVenda DATETIME DEFAULT NULL,
  pro_PrecoMinimo DOUBLE(15, 2) DEFAULT 0.00,
  pro_Comissao DOUBLE(15, 2) DEFAULT 0.00,
  pro_NomeGrupo VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (pro_id),
  UNIQUE INDEX pro_referencia (pro_referencia),
  CONSTRAINT FK_produtos_fornecedores_for_id FOREIGN KEY (pro_fornecedor)
    REFERENCES fornecedores(for_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_produtos_grupos_grupo_id FOREIGN KEY (pro_grupo)
    REFERENCES grupos(grupo_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_produtos_marcas_marca_id FOREIGN KEY (pro_marca)
    REFERENCES marcas(marca_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)

CREATE TABLE usuarios (
  user_id INT(11) NOT NULL AUTO_INCREMENT,
  user_nome VARCHAR(30) DEFAULT NULL,
  user_login VARCHAR(30) DEFAULT NULL,
  user_senha VARCHAR(20) DEFAULT NULL,
  user_tipo INT(11) DEFAULT NULL,
  user_funcionario INT(11) DEFAULT NULL,
  PRIMARY KEY (user_id),
  CONSTRAINT FK_usuarios_funcionarios_func_id FOREIGN KEY (user_funcionario)
    REFERENCES funcionarios(func_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)

CREATE TABLE vendas (
  venda_numeroNota INT(11) NOT NULL AUTO_INCREMENT,
  venda_codCliente INT(11) NOT NULL,
  venda_serieNota INT(11) NOT NULL,
  venda_tipoNota INT(11) DEFAULT 0,
  venda_condPgto INT(11) NOT NULL,
  venda_codTransportadora INT(11) NOT NULL,
  venda_dataEmissao DATETIME DEFAULT NULL,
  venda_dataChegada DATETIME DEFAULT NULL,
  venda_baseCalculoICMS DOUBLE(15, 2) DEFAULT NULL,
  venda_valorICMS DOUBLE(15, 2) DEFAULT NULL,
  venda_baseCalculoICMSsubst DOUBLE(15, 2) DEFAULT NULL,
  venda_valorICMSsubst DOUBLE(15, 2) DEFAULT NULL,
  venda_valorTotalProdutos DOUBLE(15, 2) DEFAULT NULL,
  venda_valorFrete DOUBLE(15, 2) DEFAULT NULL,
  venda_valorSeguro DOUBLE(15, 2) DEFAULT NULL,
  venda_desconto DOUBLE(15, 2) DEFAULT NULL,
  venda_outrasDespAcessorias DOUBLE(15, 2) DEFAULT NULL,
  venda_valorTotalIPI DOUBLE(15, 2) DEFAULT NULL,
  venda_valorTotal DOUBLE(15, 2) DEFAULT NULL,
  venda_qtde INT(11) DEFAULT NULL,
  venda_placaVeiculo VARCHAR(25) DEFAULT NULL,
  venda_ufVeiculo VARCHAR(5) DEFAULT NULL,
  venda_especie VARCHAR(100) DEFAULT NULL,
  venda_marca VARCHAR(25) DEFAULT NULL,
  venda_numeracao VARCHAR(25) DEFAULT NULL,
  venda_pesoBruto DOUBLE(15, 2) DEFAULT NULL,
  venda_pesoLiquido DOUBLE(15, 2) DEFAULT NULL,
  venda_fretePorconta VARCHAR(25) DEFAULT NULL,
  venda_veiculo INT(11) NOT NULL,
  venda_categoria CHAR(20) DEFAULT NULL,
  UNIQUE INDEX venda_numeroNota (venda_numeroNota),
  CONSTRAINT FK_venda_clientes_cli_id FOREIGN KEY (venda_codCliente)
    REFERENCES clientes(cli_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_venda_condicoes_cond_id FOREIGN KEY (venda_condPgto)
    REFERENCES condicoes(cond_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_venda_transportadoras_transp_id FOREIGN KEY (venda_codTransportadora)
    REFERENCES transportadoras(transp_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_venda_veiculos_veiculo_id FOREIGN KEY (venda_veiculo)
    REFERENCES veiculos(veiculo_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)

CREATE TABLE imagens (
  cod_imagem INT(11) NOT NULL AUTO_INCREMENT,
  cod_produto INT(11) DEFAULT NULL,
  caminho_imagem VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (cod_imagem),
  CONSTRAINT FK_imagens_produtos_pro_id FOREIGN KEY (cod_produto)
    REFERENCES produtos(pro_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)

CREATE TABLE itenscompra (
  itemC_codProduto INT(11) DEFAULT NULL,
  itemC_codCompra INT(11) NOT NULL DEFAULT 0,
  itemC_numero INT(11) NOT NULL DEFAULT 0,
  itemC_nome VARCHAR(70) NOT NULL,
  itemC_valorUnitario DOUBLE(15, 2) DEFAULT 0.00,
  itemC_ncm VARCHAR(30) DEFAULT NULL,
  itemC_cst VARCHAR(10) DEFAULT NULL,
  itemC_unidade INT(11) DEFAULT NULL,
  itemC_cfop VARCHAR(10) DEFAULT NULL,
  itemC_qtde INT(11) NOT NULL,
  itemC_vTotal DOUBLE(15, 2) DEFAULT 0.00,
  itemC_baseICMS DOUBLE(15, 2) DEFAULT 0.00,
  itemC_valorICMS DOUBLE(15, 2) DEFAULT 0.00,
  itemC_valorIPI DOUBLE(15, 2) DEFAULT 0.00,
  itemC_aliqICMS DOUBLE(15, 2) DEFAULT 0.00,
  itemC_aliqIPI DOUBLE(15, 2) DEFAULT 0.00,
  PRIMARY KEY (itemC_codCompra, itemC_numero),
  CONSTRAINT FK_itenscompra_produtos_pro_id FOREIGN KEY (itemC_codProduto)
    REFERENCES produtos(pro_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)

CREATE TABLE itensvenda (
  itemV_codProduto INT(11) DEFAULT NULL,
  itemV_codVenda INT(11) NOT NULL,
  itemV_numero INT(11) NOT NULL,
  itemV_nome VARCHAR(70) DEFAULT NULL,
  itemV_valorUnitario DOUBLE(15, 2) DEFAULT 0.00,
  itemV_ncm VARCHAR(30) DEFAULT NULL,
  itemV_cst VARCHAR(10) DEFAULT NULL,
  itemV_unidade INT(11) DEFAULT NULL,
  itemV_cfop VARCHAR(10) DEFAULT NULL,
  itemV_qtde INT(11) DEFAULT NULL,
  itemV_vTotal DOUBLE(15, 2) DEFAULT 0.00,
  itemV_baseICMS DOUBLE(15, 2) DEFAULT 0.00,
  itemV_valorICMS DOUBLE(15, 2) DEFAULT 0.00,
  itemV_valorIPI DOUBLE(15, 2) DEFAULT 0.00,
  itemV_aliqICMS DOUBLE(15, 2) DEFAULT 0.00,
  itemV_aliqIPI DOUBLE(15, 2) DEFAULT 0.00,
  PRIMARY KEY (itemV_codVenda, itemV_numero),
  CONSTRAINT FK_itensvenda_produtos_pro_id FOREIGN KEY (itemV_codProduto)
    REFERENCES produtos(pro_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
