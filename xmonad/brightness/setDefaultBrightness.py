import os
import sys

brightnessFile = os.path.dirname(os.path.abspath(__file__))+"/brightness"

brightness = 1.0
s = "xrandr -q | grep ' connected' | head -n 1 | cut -d ' ' -f1 | xargs -I %  xrandr --output % --brightness "+str(brightness)
os.system(s)
f = open(brightnessFile,"w")
f.write(str(brightness))
f.close()

