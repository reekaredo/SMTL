unit uFrmCadastroEstado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroPai, StdCtrls, uEstado, uFrmConsultaPais, uController;

type
  TFrmCadastroEstado = class(TFrmCadastroPai)
    lbl_estado: TLabel;
    lbl_uf: TLabel;
    lbl_pais: TLabel;
    edt_estado: TEdit;
    edt_uf: TEdit;
    edt_pais: TEdit;
    edt_descPais: TEdit;
    btn_buscar: TButton;
    procedure edt_ufKeyPress(Sender: TObject; var Key: Char);
    procedure btn_buscarClick(Sender: TObject);
  private
    { Private declarations }
    umEstado : Estado;
    umFrmConsultaPais : TFrmConsultaPais;
  protected
    umController : controller;
    procedure Sair;  override;
    procedure Salvar; override;
    procedure CarregaEdit; override;
    procedure LimparCampos; override;
    function validaCampos: Boolean;

  public
    { Public declarations }
        procedure ConhecaObj (pObj : TObject; pController: controller); override;
        procedure SetConsultaPais (pObj : TForm);
        procedure HabilitaCampos;
        procedure DesabilitaCampos;
  end;

var
  FrmCadastroEstado: TFrmCadastroEstado;

implementation

{$R *.dfm}

{ TFrmCadastroEstado }

procedure TFrmCadastroEstado.ConhecaObj(pObj: TObject; pController: controller);
begin
  umEstado := Estado (pObj);
  umController := pController;
     self.LimparCampos;
      if umEstado.getCodigo <> 0 then
        begin
          Self.CarregaEdit;
        end;

      if self.btn_salvar.Caption = '&Salvar' then
        self.HabilitaCampos
      else
        self.DesabilitaCampos;
end;

procedure TFrmCadastroEstado.CarregaEdit;
begin
  self.edt_estado.Text := umEstado.getNomeEstado;
  self.edt_uf.Text := umEstado.getUF;
  self.edt_cod.Text := IntToStr(umEstado.getCodigo);
  self.edt_pais.Text := IntToStr(umEstado.getumPais.getCodigo);
  self.edt_descPais.Text := umEstado.getumPais.getPais; 
end;

procedure TFrmCadastroEstado.LimparCampos;
begin
  Self.edt_estado.Clear;
  Self.edt_uf.Clear;
  Self.edt_cod.Clear;
  self.edt_pais.Clear;
  self.edt_descPais.Clear;
end;

procedure TFrmCadastroEstado.Sair;
begin
  inherited; 
end;

procedure TFrmCadastroEstado.Salvar;
var incluido, excluido, permitir : string;
selected : integer;
men : TForm;
begin
      if self.btn_salvar.Caption = '&Salvar' then
        begin
                 if validaCampos = True then
                    begin
                      umEstado.setNomeEstado(self.edt_estado.Text);
                      umEstado.setUF(Self.edt_uf.Text);

                        incluido := umController.getControllerEstado.salvaEstado(umEstado);
                             if incluido = 'OK' then
                                if umEstado.getCodigo = 0 then
                                  ShowMessage(umEstado.getNomeEstado + ' incluído com sucesso!')
                                else
                                  ShowMessage(umEstado.getNomeEstado + ' alterado com sucesso!');
                      inherited;
                    end;
        end
        else
            begin
               men := CreateMessageDialog('Deseja mesmo excluir o estado ' + QuotedStr(umEstado.getNomeEstado) + '?',mtCustom,[mbYes,mbAbort]);
               men.Caption := 'Confirmação';
               men.Position := poDesktopCenter;
               selected := men.ShowModal;

               if selected = mrYes then
                  begin
                     permitir := umController.getControllerEstado.pesquisaDependencia(umEstado.getCodigo);
                      if permitir = 'OK' then
                      begin
                        excluido :=  umController.getControllerEstado.excluiEstado(umEstado);
                        ShowMessage(QuotedStr(umEstado.getNomeEstado) + ' excluído com sucesso!')
                      end
                      else
                        ShowMessage('Não foi possível excluir! Há cidades vinculadas a esse estado');
                  inherited;
                  end;
            end;
end;

procedure TFrmCadastroEstado.SetConsultaPais(pObj: TForm);
begin
    umFrmConsultaPais := TFrmConsultaPais (pObj);
end;

procedure TFrmCadastroEstado.edt_ufKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not ( Key in ['A'..'Z','a'..'z','+',#16,#8,#9,#13,#20,#36,#37,#46,#107] )
    then
      begin
          ShowMessage('Apenas letras!');
          Key := #0;
      end;
end;

procedure TFrmCadastroEstado.btn_buscarClick(Sender: TObject);
begin
  umFrmConsultaPais.ConhecaObj(umEstado.getumPais, umController);
  umFrmConsultaPais.btn_Sair.Caption := 'Selecionar';
  umFrmConsultaPais.ShowModal;
  self.edt_pais.Text := InttoStr(umEstado.getumPais.getCodigo);
  self.edt_descPais.Text := umEstado.getumPais.getPais;
  umFrmConsultaPais.btn_Sair.Caption := 'Sair';
end;

procedure TFrmCadastroEstado.DesabilitaCampos;
begin
  self.edt_estado.Enabled := False;
  self.edt_uf.Enabled := False;
  self.btn_buscar.Enabled := False;
end;

procedure TFrmCadastroEstado.HabilitaCampos;
begin
  self.edt_estado.Enabled   := True;
  self.edt_uf.Enabled       := True;
  self.btn_buscar.Enabled := True;
end;

function TFrmCadastroEstado.validaCampos: Boolean;
begin
    Result:= False;
     if (self.edt_estado.Text = '') then
          begin
            ShowMessage('O nome do estado é obrigatório!');
            self.edt_estado.SetFocus;
          end
     else if (self.edt_uf.Text = '') then
          begin
            ShowMessage('A UF(sigla) do estado é obrigatória!');
            self.edt_uf.SetFocus;
          end
     else if (Self.edt_descPais.Text = '') then
          begin
            ShowMessage('O país é obrigatório!');
            self.btn_buscar.SetFocus;
          end
     else
      Result:= True;
end;

end.
