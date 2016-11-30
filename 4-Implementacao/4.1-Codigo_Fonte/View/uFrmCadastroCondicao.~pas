unit uFrmCadastroCondicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastroPai, StdCtrls, uController, uCondicao, uParcela,
  ComCtrls, Buttons, uFrmConsultaForma, uForma, uColecaoParcelas;

type
  TFrmCadastroCondicao = class(TFrmCadastroPai)
    lbl_pais: TLabel;
    edt_nome: TEdit;
    listView1: TListView;
    label_1: TLabel;
    btn_ok: TButton;
    edt_numero: TEdit;
    label_numero: TLabel;
    label_dias: TLabel;
    edt_dias: TEdit;
    label_percentual: TLabel;
    edt_porcentagem: TEdit;
    label_forma: TLabel;
    edt_codForma: TEdit;
    edt_forma: TEdit;
    btn_buscar: TSpeedButton;
    btn_adicionar: TSpeedButton;
    btn_delete: TSpeedButton;
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure btn_buscarClick(Sender: TObject);
    procedure btn_adicionarClick(Sender: TObject);
    procedure edt_diasKeyPress(Sender: TObject; var Key: Char);
    procedure edt_porcentagemKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_deleteClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_porcentagemExit(Sender: TObject);
    procedure edt_nomeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    umaCondicao : Condicao;
    umFrmConsultaForma: TFrmConsultaForma;
    umaParcela: Parcela;
    umaforma: Forma;
    umController : controller;
    perc: Real;
    dias: Integer;
    salvaCondicao: Boolean;
  protected
    nomeGuardado: string;
    procedure Sair;  override;
    procedure Salvar; override;
    procedure CarregaEdit; override;
//    procedure LimparCampos; override;
    function verificaInteiro(texto: string): Boolean;
    function verificaReal(texto: string): Boolean;
    function validaCampos: Boolean;
    function verificaVirgula(texto: string): boolean;
    function duasCasas(texto: string): string;
  public
    { Public declarations }
    procedure ConhecaObj(pObj : TObject; pController: controller); override;
    procedure SetConsultaForma(pObj: TForm);
    procedure DesabilitaCampos;
    procedure HabilitaCampos;
    procedure MostraCampos;
    procedure EscondeCampos;
    procedure LimparCampos; override;
  end;

var
  FrmCadastroCondicao: TFrmCadastroCondicao;

implementation

{$R *.dfm}

procedure TFrmCadastroCondicao.CarregaEdit;
var k, tam: Integer;
item: TListItem;
begin
 // LimparCampos;
  self.edt_cod.Text := IntToStr(umaCondicao.getCodigo);
  self.edt_nome.Text := umaCondicao.getNome;
  tam := umaCondicao.getListaParcelas.getQtd;
  edt_numero.Text := IntToStr(tam + 1);
  if tam > 0 then
      begin
      edt_dias.Text :=  IntToStr(umaCondicao.getListaParcelas.getObj(tam).getDias + 30);
      dias := umaCondicao.getListaParcelas.getObj(tam).getDias;
      end;

    For k:=1 to tam do
      begin
            item := listView1.Items.Add;

            item.Caption := IntToStr(umaCondicao.getListaParcelas.getObj(k).getCondicao);
            item.SubItems.Add(IntToStr(umaCondicao.getListaParcelas.getObj(k).getNumero));
            item.SubItems.Add(IntToStr(umaCondicao.getListaParcelas.getObj(k).getDias));
            item.SubItems.Add(FloatToStr(umaCondicao.getListaParcelas.getObj(k).getPercentual));
            perc := perc + umaCondicao.getListaParcelas.getObj(k).getPercentual;
            item.SubItems.Add(IntToStr(umaCondicao.getListaParcelas.getObj(k).getForma.getCodigo));
            item.SubItems.Add(umaCondicao.getListaParcelas.getObj(k).getForma.getNome);
      end;
end;

procedure TFrmCadastroCondicao.ConhecaObj(pObj: TObject;
  pController: controller);
