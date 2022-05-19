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
-- WINIT_X11_SCALE_FACTOR is used for alacritty
-- it displays the same font size on monitors
-- with different DPIs
--
myStartupHook :: X ()
myStartupHook = do
    spawnOnce "export WINIT_X11_SCALE_FACTOR=1"
    spawnOnce "nitrogen --restore &"
    spawnOnce "compton  &"

------------------------------------------------------------------------
-- DMENU FUNCTIONS
------------------------------------------------------------------------
-- dmenu font
myFont :: String
myFont = "IBM PLex Mono Medium:size=9"

-- dmenu from text file
-- dt : path to text file in this format: (appName1#appPath1 \n appPath2#appPath2)
-- da : dmenu background color in this format: #000000
dmenuFromText :: (String,String) -> (String)
dmenuFromText  (dt,dc) = (dcmd) where
  dcmd = "cat "++dt++" | awk -F'#' '{print $1}' | dmenu -fn '"++myFont++"' -sb '"++dc++"' -sf '#222222' -nb '#000000' -nf '#CCBBAA' | xargs -I % grep % "++dt++"| awk -F'#' '{print $2}' | sh"

-- dmenu from path
-- dp : path
-- dp : dmenu background color in this format: #000000
dmenuFromPath  :: (String,String) -> (String)
dmenuFromPath (dp,dc) = (dcmd) where
  dcmd = "ls --color=never --format=single-column "++dp++" | dmenu -fn '"++myFont++"' -sb '"++dc++"' -sf '#222222' -nb '#000000' -nf '#CCBBAA' | xargs -I % sh -c '"++dp++"%'"

-- spotify next/previous
spotifyControl :: (String) -> (String)
spotifyControl (action) = (spotify_action) where
  spotify_action = "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player."++action

------------------------------------------------------------------------
-- MAIN CONFIG
------------------------------------------------------------------------

-- Main configuration, override the defaults to your liking.
myConfig = def {
               modMask = mod4Mask, -- Use Super instead of Alt
               terminal = "alacritty",
               borderWidth   = 1,
               normalBorderColor  = "#000000",
               focusedBorderColor = "#00AAFF",
               startupHook        = myStartupHook,
               layoutHook = myLayouts
               } `additionalKeys`
               [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock; xset dpms force off")
               , ((mod4Mask, xK_s ), spawn "scrot ~/Pictures/screenshots/;aplay ~/.xmonad/sounds/beep-28.wav")
               , ((mod4Mask, xK_F11), spawn "amixer -q sset Master 3%-;aplay ~/.xmonad/sounds/beep-29.wav")
               , ((mod4Mask, xK_F12), spawn "amixer -q sset Master 3%+;aplay ~/.xmonad/sounds/beep-29.wav")
               , ((mod4Mask, xK_F6), spawn "/bin/python3 ~/.xmonad/brightness/adjustBrightness.py 0")
               , ((mod4Mask, xK_F7), spawn "/bin/python3 ~/.xmonad/brightness/adjustBrightness.py -.1")
               , ((mod4Mask, xK_F8), spawn "/bin/python3 ~/.xmonad/brightness/adjustBrightness.py +.1")
               , ((mod4Mask, xK_Right), spawn (spotifyControl("Next")))
               , ((mod4Mask, xK_Left), spawn (spotifyControl("Previous")))
               , ((mod4Mask, xK_i), spawn (dmenuFromText ("~/.xmonad/dmenu_sys","#FF5555")))
               , ((mod4Mask, xK_o), spawn (dmenuFromText ("~/.xmonad/dmenu_apps1","#fc952e")))
               , ((mod4Mask, xK_u), spawn (dmenuFromText ("~/.xmonad/dmenu_utils","#0060ff")))
               , ((mod4Mask, xK_p), spawn (dmenuFromPath("/usr/bin/","#2bc395")))
               ]

