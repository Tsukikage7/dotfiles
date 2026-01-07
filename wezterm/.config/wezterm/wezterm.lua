local wezterm = require('wezterm')
local Config = require('config')

--require('utils.backdrops')
--        :set_images()
--        :random()

-- ========================================
-- 插件加载（使用 pcall 安全加载）
-- ========================================

local resurrect, tabline, battery, quick_domains

-- 1. resurrect.wezterm - 会话保存和恢复
local ok, plugin = pcall(function()
   return wezterm.plugin.require('https://github.com/MLFlexer/resurrect.wezterm')
end)
if ok then
   resurrect = plugin
   wezterm.log_info('Loaded resurrect.wezterm')
else
   wezterm.log_warn('Failed to load resurrect.wezterm: ' .. tostring(plugin))
end

-- 2. quick_domains.wezterm - 快速 SSH 连接
ok, plugin = pcall(function()
   return wezterm.plugin.require('https://github.com/DavidRR-F/quick_domains.wezterm')
end)
if ok then
   quick_domains = plugin
   wezterm.log_info('Loaded quick_domains.wezterm')
else
   wezterm.log_warn('Failed to load quick_domains.wezterm: ' .. tostring(plugin))
end

-- 3. tabline.wez - 美化标签栏（暂时禁用，版本不兼容）
-- ok, plugin = pcall(function()
--    return wezterm.plugin.require('https://github.com/michaelbrusegard/tabline.wez')
-- end)
-- if ok then
--    tabline = plugin
--    wezterm.log_info('Loaded tabline.wez')
-- else
--    wezterm.log_warn('Failed to load tabline.wez: ' .. tostring(plugin))
-- end

-- 4. battery.wez - 电池状态组件（暂时禁用，依赖 tabline）
-- ok, plugin = pcall(function()
--    return wezterm.plugin.require('https://github.com/rootiest/battery.wez')
-- end)
-- if ok then
--    battery = plugin
--    wezterm.log_info('Loaded battery.wez')
-- else
--    wezterm.log_warn('Failed to load battery.wez: ' .. tostring(plugin))
-- end

-- ========================================
-- 事件设置（标签栏已启用）
-- ========================================
require('events.tab-title').setup({ hide_active_tab_unseen = true, numbered_unseen_glyphs = true })
-- require('events.new-tab-button').setup()

return Config:init()
             :append(require('config.appearance'))
             :append(require('config.bindings'))
             :append(require('config.domains'))
             :append(require('config.fonts'))
             :append(require('config.color'))
             :append(require('config.general'))
             :append(require('config.launch')).options
