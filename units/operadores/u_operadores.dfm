object PagOperador: TPagOperador
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'PagOperador'
  ClientHeight = 428
  ClientWidth = 787
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupOperador
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 787
    Height = 65
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
  end
  object PopupOperador: TPopupMenu
    Left = 712
    Top = 104
    object Detalhar1: TMenuItem
      Caption = 'Detalhar...'
      OnClick = Detalhar1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object N1Incluirnovoregistro1: TMenuItem
      Caption = '1 - Incluir novo registro'
      OnClick = N1Incluirnovoregistro1Click
    end
    object N2AlterarregistroatualF31: TMenuItem
      Caption = '2 - Alterar registro atual'
    end
    object N3ExcluirF41: TMenuItem
      Caption = '3 - Excluir'
    end
  end
end
