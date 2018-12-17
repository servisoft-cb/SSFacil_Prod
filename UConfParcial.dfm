object frmConfParcial: TfrmConfParcial
  Left = 516
  Top = 212
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmConfParcial'
  ClientHeight = 228
  ClientWidth = 345
  Color = 16759671
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnEncerrar: TNxButton
    Left = 96
    Top = 127
    Width = 153
    Height = 33
    Caption = '(F3) Encerrar Processo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnEncerrarClick
  end
  object btnGerar: TNxButton
    Left = 96
    Top = 159
    Width = 153
    Height = 33
    Caption = 'Gerar um Novo Tal'#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnGerarClick
  end
  object btnCancelar: TNxButton
    Left = 96
    Top = 191
    Width = 153
    Height = 33
    Caption = 'Cancelar / Retornar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnCancelarClick
  end
  object Memo1: TMemo
    Left = 3
    Top = 5
    Width = 339
    Height = 112
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object UCControls1: TUCControls
    GroupName = 'Confirma Baixa Parcial'
    UserControl = fMenu.UserControl1
    NotAllowed = naInvisible
    Left = 296
    Top = 136
  end
end
