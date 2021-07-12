local awful = require('awful')
local beautiful = require('beautiful')
local gears = require('gears')
local wibox = require('wibox')
local naughty = require('naughty')

awful.layout.layouts = {
    awful.layout.suit.fair,
    awful.layout.suit.tile,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.left,
    -- awful.layout.suit.tile.top,
    awful.layout.suit.max.fullscreen,
}

mytextclock = wibox.widget.textclock()

local taglist_buttons = gears.table.join(
    awful.button({}, 1, function(t) t:view_only() end),

    awful.button({ modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),

    awful.button({}, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),

    awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local tasklist_buttons = gears.table.join(
    awful.button({}, 1, function (c)
        if c == client.focus then
            c.minimized = true
        else
            c:emit_signal(
                'request::activate',
                'tasklist',
                { raise = true }
            )
        end
    end)
)

local function set_wallpaper(s)
    gears.wallpaper.maximized('/home/liam/Pictures/wallpapers/rocket-sunset.jpg')
end

awful.screen.connect_for_each_screen(function(s)
    set_wallpaper(s)

    awful.tag({ '1', '2', '3' }, s, awful.layout.layouts[1])

    s.mypromptbox = awful.widget.prompt()
    s.mylayoutbox = awful.widget.layoutbox(s)

    s.mylayoutbox:buttons(gears.table.join(
        awful.button({}, 1, function () awful.layout.inc( 1) end),
        awful.button({}, 3, function () awful.layout.inc(-1) end),
        awful.button({}, 4, function () awful.layout.inc( 1) end),
        awful.button({}, 5, function () awful.layout.inc(-1) end)
    ))

    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
    }

     s.mywibox = awful.wibar({
        position = 'top',
        screen = s
    })

    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,

        {
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            s.mypromptbox,
        },

        s.mytasklist,

        {
            layout = wibox.layout.fixed.horizontal,
            mykeyboardlayout,
            wibox.widget.systray(),
            mytextclock,
            s.mylayoutbox,
        },
    }
end)

client.connect_signal('mouse::enter', function(client)
    client:emit_signal('request::activate', 'mouse_enter', { raise = false })
end)

client.connect_signal('focus', function(client)
    client.border_color = '#009900'
end)

client.connect_signal('unfocus', function(client)
    client.border_color = beautiful.border_normal
end)
