unit uController;
// implementa a controller, que aplica as regras de negocio e se comunica dom a DAO

interface
  uses uDao, DB, sysutils, DBAccess, MyAccess, MemDS, uControllerMarca,
  uControllerEstado, uControllerFornecedor, uControllerCliente, uControllerCidade,
  uControllerPais, uControllerProduto, uControllerForma, uControllerUsuario,
  uControllerGrupo, uControllerFuncionario, uControllerCondicao, uControllerParcela,
  uControllerTransportadora, ucontrollerItemCompra, uControllerCompra, uControllerVeiculo,
  uControllerItemVenda, uControllerVenda, uControllerContaPagar, uControllerContaReceber, uControllerCaixa, uControllerFluxo;

  type controller = class

  private

  protected
    umDao : Dao;
    umControllerMarca : controllerMarca;
    umControllerFornecedor : controllerFornecedor;
    umControllerCliente : controllerCliente;
    umControllerCidade : controllerCidade;
    umControllerEstado : controllerEstado;
    umControllerPais : controllerPais;
    umControllerProduto : controllerProduto;
    umControllerForma : controllerForma;
    umControllerUsuario : ControllerUsuario;
    umControllerGrupo : controllerGrupo;
    umControllerFuncionario : controllerFuncionario;
    umControllerCondicao : controllerCondicao;
    umControllerParcela: controllerParcela;
    umControllerTransportadora: controllerTransportadora;
    umControllerItemCompra: controllerItemCompra;
    umControllerCompra: controllerCompra;
    umControllerVeiculo: controllerVeiculo;
    umControllerItemVenda: controllerItemVenda;
    umControllerVenda: controllerVenda;
    umControllerContaPagar: ControllerContaPagar;
    umControllerContaReceber: ControllerContaReceber;
    umControllerCaixa: ControllerCaixa;
    umControllerFluxo: controllerFluxo;

  public
    constructor CrieObj;
    destructor destrua_se;

    procedure setControllerFluxo (pControllerFluxo: ControllerFluxo);
    function getControllerFluxo : ControllerFluxo;

    procedure setControllerCaixa (pControllerCaixa: ControllerCaixa);
    function getControllerCaixa : ControllerCaixa;

    procedure setControllerContaReceber (pControllerContaReceber: ControllerContaReceber);
    function getControllerContaReceber : ControllerContaReceber;

    procedure setControllerContaPagar (pControllerContaPagar: ControllerContaPagar);
    function getControllerContaPagar : ControllerContaPagar;

    procedure setControllerVenda (pControllerVenda: controllerVenda);
    function getControllerVenda : controllerVenda;

    procedure setControllerVeiculo (pControllerVeiculo: controllerVeiculo);
    function getControllerVeiculo : controllerVeiculo;

    procedure setControllerCompra (pControllerCompra: controllerCompra);
    function getControllerCompra : controllerCompra;

    procedure setControllerItemCompra (pControllerItemCompra: controllerItemCompra);
    function getControllerItemCompra : controllerItemCompra;

    procedure setControllerItemVenda (pControllerItemVenda: controllerItemVenda);
    function getControllerItemVenda : controllerItemVenda;

    procedure setControllerTransportadora (pControllerTransportadora: controllerTransportadora);
    function getControllerTransportadora : controllerTransportadora;

    procedure setControllerParcela (pControllerParcela: controllerParcela);
    function getControllerParcela : controllerParcela;

    procedure setControllerCondicao (pControllerCondicao: controllerCondicao);
    function getControllerCondicao : controllerCondicao;

    procedure setControllerFuncionario (pControllerFuncionario: controllerFuncionario);
    function getControllerFuncionario : controllerFuncionario;

    procedure setControllerGrupo (pControllerGrupo: controllerGrupo);
    function getControllerGrupo : controllerGrupo;

    procedure setControllerUsuario (pControllerUsuario: controllerUsuario);
    function getControllerUsuario : controllerUsuario;

    procedure setControllerForma (pControllerForma: controllerForma);
    function getControllerForma : controllerForma;

    procedure setControllerProduto (pControllerProduto: controllerProduto);
    function getControllerProduto : controllerProduto;

    procedure setControllerMarca (pControllerMarca: controllerMarca);
    function getControllerMarca : controllerMarca;

    procedure setControllerFornecedor (pControllerFornecedor : controllerFornecedor);
    function getControllerFornecedor : controllerFornecedor;

    procedure setControllerCliente (pControllerCliente : controllerCliente);
    function getControllerCliente : controllerCliente;

    procedure setControllerCidade (pControllerCidade : controllerCidade);
    function getControllerCidade : controllerCidade;

    procedure setControllerEstado (pControllerEstado : controllerEstado);
    function getControllerEstado : controllerEstado;

    procedure setControllerPais (pControllerPais : controllerPais);
    function getControllerPais : controllerPais;
end;

implementation

{ controller }

