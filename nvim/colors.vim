"
set termguicolors            " 24 bit color
set background=dark


""colorscheme aurora
""colo one
""colo aurora
""colo synthwave84
""colo onedark

"highlight brackets guifg=#60ff60
"call matchadd('brackets',')')
"call matchadd('brackets','(')
"call matchadd('brackets','[')
"call matchadd('brackets',']')

"""" def / return
hi pythonStatement guifg=#60ff60

"""" function names
hi pythonFunction guifg=#f579ff gui=bold
""
hi pythonQuotes guifg=#ffff55 gui=bold
hi Comment guifg=#707078 
"hi lineNr guifg=#628cab
"""
""hi MatchParen guifg=#6600FF guifg=#FF99FF
""
""
"""" in
hi pythonOperator guifg=#fc952e gui=bold
"""" for
hi pythonRepeat guifg=#fc952e gui=bold
"""" if
hi pythonConditional guifg=#fc952e gui=bold
""
hi pythonNumber guifg=#1ac3ff gui=bold
hi pythonBuiltin guifg=#1ac3ff gui=bold

hi pythonString guifg=#ff794e gui=bold
"""
hi lineNr guibg=none guifg=#707078
hi CursorLineNr guibg=#1ac3ff guifg=#222222
hi CursorLine guibg=#323232 

hi pythonSpaceError guibg=none guifg=#FF0000 gui=underline
"""
""""dark grey bar after 80 columns
hi ColorColumn guibg=#181818
""hi IncSearch guifg=#aa0099 guibg=#ffffff
""hi Search guibg=#660033 guifg=NONE
""hi StatusLine guibg=#201566 guifg=#00FFFF
"""hi linenr guifg=#555555
"""
hi Pmenu guibg=#181818
hi PmenuSbar guibg=#1ac3ff
hi PmenuSel guifg=#ffffff guibg=#0060ff

"hi normal guibg=#222428 guifg=#ffffff
"
hi semshiSelected        guifg=#0060ff guibg=#222222 gui=bold
hi semshiParameter       guifg=#1ac3ff
"
"hi semshiLocal           ctermfg=209 guifg=#ff875f
"hi semshiGlobal          ctermfg=214 guifg=#ffaf00
"hi semshiImported        ctermfg=214 guifg=#ffaf00 cterm=bold gui=bold
"hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
"hi semshiFree            ctermfg=218 guifg=#ffafd7
"hi semshiBuiltin         ctermfg=207 guifg=#ff5fff
"hi semshiAttribute       ctermfg=49  guifg=#00ffaf
"hi semshiSelf            ctermfg=249 guifg=#b2b2b2
"hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
"hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
"hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
"sign define semshiError text=E> texthl=semshiErrorSign
