local wezterm = require('wezterm')
local gpu_adapters = require('utils.gpu_adapter')
local backdrops = require('utils.backdrops')
--local colors = require('colors.custom')

return {
   max_fps = 60,  -- 降低帧率减少 wgpu 空帧警告
   front_end = 'OpenGL',  -- WebGpu 在某些 Mac 上有兼容性问题
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
   animation_fps = 60,  -- 与 max_fps 保持一致
   cursor_blink_ease_in = "EaseIn",
   cursor_blink_ease_out = "EaseOut",
   cursor_blink_rate = 600,
   default_cursor_style = "BlinkingBar",

   -- 光标拖影效果 (类似 Kitty cursor_trail)
   -- 光标移动时的平滑动画，模拟拖影效果
   cursor_thickness = 2,
   force_reverse_video_cursor = false,

   -- color scheme
   --colors = colors,

   -- background
   background = {
      {
         source = { File = wezterm.config_dir .. '/backdrops/wallpaper.png' },
         horizontal_align = 'Center',
         vertical_align = 'Middle',
         height = 'Cover',
         width = 'Cover',
         opacity = 1.0,
      },
      {
         source = { Color = '#2d353b' },  -- Everforest 背景色作为叠加层
         height = '100%',
         width = '100%',
         opacity = 0.85,  -- 调整此值控制图片可见度
      },
   },

   -- scrollbar
   enable_scroll_bar = true,

   -- tab bar - 启用自定义标签栏样式
   enable_tab_bar = true,
   hide_tab_bar_if_only_one_tab = false,
   use_fancy_tab_bar = false,  -- false 才能使用自定义样式
   tab_max_width = 25,
   show_tab_index_in_tab_bar = false,  -- 由 tab-title.lua 处理
   switch_to_last_active_tab_when_closing_tab = true,
   tab_bar_at_bottom = false,

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
   inactive_pane_hsb = {saturation = 0.7, brightness = 0.6},
}
