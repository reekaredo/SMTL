unit uCompra;

interface
uses uPai, uForma, ufornecedor, uCondicao, uProduto;

  type Compra = class(Pai)

  private

  protected
     numeroNota: integer;
     serieNota: String;
     modelo: string;
     dataEmissao: TDateTime;
     datahegada: TDateTime;

     umFornecedor: fornecedor;
     umaCondicao: Condicao;
     umaListaProdutos: array[1..50] of Produto;
  public
end;

implementation

end.
 