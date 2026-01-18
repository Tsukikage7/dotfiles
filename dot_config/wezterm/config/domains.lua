local wezterm = require('wezterm')

-- 从 ~/.ssh/config 枚举所有 SSH 主机
local ssh_domains = {}

-- 枚举 SSH 配置文件中的主机
for host, config in pairs(wezterm.enumerate_ssh_hosts()) do
   table.insert(ssh_domains, {
      name = host,
      remote_address = config.hostname or host,
      username = config.user,
      -- 为所有主机启用本地回显优化
      local_echo_threshold_ms = 100,
   })
end

return {
   -- ref: https://wezfurlong.org/wezterm/config/lua/SshDomain.html
   -- 手动配置的 SSH 域（优先级更高）
   ssh_domains = ssh_domains,

   -- ref: https://wezfurlong.org/wezterm/multiplexing.html#unix-domains
   -- Unix 域用于本地多路复用
   unix_domains = {
      {
         name = 'unix',
      },
   },

   -- ref: https://wezfurlong.org/wezterm/config/lua/WslDomain.html
   wsl_domains = {},
}
