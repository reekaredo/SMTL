unit uFrmCadastroCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroPai, StdCtrls, uCliente, uController, uFrmConsultaCidade,
  Mask, ExtCtrls, uFrmConsultaCondicao;

type
  TFrmCadastroCliente = class(TFrmCadastroPai)
    label_nome: TLabel;
    label_cpf: TLabel;
    label_sexo: TLabel;
    label_logradouro: TLabel;
    edt_nome: TEdit;
    edt_sexo: TEdit;
    edt_logradouro: TEdit;
    label_fixo: TLabel;
    label_celular: TLabel;
    edt_fixo: TEdit;
    edt_celular: TEdit;
    label_numero: TLabel;
    edt_numero: TEdit;
    label_bairro: TLabel;
    edt_bairro: TEdit;
    edt_codCidade: TEdit;
    edt_cidade: TEdit;
    label_cidade: TLabel;
    btn_buscar: TButton;
    btn_habilitar: TButton;
    label_dataInclusao: TLabel;
    edt_data: TEdit;
    edt_cpf: TMaskEdit;
    label_complemento: TLabel;
    label_apelido: TLabel;
    label_TelRecado: TLabel;
    label_cep: TLabel;
    edt_CEP: TMaskEdit;
    label_RG: TLabel;
    edt_RG: TEdit;
    label_dataAlteracao: TLabel;
    edt_dataAlteracao: TEdit;
    lbl6: TLabel;
    rg_tipo: TRadioGroup;
    rb_fisica: TRadioButton;
    rb_juridica: TRadioButton;
    edt_apelido: TEdit;
    edt_TelRecado: TEdit;
    label_condicao: TLabel;
    edt_codCondicao: TEdit;
    edt_Condicao: TEdit;
    edt_complemento: TEdit;
    btn_buscar2: TButton;
    procedure btn_buscarClick(Sender: TObject);
    procedure edt_sexoKeyPress(Sender: TObject; var Key: Char);
    procedure btn_habilitarClick(Sender: TObject);
    procedure edt_cpfKeyPress(Sender: TObject; var Key: Char);
    procedure edt_fixoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_celularKeyPress(Sender: TObject; var Key: Char);
    procedure edt_numeroKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_buscar2Click(Sender: TObject);
    procedure rb_fisicaClick(Sender: TObject);
    procedure rb_juridicaClick(Sender: TObject);
  private
    { Private declarations }
    umCliente : Cliente;
    umFrmConsultaCidade : TFrmConsultaCidade;
    umFrmConsultaCondicao: TFrmConsultaCondicao;
  protected
        umController : controller;
        procedure Sair;  override;
        procedure Salvar; override;
        procedure CarregaEdit; override;
        procedure LimparCampos; override;
        procedure SelecionaTipo;
        function isNumerico(texto: string): Boolean;
        function validaCampos: Boolean;
        function isCPF(CPF: string): Boolean;
        function isCNPJ(CNPJ: string): boolean;

  public
    { Public declarations }
        procedure ConhecaObj(pObj : TObject; pController: controller); override;
        procedure SetConsultaCidade (pObj : TForm);
        procedure SetConsultaCondicao (pObj : TForm);
        procedure DesabilitaCampos;
        procedure HabilitaCampos;
        procedure MostraCampos;
        procedure EscondeCampos;        
  end;

var
  FrmCadastroCliente: TFrmCadastroCliente;

implementation

{$R *.dfm}

{ TFrmCadastroCliente }

procedure TFrmCadastroCliente.ConhecaObj(pObj : TObject; pController: controller);
begin
  umCliente := Cliente (pObj);
  umController := pController;
    self.LimparCampos;
    self.edt_data.Text := DateToStr(Date);
    self.edt_dataAlteracao.Text := DateToStr(Date);
      if umCliente.getCodigo <> 0 then
        begin
          Self.CarregaEdit;
          self.SelecionaTipo;
        end;

      if Self.btn_salvar.Caption = '&Salvar' then
          HabilitaCampos;
          
      if Self.btn_salvar.Caption = 'Excluir' then
          DesabilitaCampos;
end;

