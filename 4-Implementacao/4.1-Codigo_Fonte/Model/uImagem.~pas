unit uImagem;

interface
uses uPai;

  type Imagem = class(Pai)

  private

  protected
     caminho: string;
     produto: Integer;

  public
    constructor crieobj;
    destructor destrua_se;

    procedure setCaminho(pCaminho: string);
    function getCaminho: string;

    procedure setProduto(pProduto: Integer);
    function getProduto: Integer;


                             
end;
implementation

{ Imagem }

constructor Imagem.crieobj;
begin
    inherited;
end;

destructor Imagem.destrua_se;
begin
   inherited;
end;

function Imagem.getCaminho: string;
begin
   Result := self.caminho;
end;

function Imagem.getProduto: Integer;
begin
   Result := self.produto;
end;

procedure Imagem.setCaminho(pCaminho: string);
begin
  self.caminho := pCaminho;
end;

procedure Imagem.setProduto(pProduto: Integer);
begin
  self.produto := pProduto;
end;

end.
