unit uFornecedor;
//classe fornecedor

interface
  uses uPai, uCidade, uCondicao;
  type fornecedor = class(Pai)

  private

  protected
     nome : string[80];
     fone1: string[20];
     fone2: string[20];
     email: string[80];
     umaCidade: Cidade;
     representante: string [100];
     foneRepresentante: string[100];

    nomeFantasia: string[50];
    logradouro : string[50];
    numero     : string[5];
    complemento: string[20];
    bairro     : string[50];
    CEP: string[15];
    CNPJ: string[20];
    InscEst: string[20];
    umaCondicao: Condicao;
    dataInclusao : TDateTime;
    dataAlteracao: TDateTime;


  public
    constructor crieobj;
    destructor destrua_se;

    procedure setDataAlteracao (pData : TDateTime);
    function getDataAlteracao : TDateTime;

    procedure setDataInclusao (pData : TDateTime);
    function getDataInclusao : TDateTime;

    procedure setnomeFantasia (pnomeFantasia : string);
    function getnomeFantasia : string;

    procedure setlogradouro (plogradouro : string);
    function getlogradouro : string;

    procedure setnumero (pnumero : string);
    function getnumero : string;

    procedure setcomplemento (pcomplemento : string);
    function getcomplemento : string;

    procedure setbairro (pbairro : string);
    function getbairro : string;

    procedure setCEP (pCEP : string);
    function getCEP : string;

    procedure setCNPJ (pCNPJ : string);
    function getCNPJ : string;

    procedure setInscEst (pInscEst : string);
    function getInscEst : string;

    procedure setCondicao (pCondicao : Condicao);
    function getCondicao : Condicao;

    procedure setRepresentante(pRepresentante : string);
    function getRepresentante : string;

    procedure setFoneRepresentante(pFone : string);
    function getFoneRepresentante : string;

    procedure setNome(pNome : string);
    function getNome : string;

    procedure setFone1(pFone : string);
    function getFone1 : string;

    procedure setFone2(pFone2 : string);
    function getFone2 : string;

    procedure setEmail(pEmail : string);
    function getEmail : string;

    procedure setUmaCidade(pUmaCidade : Cidade);
    function getUmaCidade : Cidade;

end;

implementation

{ fornecedor }

constructor fornecedor.crieobj;
begin
    self.nome := '';
    self.email := '';
    self.fone1 := '';
    self.fone2 := '';
    self.umaCidade := Cidade.crieobj;
    umaCondicao := Condicao.crieobj;
    inherited;
end;

destructor fornecedor.destrua_se;
begin
   inherited;
   self.umaCidade.destrua_se;
end;

function fornecedor.getbairro: string;
begin
  Result := bairro;
end;

function fornecedor.getCEP: string;
begin
   Result := CEP;
end;

function fornecedor.getCNPJ: string;
begin
   Result := CNPJ;
end;

function fornecedor.getcomplemento: string;
begin
   Result := complemento;
end;

function fornecedor.getCondicao: Condicao;
begin
   Result := umaCondicao;
end;

function fornecedor.getDataAlteracao: TDateTime;
begin
   Result := dataAlteracao;
end;

function fornecedor.getDataInclusao: TDateTime;
begin
    Result := dataInclusao;
end;

function fornecedor.getEmail: string;
begin
   Result := self.email;
end;

function fornecedor.getFone1: string;
begin
   Result := Self.fone1;
end;

function fornecedor.getFone2: string;
begin
   Result := self.fone2;
end;

function fornecedor.getFoneRepresentante: string;
begin
    Result := self.foneRepresentante;
end;

function fornecedor.getInscEst: string;
begin
  Result := InscEst;
end;

function fornecedor.getlogradouro: string;
begin
   Result := logradouro;
end;

function fornecedor.getNome: string;
begin
   Result := self.nome;
end;

function fornecedor.getnomeFantasia: string;
begin
  Result := nomeFantasia;
end;

function fornecedor.getnumero: string;
begin
   Result := numero;
end;

function fornecedor.getRepresentante: string;
begin
  Result := self.representante;
end;

function fornecedor.getUmaCidade: Cidade;
begin
   Result := self.umaCidade;
end;

procedure fornecedor.setbairro(pbairro: string);
begin
    bairro := pbairro;
end;

procedure fornecedor.setCEP(pCEP: string);
begin
  cep := pCEP;
end;

procedure fornecedor.setCNPJ(pCNPJ: string);
begin
  CNPJ := pCNPJ;
end;

procedure fornecedor.setcomplemento(pcomplemento: string);
begin
  complemento := pcomplemento;
end;

procedure fornecedor.setCondicao(pCondicao: Condicao);
begin
  umaCondicao := pCondicao;
end;

procedure fornecedor.setDataAlteracao(pData: TDateTime);
begin
   dataAlteracao := pData;
end;

procedure fornecedor.setDataInclusao(pData: TDateTime);
begin
  dataInclusao := pData;
end;

procedure fornecedor.setEmail(pEmail: string);
begin
  self.email := pEmail;
end;

procedure fornecedor.setFone1(pFone: string);
begin
  self.fone1 := pFone;
end;

procedure fornecedor.setFone2(pFone2: string);
begin
  self.fone2 := pFone2;
end;

procedure fornecedor.setFoneRepresentante(pFone: string);
begin
   Self.foneRepresentante := pFone;
end;

procedure fornecedor.setInscEst(pInscEst: string);
begin
   InscEst := pInscEst;
end;

procedure fornecedor.setlogradouro(plogradouro: string);
begin
   logradouro := plogradouro;
end;

procedure fornecedor.setNome(pNome: string);
begin
  self.nome := pNome;
end;

procedure fornecedor.setnomeFantasia(pnomeFantasia: string);
begin
   nomeFantasia := pnomeFantasia;
end;

procedure fornecedor.setnumero(pnumero: string);
begin
   numero := pnumero;
end;

procedure fornecedor.setRepresentante(pRepresentante: string);
begin
  Self.representante := pRepresentante;
end;

procedure fornecedor.setUmaCidade(pUmaCidade: Cidade);
begin
  self.umaCidade := pUmaCidade;
end;

end.