begin
  inherited;
  umaCondicao := Condicao (pObj);
  umaforma := forma.crieobj;
  umController := pController;
  umaParcela:= Parcela.crieobj;
  perc:= 0;
  dias := 0;
  self.LimparCampos;
    if umaCondicao.getCodigo <> 0 then
        begin
            nomeGuardado := umaCondicao.getNome;
            Self.CarregaEdit;
        end;

    if self.btn_salvar.Caption = '&Salvar' then
      HabilitaCampos
    else
      DesabilitaCampos;
end;

procedure TFrmCadastroCondicao.DesabilitaCampos;
begin
  self.edt_nome.Enabled := False;
  self.edt_numero.Enabled := False;
  self.edt_dias.Enabled := False;
  self.edt_porcentagem.Enabled := False;
  Self.edt_codForma.Enabled := False;
  self.edt_forma.Enabled := False;
  self.btn_buscar.Enabled := False;
  self.btn_adicionar.Enabled := False;
end;

procedure TFrmCadastroCondicao.HabilitaCampos;
begin
  self.edt_nome.Enabled := True;
  self.edt_dias.Enabled := True;
  self.edt_porcentagem.Enabled := True;
  self.btn_buscar.Enabled := True;
  self.btn_adicionar.Enabled := True;
end;

procedure TFrmCadastroCondicao.LimparCampos;
var k: Integer;
begin
  self.nomeGuardado:= '';
  self.edt_nome.Clear;
  self.edt_numero.Text := '1';
  self.edt_dias.Clear;
  self.edt_porcentagem.Clear;
  Self.edt_codForma.Clear;
  self.edt_forma.Clear;
  if self.listView1.Items.Count > 0 then
      begin
        listView1.Clear;
        for k:= self.listView1.Items.Count - 1 downto 0 do
            begin
               self.listView1.Items.Clear;
            end; 
        end;
  self.dias := 0;
end;

procedure TFrmCadastroCondicao.Sair;
begin
  inherited;

end;

procedure TFrmCadastroCondicao.Salvar;
var incluido, excluido, permitir : string;
selected, tam, k : integer;
men : TForm;
begin
      if (self.btn_salvar.Caption = '&Salvar') and (salvaCondicao = True) then
        begin
              if (self.edt_nome.Text  = '') then
              begin
                 ShowMessage('Preencha o nome da condição de pagamento');
                 self.edt_nome.SetFocus;
              end
            else
                begin
                    umaCondicao.setNome(self.edt_nome.Text);
                       permitir := umcontroller.getControllerCondicao.pesquisaSalvar(umaCondicao.getNome);
                        if (permitir = 'OK') or ( (permitir = 'EXISTE') and (nomeGuardado = umaCondicao.getNome)  ) then
                          begin
                              incluido := umController.getControllerCondicao.salvaCondicao(umaCondicao);
                                 if incluido = 'OK' then
                                    if umaCondicao.getCodigo = 0 then
                                      ShowMessage(umaCondicao.getNome + ' incluído com sucesso!')
                                    else
                                      ShowMessage(umaCondicao.getNome + ' alterado com sucesso!');
                           umController.getControllerCondicao.carregaCondicao(umaCondicao);
                           self.edt_cod.Text := IntToStr(umaCondicao.getCodigo);
                           self.MostraCampos;
                           btn_salvar.Visible := True;
                          end
                          else
                            begin
                               ShowMessage('Condição já cadastrada');
                               self.edt_nome.SetFocus;
                            end;
                 //   inherited;
                end;
        end
        else if (self.btn_salvar.Caption = 'Excluir') and (salvaCondicao = False) then
            begin
               men := CreateMessageDialog('Deseja excluir a condição de pgto ' + QuotedStr(umaCondicao.getNome) + '?',mtCustom,[mbYes,mbAbort]);
               men.Caption := 'Confirmação';
               men.Position := poDesktopCenter;
               selected := men.ShowModal;


               //aqui tratar a exclusão
                if selected = mrYes then
                  begin
                     permitir := umController.getControllerCondicao.pesquisaDependencia(umaCondicao.getCodigo);
                        if permitir = 'OK' then
                          begin
                            tam := umaCondicao.getListaParcelas.getQtd;
                             For k:= 1 to tam do
                               begin
                                  excluido := umController.getControllerParcela.excluiParcela(umaCondicao.getListaParcelas.getObj(k));
                               end;

                            excluido :=  umController.getControllerCondicao.excluiCondicao(umaCondicao);
                            ShowMessage(QuotedStr(umaCondicao.getNome) + ' excluído com sucesso!')
                          end
                        else if permitir = 'CLIENTE' then
                            ShowMessage('Não foi possível excluir a condição! Há clientes vinculados a ela')
                        else if permitir = 'FORNECEDOR' then
                            ShowMessage('Não foi possível excluir a condição! Há fornecedores vinculados a ela')
                        else if permitir = 'COMPRA' then
                            ShowMessage('Não foi possível excluir a condição! Há compras vinculadas a ela');

                  inherited;
                  end;
            end;
