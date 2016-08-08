unit uDao;
// implementa a Data Acess Object que conecta a aplicação ao Database
interface
  uses Windows, Messages, SysUtils, DB, uDm, uPais, DBAccess, MyAccess, MemDS;
  
  type Dao = class
  private          
  protected
    umDM : TDataModule1;
  public
    constructor CrieObjeto;
    destructor destrua_se;
end;

implementation

{ DAO }

// ------------- CONSTRUCTOR E DESTRUCTOR ------------
constructor Dao.CrieObjeto;
begin
  umDm := TDataModule1.Create(nil);
end;

destructor Dao.destrua_se;
begin
  umDM.Free;
end; 
end.


