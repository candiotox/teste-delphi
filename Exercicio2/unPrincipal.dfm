object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 463
  ClientWidth = 429
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 72
    Top = 149
    Width = 32
    Height = 13
    Caption = 'Sal'#225'rio'
  end
  object Label2: TLabel
    Left = 72
    Top = 23
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label3: TLabel
    Left = 72
    Top = 85
    Width = 27
    Height = 13
    Caption = 'CFOP'
  end
  object btnGravar: TBitBtn
    Left = 72
    Top = 216
    Width = 153
    Height = 41
    Caption = 'Gravar'
    TabOrder = 0
    OnClick = btnGravarClick
  end
  object edSalario: TEdit
    Left = 72
    Top = 168
    Width = 153
    Height = 21
    NumbersOnly = True
    TabOrder = 1
  end
  object edNome: TEdit
    Left = 72
    Top = 42
    Width = 313
    Height = 21
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 72
    Top = 104
    Width = 153
    Height = 21
    NumbersOnly = True
    TabOrder = 3
  end
end
