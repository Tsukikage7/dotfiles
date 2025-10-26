-- =========================================================
-- Neo-tree 文件浏览器配置
-- 显示隐藏文件，优化界面和操作体验
-- =========================================================

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      -- 文件系统配置
      filesystem = {
        -- 显示隐藏文件
        filtered_items = {
          visible = true, -- 默认显示隐藏文件
          hide_dotfiles = false, -- 不隐藏点文件
          hide_gitignored = false, -- 不隐藏 git 忽略的文件
          hide_hidden = false, -- 不隐藏隐藏文件[Windows]
          hide_by_name = {
            -- 可以在这里添加你想隐藏的特定文件/文件夹
            -- ".DS_Store",
            -- "thumbs.db",
          },
          hide_by_pattern = {
            -- 可以使用模式匹配隐藏文件
            -- "*.meta",
            -- "*/src/*/tsconfig.json",
          },
          always_show = {
            -- 总是显示这些文件/文件夹[即使在过滤状态]
            ".gitignore",
            ".env",
          },
          never_show = {
            -- 永远不显示这些文件/文件夹
            ".DS_Store",
            "thumbs.db",
          },
        },
        -- 跟随当前文件
        follow_current_file = {
          enabled = true, -- 自动定位到当前文件
          leave_dirs_open = false, -- 定位时不展开其他目录
        },
        -- 使用系统命令
        use_libuv_file_watcher = true, -- 使用文件监视器自动刷新
      },

      -- 窗口配置
      window = {
        position = "left", -- 左侧显示
        width = 35, -- 宽度
        mappings = {
          -- 快捷键映射
          ["<space>"] = "none", -- 禁用空格键[避免与 leader 冲突]
          ["[b"] = "prev_source",
          ["]b"] = "next_source",
          ["o"] = "open",
          ["S"] = "open_split",
          ["s"] = "open_vsplit",
          ["t"] = "open_tabnew",
          ["C"] = "close_node",
          ["z"] = "close_all_nodes",
          ["R"] = "refresh",
          ["a"] = {
            "add",
            config = {
              show_path = "relative", -- 相对路径
            },
          },
          ["A"] = "add_directory",
          ["d"] = "delete",
          ["r"] = "rename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["c"] = "copy",
          ["m"] = "move",
          ["q"] = "close_window",
          ["?"] = "show_help",
          -- 切换隐藏文件显示
          ["H"] = "toggle_hidden",
          ["."] = "set_root",
          ["<bs>"] = "navigate_up",
          ["/"] = "fuzzy_finder",
          ["f"] = "filter_on_submit",
          ["<c-x>"] = "clear_filter",
        },
      },

      -- 默认组件配置
      default_component_configs = {
        -- 缩进配置
        indent = {
          indent_size = 2,
          padding = 1,
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          highlight = "NeoTreeIndentMarker",
        },
        -- 图标配置
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
          default = "",
          highlight = "NeoTreeFileIcon",
        },
        -- 修改指示器
        modified = {
          symbol = "[+]",
          highlight = "NeoTreeModified",
        },
        -- Git 状态
        git_status = {
          symbols = {
            added = "✚",
            modified = "",
            deleted = "✖",
            renamed = "󰁕",
            untracked = "",
            ignored = "",
            unstaged = "󰄱",
            staged = "",
            conflict = "",
          },
        },
      },

      -- 外观配置
      enable_git_status = true, -- 显示 git 状态
      enable_diagnostics = true, -- 显示诊断信息
      sort_case_insensitive = true, -- 排序时忽略大小写
    },

    -- 自定义配置
    config = function(_, opts)
      -- 设置透明背景
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "neo-tree",
        callback = function()
          vim.cmd([[
            setlocal winhighlight=Normal:NeoTreeNormal,NormalNC:NeoTreeNormalNC,SignColumn:NeoTreeSignColumn
            highlight NeoTreeNormal guibg=NONE
            highlight NeoTreeNormalNC guibg=NONE
            highlight NeoTreeSignColumn guibg=NONE
            highlight NeoTreeEndOfBuffer guibg=NONE
          ]])
        end,
      })

      -- 主题加载时应用透明
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          vim.cmd([[
            highlight NeoTreeNormal guibg=NONE
            highlight NeoTreeNormalNC guibg=NONE
            highlight NeoTreeSignColumn guibg=NONE
            highlight NeoTreeEndOfBuffer guibg=NONE
            highlight NeoTreeVertSplit guibg=NONE guifg=#7c8f8f
            highlight NeoTreeWinSeparator guibg=NONE guifg=#7c8f8f
          ]])
        end,
      })

      require("neo-tree").setup(opts)
    end,

    -- 快捷键
    keys = {
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = true })
        end,
        desc = "文件浏览器",
      },
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({ toggle = true })
        end,
        desc = "文件浏览器",
      },
      {
        "<leader>E",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "文件浏览器[根目录]",
      },
      {
        "<leader>ge",
        function()
          require("neo-tree.command").execute({ source = "git_status", toggle = true })
        end,
        desc = "版本控制浏览器",
      },
      {
        "<leader>be",
        function()
          require("neo-tree.command").execute({ source = "buffers", toggle = true })
        end,
        desc = "缓冲区浏览器",
      },
    },
  },
}
