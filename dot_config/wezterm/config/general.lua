return {
   -- behaviours
   automatically_reload_config = true,

   -- macOS: 让 Option 键作为 Alt 键使用，而不是输入特殊字符
   send_composed_key_when_left_alt_is_pressed = false,
   send_composed_key_when_right_alt_is_pressed = false,

   -- 鼠标绕过：按住 SHIFT 时由 WezTerm 处理（点击链接），否则发送给 tmux
   bypass_mouse_reporting_modifiers = 'SHIFT',

   exit_behavior = 'CloseOnCleanExit', -- if the shell program exited with a successful status
   exit_behavior_messaging = 'Verbose',
   status_update_interval = 1000,

   scrollback_lines = 20000,

   -- 选中文本的单词边界
   selection_word_boundary = ' \t\n{}[]()"\':;,│',

   hyperlink_rules = {
      -- Matches: a URL in parens: (URL)
      {
         regex = '\\((\\w+://\\S+)\\)',
         format = '$1',
         highlight = 1,
      },
      -- Matches: a URL in brackets: [URL]
      {
         regex = '\\[(\\w+://\\S+)\\]',
         format = '$1',
         highlight = 1,
      },
      -- Matches: a URL in curly braces: {URL}
      {
         regex = '\\{(\\w+://\\S+)\\}',
         format = '$1',
         highlight = 1,
      },
      -- Matches: a URL in angle brackets: <URL>
      {
         regex = '<(\\w+://\\S+)>',
         format = '$1',
         highlight = 1,
      },
      -- Then handle URLs not wrapped in brackets
      {
         regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
         format = '$0',
      },
      -- implicit mailto link
      {
         regex = '\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b',
         format = 'mailto:$0',
      },

      -- 文件路径：绝对路径 (以 / 或 ~ 开头)
      {
         regex = '\\b(/[\\w\\-\\./_]+)',
         format = 'file://$1',
         highlight = 1,
      },
      {
         regex = '\\b(~[\\w\\-\\./_]+)',
         format = 'file://$1',
         highlight = 1,
      },

      -- Git commit hash (7或40位十六进制)
      {
         regex = '\\b[a-f0-9]{7,40}\\b',
         format = '$0',
         highlight = 1,
      },

      -- IP 地址
      {
         regex = '\\b\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\b',
         format = '$0',
         highlight = 1,
      },

      -- Docker 镜像 (例如: nginx:latest, user/repo:tag)
      {
         regex = '\\b[\\w-]+/[\\w-]+:[\\w\\.-]+\\b',
         format = '$0',
         highlight = 1,
      },
   },
}
