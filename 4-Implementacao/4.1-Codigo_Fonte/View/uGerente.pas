unit uGerente;
//o Gerente é o formulário principal da aplicação 
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, uPais, uEstado, uCidade, uCliente,
  uInter, uController, uFornecedor, uMarca, uProduto, uForma, ExtCtrls,
  Buttons, ComCtrls, uUsuario, StdCtrls, uGrupo, uFuncionario, uCondicao,
  WinSkinData, uTransportadora, TestFramework, GuiTestRunner, uCompra, uVeiculo, uVenda, uContaPagar, uContaReceber, uFrmData;

type
  TGerente = class(TForm)
    menu_principal: TMainMenu;
    Cadastros1: TMenuItem;
    Pais1: TMenuItem;
    Estado1: TMenuItem;
    Cidade1: TMenuItem;
    mniN1: TMenuItem;
    Cliente1: TMenuItem;
    mniN2: TMenuItem;
    Fornecedor1: TMenuItem;
    Marca1: TMenuItem;
    Produtos1: TMenuItem;
    Formasdepagamento1: TMenuItem;
    N1: TMenuItem;
    Vendas1: TMenuItem;
    Consultarvendas1: TMenuItem;
    Compras1: TMenuItem;
    Novacompra1: TMenuItem;
    Configuraes1: TMenuItem;
    Ajuda1: TMenuItem;
    Usurios1: TMenuItem;
    N2: TMenuItem;
    Sair2: TMenuItem;
    Contas1: TMenuItem;
    Contasapagar1: TMenuItem;
    Contasareceber1: TMenuItem;
    pnl1: TPanel;
    btn_produtos: TSpeedButton;
    btn_clientes: TSpeedButton;
    btn_fornecedores: TSpeedButton;
    btn_marcas: TSpeedButton;
    btn_cidade: TSpeedButton;
    btn_novavenda: TSpeedButton;
    btn_novacompra: TSpeedButton;
    btn_sair: TSpeedButton;
    stBar1: TStatusBar;
    Gruposdeprodutos1: TMenuItem;
    Funcionarios1: TMenuItem;
    CondicaoPagamento1: TMenuItem;
    btn_func: TSpeedButton;
    SkinData1: TSkinData;
    transportadoras1: TMenuItem;
    Veculos1: TMenuItem;
    Contas2: TMenuItem;
    Contasapagare1: TMenuItem;
    Contasareceber2: TMenuItem;
    Abrircaixa1: TMenuItem;
    Fecharcaixa1: TMenuItem;
    N3: TMenuItem;
    relatorios1: TMenuItem;
    produtos2: TMenuItem;
    Clientesinadimplentes1: TMenuItem;
    FornecedoresCredores1: TMenuItem;
    Comprasporperodo1: TMenuItem;
    Vendasporperodo1: TMenuItem;
    Contasapagarporperodo1: TMenuItem;
    Balanoporperododirio1: TMenuItem;
    Fluxodecaixaporperodo1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Pais1Click(Sender: TObject);
    procedure Estado1Click(Sender: TObject);
    procedure Cidade1Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure Fornecedor1Click(Sender: TObject);
    procedure Marca1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Formasdepagamento1Click(Sender: TObject);
    procedure Sair2Click(Sender: TObject);
    procedure btn_produtosClick(Sender: TObject);
    procedure btn_clientesClick(Sender: TObject);
    procedure btn_fornecedoresClick(Sender: TObject);
    procedure btn_marcasClick(Sender: TObject);
    procedure btn_pasClick(Sender: TObject);
    procedure btn_estadoClick(Sender: TObject);
    procedure btn_cidadeClick(Sender: TObject);
    procedure btn_formasdepagamentoClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure Gruposdeprodutos1Click(Sender: TObject);
    procedure Funcionarios1Click(Sender: TObject);
    procedure CondicaoPagamento1Click(Sender: TObject);
    procedure btn_funcClick(Sender: TObject);
    procedure transportadoras1Click(Sender: TObject);
    procedure Novacompra1Click(Sender: TObject);
    procedure Veculos1Click(Sender: TObject);
    procedure btn_novacompraClick(Sender: TObject);
    procedure Consultarvendas1Click(Sender: TObject);
    procedure Contasapagare1Click(Sender: TObject);
    procedure btn_novavendaClick(Sender: TObject);
    procedure Contasareceber2Click(Sender: TObject);
    procedure Abrircaixa1Click(Sender: TObject);
    procedure Fecharcaixa1Click(Sender: TObject);
    procedure produtos2Click(Sender: TObject);
    procedure Clientesinadimplentes1Click(Sender: TObject);
    procedure FornecedoresCredores1Click(Sender: TObject);
    procedure Comprasporperodo1Click(Sender: TObject);
    procedure Vendasporperodo1Click(Sender: TObject);
    procedure Contasapagarporperodo1Click(Sender: TObject);
    procedure Balanoporperododirio1Click(Sender: TObject);
    procedure Fluxodecaixaporperodo1Click(Sender: TObject);
  private
    { Private declarations }
  protected
    umaInter : Interfaces;
    umPais    : Pais;
    umEstado  : Estado;
    umaCidade : Cidade;
    umCliente   : Cliente;
    umController : controller;
    umFornecedor : fornecedor;
    umaMarca : Marca;
    umProduto : Produto;
    umUsuario : Usuario;
    umGrupo : Grupo;
    umFuncionario : Funcionario;
    umaCondicao: Condicao;
    umaForma :  forma;
    umaTransportadora: Transportadora;
    umaCompra: Compra;
    tipoUsuario: Boolean;
    umUsuarioLogado : Usuario;
    umVeiculo : Veiculo;
    umaVenda: Venda;
    umaContaPagar: ContaPagar;
    umaContaReceber: ContaReceber;
    umFrmData: TFrmData;
  public
    { Public declarations }

      procedure ConhecaObj(pInter: Interfaces; pPais : Pais; pEstado : Estado; pCidade : Cidade; pCliente : Cliente; pController: controller; pFornecedor : fornecedor; pMarca : Marca; pProduto : Produto; pForma : Forma; pUsuario: Usuario; pGrupo: Grupo; pFuncionario : Funcionario; pCondicao: Condicao; pTransportadora: Transportadora; pCompra: Compra; pVeiculo: Veiculo; pVenda: venda; pContaPagar: ContaPagar; pContaReceber: ContaReceber);
      procedure RestringeAcesso;
      procedure permiteAcesso;
      procedure setTipoUsuario (pTipoUsuario: Boolean);
      function getTipoUsuario : Boolean;
      procedure setUsuarioLogado (pUsuario: Usuario);
      function getUsuarioLogado : Usuario;
      procedure CarregaStatusBar;
  end;