// ------------- CONSTRUCTOR E DESTRUCTOR ------------
constructor controller.CrieObj;
begin
  umDao := dao.CrieObjeto;
  umControllerMarca := controllerMarca.CrieObj;
  umControllerFornecedor := controllerFornecedor.CrieObj;
  umControllerCliente := controllerCliente.CrieObj;
  umControllerCidade := controllerCidade.CrieObj;
  umControllerEstado := controllerEstado.CrieObj;
  umControllerPais := controllerPais.CrieObj;
  umControllerProduto := controllerProduto.CrieObj;
  umControllerForma := controllerForma.CrieObj;
  umControllerUsuario := controllerUsuario.CrieObj;
  umControllerGrupo := controllerGrupo.CrieObj;
  umControllerFuncionario := controllerFuncionario.CrieObj;
  umControllerCondicao := controllerCondicao.CrieObj;
  umControllerParcela := controllerParcela.CrieObj;
  umControllerTransportadora := controllerTransportadora.CrieObj;
  umControllerItemCompra := controllerItemCompra.CrieObj;
  umControllerCompra := controllerCompra.CrieObj;
  umControllerVeiculo := controllerVeiculo.CrieObj;
  umControllerItemVenda := controllerItemVenda.CrieObj;
  umControllerVenda := controllervenda.CrieObj;
  umControllerContaPagar := controllerContaPagar.CrieObj;
  umControllerContaReceber := controllerContaReceber.CrieObj;
  umControllerCaixa := controllerCaixa.CrieObj;
  umControllerFluxo := controllerFluxo.CrieObj;
end;

destructor controller.destrua_se;
begin
  umDao.destrua_se;
  umControllerMarca.destrua_se;
  umControllerFornecedor.destrua_se;
  umControllerCliente.destrua_se;
  umControllerCidade.destrua_se;
  umControllerEstado.destrua_se;
  umControllerPais.destrua_se;
  umControllerProduto.destrua_se;
  umControllerForma.destrua_se;
  umControllerUsuario.destrua_se;
  umControllerGrupo.destrua_se;
  umControllerFuncionario.destrua_se;
  umControllerCondicao.destrua_se;
  umControllerParcela.destrua_se;
  umControllerTransportadora.destrua_se;
  umControllerItemCompra.destrua_se;
  umControllerCompra.destrua_se;
  umControllerVeiculo.destrua_se;
  umControllerItemVenda.destrua_se;
  umControllerVenda.destrua_se;
  umControllerContaPagar.destrua_se;
  umControllerContaReceber.destrua_se;
  umControllerCaixa.destrua_se;
  umControllerFluxo.destrua_se;
end;

// --------------- setters and getters -> PRODUTO ------------------
function controller.getControllerProduto: controllerProduto;
begin
   Result := self.umControllerProduto;
end;

procedure controller.setControllerProduto(
  pControllerProduto: controllerProduto);
begin
   self.umControllerProduto := pControllerProduto;
end;

// ------------------- setters and getters -> MARCA ------------------
function controller.getControllerMarca: controllerMarca;
begin
    Result := self.umControllerMarca;
end;

procedure controller.setControllerMarca(pControllerMarca: controllerMarca);
begin
    self.umControllerMarca := pControllerMarca;
end;


// --------------- setters and getters -> FORNECEDOR ------------------
function controller.getControllerFornecedor: controllerFornecedor;
begin
    Result := self.umControllerFornecedor;
end;

procedure controller.setControllerFornecedor(
  pControllerFornecedor: controllerFornecedor);
begin
  self.umControllerFornecedor := pControllerFornecedor;
end;

// --------------- setters and getters -> CLIENTE ------------------
function controller.getControllerCliente: controllerCliente;
begin
    Result := Self.umControllerCliente;
end;

procedure controller.setControllerCliente(
  pControllerCliente: controllerCliente);
begin
    self.umControllerCliente := pControllerCliente;
end;


// --------------- setters and getters -> CIDADE ------------------
function controller.getControllerCidade: controllerCidade;
begin
  Result := self.umControllerCidade;
end;

procedure controller.setControllerCidade(
  pControllerCidade: controllerCidade);
begin
   self.umControllerCidade := pControllerCidade;
end;

// --------------- setters and getters -> ESTADO ------------------
function controller.getControllerEstado: controllerEstado;
begin
   Result := self.umControllerEstado;
end;

procedure controller.setControllerEstado(
  pControllerEstado: controllerEstado);
begin
  self.umControllerEstado := pControllerEstado;
end;

// --------------- setters and getters -> PAÍS ------------------
function controller.getControllerPais: controllerPais;
begin
   Result := self.umControllerPais;
end;

procedure controller.setControllerPais(pControllerPais: controllerPais);
begin
  self.umControllerPais := pControllerPais;
end;

// ------------ setters and getters -> FORMA DE PGTO ------------------
function controller.getControllerForma: controllerForma;
begin
   Result := self.umControllerForma;
end;

procedure controller.setControllerForma(pControllerForma: controllerForma);
begin
   self.umControllerForma := pControllerForma;
end;


