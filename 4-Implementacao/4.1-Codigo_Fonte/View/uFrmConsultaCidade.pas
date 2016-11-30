unit uFrmConsultaCidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmConsultaPai, Grids, StdCtrls, uCidade, uFrmCadastroCidade,
  ComCtrls, uController, DBGrids, Buttons, ExtCtrls, QuickRpt, DB,
  DBAccess, MyAccess, uDm, MemDS, QRCtrls;

type
  TFrmConsultaCidade = class(TFrmConsultaPai)
    btn_ordenarCodigo: TButton;
    btn_ordenarNome: TButton;
    btn_limpar: TButton;
    label_1: TLabel;
    procedure btn_SairClick(Sender: TObject);
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_EditarClick(Sender: TObject);
    procedure btn_PesquisarClick(Sender: TObject);
    procedure txt_consultaKeyPress(Sender: TObject; var Key: Char);
    procedure GridKeyPress(Sender: TObject; var Key: Char);
    procedure btn_ExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_ordenarCodigoClick(Sender: TObject);
    procedure btn_ordenarNomeClick(Sender: TObject);
    procedure btn_limparClick(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
  private
    { Private declarations }
    umaCidade: Cidade;
    ordenaCodigo: integer;
    ordenaNome: Integer;
    umController: controller;
    umFrmCadastroCidade : TFrmCadastroCidade;
    umDM: TDataModule1;
  protected
    procedure Inclusao; override;
    procedure Edicao;   override;
    procedure Exclusao; override;
    procedure Sair;     override;
  public
    { Public declarations }
        procedure ConhecaObj(pObj : TObject; pController: controller); override;
        procedure SetFormCad(pObj : TForm); override;
        procedure AjustaDBgrid;
        procedure CarregaDbGrid;
  end;

var
  FrmConsultaCidade: TFrmConsultaCidade;

implementation

{$R *.dfm}

{ TFrmConsultaCidade }


procedure TFrmConsultaCidade.ConhecaObj(pObj: TObject; pController: controller);
begin
    umaCidade := Cidade (pObj);
    umController := pController;
    ordenaCodigo := 0;
    ordenaNome:= 0;
    self.CarregaDbGrid;
end;

procedure TFrmConsultaCidade.CarregaDbGrid;
begin
    self.Grid.DataSource := umController.getControllerCidade.getDsCidade;
 {   self.AjustaDBgrid; }
end;

procedure TFrmConsultaCidade.AjustaDBgrid;
begin
  self.Grid.Columns[0].Width :=  90;
  self.Grid.Columns[1].Width :=  420;
  self.Grid.Columns[2].Width :=  140;
  self.Grid.Columns[3].Width :=  90;
  self.Grid.Columns[0].Title.Caption := 'CÓDIGO';
  self.Grid.Columns[1].Title.Caption := 'NOME DA CIDADE';
  self.Grid.Columns[2].Title.Caption := 'CÓDIGO DO ESTADO';
  self.Grid.Columns[3].Title.Caption := 'DDD';
  self.Grid.TitleFont.Style := [fsBold];
end;

procedure TFrmConsultaCidade.Edicao;
begin
  inherited;
  umController.getControllerCidade.carregaCidade(umaCidade);
  umFrmCadastroCidade.ConhecaObj(umaCidade, umController);
  umFrmCadastroCidade.ShowModal;
end;

procedure TFrmConsultaCidade.Exclusao;
begin
inherited;
     umController.getControllerCidade.carregaCidade(umaCidade);
     umFrmCadastroCidade.btn_salvar.Caption := 'Excluir';
     umFrmCadastroCidade.ConhecaObj(umaCidade,umController);
     umFrmCadastroCidade.ShowModal;
     umFrmCadastroCidade.btn_salvar.Caption := '&Salvar';
     self.umController.getControllerCidade.pesquisaCidade(self.txt_consulta.Text);
end;

procedure TFrmConsultaCidade.Inclusao;
begin
  inherited;
  umaCidade.setCodigo(0);
  umFrmCadastroCidade.ConhecaObj(umaCidade, umController);
  umFrmCadastroCidade.ShowModal;
end;

procedure TFrmConsultaCidade.Sair;
begin
  inherited; 
end;

procedure TFrmConsultaCidade.SetFormCad(pObj: TForm);
begin
  inherited;
  umFrmCadastroCidade := TFrmCadastroCidade (pObj);
end;

procedure TFrmConsultaCidade.btn_SairClick(Sender: TObject);
begin
  inherited;
    self.txt_consulta.Clear;
    if self.btn_Sair.Caption = 'Selecionar' then
      begin
          umController.getControllerCidade.carregaCidade(umaCidade);
      end
    else
        self.umController.getControllerCidade.pesquisaCidade(self.txt_consulta.Text);
end;

procedure TFrmConsultaCidade.btn_NovoClick(Sender: TObject);
begin
  inherited;
    self.txt_consulta.Clear;
    self.umController.getControllerCidade.pesquisaCidade(self.txt_consulta.Text);
    self.AjustaDBgrid;
end;

procedure TFrmConsultaCidade.btn_EditarClick(Sender: TObject);
begin
  inherited;
    self.txt_consulta.Clear;
    self.umController.getControllerCidade.pesquisaCidade(self.txt_consulta.Text);
    self.AjustaDBgrid;
end;

procedure TFrmConsultaCidade.btn_PesquisarClick(Sender: TObject);
begin
  inherited;
    if (self.umController.getControllerCidade.pesquisaCidade(self.txt_consulta.Text) = 'NADA' ) then
    begin
        ShowMessage('Nenhuma cidade encontrada na busca');
        self.txt_consulta.Text := '';
        self.umController.getControllerCidade.pesquisaCidade(self.txt_consulta.Text);
    end;
  self.AjustaDBgrid;
end;

procedure TFrmConsultaCidade.txt_consultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
      if (Key = #13) or (Key = #8) then
      self.btn_Pesquisar.Click;
end;

procedure TFrmConsultaCidade.GridKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
      if Key = #13 then
          self.btn_Editar.Click;
end;


procedure TFrmConsultaCidade.btn_ExcluirClick(Sender: TObject);
begin
  inherited;
  self.AjustaDBgrid;
end;

procedure TFrmConsultaCidade.FormShow(Sender: TObject);
begin
  inherited;
  self.umController.getControllerCidade.pesquisaCidade(self.txt_consulta.Text);
  self.AjustaDBgrid;
end;


procedure TFrmConsultaCidade.btn_ordenarCodigoClick(Sender: TObject);
begin
  inherited;
   if (txt_consulta.Text = '') then
   begin
    if ordenaCodigo = 0 then
       ordenaCodigo := 1
    else
       ordenaCodigo := 0;

      if ordenaCodigo = 0 then
        self.umController.getControllerCidade.pesquisaCidade('ORDENAR CODIGO')
      else
        self.umController.getControllerCidade.pesquisaCidade('ORDENAR CODIGO CONTRARIO');
    end
    else
       self.umController.getControllerCidade.pesquisaCidade(txt_consulta.Text);

    self.AjustaDBgrid;
end;


procedure TFrmConsultaCidade.btn_ordenarNomeClick(Sender: TObject);
begin
  inherited;
   if (txt_consulta.Text = '') then
   begin
    if ordenaNome = 0 then
       ordenaNome := 1
    else
       ordenaNome := 0;

      if ordenaNome = 0 then
        self.umController.getControllerCidade.pesquisaCidade('')
      else
        self.umController.getControllerCidade.pesquisaCidade('ORDENAR NOME CONTRARIO');
    end
    else
       self.umController.getControllerCidade.pesquisaCidade(txt_consulta.Text);

    self.AjustaDBgrid;
end;

procedure TFrmConsultaCidade.btn_limparClick(Sender: TObject);
begin
  inherited;
      txt_consulta.Clear;
      btn_pesquisar.Click;
end;

procedure TFrmConsultaCidade.GridDblClick(Sender: TObject);
begin
  inherited;
      if self.btn_Sair.Caption = 'Selecionar' then
          Self.btn_Sair.Click
      else
          self.btn_Editar.Click;
end;

end.
