unit uDaoParcela;

interface
  uses Windows, Messages, SysUtils, DB, uDm, uDao, uParcela, DBAccess, MyAccess, MemDS;

  type DaoParcela = class(Dao)

  private
  protected
  public
    constructor CrieObjeto;
    destructor destrua_se;

// ------------- M�TODOS DE PARCELAS ------------------
    function getDSParcela : TMyDataSource;
    procedure carregaParcela(pParcela : Parcela);
    function SalvarParcela(pParcela : Parcela) : string;
    function ExcluiParcela(pParcela : Parcela) : string;
    function sqlParcela(pSQL: string) : Integer;
end;

implementation

{ DaoParcela }

procedure DaoParcela.carregaParcela(pParcela: Parcela);
var nome: string;
begin
  if not umDM.SQL_parcela.Active then
    begin
      umDM.SQL_parcela.Open;
    end;
  {  pParcela.setCode(umDM.strngfldSQL_parcelaparc_codigo.Value); }
    pParcela.setCondicao(umDM.intgrfldSQL_parcelaparc_condicao.Value);
    pParcela.setNumero(umDM.intgrfldSQL_parcelaparc_numero.Value);
    pParcela.setDias(umDM.intgrfldSQL_parcelaparc_dias.Value);
    pParcela.setPercentual(umDM.floatSQL_parcelaparc_percentual.Value);
    pParcela.getForma.setCodigo(umDM.intgrfldSQL_parcelaparc_forma.Value);

    nome := IntToStr(umDM.intgrfldSQL_parcelaparc_forma.Value);

    umDM.SQL_forma.Active := False;
    umDM.SQL_forma.SQL.Text := 'select * from formas where forma_id = ' + nome;
    if not umDM.SQL_forma.Active then
      umDM.SQL_forma.Open;
    pParcela.getForma.setNome(umDM.strngfldSQL_formaforma_nome.Value);

    umDM.SQL_forma.Active := False;
    umDM.SQL_forma.SQL.Text := 'select * from formas';
    if not umDM.SQL_forma.Active then
      umDM.SQL_forma.Open;
end;

constructor DaoParcela.CrieObjeto;
begin
   inherited;
end;

destructor DaoParcela.destrua_se;
begin
   inherited;
end;

function DaoParcela.ExcluiParcela(pParcela: Parcela): string;
var inteiro1, inteiro2: string;
begin
  if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

      if not umDM.SQL_parcela.Active then
        begin
          umDM.SQL_parcela.Open;
        end;

        inteiro1 := IntToStr(pParcela.getCondicao);
        inteiro2 := IntToStr(pParcela.getNumero);
   {   inteiro := pParcela.getCode;  }

   umDM.SQL_parcela.Active := False;
   umDM.SQL_parcela.SQL.Text := 'select * from parcelas where parc_condicao like ' + inteiro1 + ' and parc_numero like ' + inteiro2;
      if not umDM.SQL_parcela.Active then
            umDM.SQL_parcela.Open;

{      umDM.SQL_parcela.Active := False;
      umDM.SQL_parcela.SQL.Text := 'select * from parcelas where parc_codigo like ' + inteiro;
        if not umDM.SQL_parcela.Active then
            umDM.SQL_parcela.Open;  }

      umDM.SQL_parcela.Edit;
//      umDM.strngfldSQL_parcelaparc_codigo.Value := pParcela.getCode;

        try
            umDM.SQL_parcela.Delete;
            Result := 'OK';
        except
            Result := 'NO';
        end;

      umDM.SQL_parcela.Active := False;
      umDM.SQL_parcela.SQL.Text := 'select * from parcelas';
        if not umDM.SQL_parcela.Active then
            umDM.SQL_parcela.Open;
end;

function DaoParcela.getDSParcela: TMyDataSource;
begin
   Result := umDM.ds_parcelas;
end;

function DaoParcela.SalvarParcela(pParcela: Parcela): string;
begin
  if not umDM.con_banco.Connected then
    begin
      umDM.con_banco.Connected := True;
    end;

      if not umDM.SQL_parcela.Active then
        begin
          umDM.SQL_parcela.Open;
        end;

      if pParcela.getCodigo = 0 then
        umDM.SQL_parcela.Insert
      else
         umDM.SQL_parcela.Edit;
  {  umDM.strngfldSQL_parcelaparc_codigo.Value := pParcela.getCode;  }
    umDM.intgrfldSQL_parcelaparc_condicao.Value  := pParcela.getCondicao;
    umDM.intgrfldSQL_parcelaparc_numero.Value   := pParcela.getNumero;
    umDM.intgrfldSQL_parcelaparc_dias.Value     := pParcela.getDias;
    umDM.floatSQL_parcelaparc_percentual.Value  := pParcela.getPercentual;
    umDM.intgrfldSQL_parcelaparc_forma.Value    := pParcela.getForma.getCodigo;
    
      umDM.SQL_parcela.Post;
      Result := 'OK';
end;

function DaoParcela.sqlParcela(pSQL: string): Integer;
begin
  umDM.SQL_parcela.Active := False;
  umDM.SQL_parcela.SQL.Text := pSQL;
    if not umDM.SQL_parcela.Active then
      umDM.SQL_parcela.Open;

  if umDM.SQL_parcela.RecordCount = 0 then
    result :=  0
  else
    result := umDM.SQL_parcela.RecordCount;
end;

end.
