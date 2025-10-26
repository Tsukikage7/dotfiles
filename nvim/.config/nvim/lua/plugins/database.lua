-- =========================================================
-- 数据库管理配置
-- 使用社区最推荐的 vim-dadbod + vim-dadbod-ui
-- 支持: MySQL, PostgreSQL, SQLite, MongoDB, Redis 等
-- 参考: https://www.lazyvim.org/extras/lang/sql
-- =========================================================

return {
  -- 导入 LazyVim 官方 SQL extras
  { import = "lazyvim.plugins.extras.lang.sql" },

  -- vim-dadbod-ui 配置优化
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- 数据库 UI 配置
      vim.g.db_ui_use_nerd_fonts = 1 -- 使用 Nerd Fonts 图标
      vim.g.db_ui_execute_on_save = false -- 禁用保存时自动执行（避免误操作）
      vim.g.db_ui_show_database_icon = 1 -- 显示数据库图标
      vim.g.db_ui_use_nvim_notify = 1 -- 使用 nvim-notify 显示通知

      -- 保存查询位置（保存在项目目录下）
      vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/db_ui"

      -- 默认表辅助工具
      vim.g.db_ui_show_help = 1

      -- 从项目根目录加载数据库连接配置
      -- 支持的配置文件：.lazy.lua, .dbui.lua, .dadbod.lua
      local function load_project_dbs()
        local config_files = { ".lazy.lua", ".dbui.lua", ".dadbod.lua" }
        local cwd = vim.fn.getcwd()

        for _, config_file in ipairs(config_files) do
          local config_path = cwd .. "/" .. config_file
          if vim.fn.filereadable(config_path) == 1 then
            local ok, dbs = pcall(dofile, config_path)
            if ok and type(dbs) == "table" then
              vim.g.dbs = {}
              for _, db in ipairs(dbs) do
                vim.g.dbs[db.name] = db.url
              end
              vim.notify("已加载项目数据库配置: " .. config_file, vim.log.levels.INFO)
              return
            end
          end
        end
      end

      -- 在进入目录时自动加载配置
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = load_project_dbs,
      })

      vim.api.nvim_create_autocmd("DirChanged", {
        callback = load_project_dbs,
      })


      -- 图标配置
      vim.g.db_ui_icons = {
        expanded = {
          db = "▾ ",
          buffers = "▾ ",
          saved_queries = "▾ ",
          schemas = "▾ ",
          schema = "▾ פּ",
          tables = "▾ 藺",
          table = "▾ ",
        },
        collapsed = {
          db = "▸ ",
          buffers = "▸ ",
          saved_queries = "▸ ",
          schemas = "▸ ",
          schema = "▸ פּ",
          tables = "▸ 藺",
          table = "▸ ",
        },
        saved_query = "",
        new_query = "璘",
        tables = "離",
        buffers = "﬘",
        add_connection = "",
        connection_ok = "✓",
        connection_error = "✕",
      }
    end,
  },

  -- SQL 补全增强
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    dependencies = {
      {
        "kristijanhusak/vim-dadbod-completion",
        ft = { "sql", "mysql", "plsql" },
      },
    },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "vim-dadbod-completion" })
    end,
  },

  -- 快捷键配置
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>D", group = " 数据库" },
      },
    },
  },
}
