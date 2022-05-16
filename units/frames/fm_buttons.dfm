object FrameButtons: TFrameButtons
  Left = 0
  Top = 0
  Width = 475
  Height = 93
  TabOrder = 0
  DesignSize = (
    475
    93)
  object SalvarBtn: TButton
    Left = 277
    Top = 32
    Width = 83
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = 'Salvar'
    TabOrder = 0
    ExplicitLeft = 420
  end
  object ModoEdit: TEdit
    Left = 236
    Top = 34
    Width = 25
    Height = 21
    TabStop = False
    Anchors = [akRight, akBottom]
    CharCase = ecUpperCase
    TabOrder = 1
    Visible = False
    ExplicitLeft = 379
  end
  object CancelarBtn: TButton
    Left = 366
    Top = 31
    Width = 83
    Height = 33
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    TabOrder = 2
    ExplicitLeft = 509
  end
end
