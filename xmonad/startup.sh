# ~/.xinitrc
# swap Escape and Capslock (for VIM)

xmodmap -e 'keycode 66 = Escape'
xmodmap -e 'keycode 9  = Escape'
xmodmap -e 'clear Lock'
