# tmux 快速连接或创建会话
function ta --description "Attach to tmux session or create if not exists"
    if test (count $argv) -eq 0
        echo "Usage: ta <session-name>"
        return 1
    end

    set -l name $argv[1]

    # 尝试连接，失败则创建
    tmux attach -t $name 2>/dev/null || tmux new -s $name
end
