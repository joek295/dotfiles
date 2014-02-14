import XMonad
import XMonad.Actions.CycleWindows
import XMonad.Actions.DwmPromote
import XMonad.Actions.CycleWS
import XMonad.Actions.SpawnOn
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig
import XMonad.Layout.NoBorders
import XMonad.Layout.Grid
import XMonad.Layout.Tabbed
import XMonad.Layout.SubLayouts
import XMonad.Layout.WindowNavigation
import XMonad.Layout.PerWorkspace (onWorkspace)

myTerminal = "/usr/bin/urxvt"

myManageHook = composeAll . concat $
  [ 
    [ className =? i --> doFloat | i <- myFloats ]
  , [ className =? m --> doShift "3:Media" | m <- myMediaShifts ]
  ]
  where
    myFloats = ["Gimp","Skype"]
    myMediaShifts = ["Vlc","Rhythmbox"]

defaultLayout = windowNavigation $ subTabbed $ avoidStruts $ smartBorders (
  Tall 1 (3/100) (1/2) ||| Grid )

myLayouts = defaultLayout

myWorkspaces =
  [ "1:Gen", "2:SSH", "3:Media" ] ++ map show [4..9]

myStartupHook = do
  spawn "conky"

main = do
  xmonad $ defaultConfig
    { manageHook = manageDocks <+> myManageHook <+> manageSpawn <+> manageHook defaultConfig
    , layoutHook = myLayouts
    , workspaces = myWorkspaces
    , terminal = myTerminal
    , startupHook = myStartupHook
    } 
    `additionalKeysP` myKeys

    -- list of additional custom keybindings:
myKeys = 
  [ ("M1-q", spawn "slock")
  , ("M1-x", spawn "cb-exit")
  , ("M4-w", spawn "iceweasel")
  , ("M4-m", spawn "rhythmbox")
  , ("M4-f", spawn "pcmanfm")
  , ("M4-e", spawn "gvim")
  , ("M1-S-p", spawn "dmenufm")
  , ("M4-S-m", spawn "mpdmenu")
  , ("M1-r", restart "xmonad" True)
  , ("M1-<Tab>", cycleRecentWindows [xK_Alt_L] xK_Tab xK_Tab )
  , ("M1-<Return>", spawn myTerminal)
  -- A-S-Return promotes focused window to master
  , ("M1-S-<Return>", dwmpromote)
  -- A-S-<L|R> move windows to next/prev virtual desktop; A-<l|r> move to same
  , ("M-<Left>", prevWS)
  , ("M-S-<Left>", shiftToPrev)
  , ("M-<Right>", nextWS)
  , ("M-S-<Right>", shiftToNext)
  , ("M-C-k", sendMessage $ pullGroup U)
  , ("M-C-h", sendMessage $ pullGroup L)
  , ("M-C-j", sendMessage $ pullGroup D)
  , ("M-C-l", sendMessage $ pullGroup R)
  , ("M-u", withFocused (sendMessage . UnMerge))
  -- keyboard volume control
  , ("M1-S-<comma>", spawn "amixer -q set Master,0 5%-")
  , ("M1-S-<period>", spawn "amixer -q set Master,0 5%+")
  ]
