unit uInter;
// implementa a interface, responsável por chamar os Form e comunica-los entre si
interface
  uses uFrmConsultaPais, uFrmConsultaEstado, uFrmConsultaCidade, uFrmConsultaCliente,
       uFrmCadastroPais, uFrmCadastroEstado, uFrmCadastroCidade, uFrmCadastroCliente,
       uPais, uEstado, uCidade, uCliente, uController, uProduto, uForma, uUsuario,
       uFornecedor, uFrmConsultaFornecedor, uFrmCadastroFornecedor,uMarca,
       uFrmConsultaMarca, uFrmCadastroMarca, uFrmConsultaProduto, uFrmCadastroProduto,
       uFrmConsultaForma, uFrmCadastroForma, uFrmCadastroUsuario,
       uFrmConsultaUsuario, uGrupo, uFrmCadastroGrupo, uFrmConsultaGrupo,
       uFrmCadastroFuncionario,uFrmConsultaFuncionario, uFuncionario,
       uFrmCadastroCondicao, uFrmConsultaCondicao, uCondicao, ufrmConsultaImagem,
       ufrmConsultaTransportadora, uFrmCadastroTransportadora, uTransportadora,
       uCompra, uFrmConsultaCompra, uFrmCadastroCompra, uFrmConsultaVeiculo, uFrmCadastroVeiculo, uVeiculo,
       uVenda, uFrmConsultaVenda, uFrmCadastroVenda, uFrmConsultaContaPagar, uFrmCadastroContaPagar, uContaPagar,
       uFrmConsultaContaReceber, uFrmCadastroContaReceber, uContaReceber, uFrmCaixa, uFrmRelatorioProdutos;
       
    type Interfaces = class

    private
      { conhece os formularios existentes no sistema}
       umFrmConsultaPais    : TFrmConsultaPais;
       umFrmConsultaEstado  : TFrmConsultaEstado;
       umFrmConsultaCidade  : TFrmConsultaCidade;
       umFrmConsultaCliente : TFrmConsultaCliente;
       umFrmConsultaFornecedor : TFrmConsultaFornecedor;
       umFrmConsultaMarca : TFrmConsultaMarca;
       umFrmConsultaProduto : TFrmConsultaProduto;
       umFrmConsultaForma : TFrmConsultaForma;
       umFrmConsultaUsuario : TFrmConsultaUsuario;
       umFrmConsultaGrupo : TFrmConsultaGrupo;
       umFrmConsultaFuncionario : TFrmConsultaFuncionario;
       umFrmConsultaCondicao : TFrmConsultaCondicao;
       umFrmConsultaTransportadora: TFrmConsultaTransportadora;
       umFrmConsultaCompra: TFrmConsultaCompra;
       umFrmConsultaVeiculo: TFrmConsultaVeiculo;
       umFrmConsultaVenda: TFrmConsultaVendas;
       umFrmConsultaContaPagar: TFrmConsultaContaPagar;
       umFrmConsultaContaReceber: TFrmConsultaContaReceber;
       umFrmCaixa: TFrmCaixa;


       umFrmCadastroPais    : TFrmCadastroPais;
       umFrmCadastroEstado  : TFrmCadastroEstado;
       umFrmCadastroCidade  : TFrmCadastroCidade;
       umFrmCadastroCliente : TFrmCadastroCliente;
       umFrmCadastroFornecedor : TFrmCadastroFornecedor;
       umFrmCadastroMarca : TFrmCadastroMarca;
       umFrmCadastroProduto : TFrmCadastroProduto;
       umFrmCadastroForma : TFrmCadastroForma;
       umFrmCadastroUsuario: TFrmCadastroUsuario;
       umFrmCadastroGrupo: TFrmCadastroGrupo;
       umFrmCadastroFuncionario : TFrmCadastroFuncionario;
       umFrmCadastroCondicao : TFrmCadastroCondicao;
       umFrmConsultaImagem : TForm1;
       umFrmCadastroTransportadora: TFrmCadastroTransportadora;
       umFrmCadastroCompra: TFrmCadastroCompra;
       umFrmCadastroVeiculo: TFrmCadastroVeiculo;
       umFrmCadastroVenda: TFrmCadastroVenda;
       umFrmCadastroContaPagar: TFrmCadastroContaPagar;
       umFrmCadastroContaReceber: TFrmCadastroContaReceber;

    protected
      tipoUsuario: Boolean;
      umUsuarioLogado: Usuario;
    public
      umFrmRelatorioProdutos: TFrmRelatorioProdutos;
      constructor CrieObj;
      destructor Destrua_se;
      {as procedures PeçaDados exibem os formulários}
      procedure PDPais (pPais : Pais; pController: controller);
      procedure PDEstado (pEstado: Estado; pController: controller);
      procedure PDCidade (pCidade : Cidade; pController: controller);
      procedure PDCliente (pCliente : Cliente; pController: controller);
      procedure PDFornecedor (pFornecedor : fornecedor; pController: controller);
      procedure PDMarca (pMarca : Marca; pController: controller);
      procedure PDProduto (pProduto: Produto; pController : controller);
      procedure PDForma (pForma: Forma; pController : controller);
      procedure PDUsuario (pUsuario: Usuario; pController : controller);
      procedure PDGrupo (pGrupo: Grupo; pController : controller);
      procedure PDFuncionario (pFuncionario: Funcionario; pController : controller);
      procedure PDCondicao (pCondicao: Condicao; pController: controller);
      procedure PDTransportadora (pTransportadora: Transportadora; pController: controller);
      procedure PDCompra (pCompra: Compra; pController: controller);
      procedure PDVeiculo (pVeiculo: Veiculo; pController: controller);
      procedure PDVenda (pVenda: Venda; pController: controller);
      procedure PDContaPagar (pContaPagar: ContaPagar; pController: controller);
      procedure PDContaReceber (pContaReceber: ContaReceber; pController: controller);
      procedure PDCaixa (pController: controller);
      procedure PDRelatorioProdutos;
      procedure setTipoUsuario (pTipoUsuario: Boolean);
      function getTipoUsuario : Boolean;
      procedure setUsuarioLogado(pUsuario: Usuario);
