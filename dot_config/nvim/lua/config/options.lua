-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- ============================================================================
-- 性能优化 - 减少按键延迟
-- ============================================================================
-- 按键映射等待时间 (ms) - 控制组合键等待时间
-- 默认 300ms 太长,减少到 200ms 可以提升响应速度
opt.timeoutlen = 200

-- 键码超时时间 (ms) - 控制转义序列等待时间
-- 保持较短的值以获得更快的响应
opt.ttimeoutlen = 10

-- 更新时间 (ms) - 控制 swap 文件写入和 CursorHold 事件触发
-- 减少此值可以提升 LSP、Git 符号等的更新速度
opt.updatetime = 200

-- ============================================================================
-- 其他性能优化
-- ============================================================================
-- 启用更快的重绘
opt.lazyredraw = false -- 不要启用,会导致某些插件显示问题

-- 减少命令行高度,避免 "Press ENTER" 提示
opt.cmdheight = 1

-- 更快的完成菜单
opt.pumheight = 10 -- 限制弹出菜单高度

-- 更快的滚动
opt.scrolloff = 8 -- 光标上下保留的最小行数
opt.sidescrolloff = 8 -- 光标左右保留的最小列数

-- ============================================================================
-- 透明背景支持
-- ============================================================================
-- 启用真彩色 (24-bit RGB)
opt.termguicolors = true

-- 允许背景透明 (配合终端透明度)
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- 主编辑区域透明
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
    -- 侧边栏透明
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE" })
    -- 状态栏和标签栏透明
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "TabLine", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "TabLineFill", { bg = "NONE" })
  end,
})