end;

procedure TFrmCadastroCondicao.btn_salvarClick(Sender: TObject);
var k, tam, parcelas: Integer;
parcelaA, parcelaB: Parcela;
begin
  // inherited; antes salvava a condição, agora não.
  // vai salvar as parcelas
  if self.btn_salvar.Caption = 'Excluir' then
     begin
        salvaCondicao := False;
        inherited;
     end
  else
  begin
  if perc < 100 then
      begin
        ShowMessage('Complete as parcelas primeiro');
      end
  else
      begin
        tam := umaCondicao.getlistaParcelas.getQtd;
        parcelas := umController.getControllerParcela.pesquisaParcela(IntToStr(umaCondicao.getCodigo));
        if parcelas <> 0 then
          begin
              for k:=1 to parcelas do
              begin
                 parcelaB := Parcela.crieobj;
                 parcelaB.setCondicao(umaCondicao.getCodigo);
                 parcelaB.setNumero(k);
              {   parcelaB.setCode(IntToStr(umaCondicao.getCodigo) + IntToStr(k));  }
                 umController.getControllerParcela.excluiParcela(parcelaB);
              end;
          end;

          for k:= 1 to tam do
              begin
                parcelaA := umacondicao.getlistaparcelas.getObj(k);
                umController.getControllerParcela.salvaParcela(parcelaA);
              end;
          ShowMessage('Salvo com sucesso!');
          umaCondicao.ListaParcelas.destrua_se;
          umaCondicao.ListaParcelas := ColecaoParcela.CrieObjeto;
          Close;  
      end;
  end;
end;

procedure TFrmCadastroCondicao.btn_okClick(Sender: TObject);
begin
  salvaCondicao := True;
  Self.Salvar;
end;

procedure TFrmCadastroCondicao.SetConsultaForma(pObj: TForm);
begin
    umFrmConsultaForma := TFrmConsultaForma(pObj);
end;

procedure TFrmCadastroCondicao.btn_buscarClick(Sender: TObject);
begin
  umFrmConsultaForma.ConhecaObj(umaforma, umController);
  umFrmConsultaForma.btn_Sair.Caption := 'Selecionar';
  umFrmConsultaForma.ShowModal;
  self.edt_codForma.Text := InttoStr(umaForma.getCodigo);
  self.edt_forma.Text := umaForma.getNome;
  umFrmConsultaForma.btn_Sair.Caption := 'Sair';
end;

