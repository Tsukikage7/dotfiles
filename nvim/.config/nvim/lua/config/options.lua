-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- =========================================================
-- 字符编码配置（修复中文乱码）
-- =========================================================
-- 注意: Neovim 中 encoding 固定为 utf-8，无需设置
-- 注意: termencoding 在 Neovim 中已移除，不再需要
vim.opt.fileencoding = "utf-8" -- 文件编码
vim.opt.fileencodings = { "utf-8", "gbk", "gb2312", "gb18030", "cp936" } -- 文件编码检测顺序
