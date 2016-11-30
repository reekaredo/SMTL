CREATE TABLE caixa (
  caixa_data DATE NOT NULL,
  caixa_valorInicial DOUBLE(15, 2) DEFAULT NULL,
  caixa_valorFinal DOUBLE(15, 2) DEFAULT NULL,
  caixa_saldo DOUBLE(15, 2) DEFAULT NULL,
  PRIMARY KEY (caixa_data)
)

CREATE TABLE fluxo (
  fluxo_id INT(11) NOT NULL AUTO_INCREMENT,
  fluxo_data DATE DEFAULT NULL,
  fluxo_tipo VARCHAR(255) DEFAULT NULL,
  fluxo_valor DOUBLE(15, 2) DEFAULT NULL,
  PRIMARY KEY (fluxo_id)
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


ALTER TABLE forma ADD COLUMN forma_saldo DOUBLE(15,2) AFTER forma_nome;
