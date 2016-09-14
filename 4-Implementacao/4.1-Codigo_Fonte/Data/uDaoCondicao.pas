unit uDaoCondicao;

interface
  uses Windows, Messages, SysUtils, DB, uDm, uDao, uCondicao, DBAccess, MyAccess, MemDS, uParcela;

  type DaoCondicao = class(Dao)

  private
    pParcela: Parcela;
  protected
  public
    constructor CrieObjeto;
    destructor destrua_se;

// ------------- MÉTODOS DE CONDIÇÕES DE PGTO ------------------
    function getDSCondicao : TMyDataSource;
    procedure carregaCondicao(pCondicao : Condicao);
    function SalvarCondicao(pCondicao : Condicao) : string;
    function ExcluiCondicao(pCondicao : Condicao) : string;
    function sqlCondicao(pSQL: string) : Integer;
    function sqlDependencia(pSQL: string; tipo: Integer) : Integer;
end;

implementation

{ DaoCondicao }

procedure DaoCondicao.carregaCondicao(pCondicao: Condicao);
var inteiro, nome: string;
k, tam: Integer;
begin
  if not umDM.SQL_condicoes.Active then
    begin
      umDM.SQL_condicoes.Open;
    end;
    
    pCondicao.setCodigo(umDM.intgrfldSQL_condicoescond_id.Value);
    pCondicao.setNome(umDM.strngfldSQL_condicoescond_nome.Value);

  inteiro:= IntToStr(umDM.intgrfldSQL_condicoescond_id.Value);

  umDM.SQL_parcela.Active := False;
  umDM.SQL_parcela.SQL.Text := 'select * from parcelas where parc_condicao like ' + inteiro;
    if not umDM.SQL_parcela.Active then
      umDM.SQL_parcela.Open;

  tam := umDM.SQL_parcela.RecordCount;
  For k:= 1 to tam  do
      begin
          pParcela := Parcela.crieobj;
         { pParcela.setCode(umDM.strngfldSQL_parcelaparc_codigo.Value);  }
          pParcela.setCondicao(umDM.intgrfldSQL_parcelaparc_condicao.Value);
          pParcela.setNumero(umDM.intgrfldSQL_parcelaparc_numero.Value);
          pParcela.setDias(umDM.intgrfldSQL_parcelaparc_dias.Value);
          pParcela.setPercentual(umDM.floatSQL_parcelaparc_percentual.Value);
          pParcela.getForma.setCodigo(umDM.intgrfldSQL_parcelaparc_forma.Value);

              nome := IntToStr(umDM.intgrfldSQL_parcelaparc_forma.Value);

              umDM.SQL_forma.Active := False;
              umDM.SQL_forma.SQL.Text := 'select * from forma where forma_id = ' + nome;
              if not umDM.SQL_forma.Active then
                umDM.SQL_forma.Open;
              pParcela.getForma.setNome(umDM.strngfldSQL_formaforma_nome.Value);

              umDM.SQL_forma.Active := False;
              umDM.SQL_forma.SQL.Text := 'select * from forma';
              if not umDM.SQL_forma.Active then
                umDM.SQL_forma.Open;

          pCondicao.getListaParcelas.inserefim(pParcela);
          umDM.SQL_parcela.Next; 
      end;    
end;

constructor DaoCondicao.CrieObjeto;
begin
    pParcela := Parcela.crieobj;
    inherited;
end;

destructor DaoCondicao.destrua_se;
begin
    pParcela.destrua_se;
   inherited;
end;

function DaoCondicao.ExcluiCondicao(pCondicao: Condicao): string;
begin
  if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

      if not umDM.SQL_condicoes.Active then
        begin
          umDM.SQL_condicoes.Open;
        end;

      umDM.SQL_condicoes.Edit;
      umDM.intgrfldSQL_condicoescond_id.Value := pCondicao.getCodigo;

        try
            umDM.SQL_condicoes.Delete;
            Result := 'OK';
        except
            Result := 'NO';
        end;
end;

function DaoCondicao.getDSCondicao: TMyDataSource;
begin
   Result := umDM.ds_condicoes;
end;

function DaoCondicao.SalvarCondicao(pCondicao: Condicao): string;
begin
  if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

      if not umDM.SQL_condicoes.Active then
        begin
          umDM.SQL_condicoes.Open;
        end;

      if pCondicao.getCodigo = 0 then
        umDM.SQL_condicoes.Insert
      else
         umDM.SQL_condicoes.Edit;

      umDM.strngfldSQL_condicoescond_nome.Value := pCondicao.getNome;
      umDM.SQL_condicoes.Post;
      Result := 'OK';
end;

function DaoCondicao.sqlCondicao(pSQL: string): Integer;
begin
  umDM.SQL_condicoes.Active := False;
  umDM.SQL_condicoes.SQL.Text := pSQL;
    if not umDM.SQL_condicoes.Active then
      umDM.SQL_condicoes.Open;

  if umDM.SQL_condicoes.RecordCount = 0 then
    result :=  0
  else
    result := 1;
end;

function DaoCondicao.sqlDependencia(pSQL: string; tipo: Integer): Integer;
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

end;

end.