end;

implementation

{ Interfaces }

//o construtor instancia os formulários e seta uns dentro dos outros quando necessário
constructor Interfaces.CrieObj;
begin
    umFrmCadastroPais    := TFrmCadastroPais.Create(nil);
    umFrmCadastroEstado  := TFrmCadastroEstado.Create(nil);
    umFrmCadastroCidade  := TFrmCadastroCidade.Create(nil);
    umFrmCadastroCliente := TFrmCadastroCliente.Create(nil);
    umFrmCadastroFornecedor := TFrmCadastroFornecedor.Create(nil);
    umFrmCadastroMarca := TFrmCadastroMarca.Create(nil);
    umFrmCadastroProduto := TFrmCadastroProduto.Create(nil);
    umFrmCadastroForma :=  TFrmCadastroForma.Create(nil);
    umFrmCadastroUsuario := TFrmCadastroUsuario.Create(nil);
    umFrmCadastroGrupo := TFrmCadastroGrupo.Create(nil);
    umFrmCadastroFuncionario := TFrmCadastroFuncionario.Create(nil);
    umFrmCadastroCondicao := TFrmCadastroCondicao.Create(nil);
    umFrmCadastroTransportadora := TFrmCadastroTransportadora.Create(nil);
    umFrmCadastroCompra := TFrmCadastroCompra.Create(nil);
    umFrmCadastroVeiculo := TFrmCadastroVeiculo.Create(nil);
    umfrmCadastroVenda := TFrmCadastroVenda.Create(nil);
    umFrmCadastroContaPagar := TFrmCadastroContaPagar.Create(nil);
    umFrmCadastroContaReceber := TFrmCadastroContaReceber.Create(nil);
    umFrmCaixa := TFrmCaixa.Create(nil);
    umFrmRelatorioProdutos := TFrmRelatorioProdutos.create(nil);

    umFrmConsultaPais    := TFrmConsultaPais.Create(nil);
    umFrmConsultaEstado  := TFrmConsultaEstado.Create(nil);
    umFrmConsultaCidade  := TFrmConsultaCidade.Create(nil);
    umFrmConsultaCliente := TFrmConsultaCliente.Create(nil);
    umFrmConsultaFornecedor := TFrmConsultaFornecedor.Create(nil);
    umFrmConsultaMarca := TFrmConsultaMarca.Create(nil);
    umFrmConsultaProduto := TFrmConsultaProduto.Create(nil);
    umFrmConsultaForma := TFrmConsultaForma.Create(nil);
    umFrmConsultaUsuario := TFrmConsultaUsuario.Create(nil);
    umFrmConsultaGrupo := TFrmConsultaGrupo.Create(nil);
    umFrmConsultaFuncionario := TFrmConsultaFuncionario.Create(nil);
    umFrmConsultaCondicao := TFrmConsultaCondicao.Create(nil);
    umFrmConsultaImagem := TForm1.Create(nil);
    umFrmConsultaTransportadora := TFrmConsultaTransportadora.Create(nil);
    umFrmConsultaCompra := TFrmConsultaCompra.Create(nil);
    umFrmConsultaVeiculo := TFrmConsultaVeiculo.Create(nil);
    umfrmconsultaVenda := TFrmConsultaVendas.Create(nil);
    umFrmConsultaContaPagar := TFrmConsultaContaPagar.Create(nil);
    umFrmConsultaContaReceber := TFrmConsultaContaReceber.Create(nil);

    umFrmConsultaPais.SetFormCad(umFrmCadastroPais);
    umFrmConsultaEstado.setFormCad (umFrmCadastroEstado);
    umFrmConsultaCidade.SetFormCad(umFrmCadastroCidade);
    umFrmConsultaCliente.SetFormCad(umFrmCadastroCliente);
    umFrmConsultaFornecedor.SetFormCad(umFrmCadastroFornecedor);
    umFrmConsultaMarca.SetFormCad(umFrmCadastroMarca);
    umFrmConsultaProduto.SetFormCad(umFrmCadastroProduto);
    umFrmConsultaForma.SetFormCad(umFrmCadastroForma);
    umFrmConsultaUsuario.SetFormCad(umFrmCadastroUsuario);
    umFrmConsultaGrupo.SetFormCad(umFrmCadastroGrupo);
    umFrmConsultaFuncionario.SetFormCad(umFrmCadastroFuncionario);
    umFrmConsultaTransportadora.SetFormCad(umFrmCadastroTransportadora);
    umFrmConsultaCompra.SetFormCad(umFrmCadastroCompra);
    umFrmConsultaVeiculo.SetFormCad(umFrmCadastroVeiculo);
    umfrmconsultaVenda.SetFormCad(umFrmCadastroVenda);
    umFrmConsultaContaPagar.SetFormCad(umFrmCadastroContaPagar);
    umFrmConsultaContaReceber.SetFormCad(umFrmCadastroContaReceber);

    umFrmConsultaCondicao.SetFormCad(umFrmCadastroCondicao);

    umFrmCadastroEstado.SetConsultaPais(umFrmConsultaPais);
    umFrmCadastroCidade.SetConsultaEstado(umFrmConsultaEstado);
    umFrmCadastroCliente.SetConsultaCidade(umFrmConsultaCidade);
    umFrmCadastroCliente.SetConsultaCondicao(umFrmConsultaCondicao);
    umFrmCadastroFornecedor.SetConsultaCidade(umFrmConsultaCidade);
    umFrmCadastroFornecedor.SetConsultaCondicao(umFrmConsultaCondicao);
    umFrmCadastroFuncionario.SetConsultaCidade(umFrmConsultaCidade);
    umFrmCadastroUsuario.SetConsultaFuncionario(umFrmConsultaFuncionario);
    umFrmCadastroCondicao.SetConsultaForma(umFrmConsultaForma);

    umFrmCadastroProduto.SetConsultaMarca(umFrmConsultaMarca);
    umFrmCadastroProduto.SetConsultaFornecedor(umFrmConsultaFornecedor);
    umFrmCadastroProduto.SetConsultaGrupo(umFrmConsultaGrupo);
    umFrmCadastroProduto.SetConsultaImagem(umFrmConsultaImagem);

    umFrmCadastroTransportadora.SetConsultaCidade(umFrmConsultaCidade);
    umFrmCadastroTransportadora.SetConsultaVeiculo(umFrmConsultaVeiculo);

    umFrmCadastroCompra.SetConsultaCondicao(umFrmConsultaCondicao);
    umFrmCadastroCompra.SetConsultaFornecedor(umFrmConsultaFornecedor);
    umFrmCadastroCompra.SetConsultaTransportadora(umFrmConsultaTransportadora);
    umFrmCadastroCompra.SetConsultaProduto(umFrmConsultaProduto);

    umFrmCadastroVeiculo.SetConsultaEstado(umFrmConsultaEstado);

    umFrmCadastroVenda.SetConsultaCondicao(umFrmConsultaCondicao);
    umFrmCadastroVenda.SetConsultacliente(umFrmConsultaCliente);
    umFrmCadastroVenda.SetConsultaTransportadora(umFrmConsultaTransportadora);
    umFrmCadastroVenda.SetConsultaProduto(umFrmConsultaProduto);

    umFrmCadastroContaPagar.SetConsultaFornecedor(umFrmConsultaFornecedor);
    umFrmCadastroContaPagar.SetConsultaForma(umFrmConsultaForma);
    umFrmCadastroContaPagar.SetFormCad(umFrmCadastroCompra);

    umFrmCadastroContaReceber.SetConsultaCliente(umFrmConsultaCliente);
    umFrmCadastroContaReceber.SetConsultaForma(umFrmConsultaForma);
    umFrmCadastroContaReceber.SetFormCad(umFrmCadastroVenda);
