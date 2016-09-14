unit uFrmCadastroCompra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroPai, StdCtrls, ComCtrls, Buttons, uCompra, uController,
  uItemCompra, uColecaoItensCompra, uFrmConsultaCondicao, uFrmConsultaFornecedor,
  uFrmConsultaTransportadora,uFrmConsultaProduto, ExtCtrls, uProduto;

type
  TFrmCadastroCompra = class(TFrmCadastroPai)
    lbl_nome: TLabel;
    lbl_1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edt_NumeroNota: TEdit;
    edt_dataChegada: TEdit;
    edt_dataEmissao: TEdit;
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
    edt_especie: TEdit;
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
    procedure btn_buscar1Click(Sender: TObject);
    procedure btn_buscar2Click(Sender: TObject);
    procedure btn_buscarProdutoClick(Sender: TObject);
    procedure btn_buscar3Click(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
    salvaCompra: Boolean;
  protected
    procedure Sair;  override;
    procedure Salvar; override;
    procedure CarregaEdit; override;
//    procedure LimparCampos; override;
    function verificaInteiro(texto: string): Boolean;
    function verificaReal(texto: string): Boolean;
    function validaCampos: Boolean;
    function validaItem: boolean;
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
  self.edt_dataEmissao.Text := datetostr(umaCompra.getdataEmissao);
  self.edt_dataChegada.Text := datetostr(umacompra.getDataChegada);

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
  self.edt_placaVeiculo.Text := umaCompra.getPlacaVeiculo;
  self.edt_ufVeiculo.Text := umaCompra.getUFveiculo;
  self.edt_CNPJ.Text := umaCompra.getUmaTransportadora.getCNPJ;
  self.edt_quantidade.Text := inttostr(umacompra.getQtde);
  self.edt_especie.Text := umacompra.getEspecie;
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
            Self.CarregaEdit;
        end;

    if self.btn_salvar.Caption = '&Salvar' then
      HabilitaCampos
    else
      DesabilitaCampos;
end;

procedure TFrmCadastroCompra.DesabilitaCampos;
begin

end;

procedure TFrmCadastroCompra.EscondeCampos;
begin

end;

procedure TFrmCadastroCompra.HabilitaCampos;
begin

end;

procedure TFrmCadastroCompra.LimparCampos;
var k: Integer;
begin

  self.edt_cod.clear;
  self.edt_NumeroNota.clear;
  self.edt_serieNota.clear;
  self.cbTipoNota.ItemIndex := -1;

  self.edt_codFornecedor.clear;
  self.edt_Fornecedor.clear;
  self.edt_dataEmissao.clear;
  self.edt_dataChegada.clear;

  self.edt_baseICMS.clear;
  self.edt_valorICMS.clear;
  self.edt_baseICMSsubst.clear;
  self.edt_valorIcmsSubst.clear;
  self.edt_valortotalProdutos.clear;
  self.edt_valorFrete.Text := '0,00';
  self.edt_ValorSeguro.Text := '0,00';
  self.edt_desconto.Text := '0,00';
  self.edt_outrasDespesas.Text := '0,00';
  self.edt_totalIPI.Text := '0,00';
  self.edt_ValorTotal.clear;

  self.edt_CodTransportadora.clear;
  self.edt_Transportadora.clear;
  self.cbFrete.ItemIndex := -1;

  self.edt_antt.clear;
  self.edt_placaVeiculo.clear;
  self.edt_ufVeiculo.clear;
  self.edt_CNPJ.clear;
  self.edt_quantidade.clear;
  self.edt_especie.clear;
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
var incluido, excluido, permitir, code1 : string;
selected, tam, k, itens, x : integer;
men : TForm;
item2, item1: ItemCompra;
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
             umacompra.setDataEmissao(strtodate(edt_dataEmissao.Text));
             umaCompra.setDataChegada(strtodate(edt_dataChegada.Text));
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
             umacompra.setPlacaVeiculo(edt_placaVeiculo.Text);
             umacompra.setUFveiculo(edt_ufVeiculo.Text);
                 if cbFrete.ItemIndex = 0 then
                    umaCompra.setFretePorConta('0')
                 else
                    umaCompra.setFretePorConta('1');

             umacompra.setEspecie(edt_especie.Text);
             umacompra.setMarca(edt_marca.Text);
             umacompra.setNumeracao(edt_numeracao.Text);
             umacompra.setPesoBruto(strtofloat(edt_pesobruto.Text));
             umacompra.setPesoLiquido(strtofloat(edt_pesoLiquido.Text));
             code1 := edt_NumeroNota.Text + edt_codFornecedor.Text;
           //  umaCompra.setCodCompra(strtoint(code1));

            incluido := umController.getcontrollercompra.salvaCompra(umaCompra);

            tam := umaCompra.getListaProdutos.getQtd;

            // se é uma nova compra, inserir os itens no banco após já ter salvo a compra
             if umaCompra.getCodCompra = 0 then
              begin
               For k:= 1 to tam do
               begin
                   item2 := umacompra.getListaprodutos.getObj(k);
                   item2.setCodCompra(strtoint(code1));
                   item2.setNumero(k);
                   umController.getControllerItemCompra.salvaItemCompra(item2);
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
                           item1.setNumero(itens);
                           umController.getControllerItemCompra.excluiItemCompra(item1);
                          end;
                       end;

                  for k:=1 to tam do
                    begin
                          item2 := umacompra.getListaprodutos.getObj(k);
                          item2.setCodCompra(strtoint(code1));
                          item2.setNumero(k);
                          umController.getControllerItemCompra.salvaItemCompra(item2);
                    end;
                 ShowMessage('Compra alterada com sucesso!');
               end;
            inherited;
         end;

     // inherited;  --> somente após excluir
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
          self.cbTipoNota.SetFocus;
        end
    else if self.edt_Fornecedor.Text = '' then
        begin
          ShowMessage('Escolha um fornecedor!');
          self.btn_buscar1.Click;
        end
    else if self.edt_dataEmissao.Text = '' then
        begin
          ShowMessage('Preencha a data de emissão!');
          self.edt_dataEmissao.SetFocus;
        end
    else if self.edt_dataChegada.Text = '' then
        begin
          ShowMessage('Preencha a data de chegada!');
          self.edt_dataChegada.SetFocus;
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
    else if self.edt_especie.Text = '' then
        begin
          ShowMessage('Digite a espécie!');
          self.edt_especie.SetFocus;
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

end;

function TFrmCadastroCompra.verificaReal(texto: string): Boolean;
begin

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
  self.edt_placaVeiculo.Text := umacompra.getumatransportadora.getPlaca;
  self.edt_ufVeiculo.Text := umacompra.getumatransportadora.getUFveiculo;
  self.edt_CNPJ.Text := umacompra.getumatransportadora.getCNPJ;
  umFrmConsultaTransportadora.btn_Sair.Caption := 'Sair';
end;

procedure TFrmCadastroCompra.btn_buscarProdutoClick(Sender: TObject);
begin
  umFrmConsultaProduto.ConhecaObj(umProduto,umController);
  umFrmConsultaProduto.btn_Sair.Caption := 'Selecionar';
  umFrmConsultaProduto.ShowModal;
  self.edt_codProduto.Text := inttostr(umproduto.getCodigo);
  self.edt_produto.Text := umproduto.getNome;
  self.edt_unid.Text := inttostr(umproduto.getUnidade);
  self.edt_ValorUnitario.Text := floattostr(umproduto.getPreco);
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
      self.edt_ValorUnitario.Clear;
      self.edt_valortotalItem.Clear;
      self.edt_baseICMSitem.Clear;
      self.edt_ICMSitem.Clear;
      self.edt_ipiItem.Clear;
      self.edt_aliqICMS.clear;
      self.edt_aliqIPI.Clear;
end;

procedure TFrmCadastroCompra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  LimparCampos;
  umaCompra.getListaProdutos.destrua_se;
  umaCompra := Compra.crieobj;
end;

end.
