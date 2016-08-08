unit uFrmCadastroFuncionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroPai, StdCtrls, uController, uFuncionario, uFrmConsultaCidade,
  Mask;

type
  TFrmCadastroFuncionario = class(TFrmCadastroPai)
    lbl_nome: TLabel;
    lbl_cpf: TLabel;
    lbl_sexo: TLabel;
    lbl_endereco: TLabel;
    lbl_fixo: TLabel;
    lbl_celular: TLabel;
    lbl_numero: TLabel;
    lbl_bairro: TLabel;
    lbl_cidade: TLabel;
    edt_nome: TEdit;
    edt_sexo: TEdit;
    edt_logradouro: TEdit;
    edt_fixo: TEdit;
    edt_celular: TEdit;
    edt_numero: TEdit;
    edt_bairro: TEdit;
    edt_codCidade: TEdit;
    edt_cidade: TEdit;
    btn_buscar: TButton;
    lbl_data: TLabel;
    edt_data: TEdit;
    btn_habilitar: TButton;
    lbl1: TLabel;
    edt_cargo: TEdit;
    lbl2: TLabel;
    edt_salario: TEdit;
    edt_cpf: TMaskEdit;
    procedure btn_habilitarClick(Sender: TObject);
    procedure btn_buscarClick(Sender: TObject);
    procedure edt_cpfKeyPress(Sender: TObject; var Key: Char);
    procedure edt_numeroKeyPress(Sender: TObject; var Key: Char);
    procedure edt_sexoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_salarioKeyPress(Sender: TObject; var Key: Char);
  private
    umFuncionario : Funcionario;
    umFrmConsultaCidade : TFrmConsultaCidade;

  protected
        umController : controller;
        procedure Sair;  override;
        procedure Salvar; override;
        procedure CarregaEdit; override;
        procedure LimparCampos; override;
        function isNumerico(texto: string): Boolean;
        function validaCampos: Boolean;
        function verificaReal(texto: string) : Boolean;
        function isCPF(CPF: string): Boolean;
  public
        procedure ConhecaObj(pObj : TObject; pController: controller); override;
        procedure SetConsultaCidade (pObj : TForm);
        procedure DesabilitaCampos;
        procedure HabilitaCampos;
end;

var
  FrmCadastroFuncionario: TFrmCadastroFuncionario;

implementation

{$R *.dfm}

{ TFrmCadastroFuncionario }

procedure TFrmCadastroFuncionario.CarregaEdit;
begin
  Self.edt_cod.Text         :=  IntToStr(umFuncionario.getCodigo);
  self.edt_data.Text        :=  DateToStr(umFuncionario.getDataI) ;
  self.edt_nome.Text        :=  umFuncionario.getNome;
  Self.edt_cpf.Text         :=  umFuncionario.getCPF;
  Self.edt_sexo.Text        :=  umFuncionario.getSexo;
  self.edt_fixo.Text        :=  umFuncionario.getTelFixo;
  self.edt_celular.Text     :=  umFuncionario.getCelular;
  self.edt_logradouro.Text  :=  umFuncionario.getLogradouro;
  self.edt_numero.Text      :=  umFuncionario.getNumero;
  self.edt_bairro.Text      :=  umFuncionario.getBairro;
  self.edt_codCidade.Text   :=  IntToStr(umFuncionario.getUmaCidade.getCodigo);
  self.edt_cidade.Text      :=  umFuncionario.getUmaCidade.getCidade;
  Self.edt_cargo.Text       :=  umFuncionario.getCargo;
  self.edt_salario.Text     :=  FloatToStr(umFuncionario.getSalario);
end;

procedure TFrmCadastroFuncionario.ConhecaObj(pObj: TObject;
  pController: controller);
begin
  umFuncionario := Funcionario (pObj);
  umController := pController;
    self.LimparCampos;
    self.edt_data.Text := DateToStr(Date);
      if umFuncionario.getCodigo <> 0 then
        begin
          Self.CarregaEdit;
        end;

      if Self.btn_salvar.Caption = '&Salvar' then
          HabilitaCampos;
          
      if Self.btn_salvar.Caption = 'Excluir' then
          DesabilitaCampos;
end;

procedure TFrmCadastroFuncionario.DesabilitaCampos;
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
  self.edt_cargo.Enabled := False;
  Self.edt_salario.Enabled := False;
end;

procedure TFrmCadastroFuncionario.HabilitaCampos;
begin
  self.edt_nome.Enabled := True;
  Self.edt_cpf.Enabled := True;
  Self.edt_sexo.Enabled := True;
  self.edt_fixo.Enabled := True;
  self.edt_celular.Enabled := True;
  self.edt_logradouro.Enabled := True;
  self.edt_numero.Enabled := True;
  self.edt_bairro.Enabled := True;

  Self.btn_buscar.Enabled := True;
  self.edt_cargo.Enabled := True;
  Self.edt_salario.Enabled := True;
end;

function TFrmCadastroFuncionario.isNumerico(texto: string): Boolean;
begin

end;

procedure TFrmCadastroFuncionario.LimparCampos;
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
  self.edt_cargo.Clear;
  self.edt_salario.Clear;
end;

procedure TFrmCadastroFuncionario.Sair;
begin
  inherited;

end;

