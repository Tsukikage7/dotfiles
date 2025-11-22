# Fish Plugin Configuration
# Equivalent to zsh plugins from original config

# =========================================================
# 已安装的插件 (通过 fish_plugins 文件管理)
# =========================================================
# fisher install jorgebucaran/fisher                    # 插件管理器
# fisher install franciscolourenco/done                 # 长命令完成通知
# fisher install patrickf1/fzf.fish                     # 模糊搜索 (Ctrl+R 历史, Ctrl+Alt+F 文件)
# fisher install laughedelic/pisces                     # 智能括号配对 (替代 autopair)
# fisher install gazorby/fish-abbreviation-tips         # 显示可用缩写提示
# fisher install andreiborisov/sponge                   # 自动清理失败命令历史
# fisher install edc/bass                               # 运行 Bash 脚本支持
# fisher install decors/fish-colored-man                # 彩色 man 手册
# fisher install oh-my-fish/plugin-grc                  # 命令输出着色 (需要 brew install grc)
# fisher install danhper/fish-ssh-agent                 # 自动管理 SSH agent

# =========================================================
# 插件配置
# =========================================================

# zoxide - 智能目录跳转 (已接管 cd 命令)
# 安装: brew install zoxide
# 使用:
#   cd <关键词>  - 智能跳转到常访问的目录 (模糊匹配)
#   cd <路径>    - 传统 cd 功能仍然可用
#   cdi         - 交互式选择目录 (使用 fzf)
# 已在 config.fish 中初始化,cd 命令现在由 zoxide 驱动

# grc - 需要先安装 grc
# brew install grc
# 排除配置已移至 grc.fish 文件开头


# =========================================================
# 内置功能
# =========================================================
# Git aliases - 在 conf.d/git_aliases.fish
# Docker completions - Fish 内置
# Kubectl completions - Fish 内置
# Sudo 功能 - 在 conf.d/sudo_binding.fish

# Auto-completion setup
if status is-interactive
    # Enable completions
    if not functions -q fisher
        echo "⚠️  Fisher 插件管理器未安装"
        echo "安装命令: curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"
        echo "然后运行: fisher update 来安装所有插件"
    end
end