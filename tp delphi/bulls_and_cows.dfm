object bull_and_cow: Tbull_and_cow
  Left = 0
  Top = 0
  Caption = 'Le bulls and cow game'
  ClientHeight = 502
  ClientWidth = 732
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel_menu: TPanel
    Left = 8
    Top = 8
    Width = 194
    Height = 486
    TabOrder = 0
    object Menu: TLabel
      Left = 56
      Top = 16
      Width = 73
      Height = 41
      AutoSize = False
      Caption = 'Menu'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lettres_7: TButton
      Left = 8
      Top = 416
      Width = 177
      Height = 49
      Caption = '7 lettres - 20 essaies'
      TabOrder = 0
      OnClick = lettres_7Click
    end
    object lettres_6: TButton
      Left = 8
      Top = 334
      Width = 177
      Height = 49
      Caption = '6 lettres - 16 essaies'
      TabOrder = 1
      OnClick = lettres_6Click
    end
    object lettres_5: TButton
      Left = 8
      Top = 248
      Width = 177
      Height = 49
      Caption = '5 lettres - 10 essaies'
      TabOrder = 2
      OnClick = lettres_5Click
    end
    object lettres_4: TButton
      Left = 8
      Top = 168
      Width = 177
      Height = 49
      Caption = '4 lettres - 7 essaies'
      TabOrder = 3
      OnClick = lettres_4Click
    end
    object lettres_3: TButton
      Left = 8
      Top = 89
      Width = 177
      Height = 49
      Caption = '3 lettres - 4 essaies'
      TabOrder = 4
      OnClick = lettres_3Click
    end
  end
  object Panel_jeu: TPanel
    Left = 208
    Top = 8
    Width = 516
    Height = 486
    TabOrder = 1
    object bulls_and_cow: TLabel
      Left = 373
      Top = 78
      Width = 133
      Height = 19
      Caption = 'BULLS AND COWS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label_texte: TLabel
      Left = 137
      Top = 257
      Width = 168
      Height = 19
      Caption = 'entrer votre proposition'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object nb_lettre: TLabel
      Left = 45
      Top = 152
      Width = 208
      Height = 19
      Caption = 'nombrs de lettres a d'#233'couvrir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object game: TLabel
      Left = 93
      Top = 22
      Width = 349
      Height = 25
      Caption = 'THE BULLS AND COWS VIDEO GAME'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object label_nombre_essaie: TLabel
      Left = 59
      Top = 103
      Width = 181
      Height = 19
      Caption = 'nombre d'#39'essaies restants'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object QUITTER: TButton
      Left = 401
      Top = 389
      Width = 88
      Height = 88
      Caption = 'QUITTER'
      TabOrder = 0
      OnClick = QUITTERClick
    end
    object RESET: TButton
      Left = 214
      Top = 389
      Width = 91
      Height = 88
      Caption = 'RESET'
      Enabled = False
      TabOrder = 1
      OnClick = RESETClick
    end
    object edit_texte: TEdit
      Left = 119
      Top = 282
      Width = 213
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object edit_nb_lettre: TEdit
      Left = 271
      Top = 149
      Width = 66
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object ESSAIE: TButton
      Left = 23
      Top = 389
      Width = 91
      Height = 88
      Caption = 'ESSAIE'
      Enabled = False
      TabOrder = 4
      OnClick = ESSAIEClick
    end
    object liste_mot: TMemo
      Left = 424
      Top = 56
      Width = 39
      Height = 16
      Lines.Strings = (
        '')
      TabOrder = 5
      Visible = False
    end
    object memo_cow: TMemo
      Left = 468
      Top = 103
      Width = 40
      Height = 280
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object memo_bull: TMemo
      Left = 380
      Top = 103
      Width = 40
      Height = 280
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
    object edit_nb_essaie: TEdit
      Left = 271
      Top = 103
      Width = 66
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
    end
  end
end
