object FormOperador: TFormOperador
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Adicionar Operador'
  ClientHeight = 275
  ClientWidth = 456
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pn_btns: TPanel
    Left = 0
    Top = 192
    Width = 456
    Height = 83
    Align = alBottom
    Anchors = [akBottom]
    TabOrder = 1
    ExplicitTop = 182
    ExplicitWidth = 446
    object ModoEdit: TEdit
      Left = 212
      Top = 28
      Width = 25
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      TabOrder = 0
      Visible = False
    end
    object SalvarBtn: TButton
      Left = 253
      Top = 25
      Width = 83
      Height = 33
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = SalvarBtnClick
    end
    object CancelarBtn: TButton
      Left = 342
      Top = 25
      Width = 83
      Height = 33
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = CancelarBtnClick
    end
  end
  object pn_form: TPanel
    Left = 0
    Top = 0
    Width = 456
    Height = 192
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 446
    ExplicitHeight = 182
    object Label1: TLabel
      Left = 56
      Top = 19
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object Label2: TLabel
      Left = 16
      Top = 46
      Width = 77
      Height = 13
      Caption = 'Nome completo:'
    end
    object Label5: TLabel
      Left = 17
      Top = 127
      Width = 76
      Height = 13
      Caption = 'Repita a senha:'
    end
    object Label3: TLabel
      Left = 64
      Top = 73
      Width = 29
      Height = 13
      Caption = 'Login:'
    end
    object Label4: TLabel
      Left = 59
      Top = 100
      Width = 34
      Height = 13
      Caption = 'Senha:'
    end
    object CodEdit: TEdit
      Left = 99
      Top = 16
      Width = 54
      Height = 21
      TabStop = False
      Enabled = False
      MaxLength = 5
      ReadOnly = True
      TabOrder = 0
      Text = '0000'
    end
    object SenhaCheckEdit: TEdit
      Left = 99
      Top = 124
      Width = 170
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 20
      PasswordChar = '*'
      TabOrder = 4
    end
    object NomeEdit: TEdit
      Left = 99
      Top = 43
      Width = 326
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 70
      TabOrder = 1
    end
    object LoginEdit: TEdit
      Left = 99
      Top = 70
      Width = 170
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 20
      TabOrder = 2
    end
    object SenhaEdit: TEdit
      Left = 99
      Top = 97
      Width = 170
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 20
      PasswordChar = '*'
      TabOrder = 3
    end
  end
end
