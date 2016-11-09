unit uItemVenda;

interface

  type ItemVenda = class

  private

  protected
     codProduto: Integer;
     codVenda: Integer;
     numero: Integer;
     nome: string[50];
     valorUnitario: real;
     precoMinimo: real;
     ncm: string[10];
     cst: string[10];
     cfop: string[10];
     unidade: integer;
     qtde: integer;
     vTotal: real;
     baseICMS: real;
     valorICMS: real;
     valorIPI: real;
     aliqICMS: real;
     aliqIPI: real;

  public
    constructor crieobj;
    destructor destrua_se;

    procedure setNome(pNome: string);
    function getNome: string;

    procedure setNCM(pNCM: string);
    function getNCM: string;

    procedure setCST(pCST: string);
    function getCST: string;

    procedure setCFOP(pCFOP: string);
    function getCFOP: string;

    procedure setCodProduto(pCodProduto: integer);
    function getCodProduto: integer;

    procedure setCodVenda(pCodVenda: integer);
    function getCodVenda: integer;

    procedure setNumero(pNumero: integer);
    function getNumero: integer;

    procedure setUnidade(pUnidade: integer);
    function getUnidade: integer;

    procedure setQtde(pQtde: integer);
    function getQtde: integer;

    procedure setValorUnitario(pValorUnitario: real);
    function getValorUnitario: real;

    procedure setPrecoMinimo(pPrecoMinimo: real);
    function getPrecoMinimo: real;

    procedure setVTotal (pVTotal : real);
    function getVTotal : real;

    procedure setBaseICMS (pBaseICMS : real);
    function getBaseICMS : real;

    procedure setValorICMS (pValorICMS : real);
    function getValorICMS : real;

    procedure setValorIPI (pValorIPI : real);
    function getValorIPI : real;

    procedure setAliqICMS (pAliqICMS : real);
    function getAliqICMS : real;

    procedure setAliqIPI (pAliqIPI : real);
    function getAliqIPI : real;  
                             
end;

implementation


constructor ItemVenda.crieobj;
begin
  self.nome := '';
  self.valorUnitario := 0;
  self.vTotal := 0;
  self.baseICMS := 0;
  self.valorICMS := 0;
  self.valorIPI := 0;
  self.aliqICMS := 0;
  self.aliqIPI := 0;
end;

destructor ItemVenda.destrua_se;
begin

end;

function ItemVenda.getAliqICMS: real;
begin
   result:= self.aliqICMS;
end;

function ItemVenda.getAliqIPI: real;
begin
  result:= self.aliqIPI;
end;

function ItemVenda.getBaseICMS: real;
begin
 result:= self.baseICMS;
end;

function ItemVenda.getCFOP: string;
begin
 result:= self.cfop;
end;

function ItemVenda.getCodVenda: integer;
begin
  result:= self.codVenda;
end;

function ItemVenda.getCodProduto: integer;
begin
  result:= self.codProduto;
end;

function ItemVenda.getCST: string;
begin
  result:= self.cst;
end;

function ItemVenda.getNCM: string;
begin
  result:= self.ncm;
end;

function ItemVenda.getNome: string;
begin
    result:= self.nome;
end;

function ItemVenda.getNumero: integer;
begin
   result:= self.numero;
end;

function ItemVenda.getPrecoMinimo: real;
begin
   result:= self.precoMinimo;
end;

function ItemVenda.getQtde: integer;
begin
   result:= self.qtde;
end;

function ItemVenda.getUnidade: integer;
begin
    result:= self.unidade;
end;

function ItemVenda.getValorICMS: real;
begin
   result:= self.valorICMS;
end;

function ItemVenda.getValorIPI: real;
begin
  result:= self.valorIPI;
end;

function ItemVenda.getValorUnitario: real;
begin
   result:= self.valorUnitario;
end;

function ItemVenda.getVTotal: real;
begin
   result:= self.vTotal;
end;

procedure ItemVenda.setAliqICMS(pAliqICMS: real);
begin
   self.aliqICMS := pAliqICMS;
end;

procedure ItemVenda.setAliqIPI(pAliqIPI: real);
begin
   self.aliqIPI := pAliqIPI;
end;

procedure ItemVenda.setBaseICMS(pBaseICMS: real);
begin
   self.baseICMS := pBaseICMS;
end;

procedure ItemVenda.setCFOP(pCFOP: string);
begin
   self.cfop := pCFOP;
end;

procedure ItemVenda.setCodVenda(pCodVenda: integer);
begin
  self.codVenda := pCodVenda;
end;

procedure ItemVenda.setCodProduto(pCodProduto: integer);
begin
  self.codProduto := pCodProduto;
end;

procedure ItemVenda.setCST(pCST: string);
begin
  self.cst := pCST;
end;

procedure ItemVenda.setNCM(pNCM: string);
begin
  self.ncm := pNCM;
end;

procedure ItemVenda.setNome(pNome: string);
begin
   self.nome := pNome;
end;

procedure ItemVenda.setNumero(pNumero: integer);
begin
   self.numero := pNumero;
end;

procedure ItemVenda.setPrecoMinimo(pPrecoMinimo: real);
begin
   self.precoMinimo := pPrecoMinimo;
end;

procedure ItemVenda.setQtde(pQtde: integer);
begin
   self.qtde := pQtde;
end;

procedure ItemVenda.setUnidade(pUnidade: integer);
begin
   self.unidade := pUnidade;
end;

procedure ItemVenda.setValorICMS(pValorICMS: real);
begin
   self.valorICMS := pValorICMS;
end;

procedure ItemVenda.setValorIPI(pValorIPI: real);
begin
   self.valorIPI := pValorIPI;
end;

procedure ItemVenda.setValorUnitario(pValorUnitario: real);
begin
   self.valorUnitario := pValorUnitario;
end;

procedure ItemVenda.setVTotal(pVTotal: real);
begin
 self.vTotal := pVTotal;
end;

end.
