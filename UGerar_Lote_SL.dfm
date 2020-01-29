object frmGerar_Lote_SL: TfrmGerar_Lote_SL
  Left = 157
  Top = 62
  Width = 1006
  Height = 569
  Caption = 'Gerar Lote (3)'
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
  object RzPageControl2: TRzPageControl
    Left = 0
    Top = 0
    Width = 998
    Height = 538
    ActivePage = TS_Consulta
    ActivePageDefault = TS_Consulta
    Align = alClient
    BackgroundColor = 16752448
    BoldCurrentTab = True
    FlatColor = clGray
    ParentBackgroundColor = False
    TabColors.Shadow = clSilver
    TabIndex = 0
    TabOrder = 0
    OnChange = RzPageControl2Change
    FixedDimension = 19
    object TS_Consulta: TRzTabSheet
      Caption = 'Consultar Lote/Tal'#227'o'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 994
        Height = 32
        Align = alTop
        Color = 8404992
        TabOrder = 0
        object btnExcluir: TNxButton
          Left = 298
          Top = 1
          Width = 153
          Height = 30
          Caption = 'Excluir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Glyph.Data = {
            F6060000424DF606000000000000360000002800000018000000180000000100
            180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFDF4A5A19F5955581F1C260000070000
            0C1B2021595C59A7A8A3FEFEF5FFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCC1BEB93E3B4C00000B00004100008D
            010AB20C16BB0710B40002A1000073000033000006414247C9C7BEFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F4EE827F7B00003300007903
            18BA0717C6040FBB0008B10203AE0202AC0406A50004AD0306A7000096000052
            040325858782F4F6F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F1EB716F6B0000
            440014B5031CCB0011BB0003B50000BC0000BD0001BB0000BF0101BB0001BA00
            00B80102A702029F000079000023707376F3F4F1FFFFFFFFFFFFFFFFFFFCFBF7
            76757400004A0323D4011BD10007BB0000B90000BC0000BA0100BB0300BE0300
            C00100C10001BA0000BD0201BC0102AC0201A402009500002878797AFCFCFAFF
            FFFFFFFFFFB2ACA900013E0025CA021DD70008BF0000BB0000BF0000BF0000BE
            0100BF0200BF0200C10000C10001BD0000BE0000BD0101C00000B70200A30000
            80000024B3B3AFFFFFFFFFFFFC20213900169F022CE3010CCB0000C10000C500
            00C50000C50000C50000C70000C60000C50000C20102BF0100C40100C70000C7
            0001CA0002AF0202990000631E1F34FFFFFED8DACE0000340834F00420D80000
            C70000CE0000D20000D30000D40000D40000D50000D50000D40000D50000D000
            00D40000D60000D40100D30101C90002A103029C00000FDCDCD685858000028E
            0A36F60312D10000CC0000C90000B50000B10000B10000B10000B10000B10000
            B20000B50000B40000B50000B20000B50000C70000DA0100BA0107A00000488B
            8687403A3A002CDE032FE80006D80000C54947BA9694CF9797D19393CF9494CF
            9494CF9494CF9493CF9195D09594D19792D29696D28F94CF4948B80201CD0201
            C70006A10000873D393B0D0C121444FF0029E80000D53738CFDBDDEBFFFFFFFF
            FFFEFFFFFEFFFFFEFFFFFEFFFFFEFFFFFEFEFFFEFFFFFEFFFEFEFFFFFEFFFFFF
            DEDCEA3938D70000CF0005A30509B009061300020E0F4EFF002BEA0000D45B5A
            DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFF
            FFFFFFFFFFFFFFFFFFFFFC5A5EE00000D70007A10711B5000015000209144EFF
            002FEB0005E20806D49496DFFFFFFFF3F1FAF3F2FCF3F2FCF3F2FCF3F2FCF3F2
            FCF2F2FCF2F2FCF2F3FBF3F3FBFFFFFF9D93DA0D06D40000D20007A90B14BE00
            001209070C0C3FFF0537FB071BEE0000E20000DB0000D90706DA0405D80403D8
            0403D80403D80403D80304D80302DE0504D80708D70000D70000DA0000EC0107
            CA000BAF000FB40D0A0D373533001EC90543FF042CF20001E70000EF0000EE00
            00EB0000EA0000EA0000EA0000EA0000EA0000E60000EB0000EA0000E50000E8
            0000F20001EB000DB70015AF0000933C3B3E84838000006B1045FF033AF4061C
            EE0000EC0000F10000F10000F10000F10000F10000F00000F10100F10000F300
            00F00200EF0200F20000F7000BD40014B00417BE000051888588DEDAD300000C
            0B30EB0342FF0434F50413F10000F00000F20000F40000F30000F30000F20000
            F50100F80000F50000F70100F90300F8000ADF0017BA0018BD070FBA000009DC
            DCD4FFFFFE211B270005820A3AFE0341FA0532F70317F20104F30000F60000F8
            0000FB0000F80100F90000F80000F70000FC0003F4000EE0001AC4001DBD0317
            C8000071211D2EFFFFFEFFFFFFB4B3A80000210215B2083FFF0444FB0235F502
            24F10413F50307F80001F80000F80100F90001F70004F6000CED0018D9001FCA
            0023C7041DCE0006A3000024B3B2ABFFFFFFFDFFFFFCFCFA7A767100002D0214
            C10D39FA0743FF003CF50234F1022AEE0324EB031CEF001AEC001EE40222E101
            26D70028D00427D1051CD60007B700002F767670FBFCF9FFFEFFF9FCFFFFFFFF
            F5F4EE73726C00002E0004A80822EE0A39FB013EF7003BF3053BE90135E20037
            DF0231DD002EDB002DDB0225DD0815D40001A200003571716AF3F3ECFFFFFFFE
            FDFDFDFBFFFEFDFCFFFFFFF7F7F284838100002D000072070BCF081DF40428F7
            0429F70529EE0528EE0525EB051DEE0618EA0208C7000073000031848383F7F7
            F1FFFFFFFFFCFFFEFEFBFFFBFAFBFDFEFAFFFDFFFFFFFFFFFDC4C2BA3E3F4D00
            00160000590000B90000FF0D10FF0C0CFF0000FF0000BA00005F000014403E49
            C2C2BBFFFFFEFEFFFFFAFDFDFEFDFDFFFFFCFBFFFBFFFFFEFFFBFFFBFDFCFCFF
            FFFFFFFFFFFFFDF9F9EAA8A59F5C5A5D1C1E250000100000111F1D22585B539F
            A29CF5F6EEFFFFFDFFFFFFFEFFFFFDFEFCFCFBFEFFFEFCFBFFFF}
          GlyphSpacing = 5
          ParentFont = False
          TabOrder = 0
          Transparent = True
          OnClick = btnExcluirClick
        end
        object btnImprimir: TNxButton
          Left = 450
          Top = 1
          Width = 153
          Height = 30
          Caption = 'Imprimir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
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
          PopupMenu = PopupMenu1
          ShowArrow = True
          TabOrder = 1
          Transparent = True
        end
      end
      object pnlPesquisa: TPanel
        Left = 0
        Top = 32
        Width = 994
        Height = 105
        Align = alTop
        Color = clSilver
        TabOrder = 1
        object NxLabel3: TNxLabel
          Left = 215
          Top = 49
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
        object NxLabel4: TNxLabel
          Left = 53
          Top = 29
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
        object NxLabel5: TNxLabel
          Left = 215
          Top = 29
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
          Left = 71
          Top = 68
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
        object NxLabel7: TNxLabel
          Left = 51
          Top = 89
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
        object NxLabel2: TNxLabel
          Left = 8
          Top = 9
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
        object Label1: TLabel
          Left = 390
          Top = 27
          Width = 104
          Height = 13
          Alignment = taRightJustify
          Caption = 'N'#186' OC Pedido Cliente:'
        end
        object Label3: TLabel
          Left = 421
          Top = 46
          Width = 74
          Height = 13
          Alignment = taRightJustify
          Caption = 'N'#186' Lote Cliente:'
        end
        object Label4: TLabel
          Left = 653
          Top = 27
          Width = 223
          Height = 13
          Caption = 'Informe e pressione Enter para mostrar o N'#186' OC'
        end
        object Label9: TLabel
          Left = 614
          Top = 86
          Width = 56
          Height = 13
          Caption = 'J'#225' Impresso'
        end
        object Shape13: TShape
          Left = 582
          Top = 84
          Width = 30
          Height = 16
          Brush.Color = clOlive
        end
        object DateEdit1: TDateEdit
          Left = 108
          Top = 41
          Width = 100
          Height = 21
          Ctl3D = False
          NumGlyphs = 2
          ParentCtl3D = False
          TabOrder = 3
        end
        object DateEdit2: TDateEdit
          Left = 242
          Top = 41
          Width = 100
          Height = 21
          Ctl3D = False
          NumGlyphs = 2
          ParentCtl3D = False
          TabOrder = 4
        end
        object CurrencyEdit1: TCurrencyEdit
          Left = 108
          Top = 21
          Width = 100
          Height = 21
          AutoSize = False
          Ctl3D = False
          DecimalPlaces = 0
          DisplayFormat = '0'
          ParentCtl3D = False
          TabOrder = 1
        end
        object CurrencyEdit2: TCurrencyEdit
          Left = 242
          Top = 21
          Width = 100
          Height = 21
          AutoSize = False
          Ctl3D = False
          DecimalPlaces = 0
          DisplayFormat = '0'
          ParentCtl3D = False
          TabOrder = 2
        end
        object cbxOpcao: TNxComboBox
          Left = 108
          Top = 61
          Width = 100
          Height = 21
          Cursor = crArrow
          BevelOuter = bvSpace
          TabOrder = 5
          Text = 'Pendente'
          ReadOnly = True
          HideFocus = False
          Style = dsDropDownList
          AutoCompleteDelay = 0
          ItemIndex = 0
          Items.Strings = (
            'Pendente'
            'Produzido'
            '')
        end
        object RxDBLookupCombo1: TRxDBLookupCombo
          Left = 108
          Top = 81
          Width = 232
          Height = 21
          DropDownCount = 8
          Ctl3D = False
          LookupField = 'ID'
          LookupDisplay = 'REFERENCIA'
          LookupSource = DMCadLote.dsProduto
          ParentCtl3D = False
          TabOrder = 6
          OnEnter = RxDBLookupCombo1Enter
          OnKeyDown = RxDBLookupCombo1KeyDown
        end
        object cbxOpcaoData: TNxComboBox
          Left = 29
          Top = 46
          Width = 77
          Height = 16
          Cursor = crArrow
          TabStop = False
          BevelOuter = bvSpace
          BorderStyle = bsNone
          Color = clSilver
          TabOrder = 10
          Text = 'Dt. Emiss'#227'o:'
          ReadOnly = True
          HideFocus = False
          Style = dsDropDownList
          AutoCompleteDelay = 0
          ItemIndex = 0
          Items.Strings = (
            'Dt. Emiss'#227'o:'
            'Dt. Entrega:')
        end
        object btnConsultar: TNxButton
          Left = 340
          Top = 73
          Width = 175
          Height = 30
          Caption = 'Efetuar Pesquisa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
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
          TabOrder = 9
          Transparent = True
          OnClick = btnConsultarClick
        end
        object CurrencyEdit3: TCurrencyEdit
          Left = 108
          Top = 1
          Width = 100
          Height = 21
          AutoSize = False
          Ctl3D = False
          DecimalPlaces = 0
          DisplayFormat = '0'
          ParentCtl3D = False
          TabOrder = 0
          OnKeyDown = CurrencyEdit3KeyDown
        end
        object Edit1: TEdit
          Left = 496
          Top = 21
          Width = 154
          Height = 19
          CharCase = ecUpperCase
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 7
        end
        object CurrencyEdit5: TCurrencyEdit
          Left = 496
          Top = 39
          Width = 121
          Height = 21
          AutoSize = False
          Ctl3D = False
          DecimalPlaces = 0
          DisplayFormat = '0'
          ParentCtl3D = False
          TabOrder = 8
          OnKeyDown = CurrencyEdit5KeyDown
        end
        object ckImpMaterial: TCheckBox
          Left = 497
          Top = 4
          Width = 155
          Height = 17
          Caption = 'Imprimir os materiais'
          Checked = True
          State = cbChecked
          TabOrder = 11
        end
      end
      object SMDBGrid2: TSMDBGrid
        Left = 0
        Top = 137
        Width = 994
        Height = 361
        Align = alClient
        Ctl3D = False
        DataSource = DMCadLote.dsConsulta_Lote_SL
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = SMDBGrid2DblClick
        OnTitleClick = SMDBGrid2TitleClick
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
        OnGetCellParams = SMDBGrid2GetCellParams
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 27
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 15
        RowCount = 2
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NUM_ORDEM'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Ordem Produ'#231#227'o'
            Title.Color = 13041606
            Width = 57
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NUM_LOTE'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Lote'
            Title.Color = 13041606
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO_TIPO'
            Title.Alignment = taCenter
            Title.Caption = 'Tipo'
            Title.Color = 13041606
            Width = 128
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'REFERENCIA'
            Title.Alignment = taCenter
            Title.Caption = 'Refer'#234'ncia'
            Title.Color = 13041606
            Width = 126
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_COMBINACAO'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Cor'
            Title.Color = 13041606
            Width = 147
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'UNIDADE'
            Title.Alignment = taCenter
            Title.Caption = 'Unid.'
            Title.Color = 13041606
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QTD'
            Title.Color = 13041606
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DTENTREGA'
            Title.Alignment = taCenter
            Title.Caption = 'Data Entrega'
            Title.Color = 13041606
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_PRODUTO'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Produto'
            Title.Color = 13041606
            Width = 195
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DTEMISSAO'
            Title.Alignment = taCenter
            Title.Caption = 'Data Emiss'#227'o'
            Title.Color = 13041606
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBS_PED'
            Title.Alignment = taCenter
            Title.Caption = 'Pedido(s)'
            Title.Color = 13041606
            Width = 170
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID_PRODUTO'
            Title.Alignment = taCenter
            Title.Caption = 'ID Produto'
            Title.Color = 13041606
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_ORIGINAL'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Original'
            Title.Color = 13041606
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'FILIAL'
            Title.Alignment = taCenter
            Title.Caption = 'Filial'
            Title.Color = 13041606
            Width = 24
            Visible = True
          end>
      end
      object StaticText3: TStaticText
        Left = 0
        Top = 498
        Width = 994
        Height = 17
        Align = alBottom
        Caption = 'Duplo clique para alterar a quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
    end
    object TS_Gerar: TRzTabSheet
      Caption = 'Gerar Lote/Tal'#227'o'
      object NxSplitter1: TNxSplitter
        Left = 0
        Top = 332
        Width = 994
        Height = 7
        Cursor = crVSplit
        Align = alBottom
        ResizeStyle = rsLine
      end
      object NxPanel1: TNxPanel
        Left = 0
        Top = 164
        Width = 994
        Height = 7
        Align = alTop
        BackgroundStyle = pbTransparent
        BorderPen.Style = psClear
        Ctl3D = False
        UseDockManager = False
        ParentBackground = False
        ParentCtl3D = False
        TabOrder = 0
      end
      object SMDBGrid1: TSMDBGrid
        Left = 0
        Top = 171
        Width = 994
        Height = 161
        Align = alClient
        Ctl3D = False
        DataSource = DMCadLote.dsPendente
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        PopupMenu = PopupMenu2
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = SMDBGrid1DblClick
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
        ExOptions = [eoDisableDelete, eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
        OnGetCellParams = SMDBGrid1GetCellParams
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 16
        ScrollBars = ssHorizontal
        ColCount = 19
        RowCount = 2
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'SELECIONADO'
            PickList.Strings = (
              'S'
              'N')
            Title.Alignment = taCenter
            Title.Caption = 'Selecionado'
            Title.Color = 16777158
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FILIAL'
            Title.Color = 16777158
            Width = 27
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NUM_PEDIDO'
            Title.Color = 16777158
            Width = 60
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'PEDIDO_CLIENTE'
            Title.Color = 16777158
            Width = 102
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ITEM'
            Title.Color = 16777158
            Width = 34
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DTENTREGA'
            Title.Color = 16777158
            Width = 68
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'REFERENCIA'
            Title.Color = 16777158
            Width = 111
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ENCERADO'
            Title.Alignment = taCenter
            Title.Caption = 'Encerado'
            Title.Color = 16777158
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'UNIDADE'
            Title.Alignment = taCenter
            Title.Caption = 'Unid.'
            Title.Color = 16777158
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'QTD_RESTANTE'
            Title.Alignment = taCenter
            Title.Caption = 'Qtde. Pedido'
            Title.Color = 16777158
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_COMBINACAO'
            Title.Color = 16777158
            Width = 208
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONSUMO_CALC'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. A Produzir'
            Title.Color = 16777158
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'UNIDADE_MAT'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Title.Alignment = taCenter
            Title.Caption = 'Unid. A Produzir'
            Title.Color = 16777158
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 62
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMEPRODUTO'
            Title.Color = 16777158
            Width = 228
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FANTASIA'
            Title.Caption = 'Cliente'
            Title.Color = 16777158
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DTEMISSAO'
            Title.Color = 16777158
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_CONSUMO_MAT'
            Title.Alignment = taCenter
            Title.Caption = 'Consumo Unit'#225'rio'
            Title.Color = 16777158
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID_PRODUTO'
            Title.Color = 16777158
            Width = 44
            Visible = True
          end>
      end
      object NxFlipPanel1: TNxFlipPanel
        Left = 0
        Top = 0
        Width = 994
        Height = 83
        Align = alTop
        Caption = 'Dados para Consulta'
        CollapseGlyph.Data = {
          7A010000424D7A01000000000000360000002800000009000000090000000100
          2000000000004401000000000000000000000000000000000000604830406048
          30FF604830FF604830FF604830FF604830FF604830FF604830FF60483040C0A8
          90FFFFF0E0FFE0D0C0FFE0C8B0FFE0C0B0FFD0B8A0FFD0B8A0FFD0B8A0FF6048
          30FFC0A890FFFFF8F0FFFFF0E0FFF0E0E0FFF0D8D0FFF0D8C0FFF0D0C0FFD0B8
          A0FF604830FFC0A890FFFFF8FFFFFFF8F0FFFFF0E0FFF0E0E0FFF0D8D0FFF0D0
          C0FFD0B8A0FF604830FFC0A8A0FFFFFFFFFF604830FF604830FF604830FF6048
          30FF604830FFE0C0B0FF604830FFC0A8A0FFFFFFFFFFFFFFFFFFFFF8FFFFFFF0
          F0FFFFF0E0FFF0E8E0FFE0C0B0FF604830FFC0B0A0FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF8FFFFFFF0F0FFFFF0E0FFE0D0C0FF604830FFC0B0A0FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF8FFFFFFF0F0FFF0F0E0FF604830FFC0B0A040C0B0
          A0FFC0B0A0FFC0A8A0FFC0A8A0FFC0A8A0FFC0A890FFC0A090FF60483040}
        Color = clSilver
        ExpandGlyph.Data = {
          7A010000424D7A01000000000000360000002800000009000000090000000100
          2000000000004401000000000000000000000000000000000000604830406048
          30FF604830FF604830FF604830FF604830FF604830FF604830FF60483040C0A8
          90FFFFF0E0FFE0D0C0FFE0C8B0FFE0C0B0FFD0B8A0FFD0B8A0FFD0B8A0FF6048
          30FFC0A890FFFFF8F0FFFFF0E0FFF0E0E0FF604830FFF0D8C0FFF0D0C0FFD0B8
          A0FF604830FFC0A890FFFFF8FFFFFFF8F0FFFFF0E0FF604830FFF0D8D0FFF0D0
          C0FFD0B8A0FF604830FFC0A8A0FFFFFFFFFF604830FF604830FF604830FF6048
          30FF604830FFE0C0B0FF604830FFC0A8A0FFFFFFFFFFFFFFFFFFFFF8FFFF6048
          30FFFFF0E0FFF0E8E0FFE0C0B0FF604830FFC0B0A0FFFFFFFFFFFFFFFFFFFFFF
          FFFF604830FFFFF0F0FFFFF0E0FFE0D0C0FF604830FFC0B0A0FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF8FFFFFFF0F0FFF0F0E0FF604830FFC0B0A040C0B0
          A0FFC0B0A0FFC0A8A0FFC0A8A0FFC0A8A0FFC0A890FFC0A090FF60483040}
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Style = []
        FullHeight = 0
        object Label6: TLabel
          Left = 24
          Top = 29
          Width = 86
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dt.Emiss'#227'o Inicial:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 26
          Top = 49
          Width = 84
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dt.Entrega Inicial:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 75
          Top = 69
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cliente:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label16: TLabel
          Left = 243
          Top = 49
          Width = 22
          Height = 13
          Alignment = taRightJustify
          Caption = 'Final'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 240
          Top = 29
          Width = 25
          Height = 13
          Alignment = taRightJustify
          Caption = 'Final:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object DateEdit6: TDateEdit
          Left = 112
          Top = 21
          Width = 100
          Height = 21
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          NumGlyphs = 2
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
        end
        object DateEdit8: TDateEdit
          Left = 112
          Top = 41
          Width = 100
          Height = 21
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          NumGlyphs = 2
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
        end
        object Edit5: TEdit
          Left = 112
          Top = 61
          Width = 252
          Height = 19
          CharCase = ecUpperCase
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 30
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
        end
        object DateEdit9: TDateEdit
          Left = 264
          Top = 41
          Width = 100
          Height = 21
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          NumGlyphs = 2
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 3
        end
        object DateEdit7: TDateEdit
          Left = 264
          Top = 21
          Width = 100
          Height = 21
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          NumGlyphs = 2
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 4
        end
        object ckFaturado: TNxCheckBox
          Left = 368
          Top = 21
          Width = 153
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          Text = 'ckFaturado'
          Caption = 'Pesquisar Pedido Faturado'
        end
        object btnConsultar_Pedidos: TNxButton
          Left = 366
          Top = 50
          Width = 190
          Height = 30
          Caption = 'Pedidos Pendentes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
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
          TabOrder = 6
          Transparent = True
          OnClick = btnConsultar_PedidosClick
        end
      end
      object NxFlipPanel2: TNxFlipPanel
        Left = 0
        Top = 83
        Width = 994
        Height = 81
        Align = alTop
        BorderColor = clTeal
        Caption = 'Dados para gera'#231#227'o da Ordem de Produ'#231#227'o'
        CollapseGlyph.Data = {
          7A010000424D7A01000000000000360000002800000009000000090000000100
          2000000000004401000000000000000000000000000000000000604830406048
          30FF604830FF604830FF604830FF604830FF604830FF604830FF60483040C0A8
          90FFFFF0E0FFE0D0C0FFE0C8B0FFE0C0B0FFD0B8A0FFD0B8A0FFD0B8A0FF6048
          30FFC0A890FFFFF8F0FFFFF0E0FFF0E0E0FFF0D8D0FFF0D8C0FFF0D0C0FFD0B8
          A0FF604830FFC0A890FFFFF8FFFFFFF8F0FFFFF0E0FFF0E0E0FFF0D8D0FFF0D0
          C0FFD0B8A0FF604830FFC0A8A0FFFFFFFFFF604830FF604830FF604830FF6048
          30FF604830FFE0C0B0FF604830FFC0A8A0FFFFFFFFFFFFFFFFFFFFF8FFFFFFF0
          F0FFFFF0E0FFF0E8E0FFE0C0B0FF604830FFC0B0A0FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF8FFFFFFF0F0FFFFF0E0FFE0D0C0FF604830FFC0B0A0FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF8FFFFFFF0F0FFF0F0E0FF604830FFC0B0A040C0B0
          A0FFC0B0A0FFC0A8A0FFC0A8A0FFC0A8A0FFC0A890FFC0A090FF60483040}
        ExpandGlyph.Data = {
          7A010000424D7A01000000000000360000002800000009000000090000000100
          2000000000004401000000000000000000000000000000000000604830406048
          30FF604830FF604830FF604830FF604830FF604830FF604830FF60483040C0A8
          90FFFFF0E0FFE0D0C0FFE0C8B0FFE0C0B0FFD0B8A0FFD0B8A0FFD0B8A0FF6048
          30FFC0A890FFFFF8F0FFFFF0E0FFF0E0E0FF604830FFF0D8C0FFF0D0C0FFD0B8
          A0FF604830FFC0A890FFFFF8FFFFFFF8F0FFFFF0E0FF604830FFF0D8D0FFF0D0
          C0FFD0B8A0FF604830FFC0A8A0FFFFFFFFFF604830FF604830FF604830FF6048
          30FF604830FFE0C0B0FF604830FFC0A8A0FFFFFFFFFFFFFFFFFFFFF8FFFF6048
          30FFFFF0E0FFF0E8E0FFE0C0B0FF604830FFC0B0A0FFFFFFFFFFFFFFFFFFFFFF
          FFFF604830FFFFF0F0FFFFF0E0FFE0D0C0FF604830FFC0B0A0FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF8FFFFFFF0F0FFF0F0E0FF604830FFC0B0A040C0B0
          A0FFC0B0A0FFC0A8A0FFC0A8A0FFC0A8A0FFC0A890FFC0A090FF60483040}
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Style = []
        ParentFont = False
        FullHeight = 0
        object Label5: TLabel
          Left = 464
          Top = 28
          Width = 90
          Height = 13
          Caption = 'Descri'#231#227'o do Lote:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 16
          Top = 38
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Caption = 'Data Entrega:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Shape4: TShape
          Left = 504
          Top = 61
          Width = 29
          Height = 16
          Brush.Color = 16777147
        end
        object Label13: TLabel
          Left = 536
          Top = 64
          Width = 59
          Height = 13
          Caption = 'Selecionado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 792
          Top = 44
          Width = 73
          Height = 16
          Caption = 'Qtd. Total:'
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold, fsUnderline]
          ParentColor = False
          ParentFont = False
        end
        object Label12: TLabel
          Left = 792
          Top = 60
          Width = 73
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = '0'
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Edit2: TEdit
          Left = 556
          Top = 20
          Width = 217
          Height = 19
          CharCase = ecUpperCase
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 30
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
        end
        object DateEdit3: TDateEdit
          Left = 84
          Top = 30
          Width = 100
          Height = 21
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          NumGlyphs = 2
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
        end
        object ckDtEntrega: TCheckBox
          Left = 200
          Top = 30
          Width = 153
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Separar por data de entrega'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = ckDtEntregaClick
        end
        object ckAgrupar: TCheckBox
          Left = 644
          Top = 57
          Width = 101
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Agrupar Produtos'
          Checked = True
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          State = cbChecked
          TabOrder = 3
          Visible = False
        end
        object ckAgrupar_Pedido: TCheckBox
          Left = 85
          Top = 56
          Width = 92
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Agrupar Pedido'
          Checked = True
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          State = cbChecked
          TabOrder = 4
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 339
        Width = 994
        Height = 35
        Align = alBottom
        Color = 8404992
        TabOrder = 4
        object Label8: TLabel
          Left = 432
          Top = 8
          Width = 418
          Height = 16
          Caption = 'Clicar com o bot'#227'o direito do mouse para selecionar os pedidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object btnGerarAuxiliar: TNxButton
          Left = 11
          Top = 2
          Width = 190
          Height = 30
          Caption = 'Gerar Auxiliar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Glyph.Data = {
            AE060000424DAE06000000000000360000002800000017000000170000000100
            1800000000007806000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFF3F9F4C6CEC7799D7C4D7B4D235C241C561C225E
            224B7B507B9C7CC6CEC7F4F9F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF95A996456A443E663E29682B306B30
            3871373B713A386C3731643129642B3D663D456C4494AA97FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF000000FFFFFFFFFEFFFFFFFFFFFFFF4E794D2A602A4F844F0F
            5E0F055A08005001015004014E03004B01004700054C050E4C0E4D774F2B622A
            4C7A4EFFFFFFFFFFFFFEFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF4868483F6E
            402F7B30005400045C07075A0B06590906550907550A075309064F08034C0601
            4B03003D002E64303F6C4349694DFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
            4D7A4E3E6B3F207723005B0208610E075F0B065B0900560105570907550A0854
            0B085109054F07064C07034C080042001E5B1D3D6B414D7B4FFFFFFFFFFFFF00
            0000FFFFFF97AA992A6028308833006400076809076508056308005600397739
            04550500550505560707540B065309065008044D06034D050042002F65312860
            2898AA99FFFFFF000000F5F9F64266464F9051006100066B0C07690A07670A00
            54004B854CFFFFFFA6C1A6004D0000550306550908530A075209065007044C05
            044B09003E004E7850456D46F6F9F6000000C6CEC63F6640107C12056D09066C
            0A056A0A0059003C7F3BFFFFFFFFFFFFFFFFFFABC6AD004D0203550605550908
            550B065209054F07044C06014C040D4C0F3B643CC6CFC600000079997A37823A
            2183260F761407720E005E00559256FFFFFFFFFFFFFEFEFEFEFFFEFFFFFFBED2
            C0004A0002540506560806540907530A064F08034D05054C062A632B7DA08000
            00004A7B4D4C954F29892F218426006500639E66FFFFFFFFFFFFFEFEFFFFFFFF
            FFFFFFFFFEFFFFFFFFA6C1A8004B0002550506550907540A085209054F080047
            002E6330517E52000000245E2767AE6D39964028872D79B37DFFFFFFF7F9F9F9
            FCFAFFFFFFD2DFD1FCFEFDFFFFFFFFFFFFFFFFFFBED2C0014E02005503055608
            07540A075309004C01376C3427612A0000001F562078BA80479F4D449948DFEF
            DFF6FBF8F0F4EDFFFFFFB4CFB5004F00639663FFFFFFFFFFFFFEFEFFFFFFFFAD
            C6B0014D0200550207540A07540A014E033970371B561C000000275E2782BF87
            5DAA604DA0533D9141F1FAF0FFFFFFBAD4B8005B00006A04005A00689967FFFF
            FFFFFFFFFEFFFFFFFFFFA9C4AC004B00015605065509014F0436723529602900
            000048764A7DB18171B87565B16957A55A519E56A2CCA4248729177A20016D06
            056E0A005400568C55FFFFFFFFFFFFFFFFFEFFFFFFC0D6C30048000055040052
            022E6C2E517D530000007494746B9F6F89C88B75B7776BB26F5BA85F45994C4E
            9C51429748258227006604006E090056006E9C6DFFFFFFFFFFFFFEFEFFFFFFFF
            B3C9B4145F150157062A682D7B9F80000000C4CCC4476C46A0D3A382C3887EBC
            8072B67569AE6B5DA76153A2554E9D52358F3A0B7110006C030055005B8E59FF
            FFFFFFFFFFFFFFFFAEC9B00053000D600F3E653EC6CFC6000000F6FBF72E572F
            B5CFB495CC9B8FC69183BF8779B97C6EB17263AA675AA45D519E5446984E2885
            2D0C7413005100639261FFFFFFB6D0B50044000051004D8452456A45F6FBF700
            0000FFFFFF9BAA9A1F571FDBF9DD99CC9C92C79789C28A7DB98271B37868AD6B
            5CA661549F5B4C9A503F8F422F89350D6D143A8537006208005900338035295C
            299BAE9AFFFFFF000000FEFFFFFFFFFF45744B507850D2F0D2A1D0A798CC9D91
            C79384C0887CBA8070B27466AD685CA460519C5546954B3F8F432B83321E7922
            36873B3E6C3E4E7C51FFFFFFFFFEFF000000FFFFFFFFFFFFFFFFFF4160404F77
            4FE9FFEAAAD7AE9FCEA093C7988AC28D81BA8376B5786CAD6F60A664569D5A49
            984D32893961A8653B6C3C476848FFFFFFFFFFFFFFFFFF000000FFFFFFFFFEFF
            FFFFFFFFFFFF45744A20561EC3D8C3C0E5C3B1DDB69ED0A493C69587BF8A7EBA
            7F71B37570B37564AB6B81AE822259234F7A4FFFFFFFFFFFFFFFFFFEFFFFFF00
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9BAB9B29552C466B4985AA849EC5A0
            B2D5B5B0D8B5A0CCA482B2856295644169433B5D3C99AE9BFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FCF6C3
            CBC3719270447545255F24225624245E28457649739575C5CDC5F6FBF7FFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
          GlyphSpacing = 5
          ParentFont = False
          TabOrder = 0
          Transparent = True
          OnClick = btnGerarAuxiliarClick
        end
      end
      object NxFlipPanel3: TNxFlipPanel
        Left = 0
        Top = 374
        Width = 994
        Height = 141
        Align = alBottom
        BorderColor = clTeal
        Caption = 'Dados para gera'#231#227'o da Ordem de Produ'#231#227'o'
        CollapseGlyph.Data = {
          7A010000424D7A01000000000000360000002800000009000000090000000100
          2000000000004401000000000000000000000000000000000000604830406048
          30FF604830FF604830FF604830FF604830FF604830FF604830FF60483040C0A8
          90FFFFF0E0FFE0D0C0FFE0C8B0FFE0C0B0FFD0B8A0FFD0B8A0FFD0B8A0FF6048
          30FFC0A890FFFFF8F0FFFFF0E0FFF0E0E0FFF0D8D0FFF0D8C0FFF0D0C0FFD0B8
          A0FF604830FFC0A890FFFFF8FFFFFFF8F0FFFFF0E0FFF0E0E0FFF0D8D0FFF0D0
          C0FFD0B8A0FF604830FFC0A8A0FFFFFFFFFF604830FF604830FF604830FF6048
          30FF604830FFE0C0B0FF604830FFC0A8A0FFFFFFFFFFFFFFFFFFFFF8FFFFFFF0
          F0FFFFF0E0FFF0E8E0FFE0C0B0FF604830FFC0B0A0FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF8FFFFFFF0F0FFFFF0E0FFE0D0C0FF604830FFC0B0A0FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF8FFFFFFF0F0FFF0F0E0FF604830FFC0B0A040C0B0
          A0FFC0B0A0FFC0A8A0FFC0A8A0FFC0A8A0FFC0A890FFC0A090FF60483040}
        ExpandGlyph.Data = {
          7A010000424D7A01000000000000360000002800000009000000090000000100
          2000000000004401000000000000000000000000000000000000604830406048
          30FF604830FF604830FF604830FF604830FF604830FF604830FF60483040C0A8
          90FFFFF0E0FFE0D0C0FFE0C8B0FFE0C0B0FFD0B8A0FFD0B8A0FFD0B8A0FF6048
          30FFC0A890FFFFF8F0FFFFF0E0FFF0E0E0FF604830FFF0D8C0FFF0D0C0FFD0B8
          A0FF604830FFC0A890FFFFF8FFFFFFF8F0FFFFF0E0FF604830FFF0D8D0FFF0D0
          C0FFD0B8A0FF604830FFC0A8A0FFFFFFFFFF604830FF604830FF604830FF6048
          30FF604830FFE0C0B0FF604830FFC0A8A0FFFFFFFFFFFFFFFFFFFFF8FFFF6048
          30FFFFF0E0FFF0E8E0FFE0C0B0FF604830FFC0B0A0FFFFFFFFFFFFFFFFFFFFFF
          FFFF604830FFFFF0F0FFFFF0E0FFE0D0C0FF604830FFC0B0A0FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF8FFFFFFF0F0FFF0F0E0FF604830FFC0B0A040C0B0
          A0FFC0B0A0FFC0A8A0FFC0A8A0FFC0A8A0FFC0A890FFC0A090FF60483040}
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Style = []
        ParentFont = False
        FullHeight = 0
        object NxButton1: TNxButton
          Left = 0
          Top = 18
          Width = 156
          Height = 123
          Align = alLeft
          Caption = 'Cons. Estoque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
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
          TabOrder = 0
          Transparent = True
          OnClick = NxButton1Click
        end
        object SMDBGrid3: TSMDBGrid
          Left = 156
          Top = 18
          Width = 838
          Height = 123
          Align = alClient
          Ctl3D = False
          DataSource = DMCadLote.dsEstoque_Semi
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ParentFont = False
          PopupMenu = PopupMenu2
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlue
          TitleFont.Height = -13
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
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
          ExOptions = [eoDisableDelete, eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
          RegistryKey = 'Software\Scalabium'
          RegistrySection = 'SMDBGrid'
          WidthOfIndicator = 11
          DefaultRowHeight = 19
          ScrollBars = ssHorizontal
          ColCount = 8
          RowCount = 2
          Columns = <
            item
              Expanded = False
              FieldName = 'REF_MATERIAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Refer'#234'ncia'
              Title.Color = 12124017
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlue
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 89
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ID_COR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'ID Cor'
              Title.Color = 12124017
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlue
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 43
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_COMBINACAO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Caption = 'Nome Cor'
              Title.Color = 12124017
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlue
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 136
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOT_CONSUMO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Consumo Total'
              Title.Color = 12124017
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlue
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 81
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'UNIDADE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Unid'
              Title.Color = 12124017
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlue
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTOQUE_ATUAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Qtd. Estoque'
              Title.Color = 12124017
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlue
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 96
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_MATERIAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Nome Material'
              Title.Color = 12124017
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlue
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 234
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_MATERIAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'ID Material'
              Title.Color = 12124017
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clBlue
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end>
        end
      end
    end
    object TS_Pedidos: TRzTabSheet
      Caption = 'Pedidos com ordem de produ'#231#227'o'
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 994
        Height = 51
        Align = alTop
        BevelInner = bvRaised
        Color = clSilver
        TabOrder = 0
        object NxLabel15: TNxLabel
          Left = 23
          Top = 31
          Width = 87
          Height = 13
          Alignment = taRightJustify
          Caption = 'N'#186' Pedido Interno:'
          Transparent = False
          HorizontalPosition = hpLeft
          InnerHorizontal = True
          InnerVertical = False
          InnerMargins.Horizontal = 0
          InnerMargins.Vertical = 2
          VerticalPosition = vpTop
        end
        object btnConsultar_Pedidos_Ord: TNxButton
          Left = 217
          Top = 14
          Width = 190
          Height = 30
          Caption = 'Efetuar Pesquisa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
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
          TabOrder = 0
          Transparent = True
        end
        object CurrencyEdit7: TCurrencyEdit
          Left = 112
          Top = 23
          Width = 100
          Height = 21
          AutoSize = False
          Ctl3D = False
          DecimalPlaces = 0
          DisplayFormat = '0'
          ParentCtl3D = False
          TabOrder = 1
        end
      end
      object SMDBGrid4: TSMDBGrid
        Left = 0
        Top = 51
        Width = 994
        Height = 464
        Align = alClient
        Ctl3D = False
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
        ExOptions = [eoCheckBoxSelect, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 27
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 6
        RowCount = 2
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NUM_PEDIDO'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Pedido Interno'
            Width = 95
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PEDIDO_CLIENTE'
            Title.Alignment = taCenter
            Title.Caption = 'Pedido Cliente'
            Width = 155
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NUM_ORDEM'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Ordem Produ'#231#227'o'
            Width = 121
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_CLIENTE'
            Title.Alignment = taCenter
            Title.Caption = 'Nome Cliente'
            Width = 307
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FANTASIA'
            Title.Alignment = taCenter
            Title.Caption = 'Fantasia'
            Width = 197
            Visible = True
          end>
      end
    end
    object TS_Tingimento: TRzTabSheet
      Caption = 'Tingimento'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 994
        Height = 65
        Align = alTop
        TabOrder = 0
        object NxLabel1: TNxLabel
          Left = 8
          Top = 17
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
        object btnConsultar_Ting: TNxButton
          Left = 109
          Top = 32
          Width = 190
          Height = 30
          Caption = 'Consultar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          GlyphSpacing = 5
          ParentFont = False
          TabOrder = 0
          Transparent = True
          OnClick = btnConsultar_TingClick
        end
        object CurrencyEdit4: TCurrencyEdit
          Left = 108
          Top = 9
          Width = 100
          Height = 21
          AutoSize = False
          Ctl3D = False
          DecimalPlaces = 0
          DisplayFormat = '0'
          ParentCtl3D = False
          TabOrder = 1
          OnKeyDown = CurrencyEdit4KeyDown
        end
        object btnImprimir_Ting: TNxButton
          Left = 300
          Top = 32
          Width = 190
          Height = 30
          Caption = 'Imprimir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          GlyphSpacing = 5
          ParentFont = False
          TabOrder = 2
          Transparent = True
          OnClick = btnImprimir_TingClick
        end
      end
      object RzPageControl1: TRzPageControl
        Left = 0
        Top = 65
        Width = 994
        Height = 450
        ActivePage = TS_TingDet
        Align = alClient
        TabIndex = 0
        TabOrder = 1
        FixedDimension = 19
        object TS_TingDet: TRzTabSheet
          Caption = 'Detalhado'
          object SMDBGrid6: TSMDBGrid
            Left = 0
            Top = 0
            Width = 990
            Height = 427
            Align = alClient
            Ctl3D = False
            DataSource = DMCadLote.dsTingimento
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
            ExOptions = [eoDisableDelete, eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
            OnGetCellParams = SMDBGrid1GetCellParams
            RegistryKey = 'Software\Scalabium'
            RegistrySection = 'SMDBGrid'
            WidthOfIndicator = 11
            DefaultRowHeight = 16
            ScrollBars = ssHorizontal
            ColCount = 9
            RowCount = 2
            Columns = <
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'NUM_ORDEM'
                Title.Alignment = taCenter
                Title.Caption = 'N'#186' Ordem'
                Title.Color = 11586303
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'Verdana'
                Title.Font.Style = []
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'ID_MATERIAL'
                Title.Alignment = taCenter
                Title.Caption = 'ID Material'
                Title.Color = 11586303
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'Verdana'
                Title.Font.Style = []
                Width = 73
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOME_MATERIAL'
                Title.Alignment = taCenter
                Title.Caption = 'Nome Material'
                Title.Color = 11586303
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'Verdana'
                Title.Font.Style = []
                Width = 363
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'ID_COR'
                Title.Alignment = taCenter
                Title.Caption = 'ID Cor'
                Title.Color = 11586303
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'Verdana'
                Title.Font.Style = []
                Width = 51
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOME_COR'
                Title.Alignment = taCenter
                Title.Caption = 'Nome Cor'
                Title.Color = 11586303
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'Verdana'
                Title.Font.Style = []
                Width = 166
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QTD'
                Title.Alignment = taCenter
                Title.Caption = 'Qtd. Para Tingimento'
                Title.Color = 11586303
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'Verdana'
                Title.Font.Style = []
                Width = 112
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'UNIDADE'
                Title.Alignment = taCenter
                Title.Caption = 'Unid.'
                Title.Color = 11586303
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QTD_ESTOQUE'
                Title.Alignment = taCenter
                Title.Caption = 'Qtd. No Estoque'
                Title.Color = 11586303
                Width = 130
                Visible = True
              end>
          end
        end
      end
    end
    object TS_Material: TRzTabSheet
      Caption = 'Tal'#227'o de Material'
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 994
        Height = 86
        Align = alTop
        Color = clSilver
        TabOrder = 0
        object Label10: TLabel
          Left = 24
          Top = 21
          Width = 54
          Height = 13
          Alignment = taRightJustify
          Caption = 'ID Material:'
        end
        object Label17: TLabel
          Left = 170
          Top = 21
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nome:'
        end
        object Label18: TLabel
          Left = 29
          Top = 43
          Width = 49
          Height = 13
          Alignment = taRightJustify
          Caption = 'N'#186' Ordem:'
        end
        object Shape1: TShape
          Left = 517
          Top = 66
          Width = 30
          Height = 16
          Brush.Color = clOlive
        end
        object Label19: TLabel
          Left = 549
          Top = 69
          Width = 56
          Height = 13
          Caption = 'J'#225' Impresso'
        end
        object CurrencyEdit6: TCurrencyEdit
          Left = 81
          Top = 13
          Width = 82
          Height = 21
          AutoSize = False
          DecimalPlaces = 0
          DisplayFormat = '0'
          TabOrder = 0
        end
        object Edit3: TEdit
          Left = 203
          Top = 13
          Width = 353
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 1
        end
        object CurrencyEdit8: TCurrencyEdit
          Left = 81
          Top = 35
          Width = 82
          Height = 21
          AutoSize = False
          DecimalPlaces = 0
          DisplayFormat = '0'
          TabOrder = 2
        end
        object btnConsMaterial: TNxButton
          Left = 82
          Top = 58
          Width = 148
          Height = 26
          Caption = 'Efetuar a Pesquisa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = btnConsMaterialClick
        end
        object btnImpriomir_Mat: TNxButton
          Left = 229
          Top = 58
          Width = 148
          Height = 26
          Caption = 'Imprimir'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = btnImpriomir_MatClick
        end
      end
      object SMDBGrid5: TSMDBGrid
        Left = 0
        Top = 86
        Width = 994
        Height = 429
        Align = alClient
        Ctl3D = False
        DataSource = DMCadLote.dsConsLote_Mat_Prod
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnTitleClick = SMDBGrid5TitleClick
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
        OnGetCellParams = SMDBGrid5GetCellParams
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 23
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 16
        RowCount = 2
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'NUM_ORDEM'
            Title.Alignment = taCenter
            Title.Caption = 'N'#186' Ordem'
            Width = 55
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ITEM'
            Title.Alignment = taCenter
            Title.Caption = 'Item'
            Width = 32
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'REFERENCIA'
            Title.Alignment = taCenter
            Title.Caption = 'Refer'#234'ncia'
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_COMBINACAO'
            Title.Alignment = taCenter
            Title.Caption = 'Cor Refer'#234'ncia'
            Width = 170
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID_MATERIAL'
            Title.Alignment = taCenter
            Title.Caption = 'ID Material'
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_MATERIAL'
            Title.Alignment = taCenter
            Title.Caption = 'Material'
            Width = 232
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_COR_MAT'
            Title.Alignment = taCenter
            Title.Caption = 'Cor Material'
            Width = 160
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_CONSUMO'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Consumo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_PRODUTO'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Produto'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DTPAGO'
            Title.Alignment = taCenter
            Title.Caption = 'Dt. Pagamento'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DTRETORNO'
            Title.Alignment = taCenter
            Title.Caption = 'Dt. Retorno'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_PAGO'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Pago'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_RETORNO'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Retorno'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_DIFERENCA'
            Title.Alignment = taCenter
            Title.Caption = 'Diferen'#231'a'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD_CONES'
            Title.Alignment = taCenter
            Title.Caption = 'Qtd. Cones'
            Visible = True
          end>
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 829
    Top = 31
    object ImprimirOrdemProduo1: TMenuItem
      Caption = 'Ordem Produ'#231#227'o'
      OnClick = ImprimirOrdemProduo1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 719
    Top = 99
    object MarcarDesmarcargerarOCIndividual1: TMenuItem
      Caption = 'Marcar/Desmarcar Item (Individual)'
      OnClick = MarcarDesmarcargerarOCIndividual1Click
    end
    object MarcarCampoGerarOC1: TMenuItem
      Caption = 'Marcar/Desmarcar Refer'#234'ncia'
      OnClick = MarcarCampoGerarOC1Click
    end
    object MarcarDesmarcarPedido1: TMenuItem
      Caption = 'Marcar/Desmarcar Pedido'
      OnClick = MarcarDesmarcarPedido1Click
    end
    object MarcartodososcampoparagerarOC1: TMenuItem
      Caption = 'Marcar Todos os Pedidos'
      OnClick = MarcartodososcampoparagerarOC1Click
    end
    object Desmarcartodos1: TMenuItem
      Caption = 'Desmarcar Todos os Pedido'
      OnClick = Desmarcartodos1Click
    end
  end
end
