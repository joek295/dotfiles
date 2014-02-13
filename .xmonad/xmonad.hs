import XMonad
import XMonad.Actions.CycleWindows
import XMonad.Actions.DwmPromote
import XMonad.Actions.CycleWS
import XMonad.Actions.SpawnOn
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig
import XMonad.Layout.NoBorders
import XMonad.Layout.Grid
import XMonad.Layout.PerWorkspace (onWorkspace)

myTerminal = "/usr/bin/urxvt"

myManageHook = composeAll . concat $
  [ 
    [ className =? i --> doFloat | i <- myFloats ]
  , [ className =? m --> doShift "3:Media" | m <- myMediaShifts ]
  ]
  where
    myFloats = ["Gimp","Skype","Vlc"]
    myMediaShifts = ["Vlc","Rhythmbox"]

defaultLayout = avoidStruts $ smartBorders (
  Tall 1 (3/100) (1/2) ||| Full ||| Grid )

sshLayout = Grid

myLayouts = onWorkspace "2:SSH" sshLayout $ defaultLayout

myWorkspaces =
  [
    "1:Gen", "2:SSH", "3:Media",
    "4", "5", "6",
    "7", "8", "9"
  ]

myStartupHook = do
  spawn "conky -c ~/.xmonad/conky"
  spawnOn "2:SSH" "urxvt"
  spawnOn "2:SSH" "urxvt"
  spawnOn "2:SSH" "urxvt"
  spawnOn "2:SSH" "urxvt"

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
  , ("M1-r", restart "xmonad" True)
  , ("M1-<Tab>", cycleRecentWindows [xK_Alt_L] xK_Tab xK_Tab )
  , ("M1-<Return>", spawn myTerminal)
  -- A-S-Return promotes focused window to master
  , ("M1-S-<Return>", dwmpromote)
  -- A-S-<L|R> move windows to next/previous virtual desktop
  , ("M-S-<Left>", shiftToPrev)
  , ("M-S-<Right>", shiftToNext)
  -- keyboard volume control
  , ("M-<comma>", spawn "amixer set Master,0 5%-")
  , ("M-<period>", spawn "amixer set Master,0 5%+")
  ]
