local platform = require('utils.platform')
local wezterm = require('wezterm')

local options = {
   default_prog = {},
   launch_menu = {},
}

if platform.is_win then
   options.default_prog = { 'pwsh', '-NoLogo' }
   options.launch_menu = {
      { label = 'PowerShell Core', args = { 'pwsh', '-NoLogo' } },
      { label = 'PowerShell Desktop', args = { 'powershell' } },
      { label = 'Command Prompt', args = { 'cmd' } },
      { label = 'Nushell', args = { 'nu' } },
   }
elseif platform.is_mac then
   -- 默认启动 Fish（Fish 配置会自动启动 Zellij）
   options.default_prog = { '/opt/homebrew/bin/fish', '-l' }
   options.launch_menu = {
      { label = 'Fish (默认)', args = { '/opt/homebrew/bin/fish', '-l' } },
      { label = 'Zellij 新会话', args = { '/opt/homebrew/bin/zellij' } },
      { label = 'Zellij attach', args = { '/opt/homebrew/bin/zellij', 'attach', '-c' } },
      { label = 'Bash', args = { 'bash', '-l' } },
      { label = 'Zsh', args = { 'zsh', '-l' } },
   }

   -- 添加 SSH 主机到启动菜单
   for host, config in pairs(wezterm.enumerate_ssh_hosts()) do
      table.insert(options.launch_menu, {
         label = '⚡ ' .. host,
         args = { 'ssh', host },
      })
   end

elseif platform.is_linux then
   options.default_prog = { 'fish', '-l' }
   options.launch_menu = {
      { label = 'Bash', args = { 'bash', '-l' } },
      { label = 'Fish', args = { 'fish', '-l' } },
      { label = 'Zsh', args = { 'zsh', '-l' } },
   }
end

return options
