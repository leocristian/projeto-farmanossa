object PagEntradas: TPagEntradas
  Left = 0
  Top = 0
  Caption = 'PagEntradas'
  ClientHeight = 402
  ClientWidth = 713
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
    Width = 713
    Height = 73
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 73
    Width = 713
    Height = 329
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 272
    ExplicitTop = 128
    ExplicitWidth = 250
    ExplicitHeight = 200
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
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
