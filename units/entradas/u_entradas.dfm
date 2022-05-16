object PagEntradas: TPagEntradas
  Left = 0
  Top = 0
  Caption = 'PagEntradas'
  ClientHeight = 242
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupEntradas
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 472
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    ExplicitLeft = 152
    ExplicitTop = 120
    ExplicitWidth = 185
  end
  object PopupEntradas: TPopupMenu
    Left = 400
    Top = 72
    object NovaEntrada: TMenuItem
      Caption = '1 - Lan'#231'ar nova entrada de mercadoria'
      OnClick = NovaEntradaClick
    end
  end
end
