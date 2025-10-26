-- =========================================================
-- which-key.nvim 快捷键展示配置
-- 显示可用的快捷键提示，帮助记忆和发现功能
-- =========================================================

return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern", -- 使用现代预设
      delay = 500, -- 延迟显示[毫秒]

      -- 插件配置
      plugins = {
        marks = true, -- 显示标记
        registers = true, -- 显示寄存器
        spelling = {
          enabled = true, -- 拼写建议
          suggestions = 20,
        },
        presets = {
          operators = true,
          motions = true,
          text_objects = true,
          windows = true,
          nav = true,
          z = true,
          g = true,
        },
      },

      -- 窗口配置
      win = {
        border = "none", -- 无边框
        padding = { 1, 2 }, -- 内边距
        wo = {
          winblend = 0, -- 透明度
        },
      },

      -- 布局配置
      layout = {
        width = { min = 20, max = 50 },
        height = { min = 4, max = 25 },
        spacing = 3,
        align = "left",
      },

      -- 图标配置
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
        ellipsis = "…",
        mappings = true,
        rules = {},
        colors = true,
        keys = {
          Up = " ",
          Down = " ",
          Left = " ",
          Right = " ",
          C = "󰘴 ",
          M = "󰘵 ",
          D = "󰘳 ",
          S = "󰘶 ",
          CR = "󰌑 ",
          Esc = "󱊷 ",
          ScrollWheelDown = "󱕐 ",
          ScrollWheelUp = "󱕑 ",
          NL = "󰌑 ",
          BS = "󰁮",
          Space = "󱁐 ",
          Tab = "󰌒 ",
          F1 = "󱊫",
          F2 = "󱊬",
          F3 = "󱊭",
          F4 = "󱊮",
          F5 = "󱊯",
          F6 = "󱊰",
          F7 = "󱊱",
          F8 = "󱊲",
          F9 = "󱊳",
          F10 = "󱊴",
          F11 = "󱊵",
          F12 = "󱊶",
        },
      },

      -- 显示配置
      show_help = true,
      show_keys = true,

      -- 触发配置
      triggers = {
        { "<auto>", mode = "nixsotc" },
        { "a", mode = { "n", "v" } },
      },

      -- 禁用配置
      disable = {
        buftypes = {},
        filetypes = { "TelescopePrompt" },
      },
    },

    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)

      -- 注册分组名称[使用新 API]
      wk.add({
        -- 主要分组
        { "<leader>b", group = "󰓩 缓冲区" },
        { "<leader>c", group = " 代码" },
        { "<leader>cg", group = " Go 工具" },
        { "<leader>f", group = " 文件" },
        { "<leader>g", group = " 版本控制" },
        { "<leader>gh", group = " 代码块" },
        { "<leader>q", group = " 退出/会话" },
        { "<leader>s", group = " 搜索" },
        { "<leader>t", group = "󰙨 测试" },
        { "<leader>d", group = " 调试" },
        { "<leader>u", group = " 界面" },
        { "<leader>w", group = " 窗口" },
        { "<leader>x", group = " 诊断" },
        { "<leader><tab>", group = "󰓩 标签页" },
      })

      -- 设置透明背景
      local function apply_transparent()
        vim.cmd([[
          highlight WhichKey guibg=NONE
          highlight WhichKeyFloat guibg=NONE
          highlight WhichKeyBorder guibg=NONE
          highlight WhichKeyNormal guibg=NONE
          highlight WhichKeyGroup guifg=#82aaff guibg=NONE gui=bold
          highlight WhichKeyDesc guifg=#c3ccdc guibg=NONE
          highlight WhichKeySeparator guifg=#7c8f8f guibg=NONE
          highlight WhichKeyValue guifg=#7c8f8f guibg=NONE
        ]])
      end

      -- 主题加载时应用
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = apply_transparent,
      })

      -- 立即应用
      apply_transparent()
    end,
  },
}
