unit uColecaoParcelas;

interface
uses uParcela;
  type ColecaoParcela = class

    protected
    colecao : array[1..12] of Parcela;
    qtd   : integer;

    public
    constructor CrieObjeto;
    destructor destrua_se;
    function cheia : boolean;
    function vazia : boolean;
    function getQtd : integer;
    function getObj(pPos : integer) : Parcela;
    procedure setQtd (pQtd : integer);
    procedure setObj (pParcela : Parcela; pPos : integer);
    procedure inserefim( pParcela : Parcela);
    procedure insere( pParcela : Parcela; pPos : integer);
    procedure remove( pParcela : Parcela; pPos : integer);
    function pesquisa (chave : string; quero : boolean) : integer;
  end;

implementation

uses SysUtils;

{ ColecaoParcela }

function ColecaoParcela.cheia: boolean;
begin
     if qtd = 12 then
        Result := True
     else
        Result := False;
end;

constructor ColecaoParcela.CrieObjeto;
begin
   self.qtd := 0;
end;

destructor ColecaoParcela.destrua_se;
begin

end;

function ColecaoParcela.getObj(pPos: integer): Parcela;
begin
    Result := colecao[pPos];
end;

function ColecaoParcela.getQtd: integer;
begin
   Result := qtd;
end;

procedure ColecaoParcela.insere(pParcela: Parcela; pPos: integer);
  var k : integer;
    begin
    if pPos = qtd + 1 then
      inserefim (pParcela)
    else
      begin
        qtd := qtd+1;
        for k:= qtd downto pPos do
          colecao[k] := colecao[k-1];
        colecao[pPos] := pParcela;
      end;
    end;

procedure ColecaoParcela.inserefim(pParcela: Parcela);
begin
      qtd := qtd+1;
      colecao[qtd] := pParcela;
end;

function ColecaoParcela.pesquisa(chave: string; quero: boolean): integer;
var k : integer;
    aParcela : Parcela;
begin
    if self.qtd > 0 then
    begin
      k := 1;
      while (k <= qtd) and (chave > (InttoStr(Parcela(colecao[k]).getNumero))) do
      k := k+1;
      aParcela := Parcela(colecao[k]);
      if quero then
        begin
          if chave = IntToStr(aParcela.getNumero) then
            Result := k
          else
            Result := 0
        end
      else
        begin
          if chave = IntToStr(aParcela.getNumero) then
            Result := 0
          else
            Result := k
        end;
    end
    else
    begin
      result := 1;
    end;
end;

procedure ColecaoParcela.remove(pParcela: Parcela; pPos: integer);
  var k : integer;
    begin
      pParcela := colecao[pPos];
      for k:= pPos to qtd-1 do
        colecao[k] := colecao[k-1];
      qtd := qtd-1;
    end;

procedure ColecaoParcela.setObj(pParcela: Parcela; pPos: integer);
begin
   colecao[pPos] := pParcela;
end;

procedure ColecaoParcela.setQtd(pQtd: integer);
begin
  self.qtd := pQtd;
end;

function ColecaoParcela.vazia: boolean;
begin
      if qtd = 0 then
        result := true
      else
        result := false;
end;

end.
