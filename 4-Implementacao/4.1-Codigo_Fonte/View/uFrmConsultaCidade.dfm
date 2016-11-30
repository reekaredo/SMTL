inherited FrmConsultaCidade: TFrmConsultaCidade
  Left = 242
  Top = 199
  Caption = 'M'#243'veis Tr'#234's Lagoas - Consultar Cidades'
  ClientWidth = 989
  OldCreateOrder = True
  Scaled = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited btn_pesquisar: TSpeedButton
    OnClick = btn_PesquisarClick
  end
  object label_1: TLabel [1]
    Left = 72
    Top = 40
    Width = 128
    Height = 13
    Caption = 'Nome ou c'#243'digo da cidade'
  end
  inherited txt_consulta: TEdit
    OnKeyPress = txt_consultaKeyPress
  end
  inherited Grid: TDBGrid
    OnDblClick = GridDblClick
    OnKeyPress = GridKeyPress
  end
  object btn_ordenarCodigo: TButton
    Left = 136
    Top = 67
    Width = 25
    Height = 15
    Caption = 'Ord'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = btn_ordenarCodigoClick
  end
  object btn_ordenarNome: TButton
    Left = 360
    Top = 67
    Width = 25
    Height = 15
    Caption = 'Ord'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = btn_ordenarNomeClick
  end
  object btn_limpar: TButton
    Left = 286
    Top = 40
    Width = 50
    Height = 18
    Caption = 'Limpar'
    TabOrder = 8
    OnClick = btn_limparClick
  end
end
