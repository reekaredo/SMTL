unit uFrmCadastroCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroPai, StdCtrls, ComCtrls, Buttons, uCompra, uController,
  uItemCompra, uColecaoItensCompra, uFrmConsultaCondicao, uFrmConsultaFornecedor,
  uFrmConsultaTransportadora,uFrmConsultaProduto, ExtCtrls, uProduto, uContaPagar;

type
  TFrmCadastroCompra = class(TFrmCadastroPai)
    lbl_nome: TLabel;
    lbl_1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edt_NumeroNota: TEdit;
    Label1: TLabel;
    edt_serieNota: TEdit;
    lbl_12: TLabel;
    edt_Fornecedor: TEdit;
    btn_buscar1: TButton;
    Label2: TLabel;
    edt_codCondicao: TEdit;
    edt_condicao: TEdit;
    btn_buscar3: TButton;
    Label4: TLabel;
    Label5: TLabel;
    edt_ncm: TEdit;
    edt_cst: TEdit;
    edt_produto: TEdit;
    btn_buscarProduto: TButton;
    Label7: TLabel;
    edt_ValorUnitario: TEdit;
    btn_add: TSpeedButton;
    btn_remove: TSpeedButton;
    ListView1: TListView;
    edt_codFornecedor: TEdit;
    Label6: TLabel;
    Label3: TLabel;
    edt_codProduto: TEdit;
    edt_Transportadora: TEdit;
    lbl_pais: TLabel;
    edt_CodTransportadora: TEdit;
    cbTipoNota: TComboBox;
    btn_buscar2: TButton;
    Label8: TLabel;
    Label9: TLabel;
    edt_baseICMS: TEdit;
    edt_valorICMS: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    edt_baseICMSsubst: TEdit;
    edt_desconto: TEdit;
    Label12: TLabel;
    edt_valortotalProdutos: TEdit;
    Label13: TLabel;
    edt_valorFrete: TEdit;
    Label14: TLabel;
    edt_ValorSeguro: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    edt_outrasDespesas: TEdit;
    edt_totalIPI: TEdit;
    Label17: TLabel;
    edt_ValorTotal: TEdit;
    Shape1: TShape;
    Label18: TLabel;
    Shape2: TShape;
    Label19: TLabel;
    Label20: TLabel;
    edt_valorIcmsSubst: TEdit;
    Label21: TLabel;
    Shape3: TShape;
    Label22: TLabel;
    edt_antt: TEdit;
    Label23: TLabel;
    Label24: TLabel;
    edt_placaVeiculo: TEdit;
    cbFrete: TComboBox;
    Label25: TLabel;
    edt_ufVeiculo: TEdit;
    edt_CNPJ: TEdit;
    Label26: TLabel;
    Label27: TLabel;
    edt_quantidade: TEdit;
    Label28: TLabel;
    Label29: TLabel;
    edt_pesobruto: TEdit;
    Label30: TLabel;
    edt_numeracao: TEdit;
    Label31: TLabel;
    edt_marca: TEdit;
    Label32: TLabel;
    edt_pesoLiquido: TEdit;
    Shape4: TShape;
    Label33: TLabel;
    Label34: TLabel;
    edt_cfop: TEdit;
    Label35: TLabel;
    edt_unid: TEdit;
    Label36: TLabel;
    edt_qtdeItem: TEdit;
    Label37: TLabel;
    edt_valortotalItem: TEdit;
    Label38: TLabel;
    edt_baseICMSitem: TEdit;
    Label39: TLabel;
    edt_ICMSitem: TEdit;
    Label40: TLabel;
    edt_ipiItem: TEdit;
    Label41: TLabel;
    edt_aliqICMS: TEdit;
    Label42: TLabel;
    edt_aliqIPI: TEdit;
    data_emissao: TDateTimePicker;
    data_chegada: TDateTimePicker;
    cb_especie: TComboBox;
    procedure btn_buscar1Click(Sender: TObject);
    procedure btn_buscar2Click(Sender: TObject);
    procedure btn_buscarProdutoClick(Sender: TObject);
    procedure btn_buscar3Click(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_removeClick(Sender: TObject);
    procedure cbTipoNotaKeyPress(Sender: TObject; var Key: Char);
    procedure cb_especieKeyPress(Sender: TObject; var Key: Char);
    procedure cbFreteKeyPress(Sender: TObject; var Key: Char);
    procedure cbTipoNotaExit(Sender: TObject);
    procedure cbFreteExit(Sender: TObject);
    procedure cb_especieExit(Sender: TObject);
    procedure edt_baseICMSExit(Sender: TObject);
    procedure edt_valorICMSExit(Sender: TObject);
    procedure edt_baseICMSsubstExit(Sender: TObject);
    procedure edt_valorIcmsSubstExit(Sender: TObject);
    procedure edt_valortotalProdutosExit(Sender: TObject);
    procedure edt_ValorTotalExit(Sender: TObject);
    procedure edt_valorFreteExit(Sender: TObject);
    procedure edt_ValorSeguroExit(Sender: TObject);
    procedure edt_descontoExit(Sender: TObject);
    procedure edt_outrasDespesasExit(Sender: TObject);
    procedure edt_totalIPIExit(Sender: TObject);
    procedure edt_pesobrutoExit(Sender: TObject);
    procedure edt_pesoLiquidoExit(Sender: TObject);
    procedure edt_ValorUnitarioExit(Sender: TObject);
    procedure edt_baseICMSitemExit(Sender: TObject);
    procedure edt_ICMSitemExit(Sender: TObject);
    procedure edt_ipiItemExit(Sender: TObject);
    procedure edt_aliqICMSExit(Sender: TObject);
    procedure edt_aliqIPIExit(Sender: TObject);
    procedure data_emissaoChange(Sender: TObject);
    procedure data_chegadaChange(Sender: TObject);
    procedure edt_baseICMSKeyPress(Sender: TObject; var Key: Char);
    procedure edt_valorICMSKeyPress(Sender: TObject; var Key: Char);
    procedure edt_baseICMSsubstKeyPress(Sender: TObject; var Key: Char);
    procedure edt_valorIcmsSubstKeyPress(Sender: TObject; var Key: Char);
    procedure edt_valortotalProdutosKeyPress(Sender: TObject;
      var Key: Char);
    procedure edt_valorFreteKeyPress(Sender: TObject; var Key: Char);
    procedure edt_ValorSeguroKeyPress(Sender: TObject; var Key: Char);
    procedure edt_descontoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_outrasDespesasKeyPress(Sender: TObject; var Key: Char);
    procedure edt_totalIPIKeyPress(Sender: TObject; var Key: Char);
    procedure edt_ValorTotalKeyPress(Sender: TObject; var Key: Char);
    procedure edt_quantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edt_quantidadeExit(Sender: TObject);
    procedure edt_aliqIPIKeyPress(Sender: TObject; var Key: Char);
    procedure edt_ValorUnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure edt_baseICMSitemKeyPress(Sender: TObject; var Key: Char);
    procedure edt_ICMSitemKeyPress(Sender: TObject; var Key: Char);
    procedure edt_ipiItemKeyPress(Sender: TObject; var Key: Char);
    procedure edt_aliqICMSKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    umaCompra : Compra;
    outraCompra: Compra;
    umFrmConsultaCondicao: TFrmConsultaCondicao;
    umFrmConsultaFornecedor: TFrmConsultaFornecedor;
    umFrmConsultaTransportadora: TFrmConsultaTransportadora;
    umFrmConsultaProduto: TfrmConsultaProduto;
    umItemCompra: ItemCompra;
    umProduto: Produto;
    umController : controller;
  protected
    tipoUsuario: boolean;
    codeGuardado: Integer;
    procedure Sair;  override;
    procedure Salvar; override;
    procedure CarregaEdit; override;
//    procedure LimparCampos; override;
    function verificaInteiro(texto: string): Boolean;
    function verificaReal(texto: string): Boolean;
    function validaCampos: Boolean;
    function validaItem: boolean;
    function verificaVirgula(texto: string): boolean;
    function duasCasas(texto: string): string;
  public
    { Public declarations }
    procedure ConhecaObj(pObj : TObject; pController: controller); override;
    procedure SetConsultaCondicao(pObj: TForm);
    procedure SetConsultaFornecedor(pObj: TForm);
    procedure SetConsultaTransportadora(pObj: TForm);
    procedure SetConsultaProduto(pObj: TForm);
    procedure DesabilitaCampos;
    procedure HabilitaCampos;
    procedure MostraCampos;
    procedure EscondeCampos;
    procedure LimparCampos; override;
    procedure LimpaProduto;
    procedure setTipoUsuario (pTipoUsuario: Boolean);
    function getTipoUsuario : Boolean;    
  end;

var
  FrmCadastroCompra: TFrmCadastroCompra;

implementation

uses uCondicao, uTransportadora;

{$R *.dfm}

{ TFrmCadastroCompra }

procedure TFrmCadastroCompra.CarregaEdit;
var k, tam: Integer;
item: TListItem;
begin
 // LimparCampos;
  self.edt_cod.Text := inttostr(umaCompra.getCodCompra);
  self.edt_NumeroNota.Text := inttostr(umaCompra.getNumNota);
  self.edt_serieNota.text := inttostr(umaCompra.getSerieNota);
     if umaCompra.getTipoNota = 0 then
        self.cbTipoNota.ItemIndex := 0
     else
        self.cbTipoNota.ItemIndex := 1;

  self.edt_codFornecedor.Text := inttostr(umaCompra.getumfornecedor.getcodigo);
  self.edt_Fornecedor.Text := umaCompra.getumfornecedor.getNome;
  self.data_emissao.DateTime := umaCompra.getdataEmissao;
  self.data_chegada.DateTime := umaCompra.getDataChegada;

  self.edt_baseICMS.Text := floattostr(umacompra.getBaseICMS);
  self.edt_valorICMS.Text := floattostr(umacompra.getValorICMS);
  self.edt_baseICMSsubst.Text := floattostr(umacompra.getBaseICMSsubst);
  self.edt_valorIcmsSubst.Text := floattostr(umacompra.getValorICMSSubst);
  self.edt_valortotalProdutos.Text := floattostr(umacompra.getValorTotalProduos);
  self.edt_valorFrete.Text := floattostr(umacompra.getValorFrete);
  self.edt_ValorSeguro.text := floattostr(umacompra.getValorSeguro);
  self.edt_desconto.text := floattostr(umacompra.getDesconto);
  self.edt_outrasDespesas.Text := floattostr(umacompra.getOutrasDespesas);
  self.edt_totalIPI.Text := floattostr(umacompra.getValorTotalIPI);
  self.edt_ValorTotal.Text := floattostr(umacompra.getValorTotal);

  self.edt_CodTransportadora.text := inttostr(umacompra.getumaTransportadora.getCodigo);
  self.edt_Transportadora.Text := umaCompra.getumaTransportadora.getNome;
     if umaCompra.getFretePorConta = '0' then
         self.cbFrete.ItemIndex := 0
     else
         self.cbFrete.ItemIndex := 1;
  self.edt_antt.Text := umaCompra.getUmaTransportadora.getAntt;

  self.edt_placaVeiculo.Text := umaCompra.getumVeiculo.getPlaca;
  self.edt_ufVeiculo.Text := umaCompra.getumVeiculo.getUmEstado.getUF;

  self.edt_CNPJ.Text := umaCompra.getUmaTransportadora.getCNPJ;
  self.edt_quantidade.Text := inttostr(umacompra.getQtde);

  if umaCompra.getEspecie = '0-CAIXA' then
     self.cb_especie.ItemIndex := 0
  else if umaCompra.getEspecie = '1-VOLUME' then
     self.cb_especie.ItemIndex := 1
  else
     self.cb_especie.ItemIndex := 2;

  self.edt_marca.text := umacompra.getMarca;
  self.edt_numeracao.Text := umacompra.getNumeracao;
  self.edt_pesobruto.Text := floattostr(umaCompra.getPesoBruto);
  self.edt_pesoLiquido.Text := floattostr(umaCompra.getPesoLiquido);

  self.edt_codCondicao.Text := inttostr(umacompra.getUmaCondicao.getCodigo);
  self.edt_condicao.Text := umacompra.getumacondicao.getNome;

  tam := umacompra.getListaProdutos.getQtd;

    For k:=1 to tam do
      begin
            item := listView1.Items.Add;

            item.Caption := inttostr(umacompra.getListaProdutos.getobj(k).getCodProduto);
            item.SubItems.Add(umacompra.getListaProdutos.getobj(k).getNome);
            item.SubItems.Add(umacompra.getListaProdutos.getobj(k).getNCM);
            item.SubItems.Add(umacompra.getListaProdutos.getobj(k).getCST);
            item.SubItems.Add(umacompra.getListaProdutos.getobj(k).getCFOP);
            item.SubItems.Add(inttostr(umacompra.getListaProdutos.getobj(k).getUnidade));
            item.SubItems.Add(inttostr(umacompra.getListaProdutos.getobj(k).getQtde));
            item.SubItems.Add(floattostr(umacompra.getListaProdutos.getobj(k).getValorUnitario));
            item.SubItems.Add(floattostr(umacompra.getListaProdutos.getobj(k).getVTotal));
            item.SubItems.Add(floattostr(umacompra.getListaProdutos.getobj(k).getBaseICMS));
            item.SubItems.Add(floattostr(umacompra.getListaProdutos.getobj(k).getValorICMS));
            item.SubItems.Add(floattostr(umacompra.getListaProdutos.getobj(k).getValorIPI));
            item.SubItems.Add(floattostr(umacompra.getListaProdutos.getobj(k).getAliqICMS));
            item.SubItems.Add(floattostr(umacompra.getListaProdutos.getobj(k).getAliqIPI));
      end;
end;

procedure TFrmCadastroCompra.ConhecaObj(pObj: TObject;
  pController: controller);
begin
  inherited;
  umaCompra := Compra (pObj);
  outraCompra := Compra.crieobj;
  umItemCompra := ItemCompra.crieobj;
  umProduto:= Produto.crieobj;
  umController := pController;

  self.LimparCampos;
    if umaCompra.getCodCompra <> 0 then
        begin
            codeGuardado := umaCompra.getCodCompra;
            Self.CarregaEdit;
        end;

    if self.btn_salvar.Caption = '&Salvar' then
      HabilitaCampos
    else
      DesabilitaCampos;
end;

procedure TFrmCadastroCompra.DesabilitaCampos;
begin
   self.edt_NumeroNota.Enabled := false;
   self.edt_serieNota.Enabled := false;
   self.cbTipoNota.Enabled := false;
   self.btn_buscar1.Enabled := false;
   self.data_emissao.Enabled := false;
   self.data_chegada.Enabled := false;
   self.edt_baseICMS.Enabled := false;
   self.edt_valorICMS.Enabled := false;
   self.edt_baseICMSsubst.Enabled := false;
   self.edt_valorIcmsSubst.Enabled := false;
   self.edt_valortotalProdutos.Enabled := false;
   self.edt_valorFrete.Enabled := false;
   self.edt_ValorSeguro.Enabled := false;
   self.edt_desconto.Enabled := false;
   self.edt_outrasDespesas.Enabled := false;
   self.edt_totalIPI.Enabled := false;
   self.edt_ValorTotal.Enabled := false;
   self.btn_buscar2.Enabled := false;
   self.cbFrete.Enabled := false;
   self.edt_quantidade.Enabled := false;
   self.cb_especie.Enabled := false;
   self.edt_marca.Enabled := false;
   self.edt_numeracao.Enabled := false;
   self.edt_pesobruto.Enabled := false;
   self.edt_pesoLiquido.Enabled := false;
   self.btn_buscarProduto.Enabled := false;
   self.edt_ncm.Enabled := false;
   self.edt_cst.Enabled := false;
   self.edt_cfop.Enabled := false;
   self.edt_qtdeItem.Enabled := false;
   self.edt_ValorUnitario.Enabled := false;
   self.edt_baseICMSitem.Enabled := false;
   self.edt_ICMSitem.Enabled := false;
   self.edt_ipiItem.Enabled := false;
   self.edt_aliqICMS.Enabled := false;
   self.edt_aliqIPI.Enabled := false;
   self.btn_add.Enabled := false;
   self.btn_remove.Enabled := false;
   self.ListView1.Enabled := false;
   self.btn_buscar3.Enabled := false;
      if self.btn_salvar.Caption <> 'Estornar' then
        self.btn_salvar.Enabled := false;
end;

procedure TFrmCadastroCompra.EscondeCampos;
begin

end;

procedure TFrmCadastroCompra.HabilitaCampos;
begin
  // self.edt_NumeroNota.Enabled := true;
   self.edt_serieNota.Enabled := true;
   self.cbTipoNota.Enabled := true;
  // self.btn_buscar1.Enabled := true;
   self.data_emissao.Enabled := true;
   self.data_chegada.Enabled := true;
   self.edt_baseICMS.Enabled := true;
   self.edt_valorICMS.Enabled := true;
   self.edt_baseICMSsubst.Enabled := true;
   self.edt_valorIcmsSubst.Enabled := true;
   self.edt_valortotalProdutos.Enabled := true;
   self.edt_valorFrete.Enabled := true;
   self.edt_ValorSeguro.Enabled := true;
   self.edt_desconto.Enabled := true;
   self.edt_outrasDespesas.Enabled := true;
   self.edt_totalIPI.Enabled := true;
   self.edt_ValorTotal.Enabled := true;
   self.btn_buscar2.Enabled := true;
   self.cbFrete.Enabled := true;
   self.edt_quantidade.Enabled := true;
   self.cb_especie.Enabled := true;
   self.edt_marca.Enabled := true;
   self.edt_numeracao.Enabled := true;
   self.edt_pesobruto.Enabled := true;
   self.edt_pesoLiquido.Enabled := true;
   self.btn_buscarProduto.Enabled := true;
   self.edt_ncm.Enabled := true;
   self.edt_cst.Enabled := true;
   self.edt_cfop.Enabled := true;
   self.edt_qtdeItem.Enabled := true;
   self.edt_ValorUnitario.Enabled := true;
   self.edt_baseICMSitem.Enabled := true;
   self.edt_ICMSitem.Enabled := true;
   self.edt_ipiItem.Enabled := true;
   self.edt_aliqICMS.Enabled := true;
   self.edt_aliqIPI.Enabled := true;
   self.btn_add.Enabled := true;
   self.btn_remove.Enabled := true;
   self.ListView1.Enabled := true;
   self.btn_buscar3.Enabled := true;
   self.btn_salvar.Enabled := true;
end;

procedure TFrmCadastroCompra.LimparCampos;
var k: Integer;
begin
  self.codeGuardado := 0;  
  self.edt_cod.clear;
  self.edt_NumeroNota.clear;
  self.edt_serieNota.clear;
  self.cbTipoNota.ItemIndex := -1;

  self.edt_codFornecedor.clear;
  self.edt_Fornecedor.clear;
//  self.edt_dataEmissao.clear;
//  self.edt_dataChegada.clear;
  self.data_emissao.DateTime := date;
  self.data_chegada.DateTime := date;

  self.edt_baseICMS.Text := '0,00';
  self.edt_valorICMS.Text := '0,00';
  self.edt_baseICMSsubst.Text := '0,00';
  self.edt_valorIcmsSubst.Text := '0,00';
  self.edt_valortotalProdutos.Text := '0,00';
  self.edt_valorFrete.Text := '0,00';
  self.edt_ValorSeguro.Text := '0,00';
  self.edt_desconto.Text := '0,00';
  self.edt_outrasDespesas.Text := '0,00';
  self.edt_totalIPI.Text := '0,00';
  self.edt_ValorTotal.Text := '0,00';

  self.edt_CodTransportadora.clear;
  self.edt_Transportadora.clear;
  self.cbFrete.ItemIndex := -1;

  self.edt_antt.clear;
  self.edt_placaVeiculo.clear;
  self.edt_ufVeiculo.clear;
  self.edt_CNPJ.clear;
  self.edt_quantidade.Text := '1';

  self.cb_especie.ItemIndex := -1;
//  self.edt_especie.clear;
  self.edt_marca.clear;
  self.edt_numeracao.clear;
  self.edt_pesobruto.Text := '0,00';
  self.edt_pesoLiquido.Text := '0,00';

  self.edt_codCondicao.clear;
  self.edt_condicao.clear;

  self.edt_codProduto.Clear;
  self.edt_produto.clear;
  self.edt_ncm.clear;
  self.edt_cst.clear;
  self.edt_cfop.clear;
  self.edt_unid.clear;
  self.edt_qtdeItem.clear;
  self.edt_ValorUnitario.clear;
  self.edt_valortotalItem.clear;
  self.edt_baseICMSitem.clear;
  self.edt_ICMSitem.clear;
  self.edt_ipiItem.Clear;
  self.edt_aliqICMS.clear;
  self.edt_aliqIPI.clear;

  //ShowMessage('itens na lista: ' + inttostr(listView1.Items.Count));
  ListView1.Clear;

  if self.listView1.Items.Count > 0 then
      begin
        listView1.Clear;
        for k:= self.listView1.Items.Count - 1 downto 0 do
            begin
               self.listView1.Items.Clear;
            end;
        end;

  LimpaProduto;
end;

procedure TFrmCadastroCompra.MostraCampos;
begin

end;

procedure TFrmCadastroCompra.Sair;
begin
  inherited;

end;

procedure TFrmCadastroCompra.Salvar;
var incluido, excluido, code1, permitir : string;
selected, tam, k, itens, x, qtde, codeProd, lista, num: integer;
men : TForm;
item2, item1: ItemCompra;
umaConta: ContaPagar;
label salva;
begin
  if self.btn_salvar.Caption = '&Salvar' then
     begin
      if validaCampos = true then
        begin
             umaCompra.setNumNota(strtoint(edt_NumeroNota.text));
             umacompra.setSerieNota(strtoint(edt_serieNota.Text));
                 if self.cbTipoNota.ItemIndex = 0 then
                    umacompra.setTipoNota(0)
                 else
                    umacompra.setTipoNota(1);

             umacompra.setDataEmissao(data_emissao.DateTime);
             umacompra.setDataChegada(data_chegada.DateTime);

             umacompra.setBaseICMS(strtofloat(edt_baseICMS.Text));
             umacompra.setValorICMS(strtofloat(edt_valorICMS.Text));
             umacompra.setBaseICMSSubst(strtofloat(edt_baseICMSsubst.Text));
             umacompra.setValorICMSSubst(strtofloat(edt_valorIcmsSubst.Text));
             umaCompra.setValorTotalProdutos(strtofloat(edt_valortotalProdutos.Text));
             umacompra.setValorFrete(strtofloat(edt_valorFrete.Text));
             umacompra.setValorSeguro(strtofloat(edt_ValorSeguro.Text));
             umaCompra.setDesconto(strtofloat(edt_desconto.Text));
             umacompra.setOutrasDespesas(strtofloat(edt_outrasDespesas.Text));
             umacompra.setValorTotalIPI(strtofloat(edt_totalIPI.Text));
             umaCompra.setValorTotal(strtofloat(edt_ValorTotal.Text));
             umacompra.setQtde(strtoint(edt_quantidade.Text));
             umacompra.setPlacaVeiculo('');
             umacompra.setUFveiculo('');
                 if cbFrete.ItemIndex = 0 then
                    umaCompra.setFretePorConta('0')
                 else
                    umaCompra.setFretePorConta('1');

                if cb_especie.ItemIndex = 0 then
                   umaCompra.setEspecie('0-CAIXA')
                else if cb_especie.ItemIndex = 1 then
                   umaCompra.setEspecie('1-VOLUME')
                else if cb_especie.ItemIndex = 2 then
                   umaCompra.setEspecie('2-PACOTE');


           //  umacompra.setEspecie(edt_especie.Text);

             umacompra.setMarca(edt_marca.Text);
             umacompra.setNumeracao(edt_numeracao.Text);
             umacompra.setPesoBruto(strtofloat(edt_pesobruto.Text));
             umacompra.setPesoLiquido(strtofloat(edt_pesoLiquido.Text));
             code1 := edt_NumeroNota.Text + edt_codFornecedor.Text;
           //  umaCompra.setCodCompra(strtoint(code1));

     //início do salvar (ou editar) da compra
     permitir := umController.getcontrollerCompra.pesquisaSalvar(code1);
         if permitir = 'OK' then
          begin
          salva:
            incluido := umController.getcontrollercompra.salvaCompra(umaCompra);
            tam := umaCompra.getListaProdutos.getQtd;

            // se é uma nova compra, inserir os itens no banco após já ter salvo a compra
            if umaCompra.getCodCompra = 0 then
              begin
              //salvar contas a pagar relativas à compra
               lista := umacompra.getumaCondicao.listaParcelas.getQtd;
               For num := 1 to lista do
                  begin
                    umaConta := ContaPagar.crieobj;
                    umaConta.setDataCadastro(Date);
                    umaConta.setumFornecedor(umacompra.getUmfornecedor);
                    umaConta.setDocumento('COMPRA-' + code1);
                    umaconta.setDataVencimento(Date + umacompra.getumaCondicao.listaParcelas.getobj(num).getDias);
                    umaConta.setValor(umacompra.getValorTotal * (umacompra.getumaCondicao.listaParcelas.getobj(num).getPercentual / 100));
                    umaConta.setNumeroParcela(num);
                    umaConta.setJuros(0);
                    umaConta.setObservacao('');
                    umaConta.setStatus(0);
                    umaConta.setDataPagamento(Date);
                    umaConta.getumaForma.setCodigo(umacompra.getumaCondicao.listaParcelas.getobj(num).getForma.getCodigo);
                    umaConta.setCodCompra(strtoint(code1));
                    umController.getControllerContaPagar.salvaContaPagar(umaConta);
                  end;
                  
              //loop para salvar os itens
               For k:= 1 to tam do
               begin
                   item2 := umacompra.getListaprodutos.getObj(k);
                   item2.setCodCompra(strtoint(code1));
                   item2.setNumero(k);
                   umController.getControllerItemCompra.salvaItemCompra(item2);
                //alterar estoque do produto desse item
                   qtde := item2.getQtde;
                   codeProd := umacompra.getListaProdutos.getObj(k).getCodProduto;
                   umcontroller.getControllerProduto.alteraEstoque(codeProd,true,qtde,1);
               end;
                ShowMessage('Compra incluída com sucesso!')
              end
             else  //se é uma compra que está sendo editada, excluir todos os itens e inserir novamente
               begin
                  itens := umController.getControllerItemCompra.pesquisaItemCompra(inttostr(umaCompra.getCodCompra));
                    if itens <> 0 then
                       begin
                         for x:=1 to itens do
                          begin
                           item1 := ItemCompra.crieobj;
                           item1.setCodCompra(umaCompra.getCodCompra);
                           item1.setNumero(x);
                           umController.getControllerItemCompra.excluiItemCompra(item1);

                           //alterar estoque do produto desse item
                           qtde := umaCompra.getListaProdutos.getObj(x).getQtde;
                           codeProd := umaCompra.getListaProdutos.getObj(x).getCodProduto;
                           umcontroller.getControllerProduto.alteraEstoque(codeProd,false,qtde,1);
                          end;
                       end;

                  for k:=1 to tam do
                    begin
                          item2 := umacompra.getListaprodutos.getObj(k);
                          item2.setCodCompra(strtoint(code1));
                          item2.setNumero(k);
                          umController.getControllerItemCompra.salvaItemCompra(item2);
                          //alterar estoque do produto desse item
                          qtde := item2.getQtde;
                          codeProd := umacompra.getListaProdutos.getObj(k).getCodProduto;
                          umcontroller.getControllerProduto.alteraEstoque(codeProd,true,qtde,1);
                    end;
                 ShowMessage('Compra alterada com sucesso!');
               end;
            inherited;
         end
          else if (permitir = 'EXISTE') and (code1 = inttostr(codeGuardado)) then
            begin
               goto salva;
            end
          else
            begin
             ShowMessage('Compra já cadastrada!');
             self.edt_NumeroNota.SetFocus;
            end; //nao permitiu salvar


      end;
     //fim do loop do valida campos


     end   //fim da compra, início do estorno
  else if self.btn_salvar.Caption = 'Estornar' then
     begin
        men := CreateMessageDialog('Deseja estornar a compra nº ' + QuotedStr(inttostr(umaCompra.getcodCompra)) + '?',mtCustom,[mbYes,mbAbort]);
        men.Caption := 'Confirmação';
        men.Position := poDesktopCenter;
        selected := men.ShowModal;

          if selected = mrYes then
                  begin

                    permitir := umController.getcontrollerCompra.pesquisaDependencia(umaCompra.getCodCompra);
                      if umaCompra.getDataChegada <= date then
                          begin
                             ShowMessage('Não é possível estornar a compra! Produto já no estoque!');
                          end
                      else if permitir = 'CONTA' then
                          begin
                             ShowMessage('Não é possível excluir! Contas relativas já foram pagas!');
                          end
                      else
                          begin
                             //aqui vai a exclusão da compra, dos itens, e alteração do estoque
                              tam := umaCompra.getListaProdutos.getQtd;
                              For k := 1 to tam do
                                begin
                                     excluido := umcontroller.getcontrollerITemCompra.excluiItemCompra(umaCompra.getListaprodutos.getObj(k));
                                     qtde := umacompra.getlistaprodutos.getobj(k).getQtde;
                                     codeProd := umacompra.getlistaprodutos.getobj(k).getCodProduto;
                                     umcontroller.getControllerProduto.alteraEstoque(codeProd,false,qtde,1);
                                end;

                              excluido := umController.getcontrollerContaPagar.excluirByIdCompra(umacompra.getCodCompra);
                              excluido := umcontroller.getControllerCompra.excluiCompra(umaCompra);
                              ShowMessage('Compra nº ' + QuotedSTR(inttostr(umacompra.getCodCompra)) + ' estornada com sucesso!');
                              inherited;
                          end;
                  end;
     end;
end;

procedure TFrmCadastroCompra.SetConsultaCondicao(pObj: TForm);
begin
   umFrmConsultaCondicao := TFrmConsultaCondicao (pObj);
end;

procedure TFrmCadastroCompra.SetConsultaFornecedor(pObj: TForm);
begin
   umFrmConsultaFornecedor := TFrmConsultaFornecedor (pobj);
end;

procedure TFrmCadastroCompra.SetConsultaProduto(pObj: TForm);
begin
    umFrmConsultaProduto := TFrmConsultaProduto (pobj);
end;

procedure TFrmCadastroCompra.SetConsultaTransportadora(pObj: TForm);
begin
  umFrmConsultaTransportadora := TFrmConsultaTransportadora (pObj);
end;

function TFrmCadastroCompra.validaCampos: Boolean;
begin
  Result := False;
    if self.edt_NumeroNota.Text = '' then
        begin
          ShowMessage('Preencha o número da nota!');
          self.edt_NumeroNota.SetFocus;
        end
    else if self.edt_serieNota.Text = '' then
        begin
          ShowMessage('Preencha a série!');
          self.edt_serieNota.SetFocus;
        end
    else if self.cbTipoNota.ItemIndex = -1 then
        begin
          ShowMessage('Escolha um tipo de nota!');
          SELF.cbTipoNota.ItemIndex := 0;
          self.cbTipoNota.SetFocus;
        end
    else if self.edt_Fornecedor.Text = '' then
        begin
          ShowMessage('Escolha um fornecedor!');
          self.btn_buscar1.Click;
        end
    else if not (data_emissao.Date <= Date + 1) then
        begin
          ShowMessage('Data de emissão não pode ser maior do que o dia de hoje');
          data_emissao.Date := date;
          data_emissao.SetFocus;
        end
    else if not (data_chegada.Date >= data_emissao.Datetime) then
        begin
          ShowMessage('Data de chegada não pode ser menor do que a emissão');
          data_chegada.Date := data_emissao.Date;
          data_chegada.SetFocus;
        end
    else if self.edt_baseICMS.Text = '' then
        begin
          ShowMessage('Preencha a base do ICMS!');
          self.edt_baseICMS.SetFocus;
        end
    else if self.edt_valorICMS.Text = '' then
        begin
          ShowMessage('Preencha o valor do ICMS!');
          self.edt_valorICMS.SetFocus;
        end
    else if self.edt_baseICMSsubst.Text = '' then
        begin
          ShowMessage('Preencha a base do ICMS Subst!');
          self.edt_baseICMSsubst.SetFocus;
        end
    else if self.edt_valorIcmsSubst.Text = '' then
        begin
          ShowMessage('Preencha o valor do ICMS Subst!');
          self.edt_valorIcmsSubst.SetFocus;
        end
    else if self.edt_valortotalProdutos.Text = '' then
        begin
          ShowMessage('Preencha o valor total dos produtos!');
          self.edt_valortotalProdutos.SetFocus;
        end
    else if self.edt_ValorTotal.Text = '' then
        begin
          ShowMessage('Preencha o valor total!');
          self.edt_ValorTotal.SetFocus;
        end
    else if self.edt_Transportadora.Text = '' then
        begin
          ShowMessage('Escolha uma transportadora!');
          self.btn_buscar2.Click;
        end
    else if self.edt_quantidade.Text = '' then
        begin
          ShowMessage('Digite a quantidade!');
          self.edt_quantidade.SetFocus;
        end
    else if self.cb_especie.ItemIndex = -1 then
        begin
          ShowMessage('Selecione a espécie!');
          self.cb_especie.SetFocus;
        end
    else if self.edt_condicao.Text = '' then
        begin
          ShowMessage('Escolha uma condição de pagamento!');
          self.btn_buscar3.Click;
        end
    else
      begin
        if self.listView1.Items.Count <= 0 then
            begin
              ShowMessage('Você deve adicionar ao menos um item na lista!');
              Exit;
            end;
        Result := True;
      end;
end;

function TFrmCadastroCompra.verificaInteiro(texto: string): Boolean;
begin
    try
      StrToInt(texto);
      Result := True;
    except
      Result:= False;
    end;
end;

function TFrmCadastroCompra.verificaReal(texto: string): Boolean;
begin
    try
       StrToFloat(texto);
       Result := True;
    except
       Result := False;
    end;
end;

procedure TFrmCadastroCompra.btn_buscar1Click(Sender: TObject);
begin
  umFrmConsultaFornecedor.ConhecaObj(umaCompra.getUmfornecedor,umController);
  umFrmConsultaFornecedor.btn_Sair.Caption := 'Selecionar';
  umFrmConsultaFornecedor.ShowModal;
  self.edt_codFornecedor.Text := inttostr(umacompra.getumfornecedor.getCodigo);
  self.edt_Fornecedor.Text := umacompra.getumfornecedor.getNome;
  umFrmConsultaFornecedor.btn_Sair.Caption := 'Sair';
end;

procedure TFrmCadastroCompra.btn_buscar2Click(Sender: TObject);
begin
  umFrmConsultaTransportadora.ConhecaObj(umaCompra.getUmaTransportadora,umController);
  umFrmConsultaTransportadora.btn_Sair.Caption := 'Selecionar';
  umFrmConsultaTransportadora.ShowModal;
  self.edt_CodTransportadora.Text := inttostr(umacompra.getUmaTransportadora.getCodigo);
  self.edt_Transportadora.Text := umacompra.getUmaTransportadora.getNome;
  self.edt_antt.Text := umacompra.getumatransportadora.getAntt;
  self.edt_placaVeiculo.Text := umacompra.getumatransportadora.getumVeiculo.getPlaca;
  self.edt_ufVeiculo.Text := umacompra.getumatransportadora.getumveiculo.getumEstado.getUF;
  self.edt_CNPJ.Text := umacompra.getumatransportadora.getCNPJ;
  umFrmConsultaTransportadora.btn_Sair.Caption := 'Sair';
end;

procedure TFrmCadastroCompra.btn_buscarProdutoClick(Sender: TObject);
begin
  umFrmConsultaProduto.ConhecaObj(umProduto,umController);
  umFrmConsultaProduto.btn_Sair.Caption := 'Selecionar';
  umFrmConsultaProduto.setTipoUsuario(self.getTipoUsuario);
  umFrmConsultaProduto.ShowModal;
  self.edt_codProduto.Text := inttostr(umproduto.getCodigo);
  self.edt_produto.Text := umproduto.getNome;
  self.edt_unid.Text := inttostr(umproduto.getUnidade);
  self.edt_ValorUnitario.Text := floattostr(umproduto.getCusto);
     if not (verificaVirgula(edt_ValorUnitario.Text)) then
       edt_ValorUnitario.Text := edt_ValorUnitario.Text + ',00';
  umFrmConsultaProduto.btn_Sair.Caption := 'Sair';
end;

procedure TFrmCadastroCompra.btn_buscar3Click(Sender: TObject);
begin
  umFrmConsultaCondicao.ConhecaObj(umaCompra.getUmacondicao,umController);
  umFrmConsultaCondicao.btn_Sair.Caption := 'Selecionar';
  umFrmConsultaCondicao.ShowModal;
  self.edt_codCondicao.Text := inttostr(umacompra.getumacondicao.getCodigo);
  self.edt_condicao.Text := umacompra.getumacondicao.getNome;
  umFrmConsultaCondicao.btn_Sair.Caption := 'Sair';
end;

function TFrmCadastroCompra.validaItem: boolean;
begin
    result := false;
      if self.edt_codProduto.Text = '' then
         begin
             ShowMessage('Selecione um produto');
             self.btn_buscarProduto.Click;
         end
      else if edt_ncm.Text = '' then
         begin
            ShowMessage('Digite o NCM');
            self.edt_ncm.SetFocus;
         end
      else if edt_cst.Text = '' then
         begin
            ShowMessage('Digite o CST');
            self.edt_cst.SetFocus;
         end
      else if edt_cfop.Text = '' then
         begin
            ShowMessage('Digite o CFOP');
            self.edt_cfop.SetFocus;
         end
      else if edt_qtdeItem.Text = '' then
         begin
            ShowMessage('Digite a quantidade');
            self.edt_qtdeItem.SetFocus;
         end
      else if edt_ValorUnitario.Text = '' then
         begin
            ShowMessage('Digite o valor unitário');
            self.edt_ValorUnitario.SetFocus;
         end
      else if edt_baseICMSitem.Text = '' then
         begin
            ShowMessage('Digite a base do ICMS do produto');
            self.edt_baseICMSitem.SetFocus;
         end
      else if edt_ICMSitem.Text = '' then
         begin
            ShowMessage('Digite o ICMS do produto');
            self.edt_ICMSitem.SetFocus;
         end
      else if edt_ipiItem.Text = '' then
         begin
            ShowMessage('Digite o IPI do produto');
            self.edt_ipiItem.SetFocus;
         end
      else if edt_aliqICMS.Text = '' then
         begin
            ShowMessage('Digite a alíquota de ICMS do produto');
            self.edt_aliqICMS.SetFocus;
         end
      else
         begin
           if self.edt_aliqIPI.Text = '' then
              begin
                  ShowMessage('Digite a alíquota do IPI do produto');
                  Exit;
              end;

           if self.edt_qtdeItem.Text = '0' then
              edt_qtdeItem.Text := '1';
              
           Result := true;
         end;
end;

procedure TFrmCadastroCompra.btn_addClick(Sender: TObject);
var tot: real;
item: TListItem;
begin
  if validaItem = true then
     begin
         umItemCompra := ItemCompra.crieobj;
         tot := StrToFloat(edt_qtdeItem.Text) *  Strtofloat(edt_ValorUnitario.Text);
         edt_valortotalItem.Text := floattostr(tot);

         umItemCompra.setCodProduto(strtoint(edt_codProduto.Text));
         umItemCompra.setNome(edt_produto.Text);
         umitemcompra.setQtde(strtoint(edt_qtdeItem.Text));
         umItemCompra.setNCM(edt_ncm.Text);
         umItemCompra.setCST(edt_cst.Text);
         umItemCompra.setCFOP(edt_cfop.Text);
         umItemCompra.setUnidade(strtoint(edt_unid.Text));
         umItemCompra.setValorUnitario(strtofloat(edt_ValorUnitario.Text));
         umItemCompra.setVTotal(strtofloat(edt_valortotalItem.Text));
         umItemCompra.setBaseICMS(strtofloat(edt_baseICMSitem.Text));
         umItemCompra.setValorICMS(strtofloat(edt_ICMSitem.Text));
         umItemCompra.setValorIPI(strtofloat(edt_ipiItem.Text));
         umItemCompra.setAliqICMS(strtofloat(edt_aliqICMS.Text));
         umitemcompra.setAliqIPI(strtofloat(edt_aliqIPI.Text));

            item := listView1.Items.Add;
            item.Caption := edt_codProduto.Text;
            item.SubItems.Add(edt_produto.Text);
            item.SubItems.Add(edt_ncm.Text);
            item.SubItems.Add(edt_cst.Text);
            item.SubItems.Add(edt_cfop.Text);
            item.SubItems.Add(edt_unid.Text);
            item.SubItems.Add(edt_qtdeItem.Text);
            item.SubItems.Add(edt_ValorUnitario.Text);
            item.SubItems.Add(edt_valortotalItem.Text);
            item.SubItems.Add(edt_baseICMSitem.Text);
            item.SubItems.Add(edt_ICMSitem.Text);
            item.SubItems.Add(edt_ipiItem.Text);
            item.SubItems.Add(edt_aliqICMS.Text);
            item.SubItems.Add(edt_aliqIPI.Text);

         umaCompra.getListaProdutos.inserefim(umItemCompra);
         LimpaProduto;
     end;    
end;

procedure TFrmCadastroCompra.LimpaProduto;
begin
      self.edt_codProduto.Clear;
      self.edt_produto.Clear;
      self.edt_ncm.Clear;
      self.edt_cst.Clear;
      self.edt_cfop.clear;
      self.edt_unid.Clear;
      self.edt_qtdeItem.Clear;
      self.edt_ValorUnitario.Text := '0,00';
      self.edt_valortotalItem.Clear;
      self.edt_baseICMSitem.Text := '0,00';
      self.edt_ICMSitem.Text := '0,00';
      self.edt_ipiItem.Text := '0,00';
      self.edt_aliqICMS.Text := '0,00';
      self.edt_aliqIPI.Text := '0,00';
end;

procedure TFrmCadastroCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  LimparCampos;                         
  umaCompra.getListaProdutos.destrua_se;
  umaCompra := Compra.crieobj;          
end;

function TFrmCadastroCompra.getTipoUsuario: Boolean;
begin
   Result := self.tipoUsuario;
end;

procedure TFrmCadastroCompra.setTipoUsuario(pTipoUsuario: Boolean);
begin
   self.tipoUsuario := pTipoUsuario;
end;

procedure TFrmCadastroCompra.btn_removeClick(Sender: TObject);
var item: ItemCompra;
begin
  if listView1.Selected <> nil then
      begin
        if (listView1.Selected.Index = listView1.Items.Count - 1) then
            begin
               item := umaCompra.getListaProdutos.getObj(listView1.Selected.Index + 1);
               umaCompra.getListaProdutos.remove(item,listView1.ItemFocused.Index + 1);
               ShowMessage('Item removido com sucesso!');
               listView1.ItemFocused.Delete;
            end
        else
           begin
               ShowMessage('Você só pode remover o último item!');
           end;
      end;
end;

procedure TFrmCadastroCompra.cbTipoNotaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   key:=#0;
end;

procedure TFrmCadastroCompra.cb_especieKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  key:=#0;
end;

procedure TFrmCadastroCompra.cbFreteKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  key:=#0;
end;

procedure TFrmCadastroCompra.cbTipoNotaExit(Sender: TObject);
begin
  inherited;
  if cbTipoNota.ItemIndex < 0 then
     cbTipoNota.ItemIndex := 0;
end;

procedure TFrmCadastroCompra.cbFreteExit(Sender: TObject);
begin
  inherited;
  if cbFrete.ItemIndex < 0 then
     cbFrete.ItemIndex := 0;
end;

procedure TFrmCadastroCompra.cb_especieExit(Sender: TObject);
begin
  inherited;
    if cb_especie.ItemIndex < 0 then
     cb_especie.ItemIndex := 0;
end;

procedure TFrmCadastroCompra.edt_baseICMSExit(Sender: TObject);
var aux : real;
begin
  inherited;
  if verificaReal(edt_baseICMS.Text) then
  begin
    if not verificaVirgula(edt_baseICMS.Text) then
       begin
         aux := strtofloat(edt_baseICMS.Text);
         edt_baseICMS.Text := floattostr(aux) + ',00';
       end;
     if strtofloat(edt_baseICMS.Text) > 100 then
     edt_baseICMS.Text := '100,00';

     if strtofloat(edt_baseICMS.Text) < 0 then
     edt_baseICMS.Text := '0,00';
  end
  else if not (verificaReal(edt_baseICMS.Text)) and (edt_baseICMS.Text <> '') then
    begin
     ShowMessage('Apenas números e vírgula - Formato: o,oo ');
     edt_baseICMS.Text := '0,00';
     edt_baseICMS.SetFocus;
    end
  else
     edt_baseICMS.Text := '0,00';

  edt_baseICMS.Text := duasCasas(edt_baseICMS.Text);
end;

procedure TFrmCadastroCompra.edt_valorICMSExit(Sender: TObject);
var aux : real;
begin
  inherited;
  if verificaReal(edt_valorICMS.Text) then
  begin
    if not verificaVirgula(edt_valorICMS.Text) then
       begin
         aux := strtofloat(edt_valorICMS.Text);
         edt_valorICMS.Text := floattostr(aux) + ',00';
       end;

     if strtofloat(edt_valorICMS.Text) < 0 then
     edt_valorICMS.Text := '0,00';
  end
  else if not (verificaReal(edt_valorICMS.Text)) and (edt_valorICMS.Text <> '') then
    begin
     ShowMessage('Apenas números e vírgula - Formato: o,oo ');
     edt_valorICMS.Text := '0,00';
     edt_valorICMS.SetFocus;
    end
  else
     edt_valorICMS.Text := '0,00';

  edt_valorICMS.Text := duasCasas(edt_valorICMS.Text);
end;

procedure TFrmCadastroCompra.edt_baseICMSsubstExit(Sender: TObject);
var aux : real;
begin
  inherited;
  if verificaReal(edt_baseICMSsubst.Text) then
  begin
    if not verificaVirgula(edt_baseICMSsubst.Text) then
       begin
         aux := strtofloat(edt_baseICMSsubst.Text);
         edt_baseICMSsubst.Text := floattostr(aux) + ',00';
       end;
     if strtofloat(edt_baseICMSsubst.Text) > 100 then
     edt_baseICMSsubst.Text := '100,00';
     
     if strtofloat(edt_baseICMSsubst.Text) < 0 then
     edt_baseICMSsubst.Text := '0,00';
  end
  else if not (verificaReal(edt_baseICMSsubst.Text)) and (edt_baseICMSsubst.Text <> '') then
    begin
     ShowMessage('Apenas números e vírgula - Formato: o,oo ');
     edt_baseICMSsubst.Text := '0,00';
     edt_baseICMSsubst.SetFocus;
    end
  else
     edt_baseICMSsubst.Text := '0,00';

  edt_baseICMSsubst.Text := duasCasas(edt_baseICMSsubst.Text);
end;

function TFrmCadastroCompra.verificaVirgula(texto: string): boolean;
var k: integer;
begin
   result := false;
      for k := 1 to length(texto) do
        begin
           if texto[k] = ',' then
             begin
               Result := true;
               exit;
             end;
        end;
end;

procedure TFrmCadastroCompra.edt_valorIcmsSubstExit(Sender: TObject);
var aux : real;
begin
  inherited;
  if verificaReal(edt_valorIcmsSubst.Text) then
  begin
    if not verificaVirgula(edt_valorIcmsSubst.Text) then
       begin
         aux := strtofloat(edt_valorIcmsSubst.Text);
         edt_valorIcmsSubst.Text := floattostr(aux) + ',00';
       end;
       
     if strtofloat(edt_valorIcmsSubst.Text) < 0 then
     edt_valorIcmsSubst.Text := '0,00';
  end
  else if not (verificaReal(edt_valorIcmsSubst.Text)) and (edt_valorIcmsSubst.Text <> '') then
    begin
     ShowMessage('Apenas números e vírgula - Formato: o,oo ');
     edt_valorIcmsSubst.Text := '0,00';
     edt_valorIcmsSubst.SetFocus;
    end
  else
     edt_valorIcmsSubst.Text := '0,00';

  edt_valorIcmsSubst.Text := duasCasas(edt_valorIcmsSubst.Text);
end;

procedure TFrmCadastroCompra.edt_valortotalProdutosExit(Sender: TObject);
var aux : real;
begin
  inherited;
  if verificaReal(edt_valortotalProdutos.Text) then
  begin
    if not verificaVirgula(edt_valortotalProdutos.Text) then
       begin
         aux := strtofloat(edt_valortotalProdutos.Text);
         edt_valortotalProdutos.Text := floattostr(aux) + ',00';
       end;
         
     if strtofloat(edt_valortotalProdutos.Text) < 0 then
     edt_valortotalProdutos.Text := '0,00';
  end
  else if not (verificaReal(edt_valortotalProdutos.Text)) and (edt_valortotalProdutos.Text <> '') then
    begin
     ShowMessage('Apenas números e vírgula - Formato: o,oo ');
     edt_valortotalProdutos.Text := '0,00';
     edt_valortotalProdutos.SetFocus;
    end
  else
     edt_valortotalProdutos.Text := '0,00';

  edt_valortotalProdutos.Text := duasCasas(edt_valortotalProdutos.Text);
end;

procedure TFrmCadastroCompra.edt_ValorTotalExit(Sender: TObject);
var aux : real;
begin
  inherited;
  if verificaReal(edt_ValorTotal.Text) then
  begin
    if not verificaVirgula(edt_ValorTotal.Text) then
       begin
         aux := strtofloat(edt_ValorTotal.Text);
         edt_ValorTotal.Text := floattostr(aux) + ',00';
       end;
                     
     if strtofloat(edt_ValorTotal.Text) <= 0 then
     edt_ValorTotal.Text := '0,01';
  end
  else if not (verificaReal(edt_ValorTotal.Text)) and (edt_ValorTotal.Text <> '') then
    begin
     ShowMessage('Apenas números e vírgula - Formato: o,oo ');
     edt_ValorTotal.Text := '0,01';
     edt_ValorTotal.SetFocus;
    end
  else
     edt_ValorTotal.Text := '0,00';

  edt_ValorTotal.Text := duasCasas(edt_ValorTotal.Text);
end;

procedure TFrmCadastroCompra.edt_valorFreteExit(Sender: TObject);
var aux : real;
begin
  inherited;
  if verificaReal(edt_valorFrete.Text) then
  begin
    if not verificaVirgula(edt_valorFrete.Text) then
       begin
         aux := strtofloat(edt_valorFrete.Text);
         edt_valorFrete.Text := floattostr(aux) + ',00';
       end;
           
     if strtofloat(edt_valorFrete.Text) < 0 then
     edt_valorFrete.Text := '0,00';
  end
  else if not (verificaReal(edt_valorFrete.Text)) and (edt_valorFrete.Text <> '') then
    begin
     ShowMessage('Apenas números e vírgula - Formato: o,oo ');
     edt_valorFrete.Text := '0,00';
     edt_valorFrete.SetFocus;
    end
  else
     edt_valorFrete.Text := '0,00';

  edt_valorFrete.Text := duasCasas(edt_valorFrete.Text);
end;

procedure TFrmCadastroCompra.edt_ValorSeguroExit(Sender: TObject);
var aux : real;
begin
  inherited;
  if verificaReal(edt_ValorSeguro.Text) then
  begin
    if not verificaVirgula(edt_ValorSeguro.Text) then
       begin
         aux := strtofloat(edt_ValorSeguro.Text);
         edt_ValorSeguro.Text := floattostr(aux) + ',00';
       end;
             
     if strtofloat(edt_ValorSeguro.Text) < 0 then
     edt_ValorSeguro.Text := '0,00';
  end
  else if not (verificaReal(edt_ValorSeguro.Text)) and (edt_ValorSeguro.Text <> '') then
    begin
     ShowMessage('Apenas números e vírgula - Formato: o,oo ');
     edt_ValorSeguro.Text := '0,00';
     edt_ValorSeguro.SetFocus;
    end
  else
     edt_ValorSeguro.Text := '0,00';

  edt_ValorSeguro.Text := duasCasas(edt_ValorSeguro.Text);
end;

procedure TFrmCadastroCompra.edt_descontoExit(Sender: TObject);
var aux : real;
begin
  inherited;
  if verificaReal(edt_desconto.Text) then
  begin
    if not verificaVirgula(edt_desconto.Text) then
       begin
         aux := strtofloat(edt_desconto.Text);
         edt_desconto.Text := floattostr(aux) + ',00';
       end;
               
     if strtofloat(edt_desconto.Text) < 0 then
     edt_desconto.Text := '0,00';
  end
  else if not (verificaReal(edt_desconto.Text)) and (edt_desconto.Text <> '') then
    begin
     ShowMessage('Apenas números e vírgula - Formato: o,oo ');
     edt_desconto.Text := '0,00';
     edt_desconto.SetFocus;
    end
  else
     edt_desconto.Text := '0,00';

  edt_desconto.Text := duasCasas(edt_desconto.Text);
end;

procedure TFrmCadastroCompra.edt_outrasDespesasExit(Sender: TObject);
var aux : real;
begin
  inherited;
  if verificaReal(edt_outrasDespesas.Text) then
  begin
    if not verificaVirgula(edt_outrasDespesas.Text) then
       begin
         aux := strtofloat(edt_outrasDespesas.Text);
         edt_outrasDespesas.Text := floattostr(aux) + ',00';
       end;
                 
     if strtofloat(edt_outrasDespesas.Text) < 0 then
     edt_outrasDespesas.Text := '0,00';
  end
  else if not (verificaReal(edt_outrasDespesas.Text)) and (edt_outrasDespesas.Text <> '') then
    begin
     ShowMessage('Apenas números e vírgula - Formato: o,oo ');
     edt_outrasDespesas.Text := '0,00';
     edt_outrasDespesas.SetFocus;
    end
  else
     edt_outrasDespesas.Text := '0,00';

  edt_outrasDespesas.Text := duasCasas(edt_outrasDespesas.Text);
end;

procedure TFrmCadastroCompra.edt_totalIPIExit(Sender: TObject);
var aux : real;
begin
  inherited;
  if verificaReal(edt_totalIPI.Text) then
  begin
    if not verificaVirgula(edt_totalIPI.Text) then
       begin
         aux := strtofloat(edt_totalIPI.Text);
         edt_totalIPI.Text := floattostr(aux) + ',00';
       end;
                   
     if strtofloat(edt_totalIPI.Text) < 0 then
     edt_totalIPI.Text := '0,00';
  end
  else if not (verificaReal(edt_totalIPI.Text)) and (edt_totalIPI.Text <> '') then
    begin
     ShowMessage('Apenas números e vírgula - Formato: o,oo ');
     edt_totalIPI.Text := '0,00';
     edt_totalIPI.SetFocus;
    end
  else
     edt_totalIPI.Text := '0,00';
  edt_totalIPI.Text := duasCasas(edt_totalIPI.Text);
end;

procedure TFrmCadastroCompra.edt_pesobrutoExit(Sender: TObject);
var aux : real;
begin
  inherited;
  if verificaReal(edt_pesobruto.Text) then
  begin
    if not verificaVirgula(edt_pesobruto.Text) then
       begin
         aux := strtofloat(edt_pesobruto.Text);
         edt_pesobruto.Text := floattostr(aux) + ',00';
       end;
                       
     if strtofloat(edt_pesobruto.Text) < 0 then
     edt_pesobruto.Text := '0,00';
  end
  else if not (verificaReal(edt_pesobruto.Text)) and (edt_pesobruto.Text <> '') then
    begin
     ShowMessage('Apenas números e vírgula - Formato: o,oo ');
     edt_pesobruto.Text := '0,00';
     edt_pesobruto.SetFocus;
    end
  else
     edt_pesobruto.Text := '0,00';

  edt_pesobruto.Text := duasCasas(edt_pesobruto.Text);
end;

procedure TFrmCadastroCompra.edt_pesoLiquidoExit(Sender: TObject);
var aux : real;
begin
  inherited;
  if verificaReal(edt_pesoLiquido.Text) then
  begin
    if not verificaVirgula(edt_pesoLiquido.Text) then
       begin
         aux := strtofloat(edt_pesoLiquido.Text);
         edt_pesoLiquido.Text := floattostr(aux) + ',00';
       end;
                         
     if strtofloat(edt_pesoLiquido.Text) < 0 then
     edt_pesoLiquido.Text := '0,00';
  end
  else if not (verificaReal(edt_pesoLiquido.Text)) and (edt_pesoLiquido.Text <> '') then
    begin
     ShowMessage('Apenas números e vírgula - Formato: o,oo ');
     edt_pesoLiquido.Text := '0,00';
     edt_pesoLiquido.SetFocus;
    end
  else
     edt_pesoLiquido.Text := '0,00';

  edt_pesoLiquido.Text := duasCasas(edt_pesoLiquido.Text);
end;

procedure TFrmCadastroCompra.edt_ValorUnitarioExit(Sender: TObject);
var aux : real;
begin
  inherited;
  if verificaReal(edt_ValorUnitario.Text) then
  begin
    if not verificaVirgula(edt_ValorUnitario.Text) then
       begin
         aux := strtofloat(edt_ValorUnitario.Text);
       {  if aux < umProduto.getPrecoMin then
            begin
             ShowMessage('Você não pode inserir um valor menor que o preço mínimo do produto!');
             self.edt_ValorUnitario.Text := floattostr(umProduto.getPrecoMin);
            end; }
         edt_ValorUnitario.Text := edt_ValorUnitario.Text + ',00';
        // edt_ValorUnitario.SetFocus;
       end;
                      
     if strtofloat(edt_ValorUnitario.Text) <= 0 then
     edt_ValorUnitario.Text := '0,01';
  end
 else if not (verificaReal(edt_ValorUnitario.Text)) and (edt_ValorUnitario.Text <> '') then
    begin
     ShowMessage('Apenas números e vírgula - Formato: o,oo ');
     edt_ValorUnitario.Text := '0,01';
     edt_ValorUnitario.SetFocus;
    end
  else
     edt_ValorUnitario.Text := '0,01';

  edt_ValorUnitario.Text := duasCasas(edt_ValorUnitario.Text);
end;

procedure TFrmCadastroCompra.edt_baseICMSitemExit(Sender: TObject);
var aux : real;
begin
  inherited;
  if verificaReal(edt_baseICMSitem.Text) then
  begin
    if not verificaVirgula(edt_baseICMSitem.Text) then
       begin
         aux := strtofloat(edt_baseICMSitem.Text);
         edt_baseICMSitem.Text := floattostr(aux) + ',00';
       end;
     if strtofloat(edt_baseICMSitem.Text) > 100 then
     edt_baseICMSitem.Text := '100,00';

     if strtofloat(edt_baseICMSitem.Text) < 0 then
     edt_baseICMSitem.Text := '0,00';
  end
  else if not (verificaReal(edt_baseICMSitem.Text)) and (edt_baseICMSitem.Text <> '') then
    begin
     ShowMessage('Apenas números e vírgula - Formato: o,oo ');
     edt_baseICMSitem.Text := '0,00';
     edt_baseICMSitem.SetFocus;
    end
  else
     edt_baseICMSitem.Text := '0,00';

  edt_baseICMSitem.Text := duasCasas(edt_baseICMSitem.Text);
end;

procedure TFrmCadastroCompra.edt_ICMSitemExit(Sender: TObject);
var aux : real;
begin
  inherited;
  if verificaReal(edt_ICMSitem.Text) then
  begin
    if not verificaVirgula(edt_ICMSitem.Text) then
       begin
         aux := strtofloat(edt_ICMSitem.Text);
         edt_ICMSitem.Text := floattostr(aux) + ',00';
       end;
                        
     if strtofloat(edt_ICMSitem.Text) < 0 then
     edt_ICMSitem.Text := '0,00';
  end
  else if not (verificaReal(edt_ICMSitem.Text)) and (edt_ICMSitem.Text <> '') then
    begin
     ShowMessage('Apenas números e vírgula - Formato: o,oo ');
     edt_ICMSitem.Text := '0,00';
     edt_ICMSitem.SetFocus;
    end
  else
     edt_ICMSitem.Text := '0,00';

  edt_ICMSitem.Text := duasCasas(edt_ICMSitem.Text);
end;

procedure TFrmCadastroCompra.edt_ipiItemExit(Sender: TObject);
var aux : real;
begin
  inherited;
  if verificaReal(edt_ipiItem.Text) then
  begin
    if not verificaVirgula(edt_ipiItem.Text) then
       begin
         aux := strtofloat(edt_ipiItem.Text);
         edt_ipiItem.Text := floattostr(aux) + ',00';
       end;
      if strtofloat(edt_ipiItem.Text) < 0 then
      edt_ipiItem.Text := '0,00';
  end
  else if not (verificaReal(edt_ipiItem.Text)) and (edt_ipiItem.Text <> '') then
    begin
     ShowMessage('Apenas números e vírgula - Formato: o,oo ');
     edt_ipiItem.Text := '0,00';
     edt_ipiItem.SetFocus;
    end
  else
     edt_ipiItem.Text := '0,00';

  edt_ipiItem.Text := duasCasas(edt_ipiItem.Text);
end;

procedure TFrmCadastroCompra.edt_aliqICMSExit(Sender: TObject);
var aux : real;
begin
  inherited;
  if verificaReal(edt_aliqICMS.Text) then
  begin
    if not verificaVirgula(edt_aliqICMS.Text) then
       begin
         aux := strtofloat(edt_aliqICMS.Text);
         edt_aliqICMS.Text := floattostr(aux) + ',00';
       end;
     if strtofloat(edt_aliqICMS.Text) > 100 then
     edt_aliqICMS.Text := '100,00';

     if strtofloat(edt_aliqICMS.Text) < 0 then
     edt_aliqICMS.Text := '0,00';
  end
  else if not (verificaReal(edt_aliqICMS.Text)) and (edt_aliqICMS.Text <> '') then
    begin
     ShowMessage('Apenas números e vírgula - Formato: o,oo ');
     edt_aliqICMS.Text := '0,00';
     edt_aliqICMS.SetFocus;
    end
  else
     edt_aliqICMS.Text := '0,00';

  edt_aliqICMS.Text := duasCasas(edt_aliqICMS.Text);
end;

procedure TFrmCadastroCompra.edt_aliqIPIExit(Sender: TObject);
var aux : real;
begin
  inherited;
  if verificaReal(edt_aliqIPI.Text) then
  begin
    if not verificaVirgula(edt_aliqIPI.Text) then
       begin
         aux := strtofloat(edt_aliqIPI.Text);
         edt_aliqIPI.Text := floattostr(aux) + ',00';
       end;
     if strtofloat(edt_aliqIPI.Text) > 100 then
     edt_aliqIPI.Text := '100,00';

     if strtofloat(edt_aliqIPI.Text) < 0 then
     edt_aliqIPI.Text := '0,00';
  end
  else if not (verificaReal(edt_aliqIPI.Text)) and (edt_aliqIPI.Text <> '') then
    begin
     ShowMessage('Apenas números e vírgula - Formato: o,oo ');
     edt_aliqIPI.Text := '0,00';
     edt_aliqIPI.SetFocus;
    end
  else
     edt_aliqIPI.Text := '0,00';

  edt_aliqIPI.Text := duasCasas(edt_aliqIPI.Text);
end;

procedure TFrmCadastroCompra.data_emissaoChange(Sender: TObject);
begin
    if data_emissao.Date > date then
        begin
         ShowMessage('Não pode ser superior à data atual');
         data_emissao.Date := date;
        end;
end;

procedure TFrmCadastroCompra.data_chegadaChange(Sender: TObject);
begin
    if data_chegada.Date < data_emissao.Date then
        begin
         ShowMessage('Não pode ser inferior à data de emissão');
         data_chegada.Date := data_emissao.Date;
        end; 
end;

procedure TFrmCadastroCompra.edt_baseICMSKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9',',',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas números e vírgula!');
          Key := #0;
      end;
