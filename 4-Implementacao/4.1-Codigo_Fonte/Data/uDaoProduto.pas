unit uDaoProduto;

interface
  uses Windows, Messages, SysUtils, DB, uDm, uDao, uProduto, DBAccess, MyAccess, MemDS, ucolecaoImagens, uImagem;

  type DaoProduto = class(Dao)

  private
  protected
    editando: boolean;
  public
    constructor CrieObjeto;
    destructor destrua_se;

// ------------- MÉTODOS DE PRODUTO  ------------------
    function getDSProduto :  TMyDataSource;
    procedure carregaProduto (pProduto : Produto);
    procedure salvaImagens (pImagens: ColecaoImagens; pProduto: produto);
    function SalvarProduto (pProduto : Produto; pImagens: ColecaoImagens) : string;
    procedure CarregaImagens (pProduto : produto; pImagens: ColecaoImagens);
    function ExcluiProduto(pProduto : Produto) : string;
    procedure ExcluiImagem(pImagem: Imagem);
    function sqlProduto(pSQL: string) : Integer;

end;

implementation

{ DaoProduto }

constructor DaoProduto.CrieObjeto;
begin
  inherited;
end;

destructor DaoProduto.destrua_se;
begin
  inherited;
end;

procedure DaoProduto.CarregaImagens(pProduto: produto;
  pImagens: ColecaoImagens);
var codigo,caminho : string;
tamanho, k: integer;
imagem2: Imagem;
begin

   codigo := IntToStr(pProduto.getCodigo);
   umDM.SQL_imagens.Active := false;
   umDM.SQL_imagens.SQL.Text := 'select * from imagens where cod_produto = ' + codigo;
   if not umDM.SQL_imagens.Active then
      umDM.SQL_imagens.Open;
   tamanho := umDM.SQL_imagens.RecordCount;

     if tamanho > 0 then
       begin
           For k:=1 to tamanho do
            begin
               imagem2:= Imagem.crieobj;
               imagem2.setCaminho(umDM.SQL_imagenscaminho_imagem.Value);
               imagem2.setCodigo(umDM.SQL_imagenscod_imagem.Value);
               imagem2.setProduto(umDM.SQL_imagenscod_produto.Value);
              // caminho := umDM.SQL_imagenscaminho_imagem.Value;
               pImagens.insere(imagem2,k);
               umDM.SQL_imagens.Next;
           //    imagem2.destrua_se;
            end;
       end;
end;

procedure DaoProduto.carregaProduto(pProduto: Produto);
var inteiro : string;
begin
    if not umDM.SQL_produto.Active then
        umDM.SQL_produto.Open;

    pProduto.setCodigo(umDM.intgrfldSQL_produtopro_id.Value);
    pProduto.setNome(umDM.strngfldSQL_produtopro_nome.Value);
    pProduto.setBarra(umDM.strngfldSQL_produtopro_barra.Value);
    pProduto.setCusto(umDM.fltfldSQL_produtopro_custo.Value);
    pProduto.setPreco(umDM.fltfldSQL_produtopro_preco.Value);
    pProduto.setEstoque(umDM.intgrfldSQL_produtopro_estoque.Value);
    pProduto.setObservacao(umDM.strngfldSQL_produtopro_obs.Value);
    pProduto.setUnidade(umDM.intgrfldSQL_produtopro_unidade.Value);
    pProduto.setReferencia(umDM.strngfldSQL_produtopro_referencia.Value);
    pProduto.setDataCadastro(umDM.dateSQL_produtopro_dataCadastro.Value);
    pProduto.setDataAlteracao(umDM.dateSQL_produtopro_dataAlteracao.Value);
    pProduto.setDataUltimaVenda(umDM.dateSQL_produtopro_dataUltimaVenda.Value);
    pProduto.setDataUltimaCompra(umDM.dateSQL_produtopro_dataUltimaCompra.Value);
    pProduto.setPrecoMin(umDM.floatSQL_produtopro_PrecoMinimo.Value);
    pProduto.setComissao(umDM.floatSQL_produtopro_Comissao.Value);

    pProduto.getUmaMarca.setCodigo(umDM.intgrfldSQL_produtopro_marca.Value);
    pProduto.getUmFornecedor.setCodigo(umDM.intgrfldSQL_produtopro_fornecedor.Value);
    pProduto.getUmGrupo.setCodigo(umDM.intgrfldSQL_produtopro_grupo.Value);