end;

destructor Interfaces.Destrua_se;
begin
   umFrmConsultaPais.Free;
   umFrmConsultaEstado.Free;
   umFrmConsultaCidade.Free;
   umFrmConsultaCliente.Free;
   umFrmConsultaFornecedor.Free;
   umFrmConsultaMarca.Free;
   umFrmConsultaProduto.Free;
   umFrmConsultaUsuario.Free;
   umFrmConsultaGrupo.Free;
   umFrmConsultaFuncionario.Free;
   umFrmConsultaCondicao.Free;
   umFrmConsultaImagem.free;
   umFrmConsultaTransportadora.Free;
   umFrmConsultaCompra.Release;
   umFrmConsultaVeiculo.Free;
   umfrmconsultavenda.Free;
   umFrmConsultaContaPagar.Free;
   umFrmConsultaContaReceber.Free;
   umFrmCaixa.Free;
   umFrmRelatorioProdutos.free;

   umFrmCadastroPais.Free;
   umFrmCadastroEstado.Free;
   umFrmCadastroCidade.Free;
   umFrmCadastroCliente.Free;
   umFrmCadastroFornecedor.Free;
   umFrmCadastroMarca.Free;
   umFrmCadastroProduto.Free;
   umFrmCadastroUsuario.Free;
   umFrmCadastroGrupo.Free;
   umFrmCadastroFuncionario.Free;
   umFrmCadastroCondicao.Free;
   umFrmCadastroTransportadora.Free;
   umFrmCadastroCompra.Release;
   umFrmCadastroVeiculo.Free;
   umFrmCadastroVenda.Free;
   umFrmCadastroContaPagar.Free;
   umFrmCadastroContaReceber.Free;
