# 快速显示别名统计
function alias_count --description "显示别名数量统计"
    set -l total (alias | wc -l | string trim)
    set -l header_color (set_color --bold cyan)
    set -l count_color (set_color --bold green)
    set -l reset_color (set_color normal)
    
    echo "$header_color📊 别名统计: $count_color$total$reset_color $header_color个别名已定义$reset_color"
end