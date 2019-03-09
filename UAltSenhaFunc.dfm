object frmAltSenhaFunc: TfrmAltSenhaFunc
  Left = 386
  Top = 226
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'frmAltSenhaFunc'
  ClientHeight = 290
  ClientWidth = 434
  Color = 13041606
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label11: TLabel
    Left = 47
    Top = 25
    Width = 100
    Height = 18
    Alignment = taRightJustify
    Caption = 'Funcion'#225'rio:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 19
    Top = 89
    Width = 128
    Height = 18
    Alignment = taRightJustify
    Caption = 'Senha Anterior:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 147
    Top = 45
    Width = 270
    Height = 13
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object CurrencyEdit2: TCurrencyEdit
    Left = 148
    Top = 20
    Width = 202
    Height = 23
    AutoSize = False
    Ctl3D = False
    DecimalPlaces = 0
    DisplayFormat = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    OnEnter = CurrencyEdit2Enter
    OnExit = CurrencyEdit2Exit
    OnKeyDown = CurrencyEdit2KeyDown
  end
  object Edit1: TEdit
    Left = 149
    Top = 82
    Width = 200
    Height = 24
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Verdana'
    Font.Style = []
    MaxLength = 15
    ParentCtl3D = False
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
    OnEnter = Edit1Enter
    OnKeyDown = Edit1KeyDown
  end
  object GroupBox1: TGroupBox
    Left = 24
    Top = 144
    Width = 401
    Height = 128
    Caption = ' Nova Senha '
    TabOrder = 2
    OnEnter = GroupBox1Enter
    object Label2: TLabel
      Left = 59
      Top = 25
      Width = 104
      Height = 18
      Alignment = taRightJustify
      Caption = 'Nova Senha:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 11
      Top = 52
      Width = 152
      Height = 18
      Alignment = taRightJustify
      Caption = 'Confirme a Senha:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Edit2: TEdit
      Left = 165
      Top = 18
      Width = 200
      Height = 24
      Color = 16777145
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      MaxLength = 15
      ParentCtl3D = False
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 0
      OnKeyDown = Edit2KeyDown
    end
    object Edit3: TEdit
      Left = 165
      Top = 45
      Width = 200
      Height = 24
      Color = 16777145
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      MaxLength = 15
      ParentCtl3D = False
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 1
      OnKeyDown = Edit3KeyDown
    end
    object btnConfirmar: TNxButton
      Left = 168
      Top = 88
      Width = 75
      Caption = 'Confirmar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnConfirmarClick
    end
    object NxButton2: TNxButton
      Left = 248
      Top = 88
      Width = 75
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = NxButton2Click
    end
  end
end