end;

{ as procedures PD, antes de exibir os forms, passam por parametro
 os objetos que foram instanciados na aplicação }
 
function Interfaces.getTipoUsuario: Boolean;
begin
   Result := self.tipoUsuario;
end;

procedure Interfaces.PDCaixa(pController: controller);
begin
   umFrmCaixa.ConhecaObj(pController);
   umFrmCaixa.ShowModal;
end;

procedure Interfaces.PDCidade(pCidade: Cidade; pController: controller);
begin
    umFrmConsultaCidade.ConhecaObj(pCidade, pController);
    umFrmConsultaCidade.ShowModal;
end;

procedure Interfaces.PDCliente(pCliente: Cliente; pController : controller);
begin
    umFrmConsultaCliente.ConhecaObj(pCliente, pController);
    umFrmConsultaCliente.ShowModal;
end;

procedure Interfaces.PDCompra(pCompra: Compra; pController: controller);
begin
   umFrmConsultaCompra.setTipoUsuario(self.getTipoUsuario);
   umFrmConsultaCompra.ConhecaObj(pCompra,pController);
   umFrmConsultaCompra.ShowModal;
end;

procedure Interfaces.PDCondicao(pCondicao: Condicao;
  pController: controller);
begin
  umFrmConsultaCondicao.ConhecaObj(pCondicao,pController);
  umFrmConsultaCondicao.ShowModal;