procedure TFrmCadastroFuncionario.Salvar;
var incluido, excluido, permitir : string;
selected : integer;
men : TForm;
begin
        if self.btn_salvar.Caption = '&Salvar' then
          begin
                 if validaCampos = True then
                    begin
                        umFuncionario.setNome(Self.edt_nome.Text);
                        umFuncionario.setCPF(self.edt_cpf.Text);
                        umFuncionario.setSexo(self.edt_sexo.Text);
                        umFuncionario.setCelular(self.edt_celular.Text);
                        umFuncionario.setTelFixo(self.edt_fixo.Text);
                        umFuncionario.setLogradouro(self.edt_logradouro.Text);
                        umFuncionario.setNumero(self.edt_numero.Text);
                        umFuncionario.setBairro(self.edt_bairro.Text);
                        umFuncionario.setCargo(self.edt_cargo.Text);
                        umFuncionario.setSalario(StrToFloat(self.edt_salario.text));
                        umFuncionario.setDataI(Date);


                        incluido :=  umController.getcontrollerFuncionario.salvaFuncionario(umFuncionario);
                             if incluido = 'OK' then
                                if umFuncionario.getCodigo = 0 then
                                  ShowMessage(umFuncionario.getNome + ' incluído com sucesso!')
                                else
                                  ShowMessage(umFuncionario.getNome + ' alterado com sucesso!');
                      inherited;
                    end;
          end
          else
            begin
               men := CreateMessageDialog('Deseja mesmo excluir o funcionário ' + QuotedStr(umFuncionario.getNome) + '?',mtCustom,[mbYes,mbAbort]);
               men.Caption := 'Confirmação';
               men.Position := poDesktopCenter;
               selected := men.ShowModal;

                if selected = mrYes then
                  begin
                    permitir := umController.getcontrollerFuncionario.pesquisaDependencia(umFuncionario.getCodigo);
                      if permitir = 'OK' then
                         begin
                               excluido :=  umController.getControllerFuncionario.excluiFuncionario(umFuncionario);
                               ShowMessage(QuotedStr(umFuncionario.getNome) + ' excluído com sucesso!');
                         end
                      else
                               Showmessage('Não foi possível excluir o funcionário! Há usuários vinculados a ele!');
                  inherited;
                  end;
            end;
end;

procedure TFrmCadastroFuncionario.SetConsultaCidade(pObj: TForm);
begin
   umFrmConsultaCidade := TFrmConsultaCidade (pObj);
end;

procedure TFrmCadastroFuncionario.btn_habilitarClick(Sender: TObject);
begin
  self.HabilitaCampos;
  self.btn_salvar.Enabled := true;
  self.btn_habilitar.Enabled := False;
  Self.btn_buscar.Enabled := True;
end;

procedure TFrmCadastroFuncionario.btn_buscarClick(Sender: TObject);
begin
  umFrmConsultaCidade.ConhecaObj(umFuncionario.getUmaCidade,umController);
  umFrmConsultaCidade.btn_Sair.Caption := 'Selecionar';
  umFrmConsultaCidade.ShowModal;
  Self.edt_codCidade.Text := IntToStr(umFuncionario.getUmaCidade.getCodigo);
  Self.edt_cidade.Text := umFuncionario.getUmaCidade.getCidade;
  umFrmConsultaCidade.btn_Sair.Caption := 'Sair';
end;

procedure TFrmCadastroFuncionario.edt_cpfKeyPress(Sender: TObject;
  var Key: Char);
begin
      if not (Key in ['0'..'9',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas números!');
          Key := #0;
      end;
end;

procedure TFrmCadastroFuncionario.edt_numeroKeyPress(Sender: TObject;
  var Key: Char);
begin
      if not (Key in ['0'..'9',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas números!');
          Key := #0;
      end;
end;

procedure TFrmCadastroFuncionario.edt_sexoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['m','M','f','F',#8] ) then
      begin
          ShowMessage('Apenas "m" ou "f"');
          Key := #0;
      end;
end;

procedure TFrmCadastroFuncionario.edt_salarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9',',',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas números e vírgula!');
          Key := #0;
      end;
end;

function TFrmCadastroFuncionario.validaCampos: Boolean;
begin
      Result := False;
              if self.edt_salario.Text = '' then
                  self.edt_salario.Text := '0'; 

              if (self.edt_nome.Text = '') then
                    begin
                      ShowMessage('O nome do funcionário é obrigatório!');
                      self.edt_nome.SetFocus;
                    end
              else if  (Self.edt_cpf.Text = '') then
                    begin
                      ShowMessage('O CPF do funcionário é obrigatório!');
                      self.edt_cpf.SetFocus;
                    end
              else if  (Self.edt_cidade.Text = '') then
                    begin
                      ShowMessage('A cidade do funcionário é obrigatória!');
                      self.btn_buscar.SetFocus;
                    end
              else if (Self.edt_sexo.Text = '') then
                    begin
                      ShowMessage('O sexo do funcionário é obrigatório!');
                      self.edt_sexo.SetFocus;
                    end
              else if (self.edt_cargo.Text = '') then
                    begin
                      ShowMessage('O cargo do funcionário é obrigatório!');
                      self.edt_cargo.SetFocus;
                    end
              else if (verificaReal(edt_salario.Text) = False) then
                    begin
                      ShowMessage('O valor do salário foi digitado incorretamente!' + #13 + 'Use vírgula para separar ou digite números inteiros');
                      self.edt_salario.SetFocus;
                    end
              else
                begin
                    if (Self.edt_cpf.Text <> '') then
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
                  Result := True;
                end;
end;

function TFrmCadastroFuncionario.verificaReal(texto: string): Boolean;
begin
    try
       StrToFloat(texto);
       Result:= True;
    except
        Result:= False;
    end;
end;

function TFrmCadastroFuncionario.isCPF(CPF: string): Boolean;
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

end.
