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
  OnShow = FormShow
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
  object gridOperadores: TcxGrid
    Left = 0
    Top = 65
    Width = 787
    Height = 363
    Align = alClient
    TabOrder = 1
    object gridOperadoresDBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Insert.Enabled = False
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Enabled = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Enabled = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Enabled = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Enabled = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.Refresh.Enabled = False
      Navigator.Buttons.Refresh.Visible = False
      Navigator.Buttons.Filter.Enabled = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.InfoPanel.DisplayMask = '[RecordIndex] / [RecordCount]'
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      ScrollbarAnnotations.CustomAnnotations = <>
      DataController.DataSource = ds_operadores
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.IncSearchItem = gridOperadoresDBTableView1ope_nome
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 20
      Styles.ContentEven = FrameGrid1.linhas
      Styles.IncSearch = FrameGrid1.buscaIncremental
      Styles.Header = FrameGrid1.header
      object gridOperadoresDBTableView1ope_codigo: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'ope_codigo'
      end
      object gridOperadoresDBTableView1ope_nome: TcxGridDBColumn
        Caption = 'Nome Completo'
        DataBinding.FieldName = 'ope_nome'
      end
    end
    object gridOperadoresLevel1: TcxGridLevel
      GridView = gridOperadoresDBTableView1
    end
  end
  inline FrameGrid1: TFrameGrid
    Left = 680
    Top = 8
    Width = 77
    Height = 49
    TabOrder = 2
    ExplicitLeft = 680
    ExplicitTop = 8
    ExplicitHeight = 49
    inherited estiloGrid: TcxStyleRepository
      Left = 8
      Top = 8
      PixelsPerInch = 96
      inherited buscaIncremental: TcxStyle
        AssignedValues = [svColor, svTextColor]
        TextColor = clBackground
      end
    end
  end
  object PopupOperador: TPopupMenu
    Left = 712
    Top = 88
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
      OnClick = N2AlterarregistroatualF31Click
    end
    object N3ExcluirF41: TMenuItem
      Caption = '3 - Excluir'
      OnClick = N3ExcluirF41Click
    end
  end
  object tb_operadores: TUniTable
    TableName = 'tb_operadores'
    Left = 608
    Top = 88
  end
  object ds_operadores: TDataSource
    AutoEdit = False
    Left = 504
    Top = 88
  end
end
