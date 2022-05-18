object FormOperador: TFormOperador
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Adicionar Operador'
  ClientHeight = 245
  ClientWidth = 489
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pn_form: TPanel
    Left = 0
    Top = 0
    Width = 489
    Height = 177
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 456
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
    object NomeEdit: TEdit
      Left = 99
      Top = 43
      Width = 326
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 70
      TabOrder = 1
    end
    object pnLogin: TPanel
      Left = 8
      Top = 64
      Width = 293
      Height = 97
      BevelOuter = bvNone
      TabOrder = 2
      object Label5: TLabel
        Left = 9
        Top = 66
        Width = 76
        Height = 13
        Caption = 'Repita a senha:'
      end
      object Label4: TLabel
        Left = 51
        Top = 39
        Width = 34
        Height = 13
        Caption = 'Senha:'
      end
      object Label3: TLabel
        Left = 56
        Top = 12
        Width = 29
        Height = 13
        Caption = 'Login:'
      end
      object SenhaCheckEdit: TEdit
        Left = 91
        Top = 63
        Width = 170
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 20
        PasswordChar = '*'
        TabOrder = 2
      end
      object SenhaEdit: TEdit
        Left = 91
        Top = 36
        Width = 170
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 20
        PasswordChar = '*'
        TabOrder = 1
      end
      object LoginEdit: TEdit
        Left = 91
        Top = 9
        Width = 170
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 20
        TabOrder = 0
      end
    end
  end
  inline FrameButtons: TFrameButtons
    Left = 0
    Top = 152
    Width = 489
    Height = 93
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 182
    ExplicitWidth = 456
    inherited SalvarBtn: TButton
      Left = 291
      OnClick = SalvarBtnClick
      ExplicitLeft = 258
    end
    inherited ModoEdit: TEdit
      Left = 250
      ExplicitLeft = 217
    end
    inherited CancelarBtn: TButton
      Left = 380
      OnClick = CancelarBtnClick
      ExplicitLeft = 347
    end
  end
end
