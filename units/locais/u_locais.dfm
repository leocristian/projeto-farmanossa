object PagLocais: TPagLocais
  Left = 0
  Top = 0
  Caption = 'PagLocais'
  ClientHeight = 442
  ClientWidth = 751
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupLocais
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 751
    Height = 81
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    ExplicitWidth = 472
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 81
    Width = 751
    Height = 361
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 176
    ExplicitTop = 152
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
  object PopupLocais: TPopupMenu
    Left = 412
    Top = 104
    object Detalhar1: TMenuItem
      Caption = 'Detalhar...'
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