end;

procedure Interfaces.PDContaPagar(pContaPagar: ContaPagar;
  pController: controller);
begin
   umFrmConsultaContaPagar.ConhecaObj(pContaPagar,pController);
   umFrmConsultaContaPagar.ShowModal;
end;

procedure Interfaces.PDContaReceber(pContaReceber: ContaReceber;
  pController: controller);
begin
   umFrmConsultaContaReceber.ConhecaObj(pContaReceber,pController);
   umFrmConsultaContaReceber.ShowModal;
end;

procedure Interfaces.PDEstado(pEstado: Estado; pController: controller);
begin
  umFrmConsultaEstado.ConhecaObj(pEstado, pController);
  umFrmConsultaEstado.ShowModal;
end;

procedure Interfaces.PDForma(pForma: Forma; pController: controller);
begin
  umFrmConsultaForma.ConhecaObj(pForma, pController);
  umFrmConsultaForma.ShowModal;
end;

procedure Interfaces.PDFornecedor(pFornecedor: fornecedor;
  pController: controller);
begin
  umFrmConsultaFornecedor.ConhecaObj(pFornecedor, pController);
  umFrmConsultaFornecedor.ShowModal;
end;

procedure Interfaces.PDFuncionario(pFuncionario: Funcionario;
  pController: controller);
begin
  umFrmConsultaFuncionario.ConhecaObj(pFuncionario,pController);
  umFrmConsultaFuncionario.ShowModal;
end;

procedure Interfaces.PDGrupo(pGrupo: Grupo; pController: controller);
begin
  umFrmConsultaGrupo.ConhecaObj(pGrupo, pController);
  umFrmConsultaGrupo.ShowModal;
end;

procedure Interfaces.PDMarca(pMarca: Marca; pController: controller);
begin
  umFrmConsultaMarca.ConhecaObj(pMarca, pController);
  umFrmConsultaMarca.ShowModal;
end;

procedure Interfaces.PDPais(pPais: Pais; pController: controller);
begin
  umFrmConsultaPais.ConhecaObj(pPais, pController);
  umFrmConsultaPais.ShowModal;
end;

procedure Interfaces.PDProduto(pProduto: Produto; pController: controller);
begin
  umFrmConsultaProduto.setTipoUsuario(self.getTipoUsuario);
  umFrmConsultaProduto.ConhecaObj(pProduto, pController);
  umFrmConsultaProduto.ShowModal;
end;

procedure Interfaces.PDRelatorioProdutos;
begin
   umFrmRelatorioProdutos.showmodal;
end;

procedure Interfaces.PDTransportadora(pTransportadora: Transportadora;
  pController: controller);
begin
  umFrmConsultaTransportadora.ConhecaObj(pTransportadora,pController);
  umFrmConsultaTransportadora.ShowModal;
end;

procedure Interfaces.PDUsuario(pUsuario: Usuario; pController: controller);
begin
  umfrmconsultausuario.setUsuarioLogado(self.umUsuarioLogado);
  umFrmConsultaUsuario.ConhecaObj(pUsuario, pController);
  umFrmConsultaUsuario.ShowModal;
end;

procedure Interfaces.PDVeiculo(pVeiculo: Veiculo; pController: controller);
begin
    umFrmConsultaVeiculo.ConhecaObj(pveiculo,pController);
    umFrmConsultaVeiculo.ShowModal;
end;

procedure Interfaces.PDVenda(pVenda: Venda; pController: controller);
begin
   umFrmConsultaVenda.ConhecaObj(pVenda,pController);
   umFrmConsultaVenda.ShowModal;
end;

procedure Interfaces.setTipoUsuario(pTipoUsuario: Boolean);
begin
  self.tipoUsuario := pTipoUsuario;
end;

procedure Interfaces.setUsuarioLogado(pUsuario: Usuario);
begin
    self.umUsuarioLogado := pUsuario;
end;

end.
