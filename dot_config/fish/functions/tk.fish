# tmux 终止会话 - 通过 fzf 选择
function tk --description "Kill tmux session via fzf"
    # 获取 tmux 会话列表
    set -l sessions (tmux ls 2>/dev/null)

    if test -z "$sessions"
        echo "No tmux sessions found."
        return 1
    end

    # 用 fzf 选择会话（支持多选）
    set -l selected (printf '%s\n' $sessions | fzf --height=40% --reverse --multi --header="Select sessions to kill (Tab to multi-select)")

    if test -n "$selected"
        for session in $selected
            set -l session_name (echo $session | cut -d: -f1)
            tmux kill-session -t $session_name
            echo "Killed: $session_name"
        end
    end
end
