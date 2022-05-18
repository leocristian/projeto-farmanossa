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
    Height = 81
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
  end
  object CRDBGrid1: TCRDBGrid
    Left = 0
    Top = 81
    Width = 787
    Height = 347
    Align = alClient
    DataSource = ds_operadores
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
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
    end
    object N3ExcluirF41: TMenuItem
      Caption = '3 - Excluir'
    end
  end
  object vtb_operadores: TVirtualTable
    Active = True
    FieldDefs = <
      item
        Name = 'ope_codigo'
        DataType = ftInteger
      end
      item
        Name = 'ope_nome'
        DataType = ftString
        Size = 20
      end>
    Left = 712
    Top = 160
    Data = {
      040002000A006F70655F636F6469676F030000000000000008006F70655F6E6F
      6D650100140000000000000000000000}
  end
  object ds_operadores: TDataSource
    DataSet = vtb_operadores
    Left = 712
    Top = 232
  end
end