// ------------ setters and getters -> USUÁRIO ------------------
function controller.getControllerUsuario: controllerUsuario;
begin
   Result := self.umControllerUsuario;
end;

procedure controller.setControllerUsuario(
  pControllerUsuario: controllerUsuario);
begin
   self.umControllerUsuario := pControllerUsuario;
end;

// ------------ setters and getters -> GRUPOS ------------------
function controller.getControllerGrupo: controllerGrupo;
begin
    Result := self.umControllerGrupo;
end;

procedure controller.setControllerGrupo(pControllerGrupo: controllerGrupo);
begin
   self.umControllerGrupo := pControllerGrupo;
end;

// ------------ setters and getters -> FUNCIONÁRIOS ------------------
function controller.getControllerFuncionario: controllerFuncionario;
begin
  Result := self.umControllerFuncionario;
end;

procedure controller.setControllerFuncionario(
  pControllerFuncionario: controllerFuncionario);
begin
  self.umControllerFuncionario := pControllerFuncionario;
end;

// ------------ setters and getters -> CONDIÇÃO PGTO ------------------
function controller.getControllerCondicao: controllerCondicao;
begin
   Result := self.umControllerCondicao;
end;

procedure controller.setControllerCondicao(
  pControllerCondicao: controllerCondicao);
begin
   self.umControllerCondicao := pControllerCondicao;
end;

// ------------ setters and getters -> PARCELA ------------------
function controller.getControllerParcela: controllerParcela;
begin
    Result := self.umControllerParcela;
end;

procedure controller.setControllerParcela(
  pControllerParcela: controllerParcela);
begin
   self.umControllerParcela := pControllerParcela;
end;


// ------------ setters and getters -> TRANSPORTADORA ------------------
function controller.getControllerTransportadora: controllerTransportadora;
begin
    Result := self.umControllerTransportadora;
end;

procedure controller.setControllerTransportadora(
  pControllerTransportadora: controllerTransportadora);
begin
    self.umControllerTransportadora := pControllerTransportadora;
end;

// ------------ setters and getters -> ITEM COMPRA ------------------
function controller.getControllerItemCompra: controllerItemCompra;
begin
    Result := self.umControllerItemCompra;
end;

procedure controller.setControllerItemCompra(
  pControllerItemCompra: controllerItemCompra);
begin
   self.umControllerItemCompra := pControllerItemCompra;
end;

// ------------ setters and getters -> COMPRA ------------------
function controller.getControllerCompra: controllerCompra;
begin
   result := self.umControllerCompra;
end;

procedure controller.setControllerCompra(
  pControllerCompra: controllerCompra);
begin
   self.umControllerCompra := pControllerCompra;
end;

// ------------ setters and getters -> VEICULO ------------------
function controller.getControllerVeiculo: controllerVeiculo;
begin
   result := self.umControllerVeiculo;
end;

procedure controller.setControllerVeiculo(
  pControllerVeiculo: controllerVeiculo);
begin
    self.umControllerVeiculo := pControllerVeiculo;
end;

// ------------ setters and getters -> ITEM VENDA ------------------
function controller.getControllerItemVenda: controllerItemVenda;
begin
  Result := self.umControllerItemVenda;
end;

procedure controller.setControllerItemVenda(
  pControllerItemVenda: controllerItemVenda);
begin
  self.umControllerItemVenda := pControllerItemVenda;
end;

// ------------ setters and getters ->  VENDA ------------------
function controller.getControllerVenda: controllerVenda;
begin
  result := umControllerVenda;
end;

procedure controller.setControllerVenda(pControllerVenda: controllerVenda);
begin
   self.umControllerVenda := pControllerVenda;
end;

// ------------ setters and getters ->  CONTA A PAGAR ------------------
function controller.getControllerContaPagar: ControllerContaPagar;
begin
   result := self.umControllerContaPagar;
end;

procedure controller.setControllerContaPagar(
  pControllerContaPagar: ControllerContaPagar);
begin
   self.umControllerContaPagar := pControllerContaPagar;
end;

// ------------ setters and getters ->  CONTA A RECEBER ------------------
function controller.getControllerContaReceber: ControllerContaReceber;
begin
   result := self.umControllerContaReceber;
end;

procedure controller.setControllerContaReceber(
  pControllerContaReceber: ControllerContaReceber);
begin
    self.umControllerContaReceber := pControllerContaReceber;
end;

 // ------------ setters and getters ->  CAIXA ------------------
function controller.getControllerCaixa: ControllerCaixa;
begin
   result := self.umControllerCaixa;
end;

procedure controller.setControllerCaixa(pControllerCaixa: ControllerCaixa);
begin
  self.umControllerCaixa := pControllerCaixa;
end;

function controller.getControllerFluxo: ControllerFluxo;
begin
   Result := self.umControllerFluxo;
end;

procedure controller.setControllerFluxo(pControllerFluxo: ControllerFluxo);
begin
   self.umControllerFluxo := pControllerFluxo;
end;

end.

//----------- FIM DA CLASSE ---------------------------- FIM DA CLASSE --------

