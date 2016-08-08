unit uDaoCidade;

interface
  uses Windows, Messages, SysUtils, DB, uDm,uDao, uCidade, DBAccess, MyAccess, MemDS;

  type DaoCidade = class(Dao)

  private 
  protected
  public
    constructor CrieObjeto;
    destructor destrua_se;

// ------------- MÉTODOS DE CIDADE ------------------
    function getDSCidade :  TMyDataSource;
    procedure carregaCidade (pCidade : Cidade);
    function SalvarCidade (pCidade : Cidade) : string;
    function ExcluiCidade(pCidade : Cidade) : string;
    function sqlCidade(pSQL: string) : Integer;
    function sqlDependencia(pSQL: string; tipo: Integer) : Integer;
end;

implementation

{ DaoCidade }


constructor DaoCidade.CrieObjeto;
begin
  inherited;
end;

destructor DaoCidade.destrua_se;
begin
  inherited;
end;

// ------------- MÉTODOS DE CIDADE ------------------
procedure DaoCidade.carregaCidade(pCidade: Cidade);
var inteiro : string;
begin
    if not umDM.SQL_cidade.Active then
        umDM.SQL_cidade.Open;

    pCidade.setCodigo(umDM.intgrfldSQL_cidadecid_id.Value);
    pCidade.setCidade(umDM.strngfldSQL_cidadecid_nome.Value);
    pCidade.setDDD(umDM.strngfldSQL_cidadecid_ddd.Value);
    pCidade.getUmEstado.setCodigo(umDM.intgrfldSQL_cidadecid_estado.Value);

    inteiro :=  InttoStr(umDM.intgrfldSQL_cidadecid_estado.Value);

    umDM.SQL_estado.Active := False;
    umDM.SQL_estado.SQL.Text := 'select * from estados where est_id = ' + inteiro ;
    if not umDM.SQL_estado.Active then
      umDM.SQL_estado.Open;

    pCidade.getUmEstado.setNomeEstado(umDM.strngfldSQL_estadoest_nome.Value);

    umDM.SQL_estado.Active := False;
    umDM.SQL_estado.SQL.Text := 'select * from estados';
    if not umDM.SQL_estado.Active then
      umDM.SQL_estado.Open;
end;

function DaoCidade.SalvarCidade(pCidade: Cidade): string;
begin
  if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

    if not umDM.SQL_cidade.Active then
        begin
          umDM.SQL_cidade.Open;
        end;

    if pCidade.getCodigo = 0 then
        umDM.SQL_cidade.Insert
      else
         umDM.SQL_cidade.Edit;

      umDM.strngfldSQL_cidadecid_nome.Value := pCidade.getCidade;
      umDM.strngfldSQL_cidadecid_ddd.Value := pCidade.getDDD;
      umDM.intgrfldSQL_cidadecid_estado.Value := pCidade.getumEstado.getCodigo;
      umDM.SQL_cidade.Post;

      Result := 'OK';
end;

function DaoCidade.sqlCidade(pSQL: string): Integer;
begin
   umDM.SQL_cidade.Active := False;
   umDM.SQL_cidade.SQL.Text := pSQL;
    if not umDM.SQL_cidade.Active then
      umDM.SQL_cidade.Open;

  if umDM.SQL_cidade.RecordCount = 0 then
    result :=  0
  else
    result := 1;
end;

function DaoCidade.getDSCidade: TMyDataSource;
begin
  Result := umDM.ds_cidades;
end;

function DaoCidade.ExcluiCidade(pCidade: Cidade): string;
begin
   if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

      if not umDM.SQL_cidade.Active then
        begin
          umDM.SQL_cidade.Open;
        end;

      umDM.SQL_cidade.Edit;
      umDM.intgrfldSQL_cidadecid_id.Value := pCidade.getCodigo;
         Try
            umDM.SQL_cidade.Delete;
            Result := 'OK';
         except
            Result := 'NO';
         end;
end;

function DaoCidade.sqlDependencia(pSQL: string; tipo: Integer): Integer;
begin
    //buscar nos clientes
    if tipo = 1 then
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

    //buscar nos fornecedores
    if tipo = 2 then
        begin
          umDM.SQL_fornecedor.Active := False;
          umDM.SQL_fornecedor.SQL.Text := pSQL;
            if not umDM.SQL_fornecedor.Active then
              umDM.SQL_fornecedor.Open;

          if umDM.SQL_fornecedor.RecordCount = 0 then
            result :=  0
          else
            result := 1;
        end;

  if tipo = 3 then
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
end;

end.
