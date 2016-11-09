unit uVenda;

interface
uses ucliente, uCondicao, uColecaoItensVenda, utransportadora, uVeiculo;

  type Venda = class

  private

  protected
     codVenda: integer;
     numeroNota: integer;
     umCliente: Cliente;
     serieNota: integer;
     tipoNota: integer;
     umatransportadora: Transportadora;
     umaCondicao: Condicao;
     umVeiculo: Veiculo;
     dataEmissao: TDateTime;
     datasaida: TDateTime;
     baseCalculoICMS: real;
     valorICMS: real;
     baseCalculoICMSsubst: real;
     valorICMSsubst: real;
     valorTotalProdutos: real;
     valorFrete: real;
     valorSeguro: real;
     desconto: real;
     outrasDespesasAcessorias: real;
     valorTotalIPI: real;
     valorTotal: real;
     qtde: integer;
     placaVeiculo: string;
     ufVeiculo: string;
     especie: string;
     marca: string;
     numeracao: string;
     pesoBruto: real;
     pesoLiquido: real;
     fretePorConta: string;
     listaProdutos: ColecaoItemVenda;
     categoria: char;

  public

    constructor crieobj;
    destructor destrua_se;

    procedure setCategoria(pCategoria: char);
    function getCategoria: char;

    procedure setListaProdutos(pLista: ColecaoItemVenda);
    function getListaProdutos: ColecaoItemVenda;

    procedure setCodVenda(pCodVenda: integer);
    function getCodVenda: integer;

    procedure setNumNota(pNum: integer);
    function getNumNota: integer;

    procedure setUmCliente(pCliente:  cliente);
    function getUmcliente: cliente;

    procedure setUmVeiculo(pVeiculo:  Veiculo);
    function getUmVeiculo: Veiculo;

    procedure setSerieNota(pSerie: integer);
    function getSerieNota: integer;

    procedure setTipoNota(pTipo: integer);
    function getTipoNota: integer;

    procedure setUmaTransportadora(pTransp: Transportadora);
    function getUmaTransportadora: Transportadora;

    procedure setUmaCondicao(pcondicao: Condicao);
    function getUmacondicao: Condicao;

    procedure setDataEmissao(pData: TDateTime);
    function getdataEmissao: TDateTime;

    procedure setDatasaida(pData: TDateTime);
    function getDatasaida: TDateTime;

    procedure setBaseICMS(pBase: real);
    function getBaseICMS: real;

    procedure setValorICMS(pValor: real);
    function getValorICMS:real;

    procedure setBaseICMSSubst(pBase:real);
    function getBaseICMSsubst: real;

    procedure setValorICMSSubst(pValor: real);
    function getValorICMSSubst:real;

    procedure setValorTotalProdutos(pValor:real);
    function getValorTotalProduos:real;

    procedure setValorFrete(pValor:real);
    function getValorFrete:real;

    procedure setValorSeguro(pValor:real);
    function getValorSeguro:real;

    procedure setDesconto(pDesconto:real);
    function getDesconto:real;

    procedure setOutrasDespesas(pOutras:real);
    function getOutrasDespesas:real;

    procedure setValorTotalIPI(pValor:real);
    function getValorTotalIPI:real;

    procedure setValorTotal(pValor:real);
    function getValorTotal:real;

    procedure setQtde(pQtde:integer);
    function getQtde:integer;

    procedure setPlacaVeiculo(pPlaca:string);
    function getPlacaVeiculo:string;

    procedure setUFveiculo(pUF:string);
    function getUFveiculo:string;

    procedure setEspecie(pEspecie:string);
    function getEspecie:string;

    procedure setMarca(pMarca:string);
    function getMarca:string;

    procedure setNumeracao(pNum:string);
    function getNumeracao:string;

    procedure setPesoBruto(pPeso:real);
    function getPesoBruto:real;

    procedure setPesoLiquido(pPeso:real);
    function getPesoLiquido:real;

    procedure setFretePorConta(pFrete:string);
    function getFretePorConta:string ;

end;

implementation

{ Venda }

constructor Venda.crieobj;
begin
   self.listaProdutos := ColecaoItemVenda.CrieObjeto;
   self.umCliente := cliente.crieobj;
   self.umatransportadora := Transportadora.crieobj;
   self.umaCondicao := Condicao.crieobj;
   self.umVeiculo := Veiculo.crieobj;
   self.tipoNota := 0;
   self.categoria := 'V';
end;

destructor Venda.destrua_se;
begin
  self.listaProdutos.destrua_se;
  self.umCliente.destrua_se;
  self.umatransportadora.destrua_se;
  self.umaCondicao.destrua_se;
  self.umVeiculo.destrua_se;
end;

function Venda.getBaseICMS: real;
begin
   result:= self.baseCalculoICMS;
end;

function Venda.getBaseICMSsubst: real;
begin
   result:= self.baseCalculoICMSsubst;
end;

function Venda.getCodVenda: integer;
begin
  result:= self.codVenda;
end;

function Venda.getDatasaida: TDateTime;
begin
  result:= self.datasaida;
end;

function Venda.getdataEmissao: TDateTime;
begin
  result:= self.dataEmissao;
end;

function Venda.getDesconto: real;
begin
  result:= self.desconto;
end;

function Venda.getEspecie: string;
begin
   result:= self.especie;
end;

function Venda.getFretePorConta: string;
begin
   result:= self.fretePorConta;
end;

function Venda.getListaProdutos: ColecaoItemVenda;
begin
  result:= self.listaProdutos;
end;

function Venda.getMarca: string;
begin
  result:= self.marca;
end;

