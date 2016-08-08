inherited FrmCadastroCidade: TFrmCadastroCidade
  Left = 251
  Top = 214
  Caption = 'M'#243'veis Tr'#234's Lagoas - Cadastro de cidade'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_cidade: TLabel [3]
    Left = 192
    Top = 32
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
  object lbl_ddd: TLabel [4]
    Left = 472
    Top = 32
    Width = 42
    Height = 18
    Caption = 'DDD*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lbl_estado: TLabel [5]
    Left = 640
    Top = 32
    Width = 56
    Height = 18
    Caption = 'Estado*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  inherited btn_salvar: TButton
    TabOrder = 6
  end
  inherited btn_sair: TButton
    TabOrder = 7
  end
  object edt_cidade: TEdit
    Left = 192
    Top = 56
    Width = 241
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 1
  end
  object edt_ddd: TEdit
    Left = 472
    Top = 56
    Width = 105
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 3
    ParentFont = False
    TabOrder = 2
    OnKeyPress = edt_dddKeyPress
  end
  object edt_CodEstado: TEdit
    Left = 640
    Top = 56
    Width = 65
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
    TabOrder = 3
  end
  object edt_estado: TEdit
    Left = 720
    Top = 56
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
    TabOrder = 4
  end
  object btn_buscar: TButton
    Left = 696
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 5
    OnClick = btn_buscarClick
  end
end
