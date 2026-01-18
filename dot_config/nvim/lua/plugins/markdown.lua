return {
  -- Markdown 预览
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      {
        "<leader>mp",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown 预览",
      },
    },
    config = function()
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_open_to_the_world = 0
      vim.g.mkdp_open_ip = "127.0.0.1"
      vim.g.mkdp_port = "8080"
      vim.g.mkdp_browser = ""
      vim.g.mkdp_echo_preview_url = 1
      vim.g.mkdp_page_title = "${name}"
    end,
  },

  -- Markdown 表格格式化和操作
  {
    "dhruvasagar/vim-table-mode",
    ft = { "markdown" },
    keys = {
      { "<leader>mt", "<cmd>TableModeToggle<cr>", desc = "切换表格模式" },
    },
    config = function()
      vim.g.table_mode_corner = "|"
    end,
  },

  -- Markdown TOC 生成
  {
    "mzlogin/vim-markdown-toc",
    ft = { "markdown" },
    keys = {
      { "<leader>mT", "<cmd>GenTocGFM<cr>", desc = "生成 TOC" },
    },
  },

  -- Treesitter 支持
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "markdown",
          "markdown_inline",
        })
      end
    end,
  },

  -- LSP 配置
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        marksman = {
          -- Markdown LSP
          filetypes = { "markdown", "markdown.mdx" },
        },
      },
    },
  },

  -- Mason 自动安装工具
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "marksman",
        "markdownlint",
        "prettier",
      })
    end,
  },

  -- 格式化配置
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        markdown = { "prettier", "markdownlint" },
      },
    },
  },

  -- Lint 配置
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        markdown = { "markdownlint" },
      },
    },
  },
}
