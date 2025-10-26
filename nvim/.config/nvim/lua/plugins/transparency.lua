-- =========================================================
-- Neovim 透明度配置 + Nightfly 主题
-- 与 Kitty 终端保持一致（Nightfly 主题 + 50% 透明度）
-- =========================================================

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nightfly", -- 设置 Nightfly 主题
    },
  },

  -- 安装 Nightfly 主题
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false,
    priority = 1000,
    config = function()
      -- Nightfly 主题配置
      vim.g.nightflyTransparent = true -- 启用透明背景
      vim.g.nightflyNormalFloat = true -- 浮动窗口使用普通背景
      vim.g.nightflyWinSeparator = 2   -- 窗口分隔符样式
    end,
  },

  -- 通用透明度设置（适用于所有主题）
  {
    "LazyVim/LazyVim",
    opts = function()
      -- 设置透明高亮组
      local set_transparent = function()
        -- 完整的透明高亮组列表
        local transparent_groups = {
          -- 基础窗口
          "Normal",
          "NormalNC",
          "NormalFloat",
          "FloatBorder",
          "FloatTitle",

          -- 行号和标志列
          "SignColumn",
          "LineNr",
          "LineNrAbove",
          "LineNrBelow",
          "CursorLineNr",
          "CursorLine",

          -- 折叠和分隔符
          "Folded",
          "FoldColumn",
          "VertSplit",
          "WinSeparator",

          -- 状态栏和标签栏
          "StatusLine",
          "StatusLineNC",
          "TabLine",
          "TabLineFill",
          "TabLineSel",

          -- 弹出菜单（补全、选择等）
          "Pmenu",
          "PmenuSel",
          "PmenuSbar",
          "PmenuThumb",

          -- 命令行和消息
          "MsgArea",
          "MsgSeparator",

          -- 特殊区域
          "EndOfBuffer",
          "NonText",

          -- NeoTree 文件树
          "NeoTreeNormal",
          "NeoTreeNormalNC",
          "NeoTreeEndOfBuffer",
          "NeoTreeSignColumn",
          "NeoTreeStatusLine",
          "NeoTreeStatusLineNC",
          "NeoTreeVertSplit",
          "NeoTreeWinSeparator",

          -- Telescope 搜索
          "TelescopeNormal",
          "TelescopeBorder",
          "TelescopeTitle",
          "TelescopePromptNormal",
          "TelescopePromptBorder",
          "TelescopePromptTitle",
          "TelescopeResultsNormal",
          "TelescopeResultsBorder",
          "TelescopeResultsTitle",
          "TelescopePreviewNormal",
          "TelescopePreviewBorder",
          "TelescopePreviewTitle",

          -- WhichKey
          "WhichKey",
          "WhichKeyFloat",
          "WhichKeyBorder",

          -- Notify 通知
          "NotifyBackground",
          "NotifyERRORBorder",
          "NotifyWARNBorder",
          "NotifyINFOBorder",
          "NotifyDEBUGBorder",
          "NotifyTRACEBorder",

          -- Lazy 插件管理器
          "LazyNormal",

          -- Mason 工具管理器
          "MasonNormal",

          -- Noice (命令行 UI)
          "NoicePopup",
          "NoicePopupBorder",
          "NoiceCmdlinePopup",
          "NoiceCmdlinePopupBorder",

          -- Buffer Line / Tabline
          "BufferLineFill",
          "BufferLineBackground",
          "BufferLineTab",
          "BufferLineTabClose",

          -- Lualine (状态栏)
          "lualine_c_normal",
          "lualine_c_insert",
          "lualine_c_visual",
          "lualine_c_replace",
          "lualine_c_command",
          "lualine_c_inactive",

          -- Markdown 渲染
          "RenderMarkdownH1Bg",
          "RenderMarkdownH2Bg",
          "RenderMarkdownH3Bg",
          "RenderMarkdownH4Bg",
          "RenderMarkdownH5Bg",
          "RenderMarkdownH6Bg",
          "RenderMarkdownCode",
          "RenderMarkdownCodeInline",
          "RenderMarkdownBullet",
          "RenderMarkdownQuote",
          "RenderMarkdownDash",
          "RenderMarkdownLink",
          "RenderMarkdownSign",
          "RenderMarkdownTableHead",
          "RenderMarkdownTableRow",
        }

        -- 应用透明度
        for _, group in ipairs(transparent_groups) do
          vim.cmd(string.format("highlight %s guibg=NONE ctermbg=NONE", group))
        end

        -- 额外强制设置（某些插件可能覆盖）
        vim.cmd([[
          highlight Normal guibg=NONE ctermbg=NONE
          highlight NormalNC guibg=NONE ctermbg=NONE
          highlight NormalFloat guibg=NONE ctermbg=NONE
          highlight SignColumn guibg=NONE ctermbg=NONE
          highlight EndOfBuffer guibg=NONE ctermbg=NONE
        ]])
      end

      -- 在多个时机应用透明度，确保覆盖所有插件
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = set_transparent,
      })

      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          set_transparent()
          -- 延迟再次应用，确保所有插件加载完成
          vim.defer_fn(set_transparent, 100)
        end,
      })

      -- 在窗口创建时也应用
      vim.api.nvim_create_autocmd("WinEnter", {
        callback = set_transparent,
      })
    end,
  },
}