procedure TFrmCadastroCliente.CarregaEdit;
begin
  Self.edt_cod.Text         :=  IntToStr(umCliente.getCodigo);
  self.edt_data.Text        :=  DateToStr(umCliente.getDataI) ;
  self.edt_nome.Text        :=  umCliente.getNome;
  Self.edt_cpf.Text         :=  umCliente.getCPF;
  Self.edt_sexo.Text        :=  umCliente.getSexo;
  self.edt_fixo.Text        :=  umCliente.getTelFixo;
  self.edt_celular.Text     :=  umCliente.getCelular;
  self.edt_logradouro.Text  :=  umCliente.getLogradouro;
  self.edt_numero.Text      :=  umCliente.getNumero;
  self.edt_bairro.Text      :=  umCliente.getBairro;
  self.edt_codCidade.Text   :=  IntToStr(umCliente.getUmaCidade.getCodigo);
  self.edt_cidade.Text      :=  umCliente.getUmaCidade.getCidade;

  self.edt_apelido.Text  := umCliente.getApelido;
        if umCliente.getTipo = 'F' then
            self.rb_fisica.Checked := True
        else
            self.rb_juridica.Checked := True;
  self.edt_TelRecado.Text := umCliente.getTelRecado;
  self.edt_complemento.Text  := umCliente.getComplemento;
  self.edt_CEP.Text := umCliente.getCEP;
  Self.edt_RG.Text  := umCliente.getRG;
  Self.edt_codCondicao.Text := IntToStr(umCliente.getCondicao.getCodigo);
  self.edt_Condicao.Text  := umCliente.getCondicao.getNome;
  self.edt_dataAlteracao.Text := DateToStr(umCliente.getDataAlteracao);
end;

procedure TFrmCadastroCliente.LimparCampos;
begin
  Self.edt_cod.Clear;
  self.edt_nome.Clear;
  Self.edt_cpf.Clear;
  Self.edt_sexo.Clear;
  self.edt_fixo.Clear;
  self.edt_celular.Clear;
  self.edt_logradouro.Clear;
  self.edt_numero.Clear;
  self.edt_bairro.Clear;
  self.edt_codCidade.Clear;
  self.edt_cidade.Clear;

  self.edt_apelido.Clear;
  self.rb_fisica.Checked := False;
  self.rb_juridica.Checked := False;
  self.edt_TelRecado.Clear;
  self.edt_complemento.Clear;
  self.edt_CEP.Clear;
  self.edt_RG.Clear;
  self.edt_codCondicao.Clear;
  Self.edt_Condicao.Clear;
  self.edt_dataAlteracao.Clear;
end;

procedure TFrmCadastroCliente.Sair;
begin
  inherited;
end;

procedure TFrmCadastroCliente.Salvar;
var incluido, excluido : string;
selected : integer;
men : TForm;
begin
        if self.btn_salvar.Caption = '&Salvar' then
            begin
            if self.validaCampos = True then
                  begin
                        self.edt_dataAlteracao.Text := DateToStr(Date);
                        umCliente.setNome(self.edt_nome.Text);
                        umCliente.setCPF(Self.edt_cpf.Text);
                         if rb_fisica.Checked = True then
                           umCliente.setSexo(Self.edt_sexo.Text)
                         else
                           umCliente.setSexo('J');
                        umCliente.setTelFixo(self.edt_fixo.Text);
                        umCliente.setCelular(self.edt_celular.Text);
                        umCliente.setLogradouro(self.edt_logradouro.Text);
                        umCliente.setBairro(self.edt_bairro.Text);
                        umCliente.setDataI(StrToDate(self.edt_data.text));

                        umCliente.setApelido(self.edt_apelido.Text);
                            if rb_fisica.Checked = True then
                                umCliente.setTipo('F')
                            else
                                umCliente.setTipo('J');
                        umCliente.setTelRecado(edt_TelRecado.Text);
                        umCliente.setComplemento(edt_complemento.Text);
                        umCliente.setCEP(edt_CEP.Text);
                        umCliente.setRG(edt_RG.Text);
                        umCliente.setDataAlteracao(Date);
                        umCliente.setNumero(edt_numero.Text);

                             try
                                 incluido :=  umController.getControllerCliente.salvaCliente(umCliente);
                                      if incluido = 'OK' then
                                         if umCliente.getCodigo = 0 then
                                           ShowMessage(umCliente.getNome + ' incluído com sucesso!')
                                         else
                                           ShowMessage(umCliente.getNome + ' alterado com sucesso!');
                                 inherited;
                             except
                                   ShowMessage('Não foi possível salvar!');
                                   self.edt_cpf.SetFocus;
                             end;
                  end;
            end
        else
                begin
                 men := CreateMessageDialog('Deseja mesmo excluir o cliente ' + QuotedStr(umCliente.getNome) + '?',mtCustom,[mbYes,mbAbort]);
                 men.Caption := 'Confirmação';
                 men.Position := poDesktopCenter;
                 selected := men.ShowModal;
                  if selected = mrYes then
                    begin
                        excluido :=  umController.getControllerCliente.excluiCliente(umCliente);
                        if excluido = 'OK' then
                            ShowMessage('Cliente ' + QuotedStr(umCliente.getNome) + ' excluído com sucesso!')
                        else
                            Showmessage('Não foi possível excluir o cliente');
                    inherited;
                    end;
                end;    
