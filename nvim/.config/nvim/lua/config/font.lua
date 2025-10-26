-- =========================================================
-- Neovim 字体配置
-- 与 Kitty 终端字体保持一致
-- =========================================================

-- 终端版 Neovim 会自动继承 Kitty 的字体
-- 以下配置主要用于 GUI 版本（如 neovide、nvim-qt）

-- Kitty 字体配置：
-- font_family: Maple Mono NF CN (Italic)
-- font_size: 16

-- 设置 GUI 字体
if vim.g.neovide then
  -- Neovide GUI 配置
  vim.o.guifont = "Maple Mono NF CN:h16:i" -- h16=大小16, i=斜体

  -- Neovide 特定配置
  vim.g.neovide_transparency = 0.5 -- 透明度 50%
  vim.g.neovide_background_blur = 30 -- 背景模糊
  vim.g.neovide_floating_blur = 30 -- 浮动窗口模糊
  vim.g.neovide_floating_shadow = true -- 浮动窗口阴影
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5

  -- 光标动画
  vim.g.neovide_cursor_animation_length = 0.05
  vim.g.neovide_cursor_trail_size = 0.3
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_animate_command_line = true

  -- 窗口模糊效果（macOS）
  vim.g.neovide_window_blurred = true

  -- 刷新率
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_refresh_rate_idle = 5

  -- 记住窗口大小
  vim.g.neovide_remember_window_size = true
elseif vim.g.nvui then
  -- NvUI 配置
  vim.cmd([[Guifont Maple Mono NF CN:h16:i]])
else
  -- 其他 GUI（nvim-qt 等）
  vim.o.guifont = "Maple Mono NF CN:h16:i"
end

-- 终端版 Neovim 的提示信息
if not vim.g.neovide and not vim.g.nvui and vim.fn.has("gui_running") == 0 then
  -- 终端版自动继承 Kitty 字体，无需额外配置
  -- 字体由 Kitty 的 kitty.conf 控制：
  -- font_family: Maple Mono NF CN (Italic)
  -- font_size: 16
end
