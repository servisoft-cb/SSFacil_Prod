object frmLiberacao_Ped: TfrmLiberacao_Ped
  Left = 99
  Top = 31
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Libera'#231#227'o de Pedido para o Faturamento'
  ClientHeight = 631
  ClientWidth = 1161
  Color = clBtnFace
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
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 65
    Width = 1161
    Height = 566
    ActivePage = TS_Conferido
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    FixedDimension = 19
    object TS_Conferido: TRzTabSheet
      Caption = 'Pendente Para Libera'#231#227'o'
      object SMDBGrid1: TSMDBGrid
        Left = 0
        Top = 41
        Width = 1157
        Height = 502
        Align = alClient
        Ctl3D = False
        DataSource = DMCadPreFat.dsPendente_Lib
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Flat = True
        BandsFont.Charset = DEFAULT_CHARSET
        BandsFont.Color = clWindowText
        BandsFont.Height = -11
        BandsFont.Name = 'MS Sans Serif'
        BandsFont.Style = []
        Groupings = <>
        GridStyle.Style = gsCustom
        GridStyle.OddColor = clWindow
        GridStyle.EvenColor = clWindow
        TitleHeight.PixelCount = 24
        FooterColor = clBtnFace
        ExOptions = [eoCheckBoxSelect, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 27
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 12
        RowCount = 2
        Columns = <
          item
            Expanded = False
            FieldName = 'FANTASIA_CLI'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'Cliente'
            Title.Color = 10944422
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Verdana'
            Title.Font.Style = []
            Width = 240
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PEDIDO_CLIENTE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Ped. Cliente'
            Title.Color = 10944422
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Verdana'
            Title.Font.Style = []
            Width = 121
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUM_PEDIDO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Ped. Interno'
            Title.Color = 10944422
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Verdana'
            Title.Font.Style = []
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ITEM'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'Item'
            Title.Color = 10944422
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Verdana'
            Title.Font.Style = []
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REFERENCIA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'Refer'#234'ncia'
            Title.Color = 10944422
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Verdana'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_CONFERIDO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Aguardando Libera'#231#227'o'
            Title.Color = 10944422
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Verdana'
            Title.Font.Style = []
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMEPRODUTO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'Nome Produto'
            Title.Color = 10944422
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Verdana'
            Title.Font.Style = []
            Width = 249
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_COR_COMBINACAO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'Cor / Combina'#231#227'o'
            Title.Color = 10944422
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Verdana'
            Title.Font.Style = []
            Width = 201
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNIDADE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'Unid.'
            Title.Color = 10944422
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Verdana'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMOS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' OS'
            Title.Color = 10944422
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Verdana'
            Title.Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FILIAL'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            Title.Alignment = taCenter
            Title.Caption = 'Filial'
            Title.Color = 10944422
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Verdana'
            Title.Font.Style = []
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 1157
        Height = 41
        Align = alTop
        Color = 13882323
        TabOrder = 1
        object btnLiberar: TNxButton
          Left = 2
          Top = 8
          Width = 263
          Height = 30
          Caption = 'Copiar para o Pr'#233' Faturamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = []
          Glyph.Data = {
            D6050000424DD605000000000000360000002800000014000000180000000100
            180000000000A005000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E1E1FDFDFDFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF8F8F8010101808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFE7E7E7383838000000000000989898FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2E2E24C4C4C
            000000000000000000000000959595FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E557575700000000000000
            0000000000000000000000878787FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF0F0F05B5B5B0000000000000000000000000000
            00000000000000000000888888FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFF595959000000000000000000000000000000000000000000
            0000000000000B0B0B8D8D8DFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FF4E4E4E00000000000000000000000000000000000000000000000000000000
            00000000000C0C0C979797FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF303030000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000007B7B7BF6F6F6FFFFFFFFFFFFFFFFFFBFBFBFDDDDDDF5F5F56D
            6D6D0000000000000000000000000000000000000000000202026E6E6EFFFFFF
            F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5C5C50000000000000000
            000000000000000000000000000000000000000909098282827C7C7C00000000
            0000000000B9B9B9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8A8A8A000000000000
            0000000000000000000000000000000A0A0A7272728E8E8EC5C5C5FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD88888800000000000000000000000000
            00000000000000000000000A0A0A7272729B9B9B585858949494141414E5E5E5
            000000FFFFFFFFFFFFFFFFFFFFFFFF8383830000000000000000000000000000
            000000000000000A0A0A7272728D8D8DB2B2B2FFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFF4F4F4686868000000000000000000000000000000000000
            0000000A0A0A7272729696967575759F9F9FEDEDEDFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFF4F4F46A6A6A0000000000000000000000000000000000000000000A
            0A0A7272728F8F8FA0A0A0E1E1E1F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F4F4F46A6A6A0000000000000000000000000000000000000000000A0A0A7272
            72949494878787B9B9B9F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F46A
            6A6A0000000000000000000000000000000000000000000A0A0A737373919191
            979797D3D3D3F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F25F5F5F0000
            00000000000000000000000000000000000000000000626262949494888888BD
            BDBDF2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8A5A5A56B6B6B8C8C8C
            939393929292929292929292909090979797C4C4C49191919C9C9CDCDCDCF8F8
            F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCCECECE62626240404048
            48484646464848484646464949493939392D2D2D7E7E7EA8A8A8F0F0F0FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1B7B7B7C7C7C7BDBDBDDDDD
            DDB2B2B2DDDDDDBDBDBDCCCCCCD3D3D3F6F6F6F0F0F0FEFEFEFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF545454D2D2D2000000FFFFFF
            000000D7D7D74343439696965C5C5C7B7B7BE8E8E8FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentFont = False
          TabOrder = 0
          OnClick = btnLiberarClick
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1161
    Height = 65
    Align = alTop
    Color = clSilver
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 119
      Height = 14
      Alignment = taRightJustify
      Caption = 'N'#186' Pedido Interno:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 86
      Top = 40
      Width = 49
      Height = 14
      Alignment = taRightJustify
      Caption = 'Cliente:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object SpeedButton3: TSpeedButton
      Left = 564
      Top = 31
      Width = 23
      Height = 22
      Hint = 'Atualiza tabela de cliente'
      Glyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B0040000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFCFDF9FAFBF2
        F1F1EEEEEEEBEBEBE9EAECE4E8E9E2E4E7E3E4E6E4E6E7E6E9EAEBECF0F2F4F7
        F2F6F5F7F6F6FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFF1EBE9D0C5BADBDEE2C9CC
        CEC1C3C4B6B0AEB1A397AA876AA6764FA87044AC754BB39174C7BCB3D5D6DBE5
        E7E8EFEFEEFDFDFDFFFFFFFFFFFFFFFFFFEBE5DC9F6B46DBDBDEC9C8CAB9A796
        B68861C18451D29861CD9460CE945CCC9258C58346B26E36C09E83E3E1E3EFF1
        F2FBFBFBFFFFFFFFFFFFFFFFFFF5F0EEBC8A63C3A48CC3A58CC68F61CF9B68C8
        9565CA9361CD9364C18951BF864FC18853C6884FB8763BCEB3A1F7FCFFFEFEFE
        FFFFFFFFFFFFFFFFFFF7F3EFBD916CD5B493D6AD8BD8AA84CB9668CB9664BA85
        53BA8A61C6A281BF926DBB814EC08F67B47437BE8C5EEDE6DFFFFFFFFFFFFFFF
        FFFFFFFFFFF6F2EEB98F69E3C2A3DDB99AE0BF9CCA9C72BD9473E2CFC0E5D9D0
        F1EEECEFE7E3E1CAB1DCC3AACFB193A96B33E4D1BFFFFFFFFFFFFFFFFFFFFFFF
        FFF7F2EFBA9069DFBB9BDEBD9DC79F7BD8C4B1F1EDEAFFFFFFFFFFFFFFFFFFFF
        FFFFF7F3EEEAD6C4FEFEFEB58560D7BDA9FFFFFFFFFFFFFFFFFFFFFFFFF7F3EF
        BD946CDFBC9CD9B996D8B694C8AE97F6F6F6FFFFFFFEFFFFFFFEFFFFFFFFFBF9
        F7F4EBE5FFFFFFC1A287D9C5B5FFFFFFFFFFFFFFFFFFFFFFFFF5EEEAB07E53E0
        BD9FDCB793E2BE9FCE9E73D0B499FCFAF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFE2D6CBEBE3DCFFFFFFFFFFFFFFFFFFFFFFFFF9F9F5BEA994C2A797BFA1
        92BB9E8CB99C89B39983F7F5F2FFFFFFAB7957BB967BB79676B89778B89777B9
        997EECE3DCFFFFFFFFFFFFFFFFFFFFFFFFF5F0E8CAB09BFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFC9B7A7D3A679DBB088D9AA84DCAD87C7986EE9DB
        CDFFFFFFFFFFFFFFFFFFFFFFFFE6D8CEB67B50E8D0BCDFC7B7F3EFEBFFFFFFFE
        FFFEFEFFFEFFFFFFFFFFFFBA9F8CD6A57DCF9B6ECD9B6CBF9164E9DDD2FFFFFF
        FFFFFFFFFFFFFFFFFFEDE4DCA86B3BBF865CC29776EAE2DBFFFFFFFFFFFFFFFF
        FFFDFFFFDED0C4D4B8A3C79B71D1A478CD9E70BF9265E8DDD0FFFFFFFFFFFFFF
        FFFFFFFFFFF9F5F2BD8F6DBC8A639D5F2DB58968E0D2C8E7DCD3DAC8B8DECBBA
        C09A77D4A882D0A479D2A478D3A77CBF8E64E8DBCFFFFFFFFFFFFFFFFFFFFFFF
        FFF7F5F2CAAB93E5CCB7CCA788C29471CDAC8ED9BDA3CAA98AD7B094E8CEB2DB
        BEA1DDB995C99D76C0946FC39168EADACFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFF
        E1D2C6C5A284F6E3D0F0DCC9E6CEB7E6CCB5E5CBB6E7CCB5E5CCB2E3C2A4C299
        78CFB9A6D2BEADB58257E7D5C6FFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFDFEFEDA
        C9BBBA9675D4B193EDD1B8EED3BCECCEB6D1AF8EBE916DC2A386EEE6E2F9F8F6
        FFFFFFBD9A80DBC9BAFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFFFFFFFDFEFEF6F2
        EFD9C8BDBFA38CC3A388B99D83CFBEACFAF6F4F7F4F2FFFFFFFFFFFFFFFFFFF8
        F7F5F8F7F4FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFFFFFFFFFFFFFFFF
        FFFEFEFFFFFFFFFFFFFF}
      Margin = 0
      OnClick = SpeedButton3Click
    end
    object Label3: TLabel
      Left = 781
      Top = 22
      Width = 338
      Height = 33
      AutoSize = False
      Caption = 'Pedido(s) da FILIAL: '#13#10
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 138
      Top = 8
      Width = 95
      Height = 21
      AutoSize = False
      Ctl3D = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object btnConsultar: TNxButton
      Left = 589
      Top = 28
      Width = 137
      Height = 25
      Caption = 'Efetuar Pesquisa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnConsultarClick
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 138
      Top = 32
      Width = 425
      Height = 21
      DropDownCount = 8
      DropDownWidth = 700
      Ctl3D = False
      LookupField = 'CODIGO'
      LookupDisplay = 'FANTASIA;CNPJ_CPF'
      LookupSource = DMCadPreFat.dsClienteLib
      ParentCtl3D = False
      TabOrder = 1
    end
  end
end
