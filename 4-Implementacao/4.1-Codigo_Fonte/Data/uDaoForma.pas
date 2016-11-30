unit uDaoForma;

interface
  uses Windows, Messages, SysUtils, DB, uDm, uDao, uForma, DBAccess, MyAccess, MemDS;
  
  type DaoForma = class(Dao)

  private
  protected
  public
    constructor CrieObjeto;
    destructor destrua_se;

// ------------- MÉTODOS DE FORMA DE PGTO ------------------
    function getDSForma : TMyDataSource;
    procedure carregaForma(pForma : Forma);
    function SalvarForma(pForma : Forma) : string;
    function ExcluiForma(pForma : Forma) : string;
    function sqlForma(pSQL: string) : Integer;
    procedure alteraSaldo(cod: integer; valor: real; tipo: integer);
    function sqlDependencia(pSQL: string; tipo: Integer) : Integer;
    function sqlSalvar(pSQL: string; tipo: Integer) : Integer; 
end;

implementation

{ DaoForma }

procedure DaoForma.alteraSaldo(cod: integer; valor: real; tipo: integer);
var valor1: real;
begin
  if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

    umDM.SQL_forma.Active := false;
    umDM.SQL_forma.SQL.Text := 'select * from forma where forma_id = ' + inttostr(cod);
    umDM.SQL_forma.Active := true;
    umDM.SQL_forma.Edit;

    valor1 := umdm.SQL_formaforma_saldo.Value;

    if tipo = 0 then
         umdm.SQL_formaforma_saldo.Value := valor1 + valor
    else
         umdm.SQL_formaforma_saldo.Value := valor1 - valor;

    umDM.SQL_forma.post;
end;

procedure DaoForma.carregaForma(pForma: Forma);
begin
  if not umDM.SQL_forma.Active then
    begin
      umDM.SQL_forma.Open;
    end;
  pForma.setCodigo(umDM.intgrfldSQL_formaforma_id.Value);
  pForma.setNome(umDM.strngfldSQL_formaforma_nome.Value);
  pForma.setSaldo(umdm.SQL_formaforma_saldo.Value);
end;

constructor DaoForma.CrieObjeto;
begin
   inherited;
end;

destructor DaoForma.destrua_se;
begin
  inherited;
end;

function DaoForma.ExcluiForma(pForma: Forma): string;
begin
  if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

      if not umDM.SQL_forma.Active then
        begin
          umDM.SQL_forma.Open;
        end;

      umDM.SQL_forma.Edit;
      umDM.intgrfldSQL_formaforma_id.Value := pForma.getCodigo;

      if pForma.getCodigo <> 2 then
       begin
        try
            umDM.SQL_forma.Delete;
            Result := 'OK';
        except
            Result := 'NO';
        end;
       end
      else
       result := 'CAIXA';
end;

function DaoForma.getDSForma: TMyDataSource;
begin
    result := umDM.ds_forma;
end;

function DaoForma.SalvarForma(pForma: Forma): string;
begin
  if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

      if not umDM.SQL_forma.Active then
        begin
          umDM.SQL_forma.Open;
        end;

      if pForma.getCodigo = 0 then
        umDM.SQL_forma.Insert
      else
        begin
         umDM.SQL_forma.Active := false;
         umDM.SQL_forma.SQL.Text := 'select * from forma where forma_id = ' + inttostr(pForma.getCodigo);
         umDM.SQL_forma.Active := true;
         umDM.SQL_forma.Edit;
        end;

      umDM.strngfldSQL_formaforma_nome.Value := pForma.getNome;
      umdm.SQL_formaforma_saldo.Value := pforma.getSaldo;
      umDM.SQL_forma.Post;

      Result := 'OK';
end;

function DaoForma.sqlDependencia(pSQL: string; tipo: Integer): Integer;
begin
    //buscar nas parcelas
    if tipo = 1 then
       begin
          umDM.SQL_parcela.Active := False;
          umDM.SQL_parcela.SQL.Text := pSQL;
            if not umDM.SQL_parcela.Active then
              umDM.SQL_parcela.Open;

          if umDM.SQL_parcela.RecordCount = 0 then
            result :=  0
          else
            result := 1;
       end;

end;

function DaoForma.sqlForma(pSQL: string): Integer;
begin
  umDM.SQL_forma.Active := False;
  umDM.SQL_forma.SQL.Text := pSQL;
    if not umDM.SQL_forma.Active then
      umDM.SQL_forma.Open;

  if umDM.SQL_forma.RecordCount = 0 then
    result :=  0
  else
    result := 1;
end;

function DaoForma.sqlSalvar(pSQL: string; tipo: Integer): Integer;
begin
    //buscar nas formas se há o nome cadastrado
       begin
          umDM.SQL_forma.Active := False;
          umDM.SQL_forma.SQL.Text := pSQL;
            if not umDM.SQL_forma.Active then
              umDM.SQL_forma.Open;

          if umDM.SQL_forma.RecordCount = 0 then
            result :=  0
          else
            result := 1;

          umdm.SQL_forma.Active := false;
          umDM.SQL_forma.SQL.Text := 'select * from forma';
            if not umDM.SQL_forma.Active then
              umDM.SQL_forma.Open;
       end;
end;

end.
