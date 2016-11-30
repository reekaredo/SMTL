unit uFrmCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uController, StdCtrls, uForma, Buttons;

type
  TFrmCaixa = class(TForm)
    Label1: TLabel;
    edt_saldo: TEdit;
    lbl_campos: TLabel;
    btn_retirar: TBitBtn;
    btn_adicionar: TBitBtn;
    btn_sair: TButton;
    Label2: TLabel;
    Label3: TLabel;
    lbl_valor: TLabel;
    procedure edt_saldoExit(Sender: TObject);
    procedure edt_saldoKeyPress(Sender: TObject; var Key: Char);
    procedure btn_adicionarClick(Sender: TObject);
    procedure btn_retirarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
  private
    { Private declarations }
    umController: Controller;
    valorGuardado: real;
    umaForma: Forma;
  public
    { Public declarations }
        procedure ConhecaObj(pController: controller);
        function verificaReal(texto: string): Boolean;
        function verificaVirgula(texto: string): boolean;
        function duasCasas(texto: string): string;
  end;

var
  FrmCaixa: TFrmCaixa;

implementation

{$R *.dfm}

{ TFrmCaixa }

procedure TFrmCaixa.ConhecaObj(pController: controller);
begin
  umController := pController;
  umaForma := Forma.crieobj;
  lbl_valor.Caption := floattostr(umController.getControllerCaixa.carregarCaixa);
  valorGuardado := umController.getControllerCaixa.carregarCaixa;
end;

function TFrmCaixa.duasCasas(texto: string): string;
var numero: real;
texto2: string;
begin
  numero := strtofloat(texto);
  texto2 := FloatToStrF(numero,ffnumber,12,2);
  result := StringReplace(texto2,'.','',[rfReplaceAll]);
end;

procedure TFrmCaixa.edt_saldoExit(Sender: TObject);
var aux : real;
begin
  inherited;
  if verificaReal(edt_saldo.Text) then
  begin
    if not verificaVirgula(edt_saldo.Text) then
       begin
         aux := strtofloat(edt_saldo.Text);
         edt_saldo.Text := floattostr(aux) + ',00';
       end;
           
     if strtofloat(edt_saldo.Text) < 0 then
     edt_saldo.Text := '0,00';
  end
  else if not (verificaReal(edt_saldo.Text)) and (edt_saldo.Text <> '') then
    begin
     ShowMessage('Apenas números e vírgula - Formato: o,oo ');
     edt_saldo.Text := '0,00';
     edt_saldo.SetFocus;
    end
  else
     edt_saldo.Text := '0,00';

  edt_saldo.Text := duasCasas(edt_saldo.Text);
end;

function TFrmCaixa.verificaReal(texto: string): Boolean;
begin
    try
       StrToFloat(texto);
       Result := True;
    except
       Result := False;
    end;
end;

function TFrmCaixa.verificaVirgula(texto: string): boolean;
var k: integer;
begin
   result := false;
      for k := 1 to length(texto) do
        begin
           if texto[k] = ',' then
             begin
               Result := true;
               exit;
             end;
        end;
end;

procedure TFrmCaixa.edt_saldoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9',',',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas números e vírgula!');
          Key := #0;
      end;
end;

procedure TFrmCaixa.btn_adicionarClick(Sender: TObject);
var valor1: real;
begin
   if edt_saldo.Text = '' then
     begin
        ShowMessage('Digite o valor a ser inserido ou retirado!');
        edt_saldo.SetFocus;
     end
   else
     begin
            valor1 := valorGuardado + strtofloat(edt_saldo.Text);
            umaForma.setCodigo(2);
            umaForma.setNome('CAIXA LOCAL');
            umaForma.setSaldo(valor1);

             if umController.getControllerCaixa.PesquisaCaixaAberto = true then
               begin
                 umController.getControllerCaixa.SalvarCaixa(valor1,1);
                 umController.getControllerForma.salvaForma(umaForma);
                 umController.getControllerFluxo.SalvarFluxo('SUPRIMENTO',strtofloat(edt_saldo.Text));
                 ShowMessage('Caixa alterado com sucesso!');
               end
             else
               begin
                 umController.getControllerCaixa.SalvarCaixa(valor1,0);
                 umController.getControllerForma.salvaForma(umaForma);
                 umController.getControllerFluxo.SalvarFluxo('ABERTURA',strtofloat(edt_saldo.Text));
                 ShowMessage('Caixa aberto com sucesso!');
               end;
             close;
     end;
end;

procedure TFrmCaixa.btn_retirarClick(Sender: TObject);
var valor1: real;
begin
   if edt_saldo.Text = '' then
     begin
        ShowMessage('Digite o valor a ser inserido ou retirado!');
        edt_saldo.SetFocus;
     end
   else
     begin
         if strtofloat(edt_saldo.Text) > valorGuardado then
           begin
             ShowMessage('Você não pode retirar mais do que o valor de caixa!');
             edt_saldo.Text := floattostr(valorGuardado);
             edt_saldo.SetFocus;
           end
         else
          begin
          valor1 := valorGuardado - strtofloat(edt_saldo.Text);
          umaForma.setCodigo(2);
          umaForma.setNome('CAIXA LOCAL');
          umaForma.setSaldo(valor1);

           if umController.getControllerCaixa.PesquisaCaixaAberto = true then
             begin
               umController.getControllerCaixa.SalvarCaixa(valor1,1);
               umController.getControllerForma.salvaForma(umaForma);
               umController.getControllerFluxo.SalvarFluxo('SANGRIA',strtofloat(edt_saldo.Text));
               ShowMessage('Caixa alterado com sucesso!');
               close;
             end
           else
             begin
                ShowMessage('Você ainda não abriu o caixa! Adicione dinheiro!');
             end;
          end;
     end;
end;

procedure TFrmCaixa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  edt_saldo.Clear;
  lbl_valor.Caption := '';
end;

procedure TFrmCaixa.btn_sairClick(Sender: TObject);
begin
   close;
end;

end.
