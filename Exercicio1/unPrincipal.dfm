object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'frmPrincipal'
  ClientHeight = 275
  ClientWidth = 838
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbHistorico: TLabel
    Left = 16
    Top = 19
    Width = 3
    Height = 13
  end
  object lbBaseCalculo: TLabel
    Left = 504
    Top = 51
    Width = 65
    Height = 13
    Caption = 'lbBaseCalculo'
  end
  object lbImpA: TLabel
    Left = 504
    Top = 84
    Width = 33
    Height = 13
    Caption = 'lbImpA'
  end
  object lbImpB: TLabel
    Left = 504
    Top = 145
    Width = 32
    Height = 13
    Caption = 'lbImpB'
  end
  object lbImpC: TLabel
    Left = 505
    Top = 208
    Width = 33
    Height = 13
    Caption = 'lbImpC'
  end
  object edResultado: TEdit
    Left = 16
    Top = 48
    Width = 257
    Height = 21
    TabOrder = 0
  end
  object btnDividir: TBitBtn
    Left = 296
    Top = 79
    Width = 75
    Height = 25
    Caption = #247
    TabOrder = 1
    OnClick = btnDividirClick
  end
  object btnMultiplicar: TBitBtn
    Left = 296
    Top = 110
    Width = 75
    Height = 25
    Caption = 'X'
    TabOrder = 2
    OnClick = btnMultiplicarClick
  end
  object btnSubtrair: TBitBtn
    Left = 296
    Top = 141
    Width = 75
    Height = 25
    Caption = '-'
    TabOrder = 3
    OnClick = btnSubtrairClick
  end
  object btnSomar: TBitBtn
    Left = 296
    Top = 172
    Width = 75
    Height = 25
    Caption = '+'
    TabOrder = 4
    OnClick = btnSomarClick
  end
  object btnIgual: TBitBtn
    Left = 296
    Top = 203
    Width = 75
    Height = 25
    Caption = '='
    TabOrder = 5
    OnClick = btnIgualClick
  end
  object btnLimpar: TBitBtn
    Left = 296
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Limpar'
    TabOrder = 6
    OnClick = btnLimparClick
  end
  object btnImpA: TBitBtn
    Left = 408
    Top = 79
    Width = 75
    Height = 25
    Caption = 'Imposto A'
    TabOrder = 7
    OnClick = btnImpAClick
  end
  object btnImpB: TBitBtn
    Left = 408
    Top = 140
    Width = 75
    Height = 25
    Caption = 'Imposto B'
    TabOrder = 8
    OnClick = btnImpBClick
  end
  object btnImpC: TBitBtn
    Left = 408
    Top = 205
    Width = 75
    Height = 25
    Caption = 'Imposto C'
    TabOrder = 9
    OnClick = btnImpCClick
  end
end
