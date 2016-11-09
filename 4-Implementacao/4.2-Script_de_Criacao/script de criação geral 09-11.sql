--
-- Script was generated by Devart dbForge Studio for MySQL, Version 6.3.358.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 09/11/2016 17:52:51
-- Server version: 5.5.44
-- Client version: 4.1
--


-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set SQL mode
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Set default database
--
USE vendas;

--
-- Definition for table condicoes
--
DROP TABLE IF EXISTS condicoes;
CREATE TABLE condicoes (
  cond_id INT(11) NOT NULL AUTO_INCREMENT,
  cond_nome VARCHAR(60) DEFAULT NULL,
  PRIMARY KEY (cond_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 48
AVG_ROW_LENGTH = 2730
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table forma
--
DROP TABLE IF EXISTS forma;
CREATE TABLE forma (
  forma_id INT(11) NOT NULL AUTO_INCREMENT,
  forma_nome VARCHAR(30) DEFAULT NULL,
  PRIMARY KEY (forma_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 9
AVG_ROW_LENGTH = 8192
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table grupos
--
DROP TABLE IF EXISTS grupos;
CREATE TABLE grupos (
  grupo_id INT(11) NOT NULL AUTO_INCREMENT,
  grupo_nome VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (grupo_id)
)
ENGINE = INNODB
AUTO_INCREMENT = 8
AVG_ROW_LENGTH = 4096
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table marcas
--
DROP TABLE IF EXISTS marcas;
CREATE TABLE marcas (
  marca_id INT(11) NOT NULL AUTO_INCREMENT,
  marca_nome VARCHAR(40) DEFAULT NULL,
  PRIMARY KEY (marca_id),
  UNIQUE INDEX marca_nome (marca_nome)
)
ENGINE = INNODB
AUTO_INCREMENT = 17
AVG_ROW_LENGTH = 5461
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table paises
--
DROP TABLE IF EXISTS paises;
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
ENGINE = INNODB
AUTO_INCREMENT = 42
AVG_ROW_LENGTH = 4096
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table contaspagar
--
DROP TABLE IF EXISTS contaspagar;
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
ENGINE = INNODB
AUTO_INCREMENT = 14
AVG_ROW_LENGTH = 2730
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table estados
--
DROP TABLE IF EXISTS estados;
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
ENGINE = INNODB
AUTO_INCREMENT = 43
AVG_ROW_LENGTH = 2340
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table parcelas
--
DROP TABLE IF EXISTS parcelas;
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
ENGINE = INNODB
AVG_ROW_LENGTH = 2048
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table cidades
--
DROP TABLE IF EXISTS cidades;
CREATE TABLE cidades (
  cid_id INT(11) NOT NULL AUTO_INCREMENT,
  cid_nome VARCHAR(60) DEFAULT NULL,
  cid_estado INT(11) DEFAULT NULL,
  cid_ddd VARCHAR(5) DEFAULT NULL,
  PRIMARY KEY (cid_id),
  CONSTRAINT FK_cidades_estados_est_id FOREIGN KEY (cid_estado)
    REFERENCES estados(est_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 29
AVG_ROW_LENGTH = 3276
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table veiculos
--
DROP TABLE IF EXISTS veiculos;
CREATE TABLE veiculos (
  veiculo_id INT(11) NOT NULL AUTO_INCREMENT,
  veiculo_placa VARCHAR(20) DEFAULT NULL,
  veiculo_uf INT(11) NOT NULL,
  veiculo_descricao VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (veiculo_id),
  CONSTRAINT FK_veiculos_estados_est_id FOREIGN KEY (veiculo_uf)
    REFERENCES estados(est_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 4
AVG_ROW_LENGTH = 5461
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table clientes
--
DROP TABLE IF EXISTS clientes;
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
ENGINE = INNODB
AUTO_INCREMENT = 48
AVG_ROW_LENGTH = 3276
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table fornecedores
--
DROP TABLE IF EXISTS fornecedores;
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
ENGINE = INNODB
AUTO_INCREMENT = 15
AVG_ROW_LENGTH = 5461
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table funcionarios
--
DROP TABLE IF EXISTS funcionarios;
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
ENGINE = INNODB
AUTO_INCREMENT = 13
AVG_ROW_LENGTH = 5461
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table transportadoras
--
DROP TABLE IF EXISTS transportadoras;
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
ENGINE = INNODB
AUTO_INCREMENT = 6
AVG_ROW_LENGTH = 8192
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table compras
--
DROP TABLE IF EXISTS compras;
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
ENGINE = INNODB
AVG_ROW_LENGTH = 4096
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table contasreceber
--
DROP TABLE IF EXISTS contasreceber;
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
  PRIMARY KEY (contaR_id),
  CONSTRAINT FK_contasreceber_clientes_for_id FOREIGN KEY (contaR_codCliente)
    REFERENCES clientes(cli_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table produtos
--
DROP TABLE IF EXISTS produtos;
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
ENGINE = INNODB
AUTO_INCREMENT = 88
AVG_ROW_LENGTH = 2048
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table usuarios
--
DROP TABLE IF EXISTS usuarios;
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
ENGINE = INNODB
AUTO_INCREMENT = 11
AVG_ROW_LENGTH = 4096
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table vendas
--
DROP TABLE IF EXISTS vendas;
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
ENGINE = INNODB
AUTO_INCREMENT = 507
AVG_ROW_LENGTH = 8192
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table imagens
--
DROP TABLE IF EXISTS imagens;
CREATE TABLE imagens (
  cod_imagem INT(11) NOT NULL AUTO_INCREMENT,
  cod_produto INT(11) DEFAULT NULL,
  caminho_imagem VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (cod_imagem),
  CONSTRAINT FK_imagens_produtos_pro_id FOREIGN KEY (cod_produto)
    REFERENCES produtos(pro_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 177
AVG_ROW_LENGTH = 1365
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table itenscompra
--
DROP TABLE IF EXISTS itenscompra;
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
ENGINE = INNODB
AVG_ROW_LENGTH = 2340
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

--
-- Definition for table itensvenda
--
DROP TABLE IF EXISTS itensvenda;
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
ENGINE = INNODB
AVG_ROW_LENGTH = 2730
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

-- 
-- Dumping data for table condicoes
--
INSERT INTO condicoes VALUES
(2, '� VISTA'),
(4, '30, 60, 90, 120 DIAS.'),
(21, '3X SEM ENTRADA'),
(22, 'ENTRADA + 20 + 40 + 60'),
(23, 'ENTRADA + 30 + 60'),
(25, 'DUAS VEZES'),
(27, 'TESTE DE ERRO'),
(44, 'VALIDA��ES'),
(45, '� PRAZO'),
(46, 'TESTE PERCENTUAL'),
(47, '3 VEZES 24 35 41');

-- 
-- Dumping data for table forma
--
INSERT INTO forma VALUES
(2, 'CHEQUE'),
(5, 'NOTA PROMISS�RIA'),
(7, 'DINHEIRO'),
(8, 'CART�O');

-- 
-- Dumping data for table grupos
--
INSERT INTO grupos VALUES
(1, 'SOF�S'),
(2, 'MESAS'),
(3, 'ELETRONICOS'),
(5, 'BALC�ES'),
(6, 'ARM�RIOS'),
(7, 'CAMAS');

-- 
-- Dumping data for table marcas
--
INSERT INTO marcas VALUES
(12, 'ANJOS'),
(16, 'AR'),
(11, 'MADEIRA BRASIL 1'),
(10, 'MONDIAL'),
(15, 'MONIDL'),
(9, 'TESTE');

-- 
-- Dumping data for table paises
--
INSERT INTO paises VALUES
(24, 'BRASIL', '+55', 'BRA'),
(39, 'PARAGUAI', '+595', 'PY'),
(40, 'ALEMANHA', '+49', 'ALE'),
(41, 'PORTUGAL', '+351', 'PT');

-- 
-- Dumping data for table contaspagar
--
INSERT INTO contaspagar VALUES
(4, '2016-11-08 00:00:00', 14, 'COMPRA-11214', '2016-12-08 00:00:00', 169.97, 1, 0.00, '', 1, '2016-11-08 00:00:00', 5, 11214),
(6, '2016-11-08 00:00:00', 14, 'COMPRA-11214', '2017-02-06 00:00:00', 169.97, 3, 0.00, '', 0, '2016-11-08 00:00:00', 5, 11214),
(7, '2016-11-09 00:00:00', 0, 'TESTE', '2016-11-09 00:00:00', 95.87, 1, 0.00, 'CONTA DE LUZ 11', 1, '2016-11-09 00:00:00', 7, 0),
(11, '2016-11-09 00:00:00', 12, 'COMPRA-54712', '2016-12-09 00:00:00', 125.61, 1, 0.00, '', 0, '2016-11-09 00:00:00', 7, 54712),
(12, '2016-11-09 00:00:00', 12, 'COMPRA-54712', '2017-01-08 00:00:00', 183.19, 2, 0.00, '', 0, '2016-11-09 00:00:00', 7, 54712),
(13, '2016-11-09 00:00:00', 12, 'COMPRA-54712', '2017-02-07 00:00:00', 214.59, 3, 0.00, '', 1, '2016-11-09 00:00:00', 7, 54712);

-- 
-- Dumping data for table estados
--
INSERT INTO estados VALUES
(9, 'PARAN�', 24, 'PR'),
(10, 'PAR�', 24, 'PA'),
(24, 'MATO GROSSO', 24, 'MT'),
(25, 'RIO GRANDE DO SUL', 24, 'RS'),
(26, 'PARAIBA', 24, 'PB'),
(27, 'MINAS GERAIS', 24, 'MG'),
(40, 'MATO GROSSO DO SUL', 24, 'MS'),
(41, 'ALTO PARANA', 39, 'AP'),
(42, 'RIO GRANDE DO NORTE', 24, 'RN');

-- 
-- Dumping data for table parcelas
--
INSERT INTO parcelas VALUES
(2, 1, 0, 100, 7, ''),
(4, 1, 30, 25, 7, ''),
(4, 2, 60, 25, 7, ''),
(4, 3, 90, 25, 7, ''),
(4, 4, 120, 25, 7, ''),
(21, 1, 30, 30, 5, ''),
(21, 2, 60, 40, 5, ''),
(21, 3, 90, 30, 5, ''),
(22, 1, 0, 40, 7, ''),
(22, 2, 20, 20, 7, ''),
(22, 3, 40, 20, 7, ''),
(22, 4, 60, 20, 7, ''),
(23, 1, 0, 50, 7, ''),
(23, 2, 30, 25, 7, ''),
(23, 3, 60, 25, 7, ''),
(25, 1, 30, 50, 2, ''),
(25, 2, 60, 50, 2, ''),
(27, 1, 30, 50, 2, ''),
(27, 2, 60, 25, 7, ''),
(27, 3, 90, 25, 7, ''),
(44, 1, 10, 100, 2, ''),
(45, 1, 0, 100, 7, ''),
(46, 1, 30, 2.22, 2, ''),
(46, 2, 60, 97.78, 2, ''),
(47, 1, 30, 24, 7, ''),
(47, 2, 60, 35, 7, ''),
(47, 3, 90, 41, 7, '');

-- 
-- Dumping data for table cidades
--
INSERT INTO cidades VALUES
(1, 'FOZ DO IGUA�U', 9, '45'),
(2, 'BEL�M', 10, '91'),
(8, 'TRES LAGOAS', 24, '45'),
(9, 'PORTO ALEGRE', 25, '51'),
(10, 'SANTA CRUZ', 42, '84'),
(11, 'CIDADE DO SUL', 10, '91'),
(13, 'C�U AZUL', 9, '45'),
(26, 'BELO HORIZONTE', 27, '31'),
(27, 'JO�O PESSOA', 26, '83'),
(28, 'SANTA RITA', 41, '595');

-- 
-- Dumping data for table veiculos
--
INSERT INTO veiculos VALUES
(1, 'DNT5049', 9, 'PRISMA'),
(2, 'BAG9076', 9, 'MOTO'),
(3, 'ABC1234', 27, 'POLO');

-- 
-- Dumping data for table clientes
--
INSERT INTO clientes VALUES
(19, 'RICARDO AUGUSTO', '', '07942849902', '', '0', '4598129148', '', 8, 'M', '2015-07-24 00:00:00', 'RICK1', 'F', '', '', '', '102167570', 4, '2016-09-28 00:00:00'),
(42, 'JOAO DOS SANTOS', '', '', '', '', '', '', 1, 'M', '2016-09-23 00:00:00', 'DUPLICADO', 'F', '', '', '', '', 21, '2016-11-08 00:00:00'),
(43, 'CLIENTE DO PARAGUAI', '', '', '', '', '', '', 28, 'M', '2016-09-23 00:00:00', '', 'F', '', '', '', '', 25, '2016-09-28 00:00:00'),
(45, 'CARLOS MARQUES', '4599548879', '', '', '', '', '', 27, 'M', '2016-09-28 00:00:00', '', 'F', '', '', '', '', 2, '2016-09-28 00:00:00'),
(46, 'BRILHO SOF�S', '4535448794', '25965826000116', '', '', '', '', 1, 'J', '2016-09-28 00:00:00', 'BRILHO', 'J', '', '', '', '', 25, '2016-09-28 00:00:00'),
(47, 'RICARDO AUGUSTO', '4535775308', '', '', '', '4598129148', '', 1, 'M', '2016-11-09 00:00:00', 'RICK', 'F', '', '', '', '', 2, '2016-11-09 00:00:00');

-- 
-- Dumping data for table fornecedores
--
INSERT INTO fornecedores VALUES
(2, 'RICK', '4598129148', '4535775308', 'reek.are.do@hotmail.com', 1, 'RICARDO AUGUSTO', '4599344751', '', '', '', '', '', '', '92364456000159', '', 2, '2015-11-30 00:00:00', '2016-09-28 00:00:00'),
(4, 'RICARDO DOS SANTOS', '4599989457', '4535278501', 'ricksantos@gmail.com', 2, 'PEDRO JOS�', '4599224653', 'RICKZ�O', '', '', '', '', '', '40432945000105', '', 4, '2015-11-30 00:00:00', '2016-09-28 00:00:00'),
(7, 'CARLOS GOMES', '4588844646', '4598978787', 'carlos@gmail.com', 1, 'CARLOS', '7878545484', 'CARL�O ESTOFADOS', 'RUA CARLOS GOMES', '1982', '', 'VILA PORTES', '', '25965826000116', '', 4, '2015-11-30 00:00:00', '2016-09-28 00:00:00'),
(8, 'FOUAD CENTER', '', '', '', 8, 'FOUAD OSMAN', '4535887945', '', '', '', '', '', '', '55346506000149', '', 2, '2015-08-02 00:00:00', '2016-09-28 00:00:00'),
(12, 'MESAS MP S/A', '', '', '', 11, 'HEBER ROBERTO LOPES', '4587182712', 'MESAS M&P', '', '', '', '', '', '65378974000159', '', 23, '2016-07-15 00:00:00', '2016-09-28 00:00:00'),
(14, 'RAZAO SOCIAL 1', '', '', '', 13, 'JOAO', '4599999999', 'NOME ERRADO', '', '', '', '', '', '65568683000123', '', 21, '2016-09-14 00:00:00', '2016-09-28 00:00:00');

-- 
-- Dumping data for table funcionarios
--
INSERT INTO funcionarios VALUES
(2, 'AMARILDO', '07942849902', 'M', '', '', '', '453', '', 9, 'GERENTE', 1200.00, '2015-11-30 00:00:00'),
(3, 'EVERALDO', '02176606906', 'M', '', '', '', '', '', 9, 'GERENTE', 0.00, '2015-11-30 00:00:00'),
(9, 'COREY TAYLOR DA SILVA', '55112192402', 'F', '', '', '', '', '', 11, 'VENDEDOR', 0.00, '2016-09-26 00:00:00'),
(12, 'RICARDO AUGUSTO', '27672132563', 'M', '', '', '', '', '', 1, 'VENDEDOR', 0.00, '2016-09-28 00:00:00');

-- 
-- Dumping data for table transportadoras
--
INSERT INTO transportadoras VALUES
(2, 'ARTESPUMA INDUSTRIA DE COLCH�ES', '1234567', '06991383000193', 'R CURITIBA, 275', 13, '', '', '', 'PR', '4532661934', '', '', 1),
(5, 'TRANSPORTADORA 2', '1111111', '78237433000152', 'RUA TAL NUMERO TAL', 9, '', '', '', 'RS', '5357753458', '113', 'TRES LAGOAS', 1);

-- 
-- Dumping data for table compras
--
INSERT INTO compras VALUES
(112, 14, 2, 1, 21, 5, '2016-11-08 00:00:00', '2016-11-10 00:00:00', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 566.57, 1, '', '', '1-VOLUME', '', '', 0.00, 0.00, '1', 11214, 1),
(123, 8, 1, 0, 44, 5, '2016-09-22 09:18:24', '2016-09-23 09:18:31', 0.00, 0.00, 0.00, 0.00, 600.00, 0.00, 0.00, 0.00, 0.00, 0.00, 800.00, 1, '', '', '1-VOLUME', 'DIVERSAS', '', 0.00, 0.00, '1', 1238, 1),
(547, 12, 2, 1, 47, 5, '2016-11-09 00:00:00', '2016-11-09 00:00:00', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 523.39, 1, '', '', '1-VOLUME', '', '', 0.00, 0.00, '1', 54712, 1),
(1234, 8, 1, 0, 44, 5, '2016-09-21 09:18:24', '2016-09-23 09:18:31', 0.00, 0.00, 0.00, 0.00, 600.00, 0.00, 0.00, 0.00, 0.00, 0.00, 800.00, 1, '', '', '1-VOLUME', 'DIVERSAS', '', 0.00, 0.00, '1', 12348, 1);

-- 
-- Dumping data for table contasreceber
--

-- Table vendas.contasreceber does not contain any data (it is empty)

-- 
-- Dumping data for table produtos
--
INSERT INTO produtos VALUES
(9, 'CAFETEIRA SIMPLES', '130916160122', 0.00, 50.90, 0, 11, '', 12, 7, 1, 'AUGS7I', '2015-07-07 00:00:00', '2016-09-27 00:00:00', '2016-09-28 00:00:00', '2016-11-09 00:00:00', 50.90, 0.00, 'CAMAS'),
(10, 'VENTILADOR', '2837287823', 125.00, 120.00, 0, 10, '', 8, 3, 1, '394U93U8', '2015-07-07 12:19:46', '2016-11-08 00:00:00', '2016-11-09 00:00:00', '1899-12-30 00:00:00', 0.00, 0.00, 'ELETRONICOS'),
(75, 'CAMA SIMPLES', '140716172024', 0.00, 690.00, 2, 12, '', 4, 7, 1, 'ABC1237804', '2015-07-07 12:19:46', '2016-09-27 00:00:00', '2016-11-09 00:00:00', '2016-11-09 00:00:00', 600.00, 0.00, 'CAMAS'),
(76, 'CRIADO MUDO', '130916160122', 60.00, 50.90, 0, 11, '', 12, 5, 1, 'UHG876SATS76J', '2015-07-07 00:00:00', '2016-11-08 00:00:00', '2016-09-28 00:00:00', '2016-11-09 00:00:00', 50.90, 0.00, 'BALC�ES'),
(85, 'ARM�RIO DUPLO', '280916180758', 0.00, 89.00, 0, 10, '', 4, 6, 2, 'ALKSJAOIS827', '1899-12-30 00:00:00', '2016-09-28 00:00:00', '2016-11-08 00:00:00', NULL, 89.00, 0.00, 'ARM�RIOS'),
(86, 'MESA NOVA', '280916181034', 0.00, 352.00, 0, 11, '', 12, 2, 1, '2987382DIJWD', '2015-07-07 00:00:00', '2016-09-28 00:00:00', '2016-11-08 00:00:00', '2016-11-09 00:00:00', 352.00, 0.00, 'MESAS'),
(87, 'SOF� ESCURO', '280916181142', 0.00, 350.00, 0, 16, '', 4, 1, 1, '32984WEDUWED', '2015-07-07 00:00:00', '2016-09-28 00:00:00', NULL, NULL, 350.00, 0.00, 'SOF�S');

-- 
-- Dumping data for table usuarios
--
INSERT INTO usuarios VALUES
(1, 'RICARDO AUGUSTO', 'RICK', 'p�', 1, 12),
(7, 'COREY TAYLOR DA SILVA', 'COREY TAYLOR', 'p�', 1, 9),
(10, 'EVERALDO', 'EVERALDO', 'p�', 0, 3);

-- 
-- Dumping data for table vendas
--
INSERT INTO vendas VALUES
(502, 45, 0, 1, 2, 5, '2016-11-08 00:00:00', '2016-11-08 00:00:00', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1, '', '', '1-VOLUME', '', '', 0.00, 0.00, '0', 1, 'V'),
(503, 47, 0, 1, 2, 5, '2016-11-09 00:00:00', '2016-11-09 00:00:00', 0.00, 0.00, 0.00, 0.00, 50.90, 0.00, 0.00, 0.00, 0.00, 0.00, 50.90, 1, '', '', '0-CAIXA', '', '', 0.00, 0.00, '0', 1, 'V'),
(504, 47, 0, 1, 2, 5, '2016-11-09 00:00:00', '2016-11-09 00:00:00', 0.00, 0.00, 0.00, 0.00, 690.00, 0.00, 0.00, 0.00, 0.00, 0.00, 690.00, 1, '', '', '1-VOLUME', '', '', 0.00, 0.00, '0', 1, 'V'),
(505, 43, 0, 1, 2, 5, '2016-11-09 00:00:00', '2016-11-09 00:00:00', 0.00, 0.00, 0.00, 0.00, 352.00, 0.00, 0.00, 0.00, 0.00, 0.00, 352.00, 1, '', '', '1-VOLUME', '', '', 0.00, 0.00, '0', 1, 'O'),
(506, 47, 0, 1, 2, 5, '2016-11-09 00:00:00', '2016-11-09 00:00:00', 0.00, 0.00, 0.00, 0.00, 844.40, 0.00, 0.00, 0.00, 0.00, 69.00, 844.40, 1, '', '', '0-CAIXA', '', '', 0.00, 0.00, '1', 1, 'V');

-- 
-- Dumping data for table imagens
--
INSERT INTO imagens VALUES
(165, 75, 'C:\\Sistema - M�veis Tr�s Lagoas\\img\\M�veis\\Camas\\4.jpg'),
(166, 85, 'C:\\Sistema - M�veis Tr�s Lagoas\\img\\M�veis\\Arm�rios\\3.jpg'),
(167, 85, 'C:\\Sistema - M�veis Tr�s Lagoas\\img\\M�veis\\Arm�rios\\2.jpg'),
(168, 85, 'C:\\Sistema - M�veis Tr�s Lagoas\\img\\M�veis\\Arm�rios\\8.jpg'),
(169, 86, 'C:\\Sistema - M�veis Tr�s Lagoas\\img\\M�veis\\Mesas\\2.jpg'),
(170, 86, 'C:\\Sistema - M�veis Tr�s Lagoas\\img\\M�veis\\Mesas\\6.jpg'),
(171, 87, 'C:\\Sistema - M�veis Tr�s Lagoas\\img\\M�veis\\Sof�s\\1.jpg'),
(172, 87, 'C:\\Sistema - M�veis Tr�s Lagoas\\img\\M�veis\\Sof�s\\2.jpg'),
(173, 87, 'C:\\Sistema - M�veis Tr�s Lagoas\\img\\M�veis\\Sof�s\\3.jpg'),
(174, 87, 'C:\\Sistema - M�veis Tr�s Lagoas\\img\\M�veis\\Sof�s\\6.jpg'),
(175, 87, 'C:\\Sistema - M�veis Tr�s Lagoas\\img\\M�veis\\Sof�s\\8.jpg'),
(176, 76, 'C:\\Sistema - M�veis Tr�s Lagoas\\img\\M�veis\\Arm�rios\\2.jpg');

-- 
-- Dumping data for table itenscompra
--
INSERT INTO itenscompra VALUES
(10, 1238, 1, 'VENTILADOR', 120.00, '1', '1', 1, '1', 3, 360.00, 0.00, 0.00, 0.00, 0.00, 0.00),
(75, 1238, 2, 'CAMA SIMPLES', 690.00, '2', '2', 1, '2', 1, 690.00, 0.00, 0.00, 0.00, 0.00, 0.00),
(76, 1238, 3, 'CRIADO MUDO', 60.00, '1', '1', 1, '1', 2, 120.00, 0.00, 0.00, 0.00, 0.00, 0.00),
(86, 11214, 1, 'MESA NOVA', 0.00, '111', '11', 1, '11', 3, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00),
(9, 12348, 1, 'CAFETEIRA SIMPLES', 35.99, '1', '1', 1, '1', 12, 431.88, 0.00, 0.00, 0.00, 0.00, 0.00),
(75, 12348, 2, 'CAMA SIMPLES', 0.00, '1', '1', 1, '1', 1, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00),
(75, 54712, 1, 'CAMA SIMPLES', 0.00, '1', '1', 1, '1', 1, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00);

-- 
-- Dumping data for table itensvenda
--
INSERT INTO itensvenda VALUES
(76, 502, 1, 'CRIADO MUDO', 50.90, '', '', 1, '', 1, 50.90, 0.00, 0.00, 0.00, 0.00, 0.00),
(9, 503, 1, 'CAFETEIRA SIMPLES', 50.90, '', '', 1, '', 1, 50.90, 50.90, 0.00, 0.00, 0.00, 0.00),
(75, 504, 1, 'CAMA SIMPLES', 690.00, '', '', 1, '', 1, 690.00, 690.00, 0.00, 0.00, 0.00, 0.00),
(86, 505, 1, 'MESA NOVA', 352.00, '', '', 1, '', 1, 352.00, 352.00, 0.00, 0.00, 0.00, 0.00),
(75, 506, 1, 'CAMA SIMPLES', 690.00, '', '', 1, '', 1, 793.50, 690.00, 34.50, 69.00, 5.00, 10.00),
(76, 506, 2, 'CRIADO MUDO', 50.90, '', '', 1, '', 1, 50.90, 50.90, 0.00, 0.00, 0.00, 0.00);

-- 
-- Restore previous SQL mode
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;