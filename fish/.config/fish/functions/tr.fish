# tmux 重命名会话
function tr --description "Rename tmux session"
    if test (count $argv) -eq 0
        echo "Usage: tr <new-name>  (rename current session)"
        echo "   or: tr <old-name> <new-name>"
        return 1
    end

    if test (count $argv) -eq 1
        # 重命名当前会话
        tmux rename-session $argv[1]
    else
        # 重命名指定会话
        tmux rename-session -t $argv[1] $argv[2]
    end
end
