object FrmCaixa: TFrmCaixa
  Left = 619
  Top = 236
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Abrir Caixa'
  ClientHeight = 317
  ClientWidth = 281
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 32
    Width = 98
    Height = 18
    Caption = 'Digite o valor*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lbl_campos: TLabel
    Left = 120
    Top = 104
    Width = 111
    Height = 14
    Caption = '* Campos obrigat'#243'rios'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS arial'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 232
    Width = 87
    Height = 13
    Caption = 'Dinheiro em caixa:'
  end
  object Label3: TLabel
    Left = 16
    Top = 264
    Width = 39
    Height = 31
    Caption = 'R$'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -27
    Font.Name = 'Georgia'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_valor: TLabel
    Left = 59
    Top = 264
    Width = 7
    Height = 31
    Caption = ' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -27
    Font.Name = 'Georgia'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edt_saldo: TEdit
    Left = 40
    Top = 56
    Width = 201
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 40
    ParentFont = False
    TabOrder = 0
    OnExit = edt_saldoExit
    OnKeyPress = edt_saldoKeyPress
  end
  object btn_retirar: TBitBtn
    Left = 40
    Top = 152
    Width = 97
    Height = 49
    Cancel = True
    Caption = 'Retirar dinheiro'
    TabOrder = 1
    OnClick = btn_retirarClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333FFFFF333333000033333388888833333333333F888888FFF333
      000033338811111188333333338833FFF388FF33000033381119999111833333
      38F338888F338FF30000339119933331111833338F388333383338F300003391
      13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
      33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
      33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
      000039183811193333918338F8F833F83333838F000039118111933339118338
      F3833F83333833830000339111193333391833338F33F8333FF838F300003391
      11833338111833338F338FFFF883F83300003339111888811183333338FF3888
      83FF83330000333399111111993333333388FFFFFF8833330000333333999999
      3333333333338888883333330000333333333333333333333333333333333333
      0000}
    Layout = blGlyphTop
    NumGlyphs = 2
  end
  object btn_adicionar: TBitBtn
    Left = 144
    Top = 152
    Width = 97
    Height = 49
    Caption = 'Adicionar dinheiro'
    TabOrder = 2
    OnClick = btn_adicionarClick
    Glyph.Data = {
      F2010000424DF201000000000000760000002800000024000000130000000100
      0400000000007C01000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
      3333333333388F3333333333000033334224333333333333338338F333333333
      0000333422224333333333333833338F33333333000033422222243333333333
      83333338F3333333000034222A22224333333338F33F33338F33333300003222
      A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
      38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
      2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
      0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
      333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
      33333A2224A2233333333338F338F83300003333333333A2224A333333333333
      8F338F33000033333333333A222433333333333338F338F30000333333333333
      A224333333333333338F38F300003333333333333A223333333333333338F8F3
      000033333333333333A3333333333333333383330000}
    Layout = blGlyphTop
    NumGlyphs = 2
  end
  object btn_sair: TButton
    Left = 198
    Top = 282
    Width = 75
    Height = 25
    Caption = 'Sa&ir'
    TabOrder = 3
    OnClick = btn_sairClick
  end
end
