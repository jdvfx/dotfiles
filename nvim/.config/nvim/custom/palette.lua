local color_gamma = require("tokyodark.utils").color_gamma
local gamma = require("tokyodark.config").gamma

local colors = {
    black = "#06080A",
    bg0 = "#11121D",
    bg1 = "#1A1B2A",
    bg2 = "#212234",
    bg3 = "#444444",
    bg4 = "#666666",
    bg5 = "#888888",
    bg_red = "#6A9955",
    bg_green = "#98C379",
    bg_blue = "#9FBBF3",
    diff_red = "#773440",
    diff_green = "#587738",
    diff_blue = "#354A77",
    diff_add = "#1E2326",
    diff_change = "#262b3d",
    diff_delete = "#281B27",
    fg = "#999999",
    red = "#4488DD",
    orange = "#66DDFF",
    yellow = "#DD8877",
    green = "#DCDCAA",
    blue = "#44cc99",
    cyan = "#38A89D",
    purple = "#DD99FF",
    grey = "#4A5057",
    none = "NONE",
    yell = "#FFDD55",
    pink = "#BBAA66",
    purp = "#FFFFFF",
    oran = "#DD6699",
    gree = "#888888",
    comm = "#649050",
    viz = "#112255"
}
local function gamma_correction(colors)
    local colors_corrected = {}
    for k, v in pairs(colors) do
        colors_corrected[k] = color_gamma(v, gamma)
    end
    return colors_corrected
end

return gamma_correction(colors)
