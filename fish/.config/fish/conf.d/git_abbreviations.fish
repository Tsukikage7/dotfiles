# Git Abbreviations for Fish
# 精简版 - 只包含最常用的 Git 命令缩写

if status is-interactive
    
    # ===============================
    # ========= 基础操作 ============
    # ===============================
    abbr -a g git
    abbr -a ga 'git add'
    abbr -a gaa 'git add --all'
    
    # ===============================
    # ========= 状态查看 ============
    # ===============================
    abbr -a gst 'git status'
    abbr -a gss 'git status --short'
    
    # ===============================
    # ========= 提交操作 ============
    # ===============================
    abbr -a gc 'git commit'
    abbr -a gcm 'git commit --message'
    abbr -a gca 'git commit --all'
    abbr -a gcam 'git commit --all --message'
    abbr -a gc! 'git commit --amend'
    
    # ===============================
    # ========= 分支管理 ============
    # ===============================
    abbr -a gb 'git branch'
    abbr -a gco 'git checkout'
    abbr -a gcb 'git checkout -b'
    abbr -a gsw 'git switch'
    abbr -a gswc 'git switch --create'
    
    # ===============================
    # ========= 差异比较 ============
    # ===============================
    abbr -a gd 'git diff'
    abbr -a gdc 'git diff --cached'
    
    # ===============================
    # ========= 日志查看 ============
    # ===============================
    abbr -a glog 'git log --oneline --graph'
    abbr -a gloga 'git log --oneline --graph --all'
    
    # ===============================
    # ========= 推拉操作 ============
    # ===============================
    abbr -a gp 'git push'
    abbr -a gl 'git pull'
    abbr -a gpr 'git pull --rebase'
    abbr -a gpf 'git push --force-with-lease'
    
    # ===============================
    # ========= 暂存操作 ============
    # ===============================
    abbr -a gsta 'git stash'
    abbr -a gstp 'git stash pop'
    abbr -a gstl 'git stash list'
    
    # ===============================
    # ========= 重置操作 ============
    # ===============================
    abbr -a grh 'git reset --hard'
    abbr -a grs 'git reset --soft'
    
    # ===============================
    # ========= 其他常用 ============
    # ===============================
    abbr -a gf 'git fetch'
    abbr -a gm 'git merge'
    abbr -a gcl 'git clone'
    abbr -a gsh 'git show'
    
    echo "✅ 精简 Git 缩写已加载 - 共 $(count (abbr --list | grep '^g')) 个"
end