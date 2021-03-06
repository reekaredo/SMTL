unit uDaoCliente;

interface
  uses Windows, Messages, SysUtils, DB, uDm, uDao, uCliente, DBAccess, MyAccess, MemDS;

  type DaoCliente = class(Dao)

  private
  protected
  public
    constructor CrieObjeto;
    destructor destrua_se;

// ------------- M�TODOS DE CLIENTE ------------------
    function getDSCliente :  TMyDataSource;
    procedure carregaCliente (pCliente : Cliente);
    function SalvarCliente (pCliente : Cliente) : string;
    function ExcluiCliente(pCliente : Cliente) : string;
    function sqlCliente(pSQL: string) : Integer;
    function sqlSalvar(pSQL: string; tipo: Integer) : Integer;
end;

implementation

{ DaoCliente }


constructor DaoCliente.CrieObjeto;
begin
    inherited;
end;

destructor DaoCliente.destrua_se;
begin
    inherited;
end;

// ------------- M�TODOS DE CLIENTE ------------------
procedure DaoCliente.carregaCliente(pCliente: Cliente);
var inteiro : string;
begin
    if not umDM.SQL_cliente.Active then
        umDM.SQL_cliente.Open;

    pCliente.setDataI(umDM.datafldSQL_clientecli_dataI.Value);
    pCliente.setCodigo(umDM.intgrfldSQL_clientecli_id.Value);
    pCliente.setNome(umDM.strngfldSQL_clientecli_nome.Value);
    pCliente.setCPF(umDM.strngfldSQL_clientecli_cpf.Value);
    pCliente.setSexo(umDM.strngfldSQL_clientecli_sexo.Value);
    pCliente.setTelFixo(umDM.strngfldSQL_clientecli_telfixo.Value);
    pCliente.setCelular(umDM.strngfldSQL_clientecli_celular.Value);
    pCliente.setLogradouro(umDM.strngfldSQL_clientecli_logradouro.Value);
    pCliente.setNumero(umDM.strngfldSQL_clientecli_numero.Value);
    pCliente.setBairro(umDM.strngfldSQL_clientecli_bairro.Value);

    pCliente.setApelido(umDM.strngfldSQL_clientecli_apelido.Value);
    pCliente.setTipo(umDM.strngfldSQL_clientecli_tipo.Value);
    pCliente.setTelRecado(umDM.strngfldSQL_clientecli_TelRecado.Value);
    pCliente.setComplemento(umDM.strngfldSQL_clientecli_complemento.Value);
    pCliente.setCEP(umDM.strngfldSQL_clientecli_cep.Value);
    pCliente.setRG(umDM.strngfldSQL_clientecli_rg.Value);
    pCliente.setDataAlteracao(umDM.dateSQL_clientecli_DataAlteracao.Value);
    pCliente.getCondicao.setCodigo(umDM.intgrfldSQL_clientecli_condicao.Value);
    pCliente.getUmaCidade.setCodigo(umDM.intgrfldSQL_clientecli_cidade.Value);

    //buscar o nome da condi��o
    inteiro :=  InttoStr(umDM.intgrfldSQL_clientecli_condicao.Value);
    umDM.SQL_condicoes.Active := False;
    umDM.SQL_condicoes.SQL.Text := 'select * from condicoes where cond_id = ' + inteiro ;
      if not umDM.SQL_condicoes.Active then
        umDM.SQL_condicoes.Open;

    pCliente.getCondicao.setNome(umDM.strngfldSQL_condicoescond_nome.Value);

    umDM.SQL_condicoes.Active := False;
    umDM.SQL_condicoes.SQL.Text := 'select * from condicoes';
      if not umDM.SQL_condicoes.Active then
        umDM.SQL_condicoes.Open;     

    //buscar o nome da cidade
    inteiro :=  InttoStr(umDM.intgrfldSQL_clientecli_cidade.Value);
    umDM.SQL_cidade.Active := False;
    umDM.SQL_cidade.SQL.Text := 'select * from cidades where cid_id = ' + inteiro ;
      if not umDM.SQL_cidade.Active then
        umDM.SQL_cidade.Open;

    pCliente.getUmaCidade.setCidade(umDM.strngfldSQL_cidadecid_nome.Value);

    umDM.SQL_cidade.Active := False;
    umDM.SQL_cidade.SQL.Text := 'select * from cidades';
      if not umDM.SQL_cidade.Active then
        umDM.SQL_cidade.Open;
