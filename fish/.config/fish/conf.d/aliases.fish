# Fish Aliases Configuration
# 使用传统别名 (aliases) 而不是缩写 (abbreviations)
# 别名会在运行时替换，不会在输入时展开

# 在所有模式下都定义别名，不仅仅是交互模式
# if status is-interactive
    
    # ===============================
    # ========= 编辑器别名 ==========
    # ===============================
    alias v='nvim'
    alias vi='nvim'
    alias vim='nvim'
    
    # ===============================
    # ========= Kitty 工具 ==========
    # ===============================
    alias diff='kitty +kitten diff'
    alias icat='kitty +kitten icat'
    
    # ===============================
    # ========= 文件操作 ============
    # ===============================
    alias rsync='rsyncy'
    
    # ===============================
    # ======== Zellij 管理 ==========
    # ===============================
    alias update_zellij='zellij setup --check'
    alias zellij_reload='zellij action dump-layout'
    
    # ===============================
    # ======== Python 开发 =========
    # ===============================
    alias pfr='pip freeze > requirements.txt'
    alias pir='pip install -r requirements.txt'
    alias prm='pip list --format=freeze | xargs pip uninstall -y'
    alias upir='uv pip install -r requirements.txt'
    alias upfr='uv pip freeze > requirements.txt'
    
    # Python 虚拟环境
    alias venv='python -m venv venv'
    alias activate='source venv/bin/activate'
    alias deactivate='deactivate'
    
    # ===============================
    # ===== 现代化文件列表工具 ======
    # ===============================
    # 已由 fish-exa 插件接管,提供更丰富的别名
    # 常用命令: l, ll, la, lg (git), lt (tree)
    # 详细命令列表请查看: functions -a | grep '^l'
    # alias ls='eza --icons'
    # alias ll='eza --icons --long --header'
    # alias la='eza --icons --long --header --all'
    # alias lg='eza --icons --long --header --all --git'
    # alias tree='eza --tree --icons'

    # 传统 ls 风格的别名 (已由 fish-exa 插件提供)
    # alias l='eza --icons'
    # alias lh='eza --icons --long --header --all'
    # alias lt='eza --tree --icons --level=2'
    
    # ===============================
    # ===== 现代化系统工具替换 ======
    # ===============================
    alias du='dust'
    alias df='duf'
    alias top='btm'
    alias htop='btm'
    alias ps='btm'
    
    # ===============================
    # ======== 网络工具 =============
    # ===============================
    alias pt='nexttrace'
    alias traceroute='nexttrace'
    alias ping='ping -c 5'
    
    # ===============================
    # ======== 查找和搜索 ===========
    # ===============================
    alias find='fd'
    alias grep='rg'
    
    # ===============================
    # ======== Git 工作流 ===========
    # ===============================
    # 这些在 git_aliases.fish 中已定义，这里添加一些额外的
    alias git_log_oneline='git log --oneline --graph --decorate --all'
    alias git_status_short='git status --short --branch'
    alias git_diff_cached='git diff --cached'
    
    # ===============================
    # ======== 开发工具 =============
    # ===============================
    alias code='code .'
    alias serve='python -m http.server'
    alias json='python -m json.tool'
    
    # Node.js/npm 相关
    alias ni='npm install'
    alias nr='npm run'
    alias ns='npm start'
    alias nt='npm test'
    alias nb='npm run build'
    alias nd='npm run dev'
    
    # Yarn 相关
    alias yi='yarn install'
    alias yr='yarn run'
    alias ys='yarn start'
    alias yt='yarn test'
    alias yb='yarn build'
    alias yd='yarn dev'
    
    # ===============================
    # ======== Docker 相关 ==========
    # ===============================
    alias d='docker'
    alias dc='docker compose'
    alias dcu='docker compose up'
    alias dcd='docker compose down'
    alias dcb='docker compose build'
    alias dcls='docker compose ls'
    alias dps='docker ps'
    alias dimg='docker images'
    alias drmi='docker rmi'
    alias drm='docker rm'
    
    # ===============================
    # ======== Kubernetes ===========
    # ===============================
    alias k='kubectl'
    alias kgp='kubectl get pods'
    alias kgs='kubectl get services'
    alias kgn='kubectl get nodes'
    alias kdp='kubectl describe pod'
    alias kds='kubectl describe service'
    alias kdn='kubectl describe node'
    
    # ===============================
    # ======== 系统管理 =============
    # ===============================
    alias reload_fish='source ~/.config/fish/config.fish'
    alias edit_fish='nvim ~/.config/fish/config.fish'
    alias cls='clear'
    alias c='clear'
    
    # 权限管理
    alias chx='chmod +x'
    alias chr='chmod +r'
    alias chw='chmod +w'
    
    # ===============================
    # ======== 快速导航 =============
    # ===============================
    alias ..='cd ..'
    alias ...='cd ../..'
    alias ....='cd ../../..'
    alias .....='cd ../../../..'
    
    # 常用目录
    alias home='cd ~'
    alias desktop='cd ~/Desktop'
    alias downloads='cd ~/Downloads'
    alias documents='cd ~/Documents'
    
    # ===============================
    # ======== 实用工具 =============
    # ===============================
    alias weather='curl wttr.in'
    alias myip='curl ifconfig.me'
    alias ports='lsof -i -P -n | grep LISTEN'
    alias disk_usage='du -sh * | sort -hr'
    
    # 解压工具
    alias untar='tar -xvf'
    alias untargz='tar -xzf'
    alias zip_here='zip -r archive.zip .'
    
    # ===============================
    # ======== 时间和日期 ===========
    # ===============================
    alias now='date +"%Y-%m-%d %H:%M:%S"'
    alias today='date +"%Y-%m-%d"'
    alias timestamp='date +%s'
    
    # ===============================
    # ======== 命令重命名 ===========
    # ===============================
    # cd命令重命名为z，使用z进行目录跳转
    # alias cd='z'
    
    # history命令重命名为h，快速查看命令历史
    alias h='history'
    
    # Claude Code 别名 - 跳过权限检查
    alias cc='claude --dangerously-skip-permissions'
    alias calude='claude --dangerously-skip-permissions'

    # ===============================
    # ======== 文件预览 =============
    # ===============================
    alias md='glow'
    alias mdp='glow -p'
    
    
# end