procedure TFrmCadastroCondicao.btn_adicionarClick(Sender: TObject);
var item : TListItem;
aux: Integer;
percent1: real;
aux2: string;
begin
// adicionando uma parcela
  if validaCampos = True then
      begin
        umaParcela := Parcela.crieobj;
       if (perc < 100) and (perc + StrToFloat(edt_porcentagem.Text) > 100) then
            begin
              ShowMessage('O percentual não pode ultrapassar 100%!');
              edt_porcentagem.Text := FloatToStr(100 - perc);
              edt_porcentagem.SetFocus;
            end
       else if (StrToInt(edt_dias.Text) <= dias) and (listView1.Items.Count <> 0) then
              begin
                 ShowMessage('O prazo deve ser maior que o anterior!');
                 edt_dias.SetFocus;
              end
       else if (perc < 100) and (perc + StrToFloat(edt_porcentagem.Text) <= 100) then
       begin
            umaParcela.setCondicao(StrToInt(edt_cod.text));
            umaParcela.setNumero(StrToInt(edt_numero.Text));
            umaParcela.setDias(StrToInt(edt_dias.Text));
            percent1 := StrToFloat(edt_porcentagem.Text);
            aux2:= FloatToStrF(percent1,ffnumber,12,2);
            umaParcela.setPercentual(StrtoFloat(aux2));

          //  umaParcela.setPercentual(StrToFloat(edt_porcentagem.Text));
            umaParcela.getForma.setCodigo(StrToInt(edt_codForma.Text));
            umaParcela.setCode(edt_cod.Text + edt_numero.Text);

            item := listView1.Items.Add;
            item.Caption := edt_cod.Text;
            item.SubItems.Add(edt_numero.Text);
            item.SubItems.Add(edt_dias.Text);
            item.SubItems.Add(aux2 + '%');
            item.SubItems.Add(edt_codForma.Text);
            item.SubItems.Add(edt_forma.Text);

            umaCondicao.getListaParcelas.inserefim(umaParcela);
            aux:= StrToInt(edt_numero.Text) + 1;
            edt_numero.Text := IntToStr(aux);
            if ((100 - umaParcela.getPercentual) >= 0) then
              begin
                perc := perc + umaParcela.getPercentual;
                edt_porcentagem.Text := FloatToStr(100 - perc);
              end;
            dias := StrToInt(edt_dias.Text);
            edt_dias.Text := IntToStr(dias + 30);
           end
       else if (perc = 100) then
          begin
              ShowMessage('O percentual já atingiu 100%!');
          end;
      end;
end;

procedure TFrmCadastroCondicao.edt_diasKeyPress(Sender: TObject;
  var Key: Char);
