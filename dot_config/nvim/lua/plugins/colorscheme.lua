return {
  -- Everforest 主题 (与 Kitty/tmux 保持一致)
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      -- 主题设置
      vim.g.everforest_background = "medium" -- hard/medium/soft
      vim.g.everforest_better_performance = 1 -- 性能优化
      vim.g.everforest_enable_italic = 1 -- 启用斜体
      vim.g.everforest_transparent_background = 2 -- 透明背景 (0=关闭, 1=背景透明, 2=背景+浮窗透明)
      vim.g.everforest_dim_inactive_windows = 0 -- 不变暗非活动窗口 (保持透明一致)
      vim.g.everforest_diagnostic_text_highlight = 1 -- 诊断文本高亮
      vim.g.everforest_diagnostic_line_highlight = 1 -- 诊断行高亮
      vim.g.everforest_diagnostic_virtual_text = "colored" -- 虚拟文本着色

      -- 加载主题
      vim.cmd.colorscheme("everforest")

      -- 额外的透明背景设置 (确保完全透明)
      vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "TabLine", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "TabLineFill", { bg = "NONE" })
    end,
  },

  -- 配置 LazyVim 使用 Everforest 主题
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
    },
  },
}
