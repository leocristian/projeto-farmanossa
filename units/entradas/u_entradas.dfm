object PagEntradas: TPagEntradas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'PagEntradas'
  ClientHeight = 412
  ClientWidth = 723
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupEntradas
  WindowState = wsMaximized
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gridEntradas: TcxGrid
    Left = 0
    Top = 89
    Width = 723
    Height = 323
    Align = alClient
    TabOrder = 0
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
        DataBinding.IsNullValueType = True
      end
      object ent_produto: TcxGridDBColumn
        Caption = 'Produto'
        DataBinding.FieldName = 'ent_produto'
        DataBinding.IsNullValueType = True
      end
      object prod_descricao: TcxGridDBColumn
        AlternateCaption = 'Descri'#231#227'o do Produto'
        Caption = 'Descri'#231#227'o do Produto'
        DataBinding.FieldName = 'prod_descricao'
        DataBinding.IsNullValueType = True
        Width = 271
      end
      object ent_local: TcxGridDBColumn
        Caption = 'Local de estoque'
        DataBinding.FieldName = 'ent_local'
        DataBinding.IsNullValueType = True
        Width = 129
      end
      object loc_descricao: TcxGridDBColumn
        AlternateCaption = 'String'
        Caption = 'Descri'#231#227'o do local de Estoque'
        DataBinding.FieldName = 'loc_descricao'
        DataBinding.IsNullValueType = True
        Width = 200
      end
      object ent_lote: TcxGridDBColumn
        AlternateCaption = 'Integer'
        Caption = 'Lote'
        DataBinding.FieldName = 'ent_lote'
        DataBinding.IsNullValueType = True
        Width = 96
      end
      object ent_quantidade: TcxGridDBColumn
        AlternateCaption = 'DateTime'
        Caption = 'Quantidade'
        DataBinding.FieldName = 'ent_quantidade'
        DataBinding.IsNullValueType = True
        Width = 102
      end
      object ent_data_hora: TcxGridDBColumn
        AlternateCaption = 'DateTime'
        Caption = 'Data e Hora da entrada'
        DataBinding.FieldName = 'ent_data_hora'
        DataBinding.IsNullValueType = True
        Width = 196
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
    TabOrder = 1
    ExplicitLeft = 592
    ExplicitTop = 8
    ExplicitHeight = 59
    inherited estiloGrid: TcxStyleRepository
      Top = 8
      PixelsPerInch = 96
    end
  end
  inline FrameBusca1: TFrameBusca
    Left = 0
    Top = 0
    Width = 723
    Height = 89
    Align = alTop
    TabOrder = 2
    ExplicitWidth = 723
    ExplicitHeight = 89
    inherited BuscaSelect: TComboBox
      Top = 34
      ExplicitTop = 34
    end
    inherited BuscaEdit: TEdit
      Top = 34
      ExplicitTop = 34
    end
    inherited BitBtn1: TBitBtn
      Top = 30
      ExplicitTop = 30
    end
  end
  object PopupEntradas: TPopupMenu
    Left = 640
    Top = 142
    object Detalhar1: TMenuItem
      Caption = 'Detalhar...  (F1)'
      OnClick = Detalhar1Click
    end
    object NovaEntrada: TMenuItem
      Caption = '1 - Lan'#231'ar nova entrada de mercadoria  (F2)'
      OnClick = NovaEntradaClick
    end
    object AlterarEntrada: TMenuItem
      Caption = '2 - Alterar entrada de mercadoria  (F3)'
      OnClick = AlterarEntradaClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object CancelarEntrada1: TMenuItem
      Caption = 'Cancelar Entrada (F4)'
      OnClick = CancelarEntrada1Click
    end
  end
  object tb_entradas: TUniTable
    Left = 480
    Top = 142
  end
  object ds_entradas: TDataSource
    Left = 560
    Top = 142
  end
end
