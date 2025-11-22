# ls 命令使用 eza 替代
function ls --description 'List directory contents using eza'
    eza $EXA_STANDARD_OPTIONS $argv
end
