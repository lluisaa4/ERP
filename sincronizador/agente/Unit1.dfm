object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object memo2: TMemo
    Left = 0
    Top = 96
    Width = 635
    Height = 203
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Btn1: TButton
    Left = 8
    Top = 24
    Width = 97
    Height = 49
    Caption = 'Start'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Btn1Click
  end
  object Btn2: TButton
    Left = 416
    Top = 24
    Width = 97
    Height = 49
    Caption = 'Evento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Btn2Click
  end
  object Btn3: TButton
    Left = 530
    Top = 27
    Width = 97
    Height = 49
    Caption = 'Testar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object con1: TFDConnection
    Params.Strings = (
      'Database=C:\dev\estudos\ac-pdv-main25 errado\database\dados2.sdb'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 304
    Top = 136
  end
  object fdqry1: TFDQuery
    Connection = con1
    Left = 312
    Top = 232
  end
  object fdvntlrtr1: TFDEventAlerter
    Connection = con1
    Options.Timeout = 1000
    OnAlert = fdvntlrtr1Alert
    OnTimeout = fdvntlrtr1Timeout
    Left = 440
    Top = 200
  end
end
