unit uColecaoImagens;

interface
 uses uImagem;
  type ColecaoImagens = class

    protected
    colecao : array[1..5] of Imagem;
    qtd   : integer;

    public
    constructor CrieObjeto;
    destructor destrua_se;
    function cheia : boolean;
    function vazia : boolean;
    function getQtd : integer;
    function getObj(pPos : integer) : Imagem;
    procedure setQtd (pQtd : integer);
    procedure setObj (pImagem : Imagem; pPos : integer);
    procedure inserefim( pImagem : Imagem);
    procedure insere( pImagem : Imagem; pPos : integer);
    procedure remove( pImagem : Imagem; pPos : integer);
    procedure exclui(pPos: integer);
    procedure organizaLista;
    function pesquisa (chave : string; quero : boolean) : integer;
  end;
implementation

uses SysUtils;

{ ColecaoImagens }



{ ColecaoImagens }

function ColecaoImagens.cheia: boolean;
begin
     if qtd = 5 then
        Result := True
     else
        Result := False;
end;

constructor ColecaoImagens.CrieObjeto;
begin
   self.qtd := 0;
end;

destructor ColecaoImagens.destrua_se;
begin

end;

procedure ColecaoImagens.exclui(pPos: integer);
var k : integer;
begin
      for k:= pPos to qtd-1 do
        colecao[k] := colecao[k+1];

      colecao[qtd] := nil;
      qtd := qtd-1;
end;


function ColecaoImagens.getObj(pPos: integer): Imagem;
begin
    Result := colecao[pPos];
end;

function ColecaoImagens.getQtd: integer;
begin
   Result := qtd;
end;

procedure ColecaoImagens.insere(pImagem: Imagem; pPos: integer);
  var k : integer;
    begin
    if pPos = qtd + 1 then
      inserefim (pImagem)
    else
      begin
        qtd := qtd+1;
        for k:= qtd downto pPos do
          colecao[k] := colecao[k-1];
        colecao[pPos] := pImagem;
      end;
    end;

procedure ColecaoImagens.inserefim(pImagem: Imagem);
begin
      qtd := qtd+1;
      colecao[qtd] := pImagem;
end;

procedure ColecaoImagens.organizaLista;
var k, i: integer;
existeNil: boolean;
begin
      existeNil:= false;
      For k:= 1 to 5 do
        begin
           if colecao[k] = nil then
               existeNil:= true;
        end;

      if existeNil then
         begin
            for k:= 1 to 4 do
               begin
                  if colecao[k]=nil then
                     begin
                        for i:= k+1 to 5 do
                           begin
                               if colecao[i] <> nil then
                                  begin
                                    colecao[k] := colecao[i];
                                    colecao[i] := nil;
                                    break;
                                  end;
                           end;
                     end;
               end;
         end;
      
end;

function ColecaoImagens.pesquisa(chave: string; quero: boolean): integer;
var k : integer;
    aImagem: Imagem;
begin
    if self.qtd > 0 then
    begin
      k := 1;
      while (k <= qtd) and (chave > (IntToStr(Imagem(colecao[k]).getCodigo))) do
      k := k+1;
      aImagem := Imagem(colecao[k]);
      if quero then
        begin
          if chave = IntToStr(aImagem.getCodigo) then
            Result := k
          else
            Result := 0
        end
      else
        begin
          if chave = IntToStr(aImagem.getCodigo) then
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

procedure ColecaoImagens.remove(pImagem: Imagem; pPos: integer);
  var k : integer;
    begin
      pImagem := colecao[pPos];
      for k:= pPos to qtd-1 do
        colecao[k] := colecao[k-1];
      qtd := qtd-1;
    end;

procedure ColecaoImagens.setObj(pImagem: Imagem; pPos: integer);
begin
   colecao[pPos] := pImagem;
end;

procedure ColecaoImagens.setQtd(pQtd: integer);
begin
  self.qtd := pQtd;
end;

function ColecaoImagens.vazia: boolean;
begin
      if qtd = 0 then
        result := true
      else
        result := false;
end;

end.
 