object FormRel1: TFormRel1
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'FormRel1'
  ClientHeight = 303
  ClientWidth = 670
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  WindowState = wsMaximized
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pn_filtro: TPanel
    Left = 0
    Top = 0
    Width = 670
    Height = 303
    Align = alClient
    TabOrder = 0
    object Label2: TLabel
      Left = 76
      Top = 97
      Width = 42
      Height = 13
      Caption = 'Produto:'
    end
    object BuscaProdutoBtn: TSpeedButton
      Left = 195
      Top = 92
      Width = 33
      Height = 23
      ImageIndex = 0
      Images = ImageList1
      OnClick = BuscaProdutoBtnClick
    end
    object Label3: TLabel
      Left = 33
      Top = 124
      Width = 85
      Height = 13
      Caption = 'Local de estoque:'
    end
    object BuscaLocalBtn: TSpeedButton
      Left = 195
      Top = 121
      Width = 33
      Height = 23
      ImageIndex = 0
      Images = ImageList1
      OnClick = BuscaLocalBtnClick
    end
    object CodProdEdit: TEdit
      Left = 124
      Top = 94
      Width = 65
      Height = 21
      MaxLength = 4
      NumbersOnly = True
      TabOrder = 0
      OnClick = CodProdEditClick
      OnExit = CodProdEditExit
    end
    object LimparProd: TBitBtn
      Left = 234
      Top = 92
      Width = 33
      Height = 23
      ImageIndex = 1
      Images = ImageList1
      TabOrder = 1
      TabStop = False
      OnClick = LimparProdClick
    end
    object DescProdEdit: TEdit
      Left = 273
      Top = 95
      Width = 348
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      MaxLength = 50
      ReadOnly = True
      TabOrder = 2
    end
    object CodLocalEdit: TEdit
      Left = 124
      Top = 121
      Width = 65
      Height = 21
      MaxLength = 4
      NumbersOnly = True
      TabOrder = 3
      OnClick = CodLocalEditClick
      OnExit = CodLocalEditExit
    end
    object LimparLocal: TBitBtn
      Left = 234
      Top = 123
      Width = 33
      Height = 22
      ImageIndex = 1
      Images = ImageList1
      TabOrder = 4
      TabStop = False
      OnClick = LimparLocalClick
    end
    object DescLocalEdit: TEdit
      Left = 273
      Top = 122
      Width = 348
      Height = 21
      TabStop = False
      CharCase = ecUpperCase
      MaxLength = 70
      ReadOnly = True
      TabOrder = 5
    end
    object Rel1Btn: TBitBtn
      Left = 460
      Top = 184
      Width = 161
      Height = 65
      Caption = 'Visualizar relat'#243'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 2
      Images = ImageList1
      ParentFont = False
      TabOrder = 6
      OnClick = Rel1BtnClick
    end
  end
  object rel_1: TfrxReport
    Version = '2022.2.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44709.779944594900000000
    ReportOptions.LastChange = 44714.640644953700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 184
    Top = 194
    Datasets = <
      item
        DataSet = db_rel_1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = clGray
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 16053492
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 1046.929810000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de ficha de estoque de produto')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 68.031540000000000000
        Width = 1046.929810000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 718.110000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 11.339530000000000000
          Width = 86.930470000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Loc. C'#243'digo')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 351.520000000000000000
          Width = 143.640000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Prod. Descri'#231#227'o')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 502.717650000000000000
          Width = 34.012350000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Lote')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 548.059060000000000000
          Width = 105.800940000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Dt. Fabrica'#231#227'o')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 653.857650000000000000
          Width = 102.051410000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Dt. Vencimento')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 763.467650000000000000
          Width = 71.812350000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Mov. Data')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 850.410000000000000000
          Width = 71.813290000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Mov. Hora')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 937.337650000000000000
          Width = 22.671410000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Op.')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 971.339530000000000000
          Width = 79.370470000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 260.800000000000000000
          Width = 90.710000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Prod. C'#243'digo')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 98.268590000000000000
          Width = 113.390470000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Loc. Descri'#231#227'o')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 64.252010000000000000
        Top = 151.181200000000000000
        Width = 1046.929810000000000000
        AllowSplit = True
        DataSet = db_rel_1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        Stretched = True
        object frxDBDataset1frxDBDataset1: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 49.140000000000000000
          Width = 34.011880000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."mov_local"]')
        end
        object frxDBDataset1frxDBDataset11: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 90.710000000000000000
          Width = 154.970940000000000000
          Height = 52.913420000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."loc_descricao"]')
        end
        object frxDBDataset1frxDBDataset12: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 306.159060000000000000
          Width = 34.010940000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."mov_produto"]')
        end
        object frxDBDataset1frxDBDataset13: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 351.520000000000000000
          Width = 143.640000000000000000
          Height = 49.133890000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."prod_descricao"]')
        end
        object frxDBDataset1frxDBDataset14: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 502.719060000000000000
          Width = 34.010000000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."mov_lote"]')
        end
        object frxDBDataset1frxDBDataset15: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 548.059060000000000000
          Width = 94.490940000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."lote_dtfabricacao"]')
        end
        object frxDBDataset1frxDBDataset16: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 653.859530000000000000
          Width = 94.490470000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."lote_dtvencimento"]')
        end
        object frxDBDataset1frxDBDataset17: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 763.470000000000000000
          Width = 71.810000000000000000
          Height = 18.897650000000000000
          DataSet = db_rel_1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."mov_data"]')
        end
        object frxDBDataset1frxDBDataset18: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 850.410000000000000000
          Width = 71.810000000000000000
          Height = 18.897650000000000000
          DataSet = db_rel_1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."mov_hora"]')
        end
        object frxDBDataset1frxDBDataset19: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 937.339530000000000000
          Width = 22.670470000000000000
          Height = 18.897650000000000000
          DataSet = db_rel_1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."mov_operacao"]')
        end
        object frxDBDataset1frxDBDataset110: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 971.340000000000000000
          Width = 64.250000000000000000
          Height = 18.897650000000000000
          DataSet = db_rel_1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."mov_quantidade"]')
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 275.905690000000000000
        Width = 1046.929810000000000000
        object Memo3: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 1046.929810000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo5: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 971.338260000000000000
          Top = 1.000000000000000000
          Width = 75.591550000000000000
          Height = 22.677180000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page#]')
        end
      end
    end
  end
  object db_rel_1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = tb_rel_1
    BCDToCurrency = False
    DataSetOptions = []
    Left = 248
    Top = 197
  end
  object tb_rel_1: TUniTable
    Left = 312
    Top = 197
  end
  object ds_rel_1: TDataSource
    Left = 376
    Top = 197
  end
  object ImageList1: TImageList
    Left = 128
    Top = 192
    Bitmap = {
      494C010103000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ECECECB1E7E7E7DFE7E7
      E7DFE7E7E7DFE7E7E7DFE7E7E7DFE7E7E7DFE7E7E7DFE7E7E7DFE7E7E7DFE6E6
      E6DFCECECEDFCECECEDFFDFDFD0B000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B4B4B457747474FF242424FF1616
      16FF242424FF7A7A7A89E0E0E01FFDFDFD02F2F2F20DCBCBCB342C2C2CF77070
      70FF181818FF181818FF30302FED000000000000000000000000000000000000
      000000000000BABCF5645257E8FF5257E8FF5257E8FF5257E8FFF5F5FD0D0000
      00000000000000000000000000000000000000000000E4E4E4FFE4E4E4FFE4E4
      E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4
      E4FFCBCBCBFFCBCBCBFFF4F4F45F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002E2E2EE8686868FF2C2C2CFF1515
      15FF232323FF161616FAAFAFAF50B6B6B649B5B5B54A9E9E9E61212121FF7070
      70FF181818FF191919FF1A1A1AFF00000000000000000000000000000000FBFB
      FF045257E8FF5257E8FF5257E8FF5257E8FF5257E8FF5257E8FF5257E8FF5257
      E8FF0000000000000000000000000000000000000000E4E4E4FFE4E4E4FFE4E4
      E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4
      E4FFCBCBCBFFCBCBCBFFF4F4F45F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007E7E7E94BDBDBDFF6F6F6FFF8282
      82FF797979FF4C4C4CC2C4C4C43BC3C3C33CC3C3C33CBFBFBF40696969FFC5C5
      C5FF6D6D6DFF8C8C8CFF3C3C3CFF000000000000000000000000F1F1FC124A4F
      E7FF4B50E6FF3E42DEFF5055E7FF5156E7FF5257E8FF5257E8FF2021CEFF5156
      E7FF5257E8FF00000000000000000000000000000000E4E4E4FFE4E4E4FFD5D5
      D5FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFE4E4E4FFE4E4
      E4FFCBCBCBFFCBCBCBFFF4F4F45F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE01A3A3A3FF717171FF7373
      73FF7A7A7AFFF3F3F30F00000000000000000000000000000000777777FEB3B3
      B3FF606060FF878787FF545454E80000000000000000000000004147E6FF4248
      E6FFCBCBF3FFFBFBFEFF393DDEFF4B50E7FF4D52E7FF1819CAFFFFFFFFFF2829
      CCFF5156E7FF5257E8FF000000000000000000000000E4E4E4FFE4E4E4FF8181
      81FF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFFE4E4E4FFE4E4
      E4FFCBCBCBFFCBCBCBFFF4F4F45F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000707070FE5A5A5AFE1414
      14FE171717FE5D5D5DB1FEFEFE01B6B6B663E2E2E220ABABAB5E6E6E6EF32121
      21FE1C1C1CFE565656FE9B9B9B820000000000000000484EE7E93A40E6FF0E0F
      C7FFFFFFFFFFFFFFFFFFFBFBFEFF3539DDFF1516CAFFFFFFFFFFFFFFFFFFFFFF
      FFFF1D1ECDFF4F54E7FFF9F9FD090000000000000000E4E4E4FFE4E4E4FFE4E4
      E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4
      E4FFCBCBCBFFCBCBCBFFF4F4F45F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000099999971282828FF777777FF4E4E
      4EFF606060FF3D3D3DFF141414FF6A6A6AFF171717FF2A2A2AFFA5A5A5FF5555
      55FF484848FF282828FF131313FF00000000000000003137E5FF3339E5FF353B
      E5FF0D0FC7FFFFFFFFFFFFFFFFFFFBFBFEFFFFFFFFFFFFFFFFFFFFFFFFFF1516
      CAFF464BE7FF484DE7FF4A4FE7FF0000000000000000E4E4E4FFE4E4E4FF7070
      70FF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFFE4E4E4FFE4E4
      E4FFCBCBCBFFCBCBCBFFF4F4F45F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E8E8E81BA0A0A0FFB9B9B9FF6C6C
      6CFF878686FF797979FF8C8C8C8C4F4F4FFF9E9E9E6D6B6B6BFFD9D9D9FF6C6C
      6CFF767676FF858585FF525252F600000000000000002A31E5FF2C33E5FF2E34
      E5FF3036E5FF0C0EC7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1213CAFF3D43
      E6FF3F45E6FF4146E6FF4348E6FF0000000000000000E4E4E4FFE4E4E4FFE4E4
      E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4
      E4FFCBCBCBFFCBCBCBFFF4F4F45F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000939393FFC4C4C4FF6A6A
      6AFF868686FF7C7C7CFFC9C9C9484F4F4FFFD8D8D82C6B6B6BFFD9D9D9FF6C6C
      6CFF767676FF888888FF707070C90000000000000000232AE4FF252CE4FF3D43
      E7FF3F44E7FF1416CAFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFEFF393DDEFF4A50
      E8FF4C52E8FF3A40E6FF3C41E6FF0000000000000000E4E4E4FFE4E4E4FF5F5F
      5FFF5D5D5DFF5D5D5DFF5D5D5DFF5D5D5DFF5D5D5DFF5D5D5DFFE4E4E4FFE4E4
      E4FFCBCBCBFFCBCBCBFFF4F4F45F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000868686FFCDCDCDFF6868
      68FF858585FF7F7F7FFFCACACA484F4F4FFFD8D8D82C6B6B6BFFD9D9D9FF6C6C
      6CFF767676FF8A8A8AFF8E8E8EA000000000000000001C23E4FF4A50E9FF4C51
      E9FF1719CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFEFF4549
      E0FF595EEAFF5B60EAFF353BE5FF0000000000000000E4E4E4FFE4E4E4FFE4E4
      E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4
      E4FFCBCBCBFFCBCBCBFFF4F4F45F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000797979FFD5D5D5FF6969
      69FF848484FF626262FF4D4D4DC96A6A6AFF454545D52D2D2DFFD9D9D9FF6D6D
      6DFF767676FF8A8A8AFFABABAB770000000000000000151CE2FE5A5FEBFF1B1D
      CBFFFFFFFFFFFFFFFFFFFFFFFFFF1D1FCBFF1617C8FFFFFFFFFFFFFFFFFFFBFB
      FEFF5255E3FF696DECFFA9ACF3670000000000000000E4E4E4FFE4E4E4FF5D5D
      5DFF5D5D5DFF5D5D5DFF5D5D5DFF5D5D5DFF5D5D5DFF5D5D5DFFE4E4E4FFE4E4
      E4FFCBCBCBFFCBCBCBFFF4F4F45F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000353434FF878787FF2B2B
      2BFF484848FF2C2C2CFF8B8B8B85555555FF9494947B434242FF494949FF2525
      25FF2D2D2DFF3A3A3AFFB0B0B061000000000000000000000000151CE3FF4F52
      E1FFFEFEFEFFFFFFFFFF2223CBFF7176EEFF7276EEFF191AC8FFFFFFFFFFCECE
      F3FF767AEDFF252BE4FF000000000000000000000000E4E4E4FFE4E4E4FFE4E4
      E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4
      E4FFCBCBCBFFCBCBCBFFF4F4F45F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000097979778363636E62120
      20FA808080FF1D1D1DFF272727F7717171FE494848D5787878FF202020FF2524
      24FF262626F75B5B5BBDF8F8F808000000000000000000000000787CEE8B474C
      E9FF5D60E2FF2627CCFF8286F0FF8387F0FF8488F0FF8588F0FF1D1EC9FF878A
      F0FF2027E4FFF8F8FD07000000000000000000000000E4E4E4FFE4E4E4FF5D5D
      5DFF5D5D5DFF5D5D5DFF5D5D5DFF5D5D5DFFA2A2A2FFE4E4E4FFE4E4E4FFE4E4
      E4FFCBCBCBFFCBCBCBFFF4F4F45F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0BF
      BF539B9B9BFF595959FF414141EA00000000EFEFEF14A2A2A2FF585858FF3A3A
      3AFF000000000000000000000000000000000000000000000000000000007074
      ED900810E2FF9598F2FF9699F2FF9699F2FF979AF3FF989BF3FF999CF2FF131A
      E3FFEAEBFB1500000000000000000000000000000000E4E4E4FFE4E4E4FFE4E4
      E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FF343434FF313131FF3434
      34FFB5B5B5FFCBCBCBFFF4F4F45F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CCCC
      CC3E939393FF1F1F1FFF545354C700000000ECECEC17838383FF242424FF3131
      31F2000000000000000000000000000000000000000000000000000000000000
      0000000000000109E1FE030AE2FF040CE2FF060EE2FF0810E2FF2027E4E70000
      00000000000000000000000000000000000000000000E4E4E4FFE4E4E4FFE4E4
      E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FF313131FF343434FFA8A8
      A8FFB5B5B5FFCBCBCBFFF4F4F45F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000656565D1484848D9A7A7A7660000000000000000676767CC454545DB7777
      77A0000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E4E4E4FFE4E4E4FFE4E4
      E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FFE4E4E4FF343434FFA8A8A8FFA8A8
      A8FFB5B5B5FFCACACAFFF5F5F558000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF800100000001F81F80010000
      0001E00F800100000001C0078001000003C1C003800100008001800180010000
      0001800180010000000180018001000080018001800100008001800180010000
      80018001800100008001C003800100008001C00380010000E10FE00780010000
      E10FF81F80010000F18FFFFF8001000000000000000000000000000000000000
      000000000000}
  end
end
