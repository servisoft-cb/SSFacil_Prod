object frmConsLote_Calc: TfrmConsLote_Calc
  Left = 20
  Top = 30
  Width = 1338
  Height = 679
  Caption = 'Consulta Lotes e Processos  (frmConsLote_Calc)'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1330
    Height = 113
    Align = alTop
    Color = clSilver
    TabOrder = 0
    object NxLabel2: TNxLabel
      Left = 8
      Top = 11
      Width = 98
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' Ordem Produ'#231#227'o:'
      Transparent = False
      HorizontalPosition = hpLeft
      InnerHorizontal = True
      InnerVertical = False
      InnerMargins.Horizontal = 0
      InnerMargins.Vertical = 2
      VerticalPosition = vpTop
    end
    object NxLabel4: TNxLabel
      Left = 53
      Top = 31
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' Lote Ini:'
      Transparent = False
      HorizontalPosition = hpLeft
      InnerHorizontal = True
      InnerVertical = False
      InnerMargins.Horizontal = 0
      InnerMargins.Vertical = 2
      VerticalPosition = vpTop
    end
    object NxLabel3: TNxLabel
      Left = 223
      Top = 51
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'Final:'
      HorizontalPosition = hpLeft
      InnerHorizontal = True
      InnerVertical = False
      InnerMargins.Horizontal = 0
      InnerMargins.Vertical = 2
      VerticalPosition = vpTop
    end
    object NxLabel5: TNxLabel
      Left = 223
      Top = 31
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'Final:'
      HorizontalPosition = hpLeft
      InnerHorizontal = True
      InnerVertical = False
      InnerMargins.Horizontal = 0
      InnerMargins.Vertical = 2
      VerticalPosition = vpTop
    end
    object NxLabel6: TNxLabel
      Left = 213
      Top = 11
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Op'#231#227'o:'
      HorizontalPosition = hpLeft
      InnerHorizontal = True
      InnerVertical = False
      InnerMargins.Horizontal = 0
      InnerMargins.Vertical = 2
      VerticalPosition = vpTop
    end
    object NxLabel1: TNxLabel
      Left = 10
      Top = 48
      Width = 96
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dt.Entrada Setor Ini:'
      Transparent = False
      HorizontalPosition = hpLeft
      InnerHorizontal = True
      InnerVertical = False
      InnerMargins.Horizontal = 0
      InnerMargins.Vertical = 2
      VerticalPosition = vpTop
    end
    object NxLabel7: TNxLabel
      Left = 223
      Top = 71
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'Final:'
      HorizontalPosition = hpLeft
      InnerHorizontal = True
      InnerVertical = False
      InnerMargins.Horizontal = 0
      InnerMargins.Vertical = 2
      VerticalPosition = vpTop
    end
    object NxLabel8: TNxLabel
      Left = 18
      Top = 68
      Width = 88
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dt.Sa'#237'da Setor Ini:'
      Transparent = False
      HorizontalPosition = hpLeft
      InnerHorizontal = True
      InnerVertical = False
      InnerMargins.Horizontal = 0
      InnerMargins.Vertical = 2
      VerticalPosition = vpTop
    end
    object NxLabel9: TNxLabel
      Left = 411
      Top = 10
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Refer'#234'ncia:'
      HorizontalPosition = hpLeft
      InnerHorizontal = True
      InnerVertical = False
      InnerMargins.Horizontal = 0
      InnerMargins.Vertical = 2
      VerticalPosition = vpTop
    end
    object Shape4: TShape
      Left = 960
      Top = 90
      Width = 32
      Height = 17
      Brush.Color = 7864183
    end
    object Label4: TLabel
      Left = 995
      Top = 93
      Width = 79
      Height = 13
      Caption = 'Tal'#227'o Encerrado'
    end
    object Shape6: TShape
      Left = 960
      Top = 74
      Width = 32
      Height = 17
      Brush.Color = 16777145
    end
    object Label6: TLabel
      Left = 995
      Top = 77
      Width = 93
      Height = 13
      Caption = 'Tal'#227'o em Produ'#231#227'o'
    end
    object NxLabel11: TNxLabel
      Left = 77
      Top = 89
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Setor:'
      HorizontalPosition = hpLeft
      InnerHorizontal = True
      InnerVertical = False
      InnerMargins.Horizontal = 0
      InnerMargins.Vertical = 2
      VerticalPosition = vpTop
    end
    object NxLabel10: TNxLabel
      Left = 418
      Top = 30
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = 'Processo:'
      Visible = False
      HorizontalPosition = hpLeft
      InnerHorizontal = True
      InnerVertical = False
      InnerMargins.Horizontal = 0
      InnerMargins.Vertical = 2
      VerticalPosition = vpTop
    end
    object Shape1: TShape
      Left = 960
      Top = 58
      Width = 32
      Height = 17
      Brush.Color = clYellow
    end
    object Label7: TLabel
      Left = 995
      Top = 61
      Width = 158
      Height = 13
      Caption = 'Tal'#227'o em Produ'#231#227'o (falta leituras)'
    end
    object btnConsTalao: TNxButton
      Left = 447
      Top = 75
      Width = 153
      Height = 30
      Caption = 'Efetuar Pesquisa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      Glyph.Data = {
        AE060000424DAE06000000000000360000002800000017000000170000000100
        1800000000007806000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF7F2F0F5F2F0FCFDFDFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6B778D2D52869876
        72B0A3A1FCFDFE000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7780
        0055B812A5FA5E90BDBBA29FFAF5F4000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF5C6377004EAD29BEFFA9ECFFA3F7FF3A89BFF6F5F6000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF75737F0051AC17B1FFA4E7FDD5FFFF12A6E45E90B5FFFCFC00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFD6C6C7D0057BB25BAFFA5E7FEC7FFFF099DDF6A8A
        A8FFFFFDFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF54657D0057B120B5FFA1E5FECFFFFF
        109CDD4D7EA5FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFCFEFEDADDDDDAD9D9CFCFCFEDEFEFFFFFFFFFFFFFFFFFFF00024A21BCFFA5
        EAFFCAFFFF11A7E86587A9FFFFFCFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFDDE0E0958E8D7A63657D60628467678065658D77799C9393D3D1D1ADAA
        A749343776B3E0B4FFFF19A4DF5A84A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFD2D8D84C3334846269967570A39388A99E9AAB9E99AE9890
        B69DA4A28E8F867070E7D0CC806B6E005499467EA7FFFFFAFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFC2C2C2533638A27B799D80649A9A7C94988895
        97979498949198849E9478C4AFA8C8B5B7AFA1A1B6B3B1FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FBFBFB816D6E8A66679C6F4A987D
        5A978F7499978499998D99998C989783948769987854C9B1A9C1B4B6DED8D8FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000E0DCDB74575C
        98634797653998765499876899927799977F99967F99907799826295704B9B64
        3AD4CFD8A39C9BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000887F83865B54984D1A945C319969439A77559A7F5F998365998364997F5F
        99735095673F81400DC9A391B2ACB0ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000BDAFB38C57459140079352258D562D875732885D3A8D
        6744946E4B92694587532D91572CBB753CCA906BADAAB0CECDCDFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000C6B7BB8F56428528008B3D08A766
        34CA9765D0A272BC8D5F9E6940A06B3ECB9867EFB984FFCB8ACD8A5FBBB8C0DD
        DBDBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000B8AEB1906152
        AD5529ECB177FFD29AFED7A5FCDEAEFEE7B6FFEABBFFE8B8FDDCABF7D09CFCCB
        90CF9675AEAAB2CBCBCCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        00009B96988F6B68EAA769FFD19BF4CD9BF4D8AAF4E0B4F4E4BBF4E5BDF4E4BB
        F4DDB1F6DBABF8C98AC6A399A8A6A9F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000D2D0D07E6B73B47F67FED295F6DBADF4E4BAF5E5C2F5
        E7C8F5E9CAF4E7C8F5E8C3F9E9B9D29E73DDDEE8A6A2A1FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FCFEFE9B8F91B6A0A5CD9972FDE8
        B2F6EDC7F5E9CCF4EDD4F5EED9F5EED6F9EFCDE4C299F3E4DD867F80D7D8D8FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFD4D6D6
        574849C3AEB2CDA88FF0D9B4F6ECD0F6F3E3F6F1E5F4E8D3E2C2ABE1D0CF9E95
        96C6C7C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFD3D5D59F969797888CC0A6A1D1B6ACD5BEB2D7C0B7D5BDB8
        C1B4B8ADA7AAC0BFBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFCFDFDD2D0D0A3A0A2CEC5C7E1
        D7D8DCD3D4A09C9EE7E5E5F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
      GlyphSpacing = 5
      ParentFont = False
      TabOrder = 10
      Transparent = True
      OnClick = btnConsTalaoClick
    end
    object CurrencyEdit1: TCurrencyEdit
      Left = 108
      Top = 23
      Width = 100
      Height = 21
      AutoSize = False
      Ctl3D = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      ParentCtl3D = False
      TabOrder = 2
    end
    object DateEdit1: TDateEdit
      Left = 108
      Top = 43
      Width = 100
      Height = 21
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 4
    end
    object DateEdit2: TDateEdit
      Left = 250
      Top = 43
      Width = 125
      Height = 21
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 5
    end
    object CurrencyEdit2: TCurrencyEdit
      Left = 250
      Top = 23
      Width = 125
      Height = 21
      AutoSize = False
      Ctl3D = False
      DecimalPlaces = 0
      DisplayFormat = '0'
      ParentCtl3D = False
      TabOrder = 3
    end
    object cbxOpcao: TNxComboBox
      Left = 250
      Top = 3
      Width = 125
      Height = 21
      Cursor = crArrow
      BevelOuter = bvSpace
      TabOrder = 1
      Text = 'Ambos'
      ReadOnly = True
      HideFocus = False
      Style = dsDropDownList
      AutoCompleteDelay = 0
      ItemIndex = 0
      Items.Strings = (
        'Ambos'
        'Pendente'
        'Encerrado'
        'Tal'#245'es Aguardando'
        ''
        '')
    end
    object DateEdit3: TDateEdit
      Left = 108
      Top = 63
      Width = 100
      Height = 21
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 6
    end
    object DateEdit4: TDateEdit
      Left = 250
      Top = 63
      Width = 125
      Height = 21
      Ctl3D = False
      NumGlyphs = 2
      ParentCtl3D = False
      TabOrder = 7
    end
    object Edit1: TEdit
      Left = 468
      Top = 4
      Width = 133
      Height = 19
      CharCase = ecUpperCase
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 9
      OnKeyDown = Edit1KeyDown
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 108
      Top = 83
      Width = 267
      Height = 21
      DropDownCount = 8
      Ctl3D = False
      LookupField = 'ID'
      LookupDisplay = 'NOME'
      LookupSource = DMLoteImp_Calc.dsSetor
      ParentCtl3D = False
      TabOrder = 8
    end
    object btnImprimir: TNxButton
      Left = 598
      Top = 75
      Width = 153
      Height = 30
      Caption = 'Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      Glyph.Data = {
        AE060000424DAE06000000000000360000002800000017000000170000000100
        1800000000007806000000000000000000000000000000000000FCFFFFFFFEFE
        FCFFFCF9FEFEF9FCFDFFFCFFF3FAFBF3FAFAF3FAFAF2FAFAF3FAFAF4F9FAF4F9
        FAF2FAFAF2FAFAF4F9FAF5FAFAFDFBFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FEFFFEFEFEFEFBFFFDFCFDFEFFFFFFD5EAF0489FC55DB4D15EB4D157B3D2
        5BB3D05BB4D458B2D359B3D25AB3D45DB1D352A8C3AFDDEAFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FEFFFDFEFDFEFCFFFCFFFDFEFFFFFFB5E2EA4AB8D0A1
        FAFC9EF1F597F1F69DF1F59AF1F699F1F69EF1F598F1F4A0F6FB58C7D98DCFE8
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FAFFFEFEFDFEFCFFFDFFFEFEFFFF
        FEB8E1EC53C0D899E8E97EBCC083BECA8CBEC189BCC582BCC785BEC282BAB899
        E0E667D1E08CCEE6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FCFEFEFFFDFE
        FFFFFFFFFFFFFFFFFFC1E6F147BFDA84E1E860ADB05FAFB862B1B45AB1B559B1
        B659B1B54EA8AE70D9E25ED0E28FCFE9FFFFFFFFFFFFFFFFFFFFFFFFFDFFFF00
        0000FAFEFEFFFFFFDCDAD9D5D2D2E0D9D6AABFCD41C3DD8AF5FD8BDEE591E4EA
        92DFEA8FE0E78CE1E697DFEA8FDDEA8AF3FB4FD4E48FC6D5E1D8D5D5D3D2DBD9
        D9FDFDFDFDFFFF000000FFFFFFB5B1B371635E806E6B503A2F0E3B4C69E7FF6E
        E2F660C9D361CCD95FC7D65FC8D661C8D761CBD55DC7CD6BDFF069EEFF114764
        45322C776C666E6460AEAAA9FFFFFF000000FDFDFC827A78CFBFB9E9DDD66F5B
        52324448396F7A4373754974744574734674754B73764B727545757544747549
        6F75426D793646505F5049DDCDCAD1C1BE827B78FCFCFB000000FCFCFB87817D
        CCC0BADEDCD4D2C2BCAD9A9CAB9697AF9895AF9794AC9794A79994AC9693AD99
        8FAD9893A79897A89A92AC9B90AE9E98C1B7B2E8DBD9CFC0BD897F7CFBFBFA00
        0000FCFCFB8B807ED3C7C3E6E6E2EAE4E4F2ECECF6EEEBF3EEEEF7EEEEF7EEEF
        F0EFEEF5EFF0F4EFEEF7EEF0F5EDF2EFF1EFF1EFEEF2ECEEEBE6EAEAE4E3D3C8
        C4887F7DFCFBFB000000FCFCFC89817FDBCECEF7F2F2F7F0F4EBEAE7E4E3DEDF
        E3E1E4E1E2E3E0DFDDE1DFE2E0DFE1E0E0E1E0DEE5E0DDE4DDDCE0DDDDECE8E7
        F2F2F3F5F3F1DAD2D188827DFBFCFB000000FCFDFC8B8282DFD3D4FFFDFFE8EC
        EB7D797665605E68626165605F635E5D635D5B625C5C605A595F59595C58575B
        5655585453676362E9E8EAFFFDFDE1D4D189837EFAFCFC000000FCFDFD8B8482
        DED6D5FFFFFFC2C4C3514B4A322F2D3735353835353735353734343735353633
        333836353835343836353431304C4746AFB0B0FFFFFFE4D4DB8C8485FCFCFC00
        0000FCFCFD8F8986DCD5D1FFFFFFC6C5C4554F4D2F2E2D383838383838373838
        37383838373837393737383737393738373733302F4C4747B7B1B2FFFFFFDED6
        D0898884FCFBFD000000FBFCFC928C89D4CAC5DAD4D0BDBAB8605C5A2C2D2D25
        28282B2E2E313434333737343737363838363737353838363838343131514C4C
        ADA1AE7F70C2CEC2CA938B8BFAFBFC000000FFFFFF999490B7A9A2BEAFADAAA0
        A084807FA6A6A58182825C5C5C46474739383835363635333332323231333332
        32322F2D2D534C4FA1A19760AB80BAB8AA9A9290FCFFFF000000FFFFFFC6C1BE
        94817DC4AFACA39A98868784C9CACAB9BABBBABBBCB4B5B5A9AAAB9D9E9F9093
        938A87888482827A7B7C7F7F7E6D6669918D8195A67B847F79C1BEBFFFFFFF00
        0000FFFFFEFEFFFFB2A9A99F9494989895796C6EA69694A49593A1918EA0908C
        9B8D899A8C899889879987849686809882808C7C7C6359588E8B8BA4999EAEA9
        ACFFFFFFFFFFFF000000FEFCFEFCFEFFFFFFFFFFFFFFFFFFFF98AFC059919F6A
        9FA5689CA2689CA165989D679BA065989D5E999A56999D5E959F498295A2ABB4
        FFFFFFFFFFFFFFFFFFFEFFFFFFFFFF000000FDFDFDFCFDFEFEFEFCFAFDFDFFFF
        FF90D3EC50CEE37FF9FF7DF4FF7EF5FF7DF4FF7DF5FF7CF5FF7FF8FC7FF6FF89
        FAFF3DBBD5C8EAF1FFFFFFFDFDFDFEFFFFFDFEFEFFFFFF000000FBFEFEFAFDFE
        FDFFFCFCFDFEFFFFFF88C9E457CCDF8DFAFE89F4FC89F5FB89F6FB8AF6FC86F4
        FC8DF5FC8DF5FC91FBFF39B8D0B5E1EBFFFFFFFCFFFFFCFFFFFFFEFEFFFFFF00
        0000FDFEFFFFFDFFFEFFFDFFFDFEFFFFFFA7DBE44AA8C558B6D059B5CE5AB5CD
        59B5CD5AB5CF55B5CF5DB4D059B1D356B5D246A5C3D4ECF0FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FEFDFFFDFDFFF7FFFFFCFEFBFFFDFEF8FEFEF1F9FAEF
        F8F9F0F8F9F0F8FAF0F8FAF0F8F9F0F8F9F0F8FAEEF8FAF0F7FAF3FAFAFCFDFF
        FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF000000}
      GlyphSpacing = 5
      ParentFont = False
      TabOrder = 11
      Transparent = True
      OnClick = btnImprimirClick
    end
    object Edit2: TEdit
      Left = 108
      Top = 5
      Width = 100
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      OnKeyDown = Edit2KeyDown
    end
    object RxDBLookupCombo2: TRxDBLookupCombo
      Left = 468
      Top = 22
      Width = 267
      Height = 21
      DropDownCount = 8
      Ctl3D = False
      LookupField = 'ID'
      LookupDisplay = 'NOME'
      LookupSource = DMLoteImp_Calc.dsProcesso
      ParentCtl3D = False
      TabOrder = 12
      Visible = False
    end
    object btnOpcao: TNxButton
      Left = 749
      Top = 75
      Width = 153
      Height = 30
      Caption = 'Op'#231#245'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      GlyphSpacing = 5
      ParentFont = False
      PopupMenu = PopupMenu1
      ShowArrow = True
      TabOrder = 13
      Transparent = True
    end
  end
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 113
    Width = 1330
    Height = 535
    ActivePage = TS_Talao
    ActivePageDefault = TS_Talao
    Align = alClient
    TabIndex = 0
    TabOrder = 1
    OnChange = RzPageControl1Change
    FixedDimension = 19
    object TS_Talao: TRzTabSheet
      Caption = 'Por Tal'#227'o'
      object SMDBGrid1: TSMDBGrid
        Left = 0
        Top = 0
        Width = 1326
        Height = 495
        Align = alClient
        Ctl3D = False
        DataSource = DMLoteImp_Calc.dsConsulta_Lote
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnKeyDown = SMDBGrid1KeyDown
        OnTitleClick = SMDBGrid1TitleClick
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
        ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
        OnGetCellParams = SMDBGrid1GetCellParams
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 20
        RowCount = 2
        Columns = <
          item
            Expanded = False
            FieldName = 'REFERENCIA'
            Title.Alignment = taCenter
            Title.Caption = 'Refer'#234'ncia'
            Title.Color = 12058551
            Width = 127
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_COMBINACAO'
            Title.Alignment = taCenter
            Title.Caption = 'Cor'
            Title.Color = 12058551
            Width = 137
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NUM_ORDEM'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Ordem'
            Title.Color = 12058551
            Width = 57
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NUM_REMESSA'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Remessa'
            Title.Color = 12058551
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NUM_LOTE'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Lote'
            Title.Color = 12058551
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUM_TALAO'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Tal'#227'o'
            Title.Color = 12058551
            Width = 36
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'TAMANHO'
            Title.Alignment = taCenter
            Title.Caption = 'Tamanho'
            Title.Color = 12058551
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_SETOR'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Setor'
            Title.Color = 12058551
            Width = 190
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_ESTEIRA'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Esteira'
            Title.Color = 12058551
            Width = 64
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DTENTRADA'
            Title.Alignment = taCenter
            Title.Caption = 'Dt. Entrada'
            Title.Color = 12058551
            Width = 72
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'HRENTRADA'
            Title.Alignment = taCenter
            Title.Caption = 'Hora'
            Title.Color = 12058551
            Width = 45
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DTSAIDA'
            Title.Alignment = taCenter
            Title.Caption = 'Data Sa'#237'da'
            Title.Color = 12058551
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'HRSAIDA'
            Title.Alignment = taCenter
            Title.Caption = 'Hora'
            Title.Color = 12058551
            Width = 52
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QTD'
            Title.Alignment = taCenter
            Title.Caption = 'Qtde.'
            Title.Color = 12058551
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QTD_PENDENTE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Pendente'
            Title.Color = 12058551
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 72
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QTD_PRODUZIDO'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Produzido'
            Title.Color = 12058551
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTENTREGA'
            Title.Alignment = taCenter
            Title.Caption = 'Dt. Entrega'
            Title.Color = 12058551
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_PRODUTO'
            Title.Alignment = taCenter
            Title.Caption = 'ID Produto'
            Title.Color = 12058551
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ITEM'
            Title.Alignment = taCenter
            Title.Caption = 'Item (Tal'#227'o Setor)'
            Title.Color = 12058551
            Width = 42
            Visible = True
          end>
      end
      object StaticText1: TStaticText
        Left = 0
        Top = 495
        Width = 1326
        Height = 17
        Align = alBottom
        Caption = 'F3= Alterar Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object TS_Processo: TRzTabSheet
      Caption = 'Processos'
      object NxSplitter1: TNxSplitter
        Left = 0
        Top = 382
        Width = 1326
        Height = 10
        Cursor = crVSplit
        Align = alBottom
        AutoSnap = False
        Visible = False
      end
      object SMDBGrid2: TSMDBGrid
        Left = 0
        Top = 0
        Width = 1326
        Height = 382
        Align = alClient
        Ctl3D = False
        DataSource = DMLoteImp_Calc.dsConsProcesso
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
        ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
        OnGetCellParams = SMDBGrid2GetCellParams
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 19
        RowCount = 2
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QTD_LEITURA'
            Title.Alignment = taCenter
            Title.Caption = 'Leitura'
            Title.Color = 8454143
            Width = 53
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NUM_ORDEM'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Ordem'
            Title.Color = 8454143
            Width = 54
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NUM_LOTE'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Lote'
            Title.Color = 8454143
            Width = 57
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'REFERENCIA'
            Title.Alignment = taCenter
            Title.Caption = 'Refer'#234'ncia'
            Title.Color = 8454143
            Width = 169
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_PROCESSO'
            Title.Alignment = taCenter
            Title.Caption = 'Processo'
            Title.Color = 8454143
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DTENTRADA'
            Title.Alignment = taCenter
            Title.Caption = 'Dt. Entrada'
            Title.Color = 8454143
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DTBAIXA'
            Title.Alignment = taCenter
            Title.Caption = 'Dt. Ba'#237'xa'
            Title.Color = 8454143
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QTD'
            Title.Alignment = taCenter
            Title.Caption = 'Qtde.'
            Title.Color = 8454143
            Width = 53
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QTD_PRODUZIDO'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Produzido'
            Title.Color = 8454143
            Width = 51
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QTD_PENDENTE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Pendente'
            Title.Color = 8454143
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_SETOR'
            Title.Alignment = taCenter
            Title.Caption = 'Setor'
            Title.Color = 8454143
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_POSICAO'
            Title.Alignment = taCenter
            Title.Caption = 'Posi'#231#227'o'
            Title.Color = 8454143
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_MATERIAL'
            Title.Alignment = taCenter
            Title.Caption = 'Material'
            Title.Color = 8454143
            Width = 212
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID'
            Title.Alignment = taCenter
            Title.Caption = 'ID. Mov'
            Title.Color = 8454143
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ITEM'
            Title.Alignment = taCenter
            Title.Caption = 'Item'
            Title.Color = 8454143
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PEDIDO_CLIENTE'
            Title.Alignment = taCenter
            Title.Caption = 'Ped. Cliente'
            Title.Color = 8454143
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_PRODUTO'
            Title.Alignment = taCenter
            Title.Caption = 'Produto'
            Title.Color = 8454143
            Width = 238
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_COMBINACAO'
            Title.Alignment = taCenter
            Title.Caption = 'Combina'#231#227'o'
            Title.Color = 8454143
            Width = 202
            Visible = True
          end>
      end
      object smdbgridItens: TSMDBGrid
        Left = 0
        Top = 392
        Width = 1326
        Height = 120
        Align = alBottom
        Ctl3D = False
        DataSource = DMLoteImp_Calc.dsConsProcesso_Itens
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Visible = False
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
        ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 9
        RowCount = 2
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ITEM2'
            Title.Alignment = taCenter
            Title.Caption = 'Item'
            Title.Color = 16750026
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Alignment = taCenter
            Title.Caption = 'Descri'#231#227'o'
            Title.Color = 16750026
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DTENTRADA'
            Title.Alignment = taCenter
            Title.Caption = 'Dt. Entrada'
            Title.Color = 16750026
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'HRENTRADA'
            Title.Alignment = taCenter
            Title.Caption = 'Hr. Entrada'
            Title.Color = 16750026
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DTBAIXA'
            Title.Alignment = taCenter
            Title.Caption = 'Dt. Baixa'
            Title.Color = 16750026
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'HRBAIXA'
            Title.Alignment = taCenter
            Title.Caption = 'Hr. Baixa'
            Title.Color = 16750026
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID_FUNCIONARIO_ENT'
            Title.Alignment = taCenter
            Title.Caption = 'ID Funcion'#225'rio Entrada'
            Title.Color = 16750026
            Width = 130
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID_FUNCIONARIO_BAI'
            Title.Alignment = taCenter
            Title.Caption = 'ID. Funcion'#225'rio Baixa'
            Title.Color = 16750026
            Width = 114
            Visible = True
          end>
      end
    end
    object TS_Setor: TRzTabSheet
      Caption = 'Por Setor'
      object RzPageControl2: TRzPageControl
        Left = 0
        Top = 0
        Width = 1326
        Height = 512
        ActivePage = TS_Setor_Dados
        ActivePageDefault = TS_Setor_Dados
        Align = alClient
        TabIndex = 0
        TabOrder = 0
        FixedDimension = 19
        object TS_Setor_Dados: TRzTabSheet
          Caption = 'Setor'
          object SMDBGrid3: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1322
            Height = 489
            Align = alClient
            Ctl3D = False
            DataSource = DMLoteImp_Calc.dsConsTalao_Setor
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
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 11
            DefaultRowHeight = 17
            ScrollBars = ssHorizontal
            ColCount = 7
            RowCount = 2
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'ID_SETOR'
                Title.Alignment = taCenter
                Title.Caption = 'ID Setor'
                Title.Color = 16777170
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOME_SETOR'
                Title.Alignment = taCenter
                Title.Caption = 'Nome Setor'
                Title.Color = 16777170
                Width = 209
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOME_SETOR2'
                Title.Alignment = taCenter
                Title.Caption = 'Setor (Esteira)'
                Title.Color = 16777170
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'QTD'
                Title.Alignment = taCenter
                Title.Caption = 'Qtd.'
                Title.Color = 16777170
                Width = 114
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'QTD_PRODUZIDO'
                Title.Alignment = taCenter
                Title.Caption = 'Qtd. Produzido'
                Title.Color = 16777170
                Width = 97
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'QTD_PENDENTE'
                Title.Alignment = taCenter
                Title.Caption = 'Qtd. Pendente'
                Title.Color = 16777170
                Width = 87
                Visible = True
              end>
          end
        end
        object TS_Setor_Graf: TRzTabSheet
          Caption = 'Gr'#225'fico'
          object DBChart1: TDBChart
            Left = 0
            Top = 0
            Width = 904
            Height = 366
            BackWall.Brush.Color = clWhite
            BackWall.Brush.Style = bsClear
            MarginRight = 5
            Title.Font.Charset = ANSI_CHARSET
            Title.Font.Color = clBlue
            Title.Font.Height = -16
            Title.Font.Name = 'Verdana'
            Title.Font.Style = [fsBold]
            Title.Text.Strings = (
              'Qtd. Produzida')
            Legend.ColorWidth = 20
            Legend.Font.Charset = DEFAULT_CHARSET
            Legend.Font.Color = clBlack
            Legend.Font.Height = -11
            Legend.Font.Name = 'Arial'
            Legend.Font.Style = [fsItalic]
            Legend.HorizMargin = 2
            View3D = False
            View3DOptions.Elevation = 342
            View3DOptions.Zoom = 101
            Align = alClient
            BevelInner = bvRaised
            TabOrder = 0
            object Series1: TBarSeries
              Marks.ArrowLength = 20
              Marks.Style = smsValue
              Marks.Visible = True
              DataSource = DMLoteImp_Calc.cdsConsTalao_Setor
              SeriesColor = clRed
              XLabelsSource = 'NOME_SETOR'
              BarWidthPercent = 30
              XValues.DateTime = False
              XValues.Name = 'X'
              XValues.Multiplier = 1.000000000000000000
              XValues.Order = loAscending
              XValues.ValueSource = 'ID_SETOR'
              YValues.DateTime = False
              YValues.Name = 'Bar'
              YValues.Multiplier = 1.000000000000000000
              YValues.Order = loNone
              YValues.ValueSource = 'QTD_PRODUZIDO'
            end
          end
        end
        object TS_Setor_Ref: TRzTabSheet
          Caption = 'Setor Por Refer'#234'ncia'
          object SMDBGrid4: TSMDBGrid
            Left = 0
            Top = 0
            Width = 1322
            Height = 319
            Align = alClient
            Ctl3D = False
            DataSource = DMLoteImp_Calc.dsConsTalao_Setor_Ref
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnTitleClick = SMDBGrid4TitleClick
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
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 11
            DefaultRowHeight = 17
            ScrollBars = ssHorizontal
            ColCount = 7
            RowCount = 2
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'ID_SETOR'
                Title.Alignment = taCenter
                Title.Caption = 'ID Setor'
                Title.Color = 12910591
                Width = 52
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOME_SETOR'
                Title.Alignment = taCenter
                Title.Caption = 'Nome Setor'
                Title.Color = 12910591
                Width = 176
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'REFERENCIA'
                Title.Alignment = taCenter
                Title.Caption = 'Refer'#234'ncia'
                Title.Color = 12910591
                Width = 154
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'QTD'
                Title.Alignment = taCenter
                Title.Caption = 'Qtd.'
                Title.Color = 12910591
                Width = 81
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'QTD_PRODUZIDO'
                Title.Alignment = taCenter
                Title.Caption = 'Qtd. Produzido'
                Title.Color = 12910591
                Width = 89
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'QTD_PENDENTE'
                Title.Alignment = taCenter
                Title.Caption = 'Qtd. Pendente'
                Title.Color = 12910591
                Width = 89
                Visible = True
              end>
          end
          object SMDBGrid6: TSMDBGrid
            Left = 0
            Top = 319
            Width = 1322
            Height = 170
            Align = alBottom
            Ctl3D = False
            DataSource = DMLoteImp_Calc.dsConsTalao_Setor
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 1
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
            ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 11
            DefaultRowHeight = 17
            ScrollBars = ssHorizontal
            ColCount = 7
            RowCount = 2
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'ID_SETOR'
                Title.Alignment = taCenter
                Title.Caption = 'ID Setor'
                Title.Color = 16777170
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOME_SETOR'
                Title.Alignment = taCenter
                Title.Caption = 'Nome Setor'
                Title.Color = 16777170
                Width = 209
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOME_SETOR2'
                Title.Alignment = taCenter
                Title.Caption = 'Setor (Esteira)'
                Title.Color = 16777170
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'QTD'
                Title.Alignment = taCenter
                Title.Caption = 'Qtd.'
                Title.Color = 16777170
                Width = 114
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'QTD_PRODUZIDO'
                Title.Alignment = taCenter
                Title.Caption = 'Qtd. Produzido'
                Title.Color = 16777170
                Width = 97
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'QTD_PENDENTE'
                Title.Alignment = taCenter
                Title.Caption = 'Qtd. Pendente'
                Title.Color = 16777170
                Width = 87
                Visible = True
              end>
          end
        end
      end
    end
    object TS_Ref: TRzTabSheet
      Caption = 'Por Produto'
      object Panel3: TPanel
        Left = 0
        Top = 483
        Width = 1326
        Height = 29
        Align = alBottom
        Color = 11842740
        TabOrder = 2
        object Label2: TLabel
          Left = 166
          Top = 8
          Width = 73
          Height = 16
          Caption = 'Qtd. Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object DBText1: TDBText
          Left = 242
          Top = 8
          Width = 81
          Height = 15
          DataField = 'agTotal'
          DataSource = DMLoteImp_Calc.dsConsTalao_Ref
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object DBText2: TDBText
          Left = 432
          Top = 7
          Width = 81
          Height = 15
          DataField = 'agTotal_Prod'
          DataSource = DMLoteImp_Calc.dsConsTalao_Ref
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 324
          Top = 8
          Width = 103
          Height = 16
          Caption = 'Qtd. Produzido:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object DBText3: TDBText
          Left = 633
          Top = 8
          Width = 81
          Height = 15
          DataField = 'agTotal_Pend'
          DataSource = DMLoteImp_Calc.dsConsTalao_Ref
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 524
          Top = 8
          Width = 102
          Height = 16
          Caption = 'Qtd. Pendente:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object DBText4: TDBText
          Left = 776
          Top = 6
          Width = 81
          Height = 15
          DataField = 'agTotal2'
          DataSource = DMLoteImp_Calc.dsConsTalao_Ref
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 1326
        Height = 26
        Align = alTop
        Color = clSilver
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 11
          Width = 120
          Height = 13
          Caption = 'Setor Controle Produzido:'
        end
        object RxDBLookupCombo3: TRxDBLookupCombo
          Left = 130
          Top = 3
          Width = 241
          Height = 21
          DropDownCount = 8
          LookupField = 'ID'
          LookupDisplay = 'NOME'
          LookupSource = DMLoteImp_Calc.dsSetor
          TabOrder = 0
        end
      end
      object SMDBGrid5: TSMDBGrid
        Left = 0
        Top = 26
        Width = 1326
        Height = 457
        Align = alClient
        Ctl3D = False
        DataSource = DMLoteImp_Calc.dsConsTalao_Ref
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnTitleClick = SMDBGrid4TitleClick
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
        ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        RowCount = 2
        Columns = <
          item
            Expanded = False
            FieldName = 'REFERENCIA'
            Title.Alignment = taCenter
            Title.Caption = 'Refer'#234'ncia'
            Title.Color = 16756318
            Width = 164
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QTD'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd.'
            Title.Color = 16756318
            Width = 117
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QTD_PRODUZIDO'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Produzido'
            Title.Color = 16756318
            Width = 89
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QTD_PENDENTE'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Pendente'
            Title.Color = 16756318
            Width = 117
            Visible = True
          end>
      end
    end
  end
  object UCControls1: TUCControls
    GroupName = 'Consulta Lotes (Cal'#231'ados)'
    UserControl = fMenu.UserControl1
    NotAllowed = naDisabled
    Left = 782
    Top = 238
  end
  object PopupMenu1: TPopupMenu
    Left = 942
    Top = 208
    object AlterarData1: TMenuItem
      Caption = 'Alterar Data'
      OnClick = AlterarData1Click
    end
  end
end