begin
      if not (Key in ['0'..'9',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas números!');
          Key := #0;
      end;
end;

procedure TFrmCadastroCondicao.edt_porcentagemKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9',',',#16,#8,#9,#13,#20,#36,#37,#46,#107] ) or
     (Key in ['K','k']) then
      begin
          ShowMessage('Apenas números e vírgula!');
          Key := #0;
      end;
end;

function TFrmCadastroCondicao.verificaInteiro(texto: string): Boolean;
begin
    try
      StrToInt(texto);
      Result := True;
    except
      Result:= False;
    end;
end;

function TFrmCadastroCondicao.verificaReal(texto: string): Boolean;
begin
    try
       StrToFloat(texto);
       Result := True;
    except
       Result := False;
    end;
end;

function TFrmCadastroCondicao.validaCampos: Boolean;
begin
  Result := False;
    if Self.edt_dias.Text = '' then
        begin
          ShowMessage('Preencha o prazo da parcela!');
          edt_dias.SetFocus;
        end
    else if edt_porcentagem.Text = '' then
        begin
          ShowMessage('Preencha a porcentagem!');
          edt_porcentagem.SetFocus;
        end
    else if edt_forma.Text = '' then
        begin
          ShowMessage('Escolha uma forma de pagamento');
          btn_buscar.Click;
        end
    else if (verificaInteiro(edt_dias.Text) = False) then
        begin
          ShowMessage('Apenas números são permitidos no campo prazo!');
          edt_dias.SetFocus;
        end
    else if (verificaReal(edt_porcentagem.Text) = False) then
        begin
          ShowMessage('Valor digitado no percentual é inválido!' + #13 + 'Formato: 0,00 ou números inteiros');
          edt_porcentagem.SetFocus;
        end
    else
      begin
        if (StrToFloat(edt_porcentagem.Text) <= 0) then
            begin
              ShowMessage('A porcentagem deve ser maior do que Zero!');
              Exit;
            end;
        Result := True;
      end;
end;

procedure TFrmCadastroCondicao.EscondeCampos;
begin
   label_numero.Visible:= False;
   label_dias.Visible:= False;
   label_percentual.Visible:= False;
   label_forma.Visible:= False;
   edt_numero.Visible:= False;
   edt_dias.Visible:= False;
   edt_porcentagem.Visible:= False;
   edt_codForma.Visible:= False;
   edt_forma.Visible:= False;
   btn_buscar.Visible:= False;
   btn_adicionar.Visible:= False;
   listView1.Visible := False;
   btn_delete.Visible := False;
end;

procedure TFrmCadastroCondicao.MostraCampos;
begin
   label_numero.Visible:= True;
   label_dias.Visible:= True;
   label_percentual.Visible:= True;
   label_forma.Visible:= True;
   edt_numero.Visible:= True;
   edt_dias.Visible:= True;
   edt_porcentagem.Visible:= True;
   edt_codForma.Visible:= True;
   edt_forma.Visible:= True;
   btn_buscar.Visible:= True;
   btn_adicionar.Visible:= True;
   listView1.Visible:= True;
   btn_delete.Visible := True;
end;

procedure TFrmCadastroCondicao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if (self.listView1.Items.Count <= 0) and (edt_cod.Text <> '') and (perc < 100) and (self.btn_salvar.Caption = '&Salvar') then
    begin
      Action := caNone;
      btn_salvar.Click;
    end
  else
    begin            
      LimparCampos;
      umaCondicao := Condicao.crieobj;
      btn_salvar.Visible := False;
    end;
end;

procedure TFrmCadastroCondicao.btn_deleteClick(Sender: TObject);
var parc: Parcela;
begin
  inherited;
  if listView1.Selected <> nil then
      begin
//        parc := Parcela.crieobj;
        if (listView1.Selected.Index = listView1.Items.Count - 1) { and (listView1.ItemFocused.Index > 0) } then
            begin

              parc := umaCondicao.getListaParcelas.getObj(listView1.Selected.Index + 1);
              dias := umaCondicao.getListaParcelas.getObj(listView1.Selected.Index).getDias;
              perc := perc - parc.getPercentual;
              if listView1.ItemFocused.Index = 0 then
                  perc := 0;

              umaCondicao.getListaParcelas.remove(parc,listView1.ItemFocused.Index + 1);
              if listView1.ItemFocused.Index = 0 then
                  edt_numero.Text := '1'
              else
                  edt_numero.Text := IntToStr(parc.getNumero);
              edt_dias.Text := IntToStr(parc.getDias);

              listView1.ItemFocused.Delete;
              edt_porcentagem.Text := floattostr(100 - perc);
              umController.getControllerParcela.excluiParcela(parc);
            end
        else
            ShowMessage('Você só pode remover a última parcela!');
      end;
end;

procedure TFrmCadastroCondicao.btn_sairClick(Sender: TObject);
begin
 {   if perc < 100 then
      begin
        ShowMessage('Complete as parcelas antes de sair!');
        edt_dias.SetFocus;
      end
    else
        self.btn_salvar.Click;    }
    inherited;
end;

procedure TFrmCadastroCondicao.edt_porcentagemExit(Sender: TObject);
var aux : real;
begin
  inherited;
  if verificaReal(edt_porcentagem.Text) then
  begin
    if not verificaVirgula(edt_porcentagem.Text) then
       begin
         aux := strtofloat(edt_porcentagem.Text);
         edt_porcentagem.Text := floattostr(aux) + ',00';
       end;
     if strtofloat(edt_porcentagem.Text) > 100 then
     edt_porcentagem.Text := '100,00';

     if strtofloat(edt_porcentagem.Text) < 0 then
     edt_porcentagem.Text := '0,00';
  end
  else if not (verificaReal(edt_porcentagem.Text)) and (edt_porcentagem.Text <> '') then
    begin
     ShowMessage('Apenas números e vírgula - Formato: o,oo ');
     edt_porcentagem.Text := '0,00';
     edt_porcentagem.SetFocus;
    end
  else
     edt_porcentagem.Text := '0,00';

  edt_porcentagem.Text := duasCasas(edt_porcentagem.Text);
end;

function TFrmCadastroCondicao.verificaVirgula(texto: string): boolean;
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

procedure TFrmCadastroCondicao.edt_nomeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
      if (Key = #13) then
      self.btn_ok.Click;
end;

function TFrmCadastroCondicao.duasCasas(texto: string): string;
var numero: real;
texto2: string;
begin
  numero := strtofloat(texto);
  texto2 := FloatToStrF(numero,ffnumber,12,2);
  result := StringReplace(texto2,'.','',[rfReplaceAll]);
end;

end.
