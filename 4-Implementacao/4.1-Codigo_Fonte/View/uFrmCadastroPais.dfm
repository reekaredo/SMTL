inherited FrmCadastroPais: TFrmCadastroPais
  Left = 339
  Top = 176
  Caption = 'M'#243'veis Tr'#234's Lagoas - Cadastro de pa'#237's'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_pais: TLabel [3]
    Left = 176
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
  object lbl__sigla: TLabel [4]
    Left = 480
    Top = 32
    Width = 42
    Height = 18
    Caption = 'Sigla*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lbl__DDI: TLabel [5]
    Left = 592
    Top = 32
    Width = 27
    Height = 18
    Caption = 'DDI'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lbl1: TLabel [6]
    Left = 592
    Top = 56
    Width = 9
    Height = 19
    Caption = '+'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited edt_cod: TEdit
    Top = 53
  end
  inherited btn_salvar: TButton
    TabOrder = 4
  end
  inherited btn_sair: TButton
    TabOrder = 5
  end
  object edt_pais: TEdit
    Left = 176
    Top = 53
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
  object edt__sigla: TEdit
    Left = 476
    Top = 53
    Width = 73
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 3
    ParentFont = False
    TabOrder = 2
    OnKeyPress = edt__siglaKeyPress
  end
  object edt__ddi: TEdit
    Left = 604
    Top = 53
    Width = 109
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    TabOrder = 3
    OnKeyPress = edt__ddiKeyPress
  end
end
