# tmux 新建会话
function tn --description "Create a new tmux session"
    if test (count $argv) -eq 0
        echo "Usage: tn <session-name>"
        return 1
    end

    set -l name $argv[1]
    tmux new -s $name
end
