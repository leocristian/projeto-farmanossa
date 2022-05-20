object InfoLoteForm: TInfoLoteForm
  Left = 0
  Top = 0
  Caption = 'InfoLoteForm'
  ClientHeight = 228
  ClientWidth = 432
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  DesignSize = (
    432
    228)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 80
    Width = 162
    Height = 19
    Anchors = [akRight, akBottom]
    Caption = 'Data de Fabrica'#231#227'o:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 88
  end
  object Label2: TLabel
    Left = 48
    Top = 120
    Width = 146
    Height = 19
    Anchors = [akRight, akBottom]
    Caption = 'Data de Validade:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 128
  end
  object Label3: TLabel
    Left = 32
    Top = 16
    Width = 42
    Height = 19
    Caption = 'Lote:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LoteLabel: TLabel
    Left = 80
    Top = 12
    Width = 6
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DtFabricacaoEdit: TcxDateEdit
    Left = 200
    Top = 82
    Anchors = [akRight, akBottom]
    Enabled = False
    Style.BorderColor = clInfoText
    Style.BorderStyle = ebsSingle
    Style.HotTrack = True
    Style.ButtonStyle = btsDefault
    StyleDisabled.BorderColor = clBackground
    StyleDisabled.BorderStyle = ebsSingle
    StyleDisabled.Color = clWindow
    StyleDisabled.TextColor = clBackground
    StyleDisabled.ButtonStyle = btsDefault
    TabOrder = 0
    ExplicitTop = 90
    Width = 121
  end
  object DtVencimentoEdit: TcxDateEdit
    Left = 200
    Top = 122
    Anchors = [akRight, akBottom]
    Enabled = False
    StyleDisabled.BorderColor = clBackground
    StyleDisabled.TextColor = clBackground
    TabOrder = 1
    ExplicitTop = 130
    Width = 121
  end
  object CloseBtn: TButton
    Left = 312
    Top = 181
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Ok'
    TabOrder = 2
    OnClick = CloseBtnClick
    ExplicitTop = 189
  end
end
