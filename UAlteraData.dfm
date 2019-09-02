object frmAlteraData: TfrmAlteraData
  Left = 573
  Top = 181
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Altera'#231#227'o das Datas'
  ClientHeight = 250
  ClientWidth = 328
  Color = 11140947
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
  object Label5: TLabel
    Left = 52
    Top = 26
    Width = 28
    Height = 13
    Alignment = taRightJustify
    Caption = 'Setor:'
  end
  object Label6: TLabel
    Left = 24
    Top = 8
    Width = 56
    Height = 13
    Alignment = taRightJustify
    Caption = 'Lote/Tal'#227'o:'
  end
  object Label7: TLabel
    Left = 83
    Top = 8
    Width = 6
    Height = 13
    Caption = '..'
  end
  object Label8: TLabel
    Left = 83
    Top = 26
    Width = 6
    Height = 13
    Caption = '..'
  end
  object RzGroupBox3: TRzGroupBox
    Left = 71
    Top = 48
    Width = 166
    Height = 77
    BorderColor = clNavy
    BorderInner = fsButtonUp
    BorderOuter = fsBump
    Caption = ' Entrada '
    Color = 11140947
    Ctl3D = True
    FlatColor = clNavy
    FlatColorAdjustment = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    VisualStyle = vsGradient
    object Label1: TLabel
      Left = 18
      Top = 27
      Width = 26
      Height = 13
      Caption = 'Data:'
    end
    object Label2: TLabel
      Left = 18
      Top = 49
      Width = 26
      Height = 13
      Caption = 'Hora:'
    end
    object DateEdit1: TDateEdit
      Left = 50
      Top = 18
      Width = 100
      Height = 21
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 0
    end
    object RzDateTimeEdit1: TRzDateTimeEdit
      Left = 50
      Top = 43
      Width = 100
      Height = 20
      EditType = etTime
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object RzGroupBox1: TRzGroupBox
    Left = 72
    Top = 132
    Width = 166
    Height = 77
    BorderColor = clNavy
    BorderInner = fsButtonUp
    BorderOuter = fsBump
    Caption = ' Baixa '
    Color = 11140947
    Ctl3D = True
    FlatColor = clNavy
    FlatColorAdjustment = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    VisualStyle = vsGradient
    object Label3: TLabel
      Left = 18
      Top = 27
      Width = 26
      Height = 13
      Caption = 'Data:'
    end
    object Label4: TLabel
      Left = 18
      Top = 49
      Width = 26
      Height = 13
      Caption = 'Hora:'
    end
    object DateEdit2: TDateEdit
      Left = 50
      Top = 18
      Width = 100
      Height = 21
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 0
    end
    object RzDateTimeEdit2: TRzDateTimeEdit
      Left = 50
      Top = 43
      Width = 100
      Height = 20
      EditType = etTime
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  object NxButton1: TNxButton
    Left = 72
    Top = 220
    Width = 86
    Height = 27
    Caption = 'Confirmar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = NxButton1Click
  end
  object NxButton2: TNxButton
    Left = 156
    Top = 220
    Width = 86
    Height = 27
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
