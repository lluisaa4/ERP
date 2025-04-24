object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 268
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -20
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 24
  object Btn1: TButton
    Left = 8
    Top = 8
    Width = 129
    Height = 49
    Caption = 'Monitorar'
    TabOrder = 0
  end
  object Button1: TButton
    Left = 498
    Top = 8
    Width = 129
    Height = 49
    Caption = 'Parar'
    Enabled = False
    TabOrder = 1
  end
  object memo2: TMemo
    Left = 8
    Top = 80
    Width = 619
    Height = 185
    TabOrder = 2
  end
  object fdqry1: TFDQuery
    Left = 504
    Top = 160
  end
  object con1: TFDConnection
    Params.Strings = (
      'Database=postgres'
      'User_Name=postgres'
      'Server=localhost'
      'Password=123456'
      'DriverID=PG')
    LoginPrompt = False
    Left = 408
    Top = 112
  end
  object fdphyspgdrvrlnk1: TFDPhysPgDriverLink
    Left = 416
    Top = 216
  end
end
