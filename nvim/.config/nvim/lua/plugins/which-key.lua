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

      -- 注册分组名称和快捷键描述[使用新 API]
      wk.add({
        -- 分组定义
        { "<leader>b", group = "󰓩 缓冲区" },
        { "<leader>c", group = " 代码" },
        { "<leader>f", group = " 文件" },
        { "<leader>g", group = " 版本控制" },
        { "<leader>gh", group = " 代码块" },
        { "<leader>q", group = " 退出/会话" },
        { "<leader>s", group = " 搜索" },
        { "<leader>u", group = " 界面" },
        { "<leader>w", group = " 窗口" },
        { "<leader>x", group = " 诊断/快速修复" },
        { "<leader><tab>", group = "󰓩 标签页" },
        { "<leader>n", group = " 通知消息" },

        -- 文件操作 (f)
        { "<leader>fb", desc = "浏览文件" },
        { "<leader>fc", desc = "查找配置文件" },
        { "<leader>fe", desc = "文件浏览器" },
        { "<leader>ff", desc = "查找文件" },
        { "<leader>fF", desc = "查找文件[根目录]" },
        { "<leader>fg", desc = "查找文件[版本控制]" },
        { "<leader>fr", desc = "最近文件" },
        { "<leader>fR", desc = "最近文件[当前目录]" },
        { "<leader>fn", desc = "新建文件" },

        -- 搜索 (s)
        { "<leader>sa", desc = "自动命令" },
        { "<leader>sb", desc = "缓冲区" },
        { "<leader>sc", desc = "命令历史" },
        { "<leader>sC", desc = "命令" },
        { "<leader>sd", desc = "文档诊断" },
        { "<leader>sD", desc = "工作区诊断" },
        { "<leader>sg", desc = "全局搜索" },
        { "<leader>sG", desc = "全局搜索[根目录]" },
        { "<leader>sh", desc = "帮助页面" },
        { "<leader>sH", desc = "高亮组" },
        { "<leader>sk", desc = "快捷键映射" },
        { "<leader>sj", desc = "跳转列表" },
        { "<leader>sl", desc = "位置列表" },
        { "<leader>sm", desc = "标记" },
        { "<leader>sM", desc = "手册页面" },
        { "<leader>so", desc = "选项" },
        { "<leader>sq", desc = "快速修复列表" },
        { "<leader>sR", desc = "恢复上次搜索" },
        { "<leader>ss", desc = "跳转到符号" },
        { "<leader>sS", desc = "跳转到符号[工作区]" },
        { "<leader>sw", desc = "当前词" },
        { "<leader>sW", desc = "当前词[根目录]" },
        { "<leader>s\"", desc = "寄存器" },

        -- 代码操作 (c)
        { "<leader>ca", desc = "代码操作" },
        { "<leader>cC", desc = "生成文档注释" },
        { "<leader>cd", desc = "跳转到定义" },
        { "<leader>cD", desc = "跳转到声明" },
        { "<leader>cf", desc = "格式化文档" },
        { "<leader>cF", desc = "格式化注入的语言" },
        { "<leader>ci", desc = "跳转到实现" },
        { "<leader>cl", desc = "语言服务器信息" },
        { "<leader>cr", desc = "重命名" },
        { "<leader>cR", desc = "查找引用" },
        { "<leader>cs", desc = "源代码操作" },
        { "<leader>ct", desc = "跳转到类型定义" },
        { "<leader>cA", desc = "代码操作[范围]", mode = "v" },

        -- Git (g)
        { "<leader>gb", desc = "分支" },
        { "<leader>gc", desc = "提交" },
        { "<leader>gC", desc = "提交[带暂存]" },
        { "<leader>gd", desc = "差异" },
        { "<leader>ge", desc = "版本控制浏览器" },
        { "<leader>gf", desc = "查找文件" },
        { "<leader>gg", desc = "版本控制界面" },
        { "<leader>gl", desc = "提交日志" },
        { "<leader>gL", desc = "提交日志[当前文件]" },
        { "<leader>gp", desc = "拉取" },
        { "<leader>gP", desc = "推送" },
        { "<leader>gs", desc = "状态" },
        { "<leader>gS", desc = "暂存" },

        -- 代码块 (gh)
        { "<leader>ghb", desc = "责怪行" },
        { "<leader>ghd", desc = "差异[当前文件]" },
        { "<leader>ghD", desc = "差异[索引]" },
        { "<leader>ghp", desc = "预览代码块" },
        { "<leader>ghr", desc = "重置代码块" },
        { "<leader>ghR", desc = "重置缓冲区" },
        { "<leader>ghs", desc = "暂存代码块" },
        { "<leader>ghS", desc = "暂存缓冲区" },
        { "<leader>ghu", desc = "撤销暂存代码块" },

        -- 缓冲区 (b)
        { "<leader>bb", desc = "切换到其他缓冲区" },
        { "<leader>bd", desc = "删除缓冲区" },
        { "<leader>bD", desc = "删除其他缓冲区" },
        { "<leader>be", desc = "缓冲区浏览器" },
        { "<leader>bl", desc = "删除左侧缓冲区" },
        { "<leader>br", desc = "删除右侧缓冲区" },
        { "<leader>bp", desc = "切换固定" },
        { "<leader>bP", desc = "删除非固定缓冲区" },
        { "<leader>bo", desc = "删除其他缓冲区" },
        { "<leader>bs", desc = "按目录切换缓冲区" },

        -- 窗口 (w)
        { "<leader>w-", desc = "水平分割" },
        { "<leader>w|", desc = "垂直分割" },
        { "<leader>wd", desc = "删除窗口" },
        { "<leader>ww", desc = "切换窗口" },

        -- 标签页 (<tab>)
        { "<leader><tab>l", desc = "最后一个标签页" },
        { "<leader><tab>o", desc = "关闭其他标签页" },
        { "<leader><tab>f", desc = "第一个标签页" },
        { "<leader><tab><tab>", desc = "新建标签页" },
        { "<leader><tab>]", desc = "下一个标签页" },
        { "<leader><tab>[", desc = "上一个标签页" },
        { "<leader><tab>d", desc = "关闭标签页" },

        -- 退出/会话 (q)
        { "<leader>qa", desc = "全部退出" },
        { "<leader>qq", desc = "退出" },
        { "<leader>qs", desc = "恢复会话" },
        { "<leader>ql", desc = "恢复上次会话" },
        { "<leader>qd", desc = "不保存当前会话" },

        -- UI (u)
        { "<leader>ub", desc = "切换背景" },
        { "<leader>uc", desc = "切换隐藏字符" },
        { "<leader>uC", desc = "切换颜色高亮" },
        { "<leader>ud", desc = "切换诊断" },
        { "<leader>uf", desc = "切换自动格式化[全局]" },
        { "<leader>uF", desc = "切换自动格式化[缓冲区]" },
        { "<leader>ug", desc = "切换缩进引导" },
        { "<leader>uh", desc = "切换内联提示" },
        { "<leader>ui", desc = "检查" },
        { "<leader>uI", desc = "切换缩进范围" },
        { "<leader>ul", desc = "切换行号" },
        { "<leader>uL", desc = "切换相对行号" },
        { "<leader>um", desc = "切换鼠标" },
        { "<leader>un", desc = "切换通知" },
        { "<leader>up", desc = "切换拼写检查" },
        { "<leader>ur", desc = "重绘/清除高亮/差异更新" },
        { "<leader>us", desc = "切换拼写检查" },
        { "<leader>uS", desc = "切换状态栏" },
        { "<leader>ut", desc = "切换语法高亮" },
        { "<leader>uT", desc = "切换标签栏" },
        { "<leader>uw", desc = "切换自动换行" },
        { "<leader>ux", desc = "切换引用" },

        -- 诊断/快速修复 (x)
        { "<leader>xd", desc = "文档诊断" },
        { "<leader>xD", desc = "工作区诊断" },
        { "<leader>xl", desc = "位置列表" },
        { "<leader>xL", desc = "语言服务器定义/引用" },
        { "<leader>xq", desc = "快速修复列表" },
        { "<leader>xQ", desc = "快速修复列表" },
        { "<leader>xt", desc = "待办事项" },
        { "<leader>xT", desc = "待办事项/修复" },

        -- 通知消息 (n)
        { "<leader>na", desc = "全部消息" },
        { "<leader>nd", desc = "忽略消息" },
        { "<leader>nh", desc = "消息历史" },
        { "<leader>nl", desc = "最后消息" },
        { "<leader>nt", desc = "选择消息" },

        -- 其他常用快捷键
        { "<leader>,", desc = "切换到其他缓冲区" },
        { "<leader>/", desc = "全局搜索[根目录]" },
        { "<leader>:", desc = "命令历史" },
        { "<leader><space>", desc = "查找文件[根目录]" },
        { "<leader>|", desc = "垂直分割" },
        { "<leader>-", desc = "水平分割" },
        { "<leader>e", desc = "文件浏览器" },
        { "<leader>E", desc = "文件浏览器[根目录]" },

        -- LSP 相关
        { "gd", desc = "跳转到定义" },
        { "gD", desc = "跳转到声明" },
        { "gr", desc = "查找引用" },
        { "gI", desc = "跳转到实现" },
        { "gy", desc = "跳转到类型定义" },
        { "K", desc = "悬停文档" },
        { "gK", desc = "签名帮助" },
        { "[d", desc = "上一个诊断" },
        { "]d", desc = "下一个诊断" },
        { "[e", desc = "上一个错误" },
        { "]e", desc = "下一个错误" },
        { "[w", desc = "上一个警告" },
        { "]w", desc = "下一个警告" },

        -- 缓冲区导航
        { "[b", desc = "上一个缓冲区" },
        { "]b", desc = "下一个缓冲区" },
        { "[B", desc = "第一个缓冲区" },
        { "]B", desc = "最后一个缓冲区" },
        { "<S-h>", desc = "上一个缓冲区" },
        { "<S-l>", desc = "下一个缓冲区" },
        { "H", desc = "上一个缓冲区", mode = "n" },
        { "L", desc = "下一个缓冲区", mode = "n" },

        -- 快速修复
        { "[q", desc = "上一个快速修复" },
        { "]q", desc = "下一个快速修复" },
        { "[Q", desc = "第一个快速修复" },
        { "]Q", desc = "最后一个快速修复" },

        -- 代码块导航
        { "]h", desc = "下一个代码块" },
        { "[h", desc = "上一个代码块" },

        -- LazyVim 特定快捷键覆盖
        { "<leader>l", desc = "插件管理器", mode = "n" },
        { "<leader>L", desc = "插件管理器", mode = "n" },

        -- 额外的缓冲区操作
        { "<leader>`", desc = "切换到其他缓冲区" },

        -- 终端相关
        { "<c-/>", desc = "终端[悬浮]", mode = { "n", "t" } },
        { "<c-_>", desc = "终端[悬浮]", mode = { "n", "t" } },

        -- 浮动终端
        { "<leader>ft", desc = "终端[当前目录]" },
        { "<leader>fT", desc = "终端[根目录]" },

        -- 代码相关补充
        { "<leader>cm", desc = "安装语言服务器" },

        -- 通知相关
        { "<leader>un", desc = "忽略所有通知" },
        { "<leader>sn", desc = "搜索通知" },

        -- 更多导航
        { "]t", desc = "下一个待办" },
        { "[t", desc = "上一个待办" },

        -- 窗口补充
        { "<leader>wm", desc = "最大化窗口" },

        -- 标签页补充
        { "<leader><tab>h", desc = "前一个标签页" },

        -- 搜索补充
        { "<leader>st", desc = "搜索待办" },

        -- UI补充
        { "<leader>uz", desc = "切换禅模式" },

        -- 其他
        { "<c-w>d", desc = "删除窗口" },
        { "<c-w><c-d>", desc = "删除窗口" },

        -- Visual 模式快捷键
        { "<", desc = "减少缩进", mode = "v" },
        { ">", desc = "增加缩进", mode = "v" },
        { "J", desc = "向下移动行", mode = "v" },
        { "K", desc = "向上移动行", mode = "v" },
        { "p", desc = "粘贴不覆盖寄存器", mode = "v" },

        -- 搜索相关
        { "n", desc = "下一个搜索结果" },
        { "N", desc = "上一个搜索结果" },
        { "*", desc = "搜索当前词[向下]" },
        { "#", desc = "搜索当前词[向上]" },

        -- 移动相关
        { "<C-d>", desc = "向下翻半页" },
        { "<C-u>", desc = "向上翻半页" },
        { "<C-f>", desc = "向下翻页" },
        { "<C-b>", desc = "向上翻页" },
        { "gg", desc = "跳转到文件开头" },
        { "G", desc = "跳转到文件结尾" },

        -- 编辑相关
        { "u", desc = "撤销" },
        { "<C-r>", desc = "重做" },
        { "dd", desc = "删除当前行" },
        { "yy", desc = "复制当前行" },
        { "p", desc = "粘贴" },
        { "P", desc = "在前面粘贴" },

        -- 窗口导航
        { "<C-h>", desc = "跳转到左侧窗口" },
        { "<C-j>", desc = "跳转到下方窗口" },
        { "<C-k>", desc = "跳转到上方窗口" },
        { "<C-l>", desc = "跳转到右侧窗口" },

        -- 调整窗口大小
        { "<C-Up>", desc = "增加窗口高度" },
        { "<C-Down>", desc = "减少窗口高度" },
        { "<C-Left>", desc = "减少窗口宽度" },
        { "<C-Right>", desc = "增加窗口宽度" },

        -- BufferLine 快捷键（确保覆盖所有缓冲区相关提示）
        { "<leader>1", desc = "跳转到缓冲区 1", mode = "n" },
        { "<leader>2", desc = "跳转到缓冲区 2", mode = "n" },
        { "<leader>3", desc = "跳转到缓冲区 3", mode = "n" },
        { "<leader>4", desc = "跳转到缓冲区 4", mode = "n" },
        { "<leader>5", desc = "跳转到缓冲区 5", mode = "n" },
        { "<leader>6", desc = "跳转到缓冲区 6", mode = "n" },
        { "<leader>7", desc = "跳转到缓冲区 7", mode = "n" },
        { "<leader>8", desc = "跳转到缓冲区 8", mode = "n" },
        { "<leader>9", desc = "跳转到缓冲区 9", mode = "n" },
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