function Venda.getNumeracao: string;
begin
  result:= self.numeracao;
end;

function Venda.getNumNota: integer;
begin
 result:= self.numeroNota;
end;

function Venda.getOutrasDespesas: real;
begin
  result:= self.outrasDespesasAcessorias;
end;

function Venda.getPesoBruto: real;
begin
  result:= self.pesoBruto;
end;

function Venda.getPesoLiquido: real;
begin
  result:= self.pesoLiquido;
end;

function Venda.getPlacaVeiculo: string;
begin
  result:= self.placaveiculo;
end;

function Venda.getQtde: integer;
begin
   result:= self.qtde;
end;

function Venda.getSerieNota: integer;
begin
   result:= self.serieNota;
end;

function Venda.getTipoNota: integer;
begin
  result:= self.tipoNota;
end;

function Venda.getUFveiculo: string;
begin
   result:= self.ufVeiculo;
end;

function Venda.getUmacondicao: Condicao;
begin
   result:= self.umaCondicao;
end;

function Venda.getUmaTransportadora: Transportadora;
begin
   result:= self.umatransportadora;
end;

function Venda.getUmcliente: cliente;
begin
   result:= self.umCliente;
end;

function Venda.getUmVeiculo: Veiculo;
begin
   result := self.umVeiculo;
end;

function Venda.getValorFrete: real;
begin
  result:= self.valorFrete;
end;

function Venda.getValorICMS: real;
begin
   result:= self.valorICMS;
end;

function Venda.getValorICMSSubst: real;
begin
  result:= self.valorICMSsubst;
end;

function Venda.getValorSeguro: real;
begin
  result:= self.valorSeguro;
end;

function Venda.getValorTotal: real;
begin
   result:= self.valorTotal;
end;

function Venda.getValorTotalIPI: real;
begin
  result:= self.valorTotalIPI;
end;

function Venda.getValorTotalProduos: real;
begin
   result:= self.valorTotalProdutos;
end;

procedure Venda.setBaseICMS(pBase: real);
begin
   self.baseCalculoICMS := pBase;
end;

procedure Venda.setBaseICMSSubst(pBase: real);
begin
  self.baseCalculoICMSsubst := pBase;
end;

procedure Venda.setCodVenda(pCodVenda: integer);
begin
   self.codVenda := pCodVenda;
end;

procedure Venda.setDatasaida(pData: TDateTime);
begin
  self.datasaida := pData;
end;

procedure Venda.setDataEmissao(pData: TDateTime);
begin
  self.dataEmissao := pData;
end;

procedure Venda.setDesconto(pDesconto: real);
begin
   self.desconto := pDesconto;
end;

procedure Venda.setEspecie(pEspecie: string);
begin
   self.especie := pEspecie;
end;

procedure Venda.setFretePorConta(pFrete: string);
begin
  self.fretePorConta := pFrete;
end;

procedure Venda.setListaProdutos(pLista: ColecaoItemVenda);
begin
  self.listaProdutos := pLista;
end;

procedure Venda.setMarca(pMarca: string);
begin
   self.marca := pMarca;
end;

procedure Venda.setNumeracao(pNum: string);
begin
  self.numeracao := pNum;
end;

procedure Venda.setNumNota(pNum: integer);
begin
   self.numeroNota := pNum;
end;

procedure Venda.setOutrasDespesas(pOutras: real);
begin
   self.outrasDespesasAcessorias := pOutras;
end;

procedure Venda.setPesoBruto(pPeso: real);
begin
  self.pesoBruto := pPeso;
end;

procedure Venda.setPesoLiquido(pPeso: real);
begin
   self.pesoLiquido := pPeso;
end;

procedure Venda.setPlacaVeiculo(pPlaca: string);
begin
  self.placaveiculo := pPlaca;
end;

procedure Venda.setQtde(pQtde: integer);
begin
  self.qtde := pQtde;
end;

procedure Venda.setSerieNota(pSerie: integer);
begin
   self.serieNota := pSerie;
end;

procedure Venda.setTipoNota(pTipo: integer);
begin
  self.tipoNota := pTipo;
end;

procedure Venda.setUFveiculo(pUF: string);
begin
  self.ufVeiculo := pUF;
end;

procedure Venda.setUmaCondicao(pcondicao: Condicao);
begin
  self.umaCondicao := pcondicao;
end;

procedure Venda.setUmaTransportadora(pTransp: Transportadora);
begin
  self.umatransportadora := pTransp;
end;

procedure Venda.setUmCliente(pCliente: cliente);
begin
   self.umCliente := pCliente;
end;

procedure Venda.setUmVeiculo(pVeiculo: Veiculo);
begin
    self.umVeiculo := pVeiculo;
end;

procedure Venda.setValorFrete(pValor: real);
begin
  self.valorFrete := pValor;
end;

procedure Venda.setValorICMS(pValor: real);
begin
 self.valorICMS := pValor;
end;

procedure Venda.setValorICMSSubst(pValor: real);
begin
  self.valorICMSsubst := pValor;
end;

procedure Venda.setValorSeguro(pValor: real);
begin
   self.valorSeguro := pValor;
end;

procedure Venda.setValorTotal(pValor: real);
begin
  self.valorTotal := pValor;
end;

procedure Venda.setValorTotalIPI(pValor: real);
begin
   self.valorTotalIPI := pValor;
end;

procedure Venda.setValorTotalProdutos(pValor: real);
begin
   self.valorTotalProdutos := pValor;
end;

function Venda.getCategoria: char;
begin
   result:= self.categoria;
end;

procedure Venda.setCategoria(pCategoria: char);
begin
   self.categoria := pCategoria;
end;

end.
