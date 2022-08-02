local color_gamma = require("tokyodark.utils").color_gamma
local gamma = require("tokyodark.config").gamma

local colors = {
    black = "#070a0d",
    bg0 = "#161725",
    bg1 = "#212336",
    bg2 = "#2a2d43",
    bg3 = "#303448",
    bg4 = "#485060",
    bg5 = "#b0b0b0",
    bg_red = "#116699",
    bg_green = "#116666",
    bg_blue = "#cef3ff",
    diff_red = "#9a4353",
    diff_green = "#729a48",
    diff_blue = "#44609a",
    diff_add = "#272d31",
    diff_change = "#31374f",
    diff_delete = "#342332",
    fg = "#c6c6c6",
    red = "#2c9bff",
    orange = "#50d6cf",
    yellow = "#ff8e1f",
    green = "#ffffbb",
    blue = "#71ffaf",
    cyan = "#50d6cf",
    purple = "#b884ff",
    grey = "#606871",
    none = "NONE",
    yell = "#ffff6e",
    pink = "#f3dd84",
    purp = "#ffffff",
    oran = "#ff84c6",
    gree = "#b0b0b0",
    comm = "#666666",
    viz = "#222835"
}
local function gamma_correction(colors)
    local colors_corrected = {}
    for k, v in pairs(colors) do
        colors_corrected[k] = color_gamma(v, gamma)
    end
    return colors_corrected
end

return gamma_correction(colors)
