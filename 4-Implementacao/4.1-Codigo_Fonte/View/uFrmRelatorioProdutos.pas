unit uFrmRelatorioProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, MyAccess, ExtCtrls, QuickRpt, MemDS, QRCtrls,
  StdCtrls;

type
  TFrmRelatorioProdutos = class(TForm)
    QuickRep1: TQuickRep;
    Conexao1: TMyConnection;
    sql_produtos: TMyQuery;
    sql_produtospro_id: TIntegerField;
    sql_produtospro_nome: TStringField;
    sql_produtospro_barra: TStringField;
    sql_produtospro_custo: TFloatField;
    sql_produtospro_preco: TFloatField;
    sql_produtospro_estoque: TIntegerField;
    sql_produtospro_marca: TIntegerField;
    sql_produtospro_obs: TStringField;
    sql_produtospro_fornecedor: TIntegerField;
    sql_produtospro_grupo: TIntegerField;
    sql_produtospro_unidade: TIntegerField;
    sql_produtospro_referencia: TStringField;
    sql_produtospro_dataCadastro: TDateTimeField;
    sql_produtospro_dataAlteracao: TDateTimeField;
    sql_produtospro_dataUltimaCompra: TDateTimeField;
    sql_produtospro_dataUltimaVenda: TDateTimeField;
    sql_produtospro_PrecoMinimo: TFloatField;
    sql_produtospro_Comissao: TFloatField;
    sql_produtospro_NomeGrupo: TStringField;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRBand3: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand5: TQRBand;
    QRLabel6: TQRLabel;
    QRSysData2: TQRSysData;
    formularioClientes: TQuickRep;
    QRBand6: TQRBand;
    QRSysData3: TQRSysData;
    QRBand7: TQRBand;
    QRLabel7: TQRLabel;
    QRBand8: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRBand10: TQRBand;
    QRDBText5: TQRDBText;
    sql_clientes: TMyQuery;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand9: TQRBand;
    QRLabel12: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    relatorioFornecedores: TQuickRep;
    QRBand11: TQRBand;
    QRSysData5: TQRSysData;
    QRBand12: TQRBand;
    QRLabel15: TQRLabel;
    QRBand13: TQRBand;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRBand14: TQRBand;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRBand15: TQRBand;
    QRLabel22: TQRLabel;
    QRSysData6: TQRSysData;
    sql_fornecedores: TMyQuery;
    relatorioCompras: TQuickRep;
    QRBand16: TQRBand;
    QRSysData7: TQRSysData;
    QRBand17: TQRBand;
    QRLabel23: TQRLabel;
    QRBand18: TQRBand;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRBand19: TQRBand;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRBand20: TQRBand;
    QRLabel30: TQRLabel;
    QRSysData8: TQRSysData;
    sql_compras: TMyQuery;
    relatorioVendas: TQuickRep;
    QRBand21: TQRBand;
    QRSysData9: TQRSysData;
    QRBand22: TQRBand;
    QRLabel27: TQRLabel;
    QRBand23: TQRBand;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRBand24: TQRBand;
    QRDBText20: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRBand25: TQRBand;
    QRLabel36: TQRLabel;
    QRSysData10: TQRSysData;
    sql_vendas: TMyQuery;
    relatorioContasPagar: TQuickRep;
    QRBand26: TQRBand;
    QRSysData11: TQRSysData;
    QRBand27: TQRBand;
    QRLabel37: TQRLabel;
    QRBand28: TQRBand;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRBand29: TQRBand;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRBand30: TQRBand;
    QRLabel43: TQRLabel;
    QRSysData12: TQRSysData;
    sql_contaspagar: TMyQuery;
    relatorioBalanco: TQuickRep;
    QRBand31: TQRBand;
    QRSysData13: TQRSysData;
    QRBand32: TQRBand;
    QRLabel44: TQRLabel;
    QRBand33: TQRBand;
    QRLabel45: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRBand34: TQRBand;
    QRDBText32: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRBand35: TQRBand;
    QRLabel50: TQRLabel;
    QRSysData14: TQRSysData;
    sql_caixa: TMyQuery;
    sql_fluxo: TMyQuery;
    relatorioFluxo: TQuickRep;
    QRBand36: TQRBand;
    QRSysData15: TQRSysData;
    QRBand37: TQRBand;
    QRLabel46: TQRLabel;
    QRBand38: TQRBand;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRBand39: TQRBand;
    QRDBText33: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRBand40: TQRBand;
    QRLabel55: TQRLabel;
    QRSysData16: TQRSysData;
    procedure QRDBText30Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MontarSqlCompra(pData1: TDate; pData2: TDate);
    procedure MontarSqlVenda(pData1: TDate; pData2: TDate);
    procedure MontarSqlContaPagar(pData1: TDate; pData2: TDate);
    procedure MontarSqlCaixa(pData1: TDate; pData2: TDate);
    procedure MontarSqlFluxo(pData1: TDate; pData2: TDate);
  end;

