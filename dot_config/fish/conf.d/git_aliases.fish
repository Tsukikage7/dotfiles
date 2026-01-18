# Git Aliases for Fish
# 精简版 - 只包含最常用的 Git 命令别名

# 在所有模式下都定义别名，不仅仅是交互模式
# if status is-interactive
    
    # ===============================
    # ========= 基础操作 ============
    # ===============================
    alias g='git'
    alias ga='git add'
    alias gaa='git add --all'
    
    # ===============================
    # ========= 状态查看 ============
    # ===============================
    alias gst='git status'
    alias gss='git status --short'
    
    # ===============================
    # ========= 提交操作 ============
    # ===============================
    alias gc='git commit'
    alias gcm='git commit --message'
    alias gca='git commit --all'
    alias gcam='git commit --all --message'
    alias gc!='git commit --amend'
    
    # ===============================
    # ========= 分支管理 ============
    # ===============================
    alias gb='git branch'
    alias gco='git checkout'
    alias gcb='git checkout -b'
    alias gsw='git switch'
    alias gswc='git switch --create'
    
    # ===============================
    # ========= 差异比较 ============
    # ===============================
    alias gd='git diff'
    alias gdc='git diff --cached'
    
    # ===============================
    # ========= 日志查看 ============
    # ===============================
    alias glog='git log --oneline --graph'
    alias gloga='git log --oneline --graph --all'
    
    # ===============================
    # ========= 推拉操作 ============
    # ===============================
    alias gp='git push'
    alias gl='git pull'
    alias gpr='git pull --rebase'
    alias gpf='git push --force-with-lease'
    
    # ===============================
    # ========= 暂存操作 ============
    # ===============================
    alias gsta='git stash'
    alias gstp='git stash pop'
    alias gstl='git stash list'
    
    # ===============================
    # ========= 重置操作 ============
    # ===============================
    alias grh='git reset --hard'
    alias grs='git reset --soft'
    
    # ===============================
    # ========= 其他常用 ============
    # ===============================
    alias gf='git fetch'
    alias gm='git merge'
    alias gcl='git clone'
    alias gsh='git show'
    
# end