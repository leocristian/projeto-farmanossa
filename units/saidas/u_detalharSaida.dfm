object DetalharSaidaForm: TDetalharSaidaForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'DetalharSaidaForm'
  ClientHeight = 391
  ClientWidth = 580
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
    Width = 580
    Height = 298
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = -1
    ExplicitWidth = 582
    ExplicitHeight = 329
    DesignSize = (
      580
      298)
    object Label1: TLabel
      Left = 116
      Top = 80
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object Label2: TLabel
      Left = 111
      Top = 107
      Width = 42
      Height = 13
      Caption = 'Produto:'
    end
    object Label3: TLabel
      Left = 68
      Top = 134
      Width = 85
      Height = 13
      Caption = 'Local de estoque:'
    end
    object Label7: TLabel
      Left = 32
      Top = 166
      Width = 121
      Height = 13
      Caption = 'Quantidade de produtos:'
    end
    object Label4: TLabel
      Left = 128
      Top = 193
      Width = 25
      Height = 13
      Caption = 'Lote:'
    end
    object SaiDataLabel: TLabel
      Left = 228
      Top = 22
      Width = 6
      Height = 23
      Anchors = [akTop, akRight]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 230
    end
    object Label8: TLabel
      Left = 18
      Top = 26
      Width = 181
      Height = 21
      Caption = 'Data e hora da sa'#237'da:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object CodEdit: TEdit
      Left = 159
      Top = 77
      Width = 65
      Height = 21
      TabStop = False
      Enabled = False
      MaxLength = 5
      ReadOnly = True
      TabOrder = 0
      Text = '0000'
    end
    object CodProdEdit: TEdit
      Left = 159
      Top = 104
      Width = 65
      Height = 21
      MaxLength = 5
      NumbersOnly = True
      TabOrder = 1
    end
    object DescProdEdit: TEdit
      Left = 230
      Top = 104
      Width = 246
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 50
      ReadOnly = True
      TabOrder = 6
      ExplicitWidth = 248
    end
    object DescLocalEdit: TEdit
      Left = 230
      Top = 131
      Width = 246
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      MaxLength = 70
      ReadOnly = True
      TabOrder = 7
      ExplicitWidth = 248
    end
    object CodLocalEdit: TEdit
      Left = 159
      Top = 131
      Width = 65
      Height = 21
      MaxLength = 4
      NumbersOnly = True
      TabOrder = 2
    end
    object QtdProdEdit: TNumberBox
      Left = 159
      Top = 158
      Width = 65
      Height = 21
      MaxLength = 5
      TabOrder = 3
    end
    object pn_datas: TPanel
      Left = 41
      Top = 212
      Width = 245
      Height = 53
      BevelOuter = bvNone
      TabOrder = 5
      DesignSize = (
        245
        53)
      object Label6: TLabel
        Left = 12
        Top = 33
        Width = 100
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'Data de vencimento:'
        ExplicitTop = 62
      end
      object Label5: TLabel
        Left = 18
        Top = 6
        Width = 95
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'Data de fabrica'#231#227'o:'
        ExplicitTop = 35
      end
      object DtVencimentoEdit: TcxDateEdit
        Left = 118
        Top = 30
        Anchors = [akLeft, akBottom]
        TabOrder = 1
        Width = 121
      end
      object DtFabricacaoEdit: TcxDateEdit
        Left = 118
        Top = 3
        Anchors = [akLeft, akBottom]
        TabOrder = 0
        Width = 121
      end
    end
    object LoteEdit: TEdit
      Left = 159
      Top = 188
      Width = 65
      Height = 21
      MaxLength = 4
      NumbersOnly = True
      TabOrder = 4
    end
  end
  inline FrameButtons1: TFrameButtons
    Left = 0
    Top = 298
    Width = 580
    Height = 93
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 204
    ExplicitWidth = 552
    inherited ModoEdit: TEdit
      Left = 258
      ExplicitLeft = 230
    end
    inherited CancelarBtn: TButton
      Left = 471
      OnClick = FrameButtons1CancelarBtnClick
      ExplicitLeft = 443
    end
    inherited SalvarBtn: TBitBtn
      Left = 346
      Width = 119
      Caption = 'Salvar Altera'#231#245'es'
      ExplicitLeft = 318
      ExplicitWidth = 119
    end
  end
  object sai_cod: TEdit
    Left = 111
    Top = 334
    Width = 25
    Height = 21
    TabStop = False
    TabOrder = 2
    Visible = False
  end
end
