unit uAplicacao;
// implementa o objeto aplicação, responsável por rodar o sistema
interface
  uses uPais, uEstado, uCidade, uCliente,
  uInter, uGerente, uController, uFornecedor, uMarca, uProduto,
  uFrmLogin, uForma, uUsuario, uGrupo, uFuncionario, uCondicao, uTransportadora, uCompra, uVeiculo, uVenda, uContaPagar, uContaReceber;

    type Aplicacao = class

    private

    protected
      { carrega os objetos que serão utilizados na aplicação }
      umPais    : pais;
      umEstado  : Estado;
      umaCidade : Cidade;
      umCliente : Cliente;
      umFornecedor : fornecedor;
      umaMarca : Marca;
      umProduto : Produto;
      umUsuario : Usuario;
      umaInter  : Interfaces;
      umGerente : TGerente;
      umController : controller;
      umFrmLogin: TFrmLogin;
      umaForma : forma;
      umGrupo: Grupo;
      umFuncionario : Funcionario;
      umaCondicao: Condicao;
      umaTransportadora: Transportadora;
      umaCompra: Compra;
      umVeiculo: Veiculo;
      umaVenda: venda;
      umaContaPagar: ContaPagar;
      umaContaReceber: ContaReceber;

    public
    constructor CrieObj;
    procedure InstanciaTudo;
    procedure DestruaTudo;
    destructor Destrua_se;
    procedure Execute_se;

end;

implementation


{ Aplicacao }
// instancia os objetos
constructor Aplicacao.CrieObj;
begin
  umFrmLogin := TFrmLogin.Create(nil);
end;

procedure Aplicacao.DestruaTudo;
begin
    umPais.Destrua_se;
    umEstado.Destrua_se;
    umaCidade.Destrua_se;
    umCliente.Destrua_se;
    umaInter.Destrua_se;
    umFornecedor.destrua_se;
    umaMarca.destrua_se;
    umProduto.destrua_se;
    umUsuario.destrua_se;
    umGrupo.destrua_se;
    umFuncionario.destrua_se;
    umaCondicao.destrua_se;
    umController.destrua_se;
    umaForma.destrua_se;
    umaTransportadora.destrua_se;
    umaCompra.destrua_se;
    umVeiculo.destrua_se;
    umaVenda.destrua_se;
    umaContaPagar.destrua_se;
    umaContaReceber.destrua_se;
end;

destructor Aplicacao.Destrua_se;
begin
   umFrmLogin.Free;
end;

//dá inicio ao sistema, passando a tarefa para o Gerente
procedure Aplicacao.Execute_se;
var userAux : Usuario;
label Retorna;
begin
// mostra a tela de login
   Retorna:
    umFrmLogin.ShowModal;

//verifica se o login foi feito e o tipo de usuário
    if umFrmLogin.logou then
        begin
        InstanciaTudo;
        userAux := umFrmLogin.getUsuarioLogado;
        umGerente.setUsuarioLogado(userAux);
        umGerente.setTipoUsuario(umFrmLogin.getTipoUsuario);
        umGerente.ConhecaObj(umaInter, umPais, umEstado, umaCidade, umCliente, umController, umFornecedor, umaMarca, umProduto, umaForma, umUsuario, umGrupo, umFuncionario, umaCondicao, umaTransportadora, umaCompra, umVeiculo, umaVenda, umaContaPagar, umaContaReceber);
        umFrmLogin.edt_usuario.Clear;
        umFrmLogin.edt_senha.Clear;
        umGerente.showModal;
        DestruaTudo;
        goto Retorna;
        end;
end;

procedure Aplicacao.InstanciaTudo;
begin
    umPais    := Pais.CrieObj;
    umEstado  := Estado.CrieObj;
    umCliente := Cliente.CrieObj;
    umaCidade := Cidade.CrieObj;
    umFornecedor := fornecedor.crieobj;
    umaMarca := Marca.crieobj;
    umProduto := Produto.crieobj;
    umUsuario := Usuario.crieobj;
    umGrupo := Grupo.crieobj;
    umFuncionario := Funcionario.crieobj;
    umaCondicao := Condicao.crieobj;
    umaInter  := Interfaces.CrieObj;
    umGerente := TGerente.Create(nil);
    umController := controller.CrieObj;
    umaForma := Forma.crieobj;
    umaTransportadora := Transportadora.CrieObj;
    umaCompra := Compra.crieobj;
    umVeiculo := Veiculo.crieobj;
    umavenda:= Venda.crieobj;
    umaContaPagar := ContaPagar.crieobj;
    umaContaReceber := ContaReceber.crieobj;
end;

end.
