inherited frmView_Usuario: TfrmView_Usuario
  Caption = 'frmView_Usuario'
  Font.Height = -12
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited Panel2: TPanel
    inherited PageControl1: TPageControl
      ActivePage = TabSheet2
      inherited TabSheet1: TTabSheet
        inherited JvDBGrid1: TJvDBGrid
          Font.Height = -12
          TitleFont.Height = -12
          RowsHeight = 17
          TitleRowHeight = 18
        end
        inherited Panel4: TPanel
          inherited GroupBox1: TGroupBox
            Anchors = [akLeft, akTop, akRight, akBottom]
            inherited edtPesquisar: TEdit
              Height = 23
              Anchors = [akLeft, akTop, akRight]
            end
            inherited BitBtn1: TBitBtn
              Height = 26
              Anchors = [akRight, akBottom]
            end
          end
        end
      end
      inherited TabSheet2: TTabSheet
        object GroupBox2: TGroupBox
          Left = 0
          Top = 0
          Width = 801
          Height = 245
          Align = alTop
          Caption = 'Dados Principais'
          TabOrder = 0
          object Label1: TLabel
            Left = 24
            Top = 33
            Width = 33
            Height = 15
            Caption = 'Nome'
          end
          object Label2: TLabel
            Left = 24
            Top = 80
            Width = 29
            Height = 15
            Caption = 'Email'
          end
          object Label3: TLabel
            Left = 432
            Top = 33
            Width = 30
            Height = 15
            Caption = 'Login'
          end
          object Label4: TLabel
            Left = 432
            Top = 80
            Width = 32
            Height = 15
            Caption = 'Senha'
          end
          object Label5: TLabel
            Left = 24
            Top = 128
            Width = 91
            Height = 15
            Caption = 'Data Nascimento'
          end
          object edtNOME: TEdit
            Left = 24
            Top = 49
            Width = 243
            Height = 23
            TabOrder = 0
          end
          object edtEMAIL: TEdit
            Left = 24
            Top = 96
            Width = 243
            Height = 23
            TabOrder = 1
          end
          object edtSENHA: TEdit
            Left = 432
            Top = 96
            Width = 156
            Height = 23
            TabOrder = 4
          end
          object edtLOGIN: TEdit
            Left = 432
            Top = 49
            Width = 193
            Height = 23
            TabOrder = 3
          end
          object rdgSTATUS: TRadioGroup
            Left = 431
            Top = 134
            Width = 241
            Height = 56
            Caption = 'Situa'#231#227'o'
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'Ativo'
              'Inativo')
            TabOrder = 5
          end
          object edtDATA_NASCIMENTO: TJvDateEdit
            Left = 24
            Top = 144
            Width = 129
            Height = 23
            Flat = False
            ParentFlat = False
            ShowNullDate = False
            TabOrder = 2
          end
        end
      end
    end
  end
  inherited ActionList1: TActionList
    inherited acSalvar: TAction
      Caption = '&Salvar'
    end
  end
end
