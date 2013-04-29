import XMonad
import XMonad.Actions.CycleWindows
import XMonad.Actions.DwmPromote
import XMonad.Actions.CycleWS
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig
import XMonad.Layout.Circle
import XMonad.Layout.NoBorders

myTerminal = "/usr/bin/urxvt"

myManageHook = composeAll
  [ className =? "Gimp" --> doFloat
  , className =? "Skype" --> doFloat
  , className =? "Vlc" --> doFloat
  ]

myStartupHook = spawn "conky -c ~/.xmonad/xmoconky"

myLayout = avoidStruts $ smartBorders (
  Tall 1 (3/100) (1/2) ||| Full ||| Circle )

main = do
  xmonad $ defaultConfig
    { manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig
    , layoutHook = myLayout
    , startupHook = myStartupHook
    , terminal = myTerminal
    } 
    `additionalKeysP` myKeys


    -- list of additional custom keybindings:
myKeys = [ ("M1-q", spawn "slock")
         , ("M1-x", spawn "cb-exit")
         , ("M4-w", spawn "iceweasel")
         , ("M4-m", spawn "rhythmbox")
         , ("M4-f", spawn "pcmanfm")
         , ("M4-e", spawn "gvim")
         , ("M1-S-p", spawn "dmenufm")
         , ("M1-r", restart "xmonad" True)
         , ("M1-<Tab>", cycleRecentWindows [xK_Alt_L] xK_Tab xK_Tab )
         , ("M1-<Return>", spawn myTerminal)
         , ("M1-S-<Return>", dwmpromote)
         , ("M-S-<Left>", shiftToPrev)
         , ("M-S-<Right>", shiftToNext)
         ]
