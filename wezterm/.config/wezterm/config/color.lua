local wezterm = require('wezterm')

-- Everforest Dark Medium color scheme
local everforest_dark_medium = {
   foreground = '#d3c6aa',
   background = '#2d353b',
   cursor_bg = '#d3c6aa',
   cursor_fg = '#2d353b',
   cursor_border = '#d3c6aa',
   selection_fg = '#2d353b',
   selection_bg = '#d3c6aa',

   ansi = {
      '#475258', -- black
      '#e67e80', -- red
      '#a7c080', -- green
      '#dbbc7f', -- yellow
      '#7fbbb3', -- blue
      '#d699b6', -- magenta
      '#83c092', -- cyan
      '#d3c6aa', -- white
   },

   brights = {
      '#475258', -- bright black
      '#e67e80', -- bright red
      '#a7c080', -- bright green
      '#dbbc7f', -- bright yellow
      '#7fbbb3', -- bright blue
      '#d699b6', -- bright magenta
      '#83c092', -- bright cyan
      '#d3c6aa', -- bright white
   },

   -- 标签栏配置（与主背景色一致）
   tab_bar = {
      background = '#2d353b',

      -- 新增标签按钮
      new_tab = {
         bg_color = '#2d353b',
         fg_color = '#7a8478',
      },
      new_tab_hover = {
         bg_color = '#343f44',
         fg_color = '#a7c080',
      },
   },
}

return {
   colors = everforest_dark_medium
}