end;

function DaoCliente.ExcluiCliente(pCliente: Cliente): string;
begin
   if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

      if not umDM.SQL_cliente.Active then
        begin
          umDM.SQL_cliente.Open;
        end;

      umDM.SQL_cliente.Edit;
      umDM.intgrfldSQL_clientecli_id.Value := pCliente.getCodigo;
       Try
          umDM.SQL_cliente.Delete;
          Result := 'OK';
       except
          Result := 'NO';
       end;
end;

function DaoCliente.getDSCliente: TMyDataSource;
begin
  Result := umDM.ds_clientes;
end;

function DaoCliente.SalvarCliente(pCliente: Cliente): string;
begin
     if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

     if not umDM.SQL_cliente.Active then
        begin
          umDM.SQL_cliente.Open;
        end;

      if pCliente.getCodigo = 0 then
        umDM.SQL_cliente.Insert
      else
         umDM.SQL_cliente.Edit;

    umDM.strngfldSQL_clientecli_nome.Value := pCliente.getNome;
    umDM.strngfldSQL_clientecli_cpf.Value  := pCliente.getCPF;
    umDM.strngfldSQL_clientecli_sexo.Value := pCliente.getSexo;
    umDM.strngfldSQL_clientecli_telfixo.Value := pCliente.getTelFixo;
    umDM.strngfldSQL_clientecli_celular.Value := pCliente.getCelular;
    umDM.strngfldSQL_clientecli_logradouro.Value  := pCliente.getLogradouro;
    umDM.strngfldSQL_clientecli_numero.Value := pCliente.getNumero;
    umDM.strngfldSQL_clientecli_bairro.Value := pCliente.getBairro;
    umDM.intgrfldSQL_clientecli_cidade.Value := pCliente.getUmaCidade.getCodigo;
    umDM.datafldSQL_clientecli_dataI.Value := pCliente.getDataI;

    umDM.strngfldSQL_clientecli_apelido.Value := pCliente.getApelido;
    umDM.strngfldSQL_clientecli_tipo.Value := pCliente.getTipo;
    umDM.strngfldSQL_clientecli_TelRecado.Value := pCliente.getTelRecado;
    umDM.strngfldSQL_clientecli_complemento.Value := pCliente.getComplemento;
    umDM.strngfldSQL_clientecli_cep.Value := pCliente.getCEP;
    umDM.strngfldSQL_clientecli_rg.Value  := pCliente.getRG;
    umDM.dateSQL_clientecli_DataAlteracao.Value := pCliente.getDataAlteracao;
    umDM.intgrfldSQL_clientecli_condicao.Value := pCliente.getcondicao.getCodigo;

    umDM.SQL_cliente.Post;
    Result := 'OK';
end;

function DaoCliente.sqlCliente(pSQL: string): Integer;
begin
   umDM.SQL_cliente.Active := False;
   umDM.SQL_cliente.SQL.Text := pSQL;
    if not umDM.SQL_cliente.Active then
      umDM.SQL_cliente.Open;

  if umDM.SQL_cliente.RecordCount = 0 then
    result :=  0
  else
    result := 1;
end;

function DaoCliente.sqlSalvar(pSQL: string; tipo: Integer): Integer;
begin
    //buscar nos clientes se h� o cpf cadastrado
       begin
          umDM.SQL_cliente.Active := False;
          umDM.SQL_cliente.SQL.Text := pSQL;
            if not umDM.SQL_cliente.Active then
              umDM.SQL_cliente.Open;

          if umDM.SQL_cliente.RecordCount = 0 then
            result :=  0
          else
            result := 1;

          umdm.SQL_cliente.Active := false;
          umDM.SQL_cliente.SQL.Text := 'select * from clientes';
            if not umDM.SQL_cliente.Active then
              umDM.SQL_cliente.Open;
       end;
end;

end.
