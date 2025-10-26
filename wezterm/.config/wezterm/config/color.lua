local wezterm = require('wezterm')

local appearance = wezterm.gui.get_appearance()
local color_scheme
color_scheme = "Catppuccin Mocha"
-- color_scheme = "everforest-dark-medium"
-- if appearance:find "Dark" then
--     color_scheme = "Catppuccin Frappe"
-- else
--     color_scheme = "Catppuccin Latte"
-- end


return { color_scheme = color_scheme }