var
  Gerente: TGerente;

implementation

{$R *.dfm}

{ TGerente }
//onde ele recebe por parâmetro os objetos da aplicação
procedure TGerente.ConhecaObj(pInter: Interfaces; pPais: Pais;
  pEstado: Estado; pCidade: Cidade; pCliente: Cliente;
  pController: controller; pFornecedor : fornecedor;
  pMarca : Marca; pProduto : Produto; pForma : Forma;
  pUsuario: Usuario; pGrupo: Grupo; pFuncionario : Funcionario; pCondicao: Condicao;
  pTransportadora: Transportadora; pCompra: Compra; pVeiculo: Veiculo; pVenda: venda; pContaPagar: ContaPagar; pContaReceber: ContaReceber);
begin
  umPais := pPais;
  umEstado := pEstado;
  umaCidade := pCidade;
  umCliente := pCliente;
  umaInter := pInter;
  umController := pController;
  umFornecedor := pFornecedor;
  umaMarca := pMarca;
  umProduto := pProduto;
  umaForma := pForma;
  umUsuario := pUsuario;
  umGrupo:= pGrupo;
  umFuncionario := pFuncionario;
  umaCondicao := pCondicao;
  umaTransportadora := pTransportadora;
  umaCompra := pCompra;
  umVeiculo := pVeiculo;
  umaVenda := pVenda;
  umaContaPagar := pContaPagar;
  umaContaReceber := pContaReceber;
  umFrmData := TFrmData.Create(nil);

  umaInter.setTipoUsuario(self.getTipoUsuario);
  umainter.setUsuarioLogado(self.umUsuarioLogado);
  
      if umUsuarioLogado.getTipo = 0 then
        self.RestringeAcesso
      else
        self.permiteAcesso;

  self.CarregaStatusBar;
end;

procedure TGerente.RestringeAcesso;
begin
  self.Fornecedor1.Visible := False;
  Self.Produtos1.Visible := False;
  Self.Marca1.Visible := False;
  self.Formasdepagamento1.Visible := False;
  self.Compras1.Visible := False;
  self.Contas1.Visible := False;
  self.Usurios1.Visible := False;
  self.Funcionarios1.Visible := False;
  Self.Gruposdeprodutos1.Visible := False;
  self.btn_fornecedores.Visible := False;
  self.btn_marcas.Visible := False;

  self.btn_novacompra.Visible := False;
  self.CondicaoPagamento1.Visible := False;
  self.btn_func.Visible := False;
  self.transportadoras1.Visible := false;
  SELF.Veculos1.Visible := FALSE;
  self.Contas2.Visible := false;
end;

