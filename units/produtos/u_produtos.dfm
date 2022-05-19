object PagProdutos: TPagProdutos
  Left = 0
  Top = 0
  Caption = 'PagProdutos'
  ClientHeight = 466
  ClientWidth = 819
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupProdutos
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gridProdutos: TcxGrid
    Left = 0
    Top = 109
    Width = 819
    Height = 357
    Align = alClient
    TabOrder = 0
    ExplicitTop = 136
    ExplicitHeight = 330
    object gridProdutosDBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Insert.Enabled = False
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Append.Enabled = False
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
      DataController.DataSource = ds_produtos
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.IncSearchItem = prod_descricao
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 20
      Styles.ContentEven = FrameGrid1.linhas
      Styles.IncSearch = FrameGrid1.buscaIncremental
      Styles.Header = FrameGrid1.header
      object prod_codigo: TcxGridDBColumn
        AlternateCaption = 'C'#243'digo'
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'prod_codigo'
        DataBinding.IsNullValueType = True
      end
      object prod_descricao: TcxGridDBColumn
        Caption = 'Descri'#231#227'o'
        DataBinding.FieldName = 'prod_descricao'
        DataBinding.IsNullValueType = True
        Width = 313
      end
      object prod_estoque_negativo: TcxGridDBColumn
        AlternateCaption = 'Descri'#231#227'o'
        Caption = 'Estoque Negativo'
        DataBinding.FieldName = 'prod_estoque_negativo'
        DataBinding.IsNullValueType = True
        Width = 133
      end
      object prod_status_entrada: TcxGridDBColumn
        Caption = 'Status Entrada'
        DataBinding.FieldName = 'prod_status_entrada'
        DataBinding.IsNullValueType = True
        Width = 100
      end
      object prod_status_saida: TcxGridDBColumn
        AlternateCaption = 'prod_status_saida'
        Caption = 'Status Sa'#237'da'
        DataBinding.FieldName = 'prod_status_saida'
        DataBinding.IsNullValueType = True
        Width = 94
      end
    end
    object gridProdutosLevel1: TcxGridLevel
      GridView = gridProdutosDBTableView1
    end
  end
  inline FrameGrid1: TFrameGrid
    Left = 688
    Top = 8
    Width = 77
    Height = 49
    TabOrder = 1
    ExplicitLeft = 688
    ExplicitTop = 8
    ExplicitHeight = 49
    inherited estiloGrid: TcxStyleRepository
      Left = 16
      Top = 8
      PixelsPerInch = 96
    end
  end
  inline FrameBusca1: TFrameBusca
    Left = 0
    Top = 0
    Width = 819
    Height = 109
    Align = alTop
    TabOrder = 2
  end
  object PopupProdutos: TPopupMenu
    Left = 717
    Top = 120
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
  object ds_produtos: TDataSource
    AutoEdit = False
    Left = 512
    Top = 120
  end
  object tb_produtos: TUniTable
    Left = 608
    Top = 120
  end
end
