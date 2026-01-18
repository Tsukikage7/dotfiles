local wz = require('wezterm')
local act = wz.action

-- ============================================================================
-- WezTerm 快捷键配置 (纯 WezTerm，不依赖 Zellij)
-- ============================================================================

return {
   -- 鼠标绑定
   mouse_bindings = {
      -- 选中文本时自动复制到剪贴板
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
      {
         event = { Up = { streak = 1, button = 'Right' } },
         mods = 'NONE',
         action = act.Nop,
      },
      -- 双击/三击选中
      {
         event = { Up = { streak = 2, button = 'Left' } },
         mods = 'NONE',
         action = act.CompleteSelection('ClipboardAndPrimarySelection'),
      },
      {
         event = { Up = { streak = 3, button = 'Left' } },
         mods = 'NONE',
         action = act.CompleteSelection('ClipboardAndPrimarySelection'),
      },
   },

   keys = {
      -- ========================================
      -- 基础功能
      -- ========================================
      { key = 'c', mods = 'CMD', action = act.CopyTo('Clipboard') },
      { key = 'v', mods = 'CMD', action = act.PasteFrom('Clipboard') },
      { key = '=', mods = 'CMD', action = act.IncreaseFontSize },
      { key = '-', mods = 'CMD', action = act.DecreaseFontSize },
      { key = '0', mods = 'CMD', action = act.ResetFontSize },
      { key = 'Enter', mods = 'CMD', action = act.ToggleFullScreen },
      { key = 'q', mods = 'CMD', action = act.QuitApplication },
      { key = 'n', mods = 'CMD', action = act.SpawnWindow },

      -- ========================================
      -- 标签页管理
      -- ========================================
      { key = 't', mods = 'CMD', action = act.SpawnTab('CurrentPaneDomain') },
      { key = 'w', mods = 'CMD', action = act.CloseCurrentTab({ confirm = false }) },

      -- 标签切换
      { key = '1', mods = 'CMD', action = act.ActivateTab(0) },
      { key = '2', mods = 'CMD', action = act.ActivateTab(1) },
      { key = '3', mods = 'CMD', action = act.ActivateTab(2) },
      { key = '4', mods = 'CMD', action = act.ActivateTab(3) },
      { key = '5', mods = 'CMD', action = act.ActivateTab(4) },
      { key = '6', mods = 'CMD', action = act.ActivateTab(5) },
      { key = '7', mods = 'CMD', action = act.ActivateTab(6) },
      { key = '8', mods = 'CMD', action = act.ActivateTab(7) },
      { key = '9', mods = 'CMD', action = act.ActivateTab(-1) },

      -- 标签导航
      { key = '[', mods = 'CMD', action = act.ActivateTabRelative(-1) },
      { key = ']', mods = 'CMD', action = act.ActivateTabRelative(1) },
      { key = 'LeftArrow', mods = 'CMD|SHIFT', action = act.ActivateTabRelative(-1) },
      { key = 'RightArrow', mods = 'CMD|SHIFT', action = act.ActivateTabRelative(1) },

      -- 移动标签
      { key = 'LeftArrow', mods = 'CMD|CTRL', action = act.MoveTabRelative(-1) },
      { key = 'RightArrow', mods = 'CMD|CTRL', action = act.MoveTabRelative(1) },

      -- 重命名标签
      { key = 'r', mods = 'CMD', action = wz.action.EmitEvent('tabs.manual-update-tab-title') },

      -- ========================================
      -- 面板分割 (WezTerm 原生)
      -- ========================================
      { key = '[', mods = 'CMD', action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }) },
      { key = ']', mods = 'CMD', action = act.SplitVertical({ domain = 'CurrentPaneDomain' }) },

      -- 面板导航
      { key = 'h', mods = 'CMD', action = act.ActivatePaneDirection('Left') },
      { key = 'j', mods = 'CMD', action = act.ActivatePaneDirection('Down') },
      { key = 'k', mods = 'CMD', action = act.ActivatePaneDirection('Up') },
      { key = 'l', mods = 'CMD', action = act.ActivatePaneDirection('Right') },

      -- 调整面板大小
      { key = 'h', mods = 'CMD|SHIFT', action = act.AdjustPaneSize({ 'Left', 5 }) },
      { key = 'j', mods = 'CMD|SHIFT', action = act.AdjustPaneSize({ 'Down', 5 }) },
      { key = 'k', mods = 'CMD|SHIFT', action = act.AdjustPaneSize({ 'Up', 5 }) },
      { key = 'l', mods = 'CMD|SHIFT', action = act.AdjustPaneSize({ 'Right', 5 }) },

      -- 关闭面板
      { key = 'x', mods = 'CMD', action = act.CloseCurrentPane({ confirm = false }) },

      -- 面板缩放 (全屏切换)
      { key = 'z', mods = 'CMD', action = act.TogglePaneZoomState },

      -- ========================================
      -- 滚动
      -- ========================================
      { key = 'PageUp', mods = 'SHIFT', action = act.ScrollByPage(-1) },
      { key = 'PageDown', mods = 'SHIFT', action = act.ScrollByPage(1) },
      { key = 'UpArrow', mods = 'CMD', action = act.ScrollByLine(-1) },
      { key = 'DownArrow', mods = 'CMD', action = act.ScrollByLine(1) },

      -- 搜索
      { key = 'f', mods = 'CMD', action = act.Search({ CaseInSensitiveString = '' }) },
   },
}
