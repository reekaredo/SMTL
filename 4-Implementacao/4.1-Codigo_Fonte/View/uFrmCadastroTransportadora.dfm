inherited FrmCadastroTransportadora: TFrmCadastroTransportadora
  Left = 146
  Top = 37
  Width = 963
  Height = 538
  Caption = 'Cadastro de Transportadoras'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_nome: TLabel [3]
    Left = 176
    Top = 32
    Width = 145
    Height = 18
    Caption = 'Nome/Raz'#227'o Social*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lbl_fone2: TLabel [4]
    Left = 416
    Top = 328
    Width = 27
    Height = 18
    Caption = 'UF*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lbl_email: TLabel [5]
    Left = 432
    Top = 216
    Width = 75
    Height = 18
    Caption = 'UF Ve'#237'culo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lbl1: TLabel [6]
    Left = 176
    Top = 120
    Width = 95
    Height = 18
    Caption = 'Codigo ANTT'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object label_bairro: TLabel [7]
    Left = 696
    Top = 216
    Width = 94
    Height = 18
    Caption = 'Placa Ve'#237'culo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object label_logradouro: TLabel [8]
    Left = 464
    Top = 120
    Width = 68
    Height = 18
    Caption = 'Endere'#231'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lbl_fone1: TLabel [9]
    Left = 40
    Top = 120
    Width = 36
    Height = 18
    Caption = 'Fone'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lbl_cidade: TLabel [10]
    Left = 232
    Top = 328
    Width = 58
    Height = 18
    Caption = 'Cidade*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object label_cpf: TLabel [11]
    Left = 40
    Top = 216
    Width = 48
    Height = 18
    Caption = 'CNPJ*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object label_RG: TLabel [12]
    Left = 216
    Top = 216
    Width = 72
    Height = 18
    Caption = 'INSC EST'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  inherited btn_salvar: TButton
    Top = 424
  end
  inherited btn_sair: TButton
    Top = 424
  end
  object edt_nome: TEdit
    Left = 176
    Top = 56
    Width = 721
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 3
  end
  object edt_veiculoUF: TEdit
    Left = 413
    Top = 240
    Width = 227
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 4
  end
  object edt_antt: TEdit
    Left = 176
    Top = 144
    Width = 265
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 5
  end
  object edt_endereco: TEdit
    Left = 464
    Top = 144
    Width = 433
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 6
  end
  object edt_placa: TEdit
    Left = 677
    Top = 240
    Width = 223
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 7
  end
  object edt_fone1: TMaskEdit
    Left = 40
    Top = 144
    Width = 109
    Height = 24
    EditMask = '!\(00\)0000-0000;0; '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 13
    ParentFont = False
    TabOrder = 8
  end
  object edt_codCidade: TEdit
    Left = 176
    Top = 352
    Width = 49
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
    TabOrder = 9
  end
  object edt_cidade: TEdit
    Left = 232
    Top = 352
    Width = 137
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
    TabOrder = 10
  end
  object btn_buscar: TButton
    Left = 232
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 11
    OnClick = btn_buscarClick
  end
  object edt_cnpj: TMaskEdit
    Left = 40
    Top = 240
    Width = 151
    Height = 24
    CharCase = ecUpperCase
    EditMask = '!99.999.999/9999-99;0;'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 18
    ParentFont = False
    TabOrder = 12
  end
  object edt_insc: TEdit
    Left = 216
    Top = 240
    Width = 161
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 20
    ParentFont = False
    TabOrder = 13
  end
  object btn_habilitar: TButton
    Left = 512
    Top = 420
    Width = 75
    Height = 25
    Caption = '&Abrir edi'#231#227'o'
    TabOrder = 14
    OnClick = btn_habilitarClick
  end
  object edt_UF: TEdit
    Left = 408
    Top = 352
    Width = 97
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    TabOrder = 15
  end
end
