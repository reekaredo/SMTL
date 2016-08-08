unit uCliente;
//classe cliente

interface
uses uCidade, uCondicao;
  type Cliente = class

  private

  protected
    codigo : integer;
    CPF : string[15];
    sexo       : string[1];
    nome   : string[50];
    telfixo: string[20];
    celular: string[20];
    logradouro : string[50];
    numero     : string[5];
    bairro     : string[50];
    umaCidade  : Cidade;
    dataInclusao : TDateTime;

    apelido: string[50];
    tipo: string[10];
    telRecado: string[20];
    complemento: string[20];
    CEP: string[15];
    RG: string[20];
    umaCondicao: Condicao;
    dataAlteracao: TDateTime;


  public
    constructor crieobj;
    destructor destrua_se;
//-----------------------------
    procedure setDataAlteracao (pData : TDateTime);
    function getDataAlteracao : TDateTime;

    procedure setApelido (pApelido : string);
    function getApelido : string;

    procedure setTipo    (pTipo     : string);
    function getTipo     : string;

    procedure setTelRecado(pTelRecado : string);
    function getTelRecado : string;

    procedure setComplemento(pComplemento : string);
    function getComplemento : string;

    procedure setCEP(pCEP : string);
    function getCEP : string;

    procedure setRG(pRG : string);
    function getRG : string;

    procedure setCondicao(pCondicao : Condicao);
    function getCondicao : Condicao;

//    --------------------------------
    procedure setDataI (pData : TDateTime);
    function getDataI : TDateTime;

    procedure setCodigo (pCodigo : integer);
    function getCodigo : integer;    

    procedure setSexo    (pSexo     : string);
    function getSexo     : string;

    procedure setCPF(pCPF : string);
    function getCPF : string;

    procedure setNome(pNome : string);
    function getNome : string;

    procedure setTelFixo(pTel : string);
    function getTelFixo : string;

    procedure setCelular(pCelular : string);
    function getCelular : string;

    procedure setNumero(pNumero : string);
    function getNumero : string;

    procedure setBairro(pBairro : string);
    function getBairro : string;

    procedure setUmaCidade(pUmaCidade : Cidade);
    function getUmaCidade : Cidade;

    procedure setLogradouro(pLogradouro : string);
    function getLogradouro : string;
end;
implementation


constructor Cliente.crieobj;
begin
  codigo := 0;
  CPF := '';
  umaCidade := Cidade.crieobj;
  umaCondicao := Condicao.crieobj;
end;

destructor Cliente.destrua_se;
begin
  umaCidade.destrua_se;
  umaCondicao.destrua_se;
end;

function Cliente.getBairro: string;
begin
   Result := self.bairro;
end;

function Cliente.getCelular: string;
begin
   Result := self.celular;
end;

function Cliente.getUmaCidade: Cidade;
begin
   Result := Self.umaCidade;
end;

function Cliente.getCPF: string;
begin
  Result := self.CPF;
end;

function Cliente.getLogradouro: string;
begin
  Result := self.logradouro;
end;

function Cliente.getNome: string;
begin
   Result := self.nome;
end;

function Cliente.getNumero: string;
begin
   Result := self.numero;
end;

function Cliente.getSexo: string;
begin
   Result := sexo;
end;

function Cliente.getTelFixo: string;
begin
    Result := self.telfixo;
end;

procedure Cliente.setBairro(pBairro: string);
begin
   self.bairro := pBairro;
end;

procedure Cliente.setCelular(pCelular: string);
begin
   self.celular := pCelular;
end;

procedure Cliente.setUmaCidade(pUmaCidade: Cidade);
begin
   Self.umaCidade := pUmaCidade;
end;

procedure Cliente.setCPF(pCPF: string);
begin
  self.CPF := pCPF;
end;

procedure Cliente.setLogradouro(pLogradouro: string);
begin
   self.logradouro := pLogradouro;
end;

procedure Cliente.setNome(pNome: string);
begin
  self.nome := pNome;
end;

procedure Cliente.setNumero(pNumero: string);
begin
  self.numero := pNumero;
end;

procedure Cliente.setSexo(pSexo: string);
begin
    sexo := pSexo;
end;

procedure Cliente.setTelFixo(pTel: string);
begin
   self.telfixo := pTel;
end;

function Cliente.getCodigo: integer;
begin
   Result := codigo;
end;

procedure Cliente.setCodigo(pCodigo: integer);
begin
  codigo := pCodigo;
end;

function Cliente.getDataI: TDateTime;
begin
  Result := self.dataInclusao;
end;

procedure Cliente.setDataI(pData: TDateTime);
begin
   self.dataInclusao := pData;
end;

function Cliente.getApelido: string;
begin
    Result := apelido;
end;

function Cliente.getCEP: string;
begin
   Result := CEP;
end;

function Cliente.getComplemento: string;
begin
   Result := complemento;
end;

function Cliente.getCondicao: Condicao;
begin
  Result := umaCondicao;
end;

function Cliente.getDataAlteracao: TDateTime;
begin
  Result := dataAlteracao;
end;

function Cliente.getRG: string;
begin
  Result := RG;
end;

function Cliente.getTelRecado: string;
begin
   Result := telRecado;
end;

function Cliente.getTipo: string;
begin
  Result := Self.tipo;
end;

procedure Cliente.setApelido(pApelido: string);
begin
  apelido := pApelido;
end;

procedure Cliente.setCEP(pCEP: string);
begin
  CEP :=pCEP;
end;

procedure Cliente.setComplemento(pComplemento: string);
begin
  complemento := pComplemento;
end;

procedure Cliente.setCondicao(pCondicao: Condicao);
begin
  umaCondicao := pCondicao;
end;

procedure Cliente.setDataAlteracao(pData: TDateTime);
begin
   dataAlteracao := pData;
end;

procedure Cliente.setRG(pRG: string);
begin
   RG := pRG;
end;

procedure Cliente.setTelRecado(pTelRecado: string);
begin
  telRecado := pTelRecado;
end;

procedure Cliente.setTipo(pTipo: string);
begin
    tipo := pTipo;
end;

end.

