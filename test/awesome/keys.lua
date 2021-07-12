local gears = require('gears')
local awful = require('awful')

modkey = 'Mod4'

globalkeys = gears.table.join(
    awful.key({ modkey }, 'q', function() client.focus:kill() end),
    awful.key({ modkey }, 'h', function() awful.client.focus.global_bydirection('left') end),
    awful.key({ modkey }, 'j', function() awful.client.focus.global_bydirection('down') end),
    awful.key({ modkey }, 'k', function() awful.client.focus.global_bydirection('up') end),
    awful.key({ modkey }, 'l', function() awful.client.focus.global_bydirection('right') end),
    awful.key({ modkey, 'Shift' }, 'h', function() awful.client.swap.global_bydirection('left') end),
    awful.key({ modkey, 'Shift' }, 'j', function() awful.client.swap.global_bydirection('down') end),
    awful.key({ modkey, 'Shift' }, 'k', function() awful.client.swap.global_bydirection('up') end),
    awful.key({ modkey, 'Shift' }, 'l', function() awful.client.swap.global_bydirection('right') end),
    awful.key({ modkey }, ']', function() awful.client.incwfact(0.05) end),
    awful.key({ modkey }, '[', function() awful.client.incwfact(-0.05) end),
    awful.key({ modkey, 'Shift' }, '[', function() awful.layout.inc(-1) end),
    awful.key({ modkey, 'Shift' }, ']', function() awful.layout.inc(1) end),
    awful.key({ modkey }, 'o', awful.client.movetoscreen),
    awful.key({ modkey }, 'p', function() awful.screen.focus_relative(1) end),
    awful.key({ modkey }, 'Tab', function() awful.client.focus.history.previous() end),
    awful.key({ modkey }, 'Return', function() awful.spawn(terminal) end),
    awful.key({ modkey }, 'r', awesome.restart),
    awful.key({ modkey, 'Shift' }, 'q', awesome.quit),
    awful.key({ modkey }, 'space', function() awful.spawn.with_shell('rofi -show run') end),
    awful.key({ modkey }, 'BackSpace', function () awful.spawn.with_shell('rofi -show window') end)
)

for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        awful.key({ modkey }, '#' .. i + 9, function ()
            local screen = awful.screen.focused()
            local tag = screen.tags[i]

            if tag then
                tag:view_only()
            end
        end),

        awful.key({ modkey, 'Control' }, '#' .. i + 9, function ()
            local screen = awful.screen.focused()
            local tag = screen.tags[i]

            if tag then
                awful.tag.viewtoggle(tag)
            end
        end),

        awful.key({ modkey, 'Shift' }, '#' .. i + 9, function ()
            if client.focus then
                local tag = client.focus.screen.tags[i]

                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end),

        awful.key({ modkey, 'Control', 'Shift' }, '#' .. i + 9, function ()
            if client.focus then
                local tag = client.focus.screen.tags[i]

                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end)
    )
end

root.keys(globalkeys)