// pegar o nome do grupo e setar no produto
    inteiro := IntToStr(umDM.intgrfldSQL_produtopro_grupo.Value);

    umDM.SQL_grupo.Active := False;
    umDM.SQL_grupo.SQL.Text := 'select * from grupos where grupo_id = ' + inteiro ;
      if not umDM.SQL_grupo.Active then
        umDM.SQL_grupo.Open;

    pProduto.getUmGrupo.setNome(umDM.strngfldSQL_grupogrupo_nome.Value);

    umDM.SQL_grupo.Active := False;
    umDM.SQL_grupo.SQL.Text := 'select * from grupos';
      if not umDM.SQL_grupo.Active then
        umDM.SQL_grupo.Open;
            
// pegar o nome da marca e setar no produto
    inteiro :=  InttoStr(umDM.intgrfldSQL_produtopro_marca.Value);

    umDM.SQL_marca.Active := False;
    umDM.SQL_marca.SQL.Text := 'select * from marcas where marca_id = ' + inteiro ;
      if not umDM.SQL_marca.Active then
        umDM.SQL_marca.Open;

    pProduto.getUmaMarca.setNome(umDM.strngfldSQL_marcamarca_nome.Value);

    umDM.SQL_marca.Active := False;
    umDM.SQL_marca.SQL.Text := 'select * from marcas';
      if not umDM.SQL_marca.Active then
        umDM.SQL_marca.Open;

// pegar o nome do fornecedor e setar no produto
    inteiro :=  InttoStr(umDM.intgrfldSQL_produtopro_fornecedor.Value);

    umDM.SQL_fornecedor.Active := False;
    umDM.SQL_fornecedor.SQL.Text := 'select * from fornecedores where for_id = ' + inteiro ;
      if not umDM.SQL_fornecedor.Active then
        umDM.SQL_fornecedor.Open;

    pProduto.getUmFornecedor.setNome(umDM.strngfldSQL_fornecedorfor_nome.Value);

    umDM.SQL_fornecedor.Active := False;
    umDM.SQL_fornecedor.SQL.Text := 'select * from fornecedores';
      if not umDM.SQL_fornecedor.Active then
        umDM.SQL_fornecedor.Open;
end;

function DaoProduto.ExcluiProduto(pProduto: Produto): string;
begin
   if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

      if not umDM.SQL_produto.Active then
        begin
          umDM.SQL_produto.Open;
        end;

      umDM.SQL_produto.Edit;
      umDM.intgrfldSQL_produtopro_id.Value := pProduto.getCodigo;
       Try
          umDM.SQL_produto.Delete;
          Result := 'OK';
       except
          Result := 'NO';
       end;
end;

function DaoProduto.getDSProduto: TMyDataSource;
begin
   Result := umDM.ds_produtos;
end;

procedure DaoProduto.salvaImagens(pImagens: ColecaoImagens; pProduto: produto);
var tam, k, tamReal, aux: integer;
begin 
   if not umDM.con_banco.Connected then
     begin
       umDM.con_banco.Connected := True;
     end;

   if not umDM.SQL_imagens.Active then
       umDM.SQL_imagens.Open;

   tam:= pImagens.getQtd;
   tamReal:= 0;
     For k:= 1 to tam do
       begin
         if pImagens.getObj(k).getCaminho <> '' then
              tamReal:= tamReal + 1;
       end;

     For k:= 1 to tamReal do
     begin
       if editando then
          begin
            aux := pImagens.getobj(k).getCodigo;

            umDM.SQL_imagens.Active := false;
            umDM.SQL_imagens.SQL.Text := 'select * from imagens where cod_imagem = ' + inttostr(aux);

               if not umDM.SQL_imagens.Active then
                   umDM.SQL_imagens.Open;

            umDM.SQL_imagens.edit;
       //     umDM.SQL_imagenscod_imagem.Value := pImagens.getobj(k).getCodigo;
            umDM.SQL_imagenscod_produto.Value := pProduto.getCodigo;
            umDM.SQL_imagenscaminho_imagem.Value := pImagens.getobj(k).getCaminho;
            umDM.SQL_imagens.Post;
          end;
      end;
     
            umDM.SQL_imagens.Active := false;
            umDM.SQL_imagens.SQL.Text := 'select * from imagens';

               if not umDM.SQL_imagens.Active then
                   umDM.SQL_imagens.Open;

       For k:=1 to tamReal do
          begin
             if not editando then
               begin
                   umDM.SQL_imagens.insert;
                   umDM.SQL_imagenscod_produto.Value:= pProduto.getCodigo;
                   umDM.SQL_imagenscaminho_imagem.Value:= pImagens.getObj(k).getCaminho;
                   umDM.SQL_imagens.Post;
               end;
          end;
