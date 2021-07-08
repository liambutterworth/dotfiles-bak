pcall(require, 'luarocks.loader')

local gears = require('gears')
local awful = require('awful')

require('awful.autofocus')

local beautiful = require('beautiful')
local naughty = require('naughty')
local menubar = require('menubar')

require('keys');

beautiful.init('~/.config/awesome/themes/default/theme.lua')

awful.util.shell = 'fish'

terminal = 'alacritty'
editor = 'nvim'
editor_cmd = terminal .. ' -e ' .. editor
modkey = 'Mod4'

awful.layout.layouts = {
    awful.layout.suit.fair,
    awful.layout.suit.tile,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.top,
    awful.layout.suit.max.fullscreen,
}

menubar.utils.terminal = terminal

client.connect_signal('manage', function (c)
    if awesome.startup
        and not c.size_hints.user_position
        and not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end
end)

require('ui');

beautiful.useless_gap = 5
terminal = 'alacritty'
editor = 'nvim'

awful.spawn.with_shell('picom')
awful.spawn.with_shell('xrandr --output DP-2 --auto --output DP-0 --right-of DP-2')
