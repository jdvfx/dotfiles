-- IMPORTS

import XMonad
import XMonad.Util.EZConfig
import XMonad.Hooks.DynamicLog

-- The main function.
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- Command to launch the bar.
myBar = "xmobar"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

-- Key binding to toggle the gap for the bar.
-- B key: show/hide the bar
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)



-- Main configuration, override the defaults to your liking.
myConfig = def {
               modMask = mod4Mask, -- Use Super instead of Alt
               terminal = "st",
               borderWidth   = 1,
               normalBorderColor  = "#000000",
               focusedBorderColor = "#0088FF"
               } `additionalKeys`
               [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock; xset dpms force off")
               , ((mod4Mask, xK_Print), spawn "scrot ~/Pictures/screenshots/")
               , ((mod4Mask, xK_f), spawn "firefox")
               , ((mod4Mask, xK_g), spawn "google-chrome")
               , ((mod4Mask, xK_n), spawn "/usr/NX/bin/nxplayer --geometry 1920x1080 &")
               , ((mod4Mask, xK_s), spawn "spotify")
               , ((mod4Mask, xK_x), spawn "xfce4-terminal")
               , ((mod4Mask, xK_F1), spawn "setxkbmap -option 'caps:escape'")
               , ((mod4Mask, xK_F11), spawn "amixer -q sset Master 3%-;aplay /home/bunker/.xmonad/sounds/beep-29.wav")
               , ((mod4Mask, xK_F12), spawn "amixer -q sset Master 3%+;aplay /home/bunker/.xmonad/sounds/beep-29.wav")
               , ((mod4Mask, xK_F6), spawn "/bin/python2.7 ~/.xmonad/brightness/setDefaultBrightness.py")
               , ((mod4Mask, xK_F7), spawn "/bin/python2.7 ~/.xmonad/brightness/adjustBrightness.py -.1")
               , ((mod4Mask, xK_F8), spawn "/bin/python2.7 ~/.xmonad/brightness/adjustBrightness.py +.1")
               , ((mod4Mask, xK_Right), spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next")
               , ((mod4Mask, xK_Left), spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous")
               , ((mod4Mask, xK_o), spawn "ls --color=never --format=single-column ~/.local/bin/dmenu/ | dmenu -fn 'JetBrains Mono:size=9' -sb '#004400' -nb '#000000' | xargs -I % sh -c '~/.local/bin/dmenu/%'")
               ]
