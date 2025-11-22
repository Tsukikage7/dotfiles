local wz = require('wezterm')
local act = wz.action

-- 插件引用 (需要在主配置文件加载后才能使用)
-- 这里使用延迟加载的方式
resurrect = nil
quick_domains = nil

-- 尝试加载插件
local ok, plugin = pcall(wz.plugin.require, 'https://github.com/MLFlexer/resurrect.wezterm')
if ok then resurrect = plugin end

local ok2, plugin2 = pcall(wz.plugin.require, 'https://github.com/DavidRR-F/quick_domains.wezterm')
if ok2 then quick_domains = plugin2 end

return {
   -- Leader Key 配置 (类似 tmux 的 prefix)
   -- 按 CMD+A 激活 leader，然后在 1 秒内按其他键
   leader = { key = 'a', mods = 'CMD', timeout_milliseconds = 1000 },

   -- 鼠标绑定
   mouse_bindings = {
      -- 选中文本时自动复制到剪贴板 (释放鼠标左键时)
      {
         event = { Up = { streak = 1, button = 'Left' } },
         mods = 'NONE',
         action = act.CompleteSelectionOrOpenLinkAtMouseCursor('ClipboardAndPrimarySelection'),
      },

      -- 右键粘贴
      {
         event = { Down = { streak = 1, button = 'Right' } },
         mods = 'NONE',
         action = act.PasteFrom('Clipboard'),
      },

      -- 禁用右键菜单
      {
         event = { Up = { streak = 1, button = 'Right' } },
         mods = 'NONE',
         action = act.Nop,
      },

      -- 双击选中单词并复制
      {
         event = { Up = { streak = 2, button = 'Left' } },
         mods = 'NONE',
         action = act.CompleteSelection('ClipboardAndPrimarySelection'),
      },

      -- 三击选中整行并复制
      {
         event = { Up = { streak = 3, button = 'Left' } },
         mods = 'NONE',
         action = act.CompleteSelection('ClipboardAndPrimarySelection'),
      },
   },

   keys = {
      -- ========================================
      -- 复制粘贴
      -- ========================================
      {
         key = 'c',
         mods = 'CMD',
         action = act.CopyTo('Clipboard'),
      },
      {
         key = 'v',
         mods = 'CMD',
         action = act.PasteFrom('Clipboard'),
      },

      -- 工作区管理
      {
         key = 'n',
         mods = 'CMD',
         action = act.PromptInputLine {
            description = wz.format {
               { Attribute = { Intensity = 'Bold' } },
               { Foreground = { AnsiColor = 'Fuchsia' } },
               { Text = 'enter name for new workspace' },
            },
            action = wz.action_callback(function(window, pane, line)
               if line then
                  window:perform_action(
                          act.SwitchToWorkspace {
                             name = line,
                          },
                          pane
                  )
               end
            end),
         },
      },

      -- SSH 连接快捷键：CMD+Shift+S 显示启动菜单（包含 SSH 主机）
      {
         key = 's',
         mods = 'CMD|SHIFT',
         action = act.ShowLauncherArgs {
            flags = 'FUZZY|LAUNCH_MENU_ITEMS',
         },
      },

      -- 标签管理
      {
         key = "r",
         mods = "CMD",
         action = act.EmitEvent('tabs.manual-update-tab-title')
      },

      -- 窗格分割
      {
         key = '[',
         mods = 'CMD',
         action = wz.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
      },
      {
         key = ']',
         mods = 'CMD',
         action = wz.action.SplitVertical { domain = 'CurrentPaneDomain' },
      },

      -- 窗格导航
      {
         key = 'h',
         mods = 'CMD|SHIFT',
         action = act.ActivatePaneDirection('Left'),
      },
      {
         key = 'l',
         mods = 'CMD|SHIFT',
         action = act.ActivatePaneDirection('Right'),
      },
      {
         key = 'k',
         mods = 'CMD|SHIFT',
         action = act.ActivatePaneDirection('Up'),
      },
      {
         key = 'j',
         mods = 'CMD|SHIFT',
         action = act.ActivatePaneDirection('Down'),
      },

      -- 关闭当前窗格
      {
         key = 'w',
         mods = 'CMD',
         action = act.CloseCurrentPane { confirm = true },
      },

      -- 搜索模式
      {
         key = 'f',
         mods = 'CMD',
         action = act.Search { CaseInSensitiveString = '' },
      },

      -- Leader 键绑定 (按 CMD+A 然后按这些键)
      -- 分屏操作
      {
         key = '-',
         mods = 'LEADER',
         action = act.SplitVertical { domain = 'CurrentPaneDomain' },
      },
      {
         key = '\\',
         mods = 'LEADER',
         action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
      },

      -- 窗格调整大小 (Leader + 方向键)
      {
         key = 'LeftArrow',
         mods = 'LEADER',
         action = act.AdjustPaneSize { 'Left', 5 },
      },
      {
         key = 'RightArrow',
         mods = 'LEADER',
         action = act.AdjustPaneSize { 'Right', 5 },
      },
      {
         key = 'UpArrow',
         mods = 'LEADER',
         action = act.AdjustPaneSize { 'Up', 5 },
      },
      {
         key = 'DownArrow',
         mods = 'LEADER',
         action = act.AdjustPaneSize { 'Down', 5 },
      },

      -- 窗格缩放 (Leader + z)
      {
         key = 'z',
         mods = 'LEADER',
         action = act.TogglePaneZoomState,
      },

      -- 关闭窗格 (Leader + x)
      {
         key = 'x',
         mods = 'LEADER',
         action = act.CloseCurrentPane { confirm = true },
      },

      -- 显示启动器 (Leader + Space)
      {
         key = 'Space',
         mods = 'LEADER',
         action = act.ShowLauncher,
      },

      -- ========================================
      -- 插件快捷键
      -- ========================================

      -- resurrect.wezterm - 会话管理
      -- 保存当前会话 (Leader + s)
      {
         key = 's',
         mods = 'LEADER',
         action = wz.action_callback(function(win, pane)
            if resurrect then
               resurrect.save_state(resurrect.workspace_state.get_workspace_state())
            end
         end),
      },
      -- 恢复会话 (Leader + r)
      {
         key = 'r',
         mods = 'LEADER',
         action = wz.action_callback(function(win, pane)
            if resurrect then
               resurrect.fuzzy_load(win, pane, function(id)
                  local type = string.match(id, '([^/]+)/')
                  id = string.match(id, '[^/]+/(.+)')
                  id = string.match(id, '(.+)%..+')
                  resurrect.load_state(id, type)
               end)
            end
         end),
      },
      -- 删除保存的会话 (Leader + d)
      {
         key = 'd',
         mods = 'LEADER',
         action = wz.action_callback(function(win, pane)
            if resurrect then
               resurrect.delete_state(win, pane)
            end
         end),
      },

      -- quick_domains.wezterm - 快速 SSH 连接
      -- 快速搜索 SSH 域 (Leader + q)
      {
         key = 'q',
         mods = 'LEADER',
         action = wz.action_callback(function(window, pane)
            if quick_domains then
               quick_domains.choose(window, pane)
            end
         end),
      },
   },
}