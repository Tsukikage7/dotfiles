return {
  -- which-key 快捷键提示
  {
    "folke/which-key.nvim",
    opts = {
      delay = 300, -- 按键后延迟显示提示 (ms)
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
      },
    },
  },
}
