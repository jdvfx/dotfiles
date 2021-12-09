-- IMPORTS

import XMonad
import XMonad.Util.EZConfig
import XMonad.Hooks.DynamicLog
import XMonad.Util.SpawnOnce

-- for layouts
import XMonad.Layout.NoBorders   ( noBorders, smartBorders)
import XMonad.Layout.Spiral
import Data.Ratio -- this makes the '%' operator available (optional)
import XMonad.Layout.Spiral
import XMonad.Layout.Grid
import XMonad.Layout.ToggleLayouts
--import XMonad hiding ( (|||) )  -- don't use the normal ||| operator
--import XMonad.Layout.LayoutCombinators -- to use jumpToLayout


-- The main function.
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig
-- Command to launch the bar.
myBar = "xmobar"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP { 
                ppCurrent = xmobarColor "#1ac3ff" "",
                ppTitle = xmobarColor "#888888" ""
                }


-- Key binding to toggle the gap for the bar.
-- B key: show/hide the bar
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)


------------------------------------------------------------------------
-- LAYOUTS
------------------------------------------------------------------------
myLayouts = layoutTall ||| layoutSpiral ||| layoutGrid ||| layoutMirror ||| noBorders Full
    where
      layoutTall = Tall 1 (3/100) (1/2)
      layoutSpiral = spiral (125 % 146)
      layoutGrid = Grid
      layoutMirror = Mirror (Tall 1 (3/100) (3/5))

------------------------------------------------------------------------
-- AUTOSTART
------------------------------------------------------------------------
myStartupHook :: X ()
myStartupHook = do
    spawnOnce "nitrogen --restore &" 
    spawnOnce "tput smkx"
    spawnOnce "setxkbmap -option 'caps:escape'"
    spawnOnce "bash ~/.bash_profile"
               
-- Main configuration, override the defaults to your liking.
myConfig = def {
               modMask = mod4Mask, -- Use Super instead of Alt
               terminal = "alacritty",
               borderWidth   = 1,
               normalBorderColor  = "#000000",
               focusedBorderColor = "#0088FF",
               startupHook        = myStartupHook,
               layoutHook = myLayouts
               } `additionalKeys`
               [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock; xset dpms force off")
               , ((mod4Mask, xK_Print), spawn "scrot ~/Pictures/screenshots/")
               , ((mod4Mask, xK_s ), spawn "scrot ~/Pictures/screenshots/")
               , ((mod4Mask, xK_F1), spawn "setxkbmap -option 'caps:escape'")
               , ((mod4Mask, xK_F11), spawn "amixer -q sset Master 3%-;aplay ~/.xmonad/sounds/beep-29.wav")
               , ((mod4Mask, xK_F12), spawn "amixer -q sset Master 3%+;aplay ~/.xmonad/sounds/beep-29.wav")
               , ((mod4Mask, xK_F6), spawn "/bin/python ~/.xmonad/brightness/setDefaultBrightness.py")
               , ((mod4Mask, xK_F7), spawn "/bin/python ~/.xmonad/brightness/adjustBrightness.py -.1")
               , ((mod4Mask, xK_F8), spawn "/bin/python ~/.xmonad/brightness/adjustBrightness.py +.1")
               , ((mod4Mask, xK_Right), spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next")
               , ((mod4Mask, xK_Left), spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous")
               , ((mod4Mask, xK_i), spawn "cat ~/.xmonad/dmenu_sys | awk -F'#' '{print $1}' | dmenu -fn 'JetBrains Mono:size=9' -sb '#fc952e' -sf '#222222' -nb '#000000' -nf '#CCBBAA' | xargs -I % grep % ~/.xmonad/dmenu_sys | awk -F'#' '{print $2}' | sh ")
               , ((mod4Mask, xK_o), spawn "cat ~/.xmonad/dmenu_apps1 | awk -F'#' '{print $1}' | dmenu -fn 'JetBrains Mono:size=9' -sb '#fc952e' -sf '#222222' -nb '#000000' -nf '#CCBBAA' | xargs -I % grep % ~/.xmonad/dmenu_apps1 | awk -F'#' '{print $2}' | sh ")
               , ((mod4Mask, xK_u), spawn "cat ~/.xmonad/dmenu_utils | awk -F'#' '{print $1}' | dmenu -fn 'JetBrains Mono:size=9' -sb '#0060ff' -sf '#222222' -nb '#000000' -nf '#CCBBAA' | xargs -I % grep % ~/.xmonad/dmenu_utils | awk -F'#' '{print $2}' | sh ")
               , ((mod4Mask, xK_p), spawn "ls --color=never --format=single-column /usr/bin/ | dmenu -fn 'JetBrains Mono:size=9' -sb '#2bc395' -sf '#222222' -nb '#000000' -nf '#CCBBAA' | xargs -I % sh -c '/usr/bin/%'")
               ]
