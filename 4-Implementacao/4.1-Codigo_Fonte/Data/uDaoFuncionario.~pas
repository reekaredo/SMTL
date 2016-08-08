unit uDaoFuncionario;

interface
  uses Windows, Messages, SysUtils, DB, uDm, uDao, uFuncionario, DBAccess, MyAccess, MemDS;

  type DaoFuncionario = class(Dao)

  private
  protected
  public
    constructor CrieObjeto;
    destructor destrua_se;

// ------------- MÉTODOS DE FUNCIONARIO ------------------
    function getDSFuncionario :  TMyDataSource;
    procedure carregaFuncionario (pFuncionario : Funcionario);
    function SalvarFuncionario (pFuncionario : Funcionario) : string;
    function ExcluiFuncionario(pFuncionario : Funcionario) : string;
    function sqlFuncionario(pSQL: string) : Integer;
    function sqlDependencia(pSQL: string) : Integer;

end;

implementation

{ DaoFuncionario }

procedure DaoFuncionario.carregaFuncionario(pFuncionario: Funcionario);
var inteiro : string;
begin
    if not umDM.SQL_funcionario.Active then
        umDM.SQL_funcionario.Open;

    pFuncionario.setDataI(umDM.dateSQL_funcionariofunc_dataI.Value);
    pFuncionario.setCodigo(umDM.intgrfldSQL_funcionariofunc_id.Value);
    pFuncionario.setNome(umDM.strngfldSQL_funcionariofunc_nome.Value);
    pFuncionario.setCPF(umDM.strngfldSQL_funcionariofunc_cpf.Value);
    pFuncionario.setSexo(umDM.strngfldSQL_funcionariofunc_sexo.Value);
    pFuncionario.setTelFixo(umDM.strngfldSQL_funcionariofunc_telFixo.Value);
    pFuncionario.setCelular(umDM.strngfldSQL_funcionariofunc_celular.Value);
    pFuncionario.setLogradouro(umDM.strngfldSQL_funcionariofunc_logradouro.Value);
    pFuncionario.setNumero(umDM.strngfldSQL_funcionariofunc_numero.Value);
    pFuncionario.setBairro(umDM.strngfldSQL_funcionariofunc_bairro.Value);
    pFuncionario.setCargo(umDM.strngfldSQL_funcionariofunc_cargo.Value);
    pFuncionario.setSalario(umDM.floatSQL_funcionariofunc_salario.Value);

    pFuncionario.getUmaCidade.setCodigo(umDM.intgrfldSQL_funcionariofunc_cidade.Value);

    inteiro :=  InttoStr(umDM.intgrfldSQL_funcionariofunc_cidade.Value);

    umDM.SQL_cidade.Active := False;
    umDM.SQL_cidade.SQL.Text := 'select * from cidades where cid_id = ' + inteiro ;
      if not umDM.SQL_cidade.Active then
        umDM.SQL_cidade.Open;

    pFuncionario.getUmaCidade.setCidade(umDM.strngfldSQL_cidadecid_nome.Value);

    umDM.SQL_cidade.Active := False;
    umDM.SQL_cidade.SQL.Text := 'select * from cidades';
      if not umDM.SQL_cidade.Active then
        umDM.SQL_cidade.Open;
end;

constructor DaoFuncionario.CrieObjeto;
begin
   inherited;
end;

destructor DaoFuncionario.destrua_se;
begin
 inherited;
end;

function DaoFuncionario.ExcluiFuncionario(
  pFuncionario: Funcionario): string;
begin
   if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

      if not umDM.SQL_funcionario.Active then
        begin
          umDM.SQL_funcionario.Open;
        end;

      umDM.SQL_funcionario.Edit;
      umDM.intgrfldSQL_funcionariofunc_id.Value := pFuncionario.getCodigo;
       Try
          umDM.SQL_funcionario.Delete;
          Result := 'OK';
       except
          Result := 'NO';
       end;
end;

function DaoFuncionario.getDSFuncionario: TMyDataSource;
begin
   Result := umDM.ds_funcionarios;
end;

function DaoFuncionario.SalvarFuncionario(
  pFuncionario: Funcionario): string;
begin
     if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

     if not umDM.SQL_funcionario.Active then
        begin
          umDM.SQL_funcionario.Open;
        end;

      if pFuncionario.getCodigo = 0 then
        umDM.SQL_funcionario.Insert
      else
         umDM.SQL_funcionario.Edit;

    umDM.strngfldSQL_funcionariofunc_nome.Value := pFuncionario.getNome;
    umDM.strngfldSQL_funcionariofunc_cpf.Value := pFuncionario.getCPF;

    umDM.strngfldSQL_funcionariofunc_sexo.Value := pFuncionario.getSexo;
    umDM.strngfldSQL_funcionariofunc_telfixo.Value := pFuncionario.getTelFixo;
    umDM.strngfldSQL_funcionariofunc_celular.Value := pFuncionario.getCelular;
    umDM.strngfldSQL_funcionariofunc_logradouro.Value  := pFuncionario.getLogradouro;
    umDM.strngfldSQL_funcionariofunc_numero.Value := pFuncionario.getNumero;
    umDM.strngfldSQL_funcionariofunc_bairro.Value := pFuncionario.getBairro;
    umDM.intgrfldSQL_funcionariofunc_cidade.Value := pFuncionario.getUmaCidade.getCodigo;
    umDM.dateSQL_funcionariofunc_dataI.Value := pFuncionario.getDataI;
    umDM.strngfldSQL_funcionariofunc_cargo.Value := pFuncionario.getCargo;
    umDM.floatSQL_funcionariofunc_salario.Value := pFuncionario.getSalario;

    umDM.SQL_funcionario.Post;
    Result := 'OK';
end;

function DaoFuncionario.sqlDependencia(pSQL: string): Integer;
begin
  umDM.SQL_usuario.Active := False;
  umDM.SQL_usuario.SQL.Text := pSQL;
    if not umDM.SQL_usuario.Active then
      umDM.SQL_usuario.Open;

  if umDM.SQL_usuario.RecordCount = 0 then
    result :=  0
  else
    result := 1;
end;

function DaoFuncionario.sqlFuncionario(pSQL: string): Integer;
begin
   umDM.SQL_funcionario.Active := False;
   umDM.SQL_funcionario.SQL.Text := pSQL;
    if not umDM.SQL_funcionario.Active then
      umDM.SQL_funcionario.Open;

  if umDM.SQL_funcionario.RecordCount = 0 then
    result :=  0
  else
    result := 1;
end;

end.
