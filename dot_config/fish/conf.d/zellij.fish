# =========================================================
# Zellij 快捷键和函数配置
# =========================================================

# Zellij 别名
alias za='zellij attach'
alias zn='zellij -s'
alias zl='zellij list-sessions'
alias zk='zellij kill-session'
alias zd='zellij action detach'
alias zr='zellij run --'

# 智能 zellij 连接：有会话则附加，无会话则新建
function z --description "Smart zellij: attach or new session"
    if test (count $argv) -gt 0
        # 如果提供了会话名，尝试附加或创建
        zellij attach $argv[1] 2>/dev/null; or zellij -s $argv[1]
    else
        # 无参数：附加最近的会话或创建默认会话
        zellij attach 2>/dev/null; or zellij
    end
end

# fzf 选择 zellij 会话（需要 fzf）
function zs --description "Fuzzy select zellij session"
    # 去除 ANSI 颜色码，只提取会话名（第一列）
    set -l session (zellij list-sessions 2>/dev/null | string replace -ra '\e\[[0-9;]*m' '' | awk '{print $1}' | fzf --height 40% --reverse --prompt="Select session: ")
    if test -n "$session"
        zellij attach $session
    end
end

# 快捷键绑定：Ctrl+T 打开 fzf 选择 zellij 会话
function _zellij_session_picker
    # 去除 ANSI 颜色码，只提取会话名（第一列）
    set -l session (zellij list-sessions 2>/dev/null | string replace -ra '\e\[[0-9;]*m' '' | awk '{print $1}' | fzf --height 40% --reverse --prompt="Zellij session: ")
    if test -n "$session"
        zellij attach $session
    end
    commandline -f repaint
end

# 绑定 Ctrl+T 到 zellij 会话选择器
bind \ct _zellij_session_picker
