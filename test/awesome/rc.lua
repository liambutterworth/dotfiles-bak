pcall(require, 'luarocks.loader')

local awful = require('awful')
local beautiful = require('beautiful')
local naughty = require('naughty')

require('awful.autofocus')

beautiful.init('~/.config/awesome/theme.lua')

require('errors');
require('keys');
require('ui');

awful.util.shell = 'fish'
terminal = 'alacritty'
editor = 'nvim'
editor_cmd = terminal .. ' -e ' .. editor
terminal = 'alacritty'
editor = 'nvim'

-- awful.spawn.with_shell('picom')
-- awful.spawn.with_shell('xrandr --output DP-0 --auto --output DP-2 --right-of DP-0')
