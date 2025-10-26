-- =========================================================
-- 数据库管理配置
-- 使用社区最推荐的 vim-dadbod + vim-dadbod-ui
-- 支持: MySQL, PostgreSQL, SQLite, MongoDB, Redis 等
-- 参考: https://www.lazyvim.org/extras/lang/sql
-- 注意: extras 已在 lazy.lua 中导入
-- =========================================================

return {
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

      -- 字符编码配置（修复中文乱码）
      vim.g.db_ui_env = {
        PGCLIENTENCODING = "UTF8", -- PostgreSQL 客户端编码
        MYSQL_PWD = "", -- MySQL 密码（如需要）
      }

      -- 设置 SQL 文件编码
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sql", "mysql", "plsql" },
        callback = function()
          vim.opt_local.fileencoding = "utf-8"
          vim.opt_local.encoding = "utf-8"
        end,
      })

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


      -- 图标配置（使用 Material Design Icons）
      vim.g.db_ui_icons = {
        expanded = {
          db = "▾ 󰆼 ",              -- 数据库（展开）nf-md-database
          buffers = "▾ 󰈔 ",         -- 缓冲区（展开）nf-md-file_document
          saved_queries = "▾ 󰆼 ",   -- 保存的查询（展开）nf-md-content_save_all
          schemas = "▾ 󰉋 ",         -- 架构列表（展开）nf-md-folder_outline
          schema = "▾ 󰉋 ",          -- 单个架构（展开）nf-md-folder
          tables = "▾ 󰓫 ",          -- 表列表（展开）nf-md-table
          table = "▾ 󰓫 ",           -- 单个表（展开）nf-md-table
        },
        collapsed = {
          db = "▸ 󰆼 ",              -- 数据库（折叠）
          buffers = "▸ 󰈔 ",         -- 缓冲区（折叠）
          saved_queries = "▸ 󰆼 ",   -- 保存的查询（折叠）
          schemas = "▸ 󰉋 ",         -- 架构列表（折叠）
          schema = "▸ 󰉋 ",          -- 单个架构（折叠）
          tables = "▸ 󰓫 ",          -- 表列表（折叠）
          table = "▸ 󰓫 ",           -- 单个表（折叠）
        },
        saved_query = "󰈔 ",        -- 单个保存的查询 (nf-md-file_document)
        new_query = "󰝒 ",          -- 新建查询 (nf-md-plus)
        tables = "󰓫 ",             -- 表图标 (nf-md-table)
        buffers = "󰉋 ",            -- 缓冲区图标 (nf-md-folder)
        add_connection = "󰐕 ",     -- 添加连接 (nf-md-plus_circle_outline)
        connection_ok = "✓",        -- 连接成功
        connection_error = "✕",     -- 连接失败
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

  -- vim-dadbod-ui 快捷键映射
  {
    "kristijanhusak/vim-dadbod-ui",
    keys = {
      { "<leader>Du", "<cmd>DBUIToggle<cr>", desc = "切换数据库 UI" },
      { "<leader>Df", "<cmd>DBUIFindBuffer<cr>", desc = "查找数据库缓冲区" },
      { "<leader>Dr", "<cmd>DBUIRenameBuffer<cr>", desc = "重命名数据库缓冲区" },
      { "<leader>Dq", "<cmd>DBUILastQueryInfo<cr>", desc = "最后查询信息" },
    },
  },

  -- SQL 文件快捷键（在 SQL 缓冲区中有效）
  {
    "kristijanhusak/vim-dadbod-ui",
    ft = { "sql", "mysql", "plsql" },
    keys = {
      { "<leader><leader>", "<Plug>(DBUI_ExecuteQuery)", desc = "执行 SQL 查询", mode = { "n", "v" } },
      { "<leader>S", "<Plug>(DBUI_SaveQuery)", desc = "保存 SQL 查询", mode = "n" },
    },
  },
}
