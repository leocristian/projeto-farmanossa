object OperadorForm: TOperadorForm
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Adicionar Operador'
  ClientHeight = 265
  ClientWidth = 446
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
    Top = 182
    Width = 446
    Height = 83
    Align = alBottom
    Anchors = [akBottom]
    TabOrder = 1
    ExplicitTop = 304
    ExplicitWidth = 496
    object ModoEdit: TEdit
      Left = 212
      Top = 28
      Width = 25
      Height = 21
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
    end
    object CancelarBtn: TButton
      Left = 342
      Top = 25
      Width = 83
      Height = 33
      Caption = 'Cancelar'
      TabOrder = 2
    end
  end
  object pn_form: TPanel
    Left = 0
    Top = 0
    Width = 446
    Height = 182
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 53
    ExplicitTop = 186
    ExplicitWidth = 496
    ExplicitHeight = 284
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
    object Edit1: TEdit
      Left = 99
      Top = 16
      Width = 65
      Height = 21
      TabStop = False
      MaxLength = 5
      TabOrder = 0
    end
    object Edit5: TEdit
      Left = 99
      Top = 124
      Width = 170
      Height = 21
      MaxLength = 20
      TabOrder = 4
    end
    object Edit2: TEdit
      Left = 99
      Top = 43
      Width = 326
      Height = 21
      MaxLength = 150
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 99
      Top = 70
      Width = 170
      Height = 21
      MaxLength = 20
      TabOrder = 2
    end
    object Edit4: TEdit
      Left = 99
      Top = 97
      Width = 170
      Height = 21
      MaxLength = 20
      TabOrder = 3
    end
  end
end
