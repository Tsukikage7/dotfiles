# tmux 删除所有会话
function tka --description "Kill all tmux sessions"
    tmux kill-server 2>/dev/null && echo "All tmux sessions killed." || echo "No tmux server running."
end
