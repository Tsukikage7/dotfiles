function abbr_tips_enhanced --description "Enhanced abbreviation tips with categories"
    
    # 如果没有参数，显示随机提示
    if test (count $argv) -eq 0
        set -l random_abbrs (abbr --list | shuf | head -5)
        echo "💡 今日缩写推荐:"
        for abbr_name in $random_abbrs
            set -l abbr_value (abbr --show $abbr_name 2>/dev/null | string replace -r "abbr -a [^ ]+ '(.*)'" '$1' | string replace -r "abbr -a [^ ]+ (.*)" '$1')
            if test -n "$abbr_value"
                printf "  %-15s → %s\n" $abbr_name $abbr_value
            end
        end
        echo ""
        echo "使用 'als' 查看所有缩写，使用 'als <关键词>' 搜索特定缩写"
        return
    end
    
    # 如果有参数，显示相关的缩写建议
    set -l input $argv[1]
    
    echo "🔍 为 '$input' 推荐的缩写:"
    echo "========================="
    
    # 基于输入内容推荐相关缩写
    switch $input
        case "git*" "g*"
            echo "Git 相关缩写:"
            abbr --list | grep "^g" | head -10 | while read -l abbr_name
                set -l abbr_value (abbr --show $abbr_name 2>/dev/null | string replace -r "abbr -a [^ ]+ '(.*)'" '$1' | string replace -r "abbr -a [^ ]+ (.*)" '$1')
                if test -n "$abbr_value"
                    printf "  %-15s → %s\n" $abbr_name $abbr_value
                end
            end
            
        case "npm*" "node*" "yarn*"
            echo "Node.js 开发相关缩写:"
            for abbr_name in ni nr ns nt nb nd yi yr ys yt yb yd
                if abbr --list | grep -q "^$abbr_name\$"
                    set -l abbr_value (abbr --show $abbr_name 2>/dev/null | string replace -r "abbr -a [^ ]+ '(.*)'" '$1' | string replace -r "abbr -a [^ ]+ (.*)" '$1')
                    printf "  %-15s → %s\n" $abbr_name $abbr_value
                end
            end
            
        case "docker*" "container*"
            echo "Docker 相关缩写:"
            for abbr_name in d dc dcu dcd dcb dps dimg drmi drm
                if abbr --list | grep -q "^$abbr_name\$"
                    set -l abbr_value (abbr --show $abbr_name 2>/dev/null | string replace -r "abbr -a [^ ]+ '(.*)'" '$1' | string replace -r "abbr -a [^ ]+ (.*)" '$1')
                    printf "  %-15s → %s\n" $abbr_name $abbr_value
                end
            end
            
        case "python*" "py*" "pip*"
            echo "Python 开发相关缩写:"
            for abbr_name in pfr pir prm upir upfr venv activate
                if abbr --list | grep -q "^$abbr_name\$"
                    set -l abbr_value (abbr --show $abbr_name 2>/dev/null | string replace -r "abbr -a [^ ]+ '(.*)'" '$1' | string replace -r "abbr -a [^ ]+ (.*)" '$1')
                    printf "  %-15s → %s\n" $abbr_name $abbr_value
                end
            end
            
        case "ls*" "list*" "file*"
            echo "文件列表相关缩写:"
            for abbr_name in ls ll la lg tree l lh lt
                if abbr --list | grep -q "^$abbr_name\$"
                    set -l abbr_value (abbr --show $abbr_name 2>/dev/null | string replace -r "abbr -a [^ ]+ '(.*)'" '$1' | string replace -r "abbr -a [^ ]+ (.*)" '$1')
                    printf "  %-15s → %s\n" $abbr_name $abbr_value
                end
            end
            
        case '*'
            # 通用搜索
            echo "包含 '$input' 的缩写:"
            abbr --list | while read -l abbr_name
                set -l abbr_value (abbr --show $abbr_name 2>/dev/null | string replace -r "abbr -a [^ ]+ '(.*)'" '$1' | string replace -r "abbr -a [^ ]+ (.*)" '$1')
                if string match -qi "*$input*" $abbr_name $abbr_value
                    printf "  %-15s → %s\n" $abbr_name $abbr_value
                end
            end
    end
    
    echo ""
    echo "💡 使用 'als $input' 查看更多相关缩写"
end