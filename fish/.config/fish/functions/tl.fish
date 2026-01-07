# tmux 列出会话
function tl --description "List all tmux sessions"
    tmux ls 2>/dev/null || echo "No tmux sessions."
end