procedure TGerente.permiteAcesso;
begin
  self.Fornecedor1.Visible := True;
  Self.Produtos1.Visible := True;
  Self.Marca1.Visible := True;

  self.Compras1.Visible := True;
  self.Funcionarios1.Visible := True;
 // self.Contas1.Visible := True;
  self.Usurios1.Visible := True;
  Self.Gruposdeprodutos1.Visible := True;
  self.btn_fornecedores.Visible := True;
  self.btn_marcas.Visible := True;

  self.btn_novacompra.Visible := True;
  self.CondicaoPagamento1.Visible := True;
  self.btn_func.Visible := True;
  self.transportadoras1.Visible := True;
  self.Veculos1.Visible := true;
  self.Contas2.Visible := true;
end;

procedure TGerente.Sair1Click(Sender: TObject);
begin
  umFrmData.Free;
end;

// os eventos CLICK do menu chamam os métodos PD da interface, que exibe as telas
procedure TGerente.Pais1Click(Sender: TObject);
begin
  umaInter.PDPais(umPais,umController);
end;

procedure TGerente.Estado1Click(Sender: TObject);
begin
  umaInter.PDEstado(umEstado,umController);
end;

procedure TGerente.Cidade1Click(Sender: TObject);
begin
    umaInter.PDCidade(umaCidade,umController);
end;

procedure TGerente.Cliente1Click(Sender: TObject);
begin
    umaInter.PDCliente(umCliente,umController);
end;

procedure TGerente.Fornecedor1Click(Sender: TObject);
begin
    umaInter.PDFornecedor(umFornecedor,umController);
end;

procedure TGerente.Marca1Click(Sender: TObject);
begin
    umaInter.PDMarca(umaMarca,umController);
end;

procedure TGerente.Produtos1Click(Sender: TObject);
begin
     umaInter.PDProduto(umProduto,umController);
end;

procedure TGerente.Formasdepagamento1Click(Sender: TObject);
begin
    umaInter.PDForma(umaForma,umController);
end;

procedure TGerente.Sair2Click(Sender: TObject);
begin
    Close;
end;

procedure TGerente.btn_produtosClick(Sender: TObject);
begin
    self.Produtos1.Click;
end;

procedure TGerente.btn_clientesClick(Sender: TObject);
begin
    self.Cliente1.Click;
end;

procedure TGerente.btn_fornecedoresClick(Sender: TObject);
begin
    self.Fornecedor1.Click;
end;

procedure TGerente.btn_marcasClick(Sender: TObject);
begin
    Self.Marca1.Click;
end;

procedure TGerente.btn_pasClick(Sender: TObject);
begin
    self.Pais1.Click;
end;

procedure TGerente.btn_estadoClick(Sender: TObject);
begin
    self.Estado1.Click;
end;

procedure TGerente.btn_cidadeClick(Sender: TObject);
begin
    self.Cidade1.Click;
end;

procedure TGerente.btn_formasdepagamentoClick(Sender: TObject);
begin
    self.Formasdepagamento1.Click;
end;

procedure TGerente.btn_sairClick(Sender: TObject);
begin
    close;
end;

function TGerente.getTipoUsuario: Boolean;
begin
    Result := self.tipoUsuario;
end;

procedure TGerente.setTipoUsuario(pTipoUsuario: Boolean);
begin
   self.tipoUsuario := pTipoUsuario;
end;

procedure TGerente.Usurios1Click(Sender: TObject);
begin
  umaInter.PDUsuario(umUsuario, umController);
end;

procedure TGerente.setUsuarioLogado(pUsuario: Usuario);
begin
  self.umUsuarioLogado := pUsuario;
end;

function TGerente.getUsuarioLogado: Usuario;
begin
  Result := self.umUsuarioLogado;
end;

procedure TGerente.CarregaStatusBar;
var auxiliar, nome : string;
begin
      if getTipoUsuario = True then
          auxiliar := 'Administrador'
      else
          auxiliar := 'Usuário Restrito';

     nome := self.umUsuarioLogado.getNome;
     stBar1.Panels[0].Text:= ' Desenvolvido por Ricardo Augusto. ' + 'Logado como: ' + nome + ' - ' + auxiliar;
     stBar1.Panels[1].Text:= FormatDateTime(' dddd" , "dd" de "mmmm" de "yyyy',now);
     stBar1.Panels[2].Text:= ' Três Lagoas Móveis';

     stBar1.Panels[0].Width := 500;
     stBar1.Panels[1].Width := 300;
     stBar1.Panels[2].Width := 100;

end;

procedure TGerente.Gruposdeprodutos1Click(Sender: TObject);
begin
    umaInter.PDGrupo(umGrupo,umController);
end;



procedure TGerente.Funcionarios1Click(Sender: TObject);
begin
  umaInter.PDFuncionario(umFuncionario,umController);
