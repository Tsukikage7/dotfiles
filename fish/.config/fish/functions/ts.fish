# tmux 会话管理 - 通过 fzf 选择会话
function ts --description "List and attach to tmux sessions via fzf"
    # 获取 tmux 会话列表
    set -l sessions (tmux ls 2>/dev/null)

    if test -z "$sessions"
        echo "No tmux sessions found."
        echo "Use 'tn <name>' to create a new session."
        return 1
    end

    # 用 fzf 选择会话
    set -l selected (printf '%s\n' $sessions | fzf --height=40% --reverse --header="Select tmux session (Enter to attach)")

    if test -n "$selected"
        # 提取会话名称 (格式: name: ...)
        set -l session_name (echo $selected | cut -d: -f1)
        tmux attach -t $session_name
    end
end