end;

procedure TFrmCadastroCompra.edt_valorICMSKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9',',',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas números e vírgula!');
          Key := #0;
      end;
end;

procedure TFrmCadastroCompra.edt_baseICMSsubstKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9',',',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas números e vírgula!');
          Key := #0;
      end;
end;

procedure TFrmCadastroCompra.edt_valorIcmsSubstKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9',',',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas números e vírgula!');
          Key := #0;
      end;
end;

procedure TFrmCadastroCompra.edt_valortotalProdutosKeyPress(
  Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9',',',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas números e vírgula!');
          Key := #0;
      end;
end;

procedure TFrmCadastroCompra.edt_valorFreteKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9',',',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas números e vírgula!');
          Key := #0;
      end;
end;

procedure TFrmCadastroCompra.edt_ValorSeguroKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9',',',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas números e vírgula!');
          Key := #0;
      end;
end;

procedure TFrmCadastroCompra.edt_descontoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9',',',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas números e vírgula!');
          Key := #0;
      end;
end;

procedure TFrmCadastroCompra.edt_outrasDespesasKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9',',',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas números e vírgula!');
          Key := #0;
      end;
end;

procedure TFrmCadastroCompra.edt_totalIPIKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9',',',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas números e vírgula!');
          Key := #0;
      end;
