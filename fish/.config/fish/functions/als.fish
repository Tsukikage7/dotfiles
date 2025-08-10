function als --description "Display all abbreviations organized by category"
    
    # 如果有参数，则搜索包含该关键词的缩写
    if test (count $argv) -gt 0
        set -l search_term $argv[1]
        echo "🔍 搜索包含 '$search_term' 的缩写:"
        echo "=================================="
        
        abbr --list | while read -l abbr_name
            set -l abbr_value (abbr --show $abbr_name | cut -d"'" -f2)
            if string match -qi "*$search_term*" $abbr_name $abbr_value
                printf "%-20s → %s\n" $abbr_name $abbr_value
            end
        end
        return
    end
    
    echo "🐟 Fish Shell 缩写列表"
    echo "======================"
    echo ""
    
    # 定义分类和对应的缩写模式
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
        "系统工具|du df top htop ps" \
        "Python|pfr pir prm upir upfr venv activate" \
        "Node.js|ni nr ns nt nb nd" \
        "Docker|d dc dcu dcd dcb dps dimg" \
        "Kubernetes|k kgp kgs kgn kdp kds kdn" \
        "网络工具|pt ping traceroute myip weather ports" \
        "文件操作|find grep rsync untar zip_here" \
        "快速导航|.. ... .... home desktop downloads" \
        "系统管理|c cls reload_fish edit_fish chx chr chw" \
        "实用工具|now today timestamp serve json"
    
    for category in $categories
        set -l parts (string split "|" $category)
        set -l cat_name $parts[1]
        set -l abbr_list (string split " " $parts[2])
        
        echo "📁 $cat_name"
        echo "----------------------------------------"
        
        set -l found_any false
        for abbr_pattern in $abbr_list
            # 获取所有匹配的缩写
            for abbr_name in (abbr --list)
                if string match -q $abbr_pattern $abbr_name
                    set -l abbr_value (abbr --show $abbr_name 2>/dev/null | string replace -r "abbr -a [^ ]+ '(.*)'" '$1' | string replace -r "abbr -a [^ ]+ (.*)" '$1')
                    if test -n "$abbr_value"
                        printf "  %-18s → %s\n" $abbr_name $abbr_value
                        set found_any true
                    end
                end
            end
        end
        
        if not $found_any
            echo "  (暂无定义的缩写)"
        end
        
        echo ""
    end
    
    # 显示统计信息
    set -l total_abbr (abbr --list | wc -l | string trim)
    echo "📊 总计: $total_abbr 个缩写"
    echo ""
    echo "💡 使用方法:"
    echo "  - 输入缩写并按空格或回车自动展开"
    echo "  - 使用 'als <关键词>' 搜索特定缩写"
    echo "  - 使用 'abbr -a <名称> <命令>' 添加新缩写"
    echo "  - 使用 'abbr -e <名称>' 删除缩写"
    echo ""
    echo "🔧 快速测试:"
    echo "  - 输入 'v ' 展开为 'nvim '"
    echo "  - 输入 'gst ' 展开为 'git status '"
    echo "  - 输入 'll ' 展开为 'eza --icons --long --header '"
end