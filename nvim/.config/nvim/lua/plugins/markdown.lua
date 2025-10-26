-- =========================================================
-- Markdown 编辑和阅读增强配置
-- LazyVim 官方 extras + 社区最佳实践
-- 参考: https://www.lazyvim.org/extras/lang/markdown
-- 注意: extras 已在 lazy.lua 中导入
-- =========================================================

return {
  -- render-markdown.nvim 配置优化（编辑器内渲染）
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      -- 文件类型
      file_types = { "markdown", "norg", "rmd", "org" },
      -- 代码块渲染
      code = {
        sign = true,
        width = "block",
        right_pad = 1,
      },
      -- 标题渲染
      heading = {
        sign = true,
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      },
      -- 列表符号
      bullet = {
        icons = { "●", "○", "◆", "◇" },
      },
      -- 复选框
      checkbox = {
        unchecked = { icon = "󰄱 " },
        checked = { icon = " " },
        custom = {
          todo = { raw = "[-]", rendered = "󰥔 " },
        },
      },
    },
    config = function(_, opts)
      require("render-markdown").setup(opts)

      -- 设置透明背景
      local function apply_transparent()
        vim.cmd([[
          " Markdown 渲染插件透明背景
          highlight RenderMarkdownH1Bg guibg=NONE
          highlight RenderMarkdownH2Bg guibg=NONE
          highlight RenderMarkdownH3Bg guibg=NONE
          highlight RenderMarkdownH4Bg guibg=NONE
          highlight RenderMarkdownH5Bg guibg=NONE
          highlight RenderMarkdownH6Bg guibg=NONE
          highlight RenderMarkdownCode guibg=NONE
          highlight RenderMarkdownCodeInline guibg=NONE
          highlight RenderMarkdownBullet guibg=NONE
          highlight RenderMarkdownQuote guibg=NONE
          highlight RenderMarkdownDash guibg=NONE
          highlight RenderMarkdownLink guibg=NONE
          highlight RenderMarkdownSign guibg=NONE
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

  -- 图片粘贴支持
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
      default = {
        embed_image_as_base64 = false,
        prompt_for_file_name = true,
        drag_and_drop = {
          insert_mode = true,
        },
        -- 图片保存路径（相对于当前文件）
        dir_path = function()
          return vim.fn.expand("%:p:h") .. "/assets"
        end,
      },
    },
    keys = {
      { "<leader>mp", "<cmd>PasteImage<cr>", desc = "粘贴图片" },
    },
  },

  -- Markdown 预览增强
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      {
        "<leader>cp",
        ft = "markdown",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown 预览",
      },
    },
    config = function()
      vim.cmd([[do FileType]])
      -- 预览配置
      vim.g.mkdp_auto_start = 0 -- 不自动打开预览
      vim.g.mkdp_auto_close = 1 -- 关闭缓冲区时自动关闭预览
      vim.g.mkdp_refresh_slow = 0 -- 实时刷新
      vim.g.mkdp_browser = "" -- 使用默认浏览器
      vim.g.mkdp_preview_options = {
        mkit = {},
        katex = {},
        uml = {},
        maid = {},
        disable_sync_scroll = 0, -- 启用同步滚动
        sync_scroll_type = "middle",
        hide_yaml_meta = 1,
        sequence_diagrams = {},
        flowchart_diagrams = {},
        content_editable = false,
        disable_filename = 0,
        toc = {},
      }
    end,
  },

  -- Marksman LSP 配置优化
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        marksman = {
          -- Markdown LSP 设置
          keys = {
            { "K", false }, -- 禁用默认的 K（因为在 markdown 中不太有用）
          },
        },
      },
    },
  },

  -- 表格模式
  {
    "dhruvasagar/vim-table-mode",
    ft = { "markdown" },
    config = function()
      vim.g.table_mode_corner = "|" -- Markdown 兼容
      vim.g.table_mode_corner_corner = "|"
      vim.g.table_mode_header_fillchar = "-"
    end,
    keys = {
      { "<leader>mt", "<cmd>TableModeToggle<cr>", desc = "切换表格模式" },
    },
  },

  -- 快捷键配置
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>m", group = " Markdown" },
      },
    },
  },
}
