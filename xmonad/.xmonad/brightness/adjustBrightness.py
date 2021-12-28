
'''
Adjust screens brightness
one argument, the brighness adjustment: +0.25
tip: setting the value to 0 will reset to default brightness (1.0)
'''

import os
import sys

if len(sys.argv)!=2:
    print("Error: needs only one argument\n eg: python adjustBrightness.py -0.5")
    quit()

increment = float(sys.argv[-1])

# file used to store the current brightness
brightnessFile = os.path.dirname(os.path.abspath(__file__))+"/brightness"

if increment==0:
    # reset to default brightness (1.0)
    brightness = 1.0
else:
    f = open(brightnessFile,"r")
    l = f.readlines()
    f.close()

    brightness  =  float(l[0].split("\n")[0])
    brightness += increment
    brightness  = max(brightness,0.1)

# sets brightness and save that value in the brightness file
s = "xrandr -q | grep -E ' connected.*mm' | cut -d ' ' -f1 | xargs -I %  xrandr --output % --brightness "+str(brightness)
os.system(s)
f = open(brightnessFile,"w")
f.write(str(brightness))
f.close()

