unit uDaoTransportadora;

interface
  uses Windows, Messages, SysUtils, DB, uDm,uDao, uTransportadora, DBAccess, MyAccess, MemDS;

  type DaoTransportadora = class(Dao)

  private
  protected
  public
    constructor CrieObjeto;
    destructor destrua_se;

// ------------- M�TODOS DE FORNECEDOR ----------------
    function getDSTransportadora :  TMyDataSource;
    procedure carregaTransportadora (pTransportadora : Transportadora);
    function SalvarTransportadora (pTransportadora : Transportadora) : string;
    function ExcluiTransportadora(pTransportadora : Transportadora) : string;
    function sqlTransportadora(pSQL: string) : Integer;
    function sqlDependencia(pSQL: string) : Integer;      

end;

implementation

{ DaoTransportadora }

procedure DaoTransportadora.carregaTransportadora(
  pTransportadora: Transportadora);
var inteiro : string;
begin
    if not umDM.SQL_transportadora.Active then
        umDM.SQL_transportadora.Open;

    pTransportadora.setCodigo(umDM.SQL_transportadoratransp_id.Value);
    pTransportadora.setAntt(umdm.SQL_transportadoratransp_antt.Value);
    pTransportadora.setCNPJ(umdm.SQL_transportadoratransp_cnpj.Value);
    pTransportadora.setEndereco(umDM.SQL_transportadoratransp_endereco.value);
    pTransportadora.setInscEst(umDM.SQL_transportadoratransp_insc.Value);
    pTransportadora.setNome(umDM.SQL_transportadoratransp_nome.Value);
    pTransportadora.setPlaca(umdm.SQL_transportadoratransp_placa.Value);
    pTransportadora.setUFveiculo(umdm.SQL_transportadoratransp_ufVeiculo.value);
    pTransportadora.setUF(umdm.SQL_transportadoratransp_uf.value);
    pTransportadora.setFone(umdm.SQL_transportadoratransp_fone.value);
    pTransportadora.getUmaCidade.setCodigo(umdm.SQL_transportadoratransp_cidade.value);

    inteiro := inttostr(umdm.SQL_transportadoratransp_cidade.value);


    umDM.SQL_cidade.Active := False;
    umDM.SQL_cidade.SQL.Text := 'select * from cidades where cid_id = ' + inteiro ;
      if not umDM.SQL_cidade.Active then
        umDM.SQL_cidade.Open;

    pTransportadora.getUmaCidade.setCidade(umdm.strngfldSQL_cidadecid_nome.value);

    umDM.SQL_cidade.Active := False;
    umDM.SQL_cidade.SQL.Text := 'select * from cidades';
      if not umDM.SQL_cidade.Active then
        umDM.SQL_cidade.Open;
end;

constructor DaoTransportadora.CrieObjeto;
begin
   inherited;
end;

destructor DaoTransportadora.destrua_se;
begin
   inherited;
end;

function DaoTransportadora.ExcluiTransportadora(
  pTransportadora: Transportadora): string;
begin
   if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

      if not umDM.SQL_transportadora.Active then
        begin
          umDM.SQL_transportadora.Open;
        end;

      umDM.SQL_transportadora.Edit;
      umdm.SQL_transportadoratransp_id.Value := pTransportadora.getCodigo;

       Try
          umDM.SQL_transportadora.Delete;
          Result := 'OK';
       except
          Result := 'NO';
       end;
end;

function DaoTransportadora.getDSTransportadora: TMyDataSource;
begin
  result := umdm.ds_transportadoras;
end;

function DaoTransportadora.SalvarTransportadora(
  pTransportadora: Transportadora): string;
begin
     if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

     if not umDM.SQL_transportadora.Active then
        begin
          umDM.SQL_transportadora.Open;
        end;

      if pTransportadora.getCodigo = 0 then
        umDM.SQL_transportadora.Insert
      else
         umDM.SQL_transportadora.Edit;

    umdm.SQL_transportadoratransp_antt.Value := pTransportadora.getAntt;
    umdm.SQL_transportadoratransp_cnpj.Value := pTransportadora.getCNPJ;
    umDM.SQL_transportadoratransp_endereco.value := pTransportadora.getEndereco;
    umDM.SQL_transportadoratransp_insc.Value := pTransportadora.getInscEst;
    umDM.SQL_transportadoratransp_nome.Value := pTransportadora.getNome;
    umdm.SQL_transportadoratransp_placa.Value  := pTransportadora.getPlaca;
    umdm.SQL_transportadoratransp_ufVeiculo.value := pTransportadora.getUFveiculo;
    umdm.SQL_transportadoratransp_uf.value := pTransportadora.getUF;
    umdm.SQL_transportadoratransp_fone.value := pTransportadora.getFone;
    umdm.SQL_transportadoratransp_cidade.value := pTransportadora.getumaCidade.getCodigo;

    umDM.SQL_transportadora.Post;
    Result := 'OK';
end;

function DaoTransportadora.sqlDependencia(pSQL: string): Integer;
begin
   {ap�s implementar a compra}
end;

function DaoTransportadora.sqlTransportadora(pSQL: string): Integer;
begin
   umDM.SQL_transportadora.Active := False;
   umDM.SQL_transportadora.SQL.Text := pSQL;
    if not umDM.SQL_transportadora.Active then
      umDM.SQL_transportadora.Open;

  if umDM.SQL_transportadora.RecordCount = 0 then
    result :=  0
  else
    result := 1;
end;
end.
