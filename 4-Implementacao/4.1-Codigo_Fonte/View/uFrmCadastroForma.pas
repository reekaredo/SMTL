unit uFrmCadastroForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroPai, StdCtrls, uForma, uController;

type
  TFrmCadastroForma = class(TFrmCadastroPai)
    lbl_pais: TLabel;
    edt_nome: TEdit;
  private
    { Private declarations }
    umaForma: Forma;
    umController : controller;
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
  FrmCadastroForma: TFrmCadastroForma;

implementation

{$R *.dfm}

{ TFrmCadastroForma }

procedure TFrmCadastroForma.CarregaEdit;
begin
    Self.edt_cod.Text := IntToStr(umaForma.getCodigo);
    Self.edt_nome.Text := umaForma.getNome;
end;

procedure TFrmCadastroForma.ConhecaObj(pObj: TObject;
  pController: controller);
begin
  umaForma := Forma (pObj);
  umController := pController;
     self.LimparCampos;
      if umaForma.getCodigo <> 0 then
        begin
          Self.CarregaEdit;
        end;

      if btn_salvar.Caption = '&Salvar' then
        HabilitaCampos
      else
        DesabilitaCampos;
end;

procedure TFrmCadastroForma.DesabilitaCampos;
begin
  self.edt_nome.Enabled := false;
end;

procedure TFrmCadastroForma.HabilitaCampos;
begin
  self.edt_nome.Enabled := True;
end;

procedure TFrmCadastroForma.LimparCampos;
begin
  self.edt_nome.Text := '';
  self.edt_cod.Text := '';
end;

procedure TFrmCadastroForma.Sair;
begin
  inherited;
end;

procedure TFrmCadastroForma.Salvar;
var incluido, excluido, permitir : string;
selected : integer;
men : TForm;
begin
      if self.btn_salvar.Caption = '&Salvar' then
        begin
              if (self.edt_nome.Text  = '') then
              begin
                 ShowMessage('Preencha o nome da forma de pagamento');
                 self.edt_nome.SetFocus;
              end
            else
                begin
                    umaForma.setNome(self.edt_nome.Text);
                    incluido := umController.getControllerForma.salvaForma(umaForma);
                       if incluido = 'OK' then
                          if umaForma.getCodigo = 0 then
                            ShowMessage(umaForma.getNome + ' incluído com sucesso!')
                          else
                            ShowMessage(umaForma.getNome + ' alterado com sucesso!');
                    inherited;
                end;
        end
        else
            begin
               men := CreateMessageDialog('Deseja excluir a forma de pgto ' + QuotedStr(umaForma.getNome) + '?',mtCustom,[mbYes,mbAbort]);
               men.Caption := 'Confirmação';
               men.Position := poDesktopCenter;
               selected := men.ShowModal;
                if selected = mrYes then
                  begin
                      //bloco de verificação de dependencia
                      permitir := umController.getControllerForma.pesquisaDependencia(umaForma.getCodigo);
                        if permitir = 'OK' then
                          begin
                             excluido :=  umController.getControllerForma.excluiForma(umaForma);
                               if excluido = 'OK' then
                                 ShowMessage(QuotedStr(umaForma.getNome) + ' excluído com sucesso!')
                               else
                                 Showmessage('Não foi possível excluir a forma de pagamento');
                          end
                        else if permitir = 'PARCELA' then
                           ShowMessage('Não foi possível excluir! Há condições ou parcelas vinculadas a essa forma!');

                  inherited;
                  end;
            end;
end;

end.
