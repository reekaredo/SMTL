unit uFrmCadastroCidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroPai, StdCtrls, uCidade, uController, uFrmConsultaEstado;

type
  TFrmCadastroCidade = class(TFrmCadastroPai)
    lbl_cidade: TLabel;
    lbl_ddd: TLabel;
    lbl_estado: TLabel;
    edt_cidade: TEdit;
    edt_ddd: TEdit;
    edt_CodEstado: TEdit;
    edt_estado: TEdit;
    btn_buscar: TButton;
    procedure btn_buscarClick(Sender: TObject);
    procedure edt_dddKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    umaCidade : Cidade;
    umFrmConsultaEstado : TFrmConsultaEstado;
  protected
        umController : controller;
        procedure Sair;  override;
        procedure Salvar; override;
        procedure CarregaEdit; override;
        procedure LimparCampos; override;
        function validaCampos: Boolean;
        function verificaInteiro(texto: string): Boolean;

  public
    { Public declarations }
        procedure ConhecaObj(pObj : TObject; pController: controller); override;
        procedure SetConsultaEstado (pObj : TForm);
        procedure HabilitaCampos;
        procedure DesabilitaCampos;
  end;

var
  FrmCadastroCidade: TFrmCadastroCidade;

implementation

{$R *.dfm}

{ TFrmCadastroCidade }

procedure TFrmCadastroCidade.ConhecaObj(pObj : TObject; pController: controller);
begin
  umaCidade := Cidade(pObj);
  umController := pController;
    self.LimparCampos;
      if umaCidade.getCodigo <> 0 then
        begin
          Self.CarregaEdit;
        end;

      if self.btn_salvar.Caption = '&Salvar' then
          self.HabilitaCampos
      else
          self.DesabilitaCampos;
end;

procedure TFrmCadastroCidade.CarregaEdit;
begin
  self.edt_cidade.Text := umaCidade.getCidade;
  self.edt_cod.Text := IntToStr(umaCidade.getCodigo);
  self.edt_ddd.Text := umaCidade.getDDD;
  self.edt_CodEstado.Text := IntToStr(umaCidade.getumEstado.getCodigo);
  self.edt_estado.Text := umaCidade.getumEstado.getNomeEstado;
end;

procedure TFrmCadastroCidade.LimparCampos;
begin
  self.edt_cidade.Clear;
  self.edt_cod.Clear;
  self.edt_ddd.Clear;
  self.edt_CodEstado.Clear;
  self.edt_estado.Clear;
end;

procedure TFrmCadastroCidade.Sair;
begin
  inherited; 
end;

procedure TFrmCadastroCidade.Salvar;
var incluido, excluida, permitir  : string;
selected : integer;
men : TForm;
begin
        if self.btn_salvar.Caption = '&Salvar' then
          begin
                 if validaCampos = True then
                    begin
                      umaCidade.setCidade(self.edt_cidade.Text);
                      umaCidade.setDDD(self.edt_ddd.Text);

                        incluido :=  umController.getControllerCidade.salvaCidade(umaCidade);
                             if incluido = 'OK' then
                                if umaCidade.getCodigo = 0 then
                                  ShowMessage(umaCidade.getCidade + ' incluída com sucesso!')
                                else
                                  ShowMessage(umaCidade.getCidade + ' alterada com sucesso!');
                      inherited;
                    end;
          end
          else
            begin
             men := CreateMessageDialog('Deseja mesmo excluir a cidade ' + QuotedStr(umaCidade.getCidade) + '?',mtCustom,[mbYes,mbAbort]);
             men.Caption := 'Confirmação';
             men.Position := poDesktopCenter;
             selected := men.ShowModal;

             if selected = mrYes then
                begin
                  permitir := umController.getControllerCidade.pesquisaDependencia(umaCidade.getCodigo);

                              if permitir = 'OK' then
                                  begin
                                   excluida :=  umController.getControllerCidade.excluiCidade(umaCidade);
                                   ShowMessage(QuotedStr(umaCidade.getCidade) + ' excluída com sucesso!')
                                  end

                              else if permitir = 'CLIENTE' then
                                  Showmessage('Não foi possível excluir a cidade! Há clientes vinculados a ela')

                              else if permitir = 'FORNECEDOR' then
                                Showmessage('Não foi possível excluir a cidade! Há fornecedores vinculados a ela')

                              else if permitir = 'FUNCIONARIO' then
                                Showmessage('Não foi possível excluir a cidade! Há funcionários vinculados a ela');
                inherited;
                end;
            end;
end;

procedure TFrmCadastroCidade.SetConsultaEstado(pObj: TForm);
begin
    umFrmConsultaEstado:= TFrmConsultaEstado (pObj);
end;

procedure TFrmCadastroCidade.btn_buscarClick(Sender: TObject);
begin
  umFrmConsultaEstado.ConhecaObj(umaCidade.getUmEstado,umController);
  umFrmConsultaEstado.btn_Sair.Caption := 'Selecionar';
  umFrmConsultaEstado.ShowModal;
  Self.edt_CodEstado.Text := IntToStr (umaCidade.getumEstado.getCodigo);
  self.edt_estado.Text := umaCidade.getumEstado.getNomeEstado;
  umFrmConsultaEstado.btn_Sair.Caption := 'Sair';
end;

procedure TFrmCadastroCidade.edt_dddKeyPress(Sender: TObject;
  var Key: Char);
begin
     if not (Key in ['0'..'9',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas números!');
          Key := #0;
      end;
end;

procedure TFrmCadastroCidade.DesabilitaCampos;
begin
  self.edt_cidade.Enabled := False;
  self.edt_ddd.Enabled := False;
  self.btn_buscar.Enabled := false;
end;

procedure TFrmCadastroCidade.HabilitaCampos;
begin
  self.edt_cidade.Enabled := True;
  self.edt_ddd.Enabled := True;
  self.btn_buscar.Enabled := True;
end;

function TFrmCadastroCidade.validaCampos: Boolean;
begin
      Result:= False;
        if (self.edt_cidade.Text = '') then
            begin
              ShowMessage('O nome da cidade é obrigatório!');
              self.edt_cidade.SetFocus;
            end
        else if (self.edt_ddd.Text = '') then
            begin
              ShowMessage('O DDD da cidade é obrigatório!');
              self.edt_ddd.SetFocus;
            end
        else if (Self.edt_estado.Text = '') then
            begin
              ShowMessage('O estado é obrigatório!');
              self.btn_buscar.SetFocus;
            end
        else if (verificaInteiro(edt_ddd.Text) = False) then
            begin
              ShowMessage('O DDD só deve conter números!');
              self.edt_ddd.SetFocus;
            end
        else
            Result:= True;
end;

function TFrmCadastroCidade.verificaInteiro(texto: string): Boolean;
begin
    try
        StrToInt(texto);
        Result:= True;
    except
        Result:= False;
    end;
end;

end.
