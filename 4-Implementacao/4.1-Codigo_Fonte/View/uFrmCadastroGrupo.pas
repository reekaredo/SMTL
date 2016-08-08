unit uFrmCadastroGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroPai, StdCtrls, uGrupo, uController;

type
  TFrmCadastroGrupo = class(TFrmCadastroPai)
    lbl_pais: TLabel;
    edt_nome: TEdit;
  private
    { Private declarations }
    umGrupo : Grupo;
    umController: controller;
  protected
    procedure Sair;  override;
    procedure Salvar; override;
    procedure CarregaEdit; override;
    procedure LimparCampos; override;
  public
    { Public declarations }
        procedure ConhecaObj(pObj : TObject; pController: controller); override;
        procedure DesabilitaCampos;
        procedure HabilitaCampos;
  end;

var
  FrmCadastroGrupo: TFrmCadastroGrupo;

implementation

{$R *.dfm}

{ TFrmCadastroGrupo }

procedure TFrmCadastroGrupo.CarregaEdit;
begin
  self.edt_cod.Text := IntToStr(umGrupo.getCodigo);
  self.edt_nome.Text := umGrupo.getNome;
end;

procedure TFrmCadastroGrupo.ConhecaObj(pObj: TObject;
  pController: controller);
begin
  umGrupo := Grupo (pObj);
  umController := pController;
  self.LimparCampos;
    if umGrupo.getCodigo <> 0 then
      self.CarregaEdit;

    if self.btn_salvar.Caption = '&Salvar' then
        HabilitaCampos
    else
        DesabilitaCampos;
end;

procedure TFrmCadastroGrupo.DesabilitaCampos;
begin
  self.edt_nome.Enabled := False;
end;

procedure TFrmCadastroGrupo.HabilitaCampos;
begin
  self.edt_nome.Enabled := True;
end;

procedure TFrmCadastroGrupo.LimparCampos;
begin
  self.edt_cod.Clear;
  Self.edt_nome.Clear;
end;

procedure TFrmCadastroGrupo.Sair;
begin
  inherited;

end;

procedure TFrmCadastroGrupo.Salvar;
var incluido, excluido, permitir : string;
selected : integer;
men : TForm;
begin
      if self.btn_salvar.Caption = '&Salvar' then
        begin
              if (self.edt_nome.Text  = '') then
              begin
                 ShowMessage('O nome do grupo é obrigatório!');
                 self.edt_nome.SetFocus;
              end
            else
                begin
                    umGrupo.setNome(self.edt_nome.Text);
                    incluido := umController.getControllerGrupo.salvaGrupo(umGrupo);
                       if incluido = 'OK' then
                          if umGrupo.getCodigo = 0 then
                            ShowMessage(umGrupo.getNome + ' incluído com sucesso!')
                          else
                            ShowMessage(umGrupo.getNome + ' alterado com sucesso!');
                    inherited;
                end;
        end
        else
          begin
             men := CreateMessageDialog('Deseja mesmo excluir o grupo ' + QuotedStr(umGrupo.getNome) + '?',mtCustom,[mbYes,mbAbort]);
             men.Caption := 'Confirmação';
             men.Position := poDesktopCenter;
             selected := men.ShowModal;
             
              if selected = mrYes then
                begin
                   permitir := umController.getControllerGrupo.pesquisaDependencia(umGrupo.getCodigo);
                      if permitir = 'OK' then
                       begin
                        excluido :=  umController.getcontrollerGrupo.excluiGrupo(umGrupo);
                        ShowMessage(QuotedStr(umGrupo.getNome) + ' excluído com sucesso!');
                       end
                        else
                            Showmessage('Não foi possível excluir o grupo! Há produtos vinculados a ele!');
                inherited;
                end;
          end;
end;

end.
