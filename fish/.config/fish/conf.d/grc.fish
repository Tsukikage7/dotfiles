# 确保 Homebrew 路径在 PATH 中
if not contains /opt/homebrew/bin $PATH
  fish_add_path /opt/homebrew/bin
end

# 排除 ls/ll/la/tree 命令，避免与 eza 冲突
set -g grc_plugin_ignore_execs ls ll la tree

if type -q grc
  set executables_path (dirname (realpath (status --current-filename)))/executables

  set -l execs (cat $executables_path)

  # remove the execs in the ignore_execs list
  if set -q grc_plugin_ignore_execs
    for ignore_exec in $grc_plugin_ignore_execs
      set -l index (contains -i -- $ignore_exec $execs)
      if set -q index[1]
        set --erase execs[$index]
      end
    end
  end

  # user has given an absolute list of plugins - just use that
  if set -q grc_plugin_execs
    if set -q grc_plugin_ignore_execs
      echo "Both grc_plugin_execs and grc_plugin_ignore_execs  have been provided. Ignoring the latter."
      set execs $grc_plugin_execs
    end
  end

  if set -q grc_plugin_extras
    set -a execs $grc_plugin_extras
  end

  for executable in $execs
    if type -q $executable
      function $executable --inherit-variable executable --wraps=$executable
        grc.wrap $executable $argv
      end
    end
  end
end
# 静默失败，不显示错误消息