end;

procedure TGerente.CondicaoPagamento1Click(Sender: TObject);
begin
  umaInter.PDCondicao(umaCondicao,umController);
end;

procedure TGerente.btn_funcClick(Sender: TObject);
begin
    self.Funcionarios1.Click;
end;

procedure TGerente.transportadoras1Click(Sender: TObject);
begin
    umaInter.PDTransportadora(umaTransportadora,umController);
end;

procedure TGerente.Novacompra1Click(Sender: TObject);
begin
   umaInter.PDCompra(umaCompra,umController);
end;

procedure TGerente.Veculos1Click(Sender: TObject);
begin
   umaInter.PDVeiculo(umVeiculo,umController);
end;

procedure TGerente.btn_novacompraClick(Sender: TObject);
begin
  Novacompra1.Click
end;

procedure TGerente.Consultarvendas1Click(Sender: TObject);
begin
    umaInter.PDVenda(umaVenda,umController);
end;

procedure TGerente.Contasapagare1Click(Sender: TObject);
begin
 umaInter.PDContaPagar(umaContaPagar,umController);
end;

procedure TGerente.btn_novavendaClick(Sender: TObject);
begin
  Consultarvendas1.Click;
end;

procedure TGerente.Contasareceber2Click(Sender: TObject);
begin
  umaInter.PDContaReceber(umaContaReceber,umController);
end;

procedure TGerente.Abrircaixa1Click(Sender: TObject);
begin
   umaInter.PDCaixa(umController);
end;

procedure TGerente.Fecharcaixa1Click(Sender: TObject);
var selected : integer;
men : TForm;
outraForma: Forma;
valorFechar: string;
begin
     men := CreateMessageDialog('Deseja mesmo fechar o caixa?',mtCustom,[mbYes,mbAbort]);
     men.Caption := 'Confirmação';
     men.Position := poScreenCenter;
     selected := men.ShowModal;

    if selected = mrYes  then
       begin
          valorfechar := umController.getControllerCaixa.FecharCaixa;
          outraForma := forma.crieobj;
          outraForma.setCodigo(2);
          outraForma.setNome('CAIXA LOCAL');
          outraForma.setSaldo(0);
          umController.getControllerForma.salvaForma(outraForma);
          umController.getControllerFluxo.SalvarFluxo('FECHAMENTO',strtofloat(valorFechar));
          ShowMessage('Caixa fechado com sucesso!');
       end;
end;

procedure TGerente.produtos2Click(Sender: TObject);
begin
   umainter.umFrmRelatorioProdutos.QuickRep1.PreviewModal;
end;

procedure TGerente.Clientesinadimplentes1Click(Sender: TObject);
begin
   umainter.umFrmRelatorioProdutos.formularioClientes.PreviewModal;
end;

procedure TGerente.FornecedoresCredores1Click(Sender: TObject);
begin
   umaInter.umFrmRelatorioProdutos.relatorioFornecedores.PreviewModal;
end;

procedure TGerente.Comprasporperodo1Click(Sender: TObject);
begin
    umFrmData.ShowModal;
    umaInter.umFrmRelatorioProdutos.MontarSqlCompra(umfrmdata.dataInicio,umFrmData.dataFim);
    umaInter.umFrmRelatorioProdutos.relatorioCompras.PreviewModal;
end;

procedure TGerente.Vendasporperodo1Click(Sender: TObject);
begin
    umFrmData.ShowModal;
    umainter.umFrmRelatorioProdutos.MontarSqlVenda(umfrmdata.dataInicio,umFrmData.dataFim);
    umainter.umFrmRelatorioProdutos.relatorioVendas.PreviewModal;
end;

procedure TGerente.Contasapagarporperodo1Click(Sender: TObject);
begin
    umFrmData.ShowModal;
    umainter.umFrmRelatorioProdutos.MontarSqlContaPagar(umfrmdata.dataInicio,umFrmData.dataFim);
    umaInter.umFrmRelatorioProdutos.relatorioContasPagar.PreviewModal;
end;

procedure TGerente.Balanoporperododirio1Click(Sender: TObject);
begin
    umFrmData.ShowModal;
    umainter.umFrmRelatorioProdutos.MontarSqlCaixa(umfrmdata.dataInicio,umFrmData.dataFim);
    umaInter.umFrmRelatorioProdutos.relatorioBalanco.PreviewModal;
end;

procedure TGerente.Fluxodecaixaporperodo1Click(Sender: TObject);
begin
    umFrmData.ShowModal;
    umainter.umFrmRelatorioProdutos.MontarSqlFluxo(umfrmdata.dataInicio,umFrmData.dataFim);
    umaInter.umFrmRelatorioProdutos.relatorioFluxo.PreviewModal;
end;

end.
