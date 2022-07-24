import colorsys
import re

def hex_to_rgb(value):
    value = value.lstrip('#')
    lv = len(value)
    return tuple(int(value[i:i + lv // 3], 16) for i in range(0, lv, lv // 3))

def rgb_to_hex(rgb):
    return '%02x%02x%02x' % rgb

with open("palette_ok.lua","r") as f:
    r = f.read()
    l = r.splitlines()

sat_offset = 0.3*0
bri_offset = 100*0
mult_offset = 1.3

with open("palette.lua","w") as f:
    for i in l:
        b = i.split("#")
        if len(b)>1:
            a = b[1].split('"')
            r = hex_to_rgb(a[0])
            b = bri_offset
            m = mult_offset
            hsv = colorsys.rgb_to_hsv(r[0]*m+b,r[1]*m+b,r[2]*m+b)
            hsv2 = (hsv[0],hsv[1]+sat_offset,hsv[2])
            r2 = colorsys.hsv_to_rgb(hsv2[0],hsv2[1],hsv2[2])

            # clamp to 8bit RGB values
            r2_ = (\
                    min(255,max(0,int(r2[0]))),\
                    min(255,max(0,int(r2[1]))),\
                    min(255,max(0,int(r2[2])))\
                    )

            h = rgb_to_hex(r2_)

            i2 = re.sub(a[0],h,i)
            f.write(i2+"\n")
        else:
            f.write(i+"\n")

