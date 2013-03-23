import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig

myTerminal = "/usr/bin/urxvt"

myManageHook = composeAll
  [ className =? "Gimp" --> doFloat
  , className =? "Skype" --> doFloat
  ]

myLayout = avoidStruts (
  ResizableTall 1 (3/100) (1/2) [] |||
  noBorders Full |||
  Circle )

main = do
  xmonad $ defaultConfig
    { manageHook = manageDocks <+> manageHook myManageHook 
    , layoutHook = myLayout
    , startupHook = spawn "conky"
    , terminal = myTerminal
    } `additionalKeys`
    -- list of additional custom keybindings:
    [ ((mod1Mask, xK_q), spawn "slock")
    , ((mod1Mask .|. shiftMask, xK_x), spawn "cb-exit")
    , ((mod4Mask, xK_w), spawn "iceweasel")
    , ((mod4Mask, xK_m), spawn "rhythmbox")
    , ((mod4Mask, xK_f), spawn "pcmanfm")
    , ((mod4Mask, xK_e), spawn "gvim")
    , ((mod1Mask .|. shiftMask, xK_p), spawn "dmenufm")
    , ((mod1Mask, xK_r), restart "xmonad" True)
    -- Win-[1..3] and Win-S-[1..3] flip to and move client to monitor 1-3
    , ((m .|. mod4Mask, key), screenWorkspace sc >>= flip whenJust (windows . f))
      | (key, sc) <- zip [xK_1, xK_2, xK_3] [0..]
      , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
    ]
