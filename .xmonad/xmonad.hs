import XMonad
<<<<<<< HEAD

-- actions
import XMonad.Actions.DwmPromote
import XMonad.Actions.CycleWS
import XMonad.Actions.WindowBringer

import XMonad.Hooks.ManageDocks

-- layouts
import XMonad.Layout.NoBorders -- does what it says on the tin
import XMonad.Layout.Grid -- grid layout
import XMonad.Layout.Tabbed -- tabbed layout: used in sublayouts
import XMonad.Layout.SubLayouts -- layouts within layouts
import XMonad.Layout.WindowNavigation -- referring to windows directionally
import XMonad.Layout.PerWorkspace -- specific layouts for specific workspaces

import XMonad.Util.EZConfig -- easy keybindings

-- define the default terminal emulator
=======
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

>>>>>>> 962a925543e61c9fc6daadd315ef6e0fcccf8678
myTerminal = "/usr/bin/urxvt"

-- Define applications which should float by default; 
-- and those which should open on other WS by default
myManageHook = composeAll . concat $
  [ 
    [ className =? i --> doFloat | i <- myFloats ]
<<<<<<< HEAD
  , [ className =? m --> doShift "2" | m <- myWebShifts ]
=======
>>>>>>> 962a925543e61c9fc6daadd315ef6e0fcccf8678
  , [ className =? m --> doShift "8" | m <- myMediaShifts ]
  , [ className =? m --> doShift "9" | m <- myChatShifts ]
  ]
  where
<<<<<<< HEAD
    myFloats = ["Gimp","Skype","XBoard"]
    -- Web browsers should be sent to Desktop #2
    myWebShifts = ["Iceweasel","Firefox","Google-chrome","Chromium"]
    -- media players to desktop #8
    myMediaShifts = ["Vlc","Rhythmbox"]
    -- chat programs to desktop #9
    myChatShifts = ["Skype","Xchat"]

-- Layouts: Tall and Grid; tabbed sub-layout
-- smartBorders: if only one window, don't bother with borders for focused
-- avoidStruts: windows should respect conky
-- subTabbed: allows for tabbed sublayouts -- see keybindings section
-- windowNavigation allows the directional selection of windows for manipulating sublayouts
defaultLayout = windowNavigation $ subTabbed $ avoidStruts $ smartBorders (
  Tall 1 (3/100) (1/2) ||| Grid )

-- the browser desktop should always be fullscreen
webLayout = avoidStruts $ smartBorders ( Full )

myLayouts = onWorkspace "2" webLayout $ defaultLayout 
=======
    myFloats = ["Gimp","Skype"]
    myMediaShifts = ["Vlc","Rhythmbox"]
    myChatShifts = ["Skype","Xchat"]

-- Layouts: Tall and Grid; tabbed sub-layout
-- If only one window, don't bother with borders for focused
defaultLayout = windowNavigation $ subTabbed $ avoidStruts $ smartBorders (
  Tall 1 (3/100) (1/2) ||| Grid )

myLayouts = defaultLayout
>>>>>>> 962a925543e61c9fc6daadd315ef6e0fcccf8678

-- 9 workspaces
myWorkspaces =
  map show [1..9]

-- on startup, run conky
myStartupHook = do
  spawn "conky"

<<<<<<< HEAD
-- custom border colours
-- Focused = orange; unfocused = dark blue/grey
myNormalBorderColor  = "#073642"
myFocusedBorderColor = "#CB4B16"

main = do
  xmonad $ defaultConfig
    { manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig
    , layoutHook = myLayouts
    , workspaces = myWorkspaces
    , terminal = myTerminal
    , normalBorderColor = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
=======
main = do
  xmonad $ defaultConfig
    { manageHook = manageDocks <+> myManageHook <+> manageSpawn <+> manageHook defaultConfig
    , layoutHook = myLayouts
    , workspaces = myWorkspaces
    , terminal = myTerminal
>>>>>>> 962a925543e61c9fc6daadd315ef6e0fcccf8678
    , startupHook = myStartupHook
    } 
    `additionalKeysP` myKeys

    -- list of additional custom keybindings:
myKeys = 
  [ 
  -- various keybindings for starting applications:
    ("M1-q", spawn "slock")
  , ("M4-w", spawn "iceweasel")
<<<<<<< HEAD
  , ("M4-v", spawn "vlc")
=======
  , ("M4-m", spawn "rhythmbox")
  , ("M4-v", spawn "vlc")
  , ("M4-f", spawn "pcmanfm")
>>>>>>> 962a925543e61c9fc6daadd315ef6e0fcccf8678
  , ("M4-e", spawn "gvim")
  , ("M4-t", spawn myTerminal)
  , ("M1-<Return>", spawn myTerminal)
  , ("M1-S-p", spawn "dmenufm")
<<<<<<< HEAD
  , ("M4-p", spawn "dmenufm")
  , ("M4-m", spawn "mpdmenu")
  , ("M1-g", gotoMenu)

  -- control mpd
  --, ("M1-<bracketright>", spawn "mpc next")
  --, ("M1-<bracketleft>", spawn "mpc prev")
=======
  , ("M4-S-m", spawn "mpdmenu")

  -- control volume from keyboard
  , ("M1-S-<comma>", spawn "amixer -q set Master,0 5%-")
  , ("M1-S-<period>", spawn "amixer -q set Master,0 5%+")
>>>>>>> 962a925543e61c9fc6daadd315ef6e0fcccf8678

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
