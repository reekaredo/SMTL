CREATE TABLE vendas.vendas (
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
    REFERENCES vendas.clientes(cli_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_venda_condicoes_cond_id FOREIGN KEY (venda_condPgto)
    REFERENCES vendas.condicoes(cond_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_venda_transportadoras_transp_id FOREIGN KEY (venda_codTransportadora)
    REFERENCES vendas.transportadoras(transp_id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_venda_veiculos_veiculo_id FOREIGN KEY (venda_veiculo)
    REFERENCES vendas.veiculos(veiculo_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)

INSERT INTO vendas.vendas(venda_numeroNota, venda_codCliente, venda_serieNota, venda_tipoNota, venda_condPgto, venda_codTransportadora, venda_dataEmissao, venda_dataChegada, venda_baseCalculoICMS, venda_valorICMS, venda_baseCalculoICMSsubst, venda_valorICMSsubst, venda_valorTotalProdutos, venda_valorFrete, venda_valorSeguro, venda_desconto, venda_outrasDespAcessorias, venda_valorTotalIPI, venda_valorTotal, venda_qtde, venda_placaVeiculo, venda_ufVeiculo, venda_especie, venda_marca, venda_numeracao, venda_pesoBruto, venda_pesoLiquido, venda_fretePorconta, venda_veiculo, venda_categoria) VALUES
(502, 45, 0, 1, 2, 5, '2016-11-08 00:00:00', '2016-11-08 00:00:00', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '', '', '1-VOLUME', '', '', 0, 0, '0', 1, 'V');
INSERT INTO vendas.vendas(venda_numeroNota, venda_codCliente, venda_serieNota, venda_tipoNota, venda_condPgto, venda_codTransportadora, venda_dataEmissao, venda_dataChegada, venda_baseCalculoICMS, venda_valorICMS, venda_baseCalculoICMSsubst, venda_valorICMSsubst, venda_valorTotalProdutos, venda_valorFrete, venda_valorSeguro, venda_desconto, venda_outrasDespAcessorias, venda_valorTotalIPI, venda_valorTotal, venda_qtde, venda_placaVeiculo, venda_ufVeiculo, venda_especie, venda_marca, venda_numeracao, venda_pesoBruto, venda_pesoLiquido, venda_fretePorconta, venda_veiculo, venda_categoria) VALUES
(503, 47, 0, 1, 2, 5, '2016-11-09 00:00:00', '2016-11-09 00:00:00', 0, 0, 0, 0, 50.9, 0, 0, 0, 0, 0, 50.9, 1, '', '', '0-CAIXA', '', '', 0, 0, '0', 1, 'V');
INSERT INTO vendas.vendas(venda_numeroNota, venda_codCliente, venda_serieNota, venda_tipoNota, venda_condPgto, venda_codTransportadora, venda_dataEmissao, venda_dataChegada, venda_baseCalculoICMS, venda_valorICMS, venda_baseCalculoICMSsubst, venda_valorICMSsubst, venda_valorTotalProdutos, venda_valorFrete, venda_valorSeguro, venda_desconto, venda_outrasDespAcessorias, venda_valorTotalIPI, venda_valorTotal, venda_qtde, venda_placaVeiculo, venda_ufVeiculo, venda_especie, venda_marca, venda_numeracao, venda_pesoBruto, venda_pesoLiquido, venda_fretePorconta, venda_veiculo, venda_categoria) VALUES
(504, 47, 0, 1, 2, 5, '2016-11-09 00:00:00', '2016-11-09 00:00:00', 0, 0, 0, 0, 690, 0, 0, 0, 0, 0, 690, 1, '', '', '1-VOLUME', '', '', 0, 0, '0', 1, 'V');
INSERT INTO vendas.vendas(venda_numeroNota, venda_codCliente, venda_serieNota, venda_tipoNota, venda_condPgto, venda_codTransportadora, venda_dataEmissao, venda_dataChegada, venda_baseCalculoICMS, venda_valorICMS, venda_baseCalculoICMSsubst, venda_valorICMSsubst, venda_valorTotalProdutos, venda_valorFrete, venda_valorSeguro, venda_desconto, venda_outrasDespAcessorias, venda_valorTotalIPI, venda_valorTotal, venda_qtde, venda_placaVeiculo, venda_ufVeiculo, venda_especie, venda_marca, venda_numeracao, venda_pesoBruto, venda_pesoLiquido, venda_fretePorconta, venda_veiculo, venda_categoria) VALUES
(505, 43, 0, 1, 2, 5, '2016-11-09 00:00:00', '2016-11-09 00:00:00', 0, 0, 0, 0, 352, 0, 0, 0, 0, 0, 352, 1, '', '', '1-VOLUME', '', '', 0, 0, '0', 1, 'O');
INSERT INTO vendas.vendas(venda_numeroNota, venda_codCliente, venda_serieNota, venda_tipoNota, venda_condPgto, venda_codTransportadora, venda_dataEmissao, venda_dataChegada, venda_baseCalculoICMS, venda_valorICMS, venda_baseCalculoICMSsubst, venda_valorICMSsubst, venda_valorTotalProdutos, venda_valorFrete, venda_valorSeguro, venda_desconto, venda_outrasDespAcessorias, venda_valorTotalIPI, venda_valorTotal, venda_qtde, venda_placaVeiculo, venda_ufVeiculo, venda_especie, venda_marca, venda_numeracao, venda_pesoBruto, venda_pesoLiquido, venda_fretePorconta, venda_veiculo, venda_categoria) VALUES
(506, 47, 0, 1, 2, 5, '2016-11-09 00:00:00', '2016-11-09 00:00:00', 0, 0, 0, 0, 844.4, 0, 0, 0, 0, 69, 844.4, 1, '', '', '0-CAIXA', '', '', 0, 0, '1', 1, 'V');

CREATE TABLE vendas.contaspagar (
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
    REFERENCES vendas.forma(forma_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)

INSERT INTO vendas.contaspagar(contaP_id, contaP_dataCadastro, contaP_codFornecedor, contaP_documento, contaP_vencimento, contaP_valor, contaP_numeroParcela, contaP_juros, contaP_observacao, contaP_status, contaP_dataPagamento, contaP_formaPagamento, contaP_codCompra) VALUES
(4, '2016-11-08 00:00:00', 14, 'COMPRA-11214', '2016-12-08 00:00:00', 169.97, 1, 0, '', 1, '2016-11-08 00:00:00', 5, 11214);
INSERT INTO vendas.contaspagar(contaP_id, contaP_dataCadastro, contaP_codFornecedor, contaP_documento, contaP_vencimento, contaP_valor, contaP_numeroParcela, contaP_juros, contaP_observacao, contaP_status, contaP_dataPagamento, contaP_formaPagamento, contaP_codCompra) VALUES
(6, '2016-11-08 00:00:00', 14, 'COMPRA-11214', '2017-02-06 00:00:00', 169.97, 3, 0, '', 0, '2016-11-08 00:00:00', 5, 11214);
INSERT INTO vendas.contaspagar(contaP_id, contaP_dataCadastro, contaP_codFornecedor, contaP_documento, contaP_vencimento, contaP_valor, contaP_numeroParcela, contaP_juros, contaP_observacao, contaP_status, contaP_dataPagamento, contaP_formaPagamento, contaP_codCompra) VALUES
(7, '2016-11-09 00:00:00', 0, 'TESTE', '2016-11-09 00:00:00', 95.87, 1, 0, 'CONTA DE LUZ 11', 1, '2016-11-09 00:00:00', 7, 0);
INSERT INTO vendas.contaspagar(contaP_id, contaP_dataCadastro, contaP_codFornecedor, contaP_documento, contaP_vencimento, contaP_valor, contaP_numeroParcela, contaP_juros, contaP_observacao, contaP_status, contaP_dataPagamento, contaP_formaPagamento, contaP_codCompra) VALUES
(11, '2016-11-09 00:00:00', 12, 'COMPRA-54712', '2016-12-09 00:00:00', 125.61, 1, 0, '', 0, '2016-11-09 00:00:00', 7, 54712);
INSERT INTO vendas.contaspagar(contaP_id, contaP_dataCadastro, contaP_codFornecedor, contaP_documento, contaP_vencimento, contaP_valor, contaP_numeroParcela, contaP_juros, contaP_observacao, contaP_status, contaP_dataPagamento, contaP_formaPagamento, contaP_codCompra) VALUES
(12, '2016-11-09 00:00:00', 12, 'COMPRA-54712', '2017-01-08 00:00:00', 183.19, 2, 0, '', 0, '2016-11-09 00:00:00', 7, 54712);
INSERT INTO vendas.contaspagar(contaP_id, contaP_dataCadastro, contaP_codFornecedor, contaP_documento, contaP_vencimento, contaP_valor, contaP_numeroParcela, contaP_juros, contaP_observacao, contaP_status, contaP_dataPagamento, contaP_formaPagamento, contaP_codCompra) VALUES
(13, '2016-11-09 00:00:00', 12, 'COMPRA-54712', '2017-02-07 00:00:00', 214.59, 3, 0, '', 1, '2016-11-09 00:00:00', 7, 54712);

CREATE TABLE vendas.contasreceber (
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
    REFERENCES vendas.clientes(cli_id) ON DELETE RESTRICT ON UPDATE RESTRICT
)



