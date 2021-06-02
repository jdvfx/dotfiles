import os
import sys

increment = float(sys.argv[-1])
brightnessFile = os.path.dirname(os.path.abspath(__file__))+"/brightness"

f = open(brightnessFile,"r")
l = f.readlines()
f.close()

brightness  =  float(l[0].split("\n")[0])
brightness += increment
brightness  = max(brightness,0.1)  
s = "xrandr -q | grep ' connected' | head -n 1 | cut -d ' ' -f1 | xargs -I %  xrandr --output % --brightness "+str(brightness)
os.system(s)
f = open(brightnessFile,"w")
f.write(str(brightness))
f.close()

