program Moveis_Tres_Lagoas;

uses
  Forms,
  uGerente in 'View\uGerente.pas' {Gerente},
  uAplicacao in 'Model\uAplicacao.pas',
  uPai in 'Model\uPai.pas',
  uPais in 'Model\uPais.pas',
  uEstado in 'Model\uEstado.pas',
  uCidade in 'Model\uCidade.pas',
  uCliente in 'Model\uCliente.pas',
  uFrmConsultaPai in 'View\uFrmConsultaPai.pas' {FrmConsultaPai},
  uDm in 'Data\uDm.pas' {DataModule1: TDataModule},
  uDao in 'Data\uDao.pas',
  uController in 'Controller\uController.pas',
  uFrmCadastroPai in 'View\uFrmCadastroPai.pas' {FrmCadastroPai},
  uFrmConsultaPais in 'View\uFrmConsultaPais.pas' {FrmConsultaPais},
  uFrmConsultaEstado in 'View\uFrmConsultaEstado.pas' {FrmConsultaEstado},
  uFrmConsultaCidade in 'View\uFrmConsultaCidade.pas' {FrmConsultaCidade},
  uFrmConsultaCliente in 'View\uFrmConsultaCliente.pas' {FrmConsultaCliente},
  uFrmCadastroPais in 'View\uFrmCadastroPais.pas' {FrmCadastroPais},
  uFrmCadastroEstado in 'View\uFrmCadastroEstado.pas' {FrmCadastroEstado},
  uFrmCadastroCidade in 'View\uFrmCadastroCidade.pas' {FrmCadastroCidade},
  uFrmCadastroCliente in 'View\uFrmCadastroCliente.pas' {FrmCadastroCliente},
  uInter in 'View\uInter.pas',
  uFornecedor in 'Model\uFornecedor.pas',
  uFrmConsultaFornecedor in 'View\uFrmConsultaFornecedor.pas' {FrmConsultaFornecedor},
  uFrmCadastroFornecedor in 'View\uFrmCadastroFornecedor.pas' {FrmCadastroFornecedor},
  uMarca in 'Model\uMarca.pas',
  uFrmCadastroMarca in 'View\uFrmCadastroMarca.pas' {FrmCadastroMarca},
  uFrmConsultaMarca in 'View\uFrmConsultaMarca.pas' {FrmConsultaMarca},
  uControllerMarca in 'Controller\uControllerMarca.pas',
  uControllerFornecedor in 'Controller\uControllerFornecedor.pas',
  uControllerCliente in 'Controller\uControllerCliente.pas',
  uControllerCidade in 'Controller\uControllerCidade.pas',
  uControllerEstado in 'Controller\uControllerEstado.pas',
  uControllerPais in 'Controller\uControllerPais.pas',
  uDaoPais in 'Data\uDaoPais.pas',
  uDaoEstado in 'Data\uDaoEstado.pas',
  uDaoCidade in 'Data\uDaoCidade.pas',
  uDaoCliente in 'Data\uDaoCliente.pas',
  uDaoFornecedor in 'Data\uDaoFornecedor.pas',
  uDaoMarca in 'Data\uDaoMarca.pas',
  uProduto in 'Model\uProduto.pas',
  uDaoProduto in 'Data\uDaoProduto.pas',
  uControllerProduto in 'Controller\uControllerProduto.pas',
  uFrmCadastroProduto in 'View\uFrmCadastroProduto.pas' {FrmCadastroProduto},
  uFrmConsultaProduto in 'View\uFrmConsultaProduto.pas' {FrmConsultaProduto},
  uFrmLogin in 'View\uFrmLogin.pas' {FrmLogin},
  uControllerLogin in 'Controller\uControllerLogin.pas',
  uDaoLogin in 'Data\uDaoLogin.pas',
  uUsuario in 'Model\uUsuario.pas',
  uForma in 'Model\uForma.pas',
  uDaoForma in 'Data\uDaoForma.pas',
  uControllerForma in 'Controller\uControllerForma.pas',
  uFrmCadastroForma in 'View\uFrmCadastroForma.pas' {FrmCadastroForma},
  uFrmConsultaForma in 'View\uFrmConsultaForma.pas' {FrmConsultaForma},
  uDaoUsuario in 'Data\uDaoUsuario.pas',
  uControllerUsuario in 'Controller\uControllerUsuario.pas',
  uFrmCadastroUsuario in 'View\uFrmCadastroUsuario.pas' {FrmCadastroUsuario},
  uFrmConsultaUsuario in 'View\uFrmConsultaUsuario.pas' {FrmConsultaUsuario},
  uGrupo in 'Model\uGrupo.pas',
  uDaoGrupo in 'Data\uDaoGrupo.pas',
  uControllerGrupo in 'Controller\uControllerGrupo.pas',
  uFrmCadastroGrupo in 'View\uFrmCadastroGrupo.pas' {FrmCadastroGrupo},
  uFrmConsultaGrupo in 'View\uFrmConsultaGrupo.pas' {FrmConsultaGrupo},
  uFuncionario in 'Model\uFuncionario.pas',
  uDaoFuncionario in 'Data\uDaoFuncionario.pas',
  uControllerFuncionario in 'Controller\uControllerFuncionario.pas',
  uFrmCadastroFuncionario in 'View\uFrmCadastroFuncionario.pas' {FrmCadastroFuncionario},
  uFrmConsultaFuncionario in 'View\uFrmConsultaFuncionario.pas' {FrmConsultaFuncionario},
  uCondicao in 'Model\uCondicao.pas',
  uDaoCondicao in 'Data\uDaoCondicao.pas',
  uControllerCondicao in 'Controller\uControllerCondicao.pas',
  uFrmCadastroCondicao in 'View\uFrmCadastroCondicao.pas' {FrmCadastroCondicao},
  uFrmConsultaCondicao in 'View\uFrmConsultaCondicao.pas' {FrmConsultaCondicao},
  uParcela in 'Model\uParcela.pas',
  uDaoParcela in 'Data\uDaoParcela.pas',
  uControllerParcela in 'Controller\uControllerParcela.pas',
  uColecaoParcelas in 'Model\uColecaoParcelas.pas',
  uCompra in 'Model\uCompra.pas',
  uFrmCadastroVenda in 'View\uFrmCadastroVenda.pas' {FrmCadastroVenda},
  uFrmConsultaVenda in 'View\uFrmConsultaVenda.pas' {FrmConsultaVendas},
  uFrmCadastroCompra in 'View\uFrmCadastroCompra.pas' {FrmCadastroCompra},
  uFrmConsultaCompra in 'View\uFrmConsultaCompra.pas' {FrmConsultaCompra},
  uColecaoProdutos in 'Model\uColecaoProdutos.pas',
  uColecaoImagens in 'Model\uColecaoImagens.pas',
  uImagem in 'Model\uImagem.pas',
  uFrmConsultaImagem in 'View\uFrmConsultaImagem.pas' {Form1};

{$R *.res}

var
  umaAplicacao : Aplicacao;
begin
  umaAplicacao := Aplicacao.CrieObj;
  umaAplicacao.Execute_se;
  umaAplicacao.Destrua_se;
end.
