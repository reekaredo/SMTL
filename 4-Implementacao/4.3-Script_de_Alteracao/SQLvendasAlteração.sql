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
AUTO_INCREMENT = 30
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
AUTO_INCREMENT = 8
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
AUTO_INCREMENT = 13
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
  UNIQUE INDEX pais_ddi (pais_ddi),
  UNIQUE INDEX pais_nome (pais_nome),
  UNIQUE INDEX pais_sigla (pais_sigla)
)
ENGINE = INNODB
AUTO_INCREMENT = 42
AVG_ROW_LENGTH = 4096
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
  CONSTRAINT FK_estados_paises_pais_id FOREIGN KEY (est_pais)
    REFERENCES paises(pais_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 27
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
AUTO_INCREMENT = 13
AVG_ROW_LENGTH = 3276
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
AUTO_INCREMENT = 33
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
AUTO_INCREMENT = 14
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
AUTO_INCREMENT = 9
AVG_ROW_LENGTH = 5461
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
  CONSTRAINT FK_produtos_fornecedores_for_id FOREIGN KEY (pro_fornecedor)
    REFERENCES fornecedores(for_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_produtos_grupos_grupo_id FOREIGN KEY (pro_grupo)
    REFERENCES grupos(grupo_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_produtos_marcas_marca_id FOREIGN KEY (pro_marca)
    REFERENCES marcas(marca_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
AUTO_INCREMENT = 76
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
AUTO_INCREMENT = 5
AVG_ROW_LENGTH = 4096
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
AUTO_INCREMENT = 171
AVG_ROW_LENGTH = 5461
CHARACTER SET latin1
COLLATE latin1_swedish_ci;

-- 
-- Dumping data for table condicoes
--
INSERT INTO condicoes VALUES
(2, 'À VISTA'),
(4, '30, 60, 90, 120 DIAS.'),
(21, '3X SEM ENTRADA'),
(22, 'ENTRADA + 20 + 40 + 60'),
(23, 'ENTRADA + 30 + 60'),
(25, 'TESTE FINAL'),
(26, 'TESTE FINAL 2'),
(27, 'TESTE DE ERRO'),
(28, 'FORMA EM DINHEIRO'),
(29, 'EM 3 VEZES');


-- 
-- Dumping data for table forma
--
INSERT INTO forma VALUES
(2, 'CHEQUE'),
(5, 'NOTA PROMISSÓRIA'),
(7, 'DINHEIRO');

-- 
-- Dumping data for table grupos
--
INSERT INTO grupos VALUES
(1, 'SOFÁS'),
(2, 'MESAS'),
(3, 'ELETRONICOS'),
(4, 'CELULARES'),
(5, 'BALCÕES'),
(6, 'ARMÁRIOS'),
(7, 'CAMAS');

-- 
-- Dumping data for table marcas
--
INSERT INTO marcas VALUES
(12, 'ANJOS'),
(11, 'MADEIRA BRASIL 1'),
(10, 'MONDIAL'),
(9, 'TESTE');


-- 
-- Dumping data for table paises
--
INSERT INTO paises VALUES
(24, 'BRASIL', '+55', 'BRA'),
(38, 'BRASILZAITION', '+59', 'BZ'),
(39, 'PARAGUAI', '+595', 'PY'),
(40, 'ALEMANHA', '+34', 'ALE'),
(41, 'PORTUGAL', '+66', 'PT');

-- 
-- Dumping data for table estados
--
INSERT INTO estados VALUES
(9, 'PARANÁ', 24, 'PR'),
(10, 'PARÁ', 24, 'PA'),
(24, 'MATO GROSSO', 24, 'MT'),
(25, 'RIO GRANDE DO SUL', 24, 'RS'),
(26, 'PARAIBA', 24, 'PB');

-- 
-- Dumping data for table parcelas
--
INSERT INTO parcelas VALUES
(19, 1, 30, 50, 2, ''),
(19, 2, 60, 40, 2, ''),
(19, 3, 90, 10, 2, ''),
(23, 1, 0, 50, 5, ''),
(23, 2, 30, 25, 5, ''),
(25, 1, 30, 50, 2, ''),
(25, 2, 60, 50, 2, ''),
(26, 1, 30, 50, 5, ''),
(26, 2, 60, 50, 5, ''),
(27, 1, 30, 50, 2, ''),
(27, 2, 60, 50, 2, ''),
(28, 1, 30, 25, 7, ''),
(28, 2, 60, 75, 7, '');

-- 
-- Dumping data for table cidades
--
INSERT INTO cidades VALUES
(1, 'FOZ DO IGUAÇU', 9, '45'),
(2, 'BELÉM', 10, '82'),
(8, 'TRES LAGOAS', 24, '45'),
(9, 'PORTO ALEGRE', 25, '51'),
(10, 'SANTA CRUZ', 9, '00'),
(11, 'CIDADE DO SUL', 10, '11'),
(12, 'CIDADE DESCONHECIDA', 25, '78');

-- 
-- Dumping data for table clientes
--
INSERT INTO clientes VALUES
(13, 'PEDRO OLIVEIRA', '', '92837282792', '', '0', '', '', 1, 'M', '1899-12-30 00:00:00', NULL, 'F', NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'PEDRO HENRIQUE', '', '07942849902', '', '113', '99224653', '', 8, 'F', '1899-12-30 00:00:00', 'PEDROKA', 'F', '', '', '', '2332323', 4, '2015-08-02 00:00:00'),
(17, 'RODRIGO', '444444444', '', '', '0', '4677565', '', 8, 'M', '1899-12-30 00:00:00', '', 'F', '', '', '', '54445', 4, '2015-08-02 00:00:00'),
(19, 'RICARDO AUGUSTO', '34353', '07942849902', '', '0', '98129148', '', 8, 'M', '2015-07-24 00:00:00', 'RICK1', 'F', '', '', '', '102167570', 4, '2016-07-12 00:00:00'),
(20, 'SERGIO GOMES', '', '', '', '', '', '', 9, 'M', '2015-08-02 00:00:00', '', 'F', '', '', '', '2323232323233', 2, '2015-08-02 00:00:00'),
(22, 'TESTE2', '', '32323       ', '', '', '', '', 2, 'M', '2015-08-02 00:00:00', '', 'J', '', '', '', '23232', 4, '2015-08-02 00:00:00'),
(23, 'NANDI', '', '14341794000161', '', '', '45999999', '', 9, 'J', '2015-08-02 00:00:00', '', 'J', '', '', '', '23232323232', 2, '2016-07-15 00:00:00'),
(25, 'FDFDFDFFD', '', '', '', '', '', '', 10, 'J', '2016-07-12 00:00:00', '', 'J', '', '', '', '34343434343', 4, '2016-07-12 00:00:00'),
(26, 'SWDSSD', '', '', '', '', '', '', 10, 'J', '2016-07-12 00:00:00', '', 'J', '', '', '', '232323', 22, '2016-07-12 00:00:00'),
(27, '34343E4R3ER3', '', '07942849902', '', '', '', '', 10, 'M', '2016-07-12 00:00:00', 'SDWDW', 'F', '', '', '', '34343434', 2, '2016-07-12 00:00:00'),
(28, 'SAQSASAS', '', '22222         ', '', '', '', '', 8, 'J', '2016-07-12 00:00:00', 'ASASASAS', 'J', '', '', '', '232323', 2, '2016-07-12 00:00:00'),
(29, 'SASASA', '', '02176606906', '', '', '', '', 10, 'M', '2016-07-12 00:00:00', 'ASASAS', 'F', '', '', '', '111111111', 27, '2016-07-15 00:00:00'),
(30, '1232EDERER', '', '58620547000170', '', '', '', '', 8, 'J', '2016-07-12 00:00:00', '', 'J', '', '', '', '111111', 2, '2016-07-12 00:00:00'),
(31, 'WERERERF', '', '02176606906', '', '', '', '', 10, 'M', '2016-07-12 00:00:00', '', 'F', '', '', '', '', 23, '2016-07-12 00:00:00'),
(32, 'TESTE DE DEPENDENCIA', '', '02176606906', '', '', '', '', 1, 'M', '2016-07-15 00:00:00', '', 'F', '', '', '', '', 25, '2016-07-15 00:00:00');

-- 
-- Dumping data for table fornecedores
--
INSERT INTO fornecedores VALUES
(2, 'RICK', '(52)3223-2323', '(54)5454-5455', 'reek.are.do@hotmail.com', 1, 'RICARDO AUGUSTO', '(45)9974-4751', '', '', '', '', '', '', '', '', 2, '1899-12-30 00:00:00', '2015-08-02 00:00:00'),
(4, 'RICARDO DOS SANTOS', '(45)1212-3232', '(45)9812-9149', 'ricksantos@gmail.com', 2, 'PEDRO JOSÉ', '(45)9922-4653', 'RICKZÃO', '', '', '', '', '', '', '', 4, '1899-12-30 00:00:00', '2015-08-02 00:00:00'),
(7, 'CARLOS KANEKO', '(45)4827-3827', '(45)2378-2937', 'kaneko@gmail.com', 1, 'KANEKINHO', '(45)2229-1911', 'KANEKO INFORMATICA', '', '', '', '', '', '', '', 4, '1899-12-30 00:00:00', '2015-08-02 00:00:00'),
(8, 'FOUAD CENTER', '(  )    -    ', '(  )    -    ', '', 8, 'FOUAD OSMAN', '(  )    -    ', '', '', '', '', '', '', '', '', 2, '2015-08-02 00:00:00', '2016-07-11 00:00:00'),
(9, 'SDSDSDS', '', '', '', 8, 'RICARDINHO', '4555555555', 'SDSDSD', '', '', '', '', '', '44930419000118', '', 22, '2016-07-13 00:00:00', '2016-07-13 00:00:00'),
(10, 'IJIJI', '', '', '', 8, 'KKKKKK', '8888888888', 'IJIJJIJI', '', '', '', '', '', '14341794000161', '', 25, '2016-07-13 00:00:00', '2016-07-15 00:00:00'),
(11, 'DDDDD', '', '', '', 8, 'DDD', '9999999999', '', '', '', '', '', '', '38661532000142', '', 2, '2016-07-13 00:00:00', '2016-07-13 00:00:00'),
(12, 'FORNECEDOR 3 VZS COM ENTRADA', '', '', '', 11, 'HEBER ROBERTO LOPES', '4587182712', '3 VEIZ', '', '', '', '', '', '', '', 23, '2016-07-15 00:00:00', '2016-07-15 00:00:00'),
(13, 'TESTE FINAL 2', '', '', '', 1, 'HAHA', '4555555555', '', '', '', '', '', '', '14341794000161', '', 26, '2016-07-15 00:00:00', '2016-07-15 00:00:00');

-- 
-- Dumping data for table funcionarios
--
INSERT INTO funcionarios VALUES
(2, 'AMARILDO', '07942849902', 'M', '', '', '', '453', '', 9, 'GERENTE', 1200.00, '1899-12-30 00:00:00'),
(3, 'EVERALDO', '02176606906', 'M', '', '', '', '', '', 9, 'GERENTE', 0.00, '1899-12-30 00:00:00'),
(4, 'JOSE SILVA', '07942849902', 'M', '', '99217743', '', '', '', 1, 'VENDEDOR', 5900.98, '1899-12-30 00:00:00'),
(6, 'ROGER', '', 'M', '', '', '', '', '', 1, 'AUXILIAR', 0.00, '1899-12-30 00:00:00'),
(7, 'TESTE20', '07942849902', 'M', '', '', '', '', '', 9, 'VENDEDOR', 0.00, '2016-07-12 00:00:00'),
(8, 'NOVO FUNCIONARIO', '02176606906', 'M', '', '', '', '', '', 12, 'DONO', 0.00, '2016-07-15 00:00:00');

-- 
-- Dumping data for table produtos
--
INSERT INTO produtos VALUES
(9, 'CAFETEIRA SIMPLES', '8Q7837283', 30.00, 35.99, 1, 10, 'TESTE DE OBSERVAÇÃO', 2, 3, 1, '2W32', '1899-12-30 00:00:00', '2016-07-15 00:00:00', '1899-12-30 00:00:00', '1899-12-30 00:00:00', 0.00, 0.00, 'ELETRONICOS'),
(10, 'VENTILADOR', '2837287823', 98.88, 120.00, 5, 10, '', 4, 3, 1, '394U93U8', '2015-07-07 12:19:46', '2015-07-27 00:00:00', '1899-12-30 00:00:00', '1899-12-30 00:00:00', 0.00, 0.00, 'ELETRONICOS'),
(74, 'ARMARIO 1', '140716171850', 0.00, 269.00, 0, 10, '', 8, 6, 1, '3874Y3HDU', '2015-07-07 12:19:46', '2016-07-27 00:00:00', '1899-12-30 00:00:00', '1899-12-30 00:00:00', 269.00, 0.00, 'ARMÁRIOS'),
(75, 'CAMA SIMPLES', '140716172024', 0.00, 690.00, 0, 12, '', 7, 7, 1, '34973YDEU', '2015-07-07 12:19:46', '2016-07-25 00:00:00', '1899-12-30 00:00:00', '1899-12-30 00:00:00', 690.00, 0.00, 'CAMAS');

-- 
-- Dumping data for table usuarios
--
INSERT INTO usuarios VALUES
(1, 'RICK', 'RICK', '123', 1, 3),
(2, 'PEDRO', 'PEDRO', '123', 0, 2),
(3, 'CARLOS MASSAMI KANEKO', 'KANEKO', '12345', 1, 3),
(4, 'ADMIN', 'ADMIN', 'admin', 0, 2);

-- 
-- Dumping data for table imagens
--
INSERT INTO imagens VALUES
(165, 75, 'C:\\Sistema - Móveis Três Lagoas\\img\\Móveis\\Camas\\4.jpg'),
(167, 9, 'C:\\Sistema - Móveis Três Lagoas\\img\\Móveis\\eletrodomésticos\\Cooktop-5-Bocas-Fogatti-V500X-a-Gas-GLP-e-Esmaltado-Bivolt-Preto-1641692.jpg'),
(170, 74, 'C:\\Sistema - Móveis Três Lagoas\\img\\Móveis\\Armários\\3.jpg');


commit;