end;

procedure TFrmCadastroCompra.edt_ValorTotalKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9',',',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas números e vírgula!');
          Key := #0;
      end;
end;

procedure TFrmCadastroCompra.edt_quantidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
     if not (Key in ['0'..'9',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas números!');
          Key := #0;
      end;
end;


procedure TFrmCadastroCompra.edt_quantidadeExit(Sender: TObject);
var aux: integer; 
begin
  if not (verificaInteiro(edt_quantidade.Text)) and (edt_quantidade.Text <> '') then
    begin
     ShowMessage('Apenas números!');
     edt_quantidade.Text := '1';
     edt_quantidade.SetFocus;
    end
  else if edt_quantidade.Text = '' then
     edt_quantidade.Text := '1'
  else
     begin
       aux := strtoint(edt_quantidade.Text);
       if aux <= 0 then
           edt_quantidade.Text := '1'
     end;
end;

procedure TFrmCadastroCompra.edt_aliqIPIKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9',',',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas números e vírgula!');
          Key := #0;
      end;   

    if (Key = #13) then
      self.btn_add.Click;
end;

procedure TFrmCadastroCompra.edt_ValorUnitarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9',',',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas números e vírgula!');
          Key := #0;
      end;
end;

procedure TFrmCadastroCompra.edt_baseICMSitemKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9',',',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas números e vírgula!');
          Key := #0;
      end;
end;

procedure TFrmCadastroCompra.edt_ICMSitemKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9',',',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas números e vírgula!');
          Key := #0;
      end;
end;

procedure TFrmCadastroCompra.edt_ipiItemKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9',',',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas números e vírgula!');
          Key := #0;
      end;
end;

procedure TFrmCadastroCompra.edt_aliqICMSKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9',',',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas números e vírgula!');
          Key := #0;
      end;
end;

function TFrmCadastroCompra.duasCasas(texto: string): string;
var numero: real;
texto2: string;
begin
  numero := strtofloat(texto);
  texto2 := FloatToStrF(numero,ffnumber,12,2);
  result := StringReplace(texto2,'.','',[rfReplaceAll]);
end;

end.