end;

procedure TFrmCadastroCliente.SetConsultaCidade(pObj: TForm);
begin
    umFrmConsultaCidade := TFrmConsultaCidade (pObj);
end;

procedure TFrmCadastroCliente.btn_buscarClick(Sender: TObject);
begin
 umFrmConsultaCidade.ConhecaObj(umCliente.getUmaCidade,umController);
  umFrmConsultaCidade.btn_Sair.Caption := 'Selecionar';
  umFrmConsultaCidade.ShowModal;
  Self.edt_codCidade.Text := IntToStr(umCliente.getUmaCidade.getCodigo);
  Self.edt_cidade.Text := umCliente.getUmaCidade.getCidade;
  umFrmConsultaCidade.btn_Sair.Caption := 'Sair';  
end;

procedure TFrmCadastroCliente.edt_sexoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['m','M','f','F',#8] ) then
      begin
          ShowMessage('Apenas "m" ou "f"');
          Key := #0;
      end;
end;

procedure TFrmCadastroCliente.DesabilitaCampos;
begin
  self.edt_nome.Enabled := False;
  Self.edt_cpf.Enabled := False;
  Self.edt_sexo.Enabled := False;
  self.edt_fixo.Enabled := False;
  self.edt_celular.Enabled := False;
  self.edt_logradouro.Enabled := False;
  self.edt_numero.Enabled := False;
  self.edt_bairro.Enabled := False;
  Self.btn_buscar.Enabled := False;

  self.edt_apelido.Enabled := False;
  self.rg_tipo.Enabled := False;
  self.edt_TelRecado.Enabled := False;
  self.edt_complemento.Enabled := False;
  self.edt_CEP.Enabled := False;
  self.edt_RG.Enabled := False;
  self.btn_buscar2.Enabled := False;
  self.edt_dataAlteracao.Enabled := False;
end;

procedure TFrmCadastroCliente.HabilitaCampos;
begin
  self.edt_nome.Enabled := true;
  Self.edt_cpf.Enabled := true;
  Self.edt_sexo.Enabled := true;
  self.edt_fixo.Enabled := true;
  self.edt_celular.Enabled := true;
  self.edt_logradouro.Enabled := true;
  self.edt_numero.Enabled := true;
  self.edt_bairro.Enabled := true; 
  Self.btn_buscar.Enabled := True;

  self.edt_apelido.Enabled := True;
  self.rg_tipo.Enabled := True;
  self.edt_TelRecado.Enabled := True;
  self.edt_complemento.Enabled := True;
  self.edt_CEP.Enabled := True;
  self.edt_RG.Enabled := True;
  self.btn_buscar2.Enabled := True;
  self.edt_dataAlteracao.Enabled := True;
end;

procedure TFrmCadastroCliente.btn_habilitarClick(Sender: TObject);
begin
  inherited;
  self.HabilitaCampos;
  self.btn_salvar.Enabled := true;
  self.btn_habilitar.Enabled := False;
  Self.btn_buscar.Enabled := True;
end;

procedure TFrmCadastroCliente.edt_cpfKeyPress(Sender: TObject;
  var Key: Char);
begin
     if not (Key in ['0'..'9',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas números!');
          Key := #0;
      end;
end;

procedure TFrmCadastroCliente.edt_fixoKeyPress(Sender: TObject;
  var Key: Char);
begin
     if not (Key in ['0'..'9',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas números!');
          Key := #0;
      end;
end;

procedure TFrmCadastroCliente.edt_celularKeyPress(Sender: TObject;
  var Key: Char);
begin
     if not (Key in ['0'..'9',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas números!');
          Key := #0;
      end;
end;

procedure TFrmCadastroCliente.edt_numeroKeyPress(Sender: TObject;
  var Key: Char);
begin
      if not (Key in ['0'..'9',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas números!');
          Key := #0;
      end;
end;

function TFrmCadastroCliente.isNumerico(texto: string): Boolean;
var
valor :  string; 
nr : integer; 
c : integer; 
begin
      val(texto,nr,c);
      if c=0 then
      result := true
      else
      Result := false;
end;


procedure TFrmCadastroCliente.MostraCampos;
begin
  self.edt_nome.Visible := True;
  self.label_nome.Visible := True;

  Self.label_apelido.Visible := True;
  self.edt_apelido.Visible := True;

  if rb_fisica.Checked = True then
  begin
        self.label_sexo.Visible := True;
        self.edt_sexo.Visible := True;
  end
  else
  begin
        self.label_sexo.Visible := False;
        self.edt_sexo.Visible := False;
  end;

  self.label_fixo.Visible:= True;
  self.edt_fixo.Visible := True;

  self.label_celular.Visible := True;
  self.edt_celular.Visible := True;

  Self.label_TelRecado.Visible := True;
  self.edt_TelRecado.Visible := True;

  self.label_logradouro.Visible := True;
  Self.edt_logradouro.Visible := True;

  self.label_numero.Visible := True;
  Self.edt_numero.Visible := True;

  self.label_complemento.Visible := True;
  self.edt_complemento.Visible := True;

  Self.label_bairro.Visible := True;
  self.edt_bairro.Visible := True;

  self.label_cep.Visible := True;
  Self.edt_CEP.Visible := True;

  self.label_cidade.Visible := True;
  self.edt_codCidade.Visible := True;
  self.edt_cidade.Visible := True;
  self.btn_buscar.Visible := True;

  self.label_cpf.Visible := True;
  self.edt_cpf.Visible := True;

  self.label_RG.Visible := True;
  self.edt_RG.Visible := True;

  self.label_condicao.Visible := True;
  self.edt_codCondicao.Visible := True;
  self.edt_Condicao.Visible := True;
  self.btn_buscar2.Visible := True;

  self.label_dataInclusao.Visible := True;
  self.edt_data.Visible := True;

  self.edt_dataAlteracao.Visible := True;
  Self.label_dataAlteracao.Visible:= True;
end;

procedure TFrmCadastroCliente.EscondeCampos;
begin
  self.edt_nome.Visible := False;
  self.label_nome.Visible := False;

  Self.label_apelido.Visible := False;
  self.edt_apelido.Visible := False;

  self.label_sexo.Visible := False;
  self.edt_sexo.Visible := False;

  self.label_fixo.Visible:= False;
  self.edt_fixo.Visible := False;

  self.label_celular.Visible := False;
  self.edt_celular.Visible := False;

  Self.label_TelRecado.Visible := False;
  self.edt_TelRecado.Visible := False;

  self.label_logradouro.Visible := False;
  Self.edt_logradouro.Visible := False;

  self.label_numero.Visible := False;
  Self.edt_numero.Visible := False;

  self.label_complemento.Visible := False;
  self.edt_complemento.Visible := False;

  Self.label_bairro.Visible := False;
  self.edt_bairro.Visible := False;

  self.label_cep.Visible := False;
  Self.edt_CEP.Visible := False;

  self.label_cidade.Visible := False;
  self.edt_codCidade.Visible := False;
  self.edt_cidade.Visible := False;
  self.btn_buscar.Visible := False;

  self.label_cpf.Visible := False;
  self.edt_cpf.Visible := False;

  self.label_RG.Visible := False;
  self.edt_RG.Visible := False;

  self.label_condicao.Visible := False;
  self.edt_codCondicao.Visible := False;
  self.edt_Condicao.Visible := False;
  self.btn_buscar2.Visible := False;

  self.label_dataInclusao.Visible := False;
  self.edt_data.Visible := False;

  self.edt_dataAlteracao.Visible := False;
  Self.label_dataAlteracao.Visible:= False;
end;

procedure TFrmCadastroCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  EscondeCampos;
end;

procedure TFrmCadastroCliente.SelecionaTipo;
begin
    if self.rb_fisica.Checked then
       begin
        self.label_nome.Caption := 'Nome*';
        self.label_apelido.Caption := 'Apelido';
        self.label_cpf.Caption := 'CPF*';
        self.label_RG.Caption := 'RG';
        self.edt_cpf.EditMask := '!999.999.999-99;0';
       end
    else
       begin
        self.label_nome.Caption := 'Razão Social*';
        self.label_apelido.Caption := 'Nome Fantasia';
        self.label_cpf.Caption := 'CNPJ*';
        self.label_RG.Caption := 'Insc Est';
        self.edt_cpf.EditMask := '!99.999.999.9999-99;0';        
       end;
end;

function TFrmCadastroCliente.validaCampos: Boolean;
var aux: string;
selected : integer;
men : TForm;
begin
    Result := False;
     if (rb_fisica.Checked = False) and (rb_juridica.Checked = False) then
        begin
          ShowMessage('Você não selecionou o tipo de cliente!');
          self.rg_tipo.SetFocus;
        end
     else if (self.edt_nome.Text = '') then
            begin
              aux := label_nome.Caption;
              ShowMessage('Campo ' + aux + ' é obrigatório!');
              self.edt_nome.SetFocus;
            end
     else if (self.edt_sexo.Text = '') and (rb_fisica.Checked = True) then
            begin
              ShowMessage('Campo "sexo" é obrigatório!');
              self.edt_sexo.SetFocus;
            end
     else if (self.edt_cpf.Text = '') and (rb_fisica.Checked = True) then
            begin
              ShowMessage('Campo "CPF" é obrigatório!');
              self.edt_cpf.SetFocus;
            end
     else if (self.edt_cpf.Text = '') and (rb_juridica.Checked = True) then
            begin
              ShowMessage('Campo "CNPJ" é obrigatório!');
              self.edt_cpf.SetFocus;
            end
     else if (self.edt_cidade.Text = '') then
            begin
              ShowMessage('Campo "cidade" é obrigatório!');
              self.btn_buscar.SetFocus;
            end
     else if (self.edt_Condicao.Text = '') then
            begin
              ShowMessage('condição de pagamento é obrigatória!');
              self.btn_buscar2.SetFocus;
            end       
     else if (rb_fisica.Checked = True) and (label_nome.Caption <> 'Nome*' ) then
          begin
               men := CreateMessageDialog('Você alterou para pessoa física sem clicar no botão OK!?' + #13 + 'Confirma?',mtCustom,[mbYes,mbAbort]);
               men.Caption := 'Confirmação';
               men.Position := poDesktopCenter;
               selected := men.ShowModal;
                    if selected = mrYes then
                         Result := True;
          end
     else if (rb_juridica.Checked = True) and (label_nome.Caption = 'Nome*' ) then
          begin
               men := CreateMessageDialog('Você alterou para pessoa jurídica sem clicar no botão OK!?' + #13 + 'Confirma?',mtCustom,[mbYes,mbAbort]);
               men.Caption := 'Confirmação';
               men.Position := poDesktopCenter;
               selected := men.ShowModal;
                    if selected = mrYes then
                         Result := True;
          end
     else
      begin
          if (Self.edt_cpf.Text <> '') and (rb_fisica.Checked = True) then
            begin
              if isCPF(edt_cpf.Text) = False then
                begin
                  ShowMessage('CPF Inválido!');
                  Result := False;
                  Exit;
                end
              else
                  Result := True;
            end;

          if (Self.edt_cpf.Text <> '') and (rb_juridica.Checked = True) then
            begin
              if isCNPJ(edt_cpf.Text) = False then
                begin
                  ShowMessage('CNPJ Inválido!');
                  Result := False;
                  Exit;
                end
              else
                  Result := True;
            end;
        Result := True;
      end;
end;

procedure TFrmCadastroCliente.SetConsultaCondicao(pObj: TForm);
begin
    umFrmConsultaCondicao := TFrmConsultaCondicao(pObj);
end;

procedure TFrmCadastroCliente.btn_buscar2Click(Sender: TObject);
begin
 umFrmConsultaCondicao.ConhecaObj(umCliente.getCondicao,umController);
  umFrmConsultaCondicao.btn_Sair.Caption := 'Selecionar';
  umFrmConsultaCondicao.ShowModal;
  Self.edt_codCondicao.Text := IntToStr(umCliente.getCondicao.getCodigo);
  Self.edt_Condicao.Text := umCliente.getCondicao.getNome;
  umFrmConsultaCondicao.btn_Sair.Caption := 'Sair';
end;

procedure TFrmCadastroCliente.rb_fisicaClick(Sender: TObject);
begin
          SelecionaTipo;
          MostraCampos;
end;

procedure TFrmCadastroCliente.rb_juridicaClick(Sender: TObject);
begin
          SelecionaTipo;
          MostraCampos;
end;

function TFrmCadastroCliente.isCPF(CPF: string): Boolean;
var dig10, dig11: string; s, i, r, peso: integer;
begin // length - retorna o tamanho da string (CPF é um número formado por 11 dígitos)
      if ((CPF = '00000000000') or (CPF = '11111111111') or
        (CPF = '22222222222') or (CPF = '33333333333') or
        (CPF = '44444444444') or (CPF = '55555555555') or
        (CPF = '66666666666') or (CPF = '77777777777') or
        (CPF = '88888888888') or (CPF = '99999999999') or
        (length(CPF) <> 11)) then
            begin
                isCPF := false;
                exit;
            end;

      try
          { *-- Cálculo do 1o. Digito Verificador --* }
          s := 0;

          peso := 10; for i := 1 to 9 do
                begin
                        s := s + (StrToInt(CPF[i]) * peso);
                        peso := peso - 1;
                end;

          r := 11 - (s mod 11);
          if ((r = 10) or (r = 11)) then
                  dig10 := '0'
          else
                str(r:1, dig10);
                // converte um número no respectivo caractere numérico
                { *-- Cálculo do 2o. Digito Verificador --* }
                s := 0; peso := 11;
            
          for i := 1 to 10 do
              begin
                s := s + (StrToInt(CPF[i]) * peso);
                peso := peso - 1;
              end;

          r := 11 - (s mod 11);

          if ((r = 10) or (r = 11)) then
              dig11 := '0'
          else
              str(r:1, dig11);

          { Verifica se os digitos calculados conferem com os digitos informados. }
          if ((dig10 = CPF[10]) and (dig11 = CPF[11])) then
              isCPF := true
          else
              isCPF := false;

      except
      isCPF := false
      end;    
end;

function TFrmCadastroCliente.isCNPJ(CNPJ: string): boolean;
var   dig13, dig14: string;
    sm, i, r, peso: integer;
begin
// length - retorna o tamanho da string do CNPJ (CNPJ é um número formado por 14 dígitos)
  if ((CNPJ = '00000000000000') or (CNPJ = '11111111111111') or
      (CNPJ = '22222222222222') or (CNPJ = '33333333333333') or
      (CNPJ = '44444444444444') or (CNPJ = '55555555555555') or
      (CNPJ = '66666666666666') or (CNPJ = '77777777777777') or
      (CNPJ = '88888888888888') or (CNPJ = '99999999999999') or
      (length(CNPJ) <> 14))
     then begin
            isCNPJ := false;
            exit;
          end;

// "try" - protege o código para eventuais erros de conversão de tipo através da função "StrToInt"
  try
{ *-- Cálculo do 1o. Digito Verificador --* }
    sm := 0;
    peso := 2;
    for i := 12 downto 1 do
    begin
// StrToInt converte o i-ésimo caractere do CNPJ em um número
      sm := sm + (StrToInt(CNPJ[i]) * peso);
      peso := peso + 1;
      if (peso = 10)
         then peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1))
       then dig13 := '0'
    else str((11-r):1, dig13); // converte um número no respectivo caractere numérico

{ *-- Cálculo do 2o. Digito Verificador --* }
    sm := 0;
    peso := 2;
    for i := 13 downto 1 do
    begin
      sm := sm + (StrToInt(CNPJ[i]) * peso);
      peso := peso + 1;
      if (peso = 10)
         then peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1))
       then dig14 := '0'
    else str((11-r):1, dig14);

{ Verifica se os digitos calculados conferem com os digitos informados. }
    if ((dig13 = CNPJ[13]) and (dig14 = CNPJ[14]))
       then isCNPJ := true
    else isCNPJ := false;
  except
    isCNPJ := false
  end;
end;

end.
