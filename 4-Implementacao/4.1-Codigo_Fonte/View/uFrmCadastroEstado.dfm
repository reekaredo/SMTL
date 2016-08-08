inherited FrmCadastroEstado: TFrmCadastroEstado
  Caption = 'M'#243'veis Tr'#234's Lagoas - Cadastro de Estado'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_estado: TLabel [3]
    Left = 192
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
  object lbl_uf: TLabel [4]
    Left = 472
    Top = 32
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
  object lbl_pais: TLabel [5]
    Left = 608
    Top = 32
    Width = 37
    Height = 18
    Caption = 'Pa'#237's*'
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
  object edt_estado: TEdit
    Left = 192
    Top = 56
    Width = 217
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
  object edt_uf: TEdit
    Left = 464
    Top = 56
    Width = 97
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
    OnKeyPress = edt_ufKeyPress
  end
  object edt_pais: TEdit
    Left = 608
    Top = 56
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
    TabOrder = 3
  end
  object edt_descPais: TEdit
    Left = 680
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
    Left = 656
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 5
    OnClick = btn_buscarClick
  end
end
