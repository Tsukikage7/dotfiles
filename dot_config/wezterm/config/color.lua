local wezterm = require('wezterm')

-- Everforest Dark 配色
local everforest_dark = {
   -- Tab bar 颜色
   tab_bar = {
      background = '#2d353b',  -- bg0
      active_tab = {
         bg_color = '#a7c080',  -- green
         fg_color = '#2d353b',  -- bg0
      },
      inactive_tab = {
         bg_color = '#3d484d',  -- bg2
         fg_color = '#d3c6aa',  -- fg
      },
      inactive_tab_hover = {
         bg_color = '#475258',  -- bg3
         fg_color = '#d3c6aa',  -- fg
      },
      new_tab = {
         bg_color = '#2d353b',  -- bg0
         fg_color = '#7a8478',  -- grey0
      },
      new_tab_hover = {
         bg_color = '#3d484d',  -- bg2
         fg_color = '#a7c080',  -- green
      },
   },
}

return {
   color_scheme = "Everforest Dark (Gogh)",
   colors = everforest_dark,
}
