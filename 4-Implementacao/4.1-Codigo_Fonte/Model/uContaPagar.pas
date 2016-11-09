unit uContaPagar;

interface
  uses uPai, uFornecedor, uForma;

  type ContaPagar = class(Pai)

  private

  protected
    dataCadastro: TDateTime;
    umfornecedor: fornecedor;
    documento : string[100];
    dataVencimento: TDateTime;
    valor: real;
    numeroParcela: integer;
    juros: real;
    observacao: string[50];
    status: integer;
    dataPagamento: TDateTime;
    umaForma: Forma;
    codCompra: integer;

  public
    constructor crieobj;
    destructor destrua_se;

    procedure setDataCadastro (pData  : TDateTime);
    function getDataCadastro  : TDateTime;

    procedure setDataVencimento (pData  : TDateTime);
    function getDataVencimento  : TDateTime;

    procedure setDataPagamento (pData  : TDateTime);
    function getDataPagamento  : TDateTime;

    procedure setDocumento (pDocumento  : string);
    function getDocumento  : string;

    procedure setValor (pValor  : real);
    function getValor  : real;

    procedure setJuros (pJuros  : real);
    function getJuros  : real;

    procedure setObservacao (pObservacao  : string);
    function getObservacao  : string;

    procedure setNumeroParcela (pNumeroParcela  : integer);
    function getNumeroParcela  : integer;

    procedure setStatus (pStatus  : integer);
    function getStatus  : integer;

    procedure setumFornecedor (pFornecedor  : Fornecedor);
    function getumFornecedor  : Fornecedor;

    procedure setumaForma (pForma  : Forma);
    function getumaForma  : Forma;

    procedure setCodCompra (pCodCompra  : integer);
    function getCodCompra  : integer;

end;

implementation

{ ContaPagar }

constructor ContaPagar.crieobj;
begin
    inherited;
    self.umfornecedor := fornecedor.crieobj;
    self.umaForma := forma.crieobj;
    self.umfornecedor.setCodigo(0);
    self.numeroParcela := 1;
    self.status := 0;
    self.codCompra := 0;
end;

destructor ContaPagar.destrua_se;
begin
  self.umfornecedor.destrua_se;
  self.umaForma.destrua_se;
end;

function ContaPagar.getCodCompra: integer;
begin
   result := self.codCompra;
end;

function ContaPagar.getDataCadastro: TDateTime;
begin
   result:= self.dataCadastro;
end;

function ContaPagar.getDataPagamento: TDateTime;
begin
  result:= self.dataPagamento;
end;

function ContaPagar.getDataVencimento: TDateTime;
begin
  result:= self.dataVencimento;
end;

function ContaPagar.getDocumento: string;
begin
 result:= self.documento;
end;

function ContaPagar.getJuros: real;
begin
  result:= self.juros;
end;

function ContaPagar.getNumeroParcela: integer;
begin
  result:= self.numeroParcela;
end;

function ContaPagar.getObservacao: string;
begin
 result:= self.observacao;
end;

function ContaPagar.getStatus: integer;
begin
  result:= self.status;
end;

function ContaPagar.getumaForma: Forma;
begin
  result:= self.umaForma;
end;

function ContaPagar.getumFornecedor: Fornecedor;
begin
  result:= self.umfornecedor;
end;

function ContaPagar.getValor: real;
begin
  result:= self.valor;
end;

procedure ContaPagar.setCodCompra(pCodCompra: integer);
begin
  self.codCompra := pCodCompra;
end;

procedure ContaPagar.setDataCadastro(pData: TDateTime);
begin
  self.dataCadastro := pData;
end;

procedure ContaPagar.setDataPagamento(pData: TDateTime);
begin
   self.dataPagamento := pData;
end;

procedure ContaPagar.setDataVencimento(pData: TDateTime);
begin
  self.dataVencimento := pData;
end;

procedure ContaPagar.setDocumento(pDocumento: string);
begin
   self.documento := pDocumento;
end;

procedure ContaPagar.setJuros(pJuros: real);
begin
  self.juros := pJuros;
end;

procedure ContaPagar.setNumeroParcela(pNumeroParcela: integer);
begin
  self.numeroParcela := pNumeroParcela;
end;

procedure ContaPagar.setObservacao(pObservacao: string);
begin
  self.observacao := pObservacao;
end;

procedure ContaPagar.setStatus(pStatus: integer);
begin
  self.status := pStatus;
end;

procedure ContaPagar.setumaForma(pForma: Forma);
begin
  self.umaForma := pForma;
end;

procedure ContaPagar.setumFornecedor(pFornecedor: Fornecedor);
begin
  self.umfornecedor := pFornecedor;
end;

procedure ContaPagar.setValor(pValor: real);
begin
  self.valor := pValor;
end;

end.
