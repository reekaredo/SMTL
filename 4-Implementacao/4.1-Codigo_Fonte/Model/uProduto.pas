unit uProduto;

interface
  uses uMarca, uPai, uFornecedor, uGrupo;
    type Produto = class (Pai)

    private

    protected
        nome: string[70];
        barra: string[20];
        custo: Real;
        preco: Real;
        estoque: Integer;
        umaMarca: Marca;
        umFornecedor : fornecedor;
        observacao: string;

        unidade: Integer;
        referencia: string;
        dataCadastro: TDateTime;
        dataAlteracao: TDateTime;
        dataUltimaCompra: TDateTime;
        dataUltimaVenda: TDateTime;
        precoMin: Real;
        comissao: Real;
        umGrupo : Grupo;


    public
          constructor crieobj;
          destructor destrua_se;

          procedure setUnidade (pUnidade: Integer);
          function getUnidade : Integer;

          procedure setUmGrupo (pGrupo: Grupo);
          function getUmGrupo : Grupo;

          procedure setComissao (pComissao: Real);
          function getComissao : Real;

          procedure setPrecoMin (pPrecoMin: Real);
          function getPrecoMin : Real;

          procedure setDataUltimaVenda (pData: TDateTime);
          function getDataUltimaVenda : TDateTime;

          procedure setDataUltimaCompra (pData: TDateTime);
          function getDataUltimaCompra : TDateTime;

          procedure setDataCadastro (pData: TDateTime);
          function getDataCadastro : TDateTime;

          procedure setDataAlteracao (pData: TDateTime);
          function getDataAlteracao : TDateTime;

          procedure setReferencia (pReferencia: string);
          function getReferencia : string;

          procedure setNome (pNome: string);
          function getNome : string;

          procedure setBarra (pBarra: string);
          function getBarra : string;

          procedure setCusto (pCusto: Real);
          function getCusto : Real;

          procedure setPreco (pPreco: Real);
          function getPreco : Real;

          procedure setEstoque (pEstoque: Integer);
          function getEstoque : Integer;

          procedure setObservacao (pObservacao: string);
          function getObservacao : string;

          procedure setUmaMarca (pMarca: Marca);
          function getUmaMarca : Marca;

          procedure setUmFornecedor (pFornecedor: fornecedor);
          function getUmFornecedor : fornecedor;
end;

implementation

{ Produto }

constructor Produto.crieobj;
begin
        nome := '';
        barra:= '';
        custo:= 0;
        preco:= 0;
        estoque:= 0;
        umaMarca:= Marca.crieobj;
        umFornecedor := fornecedor.crieobj;
        observacao:= '';

        unidade:= 1;
        referencia:= '';
        precoMin:= 0;
        comissao:= 0;
        umGrupo:= Grupo.crieobj;
end;

destructor Produto.destrua_se;
begin
     umaMarca.destrua_se;
     umFornecedor.destrua_se;
     umGrupo.destrua_se;
end;

function Produto.getBarra: string;
begin
   Result:= self.barra;
end;

function Produto.getComissao: Real;
begin
    Result := comissao;
end;

function Produto.getCusto: Real;
begin
   Result := self.custo;
end;

function Produto.getDataAlteracao: TDateTime;
begin
  Result := dataAlteracao;
end;

function Produto.getDataCadastro: TDateTime;
begin
  Result := dataCadastro;
end;

function Produto.getDataUltimaCompra: TDateTime;
begin
  Result := dataUltimaCompra;
end;

function Produto.getDataUltimaVenda: TDateTime;
begin
    Result := dataUltimaVenda;
end;

function Produto.getEstoque: Integer;
begin
   Result := self.estoque;
end;

function Produto.getNome: string;
begin
   Result := self.nome;
end;

function Produto.getObservacao: string;
begin
   Result := self.observacao;
end;

function Produto.getPreco: Real;
begin
   Result := self.preco;
end;

function Produto.getPrecoMin: Real;
begin
  Result := precoMin;
end;

function Produto.getReferencia: string;
begin
   Result := referencia;
end;

function Produto.getUmaMarca: Marca;
begin
   Result := self.umaMarca;
end;

function Produto.getUmFornecedor: fornecedor;
begin
    Result := self.umFornecedor;
end;

function Produto.getUmGrupo: Grupo;
begin
   Result := umGrupo;
end;

function Produto.getUnidade: Integer;
begin
  Result := unidade;
end;

procedure Produto.setBarra(pBarra: string);
begin
   self.barra := pBarra;
end;

procedure Produto.setComissao(pComissao: Real);
begin
  comissao := pComissao;
end;

procedure Produto.setCusto(pCusto: Real);
begin
   self.custo := pCusto;
end;

procedure Produto.setDataAlteracao(pData: TDateTime);
begin
   dataAlteracao := pData;
end;

procedure Produto.setDataCadastro(pData: TDateTime);
begin
   dataCadastro := pData;
end;

procedure Produto.setDataUltimaCompra(pData: TDateTime);
begin
  dataUltimaCompra := pData;
end;

procedure Produto.setDataUltimaVenda(pData: TDateTime);
begin
  dataUltimaVenda := pData;
end;

procedure Produto.setEstoque(pEstoque: Integer);
begin
   self.estoque := pEstoque;
end;

procedure Produto.setNome(pNome: string);
begin
   self.nome := pNome;
end;

procedure Produto.setObservacao(pObservacao: string);
begin
  self.observacao := pObservacao;
end;

procedure Produto.setPreco(pPreco: Real);
begin
   self.preco := pPreco;
end;

procedure Produto.setPrecoMin(pPrecoMin: Real);
begin
  precoMin := pPrecoMin;
end;

procedure Produto.setReferencia(pReferencia: string);
begin
  referencia := pReferencia;
end;

procedure Produto.setUmaMarca(pMarca: Marca);
begin
   self.umaMarca := pMarca;
end;

procedure Produto.setUmFornecedor(pFornecedor: fornecedor);
begin
  Self.umFornecedor := pFornecedor;
end;

procedure Produto.setUmGrupo(pGrupo: Grupo);
begin
  umGrupo := pGrupo;
end;

procedure Produto.setUnidade(pUnidade: Integer);
begin
  unidade := pUnidade;
end;

end.
