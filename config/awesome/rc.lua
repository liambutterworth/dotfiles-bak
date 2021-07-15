pcall(require, 'luarocks.loader')

local awful = require('awful')
local beautiful = require('beautiful')
local naughty = require('naughty')

awful.util.shell = 'fish'
terminal = 'alacritty'
editor = 'nvim'

beautiful.init(require('theme'))
root.keys(require('keys'))

require('errors')
require('interface')

awful.spawn.with_shell('~/.config/awesome/autorun.sh')
