local theme_assets = require('beautiful.theme_assets')
local xresources = require('beautiful.xresources')
local dpi = xresources.apply_dpi
local taglist_square_size = dpi(4)
local theme = {}

theme.font = 'Source Sans 14'
theme.bg_normal = '#222222'
theme.bg_focus = '#535d6c'
theme.bg_urgent = '#ff0000'
theme.bg_minimize = '#444444'
theme.bg_systray = '#222222'
theme.fg_normal = '#aaaaaa'
theme.fg_focus = '#ffffff'
theme.fg_urgent = '#ffffff'
theme.fg_minimize = '#ffffff'
theme.useless_gap = dpi(12)
theme.border_width = dpi(2)
theme.border_normal = '#000000'
theme.border_focus = '#535d6c'
theme.border_marked = '#91231c'
theme.border_radius = dpi(3)
theme.menu_height = dpi(15)
theme.menu_width = dpi(100)

theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size,
    theme.fg_normal
)

theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size,
    theme.fg_normal
)

theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height,
    theme.bg_focus,
    theme.fg_focus
)

return theme
