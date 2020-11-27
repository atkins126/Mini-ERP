object DMConnZeos: TDMConnZeos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 478
  Top = 174
  Height = 320
  Width = 441
  object ZConnection1: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = False
    Port = 0
    Left = 152
    Top = 56
  end
  object ZSQLMonitor1: TZSQLMonitor
    MaxTraceCount = 100
    Left = 184
    Top = 56
  end
  object ZQuery1: TZQuery
    Params = <>
    Left = 248
    Top = 168
  end
end