var
  FrmRelatorioProdutos: TFrmRelatorioProdutos;

implementation

{$R *.dfm}

{ TFrmRelatorioProdutos }

procedure TFrmRelatorioProdutos.MontarSqlCaixa(pData1, pData2: TDate);
begin
     self.sql_caixa.Active := false;
     self.sql_caixa.SQL.Text := 'select * from caixa where caixa.caixa_data >= ' + QuotedStr(FormatDateTime('yyyy/mm/dd',pData1)) + ' and caixa.caixa_data <= ' + QuotedStr(FormatDateTime('yyyy/mm/dd',pData2));
     self.sql_caixa.Active := true;
     self.QRLabel44.Caption := 'Relatório de balanço de caixa por período - ' + Datetostr(pData1) + ' à ' + Datetostr(Pdata2);
end;

procedure TFrmRelatorioProdutos.MontarSqlCompra(pData1, pData2: TDate);
begin
     self.sql_compras.Active := false;
     self.sql_compras.SQL.Text := 'select * from compras, fornecedores where (fornecedores.for_id = compras.compra_codFornecedor) and (compras.compra_dataEmissao >= ' + QuotedStr(FormatDateTime('yyyy/mm/dd',pData1)) + ' and compras.compra_dataEmissao <= ' + QuotedStr(FormatDateTime('yyyy/mm/dd',pData2)) + ')';
     self.sql_compras.Active := true;
     self.QRLabel23.Caption := 'Relatório de compras por período - ' + Datetostr(pData1) + ' à ' + Datetostr(Pdata2);
end;

procedure TFrmRelatorioProdutos.MontarSqlContaPagar(pData1, pData2: TDate);
begin
     self.sql_contaspagar.Active := false;
     self.sql_contaspagar.SQL.Text := 'select * from contaspagar where contaP_vencimento >= ' + QuotedStr(FormatDateTime('yyyy/mm/dd',pData1)) + ' and contaP_vencimento <= ' + QuotedStr(FormatDateTime('yyyy/mm/dd',pData2));
     self.sql_contaspagar.Active := true;
     self.QRLabel37.Caption := 'Relatório de Contas a pagar por período - ' + Datetostr(pData1) + ' à ' + Datetostr(Pdata2);
end;

procedure TFrmRelatorioProdutos.MontarSqlFluxo(pData1, pData2: TDate);
begin
     self.sql_fluxo.Active := false;
     self.sql_fluxo.SQL.Text := 'select * from fluxo where fluxo.fluxo_data >= ' + QuotedStr(FormatDateTime('yyyy/mm/dd',pData1)) + ' and fluxo.fluxo_data <= ' + QuotedStr(FormatDateTime('yyyy/mm/dd',pData2));
     self.sql_fluxo.Active := true;
     self.QRLabel27.Caption := 'Fluxo de caixa por período - ' + Datetostr(pData1) + ' à ' + Datetostr(Pdata2);
end;

procedure TFrmRelatorioProdutos.MontarSqlVenda(pData1, pData2: TDate);
begin
     self.sql_vendas.Active := false;
     self.sql_vendas.SQL.Text := 'select * from vendas, clientes where (clientes.cli_id = vendas.venda_codCliente) and (vendas.venda_dataEmissao >= ' + QuotedStr(FormatDateTime('yyyy/mm/dd',pData1)) + ' and vendas.venda_dataEmissao <= ' + QuotedStr(FormatDateTime('yyyy/mm/dd',pData2)) + ') order by vendas.venda_numeroNota';
     self.sql_vendas.Active := true;
     self.QRLabel27.Caption := 'Relatório de vendas por período - ' + Datetostr(pData1) + ' à ' + Datetostr(Pdata2);
end;

procedure TFrmRelatorioProdutos.QRDBText30Print(sender: TObject;
  var Value: String);
begin
     if value = '0' then
       value := 'Em aberto'
     else
       value := 'Paga';
end;

end.
