inherited FrmCadastroUsuario: TFrmCadastroUsuario
  Left = 231
  Top = 164
  Caption = 'M'#243'veis Tr'#234's Lagoas - Usu'#225'rios do sistema'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_pais: TLabel [3]
    Left = 176
    Top = 32
    Width = 48
    Height = 18
    Caption = 'Nome*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lbl__sigla: TLabel [4]
    Left = 176
    Top = 104
    Width = 45
    Height = 18
    Caption = 'Login*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lbl__DDI: TLabel [5]
    Left = 176
    Top = 168
    Width = 51
    Height = 18
    Caption = 'Senha*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lbl_1: TLabel [6]
    Left = 176
    Top = 232
    Width = 36
    Height = 18
    Caption = 'Tipo*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lbl_2: TLabel [7]
    Left = 336
    Top = 248
    Width = 126
    Height = 13
    Caption = '0 - USUARIO COMUM'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_3: TLabel [8]
    Left = 336
    Top = 272
    Width = 124
    Height = 13
    Caption = '1 - ADMINISTRADOR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl1: TLabel [9]
    Left = 272
    Top = 304
    Width = 88
    Height = 18
    Caption = 'Funcion'#225'rio*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  inherited btn_salvar: TButton
    TabOrder = 8
  end
  inherited btn_sair: TButton
    TabOrder = 9
  end
  object edt_nome: TEdit
    Left = 176
    Top = 56
    Width = 273
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
  object edt__login: TEdit
    Left = 176
    Top = 128
    Width = 273
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 20
    ParentFont = False
    TabOrder = 2
  end
  object edt__senha: TEdit
    Left = 168
    Top = 192
    Width = 145
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 20
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 3
  end
  object combo_tipoUsuario: TComboBox
    Left = 176
    Top = 256
    Width = 145
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ItemHeight = 16
    ItemIndex = 0
    ParentFont = False
    TabOrder = 4
    Text = '0'
    Items.Strings = (
      '0'
      '1')
  end
  object edt_codFuncionario: TEdit
    Left = 224
    Top = 328
    Width = 57
    Height = 25
    CharCase = ecUpperCase
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
  end
  object edt_Funcionario: TEdit
    Left = 296
    Top = 328
    Width = 121
    Height = 25
    CharCase = ecUpperCase
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
  end
  object btn_buscar: TButton
    Left = 272
    Top = 368
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 7
    OnClick = btn_buscarClick
  end
end
