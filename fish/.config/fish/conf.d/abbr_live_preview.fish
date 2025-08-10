# 缩写提示配置
# 提供缩写使用提示和帮助

if status is-interactive
    
    # 欢迎消息，只显示一次
    set -g __abbr_tips_shown 0
    
    function __show_abbr_welcome --on-event fish_prompt
        if test $__abbr_tips_shown -eq 0
            echo ""
            echo "🎯 缩写系统已启用！"
            echo "   • 输入缩写后按空格/回车自动展开"
            echo "   • 使用 'als' 查看所有可用缩写"
            echo "   • 使用 'als <关键词>' 搜索特定缩写"
            echo ""
            
            # 显示几个常用缩写示例
            echo "🚀 常用缩写示例："
            echo "   v     → nvim"
            echo "   gst   → git status"
            echo "   ll    → eza --icons --long --header"
            echo "   ..    → cd .."
            echo ""
            
            set -g __abbr_tips_shown 1
        end
    end
    
end