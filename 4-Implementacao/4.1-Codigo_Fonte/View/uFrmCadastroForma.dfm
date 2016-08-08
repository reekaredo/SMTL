inherited FrmCadastroForma: TFrmCadastroForma
  Left = 230
  Top = 169
  Caption = 'M'#243'veis Tr'#234's Lagoas - Cadastro de forma de pagamento'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_pais: TLabel [3]
    Left = 224
    Top = 32
    Width = 157
    Height = 18
    Caption = 'Forma de pagamento*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  inherited btn_salvar: TButton
    TabOrder = 2
  end
  inherited btn_sair: TButton
    TabOrder = 3
  end
  object edt_nome: TEdit
    Left = 224
    Top = 56
    Width = 385
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 40
    ParentFont = False
    TabOrder = 1
  end
end
