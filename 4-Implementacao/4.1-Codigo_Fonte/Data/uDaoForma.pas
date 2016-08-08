unit uDaoForma;

interface
  uses Windows, Messages, SysUtils, DB, uDm, uDao, uForma, DBAccess, MyAccess, MemDS;
  
  type DaoForma = class(Dao)

  private
  protected
  public
    constructor CrieObjeto;
    destructor destrua_se;

// ------------- M�TODOS DE FORMA DE PGTO ------------------
    function getDSForma : TMyDataSource;
    procedure carregaForma(pForma : Forma);
    function SalvarForma(pForma : Forma) : string;
    function ExcluiForma(pForma : Forma) : string;
    function sqlForma(pSQL: string) : Integer;
    function sqlDependencia(pSQL: string; tipo: Integer) : Integer;    
end;

implementation

{ DaoForma }

procedure DaoForma.carregaForma(pForma: Forma);
begin
  if not umDM.SQL_forma.Active then
    begin
      umDM.SQL_forma.Open;
    end;
  pForma.setCodigo(umDM.intgrfldSQL_formaforma_id.Value);
  pForma.setNome(umDM.strngfldSQL_formaforma_nome.Value);
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
        try
            umDM.SQL_forma.Delete;
            Result := 'OK';
        except
            Result := 'NO';
        end;
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
         umDM.SQL_forma.Edit;

      umDM.strngfldSQL_formaforma_nome.Value := pForma.getNome;
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

end.