unit uFrmCadastroPai;
{ o formulário de Cadastro Pai serve como base para que todos os cadastros sigam
um padrão, usando o recurso da herança }

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uController;

type
  TFrmCadastroPai = class(TForm)
    lbl__cod: TLabel;
    lbl_gerado: TLabel;
    lbl_campos: TLabel;
    edt_cod: TEdit;
    btn_salvar: TButton;
    btn_sair: TButton;
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure Sair;  virtual;
    procedure Salvar; virtual;
    procedure CarregaEdit; virtual;
    procedure LimparCampos; virtual;
  public
    { Public declarations }
    procedure ConhecaObj (pObj : TObject; pController: controller); virtual;    
  end;

var
  FrmCadastroPai: TFrmCadastroPai;

implementation

{$R *.dfm}

{ TFrmCadastroPai }

procedure TFrmCadastroPai.CarregaEdit;
begin

end;

procedure TFrmCadastroPai.ConhecaObj(pObj: TObject;
  pController: controller);
begin

end;

procedure TFrmCadastroPai.LimparCampos;
begin

end;

procedure TFrmCadastroPai.Sair;
begin
    close;
end;

procedure TFrmCadastroPai.Salvar;
begin
    close;
end;

procedure TFrmCadastroPai.btn_salvarClick(Sender: TObject);
begin
    self.Salvar;
end;

procedure TFrmCadastroPai.btn_sairClick(Sender: TObject);
begin
    self.Sair;
end;

end.
