# Fish Abbreviations Configuration
# 使用缩写 (abbreviations) 而不是别名 (aliases)
# 缩写会在输入时展开，提供更好的可见性和学习效果

if status is-interactive
    
    # ===============================
    # ========= 编辑器缩写 ==========
    # ===============================
    abbr -a v nvim
    abbr -a vi nvim  
    abbr -a vim nvim
    
    # ===============================
    # ========= Kitty 工具 ==========
    # ===============================
    abbr -a diff 'kitty +kitten diff'
    abbr -a icat 'kitty +kitten icat'
    
    # ===============================
    # ========= 文件操作 ============
    # ===============================
    abbr -a rsync rsyncy
    
    # ===============================
    # ========= Tmux 管理 ===========
    # ===============================
    abbr -a update_tmux 'tmux source ~/.tmux.conf'
    abbr -a tmux_reload 'tmux source ~/.tmux.conf'
    
    # ===============================
    # ======== Python 开发 =========
    # ===============================
    abbr -a pfr 'pip freeze > requirements.txt'
    abbr -a pir 'pip install -r requirements.txt'
    abbr -a prm 'pip list --format=freeze | xargs pip uninstall -y'
    abbr -a upir 'uv pip install -r requirements.txt'
    abbr -a upfr 'uv pip freeze > requirements.txt'
    
    # Python 虚拟环境
    abbr -a venv 'python -m venv venv'
    abbr -a activate 'source venv/bin/activate'
    abbr -a deactivate 'deactivate'
    
    # ===============================
    # ===== 现代化文件列表工具 ======
    # ===============================
    abbr -a ls 'eza --icons'
    abbr -a ll 'eza --icons --long --header'
    abbr -a la 'eza --icons --long --header --all'
    abbr -a lg 'eza --icons --long --header --all --git'
    abbr -a tree 'eza --tree --icons'
    
    # 传统 ls 风格的缩写
    abbr -a l 'eza --icons'
    abbr -a lh 'eza --icons --long --header --all'
    abbr -a lt 'eza --tree --icons --level=2'
    
    # ===============================
    # ===== 现代化系统工具替换 ======
    # ===============================
    abbr -a du dust
    abbr -a df duf
    abbr -a top btm
    abbr -a htop btm
    abbr -a ps btm
    
    # ===============================
    # ======== 网络工具 =============
    # ===============================
    abbr -a pt nexttrace
    abbr -a traceroute nexttrace
    abbr -a ping 'ping -c 5'
    
    # ===============================
    # ======== 查找和搜索 ===========
    # ===============================
    abbr -a find fd
    abbr -a grep rg
    
    # ===============================
    # ======== Git 工作流 ===========
    # ===============================
    # 这些在 git_abbreviations.fish 中已定义，这里添加一些额外的
    abbr -a git_log_oneline 'git log --oneline --graph --decorate --all'
    abbr -a git_status_short 'git status --short --branch'
    abbr -a git_diff_cached 'git diff --cached'
    
    # ===============================
    # ======== 开发工具 =============
    # ===============================
    abbr -a code 'code .'
    abbr -a serve 'python -m http.server'
    abbr -a json 'python -m json.tool'
    
    # Node.js/npm 相关
    abbr -a ni 'npm install'
    abbr -a nr 'npm run'
    abbr -a ns 'npm start'
    abbr -a nt 'npm test'
    abbr -a nb 'npm run build'
    abbr -a nd 'npm run dev'
    
    # Yarn 相关
    abbr -a yi 'yarn install'
    abbr -a yr 'yarn run'
    abbr -a ys 'yarn start'
    abbr -a yt 'yarn test'
    abbr -a yb 'yarn build'
    abbr -a yd 'yarn dev'
    
    # ===============================
    # ======== Docker 相关 ==========
    # ===============================
    abbr -a d docker
    abbr -a dc 'docker compose'
    abbr -a dcu 'docker compose up'
    abbr -a dcd 'docker compose down'
    abbr -a dcb 'docker compose build'
    abbr -a dcls 'docker compose ls'
    abbr -a dps 'docker ps'
    abbr -a dimg 'docker images'
    abbr -a drmi 'docker rmi'
    abbr -a drm 'docker rm'
    
    # ===============================
    # ======== Kubernetes ===========
    # ===============================
    abbr -a k kubectl
    abbr -a kgp 'kubectl get pods'
    abbr -a kgs 'kubectl get services'
    abbr -a kgn 'kubectl get nodes'
    abbr -a kdp 'kubectl describe pod'
    abbr -a kds 'kubectl describe service'
    abbr -a kdn 'kubectl describe node'
    
    # ===============================
    # ======== 系统管理 =============
    # ===============================
    abbr -a reload_fish 'source ~/.config/fish/config.fish'
    abbr -a edit_fish 'nvim ~/.config/fish/config.fish'
    abbr -a cls clear
    abbr -a c clear
    
    # 权限管理
    abbr -a chx 'chmod +x'
    abbr -a chr 'chmod +r'
    abbr -a chw 'chmod +w'
    
    # ===============================
    # ======== 快速导航 =============
    # ===============================
    abbr -a .. 'cd ..'
    abbr -a ... 'cd ../..'
    abbr -a .... 'cd ../../..'
    abbr -a ..... 'cd ../../../..'
    
    # 常用目录
    abbr -a home 'cd ~'
    abbr -a desktop 'cd ~/Desktop'
    abbr -a downloads 'cd ~/Downloads'
    abbr -a documents 'cd ~/Documents'
    
    # ===============================
    # ======== 实用工具 =============
    # ===============================
    abbr -a weather 'curl wttr.in'
    abbr -a myip 'curl ifconfig.me'
    abbr -a ports 'lsof -i -P -n | grep LISTEN'
    abbr -a disk_usage 'du -sh * | sort -hr'
    
    # 解压工具
    abbr -a untar 'tar -xvf'
    abbr -a untargz 'tar -xzf'
    abbr -a zip_here 'zip -r archive.zip .'
    
    # ===============================
    # ======== 时间和日期 ===========
    # ===============================
    abbr -a now 'date +"%Y-%m-%d %H:%M:%S"'
    abbr -a today 'date +"%Y-%m-%d"'
    abbr -a timestamp 'date +%s'
    
    # ===============================
    # ======== 命令重命名 ===========
    # ===============================
    # cd命令重命名为z，使用z进行目录跳转
    # abbr -a cd z
    
    # history命令重命名为h，快速查看命令历史
    abbr -a h history
    
    # claude命令重命名为calude，跳过权限检查
    abbr -a calude 'claude --dangerously-skip-permissions'
    
end