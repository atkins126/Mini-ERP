object frmView_Usuario: TfrmView_Usuario
  Left = 450
  Top = 133
  Width = 540
  Height = 436
  Caption = 'Cadastro de Usu'#225'rio'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 26
    Top = 182
    Width = 474
    Height = 7
    Shape = bsTopLine
  end
  object Label1: TLabel
    Left = 26
    Top = 193
    Width = 33
    Height = 13
    Caption = 'Codigo'
  end
  object Label2: TLabel
    Left = 162
    Top = 193
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label3: TLabel
    Left = 289
    Top = 242
    Width = 25
    Height = 13
    Caption = 'Login'
  end
  object Label4: TLabel
    Left = 162
    Top = 242
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object Label5: TLabel
    Left = 162
    Top = 291
    Width = 28
    Height = 13
    Caption = 'E-mail'
  end
  object Label6: TLabel
    Left = 26
    Top = 291
    Width = 31
    Height = 13
    Caption = 'Status'
  end
  object Label7: TLabel
    Left = 26
    Top = 242
    Width = 81
    Height = 13
    Caption = 'Data Nascimento'
  end
  object btnFind: TBitBtn
    Left = 425
    Top = 19
    Width = 75
    Height = 25
    Caption = 'Find'
    TabOrder = 1
    OnClick = btnFindClick
  end
  object btnINSERIR: TBitBtn
    Left = 267
    Top = 340
    Width = 75
    Height = 25
    Caption = 'Inserir'
    TabOrder = 10
    OnClick = btnINSERIRClick
  end
  object btnALTERAR: TBitBtn
    Left = 346
    Top = 340
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 11
    OnClick = btnALTERARClick
  end
  object btnDELETAR: TBitBtn
    Left = 425
    Top = 340
    Width = 75
    Height = 25
    Caption = 'Deletar'
    TabOrder = 12
    OnClick = btnDELETARClick
  end
  object DBGrid1: TDBGrid
    Left = 26
    Top = 51
    Width = 474
    Height = 120
    DataSource = DataSource1
    Options = [dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object edtFind: TEdit
    Left = 26
    Top = 21
    Width = 395
    Height = 21
    TabOrder = 0
  end
  object edtCODIGO: TEdit
    Left = 26
    Top = 210
    Width = 129
    Height = 21
    TabOrder = 3
  end
  object edtNOME: TEdit
    Left = 162
    Top = 210
    Width = 338
    Height = 21
    TabOrder = 4
  end
  object edtDATA_NASCIMENTO: TEdit
    Left = 26
    Top = 259
    Width = 129
    Height = 21
    TabOrder = 5
  end
  object edtSENHA: TEdit
    Left = 162
    Top = 259
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object edtLOGIN: TEdit
    Left = 289
    Top = 259
    Width = 211
    Height = 21
    TabOrder = 7
  end
  object edtSTATUS: TEdit
    Left = 26
    Top = 307
    Width = 129
    Height = 21
    TabOrder = 8
  end
  object edtEMAIL: TEdit
    Left = 162
    Top = 307
    Width = 338
    Height = 21
    TabOrder = 9
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 378
    Width = 524
    Height = 19
    Panels = <>
  end
  object DataSource1: TDataSource
    Left = 82
    Top = 28
  end
end
