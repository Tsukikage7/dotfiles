local gpu_adapters = require('utils.gpu_adapter')
local backdrops = require('utils.backdrops')
--local colors = require('colors.custom')

return {
   max_fps = 120,
   front_end = 'WebGpu',
   webgpu_power_preference = 'HighPerformance',
   webgpu_preferred_adapter = gpu_adapters:pick_best(),
   -- webgpu_preferred_adapter = gpu_adapters:pick_manual('Dx12', 'IntegratedGpu'),
   -- webgpu_preferred_adapter = gpu_adapters:pick_manual('Gl', 'Other'),

   -- 背景透明度 (0.0 = 完全透明, 1.0 = 完全不透明)
   -- 推荐值: 0.85-0.95
   window_background_opacity = 0.92,

   -- macOS 毛玻璃模糊效果 (数值越大越模糊)
   -- 推荐值: 20-40
   macos_window_background_blur = 35,

   -- cursor
   animation_fps = 120,
   cursor_blink_ease_in = "EaseIn",
   cursor_blink_ease_out = "EaseOut",
   cursor_blink_rate = 600,
   default_cursor_style = "BlinkingBar",

   -- color scheme
   --colors = colors,

   -- background
   --background = backdrops:initial_options(false), -- set to true if you want wezterm to start on focus mode

   -- scrollbar
   enable_scroll_bar = true,

   -- tab bar - 无分隔符样式
   enable_tab_bar = true,
   hide_tab_bar_if_only_one_tab = true,
   use_fancy_tab_bar = false,
   tab_max_width = 30,
   show_tab_index_in_tab_bar = false,
   switch_to_last_active_tab_when_closing_tab = true,
   tab_bar_style = {
      window_hide = '',
      window_hide_hover = '',
      window_maximize = '',
      window_maximize_hover = '',
      window_close = '',
      window_close_hover = '',
   },

   -- window
   window_padding = {
      left = 5,
      right = 5,
      top = 5,
      bottom = 5,
   },
   adjust_window_size_when_changing_font_size = false,
   window_close_confirmation = 'NeverPrompt',
   window_decorations = "RESIZE",
   window_frame = {
      active_titlebar_bg = 'rgba(0, 0, 0, 0.0)',
      inactive_titlebar_bg = 'rgba(0, 0, 0, 0.0)',
   },
   inactive_pane_hsb = {saturation = 0.7, brightness = 0.6},
}
