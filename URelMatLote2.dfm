object fRelMatLote2: TfRelMatLote2
  Left = 255
  Top = 148
  Width = 1256
  Height = 657
  Caption = 'fRelMatLote2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 40
    Top = 48
    Width = 794
    Height = 1123
    DataSource = DMConsLote.dsmMat
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Margins.LeftMargin = 8.000000000000000000
    Margins.TopMargin = 8.000000000000000000
    Margins.RightMargin = 8.000000000000000000
    Margins.BottomMargin = 8.000000000000000000
    BeforePrint = RLReport1BeforePrint
    object RLGroup1: TRLGroup
      Left = 30
      Top = 30
      Width = 734
      Height = 595
      object RLSubDetail1: TRLSubDetail
        Left = 0
        Top = 45
        Width = 734
        Height = 71
        DataSource = DMConsLote.dsLoteProduto
        object RLBand1: TRLBand
          Left = 0
          Top = 0
          Width = 734
          Height = 32
          BandType = btTitle
          object RLLabel10: TRLLabel
            Left = 3
            Top = 9
            Width = 54
            Height = 13
            Caption = 'Refer'#234'ncia'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel11: TRLLabel
            Left = 195
            Top = 9
            Width = 39
            Height = 13
            Caption = 'Modelo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel13: TRLLabel
            Left = 694
            Top = 9
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Qtde.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDraw1: TRLDraw
            Left = 1
            Top = 23
            Width = 732
            Height = 7
            DrawKind = dkLine
          end
        end
        object RLBand2: TRLBand
          Left = 0
          Top = 32
          Width = 734
          Height = 13
          object RLDBText8: TRLDBText
            Left = 3
            Top = 1
            Width = 53
            Height = 10
            DataField = 'REFERENCIA'
            DataSource = DMConsLote.dsLoteProduto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText9: TRLDBText
            Left = 195
            Top = 1
            Width = 94
            Height = 10
            DataField = 'MODELO_COMBINACAO'
            DataSource = DMConsLote.dsLoteProduto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLDBText10: TRLDBText
            Left = 704
            Top = 1
            Width = 19
            Height = 10
            Alignment = taRightJustify
            DataField = 'QTD'
            DataSource = DMConsLote.dsLoteProduto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -8
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
        end
        object RLBand7: TRLBand
          Left = 0
          Top = 45
          Width = 734
          Height = 17
          BandType = btFooter
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = True
          Borders.FixedBottom = True
          object RLDBResult1: TRLDBResult
            Left = 667
            Top = 1
            Width = 56
            Height = 15
            Alignment = taRightJustify
            Borders.Sides = sdCustom
            Borders.DrawLeft = False
            Borders.DrawTop = True
            Borders.DrawRight = False
            Borders.DrawBottom = False
            DataField = 'QTD'
            DataSource = DMConsLote.dsLoteProduto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = []
            Info = riSum
            ParentFont = False
          end
          object RLLabel12: TRLLabel
            Left = 544
            Top = 2
            Width = 60
            Height = 13
            Caption = 'Total Geral:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
        end
      end
      object RLSubDetail2: TRLSubDetail
        Left = 0
        Top = 116
        Width = 734
        Height = 409
        DataSource = DMConsLote.dsmMat
        object RLGroup2: TRLGroup
          Left = 0
          Top = 16
          Width = 734
          Height = 193
          DataFields = 'Nome_Setor'
          object RLBand3: TRLBand
            Left = 0
            Top = 18
            Width = 734
            Height = 14
            object RLDBText1: TRLDBText
              Left = 12
              Top = 3
              Width = 42
              Height = 10
              Alignment = taCenter
              DataField = 'ID_Material'
              DataSource = DMConsLote.dsmMat
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -8
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object RLDBText2: TRLDBText
              Left = 65
              Top = 3
              Width = 55
              Height = 10
              DataField = 'Nome_Material'
              DataSource = DMConsLote.dsmMat
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -8
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object RLDBText3: TRLDBText
              Left = 426
              Top = 3
              Width = 40
              Height = 10
              DataField = 'Nome_Cor'
              DataSource = DMConsLote.dsmMat
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -8
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object RLDBText4: TRLDBText
              Left = 681
              Top = 3
              Width = 51
              Height = 10
              Alignment = taRightJustify
              DataField = 'Qtd_Consumo'
              DataSource = DMConsLote.dsmMat
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -8
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
            end
            object RLDraw3: TRLDraw
              Left = 1
              Top = -2
              Width = 732
              Height = 7
              DrawKind = dkLine
            end
          end
          object RLSubDetail3: TRLSubDetail
            Left = 0
            Top = 32
            Width = 734
            Height = 64
            DataSource = DMConsLote.dsmMatGrade
            object RLDetailGrid1: TRLDetailGrid
              Left = 0
              Top = 0
              Width = 734
              Height = 29
              ColCount = 12
              ColWidth = 16.000000000000000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              object RLDBText5: TRLDBText
                Left = 2
                Top = 3
                Width = 54
                Height = 15
                Alignment = taCenter
                AutoSize = False
                DataField = 'Tamanho'
                DataSource = DMConsLote.dsmMatGrade
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -8
                Font.Name = 'Arial'
                Font.Style = [fsUnderline]
                ParentFont = False
              end
              object RLDBText6: TRLDBText
                Left = 2
                Top = 14
                Width = 54
                Height = 13
                Alignment = taCenter
                AutoSize = False
                DataField = 'Qtd_Consumo'
                DataSource = DMConsLote.dsmMatGrade
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -8
                Font.Name = 'Arial'
                Font.Style = []
                ParentFont = False
              end
            end
          end
          object RLBand4: TRLBand
            Left = 0
            Top = 0
            Width = 734
            Height = 18
            BandType = btHeader
            object RLLabel9: TRLLabel
              Left = 88
              Top = 3
              Width = 38
              Height = 12
              Caption = 'Setor:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object RLDBText7: TRLDBText
              Left = 136
              Top = 3
              Width = 74
              Height = 12
              DataField = 'Nome_Setor'
              DataSource = DMConsLote.dsmMat
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -10
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
        object RLBand5: TRLBand
          Left = 0
          Top = 0
          Width = 734
          Height = 16
          BandType = btHeader
          object RLLabel5: TRLLabel
            Left = 8
            Top = 4
            Width = 13
            Height = 13
            Caption = 'ID'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel6: TRLLabel
            Left = 64
            Top = 2
            Width = 42
            Height = 13
            Caption = 'Material'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel7: TRLLabel
            Left = 376
            Top = 2
            Width = 19
            Height = 13
            Caption = 'Cor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object RLLabel8: TRLLabel
            Left = 663
            Top = 2
            Width = 59
            Height = 13
            Caption = 'Quantidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -10
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
        end
      end
      object RLBand6: TRLBand
        Left = 0
        Top = 0
        Width = 734
        Height = 45
        BandType = btHeader
        object RLLabel1: TRLLabel
          Left = 192
          Top = 8
          Width = 202
          Height = 16
          Caption = 'Relat'#243'rio de Materiais Por Lote'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
        object RLSystemInfo1: TRLSystemInfo
          Left = 664
          Top = 6
          Width = 63
          Height = 12
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Info = itPageNumber
          ParentFont = False
        end
        object RLLabel2: TRLLabel
          Left = 640
          Top = 6
          Width = 22
          Height = 12
          Caption = 'P'#225'g:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel3: TRLLabel
          Left = 636
          Top = 19
          Width = 26
          Height = 12
          Alignment = taRightJustify
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLSystemInfo2: TRLSystemInfo
          Left = 663
          Top = 19
          Width = 29
          Height = 12
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel4: TRLLabel
          Left = 6
          Top = 27
          Width = 33
          Height = 12
          Caption = 'Op'#231#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
    end
  end
end
