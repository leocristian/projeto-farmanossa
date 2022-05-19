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
  OnShow = FormShow
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
  object gridEntradas: TcxGrid
    Left = 0
    Top = 73
    Width = 713
    Height = 329
    Align = alClient
    TabOrder = 1
    ExplicitTop = 79
    object gridEntradasDBTableView1: TcxGridDBTableView
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
      DataController.DataSource = ds_entradas
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 20
      Styles.ContentEven = FrameGrid1.linhas
      Styles.IncSearch = FrameGrid1.buscaIncremental
      Styles.Header = FrameGrid1.header
      object ent_codigo: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'ent_codigo'
      end
      object ent_produto: TcxGridDBColumn
        Caption = 'Produto'
        DataBinding.FieldName = 'ent_produto'
      end
      object ent_local: TcxGridDBColumn
        Caption = 'Local de estoque'
        DataBinding.FieldName = 'ent_local'
      end
      object ent_lote: TcxGridDBColumn
        AlternateCaption = 'Integer'
        DataBinding.FieldName = 'ent_lote'
      end
      object ent_dtfabricacao: TcxGridDBColumn
        AlternateCaption = 'Integer'
        Caption = 'Data de fabrica'#231#227'o'
        DataBinding.FieldName = 'ent_dtfabricacao'
      end
      object ent_dtvencimento: TcxGridDBColumn
        Caption = 'Data de Vencimento'
        DataBinding.FieldName = 'ent_dtvencimento'
      end
      object ent_quantidade: TcxGridDBColumn
        AlternateCaption = 'DateTime'
        Caption = 'Quantidade'
        DataBinding.FieldName = 'ent_quantidade'
      end
      object ent_data_hora: TcxGridDBColumn
        AlternateCaption = 'DateTime'
        Caption = 'Data e Hora da entrada'
        DataBinding.FieldName = 'ent_data_hora'
      end
    end
    object gridEntradasLevel1: TcxGridLevel
      GridView = gridEntradasDBTableView1
    end
  end
  inline FrameGrid1: TFrameGrid
    Left = 592
    Top = 8
    Width = 77
    Height = 59
    TabOrder = 2
    ExplicitLeft = 592
    ExplicitTop = 8
    ExplicitHeight = 59
    inherited estiloGrid: TcxStyleRepository
      Top = 8
      PixelsPerInch = 96
    end
  end
  object PopupEntradas: TPopupMenu
    Left = 640
    Top = 136
    object NovaEntrada: TMenuItem
      Caption = '1 - Lan'#231'ar nova entrada de mercadoria'
      OnClick = NovaEntradaClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object CancelarEntrada1: TMenuItem
      Caption = 'Cancelar Entrada'
      OnClick = CancelarEntrada1Click
    end
  end
  object tb_entradas: TUniTable
    Left = 480
    Top = 136
  end
  object ds_entradas: TDataSource
    Left = 560
    Top = 136
  end
end
