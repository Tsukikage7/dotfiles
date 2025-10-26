-- =========================================================
-- Dashboard 启动界面配置
-- 使用 alpha-nvim 创建美观的启动动画
-- =========================================================

return {
  -- 禁用 LazyVim 默认的 mini.starter
  { "nvim-mini/mini.starter", enabled = false },

  -- 禁用 LazyVim 默认的 dashboard-nvim
  { "nvimdev/dashboard-nvim", enabled = false },
  {
    "goolord/alpha-nvim",
    lazy = false,
    priority = 1000,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      local dashboard = require("alpha.themes.dashboard")

      -- ASCII 艺术字 Logo
      dashboard.section.header.val = {
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                     ]],
        [[       ████ ██████           █████      ██                     ]],
        [[      ███████████             █████                             ]],
        [[      █████████ ███████████████████ ███   ███████████   ]],
        [[     █████████  ███    █████████████ █████ ██████████████   ]],
        [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
        [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
        [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
      }

      -- 按钮配置
      dashboard.section.buttons.val = {
        dashboard.button("f", "  查找文件", ":Telescope find_files <CR>"),
        dashboard.button("n", "  新建文件", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", "  最近文件", ":Telescope oldfiles <CR>"),
        dashboard.button("g", "  查找文本", ":Telescope live_grep <CR>"),
        dashboard.button("c", "  配置", ":e $MYVIMRC <CR>"),
        dashboard.button("s", "  恢复会话", [[:lua require("persistence").load() <CR>]]),
        dashboard.button("l", "󰒲  Lazy", ":Lazy<CR>"),
        dashboard.button("q", "  退出", ":qa<CR>"),
      }

      -- 页脚信息
      dashboard.section.footer.val = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        return {
          "⚡ Neovim 启动耗时 " .. ms .. " ms",
          "🚀 加载了 " .. stats.loaded .. "/" .. stats.count .. " 个插件",
        }
      end

      -- 高亮组颜色配置
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.section.footer.opts.hl = "AlphaFooter"

      -- 布局配置
      dashboard.opts.layout = {
        { type = "padding", val = 2 },
        dashboard.section.header,
        { type = "padding", val = 2 },
        dashboard.section.buttons,
        { type = "padding", val = 1 },
        dashboard.section.footer,
      }

      -- 禁用折叠和其他干扰元素
      dashboard.opts.opts.noautocmd = true

      return dashboard
    end,
    config = function(_, dashboard)
      -- 关闭 lazy.nvim 的启动界面，使用我们自己的
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      require("alpha").setup(dashboard.opts)

      -- 防止自动会话恢复覆盖启动界面
      vim.api.nvim_create_autocmd("User", {
        pattern = "AlphaReady",
        callback = function()
          -- 设置透明背景
          vim.cmd([[
            highlight AlphaHeader guibg=NONE
            highlight AlphaButtons guibg=NONE
            highlight AlphaFooter guibg=NONE
          ]])

          -- 禁用自动命令，防止被覆盖
          vim.api.nvim_create_autocmd("User", {
            pattern = "AlphaClosed",
            once = true,
            callback = function()
              -- Alpha 关闭后才允许其他插件接管
            end,
          })
        end,
      })

      -- 确保只在无参数启动时显示
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          -- 如果有文件参数或者不是空缓冲区，不显示 alpha
          if vim.fn.argc() > 0 or vim.fn.line2byte("$") ~= -1 then
            return
          end
          require("alpha").start(true)
        end,
      })
    end,
  },

  -- 自定义高亮颜色（与 Nightfly 主题匹配）
  {
    "LazyVim/LazyVim",
    opts = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          -- 设置 Dashboard 颜色
          vim.cmd([[
            highlight AlphaHeader guifg=#82aaff guibg=NONE
            highlight AlphaButtons guifg=#c3ccdc guibg=NONE
            highlight AlphaFooter guifg=#7c8f8f guibg=NONE gui=italic
          ]])
        end,
      })
    end,
  },
}
