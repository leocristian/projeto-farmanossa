object SelecionaLoteForm: TSelecionaLoteForm
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'SelecionaLoteForm'
  ClientHeight = 458
  ClientWidth = 507
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  WindowState = wsMaximized
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 507
    Height = 73
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 20
      Top = 24
      Width = 229
      Height = 21
      Caption = 'Selecione o lote para sa'#237'da'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object gridLotes: TcxGrid
    Left = 0
    Top = 73
    Width = 507
    Height = 385
    Align = alClient
    TabOrder = 1
    object gridLotesDBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Last.Visible = True
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
      OnCellClick = gridLotesDBTableView1CellClick
      DataController.DataSource = ds_lotes
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          Column = lote_quantidade
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 20
      Styles.ContentEven = FrameGrid1.linhas
      Styles.IncSearch = FrameGrid1.buscaIncremental
      Styles.Header = FrameGrid1.header
      object lote_codigo: TcxGridDBColumn
        Caption = 'Lote'
        DataBinding.FieldName = 'lote_codigo'
        DataBinding.IsNullValueType = True
      end
      object lote_dtfabricacao: TcxGridDBColumn
        AlternateCaption = 'Integer'
        Caption = 'Data de Fabrica'#231#227'o'
        DataBinding.FieldName = 'lote_dtfabricacao'
        DataBinding.IsNullValueType = True
        Width = 136
      end
      object lote_dtvencimento: TcxGridDBColumn
        AlternateCaption = 'DateTime'
        Caption = 'Data de Vencimento'
        DataBinding.FieldName = 'lote_dtvencimento'
        DataBinding.IsNullValueType = True
        Width = 147
      end
      object lote_quantidade: TcxGridDBColumn
        AlternateCaption = 'Integer'
        Caption = 'Quantidade'
        DataBinding.FieldName = 'lote_quantidade'
        DataBinding.IsNullValueType = True
        Width = 82
      end
    end
    object gridLotesLevel1: TcxGridLevel
      GridView = gridLotesDBTableView1
    end
  end
  inline FrameGrid1: TFrameGrid
    Left = 312
    Top = 8
    Width = 65
    Height = 59
    TabOrder = 2
    ExplicitLeft = 312
    ExplicitTop = 8
    ExplicitWidth = 65
    ExplicitHeight = 59
    inherited estiloGrid: TcxStyleRepository
      Left = 16
      Top = 16
      PixelsPerInch = 96
    end
  end
  object ds_lotes: TDataSource
    Left = 432
    Top = 120
  end
  object tb_lotes: TUniTable
    Left = 368
    Top = 120
  end
end
