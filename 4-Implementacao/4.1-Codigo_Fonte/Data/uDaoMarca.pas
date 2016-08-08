unit uDaoMarca;

interface
  uses Windows, Messages, SysUtils, DB, uDm, uDao, uMarca, DBAccess, MyAccess, MemDS;

  type DaoMarca = class(Dao)

  private  
  protected
  public
    constructor CrieObjeto;
    destructor destrua_se;

// ------------- MÉTODOS DE MARCA ------------------
    function getDSMarca : TMyDataSource;
    procedure carregaMarca(pMarca : Marca);
    function SalvarMarca(pMarca : Marca) : string;
    function ExcluiMarca(pMarca : Marca) : string;
    function sqlMarca(pSQL: string) : Integer;
    function sqlDependencia(pSQL: string) : Integer;      
end;

implementation

{ DaoMarca }

constructor DaoMarca.CrieObjeto;
begin
   inherited;
end;

destructor DaoMarca.destrua_se;
begin
  inherited;
end;

// ----------------- MÉTODOS DE MARCA -------------------------
procedure DaoMarca.carregaMarca(pMarca: Marca);
begin
  if not umDM.SQL_marca.Active then
    begin
      umDM.SQL_marca.Open;
    end;
  pMarca.setCodigo(umDM.intgrfldSQL_marcamarca_id.Value);
  pMarca.setNome(umDM.strngfldSQL_marcamarca_nome.Value);
end;

function DaoMarca.ExcluiMarca(pMarca: Marca): string;
begin
  if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

      if not umDM.SQL_marca.Active then
        begin
          umDM.SQL_marca.Open;
        end;

      umDM.SQL_marca.Edit;
      umDM.intgrfldSQL_marcamarca_id.Value := pMarca.getCodigo;

        try
            umDM.SQL_marca.Delete;
            Result := 'OK';
        except
            Result := 'NO';
        end;
end;

function DaoMarca.getDSMarca: TMyDataSource;
begin
  Result := umDM.ds_marcas;
end;

function DaoMarca.SalvarMarca(pMarca: Marca): string;
begin
  if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

      if not umDM.SQL_marca.Active then
        begin
          umDM.SQL_marca.Open;
        end;

      if pMarca.getCodigo = 0 then
        umDM.SQL_marca.Insert
      else
         umDM.SQL_marca.Edit;

      umDM.strngfldSQL_marcamarca_nome.Value := pMarca.getNome;
      umDM.SQL_marca.Post;
      Result := 'OK';
end;

function DaoMarca.sqlMarca(pSQL: string): Integer;
begin
  umDM.SQL_marca.Active := False;
  umDM.SQL_marca.SQL.Text := pSQL;
    if not umDM.SQL_marca.Active then
      umDM.SQL_marca.Open;

  if umDM.SQL_marca.RecordCount = 0 then
    result :=  0
  else
    result := 1;
end;

function DaoMarca.sqlDependencia(pSQL: string): Integer;
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

end.
