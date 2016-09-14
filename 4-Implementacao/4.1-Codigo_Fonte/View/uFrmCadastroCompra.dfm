inherited FrmCadastroCompra: TFrmCadastroCompra
  Top = 38
  Width = 1176
  Height = 788
  Caption = 'Nova compra'
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Shape3: TShape [0]
    Left = 48
    Top = 274
    Width = 1057
    Height = 111
    Brush.Style = bsClear
    Pen.Color = clGray
  end
  object Shape4: TShape [1]
    Left = 48
    Top = 424
    Width = 1057
    Height = 225
    Brush.Style = bsClear
    Pen.Color = clGray
  end
  object Shape2: TShape [2]
    Left = 48
    Top = 128
    Width = 1057
    Height = 113
    Brush.Style = bsClear
    Pen.Color = clGray
  end
  object Shape1: TShape [3]
    Left = 192
    Top = 24
    Width = 913
    Height = 65
    Brush.Style = bsClear
    Pen.Color = clGray
  end
  inherited lbl__cod: TLabel
    Left = 48
    Top = 16
    Width = 40
    Height = 16
    Font.Height = -13
  end
  inherited lbl_gerado: TLabel
    Left = 32
    Top = 72
  end
  inherited lbl_campos: TLabel
    Left = 64
    Top = 696
  end
  object Label2: TLabel [7]
    Left = 464
    Top = 672
    Width = 147
    Height = 16
    Caption = 'Condi'#231#227'o de Pagamento*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel [8]
    Left = 304
    Top = 432
    Width = 56
    Height = 16
    Caption = 'NCM/SH*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel [9]
    Left = 376
    Top = 432
    Width = 30
    Height = 16
    Caption = 'CST*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel [10]
    Left = 568
    Top = 432
    Width = 65
    Height = 16
    Caption = 'Valor Unit.*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object btn_add: TSpeedButton [11]
    Left = 1040
    Top = 448
    Width = 21
    Height = 21
    Caption = '+'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    OnClick = btn_addClick
  end
  object btn_remove: TSpeedButton [12]
    Left = 1072
    Top = 448
    Width = 21
    Height = 21
    Caption = '-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel [13]
    Left = 104
    Top = 432
    Width = 50
    Height = 16
    Caption = 'Produto*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel [14]
    Left = 64
    Top = 432
    Width = 23
    Height = 16
    Caption = 'Cod'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lbl_pais: TLabel [15]
    Left = 56
    Top = 282
    Width = 91
    Height = 16
    Caption = 'Transportadora*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel [16]
    Left = 64
    Top = 136
    Width = 103
    Height = 16
    Caption = 'Base calc. ICMS*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel [17]
    Left = 224
    Top = 136
    Width = 70
    Height = 16
    Caption = 'Valor ICMS*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel [18]
    Left = 376
    Top = 136
    Width = 141
    Height = 16
    Caption = 'Base calc. ICMS Subst*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel [19]
    Left = 376
    Top = 184
    Width = 55
    Height = 16
    Caption = 'Desconto'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel [20]
    Left = 792
    Top = 136
    Width = 121
    Height = 16
    Caption = 'Valor Total Produtos*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label13: TLabel [21]
    Left = 64
    Top = 184
    Width = 63
    Height = 16
    Caption = 'Valor Frete'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label14: TLabel [22]
    Left = 224
    Top = 184
    Width = 74
    Height = 16
    Caption = 'Valor Seguro'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label15: TLabel [23]
    Left = 528
    Top = 184
    Width = 169
    Height = 16
    Caption = 'Outras Despesas Acess'#243'rias'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label16: TLabel [24]
    Left = 792
    Top = 184
    Width = 79
    Height = 16
    Caption = 'Valor Total IPI'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label17: TLabel [25]
    Left = 976
    Top = 160
    Width = 65
    Height = 16
    Caption = 'Valor Total*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lbl_1: TLabel [26]
    Left = 984
    Top = 32
    Width = 105
    Height = 16
    Caption = 'Data da Chegada*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel [27]
    Left = 448
    Top = 32
    Width = 60
    Height = 16
    Caption = 'Tipo Nota*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lbl3: TLabel [28]
    Left = 872
    Top = 32
    Width = 87
    Height = 16
    Caption = 'Data Emiss'#227'o*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel [29]
    Left = 336
    Top = 32
    Width = 35
    Height = 16
    Caption = 'S'#233'rie*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lbl_12: TLabel [30]
    Left = 624
    Top = 32
    Width = 70
    Height = 16
    Caption = 'Fornecedor*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lbl_nome: TLabel [31]
    Left = 208
    Top = 32
    Width = 99
    Height = 16
    Caption = 'N'#250'mero da Nota*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label18: TLabel [32]
    Left = 208
    Top = 8
    Width = 70
    Height = 13
    Caption = 'Dados da nota'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowFrame
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label19: TLabel [33]
    Left = 64
    Top = 112
    Width = 89
    Height = 13
    Caption = 'C'#225'lculo do imposto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowFrame
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label20: TLabel [34]
    Left = 528
    Top = 136
    Width = 108
    Height = 16
    Caption = 'Valor ICMS Subst*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label21: TLabel [35]
    Left = 48
    Top = 258
    Width = 194
    Height = 13
    Caption = 'Transportadora / Volumes Transportados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowFrame
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label22: TLabel [36]
    Left = 368
    Top = 282
    Width = 93
    Height = 16
    Caption = 'Frete por conta*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label23: TLabel [37]
    Left = 480
    Top = 282
    Width = 58
    Height = 16
    Caption = 'C'#243'd ANTT'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label24: TLabel [38]
    Left = 600
    Top = 282
    Width = 97
    Height = 16
    Caption = 'Placa do Ve'#237'culo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label25: TLabel [39]
    Left = 768
    Top = 282
    Width = 81
    Height = 16
    Caption = 'UF do Ve'#237'culo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label26: TLabel [40]
    Left = 928
    Top = 282
    Width = 38
    Height = 16
    Caption = 'CNPJ*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label27: TLabel [41]
    Left = 56
    Top = 330
    Width = 71
    Height = 16
    Caption = 'Quantidade*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label28: TLabel [42]
    Left = 184
    Top = 330
    Width = 52
    Height = 16
    Caption = 'Esp'#233'cie*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label29: TLabel [43]
    Left = 368
    Top = 330
    Width = 36
    Height = 16
    Caption = 'Marca'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label30: TLabel [44]
    Left = 528
    Top = 330
    Width = 66
    Height = 16
    Caption = 'Numera'#231#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label31: TLabel [45]
    Left = 696
    Top = 330
    Width = 65
    Height = 16
    Caption = 'Peso Bruto'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label32: TLabel [46]
    Left = 928
    Top = 330
    Width = 71
    Height = 16
    Caption = 'Peso l'#237'quido'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label33: TLabel [47]
    Left = 64
    Top = 408
    Width = 115
    Height = 13
    Caption = 'Lista de itens da compra'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowFrame
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label34: TLabel [48]
    Left = 424
    Top = 432
    Width = 36
    Height = 16
    Caption = 'CFOP'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label35: TLabel [49]
    Left = 472
    Top = 432
    Width = 30
    Height = 16
    Caption = 'Unid.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label36: TLabel [50]
    Left = 520
    Top = 432
    Width = 25
    Height = 16
    Caption = 'Qtd.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label37: TLabel [51]
    Left = 648
    Top = 432
    Width = 46
    Height = 16
    Caption = 'V. total*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label38: TLabel [52]
    Left = 720
    Top = 432
    Width = 53
    Height = 16
    Caption = 'Bc icms*'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label39: TLabel [53]
    Left = 784
    Top = 432
    Width = 32
    Height = 16
    Caption = 'ICMS'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label40: TLabel [54]
    Left = 840
    Top = 432
    Width = 28
    Height = 16
    Caption = 'V IPI'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label41: TLabel [55]
    Left = 896
    Top = 432
    Width = 54
    Height = 16
    Caption = 'Aliq Icms'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label42: TLabel [56]
    Left = 968
    Top = 432
    Width = 41
    Height = 16
    Caption = 'Aliq IPI'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  inherited edt_cod: TEdit
    Left = 48
    Top = 40
  end
  inherited btn_salvar: TButton
    Left = 896
    Top = 696
    TabOrder = 53
  end
  inherited btn_sair: TButton
    Left = 1000
    Top = 696
    TabOrder = 54
  end
  object edt_dataChegada: TEdit
    Left = 984
    Top = 49
    Width = 105
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 20
    ParentFont = False
    TabOrder = 8
  end
  object edt_codCondicao: TEdit
    Left = 408
    Top = 696
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
    TabOrder = 50
  end
  object edt_condicao: TEdit
    Left = 472
    Top = 696
    Width = 145
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
    TabOrder = 51
  end
  object btn_buscar3: TButton
    Left = 632
    Top = 696
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 52
    OnClick = btn_buscar3Click
  end
  object edt_ncm: TEdit
    Left = 304
    Top = 448
    Width = 65
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 37
  end
  object edt_cst: TEdit
    Left = 376
    Top = 448
    Width = 41
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 20
    ParentFont = False
    TabOrder = 38
  end
  object edt_produto: TEdit
    Left = 104
    Top = 448
    Width = 137
    Height = 25
    CharCase = ecUpperCase
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    ReadOnly = True
    TabOrder = 35
  end
  object btn_buscarProduto: TButton
    Left = 248
    Top = 448
    Width = 49
    Height = 25
    Caption = 'Buscar'
    TabOrder = 36
    OnClick = btn_buscarProdutoClick
  end
  object edt_ValorUnitario: TEdit
    Left = 568
    Top = 448
    Width = 73
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 20
    ParentFont = False
    TabOrder = 42
  end
  object ListView1: TListView
    Left = 64
    Top = 488
    Width = 1033
    Height = 145
    Columns = <
      item
        Caption = 'Cod'
      end
      item
        Caption = 'Produto'
        Width = 200
      end
      item
        Caption = 'NCM/SH'
        Width = 80
      end
      item
        Caption = 'CST'
      end
      item
        Caption = 'CFOP'
      end
      item
        Caption = 'Unid'
      end
      item
        Caption = 'Qtd'
      end
      item
        Caption = 'Valor Unit'
        Width = 80
      end
      item
        Caption = 'Valor tot'
        Width = 80
      end
      item
        Caption = 'BC ICMS'
        Width = 75
      end
      item
        Caption = 'ICMS'
      end
      item
        Caption = 'V IPI'
      end
      item
        Caption = 'Aliq ICMS'
        Width = 75
      end
      item
        Caption = 'Aliq IPI'
      end>
    GridLines = True
    TabOrder = 49
    ViewStyle = vsReport
  end
  object edt_codProduto: TEdit
    Left = 64
    Top = 448
    Width = 33
    Height = 25
    CharCase = ecUpperCase
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    ReadOnly = True
    TabOrder = 34
  end
  object edt_Transportadora: TEdit
    Left = 96
    Top = 298
    Width = 201
    Height = 25
    CharCase = ecUpperCase
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 60
    ParentFont = False
    ReadOnly = True
    TabOrder = 21
  end
  object edt_CodTransportadora: TEdit
    Left = 56
    Top = 298
    Width = 33
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
    TabOrder = 20
  end
  object btn_buscar2: TButton
    Left = 304
    Top = 298
    Width = 49
    Height = 25
    Caption = 'Buscar'
    TabOrder = 22
    OnClick = btn_buscar2Click
  end
  object edt_baseICMS: TEdit
    Left = 64
    Top = 152
    Width = 145
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 9
  end
  object edt_valorICMS: TEdit
    Left = 224
    Top = 152
    Width = 137
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 10
  end
  object edt_baseICMSsubst: TEdit
    Left = 376
    Top = 152
    Width = 137
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 11
  end
  object edt_desconto: TEdit
    Left = 376
    Top = 200
    Width = 137
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 16
    Text = '0,00'
  end
  object edt_valortotalProdutos: TEdit
    Left = 792
    Top = 152
    Width = 137
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 13
  end
  object edt_valorFrete: TEdit
    Left = 64
    Top = 200
    Width = 145
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 14
    Text = '0,00'
  end
  object edt_ValorSeguro: TEdit
    Left = 224
    Top = 200
    Width = 137
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 15
    Text = '0,00'
  end
  object edt_outrasDespesas: TEdit
    Left = 528
    Top = 200
    Width = 249
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 17
    Text = '0,00'
  end
  object edt_totalIPI: TEdit
    Left = 792
    Top = 200
    Width = 137
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 18
    Text = '0,00'
  end
  object edt_ValorTotal: TEdit
    Left = 944
    Top = 176
    Width = 137
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 19
  end
  object edt_NumeroNota: TEdit
    Left = 208
    Top = 49
    Width = 113
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
  object edt_dataEmissao: TEdit
    Left = 872
    Top = 49
    Width = 97
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 20
    ParentFont = False
    TabOrder = 7
  end
  object edt_serieNota: TEdit
    Left = 336
    Top = 49
    Width = 97
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 2
  end
  object edt_Fornecedor: TEdit
    Left = 616
    Top = 49
    Width = 177
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
  object btn_buscar1: TButton
    Left = 800
    Top = 49
    Width = 57
    Height = 25
    Caption = 'Buscar'
    TabOrder = 6
    OnClick = btn_buscar1Click
  end
  object edt_codFornecedor: TEdit
    Left = 560
    Top = 49
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
    TabOrder = 4
  end
  object cbTipoNota: TComboBox
    Left = 448
    Top = 49
    Width = 97
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    Text = 'Tipo da nota'
    Items.Strings = (
      '0-Entrada'
      '1-Sa'#237'da')
  end
  object edt_valorIcmsSubst: TEdit
    Left = 528
    Top = 152
    Width = 249
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 12
  end
  object edt_antt: TEdit
    Left = 480
    Top = 298
    Width = 105
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 24
  end
  object edt_placaVeiculo: TEdit
    Left = 600
    Top = 298
    Width = 153
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 25
  end
  object cbFrete: TComboBox
    Left = 368
    Top = 298
    Width = 97
    Height = 21
    ItemHeight = 13
    TabOrder = 23
    Text = 'Selecione'
    Items.Strings = (
      '0-Emitente'
      '1-Destinatario')
  end
  object edt_ufVeiculo: TEdit
    Left = 768
    Top = 298
    Width = 145
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 26
  end
  object edt_CNPJ: TEdit
    Left = 928
    Top = 298
    Width = 153
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 27
  end
  object edt_quantidade: TEdit
    Left = 56
    Top = 346
    Width = 113
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 28
  end
  object edt_especie: TEdit
    Left = 184
    Top = 346
    Width = 169
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 29
  end
  object edt_pesobruto: TEdit
    Left = 696
    Top = 346
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
    TabOrder = 32
    Text = '0,00'
  end
  object edt_numeracao: TEdit
    Left = 528
    Top = 346
    Width = 153
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 31
  end
  object edt_marca: TEdit
    Left = 368
    Top = 346
    Width = 145
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 30
  end
  object edt_pesoLiquido: TEdit
    Left = 928
    Top = 346
    Width = 153
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 50
    ParentFont = False
    TabOrder = 33
    Text = '0,00'
  end
  object edt_cfop: TEdit
    Left = 424
    Top = 448
    Width = 41
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 20
    ParentFont = False
    TabOrder = 39
  end
  object edt_unid: TEdit
    Left = 472
    Top = 448
    Width = 41
    Height = 25
    CharCase = ecUpperCase
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 20
    ParentFont = False
    ReadOnly = True
    TabOrder = 40
  end
  object edt_qtdeItem: TEdit
    Left = 520
    Top = 448
    Width = 41
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 20
    ParentFont = False
    TabOrder = 41
  end
  object edt_valortotalItem: TEdit
    Left = 648
    Top = 448
    Width = 65
    Height = 25
    CharCase = ecUpperCase
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 20
    ParentFont = False
    ReadOnly = True
    TabOrder = 43
  end
  object edt_baseICMSitem: TEdit
    Left = 720
    Top = 448
    Width = 57
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 20
    ParentFont = False
    TabOrder = 44
  end
  object edt_ICMSitem: TEdit
    Left = 784
    Top = 448
    Width = 49
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 20
    ParentFont = False
    TabOrder = 45
  end
  object edt_ipiItem: TEdit
    Left = 840
    Top = 448
    Width = 49
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 20
    ParentFont = False
    TabOrder = 46
  end
  object edt_aliqICMS: TEdit
    Left = 896
    Top = 448
    Width = 65
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 20
    ParentFont = False
    TabOrder = 47
  end
  object edt_aliqIPI: TEdit
    Left = 968
    Top = 448
    Width = 65
    Height = 25
    CharCase = ecUpperCase
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 20
    ParentFont = False
    TabOrder = 48
  end
end