end;

function DaoProduto.SalvarProduto(pProduto: Produto; pImagens: ColecaoImagens): string;
var inserido: integer;
produto2: Produto;
aux: string;
begin
produto2:= Produto.crieobj;
inserido := 1;
if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

     if not umDM.SQL_produto.Active then
        begin
          umDM.SQL_produto.Open;
        end;

      if pProduto.getCodigo = 0 then
        begin
           umDM.SQL_produto.Insert;
           inserido := 0;
           editando := false;
        end
      else
        begin
         umDM.SQL_produto.Edit;
         produto2.setCodigo(pProduto.getCodigo);
         editando := True;
        end;

    umDM.strngfldSQL_produtopro_nome.Value := pProduto.getNome;
    umDM.strngfldSQL_produtopro_barra.Value := pProduto.getBarra;
    umDM.fltfldSQL_produtopro_custo.Value := pProduto.getCusto;
    umDM.fltfldSQL_produtopro_preco.Value := pProduto.getPreco;
    umDM.intgrfldSQL_produtopro_estoque.Value := pProduto.getEstoque;
    umDM.strngfldSQL_produtopro_obs.Value := pProduto.getObservacao;
    umDM.intgrfldSQL_produtopro_marca.Value := pProduto.getUmaMarca.getCodigo;
    umDM.intgrfldSQL_produtopro_fornecedor.Value := pProduto.getUmFornecedor.getCodigo;

    umDM.intgrfldSQL_produtopro_grupo.Value := pProduto.getumGrupo.getCodigo;
    umDM.intgrfldSQL_produtopro_unidade.Value      := pProduto.getUnidade;
    umDM.strngfldSQL_produtopro_referencia.Value   := pProduto.getReferencia;
    umDM.dateSQL_produtopro_dataCadastro.Value     := pProduto.getDataCadastro;
    umDM.dateSQL_produtopro_dataAlteracao.Value    := pProduto.getDataAlteracao;
    umDM.floatSQL_produtopro_PrecoMinimo.Value     := pProduto.getPrecoMin;
    umDM.floatSQL_produtopro_Comissao.Value        := pProduto.getComissao;
    umDM.strngfldSQL_produtopro_NomeGrupo.value := pProduto.getumGrupo.getNome;
    
    if pProduto.getCodigo <> 0 then
      begin
          umDM.dateSQL_produtopro_dataUltimaVenda.Value  := pProduto.getDataUltimaVenda;
          umDM.dateSQL_produtopro_dataUltimaCompra.Value := pProduto.getDataUltimaCompra;
      end;

    umDM.SQL_produto.Post;

    if not editando then
       begin
        //seleciona ultimo produto inserido no banco
        aux:= 'select * from produtos order by pro_id desc limit 1';
        umDM.SQL_produto.Active := false;
        umDM.SQL_produto.SQL.Text := aux;
          if not umDM.SQL_produto.Active then
            umDM.SQL_produto.Open;
        //seta o código no objeto auxiliar
        produto2.setCodigo(umDM.intgrfldSQL_produtopro_id.value);
        self.salvaImagens(pImagens,produto2);
       end
    else
       begin
         self.salvaImagens(pImagens,produto2);
       end;


    Result := 'OK';
end;

function DaoProduto.sqlProduto(pSQL: string): Integer;
begin
   umDM.SQL_produto.Active := False;
   umDM.SQL_produto.SQL.Text := pSQL;
    if not umDM.SQL_produto.Active then
      umDM.SQL_produto.Open;

  if umDM.SQL_produto.RecordCount = 0 then
    result :=  0
  else
    result := 1;
end;

procedure DaoProduto.ExcluiImagem(pImagem: Imagem);
var numero: integer;
begin
 if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

      if not umDM.SQL_imagens.Active then
        begin
          umDM.SQL_imagens.Open;
        end;

      umDM.SQL_imagens.Edit;
      numero:= pImagem.getCodigo;
      umDM.SQL_imagens.Active := false;
      umDM.SQL_imagens.SQL.Text := 'select * from imagens where cod_imagem = ' + inttostr(numero);

         if not umDM.SQL_imagens.Active then
            umDM.SQL_imagens.Open;

       Try
          umDM.SQL_imagens.Delete;
       except

       end;
end;

end.
