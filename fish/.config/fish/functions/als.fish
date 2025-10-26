function als --description "Display all aliases organized by category"
    
    # 定义颜色
    set -l header_color (set_color --bold cyan)
    set -l category_color (set_color --bold yellow)
    set -l alias_color (set_color green)
    set -l command_color (set_color blue)
    set -l separator_color (set_color white)
    set -l reset_color (set_color normal)
    
    # 如果有参数，则搜索包含该关键词的别名
    if test (count $argv) -gt 0
        set -l search_term $argv[1]
        echo "$header_color🔍 搜索包含 '$search_term' 的别名:$reset_color"
        echo "$separator_color==================================$reset_color"
        echo
        
        alias | grep -i "$search_term" | while read -l line
            # 解析 "alias name command" 格式
            set -l parts (string split -m 2 ' ' $line)
            if test (count $parts) -ge 3
                set alias_name $parts[2]
                set alias_cmd (string join ' ' $parts[3..-1])
                set alias_cmd (string trim --chars="'" $alias_cmd)
                printf "%s%-20s%s %s→%s %s%s%s\n" \
                    $alias_color $alias_name $reset_color \
                    $separator_color $reset_color \
                    $command_color $alias_cmd $reset_color
            end
        end
        return
    end
    
    echo "$header_color"
    echo "╭─────────────────────────────────────────────────────────╮"
    echo "│                  🎨 Fish Shell 别名列表                 │"
    echo "╰─────────────────────────────────────────────────────────╯"
    echo "$reset_color"
    echo
    
    # 定义分类和对应的别名模式
    set -l categories \
        "编辑器|v vi vim" \
        "文件列表|ls ll la lg tree l lh lt" \
        "Git 基础|g ga gaa" \
        "Git 状态|gst gss" \
        "Git 提交|gc gcm gca gcam gc!" \
        "Git 分支|gb gco gcb gsw gswc" \
        "Git 差异|gd gdc" \
        "Git 日志|glog gloga" \
        "Git 推拉|gp gl gpr gpf" \
        "Git 暂存|gsta gstp gstl" \
        "Git 其他|grh grs gf gm gcl gsh" \
        "系统工具|du df top htop ps find grep" \
        "Python|pfr pir prm upir upfr venv activate deactivate" \
        "Node.js|ni nr ns nt nb nd yi yr ys yt yb yd" \
        "Docker|d dc dcu dcd dcb dcls dps dimg drmi drm" \
        "Kubernetes|k kgp kgs kgn kdp kds kdn" \
        "网络工具|pt ping traceroute myip weather ports" \
        "文件操作|rsync untar untargz zip_here diff icat" \
        "快速导航|.. ... .... ..... home desktop downloads documents" \
        "系统管理|c cls reload_fish edit_fish chx chr chw update_tmux tmux_reload" \
        "实用工具|now today timestamp serve json code disk_usage h calude"
    
    # 获取所有别名
    set -l all_aliases (alias)
    
    for category in $categories
        set -l parts (string split "|" $category)
        set -l cat_name $parts[1]
        set -l alias_list (string split " " $parts[2])
        
        echo "$category_color📁 $cat_name$reset_color"
        echo "$separator_color┌─────────────────────────────────────────────────────────┐$reset_color"
        
        set -l found_any false
        for alias_pattern in $alias_list
            # 查找匹配的别名
            for alias_line in $all_aliases
                # 解析 "alias name command" 格式
                set -l parts (string split -m 2 ' ' $alias_line)
                if test (count $parts) -ge 3
                    set -l alias_name $parts[2]
                    if string match -q $alias_pattern $alias_name
                        set -l alias_cmd (string join ' ' $parts[3..-1])
                        set alias_cmd (string trim --chars="'" $alias_cmd)
                        if test -n "$alias_cmd"
                            printf "$separator_color│$reset_color %s%-15s%s %s→%s %s%-37s%s $separator_color│$reset_color\n" \
                                $alias_color $alias_name $reset_color \
                                $separator_color $reset_color \
                                $command_color $alias_cmd $reset_color
                            set found_any true
                        end
                    end
                end
            end
        end
        
        if not $found_any
            printf "$separator_color│$reset_color   %-53s $separator_color│$reset_color\n" "(暂无定义的别名)"
        end
        
        echo "$separator_color└─────────────────────────────────────────────────────────┘$reset_color"
        echo ""
    end
    
    # 显示其他未分类的别名
    echo "$category_color📋 其他别名$reset_color"
    echo "$separator_color┌─────────────────────────────────────────────────────────┐$reset_color"
    
    set -l found_other false
    for alias_line in $all_aliases
        # 解析 "alias name command" 格式
        set -l parts (string split -m 2 ' ' $alias_line)
        if test (count $parts) -ge 3
            set -l alias_name $parts[2]
            set -l is_categorized false
            
            # 检查是否已分类
            for category in $categories
                set -l cat_parts (string split "|" $category)
                set -l alias_list (string split " " $cat_parts[2])
                if contains $alias_name $alias_list
                    set is_categorized true
                    break
                end
            end
            
            if not $is_categorized
                set found_other true
                set -l alias_cmd (string join ' ' $parts[3..-1])
                set alias_cmd (string trim --chars="'" $alias_cmd)
                printf "$separator_color│$reset_color %s%-15s%s %s→%s %s%-37s%s $separator_color│$reset_color\n" \
                    $alias_color $alias_name $reset_color \
                    $separator_color $reset_color \
                    $command_color $alias_cmd $reset_color
            end
        end
    end
    
    if not $found_other
        printf "$separator_color│$reset_color   %-53s $separator_color│$reset_color\n" "(所有别名都已分类)"
    end
    
    echo "$separator_color└─────────────────────────────────────────────────────────┘$reset_color"
    echo ""
    
    # 显示统计信息
    set -l total_aliases (alias | wc -l | string trim)
    echo "$header_color📊 统计信息:$reset_color"
    echo "   • 总计: $alias_color$total_aliases$reset_color 个别名"
    echo "   • 配置文件: $command_color~/.config/fish/conf.d/aliases.fish$reset_color"
    echo "   • Git别名: $command_color~/.config/fish/conf.d/git_aliases.fish$reset_color"
    echo ""
    echo "$header_color💡 使用方法:$reset_color"
    echo "   • 直接输入别名名称执行对应命令"
    echo "   • 使用 $alias_color'als <关键词>'$reset_color 搜索特定别名"
    echo "   • 使用 $alias_color'alias'$reset_color 查看原始输出"
    echo "   • 使用 $alias_color'reload_fish'$reset_color 重新加载配置"
    echo ""
    echo "$header_color🔧 快速示例:$reset_color"
    echo "   • $alias_color v$reset_color → $command_color nvim$reset_color"
    echo "   • $alias_color gst$reset_color → $command_color git status$reset_color"
    echo "   • $alias_color ll$reset_color → $command_color eza --icons --long --header$reset_color"
end