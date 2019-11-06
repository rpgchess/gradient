object frmPrincipal: TfrmPrincipal
  Left = 192
  Top = 107
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Gradiente'
  ClientHeight = 200
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 300
    Height = 43
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 134
      Top = 13
      Width = 32
      Height = 13
      Caption = 'Colors:'
    end
    object Button1: TButton
      Left = 24
      Top = 8
      Width = 81
      Height = 25
      Caption = '&Gradiente'
      TabOrder = 0
      OnClick = Button1Click
    end
    object chkDithered: TCheckBox
      Left = 220
      Top = 20
      Width = 65
      Height = 17
      Caption = 'Dithered'
      TabOrder = 1
    end
    object edtColors: TEdit
      Left = 173
      Top = 10
      Width = 36
      Height = 21
      MaxLength = 3
      TabOrder = 2
      Text = '100'
    end
    object chkVertical: TCheckBox
      Left = 220
      Top = 3
      Width = 65
      Height = 17
      Caption = 'Vertical'
      TabOrder = 3
    end
  end
end
