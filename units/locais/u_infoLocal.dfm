object FormLocal: TFormLocal
  Left = 0
  Top = 0
  Caption = 'FormLocal'
  ClientHeight = 213
  ClientWidth = 472
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
  object pn_form: TPanel
    Left = 0
    Top = 0
    Width = 472
    Height = 130
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 456
    ExplicitHeight = 177
    object Label1: TLabel
      Left = 56
      Top = 19
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object Label2: TLabel
      Left = 43
      Top = 46
      Width = 50
      Height = 13
      Caption = 'Descri'#231#227'o:'
    end
    object Label4: TLabel
      Left = 58
      Top = 73
      Width = 35
      Height = 13
      Caption = 'Status:'
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
    object DescricaoEdit: TEdit
      Left = 99
      Top = 43
      Width = 326
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 70
      TabOrder = 1
    end
    object StatusBox: TComboBox
      Left = 99
      Top = 70
      Width = 145
      Height = 21
      Style = csDropDownList
      CharCase = ecUpperCase
      ItemIndex = 0
      TabOrder = 2
      Text = 'ATIVO'
      Items.Strings = (
        'ATIVO'
        'INATIVO')
    end
  end
  object pn_btns: TPanel
    Left = 0
    Top = 130
    Width = 472
    Height = 83
    Align = alBottom
    Anchors = [akBottom]
    TabOrder = 1
    ExplicitTop = 159
    ExplicitWidth = 456
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
end
