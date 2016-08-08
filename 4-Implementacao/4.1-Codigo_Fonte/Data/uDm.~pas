unit uDm;
// Possui as conexões com o Database
interface

uses
  SysUtils, Classes, DB, MemDS, DBAccess, MyAccess;

type
  TDataModule1 = class(TDataModule)
    con_banco: TMyConnection;
    ds_paises: TMyDataSource;
    SQL_pais: TMyQuery;
    intgrfldSQL_paispais_id: TIntegerField;
    strngfldSQL_paispais_nome: TStringField;
    strngfldSQL_paispais_ddi: TStringField;
    strngfldSQL_paispais_sigla: TStringField;
    SQL_estado: TMyQuery;
    intgrfldSQL_estadoest_id: TIntegerField;
    strngfldSQL_estadoest_nome: TStringField;
    strngfldSQL_estadoest_uf: TStringField;
    intgrfldSQL_estadoest_pais: TIntegerField;
    ds_estados: TMyDataSource;
    SQL_cidade: TMyQuery;
    intgrfldSQL_cidadecid_id: TIntegerField;
    strngfldSQL_cidadecid_nome: TStringField;
    intgrfldSQL_cidadecid_estado: TIntegerField;
    strngfldSQL_cidadecid_ddd: TStringField;
    ds_cidades: TMyDataSource;
    SQL_cliente: TMyQuery;
    intgrfldSQL_clientecli_id: TIntegerField;
    strngfldSQL_clientecli_nome: TStringField;
    strngfldSQL_clientecli_cpf: TStringField;
    strngfldSQL_clientecli_sexo: TStringField;
    strngfldSQL_clientecli_telfixo: TStringField;
    strngfldSQL_clientecli_celular: TStringField;
    strngfldSQL_clientecli_logradouro: TStringField;
    strngfldSQL_clientecli_bairro: TStringField;
    intgrfldSQL_clientecli_cidade: TIntegerField;
    ds_clientes: TMyDataSource;
    SQL_fornecedor: TMyQuery;
    intgrfldSQL_fornecedorfor_id: TIntegerField;
    strngfldSQL_fornecedorfor_nome: TStringField;
    strngfldSQL_fornecedorfor_fone1: TStringField;
    strngfldSQL_fornecedorfor_fone2: TStringField;
    strngfldSQL_fornecedorfor_email: TStringField;
    intgrfldSQL_fornecedorfor_cidade: TIntegerField;
    ds_fornecedores: TMyDataSource;
    SQL_marca: TMyQuery;
    intgrfldSQL_marcamarca_id: TIntegerField;
    strngfldSQL_marcamarca_nome: TStringField;
    ds_marcas: TMyDataSource;
    SQL_produto: TMyQuery;
    intgrfldSQL_produtopro_id: TIntegerField;
    strngfldSQL_produtopro_nome: TStringField;
    strngfldSQL_produtopro_barra: TStringField;
    fltfldSQL_produtopro_custo: TFloatField;
    fltfldSQL_produtopro_preco: TFloatField;
    intgrfldSQL_produtopro_estoque: TIntegerField;
    intgrfldSQL_produtopro_marca: TIntegerField;
    strngfldSQL_produtopro_obs: TStringField;
    intgrfldSQL_produtopro_fornecedor: TIntegerField;
    ds_produtos: TMyDataSource;
    SQL_usuario: TMyQuery;
    intgrfldSQL_usuariouser_id: TIntegerField;
    strngfldSQL_usuariouser_nome: TStringField;
    strngfldSQL_usuariouser_login: TStringField;
    strngfldSQL_usuariouser_senha: TStringField;
    intgrfldSQL_usuariouser_tipo: TIntegerField;
    ds_usuarios: TMyDataSource;
    SQL_forma: TMyQuery;
    intgrfldSQL_formaforma_id: TIntegerField;
    strngfldSQL_formaforma_nome: TStringField;
    ds_forma: TMyDataSource;
    datafldSQL_clientecli_dataI: TDateTimeField;
    SQL_grupo: TMyQuery;
    ds_grupos: TMyDataSource;
    intgrfldSQL_grupogrupo_id: TIntegerField;
    strngfldSQL_grupogrupo_nome: TStringField;
    intgrfldSQL_produtopro_grupo: TIntegerField;
    intgrfldSQL_produtopro_unidade: TIntegerField;
    strngfldSQL_produtopro_referencia: TStringField;
    dateSQL_produtopro_dataCadastro: TDateTimeField;
    dateSQL_produtopro_dataAlteracao: TDateTimeField;
    dateSQL_produtopro_dataUltimaCompra: TDateTimeField;
    dateSQL_produtopro_dataUltimaVenda: TDateTimeField;
    floatSQL_produtopro_PrecoMinimo: TFloatField;
    floatSQL_produtopro_Comissao: TFloatField;
    strngfldSQL_produtopro_NomeGrupo: TStringField;
    SQL_funcionario: TMyQuery;
    intgrfldSQL_funcionariofunc_id: TIntegerField;
    strngfldSQL_funcionariofunc_nome: TStringField;
    strngfldSQL_funcionariofunc_cpf: TStringField;
    strngfldSQL_funcionariofunc_sexo: TStringField;
    strngfldSQL_funcionariofunc_telFixo: TStringField;
    strngfldSQL_funcionariofunc_celular: TStringField;
    strngfldSQL_funcionariofunc_logradouro: TStringField;
    strngfldSQL_funcionariofunc_numero: TStringField;
    strngfldSQL_funcionariofunc_bairro: TStringField;
    intgrfldSQL_funcionariofunc_cidade: TIntegerField;
    strngfldSQL_funcionariofunc_cargo: TStringField;
    floatSQL_funcionariofunc_salario: TFloatField;
    ds_funcionarios: TMyDataSource;
    dateSQL_funcionariofunc_dataI: TDateTimeField;
    intgrfldSQL_usuariouser_funcionario: TIntegerField;
    SQL_condicoes: TMyQuery;
    intgrfldSQL_condicoescond_id: TIntegerField;
    strngfldSQL_condicoescond_nome: TStringField;
    ds_condicoes: TMyDataSource;
    strngfldSQL_fornecedorfor_representante: TStringField;
    strngfldSQL_fornecedorfor_telefone: TStringField;
    strngfldSQL_clientecli_apelido: TStringField;
    strngfldSQL_clientecli_tipo: TStringField;
    strngfldSQL_clientecli_TelRecado: TStringField;
    strngfldSQL_clientecli_complemento: TStringField;
    strngfldSQL_clientecli_cep: TStringField;
    strngfldSQL_clientecli_rg: TStringField;
    intgrfldSQL_clientecli_condicao: TIntegerField;
    dateSQL_clientecli_DataAlteracao: TDateTimeField;
    strngfldSQL_clientecli_numero: TStringField;
    strngfldSQL_fornecedorfor_nomeFantasia: TStringField;
    strngfldSQL_fornecedorfor_logradouro: TStringField;
    strngfldSQL_fornecedorfor_numero: TStringField;
    strngfldSQL_fornecedorfor_complemento: TStringField;
    strngfldSQL_fornecedorfor_bairro: TStringField;
    strngfldSQL_fornecedorfor_cep: TStringField;
    strngfldSQL_fornecedorfor_cnpj: TStringField;
    strngfldSQL_fornecedorfor_inscEst: TStringField;
    intgrfldSQL_fornecedorfor_condicao: TIntegerField;
    dateSQL_fornecedorfor_dataCadastro: TDateTimeField;
    dateSQL_fornecedorfor_dataAlteracao: TDateTimeField;
    SQL_parcela: TMyQuery;
    intgrfldSQL_parcelaparc_condicao: TIntegerField;
    intgrfldSQL_parcelaparc_numero: TIntegerField;
    intgrfldSQL_parcelaparc_dias: TIntegerField;
    floatSQL_parcelaparc_percentual: TFloatField;
    intgrfldSQL_parcelaparc_forma: TIntegerField;
    ds_parcelas: TMyDataSource;
    SQL_imagens: TMyQuery;
    ds_imagens: TMyDataSource;
    SQL_imagenscod_imagem: TIntegerField;
    SQL_imagenscod_produto: TIntegerField;
    SQL_imagenscaminho_imagem: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

end.
