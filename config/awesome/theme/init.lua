local theme_assets = require('beautiful.theme_assets')
local xresources = require('beautiful.xresources')
local dpi = xresources.apply_dpi
local taglist_square_size = dpi(4)

local colors = {
    normal = {
        black = '#3b4252',
        red = '#bf616a',
        green = '#a3be8c',
        yellow = '#ebcb8b',
        blue = '#81a1c1',
        magenta = '#b48ead',
        cyan = '#88c0d0',
        white = '#e5e9f0',
    },

    bright = {
        black = '#4c566a',
        red = '#bf616a',
        green = '#a3be8c',
        yellow = '#ebcb8b',
        blue = '#81a1c1',
        magenta = '#b48ead',
        cyan = '#8fbcbb',
        white = '#eceff4',
    },
}

return {
    font = 'Source Sans 14',
    bg_normal = colors.normal.black,
    bg_focus = colors.bright.black,
    bg_urgent = colors.normal.red,
    bg_minimize = colors.normal.black,
    bg_systray = colors.bright.green,
    fg_normal = colors.normal.white,
    fg_focus = colors.normal.white,
    fg_urgent = colors.normal.black,
    fg_minimize = colors.normal.black,
    useless_gap = dpi(12),
    border_width = dpi(1),
    border_normal = colors.normal.black,
    border_focus = colors.bright.cyan,
    border_marked = colors.bright.red,
    menu_height = dpi(15),
    menu_width = dpi(100),
}
