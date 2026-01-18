# Fish shell implementation of Oh My Zsh aliases plugin
# Based on https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/aliases

function als --description "Pretty print aliases with grouping and highlighting"
    # 解析命令行参数
    set -l filter ""
    set -l group_list
    set -l groups_only false
    set -l show_help false

    # 处理参数
    set -l i 1
    while test $i -le (count $argv)
        switch $argv[$i]
            case -h --help
                set show_help true
            case -g --group
                set i (math $i + 1)
                if test $i -le (count $argv)
                    set -a group_list $argv[$i]
                end
            case --groups
                set groups_only true
            case '*'
                set filter "$filter$argv[$i] "
        end
        set i (math $i + 1)
    end

    set filter (string trim $filter)

    # 显示帮助
    if test "$show_help" = true
        echo "Usage: als [options] [keyword...]"
        echo ""
        echo "Options:"
        echo "  -h, --help           Show this help message"
        echo "  -g, --group <name>   Show aliases for specific group (can be used multiple times)"
        echo "  --groups             Show only group names"
        echo ""
        echo "Examples:"
        echo "  als                  Show all aliases grouped by command"
        echo "  als git              Search for aliases containing 'git'"
        echo "  als -g git           Show only git command aliases"
        echo "  als --groups         List all available groups"
        return 0
    end

    # 获取所有别名并解析
    set -l aliases_raw (alias)
    set -l parsed_aliases

    for line in $aliases_raw
        if string match -q "alias *" $line
            # 移除 "alias " 前缀
            set -l content (string sub -s 7 $line)

            # Fish alias 格式: name 'value'
            # 分割第一个空格
            set -l parts (string split " " $content -m 1)
            if test (count $parts) -eq 2
                set -l name $parts[1]
                set -l value (string trim --chars="'" $parts[2])

                # 提取命令（第一个不包含 =<> 的单词）
                set -l cmd ""
                for word in (string split " " $value)
                    if not string match -qr '[=<>]' $word
                        set cmd $word
                        break
                    end
                end

                if test -z "$cmd"
                    set cmd $value
                end

                # 存储: name|value|cmd
                set -a parsed_aliases "$name|$value|$cmd"
            end
        end
    end

    # 按命令分组
    set -l groups
    set -l group_names

    # 先按命令排序并分组
    for alias_data in $parsed_aliases
        set -l parts (string split "|" $alias_data)
        set -l cmd $parts[3]

        if not contains $cmd $group_names
            set -a group_names $cmd
        end
    end

    # 为每个组收集别名
    for group_name in $group_names
        set -l group_aliases

        for alias_data in $parsed_aliases
            set -l parts (string split "|" $alias_data)
            set -l name $parts[1]
            set -l value $parts[2]
            set -l cmd $parts[3]

            if test "$cmd" = "$group_name"
                set -a group_aliases "$name|$value"
            end
        end

        # 如果只有一个别名，归入 _default 组
        if test (count $group_aliases) -eq 1
            set -a groups "_default|$group_aliases"
        else
            for alias_item in $group_aliases
                set -a groups "$group_name|$alias_item"
            end
        end
    end

    # 整理为最终的分组结构
    set -l final_groups
    set -l current_group ""
    set -l current_aliases

    for group_data in $groups
        set -l parts (string split "|" $group_data -m 1)
        set -l gname $parts[1]

        if test "$gname" != "$current_group"
            # 保存前一个组
            if test -n "$current_group"
                set -a final_groups "$current_group"
                for alias_item in $current_aliases
                    set -a final_groups "  $alias_item"
                end
            end

            # 开始新组
            set current_group $gname
            set current_aliases
        end

        set -a current_aliases $parts[2]
    end

    # 保存最后一个组
    if test -n "$current_group"
        set -a final_groups "$current_group"
        for alias_item in $current_aliases
            set -a final_groups "  $alias_item"
        end
    end

    # 显示结果
    set -l group_color (set_color --bold red)
    set -l alias_color (set_color green)
    set -l highlight_color (set_color yellow)
    set -l reset (set_color normal)

    set -l current_printing_group ""

    for line in $final_groups
        if not string match -q "  *" $line
            # 这是组名
            set current_printing_group $line

            # 检查组过滤
            if test (count $group_list) -gt 0
                if not contains $line $group_list
                    continue
                end
            end

            # 显示组名
            if test -n "$filter"
                # 高亮关键词
                set -l bracketed "[$line]"
                set -l highlighted (string replace -a $filter "$highlight_color$filter$group_color" $bracketed)
                echo "$group_color$highlighted$reset"
            else
                printf "%s[%s]%s\n" $group_color $line $reset
            end

            if test "$groups_only" = true
                echo ""
            end
        else
            # 这是别名
            if test "$groups_only" = true
                continue
            end

            # 检查组过滤
            if test (count $group_list) -gt 0
                if not contains $current_printing_group $group_list
                    continue
                end
            end

            # 移除前导空格
            set -l alias_line (string trim -l $line)
            set -l parts (string split "|" $alias_line)
            set -l name $parts[1]
            set -l value $parts[2]

            # 检查过滤
            if test -n "$filter"
                if not string match -q "*$filter*" $name
                    and not string match -q "*$filter*" $value
                    continue
                end

                # 高亮显示
                set -l hl_name (string replace -a $filter "$highlight_color$filter$alias_color" $name)
                set -l hl_value (string replace -a $filter "$highlight_color$filter$alias_color" $value)
                echo "$alias_color	$hl_name = $hl_value$reset"
            else
                echo "$alias_color	$name = $value$reset"
            end
        end
    end
end
