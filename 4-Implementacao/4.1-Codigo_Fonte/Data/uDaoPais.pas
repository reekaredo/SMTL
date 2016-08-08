unit uDaoPais;

interface
  uses Windows, Messages, SysUtils, DB, uDm, uDao, uPais, DBAccess, MyAccess, MemDS;
  
  type DaoPais = class(Dao)

  private
  protected
  public
    constructor CrieObjeto;
    destructor destrua_se;

// ------------- MÉTODOS DE PAÍS ------------------
    function getDSPais : TMyDataSource;
    procedure carregaPais(pPais : pais);
    function SalvarPais(pPais : Pais) : string;
    function ExcluiPais(pPais : pais) : string;
    function sqlPais(pSQL: string) : Integer;
    function sqlDependencia(pSQL: string) : Integer;
end;

implementation

{ DaoPais }

constructor DaoPais.CrieObjeto;
begin
   inherited;
end;

destructor DaoPais.destrua_se;
begin
   inherited;
end;
// ------------- MÉTODOS DE PAÍS ------------------
procedure DaoPais.carregaPais(pPais: pais);
begin
  if not umDM.SQL_pais.Active then
    begin
      umDM.SQL_pais.Open;
    end;
  pPais.setCodigo(umDM.intgrfldSQL_paispais_id.Value);
  pPais.setPais(umDM.strngfldSQL_paispais_nome.Value);
  pPais.setSigla(umDM.strngfldSQL_paispais_sigla.Value);
  pPais.setDDI(umDM.strngfldSQL_paispais_ddi.Value);
end;

function DaoPais.getDSPais: TMyDataSource;
begin
  result := umDM.ds_paises;
end;

function DaoPais.sqlPais(pSQL: string) : Integer;
begin
  umDM.SQL_pais.Active := False;
  umDM.SQL_pais.SQL.Text := pSQL;
    if not umDM.SQL_pais.Active then
      umDM.SQL_pais.Open;

  if umDM.SQL_pais.RecordCount = 0 then
    result :=  0
  else
    result := 1;
end;

function DaoPais.SalvarPais(pPais: Pais) : string;
begin
  if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

      if not umDM.SQL_pais.Active then
        begin
          umDM.SQL_pais.Open;
        end;

      if pPais.getCodigo = 0 then
        umDM.SQL_pais.Insert
      else
         umDM.SQL_pais.Edit;

      umDM.strngfldSQL_paispais_nome.Value := pPais.getPais;
      umDM.strngfldSQL_paispais_ddi.Value := pPais.getDDI;
      umDM.strngfldSQL_paispais_sigla.Value := pPais.getSigla;
      umDM.SQL_pais.Post;

      Result := 'OK';
end;

function DaoPais.ExcluiPais(pPais: pais): string;
begin
  if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

      if not umDM.SQL_pais.Active then
        begin
          umDM.SQL_pais.Open;
        end;

      umDM.SQL_pais.Edit;
      umDM.intgrfldSQL_paispais_id.Value := pPais.getCodigo;
        try
            umDM.SQL_pais.Delete;
            Result := 'OK';
        except
            Result := 'NO';
        end;
end;

function DaoPais.sqlDependencia(pSQL: string): Integer;
begin
  umDM.SQL_estado.Active := False;
  umDM.SQL_estado.SQL.Text := pSQL;
    if not umDM.SQL_estado.Active then
      umDM.SQL_estado.Open;

  if umDM.SQL_estado.RecordCount = 0 then
    result :=  0
  else
    result := 1;
end;

end.
