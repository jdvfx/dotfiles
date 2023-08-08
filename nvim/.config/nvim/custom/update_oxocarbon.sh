datestring=`date -u +%Y-%m-%dT%H:%M:%S%Z`

echo backup created:
echo ~/.local/share/nvim/lazy/oxocarbon.nvim/lua/oxocarbon/init.lua_bak_$datestring

cp ~/.local/share/nvim/lazy/oxocarbon.nvim/lua/oxocarbon/init.lua ~/.local/share/nvim/lazy/oxocarbon.nvim/lua/oxocarbon/init.lua_bak_$datestring

echo color_scheme updated, reload in nvim with :colorscheme oxocarbon

cp oxo_colors.lua ~/.local/share/nvim/lazy/oxocarbon.nvim/lua/oxocarbon/init.lua
