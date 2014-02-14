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

-- Define applications which should float by default; 
-- and those which should open on other WS by default
myManageHook = composeAll . concat $
  [ 
    [ className =? i --> doFloat | i <- myFloats ]
  , [ className =? m --> doShift "8" | m <- myMediaShifts ]
  , [ className =? m --> doShift "9" | m <- myChatShifts ]
  ]
  where
    myFloats = ["Gimp","Skype"]
    myMediaShifts = ["Vlc","Rhythmbox"]
    myChatShifts = ["Skype","Xchat"]

-- Layouts: Tall and Grid; tabbed sub-layout
-- If only one window, don't bother with borders for focused
defaultLayout = windowNavigation $ subTabbed $ avoidStruts $ smartBorders (
  Tall 1 (3/100) (1/2) ||| Grid )

myLayouts = defaultLayout

-- 9 workspaces
myWorkspaces =
  map show [1..9]

-- on startup, run conky
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
  [ 
  -- various keybindings for starting applications:
    ("M1-q", spawn "slock")
  , ("M4-w", spawn "iceweasel")
  , ("M4-m", spawn "rhythmbox")
  , ("M4-v", spawn "vlc")
  , ("M4-f", spawn "pcmanfm")
  , ("M4-e", spawn "gvim")
  , ("M4-t", spawn myTerminal)
  , ("M1-<Return>", spawn myTerminal)
  , ("M1-S-p", spawn "dmenufm")
  , ("M4-S-m", spawn "mpdmenu")

  -- control volume from keyboard
  , ("M1-S-<comma>", spawn "amixer -q set Master,0 5%-")
  , ("M1-S-<period>", spawn "amixer -q set Master,0 5%+")

  , ("M1-r", restart "xmonad" True)
  , ("M1-S-<Return>", dwmpromote)

  -- A-<L|R> moves to prev/next WS; A-S-<L|R> pushes window there
  , ("M-<Left>", prevWS)
  , ("M-<Right>", nextWS)
  , ("M-S-<Left>", shiftToPrev)
  , ("M-S-<Right>", shiftToNext)

  -- control tab-groups: 
  -- pullGroup pulls window in direction into tabgroup
  -- unMerge takes focused window out of tabgroup
  , ("M-C-k", sendMessage $ pullGroup U)
  , ("M-C-h", sendMessage $ pullGroup L)
  , ("M-C-j", sendMessage $ pullGroup D)
  , ("M-C-l", sendMessage $ pullGroup R)
  , ("M-u", withFocused (sendMessage . UnMerge))
  ]
