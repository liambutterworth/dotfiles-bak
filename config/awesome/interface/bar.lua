--
-- Bar
--
-- :: Create

local awful = require('awful')
local bar = {}

--
-- Create
--

bar.create = function(screen)
    return awful.wibar({
        position = 'top',
        screen = screen,
    })
end

return bar
